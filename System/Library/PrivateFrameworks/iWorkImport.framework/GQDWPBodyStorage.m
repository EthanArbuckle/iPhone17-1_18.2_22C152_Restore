@interface GQDWPBodyStorage
- (__CFArray)body;
- (id)footnotes;
- (void)dealloc;
@end

@implementation GQDWPBodyStorage

- (id)footnotes
{
  return self->mFootnotes;
}

- (__CFArray)body
{
  return self->super.mBody;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDWPBodyStorage;
  [(GQDWPStorage *)&v3 dealloc];
}

@end