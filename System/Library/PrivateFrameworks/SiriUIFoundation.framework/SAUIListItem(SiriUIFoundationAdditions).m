@interface SAUIListItem(SiriUIFoundationAdditions)
- (id)sruif_appInfo;
- (uint64_t)sruif_isUserUtterance;
- (void)sruif_setSelectionTextWithDisambiguationList:()SiriUIFoundationAdditions;
@end

@implementation SAUIListItem(SiriUIFoundationAdditions)

- (uint64_t)sruif_isUserUtterance
{
  return 1;
}

- (id)sruif_appInfo
{
  v2 = [a1 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v4 = [a1 object];
    v5 = (void *)[v4 copy];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)sruif_setSelectionTextWithDisambiguationList:()SiriUIFoundationAdditions
{
  id v6 = a3;
  v4 = [a1 selectionResponse];
  if (!v4)
  {
    v4 = [a1 selectionText];
    if (!v4)
    {
      v5 = [v6 selectionResponse];
      [a1 setSelectionText:v5];

      v4 = 0;
    }
  }
}

@end