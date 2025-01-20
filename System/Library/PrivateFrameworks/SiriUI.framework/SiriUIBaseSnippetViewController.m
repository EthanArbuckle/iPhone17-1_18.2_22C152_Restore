@interface SiriUIBaseSnippetViewController
- (AceObject)aceObject;
- (BOOL)hasSash;
- (BOOL)isInAmbient;
- (BOOL)isUtteranceUserInteractionEnabled;
- (NSUUID)instrumentationTurnIdentifier;
- (SiriUIBaseAceObjectViewControllerDelegate)delegate;
- (SiriUISashItem)sashItem;
- (double)desiredHeight;
- (void)setAceObject:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInstrumentationTurnIdentifier:(id)a3;
- (void)setUtteranceUserInteractionEnabled:(BOOL)a3;
@end

@implementation SiriUIBaseSnippetViewController

- (SiriUISashItem)sashItem
{
  sashItem = self->_sashItem;
  if (!sashItem)
  {
    v4 = [(SiriUIBaseSnippetViewController *)self snippet];
    v5 = [v4 sash];

    if (v5)
    {
      v6 = [v5 applicationBundleIdentifier];
      uint64_t v7 = [v5 title];
      v8 = [v5 backgroundColor];
      v9 = [v5 textColor];
      uint64_t v10 = [v5 image];
      if ([v6 isEqualToString:@"com.apple.mobilesafari"])
      {
        uint64_t v11 = +[SiriUIUtilities defaultBrowserBundleIdentifier];

        v6 = (void *)v11;
      }
      v47 = (void *)v10;
      if (v6)
      {
        v46 = v9;
        if ([v6 isEqualToString:@"com.apple.ApplePayCash"])
        {
          v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          [MEMORY[0x263F1C6B0] imageNamed:@"ApplePay" inBundle:v12];
          v14 = v13 = v8;
          [MEMORY[0x263F1C920] mainScreen];
          v16 = uint64_t v15 = v7;
          [v16 scale];
          v17 = objc_msgSend(v14, "_applicationIconImageForFormat:precomposed:scale:", 5, 0);

          uint64_t v7 = v15;
          v8 = v13;
          v18 = [(SiriSharedUISashItem *)[SiriUISashItem alloc] initWithTitle:v15 image:v17];
          v19 = self->_sashItem;
          self->_sashItem = v18;

          uint64_t v10 = (uint64_t)v47;
        }
        else
        {
          v21 = [(SiriSharedUISashItem *)[SiriUISashItem alloc] initWithApplicationBundleIdentifier:v6];
          v12 = v21;
          if (v21)
          {
            v22 = v21;
          }
          else
          {
            v22 = +[SiriUISashItem defaultSashItem];
          }
          v24 = self->_sashItem;
          self->_sashItem = v22;
        }
LABEL_16:

        if (v7) {
          [(SiriUISashItem *)self->_sashItem setTitle:v7];
        }
        if (!v10) {
          goto LABEL_24;
        }
        v25 = [v47 resourceUrl];
        int v26 = [v25 isFileURL];

        if (v26)
        {
          uint64_t v44 = v7;
          v45 = v8;
          v43 = self->_sashItem;
          v27 = (void *)MEMORY[0x263F1C6B0];
          v28 = [v47 resourceUrl];
          v29 = [v28 path];
          v30 = [v29 lastPathComponent];
          v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v32 = [v27 imageNamed:v30 inBundle:v31 compatibleWithTraitCollection:0];
          [(SiriUISashItem *)v43 setImage:v32];

          uint64_t v7 = v44;
        }
        else
        {
          v33 = [v47 imageData];

          if (!v33)
          {
LABEL_24:
            if (v8)
            {
              v36 = self->_sashItem;
              v37 = objc_msgSend(MEMORY[0x263F1C550], "siriui_colorWithAceColor:", v8);
              [(SiriSharedUISashItem *)v36 setBackgroundColor:v37];
            }
            if (v46)
            {
              v38 = self->_sashItem;
              v39 = objc_msgSend(MEMORY[0x263F1C550], "siriui_colorWithAceColor:", v46);
              [(SiriSharedUISashItem *)v38 setTextColor:v39];
            }
            [(SiriSharedUISashItem *)self->_sashItem setRequestsExtraPadding:1];
            v40 = self->_sashItem;
            v41 = [v5 commands];
            [(SiriSharedUISashItem *)v40 setCommands:v41];

            sashItem = self->_sashItem;
            goto LABEL_29;
          }
          v45 = v8;
          v34 = self->_sashItem;
          v35 = (void *)MEMORY[0x263F1C6B0];
          v28 = [v47 imageData];
          v29 = [v35 imageWithData:v28];
          [(SiriUISashItem *)v34 setImage:v29];
        }

        v8 = v45;
        goto LABEL_24;
      }
      if (v7 | v10)
      {
        v46 = v9;
        v20 = objc_alloc_init(SiriUISashItem);
        v12 = self->_sashItem;
        self->_sashItem = v20;
        goto LABEL_16;
      }
    }
    v23 = 0;
    goto LABEL_30;
  }
LABEL_29:
  v23 = sashItem;
LABEL_30:
  return v23;
}

- (BOOL)hasSash
{
  v2 = [(SiriUIBaseSnippetViewController *)self sashItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isInAmbient
{
  return 0;
}

- (double)desiredHeight
{
  return 0.0;
}

- (AceObject)aceObject
{
  return self->aceObject;
}

- (void)setAceObject:(id)a3
{
}

- (BOOL)isUtteranceUserInteractionEnabled
{
  return self->_utteranceUserInteractionEnabled;
}

- (void)setUtteranceUserInteractionEnabled:(BOOL)a3
{
  self->_utteranceUserInteractionEnabled = a3;
}

- (SiriUIBaseAceObjectViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUIBaseAceObjectViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)instrumentationTurnIdentifier
{
  return self->_instrumentationTurnIdentifier;
}

- (void)setInstrumentationTurnIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationTurnIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sashItem, 0);
  objc_storeStrong((id *)&self->aceObject, 0);
}

@end