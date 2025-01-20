@interface PLSearchIndexDateFormatter
+ (id)monthFormatForLocale:(id)a3;
+ (id)yearFormatForLocale:(id)a3;
- (PLSearchIndexDateFormatter)init;
- (id)_arrangedMonthSymbols;
- (id)_inqNewLocalizedStringFromDate:(id)a3;
- (id)localizedMonthStringsFromDate:(id)a3;
- (id)newLocalizedComponentsFromDate:(id)a3 includeMonth:(BOOL)a4;
- (id)newLocalizedStringFromDate:(id)a3;
- (id)newLocalizedStringFromYear:(id)a3 month:(id)a4;
- (void)_inqSetupDateFormatter;
- (void)_inqUpdateDateFormat:(id)a3;
@end

@implementation PLSearchIndexDateFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthSymbols, 0);
  objc_storeStrong((id *)&self->_parseFormat, 0);
  objc_storeStrong((id *)&self->_displayFormat, 0);
  objc_storeStrong((id *)&self->_monthFormat, 0);
  objc_storeStrong((id *)&self->_yearFormat, 0);
  objc_storeStrong((id *)&self->_dateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)newLocalizedStringFromYear:(id)a3 month:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__112869;
  v15 = __Block_byref_object_dispose__112870;
  id v16 = 0;
  id v9 = v5;
  id v10 = v6;
  pl_dispatch_sync();
  id v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __63__PLSearchIndexDateFormatter_newLocalizedStringFromYear_month___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqSetupDateFormatter];
  v2 = *(void **)(a1 + 48);
  if (*(void *)(a1 + 40))
  {
    if (v2)
    {
      [*(id *)(a1 + 32) _inqUpdateDateFormat:*(void *)(*(void *)(a1 + 32) + 32)];
      v3 = [*(id *)(*(void *)(a1 + 32) + 16) dateFromString:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _inqUpdateDateFormat:*(void *)(*(void *)(a1 + 32) + 40)];
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) dateFromString:*(void *)(a1 + 48)];
      id v5 = (void *)v4;
      if (v3) {
        BOOL v6 = v4 == 0;
      }
      else {
        BOOL v6 = 1;
      }
      if (!v6)
      {
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        [v7 getEra:0 year:&v17 month:0 day:0 fromDate:v3];
        [v7 getEra:0 year:0 month:&v16 day:0 fromDate:v5];
        id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        [v8 setYear:v17];
        [v8 setMonth:v16];
        id v9 = [v7 dateFromComponents:v8];
        uint64_t v10 = [*(id *)(a1 + 32) _inqNewLocalizedStringFromDate:v9];
        uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
        v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
      return;
    }
    v2 = *(void **)(a1 + 40);
  }
  else if (!v2)
  {
    return;
  }
  uint64_t v13 = [v2 copy];
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (id)newLocalizedStringFromDate:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__112869;
  uint64_t v10 = __Block_byref_object_dispose__112870;
  id v11 = 0;
  id v5 = a3;
  pl_dispatch_sync();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __57__PLSearchIndexDateFormatter_newLocalizedStringFromDate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _inqNewLocalizedStringFromDate:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_inqNewLocalizedStringFromDate:(id)a3
{
  displayFormat = self->_displayFormat;
  id v5 = a3;
  [(PLSearchIndexDateFormatter *)self _inqUpdateDateFormat:displayFormat];
  uint64_t v6 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v5];

  id v7 = (void *)[v6 copy];
  return v7;
}

- (id)newLocalizedComponentsFromDate:(id)a3 includeMonth:(BOOL)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__112869;
  id v11 = __Block_byref_object_dispose__112870;
  id v12 = 0;
  id v6 = a3;
  pl_dispatch_sync();
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __74__PLSearchIndexDateFormatter_newLocalizedComponentsFromDate_includeMonth___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqSetupDateFormatter];
  [*(id *)(a1 + 32) _inqUpdateDateFormat:*(void *)(*(void *)(a1 + 32) + 56)];
  id v9 = [*(id *)(*(void *)(a1 + 32) + 16) stringFromDate:*(void *)(a1 + 40)];
  uint64_t v2 = [v9 componentsSeparatedByString:@"-"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] == 2)
  {
    if (*(unsigned char *)(a1 + 56)) {
      goto LABEL_6;
    }
    uint64_t v5 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "subarrayWithRange:", 1, 1);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }

LABEL_6:
}

- (id)localizedMonthStringsFromDate:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__112869;
  uint64_t v10 = __Block_byref_object_dispose__112870;
  id v11 = 0;
  id v5 = a3;
  pl_dispatch_sync();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __60__PLSearchIndexDateFormatter_localizedMonthStringsFromDate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqSetupDateFormatter];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) calendar];
  uint64_t v3 = [v2 component:8 fromDate:*(void *)(a1 + 40)];

  if (v3 >= 1 && v3 - 1 < (unint64_t)[*(id *)(*(void *)(a1 + 32) + 64) count])
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndex:v3 - 1];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (void)_inqUpdateDateFormat:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PLSearchIndexDateFormatter.m" lineNumber:148 description:@"expect valid format"];
  }
  id v5 = [(NSDateFormatter *)self->_dateFormatter dateFormat];
  if (v5 != v7 && ([v5 isEqualToString:v7] & 1) == 0) {
    [(NSDateFormatter *)self->_dateFormatter setDateFormat:v7];
  }
}

- (void)_inqSetupDateFormatter
{
  if (!self->_dateFormatter)
  {
    uint64_t v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v3;
  }
  if (!self->_dateRangeFormatter)
  {
    id v5 = [[PLDateRangeFormatter alloc] initWithPreset:2];
    dateRangeFormatter = self->_dateRangeFormatter;
    self->_dateRangeFormatter = v5;
  }
  if (!self->_didSetupLocaleAndFormats)
  {
    id v21 = +[PLSearchIndexConfiguration locale];
    [(NSDateFormatter *)self->_dateFormatter setLocale:v21];
    [(PLDateRangeFormatter *)self->_dateRangeFormatter setLocale:v21];
    id v7 = [(id)objc_opt_class() yearFormatForLocale:v21];
    uint64_t v8 = [(id)objc_opt_class() monthFormatForLocale:v21];
    id v9 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"LLLLy" options:0 locale:v21];
    uint64_t v10 = [NSString stringWithFormat:@"%@%@%@", v8, @"-", v7];
    id v11 = (NSString *)[v7 copy];
    yearFormat = self->_yearFormat;
    self->_yearFormat = v11;

    uint64_t v13 = (NSString *)[v8 copy];
    monthFormat = self->_monthFormat;
    self->_monthFormat = v13;

    v15 = (NSString *)[v9 copy];
    displayFormat = self->_displayFormat;
    self->_displayFormat = v15;

    uint64_t v17 = (NSString *)[v10 copy];
    parseFormat = self->_parseFormat;
    self->_parseFormat = v17;

    v19 = [(PLSearchIndexDateFormatter *)self _arrangedMonthSymbols];
    monthSymbols = self->_monthSymbols;
    self->_monthSymbols = v19;

    self->_didSetupLocaleAndFormats = 1;
  }
}

- (id)_arrangedMonthSymbols
{
  v54[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSDateFormatter *)self->_dateFormatter monthSymbols];
  v54[0] = v3;
  uint64_t v4 = [(NSDateFormatter *)self->_dateFormatter shortMonthSymbols];
  v54[1] = v4;
  id v5 = [(NSDateFormatter *)self->_dateFormatter veryShortMonthSymbols];
  v54[2] = v5;
  uint64_t v6 = [(NSDateFormatter *)self->_dateFormatter standaloneMonthSymbols];
  v54[3] = v6;
  id v7 = [(NSDateFormatter *)self->_dateFormatter shortStandaloneMonthSymbols];
  v54[4] = v7;
  uint64_t v8 = [(NSDateFormatter *)self->_dateFormatter veryShortStandaloneMonthSymbols];
  v54[5] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:6];

  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_112895];
  id v11 = [v9 filteredArrayUsingPredicate:v10];

  id v36 = [MEMORY[0x1E4F1CA48] array];
  v37 = v11;
  id v12 = [v11 firstObject];
  uint64_t v13 = [v12 count];

  uint64_t v35 = v13;
  if (v13)
  {
    uint64_t v14 = 0;
    do
    {
      v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v35);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v16 = v37;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v48 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = [*(id *)(*((void *)&v47 + 1) + 8 * i) objectAtIndexedSubscript:v14];
            [v15 addObject:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v18);
      }
      uint64_t v38 = v14;

      [v15 sortUsingComparator:&__block_literal_global_11];
      v22 = [MEMORY[0x1E4F1CA48] array];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v23 = v15;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v43 + 1) + 8 * j);
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id v29 = v22;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v40;
              while (2)
              {
                for (uint64_t k = 0; k != v31; ++k)
                {
                  if (*(void *)v40 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  if ([*(id *)(*((void *)&v39 + 1) + 8 * k) hasPrefix:v28])
                  {

                    goto LABEL_25;
                  }
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
                if (v31) {
                  continue;
                }
                break;
              }
            }

            [v29 addObject:v28];
LABEL_25:
            ;
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v25);
      }

      [v36 addObject:v22];
      uint64_t v14 = v38 + 1;
    }
    while (v38 + 1 != v35);
  }

  return v36;
}

uint64_t __51__PLSearchIndexDateFormatter__arrangedMonthSymbols__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    unint64_t v8 = [v4 length];
    uint64_t v7 = v8 < [v5 length];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

BOOL __51__PLSearchIndexDateFormatter__arrangedMonthSymbols__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = a2;
  id v4 = [v2 setWithArray:v3];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [v3 count];

  return v5 == v6;
}

- (PLSearchIndexDateFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLSearchIndexDateFormatter;
  uint64_t v2 = [(PLSearchIndexDateFormatter *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)monthFormatForLocale:(id)a3
{
  return (id)[MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"LLLL" options:0 locale:a3];
}

+ (id)yearFormatForLocale:(id)a3
{
  return (id)[MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"y" options:0 locale:a3];
}

@end