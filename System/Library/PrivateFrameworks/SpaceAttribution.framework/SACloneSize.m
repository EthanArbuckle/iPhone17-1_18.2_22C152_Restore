@interface SACloneSize
+ (id)newWithDataSize:(int64_t)a3 cloneSize:(int64_t)a4 purgeableSize:(int64_t)a5;
- (NSMutableArray)clonesInfo;
- (int64_t)cloneSize;
- (int64_t)dataSize;
- (int64_t)purgeableSize;
- (void)addCloneInfo:(id)a3;
- (void)setCloneSize:(int64_t)a3;
- (void)setClonesInfo:(id)a3;
- (void)setDataSize:(int64_t)a3;
- (void)setPurgeableSize:(int64_t)a3;
- (void)updateWithSizeInfo:(id)a3;
@end

@implementation SACloneSize

+ (id)newWithDataSize:(int64_t)a3 cloneSize:(int64_t)a4 purgeableSize:(int64_t)a5
{
  id v8 = objc_alloc_init((Class)a1);
  [v8 setDataSize:a3];
  [v8 setCloneSize:a4];
  [v8 setPurgeableSize:a5];
  return v8;
}

- (void)updateWithSizeInfo:(id)a3
{
  id v4 = a3;
  self->_dataSize += (int64_t)[v4 dataSize];
  self->_cloneSize += (int64_t)[v4 cloneSize];
  id v5 = [v4 purgeableSize];

  self->_purgeableSize += (int64_t)v5;
}

- (void)addCloneInfo:(id)a3
{
  id v4 = a3;
  clonesInfo = self->_clonesInfo;
  id v8 = v4;
  if (!clonesInfo)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_clonesInfo;
    self->_clonesInfo = v6;

    id v4 = v8;
    clonesInfo = self->_clonesInfo;
  }
  [(NSMutableArray *)clonesInfo addObject:v4];
}

- (int64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(int64_t)a3
{
  self->_dataSize = a3;
}

- (int64_t)cloneSize
{
  return self->_cloneSize;
}

- (void)setCloneSize:(int64_t)a3
{
  self->_cloneSize = a3;
}

- (int64_t)purgeableSize
{
  return self->_purgeableSize;
}

- (void)setPurgeableSize:(int64_t)a3
{
  self->_purgeableSize = a3;
}

- (NSMutableArray)clonesInfo
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClonesInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end