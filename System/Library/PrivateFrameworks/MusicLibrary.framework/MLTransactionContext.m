@interface MLTransactionContext
+ (BOOL)supportsSecureCoding;
- (ML3DatabasePrivacyContext)privacyContext;
- (MLTransactionContext)initWithCoder:(id)a3;
- (MLTransactionContext)initWithPrivacyContext:(id)a3 path:(id)a4 priorityLevel:(unint64_t)a5 options:(unint64_t)a6;
- (NSString)path;
- (unint64_t)options;
- (unint64_t)priorityLevel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLTransactionContext

- (MLTransactionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLTransactionContext;
  v5 = [(MLTransactionContext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MLTransactionContextPathKey"];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v5->_priorityLevel = [v4 decodeIntegerForKey:@"MLTransactionContextPriorityLevelKey"];
    v5->_options = [v4 decodeIntegerForKey:@"MLTransactionContextOptionsKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MLTransactionContextPrivacyContextKey"];
    privacyContext = v5->_privacyContext;
    v5->_privacyContext = (ML3DatabasePrivacyContext *)v8;
  }
  return v5;
}

- (ML3DatabasePrivacyContext)privacyContext
{
  return self->_privacyContext;
}

- (unint64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (NSString)path
{
  return self->_path;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)encodeWithCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"MLTransactionContextPathKey"];
  [v5 encodeInteger:self->_priorityLevel forKey:@"MLTransactionContextPriorityLevelKey"];
  [v5 encodeInteger:self->_options forKey:@"MLTransactionContextOptionsKey"];
  [v5 encodeObject:self->_privacyContext forKey:@"MLTransactionContextPrivacyContextKey"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyContext, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (MLTransactionContext)initWithPrivacyContext:(id)a3 path:(id)a4 priorityLevel:(unint64_t)a5 options:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MLTransactionContext;
  v13 = [(MLTransactionContext *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_privacyContext, a3);
    uint64_t v15 = [v12 copy];
    path = v14->_path;
    v14->_path = (NSString *)v15;

    v14->_priorityLevel = a5;
    v14->_options = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end