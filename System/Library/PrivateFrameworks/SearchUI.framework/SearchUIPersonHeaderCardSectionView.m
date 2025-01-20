@interface SearchUIPersonHeaderCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (int)defaultSeparatorStyleForRowModel:(id)a3;
- (SearchUIPersonHeaderBoxView)boxView;
- (SearchUIPersonHeaderViewController)viewController;
- (SearchUIPersonHeaderViewController)viewControllerWithDowntimeButton;
- (SearchUIPersonHeaderViewController)viewControllerWithPayButton;
- (UIEdgeInsets)layoutMargins;
- (id)contact;
- (id)setupContentView;
- (void)groupIdentityHeaderViewController:(id)a3 didPerformActionOfType:(id)a4 fromDisambiguation:(BOOL)a5;
- (void)groupIdentityHeaderViewController:(id)a3 willPresentDisambiguationUIForActionType:(id)a4;
- (void)sendCommandEngagementFeedbackWithType:(id)a3 didSelectFromOptionsMenu:(BOOL)a4 didDisplayHandleOptions:(BOOL)a5;
- (void)setBoxView:(id)a3;
- (void)setViewController:(id)a3;
- (void)setViewControllerWithDowntimeButton:(id)a3;
- (void)setViewControllerWithPayButton:(id)a3;
- (void)updateWithContact:(id)a3 person:(id)a4;
- (void)updateWithPerson:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIPersonHeaderCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(SearchUIPersonHeaderCardSectionView *)self setBoxView:v3];

  v4 = objc_opt_new();
  [v4 setDelegate:self];
  v5 = [[SearchUIPersonHeaderViewController alloc] initWithDowntimeButton:1];
  [(SearchUIPersonHeaderCardSectionView *)self setViewControllerWithDowntimeButton:v5];

  [(SearchUIPersonHeaderCardSectionView *)self setViewControllerWithPayButton:v4];
  v6 = [v4 view];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [(SearchUIPersonHeaderCardSectionView *)self boxView];
  [v8 setArrangedSubviews:v7];

  [(SearchUIPersonHeaderCardSectionView *)self setViewController:v4];
  v9 = [(SearchUIPersonHeaderCardSectionView *)self boxView];

  return v9;
}

- (void)updateWithContact:(id)a3 person:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__SearchUIPersonHeaderCardSectionView_updateWithContact_person___block_invoke;
  v10[3] = &unk_1E6E72938;
  id v11 = v6;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v6;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v10];
}

void __64__SearchUIPersonHeaderCardSectionView_updateWithContact_person___block_invoke(uint64_t a1)
{
  BOOL v2 = +[SearchUIDowntimeManager screenTimeIsEnabledForContact:*(void *)(a1 + 32)];
  v3 = +[SearchUIDowntimeManager familyMemberForContact:*(void *)(a1 + 32) isMe:0];
  BOOL v4 = +[SearchUIDowntimeManager isChildOrTeenFamilyMember:v3];

  v5 = +[SearchUIDowntimeManager familyMemberForContact:0 isMe:1];
  char v6 = [v5 isGuardian];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SearchUIPersonHeaderCardSectionView_updateWithContact_person___block_invoke_2;
  v9[3] = &unk_1E6E72AB0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v11 = v8;
  id v12 = *(id *)(a1 + 32);
  char v13 = v2 & v6 & v4;
  +[SearchUIUtilities dispatchMainIfNecessary:v9];
}

void __64__SearchUIPersonHeaderCardSectionView_updateWithContact_person___block_invoke_2(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) section];
  BOOL v4 = [v3 person];
  v5 = v4;
  if (v2)
  {
    char v6 = [v4 displayName];
    [*(id *)(a1 + 32) displayName];
  }
  else
  {
    char v6 = [v4 contactIdentifier];
    [*(id *)(a1 + 48) identifier];
  id v7 = };
  int v8 = [v6 isEqual:v7];

  id v9 = [*(id *)(a1 + 40) contact];
  id v10 = [v9 identifier];
  uint64_t v11 = [*(id *)(a1 + 48) identifier];
  char v12 = [v10 isEqual:v11];

  char v13 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 56)) {
    [v13 viewControllerWithDowntimeButton];
  }
  else {
  v14 = [v13 viewControllerWithPayButton];
  }
  v15 = [*(id *)(a1 + 40) viewController];

  if (v15 == v14) {
    char v16 = v12;
  }
  else {
    char v16 = 0;
  }
  if (v8 && (v16 & 1) == 0)
  {
    if (v15 != v14)
    {
      [*(id *)(a1 + 40) setViewController:v14];
      v17 = [v14 view];
      v21[0] = v17;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      v19 = [*(id *)(a1 + 40) boxView];
      [v19 setArrangedSubviews:v18];
    }
    v20 = [*(id *)(a1 + 40) viewController];
    [v20 updateWithContact:*(void *)(a1 + 48) isActualContact:*(void *)(a1 + 32) != 0];
  }
}

- (void)updateWithPerson:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SearchUIPersonHeaderCardSectionView_updateWithPerson___block_invoke;
  v6[3] = &unk_1E6E72620;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v6];
}

void __56__SearchUIPersonHeaderCardSectionView_updateWithPerson___block_invoke(int8x16_t *a1)
{
  uint64_t v2 = +[SearchUIContactCache sharedCache];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SearchUIPersonHeaderCardSectionView_updateWithPerson___block_invoke_2;
  v4[3] = &unk_1E6E72AD8;
  int8x16_t v3 = a1[2];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  [v2 fetchContactForPerson:(id)v3.i64[0] completionHandler:v4];
}

uint64_t __56__SearchUIPersonHeaderCardSectionView_updateWithPerson___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateWithContact:a2 person:*(void *)(a1 + 40)];
}

- (void)updateWithRowModel:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SearchUIPersonHeaderCardSectionView;
  [(SearchUICardSectionView *)&v14 updateWithRowModel:a3];
  id v4 = [(SearchUIPersonHeaderCardSectionView *)self contact];
  int8x16_t v5 = [(SearchUICardSectionView *)self section];
  char v6 = [v5 person];

  id v7 = [v6 contactIdentifier];
  int v8 = [v4 identifier];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = [(SearchUIPersonHeaderCardSectionView *)self viewController];
    [v10 updateWithContact:0 isActualContact:0];

    if (v7)
    {
      uint64_t v11 = +[SearchUIContactCache sharedCache];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __58__SearchUIPersonHeaderCardSectionView_updateWithRowModel___block_invoke;
      v12[3] = &unk_1E6E72AD8;
      v12[4] = self;
      id v13 = v6;
      [v11 fetchContactForIdentifier:v7 completionHandler:v12];
    }
    else
    {
      [(SearchUIPersonHeaderCardSectionView *)self updateWithPerson:v6];
    }
  }
}

void __58__SearchUIPersonHeaderCardSectionView_updateWithRowModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    int v8 = __58__SearchUIPersonHeaderCardSectionView_updateWithRowModel___block_invoke_2;
    char v9 = &unk_1E6E72620;
    uint64_t v10 = *(void *)(a1 + 32);
    id v5 = v3;
    id v11 = v5;
    +[SearchUIUtilities dispatchMainIfNecessary:&v6];
    objc_msgSend(*(id *)(a1 + 32), "updateWithContact:person:", v5, 0, v6, v7, v8, v9, v10);
  }
  else
  {
    [*(id *)(a1 + 32) updateWithPerson:*(void *)(a1 + 40)];
  }
}

void __58__SearchUIPersonHeaderCardSectionView_updateWithRowModel___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) section];
  id v3 = [v2 person];
  id v4 = [v3 contactIdentifier];
  id v5 = [*(id *)(a1 + 40) identifier];
  int v6 = [v4 isEqual:v5];

  uint64_t v7 = [*(id *)(a1 + 32) contact];
  int v8 = [v7 identifier];
  char v9 = [*(id *)(a1 + 40) identifier];
  char v10 = [v8 isEqual:v9];

  if (v6 && (v10 & 1) == 0)
  {
    id v11 = [*(id *)(a1 + 32) viewController];
    [v11 updateWithContact:*(void *)(a1 + 40) isActualContact:1];
  }
}

- (UIEdgeInsets)layoutMargins
{
  +[SearchUIUtilities standardTableCellContentInset];
  double v3 = v2;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (id)contact
{
  double v2 = [(SearchUIPersonHeaderCardSectionView *)self viewController];
  double v3 = [v2 group];
  double v4 = [v3 contacts];
  double v5 = [v4 firstObject];

  return v5;
}

- (void)sendCommandEngagementFeedbackWithType:(id)a3 didSelectFromOptionsMenu:(BOOL)a4 didDisplayHandleOptions:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v17 = a3;
  int v8 = objc_opt_new();
  [v8 setDidSelectFromOptionsMenu:v6];
  [v8 setDidDisplayHandleOptions:v5];
  if ([v17 isEqual:*MEMORY[0x1E4F1AD38]])
  {
    uint64_t v9 = 1;
  }
  else if ([v17 isEqual:*MEMORY[0x1E4F1AD48]])
  {
    uint64_t v9 = 2;
  }
  else if ([v17 isEqual:*MEMORY[0x1E4F1AD78]])
  {
    uint64_t v9 = 3;
  }
  else if ([v17 isEqual:*MEMORY[0x1E4F1AD20]])
  {
    uint64_t v9 = 4;
  }
  else if ([v17 isEqual:*MEMORY[0x1E4F1AD60]])
  {
    uint64_t v9 = 5;
  }
  else if ([v17 isEqual:*MEMORY[0x1E4F1AD68]])
  {
    uint64_t v9 = 6;
  }
  else if ([v17 isEqual:*MEMORY[0x1E4F1AD50]])
  {
    uint64_t v9 = 7;
  }
  else if ([v17 isEqual:*MEMORY[0x1E4F1AD28]])
  {
    uint64_t v9 = 8;
  }
  else if ([v17 isEqual:*MEMORY[0x1E4F1AD30]])
  {
    uint64_t v9 = 9;
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v8 setContactActionType:v9];
  char v10 = objc_opt_new();
  [v10 setCommand:v8];
  id v11 = [(SearchUICardSectionView *)self rowModel];
  char v12 = [(SearchUICardSectionView *)self feedbackDelegate];
  id v13 = +[SearchUIUtilities environmentForDelegate:v12];
  objc_super v14 = +[SearchUICommandHandler handlerForButton:v10 rowModel:v11 environment:v13];
  v15 = v14;
  if (v5) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 2;
  }
  [v14 wasPerformedWithTriggerEvent:2 punchout:0 destination:v16];
}

- (void)groupIdentityHeaderViewController:(id)a3 willPresentDisambiguationUIForActionType:(id)a4
{
}

- (void)groupIdentityHeaderViewController:(id)a3 didPerformActionOfType:(id)a4 fromDisambiguation:(BOOL)a5
{
}

- (SearchUIPersonHeaderViewController)viewControllerWithDowntimeButton
{
  return (SearchUIPersonHeaderViewController *)objc_getProperty(self, a2, 784, 1);
}

- (void)setViewControllerWithDowntimeButton:(id)a3
{
}

- (SearchUIPersonHeaderViewController)viewControllerWithPayButton
{
  return (SearchUIPersonHeaderViewController *)objc_getProperty(self, a2, 792, 1);
}

- (void)setViewControllerWithPayButton:(id)a3
{
}

- (SearchUIPersonHeaderViewController)viewController
{
  return (SearchUIPersonHeaderViewController *)objc_getProperty(self, a2, 800, 1);
}

- (void)setViewController:(id)a3
{
}

- (SearchUIPersonHeaderBoxView)boxView
{
  return (SearchUIPersonHeaderBoxView *)objc_getProperty(self, a2, 808, 1);
}

- (void)setBoxView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxView, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_viewControllerWithPayButton, 0);
  objc_storeStrong((id *)&self->_viewControllerWithDowntimeButton, 0);
}

@end