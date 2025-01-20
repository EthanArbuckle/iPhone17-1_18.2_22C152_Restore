@interface WBSSingleCreditCardData
+ (BOOL)supportsSecureCoding;
+ (id)stringForSingleCreditCardDataType:(int64_t)a3;
- (BOOL)isVirtualCard;
- (WBSSingleCreditCardData)init;
- (WBSSingleCreditCardData)initWithCoder:(id)a3;
- (WBSSingleCreditCardData)initWithValue:(id)a3 type:(int64_t)a4;
- (id)value;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setIsVirtualCard:(BOOL)a3;
@end

@implementation WBSSingleCreditCardData

- (WBSSingleCreditCardData)init
{
  return 0;
}

- (WBSSingleCreditCardData)initWithValue:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSSingleCreditCardData;
  v8 = [(WBSSingleCreditCardData *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_value, a3);
    v9->_type = a4;
    v10 = v9;
  }

  return v9;
}

+ (id)stringForSingleCreditCardDataType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"Invalid Modification Type";
  }
  else {
    return off_1E5C9FC00[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"value"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (WBSSingleCreditCardData)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"value"];

  LODWORD(v7) = [v5 decodeIntForKey:@"type"];
  v9 = [(WBSSingleCreditCardData *)self initWithValue:v8 type:(int)v7];

  return v9;
}

- (id)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isVirtualCard
{
  return self->_isVirtualCard;
}

- (void)setIsVirtualCard:(BOOL)a3
{
  self->_isVirtualCard = a3;
}

- (void).cxx_destruct
{
}

@end