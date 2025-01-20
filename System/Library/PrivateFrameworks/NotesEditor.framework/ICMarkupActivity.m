@interface ICMarkupActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ICAttachment)attachment;
- (UIView)fromView;
- (UIViewController)presentingViewController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)completionBlock;
- (id)frameBlock;
- (id)initFromView:(id)a3 presentingViewController:(id)a4 frameBlock:(id)a5 completionBlock:(id)a6;
- (unint64_t)inkStyle;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setFrameBlock:(id)a3;
- (void)setFromView:(id)a3;
- (void)setInkStyle:(unint64_t)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICMarkupActivity

- (id)initFromView:(id)a3 presentingViewController:(id)a4 frameBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ICMarkupActivity;
  v14 = [(UIActivity *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(ICMarkupActivity *)v14 setFromView:v10];
    [(ICMarkupActivity *)v15 setPresentingViewController:v11];
    [(ICMarkupActivity *)v15 setFrameBlock:v12];
    [(ICMarkupActivity *)v15 setCompletionBlock:v13];
    [(ICMarkupActivity *)v15 setInkStyle:0];
  }

  return v15;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.markup";
}

- (id)activityTitle
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"Markup" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_systemImageName
{
  return @"pencil.tip.crop.circle";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ICMarkupActivity_canPerformWithActivityItems___block_invoke;
  v6[3] = &unk_2640B9DD8;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  BOOL v4 = v8[3] == 1;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__ICMarkupActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v9 attachment];
    uint64_t v7 = [v6 attachmentModel];
    int v8 = [v7 canMarkup];

    if (v8) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > 1uLL;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4 = a3;
  [(ICMarkupActivity *)self setAttachment:0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__ICMarkupActivity_prepareWithActivityItems___block_invoke;
  v5[3] = &unk_2640B9E00;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __45__ICMarkupActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v12;
    uint64_t v7 = [v6 attachment];
    int v8 = [v7 attachmentModel];
    int v9 = [v8 canMarkup];

    if (v9)
    {
      uint64_t v10 = [v6 attachment];
      [*(id *)(a1 + 32) setAttachment:v10];
    }
  }
  id v11 = [*(id *)(a1 + 32) attachment];
  *a4 = v11 != 0;
}

- (void)performActivity
{
  id v3 = [(ICMarkupActivity *)self attachment];
  id v4 = [(ICMarkupActivity *)self fromView];
  v5 = [(ICMarkupActivity *)self presentingViewController];
  unint64_t v6 = [(ICMarkupActivity *)self inkStyle];
  uint64_t v7 = [(ICMarkupActivity *)self frameBlock];
  int v8 = [(ICMarkupActivity *)self completionBlock];
  +[ICMarkupPresenter markupAttachment:v3 fromView:v4 presentingViewController:v5 inkStyle:v6 frameBlock:v7 startPresentBlock:0 completionBlock:v8 dismissCompletionBlock:0];

  [(ICMarkupActivity *)self setAttachment:0];
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (UIView)fromView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fromView);

  return (UIView *)WeakRetained;
}

- (void)setFromView:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (id)frameBlock
{
  return self->_frameBlock;
}

- (void)setFrameBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_frameBlock, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_destroyWeak((id *)&self->_fromView);
}

@end