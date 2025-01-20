@interface SearchUIButtonItemGenerator
+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3;
- (SearchUIButtonItemGeneratorViewDelegate)delegate;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
@end

@implementation SearchUIButtonItemGenerator

+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 != objc_opt_class();
}

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  v8 = [v6 command];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 applicationBundleIdentifier];
    BOOL v10 = +[SearchUIUtilities isAppInstalledWithBundleId:v9];

    if (v10) {
      goto LABEL_9;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v8 applicationBundleIdentifier];
    BOOL v12 = +[SearchUIUtilities isAppInstalledWithBundleId:v11];

    if (!v12)
    {
LABEL_9:
      v17 = [[SearchUIButtonItem alloc] initWithSFButtonItem:v6];
      v18[0] = v17;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (!v8) {
    goto LABEL_9;
  }
  v14 = [(SearchUIButtonItemGenerator *)self feedbackDelegate];
  v15 = +[SearchUIUtilities environmentForDelegate:v14];
  BOOL v16 = +[SearchUICommandHandler hasValidHandlerForCommand:v8 rowModel:0 environment:v15];

  v13 = 0;
  if (v16) {
    goto LABEL_9;
  }
LABEL_10:
  v7[2](v7, v13, 1);
}

- (SearchUIButtonItemGeneratorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIButtonItemGeneratorViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end