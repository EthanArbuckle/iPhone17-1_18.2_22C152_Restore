@interface SBFMotionAlarmController
- (CMMotionAlarmManager)motionAlarmManager;
- (SBFMotionAlarmController)init;
- (SBFMotionAlarmDelegate)delegate;
- (void)_notifyDelegate;
- (void)_registerMotionAlarm;
- (void)_unregisterMotionAlarm;
- (void)alarmDidFire:(id)a3 error:(id)a4;
- (void)alarmDidRegister:(id)a3 error:(id)a4;
- (void)alarmDidUnregister:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMotionAlarmManager:(id)a3;
@end

@implementation SBFMotionAlarmController

- (SBFMotionAlarmController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFMotionAlarmController;
  v2 = [(SBFMotionAlarmController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F22228]) initWithName:@"com.apple.SpringBoard.MotionAlarmController"];
    motionAlarmManager = v2->_motionAlarmManager;
    v2->_motionAlarmManager = (CMMotionAlarmManager *)v3;

    [(CMMotionAlarmManager *)v2->_motionAlarmManager setDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(SBFMotionAlarmController *)self _unregisterMotionAlarm];
  motionAlarmManager = self->_motionAlarmManager;
  self->_motionAlarmManager = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)SBFMotionAlarmController;
  [(SBFMotionAlarmController *)&v4 dealloc];
}

- (void)_notifyDelegate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = SBLogMotionAlarm();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = WeakRetained;
      _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, "Notifying delegate: %@ of device motion", (uint8_t *)&v4, 0xCu);
    }

    [WeakRetained didDetectDeviceMotion];
  }
}

- (void)_registerMotionAlarm
{
  uint64_t v3 = SBLogMotionAlarm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, "Registering motion alarms", v4, 2u);
  }

  [(CMMotionAlarmManager *)self->_motionAlarmManager registerAlarmWithName:@"com.apple.SpringBoard.MotionAlarmTypePickUp" type:8 duration:0 repeats:0 error:0];
  [(CMMotionAlarmManager *)self->_motionAlarmManager registerAlarmWithName:@"com.apple.SpringBoard.MotionAlarmTypeMoving" type:1 duration:0 repeats:0 error:0];
}

- (void)_unregisterMotionAlarm
{
  uint64_t v3 = SBLogMotionAlarm();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_18B52E000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering motion alarms", v4, 2u);
  }

  [(CMMotionAlarmManager *)self->_motionAlarmManager unregisterAlarmWithName:@"com.apple.SpringBoard.MotionAlarmTypePickUp" error:0];
  [(CMMotionAlarmManager *)self->_motionAlarmManager unregisterAlarmWithName:@"com.apple.SpringBoard.MotionAlarmTypeMoving" error:0];
}

- (void)alarmDidFire:(id)a3 error:(id)a4
{
  int v5 = [a3 type];
  if (v5 == 8 || v5 == 1)
  {
    uint64_t v6 = SBLogMotionAlarm();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18B52E000, v6, OS_LOG_TYPE_DEFAULT, "Motion alarm detected", v7, 2u);
    }

    [(SBFMotionAlarmController *)self _notifyDelegate];
  }
}

- (void)alarmDidRegister:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = SBLogMotionAlarm();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBFMotionAlarmController alarmDidRegister:error:](v5, v6);
  }
}

- (void)alarmDidUnregister:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = SBLogMotionAlarm();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBFMotionAlarmController alarmDidUnregister:error:](v5, v6);
  }
}

- (SBFMotionAlarmDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFMotionAlarmDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CMMotionAlarmManager)motionAlarmManager
{
  return self->_motionAlarmManager;
}

- (void)setMotionAlarmManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionAlarmManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)alarmDidRegister:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 name];
  int v4 = [a2 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18B52E000, v5, v6, "Motion alarm registered: %@, error: %@", v7, v8, v9, v10, v11);
}

- (void)alarmDidUnregister:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 name];
  int v4 = [a2 description];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_18B52E000, v5, v6, "Motion alarm unregistered: %@, error: %@", v7, v8, v9, v10, v11);
}

@end