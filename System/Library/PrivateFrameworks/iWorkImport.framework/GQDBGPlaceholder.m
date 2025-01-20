@interface GQDBGPlaceholder
- (BOOL)isVisible;
- (id)placeholderStyle;
- (void)dealloc;
@end

@implementation GQDBGPlaceholder

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDBGPlaceholder;
  [(GQDDrawable *)&v3 dealloc];
}

- (id)placeholderStyle
{
  return self->mStyle;
}

- (BOOL)isVisible
{
  return self->mIsVisible;
}

@end