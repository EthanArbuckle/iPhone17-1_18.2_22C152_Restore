@interface VisionCoreProcessingDescriptorSpecifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (VisionCoreProcessingDescriptorSpecifier)initWithCoder:(id)a3;
- (VisionCoreProcessingDescriptorSpecifier)initWithIdentifier:(id)a3 version:(id)a4;
- (VisionCoreResourceVersion)version;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreProcessingDescriptorSpecifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (VisionCoreResourceVersion)version
{
  return self->_version;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (VisionCoreProcessingDescriptorSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    if (v6)
    {
      self = [(VisionCoreProcessingDescriptorSpecifier *)self initWithIdentifier:v5 version:v6];
      v7 = self;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_version forKey:@"version"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreProcessingDescriptorSpecifier *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(VisionCoreProcessingDescriptorSpecifier *)self identifier];
      v7 = [(VisionCoreProcessingDescriptorSpecifier *)v5 identifier];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        v9 = [(VisionCoreProcessingDescriptorSpecifier *)self version];
        v10 = [(VisionCoreProcessingDescriptorSpecifier *)v5 version];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(VisionCoreProcessingDescriptorSpecifier *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(VisionCoreProcessingDescriptorSpecifier *)self version];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(VisionCoreProcessingDescriptorSpecifier *)self identifier];
  id v5 = [(VisionCoreProcessingDescriptorSpecifier *)self version];
  unint64_t v6 = (void *)[v3 initWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (VisionCoreProcessingDescriptorSpecifier)initWithIdentifier:(id)a3 version:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VisionCoreProcessingDescriptorSpecifier;
  int v8 = [(VisionCoreProcessingDescriptorSpecifier *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_version, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end