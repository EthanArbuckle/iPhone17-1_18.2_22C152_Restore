@interface _UIPageCurl
+ (void)be_swizzlePageCurlFilter;
- (id)bepageCurlHack_newAnimationForState:(id)a3 withKeyPath:(id)a4 duration:(double)a5 fromValue:(id)a6;
- (id)bepageCurlHack_newFilter;
@end

@implementation _UIPageCurl

+ (void)be_swizzlePageCurlFilter
{
  if (qword_409AF8 != -1) {
    dispatch_once(&qword_409AF8, &stru_3C0670);
  }
}

- (id)bepageCurlHack_newAnimationForState:(id)a3 withKeyPath:(id)a4 duration:(double)a5 fromValue:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = +[BEPageCurlConfig shared];
  v14 = v13;
  if (a5 == 0.4)
  {
    [v13 tapAnimationDuration];
    double v16 = v15;
  }
  else
  {
    v17 = [v13 pageCurlDelegate];
    [v17 interactiveAnimationDuration];
    double v16 = v18;
  }
  v19 = [(_UIPageCurl *)self bepageCurlHack_newAnimationForState:v12 withKeyPath:v11 duration:v10 fromValue:v16];

  return v19;
}

- (id)bepageCurlHack_newFilter
{
  v2 = [(_UIPageCurl *)self bepageCurlHack_newFilter];
  v3 = +[BEPageCurlConfig shared];
  [v3 applyToFilter:v2];

  return v2;
}

@end