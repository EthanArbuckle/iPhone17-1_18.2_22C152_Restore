@interface SBSpringBoardApplicationIcon
- (BOOL)canTightenLabel;
- (BOOL)canTruncateLabel;
- (BOOL)isUninstallSupported;
- (SBSpringBoardApplicationIcon)init;
- (SBSpringBoardApplicationIcon)initWithInterfaceStyle:(int64_t)a3;
- (SBSpringBoardApplicationIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4;
- (id)_generateImageWithInfo:(SBIconImageInfo *)a3;
- (id)displayNameForLocation:(id)a3;
@end

@implementation SBSpringBoardApplicationIcon

- (SBSpringBoardApplicationIcon)initWithInterfaceStyle:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSpringBoardApplicationIcon;
  v5 = [(SBLeafIcon *)&v10 initWithLeafIdentifier:@"com.apple.springboard" applicationBundleID:@"com.apple.springboard"];
  if (v5)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2) {
        goto LABEL_7;
      }
    }
    else
    {
      v6 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v7 = [v6 userInterfaceIdiom];

      if (v7 == 1)
      {
LABEL_7:
        v5->_interfaceStyle = a3;
        return v5;
      }
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:v5 file:@"SBSpringBoardApplicationIcon.m" lineNumber:20 description:@"This icon can only be created on iPad"];

    goto LABEL_7;
  }
  return v5;
}

- (SBSpringBoardApplicationIcon)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithInterfaceStyle_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSpringBoardApplicationIcon.m", 28, @"%s is unavailable; use %@ instead",
    "-[SBSpringBoardApplicationIcon init]",
    v5);

  return 0;
}

- (SBSpringBoardApplicationIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  uint64_t v7 = NSStringFromSelector(sel_initWithInterfaceStyle_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSpringBoardApplicationIcon.m", 32, @"%s is unavailable; use %@ instead",
    "-[SBSpringBoardApplicationIcon initWithLeafIdentifier:applicationBundleID:]",
    v7);

  return 0;
}

- (id)displayNameForLocation:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3);
  v4 = [v3 localizedStringForKey:@"COMMAND_TAB_SPRINGBOARD_DISPLAY_NAME" value:&stru_1F3084718 table:@"SpringBoard"];

  return v4;
}

- (BOOL)canTruncateLabel
{
  return 0;
}

- (BOOL)canTightenLabel
{
  return 0;
}

- (BOOL)isUninstallSupported
{
  return 0;
}

- (id)_generateImageWithInfo:(SBIconImageInfo *)a3
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  v37[1] = *MEMORY[0x1E4F143B8];
  int v12 = __sb__runningInSpringBoard();
  char v13 = v12;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_15;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom] != 1)
    {

      goto LABEL_15;
    }
  }
  int v14 = __sb__runningInSpringBoard();
  char v15 = v14;
  if (v14)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v17 = v16;
  double v18 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v15 & 1) == 0) {

  }
  if ((v13 & 1) == 0) {
  if (v17 >= v18)
  }
  {
    v19 = [@"SpringBoardAppIconiPad" stringByAppendingString:@"Large"];
    goto LABEL_16;
  }
LABEL_15:
  v19 = @"SpringBoardAppIconiPad";
LABEL_16:
  if (self->_interfaceStyle == 2) {
    v20 = @"Dark";
  }
  else {
    v20 = @"Light";
  }
  v21 = [(__CFString *)v19 stringByAppendingString:v20];

  v22 = [MEMORY[0x1E4F42A80] imageNamed:v21];
  id v23 = objc_alloc(MEMORY[0x1E4F6F238]);
  id v24 = v22;
  uint64_t v25 = [v24 CGImage];
  [v24 scale];
  v26 = objc_msgSend(v23, "initWithCGImage:scale:", v25);
  id v27 = objc_alloc(MEMORY[0x1E4F6F248]);
  v37[0] = v26;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v29 = (void *)[v27 initWithImages:v28];

  v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v10, v9, v8);
  v31 = [v29 imageForDescriptor:v30];
  v32 = v31;
  if (v31)
  {
    v33 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v34 = [v31 CGImage];
    [v32 scale];
    v35 = objc_msgSend(v33, "imageWithCGImage:scale:orientation:", v34, 0);
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

@end