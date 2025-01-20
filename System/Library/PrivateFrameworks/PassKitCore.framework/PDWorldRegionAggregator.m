@interface PDWorldRegionAggregator
- (BOOL)_hasRegionsOrTransactionsToProcess;
- (BOOL)_hasTransactionsToProcess;
- (BOOL)isProcessing;
- (BOOL)willRequireProcessing;
- (PDWorldRegionAggregator)initWithDatabaseManager:(id)a3;
- (id)_worldRegionFromPlacemark:(id)a3 orAddress:(id)a4;
- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7;
- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 localeIdentifier:(id)a5 boundingRegion:(id *)a6 mapsIdentifier:(unint64_t)a7 providerIdentifier:(int)a8;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_associateTransaction:(id)a3 toRegion:(id)a4;
- (void)_cleanupRegionsWithCompletion:(id)a3;
- (void)_processMissingLocalizedContent:(id)a3 completion:(id)a4;
- (void)_processMissingLocalizedContentWithCompletion:(id)a3;
- (void)_processRemainingTransactionsWithCompletion:(id)a3;
- (void)_processTransaction:(id)a3 completion:(id)a4;
- (void)addObserver:(id)a3;
- (void)placemarkFound:(id)a3 forTransaction:(id)a4;
- (void)removeObserver:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)triggerAggregatorWithTriggerOrigin:(unint64_t)a3;
@end

@implementation PDWorldRegionAggregator

- (PDWorldRegionAggregator)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  if (PKIsPhone())
  {
    v14.receiver = self;
    v14.super_class = (Class)PDWorldRegionAggregator;
    v6 = [(PDWorldRegionAggregator *)&v14 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_databaseManager, a3);
      v8 = (CLGeocoder *)objc_alloc_init((Class)CLGeocoder);
      geocoder = v7->_geocoder;
      v7->_geocoder = v8;

      v7->_lockOperation._os_unfair_lock_opaque = 0;
      v7->_lockObservers._os_unfair_lock_opaque = 0;
      uint64_t v10 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
      observers = v7->_observers;
      v7->_observers = (NSHashTable *)v10;

      v7->_willRequireProcessing = [(PDWorldRegionAggregator *)v7 _hasRegionsOrTransactionsToProcess];
    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_hasRegionsOrTransactionsToProcess
{
  v3 = +[NSLocale currentLocale];
  v4 = [v3 localeIdentifier];

  if ([(PDDatabaseManager *)self->_databaseManager hasRegionsMissingLocalizedContentForLocaleIdentifier:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = [(PDWorldRegionAggregator *)self _hasTransactionsToProcess];
  }

  return v5;
}

- (BOOL)_hasTransactionsToProcess
{
  return [(PDDatabaseManager *)self->_databaseManager hasTransactionsMissingWorldRegionEligibleForProcessing];
}

- (BOOL)willRequireProcessing
{
  v2 = self;
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  LOBYTE(v2) = v2->_willRequireProcessing;
  os_unfair_lock_unlock(p_lockOperation);
  return (char)v2;
}

- (void)placemarkFound:(id)a3 forTransaction:(id)a4
{
  id v8 = a4;
  v6 = [(PDWorldRegionAggregator *)self _worldRegionFromPlacemark:a3 orAddress:0];
  if (v8 && v6)
  {
    [(PDWorldRegionAggregator *)self _associateTransaction:v8 toRegion:v6];
    os_unfair_lock_lock(&self->_lockOperation);
    if (self->_willRequireProcessing) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = [(PDWorldRegionAggregator *)self _hasRegionsOrTransactionsToProcess];
    }
    self->_willRequireProcessing = v7;
    os_unfair_lock_unlock(&self->_lockOperation);
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  if (self->_willRequireProcessing) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = [(PDWorldRegionAggregator *)self _hasTransactionsToProcess];
  }
  self->_willRequireProcessing = v7;
  os_unfair_lock_unlock(p_lockOperation);
}

- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 localeIdentifier:(id)a5 boundingRegion:(id *)a6 mapsIdentifier:(unint64_t)a7 providerIdentifier:(int)a8
{
  double v14 = v11;
  double v15 = v10;
  double v16 = v9;
  double v17 = v8;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  v24 = [(PDDatabaseManager *)self->_databaseManager worldRegionWithIdentifier:v21 localeIdentifier:0];
  v25 = v24;
  if (v24)
  {
    [v24 setLocalizedName:v22];
    objc_msgSend(v25, "setDisplayRegion:", v17, v16, v15, v14);
    [v25 setMuid:a6];
    [v25 setResultProviderIdentifier:a7];
    if (v23) {
      [v25 setLocaleIdentifier:v23];
    }
    [(PDDatabaseManager *)self->_databaseManager updateSingleRegion:v25];
  }
  v26 = [(PDDatabaseManager *)self->_databaseManager worldRegionWithIdentifier:v21 localeIdentifier:v23];

  return v26;
}

- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7
{
  return -[PDWorldRegionAggregator updateRegionWithIdentifier:localizedName:localeIdentifier:boundingRegion:mapsIdentifier:providerIdentifier:](self, "updateRegionWithIdentifier:localizedName:localeIdentifier:boundingRegion:mapsIdentifier:providerIdentifier:", a3, a4, 0, a5, a6);
}

- (BOOL)isProcessing
{
  v2 = self;
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  LOBYTE(v2) = v2->_addingOrLocalizingRegions;
  os_unfair_lock_unlock(p_lockOperation);
  return (char)v2;
}

- (void)triggerAggregatorWithTriggerOrigin:(unint64_t)a3
{
  if (PKLocationServicesEnabled())
  {
    BOOL v5 = a3 == 2;
    os_unfair_lock_lock(&self->_lockOperation);
    if (self->_performingOperation)
    {
      if (a3 == 2) {
        self->_operationUserInitiated = v5;
      }
      os_unfair_lock_unlock(&self->_lockOperation);
    }
    else
    {
      self->_performingOperation = 1;
      self->_operationUserInitiated = v5;
      os_unfair_lock_unlock(&self->_lockOperation);
      BOOL v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Aggregation operation starting", buf, 2u);
      }

      *(void *)buf = 0;
      v13 = buf;
      uint64_t v14 = 0x3032000000;
      double v15 = sub_100020D2C;
      double v16 = sub_100021188;
      id v17 = (id)PDOSTransactionCreate("PDWorldRegionAggregator.aggregation_operation");
      if (a3 == 2) {
        PDDefaultQueue();
      }
      else {
      double v8 = PDUtilityQueue();
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003C2534;
      block[3] = &unk_10074E9D8;
      BOOL v10 = a3 == 2;
      BOOL v11 = a3 == 0;
      block[4] = self;
      block[5] = buf;
      dispatch_async(v8, block);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping region aggregation, location services disabled.", buf, 2u);
    }

    os_unfair_lock_lock(&self->_lockOperation);
    *(_WORD *)&self->_addingOrLocalizingRegions = 0;
    os_unfair_lock_unlock(&self->_lockOperation);
    [(PDWorldRegionAggregator *)self _accessObserversWithHandler:&stru_10074E960];
  }
}

- (void)_cleanupRegionsWithCompletion:(id)a3
{
  id v5 = a3;
  [(PDDatabaseManager *)self->_databaseManager deleteRegionsWithNoMatchingTransactions];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (void)_processMissingLocalizedContentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSLocale currentLocale];
  v6 = [v5 localeIdentifier];

  BOOL v7 = [(PDDatabaseManager *)self->_databaseManager regionsMissingLocalizedContentForLocaleIdentifier:v6];
  double v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Localizing content for %ld regions", (uint8_t *)&buf, 0xCu);
  }

  if ([v7 count])
  {
    os_unfair_lock_lock(&self->_lockOperation);
    self->_addingOrLocalizingRegions = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
    [(PDWorldRegionAggregator *)self _accessObserversWithHandler:&stru_10074E9F8];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  id v9 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1003C3020;
        v21[3] = &unk_100730730;
        v21[4] = self;
        v21[5] = v14;
        v21[6] = &buf;
        [v9 addOperation:v21];
      }
      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  double v15 = +[NSNull null];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1003C3134;
  v18[3] = &unk_10072E660;
  id v16 = v4;
  id v19 = v16;
  p_long long buf = &buf;
  id v17 = [v9 evaluateWithInput:v15 completion:v18];

  _Block_object_dispose(&buf, 8);
}

- (void)_processMissingLocalizedContent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch((unint64_t)[v6 type])
  {
    case 0uLL:
      double v8 = +[NSLocale currentLocale];
      id v9 = [v8 localeIdentifier];
      [v6 setLocaleIdentifier:v9];

      id v10 = [v6 localizedName];
      [v6 setLocalizedName:v10];

      [(PDDatabaseManager *)self->_databaseManager updateSingleRegion:v6];
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Localized sublocality %@", buf, 0xCu);
      }
      goto LABEL_18;
    case 1uLL:
      uint64_t v12 = [v6 localizedName];
      v13 = [v6 regionOfType:4];
      uint64_t v14 = [v13 abbreviationCode];

      if (![v12 length] || !objc_msgSend(v14, "length")) {
        goto LABEL_12;
      }
      id v15 = objc_alloc_init((Class)CNMutablePostalAddress);
      [v15 setCity:v12];
      id v16 = [v6 parentRegion];
      id v17 = [v16 abbreviationCode];
      [v15 setISOCountryCode:v17];

      v18 = [v6 abbreviationCode];
      if ([v18 length]) {
        [v15 setState:v18];
      }
      goto LABEL_11;
    case 3uLL:
      uint64_t v12 = [v6 abbreviationCode];
      id v19 = [v6 regionOfType:4];
      uint64_t v14 = [v19 abbreviationCode];

      if ([v12 length] && objc_msgSend(v14, "length"))
      {
        id v15 = objc_alloc_init((Class)CNMutablePostalAddress);
        v20 = [v6 abbreviationCode];
        [v15 setState:v20];

        v18 = [v6 parentRegion];
        id v21 = [v18 abbreviationCode];
        [v15 setISOCountryCode:v21];

LABEL_11:
      }
      else
      {
LABEL_12:
        id v15 = 0;
      }

      if (v15)
      {
        geocoder = self->_geocoder;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1003C3624;
        v28[3] = &unk_1007427D0;
        v28[4] = self;
        id v29 = v6;
        id v30 = v7;
        [(CLGeocoder *)geocoder geocodePostalAddress:v15 completionHandler:v28];
      }
      else
      {
LABEL_19:
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1003C3C00;
        v26[3] = &unk_10074EA20;
        id v27 = v6;
        [(PDWorldRegionAggregator *)self _accessObserversWithHandler:v26];
        if (v7) {
          (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
        }
        id v15 = v27;
      }

      return;
    case 4uLL:
      double v8 = +[NSLocale currentLocale];
      long long v23 = [v6 abbreviationCode];
      id v11 = [v8 localizedStringForCountryCode:v23];

      long long v24 = [v8 localeIdentifier];
      [v6 setLocaleIdentifier:v24];

      [v6 setLocalizedName:v11];
      [(PDDatabaseManager *)self->_databaseManager updateSingleRegion:v6];
      long long v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Localized country %@", buf, 0xCu);
      }

LABEL_18:
      goto LABEL_19;
    default:
      goto LABEL_19;
  }
}

- (void)_processRemainingTransactionsWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lockOperation);
  BOOL operationUserInitiated = self->_operationUserInitiated;
  os_unfair_lock_unlock(&self->_lockOperation);
  if (operationUserInitiated) {
    PDDefaultQueue();
  }
  else {
  id v6 = PDUtilityQueue();
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003C3D38;
  v8[3] = &unk_10072FDC8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_processTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1003C4604;
  v64[3] = &unk_10074EA48;
  v51 = self;
  v64[4] = self;
  id v7 = a4;
  id v65 = v7;
  double v8 = objc_retainBlock(v64);
  id v9 = [v6 merchant];
  id v10 = [v9 mapsMerchant];
  id v11 = [v10 postalAddress];
  uint64_t v12 = [v6 preferredLocation];
  v13 = +[NSLocale currentLocale];
  uint64_t v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v6 identifier];
    *(_DWORD *)long long buf = 138412290;
    v67 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Finding region for transaction with identifier %@", buf, 0xCu);
  }
  if (!v11)
  {
    v52 = (void (**)(void, void, void, void, void))v8;
    if (v12)
    {
LABEL_17:
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [v6 identifier];
        *(_DWORD *)long long buf = 138412290;
        v67 = v30;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Reverse geocoding for transaction %@", buf, 0xCu);
      }
      geocoder = v51->_geocoder;
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_1003C4C5C;
      v61[3] = &unk_10072DFD8;
      id v62 = v6;
      id v29 = v52;
      v63 = v52;
      [(CLGeocoder *)geocoder reverseGeocodeLocation:v12 completionHandler:v61];

      goto LABEL_33;
    }
LABEL_21:
    id v32 = [v9 city];
    if ([v32 length])
    {
      v33 = v11;
      v34 = [v9 rawCountry];
      if ([v34 length])
      {
        uint64_t v35 = (uint64_t)[v9 cleanConfidenceLevel];

        BOOL v36 = v35 < 91;
        uint64_t v12 = 0;
        id v11 = v33;
        if (!v36)
        {
          id v37 = v7;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v38 = [v6 identifier];
            *(_DWORD *)long long buf = 138412290;
            v67 = v38;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Forward geocoding for transaction %@", buf, 0xCu);
          }
          id v39 = objc_alloc_init((Class)CNMutablePostalAddress);
          v40 = [v9 city];
          [v39 setCity:v40];

          v41 = [v9 state];
          [v39 setState:v41];

          v42 = [v9 zip];
          [v39 setPostalCode:v42];

          v43 = [v9 rawCountry];
          [v39 setCountry:v43];

          v44 = v51->_geocoder;
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472;
          v53[2] = sub_1003C4EAC;
          v53[3] = &unk_100745D40;
          id v54 = v39;
          v56 = v52;
          id v55 = v6;
          id v45 = v39;
          [(CLGeocoder *)v44 geocodePostalAddress:v45 completionHandler:v53];

          id v7 = v37;
          id v11 = v33;
          id v29 = v52;
          uint64_t v12 = 0;
          goto LABEL_33;
        }
LABEL_32:
        id v29 = v52;
        ((void (**)(void, id, void, void, void))v52)[2](v52, v6, 0, 0, 0);
        goto LABEL_33;
      }

      id v11 = v33;
    }

    goto LABEL_32;
  }
  v48 = v6;
  id v49 = v7;
  v50 = v10;
  id v16 = v8;
  id v17 = [v11 country];
  v18 = v11;
  id v19 = [v11 ISOCountryCode];
  v20 = v13;
  id v21 = [v13 localizedStringForCountryCode:v19];
  id v22 = v17;
  id v23 = v21;
  long long v24 = v23;
  long long v25 = v12;
  if (v22 == v23)
  {

    goto LABEL_12;
  }
  if (!v22 || !v23)
  {

    goto LABEL_15;
  }
  id v26 = [v22 caseInsensitiveCompare:v23];

  if (v26)
  {
LABEL_15:

    goto LABEL_16;
  }
LABEL_12:
  unsigned __int8 v27 = [v9 useRawMerchantData];

  if ((v27 & 1) == 0)
  {
    id v11 = v18;
    id v6 = v48;
    ((void (*)(void *))v16[2])(v16);
    uint64_t v28 = v16;
    id v7 = v49;
    id v10 = v50;
    uint64_t v12 = v25;
    v13 = v20;
    id v29 = v28;
    goto LABEL_33;
  }
LABEL_16:
  v52 = (void (**)(void, void, void, void, void))v16;
  id v7 = v49;
  id v10 = v50;
  id v11 = v18;
  id v6 = v48;
  uint64_t v12 = v25;
  v13 = v20;
  if (v12) {
    goto LABEL_17;
  }
  if ([v9 useRawMerchantData]) {
    goto LABEL_21;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [v48 identifier];
    *(_DWORD *)long long buf = 138412546;
    v67 = v11;
    __int16 v68 = 2112;
    v69 = v46;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Forward geocoding with postal address %@ for transaction %@", buf, 0x16u);
  }
  v47 = v51->_geocoder;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1003C4D8C;
  v57[3] = &unk_100745D40;
  id v58 = v11;
  v60 = v52;
  id v59 = v48;
  [(CLGeocoder *)v47 geocodePostalAddress:v58 completionHandler:v57];

  id v29 = v52;
LABEL_33:
}

- (void)_associateTransaction:(id)a3 toRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PDDatabaseManager *)self->_databaseManager associateTransaction:v6 toRegion:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003C509C;
  v10[3] = &unk_10074EA70;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PDWorldRegionAggregator *)self _accessObserversWithHandler:v10];
}

- (id)_worldRegionFromPlacemark:(id)a3 orAddress:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    id v7 = +[NSLocale currentLocale];
    id v8 = [v7 localeIdentifier];
    id v9 = [(id)v5 ISOcountryCode];
    id v22 = v7;
    if ((v9 || ([(id)v6 ISOCountryCode], (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
      && [v9 length])
    {
      id v10 = objc_alloc_init((Class)PKWorldRegion);
      [v10 setLocaleIdentifier:v8];
      [v10 setAbbreviationCode:v9];
      id v11 = [v7 localizedStringForCountryCode:v9];
      [v10 setLocalizedName:v11];

      [v10 setType:4];
    }
    else
    {
      id v10 = 0;
    }
    v13 = [(id)v5 administrativeArea];
    if ((v13 || ([(id)v6 state], (v13 = objc_claimAutoreleasedReturnValue()) != 0))
      && [v13 length])
    {
      id v14 = objc_alloc_init((Class)PKWorldRegion);
      [v14 setLocaleIdentifier:v8];
      if ((unint64_t)[v13 length] <= 3) {
        [v14 setAbbreviationCode:v13];
      }
      [v14 setLocalizedName:v13];
      [v14 setType:3];
      if (v10) {
        [v14 setParentRegion:v10];
      }
    }
    else
    {
      id v14 = v10;
    }
    id v15 = [(id)v5 subAdministrativeArea];
    if ((v15
       || ([(id)v6 subAdministrativeArea], (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
      && [v15 length])
    {
      id v16 = objc_alloc_init((Class)PKWorldRegion);
      [v16 setLocaleIdentifier:v8];
      [v16 setLocalizedName:v15];
      [v16 setType:2];
      if (v14) {
        [v16 setParentRegion:v14];
      }
    }
    else
    {
      id v16 = v14;
    }
    id v17 = [(id)v5 locality];
    if ((v17 || ([(id)v6 city], (id v17 = objc_claimAutoreleasedReturnValue()) != 0))
      && [v17 length])
    {
      id v18 = objc_alloc_init((Class)PKWorldRegion);
      [v18 setLocaleIdentifier:v8];
      [v18 setLocalizedName:v17];
      [v18 setType:1];
      if (v16) {
        [v18 setParentRegion:v16];
      }
    }
    else
    {
      id v18 = v16;
    }
    id v19 = [(id)v5 subLocality];
    if ((v19 || ([(id)v6 subLocality], (id v19 = objc_claimAutoreleasedReturnValue()) != 0))
      && [v19 length])
    {
      id v20 = objc_alloc_init((Class)PKWorldRegion);
      [v20 setLocaleIdentifier:v8];
      [v20 setLocalizedName:v19];
      [v20 setType:0];
      if (v18) {
        [v20 setParentRegion:v18];
      }
    }
    else
    {
      id v20 = v18;
    }
    id v12 = v20;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    id v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_lockObservers);
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    id v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lockObservers = &self->_lockObservers;
    os_unfair_lock_lock(&self->_lockObservers);
    unint64_t v6 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(p_lockObservers);
    id v7 = PDUtilityQueue();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003C5628;
    v9[3] = &unk_10072FDC8;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end