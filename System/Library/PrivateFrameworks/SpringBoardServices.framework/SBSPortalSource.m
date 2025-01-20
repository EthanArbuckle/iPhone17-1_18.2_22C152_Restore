@interface SBSPortalSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SBSPortalSource)initWithCoder:(id)a3;
- (SBSPortalSource)initWithSourceContextID:(unsigned int)a3 sourceLayerRenderID:(unint64_t)a4;
- (id)description;
- (unint64_t)hash;
- (unint64_t)sourceLayerRenderID;
- (unsigned)sourceContextID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSPortalSource

- (SBSPortalSource)initWithSourceContextID:(unsigned int)a3 sourceLayerRenderID:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBSPortalSource;
  result = [(SBSPortalSource *)&v7 init];
  if (result)
  {
    result->_sourceContextID = a3;
    result->_sourceLayerRenderID = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_sourceLayerRenderID ^ self->_sourceContextID;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSPortalSource *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_sourceContextID == self->_sourceContextID
      && v4->_sourceLayerRenderID == self->_sourceLayerRenderID;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  [v3 stringWithFormat:@"<%@: %p; <0x%x -> 0x%llx>",
    v5,
    self,
    self->_sourceContextID,
  v6 = self->_sourceLayerRenderID);

  return v6;
}

- (SBSPortalSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSPortalSource;
  BOOL v5 = [(SBSPortalSource *)&v7 init];
  if (v5)
  {
    v5->_sourceContextID = [v4 decodeInt32ForKey:@"sourceContextID"];
    v5->_sourceLayerRenderID = [v4 decodeInt64ForKey:@"sourceLayerRenderID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sourceContextID = self->_sourceContextID;
  id v5 = a3;
  [v5 encodeInt32:sourceContextID forKey:@"sourceContextID"];
  [v5 encodeInt64:self->_sourceLayerRenderID forKey:@"sourceLayerRenderID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)sourceLayerRenderID
{
  return self->_sourceLayerRenderID;
}

- (unsigned)sourceContextID
{
  return self->_sourceContextID;
}

@end