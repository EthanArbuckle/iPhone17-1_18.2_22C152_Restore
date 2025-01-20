@interface OBSetupAssistantLanguageLocaleController
- (double)bottomPaddingHeight;
- (double)headerViewBottomToTableViewHeaderTopPadding;
- (double)headerViewBottomToTableViewTopPaddingForLocalePane;
@end

@implementation OBSetupAssistantLanguageLocaleController

- (double)headerViewBottomToTableViewHeaderTopPadding
{
  v3 = [(OBTableWelcomeController *)self tableView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4 < 2)
  {
    v6 = +[OBDevice currentDevice];
    uint64_t v7 = [v6 templateType];

    if ((unint64_t)(v7 - 2) > 7) {
      double v8 = 93.0;
    }
    else {
      double v8 = dbl_19BF4CF98[v7 - 2];
    }
    [(OBSetupAssistantLanguageLocaleController *)self bottomPaddingHeight];
    return v8 - v9;
  }
  else
  {
    [(OBSetupAssistantLanguageLocaleController *)self headerViewBottomToTableViewTopPaddingForLocalePane];
  }
  return result;
}

- (double)headerViewBottomToTableViewTopPaddingForLocalePane
{
  v2 = +[OBDevice currentDevice];
  uint64_t v3 = [v2 templateType];

  if ((unint64_t)(v3 - 2) > 7) {
    return 47.0;
  }
  else {
    return dbl_19BF4CFD8[v3 - 2];
  }
}

- (double)bottomPaddingHeight
{
  uint64_t v3 = [(OBWelcomeController *)self headerView];
  [v3 bounds];
  double v5 = v4;
  v6 = [(OBWelcomeController *)self headerView];
  uint64_t v7 = [v6 animationView];
  [v7 frame];
  double v10 = v5 - (v8 + v9);

  return v10;
}

@end