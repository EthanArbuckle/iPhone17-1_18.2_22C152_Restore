@interface WFDatabaseObjectDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)mockWithIdentifier:(id)a3 objectType:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (WFDatabaseObjectDescriptor)initWithCoder:(id)a3;
- (WFDatabaseObjectDescriptor)initWithDictionaryRepresentation:(id)a3;
- (WFDatabaseObjectDescriptor)initWithIdentifier:(id)a3 objectType:(unint64_t)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)objectType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFDatabaseObjectDescriptor

- (BOOL)isEqual:(id)a3
{
  v4 = (WFDatabaseObjectDescriptor *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFDatabaseObjectDescriptor *)v4 identifier];
      v6 = [(WFDatabaseObjectDescriptor *)self identifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(WFDatabaseObjectDescriptor *)self identifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(WFDatabaseObjectDescriptor *)self objectType] ^ 0xABCD1234;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)objectType
{
  return self->_objectType;
}

- (WFDatabaseObjectDescriptor)initWithIdentifier:(id)a3 objectType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFDatabaseObjectDescriptor.m", 48, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if (a4 == 11)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFDatabaseObjectDescriptor.m", 49, @"Invalid parameter not satisfying: %@", @"objectType != WFDatabaseObjectTypeOther" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFDatabaseObjectDescriptor;
  v8 = [(WFDatabaseObjectDescriptor *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_objectType = a4;
    v11 = v8;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"objectType";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFDatabaseObjectDescriptor objectType](self, "objectType"));
  v7[1] = @"identifier";
  v8[0] = v3;
  uint64_t v4 = [(WFDatabaseObjectDescriptor *)self identifier];
  v8[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (WFDatabaseObjectDescriptor)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 objectForKeyedSubscript:@"objectType"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = [v4 objectForKeyedSubscript:@"identifier"];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    self = [(WFDatabaseObjectDescriptor *)self initWithIdentifier:v7 objectType:v6];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(WFDatabaseObjectDescriptor *)self identifier];
  [v5 encodeObject:v4 forKey:@"identifier"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[WFDatabaseObjectDescriptor objectType](self, "objectType"), @"objectType");
}

- (WFDatabaseObjectDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFDatabaseObjectDescriptor;
  id v5 = [(WFDatabaseObjectDescriptor *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_objectType = [v4 decodeIntegerForKey:@"objectType"];
    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFDatabaseObjectDescriptor *)self identifier];
  unint64_t v7 = [(WFDatabaseObjectDescriptor *)self objectType];
  if (v7 > 0xB) {
    v8 = @"Unknown";
  }
  else {
    v8 = off_1E60795D0[v7];
  }
  uint64_t v9 = v8;
  objc_super v10 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, objectType: %@>", v5, self, v6, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)mockWithIdentifier:(id)a3 objectType:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [[WFDatabaseObjectDescriptor alloc] initWithIdentifier:v5 objectType:a4];

  return v6;
}

@end