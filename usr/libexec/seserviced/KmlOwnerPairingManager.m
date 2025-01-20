@interface KmlOwnerPairingManager
- (KmlOwnerPairingManager)init;
- (void)dealloc;
- (void)handleEncryptionResult:(id)a3 trackingRequest:(id)a4 keyInformation:(id)a5;
- (void)handleFirstPostPairingTransactionEndResult:(id)a3;
- (void)handleKeyCreationCancellationResult:(BOOL)a3;
- (void)handleKeyCreationCompletionResult:(id)a3;
- (void)handleKeysExchangeDoneWaitForMailboxes;
- (void)handleMailboxConfigurationDone;
- (void)handleOwnerPairingCancellationWithResult:(BOOL)a3;
- (void)handlePairingDidStart;
- (void)handlePairingTransportSessionFailedWithError:(id)a3;
- (void)handlePreWarmResult:(id)a3;
- (void)handleProbingCompletionWithBrandCode:(unint64_t)a3 error:(id)a4;
- (void)handleRemoteConfigurationReceived;
@end

@implementation KmlOwnerPairingManager

- (KmlOwnerPairingManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)KmlOwnerPairingManager;
  v2 = [(KmlOwnerPairingManager *)&v11 init];
  v3 = (KmlOwnerPairingManager *)v2;
  if (v2)
  {
    *((void *)v2 + 26) = 0;
    v2[136] = 1;
    *((_WORD *)v2 + 92) = 0;
    *(_WORD *)(v2 + 137) = 0;
    *((void *)v2 + 20) = 0;
    *((void *)v2 + 21) = 0;
    uint64_t v4 = sub_1002FFCE4((uint64_t)[KmlVersions alloc], 0);
    opVersionInformation = v3->_opVersionInformation;
    v3->_opVersionInformation = (KmlVersions *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.sesd.kml.ownerPairing", v6);
    opManagerQueue = v3->_opManagerQueue;
    v3->_opManagerQueue = (OS_dispatch_queue *)v7;

    v9 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_opDelegate, 0);
  opManagerQueue = self->_opManagerQueue;
  self->_opManagerQueue = 0;

  sub_1003128B8((id *)&self->_seManager->super.isa, 0);
  seManager = self->_seManager;
  self->_seManager = 0;

  sub_1002FED88((id *)&self->_dxManager->super.isa, 0);
  dxManager = self->_dxManager;
  self->_dxManager = 0;

  v6.receiver = self;
  v6.super_class = (Class)KmlOwnerPairingManager;
  [(KmlOwnerPairingManager *)&v6 dealloc];
}

- (void)handleRemoteConfigurationReceived
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingManager handleRemoteConfigurationReceived]", 735, @"OPManager: Remote reader Configuration received", v2, v3, v4, v5, v8);
  dispatch_queue_t v7 = KmlSignpostLogger();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OpCarConfigRx", "end success", (uint8_t *)&v8, 2u);
  }

  sub_10030B5C0((uint64_t)self, 12);
}

- (void)handleKeysExchangeDoneWaitForMailboxes
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingManager handleKeysExchangeDoneWaitForMailboxes]", 743, @"OPManager: Waiting to finalize Owner Pairing", v2, v3, v4, v5, v8);
  dispatch_queue_t v7 = KmlSignpostLogger();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OpKeyExchange", "end success", (uint8_t *)&v8, 2u);
  }

  sub_10030B5C0((uint64_t)self, 21);
}

- (void)handlePairingTransportSessionFailedWithError:(id)a3
{
  id v4 = a3;
  opManagerQueue = self->_opManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10030E488;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(opManagerQueue, v7);
}

- (void)handleMailboxConfigurationDone
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlOwnerPairingManager handleMailboxConfigurationDone]", 764, @"OPManager: Mailboxes configured", v2, v3, v4, v5, v8);
  dispatch_queue_t v7 = KmlSignpostLogger();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OpMailboxWriteTxn", "end success", (uint8_t *)&v8, 2u);
  }

  sub_10030B5C0((uint64_t)self, 22);
}

- (void)handleOwnerPairingCancellationWithResult:(BOOL)a3
{
  opManagerQueue = self->_opManagerQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10030E644;
  v4[3] = &unk_10040DCC8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(opManagerQueue, v4);
}

- (void)handleFirstPostPairingTransactionEndResult:(id)a3
{
  id v4 = a3;
  opManagerQueue = self->_opManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10030E8E8;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(opManagerQueue, v7);
}

- (void)handleProbingCompletionWithBrandCode:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  opManagerQueue = self->_opManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030EBB4;
  block[3] = &unk_10040D970;
  objc_super v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(opManagerQueue, block);
}

- (void)handlePairingDidStart
{
  opManagerQueue = self->_opManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10030ECBC;
  block[3] = &unk_10040B880;
  void block[4] = self;
  dispatch_async(opManagerQueue, block);
}

- (void)handleKeyCreationCompletionResult:(id)a3
{
  id v4 = a3;
  opManagerQueue = self->_opManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10030EDC0;
  v7[3] = &unk_10040D1A0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(opManagerQueue, v7);
}

- (void)handleKeyCreationCancellationResult:(BOOL)a3
{
  if (a3)
  {
    dispatch_queue_t v7 = @"OPManager: Key creation cancelled sucessfully";
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint64_t v9 = 880;
  }
  else
  {
    dispatch_queue_t v7 = @"OPManager: Key creation couldn't be cancelled. Delete the key if required";
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    uint64_t v9 = 882;
  }
  KmlLogFunc2(v8, (uint64_t)"-[KmlOwnerPairingManager handleKeyCreationCancellationResult:]", v9, v7, v3, v4, v5, v6, v10);
}

- (void)handleEncryptionResult:(id)a3 trackingRequest:(id)a4 keyInformation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  opManagerQueue = self->_opManagerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10030F1D4;
  v15[3] = &unk_100419A98;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(opManagerQueue, v15);
}

- (void)handlePreWarmResult:(id)a3
{
  id v4 = a3;
  opManagerQueue = self->_opManagerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10030F360;
  v7[3] = &unk_10040D1A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(opManagerQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifierStr, 0);
  objc_destroyWeak((id *)&self->_opDelegate);
  objc_storeStrong((id *)&self->_dckConfig, 0);
  objc_storeStrong((id *)&self->_opVersionInformation, 0);
  objc_storeStrong((id *)&self->_deviceConfig, 0);
  objc_storeStrong((id *)&self->_opManagerQueue, 0);
  objc_storeStrong((id *)&self->_ownerPairingError, 0);
  objc_storeStrong((id *)&self->_keyTrackingReceipt, 0);
  objc_storeStrong((id *)&self->_keyTrackingRequest, 0);
  objc_storeStrong((id *)&self->_keyInformation, 0);
  objc_storeStrong((id *)&self->_anonymizedDsid, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_localKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_keyAttestation, 0);
  objc_storeStrong((id *)&self->_instanceAttestation, 0);
  objc_storeStrong((id *)&self->_deviceCertificate, 0);
  objc_storeStrong((id *)&self->_ownerKeyConfig, 0);
  objc_storeStrong((id *)&self->_seManager, 0);

  objc_storeStrong((id *)&self->_dxManager, 0);
}

@end