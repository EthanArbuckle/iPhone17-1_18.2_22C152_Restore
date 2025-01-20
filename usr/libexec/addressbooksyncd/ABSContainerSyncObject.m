@interface ABSContainerSyncObject
+ (id)_getContainer;
+ (int64_t)currentGuardianRestriction;
+ (void)applyChange:(id)a3;
- (NSString)containerIdentifier;
- (id)createProtobufWithOptions:(id)a3;
- (id)objectIdentifier;
- (id)sequencer;
- (int64_t)changeType;
- (void)setContainerIdentifier:(id)a3;
@end

@implementation ABSContainerSyncObject

+ (int64_t)currentGuardianRestriction
{
  v2 = [a1 _getContainer];
  v3 = v2;
  if (v2)
  {
    if ([v2 isGuardianRestricted]) {
      int64_t v4 = 1;
    }
    else {
      int64_t v4 = 2;
    }
  }
  else
  {
    int64_t v4 = 3;
  }

  return v4;
}

+ (id)_getContainer
{
  v2 = +[ABSAccountsManager primaryiCloudCardDAVAccountIdentifier];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10002EA0C;
  v13 = sub_10002EA1C;
  id v14 = 0;
  if (v2)
  {
    v3 = +[ABSContactsInterface sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002EA24;
    v6[3] = &unk_1000555D8;
    id v7 = v2;
    v8 = &v9;
    [v3 accessSync:v6];

    id v4 = (id)v10[5];
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)objectIdentifier
{
  return @"None";
}

- (id)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 2;
}

- (id)createProtobufWithOptions:(id)a3
{
  v3 = [[ABSPBSyncObject alloc] initWithMemo:@"Container"];
  id v4 = objc_alloc_init(ABSPBContainerAttributes);
  [(ABSPBSyncObject *)v3 setContainerSyncObject:v4];

  v5 = [(id)objc_opt_class() _getContainer];
  v6 = [v5 accountIdentifier];
  id v7 = [(ABSPBSyncObject *)v3 containerSyncObject];
  [v7 setAccountExternalIdentifier:v6];

  id v8 = [v5 isGuardianRestricted];
  uint64_t v9 = [(ABSPBSyncObject *)v3 containerSyncObject];
  [v9 setGuardianRestricted:v8];

  id v10 = [v5 type];
  uint64_t v11 = [(ABSPBSyncObject *)v3 containerSyncObject];
  [v11 setType:v10];

  v12 = [v5 name];
  v13 = [(ABSPBSyncObject *)v3 containerSyncObject];
  [v13 setName:v12];

  id v14 = [(ABSPBSyncObject *)v3 data];

  return v14;
}

+ (void)applyChange:(id)a3
{
  v3 = [a3 containerSyncObject];
  id v4 = +[ABSContactsInterface sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F05C;
  v6[3] = &unk_100055148;
  id v7 = v3;
  id v5 = v3;
  [v4 mutateSync:v6];
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end