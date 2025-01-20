@interface KCSharingIncomingDeletion
- (CKRecordID)recordID;
- (KCSharingIncomingDeletion)initWithAttributes:(id)a3 error:(id *)a4;
- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4;
- (id)initForDeletedRecordWithRecordID:(id)a3;
@end

@implementation KCSharingIncomingDeletion

- (void).cxx_destruct
{
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  v17[0] = kSecAttrUUID;
  recordID = self->_recordID;
  id v6 = a3;
  v7 = [(CKRecordID *)recordID recordName];
  v18[0] = v7;
  v17[1] = @"zone";
  v8 = [(KCSharingIncomingDeletion *)self recordID];
  v9 = [v8 zoneID];
  v10 = [v9 zoneName];
  v18[1] = v10;
  v17[2] = @"ownr";
  v11 = [(KCSharingIncomingDeletion *)self recordID];
  v12 = [v11 zoneID];
  v13 = [v12 ownerName];
  v18[2] = v13;
  v18[3] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  v17[3] = kSecAttrAccessible;
  v17[4] = @"type";
  v18[4] = &off_100325630;
  v17[5] = kSecAttrAccessGroup;
  v14 = [v6 entryAccessGroup];

  v17[6] = @"deln";
  v18[5] = v14;
  v18[6] = &__kCFBooleanTrue;
  v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:7];

  return v15;
}

- (KCSharingIncomingDeletion)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"deln"];
  if (v7)
  {
    if _NSIsNSNumber() && ([v7 BOOLValue])
    {
      uint64_t v8 = kSecAttrUUID;
      id v9 = [v6 objectForKeyedSubscript:kSecAttrUUID];
      if (v9)
      {
        if (_NSIsNSString() && [v9 length])
        {
          id v10 = [v6 objectForKeyedSubscript:@"zone"];
          if (v10)
          {
            if (_NSIsNSString() && [v10 length])
            {
              uint64_t v11 = [v6 objectForKeyedSubscript:@"ownr"];
              if (!v11)
              {
                CFStringRef v29 = @"KCSharingMissingAttribute";
                CFStringRef v30 = @"ownr";
                v24 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
                sub_100046FBC(a4, 22, (uint64_t)v24);

                id v12 = 0;
                goto LABEL_25;
              }
              id v12 = (id)v11;
              if (_NSIsNSString() && [v12 length])
              {
                id v13 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v10 ownerName:v12];
                id v14 = [objc_alloc((Class)CKRecordID) initWithRecordName:v9 zoneID:v13];
                self = (KCSharingIncomingDeletion *)[(KCSharingIncomingDeletion *)self initForDeletedRecordWithRecordID:v14];

                v15 = self;
LABEL_26:

                goto LABEL_21;
              }
              CFStringRef v27 = @"KCSharingInvalidAttribute";
              id v21 = [v12 copy:@"ownr"];
              id v26 = v21;
              v22 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
              v28 = v22;
              v23 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
              sub_100046FBC(a4, 1, (uint64_t)v23);
            }
            else
            {
              CFStringRef v33 = @"KCSharingInvalidAttribute";
              CFStringRef v31 = @"zone";
              id v12 = [v10 copy];
              id v32 = v12;
              id v21 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
              id v34 = v21;
              v22 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
              sub_100046FBC(a4, 1, (uint64_t)v22);
            }
          }
          else
          {
            CFStringRef v35 = @"KCSharingMissingAttribute";
            CFStringRef v36 = @"zone";
            id v12 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
            sub_100046FBC(a4, 22, (uint64_t)v12);
          }
LABEL_25:
          v15 = 0;
          goto LABEL_26;
        }
        CFStringRef v39 = @"KCSharingInvalidAttribute";
        uint64_t v37 = v8;
        id v10 = [v9 copy];
        id v38 = v10;
        v19 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        v40 = v19;
        v20 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        sub_100046FBC(a4, 1, (uint64_t)v20);
      }
      else
      {
        CFStringRef v41 = @"KCSharingMissingAttribute";
        uint64_t v42 = v8;
        id v10 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        sub_100046FBC(a4, 22, (uint64_t)v10);
      }
      v15 = 0;
LABEL_21:

      goto LABEL_17;
    }
    CFStringRef v45 = @"KCSharingInvalidAttribute";
    CFStringRef v43 = @"deln";
    id v9 = [v7 copy];
    id v44 = v9;
    v16 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v46 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v17);
  }
  else
  {
    CFStringRef v47 = @"KCSharingMissingAttribute";
    CFStringRef v48 = @"deln";
    id v9 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v9);
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (id)initForDeletedRecordWithRecordID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingIncomingDeletion;
  id v6 = [(KCSharingIncomingDeletion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recordID, a3);
  }

  return v7;
}

@end