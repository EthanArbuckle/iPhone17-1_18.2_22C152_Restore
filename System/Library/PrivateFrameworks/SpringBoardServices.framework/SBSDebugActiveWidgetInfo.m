@interface SBSDebugActiveWidgetInfo
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SBSDebugActiveWidgetInfo)initWithBSXPCCoder:(id)a3;
- (SBSDebugActiveWidgetInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)fakeWidgetCount;
- (unint64_t)hash;
- (unint64_t)liveWidgetCount;
- (unint64_t)staticWidgetCount;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFakeWidgetCount:(unint64_t)a3;
- (void)setLiveWidgetCount:(unint64_t)a3;
- (void)setStaticWidgetCount:(unint64_t)a3;
@end

@implementation SBSDebugActiveWidgetInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    v4[1] = self->_liveWidgetCount;
    v4[2] = self->_staticWidgetCount;
    v4[3] = self->_fakeWidgetCount;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t liveWidgetCount = self->_liveWidgetCount;
  id v5 = a3;
  [v5 encodeInteger:liveWidgetCount forKey:@"liveWidgetCount"];
  [v5 encodeInteger:self->_staticWidgetCount forKey:@"staticWidgetCount"];
  [v5 encodeInteger:self->_fakeWidgetCount forKey:@"fakeWidgetCount"];
}

- (SBSDebugActiveWidgetInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSDebugActiveWidgetInfo;
  id v5 = [(SBSDebugActiveWidgetInfo *)&v7 init];
  if (v5)
  {
    v5->_unint64_t liveWidgetCount = [v4 decodeIntegerForKey:@"liveWidgetCount"];
    v5->_staticWidgetCount = [v4 decodeIntegerForKey:@"staticWidgetCount"];
    v5->_fakeWidgetCount = [v4 decodeIntegerForKey:@"fakeWidgetCount"];
  }

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  unint64_t liveWidgetCount = self->_liveWidgetCount;
  id v5 = a3;
  [v5 encodeUInt64:liveWidgetCount forKey:@"liveWidgetCount"];
  [v5 encodeUInt64:self->_staticWidgetCount forKey:@"staticWidgetCount"];
  [v5 encodeUInt64:self->_fakeWidgetCount forKey:@"fakeWidgetCount"];
}

- (SBSDebugActiveWidgetInfo)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSDebugActiveWidgetInfo;
  id v5 = [(SBSDebugActiveWidgetInfo *)&v7 init];
  if (v5)
  {
    v5->_unint64_t liveWidgetCount = [v4 decodeUInt64ForKey:@"liveWidgetCount"];
    v5->_staticWidgetCount = [v4 decodeUInt64ForKey:@"staticWidgetCount"];
    v5->_fakeWidgetCount = [v4 decodeUInt64ForKey:@"fakeWidgetCount"];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_staticWidgetCount + self->_liveWidgetCount + self->_fakeWidgetCount;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSDebugActiveWidgetInfo *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v7 = v4;
      BOOL v8 = self->_liveWidgetCount == v7->_liveWidgetCount
        && self->_staticWidgetCount == v7->_staticWidgetCount
        && self->_fakeWidgetCount == v7->_fakeWidgetCount;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)[(SBSDebugActiveWidgetInfo *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSDebugActiveWidgetInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendUnsignedInteger:-[SBSDebugActiveWidgetInfo liveWidgetCount](self, "liveWidgetCount") withName:@"liveWidgetCount"];
  id v6 = (id)[v4 appendUnsignedInteger:-[SBSDebugActiveWidgetInfo staticWidgetCount](self, "staticWidgetCount") withName:@"staticWidgetCount"];
  id v7 = (id)[v4 appendUnsignedInteger:-[SBSDebugActiveWidgetInfo fakeWidgetCount](self, "fakeWidgetCount") withName:@"fakeWidgetCount"];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBSDebugActiveWidgetInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (unint64_t)liveWidgetCount
{
  return self->_liveWidgetCount;
}

- (void)setLiveWidgetCount:(unint64_t)a3
{
  self->_unint64_t liveWidgetCount = a3;
}

- (unint64_t)staticWidgetCount
{
  return self->_staticWidgetCount;
}

- (void)setStaticWidgetCount:(unint64_t)a3
{
  self->_staticWidgetCount = a3;
}

- (unint64_t)fakeWidgetCount
{
  return self->_fakeWidgetCount;
}

- (void)setFakeWidgetCount:(unint64_t)a3
{
  self->_fakeWidgetCount = a3;
}

@end