@interface GQDWPHeaderFooterStorage
- (GQDWPHeaderFooterStorage)initWithName:(__CFString *)a3;
- (__CFString)name;
- (void)dealloc;
@end

@implementation GQDWPHeaderFooterStorage

- (GQDWPHeaderFooterStorage)initWithName:(__CFString *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GQDWPHeaderFooterStorage;
  v4 = [(GQDWPHeaderFooterStorage *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mName = a3;
    if (a3) {
      CFRetain(a3);
    }
  }
  return v5;
}

- (void)dealloc
{
  mName = self->mName;
  if (mName) {
    CFRelease(mName);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPHeaderFooterStorage;
  [(GQDWPStorage *)&v4 dealloc];
}

- (__CFString)name
{
  return self->mName;
}

@end