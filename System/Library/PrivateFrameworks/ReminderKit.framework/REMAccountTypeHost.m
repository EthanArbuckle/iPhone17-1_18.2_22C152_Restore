@interface REMAccountTypeHost
- (BOOL)isCalDav;
- (BOOL)isCloudBased;
- (BOOL)isCloudKit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExchange;
- (BOOL)isLocal;
- (BOOL)isLocalInternal;
- (BOOL)isNonPrimaryCloudKit;
- (BOOL)isPrimaryCloudKit;
- (BOOL)isValid;
- (REMAccountTypeHost)initWithType:(int64_t)a3;
- (REMObjectID)accountObjectID;
- (id)description;
- (id)internalDescription;
- (int64_t)type;
@end

@implementation REMAccountTypeHost

- (BOOL)isLocal
{
  return [(REMAccountTypeHost *)self type] == 1;
}

- (BOOL)isCloudKit
{
  if ([(REMAccountTypeHost *)self isPrimaryCloudKit]) {
    return 1;
  }

  return [(REMAccountTypeHost *)self isNonPrimaryCloudKit];
}

- (BOOL)isPrimaryCloudKit
{
  return [(REMAccountTypeHost *)self type] == 2;
}

- (int64_t)type
{
  return self->_type;
}

- (REMAccountTypeHost)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMAccountTypeHost;
  result = [(REMAccountTypeHost *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (BOOL)isNonPrimaryCloudKit
{
  return [(REMAccountTypeHost *)self type] == 6;
}

- (void).cxx_destruct
{
}

- (BOOL)isCloudBased
{
  int64_t v2 = [(REMAccountTypeHost *)self type];

  return +[REMAccount isCloudBasedAccountType:v2];
}

- (BOOL)isCalDav
{
  return [(REMAccountTypeHost *)self type] == 3;
}

- (BOOL)isExchange
{
  return [(REMAccountTypeHost *)self type] == 4;
}

- (BOOL)isLocalInternal
{
  return [(REMAccountTypeHost *)self type] == 5;
}

- (BOOL)isValid
{
  return [(REMAccountTypeHost *)self type] >= 1 && [(REMAccountTypeHost *)self type] < 7;
}

- (id)description
{
  uint64_t v2 = [(REMAccountTypeHost *)self type];

  return NSStringFromREMAccountType(v2);
}

- (id)internalDescription
{
  uint64_t v2 = [(REMAccountTypeHost *)self type];

  return REMInternalDescriptionFromREMAccountType(v2);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMAccountTypeHost *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(REMAccountTypeHost *)self type];
      BOOL v6 = v5 == [(REMAccountTypeHost *)v4 type];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (REMObjectID)accountObjectID
{
  return self->_accountObjectID;
}

@end