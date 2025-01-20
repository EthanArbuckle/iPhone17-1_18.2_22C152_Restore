@interface SearchUIClockImage
- (BOOL)isEqual:(id)a3;
- (SearchUIClockImage)initWithClockImage:(id)a3 variant:(unint64_t)a4;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation SearchUIClockImage

- (SearchUIClockImage)initWithClockImage:(id)a3 variant:(unint64_t)a4
{
  id v6 = a3;
  v7 = +[SearchUIUtilities bundleIdentifierForApp:24];
  v10.receiver = self;
  v10.super_class = (Class)SearchUIClockImage;
  v8 = [(SearchUIAppIconImage *)&v10 initWithBundleIdentifier:v7 variant:a4 contentType:0];

  if (v8) {
    [(SearchUIImage *)v8 setSfImage:v6];
  }

  return v8;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  v7 = (void (**)(id, void *, uint64_t))a5;
  id v25 = [(SearchUIImage *)self sfImage];
  v8 = objc_opt_new();
  v9 = [v25 hour];
  objc_msgSend(v8, "setHour:", objc_msgSend(v9, "integerValue"));

  objc_super v10 = [v25 minute];
  objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "integerValue"));

  v11 = [v25 second];
  objc_msgSend(v8, "setSecond:", objc_msgSend(v11, "integerValue"));

  BOOL v12 = [v8 hour] > 11;
  v13 = objc_opt_new();
  [(SearchUIImage *)self size];
  SBIconImageInfoMake();
  objc_msgSend(v13, "setIconImageInfo:");
  v14 = [MEMORY[0x1E4FAE060] appearanceWithVibrancyEnabled:0 isDark:v12];
  [v14 overrideAppearanceForView:v13];

  [v13 updateTraitsIfNeeded];
  v15 = [MEMORY[0x1E4FA6220] overrideDate];
  uint64_t v16 = [MEMORY[0x1E4FA6220] hidesSecondsHand];
  v17 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  v18 = [v17 dateFromComponents:v8];
  [MEMORY[0x1E4FA6220] setOverrideDate:v18];

  v19 = [v25 second];
  if (v19)
  {
    v20 = [v25 second];
    [v20 doubleValue];
    [MEMORY[0x1E4FA6220] setHidesSecondsHand:v21 < 0.0];
  }
  else
  {
    [MEMORY[0x1E4FA6220] setHidesSecondsHand:1];
  }

  v22 = objc_opt_new();
  [v13 setIcon:v22 location:&stru_1F40279D8 animated:0];

  [(SearchUIImage *)self size];
  UIGraphicsBeginImageContextWithOptions(v27, 1, a3);
  v23 = [v13 layer];
  [v23 renderInContext:UIGraphicsGetCurrentContext()];

  v24 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [MEMORY[0x1E4FA6220] setOverrideDate:v15];
  [MEMORY[0x1E4FA6220] setHidesSecondsHand:v16];
  v7[2](v7, v24, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SearchUIClockImage *)a3;
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
  }
  else if ([(SearchUIClockImage *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(SearchUIImage *)self sfImage];
    if (v5)
    {
    }
    else
    {
      v7 = [(SearchUIImage *)v4 sfImage];

      if (!v7)
      {
        v11.receiver = self;
        v11.super_class = (Class)SearchUIClockImage;
        unsigned __int8 v6 = [(SearchUIAppIconImage *)&v11 isEqual:v4];
        goto LABEL_9;
      }
    }
    v8 = [(SearchUIImage *)self sfImage];
    v9 = [(SearchUIImage *)v4 sfImage];
    unsigned __int8 v6 = [v8 isEqual:v9];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
LABEL_9:

  return v6;
}

@end