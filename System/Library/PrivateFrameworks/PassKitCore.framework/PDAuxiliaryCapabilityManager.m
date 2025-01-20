@interface PDAuxiliaryCapabilityManager
- (PDAuxiliaryCapabilityManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 secureElement:(id)a5 pushNotificationManager:(id)a6 iSO18013Manager:(id)a7 barcodeCertManager:(id)a8 subcredentialManager:(id)a9;
- (id)pushNotificationTopics;
- (void)addDelegate:(id)a3;
- (void)checkAllAuxiliaryRegistrationRequirements;
- (void)didFailToDecryptRemoteAssets:(id)a3 forPass:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)passAddedOrUpdated:(id)a3 oldPass:(id)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)registerAuxiliaryCapabilitiesForPass:(id)a3 force:(BOOL)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5;
- (void)registerLocalAuxiliaryCapabilities:(id)a3 withPass:(id)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
@end

@implementation PDAuxiliaryCapabilityManager

- (PDAuxiliaryCapabilityManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 secureElement:(id)a5 pushNotificationManager:(id)a6 iSO18013Manager:(id)a7 barcodeCertManager:(id)a8 subcredentialManager:(id)a9
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v16 = a8;
  id v17 = a9;
  v33.receiver = self;
  v33.super_class = (Class)PDAuxiliaryCapabilityManager;
  v18 = [(PDAuxiliaryCapabilityManager *)&v33 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_webServiceCoordinator, a4);
    objc_storeStrong((id *)&v19->_secureElement, a5);
    objc_storeStrong((id *)&v19->_pushNotificationManager, a6);
    [(PDPushNotificationManager *)v19->_pushNotificationManager registerConsumer:v19];
    objc_storeStrong((id *)&v19->_iso1813Manager, a7);
    objc_storeStrong((id *)&v19->_barcodeCertManager, a8);
    objc_storeStrong((id *)&v19->_subcredentialManager, a9);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passd.auxiliarycapabilitymangager", 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    delegates = v19->_delegates;
    v19->_delegates = (NSHashTable *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registerCompletionHandlersForPass = v19->_registerCompletionHandlersForPass;
    v19->_registerCompletionHandlersForPass = v24;

    v26 = dispatch_get_global_queue(-32768, 0);
    PDScheduledActivityClientRegister();

    sub_100441AE0((uint64_t)v19);
  }

  return v19;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100441D10;
  v7[3] = &unk_10072E198;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100441DB4;
  v7[3] = &unk_10072E198;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)passAddedOrUpdated:(id)a3 oldPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100442038;
  block[3] = &unk_10072E238;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)didFailToDecryptRemoteAssets:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 count];
    id v10 = [v7 uniqueID];
    *(_DWORD *)buf = 134218242;
    id v21 = v9;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Evaluating %lu undecryptable assets on %@", buf, 0x16u);
  }
  v11 = [v7 auxiliaryRegistrationRequirements];
  id v12 = [v11 deviceDecryptionRequirements];

  if ([v12 count])
  {
    v13 = objc_msgSend(v12, "pk_indexDictionaryByApplyingBlock:", &stru_100751708);
    queue = self->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100442A28;
    v15[3] = &unk_100730198;
    id v16 = v6;
    id v17 = v13;
    v18 = self;
    id v19 = v7;
    id v8 = v13;
    dispatch_async(queue, v15);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No available device decryption requirements, nothing to be done", buf, 2u);
  }
}

- (void)checkAllAuxiliaryRegistrationRequirements
{
}

- (void)registerLocalAuxiliaryCapabilities:(id)a3 withPass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, id, void))a5;
  if (![v8 count])
  {
    id v11 = +[NSMapTable pk_createStrongPointerPersonalityToStrongObjects];
    id v12 = +[NSMapTable pk_createStrongPointerPersonalityToStrongObjects];
    v10[2](v10, v11, v12, 0);
  }
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10044328C;
  v17[3] = &unk_100730578;
  id v18 = v9;
  id v19 = self;
  id v20 = v8;
  id v21 = v10;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(queue, v17);
}

- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v6 = a3;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100444E70;
  v9[3] = &unk_10072E198;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)registerAuxiliaryCapabilitiesForPass:(id)a3 force:(BOOL)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004451A8;
  block[3] = &unk_100732C18;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
}

- (id)pushNotificationTopics
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  [v3 addObject:@"com.apple.pay.auxiliary.registration.requirement.prod"];
  id v4 = [(PDPaymentWebServiceCoordinator *)self->_webServiceCoordinator sharedWebServiceContext];
  v5 = [v4 regions];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10044B4C0;
  v9[3] = &unk_100751E00;
  id v10 = v3;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = [v6 copy];
  return v7;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  id v6 = [(PDAuxiliaryCapabilityManager *)self pushNotificationTopics];
  unsigned int v7 = [v6 containsObject:v5];

  if (v7)
  {
    sub_100442D04((uint64_t)self, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerCompletionHandlersForPass, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_subcredentialManager, 0);
  objc_storeStrong((id *)&self->_barcodeCertManager, 0);
  objc_storeStrong((id *)&self->_iso1813Manager, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end