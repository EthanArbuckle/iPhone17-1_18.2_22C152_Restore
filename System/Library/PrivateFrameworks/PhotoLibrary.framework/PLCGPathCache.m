@interface PLCGPathCache
+ (id)sharedPathCache;
- (CGPath)pathForKey:(CGRect)a3;
- (PLCGPathCache)init;
- (void)dealloc;
- (void)setPath:(CGPath *)a3 forKey:(CGRect)a4;
@end

@implementation PLCGPathCache

- (CGPath)pathForKey:(CGRect)a3
{
  pathCache = self->_pathCache;
  v4 = (const void *)objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return (CGPath *)CFDictionaryGetValue(pathCache, v4);
}

- (void)setPath:(CGPath *)a3 forKey:(CGRect)a4
{
  pathCache = self->_pathCache;
  v6 = (const void *)objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  CFDictionarySetValue(pathCache, v6, a3);
}

- (void)dealloc
{
  CFRelease(self->_pathCache);
  self->_pathCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLCGPathCache;
  [(PLCGPathCache *)&v3 dealloc];
}

- (PLCGPathCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)PLCGPathCache;
  v2 = [(PLCGPathCache *)&v4 init];
  if (v2) {
    v2->_pathCache = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  return v2;
}

+ (id)sharedPathCache
{
  id result = (id)sharedPathCache_sharedPathCache;
  if (!sharedPathCache_sharedPathCache)
  {
    id result = objc_alloc_init(PLCGPathCache);
    sharedPathCache_sharedPathCache = (uint64_t)result;
  }
  return result;
}

@end