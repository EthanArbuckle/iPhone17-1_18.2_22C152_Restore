@interface APOdmlServerResponse
+ (BOOL)supportsSecureCoding;
- (APOdmlServerResponse)initWithCoder:(id)a3;
- (APOdmlServerResponse)initWithSLPResponse:(id)a3;
- (APOdmlServerResponse)initWithSRPResponse:(id)a3;
- (APOdmlServerResponse)initWithSRPResponseData:(id)a3;
- (BOOL)odmlEnabled;
- (NSDictionary)featureValues;
- (id)falseFeatureValue;
- (id)oneHotEncode:(id)a3 trueKey:(id)a4;
- (id)trueFeatureValue;
- (int)ageFromBirthYear:(id)a3;
- (void)addAgeRange:(id)a3 birthYear:(id)a4;
- (void)addCachedFeatures:(id)a3 deviceModel:(id)a4;
- (void)addDeviceClass:(id)a3 newFeatureValues:(id)a4;
- (void)addGender:(id)a3 gender:(id)a4;
- (void)addStorefront:(id)a3 storefront:(id)a4;
- (void)addUserRating:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatureValues:(id)a3;
- (void)setOdmlEnabled:(BOOL)a3;
@end

@implementation APOdmlServerResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  v6 = objc_msgSend_featureValues(self, v4, v5);
  objc_msgSend_encodeObject_forKey_(v12, v7, (uint64_t)v6, @"featureValues");

  uint64_t v10 = objc_msgSend_odmlEnabled(self, v8, v9);
  objc_msgSend_encodeBool_forKey_(v12, v11, v10, @"odmlEnabled");
}

- (APOdmlServerResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APOdmlServerResponse;
  v6 = [(APOdmlServerResponse *)&v11 init];
  if (v6)
  {
    v6->_odmlEnabled = objc_msgSend_decodeBoolForKey_(v4, v5, @"odmlEnabled");
    uint64_t v8 = objc_msgSend_decodeObjectForKey_(v4, v7, @"featureValues");
    featureValues = v6->_featureValues;
    v6->_featureValues = (NSDictionary *)v8;
  }
  return v6;
}

- (APOdmlServerResponse)initWithSRPResponse:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APOdmlServerResponse;
  v6 = [(APOdmlServerResponse *)&v11 init];
  if (v6)
  {
    v6->_odmlEnabled = objc_msgSend_isValidResponse_(APOdmlSRPResponseParser, v5, (uint64_t)v4);
    uint64_t v8 = objc_msgSend_parseResponseForFeatureValues_(APOdmlSRPResponseParser, v7, (uint64_t)v4);
    featureValues = v6->_featureValues;
    v6->_featureValues = (NSDictionary *)v8;
  }
  return v6;
}

- (APOdmlServerResponse)initWithSLPResponse:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APOdmlServerResponse;
  v6 = [(APOdmlServerResponse *)&v11 init];
  if (v6)
  {
    v6->_odmlEnabled = objc_msgSend_isValidResponse_(APOdmlSLPResponseParser, v5, (uint64_t)v4);
    uint64_t v8 = objc_msgSend_parseResponseForFeatureValues_(APOdmlSLPResponseParser, v7, (uint64_t)v4);
    featureValues = v6->_featureValues;
    v6->_featureValues = (NSDictionary *)v8;
  }
  return v6;
}

- (APOdmlServerResponse)initWithSRPResponseData:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)APOdmlServerResponse;
  uint64_t v5 = [(APOdmlServerResponse *)&v14 init];
  if (v5)
  {
    v6 = [ADOdmlResponseV2 alloc];
    uint64_t v8 = objc_msgSend_initWithData_(v6, v7, (uint64_t)v4);
    v5->_odmlEnabled = objc_msgSend_isValidResponse_(APOdmlSRPResponseParser, v9, (uint64_t)v8);
    uint64_t v11 = objc_msgSend_parseResponseForFeatureValues_(APOdmlSRPResponseParser, v10, (uint64_t)v8);
    featureValues = v5->_featureValues;
    v5->_featureValues = (NSDictionary *)v11;
  }
  return v5;
}

- (void)addUserRating:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = objc_msgSend_featureValues(self, v6, v7);
  uint64_t v10 = objc_msgSend_initWithDictionary_(v5, v9, (uint64_t)v8);

  if (v4)
  {
    if (objc_msgSend_BOOLValue(v4, v11, v12))
    {
      v22 = @"userratingdisplay_off";
      v13 = kAPOdmlFeatureTypeUserRatingValueOn;
      objc_super v14 = kAPOdmlFeatureTypeUserRatingValueNull;
      v15 = &v22;
    }
    else
    {
      v21 = @"userratingdisplay_on";
      v13 = kAPOdmlFeatureTypeUserRatingValueOff;
      objc_super v14 = kAPOdmlFeatureTypeUserRatingValueNull;
      v15 = &v21;
    }
  }
  else
  {
    v23[0] = @"userratingdisplay_off";
    v13 = kAPOdmlFeatureTypeUserRatingValueNull;
    objc_super v14 = kAPOdmlFeatureTypeUserRatingValueOn;
    v15 = (__CFString **)v23;
  }
  v15[1] = *v14;
  v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v15, 2);
  v18 = objc_msgSend_oneHotEncode_trueKey_(self, v17, (uint64_t)v16, *v13);

  objc_msgSend_addEntriesFromDictionary_(v10, v19, (uint64_t)v18);
  objc_msgSend_setFeatureValues_(self, v20, (uint64_t)v10);
}

- (void)addCachedFeatures:(id)a3 deviceModel:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v12 = objc_msgSend_featureValues(self, v10, v11);
  id v31 = (id)objc_msgSend_initWithDictionary_(v9, v13, (uint64_t)v12);

  objc_msgSend_addDeviceClass_newFeatureValues_(self, v14, (uint64_t)v7, v31);
  v16 = objc_msgSend_objectForKey_(v8, v15, @"it");

  v18 = objc_msgSend_objectForKey_(v16, v17, @"dm");
  v20 = objc_msgSend_objectForKey_(v18, v19, @"13");
  objc_msgSend_addAgeRange_birthYear_(self, v21, (uint64_t)v31, v20);
  v23 = objc_msgSend_objectForKey_(v18, v22, @"17");
  objc_msgSend_addGender_gender_(self, v24, (uint64_t)v31, v23);
  v26 = objc_msgSend_objectForKey_(v18, v25, @"35");
  v28 = objc_msgSend_stringWithFormat_(NSString, v27, @"%@", v26);
  objc_msgSend_addStorefront_storefront_(self, v29, (uint64_t)v31, v28);
  objc_msgSend_setFeatureValues_(self, v30, (uint64_t)v31);
}

- (void)addDeviceClass:(id)a3 newFeatureValues:(id)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = a4;
  if (!v6)
  {
    id v9 = kAPOdmlFeatureTypeDeviceClassNull;
    v21[0] = @"deviceclass_ipad";
    uint64_t v10 = kAPOdmlFeatureTypeDeviceClassIphone;
    uint64_t v11 = kAPOdmlFeatureTypeDeviceClassIpod;
    uint64_t v12 = (__CFString **)v21;
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v6, v7, @"iphone"))
  {
    id v9 = kAPOdmlFeatureTypeDeviceClassIphone;
    v20 = @"deviceclass_ipad";
    uint64_t v10 = kAPOdmlFeatureTypeDeviceClassNull;
    uint64_t v11 = kAPOdmlFeatureTypeDeviceClassIpod;
    uint64_t v12 = &v20;
LABEL_9:
    v13 = *v10;
    v12[1] = *v11;
    v12[2] = v13;
    objc_super v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v12, 3);
    v16 = objc_msgSend_oneHotEncode_trueKey_(self, v15, (uint64_t)v14, *v9);

    objc_msgSend_addEntriesFromDictionary_(v8, v17, (uint64_t)v16);
    goto LABEL_10;
  }
  if (objc_msgSend_isEqualToString_(v6, v7, @"ipad"))
  {
    id v9 = kAPOdmlFeatureTypeDeviceClassIpad;
    v19 = @"deviceclass_iphone";
    uint64_t v10 = kAPOdmlFeatureTypeDeviceClassNull;
    uint64_t v11 = kAPOdmlFeatureTypeDeviceClassIpod;
    uint64_t v12 = &v19;
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v6, v7, @"ipod"))
  {
    id v9 = kAPOdmlFeatureTypeDeviceClassIpod;
    v18 = @"deviceclass_iphone";
    uint64_t v10 = kAPOdmlFeatureTypeDeviceClassNull;
    uint64_t v11 = kAPOdmlFeatureTypeDeviceClassIpad;
    uint64_t v12 = &v18;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)addAgeRange:(id)a3 birthYear:(id)a4
{
  v32[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = a4;
  if (v8)
  {
    unsigned int v9 = objc_msgSend_ageFromBirthYear_(self, v7, (uint64_t)v8);
    if ((int)v9 > 17)
    {
      if (v9 > 0x18)
      {
        if (v9 > 0x22)
        {
          if (v9 > 0x2C)
          {
            if (v9 > 0x36)
            {
              if (v9 > 0x40)
              {
                uint64_t v10 = kAPOdmlFeatureTypeAgeRange65XX;
                uint64_t v11 = kAPOdmlFeatureTypeAgeRange5564;
                uint64_t v12 = kAPOdmlFeatureTypeAgeRange4554;
                v13 = kAPOdmlFeatureTypeAgeRange3544;
                objc_super v14 = kAPOdmlFeatureTypeAgeRange2534;
                v25 = @"agerange_null";
                v15 = kAPOdmlFeatureTypeAgeRange1824;
                v17 = &v25;
              }
              else
              {
                uint64_t v10 = kAPOdmlFeatureTypeAgeRange5564;
                uint64_t v11 = kAPOdmlFeatureTypeAgeRange65XX;
                uint64_t v12 = kAPOdmlFeatureTypeAgeRange4554;
                v13 = kAPOdmlFeatureTypeAgeRange3544;
                objc_super v14 = kAPOdmlFeatureTypeAgeRange2534;
                v26 = @"agerange_null";
                v15 = kAPOdmlFeatureTypeAgeRange1824;
                v17 = &v26;
              }
              v16 = kAPOdmlFeatureTypeAgeRange0017;
            }
            else
            {
              uint64_t v10 = kAPOdmlFeatureTypeAgeRange4554;
              uint64_t v11 = kAPOdmlFeatureTypeAgeRange65XX;
              uint64_t v12 = kAPOdmlFeatureTypeAgeRange5564;
              v13 = kAPOdmlFeatureTypeAgeRange3544;
              objc_super v14 = kAPOdmlFeatureTypeAgeRange2534;
              v27 = @"agerange_null";
              v15 = kAPOdmlFeatureTypeAgeRange1824;
              v16 = kAPOdmlFeatureTypeAgeRange0017;
              v17 = &v27;
            }
          }
          else
          {
            uint64_t v10 = kAPOdmlFeatureTypeAgeRange3544;
            uint64_t v11 = kAPOdmlFeatureTypeAgeRange65XX;
            uint64_t v12 = kAPOdmlFeatureTypeAgeRange5564;
            v13 = kAPOdmlFeatureTypeAgeRange4554;
            objc_super v14 = kAPOdmlFeatureTypeAgeRange2534;
            v28 = @"agerange_null";
            v15 = kAPOdmlFeatureTypeAgeRange1824;
            v16 = kAPOdmlFeatureTypeAgeRange0017;
            v17 = &v28;
          }
        }
        else
        {
          uint64_t v10 = kAPOdmlFeatureTypeAgeRange2534;
          uint64_t v11 = kAPOdmlFeatureTypeAgeRange65XX;
          uint64_t v12 = kAPOdmlFeatureTypeAgeRange5564;
          v13 = kAPOdmlFeatureTypeAgeRange4554;
          objc_super v14 = kAPOdmlFeatureTypeAgeRange3544;
          v29 = @"agerange_null";
          v15 = kAPOdmlFeatureTypeAgeRange1824;
          v16 = kAPOdmlFeatureTypeAgeRange0017;
          v17 = &v29;
        }
      }
      else
      {
        uint64_t v10 = kAPOdmlFeatureTypeAgeRange1824;
        uint64_t v11 = kAPOdmlFeatureTypeAgeRange65XX;
        uint64_t v12 = kAPOdmlFeatureTypeAgeRange5564;
        v13 = kAPOdmlFeatureTypeAgeRange4554;
        objc_super v14 = kAPOdmlFeatureTypeAgeRange3544;
        v30 = @"agerange_null";
        v15 = kAPOdmlFeatureTypeAgeRange2534;
        v16 = kAPOdmlFeatureTypeAgeRange0017;
        v17 = &v30;
      }
    }
    else
    {
      uint64_t v10 = kAPOdmlFeatureTypeAgeRange0017;
      uint64_t v11 = kAPOdmlFeatureTypeAgeRange65XX;
      uint64_t v12 = kAPOdmlFeatureTypeAgeRange5564;
      v13 = kAPOdmlFeatureTypeAgeRange4554;
      objc_super v14 = kAPOdmlFeatureTypeAgeRange3544;
      id v31 = @"agerange_null";
      v15 = kAPOdmlFeatureTypeAgeRange2534;
      v16 = kAPOdmlFeatureTypeAgeRange1824;
      v17 = &v31;
    }
  }
  else
  {
    uint64_t v10 = kAPOdmlFeatureTypeAgeRangeNull;
    uint64_t v11 = kAPOdmlFeatureTypeAgeRange65XX;
    uint64_t v12 = kAPOdmlFeatureTypeAgeRange5564;
    v13 = kAPOdmlFeatureTypeAgeRange4554;
    objc_super v14 = kAPOdmlFeatureTypeAgeRange3544;
    v32[0] = @"agerange_a0017";
    v15 = kAPOdmlFeatureTypeAgeRange2534;
    v16 = kAPOdmlFeatureTypeAgeRange1824;
    v17 = (__CFString **)v32;
  }
  v18 = *v15;
  v17[1] = *v16;
  v17[2] = v18;
  v19 = *v13;
  v17[3] = *v14;
  v17[4] = v19;
  v20 = *v11;
  v17[5] = *v12;
  v17[6] = v20;
  v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v17, 7);
  v23 = objc_msgSend_oneHotEncode_trueKey_(self, v22, (uint64_t)v21, *v10);

  objc_msgSend_addEntriesFromDictionary_(v6, v24, (uint64_t)v23);
}

- (void)addGender:(id)a3 gender:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = a4;
  if (!v8)
  {
    v23[0] = @"gender_female";
    v23[1] = @"gender_male";
    unsigned int v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v23, 2);
    uint64_t v11 = objc_msgSend_oneHotEncode_trueKey_(self, v10, (uint64_t)v9, @"gender_null");

    objc_msgSend_addEntriesFromDictionary_(v6, v12, (uint64_t)v11);
  }
  if (objc_msgSend_isEqualToString_(v8, v7, @"10"))
  {
    v22 = @"gender_female";
    objc_super v14 = kAPOdmlFeatureTypeGenderMale;
    v15 = kAPOdmlFeatureTypeGenderNull;
    v16 = &v22;
LABEL_7:
    v16[1] = *v15;
    v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v16, 2);
    v19 = objc_msgSend_oneHotEncode_trueKey_(self, v18, (uint64_t)v17, *v14);

    objc_msgSend_addEntriesFromDictionary_(v6, v20, (uint64_t)v19);
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v8, v13, @"11"))
  {
    v21 = @"gender_null";
    objc_super v14 = kAPOdmlFeatureTypeGenderFemale;
    v15 = kAPOdmlFeatureTypeGenderMale;
    v16 = &v21;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)addStorefront:(id)a3 storefront:(id)a4
{
  v60[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unsigned int v9 = v7;
  if (!v7)
  {
    uint64_t v11 = kAPOdmlFeatureTypeStorefrontNull;
    uint64_t v12 = kAPOdmlFeatureTypeKRStorefront;
    v13 = kAPOdmlFeatureTypeJPStorefront;
    objc_super v14 = kAPOdmlFeatureTypeESStorefront;
    v15 = kAPOdmlFeatureTypeITStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v60[0] = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = (__CFString **)v60;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v7, v8, @"143441"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeUSStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeCHStorefront;
    v59 = @"storefront_gb143444";
    v22 = kAPOdmlFeatureTypeNZStorefront;
    v23 = kAPOdmlFeatureTypeAUStorefront;
    v24 = &v59;
LABEL_29:
    v36 = (const char *)*v23;
    v37 = *v22;
    v24[1] = (__CFString *)v36;
    v24[2] = v37;
    v38 = *v20;
    v24[3] = *v21;
    v24[4] = v38;
    v39 = *v18;
    v24[5] = *v19;
    v24[6] = v39;
    v40 = *v16;
    v24[7] = *v17;
    v24[8] = v40;
    v41 = *v14;
    v24[9] = *v15;
    v24[10] = v41;
    v42 = *v12;
    v24[11] = *v13;
    v24[12] = v42;
    v43 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v36, (uint64_t)v24, 13);
    v45 = objc_msgSend_oneHotEncode_trueKey_(self, v44, (uint64_t)v43, *v11);

    objc_msgSend_addEntriesFromDictionary_(v6, v46, (uint64_t)v45);
    goto LABEL_30;
  }
  if (objc_msgSend_isEqualToString_(v9, v10, @"143444"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeGBStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeCHStorefront;
    v58 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeNZStorefront;
    v23 = kAPOdmlFeatureTypeAUStorefront;
    v24 = &v58;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v25, @"143460"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeAUStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeCHStorefront;
    v57 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeNZStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v57;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v26, @"143461"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeNZStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeCHStorefront;
    v56 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v56;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v27, @"143459"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeCHStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeMXStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v55 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v55;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v28, @"143468"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeMXStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeCAStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v54 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v54;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v29, @"143455"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeCAStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeDEStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v53 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v53;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v30, @"143443"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeDEStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeFRStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v52 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v52;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v31, @"143442"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeFRStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeITStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v51 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v51;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v32, @"143450"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeITStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeESStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v50 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v50;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v33, @"143454"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeESStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeJPStorefront;
    v15 = kAPOdmlFeatureTypeITStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v49 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v49;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v34, @"143462"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeJPStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeKRStorefront;
    objc_super v14 = kAPOdmlFeatureTypeESStorefront;
    v15 = kAPOdmlFeatureTypeITStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v48 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v48;
    goto LABEL_29;
  }
  if (objc_msgSend_isEqualToString_(v9, v35, @"143466"))
  {
    uint64_t v11 = kAPOdmlFeatureTypeKRStorefront;
    uint64_t v12 = kAPOdmlFeatureTypeStorefrontNull;
    v13 = kAPOdmlFeatureTypeJPStorefront;
    objc_super v14 = kAPOdmlFeatureTypeESStorefront;
    v15 = kAPOdmlFeatureTypeITStorefront;
    v16 = kAPOdmlFeatureTypeFRStorefront;
    v17 = kAPOdmlFeatureTypeDEStorefront;
    v18 = kAPOdmlFeatureTypeCAStorefront;
    v19 = kAPOdmlFeatureTypeMXStorefront;
    v20 = kAPOdmlFeatureTypeCHStorefront;
    v21 = kAPOdmlFeatureTypeNZStorefront;
    v47 = @"storefront_us143441";
    v22 = kAPOdmlFeatureTypeAUStorefront;
    v23 = kAPOdmlFeatureTypeGBStorefront;
    v24 = &v47;
    goto LABEL_29;
  }
LABEL_30:
}

- (id)falseFeatureValue
{
  v2 = objc_msgSend_multiarrayFromArray_(MEMORY[0x1E4F1E9A8], a2, (uint64_t)&unk_1F1506710);
  id v4 = objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E4F1E950], v3, (uint64_t)v2);

  return v4;
}

- (id)trueFeatureValue
{
  v2 = objc_msgSend_multiarrayFromArray_(MEMORY[0x1E4F1E9A8], a2, (uint64_t)&unk_1F1506728);
  id v4 = objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E4F1E950], v3, (uint64_t)v2);

  return v4;
}

- (id)oneHotEncode:(id)a3 trueKey:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9);
  v13 = objc_msgSend_trueFeatureValue(self, v11, v12);
  objc_msgSend_setValue_forKey_(v10, v14, (uint64_t)v13, v7);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v6;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v30, v34, 16);
  if (v17)
  {
    uint64_t v20 = v17;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v15);
        }
        uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v24 = objc_msgSend_falseFeatureValue(self, v18, v19, (void)v30);
        objc_msgSend_setValue_forKey_(v10, v25, (uint64_t)v24, v23);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v30, v34, 16);
    }
    while (v20);
  }

  v28 = objc_msgSend_copy(v10, v26, v27);

  return v28;
}

- (int)ageFromBirthYear:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v7 = objc_msgSend_currentCalendar(v3, v5, v6);
  uint64_t v10 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v8, v9);
  uint64_t v12 = objc_msgSend_components_fromDate_(v7, v11, 28, v10);

  v13 = NSNumber;
  uint64_t v16 = objc_msgSend_year(v12, v14, v15);
  v18 = objc_msgSend_numberWithInteger_(v13, v17, v16);
  LODWORD(v10) = objc_msgSend_intValue(v18, v19, v20);
  int v23 = objc_msgSend_intValue(v4, v21, v22);

  return v10 - v23;
}

- (BOOL)odmlEnabled
{
  return self->_odmlEnabled;
}

- (void)setOdmlEnabled:(BOOL)a3
{
  self->_odmlEnabled = a3;
}

- (NSDictionary)featureValues
{
  return self->_featureValues;
}

- (void)setFeatureValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end