@interface CRFormFieldLoggingStep
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
- (void)_logField:(id)a3 index:(unint64_t)a4 subIndex:(unint64_t)a5;
@end

@implementation CRFormFieldLoggingStep

- (void)_logField:(id)a3 index:(unint64_t)a4 subIndex:(unint64_t)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 fieldType] == 1)
  {
    +[CRFormContentTypeUtilities shortStringFromContentType:](CRFormContentTypeUtilities, "shortStringFromContentType:", [v7 textContentType]);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v7 suggestedLineHeight];
    uint64_t v10 = v9;
    uint64_t v11 = [v7 maxCharacterCount];
  }
  else
  {
    uint64_t v11 = 0;
    v8 = &stru_1F38EED68;
    uint64_t v10 = 0;
  }
  v38 = v8;
  v12 = CRCastAsClass<CRFormFieldOutputRegion>(v7);
  v13 = v12;
  v14 = &stru_1F38EED68;
  if (v12)
  {
    uint64_t v15 = [v12 indexInGlobalOrder];
    v16 = [v13 labelRegion];
    v17 = [v16 text];
    uint64_t v37 = [v17 length];

    v18 = [v13 labelRegion];
    uint64_t v19 = [v18 text];
    v20 = (void *)v19;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    else {
      v21 = &stru_1F38EED68;
    }
    v14 = v21;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v22 = v15;
  if (a5) {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu", a4, a5);
  }
  else {
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
  }
  uint64_t v24 = v11;
  v25 = CROSLogForCategory(6);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v36 = [v7 boundingQuad];
    [v36 topLeft];
    uint64_t v27 = v26;
    v35 = [v7 boundingQuad];
    [v35 topLeft];
    uint64_t v29 = v28;
    v30 = [v7 boundingQuad];
    [v30 size];
    uint64_t v32 = v31;
    v33 = [v7 boundingQuad];
    [v33 size];
    *(_DWORD *)buf = 138415363;
    v40 = v23;
    __int16 v41 = 2048;
    uint64_t v42 = v27;
    __int16 v43 = 2048;
    uint64_t v44 = v29;
    __int16 v45 = 2048;
    uint64_t v46 = v32;
    __int16 v47 = 2048;
    uint64_t v48 = v34;
    __int16 v49 = 2048;
    uint64_t v50 = [v7 fieldType];
    __int16 v51 = 2048;
    uint64_t v52 = [v7 fieldSource];
    __int16 v53 = 2113;
    v54 = v38;
    __int16 v55 = 2117;
    v56 = v14;
    __int16 v57 = 2048;
    uint64_t v58 = v37;
    __int16 v59 = 2048;
    uint64_t v60 = v22;
    __int16 v61 = 2048;
    uint64_t v62 = v10;
    __int16 v63 = 2048;
    uint64_t v64 = v24;
    _os_log_impl(&dword_1DD733000, v25, OS_LOG_TYPE_DEBUG, "Final result #%@ x:%5.3f y:%5.3f w:%5.3f h:%5.3f type:%lu source:%lu contentType:%{private}@ label:'%{sensitive}@' labelLength:%lu globalOrder:%ld lineHeight:%5.3f charCount:%lu.", buf, 0x84u);
  }
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v8 = a4;
  uint64_t v9 = CROSLogForCategory(6);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

  if (v10)
  {
    id v39 = v8;
    uint64_t v11 = CROSLogForCategory(6);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v61 = [v40 count];
      _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLoggingStep is running (#input:%lu).", buf, 0xCu);
    }

    uint64_t v44 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obuint64_t j = v40;
    uint64_t v12 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v54 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v16 = CROSLogForCategory(6);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v17 = [v15 indexInGlobalOrder];
            uint64_t v18 = [v44 count];
            uint64_t v19 = [v15 fieldSource];
            id v20 = [v15 debugDescription];
            uint64_t v21 = [v20 UTF8String];
            *(_DWORD *)buf = 134218754;
            uint64_t v61 = v17;
            __int16 v62 = 2048;
            uint64_t v63 = v18;
            __int16 v64 = 2048;
            uint64_t v65 = v19;
            __int16 v66 = 2080;
            uint64_t v67 = v21;
            _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_DEBUG, "Inserting field with index %ld in array with size %ld: source %ld, %s", buf, 0x2Au);
          }
          objc_msgSend(v44, "insertObject:atIndex:", v15, objc_msgSend(v15, "indexInGlobalOrder"));
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
      }
      while (v12);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obja = v44;
    uint64_t v22 = [obja countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v22)
    {
      uint64_t v23 = 0;
      uint64_t v41 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v50 != v41) {
            objc_enumerationMutation(obja);
          }
          uint64_t v58 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          v25 = v58;
          uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v58, 1, v39);
          uint64_t v27 = CRCastAsClass<CRFormFieldOutputRegion>(v25);
          uint64_t v28 = v27;
          if (v27)
          {
            uint64_t v29 = [v27 formFieldRegions];
            BOOL v30 = [v29 count] == 0;

            if (!v30)
            {
              uint64_t v31 = [v28 formFieldRegions];
              uint64_t v32 = [v26 arrayByAddingObjectsFromArray:v31];

              uint64_t v26 = (void *)v32;
            }
          }
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v33 = v26;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v34)
          {
            uint64_t v35 = 0;
            uint64_t v36 = *(void *)v46;
            do
            {
              for (uint64_t k = 0; k != v34; ++k)
              {
                if (*(void *)v46 != v36) {
                  objc_enumerationMutation(v33);
                }
                [(CRFormFieldLoggingStep *)self _logField:*(void *)(*((void *)&v45 + 1) + 8 * k) index:v23 subIndex:v35 + k];
              }
              uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v57 count:16];
              v35 += k;
            }
            while (v34);
          }

          ++v23;
        }
        uint64_t v22 = [obja countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v22);
    }

    id v8 = v39;
  }

  return v40;
}

@end