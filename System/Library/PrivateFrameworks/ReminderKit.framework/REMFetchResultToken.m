@interface REMFetchResultToken
+ (BOOL)supportsSecureCoding;
+ (id)fetchResultTokenFromDataRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)persistentHistoryTokens;
- (REMFetchResultToken)initWithCoder:(id)a3;
- (REMFetchResultToken)initWithPersistentHistoryTokens:(id)a3;
- (id)dataRepresentationWithError:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMFetchResultToken

- (REMFetchResultToken)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"persistentHistoryTokens"];

  v10 = [(REMFetchResultToken *)self initWithPersistentHistoryTokens:v9];
  return v10;
}

- (REMFetchResultToken)initWithPersistentHistoryTokens:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFetchResultToken;
  id v5 = [(REMFetchResultToken *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    persistentHistoryTokens = v5->_persistentHistoryTokens;
    v5->_persistentHistoryTokens = (NSDictionary *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMFetchResultToken *)self persistentHistoryTokens];
  [v4 encodeObject:v5 forKey:@"persistentHistoryTokens"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMFetchResultToken *)self persistentHistoryTokens];
    uint64_t v6 = [v4 persistentHistoryTokens];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      uint64_t v7 = v5;
    }
    else
    {
      uint64_t v7 = (void *)v6;
      v8 = [(REMFetchResultToken *)self persistentHistoryTokens];
      objc_super v9 = [v4 persistentHistoryTokens];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSDictionary)persistentHistoryTokens
{
  return self->_persistentHistoryTokens;
}

+ (id)fetchResultTokenFromDataRepresentation:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  uint64_t v7 = [v5 unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];

  return v7;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

- (unint64_t)hash
{
  v2 = [(REMFetchResultToken *)self persistentHistoryTokens];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(REMFetchResultToken *)self persistentHistoryTokens];
  id v6 = [v3 stringWithFormat:@"<%@: %p persistentHistoryTokens: %@> ", v4, self, v5];

  return v6;
}

@end