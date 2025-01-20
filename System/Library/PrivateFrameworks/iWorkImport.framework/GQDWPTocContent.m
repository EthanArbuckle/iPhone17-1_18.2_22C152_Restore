@interface GQDWPTocContent
- (__CFArray)children;
- (void)dealloc;
@end

@implementation GQDWPTocContent

- (void)dealloc
{
  mChildren = self->mChildren;
  if (mChildren) {
    CFRelease(mChildren);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPTocContent;
  [(GQDWPTocContent *)&v4 dealloc];
}

- (__CFArray)children
{
  return self->mChildren;
}

@end