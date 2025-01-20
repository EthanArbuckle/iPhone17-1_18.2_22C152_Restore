@interface MCPlugProxy
- (BOOL)isKindOfClass:(Class)a3;
- (MCPlug)plug;
- (id)forwardingTargetForSelector:(SEL)a3;
- (int64_t)zIndex;
- (void)_copySelfToSnapshot:(id)a3;
- (void)dealloc;
- (void)setPlug:(id)a3;
@end

@implementation MCPlugProxy

- (void)dealloc
{
  self->_plug = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCPlugProxy;
  [(MCObject *)&v3 dealloc];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_plug;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    char isKindOfClass = 1;
  }
  else {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (int64_t)zIndex
{
  return (int64_t)[(MCPlug *)self->_plug zIndex];
}

- (void)_copySelfToSnapshot:(id)a3
{
  *((void *)a3 + 3) = self->_plug;
}

- (MCPlug)plug
{
  return (MCPlug *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPlug:(id)a3
{
}

@end