@interface SEMTokenizer
+ (void)initialize;
- (SEMTokenizer)init;
- (SEMTokenizer)initWithLocale:(id)a3;
- (SEMTokenizer)initWithLocale:(id)a3 assetPath:(id)a4 normalizeWords:(BOOL)a5;
- (SEMTokenizer)initWithTokenizerLocale:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)locale;
- (id)queryFromText:(id)a3;
- (shared_ptr<semskitbridge::Tokenizer>)tokenizer;
- (void)enumerateTokensOfText:(id)a3 usingBlock:(id)a4;
@end

@implementation SEMTokenizer

+ (void)initialize
{
  if (qword_26B3549D0 != -1) {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

- (SEMTokenizer)initWithLocale:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_getAssetPathForLocale_(MEMORY[0x263F56678], v5, (uint64_t)v4, v6);
  v9 = (SEMTokenizer *)objc_msgSend_initWithLocale_assetPath_normalizeWords_(self, v8, (uint64_t)v4, (uint64_t)v7, 1);

  return v9;
}

- (SEMTokenizer)initWithTokenizerLocale:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v10 = objc_msgSend_getAssetPathForLocale_(MEMORY[0x263F56678], v7, (uint64_t)v6, v8);
  if (v10)
  {
    self = (SEMTokenizer *)(id)objc_msgSend_initWithLocale_assetPath_normalizeWords_(self, v9, (uint64_t)v6, (uint64_t)v10, 1);
    v11 = self;
  }
  else
  {
    v12 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend_localeIdentifier(v6, v13, v14, v15);
      *(_DWORD *)buf = 136315394;
      v35 = "-[SEMTokenizer initWithTokenizerLocale:error:]";
      __int16 v36 = 2112;
      v37 = v16;
      _os_log_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_INFO, "%s Cannot construct SEMTokenizer because morphun asset path for %@ is nil", buf, 0x16u);
    }
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v18 = NSString;
    v22 = objc_msgSend_localeIdentifier(v6, v19, v20, v21);
    v25 = objc_msgSend_stringWithFormat_(v18, v23, @"Morphun asset unavailable for locale: \"%@\"", v24, v22);
    v33 = v25;
    v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)&v33, (uint64_t)&v32, 1);
    v29 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v28, @"com.apple.siri.entitymatcher.tokenization", 2, v27);
    v30 = v29;
    if (a4 && v29) {
      *a4 = v29;
    }

    v11 = 0;
  }

  return v11;
}

- (SEMTokenizer)initWithLocale:(id)a3 assetPath:(id)a4 normalizeWords:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SEMTokenizer;
  v13 = [(SEMTokenizer *)&v32 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v8, v10, v11, v12);
    locale = v13->_locale;
    v13->_locale = (NSLocale *)v14;

    if (v9)
    {
      objc_msgSend_path(v9, v16, v17, v18);
      id v19 = objc_claimAutoreleasedReturnValue();
      v23 = (char *)objc_msgSend_UTF8String(v19, v20, v21, v22);
      size_t v24 = strlen(v23);
    }
    else
    {
      v23 = 0;
      size_t v24 = 0;
    }
    v25 = objc_msgSend_localeIdentifier(v13->_locale, v16, v17, v18);
    sub_25C80DDA4(v25, (uint64_t)__p);
    v26 = (__shared_weak_count *)operator new(0xC0uLL);
    *((void *)v26 + 1) = 0;
    *((void *)v26 + 2) = 0;
    *(void *)v26 = &unk_2709DF190;
    uint64_t v27 = sub_25C820154((uint64_t)v26 + 24, (uint64_t)__p, v23, v24, v5);
    cntrl = (std::__shared_weak_count *)v13->_tokenizer.__cntrl_;
    v13->_tokenizer.__ptr_ = (Tokenizer *)v27;
    v13->_tokenizer.__cntrl_ = v26;
    if (cntrl) {
      sub_25C7D2280(cntrl);
    }
    if (v31 < 0) {
      operator delete(__p[0]);
    }
  }
  return v13;
}

- (SEMTokenizer)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)locale
{
  return self->_locale;
}

- (void)enumerateTokensOfText:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  v70 = (void (**)(id, uint64_t, void *, void *, void *, uint64_t, uint64_t, uint64_t, int))a4;
  ptr = self->_tokenizer.__ptr_;
  sub_25C80DDA4(v6, (uint64_t)&__src);
  v69 = v6;
  if ((char)v73 < 0)
  {
    unint64_t v8 = v72;
    if (v72 >= 0x7FFFFFFFFFFFFFF8) {
      sub_25C7D00F4();
    }
    p_src = __src;
  }
  else
  {
    unint64_t v8 = v73;
    p_src = (void **)&__src;
  }
  if (v8 >= 0xB)
  {
    uint64_t v11 = (v8 & 0x7FFFFFFFFFFFFFFCLL) + 4;
    if ((v8 | 3) != 0xB) {
      uint64_t v11 = v8 | 3;
    }
    v10 = (void **)sub_25C7D04E8((uint64_t)__dst, v11 + 1);
    __dst[1] = (void *)v8;
    unint64_t v80 = v12 | 0x8000000000000000;
    __dst[0] = v10;
  }
  else
  {
    HIBYTE(v80) = v8;
    v10 = __dst;
    if (!v8) {
      goto LABEL_12;
    }
  }
  memmove(v10, p_src, 2 * v8);
LABEL_12:
  *((_WORD *)v10 + v8) = 0;
  v76 = 0;
  v77 = 0;
  unint64_t v78 = 0;
  if (*((char *)ptr + 31) < 0)
  {
    v13 = (_WORD *)*((void *)ptr + 1);
    uint64_t v14 = *((void *)ptr + 2);
  }
  else
  {
    v13 = (_WORD *)((char *)ptr + 8);
    uint64_t v14 = *((unsigned __int8 *)ptr + 31);
  }
  if (v14 == 2 && *v13 == 28261) {
    uint64_t v15 = (uint64_t (**)(void))(**((void **)ptr + 16) + 24);
  }
  else {
    uint64_t v15 = (uint64_t (**)(void))(**((void **)ptr + 18) + 64);
  }
  v16 = (const Token **)(*v15)();
  if (*((void *)ptr + 19)) {
    uint64_t v17 = (const Token **)(*(uint64_t (**)(void, const Token **))(**((void **)ptr + 20) + 72))(*((void *)ptr + 20), v16);
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = (morphun::TokenIterator *)morphun::TokenIterator::TokenIterator((morphun::TokenIterator *)v81, v16[1], v16[2]);
  long long v75 = v81[0];
  if (v17) {
    morphun::TokenIterator::TokenIterator(v18, v17[1], v17[2]);
  }
  else {
    morphun::TokenIterator::TokenIterator(v18, v16[1], v16[2]);
  }
  uint64_t v19 = 0;
  long long v74 = v81[0];
  while (1)
  {
    *(void *)&v81[0] = sub_25C81E95C((uint64_t)v16);
    *((void *)&v81[0] + 1) = v20;
    if (!morphun::TokenIterator::operator!=()) {
      break;
    }
    uint64_t v21 = (morphun::Token *)morphun::TokenIterator::operator->();
    if ((morphun::Token::isHead(v21) & 1) == 0)
    {
      uint64_t v22 = (morphun::Token *)morphun::TokenIterator::operator->();
      if ((morphun::Token::isTail(v22) & 1) == 0)
      {
        if (v17)
        {
          while (1)
          {
            uint64_t v23 = morphun::TokenIterator::operator->();
            int v24 = (*(uint64_t (**)(uint64_t))(*(void *)v23 + 24))(v23);
            uint64_t v25 = morphun::TokenIterator::operator->();
            if (v24 >= (*(int (**)(uint64_t))(*(void *)v25 + 24))(v25))
            {
              v26 = (morphun::Token *)morphun::TokenIterator::operator->();
              if (!morphun::Token::isHead(v26)) {
                break;
              }
            }
            morphun::TokenIterator::operator++();
          }
          uint64_t v27 = v76;
          for (i = v77; i != v27; i -= 3)
          {
            if (*((char *)i - 1) < 0) {
              operator delete(*(i - 3));
            }
          }
          v77 = v27;
          while (1)
          {
            uint64_t v29 = morphun::TokenIterator::operator->();
            int v30 = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 24))(v29);
            uint64_t v31 = morphun::TokenIterator::operator->();
            if (v30 > (*(int (**)(uint64_t))(*(void *)v31 + 24))(v31)) {
              break;
            }
            uint64_t v32 = morphun::TokenIterator::operator->();
            int v33 = (*(uint64_t (**)(uint64_t))(*(void *)v32 + 32))(v32);
            uint64_t v34 = morphun::TokenIterator::operator->();
            if (v33 < (*(int (**)(uint64_t))(*(void *)v34 + 32))(v34)) {
              break;
            }
            v35 = (morphun::Token *)morphun::TokenIterator::operator->();
            uint64_t Value = morphun::Token::getValue(v35);
            v37 = (morphun::Token *)morphun::TokenIterator::operator->();
            uint64_t v38 = morphun::Token::getValue(v37);
            uint64_t v39 = *(unsigned __int8 *)(Value + 23);
            int v40 = (char)v39;
            if ((v39 & 0x80u) != 0) {
              uint64_t v39 = *(void *)(Value + 8);
            }
            uint64_t v41 = *(unsigned __int8 *)(v38 + 23);
            int v42 = (char)v41;
            if ((v41 & 0x80u) != 0) {
              uint64_t v41 = *(void *)(v38 + 8);
            }
            if (v39 != v41) {
              break;
            }
            if (v39)
            {
              if (v40 >= 0) {
                v43 = (unsigned __int16 *)Value;
              }
              else {
                v43 = *(unsigned __int16 **)Value;
              }
              if (v42 >= 0) {
                v44 = (unsigned __int16 *)v38;
              }
              else {
                v44 = *(unsigned __int16 **)v38;
              }
              while (*v44 == *v43)
              {
                ++v43;
                ++v44;
                if (!--v39) {
                  goto LABEL_54;
                }
              }
              break;
            }
LABEL_54:
            v45 = (morphun::Token *)morphun::TokenIterator::operator->();
            Cleanuint64_t Value = morphun::Token::getCleanValue(v45);
            v47 = (long long *)v77;
            if ((unint64_t)v77 >= v78)
            {
              v49 = (void **)sub_25C81E9B0((uint64_t *)&v76, (long long *)CleanValue);
            }
            else
            {
              if (*(char *)(CleanValue + 23) < 0)
              {
                sub_25C7D059C(v77, *(void **)CleanValue, *(void *)(CleanValue + 8));
              }
              else
              {
                long long v48 = *(_OWORD *)CleanValue;
                v77[2] = *(void **)(CleanValue + 16);
                long long *v47 = v48;
              }
              v49 = (void **)v47 + 3;
            }
            v77 = v49;
            morphun::TokenIterator::operator++();
          }
        }
        v50 = (morphun::Token *)morphun::TokenIterator::operator*();
        morphun::Token::getValue(v50);
        v51 = sub_25C80DCE8();
        uint64_t v52 = morphun::Token::getCleanValue(v50);
        uint64_t v53 = *(unsigned __int8 *)(v52 + 23);
        if ((v53 & 0x80u) != 0) {
          uint64_t v53 = *(void *)(v52 + 8);
        }
        if (v53)
        {
          morphun::Token::getCleanValue(v50);
          v54 = sub_25C80DCE8();
        }
        else
        {
          v54 = 0;
        }
        if (v76 == v77)
        {
          v64 = 0;
        }
        else
        {
          id v55 = objc_alloc(MEMORY[0x263EFF980]);
          v58 = objc_msgSend_initWithCapacity_(v55, v56, 0xAAAAAAAAAAAAAAABLL * (v77 - v76), v57);
          uint64_t v59 = (uint64_t)v76;
          v60 = v77;
          while ((void **)v59 != v60)
          {
            v61 = sub_25C80DCE8();
            objc_msgSend_addObject_(v58, v62, (uint64_t)v61, v63);

            v59 += 24;
          }
          v64 = v58;
        }
        uint64_t v65 = (*(uint64_t (**)(morphun::Token *))(*(void *)v50 + 24))(v50);
        uint64_t v66 = (*(uint64_t (**)(morphun::Token *))(*(void *)v50 + 32))(v50);
        uint64_t isSignificant = morphun::Token::isSignificant(v50);
        LOBYTE(v68) = morphun::Token::isWhitespace(v50);
        v70[2](v70, v19, v51, v54, v64, v65, v66, isSignificant, v68);
        uint64_t v19 = (v19 + 1);
      }
    }
    morphun::TokenIterator::operator++();
  }
  if (v17) {
    (*((void (**)(const Token **))*v17 + 2))(v17);
  }
  if (v16) {
    (*((void (**)(const Token **))*v16 + 2))(v16);
  }
  *(void *)&v81[0] = &v76;
  sub_25C7D1010((void ***)v81);
  if (SHIBYTE(v80) < 0) {
    operator delete(__dst[0]);
  }
  if ((char)v73 < 0) {
    operator delete(__src);
  }
}

- (id)queryFromText:(id)a3
{
  id v4 = a3;
  BOOL v5 = [SEMSpanMatchQueryBuilder alloc];
  v7 = objc_msgSend_initWithLocale_originalText_(v5, v6, (uint64_t)self->_locale, (uint64_t)v4);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_25C81E8E4;
  v15[3] = &unk_2654DEF50;
  id v8 = v7;
  id v16 = v8;
  objc_msgSend_enumerateTokensOfText_usingBlock_(self, v9, (uint64_t)v4, (uint64_t)v15);
  v13 = objc_msgSend_build(v8, v10, v11, v12);

  return v13;
}

- (shared_ptr<semskitbridge::Tokenizer>)tokenizer
{
  cntrl = self->_tokenizer.__cntrl_;
  *id v2 = self->_tokenizer.__ptr_;
  v2[1] = (Tokenizer *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Tokenizer *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_tokenizer.__cntrl_;
  if (cntrl) {
    sub_25C7D2280((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_locale, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end