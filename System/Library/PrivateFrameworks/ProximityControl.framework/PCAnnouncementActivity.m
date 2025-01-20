@interface PCAnnouncementActivity
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (PCAnnouncementActivity)init;
- (PCAnnouncementActivity)initWithActivity:(id)a3;
- (id)activityString;
- (id)bundleIdentifier;
- (id)description;
- (id)image;
- (unint64_t)pcactivityType;
@end

@implementation PCAnnouncementActivity

- (PCAnnouncementActivity)init
{
  v9[1] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)PCAnnouncementActivity;
  v2 = [(PCAnnouncementActivity *)&v7 initWithActivityType:@"com.apple.ProximityControl.activity.annoucement"];
  v3 = v2;
  if (v2)
  {
    makeIneligibleForProcessing(v2);
    v4 = +[PCLocalizedString localizedStringForKey:1];
    [(PCAnnouncementActivity *)v3 setTitle:v4];

    v8 = @"IS_ANNOUNCING";
    v9[0] = MEMORY[0x263EFFA88];
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [(PCAnnouncementActivity *)v3 setUserInfo:v5];
  }
  return v3;
}

- (PCAnnouncementActivity)initWithActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  int v6 = [@"com.apple.ProximityControl.activity.annoucement" isEqualToString:v5];

  if (v6)
  {
    objc_super v7 = [v4 activityType];
    v12.receiver = self;
    v12.super_class = (Class)PCAnnouncementActivity;
    v8 = [(PCAnnouncementActivity *)&v12 initWithActivityType:v7];

    if (v8)
    {
      makeIneligibleForProcessing(v8);
      v9 = [v4 userInfo];
      [(PCAnnouncementActivity *)v8 setUserInfo:v9];
    }
    self = v8;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)activityString
{
  return +[PCLocalizedString localizedStringForKey:1];
}

- (id)bundleIdentifier
{
  return @"com.apple.annouced";
}

- (id)description
{
  return +[PCLocalizedString localizedStringForKey:1];
}

- (id)image
{
  if (announceImage)
  {
    id v2 = (id)announceImage;
  }
  else
  {
    v3 = [MEMORY[0x263F1C6B0] systemImageNamed:@"waveform"];
    id v4 = [MEMORY[0x263F1C6C8] configurationWithPointSize:7 weight:32.0];
    v5 = [v3 imageWithConfiguration:v4];

    int v6 = [MEMORY[0x263F1C550] whiteColor];
    objc_super v7 = [v5 imageWithTintColor:v6 renderingMode:2];

    [v7 size];
    double v9 = v8;
    [v7 size];
    double height = v19.height;
    v19.width = v9;
    UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = v9;
    v22.size.double height = height;
    CGContextAddEllipseInRect(CurrentContext, v22);
    CGContextClosePath(CurrentContext);
    id v12 = [MEMORY[0x263F1C550] orangeColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v12 CGColor]);

    CGContextFillPath(CurrentContext);
    v13 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v20.width = v9;
    v20.double height = height;
    UIGraphicsBeginImageContext(v20);
    v14 = UIGraphicsGetCurrentContext();
    id v15 = [MEMORY[0x263F1C550] whiteColor];
    CGContextSetFillColorWithColor(v14, (CGColorRef)[v15 CGColor]);

    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = v9;
    v23.size.double height = height;
    CGContextFillRect(v14, v23);
    objc_msgSend(v7, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v9, height, 1.0);
    v16 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v21.width = v9;
    v21.double height = height;
    UIGraphicsBeginImageContext(v21);
    objc_msgSend(v13, "drawInRect:", 0.0, 0.0, v9, height);
    objc_msgSend(v16, "drawInRect:", 3.0, 3.0, v9 + -6.0, height + -6.0);
    UIGraphicsGetImageFromCurrentImageContext();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_storeStrong((id *)&announceImage, v2);
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  return [a3 pcactivityType] == 2;
}

- (BOOL)isValid
{
  id v2 = [(PCAnnouncementActivity *)self userInfo];
  v3 = [v2 allKeys];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (unint64_t)pcactivityType
{
  return 2;
}

@end