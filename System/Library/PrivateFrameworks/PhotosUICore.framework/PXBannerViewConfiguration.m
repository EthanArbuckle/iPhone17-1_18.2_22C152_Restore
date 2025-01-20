@interface PXBannerViewConfiguration
- (BOOL)wantsActionButton;
- (BOOL)wantsCancelButton;
- (NSString)actionButtonTitle;
- (NSString)cancelActionIdentifier;
- (NSString)cancelButtonTitle;
- (NSString)primaryActionIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (PXBannerViewConfiguration)init;
- (PXBannerViewConfiguration)initWithTitle:(id)a3 subtitle:(id)a4 actionButtonTitle:(id)a5 cancelButtonTitle:(id)a6 actionButtonHandler:(id)a7 cancelButtonHandler:(id)a8 primaryActionIdentifier:(id)a9 cancelActionIdentifier:(id)a10;
- (id)actionButtonHandler;
- (id)cancelButtonHandler;
@end

@implementation PXBannerViewConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelActionIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryActionIdentifier, 0);
  objc_storeStrong(&self->_cancelButtonHandler, 0);
  objc_storeStrong(&self->_actionButtonHandler, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)cancelActionIdentifier
{
  return self->_cancelActionIdentifier;
}

- (NSString)primaryActionIdentifier
{
  return self->_primaryActionIdentifier;
}

- (id)cancelButtonHandler
{
  return self->_cancelButtonHandler;
}

- (id)actionButtonHandler
{
  return self->_actionButtonHandler;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)wantsActionButton
{
  v3 = [(PXBannerViewConfiguration *)self actionButtonTitle];
  if (v3)
  {
    v4 = [(PXBannerViewConfiguration *)self actionButtonHandler];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)wantsCancelButton
{
  v2 = [(PXBannerViewConfiguration *)self cancelButtonHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

- (PXBannerViewConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXBannerView.m", 58, @"%s is not available as initializer", "-[PXBannerViewConfiguration init]");

  abort();
}

- (PXBannerViewConfiguration)initWithTitle:(id)a3 subtitle:(id)a4 actionButtonTitle:(id)a5 cancelButtonTitle:(id)a6 actionButtonHandler:(id)a7 cancelButtonHandler:(id)a8 primaryActionIdentifier:(id)a9 cancelActionIdentifier:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v46.receiver = self;
  v46.super_class = (Class)PXBannerViewConfiguration;
  v25 = [(PXBannerViewConfiguration *)&v46 init];
  if (!v25) {
    goto LABEL_7;
  }
  if (!v17)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, v25, @"PXBannerView.m", 42, @"Invalid parameter not satisfying: %@", @"title != nil" object file lineNumber description];

    if (v18) {
      goto LABEL_4;
    }
LABEL_9:
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, v25, @"PXBannerView.m", 43, @"Invalid parameter not satisfying: %@", @"subtitle != nil" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v18) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v19 == 0) != (v21 == 0))
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, v25, @"PXBannerView.m", 44, @"Invalid parameter not satisfying: %@", @"(actionButtonTitle == nil) == (actionButtonHandler == nil)" object file lineNumber description];
  }
  uint64_t v26 = [v17 copy];
  title = v25->_title;
  v25->_title = (NSString *)v26;

  uint64_t v28 = [v18 copy];
  subtitle = v25->_subtitle;
  v25->_subtitle = (NSString *)v28;

  uint64_t v30 = [v19 copy];
  actionButtonTitle = v25->_actionButtonTitle;
  v25->_actionButtonTitle = (NSString *)v30;

  uint64_t v32 = [v20 copy];
  cancelButtonTitle = v25->_cancelButtonTitle;
  v25->_cancelButtonTitle = (NSString *)v32;

  uint64_t v34 = [v21 copy];
  id actionButtonHandler = v25->_actionButtonHandler;
  v25->_id actionButtonHandler = (id)v34;

  uint64_t v36 = [v22 copy];
  id cancelButtonHandler = v25->_cancelButtonHandler;
  v25->_id cancelButtonHandler = (id)v36;

  uint64_t v38 = [v23 copy];
  primaryActionIdentifier = v25->_primaryActionIdentifier;
  v25->_primaryActionIdentifier = (NSString *)v38;

  uint64_t v40 = [v24 copy];
  cancelActionIdentifier = v25->_cancelActionIdentifier;
  v25->_cancelActionIdentifier = (NSString *)v40;

LABEL_7:
  return v25;
}

@end