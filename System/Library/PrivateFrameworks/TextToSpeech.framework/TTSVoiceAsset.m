@interface TTSVoiceAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)isBuiltInVoice;
- (BOOL)isDownloading;
- (BOOL)isInstalled;
- (BOOL)neural;
- (NSArray)languages;
- (NSString)identifier;
- (NSString)name;
- (NSString)voicePath;
- (TTSVoiceAsset)initWithCoder:(id)a3;
- (TTSVoiceAsset)initWithDictionaryRepresentation:(id)a3;
- (TTSVoiceAsset)initWithName:(id)a3 languages:(id)a4 gender:(int64_t)a5 footprint:(int64_t)a6 isInstalled:(BOOL)a7 isBuiltIn:(BOOL)a8 masteredVersion:(id)a9 compatibilityVersion:(id)a10 neural:(BOOL)a11;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)fileSize;
- (int64_t)footprint;
- (int64_t)gender;
- (int64_t)voiceType;
- (void)encodeWithCoder:(id)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsDownloading:(BOOL)a3;
- (void)setVoicePath:(id)a3;
- (void)setVoiceType:(int64_t)a3;
@end

@implementation TTSVoiceAsset

- (TTSVoiceAsset)initWithName:(id)a3 languages:(id)a4 gender:(int64_t)a5 footprint:(int64_t)a6 isInstalled:(BOOL)a7 isBuiltIn:(BOOL)a8 masteredVersion:(id)a9 compatibilityVersion:(id)a10 neural:(BOOL)a11
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  v52.receiver = self;
  v52.super_class = (Class)TTSVoiceAsset;
  v23 = [(TTSVoiceAsset *)&v52 init];
  if (v23)
  {
    int64_t v43 = a6;
    BOOL v44 = a7;
    BOOL v45 = a8;
    uint64_t v24 = objc_msgSend_copy(v17, v19, v20, v21, v22);
    name = v23->_name;
    v23->_name = (NSString *)v24;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v26 = v18;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v48, (uint64_t)v53, 16);
    if (v28)
    {
      uint64_t v32 = v28;
      uint64_t v33 = *(void *)v49;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v49 != v33) {
            objc_enumerationMutation(v26);
          }
          if (objc_msgSend_containsString_(*(void **)(*((void *)&v48 + 1) + 8 * v34), v29, @"_", v30, v31))
          {
            v35 = AXTTSLogCommon();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
              sub_1A68905CC(&buf, v47, v35);
            }
          }
          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v48, (uint64_t)v53, 16);
      }
      while (v32);
    }

    uint64_t v40 = objc_msgSend_copy(v26, v36, v37, v38, v39);
    languages = v23->_languages;
    v23->_languages = (NSArray *)v40;

    v23->_gender = a5;
    v23->_footprint = v43;
    v23->_isInstalled = v44;
    v23->_isBuiltInVoice = v45;
    v23->_neural = a11;
  }

  return v23;
}

- (id)description
{
  v3 = NSString;
  v34.receiver = self;
  v34.super_class = (Class)TTSVoiceAsset;
  v7 = [(TTSVoiceAsset *)&v34 description];
  name = self->_name;
  languages = self->_languages;
  int64_t gender = self->_gender;
  v11 = @"any";
  if (gender == 2) {
    v11 = @"female";
  }
  if (gender == 1) {
    v12 = @"male";
  }
  else {
    v12 = v11;
  }
  if (self->_footprint == 3) {
    v13 = @"compact";
  }
  else {
    v13 = @"premium";
  }
  v14 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_neural, v5, v6);
  id v18 = objc_msgSend_numberWithBool_(NSNumber, v15, self->_isInstalled, v16, v17);
  v23 = objc_msgSend_masteredVersion(self, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_compatibilityVersion(self, v24, v25, v26, v27);
  uint64_t v32 = objc_msgSend_stringWithFormat_(v3, v29, @"%@ Name: %@, Languages: %@, Gender: %@, Footprint: %@, Neural: %@, Installed: %@, Version: %@/%@", v30, v31, v7, name, languages, v12, v13, v14, v18, v23, v28);

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)name, @"_name", v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_languages, @"_languages", v9);
  objc_msgSend_encodeInteger_forKey_(v5, v10, self->_gender, @"_gender", v11);
  objc_msgSend_encodeInteger_forKey_(v5, v12, self->_footprint, @"_footprint", v13);
  objc_msgSend_encodeBool_forKey_(v5, v14, self->_isInstalled, @"_isInstalled", v15);
  objc_msgSend_encodeBool_forKey_(v5, v16, self->_isBuiltInVoice, @"_isBuiltInVoice", v17);
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)self->_voicePath, @"_voicePath", v19);
  objc_msgSend_encodeBool_forKey_(v5, v20, self->_neural, @"_neural", v21);
  objc_msgSend_numberWithLongLong_(NSNumber, v22, self->_fileSize, v23, v24);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)v27, @"fileSizeWithNumber", v26);
}

- (TTSVoiceAsset)initWithCoder:(id)a3
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)TTSVoiceAsset;
  id v5 = [(TTSVoiceAsset *)&v52 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_name", v8);
    name = v5->_name;
    v5->_name = (NSString *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v53, 2, v13);
    id v18 = objc_msgSend_setWithArray_(v11, v15, (uint64_t)v14, v16, v17);
    uint64_t v21 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, @"_languages", v20);
    languages = v5->_languages;
    v5->_languages = (NSArray *)v21;

    v5->_int64_t gender = objc_msgSend_decodeIntegerForKey_(v4, v23, @"_gender", v24, v25);
    v5->_footprint = objc_msgSend_decodeIntegerForKey_(v4, v26, @"_footprint", v27, v28);
    v5->_isInstalled = objc_msgSend_decodeBoolForKey_(v4, v29, @"_isInstalled", v30, v31);
    v5->_isBuiltInVoice = objc_msgSend_decodeBoolForKey_(v4, v32, @"_isBuiltInVoice", v33, v34);
    uint64_t v35 = objc_opt_class();
    uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, @"_voicePath", v37);
    voicePath = v5->_voicePath;
    v5->_voicePath = (NSString *)v38;

    v5->_neural = objc_msgSend_decodeBoolForKey_(v4, v40, @"_neural", v41, v42);
    uint64_t v43 = objc_opt_class();
    v46 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, @"fileSizeWithNumber", v45);
    v5->_fileSize = objc_msgSend_integerValue(v46, v47, v48, v49, v50);
  }
  return v5;
}

- (TTSVoiceAsset)initWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_objectForKey_(v3, v4, @"Name", v5, v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  uint64_t v13 = objc_msgSend_objectForKey_(v3, v10, @"Languages", v11, v12);
  objc_opt_class();
  id v18 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = objc_msgSend_lastObject(v13, v14, v15, v16, v17);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v20 = v13;
    }
    else {
      uint64_t v20 = 0;
    }
    id v18 = v20;
  }
  uint64_t v21 = objc_msgSend_objectForKey_(v3, v14, @"Gender", v16, v17);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v26 = objc_msgSend_integerValue(v21, v22, v23, v24, v25);
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v3, v22, @"neural", v24, v25);
  char v32 = objc_msgSend_BOOLValue(v27, v28, v29, v30, v31);

  v36 = objc_msgSend_objectForKeyedSubscript_(v3, v33, @"MasteredVersion", v34, v35);
  uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v3, v37, @"CompatabilityVersion", v38, v39);
  char v52 = v32;
  isBuiltIn_masteredVersion_compatibilityVersion_neural = objc_msgSend_initWithName_languages_gender_footprint_isInstalled_isBuiltIn_masteredVersion_compatibilityVersion_neural_(self, v41, (uint64_t)v9, (uint64_t)v18, v26, 1, 0, 1, v36, v40, v52);

  uint64_t v43 = isBuiltIn_masteredVersion_compatibilityVersion_neural;
  v47 = objc_msgSend_objectForKeyedSubscript_(v3, v44, @"VoicePath", v45, v46);
  objc_msgSend_setVoicePath_(v43, v48, (uint64_t)v47, v49, v50);

  return v43;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = v3;
  name = self->_name;
  if (name) {
    objc_msgSend_setObject_forKey_(v3, v4, (uint64_t)name, @"Name", v6);
  }
  languages = self->_languages;
  if (languages) {
    objc_msgSend_setObject_forKey_(v7, v4, (uint64_t)languages, @"Languages", v6);
  }
  v10 = objc_msgSend_numberWithInteger_(NSNumber, v4, self->_gender, v5, v6);
  objc_msgSend_setObject_forKey_(v7, v11, (uint64_t)v10, @"Gender", v12);

  uint64_t v16 = objc_msgSend_numberWithBool_(NSNumber, v13, self->_neural, v14, v15);
  objc_msgSend_setObject_forKey_(v7, v17, (uint64_t)v16, @"neural", v18);

  uint64_t v23 = objc_msgSend_contentVersion(self, v19, v20, v21, v22);

  if (v23)
  {
    uint64_t v28 = objc_msgSend_contentVersion(self, v24, v25, v26, v27);
    objc_msgSend_setObject_forKey_(v7, v29, (uint64_t)v28, @"ContentVersion", v30);
  }
  uint64_t v31 = objc_msgSend_masteredVersion(self, v24, v25, v26, v27);

  if (v31)
  {
    v36 = objc_msgSend_masteredVersion(self, v32, v33, v34, v35);
    objc_msgSend_setObject_forKey_(v7, v37, (uint64_t)v36, @"MasteredVersion", v38);
  }
  uint64_t v39 = objc_msgSend_compatibilityVersion(self, v32, v33, v34, v35);

  if (v39)
  {
    BOOL v44 = objc_msgSend_compatibilityVersion(self, v40, v41, v42, v43);
    objc_msgSend_setObject_forKey_(v7, v45, (uint64_t)v44, @"CompatabilityVersion", v46);
  }
  v47 = objc_msgSend_voicePath(self, v40, v41, v42, v43);

  if (v47)
  {
    char v52 = objc_msgSend_voicePath(self, v48, v49, v50, v51);
    objc_msgSend_setObject_forKey_(v7, v53, (uint64_t)v52, @"VoicePath", v54);
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)languages
{
  return self->_languages;
}

- (int64_t)gender
{
  return self->_gender;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (BOOL)neural
{
  return self->_neural;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isDownloading
{
  return self->_isDownloading;
}

- (void)setIsDownloading:(BOOL)a3
{
  self->_isDownloading = a3;
}

- (BOOL)isBuiltInVoice
{
  return self->_isBuiltInVoice;
}

- (NSString)voicePath
{
  return self->_voicePath;
}

- (void)setVoicePath:(id)a3
{
}

- (int64_t)voiceType
{
  return self->_voiceType;
}

- (void)setVoiceType:(int64_t)a3
{
  self->_voiceType = a3;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicePath, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end