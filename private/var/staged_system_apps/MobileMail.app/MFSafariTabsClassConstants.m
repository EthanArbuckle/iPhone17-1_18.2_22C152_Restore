@interface MFSafariTabsClassConstants
+ (void)configureStatusBarGradientLayer:(id)a3;
+ (void)configureTabContentGradientLayer:(id)a3;
@end

@implementation MFSafariTabsClassConstants

+ (void)configureTabContentGradientLayer:(id)a3
{
  id v3 = a3;
  [v3 setAnchorPoint:0.5, 0.0];
  [v3 setStartPoint:0.5, 0.0];
  [v3 setEndPoint:0.5, 1.0];
  id v20 = +[UIColor clearColor];
  v21[0] = [v20 CGColor];
  id v19 = +[UIColor colorWithWhite:0.0 alpha:0.01];
  v21[1] = [v19 CGColor];
  id v18 = +[UIColor colorWithWhite:0.0 alpha:0.02];
  v21[2] = [v18 CGColor];
  id v17 = +[UIColor colorWithWhite:0.0 alpha:0.05];
  v21[3] = [v17 CGColor];
  id v16 = +[UIColor colorWithWhite:0.0 alpha:0.1];
  v21[4] = [v16 CGColor];
  id v15 = +[UIColor colorWithWhite:0.0 alpha:0.15];
  v21[5] = [v15 CGColor];
  id v14 = +[UIColor colorWithWhite:0.0 alpha:0.2];
  v21[6] = [v14 CGColor];
  id v13 = +[UIColor colorWithWhite:0.0 alpha:0.25];
  v21[7] = [v13 CGColor];
  id v4 = +[UIColor colorWithWhite:0.0 alpha:0.3];
  v21[8] = [v4 CGColor];
  id v5 = +[UIColor colorWithWhite:0.0 alpha:0.35];
  v21[9] = [v5 CGColor];
  id v6 = +[UIColor colorWithWhite:0.0 alpha:0.4];
  v21[10] = [v6 CGColor];
  id v7 = +[UIColor colorWithWhite:0.0 alpha:0.45];
  v21[11] = [v7 CGColor];
  id v8 = +[UIColor colorWithWhite:0.0 alpha:0.5];
  v21[12] = [v8 CGColor];
  id v9 = +[UIColor colorWithWhite:0.0 alpha:0.55];
  v21[13] = [v9 CGColor];
  id v10 = +[UIColor colorWithWhite:0.0 alpha:0.6];
  v21[14] = [v10 CGColor];
  id v11 = +[UIColor colorWithWhite:0.0 alpha:0.65];
  v21[15] = [v11 CGColor];
  v12 = +[NSArray arrayWithObjects:v21 count:16];
  [v3 setColors:v12];

  [v3 setLocations:&off_10062B468];
}

+ (void)configureStatusBarGradientLayer:(id)a3
{
  id v20 = a3;
  id v19 = +[UIColor colorWithWhite:0.0 alpha:1.0];
  v21[0] = [v19 CGColor];
  id v18 = +[UIColor colorWithWhite:0.0 alpha:0.994603225];
  v21[1] = [v18 CGColor];
  id v17 = +[UIColor colorWithWhite:0.0 alpha:0.978587023];
  v21[2] = [v17 CGColor];
  id v16 = +[UIColor colorWithWhite:0.0 alpha:0.952464435];
  v21[3] = [v16 CGColor];
  id v15 = +[UIColor colorWithWhite:0.0 alpha:0.917060124];
  v21[4] = [v15 CGColor];
  id v14 = +[UIColor colorWithWhite:0.0 alpha:0.822990973];
  v21[5] = [v14 CGColor];
  id v13 = +[UIColor colorWithWhite:0.0 alpha:0.707279774];
  v21[6] = [v13 CGColor];
  id v3 = +[UIColor colorWithWhite:0.0 alpha:0.458754447];
  v21[7] = [v3 CGColor];
  id v4 = +[UIColor colorWithWhite:0.0 alpha:0.346236755];
  v21[8] = [v4 CGColor];
  id v5 = +[UIColor colorWithWhite:0.0 alpha:0.250244738];
  v21[9] = [v5 CGColor];
  id v6 = +[UIColor colorWithWhite:0.0 alpha:0.173203094];
  v21[10] = [v6 CGColor];
  id v7 = +[UIColor colorWithWhite:0.0 alpha:0.114800887];
  v21[11] = [v7 CGColor];
  id v8 = +[UIColor colorWithWhite:0.0 alpha:0.0728674787];
  v21[12] = [v8 CGColor];
  id v9 = +[UIColor colorWithWhite:0.0 alpha:0.0442915775];
  v21[13] = [v9 CGColor];
  id v10 = +[UIColor colorWithWhite:0.0 alpha:0.0143711881];
  v21[14] = [v10 CGColor];
  id v11 = +[UIColor colorWithWhite:0.0 alpha:0.00392156863];
  v21[15] = [v11 CGColor];
  v12 = +[NSArray arrayWithObjects:v21 count:16];
  [v20 setColors:v12];

  [v20 setLocations:&off_10062B480];
}

@end