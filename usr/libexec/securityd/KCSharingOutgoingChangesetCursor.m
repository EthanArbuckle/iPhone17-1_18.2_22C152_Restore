@interface KCSharingOutgoingChangesetCursor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (KCSharingOutgoingChangesetCursor)initWithCoder:(id)a3;
- (KCSharingOutgoingChangesetCursor)initWithDatabaseScope:(int64_t)a3;
- (KCSharingOutgoingChangesetCursor)initWithDatabaseScope:(int64_t)a3 desiredZoneIDs:(id)a4;
- (KCSharingOutgoingChangesetCursor)initWithDatabaseScope:(int64_t)a3 keyset:(id)a4 fetchBehavior:(int64_t)a5;
- (NSDictionary)keyset;
- (id)copyWithDesiredZoneIDs:(id)a3;
- (id)description;
- (int64_t)databaseScope;
- (int64_t)fetchBehavior;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingOutgoingChangesetCursor

- (void).cxx_destruct
{
}

- (int64_t)fetchBehavior
{
  return self->_fetchBehavior;
}

- (NSDictionary)keyset
{
  return self->_keyset;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithInteger:[(KCSharingOutgoingChangesetCursor *)self databaseScope]];
  [v4 encodeObject:v5 forKey:@"dbScope"];

  v6 = [(KCSharingOutgoingChangesetCursor *)self keyset];
  [v4 encodeObject:v6 forKey:@"keyset"];

  id v7 = +[NSNumber numberWithInteger:[(KCSharingOutgoingChangesetCursor *)self fetchBehavior]];
  [v4 encodeObject:v7 forKey:@"fetchBehavior"];
}

- (KCSharingOutgoingChangesetCursor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dbScope"];
  int v6 = [v5 intValue];

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"keyset"];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fetchBehavior"];

  int v12 = [v11 intValue];
  if (v10 && v6 >= 1 && v6 <= 3 && v12 >= 1 && v12 < 3)
  {
    self = [(KCSharingOutgoingChangesetCursor *)self initWithDatabaseScope:v6 keyset:v10 fetchBehavior:v12];
    v13 = self;
  }
  else
  {
    v14 = KCSharingLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Cursor failed to decode properly", buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)KCSharingOutgoingChangesetCursor;
  v3 = [(KCSharingOutgoingChangesetCursor *)&v8 description];
  [(KCSharingOutgoingChangesetCursor *)self databaseScope];
  id v4 = CKDatabaseScopeString();
  v5 = [(KCSharingOutgoingChangesetCursor *)self keyset];
  int v6 = +[NSString stringWithFormat:@"(%@, scope: %@, keyset: %@, fetchBehavior: %ld)", v3, v4, v5, [(KCSharingOutgoingChangesetCursor *)self fetchBehavior]];

  return v6;
}

- (id)copyWithDesiredZoneIDs:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    int v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v22 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v13 = [(KCSharingOutgoingChangesetCursor *)self keyset];
          uint64_t v14 = [v13 objectForKeyedSubscript:v12];
          v15 = (void *)v14;
          if (v14) {
            CFStringRef v16 = (const __CFString *)v14;
          }
          else {
            CFStringRef v16 = &stru_10030AA90;
          }
          [v6 setObject:v16 forKeyedSubscript:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    id v17 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseScope:[self databaseScope] keyset:v6 fetchBehavior:2];
    v5 = v22;
  }
  else
  {
    id v18 = objc_alloc((Class)objc_opt_class());
    int64_t v19 = [(KCSharingOutgoingChangesetCursor *)self databaseScope];
    v20 = [(KCSharingOutgoingChangesetCursor *)self keyset];
    id v17 = [v18 initWithDatabaseScope:v19 keyset:v20 fetchBehavior:1];
  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KCSharingOutgoingChangesetCursor *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else if ([(KCSharingOutgoingChangesetCursor *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    id v6 = [(KCSharingOutgoingChangesetCursor *)self databaseScope];
    if (v6 == (id)[(KCSharingOutgoingChangesetCursor *)v5 databaseScope])
    {
      id v7 = [(KCSharingOutgoingChangesetCursor *)self keyset];
      id v8 = [(KCSharingOutgoingChangesetCursor *)v5 keyset];
      if ([v7 isEqualToDictionary:v8])
      {
        id v9 = [(KCSharingOutgoingChangesetCursor *)self fetchBehavior];
        BOOL v10 = v9 == (id)[(KCSharingOutgoingChangesetCursor *)v5 fetchBehavior];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(KCSharingOutgoingChangesetCursor *)self databaseScope];
  id v4 = [(KCSharingOutgoingChangesetCursor *)self keyset];
  v5 = (char *)[v4 hash] + 32 * v3 - v3;

  return (unsigned char *)[(KCSharingOutgoingChangesetCursor *)self fetchBehavior] - v5 + 32 * (void)v5;
}

- (KCSharingOutgoingChangesetCursor)initWithDatabaseScope:(int64_t)a3 keyset:(id)a4 fetchBehavior:(int64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KCSharingOutgoingChangesetCursor;
  id v9 = [(KCSharingOutgoingChangesetCursor *)&v14 init];
  BOOL v10 = v9;
  if (v9)
  {
    v9->_databaseScope = a3;
    v11 = (NSDictionary *)[v8 copy];
    keyset = v10->_keyset;
    v10->_keyset = v11;

    v10->_fetchBehavior = a5;
  }

  return v10;
}

- (KCSharingOutgoingChangesetCursor)initWithDatabaseScope:(int64_t)a3 desiredZoneIDs:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = +[NSMutableDictionary dictionary];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 setObject:&stru_10030AA90 forKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    v13 = [(KCSharingOutgoingChangesetCursor *)self initWithDatabaseScope:a3 keyset:v7 fetchBehavior:2];
  }
  else
  {
    v13 = [(KCSharingOutgoingChangesetCursor *)self initWithDatabaseScope:a3 keyset:&__NSDictionary0__struct fetchBehavior:1];
  }

  return v13;
}

- (KCSharingOutgoingChangesetCursor)initWithDatabaseScope:(int64_t)a3
{
  return [(KCSharingOutgoingChangesetCursor *)self initWithDatabaseScope:a3 desiredZoneIDs:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end