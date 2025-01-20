@interface TTSVoiceResourceAsset
+ (BOOL)supportsSecureCoding;
+ (id)legacyPlatforms;
- (NSArray)languages;
- (NSArray)resourceList;
- (NSDictionary)voiceConfig;
- (NSURL)searchPathURL;
- (TTSVoiceResourceAsset)initWithCoder:(id)a3;
- (id)defaultFootprintString;
- (id)defaultTypeString;
- (id)defaultVoice;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLanguages:(id)a3;
- (void)setResourceList:(id)a3;
- (void)setSearchPathURL:(id)a3;
- (void)setVoiceConfig:(id)a3;
- (void)syncWithConfigData:(id)a3 voiceType:(int64_t)a4;
- (void)syncWithConfigFile:(id)a3 voiceType:(int64_t)a4;
@end

@implementation TTSVoiceResourceAsset

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_componentsJoinedByString_(self->_languages, a2, @", ", v2, v3);
  v11 = objc_msgSend_contentVersion(self, v7, v8, v9, v10);
  v16 = objc_msgSend_masteredVersion(self, v12, v13, v14, v15);
  v20 = objc_msgSend_stringWithFormat_(v5, v17, @"Voice resource, Languages: %@, ContentVersion: %@, MasteredVersion: %@", v18, v19, v6, v11, v16);

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TTSVoiceResourceAsset;
  id v4 = a3;
  [(TTSAssetBase *)&v9 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_languages, @"_languages", v6, v9.receiver, v9.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_searchPathURL, @"_searchPathURL", v8);
}

- (TTSVoiceResourceAsset)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TTSVoiceResourceAsset;
  v5 = [(TTSAssetBase *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_super v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v25, 2, v8);
    uint64_t v13 = objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11, v12);
    uint64_t v16 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, @"_languages", v15);
    languages = v5->_languages;
    v5->_languages = (NSArray *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"_searchPathURL", v20);
    searchPathURL = v5->_searchPathURL;
    v5->_searchPathURL = (NSURL *)v21;
  }
  return v5;
}

+ (id)legacyPlatforms
{
  if (qword_1E96C47C0 != -1) {
    dispatch_once(&qword_1E96C47C0, &unk_1EFB80360);
  }
  uint64_t v2 = (void *)qword_1E96C47B8;

  return v2;
}

- (void)syncWithConfigFile:(id)a3 voiceType:(int64_t)a4
{
  objc_msgSend_dictionaryWithContentsOfURL_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)a3, a4, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncWithConfigData_voiceType_(self, v7, (uint64_t)v9, a4, v8);
}

- (void)syncWithConfigData:(id)a3 voiceType:(int64_t)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v11 = v6;
  if (v6)
  {
    uint64_t v12 = objc_msgSend_allKeys(v6, v7, v8, v9, v10);
    int v16 = objc_msgSend_containsObject_(v12, v13, @"ax_resources", v14, v15);

    v65 = self;
    uint64_t v66 = (uint64_t)v11;
    if (v16)
    {
      v23 = objc_msgSend_objectForKeyedSubscript_(v11, v17, @"ax_resources", v18, v19);
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4) {
        objc_msgSend_objectForKeyedSubscript_(v11, v20, @"ax_gryphon_resource_order", v21, v22);
      }
      else {
      objc_super v24 = objc_msgSend_objectForKeyedSubscript_(v11, v20, @"ax_compact_resource_order", v21, v22);
      }
    }
    else
    {
      objc_super v24 = objc_msgSend_objectForKeyedSubscript_(v11, v17, @"vocalizer_resource_order", v18, v19);
      v23 = objc_msgSend_objectForKeyedSubscript_(v11, v25, @"vocalizer_resources", v26, v27);
    }
    v32 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v28, v29, v30, v31);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v37 = objc_msgSend_allKeys(v23, v33, v34, v35, v36);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = sub_1A6704620;
    v67[3] = &unk_1E5C69BE8;
    id v38 = v24;
    id v68 = v38;
    v42 = objc_msgSend_sortedArrayUsingComparator_(v37, v39, (uint64_t)v67, v40, v41);

    uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v69, (uint64_t)v75, 16);
    if (v44)
    {
      uint64_t v48 = v44;
      uint64_t v49 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v70 != v49) {
            objc_enumerationMutation(v42);
          }
          uint64_t v51 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          if (objc_msgSend_containsObject_(v38, v45, v51, v46, v47))
          {
            v73[0] = @"filename";
            v73[1] = @"mime-type";
            v74[0] = v51;
            v52 = objc_msgSend_objectForKeyedSubscript_(v23, v45, v51, v46, v47);
            v74[1] = v52;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v53, (uint64_t)v74, (uint64_t)v73, 2);
            v55 = v54 = v23;
            objc_msgSend_addObject_(v32, v56, (uint64_t)v55, v57, v58);

            v23 = v54;
          }
        }
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v69, (uint64_t)v75, 16);
      }
      while (v48);
    }

    objc_msgSend_setResourceList_(v65, v59, (uint64_t)v32, v60, v61);
    uint64_t v11 = (void *)v66;
    objc_msgSend_setVoiceConfig_(v65, v62, v66, v63, v64);
  }
}

- (id)defaultVoice
{
  v5 = objc_msgSend_voiceConfig(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"_voices", v7, v8);

  if (!v9)
  {
    v23 = 0;
    goto LABEL_14;
  }
  if (qword_1E96C47D0 != -1) {
    dispatch_once(&qword_1E96C47D0, &unk_1EFB80520);
  }
  if (byte_1E96C47C8 && CFPreferencesGetAppBooleanValue(@"DisableGryphon", @"com.apple.voiced", 0)
    || (objc_msgSend_legacyPlatforms(TTSVoiceResourceAsset, v10, v11, v12, v13),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = (void *)MGCopyAnswer(),
        char v19 = objc_msgSend_containsObject_(v14, v16, (uint64_t)v15, v17, v18),
        v15,
        v14,
        (v19 & 1) != 0))
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v10, @"legacy", v12, v13);
    goto LABEL_8;
  }
  if (MGGetProductType() == 4240173202)
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v20, @"premiumhigh", v21, v22);
    v23 = LABEL_8:;
    if (v23) {
      goto LABEL_14;
    }
  }
  v23 = objc_msgSend_objectForKeyedSubscript_(v9, v20, @"default", v21, v22);
LABEL_14:

  return v23;
}

- (id)defaultTypeString
{
  v5 = objc_msgSend_defaultVoice(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"Type", v7, v8);

  return v9;
}

- (id)defaultFootprintString
{
  v5 = objc_msgSend_defaultVoice(self, a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"Footprint", v7, v8);

  return v9;
}

- (NSArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
}

- (NSArray)resourceList
{
  return self->_resourceList;
}

- (void)setResourceList:(id)a3
{
}

- (NSURL)searchPathURL
{
  return self->_searchPathURL;
}

- (void)setSearchPathURL:(id)a3
{
}

- (NSDictionary)voiceConfig
{
  return self->_voiceConfig;
}

- (void)setVoiceConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceConfig, 0);
  objc_storeStrong((id *)&self->_searchPathURL, 0);
  objc_storeStrong((id *)&self->_resourceList, 0);

  objc_storeStrong((id *)&self->_languages, 0);
}

@end