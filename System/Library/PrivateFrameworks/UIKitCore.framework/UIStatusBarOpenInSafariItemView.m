@interface UIStatusBarOpenInSafariItemView
- (BOOL)layoutImageOnTrailingEdge;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (NSString)destinationText;
- (UISystemNavigationAction)systemNavigationAction;
- (id)_displayStringFromURL:(id)a3;
- (id)_nominalTitleWithDestinationText:(id)a3;
- (id)shortenedTitleWithCompressionLevel:(int)a3;
- (void)setDestinationText:(id)a3;
- (void)setSystemNavigationAction:(id)a3;
- (void)userDidActivateButton:(id)a3;
@end

@implementation UIStatusBarOpenInSafariItemView

- (id)_displayStringFromURL:(id)a3
{
  if (a3)
  {
    v3 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
    v4 = [v3 host];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 rawData];
  if (*(unsigned char *)(v6 + 2793))
  {
    uint64_t v7 = v6 + 2793;
    [(UIStatusBarOpenInSafariItemView *)self setSystemNavigationAction:0];
    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [NSString stringWithUTF8String:v7];
    [v8 URLWithString:v9 encodingInvalidCharacters:0];
  }
  else
  {
    v10 = [v5 systemNavigationItem];
    [(UIStatusBarOpenInSafariItemView *)self setSystemNavigationAction:v10];

    v9 = [(UIStatusBarOpenInSafariItemView *)self systemNavigationAction];
    [v9 URLForDestination:1];
  v11 = };

  v12 = [(UIStatusBarOpenInSafariItemView *)self _displayStringFromURL:v11];
  if (v12)
  {
    v13 = v12;
    v14 = [v12 componentsSeparatedByString:@"."];
    v15 = (void *)[v14 mutableCopy];

    if ([v15 count])
    {
      v16 = [v15 objectAtIndexedSubscript:0];
      int v17 = [v16 isEqualToString:@"www"];

      if (v17) {
        [v15 removeObjectAtIndex:0];
      }
    }
    if ([v15 count])
    {
      if (qword_1EB25BF00 != -1) {
        dispatch_once(&qword_1EB25BF00, &__block_literal_global_478);
      }
      v18 = (void *)_MergedGlobals_1_23;
      v19 = [v15 lastObject];
      if ([v18 containsObject:v19]) {
        unint64_t v20 = 3;
      }
      else {
        unint64_t v20 = 2;
      }

      if ([v15 count] > v20) {
        objc_msgSend(v15, "removeObjectsInRange:", 0, objc_msgSend(v15, "count") - v20);
      }
    }
    v21 = [v15 componentsJoinedByString:@"."];
  }
  else
  {
    v21 = 0;
  }
  v22 = [(UIStatusBarOpenInSafariItemView *)self destinationText];
  char v23 = [v22 isEqualToString:v21];

  if ((v23 & 1) == 0)
  {
    [(UIStatusBarOpenInSafariItemView *)self setDestinationText:v21];
    [(UIStatusBarSystemNavigationItemView *)self setCurrentLabelCompressionLevel:0];
    v24 = [(UIStatusBarOpenInSafariItemView *)self shortenedTitleWithCompressionLevel:0];
    [(UIStatusBarSystemNavigationItemView *)self setTitle:v24];
  }
  return v23 ^ 1;
}

void __60__UIStatusBarOpenInSafariItemView_updateForNewData_actions___block_invoke()
{
  v0 = (void *)_MergedGlobals_1_23;
  _MergedGlobals_1_23 = (uint64_t)&unk_1ED3F0F70;
}

- (BOOL)layoutImageOnTrailingEdge
{
  return 1;
}

- (void)userDidActivateButton:(id)a3
{
  v4 = [(UIStatusBarOpenInSafariItemView *)self systemNavigationAction];
  int v5 = [v4 canSendResponse];

  if (v5)
  {
    id v6 = [(UIStatusBarOpenInSafariItemView *)self systemNavigationAction];
    [v6 sendResponseForDestination:1];
  }
}

- (id)_nominalTitleWithDestinationText:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  int v5 = _UILocalizedStringInSystemLanguage(@"StatusBar: Website", @"%@");
  id v6 = objc_msgSend(v3, "stringWithFormat:", v5, v4);

  return v6;
}

- (id)shortenedTitleWithCompressionLevel:(int)a3
{
  if (a3 == 1)
  {
    int v5 = _UILocalizedStringInSystemLanguage(@"StatusBar: Webpage", @"Webpage");
LABEL_7:
    id v4 = 0;
    goto LABEL_8;
  }
  if (a3)
  {
    int v5 = 0;
    goto LABEL_7;
  }
  id v4 = [(UIStatusBarOpenInSafariItemView *)self destinationText];
  if ([v4 length])
  {
    int v5 = [(UIStatusBarOpenInSafariItemView *)self _nominalTitleWithDestinationText:v4];
  }
  else
  {
    int v5 = 0;
  }
LABEL_8:

  return v5;
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