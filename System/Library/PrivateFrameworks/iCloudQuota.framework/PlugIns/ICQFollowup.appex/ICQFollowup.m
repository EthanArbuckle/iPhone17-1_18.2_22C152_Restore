void sub_1000039B8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void block[5];
  uint8_t buf[4];
  id v8;

  v3 = a2;
  v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished showing server UI: %@", buf, 0xCu);
  }

  v5 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003ADC;
  block[3] = &unk_100008298;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v5, block);
}

id sub_100003ADC(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishProcessing];
}

uint64_t sub_100003BB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003FE8(id a1)
{
  qword_10000CA08 = (uint64_t)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.icloud.quota"];
  _objc_release_x1();
}

void sub_100004370(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100004388(id a1, ICQOffer *a2)
{
  v2 = a2;
  v3 = (void *)os_transaction_create();
  v4 = +[ICQOfferManager sharedOfferManager];
  v5 = [(ICQOffer *)v2 offerId];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = nullsub_1;
  v6[3] = &unk_100008390;
  id v7 = v3;
  [v4 updateOfferId:v5 buttonId:@"followup" info:0 completion:v6];
}

void sub_10000446C(void *a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v3 = +[ICQOfferManager sharedOfferManager];
    [v3 teardownCachedOffer];
  }
  v4 = a1[4];
  dispatch_group_leave(v4);
}

void sub_1000044E4(void *a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v3 = +[ICQOfferManager sharedOfferManager];
    [v3 teardownCachedPremiumOffer];
  }
  v4 = a1[4];
  dispatch_group_leave(v4);
}

BOOL sub_100004C94(id a1, FLFollowUpAction *a2, unint64_t a3, BOOL *a4)
{
  v4 = [(FLFollowUpAction *)a2 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"ICQLinkParameters"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v6 = ICQActionParameterZeroCFUActionKey,
        [v5 objectForKeyedSubscript:ICQActionParameterZeroCFUActionKey],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = [v5 objectForKeyedSubscript:v6];
    unsigned __int8 v9 = [v8 isEqual:@"true"];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

void sub_100004D60(uint64_t a1, void *a2)
{
  v3 = [a2 offerId];
  if ([*(id *)(a1 + 32) eventSource] == (id)3)
  {
    uint64_t v17 = ICQUpdateOfferKeyIsZeroAction;
    v18 = &off_100008658;
    v4 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  }
  else
  {
    v4 = 0;
  }
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICQFollowup sending updateOfferId:%@ buttonId:%@ info:%@", buf, 0x20u);
  }

  id v7 = +[ICQOfferManager sharedOfferManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = nullsub_3;
  v9[3] = &unk_100008390;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v7 updateOfferId:v3 buttonId:v8 info:v4 completion:v9];
}

void sub_100005594(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005644;
  block[3] = &unk_100008470;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100005644(uint64_t a1)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    id v3 = objc_retainBlock(*(id *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    uint64_t v7 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    return (uint64_t)[v6 icqActionPresentOptInFlowForOffer:v7 withCompletion:v8];
  }
  return result;
}

void sub_1000057BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000586C;
  block[3] = &unk_100008470;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000586C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateRequestedServerUIURLWithURL:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(a1 + 40) updateOfferWithAction:*(void *)(v2 + 8)];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v3 icqActionPresentPurchaseFlowForOffer:v4 withCompletion:v5];
}

uint64_t sub_100005B3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005B4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005B5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005D4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005D68()
{
}

void sub_100005D94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005E0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005E84(uint64_t a1, NSObject *a2)
{
  id v3 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Followup triggered with non-offer request type %@", (uint8_t *)&v4, 0xCu);
}

void sub_100005F28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t ICQCreateErrorWithMessage()
{
  return _ICQCreateErrorWithMessage();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _ICQActionForString()
{
  return __ICQActionForString();
}

uint64_t _ICQGetLogSystem()
{
  return __ICQGetLogSystem();
}

uint64_t _ICQStringForAction()
{
  return __ICQStringForAction();
}

uint64_t _ICQStringForKey()
{
  return __ICQStringForKey();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend__sceneIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _sceneIdentifier];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_beginPremiumFlow(void *a1, const char *a2, ...)
{
  return [a1 beginPremiumFlow];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_eventSource(void *a1, const char *a2, ...)
{
  return [a1 eventSource];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_offerId(void *a1, const char *a2, ...)
{
  return [a1 offerId];
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return [a1 requestType];
}

id objc_msgSend_sharedFollowUpController(void *a1, const char *a2, ...)
{
  return [a1 sharedFollowUpController];
}

id objc_msgSend_sharedOfferManager(void *a1, const char *a2, ...)
{
  return [a1 sharedOfferManager];
}

id objc_msgSend_teardownCachedEventOffer(void *a1, const char *a2, ...)
{
  return [a1 teardownCachedEventOffer];
}

id objc_msgSend_teardownCachedOffer(void *a1, const char *a2, ...)
{
  return [a1 teardownCachedOffer];
}

id objc_msgSend_teardownCachedPremiumOffer(void *a1, const char *a2, ...)
{
  return [a1 teardownCachedPremiumOffer];
}

id objc_msgSend_teardownOffer(void *a1, const char *a2, ...)
{
  return [a1 teardownOffer];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_upgradeFlowManager(void *a1, const char *a2, ...)
{
  return [a1 upgradeFlowManager];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}