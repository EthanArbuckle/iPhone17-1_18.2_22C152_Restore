@interface ICCollapsibleActivityView
- (BOOL)isAnimating;
- (ICCollapsibleActivityView)initWithCoder:(id)a3;
- (ICCollapsibleActivityView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)activityIndicator;
- (void)performSetup;
- (void)registerForTraitChanges;
- (void)setActivityIndicator:(id)a3;
- (void)setCollapsed:(BOOL)a3;
@end

@implementation ICCollapsibleActivityView

- (ICCollapsibleActivityView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICCollapsibleActivityView;
  v3 = -[ICCollapsibleActivityView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICCollapsibleActivityView *)v3 commonInit];
  }
  return v4;
}

- (ICCollapsibleActivityView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICCollapsibleActivityView;
  v3 = [(ICCollapsibleActivityView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICCollapsibleActivityView *)v3 commonInit];
  }
  return v4;
}

- (void)registerForTraitChanges
{
  v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "ic_traitsAffectingSize");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__ICCollapsibleActivityView_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1E5FDB620;
  v5[4] = self;
  id v4 = (id)[(ICCollapsibleActivityView *)self registerForTraitChanges:v3 withHandler:v5];
}

uint64_t __52__ICCollapsibleActivityView_registerForTraitChanges__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isCollapsed];
  v3 = *(void **)(a1 + 32);
  return [v3 setCollapsed:v2];
}

- (void)setCollapsed:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICCollapsibleActivityView;
  -[ICCollapsibleBaseView setCollapsed:](&v7, sel_setCollapsed_);
  v5 = [(ICCollapsibleActivityView *)self activityIndicator];
  objc_super v6 = v5;
  if (a3) {
    [v5 stopAnimating];
  }
  else {
    [v5 startAnimating];
  }
}

- (void)performSetup
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [(ICCollapsibleActivityView *)self setActivityIndicator:v3];

  id v4 = [(ICCollapsibleActivityView *)self activityIndicator];
  [v4 setHidesWhenStopped:0];

  id v5 = [(ICCollapsibleActivityView *)self activityIndicator];
  [(ICCollapsibleBaseView *)self performSetUpWithContentView:v5];
}

- (BOOL)isAnimating
{
  uint64_t v2 = [(ICCollapsibleActivityView *)self activityIndicator];
  char v3 = [v2 isAnimating];

  return v3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end