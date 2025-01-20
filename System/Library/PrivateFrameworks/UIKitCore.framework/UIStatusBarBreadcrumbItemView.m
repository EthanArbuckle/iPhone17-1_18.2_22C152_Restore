@interface UIStatusBarBreadcrumbItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (NSString)destinationText;
- (UISystemNavigationAction)systemNavigationAction;
- (double)extraRightPadding;
- (id)shortenedTitleWithCompressionLevel:(int)a3;
- (int64_t)labelLineBreakMode;
- (void)setDestinationText:(id)a3;
- (void)setSystemNavigationAction:(id)a3;
- (void)userDidActivateButton:(id)a3;
@end

@implementation UIStatusBarBreadcrumbItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 rawData];
  if (*(unsigned char *)(v6 + 2537))
  {
    uint64_t v7 = v6 + 2537;
    [(UIStatusBarBreadcrumbItemView *)self setSystemNavigationAction:0];
    v8 = [NSString stringWithUTF8String:v7];
  }
  else
  {
    v9 = [v5 systemNavigationItem];
    [(UIStatusBarBreadcrumbItemView *)self setSystemNavigationAction:v9];

    v10 = [(UIStatusBarBreadcrumbItemView *)self systemNavigationAction];
    v8 = [v10 titleForDestination:0];
  }
  v11 = [(UIStatusBarBreadcrumbItemView *)self destinationText];
  char v12 = [v11 isEqualToString:v8];

  if ((v12 & 1) == 0)
  {
    [(UIStatusBarBreadcrumbItemView *)self setDestinationText:v8];
    [(UIStatusBarSystemNavigationItemView *)self setCurrentLabelCompressionLevel:0];
  }
  v13 = [(UIStatusBarBreadcrumbItemView *)self shortenedTitleWithCompressionLevel:[(UIStatusBarSystemNavigationItemView *)self currentLabelCompressionLevel]];
  [self setAccessibilityIdentifier:@"breadcrumb"];
  v14 = [(UIStatusBarSystemNavigationItemView *)self title];
  char v15 = [v14 isEqualToString:v13];

  if ((v15 & 1) == 0) {
    [(UIStatusBarSystemNavigationItemView *)self setTitle:v13];
  }

  return v15 ^ 1;
}

- (int64_t)labelLineBreakMode
{
  return 4;
}

- (void)userDidActivateButton:(id)a3
{
  v4 = [(UIStatusBarBreadcrumbItemView *)self systemNavigationAction];
  int v5 = [v4 canSendResponse];

  if (v5)
  {
    id v6 = [(UIStatusBarBreadcrumbItemView *)self systemNavigationAction];
    [v6 sendResponseForDestination:0];
  }
}

- (id)shortenedTitleWithCompressionLevel:(int)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    int v5 = NSString;
    id v6 = _UILocalizedStringInSystemLanguage(@"StatusBar: BackBreadcrumb", @"%@");
    uint64_t v7 = [(UIStatusBarBreadcrumbItemView *)self destinationText];
    v3 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  return v3;
}

- (double)extraRightPadding
{
  [(UIStatusBarItemView *)self standardPadding];
  return 7.0 - v2;
}

- (UISystemNavigationAction)systemNavigationAction
{
  return self->_systemNavigationAction;
}

- (void)setSystemNavigationAction:(id)a3
{
}

- (NSString)destinationText
{
  return self->_destinationText;
}

- (void)setDestinationText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationText, 0);
  objc_storeStrong((id *)&self->_systemNavigationAction, 0);
}

@end