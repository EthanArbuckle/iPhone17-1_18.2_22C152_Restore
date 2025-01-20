@interface AddressBookAddress
+ (id)_completionQueue;
+ (id)_completionsByAddress;
+ (id)_geocodedMapItemsByAddress;
+ (id)singleAddressForContact:(id)a3;
+ (void)didReceiveMemoryWarning;
+ (void)initialize;
- (AddressBookAddress)init;
- (AddressBookAddress)initWithCNContactIdentifier:(id)a3 addressIdentifier:(id)a4;
- (AddressBookAddress)initWithContact:(id)a3 addressValue:(id)a4;
- (AddressBookAddress)initWithRecordID:(int)a3 addressID:(int)a4;
- (BOOL)hasStreetAddress;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHomeWorkSchoolAddress;
- (BOOL)isMeCard;
- (BOOL)isValid;
- (CNContact)contact;
- (CNLabeledValue)addressValue;
- (MKMapItem)generatedMapItem;
- (MKMapItem)generatedMapItemCache;
- (MKMapItem)geocodedMapItem;
- (MapsLocationOfInterest)locationOfInterest;
- (NSDictionary)addressDictionary;
- (NSError)geocodingError;
- (NSString)addressIdentifier;
- (NSString)compositeName;
- (NSString)contactIdentifier;
- (NSString)localizedLabel;
- (NSString)phoneticName;
- (NSString)shortAddress;
- (NSString)singleLineAddress;
- (NSString)spokenNameForNavigation;
- (NSString)waypointCompositeName;
- (OS_dispatch_queue)addressResolutionQueue;
- (double)timestamp;
- (id)_addressResolutionQueue;
- (id)_carMeCardTitle;
- (id)compositeNameMatchesForSearchString:(id)a3;
- (id)entryWithTicket:(id)a3;
- (id)initForTest;
- (id)thumbnailIconWithScale:(double)a3 size:(unint64_t)a4;
- (int)addressType;
- (unint64_t)hash;
- (void)_cancelDeferredAddressResolutionTimerIfNeeded;
- (void)_handleResolvedAddress:(id)a3 geocodedMapItem:(id)a4;
- (void)_resolveContactIdentifier:(id)a3 addressIdentifier:(id)a4 completion:(id)a5;
- (void)_setSuppressStoreUpdateNotifications:(BOOL)a3;
- (void)_updateMapItemClientAttributes;
- (void)dealloc;
- (void)forwardGeocodeAddress:(id)a3;
- (void)setAddressValue:(id)a3;
- (void)setContact:(id)a3;
- (void)setGeneratedMapItemCache:(id)a3;
- (void)setGeocodedMapItem:(id)a3;
- (void)setLocationOfInterest:(id)a3;
- (void)storeUpdated:(id)a3;
- (void)updateModel:(id)a3;
@end

@implementation AddressBookAddress

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:a1 selector:"didReceiveMemoryWarning" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
}

- (void)_setSuppressStoreUpdateNotifications:(BOOL)a3
{
  if (self->_suppressStoreUpdateNotifications != a3)
  {
    BOOL v3 = a3;
    self->_suppressStoreUpdateNotifications = a3;
    v5 = sub_1000A31A8();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (!v6)
      {
LABEL_10:

        v13 = +[NSNotificationCenter defaultCenter];
        [v13 removeObserver:self name:CNContactStoreDidChangeNotification object:0];

        return;
      }
      v7 = self;
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      if (objc_opt_respondsToSelector())
      {
        v10 = [(AddressBookAddress *)v7 performSelector:"accessibilityIdentifier"];
        v11 = v10;
        if (v10 && ![v10 isEqualToString:v9])
        {
          v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

          goto LABEL_9;
        }
      }
      v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_9:

      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] suppressing store update notifications", buf, 0xCu);

      goto LABEL_10;
    }
    if (!v6) {
      goto LABEL_18;
    }
    v14 = self;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      v17 = [(AddressBookAddress *)v14 performSelector:"accessibilityIdentifier"];
      v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_17;
      }
    }
    v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_17:

    *(_DWORD *)buf = 138543362;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] resuming store update notifications, will update immediately", buf, 0xCu);

LABEL_18:
    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:self selector:"storeUpdated:" name:CNContactStoreDidChangeNotification object:0];

    [(AddressBookAddress *)self storeUpdated:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedMapItemCache, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_geocodingError, 0);
  objc_storeStrong((id *)&self->_geocodedMapItem, 0);
  objc_storeStrong((id *)&self->_addressValue, 0);
  objc_storeStrong((id *)&self->_addressIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_addressResolutionQueue, 0);
  objc_storeStrong((id *)&self->_shortAddress, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_deferredAddressResolutionTimer, 0);
}

- (CNLabeledValue)addressValue
{
  return self->_address;
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AddressBookAddress;
  [(AddressBookAddress *)&v4 dealloc];
}

+ (id)singleAddressForContact:(id)a3
{
  id v3 = a3;
  objc_super v4 = [AddressBookAddress alloc];
  v5 = [v3 postalAddresses];
  BOOL v6 = [v5 firstObject];
  v7 = [(AddressBookAddress *)v4 initWithContact:v3 addressValue:v6];

  return v7;
}

- (AddressBookAddress)initWithContact:(id)a3 addressValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AddressBookAddress *)self init];
  if (v8)
  {
    v9 = sub_1000A31A8();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v16 = (CNContact *)[v6 copy];
      contact = v8->_contact;
      v8->_contact = v16;

      v18 = (CNLabeledValue *)[v7 copy];
      address = v8->_address;
      v8->_address = v18;

      uint64_t v20 = [(CNContact *)v8->_contact identifier];
      contactIdentifier = v8->_contactIdentifier;
      v8->_contactIdentifier = (NSString *)v20;

      uint64_t v22 = [(CNLabeledValue *)v8->_address identifier];
      addressIdentifier = v8->_addressIdentifier;
      v8->_addressIdentifier = (NSString *)v22;

      v24 = +[NSDate date];
      [v24 timeIntervalSinceReferenceDate];
      v8->_timestamp = v25;

      goto LABEL_10;
    }
    v10 = v8;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      v13 = [(AddressBookAddress *)v10 performSelector:"accessibilityIdentifier"];
      v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_8;
      }
    }
    v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_8:

    *(_DWORD *)buf = 138543875;
    v28 = v15;
    __int16 v29 = 2113;
    id v30 = v6;
    __int16 v31 = 2113;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] initialising with contact %{private}@ / %{private}@", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (AddressBookAddress)init
{
  v6.receiver = self;
  v6.super_class = (Class)AddressBookAddress;
  v2 = [(AddressBookAddress *)&v6 init];
  if (v2)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"storeUpdated:" name:CNContactStoreDidChangeNotification object:0];

    objc_super v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"storeUpdated:" name:@"CorrectedMapItemsUpdated" object:0];
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (AddressBookAddress *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      objc_super v6 = [(AddressBookAddress *)self contact];
      id v7 = [(AddressBookAddress *)v5 contact];
      if ([v6 isEqual:v7]) {
        unsigned __int8 v8 = [(CNLabeledValue *)self->_address isEqual:v5->_address];
      }
      else {
        unsigned __int8 v8 = 0;
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (id)initForTest
{
  id v3 = sub_1000A31A8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(AddressBookAddress *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] initialising for test", buf, 0xCu);
  }
  return [(AddressBookAddress *)self init];
}

- (AddressBookAddress)initWithRecordID:(int)a3 addressID:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_super v6 = [(AddressBookAddress *)self init];
  if (!v6) {
    return v6;
  }
  id v7 = sub_1000A31A8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v8 = v6;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(AddressBookAddress *)v8 performSelector:"accessibilityIdentifier"];
      v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    *(_DWORD *)buf = 138543874;
    v36 = v13;
    __int16 v37 = 2048;
    uint64_t v38 = (int)v5;
    __int16 v39 = 2048;
    uint64_t v40 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] initialising with record ID %ld, address ID %ld", buf, 0x20u);
  }
  v14 = +[NSDate date];
  [v14 timeIntervalSinceReferenceDate];
  v6->_timestamp = v15;

  v16 = +[AddressBookManager sharedManager];
  uint64_t v17 = [v16 contactForRecordId:v5];
  contact = v6->_contact;
  v6->_contact = (CNContact *)v17;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v19 = [(CNContact *)v6->_contact postalAddresses];
  id v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (a4 == -1)
        {
          objc_storeStrong((id *)&v6->_address, *(id *)(*((void *)&v30 + 1) + 8 * i));

          goto LABEL_23;
        }
        if (!v6->_address) {
          objc_storeStrong((id *)&v6->_address, *(id *)(*((void *)&v30 + 1) + 8 * i));
        }
        if ([v24 iOSLegacyIdentifier] == a4) {
          objc_storeStrong((id *)&v6->_address, v24);
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

LABEL_23:
  uint64_t v25 = [(CNLabeledValue *)v6->_address identifier];
  addressIdentifier = v6->_addressIdentifier;
  v6->_addressIdentifier = (NSString *)v25;

  uint64_t v27 = [(CNContact *)v6->_contact identifier];
  contactIdentifier = v6->_contactIdentifier;
  v6->_contactIdentifier = (NSString *)v27;

  return v6;
}

- (AddressBookAddress)initWithCNContactIdentifier:(id)a3 addressIdentifier:(id)a4
{
  id v6 = a3;
  id v35 = a4;
  id v7 = [(AddressBookAddress *)self init];
  if (!v7) {
    goto LABEL_23;
  }
  unsigned __int8 v8 = sub_1000A31A8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v7;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [(AddressBookAddress *)v9 performSelector:"accessibilityIdentifier"];
      v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_8;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

    *(_DWORD *)buf = 138543874;
    v42 = v14;
    __int16 v43 = 2114;
    id v44 = v6;
    __int16 v45 = 2114;
    id v46 = v35;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] initialising with contact ID %{public}@, address ID %{public}@", buf, 0x20u);
  }
  double v15 = +[NSDate date];
  [v15 timeIntervalSinceReferenceDate];
  v7->_timestamp = v16;

  uint64_t v17 = +[AddressBookManager sharedManager];
  uint64_t v18 = [v17 contactForCNContactIdentifier:v6];
  contact = v7->_contact;
  v7->_contact = (CNContact *)v18;

  id v20 = v7->_contact;
  if (v20)
  {
    id v34 = v6;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v21 = [(CNContact *)v20 postalAddresses];
    id v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v37;
      while (2)
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (!v7->_address) {
            objc_storeStrong((id *)&v7->_address, *(id *)(*((void *)&v36 + 1) + 8 * i));
          }
          uint64_t v27 = [v26 identifier];
          unsigned int v28 = [v27 isEqualToString:v35];

          if (v28)
          {
            objc_storeStrong((id *)&v7->_address, v26);

            goto LABEL_22;
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

LABEL_22:
    uint64_t v29 = [(CNLabeledValue *)v7->_address identifier];
    addressIdentifier = v7->_addressIdentifier;
    v7->_addressIdentifier = (NSString *)v29;

    uint64_t v31 = [(CNContact *)v7->_contact identifier];
    contactIdentifier = v7->_contactIdentifier;
    v7->_contactIdentifier = (NSString *)v31;

    id v6 = v34;
  }
LABEL_23:

  return v7;
}

- (MKMapItem)geocodedMapItem
{
  geocodedMapItem = self->_geocodedMapItem;
  if (!geocodedMapItem)
  {
    objc_super v4 = +[AddressBookManager sharedManager];
    uint64_t v5 = [v4 mapItemFormShortcutForCNIdentifier:self->_contactIdentifier];
    id v6 = self->_geocodedMapItem;
    self->_geocodedMapItem = v5;

    id v7 = sub_1000A31A8();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      geocodedMapItem = self->_geocodedMapItem;
      goto LABEL_10;
    }
    unsigned __int8 v8 = self;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(AddressBookAddress *)v8 performSelector:"accessibilityIdentifier"];
      v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    contactIdentifier = self->_contactIdentifier;
    double v15 = self->_geocodedMapItem;
    *(_DWORD *)buf = 138543875;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    id v20 = contactIdentifier;
    __int16 v21 = 2113;
    id v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] resolved map item shortcut for identifier %{public}@: %{private}@", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

  return geocodedMapItem;
}

- (void)storeUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1000A31A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = self;
    if (!v6)
    {
      v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    unsigned __int8 v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      v9 = [(AddressBookAddress *)v6 performSelector:"accessibilityIdentifier"];
      v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    v12 = [v4 name];
    *(_DWORD *)buf = 138543618;
    __int16 v43 = v11;
    __int16 v44 = 2114;
    uint64_t v45 = (uint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] store updated from %{public}@...", buf, 0x16u);
  }
  objc_initWeak(&location, self);
  if (!+[NSThread isMainThread])
  {
    uint64_t v27 = sub_1000A31A8();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
LABEL_30:

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100553820;
      block[3] = &unk_1012E6690;
      objc_copyWeak(&v40, &location);
      id v39 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v40);
      goto LABEL_31;
    }
    unsigned int v28 = self;
    if (!v28)
    {
      long long v33 = @"<nil>";
      goto LABEL_29;
    }
    uint64_t v29 = (objc_class *)objc_opt_class();
    long long v30 = NSStringFromClass(v29);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v31 = [(AddressBookAddress *)v28 performSelector:"accessibilityIdentifier"];
      long long v32 = v31;
      if (v31 && ([v31 isEqualToString:v30] & 1) == 0)
      {
        long long v33 = +[NSString stringWithFormat:@"%@<%p, %@>", v30, v28, v32];

        goto LABEL_27;
      }
    }
    long long v33 = +[NSString stringWithFormat:@"%@<%p>", v30, v28];
LABEL_27:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    __int16 v43 = v33;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}@] ... dispatching to main queue to process notification", buf, 0xCu);

    goto LABEL_30;
  }
  [(AddressBookAddress *)self _cancelDeferredAddressResolutionTimerIfNeeded];
  v13 = self->_contactIdentifier;
  v14 = self->_addressIdentifier;
  double v15 = sub_1000A31A8();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    double v16 = self;
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      __int16 v19 = [(AddressBookAddress *)v16 performSelector:"accessibilityIdentifier"];
      id v20 = v19;
      if (v19 && ([v19 isEqualToString:v18] & 1) == 0)
      {
        __int16 v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_18;
      }
    }
    __int16 v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_18:

    *(_DWORD *)buf = 138543618;
    __int16 v43 = v21;
    __int16 v44 = 2048;
    uint64_t v45 = 0x3FF199999999999ALL;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] scheduling deferred address resolution in %#.1lfs", buf, 0x16u);
  }
  id v22 = [(AddressBookAddress *)self _addressResolutionQueue];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100553874;
  v34[3] = &unk_1012EE998;
  objc_copyWeak(&v37, &location);
  id v23 = v13;
  id v35 = v23;
  uint64_t v24 = v14;
  long long v36 = v24;
  uint64_t v25 = +[GCDTimer scheduledTimerWithTimeInterval:v22 queue:0 repeating:v34 block:1.1];
  deferredAddressResolutionTimer = self->_deferredAddressResolutionTimer;
  self->_deferredAddressResolutionTimer = v25;

  objc_destroyWeak(&v37);
LABEL_31:
  objc_destroyWeak(&location);
}

- (void)_cancelDeferredAddressResolutionTimerIfNeeded
{
  if (self->_deferredAddressResolutionTimer)
  {
    id v3 = sub_10008A498();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      [(GCDTimer *)self->_deferredAddressResolutionTimer invalidate];
      deferredAddressResolutionTimer = self->_deferredAddressResolutionTimer;
      self->_deferredAddressResolutionTimer = 0;

      return;
    }
    id v4 = self;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(AddressBookAddress *)v4 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

    v10 = [(GCDTimer *)self->_deferredAddressResolutionTimer fireDate];
    [v10 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] cancelling previous deferred address resolution timer (had %#.1lfs to go)", buf, 0x16u);

    goto LABEL_9;
  }
}

- (id)_addressResolutionQueue
{
  addressResolutionQueue = self->_addressResolutionQueue;
  if (!addressResolutionQueue)
  {
    id v4 = sub_1000A31A8();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.AddressBook.AddressResolution", v11);
      v13 = self->_addressResolutionQueue;
      self->_addressResolutionQueue = v12;

      addressResolutionQueue = self->_addressResolutionQueue;
      goto LABEL_10;
    }
    uint64_t v5 = self;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v8 = [(AddressBookAddress *)v5 performSelector:"accessibilityIdentifier"];
      v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] initialising address resolution queue", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:

  return addressResolutionQueue;
}

- (void)_resolveContactIdentifier:(id)a3 addressIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id, void *))a5;
  uint64_t v11 = sub_1000A31A8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = self;
    if (!v12)
    {
      uint64_t v17 = @"<nil>";
      goto LABEL_10;
    }
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    if (objc_opt_respondsToSelector())
    {
      __int16 v15 = [(AddressBookAddress *)v12 performSelector:"accessibilityIdentifier"];
      uint64_t v16 = v15;
      if (v15 && ![v15 isEqualToString:v14])
      {
        uint64_t v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

        goto LABEL_8;
      }
    }
    uint64_t v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    v41 = v17;
    __int16 v42 = 2114;
    id v43 = v8;
    __int16 v44 = 2114;
    id v45 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] will resolve contact ID %{public}@, address ID %{public}@", buf, 0x20u);
  }
  uint64_t v18 = +[AddressBookManager sharedManager];
  __int16 v19 = [v18 contactForCNContactIdentifier:v8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v20 = [v19 postalAddresses];
  id v21 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v31 = v19;
    long long v32 = v18;
    long long v33 = v10;
    id v34 = v8;
    id v23 = 0;
    uint64_t v24 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (![v9 length])
        {
          id v27 = v26;

          if ([(PersistentAddressBookAddress *)self addressID] == -1)
          {
            long long v30 = 0;
            goto LABEL_26;
          }
          id v23 = v27;
        }
        unsigned int v28 = [v26 identifier];
        unsigned int v29 = [v28 isEqualToString:v9];

        if (v29)
        {
          id v27 = v26;

          uint64_t v18 = v32;
          long long v30 = [v32 mapItemFormShortcutForCNIdentifier:v9];
          v10 = v33;
          id v8 = v34;
          goto LABEL_27;
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v22) {
        continue;
      }
      break;
    }
    long long v30 = 0;
    id v27 = v23;
LABEL_26:
    v10 = v33;
    id v8 = v34;
    uint64_t v18 = v32;
LABEL_27:
    __int16 v19 = v31;
  }
  else
  {
    long long v30 = 0;
    id v27 = 0;
  }

  v10[2](v10, v27, v30);
}

- (void)_handleResolvedAddress:(id)a3 geocodedMapItem:(id)a4
{
  id v6 = (CNLabeledValue *)a3;
  id v7 = (MKMapItem *)a4;
  id v8 = sub_1000A31A8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = self;
    if (!v9)
    {
      v14 = @"<nil>";
      goto LABEL_10;
    }
    v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [(AddressBookAddress *)v9 performSelector:"accessibilityIdentifier"];
      v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_8;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543875;
    uint64_t v25 = v14;
    __int16 v26 = 2113;
    id v27 = v6;
    __int16 v28 = 2113;
    unsigned int v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] storing resolved address and map item (address: %{private}@, mapItem: %{private}@", buf, 0x20u);
  }
  address = self->_address;
  self->_address = v6;
  uint64_t v16 = v6;

  uint64_t v17 = [(CNLabeledValue *)v16 identifier];
  addressIdentifier = self->_addressIdentifier;
  self->_addressIdentifier = v17;

  geocodedMapItem = self->_geocodedMapItem;
  self->_geocodedMapItem = v7;
  id v20 = v7;

  generatedMapItemCache = self->_generatedMapItemCache;
  self->_generatedMapItemCache = 0;

  id v22 = [(CNContact *)self->_contact identifier];
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v22;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contactIdentifier hash];
  return [(NSString *)self->_contactIdentifier hash] ^ v3;
}

- (NSString)localizedLabel
{
  v2 = [(CNLabeledValue *)self->_address label];
  NSUInteger v3 = +[CNLabeledValue localizedStringForLabel:v2];

  return (NSString *)v3;
}

- (MKMapItem)generatedMapItem
{
  geocodedMapItem = self->_geocodedMapItem;
  if (!geocodedMapItem)
  {
    geocodedMapItem = self->_generatedMapItemCache;
    if (!geocodedMapItem)
    {
      id v4 = sub_1000A31A8();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        uint64_t v11 = [(CNLabeledValue *)self->_address value];
        v12 = [v11 dictionaryRepresentation];

        LODWORD(v19) = 0;
        id v13 = [objc_alloc((Class)GEOMapItemAssistant) initWithWithLocation:0 addressDictionary:v12 name:0 businessURL:0 phoneNumber:0 sessionID:0 muid:0.0 attributionID:0 sampleSizeForUserRatingScore:0 normalizedUserRatingScore:v19];
        v14 = [(AddressBookAddress *)self contact];
        __int16 v15 = +[MKMapItem _itemWithContact:v14 geoMapItem:v13];
        generatedMapItemCache = self->_generatedMapItemCache;
        self->_generatedMapItemCache = v15;

        geocodedMapItem = self->_generatedMapItemCache;
        goto LABEL_11;
      }
      uint64_t v5 = self;
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      if (objc_opt_respondsToSelector())
      {
        id v8 = [(AddressBookAddress *)v5 performSelector:"accessibilityIdentifier"];
        id v9 = v8;
        if (v8 && ![v8 isEqualToString:v7])
        {
          v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

          goto LABEL_9;
        }
      }
      v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_9:

      *(_DWORD *)buf = 138543362;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] generating map item cache", buf, 0xCu);

      goto LABEL_10;
    }
  }
LABEL_11:
  uint64_t v17 = geocodedMapItem;

  return v17;
}

- (NSString)shortAddress
{
  v2 = [(AddressBookAddress *)self generatedMapItem];
  NSUInteger v3 = [v2 _addressFormattedAsShortenedAddress];

  return (NSString *)v3;
}

- (NSString)singleLineAddress
{
  v2 = [(AddressBookAddress *)self generatedMapItem];
  NSUInteger v3 = [v2 _addressFormattedAsSinglelineAddress];

  return (NSString *)v3;
}

- (NSString)compositeName
{
  if ([(AddressBookAddress *)self isValid])
  {
    NSUInteger v3 = [(AddressBookAddress *)self contact];
    id v4 = +[CNContactFormatter stringFromContact:v3 style:0];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)waypointCompositeName
{
  if (![(AddressBookAddress *)self isValid])
  {
    id v10 = 0;
    goto LABEL_19;
  }
  NSUInteger v3 = [(AddressBookAddress *)self compositeName];
  id v4 = [(AddressBookAddress *)self localizedLabel];
  uint64_t v5 = [v4 localizedCapitalizedString];

  if (v3 && v5)
  {
    unsigned int v6 = [(AddressBookAddress *)self addressType];
    switch(v6)
    {
      case 3u:
        id v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"Contact_Address_Book_School_Location_Waypoint_Name";
        break;
      case 2u:
        id v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"Contact_Address_Book_Work_Location_Waypoint_Name";
        break;
      case 1u:
        id v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"Contact_Address_Book_Home_Location_Waypoint_Name";
        break;
      default:
        unsigned int v12 = [(CNLabeledValue *)self->_address iOSLegacyIdentifier];
        int v13 = CNContactIOSLegacyIdentifierInvalid;
        v14 = +[NSBundle mainBundle];
        id v8 = v14;
        if (v12 == v13) {
          CFStringRef v15 = @"Contact_Address_Book_Find_My_Cached_Location_Waypoint_Name";
        }
        else {
          CFStringRef v15 = @"Contact_Address_Book_Other_Location_Waypoint_Name";
        }
        uint64_t v11 = [v14 localizedStringForKey:v15 value:@"localized string not found" table:0];
        uint64_t v17 = v5;
        goto LABEL_17;
    }
    uint64_t v11 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];
LABEL_17:
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v3, v17);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  id v10 = v3;
LABEL_18:

LABEL_19:

  return (NSString *)v10;
}

- (NSString)phoneticName
{
  if (![(AddressBookAddress *)self isValid])
  {
    id v4 = 0;
    goto LABEL_14;
  }
  NSUInteger v3 = [(AddressBookAddress *)self contact];
  id v4 = +[CNContactFormatter stringFromContact:v3 style:1];

  uint64_t v5 = sub_1000A31A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = self;
    if (!v6)
    {
      uint64_t v11 = @"<nil>";
      goto LABEL_12;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      CFStringRef v9 = [(AddressBookAddress *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        uint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_9;
      }
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543619;
    v14 = v11;
    __int16 v15 = 2113;
    uint64_t v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] generated phonetic name %{private}@", buf, 0x16u);
  }
LABEL_14:

  return (NSString *)v4;
}

- (NSString)spokenNameForNavigation
{
  if (![(AddressBookAddress *)self isValid])
  {
    id v4 = 0;
    goto LABEL_14;
  }
  NSUInteger v3 = [(AddressBookAddress *)self contact];
  id v4 = [v3 _maps_spokenNameForNavigation];

  uint64_t v5 = sub_1000A31A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = self;
    if (!v6)
    {
      uint64_t v11 = @"<nil>";
      goto LABEL_12;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      CFStringRef v9 = [(AddressBookAddress *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        uint64_t v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_9;
      }
    }
    uint64_t v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138543619;
    v14 = v11;
    __int16 v15 = 2113;
    uint64_t v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] generated spoken name for navigation: %{private}@", buf, 0x16u);
  }
LABEL_14:

  return (NSString *)v4;
}

- (int)addressType
{
  NSUInteger v3 = [(AddressBookAddress *)self contact];
  id v4 = [v3 contactType];

  if (v4) {
    return 0;
  }
  unsigned int v6 = [(CNLabeledValue *)self->_address label];
  uint64_t v7 = [v6 isEqualToString:CNLabelHome];

  if (v7) {
    return 1;
  }
  id v8 = [(CNLabeledValue *)self->_address label];
  unsigned __int8 v9 = [v8 isEqualToString:CNLabelWork];

  if (v9) {
    return 2;
  }
  id v10 = [(CNLabeledValue *)self->_address label];
  unsigned __int8 v11 = [v10 isEqualToString:CNLabelSchool];

  if ((v11 & 1) == 0) {
    return 0;
  }
  return 3;
}

- (BOOL)isMeCard
{
  NSUInteger v3 = +[AddressBookManager sharedManager];
  id v4 = [v3 meCard];
  uint64_t v5 = [v4 identifier];
  LOBYTE(self) = [v5 isEqualToString:self->_contactIdentifier];

  return (char)self;
}

- (BOOL)isHomeWorkSchoolAddress
{
  unsigned int v3 = [(AddressBookAddress *)self isMeCard];
  if (v3)
  {
    unsigned int v3 = [(AddressBookAddress *)self addressType];
    if (v3 != 1) {
      LOBYTE(v3) = [(AddressBookAddress *)self addressType] == 2
    }
                || [(AddressBookAddress *)self addressType] == 3;
  }
  return v3;
}

- (NSDictionary)addressDictionary
{
  v2 = [(CNLabeledValue *)self->_address value];
  unsigned int v3 = [v2 dictionaryRepresentation];
  id v4 = [v3 copy];

  return (NSDictionary *)v4;
}

- (BOOL)isValid
{
  return [(NSString *)self->_contactIdentifier length] != 0;
}

- (BOOL)hasStreetAddress
{
  v2 = [(CNLabeledValue *)self->_address value];
  unsigned int v3 = [v2 street];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)compositeNameMatchesForSearchString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AddressBookAddress *)self compositeName];
  unsigned int v6 = [v5 _maps_prefixMatchesForSearchString:v4];

  return v6;
}

- (void)_updateMapItemClientAttributes
{
  unsigned int v3 = [(MKMapItem *)self->_geocodedMapItem _geoMapItem];
  if (!v3) {
    goto LABEL_16;
  }
  id v4 = sub_1000A31A8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = self;
    unsigned int v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(AddressBookAddress *)v5 performSelector:"accessibilityIdentifier"];
      unsigned __int8 v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

        goto LABEL_8;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] updating map item client attributes", buf, 0xCu);
  }
  unsigned __int8 v11 = [v3 _clientAttributes];
  unsigned int v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = objc_alloc_init((Class)GEOMapItemClientAttributes);
  }
  v14 = v13;

  uint64_t v15 = [(AddressBookAddress *)self addressType];
  uint64_t v16 = [(AddressBookAddress *)self contact];
  if (v16)
  {
    uint64_t v17 = +[CNContactFormatter stringFromContact:v16 style:0];
  }
  else
  {
    uint64_t v17 = 0;
  }
  BOOL v18 = [(AddressBookAddress *)self isMeCard];
  id v19 = objc_alloc_init((Class)GEOMapItemAddressBookAttributes);
  [v19 setAddressType:v15];
  [v19 setIsMe:v18];
  [v19 setName:v17];
  id v20 = [(CNLabeledValue *)self->_address identifier];
  [v19 setAddressIdentifier:v20];

  [v14 setAddressBookAttributes:v19];
  id v21 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v3 clientAttributes:v14];
  id v22 = (MKMapItem *)[objc_alloc((Class)MKMapItem) initWithGeoMapItem:v21 isPlaceHolderPlace:0];
  geocodedMapItem = self->_geocodedMapItem;
  self->_geocodedMapItem = v22;

LABEL_16:
}

- (id)thumbnailIconWithScale:(double)a3 size:(unint64_t)a4
{
  unsigned int v7 = [(AddressBookAddress *)self addressType];
  switch(v7)
  {
    case 3u:
      uint64_t v8 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
      break;
    case 2u:
      uint64_t v8 = +[GEOFeatureStyleAttributes workStyleAttributes];
      break;
    case 1u:
      uint64_t v8 = +[GEOFeatureStyleAttributes homeStyleAttributes];
      break;
    default:
      goto LABEL_16;
  }
  unsigned __int8 v9 = (void *)v8;
  if (!v8)
  {
LABEL_16:
    uint64_t v17 = sub_1000A31A8();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
LABEL_26:

      unsigned __int8 v9 = [(AddressBookAddress *)self geocodedMapItem];
      uint64_t v25 = +[MKMapItem _maps_markerImageForMapItem:v9 scale:a4 size:0 useMarkerFallback:a3];
      goto LABEL_30;
    }
    BOOL v18 = self;
    if (!v18)
    {
      id v23 = @"<nil>";
      goto LABEL_25;
    }
    id v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    if (objc_opt_respondsToSelector())
    {
      id v21 = [(AddressBookAddress *)v18 performSelector:"accessibilityIdentifier"];
      id v22 = v21;
      if (v21 && ![v21 isEqualToString:v20])
      {
        id v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

        goto LABEL_23;
      }
    }
    id v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_23:

LABEL_25:
    float v24 = a3;
    *(_DWORD *)buf = 138543874;
    long long v30 = v23;
    __int16 v31 = 2048;
    double v32 = v24;
    __int16 v33 = 2048;
    unint64_t v34 = a4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] generating marker thumbnail for scale %#.1lf, size %lu", buf, 0x20u);

    goto LABEL_26;
  }
  id v10 = sub_1000A31A8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v11 = self;
    if (!v11)
    {
      uint64_t v16 = @"<nil>";
      goto LABEL_28;
    }
    unsigned int v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      v14 = [(AddressBookAddress *)v11 performSelector:"accessibilityIdentifier"];
      uint64_t v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        uint64_t v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_15;
      }
    }
    uint64_t v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_15:

LABEL_28:
    float v26 = a3;
    *(_DWORD *)buf = 138543874;
    long long v30 = v16;
    __int16 v31 = 2048;
    double v32 = v26;
    __int16 v33 = 2048;
    unint64_t v34 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] generating thumbnail for scale %#.1lf, size %lu", buf, 0x20u);
  }
  uint64_t v25 = +[MKIconManager imageForStyle:v9 size:a4 forScale:0 format:a3];
LABEL_30:
  id v27 = (void *)v25;

  return v27;
}

+ (id)_geocodedMapItemsByAddress
{
  if (qword_10160F080 != -1) {
    dispatch_once(&qword_10160F080, &stru_1012EE9B8);
  }
  v2 = (void *)qword_10160F078;

  return v2;
}

+ (id)_completionsByAddress
{
  if (qword_10160F090 != -1) {
    dispatch_once(&qword_10160F090, &stru_1012EE9D8);
  }
  v2 = (void *)qword_10160F088;

  return v2;
}

+ (id)_completionQueue
{
  if (qword_10160F0A0 != -1) {
    dispatch_once(&qword_10160F0A0, &stru_1012EE9F8);
  }
  v2 = (void *)qword_10160F098;

  return v2;
}

+ (void)didReceiveMemoryWarning
{
  id v2 = [a1 _geocodedMapItemsByAddress];
  [v2 removeAllObjects];
}

- (void)forwardGeocodeAddress:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (!self->_geocodedMapItem)
  {
    v14 = [(id)objc_opt_class() _completionQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100555DCC;
    v15[3] = &unk_1012E9730;
    unsigned int v12 = &v17;
    objc_copyWeak(&v17, &location);
    v15[4] = self;
    id v16 = v4;
    dispatch_async(v14, v15);

    id v13 = &v16;
    goto LABEL_12;
  }
  uint64_t v5 = sub_1000A31A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = self;
    unsigned int v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      unsigned __int8 v9 = [(AddressBookAddress *)v6 performSelector:"accessibilityIdentifier"];
      id v10 = v9;
      if (v9 && ([v9 isEqualToString:v8] & 1) == 0)
      {
        unsigned __int8 v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    unsigned __int8 v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] will not forward geocode address, already have geocoded map item, returning that", buf, 0xCu);
  }
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100555D34;
    block[3] = &unk_1012E9950;
    unsigned int v12 = &v20;
    objc_copyWeak(&v20, &location);
    id v13 = &v19;
    id v19 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_12:

    objc_destroyWeak(v12);
  }
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)addressResolutionQueue
{
  return self->_addressResolutionQueue;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (CNContact)contact
{
  return (CNContact *)objc_getProperty(self, a2, 88, 1);
}

- (void)setContact:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)addressIdentifier
{
  return self->_addressIdentifier;
}

- (void)setAddressValue:(id)a3
{
}

- (void)setGeocodedMapItem:(id)a3
{
}

- (NSError)geocodingError
{
  return self->_geocodingError;
}

- (MapsLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
}

- (MKMapItem)generatedMapItemCache
{
  return self->_generatedMapItemCache;
}

- (void)setGeneratedMapItemCache:(id)a3
{
}

- (id)_carMeCardTitle
{
  id v2 = [(AddressBookAddress *)self addressValue];
  unsigned int v3 = [v2 label];

  if ([v3 isEqualToString:CNLabelHome])
  {
    id v4 = +[NSBundle mainBundle];
    uint64_t v5 = v4;
    CFStringRef v6 = @"CarPlay Me Card Home";
LABEL_9:
    id v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

    goto LABEL_10;
  }
  if ([v3 isEqualToString:CNLabelWork])
  {
    id v4 = +[NSBundle mainBundle];
    uint64_t v5 = v4;
    CFStringRef v6 = @"CarPlay Me Card Work";
    goto LABEL_9;
  }
  if ([v3 isEqualToString:CNLabelSchool])
  {
    id v4 = +[NSBundle mainBundle];
    uint64_t v5 = v4;
    CFStringRef v6 = @"CarPlay Me Card School";
    goto LABEL_9;
  }
  if ([v3 isEqualToString:CNLabelOther])
  {
    id v4 = +[NSBundle mainBundle];
    uint64_t v5 = v4;
    CFStringRef v6 = @"CarPlay Me Card Other";
    goto LABEL_9;
  }
  id v7 = v3;
LABEL_10:

  return v7;
}

- (void)updateModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AddressBookAddress *)self geocodedMapItem];
  [v4 setMapItem:v5];

  if ([(AddressBookAddress *)self isMeCard])
  {
    CFStringRef v6 = [(AddressBookAddress *)self _carMeCardTitle];
    CFStringRef v7 = @"me";
  }
  else
  {
    uint64_t v8 = [(AddressBookAddress *)self compositeName];
    id v9 = [v8 length];

    if (v9)
    {
      CFStringRef v6 = [(AddressBookAddress *)self compositeName];
      CFStringRef v7 = @"composite";
    }
    else
    {
      CFStringRef v6 = [(AddressBookAddress *)self shortAddress];
      CFStringRef v7 = @"address";
    }
  }
  [v4 setFirstLine:v6];

  id v10 = [(AddressBookAddress *)self singleLineAddress];
  [v4 setSecondLine:v10];

  unsigned __int8 v11 = +[NSString stringWithFormat:@"[Contacts %@]", v7];
  [v4 setDebugSubtitle:v11];

  unsigned int v12 = [v4 mapItem];

  if (!v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1005E17BC;
    v13[3] = &unk_1012E8738;
    id v14 = v4;
    [(AddressBookAddress *)self forwardGeocodeAddress:v13];
  }
}

- (id)entryWithTicket:(id)a3
{
  if ([(AddressBookAddress *)self isValid])
  {
    id v4 = [objc_alloc((Class)GEORPSuggestionEntry) initWithType:2];
    uint64_t v5 = [(AddressBookAddress *)self compositeName];
    [v4 safeAddDisplayLine:v5];

    CFStringRef v6 = [(AddressBookAddress *)self singleLineAddress];
    [v4 safeAddDisplayLine:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end