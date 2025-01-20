@interface HKSPAnalyticsWindDownEventData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualEventData:(id)a3;
- (BOOL)wasCollected;
- (BOOL)wasUsed;
- (HKSPAnalyticsWindDownEventData)initWithCoder:(id)a3;
- (HKSPAnalyticsWindDownEventData)initWithWindDownAction:(unint64_t)a3 wasUsed:(BOOL)a4 identifier:(id)a5;
- (HKSPAnalyticsWindDownEventData)initWithWindDownAction:(unint64_t)a3 wasUsed:(BOOL)a4 identifier:(id)a5 wasCollected:(BOOL)a6;
- (NSString)identifier;
- (id)collectedEventDataCopy;
- (unint64_t)action;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPAnalyticsWindDownEventData

- (HKSPAnalyticsWindDownEventData)initWithWindDownAction:(unint64_t)a3 wasUsed:(BOOL)a4 identifier:(id)a5
{
  return [(HKSPAnalyticsWindDownEventData *)self initWithWindDownAction:a3 wasUsed:a4 identifier:a5 wasCollected:0];
}

- (HKSPAnalyticsWindDownEventData)initWithWindDownAction:(unint64_t)a3 wasUsed:(BOOL)a4 identifier:(id)a5 wasCollected:(BOOL)a6
{
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKSPAnalyticsWindDownEventData;
  v12 = [(HKSPAnalyticsWindDownEventData *)&v16 init];
  v13 = v12;
  if (v12)
  {
    v12->_action = a3;
    v12->_wasUsed = a4;
    objc_storeStrong((id *)&v12->_identifier, a5);
    v13->_wasCollected = a6;
    v14 = v13;
  }

  return v13;
}

- (id)collectedEventDataCopy
{
  v3 = [HKSPAnalyticsWindDownEventData alloc];
  unint64_t v4 = [(HKSPAnalyticsWindDownEventData *)self action];
  BOOL v5 = [(HKSPAnalyticsWindDownEventData *)self wasUsed];
  v6 = [(HKSPAnalyticsWindDownEventData *)self identifier];
  v7 = (void *)[v6 copy];
  v8 = [(HKSPAnalyticsWindDownEventData *)v3 initWithWindDownAction:v4 wasUsed:v5 identifier:v7 wasCollected:1];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4 = NSNumber;
  unint64_t action = self->_action;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedInteger:action];
  [v7 encodeObject:v6 forKey:@"WindDownAction"];

  [v7 encodeBool:self->_wasUsed forKey:@"WasUsed"];
  [v7 encodeBool:self->_wasCollected forKey:@"WasCollected"];
  [v7 encodeObject:self->_identifier forKey:@"WindDownIdentifier"];
}

- (HKSPAnalyticsWindDownEventData)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WindDownAction"];
  uint64_t v6 = [v5 integerValue];

  uint64_t v7 = [v4 decodeBoolForKey:@"WasUsed"];
  uint64_t v8 = [v4 decodeBoolForKey:@"WasCollected"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WindDownIdentifier"];

  v10 = [(HKSPAnalyticsWindDownEventData *)self initWithWindDownAction:v6 wasUsed:v7 identifier:v9 wasCollected:v8];
  return v10;
}

- (unint64_t)hash
{
  v3 = [(HKSPAnalyticsWindDownEventData *)self identifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(HKSPAnalyticsWindDownEventData *)self action] ^ v4;

  return v5;
}

- (BOOL)isEqualEventData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HKSPAnalyticsWindDownEventData *)self identifier];
  uint64_t v6 = [v4 identifier];
  if ([v5 isEqualToString:v6])
  {
    unint64_t v7 = [(HKSPAnalyticsWindDownEventData *)self action];
    BOOL v8 = v7 == [v4 action];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSPAnalyticsWindDownEventData *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HKSPAnalyticsWindDownEventData *)self isEqualEventData:v4];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)action
{
  return self->_action;
}

- (BOOL)wasUsed
{
  return self->_wasUsed;
}

- (BOOL)wasCollected
{
  return self->_wasCollected;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end