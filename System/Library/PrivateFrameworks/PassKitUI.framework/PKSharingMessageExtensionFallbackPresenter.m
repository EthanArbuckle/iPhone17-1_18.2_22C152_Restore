@interface PKSharingMessageExtensionFallbackPresenter
+ (Class)messageClass;
+ (id)propertiesForMessage:(id)a3;
- (PKSharingMessageExtensionFallbackPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4;
- (PKSharingMessageExtensionMessage)message;
- (PKSharingMessageExtensionRenderer)renderer;
- (void)didTapMessage;
- (void)setMessage:(id)a3;
- (void)setRenderer:(id)a3;
- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5;
@end

@implementation PKSharingMessageExtensionFallbackPresenter

- (PKSharingMessageExtensionFallbackPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingMessageExtensionFallbackPresenter;
  v9 = [(PKSharingMessageExtensionFallbackPresenter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong((id *)&v10->_passLibrary, a4);
  }

  return v10;
}

+ (Class)messageClass
{
  return (Class)objc_opt_class();
}

- (PKSharingMessageExtensionMessage)message
{
  return (PKSharingMessageExtensionMessage *)self->_message;
}

- (void)setMessage:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_message, a3);
  }
}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v5 = a5;
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: validateForRecipients called for fallback template presenter. This shouldn't happen.", v7, 2u);
  }

  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void)didTapMessage
{
  if (![(PKSharingMessageExtensionCommonMessage *)self->_message isFromMe])
  {
    id v4 = [(PKSharingMessageExtensionCommonMessage *)self->_message actionURL];
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
      [WeakRetained openAppURL:v4];
    }
  }
}

+ (id)propertiesForMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  id v5 = [v3 title];
  [(PKSharingMessageExtensionViewProperties *)v4 setTitle:v5];

  v6 = [v3 topLeftTitle];
  [(PKSharingMessageExtensionViewProperties *)v4 setLeftTitleText:v6];

  id v7 = [v3 topRightTitle];
  [(PKSharingMessageExtensionViewProperties *)v4 setRightTitleText:v7];

  id v8 = [v3 subtitle];
  [(PKSharingMessageExtensionViewProperties *)v4 setSubtitle:v8];

  v9 = [v3 thumbnail];
  [(PKSharingMessageExtensionViewProperties *)v4 setCardImage:v9];

  v10 = [v3 buttonTitle];

  [(PKSharingMessageExtensionViewProperties *)v4 setButtonText:v10];

  return v4;
}

- (PKSharingMessageExtensionRenderer)renderer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);

  return (PKSharingMessageExtensionRenderer *)WeakRetained;
}

- (void)setRenderer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderer);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);

  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end