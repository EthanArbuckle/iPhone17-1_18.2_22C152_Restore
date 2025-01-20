@interface HAPBTLETransactionIdentifier
+ (id)randomTransactionIdentifier;
+ (unsigned)generateRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (HAPBTLETransactionIdentifier)initWithUnsignedCharValue:(unsigned __int8)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)shortDescription;
- (unint64_t)hash;
- (unsigned)unsignedCharValue;
@end

@implementation HAPBTLETransactionIdentifier

+ (unsigned)generateRequestIdentifier
{
  unsigned __int8 v5 = 0;
  v2 = sub_100014018(1uLL);
  [v2 getBytes:&v5 length:1];
  unsigned __int8 v3 = v5;

  return v3;
}

+ (id)randomTransactionIdentifier
{
  unsigned __int8 v6 = 0;
  v2 = sub_100014018(1uLL);
  [v2 getBytes:&v6 length:1];
  unsigned __int8 v3 = [HAPBTLETransactionIdentifier alloc];
  v4 = [(HAPBTLETransactionIdentifier *)v3 initWithUnsignedCharValue:v6];

  return v4;
}

- (HAPBTLETransactionIdentifier)initWithUnsignedCharValue:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAPBTLETransactionIdentifier;
  result = [(HAPBTLETransactionIdentifier *)&v5 init];
  if (result) {
    result->_unsignedCharValue = a3;
  }
  return result;
}

- (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(HAPBTLETransactionIdentifier *)self shortDescription];
  if (v3)
  {
    unsigned __int8 v6 = +[NSString stringWithFormat:@" %p", self];
  }
  else
  {
    unsigned __int8 v6 = &stru_10027B0E8;
  }
  v7 = +[NSString stringWithFormat:@"<%@%@, Identifier = %u>", v5, v6, [(HAPBTLETransactionIdentifier *)self unsignedCharValue]];
  if (v3) {

  }
  return v7;
}

- (id)debugDescription
{
  return [(HAPBTLETransactionIdentifier *)self descriptionWithPointer:1];
}

- (id)description
{
  return [(HAPBTLETransactionIdentifier *)self descriptionWithPointer:0];
}

- (unint64_t)hash
{
  return [(HAPBTLETransactionIdentifier *)self unsignedCharValue];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPBTLETransactionIdentifier *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = [(HAPBTLETransactionIdentifier *)self unsignedCharValue];
      BOOL v6 = v5 == [(HAPBTLETransactionIdentifier *)v4 unsignedCharValue];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unsigned)unsignedCharValue
{
  return self->_unsignedCharValue;
}

@end