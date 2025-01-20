void sub_100005170(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 184));
  _Unwind_Resume(a1);
}

uint64_t sub_10000526C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000527C(uint64_t a1)
{
}

void sub_100005284(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 8);
  uint64_t v12 = *(void *)(v10 + 32);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000053D4;
  v19[3] = &unk_100008248;
  objc_copyWeak(&v25, (id *)(a1 + 64));
  id v13 = v9;
  id v22 = v13;
  id v14 = v8;
  v16 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v20 = v14;
  uint64_t v23 = v15;
  id v17 = v16;
  uint64_t v18 = *(void *)(a1 + 56);
  id v21 = v17;
  uint64_t v24 = v18;
  [v11 transactionWithTransactionIdentifier:v12 completion:v19];

  objc_destroyWeak(&v25);
}

void sub_1000053C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000053D4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    if (!v4)
    {
      v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v12 = 138412290;
        uint64_t v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Transaction not found with identifier %@", (uint8_t *)&v12, 0xCu);
      }

      uint64_t v8 = +[NSError errorWithDomain:@"PassbookQuicklookPreviewExtensionErrorDomain" code:1 userInfo:0];
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v11();
}

void sub_10000552C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000564C;
  v14[3] = &unk_100008298;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  uint64_t v13 = *(void *)(a1 + 40);
  id v15 = v12;
  uint64_t v17 = v13;
  [v10 familyMembersWithCompletion:v14];

  objc_destroyWeak(&v18);
}

void sub_100005638(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000564C(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = [objc_alloc((Class)PKFamilyMemberCollection) initWithFamilyMembers:v7];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000056F4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = (void *)*((void *)WeakRetained + 1);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 32);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000582C;
    v16[3] = &unk_1000082E8;
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v16[4] = WeakRetained;
    uint64_t v20 = v12;
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 56);
    id v17 = v14;
    uint64_t v21 = v15;
    id v19 = v7;
    id v18 = v6;
    [v10 passUniqueIdentifierForTransactionWithIdentifier:v11 completion:v16];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

void sub_10000582C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)PKTransactionSource);
  uint64_t v5 = [*(id *)(a1[4] + 16) passWithUniqueID:v3];

  id v6 = [v5 paymentPass];
  id v7 = [v4 initWithPaymentPass:v6];

  if (v7)
  {
    id v8 = [objc_alloc((Class)PKTransactionSourceCollection) initWithTransactionSource:v7];
    uint64_t v9 = a1[8];
  }
  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[5];
      int v14 = 138412290;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pass not found for transaction with identifier %@", (uint8_t *)&v14, 0xCu);
    }

    id v8 = +[NSError errorWithDomain:@"PassbookQuicklookPreviewExtensionErrorDomain" code:2 userInfo:0];
    uint64_t v9 = a1[9];
  }
  uint64_t v12 = *(void *)(v9 + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;

  (*(void (**)(void))(a1[7] + 16))();
}

void sub_1000059B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) accountIdentifier];
  if (v10)
  {
    uint64_t v11 = +[PKAccountService sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005B20;
    v14[3] = &unk_100008338;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    id v16 = v9;
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 40);
    id v15 = v12;
    uint64_t v17 = v13;
    [v11 accountWithIdentifier:v10 completion:v14];

    objc_destroyWeak(&v18);
  }
  else
  {
    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
}

void sub_100005B0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005B20(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100005BC0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) accountIdentifier];
  if (v10)
  {
    uint64_t v11 = +[PKAccountService sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005D28;
    v14[3] = &unk_100008388;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    id v16 = v9;
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 40);
    id v15 = v12;
    uint64_t v17 = v13;
    [v11 accountUsersForAccountWithIdentifier:v10 completion:v14];

    objc_destroyWeak(&v18);
  }
  else
  {
    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
}

void sub_100005D14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005D28(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([v8 count])
    {
      id v4 = [objc_alloc((Class)PKAccountUserCollection) initWithAccountUsers:v8];
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

void sub_100005DDC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) accountIdentifier];
  if (v10)
  {
    uint64_t v11 = +[PKAccountService sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005F44;
    v14[3] = &unk_100008388;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    id v16 = v9;
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 40);
    id v15 = v12;
    uint64_t v17 = v13;
    [v11 physicalCardsForAccountWithIdentifier:v10 completion:v14];

    objc_destroyWeak(&v18);
  }
  else
  {
    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
}

void sub_100005F30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005F44(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([v8 count])
    {
      id v4 = [v8 copy];
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

void sub_100005FEC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000060DC;
  block[3] = &unk_1000083D8;
  objc_copyWeak(&v17, (id *)(a1 + 80));
  id v12 = v6;
  id v13 = v7;
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 32);
  long long v15 = v8;
  long long v16 = *(_OWORD *)(a1 + 64);
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v17);
}

void sub_1000060DC(uint64_t a1)
{
  v2 = (id *)(a1 + 96);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    id v22 = objc_alloc_init((Class)CNContactStore);
    id v4 = objc_alloc((Class)PKContactResolver);
    uint64_t v5 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
    v25[0] = v5;
    v25[1] = CNContactEmailAddressesKey;
    v25[2] = CNContactPhoneNumbersKey;
    id v6 = +[NSArray arrayWithObjects:v25 count:3];
    id v21 = [v4 initWithContactStore:v22 keysToFetch:v6];

    id v7 = objc_alloc((Class)PKPaymentTransactionDetailsFactory);
    long long v8 = +[PKPeerPaymentWebService sharedService];
    id v9 = objc_alloc_init((Class)PKPaymentDefaultDataProvider);
    id v10 = [v7 initWithContactResolver:v21 peerPaymentWebService:v8 paymentServiceDataProvider:v9 detailViewStyle:0];

    unsigned int v11 = [v10 canShowTransactionHistoryForTransaction:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) transactionSourceCollection:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v16 = *(void *)(a1 + 88);
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v18 = *(void *)(v16 + 8);
    uint64_t v19 = *(void *)(v18 + 40);
    if (v11)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000063C4;
      v23[3] = &unk_1000083B0;
      objc_copyWeak(&v24, v2);
      [v10 historyViewControllerForTransaction:v12 transactionSourceCollection:v13 familyCollection:v14 account:v15 accountUserCollection:v17 physicalCards:v19 completion:v23];
      objc_destroyWeak(&v24);
    }
    else
    {
      uint64_t v20 = [v10 detailViewControllerForTransaction:v12 transactionSourceCollection:v13 familyCollection:v14 account:v15 accountUserCollection:v17 bankConnectInstitution:0 physicalCards:*(void *)(v18 + 40)];
      [WeakRetained _addVCToHierarchy:v20];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000063A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000063C4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _addVCToHierarchy:v5];
  }
}

uint64_t sub_100006428(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_100006444(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = [objc_alloc((Class)PKDashboardPassViewController) initWithPass:*(void *)(a1 + 32)];
    [WeakRetained _addVCToHierarchy:v2];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_loadContentSync(void *a1, const char *a2, ...)
{
  return [a1 loadContentSync];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_paymentPass(void *a1, const char *a2, ...)
{
  return [a1 paymentPass];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}