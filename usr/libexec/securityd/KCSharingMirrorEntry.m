@interface KCSharingMirrorEntry
+ (NSSet)requiredAttributeKeys;
+ (const)databaseItemClass;
- (CKRecord)record;
- (KCSharingLocalFingerprint)internetPasswordFingerprint;
- (KCSharingLocalFingerprint)privateKeyFingerprint;
- (KCSharingMirrorEntry)initWithAttributes:(id)a3 error:(id *)a4;
- (KCSharingMirrorEntry)initWithIncomingEntry:(id)a3 flags:(unsigned int)a4;
- (KCSharingMirrorEntry)initWithMirrorDatabaseItem:(SecDbItem *)a3 error:(id *)a4;
- (KCSharingMirrorEntry)initWithMirrorEntry:(id)a3 flags:(unsigned int)a4;
- (KCSharingMirrorEntry)initWithSavedRecord:(id)a3 forOutgoingEntry:(id)a4 flags:(unsigned int)a5;
- (KCSharingMirrorEntry)initWithUpdatedLocalItem:(id)a3 forIncomingEntry:(id)a4 flags:(unsigned int)a5;
- (KCSharingMirrorEntry)initWithUpdatedLocalItem:(id)a3 forMirrorEntry:(id)a4 flags:(unsigned int)a5;
- (NSString)description;
- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4;
- (id)remoteItemWithAccessGroups:(id)a3 error:(id *)a4;
- (id)shareWithAccessGroups:(id)a3 error:(id *)a4;
- (int64_t)type;
- (unsigned)flags;
@end

@implementation KCSharingMirrorEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internetPasswordFingerprint, 0);
  objc_storeStrong((id *)&self->_privateKeyFingerprint, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

- (unsigned)flags
{
  return self->_flags;
}

- (CKRecord)record
{
  return self->_record;
}

- (int64_t)type
{
  return self->_type;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSKeyedArchiver archivedDataWithRootObject:self->_record requiringSecureCoding:1 error:a4];
  if (!v7)
  {
    id v23 = 0;
    goto LABEL_9;
  }
  v8 = objc_opt_new();
  v28 = v7;
  [v8 setCloudKitRecord:v7];
  v38[0] = kSecAttrUUID;
  v36 = [(CKRecord *)self->_record recordID];
  v35 = [v36 recordName];
  v39[0] = v35;
  v38[1] = @"zone";
  v34 = [(KCSharingMirrorEntry *)self record];
  v33 = [v34 recordID];
  v32 = [v33 zoneID];
  v31 = [v32 zoneName];
  v39[1] = v31;
  v38[2] = @"ownr";
  v30 = [(KCSharingMirrorEntry *)self record];
  v29 = [v30 recordID];
  v9 = [v29 zoneID];
  v10 = [v9 ownerName];
  v39[2] = v10;
  v39[3] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  v38[3] = kSecAttrAccessible;
  v38[4] = @"type";
  v11 = +[NSNumber numberWithLongLong:self->_type];
  v39[4] = v11;
  v38[5] = kSecAttrAccessGroup;
  v12 = [v6 entryAccessGroup];
  v39[5] = v12;
  v38[6] = kSecValueData;
  v27 = v8;
  v13 = [v8 data];
  v39[6] = v13;
  v38[7] = @"flag";
  v14 = +[NSNumber numberWithUnsignedInt:self->_flags];
  v39[7] = v14;
  v38[8] = @"lwsv";
  id v37 = v6;
  v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 entrySchemaVersion]);
  v39[8] = v15;
  v16 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:9];
  id v17 = [v16 mutableCopy];

  int64_t type = self->_type;
  if (type == 1)
  {
    v20 = off_100305B10;
    uint64_t v21 = 32;
    v22 = off_100306530;
    v19 = v27;
    v7 = v28;
    goto LABEL_7;
  }
  v19 = v27;
  v7 = v28;
  if (type == 2)
  {
    v20 = &off_100305B18;
    uint64_t v21 = 40;
    v22 = &off_100306538;
LABEL_7:
    v24 = [*(id *)((char *)&self->super.isa + v21) keyprint];
    [v17 setObject:v24 forKeyedSubscript:*v22];

    v25 = [*(id *)((char *)&self->super.isa + v21) valueprint];
    [v17 setObject:v25 forKeyedSubscript:*v20];
  }
  id v23 = [v17 copy];

  id v6 = v37;
LABEL_9:

  return v23;
}

- (id)shareWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(KCSharingMirrorEntry *)self type];
  if ((unint64_t)(v7 - 1) < 2)
  {
    v18 = a4;
    uint64_t v19 = 21;
LABEL_9:
    sub_100046FBC(v18, v19, 0);
    goto LABEL_10;
  }
  if (!v7)
  {
    id v17 = [[KCSharingEntryContents alloc] initWithContents:0 fullyDecoded:0];
    goto LABEL_11;
  }
  if (v7 == 3)
  {
    v8 = [(KCSharingMirrorEntry *)self record];
    v9 = [v8 recordID];
    v10 = [v9 zoneID];
    v11 = [v10 zoneName];
    unsigned __int8 v12 = [v11 hasPrefix:@"group-"];

    if (v12)
    {
      v13 = [(KCSharingMirrorEntry *)self record];
      id v14 = [v6 recordIsFullyDecoded:v13];

      v15 = [KCSharingEntryContents alloc];
      v16 = [(KCSharingMirrorEntry *)self record];
      id v17 = [(KCSharingEntryContents *)v15 initWithContents:v16 fullyDecoded:v14];

      goto LABEL_11;
    }
    v18 = a4;
    uint64_t v19 = 7;
    goto LABEL_9;
  }
LABEL_10:
  id v17 = 0;
LABEL_11:

  return v17;
}

- (id)remoteItemWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6 = a3;
  switch(self->_type)
  {
    case 0:
      int64_t v7 = [[KCSharingEntryContents alloc] initWithContents:0 fullyDecoded:0];
      goto LABEL_22;
    case 1:
      v8 = [(CKRecord *)self->_record recordID];
      v9 = [v8 zoneID];
      v10 = sub_10004695C(v9);

      if (!v10) {
        goto LABEL_14;
      }
      v11 = [KCSharingPBRemoteItem alloc];
      unsigned __int8 v12 = [(CKRecord *)self->_record encryptedValues];
      v13 = [v12 objectForKeyedSubscript:@"payload"];
      id v14 = [(KCSharingPBRemoteItem *)v11 initWithData:v13];

      if (!v14) {
        goto LABEL_15;
      }
      id v15 = [[KCSharingRemoteItem alloc] initPasskeyWithProto:v14 sharingGroup:v10 error:a4];
      goto LABEL_9;
    case 2:
      v16 = [(CKRecord *)self->_record recordID];
      id v17 = [v16 zoneID];
      v10 = sub_10004695C(v17);

      if (v10)
      {
        v18 = [KCSharingPBRemoteItem alloc];
        uint64_t v19 = [(CKRecord *)self->_record encryptedValues];
        v20 = [v19 objectForKeyedSubscript:@"payload"];
        id v14 = [(KCSharingPBRemoteItem *)v18 initWithData:v20];

        if (v14)
        {
          id v15 = [[KCSharingRemoteItem alloc] initPasswordWithProto:v14 sharingGroup:v10 error:a4];
LABEL_9:
          uint64_t v21 = v15;
          if (v15)
          {
            v22 = [(KCSharingMirrorEntry *)self record];
            if ([v6 recordIsFullyDecoded:v22]) {
              id v23 = [v6 remoteItemProtoIsFullyDecoded:v14];
            }
            else {
              id v23 = 0;
            }

            int64_t v7 = [[KCSharingEntryContents alloc] initWithContents:v21 fullyDecoded:v23];
          }
          else
          {
            int64_t v7 = 0;
          }
        }
        else
        {
LABEL_15:
          sub_100046FBC(a4, 4, 0);
          int64_t v7 = 0;
        }
      }
      else
      {
LABEL_14:
        sub_100046FBC(a4, 7, 0);
        int64_t v7 = 0;
      }

      goto LABEL_22;
    case 3:
      sub_100046FBC(a4, 13, 0);
      goto LABEL_13;
    default:
LABEL_13:
      int64_t v7 = 0;
LABEL_22:

      return v7;
  }
}

- (KCSharingLocalFingerprint)internetPasswordFingerprint
{
  if (self->_type != 2)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingMirrorEntry.m" lineNumber:204 description:@"Can't get Internet password fingerprint for mirror entry of type %ld" , self->_type];
  }
  internetPasswordFingerprint = self->_internetPasswordFingerprint;

  return internetPasswordFingerprint;
}

- (KCSharingLocalFingerprint)privateKeyFingerprint
{
  if (self->_type != 1)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingMirrorEntry.m" lineNumber:199 description:@"Can't get private key fingerprint for mirror entry of type %ld" , self->_type];
  }
  privateKeyFingerprint = self->_privateKeyFingerprint;

  return privateKeyFingerprint;
}

- (NSString)description
{
  int64_t type = self->_type;
  v3 = [(CKRecord *)self->_record recordID];
  v4 = +[NSString stringWithFormat:@"KCSharingMirrorEntry(type:%lld recordID:%@)", type, v3];

  return (NSString *)v4;
}

- (KCSharingMirrorEntry)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)KCSharingMirrorEntry;
  int64_t v7 = [(KCSharingMirrorEntry *)&v38 init];
  if (!v7)
  {
LABEL_14:
    v36 = v7;
    goto LABEL_16;
  }
  v8 = [KCSharingPBLocalEntryData alloc];
  v9 = [v6 objectForKeyedSubscript:kSecValueData];
  v10 = [(KCSharingPBLocalEntryData *)v8 initWithData:v9];

  if (v10)
  {
    v11 = [v6 objectForKeyedSubscript:@"type"];
    v7->_int64_t type = (int64_t)[v11 longLongValue];

    unsigned __int8 v12 = [v6 objectForKeyedSubscript:@"flag"];
    v7->_flags = [v12 unsignedIntValue];

    switch(v7->_type)
    {
      case 0:
        uint64_t v13 = objc_opt_class();
        id v14 = [(KCSharingPBLocalEntryData *)v10 cloudKitRecord];
        uint64_t v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v13 fromData:v14 error:a4];
        record = v7->_record;
        v7->_record = (CKRecord *)v15;

        goto LABEL_12;
      case 1:
        uint64_t v17 = objc_opt_class();
        v18 = [(KCSharingPBLocalEntryData *)v10 cloudKitRecord];
        uint64_t v19 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v17 fromData:v18 error:a4];
        v20 = v7->_record;
        v7->_record = (CKRecord *)v19;

        if (!v7->_record) {
          goto LABEL_15;
        }
        uint64_t v21 = [KCSharingLocalFingerprint alloc];
        v22 = [v6 objectForKeyedSubscript:@"pkkp"];
        id v23 = [v6 objectForKeyedSubscript:@"pkvp"];
        v24 = [(KCSharingLocalFingerprint *)v21 initWithKeyprint:v22 valueprint:v23];
        privateKeyFingerprint = v7->_privateKeyFingerprint;
        v7->_privateKeyFingerprint = v24;
        goto LABEL_10;
      case 2:
        uint64_t v26 = objc_opt_class();
        v27 = [(KCSharingPBLocalEntryData *)v10 cloudKitRecord];
        uint64_t v28 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v26 fromData:v27 error:a4];
        v29 = v7->_record;
        v7->_record = (CKRecord *)v28;

        if (!v7->_record) {
          goto LABEL_15;
        }
        v30 = [KCSharingLocalFingerprint alloc];
        v22 = [v6 objectForKeyedSubscript:@"ipkp"];
        id v23 = [v6 objectForKeyedSubscript:@"ipvp"];
        v31 = [(KCSharingLocalFingerprint *)v30 initWithKeyprint:v22 valueprint:v23];
        privateKeyFingerprint = v7->_internetPasswordFingerprint;
        v7->_internetPasswordFingerprint = v31;
LABEL_10:

        goto LABEL_13;
      case 3:
        v32 = +[NSSet setWithObject:objc_opt_class()];
        v33 = [(KCSharingPBLocalEntryData *)v10 cloudKitRecord];
        uint64_t v34 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v32 fromData:v33 error:a4];
        v35 = v7->_record;
        v7->_record = (CKRecord *)v34;

LABEL_12:
        if (v7->_record) {
          goto LABEL_13;
        }
        goto LABEL_15;
      default:
LABEL_13:

        break;
    }
    goto LABEL_14;
  }
  sub_100046FBC(a4, 3, 0);
LABEL_15:

  v36 = 0;
LABEL_16:

  return v36;
}

- (KCSharingMirrorEntry)initWithMirrorDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  CFSetRef v7 = [(id)objc_opt_class() requiredAttributeKeys];
  v8 = sub_100155CF8(a3, v7, a4);

  if (v8)
  {
    self = [(KCSharingMirrorEntry *)self initWithAttributes:v8 error:a4];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (KCSharingMirrorEntry)initWithUpdatedLocalItem:(id)a3 forMirrorEntry:(id)a4 flags:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)KCSharingMirrorEntry;
  v10 = [(KCSharingMirrorEntry *)&v18 init];
  if (v10)
  {
    v10->_int64_t type = (int64_t)[v9 type];
    uint64_t v11 = [v9 record];
    record = v10->_record;
    v10->_record = (CKRecord *)v11;

    v10->_flags = a5;
    id v13 = [v8 type];
    if (v13 == (id)2)
    {
      uint64_t v16 = [v8 internetPasswordFingerprint];
      internetPasswordFingerprint = v10->_internetPasswordFingerprint;
      v10->_internetPasswordFingerprint = (KCSharingLocalFingerprint *)v16;
      goto LABEL_6;
    }
    if (v13 == (id)1)
    {
      uint64_t v14 = [v8 privateKeyFingerprint];
      internetPasswordFingerprint = v10->_privateKeyFingerprint;
      v10->_privateKeyFingerprint = (KCSharingLocalFingerprint *)v14;
LABEL_6:
    }
  }

  return v10;
}

- (KCSharingMirrorEntry)initWithSavedRecord:(id)a3 forOutgoingEntry:(id)a4 flags:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)KCSharingMirrorEntry;
  uint64_t v11 = [(KCSharingMirrorEntry *)&v17 init];
  if (v11)
  {
    v11->_int64_t type = (int64_t)[v10 type];
    objc_storeStrong((id *)&v11->_record, a3);
    v11->_flags = a5;
    id v12 = [v10 type];
    if (v12 == (id)2)
    {
      uint64_t v15 = [v10 internetPasswordFingerprint];
      internetPasswordFingerprint = v11->_internetPasswordFingerprint;
      v11->_internetPasswordFingerprint = (KCSharingLocalFingerprint *)v15;
      goto LABEL_6;
    }
    if (v12 == (id)1)
    {
      uint64_t v13 = [v10 privateKeyFingerprint];
      internetPasswordFingerprint = v11->_privateKeyFingerprint;
      v11->_privateKeyFingerprint = (KCSharingLocalFingerprint *)v13;
LABEL_6:
    }
  }

  return v11;
}

- (KCSharingMirrorEntry)initWithMirrorEntry:(id)a3 flags:(unsigned int)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KCSharingMirrorEntry;
  CFSetRef v7 = [(KCSharingMirrorEntry *)&v15 init];
  if (v7)
  {
    v7->_int64_t type = (int64_t)[v6 type];
    uint64_t v8 = [v6 record];
    record = v7->_record;
    v7->_record = (CKRecord *)v8;

    v7->_flags = a4;
    id v10 = [v6 type];
    if (v10 == (id)2)
    {
      uint64_t v13 = [v6 internetPasswordFingerprint];
      internetPasswordFingerprint = v7->_internetPasswordFingerprint;
      v7->_internetPasswordFingerprint = (KCSharingLocalFingerprint *)v13;
      goto LABEL_6;
    }
    if (v10 == (id)1)
    {
      uint64_t v11 = [v6 privateKeyFingerprint];
      internetPasswordFingerprint = v7->_privateKeyFingerprint;
      v7->_privateKeyFingerprint = (KCSharingLocalFingerprint *)v11;
LABEL_6:
    }
  }

  return v7;
}

- (KCSharingMirrorEntry)initWithIncomingEntry:(id)a3 flags:(unsigned int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingMirrorEntry;
  CFSetRef v7 = [(KCSharingMirrorEntry *)&v11 init];
  if (v7)
  {
    v7->_int64_t type = (int64_t)[v6 type];
    uint64_t v8 = [v6 record];
    record = v7->_record;
    v7->_record = (CKRecord *)v8;

    v7->_flags = a4;
  }

  return v7;
}

- (KCSharingMirrorEntry)initWithUpdatedLocalItem:(id)a3 forIncomingEntry:(id)a4 flags:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)KCSharingMirrorEntry;
  id v10 = [(KCSharingMirrorEntry *)&v18 init];
  if (v10)
  {
    v10->_int64_t type = (int64_t)[v9 type];
    uint64_t v11 = [v9 record];
    record = v10->_record;
    v10->_record = (CKRecord *)v11;

    v10->_flags = a5;
    id v13 = [v8 type];
    if (v13 == (id)2)
    {
      uint64_t v16 = [v8 internetPasswordFingerprint];
      internetPasswordFingerprint = v10->_internetPasswordFingerprint;
      v10->_internetPasswordFingerprint = (KCSharingLocalFingerprint *)v16;
      goto LABEL_6;
    }
    if (v13 == (id)1)
    {
      uint64_t v14 = [v8 privateKeyFingerprint];
      internetPasswordFingerprint = v10->_privateKeyFingerprint;
      v10->_privateKeyFingerprint = (KCSharingLocalFingerprint *)v14;
LABEL_6:
    }
  }

  return v10;
}

+ (NSSet)requiredAttributeKeys
{
  if (qword_10035CDC8 != -1) {
    dispatch_once(&qword_10035CDC8, &stru_1002F8E30);
  }
  v2 = (void *)qword_10035CDC0;

  return (NSSet *)v2;
}

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_10000C75C(@"sharingMirror", &qword_10035D060, (uint64_t)&unk_10035D058);
}

@end