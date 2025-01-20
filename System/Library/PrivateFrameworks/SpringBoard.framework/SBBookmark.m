@interface SBBookmark
- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5;
- (BOOL)isTimedOutForIcon:(id)a3;
- (FBSApplicationDataStore)dataStore;
- (NSCopying)badgeValue;
- (SBBookmark)initWithWebClip:(id)a3;
- (void)_noteIconDataSourceDidChange;
- (void)setBadgeValue:(id)a3;
@end

@implementation SBBookmark

- (SBBookmark)initWithWebClip:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBookmark;
  v5 = [(SBHBookmark *)&v9 initWithWebClip:v4];
  if (v5)
  {
    v6 = [v4 placeholderBundleIdentifier];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F628D8] storeForApplication:v6];
    }
    else
    {
      v7 = 0;
    }
    objc_storeStrong((id *)&v5->_dataStore, v7);
    if (v6) {
  }
    }
  return v5;
}

- (NSCopying)badgeValue
{
  if ((*((unsigned char *)self + 32) & 6) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = [(FBSApplicationDataStore *)self->_dataStore safeObjectForKey:@"SBBookmarkBadgeKey" ofType:objc_opt_class()];
    if (v2) {
      char v4 = 1;
    }
    else {
      char v4 = 2;
    }
    *((unsigned char *)self + 32) = *((unsigned char *)self + 32) & 0xF8 | v4;
  }
  return (NSCopying *)v2;
}

- (void)setBadgeValue:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (!v4
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v4 = v10, (isKindOfClass & 1) != 0)
    || (objc_opt_class(), v6 = objc_opt_isKindOfClass(), id v4 = v10, (v6 & 1) != 0))
  {
    if ([v4 isEqual:&unk_1F334B4F8])
    {

      id v10 = 0;
    }
    v7 = [(SBBookmark *)self badgeValue];
    if (([v7 isEqual:v10] & 1) == 0)
    {
      dataStore = self->_dataStore;
      if (v10 && dataStore)
      {
        -[FBSApplicationDataStore setObject:forKey:](dataStore, "setObject:forKey:");
        char v9 = 1;
      }
      else
      {
        [(FBSApplicationDataStore *)dataStore removeObjectForKey:@"SBBookmarkBadgeKey"];
        char v9 = 2;
      }
      *((unsigned char *)self + 32) = *((unsigned char *)self + 32) & 0xF8 | v9;
      [(SBBookmark *)self _noteIconDataSourceDidChange];
    }
  }
}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isBookmarkIcon])
  {
    v11 = [v8 applicationToLaunch];
    if (v11
      || ([(SBHBookmark *)self webClip],
          v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 isAppClip],
          v12,
          v13))
    {
      if (objc_opt_respondsToSelector())
      {
        v14 = [v10 actions];
      }
      else
      {
        v14 = 0;
      }
      v15 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v17 = [v10 activationSettings];
      }
      else
      {
        v17 = 0;
      }
      v18 = +[SBUIController sharedInstance];
      [v18 activateApplication:v11 fromIcon:v8 location:v9 activationSettings:v17 actions:v14];
    }
  }

  return 1;
}

- (BOOL)isTimedOutForIcon:(id)a3
{
  v3 = [(SBHBookmark *)self webClip];
  if ([v3 isAppClip])
  {
    id v4 = +[SBApplicationController sharedInstance];
    v5 = [v3 applicationBundleIdentifier];
    char v6 = [v4 applicationWithBundleIdentifier:v5];
    v7 = [v6 info];

    char v8 = [v7 isBlockedForScreenTimeExpiration];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_noteIconDataSourceDidChange
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:*MEMORY[0x1E4FA6730] object:self userInfo:0];
}

- (FBSApplicationDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
}

@end