@interface SiriUIProfileTemplateViewController
- (Class)templateViewClass;
- (void)loadView;
@end

@implementation SiriUIProfileTemplateViewController

- (Class)templateViewClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIProfileTemplateViewController;
  [(SiriUIBaseTemplateViewController *)&v4 loadView];
  v3 = [(SiriUIProfileTemplateViewController *)self view];
  [v3 setDelegate:self];
}

@end