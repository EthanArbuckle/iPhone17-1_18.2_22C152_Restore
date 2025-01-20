@interface RestorationMailboxEncoder
+ (id)encoderWithLog:(id)a3;
- (OS_os_log)log;
- (RestorationMailboxEncoder)initWithLog:(id)a3;
- (id)encodeMailbox:(id)a3;
- (void)_encodeGenericMailbox:(id)a3 coder:(id)a4;
- (void)_encodeSmartMailbox:(id)a3 coder:(id)a4;
- (void)_encodeUnifiedMailbox:(id)a3 coder:(id)a4;
- (void)setLog:(id)a3;
@end

@implementation RestorationMailboxEncoder

+ (id)encoderWithLog:(id)a3
{
  id v3 = a3;
  v4 = [[RestorationMailboxEncoder alloc] initWithLog:v3];

  return v4;
}

- (RestorationMailboxEncoder)initWithLog:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RestorationMailboxEncoder;
  v4 = [(RestorationMailboxEncoder *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_log = (OS_os_log *)a3;
    }
    else
    {
      sub_10020FF58();
      v6 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
      v5->_log = v6;
    }
  }
  return v5;
}

- (id)encodeMailbox:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(RestorationMailboxEncoder *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [v4 ef_publicDescription];
      int v15 = 138543362;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RestorationMailboxEncoder: Encoding mailbox: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    if (([v4 isSmartMailbox] & 1) != 0
      || ([v4 objectID],
          objc_super v8 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v9 = [v8 isEphemeral],
          v8,
          (v9 & 1) != 0))
    {
      if ([v4 isSmartMailbox])
      {
        id v10 = v4;
        if ([v10 smartMailboxType] == (id)8) {
          [(RestorationMailboxEncoder *)self _encodeUnifiedMailbox:v10 coder:v7];
        }
        else {
          [(RestorationMailboxEncoder *)self _encodeSmartMailbox:v10 coder:v7];
        }
      }
    }
    else
    {
      [(RestorationMailboxEncoder *)self _encodeGenericMailbox:v4 coder:v7];
    }
    v12 = [v7 encodedData];
    if ([v12 length])
    {
      id v11 = v12;
    }
    else
    {
      v13 = [(RestorationMailboxEncoder *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10045DB60();
      }

      id v11 = 0;
    }
  }
  else
  {
    v7 = [(RestorationMailboxEncoder *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10045DB20();
    }
    id v11 = 0;
  }

  return v11;
}

- (void)_encodeGenericMailbox:(id)a3 coder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(RestorationMailboxEncoder *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    [v6 ef_publicDescription];
    objc_claimAutoreleasedReturnValue();
    sub_10045DBA0();
  }

  [v7 encodeInteger:1 forKey:@"SerializationType"];
  unsigned __int8 v9 = [v6 objectID];
  [v7 encodeObject:v9 forKey:@"ObjectID"];
}

- (void)_encodeSmartMailbox:(id)a3 coder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(RestorationMailboxEncoder *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    [v6 ef_publicDescription];
    objc_claimAutoreleasedReturnValue();
    sub_10045DC3C();
  }

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  unsigned __int8 v9 = +[SharedMailboxController allSharedInstances];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_1002105C4;
  int v15 = &unk_10060DD30;
  id v10 = v6;
  id v16 = v10;
  v17 = &v18;
  [v9 enumerateObjectsUsingBlock:&v12];

  if (v19[3] && (_MSSourceTypeIsValid() & 1) != 0)
  {
    [v7 encodeInteger:2 forKey:@"SerializationType" v12, v13, v14, v15];
    id v11 = +[NSNumber numberWithUnsignedInteger:v19[3]];
    [v7 encodeObject:v11 forKey:@"SmartMailboxSourceType"];
  }
  else
  {
    id v11 = [(RestorationMailboxEncoder *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [v10 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045DBE4();
    }
  }

  _Block_object_dispose(&v18, 8);
}

- (void)_encodeUnifiedMailbox:(id)a3 coder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(RestorationMailboxEncoder *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    [v6 ef_publicDescription];
    objc_claimAutoreleasedReturnValue();
    sub_10045DC80();
  }

  [v7 encodeInteger:3 forKey:@"SerializationType"];
  [v7 encodeInteger:[v6 type] forKey:@"UnifiedMailboxType"];
  unsigned __int8 v9 = [v6 name];
  [v7 encodeObject:v9 forKey:@"UnifiedMailboxName"];
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  self->_log = (OS_os_log *)a3;
}

@end