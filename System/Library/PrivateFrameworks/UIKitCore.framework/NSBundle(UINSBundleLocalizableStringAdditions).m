@interface NSBundle(UINSBundleLocalizableStringAdditions)
+ (id)currentNibLoadingBundle;
+ (id)currentNibPath;
+ (void)popNibLoadingBundle;
+ (void)popNibPath;
+ (void)pushNibLoadingBundle:()UINSBundleLocalizableStringAdditions;
+ (void)pushNibPath:()UINSBundleLocalizableStringAdditions;
@end

@implementation NSBundle(UINSBundleLocalizableStringAdditions)

+ (id)currentNibLoadingBundle
{
  v0 = UICurrentNibLoadingBundles();
  v1 = [v0 lastObject];

  return v1;
}

+ (id)currentNibPath
{
  v0 = UICurrentNibPaths();
  v1 = [v0 lastObject];

  v2 = [MEMORY[0x1E4F1CA98] null];
  if (v1 == v2) {
    v3 = 0;
  }
  else {
    v3 = v1;
  }
  id v4 = v3;

  return v4;
}

+ (void)pushNibPath:()UINSBundleLocalizableStringAdditions
{
  id v6 = a3;
  v3 = UICurrentNibPaths();
  id v4 = v3;
  if (v6)
  {
    [v3 addObject:v6];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
    [v4 addObject:v5];
  }
}

+ (void)pushNibLoadingBundle:()UINSBundleLocalizableStringAdditions
{
  id v3 = a3;
  UICurrentNibLoadingBundles();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addObject:v3];
}

+ (void)popNibPath
{
  UICurrentNibPaths();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 removeLastObject];
}

+ (void)popNibLoadingBundle
{
  UICurrentNibLoadingBundles();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 removeLastObject];
}

@end