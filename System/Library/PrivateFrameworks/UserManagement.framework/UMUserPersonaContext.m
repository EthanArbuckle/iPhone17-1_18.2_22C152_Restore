@interface UMUserPersonaContext
+ (id)currentPersonaContext;
- (UMUserPersonaContext)init;
- (id)copyPersonaContext:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)contextAdopt;
@end

@implementation UMUserPersonaContext

- (void).cxx_destruct
{
}

- (void)contextAdopt
{
  voucher = self->_voucher;
  if (voucher)
  {
    v4 = voucher;

    v5 = self->_voucher;
    self->_voucher = 0;
  }
  else
  {
    v5 = (void *)voucher_adopt();
  }
}

- (UMUserPersonaContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)UMUserPersonaContext;
  v2 = [(UMUserPersonaContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = voucher_copy();
    voucher = v2->_voucher;
    v2->_voucher = (OS_voucher *)v3;
  }
  return v2;
}

+ (id)currentPersonaContext
{
  v2 = objc_opt_new();
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)copyPersonaContext:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 0;
}

@end