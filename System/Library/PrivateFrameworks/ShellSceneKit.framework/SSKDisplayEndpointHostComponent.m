@interface SSKDisplayEndpointHostComponent
+ (Protocol)settingsProtocol;
- (BOOL)wantsControlOfDisplay;
- (FBSDisplayConfigurationRequest)displayConfigurationRequest;
- (SSKDisplayArrangementItem)displayArrangementItem;
- (SSKDisplayEndpointHostComponentDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)updateDisplayConfiguration:(id)a3 completion:(id)a4;
- (void)updateRootWindow:(id)a3 completion:(id)a4;
@end

@implementation SSKDisplayEndpointHostComponent

- (void)updateDisplayConfiguration:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)updateRootWindow:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (BOOL)wantsControlOfDisplay
{
  return 0;
}

- (SSKDisplayArrangementItem)displayArrangementItem
{
  return 0;
}

- (FBSDisplayConfigurationRequest)displayConfigurationRequest
{
  return 0;
}

+ (Protocol)settingsProtocol
{
  return (Protocol *)&unk_2709CC1F0;
}

- (SSKDisplayEndpointHostComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSKDisplayEndpointHostComponentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end