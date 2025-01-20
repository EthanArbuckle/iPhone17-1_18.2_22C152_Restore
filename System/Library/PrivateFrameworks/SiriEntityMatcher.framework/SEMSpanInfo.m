@interface SEMSpanInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isAliasMatch;
- (BOOL)isApproximateMatch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpanInfo:(id)a3;
- (BOOL)isPartialMatch;
- (SEMSpanInfo)init;
- (SEMSpanInfo)initWithCoder:(id)a3;
- (SEMSpanInfo)initWithValue:(id)a3 location:(unsigned int)a4 length:(unsigned int)a5 matchScore:(float)a6 maxTokenCount:(unsigned int)a7 matchedTokenCount:(unsigned int)a8 maxStopWordCount:(unsigned int)a9 matchedStopWordCount:(unsigned int)a10 maxAliasCount:(unsigned int)a11 matchedAliasCount:(unsigned int)a12 editDistance:(unsigned int)a13 aliasMatchOptions:(unsigned __int16)a14;
- (_NSRange)spanRange;
- (float)matchScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getAliasTypesArray;
- (id)value;
- (unint64_t)hash;
- (unsigned)aliasMatchOptions;
- (unsigned)editDistance;
- (unsigned)matchedAliasCount;
- (unsigned)matchedStopWordCount;
- (unsigned)matchedTokenCount;
- (unsigned)maxAliasCount;
- (unsigned)maxStopWordCount;
- (unsigned)maxTokenCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEMSpanInfo

- (SEMSpanInfo)initWithValue:(id)a3 location:(unsigned int)a4 length:(unsigned int)a5 matchScore:(float)a6 maxTokenCount:(unsigned int)a7 matchedTokenCount:(unsigned int)a8 maxStopWordCount:(unsigned int)a9 matchedStopWordCount:(unsigned int)a10 maxAliasCount:(unsigned int)a11 matchedAliasCount:(unsigned int)a12 editDistance:(unsigned int)a13 aliasMatchOptions:(unsigned __int16)a14
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v22 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SEMSpanInfo;
  v26 = [(SEMSpanInfo *)&v34 init];
  if (!v26) {
    goto LABEL_5;
  }
  if (!objc_msgSend_length(v22, v23, v24, v25))
  {
    uint64_t v28 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      v27 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v36 = "-[SEMSpanInfo initWithValue:location:length:matchScore:maxTokenCount:matchedTokenCount:maxStopWordCount:matche"
          "dStopWordCount:maxAliasCount:matchedAliasCount:editDistance:aliasMatchOptions:]";
    v29 = "%s Cannot initialize span info with empty value";
    v30 = v28;
    uint32_t v31 = 12;
LABEL_12:
    _os_log_error_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_9;
  }
  if (!a5)
  {
    uint64_t v32 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315394;
    v36 = "-[SEMSpanInfo initWithValue:location:length:matchScore:maxTokenCount:matchedTokenCount:maxStopWordCount:matche"
          "dStopWordCount:maxAliasCount:matchedAliasCount:editDistance:aliasMatchOptions:]";
    __int16 v37 = 2112;
    id v38 = v22;
    v29 = "%s Cannot initialize span info with zero length. value: %@";
    v30 = v32;
    uint32_t v31 = 22;
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v26->_value, a3);
  v26->_location = a4;
  v26->_length = a5;
  v26->_matchScore = a6;
  v26->_maxTokenCount = a7;
  v26->_matchedTokenCount = a8;
  v26->_maxStopWordCount = a9;
  v26->_matchedStopWordCount = a10;
  v26->_maxAliasCount = a11;
  v26->_matchedAliasCount = a12;
  v26->_editDistance = a13;
  v26->_aliasMatchOptions = a14;
LABEL_5:
  v27 = v26;
LABEL_10:

  return v27;
}

- (SEMSpanInfo)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_NSRange)spanRange
{
  NSUInteger length = self->_length;
  NSUInteger location = self->_location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)value
{
  return self->_value;
}

- (float)matchScore
{
  return self->_matchScore;
}

- (unsigned)maxTokenCount
{
  return self->_maxTokenCount;
}

- (unsigned)matchedTokenCount
{
  return self->_matchedTokenCount;
}

- (unsigned)maxStopWordCount
{
  return self->_maxStopWordCount;
}

- (unsigned)matchedStopWordCount
{
  return self->_matchedStopWordCount;
}

- (unsigned)maxAliasCount
{
  return self->_maxAliasCount;
}

- (unsigned)matchedAliasCount
{
  return self->_matchedAliasCount;
}

- (unsigned)editDistance
{
  return self->_editDistance;
}

- (unsigned)aliasMatchOptions
{
  return self->_aliasMatchOptions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_value, v9, (uint64_t)a3, v10);
  v12 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v11;

  *(_DWORD *)(v8 + 16) = self->_location;
  *(_DWORD *)(v8 + 20) = self->_length;
  *(float *)(v8 + 24) = self->_matchScore;
  *(_DWORD *)(v8 + 28) = self->_maxTokenCount;
  *(_DWORD *)(v8 + 32) = self->_matchedTokenCount;
  *(_DWORD *)(v8 + 36) = self->_maxStopWordCount;
  *(_DWORD *)(v8 + 40) = self->_matchedStopWordCount;
  *(_DWORD *)(v8 + 44) = self->_maxAliasCount;
  *(_DWORD *)(v8 + 48) = self->_matchedAliasCount;
  *(_DWORD *)(v8 + 52) = self->_editDistance;
  *(_WORD *)(v8 + 56) = self->_aliasMatchOptions;
  return (id)v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SEMSpanInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToSpanInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToSpanInfo = objc_msgSend_isEqualToSpanInfo_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToSpanInfo = 0;
  }

  return isEqualToSpanInfo;
}

- (BOOL)isEqualToSpanInfo:(id)a3
{
  id v6 = a3;
  uint64_t v10 = v6;
  value = self->_value;
  v12 = value;
  if (!value)
  {
    v3 = objc_msgSend_value(v6, v7, v8, v9);
    if (!v3)
    {
      int v15 = 0;
      goto LABEL_8;
    }
    v12 = self->_value;
  }
  v4 = objc_msgSend_value(v10, v7, v8, v9);
  if (!objc_msgSend_isEqual_(v12, v13, (uint64_t)v4, v14))
  {
    BOOL v16 = 0;
    goto LABEL_21;
  }
  int v15 = 1;
LABEL_8:
  uint64_t v17 = objc_msgSend_spanRange(self, v7, v8, v9);
  v19 = v18;
  if (v17 != objc_msgSend_spanRange(v10, v18, v20, v21)) {
    goto LABEL_20;
  }
  if (v19 != v22) {
    goto LABEL_20;
  }
  float matchScore = self->_matchScore;
  objc_msgSend_matchScore(v10, v22, v23, v24);
  if (matchScore != v29
    || (unsigned int maxTokenCount = self->_maxTokenCount,
        maxTokenCount != objc_msgSend_maxTokenCount(v10, v26, v27, v28))
    || (unsigned int matchedTokenCount = self->_matchedTokenCount,
        matchedTokenCount != objc_msgSend_matchedTokenCount(v10, v31, v32, v33))
    || (unsigned int maxStopWordCount = self->_maxStopWordCount,
        maxStopWordCount != objc_msgSend_maxStopWordCount(v10, v35, v36, v37))
    || (unsigned int matchedStopWordCount = self->_matchedStopWordCount,
        matchedStopWordCount != objc_msgSend_matchedStopWordCount(v10, v39, v40, v41))
    || (unsigned int maxAliasCount = self->_maxAliasCount,
        maxAliasCount != objc_msgSend_maxAliasCount(v10, v43, v44, v45))
    || (unsigned int matchedAliasCount = self->_matchedAliasCount,
        matchedAliasCount != objc_msgSend_matchedAliasCount(v10, v47, v48, v49))
    || (unsigned int editDistance = self->_editDistance, editDistance != objc_msgSend_editDistance(v10, v51, v52, v53)))
  {
LABEL_20:
    BOOL v16 = 0;
    if (!v15) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  int aliasMatchOptions = self->_aliasMatchOptions;
  BOOL v16 = aliasMatchOptions == objc_msgSend_aliasMatchOptions(v10, v55, v56, v57);
  if (v15) {
LABEL_21:
  }

LABEL_22:
  if (!value) {

  }
  return v16;
}

- (id)description
{
  value = self->_value;
  if (value)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"value: \"%@\" ", v3, value);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = &stru_2709E04D0;
  }
  v47 = NSString;
  uint64_t v7 = (void *)MEMORY[0x263F08D40];
  uint64_t v8 = objc_msgSend_spanRange(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_valueWithRange_(v7, v9, v8, (uint64_t)v9);
  uint64_t v14 = objc_msgSend_matchedTokenCount(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_maxTokenCount(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_matchedStopWordCount(self, v19, v20, v21);
  uint64_t v26 = objc_msgSend_maxStopWordCount(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_matchedAliasCount(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_maxAliasCount(self, v31, v32, v33);
  uint64_t v38 = objc_msgSend_editDistance(self, v35, v36, v37);
  objc_msgSend_matchScore(self, v39, v40, v41);
  uint64_t v45 = objc_msgSend_stringWithFormat_(v47, v43, @"%@%@ tokens matched: (%u/%u) stop words: (%u/%u) alias: (%u/%u) edit distance: %u match score: %f", v44, v6, v10, v14, v18, v22, v26, v30, v34, v38, v42);

  return v45;
}

- (unint64_t)hash
{
  uint64_t v79 = objc_msgSend_hash(self->_value, a2, v2, v3);
  v85 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, self->_location, v6);
  uint64_t v78 = objc_msgSend_hash(v85, v7, v8, v9);
  v84 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v10, self->_length, v11);
  uint64_t v77 = objc_msgSend_hash(v84, v12, v13, v14);
  *(float *)&double v15 = self->_matchScore;
  v83 = objc_msgSend_numberWithFloat_(NSNumber, v16, v17, v18, v15);
  uint64_t v76 = objc_msgSend_hash(v83, v19, v20, v21);
  v82 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v22, self->_maxTokenCount, v23);
  uint64_t v75 = objc_msgSend_hash(v82, v24, v25, v26);
  v81 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v27, self->_matchedTokenCount, v28);
  uint64_t v74 = objc_msgSend_hash(v81, v29, v30, v31);
  v80 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v32, self->_maxStopWordCount, v33);
  uint64_t v73 = objc_msgSend_hash(v80, v34, v35, v36);
  uint64_t v39 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v37, self->_matchedStopWordCount, v38);
  uint64_t v43 = objc_msgSend_hash(v39, v40, v41, v42);
  v46 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v44, self->_maxAliasCount, v45);
  uint64_t v50 = objc_msgSend_hash(v46, v47, v48, v49);
  uint64_t v53 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v51, self->_matchedAliasCount, v52);
  uint64_t v57 = objc_msgSend_hash(v53, v54, v55, v56);
  v60 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v58, self->_editDistance, v59);
  uint64_t v64 = objc_msgSend_hash(v60, v61, v62, v63);
  v67 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v65, self->_aliasMatchOptions, v66);
  unint64_t v71 = v78 ^ v79 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v43 ^ v50 ^ v57 ^ v64 ^ objc_msgSend_hash(v67, v68, v69, v70);

  return v71;
}

- (BOOL)isPartialMatch
{
  int v5 = objc_msgSend_matchedTokenCount(self, a2, v2, v3);
  return v5 != objc_msgSend_maxTokenCount(self, v6, v7, v8);
}

- (BOOL)isApproximateMatch
{
  return objc_msgSend_editDistance(self, a2, v2, v3) != 0;
}

- (BOOL)isAliasMatch
{
  return objc_msgSend_matchedAliasCount(self, a2, v2, v3) != 0;
}

- (id)getAliasTypesArray
{
  uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2, v3);
  unsigned __int16 aliasMatchOptions = self->_aliasMatchOptions;
  if (aliasMatchOptions)
  {
    uint64_t v9 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, 1, v6);
    objc_msgSend_addObject_(v7, v10, (uint64_t)v9, v11);

    unsigned __int16 aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 2) != 0)
  {
    uint64_t v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, 5, v6);
    objc_msgSend_addObject_(v7, v13, (uint64_t)v12, v14);

    unsigned __int16 aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 4) != 0)
  {
    double v15 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, 6, v6);
    objc_msgSend_addObject_(v7, v16, (uint64_t)v15, v17);

    unsigned __int16 aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 8) != 0)
  {
    uint64_t v18 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, 3, v6);
    objc_msgSend_addObject_(v7, v19, (uint64_t)v18, v20);

    unsigned __int16 aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 0x10) != 0)
  {
    uint64_t v21 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, 9, v6);
    objc_msgSend_addObject_(v7, v22, (uint64_t)v21, v23);

    unsigned __int16 aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 0x20) != 0)
  {
    uint64_t v24 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, 8, v6);
    objc_msgSend_addObject_(v7, v25, (uint64_t)v24, v26);

    unsigned __int16 aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 0x40) != 0)
  {
    uint64_t v27 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, 10, v6);
    objc_msgSend_addObject_(v7, v28, (uint64_t)v27, v29);

    unsigned __int16 aliasMatchOptions = self->_aliasMatchOptions;
  }
  if ((aliasMatchOptions & 0x80) != 0)
  {
    uint64_t v30 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, 11, v6);
    objc_msgSend_addObject_(v7, v31, (uint64_t)v30, v32);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SEMSpanInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SEMSpanInfo;
  int v5 = [(SEMSpanInfo *)&v34 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"value");
    value = v5->_value;
    v5->_value = (NSString *)v8;

    v5->_NSUInteger location = objc_msgSend_decodeInt32ForKey_(v4, v10, @"location", v11);
    v5->_NSUInteger length = objc_msgSend_decodeInt32ForKey_(v4, v12, @"length", v13);
    objc_msgSend_decodeFloatForKey_(v4, v14, @"matchScore", v15);
    v5->_float matchScore = v16;
    v5->_unsigned int maxTokenCount = objc_msgSend_decodeInt32ForKey_(v4, v17, @"maxTokenCount", v18);
    v5->_unsigned int matchedTokenCount = objc_msgSend_decodeInt32ForKey_(v4, v19, @"matchedTokenCount", v20);
    v5->_unsigned int maxStopWordCount = objc_msgSend_decodeInt32ForKey_(v4, v21, @"maxStopWordCount", v22);
    v5->_unsigned int matchedStopWordCount = objc_msgSend_decodeInt32ForKey_(v4, v23, @"matchedStopWordCount", v24);
    v5->_unsigned int maxAliasCount = objc_msgSend_decodeInt32ForKey_(v4, v25, @"maxAliasCount ", v26);
    v5->_unsigned int matchedAliasCount = objc_msgSend_decodeInt32ForKey_(v4, v27, @"matchedAliasCount", v28);
    v5->_unsigned int editDistance = objc_msgSend_decodeInt32ForKey_(v4, v29, @"editDistance", v30);
    v5->_unsigned __int16 aliasMatchOptions = objc_msgSend_decodeIntForKey_(v4, v31, @"aliasMatchOptions", v32);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  objc_msgSend_encodeObject_forKey_(v18, v4, (uint64_t)self->_value, @"value");
  objc_msgSend_encodeInt32_forKey_(v18, v5, self->_location, @"location");
  objc_msgSend_encodeInt32_forKey_(v18, v6, self->_length, @"length");
  *(float *)&double v7 = self->_matchScore;
  objc_msgSend_encodeFloat_forKey_(v18, v8, @"matchScore", v9, v7);
  objc_msgSend_encodeInt32_forKey_(v18, v10, self->_maxTokenCount, @"maxTokenCount");
  objc_msgSend_encodeInt32_forKey_(v18, v11, self->_matchedTokenCount, @"matchedTokenCount");
  objc_msgSend_encodeInt32_forKey_(v18, v12, self->_maxStopWordCount, @"maxStopWordCount");
  objc_msgSend_encodeInt32_forKey_(v18, v13, self->_matchedStopWordCount, @"matchedStopWordCount");
  objc_msgSend_encodeInt32_forKey_(v18, v14, self->_maxAliasCount, @"maxAliasCount ");
  objc_msgSend_encodeInt32_forKey_(v18, v15, self->_matchedAliasCount, @"matchedAliasCount");
  objc_msgSend_encodeInt32_forKey_(v18, v16, self->_editDistance, @"editDistance");
  objc_msgSend_encodeInt_forKey_(v18, v17, self->_aliasMatchOptions, @"aliasMatchOptions");
}

- (void).cxx_destruct
{
}

@end