@interface UIBoxInviteActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isiWorkFile;
- (NSAttributedString)boxFooterText;
- (id)_actionImage;
- (id)_activityFooterText;
- (id)activityTitle;
- (void)setBoxFooterText:(id)a3;
- (void)setIsiWorkFile:(BOOL)a3;
@end

@implementation UIBoxInviteActivity

- (id)activityTitle
{
  if ([(UIBoxInviteActivity *)self isiWorkFile])
  {
    v3 = _ShareSheetBundle();
    v4 = [v3 localizedStringForKey:@"BoxInvite[Activity]" value:@"Invite People on Box" table:@"Localizable"];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIBoxInviteActivity;
    v4 = [(UIApplicationExtensionActivity *)&v6 activityTitle];
  }
  return v4;
}

- (id)_actionImage
{
  if ([(UIBoxInviteActivity *)self isiWorkFile])
  {
    v3 = (void *)MEMORY[0x1E4FB1818];
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v3 imageNamed:@"Box" inBundle:v4];

    objc_super v6 = objc_opt_class();
    v7 = [(UIActivity *)self contentSizeCategory];
    v8 = [v6 _actionImageForActionRepresentationImage:v5 contentSizeCategory:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIBoxInviteActivity;
    v8 = [(UIApplicationExtensionActivity *)&v10 _actionImage];
  }
  return v8;
}

- (id)_activityFooterText
{
  v28[2] = *MEMORY[0x1E4F143B8];
  if ([(UIBoxInviteActivity *)self isiWorkFile])
  {
    v3 = [(UIBoxInviteActivity *)self boxFooterText];

    if (v3)
    {
      v4 = [(UIBoxInviteActivity *)self boxFooterText];
    }
    else
    {
      v5 = _ShareSheetBundle();
      objc_super v6 = [v5 localizedStringForKey:@"BOX_FOOTER_LINK" value:@"Learn More…" table:@"Localizable"];

      v7 = _ShareSheetBundle();
      v23 = [v7 localizedStringForKey:@"BOX_FOOTER" value:@"Collaborate with other people in real time on this file stored in Box. %@" table:@"Localizable"];

      v22 = objc_msgSend(NSString, "stringWithFormat:", v23, v6);
      uint64_t v8 = [v6 length];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v22];
      uint64_t v26 = *MEMORY[0x1E4FB12B0];
      uint64_t v10 = v26;
      uint64_t v11 = *MEMORY[0x1E4FB28F0];
      v12 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
      v28[0] = v12;
      uint64_t v27 = *MEMORY[0x1E4FB12B8];
      uint64_t v13 = v27;
      v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v28[1] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v26 count:2];

      objc_msgSend(v9, "setAttributes:range:", v15, 0, objc_msgSend(v9, "length") - v8);
      uint64_t v16 = *MEMORY[0x1E4FB12C8];
      v25[0] = @"https://support.apple.com/en-us/HT207876";
      v24[0] = v16;
      v24[1] = v10;
      v17 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v11];
      v25[1] = v17;
      v24[2] = v13;
      v18 = [MEMORY[0x1E4FB1618] systemBlueColor];
      v25[2] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

      objc_msgSend(v9, "setAttributes:range:", v19, objc_msgSend(v9, "length") - v8, v8);
      v20 = (void *)[v9 copy];
      [(UIBoxInviteActivity *)self setBoxFooterText:v20];

      v4 = [(UIBoxInviteActivity *)self boxFooterText];
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 isiWorkDocument])
        {
          [(UIBoxInviteActivity *)self setIsiWorkFile:1];
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  v12.receiver = self;
  v12.super_class = (Class)UIBoxInviteActivity;
  BOOL v10 = [(UIFileProviderApplicationExtensionActivity *)&v12 canPerformWithActivityItems:v4];

  return v10;
}

- (BOOL)isiWorkFile
{
  return self->_isiWorkFile;
}

- (void)setIsiWorkFile:(BOOL)a3
{
  self->_isiWorkFile = a3;
}

- (NSAttributedString)boxFooterText
{
  return self->_boxFooterText;
}

- (void)setBoxFooterText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end