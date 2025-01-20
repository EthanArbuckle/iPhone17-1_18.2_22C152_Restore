@interface SentencePieceModel
- (SentencePieceModel)initWithModelPath:(id)a3;
- (id).cxx_construct;
- (id)decodeFromIDs:(id)a3;
- (id)decodeFromTokens:(id)a3;
- (id)encodeAsIDsFrom:(id)a3;
- (id)encodeAsTokensFrom:(id)a3;
- (void)dealloc;
@end

@implementation SentencePieceModel

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_processor.__cntrl_;
  if (cntrl) {
    sub_25C1567BC((std::__shared_weak_count *)cntrl);
  }
}

- (id)decodeFromIDs:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v33 = 0;
  v34 = 0;
  unint64_t v35 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  v24 = self;
  if (v4)
  {
    v5 = 0;
    unint64_t v6 = 0;
    v7 = 0;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v29 + 1) + 8 * i);
        int v11 = [v10 intValue];
        int v12 = v11;
        if ((unint64_t)v7 >= v6)
        {
          uint64_t v13 = (v7 - v5) >> 2;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 62) {
            sub_25C137658();
          }
          if ((uint64_t)(v6 - (void)v5) >> 1 > v14) {
            unint64_t v14 = (uint64_t)(v6 - (void)v5) >> 1;
          }
          if (v6 - (unint64_t)v5 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v15 = v14;
          }
          if (v15) {
            unint64_t v15 = (unint64_t)sub_25C13C324(v15);
          }
          else {
            uint64_t v16 = 0;
          }
          v17 = (_DWORD *)(v15 + 4 * v13);
          _DWORD *v17 = v12;
          v18 = v17 + 1;
          while (v7 != v5)
          {
            int v19 = *((_DWORD *)v7 - 1);
            v7 -= 4;
            *--v17 = v19;
          }
          unint64_t v6 = v15 + 4 * v16;
          v33 = v17;
          v34 = v18;
          unint64_t v35 = v6;
          if (v5) {
            operator delete(v5);
          }
          v5 = (char *)v17;
          v7 = (char *)v18;
        }
        else
        {
          *(_DWORD *)v7 = v11;
          v7 += 4;
        }
        v34 = v7;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v4);
  }

  __p[0] = 0;
  __p[1] = 0;
  uint64_t v28 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v24->_processor.__ptr_ + 136))(&v26);
  uint64_t v20 = v26;
  uint64_t v26 = 0;
  if (v20) {
    sub_25C13D850(v20);
  }
  if (v28 >= 0) {
    v21 = __p;
  }
  else {
    v21 = (void **)__p[0];
  }
  v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, v24);
  if (SHIBYTE(v28) < 0) {
    operator delete(__p[0]);
  }
  if (v33)
  {
    v34 = v33;
    operator delete(v33);
  }

  return v22;
}

- (id)decodeFromTokens:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  long long v30 = 0;
  unint64_t v31 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        sub_25C13C824(__p, (char *)[v7 UTF8String]);
        uint64_t v8 = v30;
        if ((unint64_t)v30 >= v31)
        {
          unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v30[-v29] >> 3);
          unint64_t v11 = v10 + 1;
          if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
            sub_25C137658();
          }
          if (0x5555555555555556 * ((uint64_t)(v31 - v29) >> 3) > v11) {
            unint64_t v11 = 0x5555555555555556 * ((uint64_t)(v31 - v29) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v31 - v29) >> 3) >= 0x555555555555555) {
            unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v12 = v11;
          }
          v36 = &v31;
          if (v12) {
            unint64_t v12 = (unint64_t)sub_25C137670(v12);
          }
          else {
            uint64_t v13 = 0;
          }
          unint64_t v14 = v12 + 24 * v10;
          long long v32 = (void *)v12;
          unint64_t v33 = v14;
          unint64_t v35 = v12 + 24 * v13;
          long long v15 = *(_OWORD *)__p;
          *(void *)(v14 + 16) = v24;
          *(_OWORD *)unint64_t v14 = v15;
          __p[1] = 0;
          uint64_t v24 = 0;
          __p[0] = 0;
          int64_t v34 = v14 + 24;
          sub_25C13C8D4(&v29, &v32);
          uint64_t v16 = v30;
          sub_25C13C958((uint64_t)&v32);
          long long v30 = v16;
          if (SHIBYTE(v24) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v9 = *(_OWORD *)__p;
          *((void *)v30 + 2) = v24;
          *uint64_t v8 = v9;
          long long v30 = (char *)v8 + 24;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v4);
  }

  long long v32 = 0;
  unint64_t v33 = 0;
  int64_t v34 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_processor.__ptr_ + 120))(&v22);
  uint64_t v17 = v22;
  uint64_t v22 = 0;
  if (v17) {
    sub_25C13D850(v17);
  }
  if (v34 >= 0) {
    v18 = &v32;
  }
  else {
    v18 = v32;
  }
  int v19 = [NSString stringWithCString:v18 encoding:4];
  if (SHIBYTE(v34) < 0) {
    operator delete(v32);
  }
  long long v32 = &v29;
  sub_25C13C7D0((void ***)&v32);

  return v19;
}

- (id)encodeAsTokensFrom:(id)a3
{
  id v4 = a3;
  sub_25C13C824(&v19, (char *)[v4 UTF8String]);
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_processor.__ptr_ + 104))(&v15);
  uint64_t v5 = v15;
  uint64_t v15 = 0;
  if (v5) {
    sub_25C13D850(v5);
  }
  unint64_t v6 = [MEMORY[0x263EFF980] array];
  id v7 = v16;
  for (uint64_t i = v17; v7 != i; v7 = (long long *)((char *)v7 + 24))
  {
    if (*((char *)v7 + 23) < 0)
    {
      sub_25C1367DC(__p, *(void **)v7, *((void *)v7 + 1));
    }
    else
    {
      long long v9 = *v7;
      uint64_t v14 = *((void *)v7 + 2);
      *(_OWORD *)__p = v9;
    }
    if (v14 >= 0) {
      unint64_t v10 = __p;
    }
    else {
      unint64_t v10 = (void **)__p[0];
    }
    unint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, __p[0], __p[1], v14, v15);
    [v6 addObject:v11];

    if (SHIBYTE(v14) < 0) {
      operator delete(__p[0]);
    }
  }
  __p[0] = &v16;
  sub_25C13C7D0((void ***)__p);
  if (v20 < 0) {
    operator delete(v19);
  }

  return v6;
}

- (id)encodeAsIDsFrom:(id)a3
{
  id v4 = a3;
  sub_25C13C824(&__p, (char *)[v4 UTF8String]);
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_processor.__ptr_ + 112))(&v11);
  uint64_t v5 = v11;
  uint64_t v11 = 0;
  if (v5) {
    sub_25C13D850(v5);
  }
  unint64_t v6 = [MEMORY[0x263EFF980] array];
  id v7 = v12;
  uint64_t v8 = v13;
  if (v12 != v13)
  {
    do
    {
      long long v9 = [NSNumber numberWithInt:*v7];
      [v6 addObject:v9];

      ++v7;
    }
    while (v7 != v8);
    id v7 = v12;
  }
  if (v7)
  {
    uint64_t v13 = v7;
    operator delete(v7);
  }
  if (v16 < 0) {
    operator delete(__p);
  }

  return v6;
}

- (void)dealloc
{
  if (self->_processor.__ptr_)
  {
    cntrl = self->_processor.__cntrl_;
    self->_processor.__ptr_ = 0;
    self->_processor.__cntrl_ = 0;
    if (cntrl) {
      sub_25C1567BC((std::__shared_weak_count *)cntrl);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)SentencePieceModel;
  [(SentencePieceModel *)&v4 dealloc];
}

- (SentencePieceModel)initWithModelPath:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SentencePieceModel;
  uint64_t v5 = [(SentencePieceModel *)&v15 init];
  if (!v5) {
    goto LABEL_10;
  }
  unint64_t v6 = operator new(0x70uLL);
  v6[1] = 0;
  v6[2] = 0;
  *unint64_t v6 = &unk_27098A180;
  v6[3] = &unk_270989898;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *(void *)&long long v7 = v6 + 3;
  *((void *)&v7 + 1) = v6;
  uint64_t v8 = (std::__shared_weak_count *)*((void *)v5 + 2);
  *(_OWORD *)(v5 + 8) = v7;
  if (v8) {
    sub_25C1567BC(v8);
  }
  sub_25C13C824(&__p, (char *)[v4 UTF8String]);
  (*(void (**)(uint64_t *__return_ptr))(**((void **)v5 + 1) + 16))(&v12);
  uint64_t v9 = v12;
  uint64_t v12 = 0;
  if (v9) {
    sub_25C13D850(v9);
  }
  if (v14 < 0)
  {
    operator delete(__p);
    if (v9) {
      goto LABEL_8;
    }
LABEL_10:
    unint64_t v10 = v5;
    goto LABEL_11;
  }
  if (!v9) {
    goto LABEL_10;
  }
LABEL_8:
  unint64_t v10 = 0;
LABEL_11:

  return v10;
}

@end