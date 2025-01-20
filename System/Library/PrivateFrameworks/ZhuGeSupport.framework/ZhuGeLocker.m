@interface ZhuGeLocker
- (ZhuGeCache)keysCacheForCopyValue;
- (void)initData;
- (void)logHandler;
- (void)setKeysCacheForCopyValue:(id)a3;
- (void)setLogHandler:(void *)a3;
@end

@implementation ZhuGeLocker

- (void)initData
{
  initPthreadRecursiveMutex(&self->recursiveMutexForCopyValue);
  self->_keysCacheForCopyValue = [[ZhuGeCache alloc] initWithName:@"ZCV" andCapacity:&unk_1F1A9F668 andCacheType:0];
  MEMORY[0x1F41817F8]();
}

- (void)logHandler
{
  return self->_logHandler;
}

- (void)setLogHandler:(void *)a3
{
  self->_logHandler = a3;
}

- (ZhuGeCache)keysCacheForCopyValue
{
  return (ZhuGeCache *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeysCacheForCopyValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end