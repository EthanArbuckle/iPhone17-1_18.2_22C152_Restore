@interface HAPUpdateNotReadyReasonsWrapper
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPUpdateNotReadyReasonsWrapper)init;
- (HAPUpdateNotReadyReasonsWrapper)initWithValue:(unint64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (unint64_t)value;
- (void)setValue:(unint64_t)a3;
@end

@implementation HAPUpdateNotReadyReasonsWrapper

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPUpdateNotReadyReasonsWrapper);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPUpdateNotReadyReasonsWrapper *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

- (HAPUpdateNotReadyReasonsWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPUpdateNotReadyReasonsWrapper;
  result = [(HAPUpdateNotReadyReasonsWrapper *)&v3 init];
  if (result) {
    result->_value = 0;
  }
  return result;
}

- (HAPUpdateNotReadyReasonsWrapper)initWithValue:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAPUpdateNotReadyReasonsWrapper;
  result = [(HAPUpdateNotReadyReasonsWrapper *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    *a4 = 0;
    if (![v6 length])
    {
      id v8 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];
      BOOL v9 = 0;
LABEL_8:
      *a4 = v8;
      goto LABEL_11;
    }
  }
  else if (![v6 length])
  {
    BOOL v9 = 0;
    goto LABEL_11;
  }
  unsigned int v13 = 0;
  id v10 = v7;
  uint64_t v11 = sub_100024C8C((unsigned __int8 *)[v10 bytes], (uint64_t)[v10 length], (int *)&v13);
  BOOL v9 = v13 == 0;
  if (!v13)
  {
    [(HAPUpdateNotReadyReasonsWrapper *)self setValue:v11];
    goto LABEL_11;
  }
  if (a4)
  {
    sub_100044EEC(v13);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_11:

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  unint64_t v3 = [(HAPUpdateNotReadyReasonsWrapper *)self value];

  return sub_100024D78(v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPUpdateNotReadyReasonsWrapper allocWithZone:a3];
  unint64_t v5 = [(HAPUpdateNotReadyReasonsWrapper *)self value];

  return [(HAPUpdateNotReadyReasonsWrapper *)v4 initWithValue:v5];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPUpdateNotReadyReasonsWrapper *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unint64_t v6 = [(HAPUpdateNotReadyReasonsWrapper *)self value];
      unint64_t v7 = [(HAPUpdateNotReadyReasonsWrapper *)v5 value];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  v2 = HAPUpdateNotReadyReasonsAsString([(HAPUpdateNotReadyReasonsWrapper *)self value]);
  unint64_t v3 = +[NSString stringWithFormat:@"<HAPUpdateNotReadyReasonsWrapper value=%@>", v2];

  return (NSString *)v3;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

@end