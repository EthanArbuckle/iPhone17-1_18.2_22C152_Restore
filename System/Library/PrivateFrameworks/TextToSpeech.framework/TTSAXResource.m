@interface TTSAXResource
+ (BOOL)supportsSecureCoding;
+ (id)localizedName:(id)a3 forLanguage:(id)a4;
+ (id)localizedNameWithFootprint:(int64_t)a3 name:(id)a4;
+ (id)localizedStringForKey:(id)a3;
+ (id)siriLocalizedNameForName:(id)a3 identifier:(id)a4 includeSiri:(BOOL)a5;
- (AVSpeechSynthesisProviderVoice)synthesisProviderVoice;
- (AXAsset)axAsset;
- (BOOL)canBeDownloaded;
- (BOOL)isDefault;
- (BOOL)isInstalled;
- (BOOL)isNoveltyVoice;
- (BOOL)isPersonalVoice;
- (BOOL)isSystemVoice;
- (BOOL)isValid;
- (BOOL)memoryPeakExceedsActiveJetsamLimit;
- (BOOL)shouldFilterResourceFromUI;
- (NSArray)languages;
- (NSString)assetId;
- (NSString)componentSubType;
- (NSString)contentPath;
- (NSString)identifier;
- (NSString)localizedName;
- (NSString)localizedNameWithFootprint;
- (NSString)name;
- (NSString)onDiskContentPath;
- (NSString)serviceIdentifier;
- (NSString)synthesizerBundleIdentifier;
- (NSString)voiceId;
- (TTSAXResource)initWithAsset:(id)a3;
- (TTSAXResource)initWithCoder:(id)a3;
- (TTSAXResource)initWithData:(id)a3;
- (TTSAXResource)initWithSSEVoice:(id)a3;
- (TTSSpeechService)service;
- (TTSVoiceAsset)voiceAsset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localizedNameForLanguage:(id)a3;
- (id)primaryLanguage;
- (int64_t)_resourceFootprintFromStringInput:(id)a3;
- (int64_t)_resourceGenderFromStringInput:(id)a3;
- (int64_t)footprint;
- (int64_t)gender;
- (int64_t)memoryPeak;
- (int64_t)voiceType;
- (unint64_t)_resourceSubtypeFromStringInput:(id)a3;
- (unint64_t)_resourceTypeFromStringInput:(id)a3;
- (unint64_t)assetSize;
- (unint64_t)subtype;
- (unint64_t)type;
- (void)_ensureFirstPartyComponents;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetId:(id)a3;
- (void)setAssetSize:(unint64_t)a3;
- (void)setAxAsset:(id)a3;
- (void)setCanBeDownloaded:(BOOL)a3;
- (void)setComponentSubType:(id)a3;
- (void)setFootprint:(int64_t)a3;
- (void)setIsInstalled:(BOOL)a3;
- (void)setIsSystemVoice:(BOOL)a3;
- (void)setMemoryPeak:(int64_t)a3;
- (void)setOnDiskContentPath:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setSynthesisProviderVoice:(id)a3;
- (void)setSynthesizerBundleIdentifier:(id)a3;
- (void)setVoiceAsset:(id)a3;
@end

@implementation TTSAXResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentSubType, 0);
  objc_storeStrong((id *)&self->_synthesizerBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_synthesisProviderVoice, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_onDiskContentPath, 0);
  objc_storeStrong((id *)&self->_voiceId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_voiceAsset, 0);

  objc_storeStrong((id *)&self->_axAsset, 0);
}

- (TTSAXResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)TTSAXResource;
  v5 = [(TTSAXResource *)&v87 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"Name", v8);
    name = v5->_name;
    v5->_name = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"VoiceId", v13);
    voiceId = v5->_voiceId;
    v5->_voiceId = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v22 = objc_msgSend_setWithObjects_(v16, v19, v17, v20, v21, v18, 0);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v22, @"Languages", v24);
    languages = v5->_languages;
    v5->_languages = (NSArray *)v25;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v27, @"Type", v28, v29);
    v5->_subtype = objc_msgSend_decodeIntegerForKey_(v4, v30, @"Subtype", v31, v32);
    v5->_footprint = objc_msgSend_decodeIntegerForKey_(v4, v33, @"Footprint", v34, v35);
    v5->_gender = objc_msgSend_decodeIntegerForKey_(v4, v36, @"Gender", v37, v38);
    uint64_t v39 = objc_opt_class();
    uint64_t v42 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, @"synthesizerBundleIdentifier", v41);
    synthesizerBundleIdentifier = v5->_synthesizerBundleIdentifier;
    v5->_synthesizerBundleIdentifier = (NSString *)v42;

    uint64_t v44 = objc_opt_class();
    uint64_t v47 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, @"componentSubType", v46);
    componentSubType = v5->_componentSubType;
    v5->_componentSubType = (NSString *)v47;

    uint64_t v49 = objc_opt_class();
    v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v50, v49, @"AssetSize", v51);
    v5->_assetSize = objc_msgSend_unsignedIntegerValue(v52, v53, v54, v55, v56);

    v5->_isInstalled = objc_msgSend_decodeBoolForKey_(v4, v57, @"IsInstalled", v58, v59);
    v5->_canBeDownloaded = objc_msgSend_decodeBoolForKey_(v4, v60, @"CanBeDownloaded", v61, v62);
    uint64_t v63 = objc_opt_class();
    uint64_t v66 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v64, v63, @"AssetId", v65);
    assetId = v5->_assetId;
    v5->_assetId = (NSString *)v66;

    v5->_memoryPeak = objc_msgSend_decodeIntegerForKey_(v4, v68, @"MemoryPeak", v69, v70);
    v5->_isNoveltyVoice = objc_msgSend_decodeBoolForKey_(v4, v71, @"NoveltyVoice", v72, v73);
    v5->_isPersonalVoice = objc_msgSend_decodeBoolForKey_(v4, v74, @"PersonalVoice", v75, v76);
    objc_msgSend__ensureFirstPartyComponents(v5, v77, v78, v79, v80);
    uint64_t v81 = objc_opt_class();
    uint64_t v84 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, @"_synthesisProviderVoice", v83);
    synthesisProviderVoice = v5->_synthesisProviderVoice;
    v5->_synthesisProviderVoice = (AVSpeechSynthesisProviderVoice *)v84;
  }
  return v5;
}

- (void)_ensureFirstPartyComponents
{
  if (!self->_componentSubType || !self->_synthesizerBundleIdentifier)
  {
    unint64_t type = self->_type;
    if (type <= 0xA)
    {
      if (((1 << type) & 0x4D0) != 0)
      {
        if (TTSUseMauiSSE())
        {
          synthesizerBundleIdentifier = self->_synthesizerBundleIdentifier;
          self->_synthesizerBundleIdentifier = (NSString *)@"com.apple.ax.MauiTTSSupport.MauiAUSP";
          v5 = @"crnc";
LABEL_13:

          componentSubType = self->_componentSubType;
          self->_componentSubType = &v5->isa;

          return;
        }
      }
      else
      {
        if (type == 2)
        {
          synthesizerBundleIdentifier = self->_synthesizerBundleIdentifier;
          self->_synthesizerBundleIdentifier = (NSString *)@"com.apple.speech.MacinTalkFramework.MacinTalkAUSP";
          v5 = @"mctk";
          goto LABEL_13;
        }
        if (type != 3) {
          return;
        }
      }
      if (!TTSUseSiriSSE()) {
        return;
      }
      synthesizerBundleIdentifier = self->_synthesizerBundleIdentifier;
      self->_synthesizerBundleIdentifier = (NSString *)@"com.apple.texttospeech.SiriAUSP";
      v5 = @"axsr";
      goto LABEL_13;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  uint64_t v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  v19 = objc_msgSend_name(self, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_copy(v19, v20, v21, v22, v23);
  uint64_t v25 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v24;

  v30 = objc_msgSend_voiceId(self, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_copy(v30, v31, v32, v33, v34);
  v36 = *(void **)(v14 + 48);
  *(void *)(v14 + 48) = v35;

  uint64_t v41 = objc_msgSend_languages(self, v37, v38, v39, v40);
  uint64_t v46 = objc_msgSend_copy(v41, v42, v43, v44, v45);
  uint64_t v47 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = v46;

  *(void *)(v14 + 72) = objc_msgSend_type(self, v48, v49, v50, v51);
  *(void *)(v14 + 80) = objc_msgSend_subtype(self, v52, v53, v54, v55);
  *(void *)(v14 + 88) = objc_msgSend_footprint(self, v56, v57, v58, v59);
  *(void *)(v14 + 96) = objc_msgSend_gender(self, v60, v61, v62, v63);
  *(unsigned char *)(v14 + 8) = objc_msgSend_isNoveltyVoice(self, v64, v65, v66, v67);
  *(unsigned char *)(v14 + 9) = objc_msgSend_isPersonalVoice(self, v68, v69, v70, v71);
  uint64_t v76 = objc_msgSend_synthesizerBundleIdentifier(self, v72, v73, v74, v75);
  v77 = *(void **)(v14 + 136);
  *(void *)(v14 + 136) = v76;

  uint64_t v82 = objc_msgSend_componentSubType(self, v78, v79, v80, v81);
  uint64_t v83 = *(void **)(v14 + 144);
  *(void *)(v14 + 144) = v82;

  *(void *)(v14 + 152) = objc_msgSend_assetSize(self, v84, v85, v86, v87);
  *(unsigned char *)(v14 + 12) = objc_msgSend_isInstalled(self, v88, v89, v90, v91);
  *(unsigned char *)(v14 + 11) = objc_msgSend_canBeDownloaded(self, v92, v93, v94, v95);
  uint64_t v100 = objc_msgSend_assetId(self, v96, v97, v98, v99);
  v101 = *(void **)(v14 + 64);
  *(void *)(v14 + 64) = v100;

  *(void *)(v14 + 104) = objc_msgSend_memoryPeak(self, v102, v103, v104, v105);
  objc_storeStrong((id *)(v14 + 112), self->_synthesisProviderVoice);
  v110 = objc_msgSend_onDiskContentPath(self, v106, v107, v108, v109);
  uint64_t v115 = objc_msgSend_copy(v110, v111, v112, v113, v114);
  v116 = *(void **)(v14 + 56);
  *(void *)(v14 + 56) = v115;

  return (id)v14;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (BOOL)isPersonalVoice
{
  return self->_isPersonalVoice;
}

- (BOOL)isNoveltyVoice
{
  return self->_isNoveltyVoice;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)voiceId
{
  return self->_voiceId;
}

- (BOOL)isInstalled
{
  uint64_t v6 = objc_msgSend_voiceAsset(self, a2, v2, v3, v4);

  if (v6)
  {
    uint64_t v11 = objc_msgSend_voiceAsset(self, v7, v8, v9, v10);
LABEL_5:
    uint64_t v21 = v11;
    char isInstalled = objc_msgSend_isInstalled(v11, v12, v13, v14, v15);

    return isInstalled;
  }
  uint64_t v16 = objc_msgSend_axAsset(self, v7, v8, v9, v10);

  if (v16)
  {
    uint64_t v11 = objc_msgSend_axAsset(self, v17, v18, v19, v20);
    goto LABEL_5;
  }
  return (objc_msgSend_isSystemVoice(self, v17, v18, v19, v20) & 1) != 0
      || objc_msgSend_type(self, v24, v25, v26, v27) == 9
      || self->_isInstalled;
}

- (AXAsset)axAsset
{
  return self->_axAsset;
}

- (int64_t)footprint
{
  uint64_t v10 = objc_msgSend_voiceAsset(self, a2, v2, v3, v4);
  if (v10)
  {
    uint64_t v11 = objc_msgSend_voiceAsset(self, v6, v7, v8, v9);
    int64_t footprint = objc_msgSend_footprint(v11, v12, v13, v14, v15);
  }
  else
  {
    int64_t footprint = self->_footprint;
  }

  return footprint;
}

- (TTSVoiceAsset)voiceAsset
{
  return self->_voiceAsset;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)synthesizerBundleIdentifier
{
  return self->_synthesizerBundleIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (id)primaryLanguage
{
  uint64_t v6 = objc_msgSend_languages(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_count(v6, v7, v8, v9, v10);

  if (v11)
  {
    uint64_t v16 = objc_msgSend_languages(self, v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_firstObject(v16, v17, v18, v19, v20);
    uint64_t v22 = AXCLanguageConvertToCanonicalForm();
  }
  else
  {
    uint64_t v23 = AXTTSLogResourceManager();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1A688D7D4((uint64_t)self, v23);
    }

    uint64_t v22 = 0;
  }

  return v22;
}

- (NSArray)languages
{
  return self->_languages;
}

- (NSString)componentSubType
{
  return self->_componentSubType;
}

- (BOOL)canBeDownloaded
{
  v5 = self;
  uint64_t v6 = objc_msgSend_axAsset(self, a2, v2, v3, v4);

  if (v6)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    uint64_t v11 = objc_msgSend_voiceAsset(v5, v7, v8, v9, v10);

    if (v11)
    {
      uint64_t v16 = objc_msgSend_voiceAsset(v5, v12, v13, v14, v15);
      LODWORD(v5) = objc_msgSend_isBuiltInVoice(v16, v17, v18, v19, v20) ^ 1;
    }
    else
    {
      LOBYTE(v5) = v5->_canBeDownloaded;
    }
  }
  return (char)v5;
}

- (int64_t)memoryPeak
{
  return self->_memoryPeak;
}

- (unint64_t)assetSize
{
  if (objc_msgSend_type(self, a2, v2, v3, v4) == 3 || objc_msgSend_type(self, v6, v7, v8, v9) == 10)
  {
    uint64_t v10 = objc_msgSend_voiceAsset(self, v6, v7, v8, v9);

    if (v10)
    {
      uint64_t v11 = objc_msgSend_voiceAsset(self, v6, v7, v8, v9);
      unint64_t v16 = objc_msgSend_fileSize(v11, v12, v13, v14, v15);
LABEL_5:

      return v16;
    }
  }
  if (objc_msgSend_isInstalled(self, v6, v7, v8, v9))
  {
    uint64_t v21 = objc_msgSend_axAsset(self, v17, v18, v19, v20);

    if (v21)
    {
      uint64_t v22 = objc_msgSend_axAsset(self, v17, v18, v19, v20);
      uint64_t v27 = objc_msgSend_unarchivedFileSize(v22, v23, v24, v25, v26);
      unint64_t v16 = objc_msgSend_unsignedIntegerValue(v27, v28, v29, v30, v31);

      if (v16) {
        return v16;
      }
      uint64_t v11 = objc_msgSend_axAsset(self, v32, v33, v34, v35);
      uint64_t v40 = objc_msgSend_computedOnDiskSize(v11, v36, v37, v38, v39);
      unint64_t v16 = objc_msgSend_unsignedIntValue(v40, v41, v42, v43, v44);

      goto LABEL_5;
    }
  }
  if ((objc_msgSend_isInstalled(self, v17, v18, v19, v20) & 1) == 0)
  {
    uint64_t v49 = objc_msgSend_axAsset(self, v45, v46, v47, v48);

    if (v49)
    {
      uint64_t v54 = objc_msgSend_axAsset(self, v50, v51, v52, v53);
      uint64_t v59 = objc_msgSend_downloadSize(v54, v55, v56, v57, v58);
      unint64_t v64 = objc_msgSend_unsignedIntegerValue(v59, v60, v61, v62, v63);

      return v64;
    }
  }
  return self->_assetSize;
}

- (TTSAXResource)initWithData:(id)a3
{
  id v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)TTSAXResource;
  uint64_t v9 = [(TTSAXResource *)&v87 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_objectForKey_(v4, v5, @"Name", v7, v8);
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v15 = objc_msgSend_objectForKey_(v4, v12, @"VoiceId", v13, v14);
    voiceId = v9->_voiceId;
    v9->_voiceId = (NSString *)v15;

    uint64_t v20 = objc_msgSend_objectForKey_(v4, v17, @"Languages", v18, v19);
    languages = v9->_languages;
    v9->_languages = (NSArray *)v20;

    uint64_t v25 = objc_msgSend_objectForKey_(v4, v22, @"Type", v23, v24);
    v9->_unint64_t type = objc_msgSend__resourceTypeFromStringInput_(v9, v26, (uint64_t)v25, v27, v28);

    uint64_t v32 = objc_msgSend_objectForKey_(v4, v29, @"Subtype", v30, v31);
    v9->_subunint64_t type = objc_msgSend__resourceSubtypeFromStringInput_(v9, v33, (uint64_t)v32, v34, v35);

    uint64_t v39 = objc_msgSend_objectForKey_(v4, v36, @"Footprint", v37, v38);
    v9->_int64_t footprint = objc_msgSend__resourceFootprintFromStringInput_(v9, v40, (uint64_t)v39, v41, v42);

    uint64_t v46 = objc_msgSend_objectForKey_(v4, v43, @"Gender", v44, v45);
    v9->_gender = objc_msgSend__resourceGenderFromStringInput_(v9, v47, (uint64_t)v46, v48, v49);

    uint64_t v53 = objc_msgSend_objectForKey_(v4, v50, @"NoveltyVoice", v51, v52);
    v9->_isNoveltyVoice = objc_msgSend_BOOLValue(v53, v54, v55, v56, v57);

    v9->_isPersonalVoice = objc_msgSend_hasPrefix_(v9->_voiceId, v58, @"com.apple.speech.personalvoice", v59, v60);
    uint64_t v64 = objc_msgSend_objectForKey_(v4, v61, @"synthesizerBundleIdentifier", v62, v63);
    synthesizerBundleIdentifier = v9->_synthesizerBundleIdentifier;
    v9->_synthesizerBundleIdentifier = (NSString *)v64;

    uint64_t v69 = objc_msgSend_objectForKey_(v4, v66, @"componentSubType", v67, v68);
    componentSubType = v9->_componentSubType;
    v9->_componentSubType = (NSString *)v69;

    uint64_t v74 = objc_msgSend_objectForKey_(v4, v71, @"MemoryPeak", v72, v73);
    v9->_memoryPeak = objc_msgSend_integerValue(v74, v75, v76, v77, v78);

    objc_msgSend__ensureFirstPartyComponents(v9, v79, v80, v81, v82);
  }
  uint64_t v83 = objc_msgSend_name(v9, v5, v6, v7, v8);
  if (v83) {
    uint64_t v84 = v9;
  }
  else {
    uint64_t v84 = 0;
  }
  uint64_t v85 = v84;

  return v85;
}

- (BOOL)memoryPeakExceedsActiveJetsamLimit
{
  uint64_t v6 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], a2, v2, v3, v4);
  unint64_t v11 = objc_msgSend_physicalMemory(v6, v7, v8, v9, v10);

  if (v11 > 0x147D356FFLL) {
    return 0;
  }
  if (AXDeviceIsJ42() && objc_msgSend_memoryPeak(self, v13, v14, v15, v16) > 70000000) {
    return 1;
  }
  return objc_msgSend_memoryPeak(self, v13, v14, v15, v16) > 150000000;
}

- (unint64_t)_resourceTypeFromStringInput:(id)a3
{
  v18[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = @"MacinTalk";
  v17[1] = @"Gryphon";
  v18[0] = &unk_1EFB955E8;
  v18[1] = &unk_1EFB95600;
  v17[2] = @"Custom";
  v17[3] = @"Maui";
  v18[2] = &unk_1EFB95618;
  v18[3] = &unk_1EFB95630;
  v17[4] = @"Kona";
  v17[5] = @"LegacyCombinedVocalizer";
  v18[4] = &unk_1EFB95648;
  v18[5] = &unk_1EFB95660;
  v17[6] = @"LegacyVocalizer";
  v17[7] = @"SynthesizerExtension";
  v18[6] = &unk_1EFB95678;
  v18[7] = &unk_1EFB95690;
  v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)v18, (uint64_t)v17, 8);
  uint64_t v9 = v5;
  if (v3)
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)v3, v7, v8);
    unint64_t v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (unint64_t)_resourceSubtypeFromStringInput:(id)a3
{
  v18[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = @"None";
  v17[1] = @"MacinTalk";
  v18[0] = &unk_1EFB955E8;
  v18[1] = &unk_1EFB95600;
  v17[2] = @"Gryphon";
  v17[3] = @"SiriNeuralAX";
  v18[2] = &unk_1EFB95630;
  v18[3] = &unk_1EFB95678;
  v17[4] = @"Hydra";
  v17[5] = @"SiriNeural";
  v18[4] = &unk_1EFB95648;
  v18[5] = &unk_1EFB95660;
  v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)v18, (uint64_t)v17, 6);
  uint64_t v9 = v5;
  if (v3)
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)v3, v7, v8);
    unint64_t v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (int64_t)_resourceGenderFromStringInput:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = @"male";
  v17[1] = @"female";
  v18[0] = &unk_1EFB95708;
  v18[1] = &unk_1EFB956A8;
  v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)v18, (uint64_t)v17, 2);
  uint64_t v9 = v5;
  if (v3)
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)v3, v7, v8);
    int64_t v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);
  }
  else
  {
    int64_t v15 = 0;
  }

  return v15;
}

- (int64_t)_resourceFootprintFromStringInput:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = @"super-compact";
  v17[1] = @"compact";
  v18[0] = &unk_1EFB956A8;
  v18[1] = &unk_1EFB956C0;
  void v17[2] = @"enhanced";
  v17[3] = @"premium";
  v18[2] = &unk_1EFB956D8;
  void v18[3] = &unk_1EFB956F0;
  v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v4, (uint64_t)v18, (uint64_t)v17, 4);
  uint64_t v9 = v5;
  if (v3)
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)v3, v7, v8);
    int64_t v15 = objc_msgSend_integerValue(v10, v11, v12, v13, v14);
  }
  else
  {
    int64_t v15 = 1;
  }

  return v15;
}

- (NSString)assetId
{
  uint64_t v6 = objc_msgSend_axAsset(self, a2, v2, v3, v4);

  if (v6)
  {
    unint64_t v11 = objc_msgSend_axAsset(self, v7, v8, v9, v10);
    objc_msgSend_assetId(v11, v12, v13, v14, v15);
    uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v16 = self->_assetId;
  }

  return v16;
}

- (TTSAXResource)initWithSSEVoice:(id)a3
{
  id v5 = a3;
  v83.receiver = self;
  v83.super_class = (Class)TTSAXResource;
  uint64_t v10 = [(TTSAXResource *)&v83 init];
  if (!v10)
  {
LABEL_21:
    uint64_t v67 = v10;
    goto LABEL_22;
  }
  unint64_t v11 = objc_msgSend_synthesizerBundleIdentifier(v5, v6, v7, v8, v9);
  if ((objc_msgSend_isEqualToString_(v11, v12, @"com.apple.speech.MacinTalkFramework.MacinTalkAUSP", v13, v14) & 1) == 0&& (objc_msgSend_isEqualToString_(v11, v15, @"com.apple.speech.MacinTalkFramework", v16, v17) & 1) == 0&& (!TTSUseMauiSSE()|| (objc_msgSend_isEqualToString_(v11, v18, @"com.apple.ax.MauiTTSSupport.MauiAUSP", v20, v21) & 1) == 0&& (objc_msgSend_isEqualToString_(v11, v22, @"com.apple.ax.MauiTTSSupport", v23, v24) & 1) == 0))
  {
    uint64_t v25 = objc_msgSend_name(v5, v18, v19, v20, v21);
    if (v25)
    {
      uint64_t v30 = (void *)v25;
      uint64_t v31 = objc_msgSend_identifier(v5, v26, v27, v28, v29);
      if (v31)
      {
        v36 = (void *)v31;
        uint64_t v37 = objc_msgSend_primaryLanguages(v5, v32, v33, v34, v35);

        if (v37)
        {
          uint64_t v42 = objc_msgSend_synthesizerBundleIdentifier(v5, v38, v39, v40, v41);
          int isEqualToString = objc_msgSend_isEqualToString_(v42, v43, @"com.apple.ax.KonaTTSSupport.KonaSynthesizer", v44, v45);
          uint64_t v47 = 4;
          if (!isEqualToString) {
            uint64_t v47 = 0;
          }
          *((void *)v10 + 11) = v47;

          uint64_t v52 = objc_msgSend_name(v5, v48, v49, v50, v51);
          uint64_t v53 = (void *)*((void *)v10 + 5);
          *((void *)v10 + 5) = v52;

          if (objc_msgSend_isFirstParty(v5, v54, v55, v56, v57)) {
            objc_msgSend_identifier(v5, v58, v59, v60, v61);
          }
          else {
          uint64_t v62 = objc_msgSend_fullBundleIdentifier(v5, v58, v59, v60, v61);
          }
          uint64_t v68 = (void *)*((void *)v10 + 6);
          *((void *)v10 + 6) = v62;

          v10[9] = objc_msgSend_hasPrefix_(*((void **)v10 + 6), v69, @"com.apple.speech.personalvoice", v70, v71);
          uint64_t v76 = objc_msgSend_primaryLanguages(v5, v72, v73, v74, v75);
          uint64_t v77 = (void *)*((void *)v10 + 4);
          *((void *)v10 + 4) = v76;

          *(_OWORD *)(v10 + 72) = xmmword_1A689D660;
          *((void *)v10 + 12) = objc_msgSend_gender(v5, v78, v79, v80, v81);
          objc_storeStrong((id *)v10 + 14, a3);

          goto LABEL_21;
        }
      }
      else
      {
      }
    }
    AXTTSLogResourceManager();
    uint64_t v63 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_ERROR)) {
      sub_1A688D6F4(v5, v63, v64, v65, v66);
    }
  }
  uint64_t v67 = 0;
LABEL_22:

  return v67;
}

- (TTSAXResource)initWithAsset:(id)a3
{
  id v5 = a3;
  uint64_t v10 = objc_msgSend_properties(v5, v6, v7, v8, v9);
  uint64_t v14 = (TTSAXResource *)objc_msgSend_initWithData_(self, v11, (uint64_t)v10, v12, v13);

  if (v14) {
    objc_storeStrong((id *)&v14->_axAsset, a3);
  }

  return v14;
}

- (int64_t)voiceType
{
  uint64_t v6 = objc_msgSend_type(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_subtype(self, v7, v8, v9, v10);

  return TTSVoiceTypeForResourceType(v6, v11);
}

- (NSString)contentPath
{
  onDiskContentPath = self->_onDiskContentPath;
  if (onDiskContentPath)
  {
    uint64_t v6 = onDiskContentPath;
    goto LABEL_11;
  }
  if (objc_msgSend_type(self, a2, v2, v3, v4) == 3
    || objc_msgSend_type(self, v8, v9, v10, v11) == 10
    || objc_msgSend_type(self, v8, v9, v10, v11) == 7)
  {
    uint64_t v12 = objc_msgSend_voiceAsset(self, v8, v9, v10, v11);

    if (!v12)
    {
      uint64_t v17 = objc_msgSend_primaryLanguage(self, v13, v14, v15, v16);
      uint64_t v22 = objc_msgSend_gender(self, v18, v19, v20, v21);
      uint64_t v27 = objc_msgSend_footprint(self, v23, v24, v25, v26);
      uint64_t v32 = objc_msgSend_name(self, v28, v29, v30, v31);
      uint64_t v37 = objc_msgSend_type(self, v33, v34, v35, v36);
      uint64_t v42 = objc_msgSend_subtype(self, v38, v39, v40, v41);
      uint64_t v43 = TTSVoiceTypeForResourceType(v37, v42);
      uint64_t v45 = objc_msgSend_installedAssetForLanguage_gender_footprint_voiceName_voiceType_(TTSSiriAssetManager, v44, (uint64_t)v17, v22, v27, v32, v43);
      objc_msgSend_setVoiceAsset_(self, v46, (uint64_t)v45, v47, v48);
    }
    uint64_t v49 = objc_msgSend_voiceAsset(self, v13, v14, v15, v16);
    uint64_t v54 = objc_msgSend_voicePath(v49, v50, v51, v52, v53);
    goto LABEL_9;
  }
  if ((objc_msgSend_type(self, v8, v9, v10, v11) == 4
     || objc_msgSend_type(self, v56, v57, v58, v59) == 2
     || objc_msgSend_type(self, v56, v57, v58, v59) == 6)
    && (objc_msgSend_isSystemVoice(self, v56, v57, v58, v59) & 1) == 0)
  {
    uint64_t v60 = objc_msgSend_axAsset(self, v56, v57, v58, v59);

    if (!v60)
    {
      uint64_t v61 = objc_msgSend_sharedInstance(TTSAXResourceManager, v56, v57, v58, v59);
      uint64_t v64 = objc_msgSend_refreshAssetForResource_installedOnly_(v61, v62, (uint64_t)self, 1, v63);
      objc_msgSend_setAxAsset_(self, v65, (uint64_t)v64, v66, v67);
    }
  }
  uint64_t v68 = objc_msgSend_axAsset(self, v56, v57, v58, v59);
  uint64_t v49 = objc_msgSend_localURL(v68, v69, v70, v71, v72);

  if (objc_msgSend_isSystemVoice(self, v73, v74, v75, v76))
  {
    uint64_t v81 = objc_msgSend_bundleWithPath_(MEMORY[0x1E4F28B50], v77, @"/System/Library/PrivateFrameworks/TextToSpeechMauiSupport.framework", v79, v80);
    uint64_t v82 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v85 = objc_msgSend_pathForResource_ofType_(v81, v83, @"TTSResources", 0, v84);
    uint64_t v89 = objc_msgSend_fileURLWithPath_(v82, v86, (uint64_t)v85, v87, v88);

    if (objc_msgSend_type(self, v90, v91, v92, v93) == 2 || objc_msgSend_type(self, v94, v95, v96, v97) == 4)
    {
      uint64_t v98 = objc_msgSend_primaryLanguage(self, v94, v95, v96, v97);
      v102 = objc_msgSend_URLByAppendingPathComponent_(v89, v99, (uint64_t)v98, v100, v101);
      uint64_t v107 = objc_msgSend_name(self, v103, v104, v105, v106);
      uint64_t v49 = objc_msgSend_URLByAppendingPathComponent_(v102, v108, (uint64_t)v107, v109, v110);

      if (objc_msgSend_type(self, v111, v112, v113, v114) == 2)
      {
        v119 = objc_msgSend_path(v49, v115, v116, v117, v118);
        objc_msgSend_stringByAppendingPathComponent_(v119, v120, @"Contents/VoiceBundle", v121, v122);
        uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v49 = v89;
    }
  }
  if (objc_msgSend_type(self, v77, v78, v79, v80) != 2)
  {
    if (objc_msgSend_type(self, v123, v124, v125, v126) != 6)
    {
      uint64_t v81 = objc_msgSend_path(v49, v127, v128, v129, v130);
      objc_msgSend_stringByAppendingPathComponent_(v81, v158, @"Contents", v159, v160);
      uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    uint64_t v81 = objc_msgSend_name(self, v127, v128, v129, v130);
    v119 = objc_msgSend_lowercaseString(v81, v131, v132, v133, v134);
    v138 = objc_msgSend_URLByAppendingPathComponent_(v49, v135, (uint64_t)v119, v136, v137);
    uint64_t v143 = objc_msgSend_footprint(self, v139, v140, v141, v142);
    v144 = TTSStringForSpeechFootprint(v143);
    v149 = objc_msgSend_lowercaseString(v144, v145, v146, v147, v148);
    v153 = objc_msgSend_URLByAppendingPathComponent_(v138, v150, (uint64_t)v149, v151, v152);
    objc_msgSend_path(v153, v154, v155, v156, v157);
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_31:
LABEL_33:

    goto LABEL_10;
  }
  uint64_t v54 = objc_msgSend_path(v49, v123, v124, v125, v126);
LABEL_9:
  uint64_t v6 = (NSString *)v54;
LABEL_10:

LABEL_11:

  return v6;
}

- (BOOL)isValid
{
  unint64_t v6 = objc_msgSend_type(self, a2, v2, v3, v4);
  char v11 = 1;
  if (v6 <= 0xA && ((1 << v6) & 0x4DC) != 0)
  {
    uint64_t v16 = objc_msgSend_contentPath(self, v7, v8, v9, v10);
    if (v16)
    {
      uint64_t v17 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v12, v13, v14, v15);
      uint64_t v22 = objc_msgSend_contentPath(self, v18, v19, v20, v21);
      char v11 = objc_msgSend_fileExistsAtPath_(v17, v23, (uint64_t)v22, v24, v25);
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (BOOL)shouldFilterResourceFromUI
{
  if (objc_msgSend_type(self, a2, v2, v3, v4) == 10 && objc_msgSend_footprint(self, v6, v7, v8, v9) == 3) {
    return 1;
  }

  return objc_msgSend_memoryPeakExceedsActiveJetsamLimit(self, v6, v7, v8, v9);
}

- (AVSpeechSynthesisProviderVoice)synthesisProviderVoice
{
  v76[1] = *MEMORY[0x1E4F143B8];
  synthesisProviderVoice = self->_synthesisProviderVoice;
  if (synthesisProviderVoice)
  {
    unint64_t v6 = synthesisProviderVoice;
    goto LABEL_9;
  }
  objc_msgSend_synthesizerBundleIdentifier(self, a2, v2, v3, v4);
  unint64_t v6 = (AVSpeechSynthesisProviderVoice *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v12 = objc_msgSend_componentSubType(self, v8, v9, v10, v11);
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      char v14 = TTSIsBaseSystem();

      if ((v14 & 1) == 0)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F15460]);
        uint64_t v20 = objc_msgSend_name(self, v16, v17, v18, v19);
        uint64_t v25 = objc_msgSend_voiceId(self, v21, v22, v23, v24);
        uint64_t v30 = objc_msgSend_primaryLanguage(self, v26, v27, v28, v29);
        v76[0] = v30;
        uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v31, (uint64_t)v76, 1, v32);
        uint64_t v38 = objc_msgSend_primaryLanguage(self, v34, v35, v36, v37);
        uint64_t v75 = v38;
        uint64_t v41 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v39, (uint64_t)&v75, 1, v40);
        unint64_t v6 = (AVSpeechSynthesisProviderVoice *)objc_msgSend_initWithName_identifier_primaryLanguages_supportedLanguages_(v15, v42, (uint64_t)v20, (uint64_t)v25, (uint64_t)v33, v41);

        uint64_t v47 = objc_msgSend_synthesizerBundleIdentifier(self, v43, v44, v45, v46);
        objc_msgSend_setSynthesizerBundleIdentifier_(v6, v48, (uint64_t)v47, v49, v50);

        objc_msgSend_componentSubType(self, v51, v52, v53, v54);
        id v55 = objc_claimAutoreleasedReturnValue();
        LODWORD(v47) = bswap32(*(_DWORD *)objc_msgSend_cStringUsingEncoding_(v55, v56, 1, v57, v58));

        v72[0] = 1635087216;
        v72[1] = v47;
        uint64_t v73 = 1634758764;
        int v74 = 0;
        objc_msgSend_setAuComponentDesc_(v6, v59, (uint64_t)v72, v60, v61);
        objc_msgSend_setManufacturerName_(v6, v62, @"Apple", v63, v64);
        objc_msgSend_setIsFirstParty_(v6, v65, 1, v66, v67);
        objc_msgSend_setHasPerVoiceSettings_(v6, v68, 1, v69, v70);
        goto LABEL_9;
      }
    }
    else
    {
    }
    unint64_t v6 = 0;
  }
LABEL_9:

  return v6;
}

+ (id)siriLocalizedNameForName:(id)a3 identifier:(id)a4 includeSiri:(BOOL)a5
{
  BOOL v72 = a5;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v73 = 0;
  id v74 = 0;
  int v9 = TTSGetComponentsInNamedSiriVoiceIdentifier(v8, &v74, &v73, 0);
  id v10 = v74;
  id v15 = v73;
  if (v9)
  {
    uint64_t v16 = objc_msgSend_sharedInstance(MEMORY[0x1E4F4E4C0], v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_outputVoiceDescriptorForOutputLanguageCode_voiceName_(v16, v17, (uint64_t)v15, (uint64_t)v10, v18);
    uint64_t v24 = v19;
    if (v19)
    {
      uint64_t v25 = objc_msgSend_localizedDisplay(v19, v20, v21, v22, v23);
    }
    else
    {
      uint64_t v26 = objc_msgSend_sharedInstance(MEMORY[0x1E4F4E4C0], v20, v21, v22, v23);
      id v5 = objc_msgSend_lowercaseString(v10, v27, v28, v29, v30);
      uint64_t v33 = objc_msgSend_outputVoiceDescriptorForOutputLanguageCode_voiceName_(v26, v31, (uint64_t)v15, (uint64_t)v5, v32);
      uint64_t v25 = objc_msgSend_localizedDisplay(v33, v34, v35, v36, v37);
    }
    uint64_t v38 = AXLogSpeechAssetDownload();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v80 = v10;
      _os_log_impl(&dword_1A66D3000, v38, OS_LOG_TYPE_DEFAULT, "Name: %@ for language: %@ and asset: %@", buf, 0x20u);
    }

    if (v25) {
      goto LABEL_14;
    }
    uint64_t v43 = objc_msgSend_sharedInstance(MEMORY[0x1E4F4E4C0], v39, v40, v41, v42);
    uint64_t v50 = objc_msgSend_outputVoiceDescriptorForOutputLanguageCode_voiceName_(v43, v44, (uint64_t)v15, (uint64_t)v7, v45);
    uint64_t v51 = v50;
    if (!v50)
    {
      uint64_t v71 = objc_msgSend_sharedInstance(MEMORY[0x1E4F4E4C0], v46, v47, v48, v49);
      id v5 = objc_msgSend_lowercaseString(v7, v52, v53, v54, v55);
      uint64_t v51 = objc_msgSend_outputVoiceDescriptorForOutputLanguageCode_voiceName_(v71, v56, (uint64_t)v15, (uint64_t)v5, v57);
    }
    uint64_t v25 = objc_msgSend_localizedDisplay(v51, v46, v47, v48, v49);
    if (!v50)
    {
    }
    if (v25)
    {
LABEL_14:
      if (v72)
      {
        uint64_t v58 = NSString;
        uint64_t v75 = 0;
        uint64_t v76 = &v75;
        uint64_t v77 = 0x2020000000;
        uint64_t v59 = (void (*)(__CFString *))off_1E96C4758;
        uint64_t v78 = off_1E96C4758;
        if (!off_1E96C4758)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1A66FBEA0;
          uint64_t v80 = &unk_1E5C696C8;
          uint64_t v81 = &v75;
          sub_1A66FBEA0((uint64_t)buf, v39, v40, v41, v42);
          uint64_t v59 = (void (*)(__CFString *))v76[3];
        }
        _Block_object_dispose(&v75, 8);
        if (!v59) {
          sub_1A688D84C(v60, v61, v62, v63, v64);
        }
        uint64_t v65 = v59(@"siri.and.type");
        uint64_t v69 = objc_msgSend_stringWithFormat_(v58, v66, (uint64_t)v65, v67, v68, v25);

        uint64_t v25 = (void *)v69;
      }
    }
    else
    {
      uint64_t v25 = objc_msgSend_localizedCapitalizedString(v7, v39, v40, v41, v42);
    }
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

- (NSString)localizedName
{
  unint64_t v6 = objc_msgSend_name(self, a2, v2, v3, v4);
  if (objc_msgSend_type(self, v7, v8, v9, v10) == 3
    && (objc_msgSend_subtype(self, v11, v12, v13, v14) != 7
     || objc_msgSend_subtype(self, v11, v15, v16, v14) == 7 && objc_msgSend_footprint(self, v11, v17, v18, v14) != 3))
  {
    uint64_t v19 = objc_msgSend_voiceId(self, v11, v15, v16, v14);
    uint64_t v21 = objc_msgSend_siriLocalizedNameForName_identifier_includeSiri_(TTSAXResource, v20, (uint64_t)v6, (uint64_t)v19, 1);
    uint64_t v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = (void *)v21;
    }
    else {
      uint64_t v23 = v6;
    }
    id v24 = v23;

    unint64_t v6 = v24;
  }
  uint64_t v25 = objc_msgSend_localizedName_forLanguage_(TTSAXResource, v11, (uint64_t)v6, 0, v14);
  if (objc_msgSend_length(v25, v26, v27, v28, v29))
  {
    id v30 = v25;

    unint64_t v6 = v30;
  }

  return (NSString *)v6;
}

+ (id)localizedStringForKey:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_bundleForClass_(v3, v6, v5, v7, v8);
  uint64_t v10 = AXNSLocalizedStringForLocale();

  return v10;
}

+ (id)localizedNameWithFootprint:(int64_t)a3 name:(id)a4
{
  id v5 = a4;
  unint64_t v6 = TTSStringForSpeechFootprint(a3);
  uint64_t v9 = v6;
  if ((unint64_t)(a3 - 4) <= 0xFFFFFFFFFFFFFFFDLL && v6)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v6, v7, @" ", @"_", v8);
    uint64_t v16 = objc_msgSend_uppercaseString(v11, v12, v13, v14, v15);
    uint64_t v20 = objc_msgSend_stringWithFormat_(v10, v17, @"%@_VOICE_WITH_NAME", v18, v19, v16);

    uint64_t v21 = NSString;
    uint64_t v25 = objc_msgSend_localizedStringForKey_(TTSAXResource, v22, (uint64_t)v20, v23, v24);
    objc_msgSend_localizedStringWithFormat_(v21, v26, (uint64_t)v25, v27, v28, v5);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v29 = v5;
  }

  return v29;
}

- (NSString)localizedNameWithFootprint
{
  unint64_t v6 = objc_msgSend_localizedName(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_speechVoice(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_synthesisProviderVoice(v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_synthesizerBundleIdentifier(v16, v17, v18, v19, v20);
  if ((objc_msgSend_isEqualToString_(v21, v22, @"com.apple.ax.KonaTTSSupport.KonaSynthesizer", v23, v24) & 1) != 0
    || objc_msgSend_type(self, v25, v26, v27, v28) == 2)
  {

LABEL_4:
    id v33 = v6;
    goto LABEL_5;
  }
  uint64_t v36 = objc_msgSend_type(self, v29, v30, v31, v32);

  if (v36 == 9) {
    goto LABEL_4;
  }
  uint64_t v41 = objc_msgSend_footprint(self, v37, v38, v39, v40);
  objc_msgSend_localizedNameWithFootprint_name_(TTSAXResource, v42, v41, (uint64_t)v6, v43);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
  uint64_t v34 = v33;

  return (NSString *)v34;
}

- (BOOL)isSystemVoice
{
  if (self->_isSystemVoice
    || objc_msgSend_footprint(self, a2, v2, v3, v4) == 2
    || objc_msgSend_type(self, v6, v7, v8, v9) == 2
    && !objc_msgSend_canBeDownloaded(self, v10, v11, v12, v13))
  {
    return 1;
  }
  uint64_t v14 = objc_msgSend_synthesizerBundleIdentifier(self, v10, v11, v12, v13);
  char isEqualToString = objc_msgSend_isEqualToString_(v14, v15, @"com.apple.ax.KonaTTSSupport.KonaSynthesizer", v16, v17);

  return isEqualToString;
}

- (BOOL)isDefault
{
  unint64_t v6 = objc_msgSend_primaryLanguage(self, a2, v2, v3, v4);
  uint64_t v11 = _BuiltInVoiceNameForLanguage((uint64_t)v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_name(self, v12, v13, v14, v15);
  if (objc_msgSend_isEqualToString_(v11, v17, (uint64_t)v16, v18, v19))
  {
    uint64_t v24 = objc_msgSend_type(self, v20, v21, v22, v23);

    if (v24 == 4
      && (objc_msgSend_footprint(self, v25, v26, v27, v28) == 2
       || objc_msgSend_footprint(self, v29, v30, v31, v32) == 3
       && (objc_msgSend_isInstalled(self, v33, v34, v35, v36) & 1) != 0))
    {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (NSString)identifier
{
  uint64_t v6 = objc_msgSend_footprint(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_voiceId(self, v7, v8, v9, v10);
  uint64_t v14 = v11;
  if (v6 == 2)
  {
    uint64_t v15 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v11, v12, @".super-compact.", @".compact.", v13);

    uint64_t v14 = (void *)v15;
  }

  return (NSString *)v14;
}

- (NSString)serviceIdentifier
{
  if (!self->_serviceIdentifier)
  {
    uint64_t v6 = objc_msgSend_service(self, a2, v2, v3, v4);

    if (v6)
    {
      uint64_t v11 = objc_msgSend_service(self, v7, v8, v9, v10);
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        uint64_t v17 = objc_msgSend_service(self, v13, v14, v15, v16);
        objc_msgSend_serviceIdentifier(v17, v18, v19, v20, v21);
        uint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue();
        serviceIdentifier = self->_serviceIdentifier;
        self->_serviceIdentifier = v22;
      }
      else
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v17 = objc_msgSend_service(self, v13, v14, v15, v16);
        uint64_t v25 = objc_opt_class();
        serviceIdentifier = objc_msgSend_bundleForClass_(v24, v26, v25, v27, v28);
        objc_msgSend_bundleIdentifier(serviceIdentifier, v29, v30, v31, v32);
        id v33 = (NSString *)objc_claimAutoreleasedReturnValue();
        uint64_t v34 = self->_serviceIdentifier;
        self->_serviceIdentifier = v33;
      }
    }
  }
  uint64_t v35 = self->_serviceIdentifier;

  return v35;
}

+ (id)localizedName:(id)a3 forLanguage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v8 = objc_opt_class();
  char v12 = objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  if (TTSSpeechUnitTestingMode())
  {
    uint64_t v16 = objc_msgSend_bundleWithPath_(MEMORY[0x1E4F28B50], v13, @"/System/Library/PrivateFrameworks/TextToSpeech.framework", v14, v15);

    char v12 = (void *)v16;
  }
  uint64_t v17 = AXNSLocalizedStringForLocale();

  return v17;
}

- (id)localizedNameForLanguage:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v10 = objc_msgSend_name(self, v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_localizedName_forLanguage_(v5, v11, (uint64_t)v10, (uint64_t)v4, v12);

  return v13;
}

- (id)description
{
  id v6 = NSString;
  uint64_t v7 = objc_msgSend_name(self, a2, v2, v3, v4);
  uint64_t v12 = objc_msgSend_voiceId(self, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_type(self, v13, v14, v15, v16);
  uint64_t v22 = objc_msgSend_subtype(self, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_footprint(self, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_languages(self, v28, v29, v30, v31);
  uint64_t v36 = objc_msgSend_componentsJoinedByString_(v32, v33, @", ", v34, v35);
  unsigned int isInstalled = objc_msgSend_isInstalled(self, v37, v38, v39, v40);
  uint64_t v45 = objc_msgSend_stringWithFormat_(v6, v42, @"TTSAXResource<%p> Name:%@ ID:%@ Type:[%ld:%ld] Foot:%ld Langs:[%@] Installed:%ld", v43, v44, self, v7, v12, v17, v22, v27, v36, isInstalled);

  return v45;
}

- (void)encodeWithCoder:(id)a3
{
  id v123 = a3;
  uint64_t v8 = objc_msgSend_name(self, v4, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v123, v9, (uint64_t)v8, @"Name", v10);

  uint64_t v15 = objc_msgSend_voiceId(self, v11, v12, v13, v14);
  objc_msgSend_encodeObject_forKey_(v123, v16, (uint64_t)v15, @"VoiceId", v17);

  uint64_t v22 = objc_msgSend_languages(self, v18, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v123, v23, (uint64_t)v22, @"Languages", v24);

  uint64_t v29 = objc_msgSend_type(self, v25, v26, v27, v28);
  objc_msgSend_encodeInteger_forKey_(v123, v30, v29, @"Type", v31);
  uint64_t v36 = objc_msgSend_subtype(self, v32, v33, v34, v35);
  objc_msgSend_encodeInteger_forKey_(v123, v37, v36, @"Subtype", v38);
  uint64_t v43 = objc_msgSend_footprint(self, v39, v40, v41, v42);
  objc_msgSend_encodeInteger_forKey_(v123, v44, v43, @"Footprint", v45);
  uint64_t v50 = objc_msgSend_gender(self, v46, v47, v48, v49);
  objc_msgSend_encodeInteger_forKey_(v123, v51, v50, @"Gender", v52);
  uint64_t isNoveltyVoice = objc_msgSend_isNoveltyVoice(self, v53, v54, v55, v56);
  objc_msgSend_encodeBool_forKey_(v123, v58, isNoveltyVoice, @"NoveltyVoice", v59);
  uint64_t isPersonalVoice = objc_msgSend_isPersonalVoice(self, v60, v61, v62, v63);
  objc_msgSend_encodeBool_forKey_(v123, v65, isPersonalVoice, @"PersonalVoice", v66);
  uint64_t isInstalled = objc_msgSend_isInstalled(self, v67, v68, v69, v70);
  objc_msgSend_encodeBool_forKey_(v123, v72, isInstalled, @"IsInstalled", v73);
  uint64_t canBeDownloaded = objc_msgSend_canBeDownloaded(self, v74, v75, v76, v77);
  objc_msgSend_encodeBool_forKey_(v123, v79, canBeDownloaded, @"CanBeDownloaded", v80);
  uint64_t v85 = objc_msgSend_assetId(self, v81, v82, v83, v84);
  objc_msgSend_encodeObject_forKey_(v123, v86, (uint64_t)v85, @"AssetId", v87);

  uint64_t v92 = objc_msgSend_memoryPeak(self, v88, v89, v90, v91);
  objc_msgSend_encodeInteger_forKey_(v123, v93, v92, @"MemoryPeak", v94);
  uint64_t v95 = NSNumber;
  uint64_t v100 = objc_msgSend_assetSize(self, v96, v97, v98, v99);
  uint64_t v104 = objc_msgSend_numberWithUnsignedInteger_(v95, v101, v100, v102, v103);
  objc_msgSend_encodeObject_forKey_(v123, v105, (uint64_t)v104, @"AssetSize", v106);

  v111 = objc_msgSend_synthesizerBundleIdentifier(self, v107, v108, v109, v110);
  objc_msgSend_encodeObject_forKey_(v123, v112, (uint64_t)v111, @"synthesizerBundleIdentifier", v113);

  uint64_t v118 = objc_msgSend_componentSubType(self, v114, v115, v116, v117);
  objc_msgSend_encodeObject_forKey_(v123, v119, (uint64_t)v118, @"componentSubType", v120);

  objc_msgSend_encodeObject_forKey_(v123, v121, (uint64_t)self->_synthesisProviderVoice, @"_synthesisProviderVoice", v122);
}

- (void)setAxAsset:(id)a3
{
}

- (void)setVoiceAsset:(id)a3
{
}

- (NSString)onDiskContentPath
{
  return self->_onDiskContentPath;
}

- (void)setOnDiskContentPath:(id)a3
{
}

- (void)setAssetId:(id)a3
{
}

- (void)setFootprint:(int64_t)a3
{
  self->_int64_t footprint = a3;
}

- (void)setIsSystemVoice:(BOOL)a3
{
  self->_isSystemVoice = a3;
}

- (void)setCanBeDownloaded:(BOOL)a3
{
  self->_uint64_t canBeDownloaded = a3;
}

- (void)setMemoryPeak:(int64_t)a3
{
  self->_memoryPeak = a3;
}

- (void)setSynthesisProviderVoice:(id)a3
{
}

- (void)setServiceIdentifier:(id)a3
{
}

- (TTSSpeechService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (TTSSpeechService *)WeakRetained;
}

- (void)setService:(id)a3
{
}

- (void)setSynthesizerBundleIdentifier:(id)a3
{
}

- (void)setComponentSubType:(id)a3
{
}

- (void)setAssetSize:(unint64_t)a3
{
  self->_assetSize = a3;
}

- (void)setIsInstalled:(BOOL)a3
{
  self->_uint64_t isInstalled = a3;
}

@end