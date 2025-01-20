@interface VideosExtrasNavigationBar
- (VideosExtrasNavigationBar)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation VideosExtrasNavigationBar

- (VideosExtrasNavigationBar)initWithFrame:(CGRect)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VideosExtrasNavigationBar;
  v3 = -[VideosExtrasNavigationBar initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(VideosExtrasNavigationBar *)v3 setTranslucent:1];
    v5 = [MEMORY[0x1E4FB1618] blackColor];
    v6 = [(VideosExtrasNavigationBar *)v4 _backgroundView];
    [v6 setBackgroundColor:v5];

    [(VideosExtrasNavigationBar *)v4 _setHidesShadow:1];
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    v13[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [(VideosExtrasNavigationBar *)v4 setTitleTextAttributes:v8];

    v14.width = 1.0;
    v14.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
    v9 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(VideosExtrasNavigationBar *)v4 setBackgroundImage:v9 forBarMetrics:0];
    [(VideosExtrasNavigationBar *)v4 setBackgroundImage:v9 forBarMetrics:101];
    [(VideosExtrasNavigationBar *)v4 setBackgroundImage:v9 forBarMetrics:1];
    [(VideosExtrasNavigationBar *)v4 setBackgroundImage:v9 forBarMetrics:102];
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasNavigationBar;
  -[VideosExtrasNavigationBar hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (VideosExtrasNavigationBar *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dodgeColor, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end