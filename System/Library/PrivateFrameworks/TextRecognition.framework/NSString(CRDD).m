@interface NSString(CRDD)
- (id)_compositeRegexForReplacing:()CRDD nonspaceLeft:nonspaceRight:;
- (id)_crDDFriendlyTextWithIndexMapping:()CRDD;
@end

@implementation NSString(CRDD)

- (id)_crDDFriendlyTextWithIndexMapping:()CRDD
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke;
  block[3] = &unk_1E6CDBE60;
  id v39 = v4;
  block[4] = v4;
  if (qword_1EB58CD00 != -1) {
    dispatch_once(&qword_1EB58CD00, block);
  }
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v39];
  v32 = [v31 applyRegex:qword_1EB58CCC8 withReplacementTemplate:&__block_literal_global_101];
  v33 = [v31 applyRegex:qword_1EB58CCD0 withReplacementTemplate:&__block_literal_global_106];
  v34 = [v31 applyRegex:qword_1EB58CCD8 withReplacementTemplate:&__block_literal_global_111];
  uint64_t v5 = qword_1EB58CCE0;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_5;
  v46[3] = &unk_1E6CDBEA8;
  id v6 = v31;
  id v47 = v6;
  v35 = [v6 applyRegex:v5 withReplacementTemplate:v46];
  uint64_t v7 = qword_1EB58CCE8;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_6;
  v44[3] = &unk_1E6CDBEA8;
  id v8 = v6;
  id v45 = v8;
  v36 = [v8 applyRegex:v7 withReplacementTemplate:v44];
  uint64_t v9 = qword_1EB58CCF0;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_7;
  v42[3] = &unk_1E6CDBEA8;
  id v10 = v8;
  id v43 = v10;
  v37 = [v10 applyRegex:v9 withReplacementTemplate:v42];
  uint64_t v11 = qword_1EB58CCF8;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_8;
  v40[3] = &unk_1E6CDBEA8;
  id v12 = v10;
  id v41 = v12;
  v38 = [v12 applyRegex:v11 withReplacementTemplate:v40];
  if (a3)
  {
    unint64_t v13 = 0;
    *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "length"));
    while ([v12 length] > v13)
    {
      v14 = [v38 objectAtIndexedSubscript:v13];
      v15 = objc_msgSend(v37, "objectAtIndexedSubscript:", objc_msgSend(v14, "integerValue"));
      v16 = objc_msgSend(v36, "objectAtIndexedSubscript:", objc_msgSend(v15, "integerValue"));
      v17 = objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v16, "integerValue"));
      v18 = objc_msgSend(v34, "objectAtIndexedSubscript:", objc_msgSend(v17, "integerValue"));
      v19 = objc_msgSend(v33, "objectAtIndexedSubscript:", objc_msgSend(v18, "integerValue"));
      v20 = objc_msgSend(v32, "objectAtIndexedSubscript:", objc_msgSend(v19, "integerValue"));

      [*a3 setObject:v20 atIndexedSubscript:v13];
      if ([v20 integerValue] < 0
        || (unint64_t v21 = [v20 integerValue], v21 >= objc_msgSend(v39, "length")))
      {
        v22 = CROSLogForCategory(7);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [v20 integerValue];
          uint64_t v24 = [v39 length];
          uint64_t v25 = [v12 length];
          *(_DWORD *)buf = 134218752;
          uint64_t v50 = v23;
          __int16 v51 = 1024;
          int v52 = v13;
          __int16 v53 = 2048;
          uint64_t v54 = v24;
          __int16 v55 = 2048;
          uint64_t v56 = v25;
          _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_ERROR, "_crDDFriendly: Mapping index %ld at %d out of bounds for (%ld) -> (%ld).", buf, 0x26u);
        }

        id v26 = *a3;
        if (v13)
        {
          v27 = [v26 objectAtIndexedSubscript:v13 - 1];
          [*a3 setObject:v27 atIndexedSubscript:v13];
        }
        else
        {
          [v26 setObject:&unk_1F3933178 atIndexedSubscript:0];
        }
      }

      ++v13;
    }
  }
  v28 = [v12 componentsSeparatedByCharactersInSet:qword_1EB58CCC0];
  v29 = [v28 componentsJoinedByString:@"-"];

  return v29;
}

- (id)_compositeRegexForReplacing:()CRDD nonspaceLeft:nonspaceRight:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  int v21 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v23;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) stringByReplacingOccurrencesOfString:@"/" withString:@"\\/"];
        uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"." withString:@"\\."];
        [v6 addObject:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  id v12 = @"(^|\\s)";
  if (a4) {
    id v12 = @"(\\S)";
  }
  unint64_t v13 = v12;
  v14 = @"($|\\.$|,$|;$|\\?$|!$|\\s|\\.\\s|,\\s|;\\s|\\?\\s|!\\s)";
  if (v21) {
    v14 = @"(\\S)";
  }
  v15 = v14;
  v16 = NSString;
  v17 = [v6 componentsJoinedByString:@"|"];
  v18 = [v16 stringWithFormat:@"%@(%@)%@", v13, v17, v15];

  v19 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v18 options:0 error:0];

  return v19;
}

@end