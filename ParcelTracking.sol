// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParcelTracking {

    struct Parcel {
        uint id;
        string sender;
        string receiver;
        string currentLocation;
        string status;
    }

    uint public parcelCount = 0;
    mapping(uint => Parcel) public parcels;

    // Event for parcel updates
    event ParcelUpdated(uint id, string status, string location);

    // Add a new parcel
    function addParcel(string memory _sender, string memory _receiver) public {
        parcelCount++;
        parcels[parcelCount] = Parcel(
            parcelCount,
            _sender,
            _receiver,
            "Warehouse",
            "Created"
        );
        emit ParcelUpdated(parcelCount, "Created", "Warehouse");
    }

    // Update parcel status and location
    function updateParcel(uint _id, string memory _status, string memory _location) public {
        Parcel storage parcel = parcels[_id];
        parcel.status = _status;
        parcel.currentLocation = _location;
        emit ParcelUpdated(_id, _status, _location);
    }

    // Get parcel info
    function getParcel(uint _id) public view returns (Parcel memory) {
        return parcels[_id];
    }
}
