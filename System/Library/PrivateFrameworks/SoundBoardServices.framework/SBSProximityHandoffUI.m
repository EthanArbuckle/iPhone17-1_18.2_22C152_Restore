@interface SBSProximityHandoffUI
- (SBSProximityHandoffUI)init;
- (SBSProximityHandoffUI)initWithTarget:(id)a3;
- (SBSProximityHandoffUIDelegate)delegate;
- (void)cancel:(id)a3;
- (void)cancelWithHandoffType:(unint64_t)a3 error:(id)a4;
- (void)complete;
- (void)completeWithHandoffType:(unint64_t)a3;
- (void)dealloc;
- (void)handoffCancelled;
- (void)handoffCompleted;
- (void)handoffInactive;
- (void)handoffStarted;
- (void)handoffUpdating;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)startWithArtworkColors:(id)a3;
- (void)startWithArtworkColors:(id)a3 handoffType:(unint64_t)a4;
- (void)startWithHandoffType:(unint64_t)a3;
- (void)updateIntensity:(float)a3;
- (void)updateIntensity:(float)a3 handoffType:(unint64_t)a4;
@end

@implementation SBSProximityHandoffUI

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (void)setDelegate:(id)a3
{
}

- (SBSProximityHandoffUIDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSProximityHandoffUIDelegate *)WeakRetained;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_sbConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSProximityHandoffUI;
  [(SBSProximityHandoffUI *)&v3 dealloc];
}

- (void)handoffUpdating
{
  objc_super v3 = _SBSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230B2C000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service updating.", v5, 2u);
  }

  v4 = [(SBSProximityHandoffUI *)self delegate];
  [v4 proximityHandoffUI:self stateTransition:3];
}

- (void)handoffStarted
{
  objc_super v3 = _SBSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230B2C000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service started.", v5, 2u);
  }

  v4 = [(SBSProximityHandoffUI *)self delegate];
  [v4 proximityHandoffUI:self stateTransition:2];
}

- (void)handoffInactive
{
  objc_super v3 = _SBSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230B2C000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service inactive.", v5, 2u);
  }

  v4 = [(SBSProximityHandoffUI *)self delegate];
  [v4 proximityHandoffUI:self stateTransition:4];
}

- (void)handoffCompleted
{
  objc_super v3 = _SBSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230B2C000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service completed.", v5, 2u);
  }

  v4 = [(SBSProximityHandoffUI *)self delegate];
  [v4 proximityHandoffUI:self stateTransition:1];
}

- (void)handoffCancelled
{
  objc_super v3 = _SBSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230B2C000, v3, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service cancelled.", v5, 2u);
  }

  v4 = [(SBSProximityHandoffUI *)self delegate];
  [v4 proximityHandoffUI:self stateTransition:0];
}

- (void)complete
{
}

- (void)cancel:(id)a3
{
}

- (void)updateIntensity:(float)a3
{
}

- (void)startWithArtworkColors:(id)a3
{
}

- (void)start
{
}

- (void)completeWithHandoffType:(unint64_t)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    v5 = _SBSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_230B2C000, v5, OS_LOG_TYPE_DEFAULT, "Proximity Handoff UI Service setting device as stereo leader.", v7, 2u);
    }

    v8 = @"reason";
    v9[0] = @"ProximityHandoffV2";
    v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [(SBSImplementer *)self->_sbProxy handoffSetDeviceAsStereoLeader:1 withOptions:v6];
  }
  [(SBSImplementer *)self->_sbProxy handoffCompleteWithHandoffType:a3];
}

- (void)cancelWithHandoffType:(unint64_t)a3 error:(id)a4
{
}

- (void)updateIntensity:(float)a3 handoffType:(unint64_t)a4
{
}

- (void)startWithArtworkColors:(id)a3 handoffType:(unint64_t)a4
{
}

- (void)startWithHandoffType:(unint64_t)a3
{
}

- (SBSProximityHandoffUI)initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSProximityHandoffUI;
  v5 = [(SBSProximityHandoffUI *)&v9 init];
  if (v5)
  {
    if ([v4 isEqualToString:@"localhost"]) {
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:v5 connection:&v5->_sbConnection];
    }
    else {
    uint64_t v6 = +[SBSUtils createProxyConnectionForRapportTarget:v4];
    }
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSImplementer *)v6;
  }
  return v5;
}

- (SBSProximityHandoffUI)init
{
  return [(SBSProximityHandoffUI *)self initWithTarget:@"localhost"];
}

@end