@interface KCSharingAccessGroups
- (BOOL)isEqual:(id)a3;
- (BOOL)recordHasKnownFields:(id)a3;
- (BOOL)recordIsFullyDecoded:(id)a3;
- (BOOL)recordTypeIsKnown:(id)a3;
- (BOOL)remoteItemProtoIsFullyDecoded:(id)a3;
- (KCSharingAccessGroups)init;
- (KCSharingAccessGroups)initWithEntryAccessGroup:(id)a3;
- (KCSharingAccessGroups)initWithEntryAccessGroup:(id)a3 entrySchemaVersion:(int64_t)a4;
- (NSString)entryAccessGroup;
- (int64_t)entrySchemaVersion;
- (unint64_t)hash;
@end

@implementation KCSharingAccessGroups

- (NSString)entryAccessGroup
{
  return self->_entryAccessGroup;
}

- (void).cxx_destruct
{
}

- (int64_t)entrySchemaVersion
{
  return self->_entrySchemaVersion;
}

- (BOOL)remoteItemProtoIsFullyDecoded:(id)a3
{
  id v4 = a3;
  if ([(KCSharingAccessGroups *)self entrySchemaVersion] < 1)
  {
    BOOL v6 = 0;
  }
  else
  {
    v5 = [v4 unknownFields];
    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      v7 = [v4 privateKey];
      v8 = [v7 unknownFields];
      if (v8)
      {
        BOOL v6 = 0;
      }
      else
      {
        v9 = [v4 internetPassword];
        v10 = [v9 unknownFields];
        BOOL v6 = v10 == 0;
      }
    }
  }
  return v6;
}

- (BOOL)recordIsFullyDecoded:(id)a3
{
  id v4 = a3;
  v5 = [v4 recordType];
  if ([(KCSharingAccessGroups *)self recordTypeIsKnown:v5]) {
    BOOL v6 = [(KCSharingAccessGroups *)self recordHasKnownFields:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)recordHasKnownFields:(id)a3
{
  id v4 = a3;
  v5 = [v4 allKeys];
  BOOL v6 = +[NSMutableSet setWithArray:v5];

  if ([(KCSharingAccessGroups *)self entrySchemaVersion] >= 1)
  {
    if (qword_10035D228 != -1) {
      dispatch_once(&qword_10035D228, &stru_100305AD0);
    }
    v7 = [v4 recordType];
    unsigned int v8 = [v7 isEqual:@"item"];

    if (v8)
    {
      [v6 minusSet:qword_10035D220];
    }
    else
    {
      v9 = [v4 recordType];
      unsigned int v10 = [v9 isEqual:CKRecordTypeShare];

      if (v10) {
        [v6 removeObject:@"displayName"];
      }
    }
  }
  BOOL v11 = [v6 count] == 0;

  return v11;
}

- (BOOL)recordTypeIsKnown:(id)a3
{
  id v4 = a3;
  if ([(KCSharingAccessGroups *)self entrySchemaVersion] < 1)
  {
    unsigned __int8 v5 = 0;
  }
  else if ([v4 isEqual:@"item"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v4 isEqual:CKRecordTypeShare];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KCSharingAccessGroups *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if ([(KCSharingAccessGroups *)v4 isMemberOfClass:objc_opt_class()])
  {
    unsigned __int8 v5 = v4;
    BOOL v6 = [(KCSharingAccessGroups *)self entryAccessGroup];
    v7 = [(KCSharingAccessGroups *)v5 entryAccessGroup];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(KCSharingAccessGroups *)self entrySchemaVersion];
      BOOL v9 = v8 == (id)[(KCSharingAccessGroups *)v5 entrySchemaVersion];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(KCSharingAccessGroups *)self entryAccessGroup];
  id v4 = [v3 hash];

  return (unsigned char *)[(KCSharingAccessGroups *)self entrySchemaVersion]
       - (unsigned char *)v4
       + 32 * (void)v4;
}

- (KCSharingAccessGroups)initWithEntryAccessGroup:(id)a3 entrySchemaVersion:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingAccessGroups;
  v7 = [(KCSharingAccessGroups *)&v11 init];
  if (v7)
  {
    id v8 = (NSString *)[v6 copy];
    entryAccessGroup = v7->_entryAccessGroup;
    v7->_entryAccessGroup = v8;

    v7->_entrySchemaVersion = a4;
  }

  return v7;
}

- (KCSharingAccessGroups)initWithEntryAccessGroup:(id)a3
{
  return [(KCSharingAccessGroups *)self initWithEntryAccessGroup:a3 entrySchemaVersion:3];
}

- (KCSharingAccessGroups)init
{
  return [(KCSharingAccessGroups *)self initWithEntryAccessGroup:@"com.apple.security.securityd"];
}

@end