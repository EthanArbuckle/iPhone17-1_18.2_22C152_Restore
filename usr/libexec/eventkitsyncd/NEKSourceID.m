@interface NEKSourceID
+ (id)accountForStore:(id)a3 identifier:(id)a4;
+ (id)eventSourceForDatabase:(id)a3 identifier:(id)a4;
- (BOOL)isEqualToNEKSourceID:(id)a3;
- (BOOL)isLocalStore;
- (NEKSourceID)initWithAccount:(id)a3;
- (NEKSourceID)initWithPersistentID:(id)a3 isLocalStore:(BOOL)a4;
- (NEKSourceID)initWithSource:(id)a3;
- (id)description;
- (id)persistentID;
@end

@implementation NEKSourceID

- (NEKSourceID)initWithAccount:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 store];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 eks_localAccount];
      v9 = [v8 objectID];
      v10 = [v5 objectID];
      if (v8 && ([v9 isEqual:v10] & 1) != 0)
      {
        id v11 = 0;
        uint64_t v12 = 1;
      }
      else
      {
        v14 = [v10 uuid];
        v15 = [v14 UUIDString];
        id v11 = [v15 copy];

        uint64_t v12 = 0;
      }
    }
    else
    {
      id v11 = 0;
      uint64_t v12 = 0;
    }
    self = [(NEKSourceID *)self initWithPersistentID:v11 isLocalStore:v12];

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)accountForStore:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isLocalStore])
  {
    v7 = [v5 eks_localAccount];
  }
  else
  {
    v8 = [v6 persistentID];
    id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
    if (!v9)
    {
      v10 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_10006C434((uint64_t)v8, v10);
      }
    }
    id v11 = +[REMAccount objectIDWithUUID:v9];
    id v15 = 0;
    v7 = [v5 fetchAccountWithObjectID:v11 error:&v15];
    id v12 = v15;
    if (v12)
    {
      v13 = *(NSObject **)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10006C3BC((uint64_t)v8, v13);
      }
    }
  }

  return v7;
}

- (NEKSourceID)initWithSource:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 eventStore];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 localSource];
      id v9 = [v8 sourceIdentifier];
      v10 = [v5 sourceIdentifier];
      if (v8 && ([v9 isEqualToString:v10] & 1) != 0)
      {
        id v11 = 0;
        uint64_t v12 = 1;
      }
      else
      {
        id v11 = [v10 copy];
        uint64_t v12 = 0;
      }
    }
    else
    {
      id v11 = 0;
      uint64_t v12 = 0;
    }
    self = [(NEKSourceID *)self initWithPersistentID:v11 isLocalStore:v12];

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)eventSourceForDatabase:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isLocalStore])
  {
    v7 = [v5 localSource];
  }
  else
  {
    v8 = [v6 persistentID];
    v7 = [v5 sourceWithIdentifier:v8];
  }

  return v7;
}

- (NEKSourceID)initWithPersistentID:(id)a3 isLocalStore:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEKSourceID;
  v7 = [(NEKSourceID *)&v11 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    persistentID = v7->_persistentID;
    v7->_persistentID = v8;

    v7->_isLocalStore = a4;
  }

  return v7;
}

- (id)persistentID
{
  return self->_persistentID;
}

- (BOOL)isLocalStore
{
  return self->_isLocalStore;
}

- (id)description
{
  if ([(NEKSourceID *)self isLocalStore])
  {
    v3 = @"Local store";
  }
  else
  {
    v3 = +[NSString stringWithFormat:@"persistentID: %@", self->_persistentID];
  }
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = +[NSString stringWithFormat:@"<%@ %p; %@>", v5, self, v3];

  return v6;
}

- (BOOL)isEqualToNEKSourceID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (-[NEKSourceID isLocalStore](self, "isLocalStore") && ([v4 isLocalStore] & 1) != 0)
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      id v6 = [v4 persistentID];
      v7 = [(NEKSourceID *)self persistentID];
      unsigned __int8 v5 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end