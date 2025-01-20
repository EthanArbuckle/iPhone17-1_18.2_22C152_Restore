@interface SEMFTSCriteria
+ (BOOL)supportsSecureCoding;
+ (id)builderWithLikeTerms:(id)a3;
+ (id)builderWithMatchTerm:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSearchCriteria:(id)a3;
- (NSArray)searchTerms;
- (NSSet)fieldTypeFilters;
- (NSSet)originAppIdFilters;
- (SEMFTSCriteria)init;
- (SEMFTSCriteria)initWithCoder:(id)a3;
- (SEMFTSCriteria)initWithSearchTerms:(id)a3 searchMode:(unsigned __int8)a4 originAppIdFilters:(id)a5 fieldTypeFilters:(id)a6;
- (id)_commandCriterionFromFieldTypeFilters;
- (id)_commandCriterionFromOriginAppFilters;
- (id)commandCriteriaFromFilters;
- (id)commandCriteriaFromSearchTerms;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)searchMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEMFTSCriteria

- (id)commandCriteriaFromFilters
{
  uint64_t v5 = objc_msgSend__commandCriterionFromOriginAppFilters(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend__commandCriterionFromFieldTypeFilters(self, v6, v7, v8);
  if (v5 | v9)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF980]);
    v13 = objc_msgSend_initWithCapacity_(v10, v11, 2, v12);
    v16 = v13;
    if (v5) {
      objc_msgSend_addObject_(v13, v14, v5, v15);
    }
    if (v9) {
      objc_msgSend_addObject_(v16, v14, v9, v15);
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x263EFFA68];
  }

  return v16;
}

- (id)commandCriteriaFromSearchTerms
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v7 = objc_msgSend_searchTerms(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_count(v7, v8, v9, v10);
  v14 = objc_msgSend_initWithCapacity_(v3, v12, v11, v13);

  int v18 = objc_msgSend_searchMode(self, v15, v16, v17);
  if (v18 == 2)
  {
    v24 = objc_msgSend_searchTerms(self, v19, v20, v21);
    uint64_t v28 = objc_msgSend_count(v24, v25, v26, v27);

    if (!v28)
    {
      v22 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v67 = "-[SEMFTSCriteria(Database) commandCriteriaFromSearchTerms]";
        v23 = "%s searchTerms array must NOT be empty for Like operator.";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v32 = objc_msgSend_searchTerms(self, v29, v30, v31, 0);
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v61, (uint64_t)v65, 16);
    if (v34)
    {
      uint64_t v36 = v34;
      uint64_t v37 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v62 != v37) {
            objc_enumerationMutation(v32);
          }
          v39 = objc_msgSend_criterionWithColumnName_LIKEWildcardPattern_(SEMSQLCommandCriterion, v35, 0x2709E0C30, *(void *)(*((void *)&v61 + 1) + 8 * i));
          objc_msgSend_addObject_(v14, v40, (uint64_t)v39, v41);
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v61, (uint64_t)v65, 16);
      }
      while (v36);
    }

    goto LABEL_17;
  }
  if (v18 != 1)
  {
    if (!v18)
    {
      v22 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v67 = "-[SEMFTSCriteria(Database) commandCriteriaFromSearchTerms]";
        v23 = "%s cannot initialize criteria with undefined search mode.";
LABEL_22:
        _os_log_error_impl(&dword_25C7CA000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
LABEL_17:
    id v59 = v14;
    goto LABEL_24;
  }
  v42 = objc_msgSend_searchTerms(self, v19, v20, v21);
  uint64_t v46 = objc_msgSend_count(v42, v43, v44, v45);

  if (v46 == 1)
  {
    v50 = objc_msgSend_searchTerms(self, v47, v48, v49);
    v54 = objc_msgSend_firstObject(v50, v51, v52, v53);

    v56 = objc_msgSend_criterionWithColumnName_MATCHSearchPhrase_(SEMSQLCommandCriterion, v55, 0x2709E0C30, (uint64_t)v54);
    objc_msgSend_addObject_(v14, v57, (uint64_t)v56, v58);

    goto LABEL_17;
  }
  v22 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v67 = "-[SEMFTSCriteria(Database) commandCriteriaFromSearchTerms]";
    v23 = "%s searchTerms array must NOT be empty or contain more than one term for Match operator.";
    goto LABEL_22;
  }
LABEL_23:
  id v59 = 0;
LABEL_24:

  return v59;
}

- (id)_commandCriterionFromOriginAppFilters
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_originAppIdFilters(self, a2, v2, v3);
  if (v5
    && (uint64_t v9 = (void *)v5,
        objc_msgSend_originAppIdFilters(self, v6, v7, v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13),
        v10,
        v9,
        v14))
  {
    int v18 = (void *)MEMORY[0x263EFF980];
    v19 = objc_msgSend_originAppIdFilters(self, v15, v16, v17);
    uint64_t v23 = objc_msgSend_count(v19, v20, v21, v22);
    uint64_t v26 = objc_msgSend_arrayWithCapacity_(v18, v24, v23, v25);

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v30 = objc_msgSend_originAppIdFilters(self, v27, v28, v29, 0);
    uint64_t v34 = objc_msgSend_allObjects(v30, v31, v32, v33);

    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v45, (uint64_t)v49, 16);
    if (v36)
    {
      uint64_t v39 = v36;
      uint64_t v40 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(v34);
          }
          objc_msgSend_addObject_(v26, v37, *(void *)(*((void *)&v45 + 1) + 8 * i), v38);
        }
        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v45, (uint64_t)v49, 16);
      }
      while (v39);
    }

    v43 = objc_msgSend_criterionWithColumnName_INColumnValues_(SEMSQLCommandCriterion, v42, 0x2709E0BD0, (uint64_t)v26);
  }
  else
  {
    v43 = 0;
  }
  return v43;
}

- (id)_commandCriterionFromFieldTypeFilters
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_fieldTypeFilters(self, a2, v2, v3);
  if (v5
    && (uint64_t v9 = (void *)v5,
        objc_msgSend_fieldTypeFilters(self, v6, v7, v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13),
        v10,
        v9,
        v14))
  {
    int v18 = (void *)MEMORY[0x263EFF980];
    v19 = objc_msgSend_fieldTypeFilters(self, v15, v16, v17);
    uint64_t v23 = objc_msgSend_count(v19, v20, v21, v22);
    uint64_t v26 = objc_msgSend_arrayWithCapacity_(v18, v24, v23, v25);

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v30 = objc_msgSend_fieldTypeFilters(self, v27, v28, v29, 0);
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v32)
    {
      uint64_t v35 = v32;
      uint64_t v36 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v42 != v36) {
            objc_enumerationMutation(v30);
          }
          objc_msgSend_addObject_(v26, v33, *(void *)(*((void *)&v41 + 1) + 8 * i), v34);
        }
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v35);
    }

    uint64_t v39 = objc_msgSend_criterionWithColumnName_INColumnValues_(SEMSQLCommandCriterion, v38, 0x2709E0C10, (uint64_t)v26);
  }
  else
  {
    uint64_t v39 = 0;
  }
  return v39;
}

+ (id)builderWithMatchTerm:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    uint64_t v7 = [SEMFTSCriteriaBuilder alloc];
    uint64_t v10 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v8, (uint64_t)v3, v9);
    uint64_t v12 = objc_msgSend_initWithSearchTerms_searchMode_(v7, v11, (uint64_t)v10, 1);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)builderWithLikeTerms:(id)a3
{
  id v3 = a3;
  uint64_t v7 = v3;
  if (v3 && objc_msgSend_count(v3, v4, v5, v6))
  {
    uint64_t v8 = [SEMFTSCriteriaBuilder alloc];
    uint64_t v10 = objc_msgSend_initWithSearchTerms_searchMode_(v8, v9, (uint64_t)v7, 2);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (SEMFTSCriteria)initWithSearchTerms:(id)a3 searchMode:(unsigned __int8)a4 originAppIdFilters:(id)a5 fieldTypeFilters:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SEMFTSCriteria;
  uint64_t v14 = [(SEMFTSCriteria *)&v25 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchTerms, a3);
    v15->_searchMode = a4;
    if (objc_msgSend_count(v12, v16, v17, v18)) {
      v19 = v12;
    }
    else {
      v19 = 0;
    }
    objc_storeStrong((id *)&v15->_originAppIdFilters, v19);
    if (objc_msgSend_count(v13, v20, v21, v22)) {
      uint64_t v23 = v13;
    }
    else {
      uint64_t v23 = 0;
    }
    objc_storeStrong((id *)&v15->_fieldTypeFilters, v23);
  }

  return v15;
}

- (SEMFTSCriteria)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use +builderWithMatchTerm or +builderWithLikeTerms", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)SEMFTSCriteria;
  id v3 = [(SEMFTSCriteria *)&v12 description];
  searchTerms = self->_searchTerms;
  uint64_t v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v5, self->_searchMode, v6);
  uint64_t v10 = objc_msgSend_stringByAppendingFormat_(v3, v8, @" searchTerms: %@, searchMode: %@, originAppIdFilters: %@, fieldTypeFilters: %@,", v9, searchTerms, v7, self->_originAppIdFilters, self->_fieldTypeFilters);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  searchTerms = self->_searchTerms;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)searchTerms, @"t");
  objc_msgSend_encodeInt_forKey_(v9, v6, self->_searchMode, @"m");
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_originAppIdFilters, @"o");
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->_fieldTypeFilters, @"f");
}

- (SEMFTSCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SEMFTSCriteria;
  uint64_t v5 = [(SEMFTSCriteria *)&v31 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v7, v6, @"t");
    searchTerms = v5->_searchTerms;
    v5->_searchTerms = (NSArray *)v8;

    v5->_searchMode = objc_msgSend_decodeIntForKey_(v4, v10, @"m", v11);
    objc_super v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v17 = objc_msgSend_setWithObjects_(v12, v15, v13, v16, v14, 0);
    uint64_t v19 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v17, @"o");
    originAppIdFilters = v5->_originAppIdFilters;
    v5->_originAppIdFilters = (NSSet *)v19;

    uint64_t v21 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v26 = objc_msgSend_setWithObjects_(v21, v24, v22, v25, v23, 0);
    uint64_t v28 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v26, @"f");
    fieldTypeFilters = v5->_fieldTypeFilters;
    v5->_fieldTypeFilters = (NSSet *)v28;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_searchTerms, v9, (uint64_t)a3, v10);
  objc_super v12 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v11;

  *(unsigned char *)(v8 + 8) = self->_searchMode;
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_originAppIdFilters, v13, (uint64_t)a3, v14);
  uint64_t v16 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_fieldTypeFilters, v17, (uint64_t)a3, v18);
  uint64_t v20 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v19;

  return (id)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SEMFTSCriteria *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToSearchCriteria = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToSearchCriteria = objc_msgSend_isEqualToSearchCriteria_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToSearchCriteria = 0;
  }

  return isEqualToSearchCriteria;
}

- (BOOL)isEqualToSearchCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  searchTerms = self->_searchTerms;
  uint64_t v10 = objc_msgSend_searchTerms(v4, v5, v6, v7);
  uint64_t v13 = v10;
  if (searchTerms)
  {
    int isEqualToArray = objc_msgSend_isEqualToArray_(searchTerms, v11, (uint64_t)v10, v12);

    if (!isEqualToArray) {
      goto LABEL_15;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_15;
    }
  }
  int searchMode = self->_searchMode;
  if (searchMode != objc_msgSend_searchMode(v8, v15, v16, v17)) {
    goto LABEL_15;
  }
  originAppIdFilters = self->_originAppIdFilters;
  uint64_t v23 = objc_msgSend_originAppIdFilters(v8, v19, v20, v21);
  uint64_t v26 = v23;
  if (originAppIdFilters)
  {
    int isEqualToSet = objc_msgSend_isEqualToSet_(originAppIdFilters, v24, (uint64_t)v23, v25);

    if (!isEqualToSet) {
      goto LABEL_15;
    }
  }
  else
  {

    if (v26) {
      goto LABEL_15;
    }
  }
  fieldTypeFilters = self->_fieldTypeFilters;
  uint64_t v32 = objc_msgSend_fieldTypeFilters(v8, v28, v29, v30);
  uint64_t v35 = v32;
  if (!fieldTypeFilters)
  {

    if (!v35) {
      goto LABEL_13;
    }
LABEL_15:
    BOOL v37 = 0;
    goto LABEL_16;
  }
  int v36 = objc_msgSend_isEqualToSet_(fieldTypeFilters, v33, (uint64_t)v32, v34);

  if (!v36) {
    goto LABEL_15;
  }
LABEL_13:
  BOOL v37 = 1;
LABEL_16:

  return v37;
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (unsigned)searchMode
{
  return self->_searchMode;
}

- (NSSet)originAppIdFilters
{
  return self->_originAppIdFilters;
}

- (NSSet)fieldTypeFilters
{
  return self->_fieldTypeFilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldTypeFilters, 0);
  objc_storeStrong((id *)&self->_originAppIdFilters, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
}

@end