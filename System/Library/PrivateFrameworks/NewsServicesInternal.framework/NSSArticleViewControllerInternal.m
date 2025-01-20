@interface NSSArticleViewControllerInternal
- (BOOL)articleLoading;
- (BOOL)prefersStatusBarHidden;
- (NSSArticleInternal)article;
- (NSSArticleView)articleView;
- (NSSArticleViewControllerInternal)initWithArticle:(id)a3;
- (NSSArticleViewControllerInternal)initWithNotification:(id)a3;
- (NSSArticleViewControllerInternal)initWithSpotlightIdentifier:(id)a3;
- (UIActivityIndicatorView)spinner;
- (void)_tickleArticleView;
- (void)_tickleSpinner;
- (void)presentArticle:(id)a3 completion:(id)a4;
- (void)setArticle:(id)a3;
- (void)setArticleLoading:(BOOL)a3;
- (void)setArticleView:(id)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NSSArticleViewControllerInternal

- (NSSArticleViewControllerInternal)initWithArticle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NSSArticleViewControllerInternal;
  v5 = [(NSSArticleViewControllerInternal *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(NSSArticleViewControllerInternal *)v5 setArticle:v4];
  }

  return v6;
}

- (NSSArticleViewControllerInternal)initWithNotification:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSSArticleViewControllerInternal;
  v5 = [(NSSArticleViewControllerInternal *)&v11 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v5->_articleLoading = v4 != 0;
    objc_initWeak(&location, v5);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__NSSArticleViewControllerInternal_initWithNotification___block_invoke;
    v8[3] = &unk_1E6D3FAE8;
    objc_copyWeak(&v9, &location);
    +[NSSArticleInternal articleFromNotification:v4 completion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __57__NSSArticleViewControllerInternal_initWithNotification___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4) {
    [WeakRetained setArticle:v4];
  }
  [WeakRetained setArticleLoading:0];
}

- (NSSArticleViewControllerInternal)initWithSpotlightIdentifier:(id)a3
{
  id v4 = a3;
  if (+[NSSArticleInternal coreSpotlightIdentifierRepresentsArticleIdentifier:v4])
  {
    v12.receiver = self;
    v12.super_class = (Class)NSSArticleViewControllerInternal;
    v5 = [(NSSArticleViewControllerInternal *)&v12 initWithNibName:0 bundle:0];
    v6 = v5;
    if (v5)
    {
      v5->_articleLoading = v4 != 0;
      objc_initWeak(&location, v5);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __64__NSSArticleViewControllerInternal_initWithSpotlightIdentifier___block_invoke;
      v9[3] = &unk_1E6D3FAE8;
      objc_copyWeak(&v10, &location);
      +[NSSArticleInternal articleFromCoreSpotlightIdentifier:v4 completion:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __64__NSSArticleViewControllerInternal_initWithSpotlightIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4) {
    [WeakRetained setArticle:v4];
  }
  [WeakRetained setArticleLoading:0];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)NSSArticleViewControllerInternal;
  [(NSSArticleViewControllerInternal *)&v11 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [(NSSArticleViewControllerInternal *)self setSpinner:v3];

  id v4 = [(NSSArticleViewControllerInternal *)self spinner];
  [v4 setHidesWhenStopped:1];

  v5 = [(NSSArticleViewControllerInternal *)self view];
  v6 = [(NSSArticleViewControllerInternal *)self spinner];
  [v5 addSubview:v6];

  v7 = [NSSArticleView alloc];
  objc_super v8 = -[NSSArticleView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NSSArticleViewControllerInternal *)self setArticleView:v8];

  id v9 = [(NSSArticleViewControllerInternal *)self view];
  id v10 = [(NSSArticleViewControllerInternal *)self articleView];
  [v9 addSubview:v10];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NSSArticleViewControllerInternal;
  [(NSSArticleViewControllerInternal *)&v4 viewWillAppear:a3];
  [(NSSArticleViewControllerInternal *)self _tickleSpinner];
  [(NSSArticleViewControllerInternal *)self _tickleArticleView];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NSSArticleViewControllerInternal;
  [(NSSArticleViewControllerInternal *)&v13 viewWillLayoutSubviews];
  v3 = [(NSSArticleViewControllerInternal *)self view];
  [v3 bounds];
  double MidX = CGRectGetMidX(v14);
  v5 = [(NSSArticleViewControllerInternal *)self view];
  [v5 bounds];
  double MidY = CGRectGetMidY(v15);
  v7 = [(NSSArticleViewControllerInternal *)self spinner];
  objc_msgSend(v7, "setCenter:", MidX, MidY);

  objc_super v8 = [(NSSArticleViewControllerInternal *)self view];
  [v8 bounds];
  double Width = CGRectGetWidth(v16);
  id v10 = [(NSSArticleViewControllerInternal *)self view];
  [v10 bounds];
  double Height = CGRectGetHeight(v17);
  objc_super v12 = [(NSSArticleViewControllerInternal *)self articleView];
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, Width, Height);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setArticleLoading:(BOOL)a3
{
  if (self->_articleLoading != a3)
  {
    self->_articleLoading = a3;
    [(NSSArticleViewControllerInternal *)self _tickleSpinner];
  }
}

- (void)setArticle:(id)a3
{
  v5 = (NSSArticleInternal *)a3;
  p_article = &self->_article;
  if (self->_article != v5)
  {
    objc_super v12 = v5;
    objc_storeStrong((id *)p_article, a3);
    [(NSSArticleViewControllerInternal *)self _tickleArticleView];
    v7 = [(NSSArticleViewControllerInternal *)self articleView];
    [v7 preferredSize];
    double v9 = v8;
    double v11 = v10;

    p_article = (NSSArticleInternal **)-[NSSArticleViewControllerInternal setPreferredContentSize:](self, "setPreferredContentSize:", v9, v11);
    v5 = v12;
  }
  MEMORY[0x1F41817F8](p_article, v5);
}

- (void)presentArticle:(id)a3 completion:(id)a4
{
  objc_super v13 = (NSSArticleInternal *)a3;
  v7 = (void (**)(void, double, double))a4;
  if (self->_article != v13)
  {
    objc_storeStrong((id *)&self->_article, a3);
    [(NSSArticleViewControllerInternal *)self _tickleArticleView];
    if (v7)
    {
      double v8 = [(NSSArticleViewControllerInternal *)self articleView];
      [v8 preferredSize];
      double v10 = v9;
      double v12 = v11;

      v7[2](v7, v10, v12);
    }
    [(NSSArticleViewControllerInternal *)self _tickleSpinner];
  }
}

- (void)_tickleSpinner
{
  if ([(NSSArticleViewControllerInternal *)self isViewLoaded])
  {
    BOOL v3 = [(NSSArticleViewControllerInternal *)self articleLoading];
    objc_super v4 = [(NSSArticleViewControllerInternal *)self spinner];
    id v5 = v4;
    if (v3) {
      [v4 startAnimating];
    }
    else {
      [v4 stopAnimating];
    }
  }
}

- (void)_tickleArticleView
{
  if ([(NSSArticleViewControllerInternal *)self isViewLoaded])
  {
    BOOL v3 = [(NSSArticleViewControllerInternal *)self article];
    objc_super v4 = [(NSSArticleViewControllerInternal *)self articleView];
    [v4 setArticle:v3];

    id v6 = [(NSSArticleViewControllerInternal *)self article];
    id v5 = [(NSSArticleViewControllerInternal *)self articleView];
    [v5 setHidden:v6 == 0];
  }
}

- (NSSArticleInternal)article
{
  return self->_article;
}

- (NSSArticleView)articleView
{
  return self->_articleView;
}

- (void)setArticleView:(id)a3
{
}

- (BOOL)articleLoading
{
  return self->_articleLoading;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_articleView, 0);
  objc_storeStrong((id *)&self->_article, 0);
}

@end