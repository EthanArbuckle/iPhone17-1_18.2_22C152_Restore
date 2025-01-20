@interface RTContactPostalAddress
+ (id)labelTypeToString:(unint64_t)a3;
- (NSString)contactsIdentifier;
- (RTContactPostalAddress)init;
- (RTContactPostalAddress)initWithIdentifier:(id)a3 CNPostalAddress:(id)a4 lableType:(unint64_t)a5 creationDate:(id)a6 expirationDate:(id)a7;
- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 contactsIdentifier:(id)a9 labelType:(unint64_t)a10 iso3166CountryCode:(id)a11 iso3166SubdivisionCode:(id)a12;
- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 subThoroughfare:(id)a6 thoroughfare:(id)a7 subLocality:(id)a8 locality:(id)a9 subAdministrativeArea:(id)a10 administrativeArea:(id)a11 administrativeAreaCode:(id)a12 postalCode:(id)a13 country:(id)a14 countryCode:(id)a15 inlandWater:(id)a16 ocean:(id)a17 areasOfInterest:(id)a18 isIsland:(BOOL)a19 creationDate:(id)a20 expirationDate:(id)a21 contactsIdentifier:(id)a22 labelType:(unint64_t)a23 iso3166CountryCode:(id)a24 iso3166SubdivisionCode:(id)a25;
- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 subThoroughfare:(id)a6 thoroughfare:(id)a7 subLocality:(id)a8 locality:(id)a9 subAdministrativeArea:(id)a10 administrativeArea:(id)a11 administrativeAreaCode:(id)a12 postalCode:(id)a13 country:(id)a14 countryCode:(id)a15 inlandWater:(id)a16 ocean:(id)a17 areasOfInterest:(id)a18 isIsland:(BOOL)a19 creationDate:(id)a20 expirationDate:(id)a21 iso3166CountryCode:(id)a22 iso3166SubdivisionCode:(id)a23;
- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressObject:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 contactsIdentifier:(id)a9 labelType:(unint64_t)a10 iso3166CountryCode:(id)a11 iso3166SubdivisionCode:(id)a12;
- (RTContactPostalAddress)initWithIdentifier:(id)a3 lableType:(unint64_t)a4 geoDictionary:(id)a5 language:(id)a6 country:(id)a7 phoneticLocale:(id)a8;
- (id)description;
- (unint64_t)labelType;
@end

@implementation RTContactPostalAddress

+ (id)labelTypeToString:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E6B98B00[a3];
  }
}

- (RTContactPostalAddress)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_geoAddressData_subPremises_subThoroughfare_thoroughfare_subLocality_locality_subAdministrativeArea_administrativeArea_administrativeAreaCode_postalCode_country_countryCode_inlandWater_ocean_areasOfInterest_isIsland_creationDate_expirationDate_contactsIdentifier_labelType_iso3166CountryCode_iso3166SubdivisionCode_);
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 subThoroughfare:(id)a6 thoroughfare:(id)a7 subLocality:(id)a8 locality:(id)a9 subAdministrativeArea:(id)a10 administrativeArea:(id)a11 administrativeAreaCode:(id)a12 postalCode:(id)a13 country:(id)a14 countryCode:(id)a15 inlandWater:(id)a16 ocean:(id)a17 areasOfInterest:(id)a18 isIsland:(BOOL)a19 creationDate:(id)a20 expirationDate:(id)a21 iso3166CountryCode:(id)a22 iso3166SubdivisionCode:(id)a23
{
  v36 = (void *)MEMORY[0x1E4F29128];
  id v38 = a23;
  id v24 = a22;
  id v25 = a21;
  id v26 = a20;
  id v27 = a18;
  id v33 = a17;
  id v46 = a16;
  id v45 = a15;
  id v52 = a14;
  id v51 = a13;
  id v50 = a12;
  id v49 = a11;
  id v48 = a10;
  id v47 = a9;
  id v35 = a8;
  id v28 = a7;
  id v29 = a6;
  id v40 = a5;
  id v30 = a4;
  v42 = [v36 UUID];
  LOBYTE(v32) = a19;
  v44 = -[RTContactPostalAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:", v42, v30, v40, v29, v28, v35, v47, v48, v49, v50, v51, v52, v45, v46, v33,
          v27,
          v32,
          v26,
          v25,
          0,
          0,
          v24,
          v38);

  return v44;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 contactsIdentifier:(id)a9 labelType:(unint64_t)a10 iso3166CountryCode:(id)a11 iso3166SubdivisionCode:(id)a12
{
  v12 = self;
  if (a10 >= 4)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: labelType <= RTAddressLabelTypeMax", buf, 2u);
    }

    v13 = 0;
  }
  else
  {
    LOBYTE(v16) = a6;
    v12 = objc_retain(-[RTContactPostalAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:](self, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:contactsIdentifier:labelType:iso3166CountryCode:iso3166SubdivisionCode:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              v16,
              a7,
              a8,
              a9,
              a10,
              a11,
              a12));
    v13 = v12;
  }

  return v13;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressData:(id)a4 subPremises:(id)a5 subThoroughfare:(id)a6 thoroughfare:(id)a7 subLocality:(id)a8 locality:(id)a9 subAdministrativeArea:(id)a10 administrativeArea:(id)a11 administrativeAreaCode:(id)a12 postalCode:(id)a13 country:(id)a14 countryCode:(id)a15 inlandWater:(id)a16 ocean:(id)a17 areasOfInterest:(id)a18 isIsland:(BOOL)a19 creationDate:(id)a20 expirationDate:(id)a21 contactsIdentifier:(id)a22 labelType:(unint64_t)a23 iso3166CountryCode:(id)a24 iso3166SubdivisionCode:(id)a25
{
  id v32 = a22;
  if (a23 >= 4)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: labelType <= RTAddressLabelTypeMax", buf, 2u);
    }

    id v35 = 0;
  }
  else
  {
    v39.receiver = self;
    v39.super_class = (Class)RTContactPostalAddress;
    id v33 = -[RTContactPostalAddress initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:](&v39, sel_initWithIdentifier_geoAddressData_subPremises_subThoroughfare_thoroughfare_subLocality_locality_subAdministrativeArea_administrativeArea_administrativeAreaCode_postalCode_country_countryCode_inlandWater_ocean_areasOfInterest_isIsland_creationDate_expirationDate_iso3166CountryCode_iso3166SubdivisionCode_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
            a20,
            a21,
            a24,
            a25);
    v34 = v33;
    if (v33)
    {
      objc_storeStrong((id *)&v33->_contactsIdentifier, a22);
      v34->_labelType = a23;
    }
    self = v34;
    id v35 = self;
  }

  return v35;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 geoAddressObject:(id)a4 subPremises:(id)a5 isIsland:(BOOL)a6 creationDate:(id)a7 expirationDate:(id)a8 contactsIdentifier:(id)a9 labelType:(unint64_t)a10 iso3166CountryCode:(id)a11 iso3166SubdivisionCode:(id)a12
{
  BOOL v14 = a6;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  id v25 = a12;
  if (!v18)
  {
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v37 = 0;
    id v30 = "Invalid parameter not satisfying: identifier";
    v31 = (uint8_t *)&v37;
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
    goto LABEL_15;
  }
  if (!v21)
  {
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v36 = 0;
    id v30 = "Invalid parameter not satisfying: creationDate";
    v31 = (uint8_t *)&v36;
    goto LABEL_14;
  }
  if (!v22)
  {
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v35 = 0;
    id v30 = "Invalid parameter not satisfying: expirationDate";
    v31 = (uint8_t *)&v35;
    goto LABEL_14;
  }
  if (!v19)
  {
    id v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v30 = "Invalid parameter not satisfying: geoAddressObject";
      v31 = buf;
      goto LABEL_14;
    }
LABEL_15:

    id v28 = 0;
    goto LABEL_16;
  }
  [(id)objc_opt_class() _encodeGeoAddressObject:v19 compress:1];
  id v33 = v19;
  v27 = id v26 = v20;
  self = [(RTContactPostalAddress *)self initWithIdentifier:v18 geoAddressData:v27 subPremises:v26 isIsland:v14 creationDate:v21 expirationDate:v22 contactsIdentifier:v23 labelType:a10 iso3166CountryCode:v24 iso3166SubdivisionCode:v25];

  id v20 = v26;
  id v19 = v33;
  id v28 = self;
LABEL_16:

  return v28;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 CNPostalAddress:(id)a4 lableType:(unint64_t)a5 creationDate:(id)a6 expirationDate:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v13 = (void *)MEMORY[0x1E4F1CA20];
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v13 preferredLanguages];
  id v19 = [v18 firstObject];

  id v20 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v21 = [v20 objectForKey:*MEMORY[0x1E4F1C400]];

  if (!v21)
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityContacts);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v29 = (objc_class *)objc_opt_class();
      id v30 = NSStringFromClass(v29);
      v31 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v33 = v30;
      __int16 v34 = 2112;
      __int16 v35 = v31;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "%@, %@, [NSLocale currentLocale] failed for NSLocaleCountryCode", buf, 0x16u);
    }
    id v21 = &stru_1F33EAD88;
  }
  id v23 = objc_alloc(MEMORY[0x1E4F643C0]);
  id v24 = [v16 value];
  id v25 = (void *)[v23 initWithCNPostalAddress:v24 language:v19 country:v21 phoneticLocale:v19];

  id v26 = [v16 identifier];

  id v27 = [(RTContactPostalAddress *)self initWithIdentifier:v17 geoAddressObject:v25 subPremises:0 isIsland:0 creationDate:v15 expirationDate:v14 contactsIdentifier:v26 labelType:a5 iso3166CountryCode:0 iso3166SubdivisionCode:0];
  return v27;
}

- (RTContactPostalAddress)initWithIdentifier:(id)a3 lableType:(unint64_t)a4 geoDictionary:(id)a5 language:(id)a6 country:(id)a7 phoneticLocale:(id)a8
{
  v13 = (void *)MEMORY[0x1E4F1C9C8];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [v13 date];
  id v20 = [v19 dateByAddingTimeInterval:4838400.0];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F643C0]) initWithContactAddressDictionary:v17 language:v16 country:v15 phoneticLocale:v14];

  id v22 = [MEMORY[0x1E4F29128] UUID];
  id v23 = [(RTContactPostalAddress *)self initWithIdentifier:v22 geoAddressObject:v21 subPremises:0 isIsland:0 creationDate:v19 expirationDate:v20 contactsIdentifier:v18 labelType:a4 iso3166CountryCode:0 iso3166SubdivisionCode:0];

  return v23;
}

- (id)description
{
  id v15 = NSString;
  id v14 = [(RTContactPostalAddress *)self identifier];
  v3 = [objc_opt_class() labelTypeToString:-[RTContactPostalAddress labelType](self, "labelType")];
  v4 = [(RTContactPostalAddress *)self mergedThoroughfare];
  v5 = [(RTContactPostalAddress *)self subLocality];
  v6 = [(RTContactPostalAddress *)self locality];
  v7 = [(RTContactPostalAddress *)self subAdministrativeArea];
  v8 = [(RTContactPostalAddress *)self administrativeArea];
  v9 = [(RTContactPostalAddress *)self postalCode];
  v10 = [(RTContactPostalAddress *)self country];
  v11 = [(RTContactPostalAddress *)self countryCode];
  v12 = [v15 stringWithFormat:@"identifier, %@, labelType, %@, street, %@, subLocality, %@, city, %@, subAdministrativeArea, %@, state, %@, postalCode, %@, country, %@, ISOCountryCode, %@", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (NSString)contactsIdentifier
{
  return self->_contactsIdentifier;
}

- (unint64_t)labelType
{
  return self->_labelType;
}

- (void).cxx_destruct
{
}

@end