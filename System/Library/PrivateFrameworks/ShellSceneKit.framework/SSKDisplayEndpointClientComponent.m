@interface SSKDisplayEndpointClientComponent
+ (Protocol)settingsProtocol;
- (BOOL)hasControlOfDisplay;
- (BOOL)wantsControlOfDisplay;
- (FBSDisplayConfigurationRequest)displayConfigurationRequest;
- (SSKDisplayArrangementItem)displayArrangementItem;
- (SSKDisplayEndpointDelegate)delegate;
- (UIRootSceneWindow)rootWindow;
- (unint64_t)currentDeactivationReasons;
- (unint64_t)priorityLevel;
- (void)setDelegate:(id)a3;
@end

@implementation SSKDisplayEndpointClientComponent

- (BOOL)wantsControlOfDisplay
{
  return 0;
}

- (unint64_t)priorityLevel
{
  return 0;
}

- (FBSDisplayConfigurationRequest)displayConfigurationRequest
{
  return 0;
}

- (SSKDisplayArrangementItem)displayArrangementItem
{
  return 0;
}

- (BOOL)hasControlOfDisplay
{
  return 0;
}

- (unint64_t)currentDeactivationReasons
{
  return 0;
}

- (UIRootSceneWindow)rootWindow
{
  return 0;
}

+ (Protocol)settingsProtocol
{
  return (Protocol *)&unk_2709CC250;
}

- (SSKDisplayEndpointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSKDisplayEndpointDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end