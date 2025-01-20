@interface MXMSampleAttribute
+ (BOOL)supportsSecureCoding;
+ (id)attributeWithName:(id)a3;
+ (id)attributeWithName:(id)a3 numericValue:(id)a4;
+ (id)attributeWithName:(id)a3 stringValue:(id)a4;
+ (id)attributeWithName:(id)a3 valueType:(int64_t)a4;
+ (id)attributeWithName:(id)a3 valueType:(int64_t)a4 value:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttribute:(id)a3;
- (MXMSampleAttribute)initWithAttributeName:(id)a3;
- (MXMSampleAttribute)initWithAttributeName:(id)a3 numericValue:(id)a4;
- (MXMSampleAttribute)initWithAttributeName:(id)a3 stringValue:(id)a4;
- (MXMSampleAttribute)initWithAttributeName:(id)a3 valueType:(int64_t)a4;
- (MXMSampleAttribute)initWithAttributeName:(id)a3 valueType:(int64_t)a4 value:(id)a5;
- (MXMSampleAttribute)initWithCoder:(id)a3;
- (NSNumber)numericValue;
- (NSString)name;
- (NSString)stringValue;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)value;
- (int64_t)valueType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXMSampleAttribute

- (NSString)stringValue
{
  if (self->_valueType == 1) {
    v2 = (void *)[self->_value copy];
  }
  else {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSNumber)numericValue
{
  if (self->_valueType == 2) {
    v2 = (void *)[self->_value copy];
  }
  else {
    v2 = 0;
  }
  return (NSNumber *)v2;
}

+ (id)attributeWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAttributeName:v4];

  return v5;
}

+ (id)attributeWithName:(id)a3 stringValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithAttributeName:v7 stringValue:v6];

  return v8;
}

+ (id)attributeWithName:(id)a3 numericValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithAttributeName:v7 numericValue:v6];

  return v8;
}

+ (id)attributeWithName:(id)a3 valueType:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithAttributeName:v6 valueType:a4 value:0];

  return v7;
}

+ (id)attributeWithName:(id)a3 valueType:(int64_t)a4 value:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithAttributeName:v9 valueType:a4 value:v8];

  return v10;
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3
{
  return [(MXMSampleAttribute *)self initWithAttributeName:a3 valueType:0 value:0];
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3 numericValue:(id)a4
{
  return [(MXMSampleAttribute *)self initWithAttributeName:a3 valueType:2 value:a4];
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3 stringValue:(id)a4
{
  return [(MXMSampleAttribute *)self initWithAttributeName:a3 valueType:1 value:a4];
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3 valueType:(int64_t)a4
{
  return [(MXMSampleAttribute *)self initWithAttributeName:a3 valueType:a4 value:0];
}

- (MXMSampleAttribute)initWithAttributeName:(id)a3 valueType:(int64_t)a4 value:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MXMSampleAttribute;
  v11 = [(MXMSampleAttribute *)&v25 init];
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v12 = [v9 copy];
  name = v11->_name;
  v11->_name = (NSString *)v12;

  v11->_valueType = a4;
  if (!v9)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, v11, @"MXMSampleAttribute.m", 76, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (!v10) {
      goto LABEL_13;
    }
LABEL_4:
    switch(a4)
    {
      case 0:
        id value = v11->_value;
        v11->_id value = 0;
LABEL_12:

        goto LABEL_13;
      case 2:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_11:
          uint64_t v21 = [v10 copy];
          id value = v11->_value;
          v11->_id value = (id)v21;
          goto LABEL_12;
        }
        v14 = [MEMORY[0x263F08690] currentHandler];
        v15 = v14;
        v16 = @"Value is not of type Number.";
        SEL v17 = a2;
        v18 = v11;
        uint64_t v19 = 85;
        break;
      case 1:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_11;
        }
        v14 = [MEMORY[0x263F08690] currentHandler];
        v15 = v14;
        v16 = @"Value is not of type String.";
        SEL v17 = a2;
        v18 = v11;
        uint64_t v19 = 81;
        break;
      default:
        v22 = 0;
        goto LABEL_14;
    }
    [v14 handleFailureInMethod:v17 object:v18 file:@"MXMSampleAttribute.m" lineNumber:v19 description:v16];

    goto LABEL_11;
  }
  if (v10) {
    goto LABEL_4;
  }
LABEL_13:
  v22 = v11;
LABEL_14:

  return v22;
}

- (id)copy
{
  return [(MXMSampleAttribute *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(MXMSampleAttribute *)self name];
  int64_t v6 = [(MXMSampleAttribute *)self valueType];
  id v7 = [(MXMSampleAttribute *)self value];
  id v8 = (void *)[v4 initWithAttributeName:v5 valueType:v6 value:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeInteger:self->_valueType forKey:@"valueType"];
  id value = self->_value;
  if (value) {
    [v5 encodeObject:value forKey:@"value"];
  }
}

- (MXMSampleAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"valueType"];
  if ([v4 containsValueForKey:@"value"]
    && (v6 == 1 || v6 == 2)
    && (uint64_t v7 = objc_opt_class()) != 0)
  {
    id v8 = [v4 decodeObjectOfClass:v7 forKey:@"value"];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(MXMSampleAttribute *)self initWithAttributeName:v5 valueType:v6 value:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(MXMSampleAttribute *)self isEqualToAttribute:v4];

  return v5;
}

- (BOOL)isEqualToAttribute:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MXMSampleAttribute.m", 168, @"Invalid parameter not satisfying: %@", @"[attribute isKindOfClass:MXMSampleAttribute.class]" object file lineNumber description];
  }
  int64_t v6 = [(MXMSampleAttribute *)self valueType];
  if (v6 == [v5 valueType]
    && ([(MXMSampleAttribute *)self name],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v5 name],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqualToString:v8],
        (id)v8,
        v7,
        v9))
  {
    int64_t v10 = [(MXMSampleAttribute *)self valueType];
    switch(v10)
    {
      case 0:
        v11 = [(MXMSampleAttribute *)self value];
        if (!v11)
        {
          uint64_t v12 = [v5 value];
          LOBYTE(v8) = v12 == 0;
LABEL_17:

LABEL_19:
          break;
        }
        goto LABEL_18;
      case 2:
        v11 = [(MXMSampleAttribute *)self numericValue];
        if (v11)
        {
          uint64_t v12 = [(MXMSampleAttribute *)self numericValue];
          v13 = [v5 numericValue];
          char v14 = [v12 isEqualToNumber:v13];
          goto LABEL_16;
        }
LABEL_18:
        LOBYTE(v8) = 0;
        goto LABEL_19;
      case 1:
        v11 = [(MXMSampleAttribute *)self stringValue];
        if (v11)
        {
          uint64_t v12 = [(MXMSampleAttribute *)self stringValue];
          v13 = [v5 stringValue];
          char v14 = [v12 isEqualToString:v13];
LABEL_16:
          LOBYTE(v8) = v14;

          goto LABEL_17;
        }
        goto LABEL_18;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(MXMSampleAttribute *)self name];
  uint64_t v7 = [(MXMSampleAttribute *)self value];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p name='%@' value='%@'>", v5, self, v6, v7];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end