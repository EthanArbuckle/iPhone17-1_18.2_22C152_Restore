@interface KCSharingOutgoingDeletion
- (BOOL)setRecordIDAndChangeTagFromData:(id)a3 error:(id *)a4;
- (CKRecordID)recordID;
- (KCSharingOutgoingDeletion)initWithAttributes:(id)a3 error:(id *)a4;
- (KCSharingOutgoingDeletion)initWithDeletedLocalItemForMirrorEntry:(id)a3;
- (KCSharingOutgoingDeletion)initWithDeletedRecord:(id)a3;
- (KCSharingOutgoingDeletion)initWithPlaceholderOutgoingDatabaseItem:(SecDbItem *)a3 error:(id *)a4;
- (NSString)recordChangeTag;
- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4;
- (id)serializeRecordIDAndChangeTag;
@end

@implementation KCSharingOutgoingDeletion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordChangeTag, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

- (NSString)recordChangeTag
{
  return self->_recordChangeTag;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  v18[0] = kSecAttrUUID;
  recordID = self->_recordID;
  id v6 = a3;
  v7 = [(CKRecordID *)recordID recordName];
  v19[0] = v7;
  v18[1] = kSecValueData;
  v8 = [(KCSharingOutgoingDeletion *)self serializeRecordIDAndChangeTag];
  v19[1] = v8;
  v18[2] = @"zone";
  v9 = [(KCSharingOutgoingDeletion *)self recordID];
  v10 = [v9 zoneID];
  v11 = [v10 zoneName];
  v19[2] = v11;
  v18[3] = @"ownr";
  v12 = [(KCSharingOutgoingDeletion *)self recordID];
  v13 = [v12 zoneID];
  v14 = [v13 ownerName];
  v19[3] = v14;
  v19[4] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  v18[4] = kSecAttrAccessible;
  v18[5] = @"type";
  v19[5] = &off_100325618;
  v18[6] = kSecAttrAccessGroup;
  v15 = [v6 entryAccessGroup];

  v18[7] = @"deln";
  v19[6] = v15;
  v19[7] = &__kCFBooleanTrue;
  v16 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:8];

  return v16;
}

- (BOOL)setRecordIDAndChangeTagFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v8 = +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:v7 objectsOfClass:objc_opt_class() fromData:v6 error:a4];

  if (!v8)
  {
    id v20 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:26 userInfo:0];
LABEL_11:
    BOOL v19 = 0;
    goto LABEL_14;
  }
  v9 = [v8 objectForKeyedSubscript:@"recordID"];

  if (!v9)
  {
    CFStringRef v30 = @"KCSharingMissingAttribute";
    CFStringRef v31 = @"recordID";
    v21 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v21);
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v10 = objc_opt_class();
  v11 = [v8 objectForKeyedSubscript:@"recordID"];
  v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v10 fromData:v11 error:a4];
  recordID = self->_recordID;
  self->_recordID = v12;

  if (!self->_recordID)
  {
    CFStringRef v28 = @"KCSharingInvalidAttribute";
    v21 = [v8 objectForKeyedSubscript:@"recordID"];
    v29 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v22);

    goto LABEL_10;
  }
  v14 = [v8 objectForKeyedSubscript:@"changeTag"];
  if (!v14) {
    goto LABEL_6;
  }
  id v15 = objc_alloc((Class)NSString);
  v16 = [v8 objectForKeyedSubscript:@"changeTag"];
  v17 = (NSString *)[v15 initWithData:v16 encoding:4];
  recordChangeTag = self->_recordChangeTag;
  self->_recordChangeTag = v17;

  if (!self->_recordChangeTag)
  {
    CFStringRef v26 = @"KCSharingInvalidAttribute";
    v23 = [v8 objectForKeyedSubscript:@"changeTag"];
    v27 = v23;
    v24 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v24);

    BOOL v19 = 0;
  }
  else
  {
LABEL_6:
    BOOL v19 = 1;
  }

LABEL_14:
  return v19;
}

- (id)serializeRecordIDAndChangeTag
{
  CFStringRef v9 = @"recordID";
  v3 = +[NSKeyedArchiver archivedDataWithRootObject:self->_recordID];
  uint64_t v10 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v5 = [v4 mutableCopy];

  id v6 = [(NSString *)self->_recordChangeTag dataUsingEncoding:4];
  [v5 setObject:v6 forKeyedSubscript:@"changeTag"];

  uint64_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v5];

  return v7;
}

- (KCSharingOutgoingDeletion)initWithPlaceholderOutgoingDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  v17.receiver = self;
  v17.super_class = (Class)KCSharingOutgoingDeletion;
  id v6 = [(KCSharingOutgoingDeletion *)&v17 init];
  if (!v6) {
    goto LABEL_5;
  }
  CFStringRef v20 = kSecValueData;
  uint64_t v7 = +[NSArray arrayWithObjects:&v20 count:1];
  CFSetRef v8 = +[NSSet setWithArray:v7];

  CFStringRef v9 = sub_100155CF8(a3, v8, a4);
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_7;
  }
  v11 = [v9 objectForKeyedSubscript:kSecValueData];

  if (!v11)
  {
    CFStringRef v18 = @"KCSharingMissingAttribute";
    CFStringRef v19 = kSecValueData;
    id v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v15);

LABEL_7:
    goto LABEL_8;
  }
  v12 = [v10 objectForKeyedSubscript:kSecValueData];
  unsigned int v13 = [(KCSharingOutgoingDeletion *)v6 setRecordIDAndChangeTagFromData:v12 error:a4];

  if (!v13)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
LABEL_5:
  v14 = v6;
LABEL_9:

  return v14;
}

- (KCSharingOutgoingDeletion)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)KCSharingOutgoingDeletion;
  uint64_t v7 = [(KCSharingOutgoingDeletion *)&v24 init];
  if (!v7) {
    goto LABEL_15;
  }
  CFSetRef v8 = [v6 objectForKeyedSubscript:@"deln"];
  if (!v8)
  {
    CFStringRef v47 = @"KCSharingMissingAttribute";
    CFStringRef v48 = @"deln";
    id v10 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v10);
    goto LABEL_21;
  }
  if (!_NSIsNSNumber() || ([v8 BOOLValue] & 1) == 0)
  {
    CFStringRef v45 = @"KCSharingInvalidAttribute";
    CFStringRef v43 = @"deln";
    id v10 = [v8 copy];
    id v44 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v46 = v11;
    id v13 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    objc_super v17 = a4;
    uint64_t v18 = 1;
LABEL_17:
    sub_100046FBC(v17, v18, (uint64_t)v13);
LABEL_18:

LABEL_19:
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v9 = kSecAttrUUID;
  id v10 = [v6 objectForKeyedSubscript:kSecAttrUUID];
  if (!v10)
  {
    CFStringRef v41 = @"KCSharingMissingAttribute";
    uint64_t v42 = v9;
    id v11 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v11);
    goto LABEL_19;
  }
  if (!_NSIsNSString() || ![v10 length])
  {
    CFStringRef v39 = @"KCSharingInvalidAttribute";
    uint64_t v37 = v9;
    id v11 = [v10 copy];
    id v38 = v11;
    id v13 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v40 = v13;
    id v20 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v20);
LABEL_25:

    goto LABEL_18;
  }
  id v11 = [v6 objectForKeyedSubscript:@"zone"];
  if (!v11)
  {
    CFStringRef v35 = @"KCSharingMissingAttribute";
    CFStringRef v36 = @"zone";
    id v13 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    objc_super v17 = a4;
    uint64_t v18 = 22;
    goto LABEL_17;
  }
  if (!_NSIsNSString() || ![v11 length])
  {
    CFStringRef v33 = @"KCSharingInvalidAttribute";
    CFStringRef v31 = @"zone";
    id v13 = [v11 copy];
    id v32 = v13;
    id v20 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v34 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v21);
LABEL_28:

    goto LABEL_25;
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"ownr"];
  if (!v12)
  {
    CFStringRef v29 = @"KCSharingMissingAttribute";
    CFStringRef v30 = @"ownr";
    v23 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v23);

    id v13 = 0;
    goto LABEL_18;
  }
  id v13 = (id)v12;
  if (!_NSIsNSString() || ![v13 length])
  {
    CFStringRef v27 = @"KCSharingInvalidAttribute";
    CFStringRef v25 = @"ownr";
    id v20 = [v13 copy];
    id v26 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    CFStringRef v28 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v22);

    goto LABEL_28;
  }
  v14 = [v6 objectForKeyedSubscript:kSecValueData];
  unsigned __int8 v15 = [(KCSharingOutgoingDeletion *)v7 setRecordIDAndChangeTagFromData:v14 error:a4];

  if ((v15 & 1) == 0)
  {
LABEL_22:
    v16 = 0;
    goto LABEL_23;
  }
LABEL_15:
  v16 = v7;
LABEL_23:

  return v16;
}

- (KCSharingOutgoingDeletion)initWithDeletedRecord:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingOutgoingDeletion;
  id v5 = [(KCSharingOutgoingDeletion *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 recordID];
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v6;

    uint64_t v8 = [v4 recordChangeTag];
    recordChangeTag = v5->_recordChangeTag;
    v5->_recordChangeTag = (NSString *)v8;
  }
  return v5;
}

- (KCSharingOutgoingDeletion)initWithDeletedLocalItemForMirrorEntry:(id)a3
{
  id v4 = [a3 record];
  id v5 = [(KCSharingOutgoingDeletion *)self initWithDeletedRecord:v4];

  return v5;
}

@end