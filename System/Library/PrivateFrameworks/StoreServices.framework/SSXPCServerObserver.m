@interface SSXPCServerObserver
- (BOOL)isEqual:(id)a3;
- (SEL)selector;
- (id)observer;
- (unint64_t)hash;
- (void)setObserver:(id)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation SSXPCServerObserver

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (id)observer
{
  return self->_observer;
}

- (unint64_t)hash
{
  return [self->_observer hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 observer];
  id observer = self->_observer;
  if (observer == (id)v5)
  {
    uint64_t v8 = [a3 selector];
  }
  else
  {
    int v7 = objc_msgSend(observer, "isEqual:");
    uint64_t v8 = [a3 selector];
    if (!v7) {
      return 0;
    }
  }
  v10 = (const char *)v8;
  SEL selector = self->_selector;
  if (selector)
  {
    v12 = self->_selector;
    if (v10 == selector) {
      return 1;
    }
  }
  else
  {
    if (!v8) {
      return 1;
    }
    v12 = 0;
  }
  return sel_isEqual(v12, v10);
}

- (void)setObserver:(id)a3
{
  self->_id observer = a3;
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_SEL selector = v3;
}

@end