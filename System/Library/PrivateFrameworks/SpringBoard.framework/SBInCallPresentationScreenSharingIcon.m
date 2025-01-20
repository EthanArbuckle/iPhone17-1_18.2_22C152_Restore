@interface SBInCallPresentationScreenSharingIcon
- (id)displayNameForLocation:(id)a3;
- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3;
@end

@implementation SBInCallPresentationScreenSharingIcon

- (id)displayNameForLocation:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3);
  v4 = [v3 localizedStringForKey:@"SCREEN_SHARING" value:&stru_1F3084718 table:@"SpringBoard"];

  return v4;
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  v24[1] = *MEMORY[0x1E4F143B8];
  v9 = [MEMORY[0x1E4F42A80] imageNamed:@"ScreenSharingIcon"];
  id v10 = objc_alloc(MEMORY[0x1E4F6F238]);
  id v11 = v9;
  uint64_t v12 = [v11 CGImage];
  [v11 scale];
  v13 = objc_msgSend(v10, "initWithCGImage:scale:", v12);
  id v14 = objc_alloc(MEMORY[0x1E4F6F248]);
  v24[0] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v16 = (void *)[v14 initWithImages:v15];

  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v8, v7, v6);
  v18 = [v16 prepareImageForDescriptor:v17];
  v19 = v18;
  if (v18)
  {
    v20 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v21 = [v18 CGImage];
    [v19 scale];
    v22 = objc_msgSend(v20, "imageWithCGImage:scale:orientation:", v21, 0);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end