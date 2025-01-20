@interface REMFetchResult
+ (BOOL)supportsSecureCoding;
- (NSArray)fetchedAccountStorages;
- (NSArray)fetchedListStorages;
- (NSArray)fetchedReminderStorages;
- (NSArray)requestedObjectIDs;
- (REMFetchMetadata)metadata;
- (REMFetchResult)initWithAccountStorages:(id)a3;
- (REMFetchResult)initWithAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 requestedObjectIDs:(id)a6 metadata:(id)a7;
- (REMFetchResult)initWithCoder:(id)a3;
- (REMFetchResult)initWithCount:(int64_t)a3;
- (REMFetchResult)initWithListStorages:(id)a3;
- (REMFetchResult)initWithMetadata:(id)a3;
- (REMFetchResult)initWithReminderStorages:(id)a3;
- (REMFetchResult)initWithRequestedObjectIDs:(id)a3;
- (REMFetchResult)initWithType:(int64_t)a3;
- (REMFetchResultToken)fetchResultToken;
- (id)description;
- (int64_t)count;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setFetchResultToken:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation REMFetchResult

- (REMFetchResult)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMFetchResult;
  result = [(REMFetchResult *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (REMFetchResult)initWithCount:(int64_t)a3
{
  result = [(REMFetchResult *)self initWithType:2];
  if (result) {
    result->_count = a3;
  }
  return result;
}

- (REMFetchResult)initWithAccountStorages:(id)a3 listStorages:(id)a4 reminderStorages:(id)a5 requestedObjectIDs:(id)a6 metadata:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(REMFetchResult *)self initWithType:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fetchedAccountStorages, a3);
    objc_storeStrong((id *)&v18->_fetchedListStorages, a4);
    objc_storeStrong((id *)&v18->_fetchedReminderStorages, a5);
    objc_storeStrong((id *)&v18->_requestedObjectIDs, a6);
    objc_storeStrong((id *)&v18->_metadata, a7);
  }

  return v18;
}

- (REMFetchResult)initWithAccountStorages:(id)a3
{
  id v5 = a3;
  v6 = [(REMFetchResult *)self initWithType:1];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fetchedAccountStorages, a3);
  }

  return v7;
}

- (REMFetchResult)initWithListStorages:(id)a3
{
  id v5 = a3;
  v6 = [(REMFetchResult *)self initWithType:1];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fetchedListStorages, a3);
  }

  return v7;
}

- (REMFetchResult)initWithReminderStorages:(id)a3
{
  id v5 = a3;
  v6 = [(REMFetchResult *)self initWithType:1];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fetchedReminderStorages, a3);
  }

  return v7;
}

- (REMFetchResult)initWithRequestedObjectIDs:(id)a3
{
  id v5 = a3;
  v6 = [(REMFetchResult *)self initWithType:3];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestedObjectIDs, a3);
  }

  return v7;
}

- (REMFetchResult)initWithMetadata:(id)a3
{
  id v5 = a3;
  v6 = [(REMFetchResult *)self initWithType:4];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metadata, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFetchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  if (v5 >= 5)
  {
    v6 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[REMFetchResult initWithCoder:](v5, v6);
    }

    unint64_t v5 = 0;
  }
  v7 = [(REMFetchResult *)self initWithType:v5];
  if (v7)
  {
    v7->_count = [v4 decodeIntegerForKey:@"count"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"fetchedAccountStorages"];
    fetchedAccountStorages = v7->_fetchedAccountStorages;
    v7->_fetchedAccountStorages = (NSArray *)v11;

    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"fetchedListStorages"];
    fetchedListStorages = v7->_fetchedListStorages;
    v7->_fetchedListStorages = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    id v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"fetchedReminderStorages"];
    fetchedReminderStorages = v7->_fetchedReminderStorages;
    v7->_fetchedReminderStorages = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"requestedObjectIDs"];
    requestedObjectIDs = v7->_requestedObjectIDs;
    v7->_requestedObjectIDs = (NSArray *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fetchResultToken"];
    fetchResultToken = v7->_fetchResultToken;
    v7->_fetchResultToken = (REMFetchResultToken *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    metadata = v7->_metadata;
    v7->_metadata = (REMFetchMetadata *)v30;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFetchResult type](self, "type"), @"type");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFetchResult count](self, "count"), @"count");
  unint64_t v5 = [(REMFetchResult *)self fetchedAccountStorages];
  [v4 encodeObject:v5 forKey:@"fetchedAccountStorages"];

  v6 = [(REMFetchResult *)self fetchedListStorages];
  [v4 encodeObject:v6 forKey:@"fetchedListStorages"];

  v7 = [(REMFetchResult *)self fetchedReminderStorages];
  [v4 encodeObject:v7 forKey:@"fetchedReminderStorages"];

  v8 = [(REMFetchResult *)self requestedObjectIDs];
  [v4 encodeObject:v8 forKey:@"requestedObjectIDs"];

  uint64_t v9 = [(REMFetchResult *)self fetchResultToken];
  [v4 encodeObject:v9 forKey:@"fetchResultToken"];

  id v10 = [(REMFetchResult *)self metadata];
  [v4 encodeObject:v10 forKey:@"metadata"];
}

- (id)description
{
  switch([(REMFetchResult *)self type])
  {
    case 0:
    case 1:
      v3 = NSString;
      id v4 = [(REMFetchResult *)self fetchedAccountStorages];
      uint64_t v5 = [v4 count];
      v6 = [(REMFetchResult *)self fetchedListStorages];
      uint64_t v7 = [v6 count];
      v8 = [(REMFetchResult *)self fetchedReminderStorages];
      uint64_t v9 = [v8 count];
      id v10 = [(REMFetchResult *)self requestedObjectIDs];
      objc_msgSend(v3, "stringWithFormat:", @"[a:%ld,l:%ld,r:%ld,ids:%ld]", v5, v7, v9, objc_msgSend(v10, "count"));
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    case 2:
      objc_msgSend(NSString, "stringWithFormat:", @"count: %ld", -[REMFetchResult count](self, "count"));
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      v12 = NSString;
      id v4 = [(REMFetchResult *)self requestedObjectIDs];
      objc_msgSend(v12, "stringWithFormat:", @"objectIDs.count: %ld", objc_msgSend(v4, "count"));
      goto LABEL_7;
    case 4:
      id v13 = NSString;
      id v4 = [(REMFetchResult *)self metadata];
      [v13 stringWithFormat:@"metadata: %@", v4];
LABEL_7:
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      break;
    default:
      uint64_t v11 = &stru_1F1339A18;
      break;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = [(REMFetchResult *)self fetchResultToken];

  if (v15)
  {
    uint64_t v16 = NSString;
    v17 = [(REMFetchResult *)self fetchResultToken];
    v18 = [v16 stringWithFormat:@"fetchResultToken: %@", v17];

    [v14 addObject:v18];
  }
  else
  {
    v18 = &stru_1F1339A18;
  }
  uint64_t v19 = [v14 componentsJoinedByString:@", "];
  if ([v19 length])
  {
    uint64_t v20 = objc_msgSend(@", ", "stringByAppendingString:", v19);

    uint64_t v19 = (void *)v20;
  }
  uint64_t v21 = NSString;
  uint64_t v22 = objc_opt_class();
  v23 = NSStringFromREMFetchRequestType([(REMFetchResult *)self type]);
  uint64_t v24 = [v21 stringWithFormat:@"<%@: %p type: %@%@%@>", v22, self, v23, v11, v19];

  return v24;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (NSArray)requestedObjectIDs
{
  return self->_requestedObjectIDs;
}

- (NSArray)fetchedAccountStorages
{
  return self->_fetchedAccountStorages;
}

- (NSArray)fetchedListStorages
{
  return self->_fetchedListStorages;
}

- (NSArray)fetchedReminderStorages
{
  return self->_fetchedReminderStorages;
}

- (REMFetchMetadata)metadata
{
  return self->_metadata;
}

- (REMFetchResultToken)fetchResultToken
{
  return self->_fetchResultToken;
}

- (void)setFetchResultToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResultToken, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fetchedReminderStorages, 0);
  objc_storeStrong((id *)&self->_fetchedListStorages, 0);
  objc_storeStrong((id *)&self->_fetchedAccountStorages, 0);

  objc_storeStrong((id *)&self->_requestedObjectIDs, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMFetchRequestType %ld", (uint8_t *)&v2, 0xCu);
}

@end