@interface REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs)initWithCoder:(id)a3;
- (REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs)initWithFetchOption:(int64_t)a3;
- (id)name;
- (int64_t)fetchOption;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs)initWithFetchOption:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs;
  result = [(REMStoreInvocationValueStorage *)&v5 init];
  if (result) {
    result->_fetchOption = a3;
  }
  return result;
}

- (REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"fetchOption"];

  return [(REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs *)self initWithFetchOption:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs fetchOption](self, "fetchOption"), @"fetchOption");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [(REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs *)self fetchOption];
    BOOL v6 = v5 == [v4 fetchOption];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)name
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs;
  id v4 = [(REMStoreInvocation *)&v8 name];
  int64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs fetchOption](self, "fetchOption"));
  BOOL v6 = [v3 stringWithFormat:@"%@(fetchOption=%@)", v4, v5];

  return v6;
}

- (int64_t)fetchOption
{
  return self->_fetchOption;
}

@end