@interface THWReviewDividerLayout
- (Class)repClassOverride;
- (void)dealloc;
- (void)validate;
@end

@implementation THWReviewDividerLayout

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)THWReviewDividerLayout;
  [(THWReviewDividerLayout *)&v2 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (void)validate
{
  [(THWReviewDividerLayout *)self invalidateFrame];
  v3.receiver = self;
  v3.super_class = (Class)THWReviewDividerLayout;
  [(THWReviewDividerLayout *)&v3 validate];
}

@end