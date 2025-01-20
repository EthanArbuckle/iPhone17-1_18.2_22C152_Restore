@interface ICLocation
+ (id)searchStringsForPlacemark:(id)a3;
- (BOOL)updatingPlace;
- (CLPlacemark)placemark;
- (NSString)formattedAddress;
- (id)searchStrings;
- (void)didTurnIntoFault;
- (void)setLocationFromPlacemark:(id)a3;
- (void)setLocationFromURL:(id)a3;
- (void)setPlacemark:(id)a3;
- (void)setUpdatingPlace:(BOOL)a3;
@end

@implementation ICLocation

- (void)setPlacemark:(id)a3
{
  id v7 = a3;
  if ((-[CLPlacemark isEqual:](self->_placemark, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placemark, a3);
    if (v7)
    {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
      [v5 encodeObject:v7 forKey:@"placemark"];
      v6 = [v5 encodedData];
      [(ICLocation *)self setPlacemarkData:v6];
    }
    else
    {
      [(ICLocation *)self setPlacemarkData:0];
    }
  }
}

- (CLPlacemark)placemark
{
  placemark = self->_placemark;
  if (!placemark)
  {
    v4 = [(ICLocation *)self placemarkData];
    if (v4)
    {
      id v11 = 0;
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:&v11];
      id v6 = v11;
      if (v6)
      {
        id v7 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[ICAttachment(ICAttachmentPersistenceAdditions) loadFromArchive:dataPersister:withIdentifierMap:]((uint64_t)v6, v7);
        }
      }
      v8 = [v5 decodeObjectForKey:@"placemark"];
      v9 = self->_placemark;
      self->_placemark = v8;
    }
    placemark = self->_placemark;
  }
  return placemark;
}

+ (id)searchStringsForPlacemark:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    v5 = [v3 name];

    if (v5)
    {
      id v6 = [v3 name];
      [v4 addObject:v6];
    }
    id v7 = [v3 thoroughfare];

    if (v7)
    {
      v8 = [v3 thoroughfare];
      [v4 addObject:v8];
    }
    v9 = [v3 subThoroughfare];

    if (v9)
    {
      v10 = [v3 subThoroughfare];
      [v4 addObject:v10];
    }
    id v11 = [v3 locality];

    if (v11)
    {
      v12 = [v3 locality];
      [v4 addObject:v12];
    }
    v13 = [v3 subLocality];

    if (v13)
    {
      v14 = [v3 subLocality];
      [v4 addObject:v14];
    }
    v15 = [v3 administrativeArea];

    if (v15)
    {
      v16 = [v3 administrativeArea];
      [v4 addObject:v16];
    }
    v17 = [v3 subAdministrativeArea];

    if (v17)
    {
      v18 = [v3 subAdministrativeArea];
      [v4 addObject:v18];
    }
    v19 = [v3 postalCode];

    if (v19)
    {
      v20 = [v3 postalCode];
      [v4 addObject:v20];
    }
    v21 = [v3 ISOcountryCode];

    if (v21)
    {
      v22 = [v3 ISOcountryCode];
      [v4 addObject:v22];
    }
    v23 = [v3 country];

    if (v23)
    {
      v24 = [v3 country];
      [v4 addObject:v24];
    }
    v25 = [v3 inlandWater];

    if (v25)
    {
      v26 = [v3 inlandWater];
      [v4 addObject:v26];
    }
    v27 = [v3 ocean];

    if (v27)
    {
      v28 = [v3 ocean];
      [v4 addObject:v28];
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v29 = objc_msgSend(v3, "areasOfInterest", 0);
    uint64_t v30 = [v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          [v4 addObject:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v31);
    }
  }
  v34 = (void *)[v4 copy];

  return v34;
}

- (id)searchStrings
{
  id v3 = objc_opt_class();
  id v4 = [(ICLocation *)self placemark];
  v5 = [v3 searchStringsForPlacemark:v4];

  return v5;
}

- (NSString)formattedAddress
{
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2050000000;
  id v3 = (void *)getCNMutablePostalAddressClass_softClass;
  uint64_t v34 = getCNMutablePostalAddressClass_softClass;
  if (!getCNMutablePostalAddressClass_softClass)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __getCNMutablePostalAddressClass_block_invoke;
    v29 = &unk_1E64A45A0;
    uint64_t v30 = &v31;
    __getCNMutablePostalAddressClass_block_invoke((uint64_t)&v26);
    id v3 = (void *)v32[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v31, 8);
  id v5 = objc_alloc_init(v4);
  id v6 = [(ICLocation *)self placemark];
  id v7 = [v6 thoroughfare];
  [v5 setStreet:v7];

  v8 = [(ICLocation *)self placemark];
  v9 = [v8 subLocality];
  [v5 setSubLocality:v9];

  v10 = [(ICLocation *)self placemark];
  id v11 = [v10 locality];
  [v5 setCity:v11];

  v12 = [(ICLocation *)self placemark];
  v13 = [v12 subAdministrativeArea];
  [v5 setSubAdministrativeArea:v13];

  v14 = [(ICLocation *)self placemark];
  v15 = [v14 administrativeArea];
  [v5 setState:v15];

  v16 = [(ICLocation *)self placemark];
  v17 = [v16 postalCode];
  [v5 setPostalCode:v17];

  v18 = [(ICLocation *)self placemark];
  v19 = [v18 country];
  [v5 setCountry:v19];

  v20 = [(ICLocation *)self placemark];
  v21 = [v20 ISOcountryCode];
  [v5 setISOCountryCode:v21];

  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v22 = (void *)getCNPostalAddressFormatterClass_softClass;
  uint64_t v34 = getCNPostalAddressFormatterClass_softClass;
  if (!getCNPostalAddressFormatterClass_softClass)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __getCNPostalAddressFormatterClass_block_invoke;
    v29 = &unk_1E64A45A0;
    uint64_t v30 = &v31;
    __getCNPostalAddressFormatterClass_block_invoke((uint64_t)&v26);
    v22 = (void *)v32[3];
  }
  id v23 = v22;
  _Block_object_dispose(&v31, 8);
  v24 = [v23 stringFromPostalAddress:v5 style:0];

  return (NSString *)v24;
}

- (void)setLocationFromURL:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F64728] isValidMapURL:v4])
  {
    os_log_t v5 = (os_log_t)[objc_alloc(MEMORY[0x1E4F64728]) initWithURL:v4];
    double v6 = 0.0;
    double v7 = 0.0;
    if ([v5 parseIncludingCustomParameters:1])
    {
      if ([v5 exactPositionSpecified])
      {
        [v5 centerCoordinate];
      }
      else
      {
        v10 = [v5 directionsDestinationAddressString];
        if (v10)
        {
          id v11 = v10;
          v12 = objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", @"("), &stru_1F1F2FFF8;

          v13 = objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", @""), &stru_1F1F2FFF8);

          v14 = [v13 componentsSeparatedByString:@","];
          if ((unint64_t)[v14 count] < 2)
          {
            v17 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              [(ICLocation *)(uint64_t)v4 setLocationFromURL:v17];
            }
          }
          else
          {
            v15 = [v14 objectAtIndex:0];
            [v15 doubleValue];
            double v7 = v16;

            v17 = [v14 objectAtIndex:1];
            [v17 doubleValue];
            double v6 = v18;
          }

          goto LABEL_15;
        }
        [v5 searchCoordinate];
      }
      double v7 = v8;
      double v6 = v9;
    }
LABEL_15:
    [(ICLocation *)self setLatitude:v7];
    [(ICLocation *)self setLongitude:v6];
    goto LABEL_16;
  }
  os_log_t v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ICLocation setLocationFromURL:]((uint64_t)v4, v5);
  }
LABEL_16:
}

- (void)setLocationFromPlacemark:(id)a3
{
  id v4 = a3;
  [(ICLocation *)self setPlacemark:v4];
  os_log_t v5 = [v4 location];
  [v5 coordinate];
  -[ICLocation setLatitude:](self, "setLatitude:");

  id v7 = [v4 location];

  [v7 coordinate];
  [(ICLocation *)self setLongitude:v6];
}

- (void)didTurnIntoFault
{
  v4.receiver = self;
  v4.super_class = (Class)ICLocation;
  [(ICLocation *)&v4 didTurnIntoFault];
  placemark = self->_placemark;
  self->_placemark = 0;
}

- (BOOL)updatingPlace
{
  return self->updatingPlace;
}

- (void)setUpdatingPlace:(BOOL)a3
{
  self->updatingPlace = a3;
}

- (void).cxx_destruct
{
}

- (void)setLocationFromURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Not enough coordinates to get directions from url %@ with coordinates: %@", (uint8_t *)&v3, 0x16u);
}

- (void)setLocationFromURL:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Invalid map URL: %@", (uint8_t *)&v2, 0xCu);
}

@end