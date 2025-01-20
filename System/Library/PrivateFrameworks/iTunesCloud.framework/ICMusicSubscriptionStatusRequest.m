@interface ICMusicSubscriptionStatusRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsFallbackToExpiredStatus;
- (BOOL)allowsFallbackToStatusNeedingReload;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBypassEnforcementOfPrivacyAcknowledgement;
- (BOOL)shouldIgnoreCache;
- (BOOL)shouldReturnLastKnownStatusOnly;
- (ICMusicSubscriptionStatusRequest)initWithCoder:(id)a3;
- (ICMusicSubscriptionStatusRequest)initWithStoreRequestContext:(id)a3;
- (ICStoreRequestContext)storeRequestContext;
- (NSUUID)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)carrierBundleProvisioningStyle;
- (int64_t)reason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsFallbackToExpiredStatus:(BOOL)a3;
- (void)setAllowsFallbackToStatusNeedingReload:(BOOL)a3;
- (void)setCarrierBundleProvisioningStyle:(int64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setShouldBypassEnforcementOfPrivacyAcknowledgement:(BOOL)a3;
- (void)setShouldIgnoreCache:(BOOL)a3;
- (void)setShouldReturnLastKnownStatusOnly:(BOOL)a3;
- (void)setStoreRequestContext:(id)a3;
@end

@implementation ICMusicSubscriptionStatusRequest

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; storeRequestContext = %@", self->_storeRequestContext];
  if (self->_allowsFallbackToExpiredStatus) {
    [v6 appendString:@"; allowsFallbackToExpiredStatus = YES"];
  }
  if (self->_allowsFallbackToStatusNeedingReload) {
    [v6 appendString:@"; allowsFallbackToStatusNeedingReload = YES"];
  }
  unint64_t carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
  if (carrierBundleProvisioningStyle > 2) {
    v8 = 0;
  }
  else {
    v8 = off_1E5AC99F8[carrierBundleProvisioningStyle];
  }
  [v6 appendFormat:@"; unint64_t carrierBundleProvisioningStyle = %@", v8];
  if (self->_reason == 1) {
    [v6 appendFormat:@"; reason = %@", @"deepLink"];
  }
  if (self->_shouldIgnoreCache) {
    [v6 appendString:@"; shouldIgnoreCache = YES"];
  }
  if (self->_shouldReturnLastKnownStatusOnly) {
    [v6 appendString:@"; shouldReturnLastKnownStatusOnly = YES"];
  }
  if (self->_shouldBypassEnforcementOfPrivacyAcknowledgement) {
    [v6 appendString:@"; shouldBypassEnforcementOfPrivacyAcknowledgement = YES"];
  }
  [v6 appendFormat:@"; requestIdentifier = %@", self->_requestIdentifier];
  [v6 appendString:@">"];

  return v6;
}

- (BOOL)shouldBypassEnforcementOfPrivacyAcknowledgement
{
  return self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
}

- (ICMusicSubscriptionStatusRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeRequestContext"];
  v6 = [(ICMusicSubscriptionStatusRequest *)self initWithStoreRequestContext:v5];
  if (v6)
  {
    v6->_allowsFallbackToExpiredStatus = [v4 decodeBoolForKey:@"allowsFallbackToExpiredStatus"];
    v6->_allowsFallbackToStatusNeedingReload = [v4 decodeBoolForKey:@"allowsFallbackToStatusNeedingReload"];
    v6->_unint64_t carrierBundleProvisioningStyle = [v4 decodeIntegerForKey:@"carrierBundleProvisioningStyle"];
    v6->_reason = [v4 decodeIntegerForKey:@"reason"];
    v6->_shouldIgnoreCache = [v4 decodeBoolForKey:@"shouldIgnoreCache"];
    v6->_shouldReturnLastKnownStatusOnly = [v4 decodeBoolForKey:@"shouldReturnLastKnownStatusOnly"];
    v6->_shouldBypassEnforcementOfPrivacyAcknowledgement = [v4 decodeBoolForKey:@"shouldBypassEnforcementOfPrivacyAcknowledgement"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
    requestIdentifier = v6->_requestIdentifier;
    v6->_requestIdentifier = (NSUUID *)v7;
  }
  return v6;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  self->_shouldIgnoreCache = a3;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (ICMusicSubscriptionStatusRequest)initWithStoreRequestContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICMusicSubscriptionStatusRequest;
  v5 = [(ICMusicSubscriptionStatusRequest *)&v12 init];
  v6 = (ICMusicSubscriptionStatusRequest *)v5;
  if (v5)
  {
    *(_WORD *)(v5 + 9) = 257;
    *((void *)v5 + 3) = 0;
    *((void *)v5 + 4) = 0;
    uint64_t v7 = [v4 copy];
    storeRequestContext = v6->_storeRequestContext;
    v6->_storeRequestContext = (ICStoreRequestContext *)v7;

    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    requestIdentifier = v6->_requestIdentifier;
    v6->_requestIdentifier = (NSUUID *)v9;
  }
  return v6;
}

- (void)setCarrierBundleProvisioningStyle:(int64_t)a3
{
  self->_unint64_t carrierBundleProvisioningStyle = a3;
}

- (void)setAllowsFallbackToStatusNeedingReload:(BOOL)a3
{
  self->_allowsFallbackToStatusNeedingReload = a3;
}

- (void)setAllowsFallbackToExpiredStatus:(BOOL)a3
{
  self->_allowsFallbackToExpiredStatus = a3;
}

- (void)setShouldReturnLastKnownStatusOnly:(BOOL)a3
{
  self->_shouldReturnLastKnownStatusOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (BOOL)shouldIgnoreCache
{
  return self->_shouldIgnoreCache;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL allowsFallbackToExpiredStatus = self->_allowsFallbackToExpiredStatus;
  id v5 = a3;
  [v5 encodeBool:allowsFallbackToExpiredStatus forKey:@"allowsFallbackToExpiredStatus"];
  [v5 encodeBool:self->_allowsFallbackToStatusNeedingReload forKey:@"allowsFallbackToStatusNeedingReload"];
  [v5 encodeInteger:self->_carrierBundleProvisioningStyle forKey:@"carrierBundleProvisioningStyle"];
  [v5 encodeInteger:self->_reason forKey:@"reason"];
  [v5 encodeBool:self->_shouldIgnoreCache forKey:@"shouldIgnoreCache"];
  [v5 encodeObject:self->_storeRequestContext forKey:@"storeRequestContext"];
  [v5 encodeBool:self->_shouldReturnLastKnownStatusOnly forKey:@"shouldReturnLastKnownStatusOnly"];
  [v5 encodeBool:self->_shouldBypassEnforcementOfPrivacyAcknowledgement forKey:@"shouldBypassEnforcementOfPrivacyAcknowledgement"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"requestIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithStoreRequestContext:self->_storeRequestContext];
  if (result)
  {
    *((unsigned char *)result + 9) = self->_allowsFallbackToExpiredStatus;
    *((unsigned char *)result + 10) = self->_allowsFallbackToStatusNeedingReload;
    *((void *)result + 4) = self->_carrierBundleProvisioningStyle;
    *((void *)result + 3) = self->_reason;
    *((unsigned char *)result + 8) = self->_shouldIgnoreCache;
    *((unsigned char *)result + 11) = self->_shouldReturnLastKnownStatusOnly;
    *((unsigned char *)result + 12) = self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
  }
  return result;
}

- (BOOL)shouldReturnLastKnownStatusOnly
{
  return self->_shouldReturnLastKnownStatusOnly;
}

- (BOOL)allowsFallbackToStatusNeedingReload
{
  return self->_allowsFallbackToStatusNeedingReload;
}

- (BOOL)allowsFallbackToExpiredStatus
{
  return self->_allowsFallbackToExpiredStatus;
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (void)setShouldBypassEnforcementOfPrivacyAcknowledgement:(BOOL)a3
{
  self->_shouldBypassEnforcementOfPrivacyAcknowledgement = a3;
}

- (int64_t)carrierBundleProvisioningStyle
{
  return self->_carrierBundleProvisioningStyle;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setStoreRequestContext:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICMusicSubscriptionStatusRequest *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(ICMusicSubscriptionStatusRequest *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      storeRequestContext = self->_storeRequestContext;
      uint64_t v7 = v5->_storeRequestContext;
      if (storeRequestContext == v7)
      {
      }
      else
      {
        v8 = v7;
        uint64_t v9 = storeRequestContext;
        BOOL v10 = [(ICStoreRequestContext *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_16;
        }
      }
      if (!self->_allowsFallbackToExpiredStatus != v5->_allowsFallbackToExpiredStatus
        && !self->_allowsFallbackToStatusNeedingReload != v5->_allowsFallbackToStatusNeedingReload
        && self->_carrierBundleProvisioningStyle == v5->_carrierBundleProvisioningStyle
        && self->_reason == v5->_reason
        && !self->_shouldIgnoreCache != v5->_shouldIgnoreCache
        && !self->_shouldReturnLastKnownStatusOnly != v5->_shouldReturnLastKnownStatusOnly)
      {
        BOOL v11 = !self->_shouldBypassEnforcementOfPrivacyAcknowledgement ^ v5->_shouldBypassEnforcementOfPrivacyAcknowledgement;
LABEL_17:

        goto LABEL_18;
      }
LABEL_16:
      BOOL v11 = 0;
      goto LABEL_17;
    }
    BOOL v11 = 0;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v168 = __ROR8__(v14 + v13, 32);
  uint64_t v172 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v164 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_storeRequestContext;
  uint64_t v19 = [(ICStoreRequestContext *)v18 hash];
  uint64_t v20 = (v17 + v164) ^ __ROR8__(v164, 51);
  uint64_t v21 = v168 + (v172 ^ v19);
  uint64_t v22 = __ROR8__(v172 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v164, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v169 = __ROR8__(v25, 32);
  uint64_t v173 = v24;
  uint64_t v161 = v23 ^ v19;
  uint64_t v165 = v25 ^ __ROR8__(v20, 47);

  uint64_t v176 = (self->_allowsFallbackToExpiredStatus | 0x1000000000000000) + 0x400000000000000;
  uint64_t allowsFallbackToStatusNeedingReload = self->_allowsFallbackToStatusNeedingReload;
  uint64_t v27 = v176;
  if ((v176 & 0x400000000000000) != 0)
  {
    if ((v176 & 0x300000000000000) != 0)
    {
      BOOL v156 = self->_allowsFallbackToStatusNeedingReload;
      v138 = [MEMORY[0x1E4F28B00] currentHandler];
      v139 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      objc_msgSend(v138, "handleFailureInFunction:file:lineNumber:description:", v139, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v176);

      uint64_t allowsFallbackToStatusNeedingReload = v156;
      uint64_t v27 = v176;
    }
    uint64_t v29 = v27 & 0xFFFFFFFFFFFFFFLL | (allowsFallbackToStatusNeedingReload << 32);
    uint64_t v30 = (v161 + v165) ^ __ROR8__(v165, 51);
    uint64_t v31 = v169 + (v29 ^ v173);
    uint64_t v32 = __ROR8__(v29 ^ v173, 48);
    uint64_t v33 = (v31 ^ v32) + __ROR8__(v161 + v165, 32);
    uint64_t v34 = v33 ^ __ROR8__(v31 ^ v32, 43);
    uint64_t v35 = v31 + v30;
    uint64_t v169 = __ROR8__(v35, 32);
    uint64_t v173 = v34;
    uint64_t v161 = v33 ^ v29;
    uint64_t v165 = v35 ^ __ROR8__(v30, 47);
    unint64_t v28 = v27 & 0xFF00000000000000;
  }
  else
  {
    if ((v176 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      BOOL v151 = self->_allowsFallbackToStatusNeedingReload;
      v125 = [MEMORY[0x1E4F28B00] currentHandler];
      v126 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      [v125 handleFailureInFunction:v126, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v176 file lineNumber description];

      uint64_t allowsFallbackToStatusNeedingReload = v151;
      uint64_t v27 = v176;
    }
    unint64_t v28 = v27 | allowsFallbackToStatusNeedingReload;
  }
  int64_t carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
  unint64_t v37 = v28 + 0x400000000000000;
  unint64_t v177 = v37;
  if ((v37 & 0x400000000000000) != 0)
  {
    if ((v37 & 0x300000000000000) != 0)
    {
      int64_t v157 = self->_carrierBundleProvisioningStyle;
      v140 = [MEMORY[0x1E4F28B00] currentHandler];
      v141 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      objc_msgSend(v140, "handleFailureInFunction:file:lineNumber:description:", v141, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v177);

      int64_t carrierBundleProvisioningStyle = v157;
      unint64_t v37 = v177;
    }
    uint64_t v44 = v37 & 0xFFFFFFFFFFFFFFLL | (carrierBundleProvisioningStyle << 32);
    uint64_t v45 = (v161 + v165) ^ __ROR8__(v165, 51);
    uint64_t v46 = v169 + (v44 ^ v173);
    uint64_t v47 = __ROR8__(v44 ^ v173, 48);
    uint64_t v48 = (v46 ^ v47) + __ROR8__(v161 + v165, 32);
    uint64_t v49 = v48 ^ __ROR8__(v46 ^ v47, 43);
    uint64_t v50 = v46 + v45;
    uint64_t v170 = __ROR8__(v50, 32);
    uint64_t v174 = v49;
    uint64_t v162 = v48 ^ v44;
    uint64_t v166 = v50 ^ __ROR8__(v45, 47);
    unint64_t v37 = v37 & 0xFF00000000000000 | HIDWORD(carrierBundleProvisioningStyle);
  }
  else
  {
    if ((v37 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      int64_t v152 = self->_carrierBundleProvisioningStyle;
      v127 = [MEMORY[0x1E4F28B00] currentHandler];
      v128 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      [v127 handleFailureInFunction:v128, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v177 file lineNumber description];

      int64_t carrierBundleProvisioningStyle = v152;
      unint64_t v37 = v177;
    }
    uint64_t v38 = (v161 + v165) ^ __ROR8__(v165, 51);
    uint64_t v39 = v169 + (v173 ^ carrierBundleProvisioningStyle);
    uint64_t v40 = __ROR8__(v173 ^ carrierBundleProvisioningStyle, 48);
    uint64_t v41 = (v39 ^ v40) + __ROR8__(v161 + v165, 32);
    uint64_t v42 = v41 ^ __ROR8__(v39 ^ v40, 43);
    uint64_t v43 = v39 + v38;
    uint64_t v170 = __ROR8__(v43, 32);
    uint64_t v174 = v42;
    uint64_t v162 = v41 ^ carrierBundleProvisioningStyle;
    uint64_t v166 = v43 ^ __ROR8__(v38, 47);
  }
  int64_t reason = self->_reason;
  unint64_t v52 = v37 + 0x800000000000000;
  unint64_t v178 = v52;
  if ((v52 & 0x400000000000000) != 0)
  {
    if ((v52 & 0x300000000000000) != 0)
    {
      int64_t v158 = self->_reason;
      v142 = [MEMORY[0x1E4F28B00] currentHandler];
      v143 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      objc_msgSend(v142, "handleFailureInFunction:file:lineNumber:description:", v143, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v178);

      int64_t reason = v158;
      unint64_t v52 = v178;
    }
    uint64_t v59 = v52 & 0xFFFFFFFFFFFFFFLL | (reason << 32);
    uint64_t v60 = (v162 + v166) ^ __ROR8__(v166, 51);
    uint64_t v61 = v170 + (v59 ^ v174);
    uint64_t v62 = __ROR8__(v59 ^ v174, 48);
    uint64_t v63 = (v61 ^ v62) + __ROR8__(v162 + v166, 32);
    uint64_t v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
    uint64_t v65 = v61 + v60;
    uint64_t v171 = __ROR8__(v65, 32);
    uint64_t v175 = v64;
    uint64_t v163 = v63 ^ v59;
    uint64_t v167 = v65 ^ __ROR8__(v60, 47);
    unint64_t v52 = v52 & 0xFF00000000000000 | HIDWORD(reason);
  }
  else
  {
    if ((v52 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      int64_t v153 = self->_reason;
      v129 = [MEMORY[0x1E4F28B00] currentHandler];
      v130 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      [v129 handleFailureInFunction:v130, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v178 file lineNumber description];

      int64_t reason = v153;
      unint64_t v52 = v178;
    }
    uint64_t v53 = (v162 + v166) ^ __ROR8__(v166, 51);
    uint64_t v54 = v170 + (v174 ^ reason);
    uint64_t v55 = __ROR8__(v174 ^ reason, 48);
    uint64_t v56 = (v54 ^ v55) + __ROR8__(v162 + v166, 32);
    uint64_t v57 = v56 ^ __ROR8__(v54 ^ v55, 43);
    uint64_t v58 = v54 + v53;
    uint64_t v171 = __ROR8__(v58, 32);
    uint64_t v175 = v57;
    uint64_t v163 = v56 ^ reason;
    uint64_t v167 = v58 ^ __ROR8__(v53, 47);
  }
  uint64_t shouldIgnoreCache = self->_shouldIgnoreCache;
  unint64_t v67 = v52 + 0x800000000000000;
  unint64_t v179 = v67;
  if ((v67 & 0x400000000000000) != 0)
  {
    if ((v67 & 0x300000000000000) != 0)
    {
      BOOL v159 = self->_shouldIgnoreCache;
      v144 = [MEMORY[0x1E4F28B00] currentHandler];
      v145 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      objc_msgSend(v144, "handleFailureInFunction:file:lineNumber:description:", v145, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v179);

      uint64_t shouldIgnoreCache = v159;
      unint64_t v67 = v179;
    }
    uint64_t v69 = v67 & 0xFFFFFFFFFFFFFFLL | (shouldIgnoreCache << 32);
    uint64_t v70 = (v163 + v167) ^ __ROR8__(v167, 51);
    uint64_t v71 = v171 + (v69 ^ v175);
    uint64_t v72 = __ROR8__(v69 ^ v175, 48);
    uint64_t v73 = (v71 ^ v72) + __ROR8__(v163 + v167, 32);
    uint64_t v74 = v73 ^ __ROR8__(v71 ^ v72, 43);
    uint64_t v75 = v71 + v70;
    uint64_t v171 = __ROR8__(v75, 32);
    uint64_t v175 = v74;
    uint64_t v163 = v73 ^ v69;
    uint64_t v167 = v75 ^ __ROR8__(v70, 47);
    unint64_t v68 = v67 & 0xFF00000000000000;
  }
  else
  {
    if ((v67 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      BOOL v154 = self->_shouldIgnoreCache;
      v131 = [MEMORY[0x1E4F28B00] currentHandler];
      v132 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      [v131 handleFailureInFunction:v132, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v179 file lineNumber description];

      uint64_t shouldIgnoreCache = v154;
      unint64_t v67 = v179;
    }
    unint64_t v68 = v67 | shouldIgnoreCache;
  }
  uint64_t shouldReturnLastKnownStatusOnly = self->_shouldReturnLastKnownStatusOnly;
  unint64_t v77 = v68 + 0x400000000000000;
  unint64_t v180 = v77;
  if ((v77 & 0x400000000000000) != 0)
  {
    if ((v77 & 0x300000000000000) != 0)
    {
      BOOL v160 = self->_shouldReturnLastKnownStatusOnly;
      v146 = [MEMORY[0x1E4F28B00] currentHandler];
      v147 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      objc_msgSend(v146, "handleFailureInFunction:file:lineNumber:description:", v147, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v180);

      uint64_t shouldReturnLastKnownStatusOnly = v160;
      unint64_t v77 = v180;
    }
    uint64_t v79 = v77 & 0xFFFFFFFFFFFFFFLL | (shouldReturnLastKnownStatusOnly << 32);
    uint64_t v80 = (v163 + v167) ^ __ROR8__(v167, 51);
    uint64_t v81 = v171 + (v79 ^ v175);
    uint64_t v82 = __ROR8__(v79 ^ v175, 48);
    uint64_t v83 = (v81 ^ v82) + __ROR8__(v163 + v167, 32);
    uint64_t v84 = v83 ^ __ROR8__(v81 ^ v82, 43);
    uint64_t v85 = v81 + v80;
    uint64_t v171 = __ROR8__(v85, 32);
    uint64_t v175 = v84;
    uint64_t v163 = v83 ^ v79;
    uint64_t v167 = v85 ^ __ROR8__(v80, 47);
    unint64_t v78 = v77 & 0xFF00000000000000;
  }
  else
  {
    if ((v77 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      BOOL v155 = self->_shouldReturnLastKnownStatusOnly;
      v133 = [MEMORY[0x1E4F28B00] currentHandler];
      v134 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      [v133 handleFailureInFunction:v134, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v180 file lineNumber description];

      uint64_t shouldReturnLastKnownStatusOnly = v155;
      unint64_t v77 = v180;
    }
    unint64_t v78 = v77 | shouldReturnLastKnownStatusOnly;
  }
  uint64_t shouldBypassEnforcementOfPrivacyAcknowledgement = self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
  unint64_t v87 = v78 + 0x400000000000000;
  unint64_t v181 = v87;
  if ((v87 & 0x400000000000000) != 0)
  {
    if ((v87 & 0x300000000000000) != 0)
    {
      BOOL v148 = self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
      v149 = [MEMORY[0x1E4F28B00] currentHandler];
      v150 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      objc_msgSend(v149, "handleFailureInFunction:file:lineNumber:description:", v150, @"MSVHasher+SipHash.h", 91, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld", v181);

      uint64_t shouldBypassEnforcementOfPrivacyAcknowledgement = v148;
      unint64_t v87 = v181;
    }
    uint64_t v89 = v87 & 0xFFFFFFFFFFFFFFLL | (shouldBypassEnforcementOfPrivacyAcknowledgement << 32);
    uint64_t v90 = (v163 + v167) ^ __ROR8__(v167, 51);
    uint64_t v91 = v171 + (v89 ^ v175);
    uint64_t v92 = __ROR8__(v89 ^ v175, 48);
    uint64_t v93 = (v91 ^ v92) + __ROR8__(v163 + v167, 32);
    uint64_t v94 = v93 ^ __ROR8__(v91 ^ v92, 43);
    uint64_t v95 = v91 + v90;
    uint64_t v171 = __ROR8__(v95, 32);
    uint64_t v175 = v94;
    uint64_t v163 = v93 ^ v89;
    uint64_t v167 = v95 ^ __ROR8__(v90, 47);
    unint64_t v88 = v87 & 0xFF00000000000000;
  }
  else
  {
    if ((v87 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      BOOL v135 = self->_shouldBypassEnforcementOfPrivacyAcknowledgement;
      v136 = [MEMORY[0x1E4F28B00] currentHandler];
      v137 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
      [v136 handleFailureInFunction:v137, @"MSVHasher+SipHash.h", 88, @"_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v181 file lineNumber description];

      uint64_t shouldBypassEnforcementOfPrivacyAcknowledgement = v135;
      unint64_t v87 = v181;
    }
    unint64_t v88 = v87 | shouldBypassEnforcementOfPrivacyAcknowledgement;
  }
  uint64_t v96 = (v163 + v167) ^ __ROR8__(v167, 51);
  uint64_t v97 = v171 + (v175 ^ (v88 + 0x400000000000000));
  uint64_t v98 = __ROR8__(v175 ^ (v88 + 0x400000000000000), 48);
  uint64_t v99 = (v97 ^ v98) + __ROR8__(v163 + v167, 32);
  uint64_t v100 = v99 ^ __ROR8__(v97 ^ v98, 43);
  uint64_t v101 = v97 + v96;
  uint64_t v102 = v101 ^ __ROR8__(v96, 47);
  unint64_t v103 = (v99 ^ (v88 + 0x400000000000000)) + v102;
  uint64_t v104 = v103 ^ __ROR8__(v102, 51);
  uint64_t v105 = (__ROR8__(v101, 32) ^ 0xFFLL) + v100;
  uint64_t v106 = __ROR8__(v100, 48);
  uint64_t v107 = __ROR8__(v103, 32) + (v105 ^ v106);
  uint64_t v108 = v107 ^ __ROR8__(v105 ^ v106, 43);
  uint64_t v109 = v104 + v105;
  uint64_t v110 = v109 ^ __ROR8__(v104, 47);
  uint64_t v111 = v110 + v107;
  uint64_t v112 = v111 ^ __ROR8__(v110, 51);
  uint64_t v113 = __ROR8__(v109, 32) + v108;
  uint64_t v114 = __ROR8__(v108, 48);
  uint64_t v115 = __ROR8__(v111, 32) + (v113 ^ v114);
  uint64_t v116 = v115 ^ __ROR8__(v113 ^ v114, 43);
  uint64_t v117 = v112 + v113;
  uint64_t v118 = v117 ^ __ROR8__(v112, 47);
  uint64_t v119 = v118 + v115;
  uint64_t v120 = v119 ^ __ROR8__(v118, 51);
  uint64_t v121 = __ROR8__(v117, 32) + v116;
  uint64_t v122 = __ROR8__(v116, 48);
  uint64_t v123 = __ROR8__(v119, 32) + (v121 ^ v122);
  return (v120 + v121) ^ __ROR8__(v120, 47) ^ v123 ^ __ROR8__(v120 + v121, 32) ^ v123 ^ __ROR8__(v121 ^ v122, 43);
}

@end