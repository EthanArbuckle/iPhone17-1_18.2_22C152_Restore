@interface TIStatisticChange
+ (BOOL)supportsSecureCoding;
+ (id)statisticChangeWithName:(id)a3 andValue:(int)a4 andInputMode:(id)a5;
- (NSString)inputMode;
- (NSString)name;
- (TIStatisticChange)initWithCoder:(id)a3;
- (TIStatisticChange)initWithName:(id)a3 andValue:(int)a4 andInputMode:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIStatisticChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (int)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  name = self->_name;
  id v8 = v4;
  if (name)
  {
    [v4 encodeObject:name forKey:@"name"];
    id v4 = v8;
  }
  uint64_t value = self->_value;
  if (value)
  {
    [v8 encodeInt:value forKey:@"value"];
    id v4 = v8;
  }
  inputMode = self->_inputMode;
  if (inputMode)
  {
    [v8 encodeObject:inputMode forKey:@"inputMode"];
    id v4 = v8;
  }
}

- (TIStatisticChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIStatisticChange;
  v5 = [(TIStatisticChange *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    uint64_t v7 = [v6 copy];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v5->_uint64_t value = [v4 decodeIntForKey:@"value"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputMode"];
    uint64_t v10 = [v9 copy];
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(TIStatisticChange);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_uint64_t value = self->_value;
    uint64_t v8 = [(NSString *)self->_inputMode copyWithZone:a3];
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v8;
  }
  return v5;
}

- (TIStatisticChange)initWithName:(id)a3 andValue:(int)a4 andInputMode:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TIStatisticChange;
  v11 = [(TIStatisticChange *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_uint64_t value = a4;
    objc_storeStrong((id *)&v12->_inputMode, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)statisticChangeWithName:(id)a3 andValue:(int)a4 andInputMode:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [[TIStatisticChange alloc] initWithName:v8 andValue:v5 andInputMode:v7];

  return v9;
}

@end