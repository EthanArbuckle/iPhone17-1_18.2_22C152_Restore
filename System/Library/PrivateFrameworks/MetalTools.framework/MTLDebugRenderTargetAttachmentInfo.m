@interface MTLDebugRenderTargetAttachmentInfo
- (BOOL)isEqual:(id)a3;
- (MTLDebugRenderTargetAttachmentInfo)initWithDesc:(const MTLRenderPassAttachmentDescriptorPrivate *)a3 renderTargetArrayLength:(unint64_t)a4;
- (MTLTexture)attachmentTexture;
- (MTLTexture)baseResolveTexture;
- (MTLTexture)baseTexture;
- (_NSRange)baseSliceRangeOffset;
- (_NSRange)resolveSliceRangeOffset;
- (unint64_t)baseLevelOffset;
- (unint64_t)hash;
- (unint64_t)intersectsTexture:(id)a3;
- (unint64_t)renderTargetArrayLength;
- (unint64_t)resolveLevelOffset;
@end

@implementation MTLDebugRenderTargetAttachmentInfo

- (MTLDebugRenderTargetAttachmentInfo)initWithDesc:(const MTLRenderPassAttachmentDescriptorPrivate *)a3 renderTargetArrayLength:(unint64_t)a4
{
  v17.receiver = self;
  v17.super_class = (Class)MTLDebugRenderTargetAttachmentInfo;
  v6 = [(MTLDebugRenderTargetAttachmentInfo *)&v17 init];
  v6->_attachmentTexture = (MTLTexture *)a3->var0;
  v6->_renderTargetArrayLength = a4;
  id var0 = a3->var0;
  v6->_baseLevelOffset = a3->var1;
  unint64_t var2 = a3->var2;
  uint64_t v9 = [var0 parentTexture];
  if (v9)
  {
    do
    {
      v10 = (void *)v9;
      v6->_baseLevelOffset += [var0 parentRelativeLevel];
      var2 += [var0 parentRelativeSlice];
      uint64_t v9 = [v10 parentTexture];
      id var0 = v10;
    }
    while (v9);
  }
  else
  {
    v10 = var0;
  }
  v6->_baseTexture = (MTLTexture *)v10;
  if (a4 <= 1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = a4;
  }
  v6->_baseSliceRangeOffset.location = var2;
  v6->_baseSliceRangeOffset.length = v11;
  id var11 = a3->var11;
  v6->_resolveLevelOffset = a3->var12;
  unint64_t var13 = a3->var13;
  uint64_t v14 = [var11 parentTexture];
  if (v14)
  {
    do
    {
      v15 = (void *)v14;
      v6->_resolveLevelOffset += [var11 parentRelativeLevel];
      var13 += [var11 parentRelativeSlice];
      uint64_t v14 = [v15 parentTexture];
      id var11 = v15;
    }
    while (v14);
  }
  else
  {
    v15 = var11;
  }
  v6->_baseResolveTexture = (MTLTexture *)v15;
  v6->_resolveSliceRangeOffset.location = var13;
  v6->_resolveSliceRangeOffset.length = v11;
  return v6;
}

- (unint64_t)intersectsTexture:(id)a3
{
  v3 = (MTLTexture *)a3;
  uint64_t v5 = [a3 parentTexture];
  unint64_t v6 = 0;
  NSUInteger v7 = 0;
  if (v5)
  {
    v8 = v3;
    do
    {
      uint64_t v9 = (MTLTexture *)v5;
      v6 += [(MTLTexture *)v8 parentRelativeLevel];
      v7 += [(MTLTexture *)v8 parentRelativeSlice];
      uint64_t v5 = [(MTLTexture *)v9 parentTexture];
      v8 = v9;
    }
    while (v5);
  }
  else
  {
    uint64_t v9 = v3;
  }
  unint64_t v10 = [(MTLTexture *)v3 mipmapLevelCount];
  NSUInteger v11 = [(MTLTexture *)v3 arrayLength];
  if (self->_baseResolveTexture)
  {
    for (i = v3; [(MTLTexture *)i parentTexture]; v3 = i)
      i = (MTLTexture *)[(MTLTexture *)v3 parentTexture];
    if (self->_baseResolveTexture == v3)
    {
      unint64_t resolveLevelOffset = self->_resolveLevelOffset;
      BOOL v15 = resolveLevelOffset >= v6;
      unint64_t v14 = resolveLevelOffset - v6;
      BOOL v15 = !v15 || v14 >= v10;
      if (!v15)
      {
        v19.location = v7;
        v19.length = v11;
        if (NSIntersectionRange((NSRange)self[72], v19).length) {
          return 2;
        }
      }
    }
  }
  if (self->_baseTexture == v9)
  {
    unint64_t baseLevelOffset = self->_baseLevelOffset;
    BOOL v15 = baseLevelOffset >= v6;
    unint64_t v18 = baseLevelOffset - v6;
    if (v15 && v18 < v10)
    {
      v20.location = v7;
      v20.length = v11;
      if (NSIntersectionRange((NSRange)self[56], v20).length) {
        return 1;
      }
    }
  }
  return 0;
}

- (unint64_t)hash
{
  return self->_baseLevelOffset ^ (unint64_t)self->_baseTexture;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_baseTexture == (MTLTexture *)*((void *)a3 + 3)
      && self->_baseLevelOffset == *((void *)a3 + 5)
      && NSIntersectionRange((NSRange)self[56], *(NSRange *)(a3 + 56)).length != 0;
}

- (MTLTexture)attachmentTexture
{
  return self->_attachmentTexture;
}

- (MTLTexture)baseResolveTexture
{
  return self->_baseResolveTexture;
}

- (MTLTexture)baseTexture
{
  return self->_baseTexture;
}

- (unint64_t)renderTargetArrayLength
{
  return self->_renderTargetArrayLength;
}

- (unint64_t)baseLevelOffset
{
  return self->_baseLevelOffset;
}

- (unint64_t)resolveLevelOffset
{
  return self->_resolveLevelOffset;
}

- (_NSRange)baseSliceRangeOffset
{
  NSUInteger length = self->_baseSliceRangeOffset.length;
  NSUInteger location = self->_baseSliceRangeOffset.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)resolveSliceRangeOffset
{
  NSUInteger length = self->_resolveSliceRangeOffset.length;
  NSUInteger location = self->_resolveSliceRangeOffset.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end