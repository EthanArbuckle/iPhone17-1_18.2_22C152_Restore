@interface SEMFTSCriteriaBuilder
- (BOOL)_setError:(id *)a3 withCode:(int64_t)a4;
- (SEMFTSCriteriaBuilder)initWithSearchTerms:(id)a3 searchMode:(unsigned __int8)a4;
- (id)addFieldTypeFilterWithCustomTypeNumber:(id)a3 error:(id *)a4;
- (id)addFieldTypeFilterWithNumber:(id)a3 error:(id *)a4;
- (id)addOriginAppFilterWithAppId:(id)a3 error:(id *)a4;
- (id)build;
@end

@implementation SEMFTSCriteriaBuilder

- (SEMFTSCriteriaBuilder)initWithSearchTerms:(id)a3 searchMode:(unsigned __int8)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SEMFTSCriteriaBuilder;
  v10 = [(SEMFTSCriteriaBuilder *)&v25 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9);
    searchTerms = v10->_searchTerms;
    v10->_searchTerms = (NSArray *)v11;

    if (!v10->_searchTerms)
    {
      v23 = 0;
      goto LABEL_6;
    }
    v10->_searchMode = a4;
    uint64_t v16 = objc_msgSend_set(MEMORY[0x263EFF9C0], v13, v14, v15);
    originAppIdFilters = v10->_originAppIdFilters;
    v10->_originAppIdFilters = (NSMutableSet *)v16;

    uint64_t v21 = objc_msgSend_set(MEMORY[0x263EFF9C0], v18, v19, v20);
    fieldTypeFilters = v10->_fieldTypeFilters;
    v10->_fieldTypeFilters = (NSMutableSet *)v21;
  }
  v23 = v10;
LABEL_6:

  return v23;
}

- (id)build
{
  v3 = [SEMFTSCriteria alloc];
  v5 = objc_msgSend_initWithSearchTerms_searchMode_originAppIdFilters_fieldTypeFilters_(v3, v4, (uint64_t)self->_searchTerms, self->_searchMode, self->_originAppIdFilters, self->_fieldTypeFilters);
  return v5;
}

- (BOOL)_setError:(id *)a3 withCode:(int64_t)a4
{
  if (a3)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], a2, @"com.apple.siri.vocabulary.search.criteria", a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (id)addOriginAppFilterWithAppId:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_msgSend_length(v7, v8, v9, v10))
      {
        v13 = objc_msgSend_convertToUniversalAppId_(SEMAppIdMapper, v11, (uint64_t)v7, v12);
        objc_msgSend_addObject_(self->_originAppIdFilters, v14, (uint64_t)v13, v15);
        uint64_t v16 = self;

        goto LABEL_9;
      }
      objc_msgSend__setError_withCode_(self, v11, (uint64_t)a4, 2);
    }
    else
    {
      objc_msgSend__setError_withCode_(self, v8, (uint64_t)a4, 3);
    }
  }
  else
  {
    objc_msgSend__setError_withCode_(self, v6, (uint64_t)a4, 1);
  }
  uint64_t v16 = 0;
LABEL_9:

  return v16;
}

- (id)addFieldTypeFilterWithNumber:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    objc_msgSend__setError_withCode_(self, v6, (uint64_t)a4, 1);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend__setError_withCode_(self, v8, (uint64_t)a4, 3);
    goto LABEL_7;
  }
  int v11 = (unsigned __int16)*MEMORY[0x263F316D0];
  if (v11 == objc_msgSend_unsignedShortValue(v7, v8, v9, v10))
  {
    objc_msgSend__setError_withCode_(self, v12, (uint64_t)a4, 4);
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  fieldTypeFilters = self->_fieldTypeFilters;
  v18 = objc_msgSend_copy(v7, v12, v13, v14);
  objc_msgSend_addObject_(fieldTypeFilters, v19, (uint64_t)v18, v20);

  uint64_t v15 = self;
LABEL_8:

  return v15;
}

- (id)addFieldTypeFilterWithCustomTypeNumber:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v13 = (unsigned __int16)objc_msgSend_integerValue(v7, v8, v9, v10);
      if ((v13 - 1) >= 2) {
        int v13 = 0;
      }
      if ((v13 - 1) < 2)
      {
        if (v13 == 1)
        {
          objc_msgSend_numberWithUnsignedShort_(NSNumber, v11, 61355, v12);
        }
        else if (v13 == 2)
        {
          objc_msgSend_numberWithUnsignedShort_(NSNumber, v11, 63372, v12);
        }
        else
        {
          objc_msgSend_numberWithUnsignedShort_(NSNumber, v11, (unsigned __int16)*MEMORY[0x263F316D0], v12);
        uint64_t v16 = };
        uint64_t v14 = objc_msgSend_addFieldTypeFilterWithNumber_error_(self, v17, (uint64_t)v16, (uint64_t)a4);

        goto LABEL_13;
      }
      objc_msgSend__setError_withCode_(self, v11, (uint64_t)a4, 4);
    }
    else
    {
      objc_msgSend__setError_withCode_(self, v8, (uint64_t)a4, 3);
    }
  }
  else
  {
    objc_msgSend__setError_withCode_(self, v6, (uint64_t)a4, 1);
  }
  uint64_t v14 = 0;
LABEL_13:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldTypeFilters, 0);
  objc_storeStrong((id *)&self->_originAppIdFilters, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
}

@end