@interface SiriUIMapTemplateViewController
- (Class)templateViewClass;
- (void)loadView;
- (void)mapTemplateView:(id)a3 didModifyPlacemark:(id)a4;
- (void)mapTemplateViewDidSelectMap:(id)a3;
- (void)prepareForDismissal;
@end

@implementation SiriUIMapTemplateViewController

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIMapTemplateViewController;
  [(SiriUIBaseTemplateViewController *)&v4 loadView];
  v3 = [(SiriUIMapTemplateViewController *)self view];
  [v3 setDelegate:self];
}

- (Class)templateViewClass
{
  return (Class)objc_opt_class();
}

- (void)prepareForDismissal
{
  id v2 = [(SiriUIMapTemplateViewController *)self view];
  [v2 prepareForDismissal];
}

- (void)mapTemplateView:(id)a3 didModifyPlacemark:(id)a4
{
  id v5 = a4;
  id v6 = [(SiriUITemplateViewController *)self delegate];
  [v6 mapTemplateViewController:self didModifyPlacemark:v5];
}

- (void)mapTemplateViewDidSelectMap:(id)a3
{
  id v4 = [(SiriUITemplateViewController *)self delegate];
  [v4 presentDetailsForTemplateViewController:self];
}

@end