@interface SiriUITemplateViewController
+ (id)templateViewControllerForTemplateModel:(id)a3;
- (BOOL)isActive;
- (BOOL)isCompressed;
- (SiriUITemplateModel)templateModel;
- (SiriUITemplateModelPrivate)templateModelPrivate;
- (SiriUITemplateViewControllerDelegate)delegate;
- (id)_initWithTemplateModel:(id)a3;
- (void)loadView;
- (void)setActive:(BOOL)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTemplateModel:(id)a3;
@end

@implementation SiriUITemplateViewController

+ (id)templateViewControllerForTemplateModel:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "templateViewControllerClass")), "_initWithTemplateModel:", v3);

  return v4;
}

- (id)_initWithTemplateModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriUITemplateViewController;
  v6 = [(SiriUITemplateViewController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateModel, a3);
    v7->_active = 1;
  }

  return v7;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUITemplateViewController;
  [(SiriUITemplateViewController *)&v7 loadView];
  v4 = [(SiriUITemplateViewController *)self view];
  char v5 = [v4 conformsToProtocol:&unk_26D66F590];

  if ((v5 & 1) == 0)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SiriUITemplateViewController.m" lineNumber:32 description:@"The 'view' property of this class must conform to SiriUITemplateView."];
  }
}

- (SiriUITemplateModelPrivate)templateModelPrivate
{
  if ([(SiriUITemplateModel *)self->_templateModel conformsToProtocol:&unk_26D6B1DF8])id v3 = self->_templateModel; {
  else
  }
    id v3 = 0;
  return v3;
}

- (void)setCompressed:(BOOL)a3
{
  if (self->_compressed != a3)
  {
    self->_compressed = a3;
    v4 = [(SiriUITemplateViewController *)self view];
    [v4 setNeedsLayout];

    id v5 = [(SiriUITemplateViewController *)self view];
    [v5 setNeedsUpdateConstraints];
  }
}

- (SiriUITemplateModel)templateModel
{
  return self->_templateModel;
}

- (void)setTemplateModel:(id)a3
{
}

- (SiriUITemplateViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUITemplateViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_templateModel, 0);
}

@end