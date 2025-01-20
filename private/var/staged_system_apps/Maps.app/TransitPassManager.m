@interface TransitPassManager
- (BOOL)_balanceIsLessThanRouteCost:(id)a3 forPass:(id)a4;
- (TransitPassManager)initWithIsTourist:(BOOL)a3;
- (TransitPassManagerDelegate)delegate;
- (id)_defaultPaymentCardExpressStatuses:(id)a3;
- (id)_defaultPaymentCardsFromLibrary:(id)a3;
- (id)_exclamationMarkImage;
- (id)_identifiersForSecurePasses:(id)a3;
- (id)_messageFromBalance:(id)a3 passName:(id)a4;
- (id)_passForTopUpWithTransitPasses:(id)a3 forRouteTNIs:(id)a4 routeCost:(id)a5;
- (id)_userTransitPassesFromLibrary:(id)a3;
- (id)currencyAmountForRoute:(id)a3;
- (id)transitSystemsForRoute:(id)a3 withSupportedPaymentMethods:(id)a4;
- (void)_fetchAllAvailablePassesFromWallet;
- (void)_fetchLibrary:(id)a3;
- (void)_passKitLibraryDidChange:(id)a3;
- (void)_passKitLibraryMayHaveChanged;
- (void)_transitTopUpMessageForPass:(id)a3 paymentMethods:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)fetchTransitMessageForRoute:(id)a3 paymentMethods:(id)a4 suggestions:(id)a5 completion:(id)a6;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)setDelegate:(id)a3;
- (void)userHasPaymentCardWithHandler:(id)a3;
@end

@implementation TransitPassManager

- (id)_defaultPaymentCardsFromLibrary:(id)a3
{
  v3 = [a3 defaultPaymentPassesWithRemotePasses:1];
  v4 = sub_1000AC254(v3, &stru_101300690);

  return v4;
}

- (void)_fetchLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100104114;
  v24 = sub_100104908;
  id v25 = 0;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1001092F8;
  v17 = &unk_1012E73F0;
  v18 = self;
  v19 = &v20;
  MapsSuggestionsDispatchSyncIfDifferent();
  if (v21[5])
  {
    libraryQueue = self->_libraryQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100906538;
    block[3] = &unk_1012E79E8;
    id v12 = v4;
    v13 = &v20;
    dispatch_async(libraryQueue, block);
  }
  else
  {
    objc_initWeak(&location, self);
    v6 = self->_libraryQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D7A4;
    v7[3] = &unk_1012E9950;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(v6, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v20, 8);
}

- (void)userHasPaymentCardWithHandler:(id)a3
{
  id v4 = a3;
  v5 = sub_100021338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Looking through the user's wallet for a payment card", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100041B10;
  v7[3] = &unk_101300628;
  objc_copyWeak(&v9, buf);
  id v6 = v4;
  id v8 = v6;
  [(TransitPassManager *)self _fetchLibrary:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (TransitPassManager)initWithIsTourist:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)TransitPassManager;
  id v4 = [(TransitPassManager *)&v24 init];
  v5 = v4;
  if (v4)
  {
    v4->_isTourist = a3;
    objc_initWeak(&location, v4);
    GEOConfigGetDouble();
    double v7 = v6;
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.Maps.TransitPassManager", v8);
    libraryQueue = v5->_libraryQueue;
    v5->_libraryQueue = (OS_dispatch_queue *)v9;

    id v11 = objc_alloc((Class)MapsSuggestionsCanKicker);
    id v12 = v5->_libraryQueue;
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    uint64_t v20 = sub_100906488;
    v21 = &unk_1012E6708;
    objc_copyWeak(&v22, &location);
    v13 = (MapsSuggestionsCanKicker *)[v11 initWithName:@"TransitPassManagerCanKicker" time:v12 queue:&v18 block:v7];
    passKitLibraryDidChangeCanKicker = v5->_passKitLibraryDidChangeCanKicker;
    v5->_passKitLibraryDidChangeCanKicker = v13;

    uint64_t v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v5 selector:"_passKitLibraryDidChange:" name:PKPassLibraryDidChangeNotification object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v5 selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  [(MapsSuggestionsCanKicker *)self->_passKitLibraryDidChangeCanKicker cancel];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TransitPassManager;
  [(TransitPassManager *)&v4 dealloc];
}

- (id)_messageFromBalance:(id)a3 passName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[NSBundle mainBundle];
  id v8 = v7;
  if (v5)
  {
    if (!v6)
    {
      uint64_t v9 = [v7 localizedStringForKey:@"MAPS_TRANSIT_PAY_LOW_BALANCE_AMOUNT_ONLY" value:@"localized string not found" table:0];

      id v11 = [objc_alloc((Class)NSString) initWithFormat:v9, v5, v14];
      goto LABEL_8;
    }
    uint64_t v9 = [v7 localizedStringForKey:@"MAPS_TRANSIT_PAY_LOW_BALANCE_FULL" value:@"localized string not found" table:0];

    id v10 = objc_alloc((Class)NSString);
    id v14 = v5;
LABEL_6:
    id v11 = [v10 initWithFormat:v9, v6, v14];
LABEL_8:
    id v12 = v11;
    id v8 = (void *)v9;
    goto LABEL_9;
  }
  if (v6)
  {
    uint64_t v9 = [v7 localizedStringForKey:@"MAPS_TRANSIT_PAY_LOW_BALANCE_NAME_ONLY" value:@"localized string not found" table:0];

    id v10 = objc_alloc((Class)NSString);
    goto LABEL_6;
  }
  id v12 = [v7 localizedStringForKey:@"MAPS_TRANSIT_PAY_LOW_BALANCE_GENERIC" value:@"localized string not found" table:0];
LABEL_9:

  return v12;
}

- (id)_exclamationMarkImage
{
  v2 = +[UIImageSymbolConfiguration configurationWithPointSize:(uint64_t)UIFontWeightRegular weight:30.0];
  v3 = +[UIImage _systemImageNamed:@"exclamationmark.circle" withConfiguration:v2];
  objc_super v4 = +[UIColor systemRedColor];
  id v5 = [v3 _flatImageWithColor:v4];

  id v6 = [v5 imageWithRenderingMode:1];

  return v6;
}

- (BOOL)_balanceIsLessThanRouteCost:(id)a3 forPass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v6 transitProperties];
  id v8 = [v7 balances];
  uint64_t v9 = [v8 firstObject];
  id v10 = [v9 currencyCode];

  if (v10)
  {
    id v11 = [v5 currency];
    unsigned __int8 v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      v13 = [objc_alloc((Class)NSDecimalNumber) initWithDouble:0.0];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = [v6 transitProperties];
      uint64_t v15 = [v14 balances];

      id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v31;
        do
        {
          uint64_t v19 = 0;
          uint64_t v20 = v13;
          do
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            v21 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)v19) amount];
            v13 = [v20 decimalNumberByAdding:v21];

            uint64_t v19 = (char *)v19 + 1;
            uint64_t v20 = v13;
          }
          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v17);
      }

      id v22 = [v5 amount];
      id v23 = [v13 compare:v22];

      if (v23 == (id)-1)
      {
        BOOL v28 = 1;
        goto LABEL_17;
      }
      objc_super v24 = sub_100021338();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [v6 transitProperties];
        v26 = [v25 balance];
        v27 = [v5 amount];
        *(_DWORD *)buf = 138412546;
        v36 = v26;
        __int16 v37 = 2112;
        v38 = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Comparison result of passProperties.balance:%@ and routeCost.amount:%@ is not as expected", buf, 0x16u);
      }
      goto LABEL_15;
    }
  }
  v13 = sub_100021338();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_super v24 = [v5 currency];
    *(_DWORD *)buf = 138412546;
    v36 = v10;
    __int16 v37 = 2112;
    v38 = v24;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "passBalanceCurrency!=routeCost.currency passBalanceCurrency: %@, routeCost.currency: %@", buf, 0x16u);
LABEL_15:
  }
  BOOL v28 = 0;
LABEL_17:

  return v28;
}

- (void)_transitTopUpMessageForPass:(id)a3 paymentMethods:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100906BF4;
  v14[3] = &unk_101300650;
  objc_copyWeak(&v19, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v10;
  id v18 = v12;
  id v16 = self;
  id v13 = v9;
  id v17 = v13;
  [(TransitPassManager *)self _fetchLibrary:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (id)_defaultPaymentCardExpressStatuses:(id)a3
{
  id v3 = a3;
  id v30 = objc_alloc_init((Class)PKPaymentService);
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v32;
    *(void *)&long long v7 = 138412290;
    long long v29 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v12 = [v11 devicePrimaryPaymentApplication:v29];
        [v12 paymentNetworkIdentifier];
        id v13 = PKLegacyTransitNetworkIdentifierForCredentialType();

        if (!v13)
        {
          id v18 = sub_100021338();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_18;
          }
          *(_WORD *)buf = 0;
          id v19 = v18;
          uint64_t v20 = "Default payment card has no TNI";
          uint32_t v21 = 2;
          goto LABEL_15;
        }
        uint64_t v14 = [v4 objectForKey:v13];
        if (v14)
        {
          id v15 = (void *)v14;
          id v16 = [v4 objectForKeyedSubscript:v13];
          unsigned int v17 = [v16 BOOLValue];

          if (v17)
          {
            id v18 = sub_100021338();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
              goto LABEL_18;
            }
            *(_DWORD *)buf = v29;
            id v36 = v13;
            id v19 = v18;
            uint64_t v20 = "We've already found this default payment card (%@) and it has express enabled";
            uint32_t v21 = 12;
LABEL_15:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v20, buf, v21);
            goto LABEL_18;
          }
        }
        unsigned int v22 = [v11 isRemotePass];
        id v23 = objc_alloc((Class)NSNumber);
        id v18 = [v11 uniqueID];
        if (v22) {
          id v24 = [v30 isExpressModeEnabledForRemotePassUniqueIdentifier:v18];
        }
        else {
          id v24 = [v30 isExpressModeEnabledForPassUniqueIdentifier:v18];
        }
        id v25 = [v23 initWithBool:v24];
        [v4 setObject:v25 forKeyedSubscript:v13];

LABEL_18:
      }
      id v8 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  v26 = sub_100021338();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "_defaultPaymentCardExpressStatuses dictionary: %@", buf, 0xCu);
  }

  id v27 = [v4 copy];

  return v27;
}

- (id)_userTransitPassesFromLibrary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSArray);
    id v5 = [v3 passesOfType:1];
    id v6 = [v4 arrayByAddingObjectsFromArray:v5];

    long long v7 = [v3 remoteSecureElementPasses];
    id v8 = [v6 arrayByAddingObjectsFromArray:v7];

    uint64_t v9 = sub_100021338();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      sub_100099700(v8, &stru_1013007E0);
      id v10 = (char *)objc_claimAutoreleasedReturnValue();
      int v17 = 138412290;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_userTransitPasses: %@", (uint8_t *)&v17, 0xCu);
    }
    id v11 = sub_1000AC254(v8, &stru_1013006B0);
    id v12 = [v11 count];
    if (v12 != [v8 count])
    {
      id v13 = sub_100021338();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        sub_100099700(v11, &stru_1013007E0);
        uint64_t v14 = (char *)objc_claimAutoreleasedReturnValue();
        int v17 = 138412290;
        id v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Filtered non-transit passes. Returning: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    id v15 = sub_100021338();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136446978;
      id v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPassManager.m";
      __int16 v19 = 1024;
      int v20 = 392;
      __int16 v21 = 2082;
      unsigned int v22 = "-[TransitPassManager _userTransitPassesFromLibrary:]";
      __int16 v23 = 2082;
      id v24 = "library == nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. library CANNOT be nil", (uint8_t *)&v17, 0x26u);
    }

    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136446978;
      id v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPassManager.m";
      __int16 v19 = 1024;
      int v20 = 392;
      __int16 v21 = 2082;
      unsigned int v22 = "-[TransitPassManager _userTransitPassesFromLibrary:]";
      __int16 v23 = 2082;
      id v24 = "library == nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. library CANNOT be nil", (uint8_t *)&v17, 0x26u);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)_identifiersForSecurePasses:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  if (v4)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v29 = v4;
    id v6 = v4;
    id v32 = [v6 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (!v32) {
      goto LABEL_23;
    }
    id v30 = v6;
    uint64_t v31 = *(void *)v42;
    while (1)
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(v6);
        }
        id v8 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v9 = [v8 devicePrimaryPaymentApplication];
        id v10 = [v9 supportedTransitNetworkIdentifiers];

        if ([v10 count])
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v33 = v10;
          id v11 = v10;
          id v12 = [v11 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (!v12) {
            goto LABEL_20;
          }
          id v13 = v12;
          uint64_t v14 = *(void *)v38;
          while (1)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v38 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
              int v17 = [v8 localizedDescription];

              if (v17)
              {
                uint64_t v18 = [v8 localizedDescription];
              }
              else
              {
                __int16 v19 = [(NSMutableDictionary *)self->_allAvailablePasses objectForKeyedSubscript:v16];

                if (!v19) {
                  continue;
                }
                uint64_t v18 = [(NSMutableDictionary *)self->_allAvailablePasses objectForKeyedSubscript:v16];
              }
              int v20 = (void *)v18;
              [v5 setObject:v18 forKeyedSubscript:v16];
            }
            id v13 = [v11 countByEnumeratingWithState:&v37 objects:v49 count:16];
            if (!v13)
            {
LABEL_20:

              id v6 = v30;
              id v10 = v33;
              break;
            }
          }
        }
      }
      id v32 = [v6 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (!v32)
      {
LABEL_23:

        if ([v5 count])
        {
          __int16 v21 = sub_100021338();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            unsigned int v22 = sub_100099700(v6, &stru_1013007E0);
            *(_DWORD *)buf = 138412546;
            id v46 = v5;
            __int16 v47 = 2112;
            v48 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Found transit network identifiers %@ for passes: %@", buf, 0x16u);
          }
          id v23 = [v5 copy];
        }
        else
        {
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_1009080E0;
          v34[3] = &unk_1013006D8;
          id v25 = v5;
          id v35 = v25;
          id v36 = self;
          [v6 enumerateObjectsUsingBlock:v34];
          v26 = sub_100021338();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            id v27 = sub_100099700(v6, &stru_1013007E0);
            *(_DWORD *)buf = 138412546;
            id v46 = v25;
            __int16 v47 = 2112;
            v48 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Using legacy transit network identifiers %@ for passes: %@", buf, 0x16u);
          }
          id v23 = [v25 copy];
        }
        id v4 = v29;
        goto LABEL_34;
      }
    }
  }
  id v24 = sub_100021338();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "securePasses is nil, returning an empty dictionary", buf, 2u);
  }

  id v23 = v5;
LABEL_34:

  return v23;
}

- (void)_fetchAllAvailablePassesFromWallet
{
  if ([(NSMutableDictionary *)self->_allAvailablePasses count])
  {
    id v3 = sub_100021338();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_allAvailablePasses already exists. Not querying PKPaymentSetupViewController again.", buf, 2u);
    }
  }
  else
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    allAvailablePasses = self->_allAvailablePasses;
    self->_allAvailablePasses = v4;

    id v6 = sub_100021338();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "About to call +[PKPaymentSetupViewController paymentSetupFeaturesForConfiguration:completion:]", buf, 2u);
    }

    id v3 = objc_alloc_init((Class)PKPaymentSetupConfiguration);
    long long v7 = dispatch_group_create();
    [v3 setReferrerIdentifier:@"maps"];
    dispatch_group_enter(v7);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100908460;
    v11[3] = &unk_1012ED600;
    v11[4] = self;
    id v8 = v7;
    id v12 = v8;
    +[PKPaymentSetupViewController paymentSetupFeaturesForConfiguration:v3 completion:v11];
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v9 = sub_100021338();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = self->_allAvailablePasses;
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received response. Populated _allAvailablePasses: %@", buf, 0xCu);
    }
  }
}

- (void)fetchTransitMessageForRoute:(id)a3 paymentMethods:(id)a4 suggestions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[UIDevice currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  if (!v15)
  {
    if (!MapsFeature_IsEnabled_TransitPay()) {
      goto LABEL_6;
    }
    if (+[PKWalletVisibility isWalletVisible])
    {
      objc_initWeak(location, self);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100908834;
      v17[3] = &unk_101300728;
      objc_copyWeak(&v22, location);
      v17[4] = self;
      id v21 = v13;
      id v18 = v10;
      id v19 = v11;
      id v20 = v12;
      [(TransitPassManager *)self _fetchLibrary:v17];

      objc_destroyWeak(&v22);
      objc_destroyWeak(location);
      goto LABEL_6;
    }
    uint64_t v16 = sub_100021338();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Wallet is not visible. Returning.", (uint8_t *)location, 2u);
    }
  }
  (*((void (**)(id, id, void))v13 + 2))(v13, v10, 0);
LABEL_6:
}

- (id)_passForTopUpWithTransitPasses:(id)a3 forRouteTNIs:(id)a4 routeCost:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v54 = a5;
  v52 = v9;
  id v11 = [objc_alloc((Class)NSSet) initWithArray:v9];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_10090956C;
  v82[3] = &unk_101300750;
  id v53 = v10;
  id v83 = v53;
  v56 = [v11 objectsPassingTest:v82];

  if ([v56 count])
  {
    *(void *)v78 = 0;
    v79 = v78;
    uint64_t v80 = 0x2020000000;
    char v81 = 0;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100909578;
    v75[3] = &unk_101300778;
    id v50 = objc_alloc_init((Class)PKPaymentService);
    id v76 = v50;
    v77 = v78;
    id v12 = [v56 objectsPassingTest:v75];
    v51 = v12;
    if (v79[24])
    {
      id v13 = sub_100021338();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "User has an express card which does not support top up, suppressing tip", buf, 2u);
      }

      id v59 = 0;
      goto LABEL_65;
    }
    if ([v12 count])
    {
      id v15 = sub_100021338();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "User has more than one express transit card, only considering those for top up", buf, 2u);
      }

      id v16 = v51;
    }
    else
    {
      id v16 = v56;
    }
    *(void *)buf = 0;
    v72 = buf;
    uint64_t v73 = 0x2020000000;
    char v74 = 0;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100909740;
    v68[3] = &unk_1013007A0;
    v68[4] = self;
    id v69 = v54;
    v70 = buf;
    v56 = [v16 objectsPassingTest:v68];

    if (v72[24])
    {
      id v59 = 0;
LABEL_64:

      _Block_object_dispose(buf, 8);
LABEL_65:

      _Block_object_dispose(v78, 8);
      goto LABEL_66;
    }
    if ([v56 count])
    {
      if ([v56 count] == (id)1)
      {
        int v17 = sub_100021338();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v84 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "User only has one remaining pass compatible with this route, using that.", v84, 2u);
        }

        id v59 = [v56 anyObject];
        goto LABEL_64;
      }
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v18 = v56;
      id v19 = [v18 countByEnumeratingWithState:&v64 objects:v87 count:16];
      if (v19)
      {
        obj = v18;
        id v59 = 0;
        uint64_t v57 = *(void *)v65;
        double v20 = -1.79769313e308;
        while (1)
        {
          id v58 = v19;
          for (i = 0; i != v58; i = (char *)i + 1)
          {
            if (*(void *)v65 != v57) {
              objc_enumerationMutation(obj);
            }
            id v22 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            id v23 = [objc_alloc((Class)NSDecimalNumber) initWithDouble:0.0];
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v24 = [v22 transitProperties];
            id v25 = [v24 balances];

            id v26 = [v25 countByEnumeratingWithState:&v60 objects:v86 count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v61;
              do
              {
                BOOL v28 = 0;
                id v29 = v23;
                do
                {
                  if (*(void *)v61 != v27) {
                    objc_enumerationMutation(v25);
                  }
                  id v30 = [*(id *)(*((void *)&v60 + 1) + 8 * (void)v28) amount];
                  id v23 = [v29 decimalNumberByAdding:v30];

                  BOOL v28 = (char *)v28 + 1;
                  id v29 = v23;
                }
                while (v26 != v28);
                id v26 = [v25 countByEnumeratingWithState:&v60 objects:v86 count:16];
              }
              while (v26);
            }

            [v23 doubleValue];
            if (v31 == v20)
            {
              if ([v22 isRemotePass]) {
                goto LABEL_59;
              }
              id v32 = sub_100021338();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v84 = 0;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Two passes have the same balance. Using the local pass", v84, 2u);
              }
            }
            else
            {
              [v23 doubleValue];
              if (v33 <= v20) {
                goto LABEL_59;
              }
              long long v34 = sub_100021338();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                id v35 = v22;
                id v36 = objc_alloc((Class)NSString);
                uint64_t v37 = [v35 localizedDescription];
                long long v38 = (void *)v37;
                if (v37)
                {
                  int v39 = 0;
                  CFStringRef v40 = (const __CFString *)v37;
                }
                else
                {
                  uint64_t v41 = [v35 organizationName];
                  id v5 = (void *)v41;
                  if (v41)
                  {
                    int v39 = 0;
                    CFStringRef v40 = (const __CFString *)v41;
                  }
                  else
                  {
                    uint64_t v42 = [v35 localizedName];
                    v49 = (void *)v42;
                    id v5 = 0;
                    if (v42) {
                      CFStringRef v40 = (const __CFString *)v42;
                    }
                    else {
                      CFStringRef v40 = @"{pass has no description}";
                    }
                    int v39 = 1;
                  }
                }
                unsigned int v43 = [v35 isRemotePass];
                CFStringRef v44 = @"NO";
                if (v43) {
                  CFStringRef v44 = @"YES";
                }
                id v45 = [v36 initWithFormat:@"%@: %@, isRemote: %@", v35, v40, v44];
                if (v39) {

                }
                if (!v38) {
                *(_DWORD *)v84 = 138412290;
                }
                id v85 = v45;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Current pass with the highest value is %@", v84, 0xCu);
              }
              [v23 doubleValue];
              double v20 = v46;
            }
            id v47 = v22;

            id v59 = v47;
LABEL_59:
          }
          id v19 = [obj countByEnumeratingWithState:&v64 objects:v87 count:16];
          if (!v19)
          {
            id v18 = obj;
            goto LABEL_63;
          }
        }
      }
    }
    else
    {
      id v18 = sub_100021338();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v84 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "User has no remaining passes that support top up with a balance less than the route cost", v84, 2u);
      }
    }
    id v59 = 0;
LABEL_63:

    goto LABEL_64;
  }
  uint64_t v14 = sub_100021338();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v78 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "User has no passes supported on the route", v78, 2u);
  }

  id v59 = 0;
LABEL_66:

  return v59;
}

- (void)_passKitLibraryDidChange:(id)a3
{
  id v4 = sub_100021338();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received _passKitLibraryDidChange, taking appropriate action.", v5, 2u);
  }

  [(MapsSuggestionsCanKicker *)self->_passKitLibraryDidChangeCanKicker kickCanBySameTime];
}

- (void)_passKitLibraryMayHaveChanged
{
  id v3 = [(TransitPassManager *)self delegate];
  [v3 transitPassManagerDidChange:self];
}

- (id)transitSystemsForRoute:(id)a3 withSupportedPaymentMethods:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = objc_alloc_init((Class)NSMutableSet);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v25 = v5;
  id obj = [v5 baseTransitFares];
  id v8 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v12 cashOnly])
        {
          id v13 = sub_100021338();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v14 = [v12 value];
            *(_DWORD *)buf = 138412290;
            id v32 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Checking the next fare because the fare with value %@ is cashOnly", buf, 0xCu);
          }
        }
        else
        {
          id v13 = +[NSMutableSet set];
          if ([v12 supportedPaymentMethodIndexsCount])
          {
            unint64_t v15 = 0;
            do
            {
              unint64_t v16 = *((unsigned int *)[v12 supportedPaymentMethodIndexs] + v15);
              if ((unint64_t)[v6 count] > v16)
              {
                int v17 = [v6 objectAtIndexedSubscript:v16];
                id v18 = [v17 identifier];
                [v13 addObject:v18];
              }
              ++v15;
            }
            while (v15 < (unint64_t)[v12 supportedPaymentMethodIndexsCount]);
          }
          id v19 = sub_100021338();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = v13;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Supported transit identifiers for fare: %@", buf, 0xCu);
          }

          if (![v13 count])
          {
            double v20 = sub_100021338();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Route rejected because we found no supported cards in a fare", buf, 2u);
            }

            [v7 removeAllObjects];
            goto LABEL_30;
          }
          if ([v7 count]) {
            [v7 intersectSet:v13];
          }
          else {
            [v7 unionSet:v13];
          }
          if (![v7 count])
          {
            id v21 = sub_100021338();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Route rejected because there are no pass identifiers", buf, 2u);
            }

LABEL_30:
            goto LABEL_31;
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_31:

  id v22 = sub_100021338();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Pass Identifiers: %@", buf, 0xCu);
  }

  id v23 = [v7 copy];

  return v23;
}

- (id)currencyAmountForRoute:(id)a3
{
  id v3 = a3;
  id v4 = [v3 baseTransitFares];
  id v5 = v4;
  if (!v4 || ![v4 count])
  {
    long long v7 = sub_100021338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Route rejected because we found no base fares on route.", buf, 2u);
    }
    id v22 = 0;
    goto LABEL_35;
  }
  id v6 = [v5 firstObject];
  long long v7 = [v6 currencyCode];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v9)
  {

    goto LABEL_25;
  }
  id v10 = v9;
  id v26 = v3;
  id v11 = 0;
  uint64_t v12 = *(void *)v28;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if (([v14 cashOnly] & 1) == 0)
      {
        unint64_t v15 = [v14 value];

        if (v15)
        {
          unint64_t v16 = [v14 currencyCode];
          unsigned __int8 v17 = [v7 isEqualToString:v16];

          if (v17)
          {
            id v18 = [v14 value];
            id v19 = v18;
            if (v11)
            {
              uint64_t v20 = [v11 decimalNumberByAdding:v18];

              id v11 = v20;
            }
            else
            {
              id v11 = v18;
            }

            continue;
          }
          id v23 = sub_100021338();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            id v24 = "Mixed currencies are unsupported. Returning.";
            goto LABEL_31;
          }
        }
        else
        {
          id v23 = sub_100021338();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            id v24 = "fare.value is nil. Returning.";
LABEL_31:
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, buf, 2u);
          }
        }
        id v3 = v26;

        goto LABEL_33;
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v10) {
      continue;
    }
    break;
  }

  id v3 = v26;
  if (v11)
  {
    id v21 = sub_100021338();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v11;
      __int16 v33 = 2112;
      long long v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "totalFareValue = %@, currencyCode = %@", buf, 0x16u);
    }

    id v22 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v11 currency:v7 exponent:0];
    goto LABEL_34;
  }
LABEL_25:
  id v11 = sub_100021338();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "totalFareValue is nil. Are all fares cash only? Returning.", buf, 2u);
  }
LABEL_33:
  id v22 = 0;
LABEL_34:

LABEL_35:

  return v22;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v5 = [(TransitPassManager *)self delegate];
  [v5 transitPassManagerDidChange:self];
}

- (TransitPassManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitPassManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passKitLibraryDidChangeCanKicker, 0);
  objc_storeStrong((id *)&self->_allAvailablePasses, 0);
  objc_storeStrong((id *)&self->_libraryToNotUseDirectly, 0);

  objc_storeStrong((id *)&self->_libraryQueue, 0);
}

@end