@interface SiriUIBaseTemplateViewController
- (Class)templateViewClass;
- (void)loadView;
@end

@implementation SiriUIBaseTemplateViewController

- (void)loadView
{
  if (([(objc_class *)[(SiriUIBaseTemplateViewController *)self templateViewClass] isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SiriUIBaseTemplateViewController.m" lineNumber:16 description:@"-templateViewClass must return a subclass of SiriUIBaseTemplateView!"];
  }
  id v4 = objc_alloc([(SiriUIBaseTemplateViewController *)self templateViewClass]);
  v5 = [(SiriUITemplateViewController *)self templateModel];
  id v7 = (id)[v4 initWithDataSource:v5];

  [(SiriUIBaseTemplateViewController *)self setView:v7];
}

- (Class)templateViewClass
{
  return (Class)objc_opt_class();
}

@end