@interface SEMAppCustomVocabularySearchResult
+ (id)resultFromFTSRecords:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppCustomVocabularySearchResult:(id)a3;
- (NSString)originAppId;
- (NSString)vocabularyIdentifier;
- (NSString)vocabularyString;
- (SEMAppCustomVocabularySearchResult)initWithVocabularyType:(unsigned __int16)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5 originAppId:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)vocabularyType;
@end

@implementation SEMAppCustomVocabularySearchResult

+ (id)resultFromFTSRecords:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v3 = a3;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v45, (uint64_t)v53, 16);
  if (v5)
  {
    uint64_t v9 = v5;
    v43 = 0;
    v44 = 0;
    v10 = 0;
    LOWORD(v11) = 0;
    uint64_t v12 = *(void *)v46;
    while (2)
    {
      v13 = v3;
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v13);
        }
        v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_fieldType(v15, v6, v7, v8);
        if (v16 == 63373 || v16 == 61356)
        {
          uint64_t v21 = objc_msgSend_fieldValue(v15, v17, v18, v19);
          v22 = v10;
          v10 = (void *)v21;
        }
        else
        {
          uint64_t v23 = v16;
          if (v16 == 61355) {
            int v11 = 1;
          }
          else {
            int v11 = 2 * (v16 == 63372);
          }
          if ((v11 - 1) >= 2)
          {
            v29 = (void *)qword_26B3549D8;
            if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
            {
              v38 = (void *)MEMORY[0x263F50070];
              v39 = v29;
              v42 = objc_msgSend_descriptionForTypeIdentifier_(v38, v40, v23, v41);
              *(_DWORD *)buf = 136315394;
              v50 = "+[SEMAppCustomVocabularySearchResult resultFromFTSRecords:]";
              __int16 v51 = 2112;
              id v52 = v42;
              _os_log_error_impl(&dword_25C7CA000, v39, OS_LOG_TYPE_ERROR, "%s Cannot convert fieldType: %@ to SEMAppCustomVocabularyType", buf, 0x16u);
            }
            id v3 = v13;

            v30 = 0;
            v32 = v43;
            v31 = v44;
            goto LABEL_29;
          }
          uint64_t v24 = objc_msgSend_fieldValue(v15, v17, v18, v19);

          uint64_t v28 = objc_msgSend_originAppId(v15, v25, v26, v27);
          v22 = v44;
          v43 = (void *)v24;
          v44 = (void *)v28;
        }
      }
      id v3 = v13;
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v6, (uint64_t)&v45, (uint64_t)v53, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    v43 = 0;
    v44 = 0;
    v10 = 0;
    LOWORD(v11) = 0;
  }

  id v33 = objc_alloc((Class)objc_opt_class());
  v32 = v43;
  v31 = v44;
  uint64_t v35 = objc_msgSend_initWithVocabularyType_vocabularyString_vocabularyIdentifier_originAppId_(v33, v34, (unsigned __int16)v11, (uint64_t)v43, v10, v44);
  if (v35)
  {
    v30 = (void *)v35;
  }
  else
  {
    v36 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "+[SEMAppCustomVocabularySearchResult resultFromFTSRecords:]";
      __int16 v51 = 2112;
      id v52 = v3;
      _os_log_error_impl(&dword_25C7CA000, v36, OS_LOG_TYPE_ERROR, "%s Failed to parse FTS records: %@", buf, 0x16u);
    }
    v30 = 0;
  }
LABEL_29:

  return v30;
}

- (SEMAppCustomVocabularySearchResult)initWithVocabularyType:(unsigned __int16)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5 originAppId:(id)a6
{
  uint64_t v9 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SEMAppCustomVocabularySearchResult;
  v14 = [(SEMAppCustomVocabularySearchResult *)&v26 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_5;
  }
  v14->_vocabularyType = v9;
  if ((unsigned __int16)(v9 - 1) >= 2u)
  {
    v17 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = NSNumber;
      uint64_t v19 = v17;
      v22 = objc_msgSend_numberWithUnsignedShort_(v18, v20, v9, v21);
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[SEMAppCustomVocabularySearchResult initWithVocabularyType:vocabularyString:vocabularyIdentifier:originAppId:]";
      __int16 v29 = 2112;
      v30 = v22;
      _os_log_error_impl(&dword_25C7CA000, v19, OS_LOG_TYPE_ERROR, "%s Invalid vocabularyType: %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v14->_vocabularyString, a4);
  if (!v15->_vocabularyString)
  {
    uint64_t v23 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      uint64_t v16 = 0;
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "-[SEMAppCustomVocabularySearchResult initWithVocabularyType:vocabularyString:vocabularyIdentifier:originAppId:]";
    __int16 v29 = 2112;
    v30 = 0;
    uint64_t v24 = "%s Invalid vocabularyString: %@";
LABEL_14:
    _os_log_error_impl(&dword_25C7CA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v15->_vocabularyIdentifier, a5);
  objc_storeStrong((id *)&v15->_originAppId, a6);
  if (!v15->_originAppId)
  {
    uint64_t v23 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "-[SEMAppCustomVocabularySearchResult initWithVocabularyType:vocabularyString:vocabularyIdentifier:originAppId:]";
    __int16 v29 = 2112;
    v30 = 0;
    uint64_t v24 = "%s Invalid originAppId: %@";
    goto LABEL_14;
  }
LABEL_5:
  uint64_t v16 = v15;
LABEL_12:

  return v16;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SEMAppCustomVocabularySearchResult;
  id v3 = [(SEMAppCustomVocabularySearchResult *)&v8 description];
  v6 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" type: %u, string: %@, identifier: %@, originAppId: %@", v5, self->_vocabularyType, self->_vocabularyString, self->_vocabularyIdentifier, self->_originAppId);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_originAppId, v9, (uint64_t)a3, v10);
  id v12 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v11;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_vocabularyIdentifier, v13, (uint64_t)a3, v14);
  uint64_t v16 = *(void **)(v8 + 24);
  *(void *)(v8 + 24) = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_vocabularyString, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v19;

  *(_WORD *)(v8 + 8) = self->_vocabularyType;
  return (id)v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SEMAppCustomVocabularySearchResult *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToAppCustomVocabularySearchResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAppCustomVocabularySearchResult = objc_msgSend_isEqualToAppCustomVocabularySearchResult_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToAppCustomVocabularySearchResult = 0;
  }

  return isEqualToAppCustomVocabularySearchResult;
}

- (BOOL)isEqualToAppCustomVocabularySearchResult:(id)a3
{
  id v5 = a3;
  int vocabularyType = self->_vocabularyType;
  if (vocabularyType != objc_msgSend_vocabularyType(v5, v7, v8, v9))
  {
    char isEqual = 0;
    goto LABEL_32;
  }
  vocabularyString = self->_vocabularyString;
  uint64_t v14 = vocabularyString;
  if (!vocabularyString)
  {
    uint64_t v15 = objc_msgSend_vocabularyString(v5, v10, v11, v12);
    if (!v15)
    {
      uint64_t v41 = 0;
      int v18 = 0;
      goto LABEL_10;
    }
    uint64_t v41 = (void *)v15;
    uint64_t v14 = self->_vocabularyString;
  }
  id v3 = objc_msgSend_vocabularyString(v5, v10, v11, v12);
  if ((objc_msgSend_isEqual_(v14, v16, (uint64_t)v3, v17) & 1) == 0)
  {

    char isEqual = 0;
    goto LABEL_30;
  }
  int v18 = 1;
LABEL_10:
  vocabularyIdentifier = self->_vocabularyIdentifier;
  uint64_t v21 = vocabularyIdentifier;
  if (!vocabularyIdentifier)
  {
    uint64_t v22 = objc_msgSend_vocabularyIdentifier(v5, v10, v11, v12);
    if (!v22)
    {
      v39 = 0;
      int v26 = 0;
LABEL_17:
      originAppId = self->_originAppId;
      uint64_t v28 = originAppId;
      if (!originAppId)
      {
        uint64_t v29 = objc_msgSend_originAppId(v5, v10, v11, v12);
        if (!v29)
        {
          uint64_t v35 = 0;
          char isEqual = 1;
          goto LABEL_25;
        }
        uint64_t v37 = v29;
        uint64_t v28 = self->_originAppId;
      }
      int v30 = v26;
      int v31 = v18;
      v32 = objc_msgSend_originAppId(v5, v10, v11, v12, v37, v39);
      char isEqual = objc_msgSend_isEqual_(v28, v33, (uint64_t)v32, v34);

      int v18 = v31;
      if (originAppId)
      {
        if (!v30) {
          goto LABEL_27;
        }
        uint64_t v23 = v40;
        goto LABEL_26;
      }
      LOBYTE(v26) = v30;
      uint64_t v35 = v38;
LABEL_25:

      uint64_t v23 = v40;
      if ((v26 & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    v39 = (void *)v22;
    uint64_t v21 = self->_vocabularyIdentifier;
  }
  uint64_t v23 = objc_msgSend_vocabularyIdentifier(v5, v10, v11, v12);
  if (objc_msgSend_isEqual_(v21, v24, (uint64_t)v23, v25))
  {
    v40 = v23;
    int v26 = 1;
    goto LABEL_17;
  }
  char isEqual = 0;
LABEL_26:

LABEL_27:
  if (vocabularyIdentifier)
  {
    if (!v18) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  if (v18) {
LABEL_29:
  }

LABEL_30:
  if (!vocabularyString) {

  }
LABEL_32:
  return isEqual;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_numberWithUnsignedShort_(NSNumber, a2, self->_vocabularyType, v2);
  uint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_hash(self->_vocabularyString, v9, v10, v11);
  uint64_t v16 = v12 ^ objc_msgSend_hash(self->_vocabularyIdentifier, v13, v14, v15);
  unint64_t v20 = v16 ^ objc_msgSend_hash(self->_originAppId, v17, v18, v19) ^ v8;

  return v20;
}

- (unsigned)vocabularyType
{
  return self->_vocabularyType;
}

- (NSString)vocabularyString
{
  return self->_vocabularyString;
}

- (NSString)vocabularyIdentifier
{
  return self->_vocabularyIdentifier;
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_vocabularyIdentifier, 0);
  objc_storeStrong((id *)&self->_vocabularyString, 0);
}

@end