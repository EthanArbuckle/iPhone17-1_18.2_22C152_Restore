@interface OTPairingSession
- (BOOL)acquireLockAssertion;
- (KCPairingChannel)channel;
- (NSMutableArray)completionHandlers;
- (NSString)identifier;
- (NSString)sentMessageIdentifier;
- (OTPairingPacketContext)packet;
- (__MKBAssertion)lockAssertion;
- (id)initAsInitiator:(BOOL)a3 deviceInfo:(id)a4 identifier:(id)a5;
- (void)addCompletionHandler:(id)a3;
- (void)dealloc;
- (void)didCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)setChannel:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLockAssertion:(__MKBAssertion *)a3;
- (void)setPacket:(id)a3;
- (void)setSentMessageIdentifier:(id)a3;
@end

@implementation OTPairingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_sentMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_packet, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setLockAssertion:(__MKBAssertion *)a3
{
  self->_lockAssertion = a3;
}

- (__MKBAssertion)lockAssertion
{
  return self->_lockAssertion;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSentMessageIdentifier:(id)a3
{
}

- (NSString)sentMessageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChannel:(id)a3
{
}

- (KCPairingChannel)channel
{
  return (KCPairingChannel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPacket:(id)a3
{
}

- (OTPairingPacketContext)packet
{
  return (OTPairingPacketContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)didCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(OTPairingSession *)self completionHandlers];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) + 16))();
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)addCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(OTPairingSession *)self completionHandlers];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    [(OTPairingSession *)self setCompletionHandlers:v6];
  }
  id v8 = [(OTPairingSession *)self completionHandlers];
  id v7 = objc_retainBlock(v4);

  [v8 addObject:v7];
}

- (BOOL)acquireLockAssertion
{
  lockAssertion = self->_lockAssertion;
  if (!lockAssertion)
  {
    v9[0] = @"MKBAssertionKey";
    v9[1] = @"MKBAssertionTimeout";
    v10[0] = @"Other";
    v10[1] = &off_10000C988;
    id v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    id v5 = (__MKBAssertion *)MKBDeviceLockAssertion();
    self->_lockAssertion = v5;
    if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to obtain lock assertion: %@", buf, 0xCu);
    }

    lockAssertion = self->_lockAssertion;
  }
  return lockAssertion != 0;
}

- (void)dealloc
{
  lockAssertion = self->_lockAssertion;
  if (lockAssertion)
  {
    CFRelease(lockAssertion);
    self->_lockAssertion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OTPairingSession;
  [(OTPairingSession *)&v4 dealloc];
}

- (id)initAsInitiator:(BOOL)a3 deviceInfo:(id)a4 identifier:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)OTPairingSession;
  v10 = [(OTPairingSession *)&v23 init];
  if (!v10) {
    goto LABEL_8;
  }
  id v11 = objc_alloc_init((Class)KCPairingChannelContext);
  long long v12 = +[NSUUID UUID];
  long long v13 = [v12 UUIDString];
  [v11 setUniqueClientID:v13];

  long long v14 = +[NSUUID UUID];
  v15 = [v14 UUIDString];
  [v11 setUniqueDeviceID:v15];

  [v11 setIntent:KCPairingIntent_Type_SilentRepair];
  v16 = [v8 modelID];
  [v11 setModel:v16];

  v17 = [v8 osVersion];
  [v11 setOsVersion:v17];

  if (v6)
  {
    if (!v9)
    {
      v18 = +[NSUUID UUID];
      v19 = [v18 UUIDString];
      [(OTPairingSession *)v10 setIdentifier:v19];

      uint64_t v20 = +[KCPairingChannel pairingChannelInitiator:v11];
LABEL_7:
      v21 = (void *)v20;
      [(OTPairingSession *)v10 setChannel:v20];

LABEL_8:
      return v10;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else if (v9)
  {
    [(OTPairingSession *)v10 setIdentifier:v9];
    uint64_t v20 = +[KCPairingChannel pairingChannelAcceptor:v11];
    goto LABEL_7;
  }
  _os_assert_log();
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

@end