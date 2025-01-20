@interface RAPPlaceCorrectableAddress
+ (BOOL)_isStructuredAddressType:(int64_t)a3;
+ (id)emptyCorrectableAddress;
- (BOOL)isEdited;
- (NSArray)orderedCorrectableItems;
- (NSString)addressFormattingLocaleIdentifier;
- (NSString)localizedTitle;
- (RAPPlaceCorrectableString)buildingNumber;
- (RAPPlaceCorrectableString)city;
- (RAPPlaceCorrectableString)country;
- (RAPPlaceCorrectableString)floorNumber;
- (RAPPlaceCorrectableString)freeformAddress;
- (RAPPlaceCorrectableString)state;
- (RAPPlaceCorrectableString)street;
- (RAPPlaceCorrectableString)subPremise;
- (RAPPlaceCorrectableString)unitNumber;
- (RAPPlaceCorrectableString)zipCode;
- (id)_createAndObserveStringOfKind:(int64_t)a3 originalValue:(id)a4;
- (id)_initWithMapItem:(id)a3;
- (id)_initWithStreet:(id)a3 subPremise:(id)a4 city:(id)a5 state:(id)a6 zipCode:(id)a7 country:(id)a8 addressFormattingLocaleIdentifier:(id)a9;
- (id)_structuredAddress;
- (int64_t)kind;
- (void)_invokeChangeHandlers;
- (void)_updateFreeformAddressWithStructuredChange;
- (void)addObserver:(id)a3 changeHandler:(id)a4;
- (void)removeObserver:(id)a3;
- (void)revertCorrections;
- (void)setAddressFormattingLocaleIdentifier:(id)a3;
- (void)updateFreeformAddressFromMapItem:(id)a3;
@end

@implementation RAPPlaceCorrectableAddress

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = +[NSMapTable weakToStrongObjectsMapTable];
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  id v10 = [v6 copy];
  [(NSMapTable *)observers setObject:v10 forKey:v11];
}

- (void)removeObserver:(id)a3
{
}

- (void)_invokeChangeHandlers
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(NSMapTable *)self->_observers keyEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9 = [(NSMapTable *)self->_observers objectForKey:v8];
        ((void (**)(void, RAPPlaceCorrectableAddress *, uint64_t))v9)[2](v9, self, v8);
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

+ (id)emptyCorrectableAddress
{
  id v2 = [[RAPPlaceCorrectableAddress alloc] _initWithStreet:0 subPremise:0 city:0 state:0 zipCode:0 country:0 addressFormattingLocaleIdentifier:0];

  return v2;
}

- (id)_initWithMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPPlaceCorrectableAddress *)self _initWithStreet:0 subPremise:0 city:0 state:0 zipCode:0 country:0 addressFormattingLocaleIdentifier:0];
  if (v5)
  {
    uint64_t v6 = [v4 _geoMapItem];
    v7 = [v6 addressObject];
    uint64_t v8 = [v7 fullAddressWithMultiline:1];

    uint64_t v9 = [v5 _createAndObserveStringOfKind:16 originalValue:v8];
    long long v10 = (void *)v5[11];
    v5[11] = v9;
  }
  return v5;
}

- (id)_initWithStreet:(id)a3 subPremise:(id)a4 city:(id)a5 state:(id)a6 zipCode:(id)a7 country:(id)a8 addressFormattingLocaleIdentifier:(id)a9
{
  id v49 = a3;
  id v48 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v52.receiver = self;
  v52.super_class = (Class)RAPPlaceCorrectableAddress;
  v20 = [(RAPPlaceCorrectableAddress *)&v52 init];
  v21 = v20;
  if (v20)
  {
    v20->_kind = 1;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100447728;
    v50[3] = &unk_1012EA708;
    v22 = v20;
    v51 = v22;
    v23 = objc_retainBlock(v50);
    uint64_t v24 = ((void (*)(void *, uint64_t, id))v23[2])(v23, 8, v49);
    street = v22->_street;
    v22->_street = (RAPPlaceCorrectableString *)v24;

    uint64_t v26 = ((void (*)(void *, uint64_t, id))v23[2])(v23, 9, v48);
    subPremise = v22->_subPremise;
    v22->_subPremise = (RAPPlaceCorrectableString *)v26;

    uint64_t v28 = ((void (*)(void *, uint64_t, id))v23[2])(v23, 11, v15);
    city = v22->_city;
    v22->_city = (RAPPlaceCorrectableString *)v28;

    uint64_t v30 = ((void (*)(void *, uint64_t, id))v23[2])(v23, 12, v16);
    state = v22->_state;
    v22->_state = (RAPPlaceCorrectableString *)v30;

    uint64_t v32 = ((void (*)(void *, uint64_t, id))v23[2])(v23, 13, v17);
    zipCode = v22->_zipCode;
    v22->_zipCode = (RAPPlaceCorrectableString *)v32;

    uint64_t v34 = ((void (*)(void *, uint64_t, id))v23[2])(v23, 14, v18);
    country = v22->_country;
    v22->_country = (RAPPlaceCorrectableString *)v34;

    v36 = [(RAPPlaceCorrectableAddress *)v22 _structuredAddress];
    uint64_t v37 = ((void (*)(void *, uint64_t, void *))v23[2])(v23, 16, v36);
    freeformAddress = v22->_freeformAddress;
    v22->_freeformAddress = (RAPPlaceCorrectableString *)v37;

    uint64_t v39 = ((void (*)(void *, uint64_t, const __CFString *))v23[2])(v23, 17, &stru_101324E70);
    buildingNumber = v22->_buildingNumber;
    v22->_buildingNumber = (RAPPlaceCorrectableString *)v39;

    uint64_t v41 = ((void (*)(void *, uint64_t, const __CFString *))v23[2])(v23, 19, &stru_101324E70);
    unitNumber = v22->_unitNumber;
    v22->_unitNumber = (RAPPlaceCorrectableString *)v41;

    uint64_t v43 = ((void (*)(void *, uint64_t, const __CFString *))v23[2])(v23, 18, &stru_101324E70);
    floorNumber = v22->_floorNumber;
    v22->_floorNumber = (RAPPlaceCorrectableString *)v43;

    v45 = (NSString *)[v19 copy];
    addressFormattingLocaleIdentifier = v22->_addressFormattingLocaleIdentifier;
    v22->_addressFormattingLocaleIdentifier = v45;
  }
  return v21;
}

+ (BOOL)_isStructuredAddressType:(int64_t)a3
{
  return (unint64_t)(a3 - 8) < 7;
}

- (NSArray)orderedCorrectableItems
{
  orderedCorrectableItems = self->_orderedCorrectableItems;
  if (!orderedCorrectableItems)
  {
    long long v8 = *(_OWORD *)&self->_street;
    city = self->_city;
    long long v10 = *(_OWORD *)&self->_state;
    country = self->_country;
    long long v12 = *(_OWORD *)&self->_freeformAddress;
    floorNumber = self->_floorNumber;
    unitNumber = self->_unitNumber;
    v14 = floorNumber;
    id v5 = +[NSArray arrayWithObjects:&v8 count:10];
    uint64_t v6 = self->_orderedCorrectableItems;
    self->_orderedCorrectableItems = v5;

    orderedCorrectableItems = self->_orderedCorrectableItems;
  }

  return orderedCorrectableItems;
}

- (void)_updateFreeformAddressWithStructuredChange
{
  id v3 = [(RAPPlaceCorrectableAddress *)self _structuredAddress];
  [(RAPPlaceCorrectableString *)self->_freeformAddress setValue:v3];
}

- (id)_structuredAddress
{
  id v3 = objc_alloc_init((Class)CNMutablePostalAddress);
  id v4 = [(RAPPlaceCorrectableString *)self->_street value];
  [v3 setStreet:v4];

  id v5 = [(RAPPlaceCorrectableString *)self->_subPremise value];
  [v3 setSubAdministrativeArea:v5];

  uint64_t v6 = [(RAPPlaceCorrectableString *)self->_city value];
  [v3 setCity:v6];

  v7 = [(RAPPlaceCorrectableString *)self->_state value];
  [v3 setState:v7];

  long long v8 = [(RAPPlaceCorrectableString *)self->_zipCode value];
  [v3 setPostalCode:v8];

  uint64_t v9 = [(RAPPlaceCorrectableString *)self->_country value];
  [v3 setCountry:v9];

  [v3 setISOCountryCode:self->_addressFormattingLocaleIdentifier];
  id v10 = objc_alloc_init((Class)CNPostalAddressFormatter);
  long long v11 = [v10 stringFromPostalAddress:v3];

  return v11;
}

- (id)_createAndObserveStringOfKind:(int64_t)a3 originalValue:(id)a4
{
  id v6 = a4;
  v7 = [[RAPPlaceCorrectableString alloc] initWithKind:a3 originalValue:v6];

  [(RAPPlaceCorrectableString *)v7 addObserver:self changeHandler:&stru_1012EA748];

  return v7;
}

- (NSString)localizedTitle
{
  id v2 = 0;
  switch([(RAPPlaceCorrectableAddress *)self kind])
  {
    case 0:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Name [Report a Problem label]";
      goto LABEL_20;
    case 1:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Address [Report a Problem label]";
      goto LABEL_20;
    case 2:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Phone [Report a Problem label]";
      goto LABEL_20;
    case 3:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Hours [Report a Problem label]";
      goto LABEL_20;
    case 4:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Website [Report a Problem label]";
      goto LABEL_20;
    case 5:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Category [Report a Problem label]";
      goto LABEL_20;
    case 6:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Closed Temporarily [Report an Issue]";
      goto LABEL_20;
    case 7:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Closed Permanently [Report an Issue]";
      goto LABEL_20;
    case 8:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Street [Report a Problem Address Type]";
      goto LABEL_20;
    case 9:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Subpremise [Report a Problem Address Type]";
      goto LABEL_20;
    case 0xALL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"SubLocality [Report a Problem Address Type]";
      goto LABEL_20;
    case 0xBLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"City [Report a Problem Address Type]";
      goto LABEL_20;
    case 0xCLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"State [Report a Problem Address Type]";
      goto LABEL_20;
    case 0xDLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"ZIP [Report a Problem Address Type]";
      goto LABEL_20;
    case 0xELL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Country [Report a Problem Address Type]";
      goto LABEL_20;
    case 0xFLL:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Accepts Apple Pay [Report a Problem label]";
      goto LABEL_20;
    case 0x14:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Located Inside [Report an Issue]";
      goto LABEL_20;
    case 0x15:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Inside this place [Report an Issue]";
LABEL_20:
      id v2 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      break;
    default:
      break;
  }

  return (NSString *)v2;
}

- (void)revertCorrections
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(RAPPlaceCorrectableAddress *)self orderedCorrectableItems];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) revertCorrections];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)isEdited
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(RAPPlaceCorrectableAddress *)self orderedCorrectableItems];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isEdited])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)setAddressFormattingLocaleIdentifier:(id)a3
{
  if (self->_addressFormattingLocaleIdentifier != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    addressFormattingLocaleIdentifier = self->_addressFormattingLocaleIdentifier;
    self->_addressFormattingLocaleIdentifier = v4;

    [(RAPPlaceCorrectableAddress *)self _invokeChangeHandlers];
  }
}

- (void)updateFreeformAddressFromMapItem:(id)a3
{
  id v5 = [a3 _fullAddressWithMultiline:1];
  uint64_t v4 = [(RAPPlaceCorrectableAddress *)self freeformAddress];
  [v4 setValue:v5];
}

- (int64_t)kind
{
  return self->_kind;
}

- (RAPPlaceCorrectableString)street
{
  return self->_street;
}

- (RAPPlaceCorrectableString)subPremise
{
  return self->_subPremise;
}

- (RAPPlaceCorrectableString)city
{
  return self->_city;
}

- (RAPPlaceCorrectableString)state
{
  return self->_state;
}

- (RAPPlaceCorrectableString)zipCode
{
  return self->_zipCode;
}

- (RAPPlaceCorrectableString)country
{
  return self->_country;
}

- (NSString)addressFormattingLocaleIdentifier
{
  return self->_addressFormattingLocaleIdentifier;
}

- (RAPPlaceCorrectableString)freeformAddress
{
  return self->_freeformAddress;
}

- (RAPPlaceCorrectableString)buildingNumber
{
  return self->_buildingNumber;
}

- (RAPPlaceCorrectableString)floorNumber
{
  return self->_floorNumber;
}

- (RAPPlaceCorrectableString)unitNumber
{
  return self->_unitNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitNumber, 0);
  objc_storeStrong((id *)&self->_floorNumber, 0);
  objc_storeStrong((id *)&self->_buildingNumber, 0);
  objc_storeStrong((id *)&self->_freeformAddress, 0);
  objc_storeStrong((id *)&self->_addressFormattingLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_orderedCorrectableItems, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_zipCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subPremise, 0);
  objc_storeStrong((id *)&self->_street, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end