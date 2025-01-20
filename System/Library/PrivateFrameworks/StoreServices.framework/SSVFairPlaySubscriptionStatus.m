@interface SSVFairPlaySubscriptionStatus
- (BOOL)hasSubscriptionLease;
- (BOOL)hasSubscriptionSlot;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SSVFairPlaySubscriptionStatus)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (unint64_t)hash;
- (void)setHasSubscriptionLease:(BOOL)a3;
- (void)setHasSubscriptionSlot:(BOOL)a3;
@end

@implementation SSVFairPlaySubscriptionStatus

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  v7 = @"true";
  if (self->_hasSubscriptionLease) {
    v8 = @"true";
  }
  else {
    v8 = @"false";
  }
  if (!self->_hasSubscriptionSlot) {
    v7 = @"false";
  }
  v9 = [v3 stringWithFormat:@"<%@ %p hasSubscriptionLease:%@ hasSubscriptionSlot:%@>", v5, self, v8, v7];

  return (NSString *)v9;
}

- (unint64_t)hash
{
  return self->_hasSubscriptionSlot ^ self->_hasSubscriptionLease ^ 0xF07;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SSVFairPlaySubscriptionStatus *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_hasSubscriptionSlot == v4->_hasSubscriptionSlot
      && self->_hasSubscriptionLease == v4->_hasSubscriptionLease;
  }

  return v5;
}

- (SSVFairPlaySubscriptionStatus)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVFairPlaySubscriptionStatus;
    v6 = [(SSVFairPlaySubscriptionStatus *)&v8 init];
    if (v6)
    {
      v6->_hasSubscriptionLease = xpc_dictionary_get_BOOL(v5, "0");
      v6->_hasSubscriptionSlot = xpc_dictionary_get_BOOL(v5, "1");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "0", self->_hasSubscriptionLease);
  xpc_dictionary_set_BOOL(v3, "1", self->_hasSubscriptionSlot);
  return v3;
}

- (BOOL)hasSubscriptionLease
{
  return self->_hasSubscriptionLease;
}

- (void)setHasSubscriptionLease:(BOOL)a3
{
  self->_hasSubscriptionLease = a3;
}

- (BOOL)hasSubscriptionSlot
{
  return self->_hasSubscriptionSlot;
}

- (void)setHasSubscriptionSlot:(BOOL)a3
{
  self->_hasSubscriptionSlot = a3;
}

@end