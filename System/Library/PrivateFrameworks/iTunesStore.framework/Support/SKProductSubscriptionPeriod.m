@interface SKProductSubscriptionPeriod
- (NSUInteger)numberOfUnits;
- (SKProductPeriodUnit)unit;
- (SKProductSubscriptionPeriod)init;
- (SKProductSubscriptionPeriod)initWithISO8601String:(id)a3;
- (SKProductSubscriptionPeriod)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)_setNumberOfUnits:(unint64_t)a3;
- (void)_setUnit:(unint64_t)a3;
@end

@implementation SKProductSubscriptionPeriod

- (NSUInteger)numberOfUnits
{
  return *((void *)self->_internal + 1);
}

- (SKProductPeriodUnit)unit
{
  return *((void *)self->_internal + 2);
}

- (void)_setNumberOfUnits:(unint64_t)a3
{
  *((void *)self->_internal + 1) = a3;
}

- (void)_setUnit:(unint64_t)a3
{
  *((void *)self->_internal + 2) = a3;
}

- (SKProductSubscriptionPeriod)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKProductSubscriptionPeriod;
  v2 = [(SKProductSubscriptionPeriod *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKProductSubscriptionPeriodInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (SKProductSubscriptionPeriod)initWithISO8601String:(id)a3
{
  id v4 = a3;
  v5 = [(SKProductSubscriptionPeriod *)self init];
  if (!v5) {
    goto LABEL_16;
  }
  objc_super v6 = +[NSScanner scannerWithString:v4];
  id v17 = 0;
  [v6 scanString:@"P" intoString:&v17];
  id v7 = v17;
  if (!v7)
  {
LABEL_18:

    v13 = 0;
    goto LABEL_19;
  }
  v8 = v7;
  uint64_t v16 = 0;
  [v6 scanInteger:&v16];
  if (!v16)
  {

    goto LABEL_18;
  }
  *((void *)v5->_internal + 1) = v16;

  v9 = +[NSCharacterSet characterSetWithCharactersInString:@"DWMY"];
  id v15 = 0;
  [v6 scanCharactersFromSet:v9 intoString:&v15];
  id v10 = v15;
  v11 = v10;
  if (!v10 || [v10 length] != (id)1)
  {
LABEL_17:

    goto LABEL_18;
  }
  if (([v11 isEqualToString:@"D"] & 1) == 0)
  {
    if ([v11 isEqualToString:@"W"])
    {
      uint64_t v12 = 1;
      goto LABEL_15;
    }
    if ([v11 isEqualToString:@"M"])
    {
      uint64_t v12 = 2;
      goto LABEL_15;
    }
    if ([v11 isEqualToString:@"Y"])
    {
      uint64_t v12 = 3;
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  uint64_t v12 = 0;
LABEL_15:
  *((void *)v5->_internal + 2) = v12;

LABEL_16:
  v13 = v5;
LABEL_19:

  return v13;
}

- (SKProductSubscriptionPeriod)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    objc_super v6 = [(SKProductSubscriptionPeriod *)self init];
    if (v6)
    {
      *((void *)v6->_internal + 1) = xpc_dictionary_get_uint64(v5, "0");
      *((void *)v6->_internal + 2) = xpc_dictionary_get_uint64(v5, "1");
    }
  }
  else
  {

    objc_super v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "0", *((void *)self->_internal + 1));
  xpc_dictionary_set_uint64(v3, "1", *((void *)self->_internal + 2));
  return v3;
}

- (void).cxx_destruct
{
}

@end