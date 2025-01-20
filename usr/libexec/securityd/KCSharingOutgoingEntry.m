@interface KCSharingOutgoingEntry
- (CKRecord)record;
- (KCSharingLocalFingerprint)internetPasswordFingerprint;
- (KCSharingLocalFingerprint)privateKeyFingerprint;
- (KCSharingOutgoingEntry)initWithAttributes:(id)a3 error:(id *)a4;
- (KCSharingOutgoingEntry)initWithNewLocalItem:(id)a3 zoneID:(id)a4;
- (KCSharingOutgoingEntry)initWithShare:(id)a3;
- (KCSharingOutgoingEntry)initWithUpdatedLocalItem:(id)a3 forMirrorEntry:(id)a4 error:(id *)a5;
- (NSDate)modificationDate;
- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4;
- (id)remoteItemWithAccessGroups:(id)a3 error:(id *)a4;
- (id)shareWithAccessGroups:(id)a3 error:(id *)a4;
- (int64_t)type;
@end

@implementation KCSharingOutgoingEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_internetPasswordFingerprint, 0);
  objc_storeStrong((id *)&self->_privateKeyFingerprint, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
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
    id v24 = 0;
    goto LABEL_9;
  }
  v8 = objc_opt_new();
  v30 = v7;
  [v8 setCloudKitRecord:v7];
  v39[0] = kSecAttrUUID;
  v37 = [(KCSharingOutgoingEntry *)self record];
  v36 = [v37 recordID];
  v35 = [v36 recordName];
  v40[0] = v35;
  v39[1] = @"zone";
  v34 = [(KCSharingOutgoingEntry *)self record];
  v33 = [v34 recordID];
  v32 = [v33 zoneID];
  v31 = [v32 zoneName];
  v40[1] = v31;
  v39[2] = @"ownr";
  v9 = [(KCSharingOutgoingEntry *)self record];
  v10 = [v9 recordID];
  v11 = [v10 zoneID];
  v12 = [v11 ownerName];
  v40[2] = v12;
  v40[3] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  v39[3] = kSecAttrAccessible;
  v39[4] = @"type";
  v13 = +[NSNumber numberWithLongLong:self->_type];
  v40[4] = v13;
  v39[5] = kSecAttrAccessGroup;
  id v38 = v6;
  v14 = [v6 entryAccessGroup];
  v40[5] = v14;
  v39[6] = kSecValueData;
  v29 = v8;
  v15 = [v8 data];
  modificationDate = self->_modificationDate;
  v40[6] = v15;
  v40[7] = modificationDate;
  v39[7] = kSecAttrModificationDate;
  v39[8] = @"deln";
  v40[8] = &__kCFBooleanFalse;
  v17 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:9];
  id v18 = [v17 mutableCopy];

  int64_t type = self->_type;
  if (type == 1)
  {
    v21 = off_100305B10;
    v22 = off_100306530;
    v23 = &OBJC_IVAR___KCSharingOutgoingEntry__privateKeyFingerprint;
    v20 = v29;
    v7 = v30;
    goto LABEL_7;
  }
  v20 = v29;
  v7 = v30;
  if (type == 2)
  {
    v21 = &off_100305B18;
    v22 = &off_100306538;
    v23 = &OBJC_IVAR___KCSharingOutgoingEntry__internetPasswordFingerprint;
LABEL_7:
    uint64_t v25 = *v23;
    v26 = [*(id *)((char *)&self->super.super.isa + v25) keyprint];
    [v18 setObject:v26 forKeyedSubscript:*v22];

    v27 = [*(id *)((char *)&self->super.super.isa + v25) valueprint];
    [v18 setObject:v27 forKeyedSubscript:*v21];
  }
  id v24 = [v18 copy];

  id v6 = v38;
LABEL_9:

  return v24;
}

- (id)shareWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(KCSharingOutgoingEntry *)self type];
  if ((unint64_t)(v7 - 1) < 2)
  {
    id v18 = a4;
    uint64_t v19 = 21;
LABEL_9:
    sub_100046FBC(v18, v19, 0);
    goto LABEL_10;
  }
  if (!v7)
  {
    v17 = [[KCSharingEntryContents alloc] initWithContents:0 fullyDecoded:0];
    goto LABEL_11;
  }
  if (v7 == 3)
  {
    v8 = [(KCSharingOutgoingEntry *)self record];
    v9 = [v8 recordID];
    v10 = [v9 zoneID];
    v11 = [v10 zoneName];
    unsigned __int8 v12 = [v11 hasPrefix:@"group-"];

    if (v12)
    {
      v13 = [(KCSharingOutgoingEntry *)self record];
      id v14 = [v6 recordIsFullyDecoded:v13];

      v15 = [KCSharingEntryContents alloc];
      v16 = [(KCSharingOutgoingEntry *)self record];
      v17 = [(KCSharingEntryContents *)v15 initWithContents:v16 fullyDecoded:v14];

      goto LABEL_11;
    }
    id v18 = a4;
    uint64_t v19 = 7;
    goto LABEL_9;
  }
LABEL_10:
  v17 = 0;
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
      v17 = [v16 zoneID];
      v10 = sub_10004695C(v17);

      if (v10)
      {
        id v18 = [KCSharingPBRemoteItem alloc];
        uint64_t v19 = [(CKRecord *)self->_record encryptedValues];
        v20 = [v19 objectForKeyedSubscript:@"payload"];
        id v14 = [(KCSharingPBRemoteItem *)v18 initWithData:v20];

        if (v14)
        {
          id v15 = [[KCSharingRemoteItem alloc] initPasswordWithProto:v14 sharingGroup:v10 error:a4];
LABEL_9:
          v21 = v15;
          if (v15)
          {
            v22 = [(KCSharingOutgoingEntry *)self record];
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
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingOutgoingEntry.m" lineNumber:154 description:@"Can't get Internet password fingerprint for outgoing queue entry of type %ld" , self->_type];
  }
  internetPasswordFingerprint = self->_internetPasswordFingerprint;

  return internetPasswordFingerprint;
}

- (KCSharingLocalFingerprint)privateKeyFingerprint
{
  if (self->_type != 1)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"KCSharingOutgoingEntry.m" lineNumber:149 description:@"Can't get private key fingerprint for outgoing queue entry of type %ld" , self->_type];
  }
  privateKeyFingerprint = self->_privateKeyFingerprint;

  return privateKeyFingerprint;
}

- (KCSharingOutgoingEntry)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)KCSharingOutgoingEntry;
  int64_t v7 = [(KCSharingOutgoingEntry *)&v40 init];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"deln"];
    if (_NSIsNSNumber() && [v8 BOOLValue])
    {
      sub_100046FBC(a4, 8, 0);
LABEL_19:

      id v38 = 0;
      goto LABEL_20;
    }
    v9 = [KCSharingPBLocalEntryData alloc];
    v10 = [v6 objectForKeyedSubscript:kSecValueData];
    v11 = [(KCSharingPBLocalEntryData *)v9 initWithData:v10];

    if (!v11)
    {
      sub_100046FBC(a4, 3, 0);
LABEL_18:

      goto LABEL_19;
    }
    unsigned __int8 v12 = [v6 objectForKeyedSubscript:@"type"];
    v7->_int64_t type = (int64_t)[v12 longLongValue];

    uint64_t v13 = [v6 objectForKeyedSubscript:kSecAttrModificationDate];
    modificationDate = v7->_modificationDate;
    v7->_modificationDate = (NSDate *)v13;

    switch(v7->_type)
    {
      case 0:
        uint64_t v15 = objc_opt_class();
        v16 = [(KCSharingPBLocalEntryData *)v11 cloudKitRecord];
        uint64_t v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v15 fromData:v16 error:a4];
        record = v7->_record;
        v7->_record = (CKRecord *)v17;

        goto LABEL_15;
      case 1:
        uint64_t v19 = objc_opt_class();
        v20 = [(KCSharingPBLocalEntryData *)v11 cloudKitRecord];
        uint64_t v21 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v19 fromData:v20 error:a4];
        v22 = v7->_record;
        v7->_record = (CKRecord *)v21;

        if (!v7->_record) {
          goto LABEL_18;
        }
        id v23 = [KCSharingLocalFingerprint alloc];
        id v24 = [v6 objectForKeyedSubscript:@"pkkp"];
        uint64_t v25 = [v6 objectForKeyedSubscript:@"pkvp"];
        v26 = [(KCSharingLocalFingerprint *)v23 initWithKeyprint:v24 valueprint:v25];
        uint64_t v27 = 24;
        goto LABEL_13;
      case 2:
        uint64_t v28 = objc_opt_class();
        v29 = [(KCSharingPBLocalEntryData *)v11 cloudKitRecord];
        uint64_t v30 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v28 fromData:v29 error:a4];
        v31 = v7->_record;
        v7->_record = (CKRecord *)v30;

        if (!v7->_record) {
          goto LABEL_18;
        }
        v32 = [KCSharingLocalFingerprint alloc];
        id v24 = [v6 objectForKeyedSubscript:@"ipkp"];
        uint64_t v25 = [v6 objectForKeyedSubscript:@"ipvp"];
        v26 = [(KCSharingLocalFingerprint *)v32 initWithKeyprint:v24 valueprint:v25];
        uint64_t v27 = 32;
LABEL_13:
        v33 = *(Class *)((char *)&v7->super.super.isa + v27);
        *(Class *)((char *)&v7->super.super.isa + v27) = (Class)v26;

        goto LABEL_16;
      case 3:
        v34 = +[NSSet setWithObject:objc_opt_class()];
        v35 = [(KCSharingPBLocalEntryData *)v11 cloudKitRecord];
        uint64_t v36 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v34 fromData:v35 error:a4];
        v37 = v7->_record;
        v7->_record = (CKRecord *)v36;

LABEL_15:
        if (v7->_record) {
          goto LABEL_16;
        }
        goto LABEL_18;
      default:
LABEL_16:

        break;
    }
  }
  id v38 = v7;
LABEL_20:

  return v38;
}

- (KCSharingOutgoingEntry)initWithShare:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingOutgoingEntry;
  id v6 = [(KCSharingOutgoingEntry *)&v11 init];
  int64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_record, a3);
    v8 = [v5 modificationDate];
    v9 = v8;
    if (!v8)
    {
      v9 = +[NSDate date];
    }
    objc_storeStrong((id *)&v7->_modificationDate, v9);
    if (!v8) {

    }
    v7->_int64_t type = 3;
  }

  return v7;
}

- (KCSharingOutgoingEntry)initWithUpdatedLocalItem:(id)a3 forMirrorEntry:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)KCSharingOutgoingEntry;
  v10 = [(KCSharingOutgoingEntry *)&v30 init];
  if (!v10) {
    goto LABEL_10;
  }
  objc_super v11 = [[KCSharingRemoteItem alloc] initWithLocalItem:v8];
  unsigned __int8 v12 = [v9 record];
  uint64_t v13 = (CKRecord *)[v12 copy];
  record = v10->_record;
  v10->_record = v13;

  uint64_t v15 = [KCSharingPBRemoteItem alloc];
  v16 = [(CKRecord *)v10->_record encryptedValues];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"payload"];
  id v18 = [(KCSharingPBRemoteItem *)v15 initWithData:v17];

  if (v18)
  {
    uint64_t v19 = [(KCSharingRemoteItem *)v11 proto];
    [(KCSharingPBRemoteItem *)v18 mergeFrom:v19];
    v20 = [(KCSharingPBRemoteItem *)v18 data];
    uint64_t v21 = [(CKRecord *)v10->_record encryptedValues];
    [v21 setObject:v20 forKeyedSubscript:@"payload"];

    uint64_t v22 = [v8 modificationDate];
    modificationDate = v10->_modificationDate;
    v10->_modificationDate = (NSDate *)v22;

    id v24 = [v8 type];
    if (v24 == (id)2)
    {
      v10->_int64_t type = 2;
      uint64_t v25 = [v8 internetPasswordFingerprint];
      uint64_t v26 = 32;
    }
    else
    {
      if (v24 != (id)1)
      {
LABEL_9:

LABEL_10:
        uint64_t v27 = v10;
        goto LABEL_11;
      }
      v10->_int64_t type = 1;
      uint64_t v25 = [v8 privateKeyFingerprint];
      uint64_t v26 = 24;
    }
    uint64_t v28 = *(Class *)((char *)&v10->super.super.isa + v26);
    *(Class *)((char *)&v10->super.super.isa + v26) = (Class)v25;

    goto LABEL_9;
  }
  sub_100046FBC(a5, 4, 0);

  uint64_t v27 = 0;
LABEL_11:

  return v27;
}

- (KCSharingOutgoingEntry)initWithNewLocalItem:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)KCSharingOutgoingEntry;
  id v8 = [(KCSharingOutgoingEntry *)&v29 init];
  if (v8)
  {
    id v9 = [[KCSharingRemoteItem alloc] initWithLocalItem:v6];
    v10 = +[NSUUID UUID];
    objc_super v11 = [v10 UUIDString];
    unsigned __int8 v12 = +[NSString stringWithFormat:@"%@-%@", @"item", v11];

    id v13 = objc_alloc((Class)CKRecord);
    id v14 = [objc_alloc((Class)CKRecordID) initWithRecordName:v12 zoneID:v7];
    uint64_t v15 = (CKRecord *)[v13 initWithRecordType:@"item" recordID:v14];
    record = v8->_record;
    v8->_record = v15;

    uint64_t v17 = [(KCSharingRemoteItem *)v9 proto];
    id v18 = [v17 data];
    uint64_t v19 = [(CKRecord *)v8->_record encryptedValues];
    [v19 setObject:v18 forKeyedSubscript:@"payload"];

    uint64_t v20 = [v6 modificationDate];
    modificationDate = v8->_modificationDate;
    v8->_modificationDate = (NSDate *)v20;

    id v22 = [v6 type];
    if (v22 == (id)2)
    {
      v8->_int64_t type = 2;
      uint64_t v26 = [(CKRecord *)v8->_record encryptedValues];
      [v26 setObject:&off_100326758 forKeyedSubscript:@"type"];

      uint64_t v24 = [v6 internetPasswordFingerprint];
      uint64_t v25 = 32;
    }
    else
    {
      if (v22 != (id)1)
      {
LABEL_7:

        goto LABEL_8;
      }
      v8->_int64_t type = 1;
      id v23 = [(CKRecord *)v8->_record encryptedValues];
      [v23 setObject:&off_100326740 forKeyedSubscript:@"type"];

      uint64_t v24 = [v6 privateKeyFingerprint];
      uint64_t v25 = 24;
    }
    uint64_t v27 = *(Class *)((char *)&v8->super.super.isa + v25);
    *(Class *)((char *)&v8->super.super.isa + v25) = (Class)v24;

    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

@end