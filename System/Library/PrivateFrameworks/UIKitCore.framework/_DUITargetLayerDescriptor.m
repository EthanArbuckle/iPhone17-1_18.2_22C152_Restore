@interface _DUITargetLayerDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)systemShellHostingSpaceIdentifier;
- (_DUITargetLayerDescriptor)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)renderID;
- (unsigned)contextID;
- (void)encodeWithCoder:(id)a3;
- (void)setContextID:(unsigned int)a3;
- (void)setRenderID:(unint64_t)a3;
- (void)setSystemShellHostingSpaceIdentifier:(id)a3;
@end

@implementation _DUITargetLayerDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUITargetLayerDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DUITargetLayerDescriptor;
  v5 = [(_DUITargetLayerDescriptor *)&v9 init];
  if (v5)
  {
    v5->_contextID = [v4 decodeInt32ForKey:@"contextID"];
    v5->_renderID = [v4 decodeInt64ForKey:@"renderID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemShellHostingSpaceIdentifier"];
    systemShellHostingSpaceIdentifier = v5->_systemShellHostingSpaceIdentifier;
    v5->_systemShellHostingSpaceIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t renderID = self->_renderID;
  id v5 = a3;
  [v5 encodeInt64:renderID forKey:@"renderID"];
  [v5 encodeInt32:self->_contextID forKey:@"contextID"];
  [v5 encodeObject:self->_systemShellHostingSpaceIdentifier forKey:@"systemShellHostingSpaceIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = v5;
    if (self->_contextID == *((_DWORD *)v5 + 2) && self->_renderID == *((void *)v5 + 2))
    {
      systemShellHostingSpaceIdentifier = self->_systemShellHostingSpaceIdentifier;
      v8 = (void *)*((void *)v5 + 3);
      objc_super v9 = systemShellHostingSpaceIdentifier;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [(NSString *)v9 isEqual:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_renderID ^ self->_contextID;
  return v2 ^ [(NSString *)self->_systemShellHostingSpaceIdentifier hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setContextID:", -[_DUITargetLayerDescriptor contextID](self, "contextID"));
  objc_msgSend(v4, "setRenderID:", -[_DUITargetLayerDescriptor renderID](self, "renderID"));
  id v5 = [(_DUITargetLayerDescriptor *)self systemShellHostingSpaceIdentifier];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setSystemShellHostingSpaceIdentifier:v6];

  return v4;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (unint64_t)renderID
{
  return self->_renderID;
}

- (void)setRenderID:(unint64_t)a3
{
  self->_unint64_t renderID = a3;
}

- (NSString)systemShellHostingSpaceIdentifier
{
  return self->_systemShellHostingSpaceIdentifier;
}

- (void)setSystemShellHostingSpaceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end