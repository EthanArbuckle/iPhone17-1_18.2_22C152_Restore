@interface SSFindMySectionBuilder
+ (id)supportedBundleId;
- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4;
- (id)buildCollectionStyle;
- (id)buildTitle;
@end

@implementation SSFindMySectionBuilder

+ (id)supportedBundleId
{
  return @"com.apple.people.findMy";
}

- (id)buildTitle
{
  if ([(SSSectionBuilder *)self isContactEntitySearch])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SSFindMySectionBuilder;
    v3 = [(SSSectionBuilder *)&v5 buildTitle];
  }
  return v3;
}

- (id)buildCollectionStyle
{
  v2 = objc_opt_new();
  [v2 setDrawPlattersIfNecessary:1];
  [v2 setInitiallyVisibleCardSectionCount:1];
  return v2;
}

- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4
{
  return (id)objc_msgSend(a4, "buildHorizontallyScrollingCardSection", a3);
}

@end