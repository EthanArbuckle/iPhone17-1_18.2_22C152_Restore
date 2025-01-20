@interface GQDWPAttachment
- (id)drawable;
- (void)dealloc;
@end

@implementation GQDWPAttachment

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDWPAttachment;
  [(GQDWPAttachment *)&v3 dealloc];
}

- (id)drawable
{
  return self->mDrawable;
}

@end