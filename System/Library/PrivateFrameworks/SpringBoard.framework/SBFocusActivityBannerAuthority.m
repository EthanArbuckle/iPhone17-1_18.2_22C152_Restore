@interface SBFocusActivityBannerAuthority
+ (NSString)requesterIdentifier;
- (int64_t)shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5 stateChange:(id *)a6;
- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4;
- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5;
@end

@implementation SBFocusActivityBannerAuthority

+ (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.FocusUIFCUIFocusEnablementIndicatorBannerManager";
}

- (int64_t)shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5 stateChange:(id *)a6
{
  id v9 = a3;
  v10 = [a4 lastObject];
  v11 = [(id)objc_opt_class() requesterIdentifier];
  v12 = [v10 requesterIdentifier];
  if (([v12 isEqual:v11] & 1) == 0)
  {

    goto LABEL_9;
  }
  v13 = [v9 requesterIdentifier];
  int v14 = [v13 isEqual:v11];

  if (!v14)
  {
LABEL_9:
    int64_t v15 = 0;
    goto LABEL_10;
  }
  if (a5) {
    *a5 = v10;
  }
  if (a6) {
    *a6 = (id)MEMORY[0x1E4F1CC38];
  }
  int64_t v15 = 1;
LABEL_10:

  return v15;
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  return 0;
}

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  return 0;
}

@end