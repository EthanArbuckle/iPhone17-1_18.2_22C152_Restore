@interface SearchUISportsFollowButtonItem
- (BOOL)allowsContextMenu;
- (BOOL)useDefaultSymbolFillStyle;
- (SearchUISportsFollowButtonItem)initWithSFButtonItem:(id)a3;
- (id)commandForStatus:(unint64_t)a3;
- (id)offStateSymbolName;
- (id)onStateSymbolName;
- (id)toggledTitle;
- (id)untoggledTitle;
- (void)updateButtonStateIsFollowing:(BOOL)a3 didSucceed:(BOOL)a4 completionHandler:(id)a5;
- (void)updateStateIfNeeded;
- (void)updateStateIfNeededWithCompletionHandler:(id)a3;
@end

@implementation SearchUISportsFollowButtonItem

- (SearchUISportsFollowButtonItem)initWithSFButtonItem:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUISportsFollowButtonItem;
  v3 = [(SearchUIButtonItem *)&v7 initWithSFButtonItem:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = +[SearchUISportsKitUtilities sportsFollowStatusDidChangeNotificaitonName];
    [v4 addObserver:v3 selector:sel_updateStateIfNeeded name:v5 object:0];
  }
  return v3;
}

- (void)updateStateIfNeeded
{
}

- (void)updateStateIfNeededWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(SearchUIButtonItem *)self sfButtonItem];
  v6 = [v5 sportsItem];

  int v7 = [v6 type];
  if ((v7 - 1) > 1)
  {
    if (v7 == 3)
    {
      if (updateStateIfNeededWithCompletionHandler__onceToken_16 != -1) {
        dispatch_once(&updateStateIfNeededWithCompletionHandler__onceToken_16, &__block_literal_global_18);
      }
      v8 = [v6 identifier];
      [(SearchUISportsFollowButtonItem *)self updateButtonStateIsFollowing:+[SearchUISportsKitUtilities checkForSessionWithCanonicalId:v8] didSucceed:1 completionHandler:v4];
    }
    else
    {
      v4[2](v4, 0);
    }
  }
  else
  {
    if (updateStateIfNeededWithCompletionHandler__onceToken != -1) {
      dispatch_once(&updateStateIfNeededWithCompletionHandler__onceToken, &__block_literal_global_24);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__SearchUISportsFollowButtonItem_updateStateIfNeededWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E6E73870;
    v9[4] = self;
    v10 = v4;
    +[SearchUITVUtilities fetchSportsItemIsFavoritedWithSportsItem:v6 completionHandler:v9];
  }
}

void __75__SearchUISportsFollowButtonItem_updateStateIfNeededWithCompletionHandler___block_invoke()
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v0 = +[SearchUITVUtilities favoritesDidChangeNotificationName];
  id v1 = (id)[v2 addObserverForName:v0 object:0 queue:0 usingBlock:&__block_literal_global_14];
}

void __75__SearchUISportsFollowButtonItem_updateStateIfNeededWithCompletionHandler___block_invoke_2()
{
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v0 = +[SearchUISportsKitUtilities sportsFollowStatusDidChangeNotificaitonName];
  [v1 postNotificationName:v0 object:0];
}

uint64_t __75__SearchUISportsFollowButtonItem_updateStateIfNeededWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateButtonStateIsFollowing:a2 didSucceed:a3 == 0 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __75__SearchUISportsFollowButtonItem_updateStateIfNeededWithCompletionHandler___block_invoke_4()
{
  return +[SearchUISportsKitUtilities registerForLiveActivityChanges];
}

- (void)updateButtonStateIsFollowing:(BOOL)a3 didSucceed:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v10 = a5;
  [(SearchUIButtonItem *)self setStatus:v6];
  v8 = [(SearchUIButtonItem *)self delegate];
  [v8 stateDidChangeForButtonItem:self];

  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, BOOL))v10 + 2))(v10, v5);
    v9 = v10;
  }
}

- (id)untoggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:@"FOLLOW"];
}

- (id)toggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:@"FOLLOWING"];
}

- (id)commandForStatus:(unint64_t)a3
{
  BOOL v5 = objc_opt_new();
  BOOL v6 = [(SearchUIButtonItem *)self sfButtonItem];
  int v7 = [v6 sportsItem];
  [v5 setSportsItem:v7];

  [v5 setFollow:a3 == 0];
  return v5;
}

- (id)offStateSymbolName
{
  return @"star.circle";
}

- (id)onStateSymbolName
{
  return @"star.circle.fill";
}

- (BOOL)useDefaultSymbolFillStyle
{
  return 0;
}

- (BOOL)allowsContextMenu
{
  return 0;
}

@end