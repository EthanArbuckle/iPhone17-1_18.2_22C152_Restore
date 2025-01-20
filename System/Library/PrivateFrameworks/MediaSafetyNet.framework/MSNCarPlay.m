@interface MSNCarPlay
- (BOOL)carplayConnected;
- (MSNCarPlay)init;
- (void)init;
@end

@implementation MSNCarPlay

- (MSNCarPlay)init
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)MSNCarPlay;
  v2 = [(MSNCarPlay *)&v14 init];
  if (!v2)
  {
LABEL_13:
    v9 = v2;
    goto LABEL_14;
  }
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F74F70]) initWithPID:getpid()];
  systemController = v2->_systemController;
  v2->_systemController = (MXSystemController *)v3;

  if (!v2->_systemController)
  {
    v5 = MSNLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MSNCarPlay init](v5);
    }
    goto LABEL_9;
  }
  v17[0] = *MEMORY[0x1E4F769A0];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  MEMORY[0x1E01A2350]([(MXSystemController *)v2->_systemController setAttributeForKey:*MEMORY[0x1E4F76A38] andValue:v5]);
  int v6 = CMNotificationCenterAddListener();
  if (!v6)
  {
    id v13 = 0;
    [(MXSystemController *)v2->_systemController copyAttributeForKey:*MEMORY[0x1E4F76A20] withValueOut:&v13];
    v2->_BOOL carplayConnected = [v13 BOOLValue];
    v10 = MSNLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL carplayConnected = v2->_carplayConnected;
      *(_DWORD *)buf = 67109120;
      BOOL v16 = carplayConnected;
      _os_log_impl(&dword_1DC736000, v10, OS_LOG_TYPE_INFO, "Registered for CarPlay status changes with initial state: %{BOOL}d.", buf, 8u);
    }

    goto LABEL_13;
  }
  int v7 = v6;
  v8 = MSNLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(MSNCarPlay *)v7 init];
  }

LABEL_9:
  v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)carplayConnected
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSNLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL carplayConnected = self->_carplayConnected;
    v6[0] = 67109120;
    v6[1] = carplayConnected;
    _os_log_impl(&dword_1DC736000, v3, OS_LOG_TYPE_INFO, "CarPlay connected: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  return self->_carplayConnected;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DC736000, a2, OS_LOG_TYPE_ERROR, "CMNotificationCenterAddListener error %i", (uint8_t *)v2, 8u);
}

@end