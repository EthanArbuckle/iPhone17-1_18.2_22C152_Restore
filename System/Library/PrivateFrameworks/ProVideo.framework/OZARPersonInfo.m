@interface OZARPersonInfo
- (NSMutableDictionary)jointTransforms;
- (NSNumber)index;
- (NSValue)boundingBox;
- (NSValue)transform;
- (NSValue)worldSize;
- (OZARPersonInfo)init;
- (__n128)simdTransform:(uint64_t)a3;
- (id)init:(id)a3;
- (uint64_t)simdTransform;
- (void)dealloc;
- (void)setBoundingBox:(id)a3;
- (void)setIndex:(id)a3;
- (void)setJointTransforms:(id)a3;
- (void)setTransform:(id)a3;
- (void)setWorldSize:(id)a3;
@end

@implementation OZARPersonInfo

- (OZARPersonInfo)init
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F29238], "PCValueWithSIMDFloat4x4:", *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48));

  return (OZARPersonInfo *)[(OZARPersonInfo *)self init:v3];
}

- (id)init:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OZARPersonInfo;
  v4 = [(OZARPersonInfo *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(OZARPersonInfo *)v4 setTransform:a3];
    [(OZARPersonInfo *)v5 setJointTransforms:(id)objc_opt_new()];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OZARPersonInfo;
  [(OZARPersonInfo *)&v3 dealloc];
}

- (uint64_t)simdTransform
{
  v1 = (void *)[a1 transform];

  return [v1 PCSIMDFloat4x4Value];
}

- (__n128)simdTransform:(uint64_t)a3
{
  v4 = (void *)[a1 jointTransforms];
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3));
  if (v5) {
    [v5 PCSIMDFloat4x4Value];
  }
  else {
    return *(__n128 *)MEMORY[0x1E4F149A0];
  }
  return result;
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (NSValue)worldSize
{
  return self->_worldSize;
}

- (void)setWorldSize:(id)a3
{
}

- (NSValue)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
}

- (NSMutableDictionary)jointTransforms
{
  return self->_jointTransforms;
}

- (void)setJointTransforms:(id)a3
{
}

- (NSValue)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
}

@end