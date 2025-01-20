@interface SearchUICopyItemHandler
- (BOOL)supportsCopy;
- (SearchUICommandHandler)handlerForCopying;
- (id)defaultSymbolName;
- (id)defaultTitle;
- (id)itemProvider;
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
- (void)setHandlerForCopying:(id)a3;
@end

@implementation SearchUICopyItemHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v6 = [(SearchUICopyItemHandler *)self handlerForCopying];
  v7 = [v6 itemProvider];

  if (v7)
  {
    v13[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v9 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v9 setItemProviders:v8];

LABEL_5:
    goto LABEL_6;
  }
  v10 = [(SearchUICommandHandler *)self command];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [(SearchUICommandHandler *)self command];
    v12 = [v8 copyableItem];
    +[SearchUIItemProviderUtilities copy:v12];

    goto LABEL_5;
  }
LABEL_6:
}

- (id)itemProvider
{
  v3 = [(SearchUICommandHandler *)self command];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(SearchUICommandHandler *)self command];
    v6 = [v5 copyableItem];
    v7 = +[SearchUIItemProviderUtilities itemProviderForItem:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)supportsCopy
{
  return 1;
}

- (id)defaultTitle
{
  return +[SearchUIUtilities localizedStringForKey:@"COPY"];
}

- (id)defaultSymbolName
{
  return @"doc.on.doc";
}

- (unint64_t)destination
{
  return 3;
}

- (SearchUICommandHandler)handlerForCopying
{
  return (SearchUICommandHandler *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHandlerForCopying:(id)a3
{
}

- (void).cxx_destruct
{
}

@end