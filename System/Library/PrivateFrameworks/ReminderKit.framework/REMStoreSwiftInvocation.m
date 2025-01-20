@interface REMStoreSwiftInvocation
+ (BOOL)supportsSecureCoding;
- (NSString)name;
- (REMFetchResultToken)fetchResultTokenToDiffAgainst;
- (REMStoreSwiftInvocation)init;
- (REMStoreSwiftInvocation)initWithCoder:(id)a3;
- (REMStoreSwiftInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMStoreSwiftInvocation

- (REMStoreSwiftInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMStoreSwiftInvocation;
  v6 = [(REMStoreSwiftInvocation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fetchResultTokenToDiffAgainst, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (REMStoreSwiftInvocation)init
{
  return [(REMStoreSwiftInvocation *)self initWithFetchResultTokenToDiffAgainst:0];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMStoreSwiftInvocation *)self fetchResultTokenToDiffAgainst];
  [v4 encodeObject:v5 forKey:@"fetchResultTokenToDiffAgainst"];
}

- (REMFetchResultToken)fetchResultTokenToDiffAgainst
{
  return self->_fetchResultTokenToDiffAgainst;
}

- (REMStoreSwiftInvocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fetchResultTokenToDiffAgainst"];

  v6 = [(REMStoreSwiftInvocation *)self initWithFetchResultTokenToDiffAgainst:v5];
  return v6;
}

- (NSString)name
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end