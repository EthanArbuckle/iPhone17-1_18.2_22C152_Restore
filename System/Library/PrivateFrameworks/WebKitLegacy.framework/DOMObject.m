@interface DOMObject
- (DOMObject)init;
- (DOMStyleSheet)sheet;
- (void)dealloc;
@end

@implementation DOMObject

- (DOMObject)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3A8];
  v4 = (objc_class *)objc_opt_class();
  [v2 raise:v3, @"+[%@ init]: should never be used", NSStringFromClass(v4) format];
  return 0;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal) {
    removeDOMWrapper(internal);
  }
  v4.receiver = self;
  v4.super_class = (Class)DOMObject;
  [(DOMObject *)&v4 dealloc];
}

- (DOMStyleSheet)sheet
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_2:
    uint64_t v3 = (DOMObjectInternal *)*((void *)self->_internal + 19);
    return (DOMStyleSheet *)kit(v3);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self)
    {
      uint64_t v3 = (DOMObjectInternal *)*((void *)self->_internal + 26);
    }
    else
    {
      uint64_t v3 = (DOMObjectInternal *)MEMORY[0xD0];
    }
    return (DOMStyleSheet *)kit(v3);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!self)
    {
      uint64_t v3 = (DOMObjectInternal *)MEMORY[0x98];
      return (DOMStyleSheet *)kit(v3);
    }
    goto LABEL_2;
  }
  return 0;
}

@end