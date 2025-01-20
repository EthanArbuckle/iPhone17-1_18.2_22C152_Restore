@interface PKCredentialProvisioningView
- (PKCredentialProvisioningView)initWithContext:(id)a3;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation PKCredentialProvisioningView

- (PKCredentialProvisioningView)initWithContext:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKCredentialProvisioningView;
  v6 = [(PKProvisioningProgressView *)&v28 init];
  v7 = v6;
  if (v6)
  {
    p_context = (id *)&v6->_context;
    objc_storeStrong((id *)&v6->_context, a3);
    v9 = [*p_context configuration];
    char v10 = [v9 supportedRadioTechnologies];

    v7->_supportsUWB = (v10 & 2) >> 1;
    if ((v10 & 2) != 0) {
      v11 = @"CAR_KEY_PAIRING_UWB_BODY";
    }
    else {
      v11 = @"CAR_KEY_PAIRING_BODY";
    }
    v12 = [*p_context configuration];
    uint64_t v13 = [v12 provisioningTemplateIdentifier];
    templateIdentifier = v7->_templateIdentifier;
    v7->_templateIdentifier = (NSString *)v13;

    v15 = [MEMORY[0x1E4F84EC8] sharedInstance];
    v16 = [v15 provisioningString:@"CAR_KEY_PAIRING_PROGRESS_TITLE" templateIdentifier:v7->_templateIdentifier];
    if (v16)
    {
      [(PKProvisioningProgressView *)v7 setPrimaryText:v16];
    }
    else
    {
      v17 = PKLocalizedCredentialString(&cfstr_CarKeyPairingP_0.isa);
      [(PKProvisioningProgressView *)v7 setPrimaryText:v17];
    }
    v18 = [(PKProvisioningProgressView *)v7 secondaryLabel];
    v19 = [v15 provisioningString:v11 templateIdentifier:v7->_templateIdentifier];
    if (v19)
    {
      [v18 setText:v19];
    }
    else
    {
      v20 = PKLocalizedCredentialString(&v11->isa);
      [v18 setText:v20];
    }
    v21 = [(PKProvisioningProgressView *)v7 progressLabel];
    v22 = [v15 provisioningString:@"CAR_KEY_PAIRING_CONNECTING" templateIdentifier:v7->_templateIdentifier];
    if (v22)
    {
      [v21 setText:v22];
    }
    else
    {
      v23 = PKLocalizedCredentialString(&cfstr_CarKeyPairingC.isa);
      [v21 setText:v23];
    }
    v24 = [PKCredentialPairingExplanationHeaderView alloc];
    v25 = [*p_context configuration];
    v26 = [(PKCredentialPairingExplanationHeaderView *)v24 initWithConfiguration:v25];
    [(PKProvisioningProgressView *)v7 setHeaderView:v26];
  }
  return v7;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    id v17 = [(PKProvisioningProgressView *)self progressView];
    id v5 = [(PKProvisioningProgressView *)self progressLabel];
    v7 = v5;
    switch(a3)
    {
      case 0:
        [v5 setText:0];
        break;
      case 2:
      case 5:
      case 6:
      case 8:
        [v17 setProgress:0.0];
        [v17 setHidden:0];
        [v7 setHidden:0];
        break;
      case 7:
        v8 = [MEMORY[0x1E4F84EC8] sharedInstance];
        v9 = [v8 provisioningString:@"CAR_KEY_PAIRING_PROGRESS" templateIdentifier:self->_templateIdentifier];
        if (v9)
        {
          [v7 setText:v9];
        }
        else
        {
          v15 = PKLocalizedCredentialString(&cfstr_CarKeyPairingP.isa);
          [v7 setText:v15];
        }
        LODWORD(v10) = 0.75;
        if (!self->_supportsUWB) {
          *(float *)&double v10 = 0.5;
        }
        double v11 = 15.0;
        if (!self->_supportsUWB) {
          double v11 = 3.0;
        }
        goto LABEL_17;
      case 11:
        double v10 = 5.0;
        double v11 = 2.0;
        if (self->_supportsUWB) {
          double v11 = 5.0;
        }
        LODWORD(v10) = 1065017672;
LABEL_17:
        [v17 _setProgressAnimated:196612 duration:v10 delay:v11 options:0.0];
        break;
      case 16:
        LODWORD(v6) = 1.0;
        [v17 _setProgressAnimated:196612 duration:v6 delay:0.5 options:0.0];
        v12 = [(PKProvisioningProgressView *)self secondaryLabel];
        uint64_t v13 = [MEMORY[0x1E4F84EC8] sharedInstance];
        v14 = [v13 provisioningString:@"CAR_KEY_PAIRING_FINISHED_BODY" templateIdentifier:self->_templateIdentifier];
        if (v14)
        {
          [v12 setText:v14];
        }
        else
        {
          v16 = PKLocalizedCredentialString(&cfstr_CarKeyPairingF.isa);
          [v12 setText:v16];
        }
        break;
      default:
        break;
    }
  }
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateIdentifier, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end