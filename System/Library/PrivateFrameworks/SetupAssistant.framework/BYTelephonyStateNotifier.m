@interface BYTelephonyStateNotifier
+ (unint64_t)retrieveSIMUnlockStateFromToken:(int)a3;
- (BYTelephonyStateNotifier)initWithNotificationQueue:(id)a3 notificationBlock:(id)a4;
- (id)initForNotifying;
- (int)simUnlockNotificationToken;
- (unint64_t)currentSIMUnlockState;
- (void)_beginObservingWithNotificationQueue:(id)a3 notificationBlock:(id)a4;
- (void)_endObservingState;
- (void)dealloc;
- (void)initForNotifying;
- (void)notifySIMUnlockStateChangedTo:(unint64_t)a3;
- (void)setSimUnlockNotificationToken:(int)a3;
@end

@implementation BYTelephonyStateNotifier

- (BYTelephonyStateNotifier)initWithNotificationQueue:(id)a3 notificationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYTelephonyStateNotifier;
  v8 = [(BYTelephonyStateNotifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_simUnlockNotificationToken = -1;
    if (v6)
    {
      if (v7) {
        [(BYTelephonyStateNotifier *)v8 _beginObservingWithNotificationQueue:v6 notificationBlock:v7];
      }
    }
  }

  return v9;
}

- (id)initForNotifying
{
  v5.receiver = self;
  v5.super_class = (Class)BYTelephonyStateNotifier;
  v2 = [(BYTelephonyStateNotifier *)&v5 init];
  if (v2 && notify_register_check("com.apple.purplebuddy.simUnlockStateChanged", &v2->_simUnlockNotificationToken))
  {
    v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[BYTelephonyStateNotifier initForNotifying]();
    }

    v2->_simUnlockNotificationToken = -1;
  }
  return v2;
}

- (void)dealloc
{
  [(BYTelephonyStateNotifier *)self _endObservingState];
  v3.receiver = self;
  v3.super_class = (Class)BYTelephonyStateNotifier;
  [(BYTelephonyStateNotifier *)&v3 dealloc];
}

- (unint64_t)currentSIMUnlockState
{
  objc_super v3 = objc_opt_class();
  uint64_t v4 = [(BYTelephonyStateNotifier *)self simUnlockNotificationToken];
  return [v3 retrieveSIMUnlockStateFromToken:v4];
}

- (void)notifySIMUnlockStateChangedTo:(unint64_t)a3
{
  BOOL is_valid_token = notify_is_valid_token([(BYTelephonyStateNotifier *)self simUnlockNotificationToken]);
  id v6 = _BYLoggingFacility();
  id v7 = v6;
  if (!is_valid_token)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:].cold.4(v7);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:](v7);
  }

  if (notify_set_state([(BYTelephonyStateNotifier *)self simUnlockNotificationToken], a3))
  {
    v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:]();
    }
  }
  if (notify_post("com.apple.purplebuddy.simUnlockStateChanged"))
  {
    id v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:]();
    }
LABEL_13:
  }
}

- (void)_beginObservingWithNotificationQueue:(id)a3 notificationBlock:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__BYTelephonyStateNotifier__beginObservingWithNotificationQueue_notificationBlock___block_invoke;
  v10[3] = &unk_1E5D2CD40;
  p_simUnlockNotificationToken = &self->_simUnlockNotificationToken;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  if (notify_register_dispatch("com.apple.purplebuddy.simUnlockStateChanged", p_simUnlockNotificationToken, (dispatch_queue_t)a3, v10))
  {
    v9 = _BYLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BYTelephonyStateNotifier initForNotifying]();
    }
  }
}

uint64_t __83__BYTelephonyStateNotifier__beginObservingWithNotificationQueue_notificationBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  [(id)objc_opt_class() retrieveSIMUnlockStateFromToken:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_endObservingState
{
  if (notify_is_valid_token([(BYTelephonyStateNotifier *)self simUnlockNotificationToken])) {
    notify_cancel([(BYTelephonyStateNotifier *)self simUnlockNotificationToken]);
  }
  [(BYTelephonyStateNotifier *)self setSimUnlockNotificationToken:0xFFFFFFFFLL];
}

+ (unint64_t)retrieveSIMUnlockStateFromToken:(int)a3
{
  if (!notify_is_valid_token(a3))
  {
    objc_super v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[BYTelephonyStateNotifier retrieveSIMUnlockStateFromToken:](v5);
    }

    return 0;
  }
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64))
  {
    uint64_t v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[BYTelephonyStateNotifier retrieveSIMUnlockStateFromToken:]();
    }

    return 0;
  }
  return state64;
}

- (int)simUnlockNotificationToken
{
  return self->_simUnlockNotificationToken;
}

- (void)setSimUnlockNotificationToken:(int)a3
{
  self->_simUnlockNotificationToken = a3;
}

- (void)initForNotifying
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A7DED000, v0, v1, "Failed to register for the SIM unlock state notification: %d", v2, v3, v4, v5, v6);
}

- (void)notifySIMUnlockStateChangedTo:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A7DED000, v0, v1, "Failed to post SIM unlock state notification: %d", v2, v3, v4, v5, v6);
}

- (void)notifySIMUnlockStateChangedTo:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A7DED000, v0, v1, "Failed to update SIM unlock state notification: %d", v2, v3, v4, v5, v6);
}

- (void)notifySIMUnlockStateChangedTo:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A7DED000, log, OS_LOG_TYPE_DEBUG, "Updating SIM unlock state notification...", v1, 2u);
}

- (void)notifySIMUnlockStateChangedTo:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Unable to update SIM unlock state notification; notification token is invalid!",
    v1,
    2u);
}

+ (void)retrieveSIMUnlockStateFromToken:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1A7DED000, v0, v1, "Failed to get the state of the SIM unlock state notification: %d", v2, v3, v4, v5, v6);
}

+ (void)retrieveSIMUnlockStateFromToken:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7DED000, log, OS_LOG_TYPE_ERROR, "Failed to get the state of the SIM unlock state notification; notification token is invalid!",
    v1,
    2u);
}

@end