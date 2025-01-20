@interface CSProminentDisplayViewController(PRAdditions)
- (uint64_t)pr_setAlternateDateEnabled:()PRAdditions;
- (void)_pr_updateAlternateCalendarIdentifier;
@end

@implementation CSProminentDisplayViewController(PRAdditions)

- (uint64_t)pr_setAlternateDateEnabled:()PRAdditions
{
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = v5;
  if (a3)
  {
    [v5 addObserver:a1 selector:sel__pr_updateAlternateCalendarIdentifier name:*MEMORY[0x1E4F57AE8] object:0];

    return objc_msgSend(a1, "_pr_updateAlternateCalendarIdentifier");
  }
  else
  {
    [v5 removeObserver:a1 name:*MEMORY[0x1E4F57AE8] object:0];

    return [a1 setAlternateCalendarIdentifier:0 locale:0];
  }
}

- (void)_pr_updateAlternateCalendarIdentifier
{
  v2 = [MEMORY[0x1E4F57C00] sharedPreferences];
  id v4 = [v2 overlayCalendarID];

  if ([v4 length])
  {
    v3 = [MEMORY[0x1E4F70FE8] localeForCalendarID:v4];
    [a1 setAlternateCalendarIdentifier:v4 locale:v3];
  }
  else
  {
    [a1 setAlternateCalendarIdentifier:0 locale:0];
  }
}

@end