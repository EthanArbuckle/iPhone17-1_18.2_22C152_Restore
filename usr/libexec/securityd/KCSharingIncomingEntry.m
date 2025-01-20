@interface KCSharingIncomingEntry
- (CKRecord)record;
- (KCSharingIncomingEntry)initWithAttributes:(id)a3 error:(id *)a4;
- (KCSharingIncomingEntry)initWithFetchedRecord:(id)a3;
- (NSDate)modificationDate;
- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4;
- (id)remoteItemWithAccessGroups:(id)a3 error:(id *)a4;
- (id)shareWithAccessGroups:(id)a3 error:(id *)a4;
- (int64_t)type;
@end

@implementation KCSharingIncomingEntry

- (void).cxx_destruct
{
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
  if (v7)
  {
    v18 = objc_opt_new();
    [v18 setCloudKitRecord:v7];
    v25[0] = kSecAttrUUID;
    v24 = [(CKRecord *)self->_record recordID];
    v23 = [v24 recordName];
    v26[0] = v23;
    v25[1] = @"zone";
    v22 = [(KCSharingIncomingEntry *)self record];
    v21 = [v22 recordID];
    v20 = [v21 zoneID];
    v19 = [v20 zoneName];
    v26[1] = v19;
    v25[2] = @"ownr";
    v8 = [(KCSharingIncomingEntry *)self record];
    v9 = [v8 recordID];
    v10 = [v9 zoneID];
    v11 = [v10 ownerName];
    v26[2] = v11;
    v26[3] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
    v25[3] = kSecAttrAccessible;
    v25[4] = @"type";
    v12 = +[NSNumber numberWithLongLong:self->_type];
    v26[4] = v12;
    v25[5] = kSecAttrAccessGroup;
    v13 = [v6 entryAccessGroup];
    v26[5] = v13;
    v26[6] = &__kCFBooleanFalse;
    v25[6] = @"deln";
    v25[7] = kSecValueData;
    [v18 data];
    v15 = id v14 = v6;
    v26[7] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:8];

    id v6 = v14;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)shareWithAccessGroups:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(KCSharingIncomingEntry *)self type];
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
    v17 = [[KCSharingEntryContents alloc] initWithContents:0 fullyDecoded:0];
    goto LABEL_11;
  }
  if (v7 == 3)
  {
    v8 = [(KCSharingIncomingEntry *)self record];
    v9 = [v8 recordID];
    v10 = [v9 zoneID];
    v11 = [v10 zoneName];
    unsigned __int8 v12 = [v11 hasPrefix:@"group-"];

    if (v12)
    {
      v13 = [(KCSharingIncomingEntry *)self record];
      id v14 = [v6 recordIsFullyDecoded:v13];

      v15 = [KCSharingEntryContents alloc];
      v16 = [(KCSharingIncomingEntry *)self record];
      v17 = [(KCSharingEntryContents *)v15 initWithContents:v16 fullyDecoded:v14];

      goto LABEL_11;
    }
    v18 = a4;
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
        v18 = [KCSharingPBRemoteItem alloc];
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
            v22 = [(KCSharingIncomingEntry *)self record];
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

- (NSDate)modificationDate
{
  v2 = [(CKRecord *)self->_record modificationDate];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[NSDate date];
  }
  v5 = v4;

  return (NSDate *)v5;
}

- (KCSharingIncomingEntry)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)KCSharingIncomingEntry;
  int64_t v7 = [(KCSharingIncomingEntry *)&v24 init];
  if (!v7) {
    goto LABEL_13;
  }
  v8 = [v6 objectForKeyedSubscript:@"deln"];
  if (_NSIsNSNumber() && [v8 BOOLValue])
  {
    sub_100046FBC(a4, 8, 0);
LABEL_15:

    v22 = 0;
    goto LABEL_16;
  }
  v9 = [KCSharingPBLocalEntryData alloc];
  v10 = [v6 objectForKeyedSubscript:kSecValueData];
  v11 = [(KCSharingPBLocalEntryData *)v9 initWithData:v10];

  if (!v11)
  {
    sub_100046FBC(a4, 3, 0);
    goto LABEL_14;
  }
  unsigned __int8 v12 = [v6 objectForKeyedSubscript:@"type"];
  v7->_unint64_t type = (int64_t)[v12 longLongValue];

  unint64_t type = v7->_type;
  if (type < 3)
  {
    uint64_t v14 = objc_opt_class();
    id v15 = [(KCSharingPBLocalEntryData *)v11 cloudKitRecord];
    uint64_t v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v14 fromData:v15 error:a4];
    record = v7->_record;
    v7->_record = (CKRecord *)v16;

    goto LABEL_11;
  }
  if (type == 3)
  {
    v18 = +[NSSet setWithObject:objc_opt_class()];
    uint64_t v19 = [(KCSharingPBLocalEntryData *)v11 cloudKitRecord];
    uint64_t v20 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v18 fromData:v19 error:a4];
    v21 = v7->_record;
    v7->_record = (CKRecord *)v20;

LABEL_11:
    if (v7->_record) {
      goto LABEL_12;
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_12:

LABEL_13:
  v22 = v7;
LABEL_16:

  return v22;
}

- (KCSharingIncomingEntry)initWithFetchedRecord:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KCSharingIncomingEntry;
  id v6 = [(KCSharingIncomingEntry *)&v15 init];
  if (v6)
  {
    int64_t v7 = [v5 recordType];
    unsigned int v8 = [v7 isEqual:CKRecordTypeShare];

    if (v8)
    {
      v6->_unint64_t type = 3;
LABEL_13:
      objc_storeStrong((id *)&v6->_record, a3);
      goto LABEL_14;
    }
    v9 = [v5 recordType];
    unsigned int v10 = [v9 isEqual:@"item"];

    if (!v10)
    {
      v6->_unint64_t type = 0;
      goto LABEL_13;
    }
    v11 = [v5 encryptedValues];
    unsigned __int8 v12 = [v11 objectForKeyedSubscript:@"type"];

    if ([v12 isEqual:&off_100325B10])
    {
      uint64_t v13 = 1;
    }
    else
    {
      if (![v12 isEqual:&off_100325B28])
      {
        v6->_unint64_t type = 0;
        goto LABEL_12;
      }
      uint64_t v13 = 2;
    }
    v6->_unint64_t type = v13;
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

@end