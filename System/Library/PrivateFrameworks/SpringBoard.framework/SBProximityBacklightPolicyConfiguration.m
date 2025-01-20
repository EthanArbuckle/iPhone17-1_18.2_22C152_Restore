@interface SBProximityBacklightPolicyConfiguration
- (SBBacklightController)backlightController;
- (SBHIDUISensorModeController)sensorModeController;
- (SBProximitySettings)proximitySettings;
- (SBSystemGestureManager)systemGestureManager;
- (void)setBacklightController:(id)a3;
- (void)setProximitySettings:(id)a3;
- (void)setSensorModeController:(id)a3;
- (void)setSystemGestureManager:(id)a3;
@end

@implementation SBProximityBacklightPolicyConfiguration

- (SBBacklightController)backlightController
{
  return self->_backlightController;
}

- (void)setBacklightController:(id)a3
{
}

- (SBHIDUISensorModeController)sensorModeController
{
  return self->_sensorModeController;
}

- (void)setSensorModeController:(id)a3
{
}

- (SBSystemGestureManager)systemGestureManager
{
  return self->_systemGestureManager;
}

- (void)setSystemGestureManager:(id)a3
{
}

- (SBProximitySettings)proximitySettings
{
  return self->_proximitySettings;
}

- (void)setProximitySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySettings, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_sensorModeController, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
}

@end