@interface SEMSpanMatchQuery
+ (void)initialize;
- (BOOL)isCascadeFieldTypeIncluded:(unsigned __int16)a3;
- (BOOL)isCascadeItemTypeIncluded:(unsigned __int16)a3;
- (SEMSpanMatchQuery)init;
- (SEMSpanMatchQuery)initWithQuery:(const void *)a3 locale:(int64_t)a4 originalText:(id)a5 asrHypothesis:(id)a6;
- (id).cxx_construct;
- (id)description;
- (id)locale;
- (id)originalText;
- (unsigned)tokenCount;
- (void)_addCascadeEntityFilter:(id)a3;
- (void)query;
- (void)setEntityFilters:(id)a3;
- (void)setIncludedKVFieldTypes:(id)a3;
- (void)setIncludedKVItemTypes:(id)a3;
@end

@implementation SEMSpanMatchQuery

- (SEMSpanMatchQuery)initWithQuery:(const void *)a3 locale:(int64_t)a4 originalText:(id)a5 asrHypothesis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SEMSpanMatchQuery;
  v13 = [(SEMSpanMatchQuery *)&v19 init];
  v14 = v13;
  if (v13)
  {
    v16 = *(Query **)a3;
    uint64_t v15 = *((void *)a3 + 1);
    if (v15) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v13->_query.__cntrl_;
    v14->_query.__ptr_ = v16;
    v14->_query.__cntrl_ = (__shared_weak_count *)v15;
    if (cntrl) {
      sub_25C7D2280(cntrl);
    }
    v14->_locale = a4;
    objc_storeStrong((id *)&v14->_originalText, a5);
    objc_storeStrong((id *)&v14->_asrHypothesis, a6);
  }

  return v14;
}

- (SEMSpanMatchQuery)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)locale
{
  return sub_25C7FF900(self->_locale, a2);
}

- (id)originalText
{
  return self->_originalText;
}

- (unsigned)tokenCount
{
  return -1431655765 * ((*((void *)self->_query.__ptr_ + 1) - *(void *)self->_query.__ptr_) >> 4);
}

- (void)query
{
  return &self->_query;
}

- (void)setEntityFilters:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_25C81496C((void *)self->_query.__ptr_ + 11);
  sub_25C81496C((void *)self->_query.__ptr_ + 16);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v26, (uint64_t)v36, 16);
  if (v9)
  {
    uint64_t v11 = *(void *)v27;
    *(void *)&long long v10 = 136315394;
    long long v24 = v10;
    id v25 = v5;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v5);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
        if (objc_msgSend_conformsToProtocol_(v13, v7, (uint64_t)&unk_2709EC8D8, v8, v24)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend_entityType(v13, v14, v15, v16) == 1)
          {
            objc_msgSend__addCascadeEntityFilter_(self, v17, (uint64_t)v13, v18);
          }
          else
          {
            v20 = qword_26B3549D8;
            if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              v31 = "-[SEMSpanMatchQuery setEntityFilters:]";
              __int16 v32 = 2112;
              v33 = v13;
              _os_log_error_impl(&dword_25C7CA000, v20, OS_LOG_TYPE_ERROR, "%s Ignoring unsupported filter %@", buf, 0x16u);
            }
          }
        }
        else
        {
          objc_super v19 = (id)qword_26B3549D8;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v21 = self;
            v22 = NSStringFromProtocol((Protocol *)&unk_2709EC8D8);
            *(_DWORD *)buf = 136315650;
            v31 = "-[SEMSpanMatchQuery setEntityFilters:]";
            __int16 v32 = 2112;
            v33 = v22;
            __int16 v34 = 2112;
            v35 = v13;
            _os_log_error_impl(&dword_25C7CA000, v19, OS_LOG_TYPE_ERROR, "%s Ignoring filter not conforming to %@: %@", buf, 0x20u);

            self = v21;
            id v5 = v25;
          }
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v26, (uint64_t)v36, 16);
      uint64_t v9 = v23;
    }
    while (v23);
  }
}

- (void)_addCascadeEntityFilter:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v8 = objc_msgSend_itemType(v4, v5, v6, v7);
    sub_25C8149D4((float *)self->_query.__ptr_ + 22, v8, v8);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = objc_msgSend_fieldType(v4, v9, v10, v11);
      sub_25C8149D4((float *)self->_query.__ptr_ + 32, v12, v12);
      ptr = self->_query.__ptr_;
      __int16 v15 = objc_msgSend_itemTypeForFieldType_error_(MEMORY[0x263F50070], v14, v12, 0);
      sub_25C8149D4((float *)ptr + 22, v15, v15);
    }
    else
    {
      uint64_t v16 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        uint64_t v18 = "-[SEMSpanMatchQuery _addCascadeEntityFilter:]";
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_error_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_ERROR, "%s Ignoring unexpected Cascade entity filter: %@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)setIncludedKVItemTypes:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v9 = objc_msgSend_count(v4, v6, v7, v8);
  uint64_t v12 = objc_msgSend_initWithCapacity_(v5, v10, v9, v11);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v4;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v13);
        }
        v22 = objc_msgSend_filterFromKVItemTypeNumber_(SEMCascadeItemTypeFilter, v15, *(void *)(*((void *)&v25 + 1) + 8 * v19), v16, (void)v25);
        if (v22) {
          objc_msgSend_addObject_(v12, v20, (uint64_t)v22, v21);
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v17);
  }

  objc_msgSend_setEntityFilters_(self, v23, (uint64_t)v12, v24);
}

- (void)setIncludedKVFieldTypes:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v9 = objc_msgSend_count(v4, v6, v7, v8);
  uint64_t v12 = objc_msgSend_initWithCapacity_(v5, v10, v9, v11);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v4;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v13);
        }
        v22 = objc_msgSend_filterFromKVFieldTypeNumber_(SEMCascadeFieldTypeFilter, v15, *(void *)(*((void *)&v25 + 1) + 8 * v19), v16, (void)v25);
        if (v22) {
          objc_msgSend_addObject_(v12, v20, (uint64_t)v22, v21);
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v17);
  }

  objc_msgSend_setEntityFilters_(self, v23, (uint64_t)v12, v24);
}

- (BOOL)isCascadeItemTypeIncluded:(unsigned __int16)a3
{
  ptr = self->_query.__ptr_;
  return !*((void *)ptr + 14) || sub_25C814F70((void *)ptr + 11, a3) != 0;
}

- (BOOL)isCascadeFieldTypeIncluded:(unsigned __int16)a3
{
  ptr = self->_query.__ptr_;
  return !*((void *)ptr + 19) || sub_25C814F70((void *)ptr + 16, a3) != 0;
}

+ (void)initialize
{
  if (qword_26B3549D0 != -1) {
    dispatch_once(&qword_26B3549D0, &unk_2709E0278);
  }
}

- (id)description
{
  id v2 = NSString;
  originalText = self->_originalText;
  id v4 = sub_25C8009D0(self->_locale, a2);
  uint64_t v7 = objc_msgSend_stringWithFormat_(v2, v5, @"\"%@\" locale: %@", v6, originalText, v4);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrHypothesis, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  cntrl = self->_query.__cntrl_;
  if (cntrl)
  {
    sub_25C7D2280((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end