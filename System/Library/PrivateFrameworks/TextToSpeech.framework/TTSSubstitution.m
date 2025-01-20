@interface TTSSubstitution
+ (BOOL)supportsSecureCoding;
- (BOOL)active;
- (BOOL)appliesToAllApps;
- (BOOL)ignoreCase;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReplacementTextAllPunctuation;
- (BOOL)isReplacementTextSurroundedByPunctuation;
- (BOOL)isUserSubstitution;
- (NSSet)bundleIdentifiers;
- (NSSet)languages;
- (NSSet)voiceIds;
- (NSString)originalString;
- (NSString)phonemes;
- (NSString)replacementString;
- (NSUUID)uuid;
- (TTSSubstitution)init;
- (TTSSubstitution)initWithCoder:(id)a3;
- (_NSRange)replacementRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAppliesToAllApps:(BOOL)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setIgnoreCase:(BOOL)a3;
- (void)setIsUserSubstitution:(BOOL)a3;
- (void)setLanguages:(id)a3;
- (void)setOriginalString:(id)a3;
- (void)setPhonemes:(id)a3;
- (void)setReplacementRange:(_NSRange)a3;
- (void)setReplacementString:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVoiceIds:(id)a3;
@end

@implementation TTSSubstitution

- (TTSSubstitution)init
{
  v19.receiver = self;
  v19.super_class = (Class)TTSSubstitution;
  v6 = [(TTSSubstitution *)&v19 init];
  if (v6)
  {
    v7 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v2, v3, v4, v5);
    objc_msgSend_setUuid_(v6, v8, (uint64_t)v7, v9, v10);

    objc_msgSend_setIgnoreCase_(v6, v11, 1, v12, v13);
    objc_msgSend_setAppliesToAllApps_(v6, v14, 1, v15, v16);
    v17 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TTSSubstitution)initWithCoder:(id)a3
{
  id v4 = a3;
  v106.receiver = self;
  v106.super_class = (Class)TTSSubstitution;
  uint64_t v5 = [(TTSSubstitution *)&v106 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"originalString", v8);
    objc_msgSend_setOriginalString_(v5, v10, (uint64_t)v9, v11, v12);

    uint64_t v13 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"replacementString", v15);
    objc_msgSend_setReplacementString_(v5, v17, (uint64_t)v16, v18, v19);

    uint64_t v20 = objc_opt_class();
    v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"phonemes", v22);
    objc_msgSend_setPhonemes_(v5, v24, (uint64_t)v23, v25, v26);

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    v33 = objc_msgSend_setWithObjects_(v27, v30, v28, v31, v32, v29, 0);
    v36 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, @"languages", v35);
    objc_msgSend_setLanguages_(v5, v37, (uint64_t)v36, v38, v39);

    v40 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_opt_class();
    v46 = objc_msgSend_setWithObjects_(v40, v43, v41, v44, v45, v42, 0);
    v49 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v47, (uint64_t)v46, @"voiceIds", v48);
    objc_msgSend_setVoiceIds_(v5, v50, (uint64_t)v49, v51, v52);

    v53 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    v59 = objc_msgSend_setWithObjects_(v53, v56, v54, v57, v58, v55, 0);
    v62 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v60, (uint64_t)v59, @"bundleIdentifiers", v61);
    objc_msgSend_setBundleIdentifiers_(v5, v63, (uint64_t)v62, v64, v65);

    uint64_t v69 = objc_msgSend_decodeBoolForKey_(v4, v66, @"active", v67, v68);
    objc_msgSend_setActive_(v5, v70, v69, v71, v72);
    uint64_t v76 = objc_msgSend_decodeBoolForKey_(v4, v73, @"ignoreCase", v74, v75);
    objc_msgSend_setIgnoreCase_(v5, v77, v76, v78, v79);
    uint64_t v83 = objc_msgSend_decodeBoolForKey_(v4, v80, @"appliesToAllApps", v81, v82);
    objc_msgSend_setAppliesToAllApps_(v5, v84, v83, v85, v86);
    uint64_t v87 = objc_opt_class();
    v90 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, @"uuid", v89);
    objc_msgSend_setUuid_(v5, v91, (uint64_t)v90, v92, v93);

    uint64_t v94 = objc_opt_class();
    v97 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v95, v94, @"replacementRange", v96);
    uint64_t v102 = objc_msgSend_rangeValue(v97, v98, v99, v100, v101);
    objc_msgSend_setReplacementRange_(v5, v103, v102, (uint64_t)v103, v104);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_originalString(self, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"originalString", v11);

  uint64_t v16 = objc_msgSend_replacementString(self, v12, v13, v14, v15);
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, @"replacementString", v18);

  v23 = objc_msgSend_phonemes(self, v19, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, @"phonemes", v25);

  v30 = objc_msgSend_languages(self, v26, v27, v28, v29);
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, @"languages", v32);

  v37 = objc_msgSend_voiceIds(self, v33, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, @"voiceIds", v39);

  uint64_t v44 = objc_msgSend_bundleIdentifiers(self, v40, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"bundleIdentifiers", v46);

  uint64_t v51 = objc_msgSend_active(self, v47, v48, v49, v50);
  objc_msgSend_encodeBool_forKey_(v4, v52, v51, @"active", v53);
  uint64_t v58 = objc_msgSend_ignoreCase(self, v54, v55, v56, v57);
  objc_msgSend_encodeBool_forKey_(v4, v59, v58, @"ignoreCase", v60);
  uint64_t v65 = objc_msgSend_appliesToAllApps(self, v61, v62, v63, v64);
  objc_msgSend_encodeBool_forKey_(v4, v66, v65, @"appliesToAllApps", v67);
  uint64_t v72 = objc_msgSend_uuid(self, v68, v69, v70, v71);
  objc_msgSend_encodeObject_forKey_(v4, v73, (uint64_t)v72, @"uuid", v74);

  uint64_t v75 = (void *)MEMORY[0x1E4F29238];
  uint64_t v80 = objc_msgSend_replacementRange(self, v76, v77, v78, v79);
  objc_msgSend_valueWithRange_(v75, v81, v80, (uint64_t)v81, v82);
  id v85 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v83, (uint64_t)v85, @"replacementRange", v84);
}

- (void)dealloc
{
  objc_msgSend_setUuid_(self, a2, 0, v2, v3);
  objc_msgSend_setOriginalString_(self, v5, 0, v6, v7);
  objc_msgSend_setReplacementString_(self, v8, 0, v9, v10);
  objc_msgSend_setPhonemes_(self, v11, 0, v12, v13);
  objc_msgSend_setLanguages_(self, v14, 0, v15, v16);
  objc_msgSend_setVoiceIds_(self, v17, 0, v18, v19);
  objc_msgSend_setBundleIdentifiers_(self, v20, 0, v21, v22);
  objc_msgSend_setReplacementRange_(self, v23, 0x7FFFFFFFFFFFFFFFLL, 0, v24);
  v25.receiver = self;
  v25.super_class = (Class)TTSSubstitution;
  [(TTSSubstitution *)&v25 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(TTSSubstitution, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_originalString(self, v12, v13, v14, v15);
  objc_msgSend_setOriginalString_(v11, v17, (uint64_t)v16, v18, v19);

  uint64_t v24 = objc_msgSend_replacementString(self, v20, v21, v22, v23);
  objc_msgSend_setReplacementString_(v11, v25, (uint64_t)v24, v26, v27);

  uint64_t v32 = objc_msgSend_phonemes(self, v28, v29, v30, v31);
  objc_msgSend_setPhonemes_(v11, v33, (uint64_t)v32, v34, v35);

  v40 = objc_msgSend_languages(self, v36, v37, v38, v39);
  objc_msgSend_setLanguages_(v11, v41, (uint64_t)v40, v42, v43);

  uint64_t v48 = objc_msgSend_ignoreCase(self, v44, v45, v46, v47);
  objc_msgSend_setIgnoreCase_(v11, v49, v48, v50, v51);
  uint64_t v56 = objc_msgSend_active(self, v52, v53, v54, v55);
  objc_msgSend_setActive_(v11, v57, v56, v58, v59);
  uint64_t v64 = objc_msgSend_bundleIdentifiers(self, v60, v61, v62, v63);
  objc_msgSend_setBundleIdentifiers_(v11, v65, (uint64_t)v64, v66, v67);

  uint64_t v72 = objc_msgSend_appliesToAllApps(self, v68, v69, v70, v71);
  objc_msgSend_setAppliesToAllApps_(v11, v73, v72, v74, v75);
  uint64_t v80 = objc_msgSend_voiceIds(self, v76, v77, v78, v79);
  objc_msgSend_setVoiceIds_(v11, v81, (uint64_t)v80, v82, v83);

  uint64_t v88 = objc_msgSend_replacementRange(self, v84, v85, v86, v87);
  objc_msgSend_setReplacementRange_(v11, v89, v88, (uint64_t)v89, v90);
  return v11;
}

- (void)setReplacementString:(id)a3
{
  uint64_t v6 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  replacementString = self->_replacementString;
  self->_replacementString = v6;

  uint64_t v12 = objc_msgSend_alphanumericCharacterSet(MEMORY[0x1E4F28B88], v8, v9, v10, v11);
  objc_msgSend_invertedSet(v12, v13, v14, v15, v16);
  id v61 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = objc_msgSend_stringByTrimmingCharactersInSet_(self->_replacementString, v17, (uint64_t)v61, v18, v19);
  uint64_t v25 = objc_msgSend_length(v20, v21, v22, v23, v24);

  if (!v25) {
    self->_isReplacementTextAllPunctuation = 1;
  }
  if (objc_msgSend_length(self->_replacementString, v26, v27, v28, v29))
  {
    v33 = objc_msgSend_substringToIndex_(self->_replacementString, v30, 1, v31, v32);
    uint64_t v34 = self->_replacementString;
    uint64_t v39 = objc_msgSend_length(v34, v35, v36, v37, v38);
    uint64_t v43 = objc_msgSend_substringFromIndex_(v34, v40, v39 - 1, v41, v42);
    uint64_t v47 = objc_msgSend_stringByTrimmingCharactersInSet_(v33, v44, (uint64_t)v61, v45, v46);
    if (objc_msgSend_length(v47, v48, v49, v50, v51))
    {
    }
    else
    {
      uint64_t v55 = objc_msgSend_stringByTrimmingCharactersInSet_(v43, v52, (uint64_t)v61, v53, v54);
      uint64_t v60 = objc_msgSend_length(v55, v56, v57, v58, v59);

      if (!v60) {
        self->_isReplacementTextSurroundedByPunctuation = 1;
      }
    }
  }
  else
  {
    self->_isReplacementTextSurroundedByPunctuation = 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_msgSend_uuid(self, v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend_uuid(v4, v10, v11, v12, v13);
    char isEqual = objc_msgSend_isEqual_(v9, v15, (uint64_t)v14, v16, v17);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_uuid(self, a2, v2, v3, v4);
  unint64_t v10 = objc_msgSend_hash(v5, v6, v7, v8, v9);

  return v10;
}

- (id)description
{
  uint64_t v3 = NSString;
  v30.receiver = self;
  v30.super_class = (Class)TTSSubstitution;
  uint64_t v4 = [(TTSSubstitution *)&v30 description];
  uint64_t v9 = objc_msgSend_originalString(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_replacementString(self, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_phonemes(self, v15, v16, v17, v18);
  uint64_t v24 = objc_msgSend_languages(self, v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_stringWithFormat_(v3, v25, @"%@: Original: %@, Replacement: %@, Phonemes: %@, Languages: %@", v26, v27, v4, v9, v14, v19, v24);

  return v28;
}

- (NSString)originalString
{
  return self->_originalString;
}

- (void)setOriginalString:(id)a3
{
}

- (NSString)replacementString
{
  return self->_replacementString;
}

- (NSString)phonemes
{
  return self->_phonemes;
}

- (void)setPhonemes:(id)a3
{
}

- (NSSet)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
}

- (NSSet)voiceIds
{
  return self->_voiceIds;
}

- (void)setVoiceIds:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)ignoreCase
{
  return self->_ignoreCase;
}

- (void)setIgnoreCase:(BOOL)a3
{
  self->_ignoreCase = a3;
}

- (_NSRange)replacementRange
{
  NSUInteger length = self->_replacementRange.length;
  NSUInteger location = self->_replacementRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setReplacementRange:(_NSRange)a3
{
  self->_replacementRange = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)appliesToAllApps
{
  return self->_appliesToAllApps;
}

- (void)setAppliesToAllApps:(BOOL)a3
{
  self->_appliesToAllApps = a3;
}

- (NSSet)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (BOOL)isReplacementTextAllPunctuation
{
  return self->_isReplacementTextAllPunctuation;
}

- (BOOL)isReplacementTextSurroundedByPunctuation
{
  return self->_isReplacementTextSurroundedByPunctuation;
}

- (BOOL)isUserSubstitution
{
  return self->_isUserSubstitution;
}

- (void)setIsUserSubstitution:(BOOL)a3
{
  self->_isUserSubstitution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_voiceIds, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_phonemes, 0);
  objc_storeStrong((id *)&self->_replacementString, 0);

  objc_storeStrong((id *)&self->_originalString, 0);
}

@end