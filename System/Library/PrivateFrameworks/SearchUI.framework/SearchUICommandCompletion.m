@interface SearchUICommandCompletion
+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4;
- (BOOL)completionResultIsPotentiallyPunchout;
- (id)command;
- (id)image;
- (id)prefixMatchExtensionString;
- (void)updateFields;
@end

@implementation SearchUICommandCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v4 = a4;
  v5 = [v4 command];
  v6 = objc_msgSend(v5, "_searchui_prefixMatchExtensionStringWithCompletion:", 0);
  if ([v6 length])
  {
    BOOL v7 = 1;
  }
  else
  {
    v8 = [v4 command];
    v9 = objc_msgSend(v8, "_searchui_overriddenExtensionString");
    BOOL v7 = [v9 length] != 0;
  }
  return v7;
}

- (id)command
{
  v2 = [(SearchUICompletion *)self cardSection];
  v3 = [v2 command];

  return v3;
}

- (id)prefixMatchExtensionString
{
  v3 = [(SearchUICommandCompletion *)self command];
  id v4 = objc_msgSend(v3, "_searchui_prefixMatchExtensionStringWithCompletion:", self);

  return v4;
}

- (id)image
{
  v2 = [(SearchUICommandCompletion *)self command];
  v3 = objc_msgSend(v2, "_searchui_completionImage");

  return v3;
}

- (void)updateFields
{
  v3 = [(SearchUICommandCompletion *)self command];
  id v4 = objc_msgSend(v3, "_searchui_overriddenBridgeStringWithCompletion:", self);

  if (v4)
  {
    [(SearchUICompletion *)self setBridgeString:v4];
    v5 = [(SearchUICommandCompletion *)self command];
    v6 = objc_msgSend(v5, "_searchui_overriddenExtensionString");
    [(SearchUICompletion *)self setExtensionString:v6];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUICommandCompletion;
    [(SearchUICompletion *)&v7 updateFields];
  }
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  v3 = +[SearchUICompletion localizedShowMoreString];
  id v4 = [(SearchUICommandCompletion *)self prefixMatchExtensionString];
  char v5 = [v3 isEqualToString:v4] ^ 1;

  return v5;
}

@end