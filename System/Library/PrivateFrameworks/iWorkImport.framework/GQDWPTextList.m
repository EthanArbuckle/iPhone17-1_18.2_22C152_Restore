@interface GQDWPTextList
- (BOOL)isBlank;
- (__CFArray)children;
- (void)dealloc;
- (void)setChildren:(__CFArray *)a3;
@end

@implementation GQDWPTextList

- (void)dealloc
{
  mChildren = self->mChildren;
  if (mChildren) {
    CFRelease(mChildren);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPTextList;
  [(GQDWPTextList *)&v4 dealloc];
}

- (__CFArray)children
{
  return self->mChildren;
}

- (void)setChildren:(__CFArray *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  mChildren = self->mChildren;
  if (mChildren) {
    CFRelease(mChildren);
  }
  self->mChildren = a3;
}

- (BOOL)isBlank
{
  int Count = CFArrayGetCount(self->mChildren);
  if (Count < 1)
  {
    return 1;
  }
  else
  {
    CFIndex v4 = 0;
    BOOL v5 = 0;
    CFIndex v6 = Count;
    uint64_t v7 = Count;
    do
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mChildren, v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ![ValueAtIndex isBlank]) {
        break;
      }
      BOOL v5 = ++v4 >= v6;
    }
    while (v7 != v4);
  }
  return v5;
}

@end