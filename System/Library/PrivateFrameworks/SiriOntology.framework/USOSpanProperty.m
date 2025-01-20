@interface USOSpanProperty
+ (BOOL)supportsSecureCoding;
- (NSNumber)valueFloat;
- (NSNumber)valueInt;
- (NSString)key;
- (NSString)valueString;
- (USOSpanProperty)initWithCoder:(id)a3;
- (USOSpanProperty)initWithKey:(id)a3;
- (USOSpanProperty)initWithKey:(id)a3 valueFloat:(float)a4;
- (USOSpanProperty)initWithKey:(id)a3 valueInt:(int)a4;
- (USOSpanProperty)initWithKey:(id)a3 valueString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation USOSpanProperty

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFloat, 0);
  objc_storeStrong((id *)&self->_valueInt, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSNumber)valueFloat
{
  return self->_valueFloat;
}

- (NSNumber)valueInt
{
  return self->_valueInt;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (NSString)key
{
  return self->_key;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(USOSpanProperty *)self key];
  [v4 encodeObject:v5 forKey:@"key"];

  v6 = [(USOSpanProperty *)self valueString];
  [v4 encodeObject:v6 forKey:@"valueString"];

  v7 = [(USOSpanProperty *)self valueInt];
  [v4 encodeObject:v7 forKey:@"valueInt"];

  id v8 = [(USOSpanProperty *)self valueFloat];
  [v4 encodeObject:v8 forKey:@"valueFloat"];
}

- (USOSpanProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)USOSpanProperty;
  v5 = [(USOSpanProperty *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueString"];
    valueString = v5->_valueString;
    v5->_valueString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueInt"];
    valueInt = v5->_valueInt;
    v5->_valueInt = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueFloat"];
    valueFloat = v5->_valueFloat;
    v5->_valueFloat = (NSNumber *)v12;
  }
  return v5;
}

- (USOSpanProperty)initWithKey:(id)a3 valueFloat:(float)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)USOSpanProperty;
  uint64_t v8 = [(USOSpanProperty *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_key, a3);
    *(float *)&double v10 = a4;
    uint64_t v11 = [NSNumber numberWithFloat:v10];
    valueFloat = v9->_valueFloat;
    v9->_valueFloat = (NSNumber *)v11;
  }
  return v9;
}

- (USOSpanProperty)initWithKey:(id)a3 valueInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)USOSpanProperty;
  uint64_t v8 = [(USOSpanProperty *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_key, a3);
    uint64_t v10 = [NSNumber numberWithInt:v4];
    valueInt = v9->_valueInt;
    v9->_valueInt = (NSNumber *)v10;
  }
  return v9;
}

- (USOSpanProperty)initWithKey:(id)a3 valueString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)USOSpanProperty;
  v9 = [(USOSpanProperty *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_valueString, a4);
  }

  return v10;
}

- (USOSpanProperty)initWithKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)USOSpanProperty;
  uint64_t v6 = [(USOSpanProperty *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_key, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end