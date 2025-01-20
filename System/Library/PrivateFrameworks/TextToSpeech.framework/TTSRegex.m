@interface TTSRegex
- (TTSRegex)initWithCStringPattern:(const char *)a3;
- (TTSRegex)initWithCStringPattern:(const char *)a3 options:(unint64_t)a4;
- (TTSRegex)initWithPattern:(id)a3;
- (TTSRegex)initWithPattern:(id)a3 options:(unint64_t)a4;
- (TTSRegex)initWithPerlPattern:(id)a3;
- (id)_matchFromOvector:(unint64_t *)a3 matches:(int)a4 string:(const char *)a5 length:(unint64_t)a6;
- (id)matchesInCString:(const char *)a3 length:(unint64_t)a4;
- (pcre2_real_code_8)compiledPCRERegex;
- (void)dealloc;
- (void)enumerateMatchesInCString:(const char *)a3 length:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateMatchesInCString:(const char *)a3 ranges:(id)a4 usingBlock:(id)a5;
- (void)enumerateMatchesInCString:(const char *)a3 startOffset:(unint64_t)a4 length:(unint64_t)a5 usingBlock:(id)a6;
- (void)setCompiledPCRERegex:(pcre2_real_code_8 *)a3;
@end

@implementation TTSRegex

- (void)dealloc
{
  if (objc_msgSend_compiledPCRERegex(self, a2, v2, v3, v4))
  {
    uint64_t v10 = objc_msgSend_compiledPCRERegex(self, v6, v7, v8, v9);
    pcre2_code_free_8(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)TTSRegex;
  [(TTSRegex *)&v11 dealloc];
}

- (TTSRegex)initWithPerlPattern:(id)a3
{
  id v4 = a3;
  int hasSuffix = objc_msgSend_hasSuffix_(v4, v5, @"/i", v6, v7);
  int v16 = objc_msgSend_hasSuffix_(v4, v9, @"/i", v10, v11);
  if (hasSuffix)
  {
    uint64_t v17 = objc_msgSend_length(v4, v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_substringToIndex_(v4, v18, v17 - 1, v19, v20);

    id v4 = (id)v21;
  }
  if (v16) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 1;
  }
  uint64_t v23 = objc_msgSend_length(v4, v12, v13, v14, v15);
  v26 = objc_msgSend_substringWithRange_(v4, v24, 1, v23 - 2, v25);

  v29 = (TTSRegex *)objc_msgSend_initWithPattern_options_(self, v27, (uint64_t)v26, v22, v28);
  return v29;
}

- (TTSRegex)initWithPattern:(id)a3
{
  return (TTSRegex *)objc_msgSend_initWithPattern_options_(self, a2, (uint64_t)a3, 1, v3);
}

- (TTSRegex)initWithPattern:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_cStringUsingEncoding_(v6, v7, 4, v8, v9);

  return (TTSRegex *)MEMORY[0x1F4181798](self, sel_initWithCStringPattern_options_, v10, a4, v11);
}

- (TTSRegex)initWithCStringPattern:(const char *)a3
{
  return (TTSRegex *)((uint64_t (*)(TTSRegex *, char *, const char *, uint64_t))MEMORY[0x1F4181798])(self, sel_initWithCStringPattern_options_, a3, 1);
}

- (TTSRegex)initWithCStringPattern:(const char *)a3 options:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)TTSRegex;
  v5 = [(TTSRegex *)&v19 init];
  if (!v5) {
    goto LABEL_4;
  }
  int v18 = 0;
  uint64_t v17 = 0;
  uint64_t v6 = pcre2_compile_8((uint64_t)a3);
  if (v6)
  {
    objc_msgSend_setCompiledPCRERegex_(v5, v7, v6, v8, v9);
LABEL_4:
    uint64_t v10 = v5;
    goto LABEL_8;
  }
  pcre2_get_error_message_8(v18, (uint64_t)v20, 512);
  uint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)v20, v12, v13);
  uint64_t v15 = AXTTSLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1A688DBC8(&v17, (uint64_t)v14, v15);
  }

  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (void)enumerateMatchesInCString:(const char *)a3 length:(unint64_t)a4 usingBlock:(id)a5
{
}

- (void)enumerateMatchesInCString:(const char *)a3 startOffset:(unint64_t)a4 length:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v9 = (void (**)(id, uint64_t))a6;
  uint64_t v14 = objc_msgSend_compiledPCRERegex(self, v10, v11, v12, v13);
  uint64_t v15 = pcre2_match_data_create_from_pattern_8(v14, 0);
  uint64_t v20 = objc_msgSend_compiledPCRERegex(self, v16, v17, v18, v19);
  uint64_t matched = pcre2_match_8(v20);
  if (matched == -1)
  {
    pcre2_match_data_free_8((uint64_t)v15);
    goto LABEL_33;
  }
  uint64_t v22 = matched;
  ovector_pointer_8 = (void *)pcre2_get_ovector_pointer_8((uint64_t)v15);
  uint64_t v25 = objc_msgSend__matchFromOvector_matches_string_length_(self, v24, (uint64_t)ovector_pointer_8, v22, (uint64_t)a3, a5);
  if (v25) {
    v9[2](v9, v25);
  }
  v37 = (void *)v25;
  HIDWORD(v40) = 0;
  pcre2_pattern_info_8(v14, 0, (uint64_t *)((char *)&v40 + 4));
  int v39 = HIDWORD(v40);
  LODWORD(v40) = 0;
  pcre2_pattern_info_8(v14, 0x14u, &v40);
  unsigned int v38 = v40 - 3;
  while (1)
  {
    while (1)
    {
      unint64_t v26 = ovector_pointer_8[1];
      if (*ovector_pointer_8 != v26) {
        break;
      }
      if (v26 == a5) {
        goto LABEL_32;
      }
      uint64_t v28 = pcre2_match_8(v14);
      if (v28 != -1) {
        goto LABEL_15;
      }
      unint64_t v29 = v26 + 1;
      ovector_pointer_8[1] = v26 + 1;
      if (v38 <= 2 && v26 < a5 - 1 && a3[v26] == 13 && a3[v29] == 10)
      {
        ovector_pointer_8[1] = v26 + 2;
      }
      else if ((v39 & 0x80000) != 0 && v29 < a5)
      {
        do
        {
          if ((a3[v29] & 0xC0) != 0x80) {
            break;
          }
          ovector_pointer_8[1] = ++v29;
        }
        while (a5 != v29);
      }
    }
    unint64_t startchar_8 = pcre2_get_startchar_8((uint64_t)v15);
    if (v26 <= startchar_8)
    {
      if (startchar_8 >= a5) {
        goto LABEL_32;
      }
      unint64_t v32 = startchar_8 + 1;
      if ((v39 & 0x80000) != 0 && v32 < a5)
      {
        do
        {
          if ((a3[v32] & 0xC0) != 0x80) {
            break;
          }
          ++v32;
        }
        while (a5 != v32);
      }
    }
    uint64_t v28 = pcre2_match_8(v14);
    if (v28 == -1) {
      goto LABEL_32;
    }
LABEL_15:
    if ((v28 & 0x80000000) != 0) {
      break;
    }
    v31 = objc_msgSend__matchFromOvector_matches_string_length_(self, v27, (uint64_t)ovector_pointer_8, v28, (uint64_t)a3, a5, v37);
    v9[2](v9, (uint64_t)v31);
  }
  AXTTSLogCommon();
  v33 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR)) {
    sub_1A688DC54(v28, v33, v34, v35, v36);
  }

LABEL_32:
  pcre2_match_data_free_8((uint64_t)v15);

LABEL_33:
}

- (void)enumerateMatchesInCString:(const char *)a3 ranges:(id)a4 usingBlock:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v8);
        }
        uint64_t v19 = objc_msgSend_rangeValue(*(void **)(*((void *)&v21 + 1) + 8 * v18), v12, v13, v14, v15);
        objc_msgSend_enumerateMatchesInCString_startOffset_length_usingBlock_(self, v20, (uint64_t)a3, v19, (uint64_t)&v20[v19], v9);
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v16);
  }
}

- (id)matchesInCString:(const char *)a3 length:(unint64_t)a4
{
  id v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3, a4, v4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1A6702D70;
  v12[3] = &unk_1E5C69BA0;
  id v9 = v8;
  id v13 = v9;
  objc_msgSend_enumerateMatchesInCString_length_usingBlock_(self, v10, (uint64_t)a3, a4, (uint64_t)v12);

  return v9;
}

- (id)_matchFromOvector:(unint64_t *)a3 matches:(int)a4 string:(const char *)a5 length:(unint64_t)a6
{
  uint64_t v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, a6);
  if (a4 < 1)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    id v13 = a3 + 1;
    uint64_t v14 = a4;
    do
    {
      uint64_t v15 = *(v13 - 1);
      if (v15 == -1 && v12 == 0)
      {
        uint64_t v12 = 0;
      }
      else
      {
        uint64_t v17 = *v13 - v15;
        if (v15 == -1) {
          uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v18 = *(v13 - 1);
        }
        if (v12)
        {
          uint64_t v19 = objc_alloc_init(TTSRegexCaptureGroup);
          objc_msgSend_setUtf8Range_(v19, v20, v18, v17, v21);
          objc_msgSend_addObject_(v11, v22, (uint64_t)v19, v23, v24);
        }
        else
        {
          uint64_t v12 = objc_alloc_init(TTSRegexMatch);
          objc_msgSend_setUtf8Range_(v12, v25, v18, v17, v26);
        }
      }
      v13 += 2;
      --v14;
    }
    while (v14);
  }
  objc_msgSend_setCaptureGroups_(v12, v8, (uint64_t)v11, v9, v10);

  return v12;
}

- (pcre2_real_code_8)compiledPCRERegex
{
  return self->_compiledPCRERegex;
}

- (void)setCompiledPCRERegex:(pcre2_real_code_8 *)a3
{
  self->_compiledPCRERegex = a3;
}

@end