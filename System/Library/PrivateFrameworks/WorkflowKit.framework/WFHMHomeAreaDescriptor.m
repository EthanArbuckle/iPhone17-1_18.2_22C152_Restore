@interface WFHMHomeAreaDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)homeName;
- (NSString)name;
- (NSUUID)homeIdentifier;
- (NSUUID)uniqueIdentifier;
- (WFHMHomeAreaDescriptor)initWithCoder:(id)a3;
- (WFHMHomeAreaDescriptor)initWithHome:(id)a3;
- (WFHMHomeAreaDescriptor)initWithRoom:(id)a3 inHome:(id)a4;
- (WFHMHomeAreaDescriptor)initWithUniqueIdentifier:(id)a3 homeIdentifier:(id)a4 name:(id)a5 areaType:(unint64_t)a6 homeName:(id)a7;
- (WFHMHomeAreaDescriptor)initWithZone:(id)a3 inHome:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)areaType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFHMHomeAreaDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSString)homeName
{
  return self->_homeName;
}

- (unint64_t)areaType
{
  return self->_areaType;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v4 = [(WFHMHomeAreaDescriptor *)self uniqueIdentifier];
  v5 = [v4 UUIDString];
  id v6 = (id)[v3 combine:v5];

  unint64_t v7 = [v3 finalize];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFHMHomeAreaDescriptor *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFHMHomeAreaDescriptor *)v4 uniqueIdentifier];
      id v6 = [(WFHMHomeAreaDescriptor *)self uniqueIdentifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(WFHMHomeAreaDescriptor *)self uniqueIdentifier];
  id v6 = (void *)[v5 copy];
  char v7 = [(WFHMHomeAreaDescriptor *)self homeIdentifier];
  v8 = (void *)[v7 copy];
  v9 = [(WFHMHomeAreaDescriptor *)self name];
  v10 = (void *)[v9 copy];
  unint64_t v11 = [(WFHMHomeAreaDescriptor *)self areaType];
  v12 = [(WFHMHomeAreaDescriptor *)self homeName];
  v13 = (void *)[v12 copy];
  v14 = (void *)[v4 initWithUniqueIdentifier:v6 homeIdentifier:v8 name:v10 areaType:v11 homeName:v13];

  return v14;
}

- (WFHMHomeAreaDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeIdentifier"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"areaType"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeName"];

  v10 = [(WFHMHomeAreaDescriptor *)self initWithUniqueIdentifier:v5 homeIdentifier:v6 name:v8 areaType:v7 homeName:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(WFHMHomeAreaDescriptor *)self uniqueIdentifier];
  [v8 encodeObject:v4 forKey:@"uniqueIdentifier"];

  v5 = [(WFHMHomeAreaDescriptor *)self homeIdentifier];
  [v8 encodeObject:v5 forKey:@"homeIdentifier"];

  id v6 = [(WFHMHomeAreaDescriptor *)self name];
  [v8 encodeObject:v6 forKey:@"name"];

  uint64_t v7 = [(WFHMHomeAreaDescriptor *)self homeName];
  [v8 encodeObject:v7 forKey:@"homeName"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[WFHMHomeAreaDescriptor areaType](self, "areaType"), @"areaType");
}

- (WFHMHomeAreaDescriptor)initWithRoom:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFHomeAreaPickerParameter.m", 54, @"Invalid parameter not satisfying: %@", @"room" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFHomeAreaPickerParameter.m", 55, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = [v7 uniqueIdentifier];
  unint64_t v11 = [v9 uniqueIdentifier];
  v12 = [v7 name];
  v13 = [v9 name];
  v14 = [(WFHMHomeAreaDescriptor *)self initWithUniqueIdentifier:v10 homeIdentifier:v11 name:v12 areaType:2 homeName:v13];

  return v14;
}

- (WFHMHomeAreaDescriptor)initWithZone:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFHomeAreaPickerParameter.m", 48, @"Invalid parameter not satisfying: %@", @"zone" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFHomeAreaPickerParameter.m", 49, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = [v7 uniqueIdentifier];
  unint64_t v11 = [v9 uniqueIdentifier];
  v12 = [v7 name];
  v13 = [v9 name];
  v14 = [(WFHMHomeAreaDescriptor *)self initWithUniqueIdentifier:v10 homeIdentifier:v11 name:v12 areaType:1 homeName:v13];

  return v14;
}

- (WFHMHomeAreaDescriptor)initWithHome:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFHomeAreaPickerParameter.m", 43, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  id v6 = [v5 uniqueIdentifier];
  id v7 = [v5 uniqueIdentifier];
  id v8 = [v5 name];
  v9 = [v5 name];
  v10 = [(WFHMHomeAreaDescriptor *)self initWithUniqueIdentifier:v6 homeIdentifier:v7 name:v8 areaType:0 homeName:v9];

  return v10;
}

- (WFHMHomeAreaDescriptor)initWithUniqueIdentifier:(id)a3 homeIdentifier:(id)a4 name:(id)a5 areaType:(unint64_t)a6 homeName:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)WFHMHomeAreaDescriptor;
  v17 = [(WFHMHomeAreaDescriptor *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v18->_homeIdentifier, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    v18->_areaType = a6;
    objc_storeStrong((id *)&v18->_homeName, a7);
    v19 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end