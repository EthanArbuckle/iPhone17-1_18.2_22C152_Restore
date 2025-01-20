@interface REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit
+ (BOOL)supportsSecureCoding;
- (BOOL)debug_useInMemoryPreferredDefaultListStorage;
- (BOOL)isEqual:(id)a3;
- (REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit)initWithAccountObjectID:(id)a3 debugUseInMemoryPreferredDefaultListStorage:(BOOL)a4;
- (REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit)initWithCoder:(id)a3;
- (REMObjectID)accountObjectID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDebug_useInMemoryPreferredDefaultListStorage:(BOOL)a3;
@end

@implementation REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit)initWithAccountObjectID:(id)a3 debugUseInMemoryPreferredDefaultListStorage:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit;
  v8 = [(REMStoreInvocationValueStorage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountObjectID, a3);
    v9->_debug_useInMemoryPreferredDefaultListStorage = a4;
  }

  return v9;
}

- (REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountObjectID"];
  uint64_t v6 = [v4 decodeBoolForKey:@"debug_useInMemoryPreferredDefaultListStorage"];

  id v7 = [(REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *)self initWithAccountObjectID:v5 debugUseInMemoryPreferredDefaultListStorage:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *)self accountObjectID];
  [v5 encodeObject:v4 forKey:@"accountObjectID"];

  objc_msgSend(v5, "encodeBool:forKey:", -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit debug_useInMemoryPreferredDefaultListStorage](self, "debug_useInMemoryPreferredDefaultListStorage"), @"debug_useInMemoryPreferredDefaultListStorage");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *)self accountObjectID];
    uint64_t v7 = [v5 accountObjectID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *)self accountObjectID];
      v10 = [v5 accountObjectID];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        LOBYTE(v12) = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    BOOL v13 = [(REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *)self debug_useInMemoryPreferredDefaultListStorage];
    int v12 = v13 ^ objc_msgSend(v5, "debug_useInMemoryPreferredDefaultListStorage") ^ 1;
    goto LABEL_8;
  }
  LOBYTE(v12) = 0;
LABEL_9:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *)self accountObjectID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4
     + [(REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *)self debug_useInMemoryPreferredDefaultListStorage];

  return v5;
}

- (REMObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (BOOL)debug_useInMemoryPreferredDefaultListStorage
{
  return self->_debug_useInMemoryPreferredDefaultListStorage;
}

- (void)setDebug_useInMemoryPreferredDefaultListStorage:(BOOL)a3
{
  self->_debug_useInMemoryPreferredDefaultListStorage = a3;
}

- (void).cxx_destruct
{
}

@end