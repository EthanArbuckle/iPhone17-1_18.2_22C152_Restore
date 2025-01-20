@interface REMNSPersistentHistoryToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSPersistentHistoryToken)token;
- (REMNSPersistentHistoryToken)initWithCoder:(id)a3;
- (REMNSPersistentHistoryToken)initWithPersistentHistoryToken:(id)a3;
- (id)description;
- (int64_t)compareToken:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMNSPersistentHistoryToken

- (REMNSPersistentHistoryToken)initWithPersistentHistoryToken:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)REMNSPersistentHistoryToken;
    v6 = [(REMNSPersistentHistoryToken *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_token, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  v2 = NSString;
  v3 = [(REMNSPersistentHistoryToken *)self token];
  v4 = [v2 stringWithFormat:@"REM_WRAP(%@)", v3];

  return v4;
}

- (int64_t)compareToken:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(REMNSPersistentHistoryToken *)self token];
    v8 = [v6 token];
    int64_t v9 = [v7 compareToken:v8 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:0];
    int64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMNSPersistentHistoryToken *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(REMNSPersistentHistoryToken *)self token];
      id v6 = [(REMNSPersistentHistoryToken *)v4 token];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (REMNSPersistentHistoryToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];

  id v6 = [(REMNSPersistentHistoryToken *)self initWithPersistentHistoryToken:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMNSPersistentHistoryToken *)self token];
  [v4 encodeObject:v5 forKey:@"token"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersistentHistoryToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
}

@end