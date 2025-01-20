@interface WBTab
- (id)displayTitle;
@end

@implementation WBTab

- (id)displayTitle
{
  id v1 = a1;
  if (a1)
  {
    v2 = [a1 url];

    if (v2)
    {
      id v1 = [v1 title];
    }
    else
    {
      v3 = +[Application sharedApplication];
      v4 = [v3 automationController];
      v5 = [v4 automationSession];
      +[TabDocument blankTabTitleWithLibraryType:0 controlledByAutomation:v5 != 0];
      id v1 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v1;
}

@end