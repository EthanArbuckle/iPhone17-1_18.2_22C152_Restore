@interface PRContactAllowlist
- (PRContactAllowlist)init;
- (void)addTrustedContact:(id)a3 withCompletionHandler:(id)a4;
- (void)beaconListener:(id)a3 didChangeState:(unint64_t)a4;
- (void)beaconListener:(id)a3 didFailWithError:(id)a4;
- (void)clear:(id)a3;
- (void)removeTrustedContact:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation PRContactAllowlist

- (PRContactAllowlist)init
{
  v10.receiver = self;
  v10.super_class = (Class)PRContactAllowlist;
  v2 = [(PRContactAllowlist *)&v10 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.proximity", "PRContactAllowlist");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allowlist = v2->_allowlist;
    v2->_allowlist = v5;

    if (+[PRRangingDevice isSupported])
    {
      v7 = [[PRBeaconListener alloc] initWithDelegate:v2 queue:0];
      nearbyDaemonSession = v2->_nearbyDaemonSession;
      v2->_nearbyDaemonSession = v7;
    }
    v2->_needToRestart = 0;
  }
  return v2;
}

- (void)addTrustedContact:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  v8 = [PRRemoteDevice alloc];
  v9 = [v6 contactKey];
  objc_super v10 = [(PRRemoteDevice *)v8 initWithBTAdvAddress:v9];

  if ([(NSMutableArray *)self->_allowlist containsObject:v10])
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v12 = logger;
      v13 = [v6 contactKey];
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_19DFF5000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to add existing contact: %@", buf, 0xCu);
    }
    v7[2](v7, 1, 0);
  }
  else
  {
    unint64_t v14 = [(NSMutableArray *)self->_allowlist count];
    v15 = self->_logger;
    if (v14 < 5)
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
        -[PRContactAllowlist addTrustedContact:withCompletionHandler:](v15);
      }
      [(NSMutableArray *)self->_allowlist addObject:v10];
      [(PRBeaconListener *)self->_nearbyDaemonSession pushBeaconAllowlist:self->_allowlist completionHandler:v7];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        -[PRContactAllowlist addTrustedContact:withCompletionHandler:](v15);
      }
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v19 = @"Contact allowlist full";
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      v17 = PRErrorWithCodeAndUserInfo(400, v16);
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v17);
    }
  }
}

- (void)removeTrustedContact:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [PRRemoteDevice alloc];
  v9 = [v6 contactKey];
  objc_super v10 = [(PRRemoteDevice *)v8 initWithBTAdvAddress:v9];

  if ([(NSMutableArray *)self->_allowlist containsObject:v10])
  {
    [(NSMutableArray *)self->_allowlist removeObject:v10];
    if ([(NSMutableArray *)self->_allowlist count]) {
      [(PRBeaconListener *)self->_nearbyDaemonSession pushBeaconAllowlist:self->_allowlist completionHandler:v7];
    }
    else {
      [(PRContactAllowlist *)self clear:v7];
    }
  }
  else
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v12 = logger;
      v13 = [v6 contactKey];
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_19DFF5000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to remove unknown contact: %@", buf, 0xCu);
    }
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17 = @"Attempted to remove unknown contact";
    unint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v15 = PRErrorWithCodeAndUserInfo(401, v14);
    v7[2](v7, 0, v15);
  }
}

- (void)clear:(id)a3
{
  allowlist = self->_allowlist;
  id v5 = a3;
  [(NSMutableArray *)allowlist removeAllObjects];
  [(PRBeaconListener *)self->_nearbyDaemonSession clearBeaconAllowlistWithCompletionHandler:v5];
}

- (void)beaconListener:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19DFF5000, logger, OS_LOG_TYPE_DEFAULT, "PRBeaconListenerStateUnknown", (uint8_t *)buf, 2u);
      }
      if ([(NSMutableArray *)self->_allowlist count])
      {
        v8 = self->_logger;
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        LOWORD(buf[0]) = 0;
        goto LABEL_23;
      }
      break;
    case 1uLL:
      v9 = self->_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19DFF5000, v9, OS_LOG_TYPE_DEFAULT, "PRBeaconListenerStateIdle", (uint8_t *)buf, 2u);
      }
      if (self->_needToRestart)
      {
        if ([(NSMutableArray *)self->_allowlist count])
        {
          objc_super v10 = self->_logger;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_19DFF5000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to re-establish allowlist", (uint8_t *)buf, 2u);
          }
          objc_initWeak(buf, self);
          allowlist = self->_allowlist;
          nearbyDaemonSession = self->_nearbyDaemonSession;
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke;
          v16[3] = &unk_1E5999C50;
          objc_copyWeak(&v17, buf);
          [(PRBeaconListener *)nearbyDaemonSession pushBeaconAllowlist:allowlist completionHandler:v16];
          objc_destroyWeak(&v17);
          objc_destroyWeak(buf);
        }
        else if (self->_needToRestart)
        {
          v13 = self->_logger;
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_17;
          }
          LOWORD(buf[0]) = 0;
          unint64_t v14 = "needToRestart set but allowlist size is 0; clearing needToRestart";
          goto LABEL_16;
        }
      }
      break;
    case 2uLL:
      v13 = self->_logger;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        unint64_t v14 = "PRBeaconListenerStateListening";
LABEL_16:
        _os_log_impl(&dword_19DFF5000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)buf, 2u);
      }
LABEL_17:
      self->_needToRestart = 0;
      break;
    case 3uLL:
      v15 = self->_logger;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19DFF5000, v15, OS_LOG_TYPE_DEFAULT, "PRBeaconListenerStateUnavailable", (uint8_t *)buf, 2u);
      }
      if ([(NSMutableArray *)self->_allowlist count])
      {
        v8 = self->_logger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
LABEL_23:
          _os_log_impl(&dword_19DFF5000, v8, OS_LOG_TYPE_DEFAULT, "Need to restart!", (uint8_t *)buf, 2u);
        }
LABEL_24:
        self->_needToRestart = 1;
      }
      break;
    default:
      break;
  }
}

void __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a2)
  {
    v8 = WeakRetained[1];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 0;
      _os_log_impl(&dword_19DFF5000, v8, OS_LOG_TYPE_DEFAULT, "successfully re-allowlisted.", (uint8_t *)v11, 2u);
    }
  }
  else
  {
    v9 = WeakRetained[1];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v10) {
        __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke_cold_2(v9);
      }
    }
    else if (v10)
    {
      __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke_cold_1(v9);
    }
  }
}

- (void)beaconListener:(id)a3 didFailWithError:(id)a4
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR)) {
    -[PRContactAllowlist beaconListener:didFailWithError:](logger);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDaemonSession, 0);
  objc_storeStrong((id *)&self->_allowlist, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)addTrustedContact:(void *)a1 withCompletionHandler:.cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  os_log_t v3 = [(id)OUTLINED_FUNCTION_1_0() contactKey];
  v4[0] = 67109378;
  v4[1] = 5;
  __int16 v5 = 2112;
  id v6 = v3;
  _os_log_error_impl(&dword_19DFF5000, v1, OS_LOG_TYPE_ERROR, "Allowlist full! (limit %d) Attempted to add contact: %@", (uint8_t *)v4, 0x12u);
}

- (void)addTrustedContact:(void *)a1 withCompletionHandler:.cold.2(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  os_log_t v3 = [(id)OUTLINED_FUNCTION_1_0() contactKey];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_debug_impl(&dword_19DFF5000, v1, OS_LOG_TYPE_DEBUG, "Allowlisting contact: %@", (uint8_t *)&v4, 0xCu);
}

void __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19DFF5000, log, OS_LOG_TYPE_ERROR, "unknown ERROR during attempted restart.", v1, 2u);
}

void __52__PRContactAllowlist_beaconListener_didChangeState___block_invoke_cold_2(void *a1)
{
  id v2 = a1;
  os_log_t v3 = [(id)OUTLINED_FUNCTION_1_0() localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_19DFF5000, v4, v5, "ERROR during attempted restart: %@", v6, v7, v8, v9, 2u);
}

- (void)beaconListener:(void *)a1 didFailWithError:.cold.1(void *a1)
{
  id v2 = a1;
  os_log_t v3 = [(id)OUTLINED_FUNCTION_1_0() localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_19DFF5000, v4, v5, "ERROR: %@", v6, v7, v8, v9, 2u);
}

@end