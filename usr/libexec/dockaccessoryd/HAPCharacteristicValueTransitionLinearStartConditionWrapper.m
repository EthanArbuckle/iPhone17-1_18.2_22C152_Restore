@interface HAPCharacteristicValueTransitionLinearStartConditionWrapper
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)init;
- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)initWithValue:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation HAPCharacteristicValueTransitionLinearStartConditionWrapper

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransitionLinearStartConditionWrapper);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)v6 parseFromData:v5 error:&v10];
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

- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionLinearStartConditionWrapper;
  result = [(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)&v3 init];
  if (result) {
    result->_value = 0;
  }
  return result;
}

- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)initWithValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAPCharacteristicValueTransitionLinearStartConditionWrapper;
  result = [(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 length])
  {
    if (!a4)
    {
      BOOL v9 = 0;
      goto LABEL_10;
    }
    id v10 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];
    BOOL v9 = 0;
    goto LABEL_7;
  }
  unsigned int v12 = 0;
  id v7 = v6;
  uint64_t v8 = sub_100024C8C((unsigned __int8 *)[v7 bytes], (uint64_t)[v7 length], (int *)&v12);
  BOOL v9 = v12 == 0;
  if (!v12)
  {
    [(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)self setValue:v8];
    goto LABEL_10;
  }
  if (a4)
  {
    sub_100044EEC(v12);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    *a4 = v10;
  }
LABEL_10:

  return v9;
}

- (id)serializeWithError:(id *)a3
{
  unint64_t v3 = [(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)self value];

  return sub_100024D78(v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPCharacteristicValueTransitionLinearStartConditionWrapper allocWithZone:a3];
  int64_t v5 = [(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)self value];

  return [(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)v4 initWithValue:v5];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPCharacteristicValueTransitionLinearStartConditionWrapper *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      int64_t v6 = [(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)self value];
      int64_t v7 = [(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)v5 value];

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
  v2 = HAPCharacteristicValueTransitionLinearStartConditionAsString([(HAPCharacteristicValueTransitionLinearStartConditionWrapper *)self value]);
  unint64_t v3 = +[NSString stringWithFormat:@"<HAPCharacteristicValueTransitionLinearStartConditionWrapper value=%@>", v2];

  return (NSString *)v3;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

@end