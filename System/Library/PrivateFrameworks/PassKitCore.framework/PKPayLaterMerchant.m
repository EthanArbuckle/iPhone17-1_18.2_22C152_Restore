@interface PKPayLaterMerchant
+ (BOOL)supportsSecureCoding;
- (BOOL)displayNameIsFallbackString;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterMerchant:(id)a3;
- (BOOL)payLaterMerchantDictionaryIsEqual:(id)a3;
- (BOOL)requiresMerchantReprocessing;
- (NSDate)lastMerchantReprocessingDate;
- (NSString)authNetworkData;
- (NSString)city;
- (NSString)clearingNetworkData;
- (NSString)country;
- (NSString)industryCategory;
- (NSString)merchantIdentifier;
- (NSString)name;
- (NSString)rawCANL;
- (NSString)rawCity;
- (NSString)rawCountry;
- (NSString)rawName;
- (NSString)rawState;
- (NSString)state;
- (NSString)webMerchantIdentifier;
- (NSString)webMerchantName;
- (NSString)zipcode;
- (NSURL)originURL;
- (PKMapsBrand)mapsBrand;
- (PKMapsMerchant)mapsMerchant;
- (PKPayLaterMerchant)initWithCoder:(id)a3;
- (PKPayLaterMerchant)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)displayNamePurchase;
- (id)uniqueIdentifier;
- (int64_t)adamIdentifier;
- (int64_t)cleanConfidence;
- (int64_t)fallbackCategory;
- (int64_t)industryCode;
- (int64_t)merchantCategory;
- (int64_t)merchantCategoryCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamIdentifier:(int64_t)a3;
- (void)setAuthNetworkData:(id)a3;
- (void)setCity:(id)a3;
- (void)setCleanConfidence:(int64_t)a3;
- (void)setClearingNetworkData:(id)a3;
- (void)setCountry:(id)a3;
- (void)setFallbackCategory:(int64_t)a3;
- (void)setIndustryCategory:(id)a3;
- (void)setIndustryCode:(int64_t)a3;
- (void)setLastMerchantReprocessingDate:(id)a3;
- (void)setMapsBrand:(id)a3;
- (void)setMapsMerchant:(id)a3;
- (void)setMerchantCategory:(int64_t)a3;
- (void)setMerchantCategoryCode:(int64_t)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginURL:(id)a3;
- (void)setRawCANL:(id)a3;
- (void)setRawCity:(id)a3;
- (void)setRawCountry:(id)a3;
- (void)setRawName:(id)a3;
- (void)setRawState:(id)a3;
- (void)setRequiresMerchantReprocessing:(BOOL)a3;
- (void)setState:(id)a3;
- (void)setWebMerchantIdentifier:(id)a3;
- (void)setWebMerchantName:(id)a3;
- (void)setZipcode:(id)a3;
@end

@implementation PKPayLaterMerchant

- (PKPayLaterMerchant)initWithDictionary:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PKPayLaterMerchant;
  v5 = [(PKPayLaterMerchant *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    v5->_merchantCategoryCode = [v4 PKIntegerForKey:@"merchantCategoryCode"];
    v8 = [v4 PKStringForKey:@"merchantCategory"];
    v5->_merchantCategory = PKMerchantCategoryFromString(v8);

    uint64_t v9 = [v4 PKStringForKey:@"merchantRawName"];
    rawName = v5->_rawName;
    v5->_rawName = (NSString *)v9;

    uint64_t v11 = [v4 PKStringForKey:@"merchantName"];
    name = v5->_name;
    v5->_name = (NSString *)v11;

    uint64_t v13 = [v4 PKStringForKey:@"merchantRawCity"];
    rawCity = v5->_rawCity;
    v5->_rawCity = (NSString *)v13;

    uint64_t v15 = [v4 PKStringForKey:@"merchantCity"];
    city = v5->_city;
    v5->_city = (NSString *)v15;

    uint64_t v17 = [v4 PKStringForKey:@"merchantRawState"];
    rawState = v5->_rawState;
    v5->_rawState = (NSString *)v17;

    uint64_t v19 = [v4 PKStringForKey:@"merchantState"];
    state = v5->_state;
    v5->_state = (NSString *)v19;

    uint64_t v21 = [v4 PKStringForKey:@"merchantRawCountry"];
    rawCountry = v5->_rawCountry;
    v5->_rawCountry = (NSString *)v21;

    uint64_t v23 = [v4 PKStringForKey:@"merchantCountry"];
    country = v5->_country;
    v5->_country = (NSString *)v23;

    uint64_t v25 = [v4 PKStringForKey:@"merchantRawCANL"];
    rawCANL = v5->_rawCANL;
    v5->_rawCANL = (NSString *)v25;

    uint64_t v27 = [v4 PKStringForKey:@"merchantZip"];
    zipcode = v5->_zipcode;
    v5->_zipcode = (NSString *)v27;

    v5->_cleanConfidence = [v4 PKIntegerForKey:@"merchantCleanConfidence"];
    v5->_industryCode = [v4 PKIntegerForKey:@"merchantIndustryCode"];
    uint64_t v29 = [v4 PKStringForKey:@"merchantIndustryCategory"];
    industryCategory = v5->_industryCategory;
    v5->_industryCategory = (NSString *)v29;

    uint64_t v31 = [v4 PKStringForKey:@"authNetworkData"];
    authNetworkData = v5->_authNetworkData;
    v5->_authNetworkData = (NSString *)v31;

    uint64_t v33 = [v4 PKStringForKey:@"clearingNetworkData"];
    clearingNetworkData = v5->_clearingNetworkData;
    v5->_clearingNetworkData = (NSString *)v33;

    uint64_t v35 = [v4 PKURLForKey:@"originURL"];
    originURL = v5->_originURL;
    v5->_originURL = (NSURL *)v35;

    uint64_t v37 = [v4 PKStringForKey:@"webMerchantIdentifier"];
    webMerchantIdentifier = v5->_webMerchantIdentifier;
    v5->_webMerchantIdentifier = (NSString *)v37;

    uint64_t v39 = [v4 PKStringForKey:@"webMerchantName"];
    webMerchantName = v5->_webMerchantName;
    v5->_webMerchantName = (NSString *)v39;

    v5->_adamIdentifier = [v4 PKIntegerForKey:@"adamIdentifier"];
  }

  return v5;
}

- (id)uniqueIdentifier
{
  if (self->_mapsBrand)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"mapsBrand-%lu", -[PKMapsBrand identifier](self->_mapsBrand, "identifier"), v4);
  }
  else if (self->_mapsMerchant)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"mapsMerchant-%lu", -[PKMapsMerchant identifier](self->_mapsMerchant, "identifier"), v4);
  }
  else
  {
    [NSString stringWithFormat:@"merchant-%@-%@", self->_rawName, self->_name];
  v2 = };
  return v2;
}

- (id)displayName
{
  v3 = [(PKMapsBrand *)self->_mapsBrand name];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    mapsBrand = self->_mapsBrand;
LABEL_5:
    v8 = [mapsBrand name];
    goto LABEL_6;
  }
  uint64_t v6 = [(PKMapsMerchant *)self->_mapsMerchant name];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    mapsBrand = self->_mapsMerchant;
    goto LABEL_5;
  }
  if ([(NSString *)self->_name length])
  {
    name = self->_name;
LABEL_13:
    v8 = name;
    goto LABEL_6;
  }
  if ([(NSString *)self->_rawName length])
  {
    name = self->_rawName;
    goto LABEL_13;
  }
  PKLocalizedCocoonString(&cfstr_NewInstallment.isa, 0);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return v8;
}

- (BOOL)displayNameIsFallbackString
{
  if ([(NSString *)self->_name length]) {
    return 0;
  }
  uint64_t v4 = [(PKMapsBrand *)self->_mapsBrand name];
  if ([v4 length])
  {
    BOOL v3 = 0;
  }
  else
  {
    v5 = [(PKMapsMerchant *)self->_mapsMerchant name];
    if ([v5 length]) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = [(NSString *)self->_rawName length] == 0;
    }
  }
  return v3;
}

- (id)displayNamePurchase
{
  BOOL v3 = [(PKPayLaterMerchant *)self displayName];
  if ([(PKPayLaterMerchant *)self displayNameIsFallbackString])
  {
    id v4 = v3;
  }
  else
  {
    PKLocalizedCocoonString(&cfstr_MerchantNamePu.isa, &stru_1EE0F6808.isa, v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (int64_t)merchantCategory
{
  p_mapsBrand = (id *)&self->_mapsBrand;
  uint64_t merchantCategory = self->_merchantCategory;
  if ([(PKMapsBrand *)self->_mapsBrand category]
    || (p_mapsBrand = (id *)&self->_mapsMerchant, [(PKMapsMerchant *)self->_mapsMerchant category]))
  {
    uint64_t merchantCategory = [*p_mapsBrand category];
  }
  if (!merchantCategory) {
    uint64_t merchantCategory = self->_fallbackCategory;
  }
  if (merchantCategory) {
    return merchantCategory;
  }
  else {
    return 2;
  }
}

- (BOOL)payLaterMerchantDictionaryIsEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)v4[2];
  uint64_t v6 = self->_merchantIdentifier;
  uint64_t v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_7;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_96;
    }
  }
  if (self->_merchantCategoryCode != v4[3]) {
    goto LABEL_96;
  }
  uint64_t v11 = (void *)v4[6];
  uint64_t v6 = self->_rawName;
  v12 = v11;
  if (v6 == v12)
  {
  }
  else
  {
    v8 = v12;
    if (!v6 || !v12) {
      goto LABEL_7;
    }
    BOOL v13 = [(NSString *)v6 isEqualToString:v12];

    if (!v13) {
      goto LABEL_96;
    }
  }
  v14 = (void *)v4[7];
  uint64_t v6 = self->_name;
  uint64_t v15 = v14;
  if (v6 == v15)
  {
  }
  else
  {
    v8 = v15;
    if (!v6 || !v15) {
      goto LABEL_7;
    }
    BOOL v16 = [(NSString *)v6 isEqualToString:v15];

    if (!v16) {
      goto LABEL_96;
    }
  }
  uint64_t v17 = (void *)v4[8];
  uint64_t v6 = self->_rawCity;
  v18 = v17;
  if (v6 == v18)
  {
  }
  else
  {
    v8 = v18;
    if (!v6 || !v18) {
      goto LABEL_7;
    }
    BOOL v19 = [(NSString *)v6 isEqualToString:v18];

    if (!v19) {
      goto LABEL_96;
    }
  }
  v20 = (void *)v4[9];
  uint64_t v6 = self->_city;
  uint64_t v21 = v20;
  if (v6 == v21)
  {
  }
  else
  {
    v8 = v21;
    if (!v6 || !v21) {
      goto LABEL_7;
    }
    BOOL v22 = [(NSString *)v6 isEqualToString:v21];

    if (!v22) {
      goto LABEL_96;
    }
  }
  uint64_t v23 = (void *)v4[10];
  uint64_t v6 = self->_rawState;
  v24 = v23;
  if (v6 == v24)
  {
  }
  else
  {
    v8 = v24;
    if (!v6 || !v24) {
      goto LABEL_7;
    }
    BOOL v25 = [(NSString *)v6 isEqualToString:v24];

    if (!v25) {
      goto LABEL_96;
    }
  }
  v26 = (void *)v4[11];
  uint64_t v6 = self->_state;
  uint64_t v27 = v26;
  if (v6 == v27)
  {
  }
  else
  {
    v8 = v27;
    if (!v6 || !v27) {
      goto LABEL_7;
    }
    BOOL v28 = [(NSString *)v6 isEqualToString:v27];

    if (!v28) {
      goto LABEL_96;
    }
  }
  uint64_t v29 = (void *)v4[12];
  uint64_t v6 = self->_rawCountry;
  v30 = v29;
  if (v6 == v30)
  {
  }
  else
  {
    v8 = v30;
    if (!v6 || !v30) {
      goto LABEL_7;
    }
    BOOL v31 = [(NSString *)v6 isEqualToString:v30];

    if (!v31) {
      goto LABEL_96;
    }
  }
  v32 = (void *)v4[13];
  uint64_t v6 = self->_country;
  uint64_t v33 = v32;
  if (v6 == v33)
  {
  }
  else
  {
    v8 = v33;
    if (!v6 || !v33) {
      goto LABEL_7;
    }
    BOOL v34 = [(NSString *)v6 isEqualToString:v33];

    if (!v34) {
      goto LABEL_96;
    }
  }
  uint64_t v35 = (void *)v4[15];
  uint64_t v6 = self->_rawCANL;
  v36 = v35;
  if (v6 == v36)
  {
  }
  else
  {
    v8 = v36;
    if (!v6 || !v36) {
      goto LABEL_7;
    }
    BOOL v37 = [(NSString *)v6 isEqualToString:v36];

    if (!v37) {
      goto LABEL_96;
    }
  }
  v38 = (void *)v4[14];
  uint64_t v6 = self->_zipcode;
  uint64_t v39 = v38;
  if (v6 == v39)
  {
  }
  else
  {
    v8 = v39;
    if (!v6 || !v39) {
      goto LABEL_7;
    }
    BOOL v40 = [(NSString *)v6 isEqualToString:v39];

    if (!v40) {
      goto LABEL_96;
    }
  }
  if (self->_cleanConfidence != v4[20] || self->_industryCode != v4[16]) {
    goto LABEL_96;
  }
  v41 = (void *)v4[17];
  uint64_t v6 = self->_industryCategory;
  objc_super v42 = v41;
  if (v6 == v42)
  {
  }
  else
  {
    v8 = v42;
    if (!v6 || !v42) {
      goto LABEL_7;
    }
    BOOL v43 = [(NSString *)v6 isEqualToString:v42];

    if (!v43) {
      goto LABEL_96;
    }
  }
  v44 = (void *)v4[18];
  uint64_t v6 = self->_authNetworkData;
  v45 = v44;
  if (v6 == v45)
  {
  }
  else
  {
    v8 = v45;
    if (!v6 || !v45) {
      goto LABEL_7;
    }
    BOOL v46 = [(NSString *)v6 isEqualToString:v45];

    if (!v46) {
      goto LABEL_96;
    }
  }
  v47 = (void *)v4[19];
  uint64_t v6 = self->_clearingNetworkData;
  v48 = v47;
  if (v6 == v48)
  {
  }
  else
  {
    v8 = v48;
    if (!v6 || !v48) {
      goto LABEL_7;
    }
    BOOL v49 = [(NSString *)v6 isEqualToString:v48];

    if (!v49) {
      goto LABEL_96;
    }
  }
  originURL = self->_originURL;
  v51 = (NSURL *)v4[21];
  if (originURL && v51)
  {
    if ((-[NSURL isEqual:](originURL, "isEqual:") & 1) == 0) {
      goto LABEL_96;
    }
  }
  else if (originURL != v51)
  {
    goto LABEL_96;
  }
  v54 = (void *)v4[22];
  uint64_t v6 = self->_webMerchantIdentifier;
  v55 = v54;
  if (v6 == v55)
  {

    goto LABEL_104;
  }
  v8 = v55;
  if (!v6 || !v55)
  {
LABEL_7:

    goto LABEL_96;
  }
  BOOL v56 = [(NSString *)v6 isEqualToString:v55];

  if (!v56) {
    goto LABEL_96;
  }
LABEL_104:
  v57 = (void *)v4[23];
  uint64_t v6 = self->_webMerchantName;
  v58 = v57;
  if (v6 == v58)
  {

LABEL_110:
    BOOL v52 = self->_adamIdentifier == v4[24];
    goto LABEL_97;
  }
  v8 = v58;
  if (!v6 || !v58) {
    goto LABEL_7;
  }
  BOOL v59 = [(NSString *)v6 isEqualToString:v58];

  if (v59) {
    goto LABEL_110;
  }
LABEL_96:
  BOOL v52 = 0;
LABEL_97:

  return v52;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterMerchant *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterMerchant *)self isEqualToPayLaterMerchant:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterMerchant:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_116;
  }
  BOOL v6 = (void *)*((void *)v4 + 2);
  uint64_t v7 = self->_merchantIdentifier;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    BOOL v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_115;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_116;
    }
  }
  if (self->_merchantCategoryCode != *((void *)v5 + 3)
    || self->_merchantCategory != *((void *)v5 + 4)
    || self->_fallbackCategory != *((void *)v5 + 5))
  {
    goto LABEL_116;
  }
  uint64_t v11 = (void *)*((void *)v5 + 6);
  uint64_t v7 = self->_rawName;
  v12 = v11;
  if (v7 == v12)
  {
  }
  else
  {
    BOOL v9 = v12;
    if (!v7 || !v12) {
      goto LABEL_115;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_116;
    }
  }
  v14 = (void *)*((void *)v5 + 15);
  uint64_t v7 = self->_rawCANL;
  uint64_t v15 = v14;
  if (v7 == v15)
  {
  }
  else
  {
    BOOL v9 = v15;
    if (!v7 || !v15) {
      goto LABEL_115;
    }
    BOOL v16 = [(NSString *)v7 isEqualToString:v15];

    if (!v16) {
      goto LABEL_116;
    }
  }
  uint64_t v17 = (void *)*((void *)v5 + 8);
  uint64_t v7 = self->_rawCity;
  v18 = v17;
  if (v7 == v18)
  {
  }
  else
  {
    BOOL v9 = v18;
    if (!v7 || !v18) {
      goto LABEL_115;
    }
    BOOL v19 = [(NSString *)v7 isEqualToString:v18];

    if (!v19) {
      goto LABEL_116;
    }
  }
  v20 = (void *)*((void *)v5 + 10);
  uint64_t v7 = self->_rawState;
  uint64_t v21 = v20;
  if (v7 == v21)
  {
  }
  else
  {
    BOOL v9 = v21;
    if (!v7 || !v21) {
      goto LABEL_115;
    }
    BOOL v22 = [(NSString *)v7 isEqualToString:v21];

    if (!v22) {
      goto LABEL_116;
    }
  }
  uint64_t v23 = (void *)*((void *)v5 + 12);
  uint64_t v7 = self->_rawCountry;
  v24 = v23;
  if (v7 == v24)
  {
  }
  else
  {
    BOOL v9 = v24;
    if (!v7 || !v24) {
      goto LABEL_115;
    }
    BOOL v25 = [(NSString *)v7 isEqualToString:v24];

    if (!v25) {
      goto LABEL_116;
    }
  }
  v26 = (void *)*((void *)v5 + 7);
  uint64_t v7 = self->_name;
  uint64_t v27 = v26;
  if (v7 == v27)
  {
  }
  else
  {
    BOOL v9 = v27;
    if (!v7 || !v27) {
      goto LABEL_115;
    }
    BOOL v28 = [(NSString *)v7 isEqualToString:v27];

    if (!v28) {
      goto LABEL_116;
    }
  }
  uint64_t v29 = (void *)*((void *)v5 + 9);
  uint64_t v7 = self->_city;
  v30 = v29;
  if (v7 == v30)
  {
  }
  else
  {
    BOOL v9 = v30;
    if (!v7 || !v30) {
      goto LABEL_115;
    }
    BOOL v31 = [(NSString *)v7 isEqualToString:v30];

    if (!v31) {
      goto LABEL_116;
    }
  }
  v32 = (void *)*((void *)v5 + 11);
  uint64_t v7 = self->_state;
  uint64_t v33 = v32;
  if (v7 == v33)
  {
  }
  else
  {
    BOOL v9 = v33;
    if (!v7 || !v33) {
      goto LABEL_115;
    }
    BOOL v34 = [(NSString *)v7 isEqualToString:v33];

    if (!v34) {
      goto LABEL_116;
    }
  }
  uint64_t v35 = (void *)*((void *)v5 + 14);
  uint64_t v7 = self->_zipcode;
  v36 = v35;
  if (v7 == v36)
  {
  }
  else
  {
    BOOL v9 = v36;
    if (!v7 || !v36) {
      goto LABEL_115;
    }
    BOOL v37 = [(NSString *)v7 isEqualToString:v36];

    if (!v37) {
      goto LABEL_116;
    }
  }
  v38 = (void *)*((void *)v5 + 13);
  uint64_t v7 = self->_country;
  uint64_t v39 = v38;
  if (v7 == v39)
  {
  }
  else
  {
    BOOL v9 = v39;
    if (!v7 || !v39) {
      goto LABEL_115;
    }
    BOOL v40 = [(NSString *)v7 isEqualToString:v39];

    if (!v40) {
      goto LABEL_116;
    }
  }
  v41 = (void *)*((void *)v5 + 19);
  uint64_t v7 = self->_clearingNetworkData;
  objc_super v42 = v41;
  if (v7 == v42)
  {
  }
  else
  {
    BOOL v9 = v42;
    if (!v7 || !v42) {
      goto LABEL_115;
    }
    BOOL v43 = [(NSString *)v7 isEqualToString:v42];

    if (!v43) {
      goto LABEL_116;
    }
  }
  v44 = (void *)*((void *)v5 + 18);
  uint64_t v7 = self->_authNetworkData;
  v45 = v44;
  if (v7 == v45)
  {
  }
  else
  {
    BOOL v9 = v45;
    if (!v7 || !v45) {
      goto LABEL_115;
    }
    BOOL v46 = [(NSString *)v7 isEqualToString:v45];

    if (!v46) {
      goto LABEL_116;
    }
  }
  v47 = (void *)*((void *)v5 + 17);
  uint64_t v7 = self->_industryCategory;
  v48 = v47;
  if (v7 == v48)
  {
  }
  else
  {
    BOOL v9 = v48;
    if (!v7 || !v48) {
      goto LABEL_115;
    }
    BOOL v49 = [(NSString *)v7 isEqualToString:v48];

    if (!v49) {
      goto LABEL_116;
    }
  }
  mapsMerchant = self->_mapsMerchant;
  v51 = (PKMapsMerchant *)*((void *)v5 + 25);
  if (mapsMerchant && v51)
  {
    if (!-[PKMapsMerchant isEqual:](mapsMerchant, "isEqual:")) {
      goto LABEL_116;
    }
  }
  else if (mapsMerchant != v51)
  {
    goto LABEL_116;
  }
  mapsBrand = self->_mapsBrand;
  v53 = (PKMapsBrand *)*((void *)v5 + 26);
  if (mapsBrand && v53)
  {
    if (!-[PKMapsBrand isEqual:](mapsBrand, "isEqual:")) {
      goto LABEL_116;
    }
  }
  else if (mapsBrand != v53)
  {
    goto LABEL_116;
  }
  lastMerchantReprocessingDate = self->_lastMerchantReprocessingDate;
  v55 = (NSDate *)*((void *)v5 + 27);
  if (lastMerchantReprocessingDate && v55)
  {
    if ((-[NSDate isEqual:](lastMerchantReprocessingDate, "isEqual:") & 1) == 0) {
      goto LABEL_116;
    }
  }
  else if (lastMerchantReprocessingDate != v55)
  {
    goto LABEL_116;
  }
  BOOL v56 = (void *)*((void *)v5 + 22);
  uint64_t v7 = self->_webMerchantIdentifier;
  v57 = v56;
  if (v7 == v57)
  {
  }
  else
  {
    BOOL v9 = v57;
    if (!v7 || !v57) {
      goto LABEL_115;
    }
    BOOL v58 = [(NSString *)v7 isEqualToString:v57];

    if (!v58) {
      goto LABEL_116;
    }
  }
  BOOL v59 = (void *)*((void *)v5 + 23);
  uint64_t v7 = self->_webMerchantName;
  v60 = v59;
  if (v7 != v60)
  {
    BOOL v9 = v60;
    if (v7 && v60)
    {
      BOOL v61 = [(NSString *)v7 isEqualToString:v60];

      if (!v61) {
        goto LABEL_116;
      }
      goto LABEL_119;
    }
LABEL_115:

    goto LABEL_116;
  }

LABEL_119:
  originURL = self->_originURL;
  v65 = (NSURL *)*((void *)v5 + 21);
  if (originURL && v65)
  {
    if ((-[NSURL isEqual:](originURL, "isEqual:") & 1) == 0) {
      goto LABEL_116;
    }
  }
  else if (originURL != v65)
  {
    goto LABEL_116;
  }
  if (self->_requiresMerchantReprocessing == v5[8]
    && self->_industryCode == *((void *)v5 + 16)
    && self->_cleanConfidence == *((void *)v5 + 20))
  {
    BOOL v62 = self->_adamIdentifier == *((void *)v5 + 24);
    goto LABEL_117;
  }
LABEL_116:
  BOOL v62 = 0;
LABEL_117:

  return v62;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_merchantIdentifier];
  [v3 safelyAddObject:self->_rawName];
  [v3 safelyAddObject:self->_rawCANL];
  [v3 safelyAddObject:self->_rawCity];
  [v3 safelyAddObject:self->_rawState];
  [v3 safelyAddObject:self->_rawCountry];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_city];
  [v3 safelyAddObject:self->_state];
  [v3 safelyAddObject:self->_zipcode];
  [v3 safelyAddObject:self->_country];
  [v3 safelyAddObject:self->_mapsBrand];
  [v3 safelyAddObject:self->_mapsMerchant];
  [v3 safelyAddObject:self->_industryCategory];
  [v3 safelyAddObject:self->_authNetworkData];
  [v3 safelyAddObject:self->_clearingNetworkData];
  [v3 safelyAddObject:self->_lastMerchantReprocessingDate];
  [v3 safelyAddObject:self->_originURL];
  [v3 safelyAddObject:self->_webMerchantName];
  [v3 safelyAddObject:self->_webMerchantIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_merchantCategoryCode - v4 + 32 * v4;
  int64_t v6 = self->_merchantCategory - v5 + 32 * v5;
  int64_t v7 = self->_cleanConfidence - v6 + 32 * v6;
  int64_t v8 = self->_industryCode - v7 + 32 * v7;
  uint64_t v9 = self->_requiresMerchantReprocessing - v8 + 32 * v8;
  int64_t v10 = self->_fallbackCategory - v9 + 32 * v9;
  unint64_t v11 = self->_adamIdentifier - v10 + 32 * v10;

  return v11;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"merchantIdentifier: '%@'; ", self->_merchantIdentifier];
  uint64_t v4 = [NSNumber numberWithInteger:self->_merchantCategoryCode];
  [v3 appendFormat:@"merchantCategoryCode: '%@'; ", v4];

  int64_t v5 = PKMerchantCategoryToString(self->_merchantCategory);
  [v3 appendFormat:@"merchantCategory: '%@'; ", v5];

  int64_t v6 = PKMerchantCategoryToString(self->_fallbackCategory);
  [v3 appendFormat:@"fallbackCategory: '%@'; ", v6];

  [v3 appendFormat:@"rawName: '%@'; ", self->_rawName];
  [v3 appendFormat:@"name: '%@'; ", self->_name];
  [v3 appendFormat:@"rawCity: '%@'; ", self->_rawCity];
  [v3 appendFormat:@"city: '%@'; ", self->_city];
  [v3 appendFormat:@"rawState: '%@'; ", self->_rawState];
  [v3 appendFormat:@"state: '%@'; ", self->_state];
  [v3 appendFormat:@"rawCountry: '%@'; ", self->_rawCountry];
  [v3 appendFormat:@"country: '%@'; ", self->_country];
  [v3 appendFormat:@"rawCANL: '%@'; ", self->_rawCANL];
  [v3 appendFormat:@"zipcode: '%@'; ", self->_zipcode];
  int64_t v7 = [NSNumber numberWithInteger:self->_cleanConfidence];
  [v3 appendFormat:@"cleanConfidence: '%@'; ", v7];

  int64_t v8 = [NSNumber numberWithInteger:self->_industryCode];
  [v3 appendFormat:@"industryCode: '%@'; ", v8];

  [v3 appendFormat:@"industryCategory: '%@'; ", self->_industryCategory];
  [v3 appendFormat:@"mapsMerchant: '%@'; ", self->_mapsMerchant];
  [v3 appendFormat:@"mapsBrand: '%@'; ", self->_mapsBrand];
  if (self->_requiresMerchantReprocessing) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  [v3 appendFormat:@"requiresMerchantReprocessing: '%@'; ", v9];
  [v3 appendFormat:@"lastMerchantReprocessingDate: '%@'; ", self->_lastMerchantReprocessingDate];
  [v3 appendFormat:@"clearingNetworkData: '%@'; ", self->_clearingNetworkData];
  [v3 appendFormat:@"authNetworkData: '%@'; ", self->_authNetworkData];
  [v3 appendFormat:@"originURL: '%@'; ", self->_originURL];
  [v3 appendFormat:@"webMerchantName: '%@'; ", self->_webMerchantName];
  [v3 appendFormat:@"webMerchantIdentifier: '%@'; ", self->_webMerchantIdentifier];
  objc_msgSend(v3, "appendFormat:", @"authNetworkData: %ld; ", self->_adamIdentifier);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_merchantIdentifier forKeyedSubscript:@"merchantIdentifier"];
  uint64_t v4 = [NSNumber numberWithInteger:self->_merchantCategoryCode];
  [v3 setObject:v4 forKeyedSubscript:@"merchantCategoryCode"];

  int64_t v5 = PKMerchantCategoryToString(self->_merchantCategory);
  [v3 setObject:v5 forKeyedSubscript:@"merchantCategory"];

  [v3 setObject:self->_rawName forKeyedSubscript:@"merchantRawName"];
  [v3 setObject:self->_name forKeyedSubscript:@"merchantName"];
  [v3 setObject:self->_rawCity forKeyedSubscript:@"merchantRawCity"];
  [v3 setObject:self->_city forKeyedSubscript:@"merchantCity"];
  [v3 setObject:self->_rawState forKeyedSubscript:@"merchantRawState"];
  [v3 setObject:self->_state forKeyedSubscript:@"merchantState"];
  [v3 setObject:self->_rawCountry forKeyedSubscript:@"merchantRawCountry"];
  [v3 setObject:self->_country forKeyedSubscript:@"merchantCountry"];
  [v3 setObject:self->_rawCANL forKeyedSubscript:@"merchantRawCANL"];
  [v3 setObject:self->_zipcode forKeyedSubscript:@"merchantZip"];
  int64_t v6 = [NSNumber numberWithInteger:self->_cleanConfidence];
  [v3 setObject:v6 forKeyedSubscript:@"merchantCleanConfidence"];

  int64_t v7 = [NSNumber numberWithInteger:self->_industryCode];
  [v3 setObject:v7 forKeyedSubscript:@"merchantIndustryCode"];

  [v3 setObject:self->_industryCategory forKeyedSubscript:@"merchantIndustryCategory"];
  [v3 setObject:self->_authNetworkData forKeyedSubscript:@"authNetworkData"];
  [v3 setObject:self->_clearingNetworkData forKeyedSubscript:@"clearingNetworkData"];
  int64_t v8 = [(NSURL *)self->_originURL absoluteString];
  [v3 setObject:v8 forKeyedSubscript:@"originURL"];

  [v3 setObject:self->_webMerchantIdentifier forKeyedSubscript:@"webMerchantIdentifier"];
  [v3 setObject:self->_webMerchantName forKeyedSubscript:@"webMerchantName"];
  uint64_t v9 = [NSNumber numberWithInteger:self->_adamIdentifier];
  [v3 setObject:v9 forKeyedSubscript:@"adamIdentifier"];

  int64_t v10 = (void *)[v3 copy];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterMerchant)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKPayLaterMerchant;
  int64_t v5 = [(PKPayLaterMerchant *)&v47 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    v5->_merchantCategoryCode = [v4 decodeIntegerForKey:@"merchantCategoryCode"];
    v5->_uint64_t merchantCategory = [v4 decodeIntegerForKey:@"merchantCategory"];
    v5->_fallbackCategory = [v4 decodeIntegerForKey:@"fallbackCategory"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantRawName"];
    rawName = v5->_rawName;
    v5->_rawName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantRawCANL"];
    rawCANL = v5->_rawCANL;
    v5->_rawCANL = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantRawCity"];
    rawCity = v5->_rawCity;
    v5->_rawCity = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantRawState"];
    rawState = v5->_rawState;
    v5->_rawState = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantRawCountry"];
    rawCountry = v5->_rawCountry;
    v5->_rawCountry = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantName"];
    name = v5->_name;
    v5->_name = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantCity"];
    city = v5->_city;
    v5->_city = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantState"];
    state = v5->_state;
    v5->_state = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantZip"];
    zipcode = v5->_zipcode;
    v5->_zipcode = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantCountry"];
    country = v5->_country;
    v5->_country = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authNetworkData"];
    authNetworkData = v5->_authNetworkData;
    v5->_authNetworkData = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clearingNetworkData"];
    clearingNetworkData = v5->_clearingNetworkData;
    v5->_clearingNetworkData = (NSString *)v30;

    v5->_cleanConfidence = [v4 decodeIntegerForKey:@"merchantCleanConfidence"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIndustryCategory"];
    industryCategory = v5->_industryCategory;
    v5->_industryCategory = (NSString *)v32;

    v5->_industryCode = [v4 decodeIntegerForKey:@"merchantIndustryCode"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapsBrand"];
    mapsBrand = v5->_mapsBrand;
    v5->_mapsBrand = (PKMapsBrand *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapsMerchant"];
    mapsMerchant = v5->_mapsMerchant;
    v5->_mapsMerchant = (PKMapsMerchant *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastMerchantReprocessingDate"];
    lastMerchantReprocessingDate = v5->_lastMerchantReprocessingDate;
    v5->_lastMerchantReprocessingDate = (NSDate *)v38;

    v5->_requiresMerchantReprocessing = [v4 decodeBoolForKey:@"requiresMerchantReprocessing"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webMerchantName"];
    webMerchantName = v5->_webMerchantName;
    v5->_webMerchantName = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webMerchantIdentifier"];
    webMerchantIdentifier = v5->_webMerchantIdentifier;
    v5->_webMerchantIdentifier = (NSString *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originURL"];
    originURL = v5->_originURL;
    v5->_originURL = (NSURL *)v44;

    v5->_adamIdentifier = [v4 decodeIntegerForKey:@"adamIdentifier"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  merchantIdentifier = self->_merchantIdentifier;
  id v5 = a3;
  [v5 encodeObject:merchantIdentifier forKey:@"merchantIdentifier"];
  [v5 encodeInteger:self->_merchantCategoryCode forKey:@"merchantCategoryCode"];
  [v5 encodeInteger:self->_merchantCategory forKey:@"merchantCategory"];
  [v5 encodeInteger:self->_fallbackCategory forKey:@"fallbackCategory"];
  [v5 encodeObject:self->_rawName forKey:@"merchantRawName"];
  [v5 encodeObject:self->_rawCANL forKey:@"merchantRawCANL"];
  [v5 encodeObject:self->_rawCity forKey:@"merchantRawCity"];
  [v5 encodeObject:self->_rawState forKey:@"merchantRawState"];
  [v5 encodeObject:self->_rawCountry forKey:@"merchantRawCountry"];
  [v5 encodeObject:self->_name forKey:@"merchantName"];
  [v5 encodeObject:self->_city forKey:@"merchantCity"];
  [v5 encodeObject:self->_state forKey:@"merchantState"];
  [v5 encodeObject:self->_zipcode forKey:@"merchantZip"];
  [v5 encodeObject:self->_country forKey:@"merchantCountry"];
  [v5 encodeInteger:self->_cleanConfidence forKey:@"merchantCleanConfidence"];
  [v5 encodeObject:self->_mapsBrand forKey:@"mapsBrand"];
  [v5 encodeObject:self->_mapsMerchant forKey:@"mapsMerchant"];
  [v5 encodeObject:self->_lastMerchantReprocessingDate forKey:@"lastMerchantReprocessingDate"];
  [v5 encodeObject:self->_industryCategory forKey:@"merchantIndustryCategory"];
  [v5 encodeObject:self->_clearingNetworkData forKey:@"clearingNetworkData"];
  [v5 encodeObject:self->_authNetworkData forKey:@"authNetworkData"];
  [v5 encodeInteger:self->_industryCode forKey:@"merchantIndustryCode"];
  [v5 encodeBool:self->_requiresMerchantReprocessing forKey:@"requiresMerchantReprocessing"];
  [v5 encodeObject:self->_webMerchantName forKey:@"webMerchantName"];
  [v5 encodeObject:self->_webMerchantIdentifier forKey:@"webMerchantIdentifier"];
  [v5 encodeObject:self->_originURL forKey:@"originURL"];
  [v5 encodeInteger:self->_adamIdentifier forKey:@"adamIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterMerchant allocWithZone:](PKPayLaterMerchant, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_merchantIdentifier copyWithZone:a3];
  merchantIdentifier = v5->_merchantIdentifier;
  v5->_merchantIdentifier = (NSString *)v6;

  v5->_merchantCategoryCode = self->_merchantCategoryCode;
  v5->_fallbackCategory = self->_fallbackCategory;
  v5->_uint64_t merchantCategory = self->_merchantCategory;
  uint64_t v8 = [(NSString *)self->_rawName copyWithZone:a3];
  rawName = v5->_rawName;
  v5->_rawName = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_rawCANL copyWithZone:a3];
  rawCANL = v5->_rawCANL;
  v5->_rawCANL = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_rawCity copyWithZone:a3];
  rawCity = v5->_rawCity;
  v5->_rawCity = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_rawState copyWithZone:a3];
  rawState = v5->_rawState;
  v5->_rawState = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_rawCountry copyWithZone:a3];
  rawCountry = v5->_rawCountry;
  v5->_rawCountry = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_name copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_city copyWithZone:a3];
  city = v5->_city;
  v5->_city = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_state copyWithZone:a3];
  state = v5->_state;
  v5->_state = (NSString *)v22;

  uint64_t v24 = [(NSString *)self->_zipcode copyWithZone:a3];
  zipcode = v5->_zipcode;
  v5->_zipcode = (NSString *)v24;

  uint64_t v26 = [(NSString *)self->_country copyWithZone:a3];
  country = v5->_country;
  v5->_country = (NSString *)v26;

  uint64_t v28 = [(NSString *)self->_industryCategory copyWithZone:a3];
  industryCategory = v5->_industryCategory;
  v5->_industryCategory = (NSString *)v28;

  v5->_industryCode = self->_industryCode;
  uint64_t v30 = [(NSString *)self->_authNetworkData copyWithZone:a3];
  authNetworkData = v5->_authNetworkData;
  v5->_authNetworkData = (NSString *)v30;

  uint64_t v32 = [(NSString *)self->_clearingNetworkData copyWithZone:a3];
  clearingNetworkData = v5->_clearingNetworkData;
  v5->_clearingNetworkData = (NSString *)v32;

  uint64_t v34 = [(NSDate *)self->_lastMerchantReprocessingDate copyWithZone:a3];
  lastMerchantReprocessingDate = v5->_lastMerchantReprocessingDate;
  v5->_lastMerchantReprocessingDate = (NSDate *)v34;

  v5->_requiresMerchantReprocessing = self->_requiresMerchantReprocessing;
  v5->_cleanConfidence = self->_cleanConfidence;
  uint64_t v36 = [(NSString *)self->_webMerchantName copyWithZone:a3];
  webMerchantName = v5->_webMerchantName;
  v5->_webMerchantName = (NSString *)v36;

  uint64_t v38 = [(NSString *)self->_webMerchantIdentifier copyWithZone:a3];
  webMerchantIdentifier = v5->_webMerchantIdentifier;
  v5->_webMerchantIdentifier = (NSString *)v38;

  uint64_t v40 = [(NSURL *)self->_originURL copyWithZone:a3];
  originURL = v5->_originURL;
  v5->_originURL = (NSURL *)v40;

  v5->_adamIdentifier = self->_adamIdentifier;
  return v5;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (int64_t)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void)setMerchantCategoryCode:(int64_t)a3
{
  self->_merchantCategoryCode = a3;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_uint64_t merchantCategory = a3;
}

- (int64_t)fallbackCategory
{
  return self->_fallbackCategory;
}

- (void)setFallbackCategory:(int64_t)a3
{
  self->_fallbackCategory = a3;
}

- (NSString)rawName
{
  return self->_rawName;
}

- (void)setRawName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)rawCity
{
  return self->_rawCity;
}

- (void)setRawCity:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSString)rawState
{
  return self->_rawState;
}

- (void)setRawState:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)rawCountry
{
  return self->_rawCountry;
}

- (void)setRawCountry:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSString)zipcode
{
  return self->_zipcode;
}

- (void)setZipcode:(id)a3
{
}

- (NSString)rawCANL
{
  return self->_rawCANL;
}

- (void)setRawCANL:(id)a3
{
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  self->_industryCode = a3;
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
}

- (NSString)authNetworkData
{
  return self->_authNetworkData;
}

- (void)setAuthNetworkData:(id)a3
{
}

- (NSString)clearingNetworkData
{
  return self->_clearingNetworkData;
}

- (void)setClearingNetworkData:(id)a3
{
}

- (int64_t)cleanConfidence
{
  return self->_cleanConfidence;
}

- (void)setCleanConfidence:(int64_t)a3
{
  self->_cleanConfidence = a3;
}

- (NSURL)originURL
{
  return self->_originURL;
}

- (void)setOriginURL:(id)a3
{
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (void)setWebMerchantName:(id)a3
{
}

- (int64_t)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(int64_t)a3
{
  self->_adamIdentifier = a3;
}

- (PKMapsMerchant)mapsMerchant
{
  return self->_mapsMerchant;
}

- (void)setMapsMerchant:(id)a3
{
}

- (PKMapsBrand)mapsBrand
{
  return self->_mapsBrand;
}

- (void)setMapsBrand:(id)a3
{
}

- (BOOL)requiresMerchantReprocessing
{
  return self->_requiresMerchantReprocessing;
}

- (void)setRequiresMerchantReprocessing:(BOOL)a3
{
  self->_requiresMerchantReprocessing = a3;
}

- (NSDate)lastMerchantReprocessingDate
{
  return self->_lastMerchantReprocessingDate;
}

- (void)setLastMerchantReprocessingDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMerchantReprocessingDate, 0);
  objc_storeStrong((id *)&self->_mapsBrand, 0);
  objc_storeStrong((id *)&self->_mapsMerchant, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_clearingNetworkData, 0);
  objc_storeStrong((id *)&self->_authNetworkData, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_rawCANL, 0);
  objc_storeStrong((id *)&self->_zipcode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_rawCountry, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_rawState, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_rawCity, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rawName, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end