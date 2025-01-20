@interface SBHIconGridSizeClassDomain(PRWidgetGridUtilities)
+ (id)pr_widgetDomain;
@end

@implementation SBHIconGridSizeClassDomain(PRWidgetGridUtilities)

+ (id)pr_widgetDomain
{
  if (pr_widgetDomain_onceToken[0] != -1) {
    dispatch_once(pr_widgetDomain_onceToken, &__block_literal_global_45);
  }
  v0 = (void *)pr_widgetDomain_domain;
  return v0;
}

@end