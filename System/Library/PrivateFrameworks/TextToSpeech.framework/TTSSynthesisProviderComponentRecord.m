@interface TTSSynthesisProviderComponentRecord
+ (BOOL)supportsSecureCoding;
- (AudioComponentDescription)componentDescription;
- (BOOL)isFirstParty;
- (NSArray)voices;
- (NSNumber)parameterCount;
- (NSString)bundleIdentifier;
- (NSString)containerBundleIdentifier;
- (NSString)version;
- (TTSSynthesisProviderComponentRecord)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setComponentDescription:(AudioComponentDescription *)a3;
- (void)setContainerBundleIdentifier:(id)a3;
- (void)setIsFirstParty:(BOOL)a3;
- (void)setParameterCount:(id)a3;
- (void)setVersion:(id)a3;
- (void)setVoices:(id)a3;
@end

@implementation TTSSynthesisProviderComponentRecord

- (NSArray)voices
{
  return self->_voices;
}

- (TTSSynthesisProviderComponentRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v109.receiver = self;
  v109.super_class = (Class)TTSSynthesisProviderComponentRecord;
  v5 = [(TTSSynthesisProviderComponentRecord *)&v109 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v13 = objc_msgSend_setWithObjects_(v6, v10, v7, v11, v12, v8, v9, 0);
    v16 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, @"voices", v15);
    objc_msgSend_setVoices_(v5, v17, (uint64_t)v16, v18, v19);

    uint64_t v20 = objc_opt_class();
    v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"isFirstParty", v22);
    uint64_t v28 = objc_msgSend_BOOLValue(v23, v24, v25, v26, v27);
    objc_msgSend_setIsFirstParty_(v5, v29, v28, v30, v31);

    uint64_t v32 = objc_opt_class();
    v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, @"bundleIdentifier", v34);
    objc_msgSend_setBundleIdentifier_(v5, v36, (uint64_t)v35, v37, v38);

    uint64_t v39 = objc_opt_class();
    v42 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, @"containerBundleIdentifier", v41);
    objc_msgSend_setContainerBundleIdentifier_(v5, v43, (uint64_t)v42, v44, v45);

    uint64_t v46 = objc_opt_class();
    v49 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"version", v48);
    objc_msgSend_setVersion_(v5, v50, (uint64_t)v49, v51, v52);

    uint64_t v53 = objc_opt_class();
    v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v54, v53, @"parameterCount", v55);
    objc_msgSend_setParameterCount_(v5, v57, (uint64_t)v56, v58, v59);

    uint64_t v60 = objc_opt_class();
    v63 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v60, @"auDescType", v62);
    LODWORD(v56) = objc_msgSend_intValue(v63, v64, v65, v66, v67);

    uint64_t v68 = objc_opt_class();
    v71 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, @"auDescSubType", v70);
    LODWORD(v63) = objc_msgSend_intValue(v71, v72, v73, v74, v75);

    uint64_t v76 = objc_opt_class();
    v79 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, @"auDescManufacturer", v78);
    int v84 = objc_msgSend_intValue(v79, v80, v81, v82, v83);

    uint64_t v85 = objc_opt_class();
    v88 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v86, v85, @"auDescFlags", v87);
    int v93 = objc_msgSend_unsignedIntValue(v88, v89, v90, v91, v92);

    uint64_t v94 = objc_opt_class();
    v97 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v95, v94, @"auDescFlagsMask", v96);
    int v102 = objc_msgSend_unsignedIntValue(v97, v98, v99, v100, v101);

    v108[0] = v56;
    v108[1] = v63;
    v108[2] = v84;
    v108[3] = v93;
    v108[4] = v102;
    objc_msgSend_setComponentDescription_(v5, v103, (uint64_t)v108, v104, v105);
    v106 = v5;
  }
  return v5;
}

- (void)setVoices:(id)a3
{
}

- (void)setVersion:(id)a3
{
}

- (void)setParameterCount:(id)a3
{
}

- (void)setIsFirstParty:(BOOL)a3
{
  self->_isFirstParty = a3;
}

- (void)setContainerBundleIdentifier:(id)a3
{
}

- (void)setComponentDescription:(AudioComponentDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->componentType;
  self->_componentDescription.componentFlagsMask = a3->componentFlagsMask;
  *(_OWORD *)&self->_componentDescription.componentType = v3;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (AudioComponentDescription)componentDescription
{
  *retstr = *(AudioComponentDescription *)((char *)self + 56);
  return self;
}

- (NSNumber)parameterCount
{
  return self->_parameterCount;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v86 = 0;
  uint64_t v87 = 0;
  unsigned int v88 = 0;
  id v4 = a3;
  objc_msgSend_componentDescription(self, v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v9, v86, v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"auDescType", v14);

  uint64_t v18 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v15, HIDWORD(v86), v16, v17);
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, @"auDescSubType", v20);

  v24 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v21, v87, v22, v23);
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, @"auDescManufacturer", v26);

  uint64_t v30 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v27, HIDWORD(v87), v28, v29);
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, @"auDescFlags", v32);

  v36 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v33, v88, v34, v35);
  objc_msgSend_encodeObject_forKey_(v4, v37, (uint64_t)v36, @"auDescFlagsMask", v38);

  v43 = objc_msgSend_bundleIdentifier(self, v39, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v43, @"bundleIdentifier", v45);

  v50 = objc_msgSend_containerBundleIdentifier(self, v46, v47, v48, v49);
  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)v50, @"containerBundleIdentifier", v52);

  v57 = objc_msgSend_version(self, v53, v54, v55, v56);
  objc_msgSend_encodeObject_forKey_(v4, v58, (uint64_t)v57, @"version", v59);

  uint64_t v60 = NSNumber;
  uint64_t isFirstParty = objc_msgSend_isFirstParty(self, v61, v62, v63, v64);
  v69 = objc_msgSend_numberWithBool_(v60, v66, isFirstParty, v67, v68);
  objc_msgSend_encodeObject_forKey_(v4, v70, (uint64_t)v69, @"isFirstParty", v71);

  uint64_t v76 = objc_msgSend_voices(self, v72, v73, v74, v75);
  objc_msgSend_encodeObject_forKey_(v4, v77, (uint64_t)v76, @"voices", v78);

  uint64_t v83 = objc_msgSend_parameterCount(self, v79, v80, v81, v82);
  objc_msgSend_encodeObject_forKey_(v4, v84, (uint64_t)v83, @"parameterCount", v85);
}

- (id)description
{
  long long v3 = NSString;
  v20.receiver = self;
  v20.super_class = (Class)TTSSynthesisProviderComponentRecord;
  id v4 = [(TTSSynthesisProviderComponentRecord *)&v20 description];
  uint64_t v9 = objc_msgSend_bundleIdentifier(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_voices(self, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_stringWithFormat_(v3, v15, @"%@ %@ %@", v16, v17, v4, v9, v14);

  return v18;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)isFirstParty
{
  return self->_isFirstParty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterCount, 0);
  objc_storeStrong((id *)&self->_voices, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end