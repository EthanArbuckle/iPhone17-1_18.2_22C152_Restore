@interface TIKeyboardSecureTouchManager
+ (id)sharedInstance;
- (BKSHIDEventAuthenticationMessage)lastEventAuthenticationMessage;
- (BOOL)bypassCommunication;
- (BOOL)verifySlotID:(unsigned int)a3;
- (NSMutableDictionary)slots;
- (TIKeyboardSecureTouchManager)init;
- (unint64_t)authenticationMessageContextForSlotID:(unsigned int)a3;
- (unint64_t)lastVerifiedMessageTimestamp;
- (void)clearRegistrations;
- (void)registerSlotID:(unsigned int)a3;
- (void)setBypassCommunication:(BOOL)a3;
- (void)setLastEventAuthenticationMessage:(id)a3;
- (void)setLastVerifiedMessageTimestamp:(unint64_t)a3;
- (void)setSlots:(id)a3;
@end

@implementation TIKeyboardSecureTouchManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEventAuthenticationMessage, 0);

  objc_storeStrong((id *)&self->_slots, 0);
}

- (void)setBypassCommunication:(BOOL)a3
{
  self->_bypassCommunication = a3;
}

- (BOOL)bypassCommunication
{
  return self->_bypassCommunication;
}

- (void)setLastVerifiedMessageTimestamp:(unint64_t)a3
{
  self->_lastVerifiedMessageTimestamp = a3;
}

- (unint64_t)lastVerifiedMessageTimestamp
{
  return self->_lastVerifiedMessageTimestamp;
}

- (void)setLastEventAuthenticationMessage:(id)a3
{
}

- (BKSHIDEventAuthenticationMessage)lastEventAuthenticationMessage
{
  return self->_lastEventAuthenticationMessage;
}

- (void)setSlots:(id)a3
{
}

- (NSMutableDictionary)slots
{
  return self->_slots;
}

- (unint64_t)authenticationMessageContextForSlotID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(TIKeyboardSecureTouchManager *)self slots];
  v5 = [NSNumber numberWithUnsignedInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];
  unint64_t v7 = [v6 authenticationMessageContext];

  return v7;
}

- (BOOL)verifySlotID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    v22 = "-[TIKeyboardSecureTouchManager verifySlotID:]";
    __int16 v23 = 1024;
    LODWORD(v24) = v3;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Verifying slotID %X", (uint8_t *)&v21, 0x12u);
  }
  v5 = [(TIKeyboardSecureTouchManager *)self slots];
  v6 = [NSNumber numberWithUnsignedInt:v3];
  unint64_t v7 = [v5 objectForKey:v6];

  uint64_t v8 = [(TIKeyboardSecureTouchManager *)self lastEventAuthenticationMessage];
  v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if ([v7 slotID] == v3
      && ([(TIKeyboardSecureTouchManager *)self bypassCommunication]
       || ([MEMORY[0x1E4F4F2A0] sharedInstance],
           v11 = objc_claimAutoreleasedReturnValue(),
           uint64_t v12 = [v11 authenticateMessage:v9],
           v11,
           v12 == 2))
      && (uint64_t v13 = [v7 authenticationMessageContext], v13 == objc_msgSend(v9, "context")))
    {
      unint64_t v14 = [v9 timestamp];
      BOOL v15 = v14 > [(TIKeyboardSecureTouchManager *)self lastVerifiedMessageTimestamp];
    }
    else
    {
      BOOL v15 = 0;
    }
    uint64_t v16 = mach_continuous_time();
    double v17 = (double)(v16 - [v9 timestamp]);
    if (_TIGetMachTimeScale_once != -1) {
      dispatch_once(&_TIGetMachTimeScale_once, &__block_literal_global_79);
    }
    if (*(double *)&_TIGetMachTimeScale_scale * v17 < 2.0 && v15)
    {
      -[TIKeyboardSecureTouchManager setLastVerifiedMessageTimestamp:](self, "setLastVerifiedMessageTimestamp:", objc_msgSend(v9, "timestamp", *(double *)&_TIGetMachTimeScale_scale * v17));
LABEL_22:
      BOOL v19 = 1;
      goto LABEL_23;
    }
  }
  if (_AXSVoiceOverTouchEnabled() || _AXSFullKeyboardAccessEnabled()) {
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v21 = 136315650;
    v22 = "-[TIKeyboardSecureTouchManager verifySlotID:]";
    __int16 v23 = 2112;
    v24 = v9;
    __int16 v25 = 1024;
    int v26 = v3;
    _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Failed to authenticate message %@ for slotID %X", (uint8_t *)&v21, 0x1Cu);
  }
  BOOL v19 = 0;
LABEL_23:

  return v19;
}

- (void)registerSlotID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v15 = "-[TIKeyboardSecureTouchManager registerSlotID:]";
    __int16 v16 = 1024;
    int v17 = v3;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Registering slotID %X", buf, 0x12u);
  }
  if (v3)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__TIKeyboardSecureTouchManager_registerSlotID___block_invoke;
    v12[3] = &__block_descriptor_36_e52_v16__0__BKSMutableTouchAuthenticationSpecification_8l;
    int v13 = v3;
    v5 = [MEMORY[0x1E4F4F3D0] buildSpecification:v12];
    v6 = objc_alloc_init(TIKeyboardSecureTouchSlot);
    [(TIKeyboardSecureTouchSlot *)v6 setSlotID:v3];
    if (![(TIKeyboardSecureTouchManager *)self bypassCommunication])
    {
      unint64_t v7 = [MEMORY[0x1E4F4F3F0] sharedInstance];
      uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
      v9 = [v7 addAuthenticationSpecifications:v8 forReason:@"kbd registration"];
      [(TIKeyboardSecureTouchSlot *)v6 setInvalidatable:v9];
    }
    [(TIKeyboardSecureTouchSlot *)v6 setAuthenticationMessageContext:0x6779E7E572E4C6A7];
    BOOL v10 = [(TIKeyboardSecureTouchManager *)self slots];
    v11 = [NSNumber numberWithUnsignedInt:v3];
    [v10 setObject:v6 forKey:v11];
  }
}

void __47__TIKeyboardSecureTouchManager_registerSlotID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  id v3 = a2;
  [v3 setSlotID:v2];
  [v3 setAuthenticationMessageContext:0x6779E7E572E4C6A7];
}

- (void)clearRegistrations
{
}

- (TIKeyboardSecureTouchManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardSecureTouchManager;
  uint64_t v2 = [(TIKeyboardSecureTouchManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    slots = v2->_slots;
    v2->_slots = (NSMutableDictionary *)v3;

    v2->_lastVerifiedMessageTimestamp = mach_continuous_time();
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_23819 != -1) {
    dispatch_once(&sharedInstance_onceToken_23819, &__block_literal_global_23820);
  }
  uint64_t v2 = (void *)sharedInstance_manager;

  return v2;
}

uint64_t __46__TIKeyboardSecureTouchManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_manager;
  sharedInstance_manager = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end