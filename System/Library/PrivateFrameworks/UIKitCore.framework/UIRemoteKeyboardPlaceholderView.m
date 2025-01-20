@interface UIRemoteKeyboardPlaceholderView
@end

@implementation UIRemoteKeyboardPlaceholderView

void __69___UIRemoteKeyboardPlaceholderView__configureDebugOverlayIfNecessary__block_invoke()
{
  if (qword_1EB25C750 != -1) {
    dispatch_once(&qword_1EB25C750, &__block_literal_global_1126);
  }
  v0 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v1 = [v0 valueForPreferenceKey:@"KeyboardPlaceholderDebugOverlay"];

  LODWORD(v0) = [v1 BOOLValue];
  if (v0)
  {
    if ([(id)UIApp isFrontBoard])
    {
      id v18 = +[UIImage systemImageNamed:@"xmark"];
      v2 = +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:");
      uint64_t v3 = [v2 colorWithAlphaComponent:0.2];
      v4 = (void *)qword_1EB25C698;
      qword_1EB25C698 = v3;
    }
    else
    {
      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = [v5 infoDictionary];
      v7 = [v6 objectForKeyedSubscript:@"CFBundleIcons"];
      v8 = [v7 objectForKeyedSubscript:@"CFBundlePrimaryIcon"];
      v9 = [v8 objectForKeyedSubscript:@"CFBundleIconFiles"];
      id v18 = [v9 lastObject];

      if (v18)
      {
        v10 = +[UIImage imageNamed:v18];
        v2 = objc_msgSend(v10, "imageByPreparingThumbnailOfSize:", 1.0, 1.0);

        v11 = +[UIColor colorWithPatternImage:v2];
        uint64_t v12 = [v11 colorWithAlphaComponent:0.5];
        v13 = (void *)qword_1EB25C698;
        qword_1EB25C698 = v12;
      }
      else
      {
        v14 = [MEMORY[0x1E4F28B50] mainBundle];
        v15 = [v14 bundleIdentifier];
        double v16 = (double)(unint64_t)[v15 hash] * 5.42101086e-20;

        uint64_t v17 = +[UIColor colorWithHue:v16 saturation:1.0 brightness:1.0 alpha:0.5];
        id v18 = 0;
        v2 = (void *)qword_1EB25C698;
        qword_1EB25C698 = v17;
      }
    }
  }
}

@end