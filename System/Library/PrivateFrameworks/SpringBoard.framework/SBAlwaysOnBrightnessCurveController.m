@interface SBAlwaysOnBrightnessCurveController
- (BOOL)isUsingAlwaysOnBrightnessCurve;
- (SBAlwaysOnBrightnessCurveController)init;
- (SBAlwaysOnBrightnessCurveController)initWithBrightnessSystemClient:(id)a3;
- (void)setUseAlwaysOnBrightnessCurve:(BOOL)a3 withRampDuration:(double)a4;
@end

@implementation SBAlwaysOnBrightnessCurveController

- (SBAlwaysOnBrightnessCurveController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F5B290]);
  v4 = [(SBAlwaysOnBrightnessCurveController *)self initWithBrightnessSystemClient:v3];

  return v4;
}

- (SBAlwaysOnBrightnessCurveController)initWithBrightnessSystemClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAlwaysOnBrightnessCurveController;
  v6 = [(SBAlwaysOnBrightnessCurveController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_brightnessSystemClient, a3);
    v7->_lock_useAlwaysOnBrightnessCurve = 0;
    [(SBAlwaysOnBrightnessCurveController *)v7 setUseAlwaysOnBrightnessCurve:0 withRampDuration:0.25];
  }

  return v7;
}

- (BOOL)isUsingAlwaysOnBrightnessCurve
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_useAlwaysOnBrightnessCurve;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUseAlwaysOnBrightnessCurve:(BOOL)a3 withRampDuration:(double)a4
{
  BOOL v5 = a3;
  v18[2] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_useAlwaysOnBrightnessCurve = v5;
  os_unfair_lock_unlock(p_lock);
  v17[0] = @"AOTState";
  v8 = [NSNumber numberWithInteger:v5];
  v17[1] = @"AOTTransitionTime";
  v18[0] = v8;
  objc_super v9 = [NSNumber numberWithDouble:a4];
  v18[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  v11 = SBLogBacklight();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12[0] = 67109634;
    v12[1] = v5;
    __int16 v13 = 2048;
    double v14 = a4;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "setUseAlwaysOnBrightnessCurve:%{BOOL}u duration:%.2fs set to %{public}@", (uint8_t *)v12, 0x1Cu);
  }

  [(BrightnessSystemClient *)self->_brightnessSystemClient setProperty:v10 forKey:@"CBAOTStateUpdate"];
}

- (void).cxx_destruct
{
}

@end