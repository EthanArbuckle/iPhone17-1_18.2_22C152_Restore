@interface VideosExtrasViewElementViewController
- (BOOL)embedded;
- (BOOL)matchParentHeight;
- (IKViewElement)viewElement;
- (VideosExtrasViewElementViewController)initWithViewElement:(id)a3;
- (int64_t)preferredLayoutAttribute;
- (void)setEmbedded:(BOOL)a3;
- (void)setViewElement:(id)a3;
- (void)viewDidLoad;
@end

@implementation VideosExtrasViewElementViewController

- (VideosExtrasViewElementViewController)initWithViewElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasViewElementViewController;
  v6 = [(VideosExtrasElementViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewElement, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasViewElementViewController;
  [(VideosExtrasViewElementViewController *)&v4 viewDidLoad];
  v3 = [(VideosExtrasViewElementViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (BOOL)matchParentHeight
{
  return 0;
}

- (int64_t)preferredLayoutAttribute
{
  return 3;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (BOOL)embedded
{
  return self->_embedded;
}

- (void)setEmbedded:(BOOL)a3
{
  self->_embedded = a3;
}

- (void).cxx_destruct
{
}

@end