@interface SPPeripheral
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)managedByFindMy;
- (NSArray)allowedSessions;
- (NSArray)keyAddressPairs;
- (NSData)lastConnectedLEMAC;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)longTermKeyMap;
- (NSDictionary)ltkIndexMap;
- (NSString)name;
- (NSString)serialNumber;
- (NSUUID)beaconIdentifier;
- (NSUUID)groupIdentifier;
- (NSUUID)userIdentifier;
- (SPPeripheral)initWithCoder:(id)a3;
- (SPPeripheral)initWithUserIdentifier:(id)a3 beaconIdentifier:(id)a4 groupIdentifier:(id)a5 name:(id)a6 partIdentifier:(unsigned __int8)a7 serialNumber:(id)a8 managedByFindMy:(BOOL)a9 primaryIndex:(unint64_t)a10 ltkIndexMap:(id)a11 lastConnectedLEMAC:(id)a12 allowedSessions:(id)a13 keyAddressPairs:(id)a14;
- (SPPeripheral)initWithUserIdentifier:(id)a3 beaconIdentifier:(id)a4 groupIdentifier:(id)a5 name:(id)a6 partIdentifier:(unsigned __int8)a7 serialNumber:(id)a8 managedByFindMy:(BOOL)a9 primaryIndex:(unint64_t)a10 ltkIndexMap:(id)a11 lastConnectedLEMAC:(id)a12 allowedSessions:(id)a13 longTermKeyMap:(id)a14;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionForLEMAC:(id)a3;
- (unint64_t)hash;
- (unint64_t)primaryIndex;
- (unsigned)partIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedSessions:(id)a3;
- (void)setBeaconIdentifier:(id)a3;
- (void)setLastConnectedLEMAC:(id)a3;
- (void)setLongTermKeyMap:(id)a3;
- (void)setLtkIndexMap:(id)a3;
- (void)setManagedByFindMy:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPartIdentifier:(unsigned __int8)a3;
- (void)setPrimaryIndex:(unint64_t)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation SPPeripheral

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPeripheral)initWithUserIdentifier:(id)a3 beaconIdentifier:(id)a4 groupIdentifier:(id)a5 name:(id)a6 partIdentifier:(unsigned __int8)a7 serialNumber:(id)a8 managedByFindMy:(BOOL)a9 primaryIndex:(unint64_t)a10 ltkIndexMap:(id)a11 lastConnectedLEMAC:(id)a12 allowedSessions:(id)a13 keyAddressPairs:(id)a14
{
  unsigned int v45 = a7;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v53 = a4;
  id v52 = a5;
  id v51 = a6;
  id v50 = a8;
  id v49 = a11;
  id v48 = a12;
  id v47 = a13;
  id v19 = a14;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v27 = [v26 leMACAddress];
        v28 = [v20 objectForKeyedSubscript:v27];

        if (!v28)
        {
          id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v30 = [v26 leMACAddress];
          [v20 setObject:v29 forKeyedSubscript:v30];
        }
        v31 = [v26 leMACAddress];
        v32 = [v20 objectForKeyedSubscript:v31];

        v33 = [v26 longTermKey];
        [v32 addObject:v33];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v23);
  }

  if ((unint64_t)[v20 count] < 3)
  {
    v35 = [v20 copy];
    v40 = v47;
    v39 = v48;
    v42 = self;
    v38 = v49;
    v41 = v50;
    LOBYTE(v44) = a9;
    v37 = v51;
    v36 = v52;
    v34 = [(SPPeripheral *)v42 initWithUserIdentifier:v54 beaconIdentifier:v53 groupIdentifier:v52 name:v51 partIdentifier:v45 serialNumber:v50 managedByFindMy:v44 primaryIndex:a10 ltkIndexMap:v49 lastConnectedLEMAC:v48 allowedSessions:v47 longTermKeyMap:v35];
    v46 = v34;
  }
  else
  {
    v34 = self;
    v35 = LogCategory_CBPeripheralManagement();
    v37 = v51;
    v36 = v52;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[SPPeripheral initWithUserIdentifier:beaconIdentifier:groupIdentifier:name:partIdentifier:serialNumber:managedByFindMy:primaryIndex:ltkIndexMap:lastConnectedLEMAC:allowedSessions:keyAddressPairs:](v20, v35);
    }
    v46 = 0;
    v39 = v48;
    v38 = v49;
    v40 = v47;
    v41 = v50;
  }

  return v46;
}

- (SPPeripheral)initWithUserIdentifier:(id)a3 beaconIdentifier:(id)a4 groupIdentifier:(id)a5 name:(id)a6 partIdentifier:(unsigned __int8)a7 serialNumber:(id)a8 managedByFindMy:(BOOL)a9 primaryIndex:(unint64_t)a10 ltkIndexMap:(id)a11 lastConnectedLEMAC:(id)a12 allowedSessions:(id)a13 longTermKeyMap:(id)a14
{
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v41 = a6;
  id v19 = a8;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v45.receiver = self;
  v45.super_class = (Class)SPPeripheral;
  uint64_t v24 = [(SPPeripheral *)&v45 init];
  if (v24)
  {
    uint64_t v25 = [v44 copy];
    userIdentifier = v24->_userIdentifier;
    v24->_userIdentifier = (NSUUID *)v25;

    uint64_t v27 = [v43 copy];
    beaconIdentifier = v24->_beaconIdentifier;
    v24->_beaconIdentifier = (NSUUID *)v27;

    uint64_t v29 = [v42 copy];
    groupIdentifier = v24->_groupIdentifier;
    v24->_groupIdentifier = (NSUUID *)v29;

    uint64_t v31 = [v41 copy];
    name = v24->_name;
    v24->_name = (NSString *)v31;

    v24->_partIdentifier = a7;
    uint64_t v33 = [v19 copy];
    serialNumber = v24->_serialNumber;
    v24->_serialNumber = (NSString *)v33;

    v24->_managedByFindMy = a9;
    v24->_primaryIndex = a10;
    objc_storeStrong((id *)&v24->_ltkIndexMap, a11);
    objc_storeStrong((id *)&v24->_lastConnectedLEMAC, a12);
    uint64_t v35 = [v22 copy];
    allowedSessions = v24->_allowedSessions;
    v24->_allowedSessions = (NSArray *)v35;

    uint64_t v37 = [v23 copy];
    longTermKeyMap = v24->_longTermKeyMap;
    v24->_longTermKeyMap = (NSDictionary *)v37;
  }
  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v19 = [SPPeripheral alloc];
  v18 = [(SPPeripheral *)self userIdentifier];
  v17 = [(SPPeripheral *)self beaconIdentifier];
  v4 = [(SPPeripheral *)self groupIdentifier];
  v5 = [(SPPeripheral *)self name];
  uint64_t v6 = [(SPPeripheral *)self partIdentifier];
  v7 = [(SPPeripheral *)self serialNumber];
  BOOL v8 = [(SPPeripheral *)self managedByFindMy];
  unint64_t v9 = [(SPPeripheral *)self primaryIndex];
  v10 = [(SPPeripheral *)self ltkIndexMap];
  v11 = [(SPPeripheral *)self lastConnectedLEMAC];
  v12 = [(SPPeripheral *)self allowedSessions];
  v13 = [(SPPeripheral *)self longTermKeyMap];
  LOBYTE(v16) = v8;
  v14 = [(SPPeripheral *)v19 initWithUserIdentifier:v18 beaconIdentifier:v17 groupIdentifier:v4 name:v5 partIdentifier:v6 serialNumber:v7 managedByFindMy:v16 primaryIndex:v9 ltkIndexMap:v10 lastConnectedLEMAC:v11 allowedSessions:v12 longTermKeyMap:v13];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPPeripheral *)self userIdentifier];
  [v4 encodeObject:v5 forKey:@"userIdentifier"];

  uint64_t v6 = [(SPPeripheral *)self beaconIdentifier];
  [v4 encodeObject:v6 forKey:@"beaconIdentifier"];

  v7 = [(SPPeripheral *)self groupIdentifier];
  [v4 encodeObject:v7 forKey:@"groupIdentifier"];

  BOOL v8 = [(SPPeripheral *)self name];
  [v4 encodeObject:v8 forKey:@"name"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[SPPeripheral partIdentifier](self, "partIdentifier"), @"partIdentifier");
  unint64_t v9 = [(SPPeripheral *)self serialNumber];
  [v4 encodeObject:v9 forKey:@"serialNumber"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SPPeripheral managedByFindMy](self, "managedByFindMy"), @"managedByFindMy");
  objc_msgSend(v4, "encodeInt64:forKey:", -[SPPeripheral primaryIndex](self, "primaryIndex"), @"primaryIndex");
  v10 = [(SPPeripheral *)self ltkIndexMap];
  [v4 encodeObject:v10 forKey:@"ltkIndexMap"];

  v11 = [(SPPeripheral *)self lastConnectedLEMAC];
  [v4 encodeObject:v11 forKey:@"lastConnectedLEMAC"];

  v12 = [(SPPeripheral *)self allowedSessions];
  [v4 encodeObject:v12 forKey:@"allowedSessions"];

  id v13 = [(SPPeripheral *)self longTermKeyMap];
  [v4 encodeObject:v13 forKey:@"longTermKeyMap"];
}

- (SPPeripheral)initWithCoder:(id)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userIdentifier"];
  userIdentifier = self->_userIdentifier;
  self->_userIdentifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beaconIdentifier"];
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v7;

  unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
  groupIdentifier = self->_groupIdentifier;
  self->_groupIdentifier = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  name = self->_name;
  self->_name = v11;

  self->_partIdentifier = [v4 decodeInt64ForKey:@"partIdentifier"];
  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
  serialNumber = self->_serialNumber;
  self->_serialNumber = v13;

  self->_managedByFindMy = [v4 decodeBoolForKey:@"managedByFindMy"];
  self->_primaryIndex = [v4 decodeInt64ForKey:@"primaryIndex"];
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v37[2] = objc_opt_class();
  v37[3] = objc_opt_class();
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  v17 = [v15 setWithArray:v16];
  v18 = [v4 decodeObjectOfClasses:v17 forKey:@"ltkIndexMap"];
  ltkIndexMap = self->_ltkIndexMap;
  self->_ltkIndexMap = v18;

  id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastConnectedLEMAC"];
  lastConnectedLEMAC = self->_lastConnectedLEMAC;
  self->_lastConnectedLEMAC = v20;

  id v22 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  uint64_t v24 = [v22 setWithArray:v23];
  uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"allowedSessions"];
  allowedSessions = self->_allowedSessions;
  self->_allowedSessions = v25;

  uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:3];
  uint64_t v29 = objc_msgSend(v27, "setWithArray:", v28, v33, v34);
  v30 = [v4 decodeObjectOfClasses:v29 forKey:@"longTermKeyMap"];

  longTermKeyMap = self->_longTermKeyMap;
  self->_longTermKeyMap = v30;

  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SPPeripheral *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SPPeripheral *)self userIdentifier];
      v7 = [(SPPeripheral *)v5 userIdentifier];
      if ([v6 isEqual:v7])
      {
        BOOL v8 = [(SPPeripheral *)self beaconIdentifier];
        unint64_t v9 = [(SPPeripheral *)v5 beaconIdentifier];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(SPPeripheral *)self userIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(SPPeripheral *)self beaconIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSArray)keyAddressPairs
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = self;
  uint64_t v4 = [(SPPeripheral *)self longTermKeyMap];
  v5 = [v4 allKeys];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        char v10 = [(SPPeripheral *)v21 longTermKeyMap];
        v11 = [v10 objectForKeyedSubscript:v9];

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [[SPCBPeripheralKeyAddressPair alloc] initWithLEMACAddress:v9 longTermKey:*(void *)(*((void *)&v22 + 1) + 8 * j)];
              [v3 addObject:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v14);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (id)descriptionForLEMAC:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "subdataWithRange:", 0, 1);
  v5 = objc_msgSend(v3, "subdataWithRange:", 1, 6);

  uint64_t v6 = NSString;
  uint64_t v7 = objc_msgSend(v4, "fm_hexString");
  BOOL v8 = objc_msgSend(v5, "fm_hexString");
  uint64_t v9 = [v6 stringWithFormat:@"%@ %@", v7, v8];

  return v9;
}

- (id)description
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = [(SPPeripheral *)self groupIdentifier];

  if (v3)
  {
    uint64_t v4 = [(SPPeripheral *)self groupIdentifier];
    id v51 = [v4 description];
  }
  else
  {
    id v51 = @"<nil>";
  }
  v5 = [(SPPeripheral *)self lastConnectedLEMAC];

  if (v5)
  {
    uint64_t v6 = [(SPPeripheral *)self lastConnectedLEMAC];
    id v50 = [(SPPeripheral *)self descriptionForLEMAC:v6];
  }
  else
  {
    id v50 = &stru_1F0B18CC8;
  }
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [(SPPeripheral *)self longTermKeyMap];
  BOOL v8 = [v7 allKeys];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v53 = *(id *)v66;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(id *)v66 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v13 = [(SPPeripheral *)self longTermKeyMap];
        uint64_t v14 = [v13 objectForKeyedSubscript:v12];

        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v16 = v14;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v62;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v62 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * j), "fm_hexString");
              [v15 addObject:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v61 objects:v70 count:16];
          }
          while (v18);
        }

        long long v22 = [v15 componentsJoinedByString:@", "];
        long long v23 = NSString;
        long long v24 = [(SPPeripheral *)self descriptionForLEMAC:v12];
        long long v25 = [v23 stringWithFormat:@"LEMAC: %@ -- LTKs: [%@]", v24, v22];
        [v56 addObject:v25];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v10);
  }

  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v54 = [(SPPeripheral *)self ltkIndexMap];
  uint64_t v27 = [v54 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v58 != v29) {
          objc_enumerationMutation(v54);
        }
        uint64_t v31 = *(void **)(*((void *)&v57 + 1) + 8 * k);
        uint64_t v32 = NSString;
        uint64_t v33 = objc_msgSend(v31, "fm_hexString");
        uint64_t v34 = [(SPPeripheral *)self ltkIndexMap];
        uint64_t v35 = [v34 objectForKeyedSubscript:v31];
        v36 = [v32 stringWithFormat:@"  %@ -> %llu", v33, objc_msgSend(v35, "unsignedLongLongValue")];
        [v26 addObject:v36];
      }
      uint64_t v28 = [v54 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v28);
  }

  uint64_t v37 = NSString;
  id v49 = v26;
  v38 = [v26 componentsJoinedByString:@"\n"];
  v39 = [v37 stringWithFormat:@"\n%@\n", v38];

  id v55 = (id)NSString;
  id v48 = [(SPPeripheral *)self userIdentifier];
  v40 = [(SPPeripheral *)self beaconIdentifier];
  LODWORD(v38) = [(SPPeripheral *)self partIdentifier];
  id v41 = [(SPPeripheral *)self name];
  id v42 = [(SPPeripheral *)self serialNumber];
  BOOL v43 = [(SPPeripheral *)self managedByFindMy];
  unint64_t v44 = [(SPPeripheral *)self primaryIndex];
  objc_super v45 = [(SPPeripheral *)self allowedSessions];
  v46 = [v55 stringWithFormat:@"<Uid: %@ Bid: %@ group: %@ part: %u name: [%@] S/N: [%@] managed: %d index: %llu lastConnectedMAC: [%@] acl: %@ ltkMap: %@ ltkIndexMap: %@>", v48, v40, v51, v38, v41, v42, v43, v44, v50, v45, v56, v39];

  return v46;
}

- (NSUUID)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unsigned)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(unsigned __int8)a3
{
  self->_partIdentifier = a3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (BOOL)managedByFindMy
{
  return self->_managedByFindMy;
}

- (void)setManagedByFindMy:(BOOL)a3
{
  self->_managedByFindMy = a3;
}

- (NSData)lastConnectedLEMAC
{
  return self->_lastConnectedLEMAC;
}

- (void)setLastConnectedLEMAC:(id)a3
{
}

- (NSArray)allowedSessions
{
  return self->_allowedSessions;
}

- (void)setAllowedSessions:(id)a3
{
}

- (NSDictionary)longTermKeyMap
{
  return self->_longTermKeyMap;
}

- (void)setLongTermKeyMap:(id)a3
{
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (unint64_t)primaryIndex
{
  return self->_primaryIndex;
}

- (void)setPrimaryIndex:(unint64_t)a3
{
  self->_primaryIndex = a3;
}

- (NSDictionary)ltkIndexMap
{
  return self->_ltkIndexMap;
}

- (void)setLtkIndexMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltkIndexMap, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_longTermKeyMap, 0);
  objc_storeStrong((id *)&self->_allowedSessions, 0);
  objc_storeStrong((id *)&self->_lastConnectedLEMAC, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

- (void)initWithUserIdentifier:(void *)a1 beaconIdentifier:(NSObject *)a2 groupIdentifier:name:partIdentifier:serialNumber:managedByFindMy:primaryIndex:ltkIndexMap:lastConnectedLEMAC:allowedSessions:keyAddressPairs:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "Too many MAC addresses: %lu", (uint8_t *)&v3, 0xCu);
}

@end