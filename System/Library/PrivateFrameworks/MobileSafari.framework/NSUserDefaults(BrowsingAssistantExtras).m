@interface NSUserDefaults(BrowsingAssistantExtras)
- (id)browsingAssistant_favoritedMenuActions;
- (uint64_t)browsingAssistant_isMenuActionFavorited:()BrowsingAssistantExtras;
- (uint64_t)browsingAssistant_setFavoritedMenuActions:()BrowsingAssistantExtras;
- (void)browsingAssistant_setMenuActionFavorited:()BrowsingAssistantExtras favorited:;
@end

@implementation NSUserDefaults(BrowsingAssistantExtras)

- (id)browsingAssistant_favoritedMenuActions
{
  id v2 = [a1 objectForKey:@"SFFavoritedMenuActions"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !objc_msgSend(v2, "safari_containsObjectPassingTest:", &__block_literal_global_93))
  {
    if (([a1 BOOLForKey:@"SFDidMigrateAutoFillFeedbackOutOfFavoritedMenuActions"] & 1) == 0)
    {
      uint64_t v4 = objc_msgSend(v2, "safari_arrayByRemovingObject:", @"PageMenuActionReportAutoFillIssue");
      [a1 setObject:v4 forKey:@"SFFavoritedMenuActions"];
      [a1 setBool:1 forKey:@"SFDidMigrateAutoFillFeedbackOutOfFavoritedMenuActions"];

      id v2 = (id)v4;
    }
    id v2 = v2;
    v3 = v2;
  }
  else
  {
    [a1 setObject:0 forKey:@"SFFavoritedMenuActions"];
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (uint64_t)browsingAssistant_setFavoritedMenuActions:()BrowsingAssistantExtras
{
  return [a1 setObject:a3 forKey:@"SFFavoritedMenuActions"];
}

- (uint64_t)browsingAssistant_isMenuActionFavorited:()BrowsingAssistantExtras
{
  id v4 = a3;
  if (SFIsMenuActionConfigurable(v4))
  {
    v5 = objc_msgSend(a1, "browsingAssistant_favoritedMenuActions");
    uint64_t v6 = [v5 containsObject:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)browsingAssistant_setMenuActionFavorited:()BrowsingAssistantExtras favorited:
{
  id v8 = a3;
  if (SFIsMenuActionConfigurable(v8))
  {
    uint64_t v6 = objc_msgSend(a1, "browsingAssistant_favoritedMenuActions");
    if ([v6 containsObject:v8] != a4)
    {
      if (a4) {
        [v6 arrayByAddingObject:v8];
      }
      else {
      v7 = objc_msgSend(v6, "safari_arrayByRemovingObject:", v8);
      }
      [a1 setObject:v7 forKey:@"SFFavoritedMenuActions"];
    }
  }
}

@end