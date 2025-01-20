@interface SXTextTangierDocumentRoot
- (SXTextTangierDocumentRoot)init;
- (SXTextTangierDocumentRoot)initWithContext:(id)a3;
- (TSSStylesheet)aStylesheet;
- (UIViewController)viewController;
- (void)setViewController:(id)a3;
@end

@implementation SXTextTangierDocumentRoot

- (SXTextTangierDocumentRoot)init
{
  v3 = +[SXTemporaryObjectContext temporaryObjectContext];
  v4 = [(SXTextTangierDocumentRoot *)self initWithContext:v3];

  return v4;
}

- (SXTextTangierDocumentRoot)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXTextTangierDocumentRoot;
  v5 = [(TSKDocumentRoot *)&v9 initWithContext:v4];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F7C718]) initWithContext:v4];
    aStylesheet = v5->_aStylesheet;
    v5->_aStylesheet = (TSSStylesheet *)v6;

    [(TSKDocumentRoot *)v5 documentDidLoad];
  }

  return v5;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (TSSStylesheet)aStylesheet
{
  return self->_aStylesheet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aStylesheet, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end