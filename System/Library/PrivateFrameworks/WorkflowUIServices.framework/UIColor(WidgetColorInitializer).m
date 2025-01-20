@interface UIColor(WidgetColorInitializer)
+ (uint64_t)wf_colorNamed:()WidgetColorInitializer inBundle:;
@end

@implementation UIColor(WidgetColorInitializer)

+ (uint64_t)wf_colorNamed:()WidgetColorInitializer inBundle:
{
  return [MEMORY[0x263F825C8] colorNamed:a3 inBundle:a4 compatibleWithTraitCollection:0];
}

@end