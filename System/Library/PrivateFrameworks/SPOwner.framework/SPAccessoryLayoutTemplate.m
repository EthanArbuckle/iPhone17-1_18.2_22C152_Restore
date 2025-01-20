@interface SPAccessoryLayoutTemplate
+ (BOOL)supportsSecureCoding;
- (BOOL)isPrimary;
- (NSString)partName;
- (NSString)partSymbol;
- (NSString)partType;
- (SPAccessoryLayoutTemplate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)partIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setPartIdentifier:(unsigned __int8)a3;
- (void)setPartName:(id)a3;
- (void)setPartSymbol:(id)a3;
- (void)setPartType:(id)a3;
@end

@implementation SPAccessoryLayoutTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setPartIdentifier:", -[SPAccessoryLayoutTemplate partIdentifier](self, "partIdentifier"));
  v5 = [(SPAccessoryLayoutTemplate *)self partType];
  v6 = (void *)[v5 copy];
  [v4 setPartType:v6];

  v7 = [(SPAccessoryLayoutTemplate *)self partName];
  v8 = (void *)[v7 copy];
  [v4 setPartName:v8];

  v9 = [(SPAccessoryLayoutTemplate *)self partSymbol];
  v10 = (void *)[v9 copy];
  [v4 setPartSymbol:v10];

  objc_msgSend(v4, "setIsPrimary:", -[SPAccessoryLayoutTemplate isPrimary](self, "isPrimary"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[SPAccessoryLayoutTemplate partIdentifier](self, "partIdentifier"), @"partIdentifier");
  v4 = [(SPAccessoryLayoutTemplate *)self partType];
  [v7 encodeObject:v4 forKey:@"partType"];

  v5 = [(SPAccessoryLayoutTemplate *)self partName];
  [v7 encodeObject:v5 forKey:@"partName"];

  v6 = [(SPAccessoryLayoutTemplate *)self partSymbol];
  [v7 encodeObject:v6 forKey:@"partSymbol"];

  objc_msgSend(v7, "encodeBool:forKey:", -[SPAccessoryLayoutTemplate isPrimary](self, "isPrimary"), @"isPrimary");
}

- (SPAccessoryLayoutTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_partIdentifier = [v4 decodeIntegerForKey:@"partIdentifier"];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partType"];
  partType = self->_partType;
  self->_partType = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partName"];
  partName = self->_partName;
  self->_partName = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partSymbol"];
  partSymbol = self->_partSymbol;
  self->_partSymbol = v9;

  char v11 = [v4 decodeBoolForKey:@"isPrimary"];
  self->_isPrimary = v11;
  return self;
}

- (unsigned)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(unsigned __int8)a3
{
  self->_partIdentifier = a3;
}

- (NSString)partType
{
  return self->_partType;
}

- (void)setPartType:(id)a3
{
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
}

- (NSString)partSymbol
{
  return self->_partSymbol;
}

- (void)setPartSymbol:(id)a3
{
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partSymbol, 0);
  objc_storeStrong((id *)&self->_partName, 0);

  objc_storeStrong((id *)&self->_partType, 0);
}

@end