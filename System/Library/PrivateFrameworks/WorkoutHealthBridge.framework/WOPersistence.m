@interface WOPersistence
+ (BOOL)supportsSecureCoding;
+ (id)persistenceFromProto:(id)a3;
+ (id)zeroObjectModificationDate;
- (NSData)persistedData;
- (NSData)persistedProtoData;
- (NSDate)objectModificationDate;
- (NSDictionary)keyedDatas;
- (NSDictionary)keyedDates;
- (NSDictionary)keyedNumbers;
- (NSDictionary)keyedStrings;
- (NSUUID)uuid;
- (WOPersistence)initWithCoder:(id)a3;
- (WOPersistence)initWithData:(id)a3;
- (WOPersistence)initWithVersion:(int64_t)a3 type:(unint64_t)a4 uuid:(id)a5 persistedData:(id)a6 objectState:(unint64_t)a7 objectModificationDate:(id)a8 syncIdentity:(id)a9;
- (WOPersistence)initWithVersion:(int64_t)a3 type:(unint64_t)a4 uuid:(id)a5 persistedData:(id)a6 persistedProtoData:(id)a7 objectState:(unint64_t)a8 objectModificationDate:(id)a9 syncIdentity:(id)a10;
- (WOSyncIdentity)syncIdentity;
- (id)data;
- (id)protobuf;
- (int64_t)encodedByteCount;
- (int64_t)version;
- (unint64_t)objectState;
- (unint64_t)type;
- (void)data;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyedDatas:(id)a3;
- (void)setKeyedDates:(id)a3;
- (void)setKeyedNumbers:(id)a3;
- (void)setKeyedStrings:(id)a3;
- (void)setObjectModificationDate:(id)a3;
- (void)setObjectState:(unint64_t)a3;
- (void)setPersistedData:(id)a3;
- (void)setPersistedProtoData:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation WOPersistence

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WOPersistence)initWithVersion:(int64_t)a3 type:(unint64_t)a4 uuid:(id)a5 persistedData:(id)a6 objectState:(unint64_t)a7 objectModificationDate:(id)a8 syncIdentity:(id)a9
{
  return [(WOPersistence *)self initWithVersion:a3 type:a4 uuid:a5 persistedData:a6 persistedProtoData:0 objectState:a7 objectModificationDate:a8 syncIdentity:a9];
}

- (WOPersistence)initWithVersion:(int64_t)a3 type:(unint64_t)a4 uuid:(id)a5 persistedData:(id)a6 persistedProtoData:(id)a7 objectState:(unint64_t)a8 objectModificationDate:(id)a9 syncIdentity:(id)a10
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  v28.receiver = self;
  v28.super_class = (Class)WOPersistence;
  v21 = [(WOPersistence *)&v28 init];
  v22 = v21;
  if (v21)
  {
    [(WOPersistence *)v21 setVersion:a3];
    [(WOPersistence *)v22 setType:a4];
    [(WOPersistence *)v22 setUuid:v16];
    [(WOPersistence *)v22 setPersistedData:v17];
    [(WOPersistence *)v22 setPersistedProtoData:v18];
    [(WOPersistence *)v22 setObjectState:a8];
    [(WOPersistence *)v22 setObjectModificationDate:v19];
    [(WOPersistence *)v22 setSyncIdentity:v20];
    v23 = objc_opt_new();
    [(WOPersistence *)v22 setKeyedNumbers:v23];

    v24 = objc_opt_new();
    [(WOPersistence *)v22 setKeyedStrings:v24];

    v25 = objc_opt_new();
    [(WOPersistence *)v22 setKeyedDatas:v25];

    v26 = objc_opt_new();
    [(WOPersistence *)v22 setKeyedDatas:v26];
  }
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeObject:self->_keyedNumbers forKey:@"numbers"];
  [v5 encodeObject:self->_keyedStrings forKey:@"strings"];
  [v5 encodeObject:self->_keyedDates forKey:@"dates"];
  [v5 encodeObject:self->_persistedData forKey:@"data"];
  [v5 encodeObject:self->_keyedDatas forKey:@"keyedDatas"];
  [v5 encodeObject:self->_persistedProtoData forKey:@"proto_data"];
  [v5 encodeInteger:self->_objectState forKey:@"objectState"];
  [v5 encodeObject:self->_objectModificationDate forKey:@"objectModificationDate"];
  [v5 encodeObject:self->_syncIdentity forKey:@"syncIdentity"];
}

- (WOPersistence)initWithCoder:(id)a3
{
  v33[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WOPersistence;
  id v5 = [(WOPersistence *)&v29 init];
  if (v5)
  {
    -[WOPersistence setVersion:](v5, "setVersion:", [v4 decodeIntegerForKey:@"version"]);
    -[WOPersistence setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    [(WOPersistence *)v5 setUuid:v6];

    v7 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];
    v9 = [v7 setWithArray:v8];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"numbers"];
    [(WOPersistence *)v5 setKeyedNumbers:v10];

    v11 = (void *)MEMORY[0x263EFFA08];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    v13 = [v11 setWithArray:v12];
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"strings"];
    [(WOPersistence *)v5 setKeyedStrings:v14];

    v15 = (void *)MEMORY[0x263EFFA08];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
    id v17 = [v15 setWithArray:v16];
    id v18 = [v4 decodeObjectOfClasses:v17 forKey:@"dates"];
    [(WOPersistence *)v5 setKeyedDates:v18];

    id v19 = (void *)MEMORY[0x263EFFA08];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
    v21 = [v19 setWithArray:v20];
    v22 = [v4 decodeObjectOfClasses:v21 forKey:@"keyedDatas"];
    [(WOPersistence *)v5 setKeyedDatas:v22];

    if ([v4 containsValueForKey:@"proto_data"])
    {
      v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proto_data"];
      [(WOPersistence *)v5 setPersistedProtoData:v23];
    }
    else
    {
      [(WOPersistence *)v5 setPersistedProtoData:0];
    }
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    [(WOPersistence *)v5 setPersistedData:v24];

    if ([v4 containsValueForKey:@"objectState"]) {
      uint64_t v25 = [v4 decodeIntegerForKey:@"objectState"];
    }
    else {
      uint64_t v25 = 0;
    }
    [(WOPersistence *)v5 setObjectState:v25];
    if ([v4 containsValueForKey:@"objectModificationDate"]) {
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectModificationDate"];
    }
    else {
    v26 = +[WOPersistence zeroObjectModificationDate];
    }
    [(WOPersistence *)v5 setObjectModificationDate:v26];

    if ([v4 containsValueForKey:@"syncIdentity"])
    {
      v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syncIdentity"];
      [(WOPersistence *)v5 setSyncIdentity:v27];
    }
  }

  return v5;
}

- (WOPersistence)initWithData:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08928];
  id v5 = a3;
  id v10 = 0;
  v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v10];

  id v7 = v10;
  if (!v6)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      -[WOPersistence initWithData:]((uint64_t)v7, v8);
    }
  }

  return v6;
}

+ (id)zeroObjectModificationDate
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:0.0];
  return v2;
}

- (id)data
{
  id v8 = 0;
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v8];
  id v3 = v8;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      [(WOPersistence *)(uint64_t)v3 data];
    }
    id v4 = [MEMORY[0x263EFF8F8] data];
  }
  v6 = v4;

  return v6;
}

- (int64_t)encodedByteCount
{
  v2 = [(WOPersistence *)self data];
  int64_t v3 = [v2 length];

  return v3;
}

- (id)protobuf
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  int64_t v3 = objc_opt_new();
  context = (void *)MEMORY[0x22A625E30]();
  [v3 setVersion:LODWORD(self->_version)];
  [v3 setType:LODWORD(self->_type)];
  id v4 = [(NSUUID *)self->_uuid hk_dataForUUIDBytes];
  [v3 setUuid:v4];

  [v3 setPersistedProtoData:self->_persistedProtoData];
  [v3 setPersistedData:self->_persistedData];
  [v3 setObjectState:LODWORD(self->_objectState)];
  [(NSDate *)self->_objectModificationDate timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setObjectModificationTimeSinceReferenceDate:");
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = self->_keyedNumbers;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        v11 = [(NSDictionary *)self->_keyedNumbers objectForKeyedSubscript:v10];
        v12 = objc_opt_new();
        [v12 setKey:v10];
        [v11 doubleValue];
        objc_msgSend(v12, "setNumber:");
        [v3 addKeyedNumbers:v12];
      }
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v7);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v13 = self->_keyedStrings;
  uint64_t v14 = [(NSDictionary *)v13 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        id v19 = [(NSDictionary *)self->_keyedStrings objectForKeyedSubscript:v18];
        id v20 = objc_opt_new();
        [v20 setKey:v18];
        [v20 setString:v19];
        [v3 addKeyedStrings:v20];
      }
      uint64_t v15 = [(NSDictionary *)v13 countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v15);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v21 = self->_keyedDates;
  uint64_t v22 = [(NSDictionary *)v21 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8 * k);
        v27 = [(NSDictionary *)self->_keyedDates objectForKeyedSubscript:v26];
        objc_super v28 = objc_opt_new();
        [v28 setKey:v26];
        [v27 timeIntervalSinceReferenceDate];
        objc_msgSend(v28, "setTimeSinceReferenceDate:");
        [v3 addKeyedDates:v28];
      }
      uint64_t v23 = [(NSDictionary *)v21 countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v23);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  objc_super v29 = self->_keyedDatas;
  uint64_t v30 = [(NSDictionary *)v29 countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v46;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v45 + 1) + 8 * m);
        v35 = [(NSDictionary *)self->_keyedDatas objectForKeyedSubscript:v34];
        v36 = objc_opt_new();
        [v36 setKey:v34];
        [v36 setOurData:v35];
        [v3 addKeyedDatas:v36];
      }
      uint64_t v31 = [(NSDictionary *)v29 countByEnumeratingWithState:&v45 objects:v61 count:16];
    }
    while (v31);
  }

  if (self->_syncIdentity)
  {
    v37 = objc_opt_new();
    v38 = [(WOSyncIdentity *)self->_syncIdentity databaseIdentifier];
    v39 = objc_msgSend(v38, "hk_dataForUUIDBytes");
    [v37 setDatabaseIdentifier:v39];

    v40 = [(WOSyncIdentity *)self->_syncIdentity hardwareIdentifier];
    v41 = objc_msgSend(v40, "hk_dataForUUIDBytes");
    [v37 setHardwareIdentifier:v41];

    v42 = [(WOSyncIdentity *)self->_syncIdentity instanceDiscriminator];
    [v37 setInstanceDiscriminator:v42];

    [v3 setSyncIdentity:v37];
  }
  return v3;
}

+ (id)persistenceFromProto:(id)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v66 = [WOPersistence alloc];
  uint64_t v4 = (int)[v3 version];
  uint64_t v5 = (int)[v3 type];
  uint64_t v6 = (void *)MEMORY[0x263F08C38];
  uint64_t v7 = [v3 uuid];
  uint64_t v8 = objc_msgSend(v6, "hk_UUIDWithData:", v7);
  v9 = [v3 persistedData];
  uint64_t v10 = [v3 persistedProtoData];
  uint64_t v11 = (int)[v3 objectState];
  v12 = (void *)MEMORY[0x263EFF910];
  [v3 objectModificationTimeSinceReferenceDate];
  v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  v67 = [(WOPersistence *)v66 initWithVersion:v4 type:v5 uuid:v8 persistedData:v9 persistedProtoData:v10 objectState:v11 objectModificationDate:v13 syncIdentity:0];

  uint64_t v65 = v3;
  if ([v3 hasSyncIdentity])
  {
    uint64_t v14 = [WOSyncIdentity alloc];
    uint64_t v15 = (void *)MEMORY[0x263F08C38];
    uint64_t v16 = [v3 syncIdentity];
    id v17 = [v16 hardwareIdentifier];
    uint64_t v18 = objc_msgSend(v15, "hk_UUIDWithData:", v17);
    id v19 = (void *)MEMORY[0x263F08C38];
    id v20 = [v3 syncIdentity];
    v21 = [v20 databaseIdentifier];
    uint64_t v22 = objc_msgSend(v19, "hk_UUIDWithData:", v21);
    uint64_t v23 = [v3 syncIdentity];
    uint64_t v24 = [v23 instanceDiscriminator];
    uint64_t v25 = [(WOSyncIdentity *)v14 initWithHardwareIdentifier:v18 databaseIdentifier:v22 instanceDiscriminator:v24];

    id v3 = v65;
    [(WOPersistence *)v67 setSyncIdentity:v25];
  }
  uint64_t v26 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v27 = [v3 keyedNumbers];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v81 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        v33 = NSNumber;
        [v32 number];
        uint64_t v34 = objc_msgSend(v33, "numberWithDouble:");
        v35 = [v32 key];
        [v26 setObject:v34 forKeyedSubscript:v35];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v29);
  }

  [(WOPersistence *)v67 setKeyedNumbers:v26];
  v36 = objc_opt_new();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v37 = [v65 keyedStrings];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v77 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        v43 = [v42 string];
        v44 = [v42 key];
        [v36 setObject:v43 forKeyedSubscript:v44];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v76 objects:v86 count:16];
    }
    while (v39);
  }

  [(WOPersistence *)v67 setKeyedStrings:v36];
  long long v45 = objc_opt_new();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v46 = [v65 keyedDatas];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v72 objects:v85 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v73;
    do
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void *)v73 != v49) {
          objc_enumerationMutation(v46);
        }
        long long v51 = *(void **)(*((void *)&v72 + 1) + 8 * k);
        long long v52 = [v51 ourData];
        long long v53 = [v51 key];
        [v45 setObject:v52 forKeyedSubscript:v53];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v72 objects:v85 count:16];
    }
    while (v48);
  }

  [(WOPersistence *)v67 setKeyedDatas:v45];
  long long v54 = objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v55 = [v65 keyedDates];
  uint64_t v56 = [v55 countByEnumeratingWithState:&v68 objects:v84 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v69;
    do
    {
      for (uint64_t m = 0; m != v57; ++m)
      {
        if (*(void *)v69 != v58) {
          objc_enumerationMutation(v55);
        }
        long long v60 = *(void **)(*((void *)&v68 + 1) + 8 * m);
        v61 = (void *)MEMORY[0x263EFF910];
        [v60 timeSinceReferenceDate];
        v62 = objc_msgSend(v61, "dateWithTimeIntervalSinceReferenceDate:");
        v63 = [v60 key];
        [v54 setObject:v62 forKeyedSubscript:v63];
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v68 objects:v84 count:16];
    }
    while (v57);
  }

  [(WOPersistence *)v67 setKeyedDates:v54];
  return v67;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_int64_t version = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDictionary)keyedNumbers
{
  return self->_keyedNumbers;
}

- (void)setKeyedNumbers:(id)a3
{
}

- (NSDictionary)keyedStrings
{
  return self->_keyedStrings;
}

- (void)setKeyedStrings:(id)a3
{
}

- (NSDictionary)keyedDates
{
  return self->_keyedDates;
}

- (void)setKeyedDates:(id)a3
{
}

- (NSDictionary)keyedDatas
{
  return self->_keyedDatas;
}

- (void)setKeyedDatas:(id)a3
{
}

- (NSData)persistedData
{
  return self->_persistedData;
}

- (void)setPersistedData:(id)a3
{
}

- (NSData)persistedProtoData
{
  return self->_persistedProtoData;
}

- (void)setPersistedProtoData:(id)a3
{
}

- (unint64_t)objectState
{
  return self->_objectState;
}

- (void)setObjectState:(unint64_t)a3
{
  self->_objectState = a3;
}

- (NSDate)objectModificationDate
{
  return self->_objectModificationDate;
}

- (void)setObjectModificationDate:(id)a3
{
}

- (WOSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_objectModificationDate, 0);
  objc_storeStrong((id *)&self->_persistedProtoData, 0);
  objc_storeStrong((id *)&self->_persistedData, 0);
  objc_storeStrong((id *)&self->_keyedDatas, 0);
  objc_storeStrong((id *)&self->_keyedDates, 0);
  objc_storeStrong((id *)&self->_keyedStrings, 0);
  objc_storeStrong((id *)&self->_keyedNumbers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224EBF000, a2, OS_LOG_TYPE_ERROR, "Unable to decode persistence data: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)data
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224EBF000, a2, OS_LOG_TYPE_ERROR, "Unable to archive WOPersistence object: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end