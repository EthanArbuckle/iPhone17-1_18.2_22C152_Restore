@interface UMUserPersonaAttributes
+ (id)currentContextIdentifier;
+ (id)personaAttributes;
+ (id)personaAttributesForPersonaType:(unint64_t)a3;
+ (id)personaAttributesForPersonaType:(unint64_t)a3 withError:(id *)a4;
+ (id)personaAttributesForPersonaUniqueString:(id)a3;
+ (id)personaAttributesForPersonaUniqueString:(id)a3 withError:(id *)a4;
+ (id)setUpPersonaAttributesWithDictionary:(id)a3;
- (BOOL)isDataSeparatedPersona;
- (BOOL)isDefaultPersona;
- (BOOL)isDisabled;
- (BOOL)isEnterprisePersona;
- (BOOL)isGuestPersona;
- (BOOL)isPersonalPersona;
- (BOOL)isSystemPersona;
- (BOOL)isUniversalPersona;
- (NSArray)userPersonaBundleIDList;
- (NSDate)creationDate;
- (NSDate)lastDisableDate;
- (NSDate)lastEnableDate;
- (NSDate)lastLoginDate;
- (NSString)userPersonaDisplayName;
- (NSString)userPersonaUniqueString;
- (NSURL)personaLayoutPathURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sandboxExtensionForPersonaLayoutPath;
- (unint64_t)userPersonaType;
- (unsigned)userPersona_id;
- (void)setCreationDate:(id)a3;
- (void)setIsDataSeparatedPersona:(BOOL)a3;
- (void)setIsDefaultPersona:(BOOL)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsEnterprisePersona:(BOOL)a3;
- (void)setIsGuestPersona:(BOOL)a3;
- (void)setIsPersonalPersona:(BOOL)a3;
- (void)setIsSystemPersona:(BOOL)a3;
- (void)setIsUniversalPersona:(BOOL)a3;
- (void)setLastDisableDate:(id)a3;
- (void)setLastEnableDate:(id)a3;
- (void)setLastLoginDate:(id)a3;
- (void)setPersonaLayoutPathURL:(id)a3;
- (void)setUserPersonaBundleIDList:(id)a3;
- (void)setUserPersonaDisplayName:(id)a3;
- (void)setUserPersonaType:(unint64_t)a3;
- (void)setUserPersonaUniqueString:(id)a3;
- (void)setUserPersona_id:(unsigned int)a3;
@end

@implementation UMUserPersonaAttributes

+ (id)personaAttributes
{
  v2 = sub_190C3A85C();
  v5 = v2;
  if (v2 && (objc_msgSend_userPersonaUniqueString(v2, v3, v4), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = objc_msgSend_personaAttributesForPersonaUniqueString_(UMUserPersonaAttributes, v3, v6);
  }
  else if (objc_msgSend_userPersonaType(v5, v3, v4))
  {
    uint64_t v11 = objc_msgSend_userPersonaType(v5, v9, v10);
    v8 = objc_msgSend_personaAttributesForPersonaType_(UMUserPersonaAttributes, v12, v11);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)setUpPersonaAttributesWithDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(UMUserPersonaAttributes);
    objc_msgSend_setPersonaLayoutPathURL_(v4, v5, 0);
    v7 = objc_msgSend_objectForKeyedSubscript_(v3, v6, (uint64_t)kUMUserPersonaUniqueStringKey);
    objc_msgSend_setUserPersonaUniqueString_(v4, v8, (uint64_t)v7);

    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v3, v9, (uint64_t)kUMUserPersonaIDKey);
    v13 = v10;
    if (v10)
    {
      uint64_t v14 = objc_msgSend_integerValue(v10, v11, v12);
      objc_msgSend_setUserPersona_id_(v4, v15, v14);
    }
    v16 = objc_msgSend_objectForKeyedSubscript_(v3, v11, (uint64_t)kUMUserPersonaTypeKey);
    v19 = v16;
    if (v16)
    {
      uint64_t v20 = objc_msgSend_integerValue(v16, v17, v18);
      objc_msgSend_setUserPersonaType_(v4, v21, v20);
    }
    else
    {
      objc_msgSend_setUserPersonaType_(v4, v17, 1000);
    }
    objc_msgSend_setIsPersonalPersona_(v4, v22, 0);
    objc_msgSend_setIsEnterprisePersona_(v4, v23, 0);
    objc_msgSend_setIsUniversalPersona_(v4, v24, 0);
    objc_msgSend_setIsSystemPersona_(v4, v25, 0);
    objc_msgSend_setIsDefaultPersona_(v4, v26, 0);
    objc_msgSend_setIsGuestPersona_(v4, v27, 0);
    objc_msgSend_setIsDataSeparatedPersona_(v4, v28, 0);
    if (objc_msgSend_userPersonaType(v4, v29, v30))
    {
      if (objc_msgSend_userPersonaType(v4, v31, v32) == 2)
      {
        objc_msgSend_setIsEnterprisePersona_(v4, v33, 1);
        objc_msgSend_setIsDataSeparatedPersona_(v4, v35, 1);
      }
      else if (objc_msgSend_userPersonaType(v4, v33, v34) == 4)
      {
        objc_msgSend_setIsUniversalPersona_(v4, v37, 1);
      }
      else if (objc_msgSend_userPersonaType(v4, v37, v38) == 3)
      {
        objc_msgSend_setIsSystemPersona_(v4, v39, 1);
      }
      else if (objc_msgSend_userPersonaType(v4, v39, v40) == 5)
      {
        objc_msgSend_setIsDefaultPersona_(v4, v36, 1);
      }
    }
    else
    {
      objc_msgSend_setIsPersonalPersona_(v4, v31, 1);
    }
    objc_msgSend_setIsDisabled_(v4, v36, 0);
    v42 = objc_msgSend_objectForKeyedSubscript_(v3, v41, (uint64_t)kUMUserPersonaDisabledKey);
    v45 = v42;
    if (v42 && objc_msgSend_BOOLValue(v42, v43, v44)) {
      objc_msgSend_setIsDisabled_(v4, v43, 1);
    }
    v46 = objc_msgSend_objectForKeyedSubscript_(v3, v43, (uint64_t)kUMUserPersonaDisplayNameKey);
    objc_msgSend_setUserPersonaDisplayName_(v4, v47, (uint64_t)v46);

    v49 = objc_msgSend_objectForKeyedSubscript_(v3, v48, (uint64_t)kUMUserPersonaBundleIDsKey);
    objc_msgSend_setUserPersonaBundleIDList_(v4, v50, (uint64_t)v49);

    v53 = objc_msgSend_objectForKeyedSubscript_(v3, v51, kUMUserSessionHomeDirKey);
    if (v53)
    {
      v54 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v52, (uint64_t)v53, 1);
      objc_msgSend_setPersonaLayoutPathURL_(v4, v55, (uint64_t)v54);
    }
    v56 = objc_msgSend_objectForKeyedSubscript_(v3, v52, kUMUserSessionCreateTimeStampKey);
    objc_msgSend_setCreationDate_(v4, v57, (uint64_t)v56);

    objc_msgSend_setLastEnableDate_(v4, v58, 0);
    objc_msgSend_setLastDisableDate_(v4, v59, 0);
    objc_msgSend_setLastLoginDate_(v4, v60, 0);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)personaAttributesForPersonaUniqueString:(id)a3
{
  return (id)objc_msgSend_personaAttributesForPersonaUniqueString_withError_(a1, a2, (uint64_t)a3, 0);
}

+ (id)personaAttributesForPersonaUniqueString:(id)a3 withError:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v7 = v5;
  if (a4) {
    *a4 = 0;
  }
  if (!v5)
  {
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  v31 = kUMUserPersonaUniqueStringKey;
  v32[0] = v5;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v32, &v31, 1);
  v9 = sub_190C4D8F4();
  id v30 = 0;
  uint64_t v10 = sub_190C54BC0(v9, v8, &v30);
  id v11 = v30;

  if (!v11 && v10) {
    goto LABEL_6;
  }
  v15 = objc_msgSend_domain(v11, v12, v13);
  if (!objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x1E4F28798]))
  {

    goto LABEL_12;
  }
  uint64_t v19 = objc_msgSend_code(v11, v17, v18);

  if (v19 != 2)
  {
LABEL_12:
    v26 = sub_190C3B80C((uint64_t)UMLogMessage, @"personaAttributesForPersonaUniqueString:%@ failed with error %@", v20, v21, v22, v23, v24, v25, (uint64_t)v7);
    uint64_t v27 = sub_190C49DF4();
    goto LABEL_13;
  }
  v26 = sub_190C3B80C((uint64_t)UMLogMessage, @"No persona found with unique string %@", v20, v21, v22, v23, v24, v25, (uint64_t)v7);
  uint64_t v27 = sub_190C3C3A4();
LABEL_13:
  v28 = (void *)v27;
  sub_190C3B464(v27, v26);

  if (a4)
  {
    *a4 = v11;

    uint64_t v14 = 0;
    goto LABEL_15;
  }

  if (!v10)
  {
    uint64_t v14 = 0;
    uint64_t v10 = v11;
    goto LABEL_16;
  }
LABEL_6:
  uint64_t v14 = objc_msgSend_setUpPersonaAttributesWithDictionary_(UMUserPersonaAttributes, v12, (uint64_t)v10);
LABEL_15:

  v8 = v11;
LABEL_16:

LABEL_17:
  return v14;
}

+ (id)personaAttributesForPersonaType:(unint64_t)a3
{
  return (id)objc_msgSend_personaAttributesForPersonaType_withError_(a1, a2, a3, 0);
}

+ (id)personaAttributesForPersonaType:(unint64_t)a3 withError:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  uint64_t v6 = 0;
  if (a3 <= 4 && a3 != 1)
  {
    v7 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], a2, a3);
    v31 = kUMUserPersonaTypeKey;
    v32[0] = v7;
    v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v32, &v31, 1);
    uint64_t v10 = sub_190C4D8F4();
    id v30 = 0;
    id v11 = sub_190C54BC0(v10, v9, &v30);
    id v12 = v30;

    if (v11 && !v12)
    {
      uint64_t v6 = objc_msgSend_setUpPersonaAttributesWithDictionary_(UMUserPersonaAttributes, v13, (uint64_t)v11);
LABEL_16:

      goto LABEL_17;
    }
    v15 = objc_msgSend_domain(v12, v13, v14);
    if (objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x1E4F28798]))
    {
      uint64_t v19 = objc_msgSend_code(v12, v17, v18);

      if (v19 == 2)
      {
        v26 = sub_190C3B80C((uint64_t)UMLogMessage, @"No persona found for the type %lu", v20, v21, v22, v23, v24, v25, a3);
        uint64_t v27 = sub_190C3C3A4();
LABEL_13:
        v28 = (void *)v27;
        sub_190C3B464(v27, v26);

        if (a4) {
          *a4 = v12;
        }

        uint64_t v6 = 0;
        goto LABEL_16;
      }
    }
    else
    {
    }
    v26 = sub_190C3B80C((uint64_t)UMLogMessage, @"personaAttributesForPersonaType for type:%lu failed with error %@", v20, v21, v22, v23, v24, v25, a3);
    uint64_t v27 = sub_190C49DF4();
    goto LABEL_13;
  }
LABEL_17:
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  sub_190C4AAE4(v4, self);
  return v4;
}

+ (id)currentContextIdentifier
{
  int v2 = sub_190C3AB20();
  id v5 = objc_msgSend_sharedManager(UMUserManager, v3, v4);
  v8 = v5;
  if (v2)
  {
    v9 = objc_msgSend_currentUser(v5, v6, v7);

    if (v9)
    {
      uint64_t v12 = objc_msgSend_uid(v9, v10, v11);
      id v13 = [NSString alloc];
      uint64_t v15 = objc_msgSend_initWithFormat_(v13, v14, @"%d", v12);
LABEL_6:
      uint64_t v18 = (void *)v15;
      goto LABEL_8;
    }
  }
  else
  {
    v9 = objc_msgSend_currentPersona(v5, v6, v7);

    if (v9)
    {
      uint64_t v15 = objc_msgSend_userPersonaUniqueString(v9, v16, v17);
      goto LABEL_6;
    }
  }
  uint64_t v18 = 0;
LABEL_8:

  return v18;
}

- (id)description
{
  uint64_t v4 = NSString;
  id v5 = objc_msgSend_userPersonaUniqueString(self, a2, v2);
  uint64_t v8 = objc_msgSend_userPersona_id(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v4, v9, @"%p(Persona Unique String: %@, Persona ID:%d)", self, v5, v8);

  return v10;
}

- (id)sandboxExtensionForPersonaLayoutPath
{
  uint64_t v4 = objc_msgSend_personaLayoutPathURL(self, a2, v2);

  if (v4)
  {
    id v5 = sub_190C4D8F4();
    uint64_t v8 = objc_msgSend_userPersonaUniqueString(self, v6, v7);
    v9 = sub_190C57A24(v5, v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSString)userPersonaUniqueString
{
  return self->_userPersonaUniqueString;
}

- (void)setUserPersonaUniqueString:(id)a3
{
}

- (unint64_t)userPersonaType
{
  return self->_userPersonaType;
}

- (void)setUserPersonaType:(unint64_t)a3
{
  self->_userPersonaType = a3;
}

- (unsigned)userPersona_id
{
  return self->_userPersona_id;
}

- (void)setUserPersona_id:(unsigned int)a3
{
  self->_userPersona_id = a3;
}

- (NSURL)personaLayoutPathURL
{
  return self->_personaLayoutPathURL;
}

- (void)setPersonaLayoutPathURL:(id)a3
{
}

- (BOOL)isEnterprisePersona
{
  return self->_isEnterprisePersona;
}

- (void)setIsEnterprisePersona:(BOOL)a3
{
  self->_isEnterprisePersona = a3;
}

- (BOOL)isPersonalPersona
{
  return self->_isPersonalPersona;
}

- (void)setIsPersonalPersona:(BOOL)a3
{
  self->_isPersonalPersona = a3;
}

- (BOOL)isUniversalPersona
{
  return self->_isUniversalPersona;
}

- (void)setIsUniversalPersona:(BOOL)a3
{
  self->_isUniversalPersona = a3;
}

- (BOOL)isSystemPersona
{
  return self->_isSystemPersona;
}

- (void)setIsSystemPersona:(BOOL)a3
{
  self->_isSystemPersona = a3;
}

- (BOOL)isDefaultPersona
{
  return self->_isDefaultPersona;
}

- (void)setIsDefaultPersona:(BOOL)a3
{
  self->_isDefaultPersona = a3;
}

- (BOOL)isGuestPersona
{
  return self->_isGuestPersona;
}

- (void)setIsGuestPersona:(BOOL)a3
{
  self->_isGuestPersona = a3;
}

- (BOOL)isDataSeparatedPersona
{
  return self->_isDataSeparatedPersona;
}

- (void)setIsDataSeparatedPersona:(BOOL)a3
{
  self->_isDataSeparatedPersona = a3;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (NSArray)userPersonaBundleIDList
{
  return self->_userPersonaBundleIDList;
}

- (void)setUserPersonaBundleIDList:(id)a3
{
}

- (NSString)userPersonaDisplayName
{
  return self->_userPersonaDisplayName;
}

- (void)setUserPersonaDisplayName:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)lastLoginDate
{
  return self->_lastLoginDate;
}

- (void)setLastLoginDate:(id)a3
{
}

- (NSDate)lastDisableDate
{
  return self->_lastDisableDate;
}

- (void)setLastDisableDate:(id)a3
{
}

- (NSDate)lastEnableDate
{
  return self->_lastEnableDate;
}

- (void)setLastEnableDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEnableDate, 0);
  objc_storeStrong((id *)&self->_lastDisableDate, 0);
  objc_storeStrong((id *)&self->_lastLoginDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_userPersonaDisplayName, 0);
  objc_storeStrong((id *)&self->_userPersonaBundleIDList, 0);
  objc_storeStrong((id *)&self->_personaLayoutPathURL, 0);
  objc_storeStrong((id *)&self->_userPersonaUniqueString, 0);
}

@end