@interface SiriUISettingTemplateViewController
- (Class)templateViewClass;
@end

@implementation SiriUISettingTemplateViewController

- (Class)templateViewClass
{
  return (Class)objc_opt_class();
}

@end