void sub_1000047C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12)
{
  id *v12;
  id *v13;
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v15 - 200));
  _Block_object_dispose((const void *)(v15 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_100004834()
{
}

void sub_10000483C()
{
}

void sub_100004844(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000490C;
  block[3] = &unk_10000C3E8;
  objc_copyWeak(&v7, &location);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void sub_10000490C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [objc_alloc((Class)PKTransitBalanceModel) initWithPass:*((void *)WeakRetained + 20)];
    id v3 = (void *)*((void *)WeakRetained + 22);
    *((void *)WeakRetained + 22) = v2;

    [*((id *)WeakRetained + 22) setDynamicBalances:*(void *)(a1 + 32)];
  }
}

uint64_t sub_1000049A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000049B0(uint64_t a1)
{
}

void sub_1000049B8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    v7[2](v7, v6, 1);
    goto LABEL_10;
  }
  if (!*(void *)(a1 + 32)) {
    goto LABEL_9;
  }
  v9 = PKCurrentUserAltDSID();
  if ((PKEqualObjects() & 1) != 0 || !WeakRetained[145])
  {

    goto LABEL_9;
  }
  uint64_t v10 = *((void *)WeakRetained + 24);

  if (v10)
  {
LABEL_9:
    v7[2](v7, v6, 0);
    goto LABEL_10;
  }
  v11 = (void *)*((void *)WeakRetained + 4);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004B3C;
  v13[3] = &unk_10000C460;
  uint64_t v12 = *(void *)(a1 + 40);
  v13[4] = *(void *)(a1 + 48);
  v16 = v7;
  id v14 = v6;
  id v15 = *(id *)(a1 + 32);
  [v11 accountUsersForAccountWithIdentifier:v12 completion:v13];

LABEL_10:
}

void sub_100004B3C(id *a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, a1[4]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004C44;
  v5[3] = &unk_10000C438;
  objc_copyWeak(&v10, &location);
  id v9 = a1[7];
  id v6 = a1[5];
  id v7 = v3;
  id v8 = a1[6];
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void sub_100004C44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v2 = [objc_alloc((Class)PKAccountUserCollection) initWithAccountUsers:*(void *)(a1 + 40)];
    uint64_t v3 = [v2 accountUserWithAltDSID:*(void *)(a1 + 48)];
    id v4 = (void *)WeakRetained[24];
    WeakRetained[24] = v3;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100004D04(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v9 = PKCurrentUserAltDSID();
      if (PKEqualObjects())
      {
      }
      else
      {
        uint64_t v10 = WeakRetained[23];

        if (!v10)
        {
          v11 = (void *)WeakRetained[1];
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_100004E78;
          v12[3] = &unk_10000C4D8;
          v12[4] = *(void *)(a1 + 40);
          id v15 = v7;
          id v13 = v6;
          id v14 = *(id *)(a1 + 32);
          [v11 familyMembersWithCompletion:v12];

          goto LABEL_8;
        }
      }
    }
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
LABEL_8:
}

void sub_100004E78(id *a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, a1[4]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004F80;
  v5[3] = &unk_10000C438;
  objc_copyWeak(&v10, &location);
  id v9 = a1[7];
  id v6 = a1[5];
  id v7 = v3;
  id v8 = a1[6];
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void sub_100004F80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100005084;
    v7[3] = &unk_10000C4B0;
    id v3 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v4 = [v3 pk_objectsPassingTest:v7];
    uint64_t v5 = [v4 firstObject];
    id v6 = (void *)WeakRetained[23];
    WeakRetained[23] = v5;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t sub_100005084(uint64_t a1, void *a2)
{
  id v3 = [a2 altDSID];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = (uint64_t)[v5 isEqualToString:v6];
    }
  }

  return v8;
}

void sub_100005108(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = (void *)*((void *)WeakRetained + 1);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005214;
    v12[3] = &unk_10000C550;
    uint64_t v11 = *(void *)(a1 + 32);
    v12[4] = *(void *)(a1 + 40);
    id v14 = v7;
    id v13 = v6;
    [v10 transactionWithTransactionIdentifier:v11 completion:v12];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

void sub_100005214(id *a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, a1[4]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005308;
  block[3] = &unk_10000C528;
  objc_copyWeak(&v9, &location);
  id v8 = a1[6];
  id v6 = a1[5];
  id v7 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void sub_100005308(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 26, *(id *)(a1 + 40));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100005398(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 145) && WeakRetained[26])
    {
      if (!WeakRetained[24]
        || (id v10 = [objc_alloc((Class)PKTransactionSource) initWithAccountUser:WeakRetained[24]]) == 0)
      {
        id v10 = [objc_alloc((Class)PKTransactionSource) initWithPaymentPass:*((void *)v9 + 20)];
      }
      id v11 = [objc_alloc((Class)PKTransactionSourceCollection) initWithTransactionSource:v10];
      v21 = [*((id *)v9 + 26) transactionDate];
      uint64_t v12 = PKStartOfMonth();
      id v13 = PKStartOfNextMonth();
      id v14 = [v13 dateByAddingTimeInterval:-1.0];

      id v15 = (void *)*((void *)v9 + 1);
      v16 = [v11 transactionSourceIdentifiers];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000560C;
      v22[3] = &unk_10000C5A0;
      v22[4] = *(void *)(a1 + 32);
      id v27 = v7;
      id v17 = v6;
      uint64_t v28 = *(void *)(a1 + 40);
      id v23 = v17;
      id v24 = v11;
      id v25 = v12;
      id v26 = v14;
      id v18 = v14;
      id v19 = v12;
      id v20 = v11;
      [v15 transactionsForTransactionSourceIdentifiers:v16 withTransactionSource:0 withBackingData:1 startDate:v19 endDate:v18 orderedByDate:1 limit:0 completion:v22];
    }
    else
    {
      (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
    }
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

void sub_10000560C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005744;
  block[3] = &unk_10000C578;
  objc_copyWeak(&v14, &location);
  id v12 = *(id *)(a1 + 72);
  id v4 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 80);
  id v7 = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void sub_100005744(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [WeakRetained[26] currencyCode];
    uint64_t v6 = +[PKSpendingSummaryFetcher summaryWithTransactions:v3 transactionSourceCollection:v4 accountUser:0 currency:v5 type:1 startDate:*(void *)(a1 + 56) endDate:*(void *)(a1 + 64) lastSummary:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_100005834(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      objc_initWeak(&location, WeakRetained);
      id v11 = (void *)WeakRetained[4];
      uint64_t v12 = *(void *)(a1 + 32);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000059BC;
      v13[3] = &unk_10000C5F0;
      objc_copyWeak(&v16, &location);
      id v15 = v9;
      id v14 = v8;
      [v11 accountWithIdentifier:v12 completion:v13];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
    }
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void sub_1000059A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000059BC(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 25, a2);
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100005A4C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100005AE8;
  v2[3] = &unk_10000C640;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
}

void sub_100005AE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setupWithTransaction:WeakRetained[26] monthlySummary:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    id WeakRetained = v3;
  }
}

id sub_100007558(uint64_t a1, void *a2)
{
  id v3 = [a2 identifiers];
  uint64_t v4 = [*(id *)(a1 + 32) identifiers];
  id v5 = [v3 isEqual:v4];

  return v5;
}

void sub_100007E04(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v17 = WeakRetained;
    id v3 = WeakRetained + 25;
    uint64_t v4 = [WeakRetained[25] accountIdentifier];
    id v5 = [*(id *)(a1 + 32) accountIdentifier];
    id v6 = v4;
    id v7 = v5;
    if (v6 == v7)
    {

      goto LABEL_11;
    }
    id v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      id v10 = v7;
      id v11 = v6;
      goto LABEL_14;
    }
    unsigned __int8 v12 = [v6 isEqualToString:v7];

    id WeakRetained = v17;
    if (v12)
    {
LABEL_11:
      objc_storeStrong(v3, *(id *)(a1 + 32));
      BOOL v9 = [*(id *)(a1 + 32) feature] == (id)5;
      id WeakRetained = v17;
      if (!v9) {
        goto LABEL_15;
      }
      id v11 = [*v3 savingsDetails];
      uint64_t v13 = [v11 accountSummary];
      id v10 = [v13 currentBalance];

      id v14 = [v11 currencyCode];
      PKCurrencyAmountMake();
      id v6 = (id)objc_claimAutoreleasedReturnValue();

      id v15 = v17[17];
      id v8 = [v6 formattedStringValue];
      id v16 = PKLocalizedFeatureString();
      [v15 setText:v16];

LABEL_14:
      id WeakRetained = v17;
    }
  }
LABEL_15:
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PKCurrencyAmountMake()
{
  return _PKCurrencyAmountMake();
}

uint64_t PKCurrentRegion()
{
  return _PKCurrentRegion();
}

uint64_t PKCurrentUserAltDSID()
{
  return _PKCurrentUserAltDSID();
}

uint64_t PKEqualObjects()
{
  return _PKEqualObjects();
}

uint64_t PKFormattedCurrencyStringFromNumber()
{
  return _PKFormattedCurrencyStringFromNumber();
}

uint64_t PKGregorianMonthSpecificLocalizedStringKeyForKey()
{
  return _PKGregorianMonthSpecificLocalizedStringKeyForKey();
}

uint64_t PKPaymentTransactionDeclinedReasonLocalizedString()
{
  return _PKPaymentTransactionDeclinedReasonLocalizedString();
}

uint64_t PKRoundedSystemFontOfSizeAndWeight()
{
  return _PKRoundedSystemFontOfSizeAndWeight();
}

uint64_t PKStartOfMonth()
{
  return _PKStartOfMonth();
}

uint64_t PKStartOfNextMonth()
{
  return _PKStartOfNextMonth();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKFontForDefaultDesign(NSString *a1, NSString *a2)
{
  return PKFontForDefaultDesign(a1, a2);
}

uint64_t PKFontForDefaultDesign()
{
  return PKFontForDefaultDesign();
}

uint64_t PKLocalizedAquamanString(NSString *a1)
{
  return PKLocalizedAquamanString(a1);
}

uint64_t PKLocalizedFeatureString()
{
  return PKLocalizedFeatureString();
}

{
  return PKLocalizedFeatureString();
}

uint64_t PKLocalizedPaymentString(NSString *a1)
{
  return PKLocalizedPaymentString(a1);
}

uint64_t PKLocalizedPaymentString(NSString *a1, NSString *a2, ...)
{
  return PKLocalizedPaymentString(a1, a2);
}

uint64_t PKLocalizedPeerPaymentString(NSString *a1)
{
  return PKLocalizedPeerPaymentString(a1);
}

uint64_t PKLocalizedPeerPaymentString(NSString *a1, NSString *a2, ...)
{
  return PKLocalizedPeerPaymentString(a1, a2);
}

uint64_t PKLocalizedPayWithPointsString(NSString *a1)
{
  return PKLocalizedPayWithPointsString(a1);
}

uint64_t PKLocalizedPayWithPointsString(NSString *a1, NSString *a2, ...)
{
  return PKLocalizedPayWithPointsString(a1, a2);
}

uint64_t PKLocalizedPeerPaymentLexingtonString(NSString *a1, NSString *a2, ...)
{
  return PKLocalizedPeerPaymentLexingtonString(a1, a2);
}

uint64_t PKLocalizedPeerPaymentRecurringString(NSString *a1)
{
  return PKLocalizedPeerPaymentRecurringString(a1);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void objc_enumerationMutation(id obj)
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__paymentRewardsRedemptionBadge(void *a1, const char *a2, ...)
{
  return [a1 _paymentRewardsRedemptionBadge];
}

id objc_msgSend__personContact(void *a1, const char *a2, ...)
{
  return [a1 _personContact];
}

id objc_msgSend__shouldShowViewInThirdPartyAppAction(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowViewInThirdPartyAppAction];
}

id objc_msgSend__transactionURLForIssuerApp(void *a1, const char *a2, ...)
{
  return [a1 _transactionURLForIssuerApp];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountSummary(void *a1, const char *a2, ...)
{
  return [a1 accountSummary];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_addValueURL(void *a1, const char *a2, ...)
{
  return [a1 addValueURL];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_amount(void *a1, const char *a2, ...)
{
  return [a1 amount];
}

id objc_msgSend_amounts(void *a1, const char *a2, ...)
{
  return [a1 amounts];
}

id objc_msgSend_appletDataFormat(void *a1, const char *a2, ...)
{
  return [a1 appletDataFormat];
}

id objc_msgSend_associatedAccountServiceAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 associatedAccountServiceAccountIdentifier];
}

id objc_msgSend_associatedPassUniqueID(void *a1, const char *a2, ...)
{
  return [a1 associatedPassUniqueID];
}

id objc_msgSend_awards(void *a1, const char *a2, ...)
{
  return [a1 awards];
}

id objc_msgSend_balance(void *a1, const char *a2, ...)
{
  return [a1 balance];
}

id objc_msgSend_balanceAmount(void *a1, const char *a2, ...)
{
  return [a1 balanceAmount];
}

id objc_msgSend_balanceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 balanceIdentifier];
}

id objc_msgSend_barcodeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 barcodeIdentifier];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currency(void *a1, const char *a2, ...)
{
  return [a1 currency];
}

id objc_msgSend_currencyAmount(void *a1, const char *a2, ...)
{
  return [a1 currencyAmount];
}

id objc_msgSend_currencyCode(void *a1, const char *a2, ...)
{
  return [a1 currencyCode];
}

id objc_msgSend_currencyValue(void *a1, const char *a2, ...)
{
  return [a1 currencyValue];
}

id objc_msgSend_currentBalance(void *a1, const char *a2, ...)
{
  return [a1 currentBalance];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_devicePrimaryPaymentApplication(void *a1, const char *a2, ...)
{
  return [a1 devicePrimaryPaymentApplication];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayableBalances(void *a1, const char *a2, ...)
{
  return [a1 displayableBalances];
}

id objc_msgSend_displayablePointsBalances(void *a1, const char *a2, ...)
{
  return [a1 displayablePointsBalances];
}

id objc_msgSend_endStationLocation(void *a1, const char *a2, ...)
{
  return [a1 endStationLocation];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_feature(void *a1, const char *a2, ...)
{
  return [a1 feature];
}

id objc_msgSend_featureIdentifier(void *a1, const char *a2, ...)
{
  return [a1 featureIdentifier];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_formattedAwards(void *a1, const char *a2, ...)
{
  return [a1 formattedAwards];
}

id objc_msgSend_formattedBalanceAdjustmentAmount(void *a1, const char *a2, ...)
{
  return [a1 formattedBalanceAdjustmentAmount];
}

id objc_msgSend_formattedBalanceAdjustmentSubtotalAmount(void *a1, const char *a2, ...)
{
  return [a1 formattedBalanceAdjustmentSubtotalAmount];
}

id objc_msgSend_formattedStringValue(void *a1, const char *a2, ...)
{
  return [a1 formattedStringValue];
}

id objc_msgSend_formattedValue(void *a1, const char *a2, ...)
{
  return [a1 formattedValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return [a1 identifiers];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAutoTopEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAutoTopEnabled];
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 isCurrentUser];
}

id objc_msgSend_isWalletVisible(void *a1, const char *a2, ...)
{
  return [a1 isWalletVisible];
}

id objc_msgSend_isZeroTransaction(void *a1, const char *a2, ...)
{
  return [a1 isZeroTransaction];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedTitle];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_mapsMerchant(void *a1, const char *a2, ...)
{
  return [a1 mapsMerchant];
}

id objc_msgSend_merchant(void *a1, const char *a2, ...)
{
  return [a1 merchant];
}

id objc_msgSend_merchantProvidedDescription(void *a1, const char *a2, ...)
{
  return [a1 merchantProvidedDescription];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return [a1 nameComponents];
}

id objc_msgSend_notificationCenterTitle(void *a1, const char *a2, ...)
{
  return [a1 notificationCenterTitle];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return [a1 organizationName];
}

id objc_msgSend_paymentNetworkIdentifier(void *a1, const char *a2, ...)
{
  return [a1 paymentNetworkIdentifier];
}

id objc_msgSend_paymentRewardsRedemption(void *a1, const char *a2, ...)
{
  return [a1 paymentRewardsRedemption];
}

id objc_msgSend_plans(void *a1, const char *a2, ...)
{
  return [a1 plans];
}

id objc_msgSend_postalAddress(void *a1, const char *a2, ...)
{
  return [a1 postalAddress];
}

id objc_msgSend_programName(void *a1, const char *a2, ...)
{
  return [a1 programName];
}

id objc_msgSend_recurringPeerPayment(void *a1, const char *a2, ...)
{
  return [a1 recurringPeerPayment];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_savingsDetails(void *a1, const char *a2, ...)
{
  return [a1 savingsDetails];
}

id objc_msgSend_secondaryFundingSourceType(void *a1, const char *a2, ...)
{
  return [a1 secondaryFundingSourceType];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return [a1 separatorColor];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldSuppressNoChargeAmount(void *a1, const char *a2, ...)
{
  return [a1 shouldSuppressNoChargeAmount];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startStationLocation(void *a1, const char *a2, ...)
{
  return [a1 startStationLocation];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportsTransitHistory(void *a1, const char *a2, ...)
{
  return [a1 supportsTransitHistory];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_totalSpending(void *a1, const char *a2, ...)
{
  return [a1 totalSpending];
}

id objc_msgSend_transactionDate(void *a1, const char *a2, ...)
{
  return [a1 transactionDate];
}

id objc_msgSend_transactionDeclinedReason(void *a1, const char *a2, ...)
{
  return [a1 transactionDeclinedReason];
}

id objc_msgSend_transactionSourceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 transactionSourceIdentifiers];
}

id objc_msgSend_transactionStatus(void *a1, const char *a2, ...)
{
  return [a1 transactionStatus];
}

id objc_msgSend_transactionType(void *a1, const char *a2, ...)
{
  return [a1 transactionType];
}

id objc_msgSend_transitProperties(void *a1, const char *a2, ...)
{
  return [a1 transitProperties];
}

id objc_msgSend_transitType(void *a1, const char *a2, ...)
{
  return [a1 transitType];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}