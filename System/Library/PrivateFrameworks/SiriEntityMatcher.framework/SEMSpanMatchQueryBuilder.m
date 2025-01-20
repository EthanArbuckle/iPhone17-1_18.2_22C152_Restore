@interface SEMSpanMatchQueryBuilder
+ (id)getASRPhoneSequence:(id)a3;
- (SEMSpanMatchQueryBuilder)init;
- (SEMSpanMatchQueryBuilder)initWithLocale:(id)a3;
- (SEMSpanMatchQueryBuilder)initWithLocale:(id)a3 originalText:(id)a4;
- (SEMSpanMatchQueryBuilder)initWithLocale:(id)a3 originalText:(id)a4 asrHypothesis:(id)a5;
- (id).cxx_construct;
- (id)_initWithLocale:(id)a3 originalText:(id)a4 asrHypothesis:(id)a5;
- (id)build;
- (void)addTokenWithValue:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 beginIndex:(unsigned int)a6 endIndex:(unsigned int)a7 isSignificant:(BOOL)a8 isWhitespace:(BOOL)a9;
@end

@implementation SEMSpanMatchQueryBuilder

- (SEMSpanMatchQueryBuilder)initWithLocale:(id)a3
{
  return (SEMSpanMatchQueryBuilder *)MEMORY[0x270F9A6D0](self, sel__initWithLocale_originalText_asrHypothesis_, a3, 0);
}

- (SEMSpanMatchQueryBuilder)initWithLocale:(id)a3 originalText:(id)a4
{
  return (SEMSpanMatchQueryBuilder *)MEMORY[0x270F9A6D0](self, sel__initWithLocale_originalText_asrHypothesis_, a3, a4);
}

- (SEMSpanMatchQueryBuilder)initWithLocale:(id)a3 originalText:(id)a4 asrHypothesis:(id)a5
{
  return (SEMSpanMatchQueryBuilder *)MEMORY[0x270F9A6D0](self, sel__initWithLocale_originalText_asrHypothesis_, a3, a4);
}

- (id)_initWithLocale:(id)a3 originalText:(id)a4 asrHypothesis:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SEMSpanMatchQueryBuilder;
  id v14 = [(SEMSpanMatchQueryBuilder *)&v23 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    v16 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v15;

    if (v9)
    {
      uint64_t v19 = objc_msgSend_lowercaseStringWithLocale_(v9, v17, *((void *)v14 + 1), v18);
      v20 = (void *)*((void *)v14 + 2);
      *((void *)v14 + 2) = v19;
    }
    else
    {
      id v21 = objc_alloc_init(MEMORY[0x263F089D8]);
      v20 = (void *)*((void *)v14 + 3);
      *((void *)v14 + 3) = v21;
    }

    objc_storeStrong((id *)v14 + 10, a5);
  }

  return v14;
}

- (SEMSpanMatchQueryBuilder)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)addTokenWithValue:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 beginIndex:(unsigned int)a6 endIndex:(unsigned int)a7 isSignificant:(BOOL)a8 isWhitespace:(BOOL)a9
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v61 = a4;
  id v17 = a5;
  if (!v14)
  {
    v27 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[SEMSpanMatchQueryBuilder addTokenWithValue:cleanValue:normalizedValues:beginIndex:endIndex:"
                           "isSignificant:isWhitespace:]";
      _os_log_error_impl(&dword_25C7CA000, v27, OS_LOG_TYPE_ERROR, "%s skipping nil token value", buf, 0xCu);
    }
    goto LABEL_68;
  }
  if (!self->_originalText)
  {
    originalTextMutable = self->_originalTextMutable;
    if (v61) {
      objc_msgSend_appendString_(originalTextMutable, v15, (uint64_t)v61, v16);
    }
    else {
      objc_msgSend_appendString_(originalTextMutable, v15, (uint64_t)v14, v16);
    }
  }
  *(_OWORD *)buf = 0u;
  long long v78 = 0u;
  uint64_t v79 = 0x100003F800000;
  __int16 v80 = 3;
  int v81 = 0;
  v60 = v17;
  sub_25C80DDA4(v14, (uint64_t)__dst);
  unint64_t v19 = BYTE7(v65);
  v20 = (void **)__dst[0];
  id v21 = __dst[1];
  sub_25C80DDA4(v61, (uint64_t)&__p);
  if ((v19 & 0x80u) == 0) {
    v22 = __dst;
  }
  else {
    v22 = v20;
  }
  if ((v19 & 0x80u) == 0) {
    unint64_t v23 = v19;
  }
  else {
    unint64_t v23 = (unint64_t)v21;
  }
  if ((v75 & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  if ((v75 & 0x80u) == 0) {
    unint64_t v25 = v75;
  }
  else {
    unint64_t v25 = v74;
  }
  int v26 = sub_25C820E74((uint64_t)buf, v22, v23, p_p, v25, a6, v9, a9, a8);
  if ((char)v75 < 0) {
    operator delete(__p);
  }
  if ((SBYTE7(v65) & 0x80000000) == 0)
  {
    if (!v26) {
      goto LABEL_30;
    }
LABEL_26:
    p_tokens = (uint64_t *)&self->_tokens;
    end = self->_tokens.__end_;
    if (end >= self->_tokens.__end_cap_.__value_)
    {
      v30 = (Token *)sub_25C814E34(p_tokens, (long long *)buf);
    }
    else
    {
      sub_25C814DBC((uint64_t)p_tokens, (long long *)buf);
      v30 = (Token *)((char *)end + 48);
    }
    self->_tokens.__end_ = v30;
    goto LABEL_30;
  }
  operator delete(__dst[0]);
  if (v26) {
    goto LABEL_26;
  }
LABEL_30:
  id v31 = v60;
  id v32 = v61;
  if (!objc_msgSend_count(v31, v33, v34, v35))
  {

    id v59 = v14;
    goto LABEL_64;
  }
  unint64_t v39 = objc_msgSend_count(v31, v36, v37, v38);
  if (v32 && v39 < 2)
  {
    v43 = objc_msgSend_firstObject(v31, v40, v41, v42);
    char isEqual = objc_msgSend_isEqual_(v32, v44, (uint64_t)v43, v45);

    if (isEqual) {
      goto LABEL_65;
    }
  }
  else
  {
  }
  v58 = v31;
  id v59 = v14;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v31;
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v69, (uint64_t)v76, 16);
  if (!v48) {
    goto LABEL_63;
  }
  uint64_t v49 = *(void *)v70;
  unint64_t v50 = a6 | (unint64_t)(v9 << 32);
  do
  {
    for (uint64_t i = 0; i != v48; ++i)
    {
      if (*(void *)v70 != v49) {
        objc_enumerationMutation(obj);
      }
      v52 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      *(_OWORD *)__dst = 0u;
      long long v65 = 0u;
      uint64_t v66 = 0x100003F800000;
      __int16 v67 = 3;
      int v68 = 0;
      sub_25C80DDA4(v52, (uint64_t)&__p);
      if (!a9)
      {
        unint64_t v54 = (v75 & 0x80u) == 0 ? v75 : v74;
        v55 = (v75 & 0x80u) == 0 ? &__p : (void **)__p;
        sub_25C7D08D8(__dst, v55, v54);
        *((void *)&v65 + 1) = v50;
        if (!a8)
        {
          v67 &= 0xFFFCu;
          LODWORD(v66) = 0;
        }
      }
      if ((char)v75 < 0)
      {
        operator delete(__p);
        if (a9) {
          goto LABEL_59;
        }
      }
      else if (a9)
      {
        goto LABEL_59;
      }
      v56 = self->_normalized_tokens.__end_;
      if (v56 >= self->_normalized_tokens.__end_cap_.__value_)
      {
        v57 = (Token *)sub_25C814E34((uint64_t *)&self->_normalized_tokens, (long long *)__dst);
      }
      else
      {
        sub_25C814DBC((uint64_t)&self->_normalized_tokens, (long long *)__dst);
        v57 = (Token *)((char *)v56 + 48);
      }
      self->_normalized_tokens.__end_ = v57;
LABEL_59:
      if (SBYTE7(v65) < 0) {
        operator delete(__dst[0]);
      }
    }
    uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v69, (uint64_t)v76, 16);
  }
  while (v48);
LABEL_63:

LABEL_64:
  id v14 = v59;
LABEL_65:
  if (SBYTE7(v78) < 0) {
    operator delete(*(void **)buf);
  }
  id v17 = v60;
LABEL_68:
}

+ (id)getASRPhoneSequence:(id)a3
{
  id v3 = a3;
  v7 = v3;
  if (v3)
  {
    id v8 = objc_msgSend_asrTokens(v3, v4, v5, v6);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)build
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  originalText = self->_originalText;
  p_originalText = &self->_originalText;
  if (!originalText) {
    objc_storeStrong((id *)p_originalText, self->_originalTextMutable);
  }
  uint64_t v9 = sub_25C7FFB90(self->_locale, a2, v2, v3);
  if (!v9)
  {
    id v10 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v36 = objc_msgSend_localeIdentifier(self->_locale, v11, v12, v13);
      uint64_t v38 = sub_25C8009D0(14, v37);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[SEMSpanMatchQueryBuilder build]";
      __int16 v54 = 2112;
      v55 = v36;
      __int16 v56 = 2112;
      v57 = v38;
      _os_log_error_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_ERROR, "%s Unsupported locale identifier: \"%@\" using fallback: %@", buf, 0x20u);
    }
    uint64_t v9 = 14;
  }
  v44 = objc_msgSend_getASRPhoneSequence_(SEMSpanMatchQueryBuilder, v7, (uint64_t)self->_asrHypothesis, v8);
  sub_25C80DDA4(self->_originalText, (uint64_t)__p);
  __int16 v41 = sub_25C81F234();
  unint64_t v14 = sub_25C81EEE4();
  uint64_t v39 = v15;
  uint64_t v40 = v14;
  uint64_t v16 = (char *)operator new(0xD0uLL);
  *((void *)v16 + 1) = 0;
  *((void *)v16 + 2) = 0;
  *(void *)uint64_t v16 = &unk_2709E03C0;
  value = self->_tokens.__end_cap_.__value_;
  long long v18 = *(_OWORD *)&self->_tokens.__begin_;
  self->_tokens.__begin_ = 0;
  self->_tokens.__end_ = 0;
  self->_tokens.__end_cap_.__value_ = 0;
  unint64_t v19 = self->_normalized_tokens.__end_cap_.__value_;
  long long v42 = *(_OWORD *)&self->_normalized_tokens.__begin_;
  long long v43 = v18;
  self->_normalized_tokens.__end_ = 0;
  self->_normalized_tokens.__end_cap_.__value_ = 0;
  self->_normalized_tokens.__begin_ = 0;
  unint64_t v20 = v46;
  id v21 = (void **)__p[0];
  v22 = __p[1];
  id v23 = v44;
  *((_OWORD *)v16 + 3) = v42;
  *(_OWORD *)(v16 + 24) = v43;
  *((void *)v16 + 5) = value;
  v50[1] = 0;
  v50[2] = 0;
  if ((v20 & 0x80u) == 0) {
    v24 = __p;
  }
  else {
    v24 = v21;
  }
  if ((v20 & 0x80u) == 0) {
    unint64_t v25 = v20;
  }
  else {
    unint64_t v25 = (unint64_t)v22;
  }
  v49[2] = 0;
  v50[0] = 0;
  *((void *)v16 + 8) = v19;
  v49[0] = 0;
  v49[1] = 0;
  id v27 = v23;
  *((void *)v16 + 9) = v27;
  if (v25 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C7D00F4();
  }
  if (v25 >= 0xB)
  {
    uint64_t v29 = (v25 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((v25 | 3) != 0xB) {
      uint64_t v29 = v25 | 3;
    }
    v28 = sub_25C7D04E8((uint64_t)(v16 + 80), v29 + 1);
    *((void *)v16 + 11) = v25;
    *((void *)v16 + 12) = v30 | 0x8000000000000000;
    *((void *)v16 + 10) = v28;
    goto LABEL_20;
  }
  v16[103] = v25;
  v28 = v16 + 80;
  if (v25) {
LABEL_20:
  }
    memmove(v28, v24, 2 * v25);
  *((_WORD *)v28 + v25) = 0;
  *((_OWORD *)v16 + 7) = 0u;
  *((void *)v16 + 13) = v9;
  *((_OWORD *)v16 + 8) = 0u;
  *((_DWORD *)v16 + 36) = 1065353216;
  *(_OWORD *)(v16 + 152) = 0u;
  *(_OWORD *)(v16 + 168) = 0u;
  *((_DWORD *)v16 + 46) = 1065353216;
  sub_25C821A30(v9, v26, buf);
  id v31 = operator new(0x100uLL);
  v31[1] = 0;
  v31[2] = 0;
  *id v31 = &unk_2709DF1E0;
  uint64_t v51 = 0;
  v52 = 0;
  sub_25C7CC2B8((uint64_t)(v31 + 3), (skit::internal *)buf, v41, v40, v39, (uint64_t)&v51);
  if (v52) {
    sub_25C7D2280(v52);
  }
  *((void *)v16 + 24) = v31 + 3;
  *((void *)v16 + 25) = v31;
  if (SHIBYTE(v56) < 0) {
    operator delete(*(void **)buf);
  }

  *(void *)buf = v49;
  sub_25C7D025C((void ***)buf);
  *(void *)buf = v50;
  sub_25C7D025C((void ***)buf);
  v47 = v16 + 24;
  uint64_t v48 = (std::__shared_weak_count *)v16;
  if ((char)v46 < 0) {
    operator delete(__p[0]);
  }

  id v32 = [SEMSpanMatchQuery alloc];
  locale_originalText_asrHypothesis = objc_msgSend_initWithQuery_locale_originalText_asrHypothesis_(v32, v33, (uint64_t)&v47, v9, self->_originalText, self->_asrHypothesis);
  if (v48) {
    sub_25C7D2280(v48);
  }
  return locale_originalText_asrHypothesis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrHypothesis, 0);
  p_normalized_tokens = &self->_normalized_tokens;
  sub_25C7D025C((void ***)&p_normalized_tokens);
  p_normalized_tokens = &self->_tokens;
  sub_25C7D025C((void ***)&p_normalized_tokens);
  objc_storeStrong((id *)&self->_originalTextMutable, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end