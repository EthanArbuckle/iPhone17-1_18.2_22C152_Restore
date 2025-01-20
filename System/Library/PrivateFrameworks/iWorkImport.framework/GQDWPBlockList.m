@interface GQDWPBlockList
- (BOOL)isBlank;
- (__CFArray)children;
- (void)dealloc;
@end

@implementation GQDWPBlockList

- (void)dealloc
{
  mChildren = self->mChildren;
  if (mChildren) {
    CFRelease(mChildren);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPBlockList;
  [(GQDWPBlockList *)&v4 dealloc];
}

- (__CFArray)children
{
  return self->mChildren;
}

- (BOOL)isBlank
{
  unint64_t Count = CFArrayGetCount(self->mChildren);
  if (Count)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mChildren, 0);
    objc_opt_class();
    BOOL v5 = 0;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v6 = 1;
      do
      {
        if (([ValueAtIndex isBlank] & 1) == 0) {
          break;
        }
        BOOL v5 = v6 >= Count;
        if (Count == v6) {
          break;
        }
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mChildren, v6);
        objc_opt_class();
        ++v6;
      }
      while ((objc_opt_isKindOfClass() & 1) != 0);
    }
  }
  else
  {
    return 1;
  }
  return v5;
}

@end