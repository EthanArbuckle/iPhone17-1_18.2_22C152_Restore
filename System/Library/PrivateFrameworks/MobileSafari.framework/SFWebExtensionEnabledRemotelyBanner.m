@interface SFWebExtensionEnabledRemotelyBanner
- (SFWebExtensionEnabledRemotelyBanner)initWithExtension:(id)a3;
- (id)preferredButtonBackgroundColor;
- (id)preferredButtonTintColor;
- (void)addExtension:(id)a3;
@end

@implementation SFWebExtensionEnabledRemotelyBanner

- (SFWebExtensionEnabledRemotelyBanner)initWithExtension:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SFLinkBanner *)self init];
  if (v5)
  {
    v6 = _WBSLocalizedString();
    v7 = [(SFLinkBanner *)v5 titleLabel];
    [v7 setText:v6];

    v8 = [MEMORY[0x1E4F97ED0] sharedController];
    [v8 hasAnyExtensionManagement];

    v9 = NSString;
    v10 = _WBSLocalizedString();
    v11 = [v4 displayName];
    v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11);
    [(SFLinkBanner *)v5 setMessageLabelText:v12];

    v13 = [v4 icon];
    v14 = [(SFLinkBanner *)v5 icon];
    [v14 setImage:v13];

    v15 = [MEMORY[0x1E4F97ED0] sharedController];
    [v15 hasAnyExtensionManagement];

    v16 = _WBSLocalizedString();
    [(SFLinkBanner *)v5 setOpenButtonTitle:v16];

    v21[0] = v4;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    remotelyEnabledExtensions = v5->_remotelyEnabledExtensions;
    v5->_remotelyEnabledExtensions = (NSArray *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)addExtension:(id)a3
{
  id v4 = [(NSArray *)self->_remotelyEnabledExtensions arrayByAddingObject:a3];
  remotelyEnabledExtensions = self->_remotelyEnabledExtensions;
  self->_remotelyEnabledExtensions = v4;

  NSUInteger v6 = [(NSArray *)self->_remotelyEnabledExtensions count];
  v7 = _WBSLocalizedString();
  v8 = [(SFLinkBanner *)self titleLabel];
  [v8 setText:v7];

  v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"puzzlepiece.extension"];
  v10 = [(SFLinkBanner *)self icon];
  [v10 setImage:v9];

  v11 = [MEMORY[0x1E4F97ED0] sharedController];
  LODWORD(v10) = [v11 hasAnyExtensionManagement];

  if (v10)
  {
    if (v6 != 3)
    {
      if (v6 == 2)
      {
        v12 = NSString;
LABEL_8:
        v13 = _WBSLocalizedString();
        v14 = [(NSArray *)self->_remotelyEnabledExtensions objectAtIndexedSubscript:0];
        v15 = [v14 displayName];
        v16 = [(NSArray *)self->_remotelyEnabledExtensions objectAtIndexedSubscript:1];
        uint64_t v17 = [v16 displayName];
        objc_msgSend(v12, "stringWithFormat:", v13, v15, v17);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_16;
      }
      v19 = NSString;
      goto LABEL_15;
    }
    v18 = NSString;
LABEL_12:
    v13 = _WBSLocalizedString();
    v14 = [(NSArray *)self->_remotelyEnabledExtensions objectAtIndexedSubscript:0];
    v15 = [v14 displayName];
    v16 = [(NSArray *)self->_remotelyEnabledExtensions objectAtIndexedSubscript:1];
    uint64_t v17 = [v16 displayName];
    v20 = [(NSArray *)self->_remotelyEnabledExtensions objectAtIndexedSubscript:2];
    v21 = [v20 displayName];
    objc_msgSend(v18, "stringWithFormat:", v13, v15, v17, v21);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (v6 == 3)
  {
    v18 = NSString;
    goto LABEL_12;
  }
  if (v6 == 2)
  {
    v12 = NSString;
    goto LABEL_8;
  }
  v19 = NSString;
LABEL_15:
  v13 = _WBSLocalizedString();
  v14 = [(NSArray *)self->_remotelyEnabledExtensions firstObject];
  v15 = [v14 displayName];
  objc_msgSend(v19, "localizedStringWithFormat:", v13, v15, v6 - 1);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  [(SFLinkBanner *)self setMessageLabelText:v22];
}

- (id)preferredButtonBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGray5Color];
}

- (id)preferredButtonTintColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (void).cxx_destruct
{
}

@end