@interface TTKTestCase
+ (id)convertToIsolatedWordMode:(id)a3;
- (NSArray)records;
- (NSDictionary)metadata;
- (NSMutableDictionary)annotations;
- (NSString)intendedText;
- (TTKTestCase)initWithDictionary:(id)a3;
- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4;
- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4 intendedText:(id)a5;
- (id)toJsonDictionary;
@end

@implementation TTKTestCase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedText, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (NSString)intendedText
{
  return self->_intendedText;
}

- (NSMutableDictionary)annotations
{
  return self->_annotations;
}

- (NSArray)records
{
  return self->_records;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (id)toJsonDictionary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:self->_metadata forKeyedSubscript:@"metadata"];
  v4 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_records;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "toJsonDictionary", (void)v13);
        [v4 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [v3 setObject:v4 forKeyedSubscript:@"records"];
  annotations = self->_annotations;
  if (annotations) {
    [v3 setObject:annotations forKeyedSubscript:@"annotations"];
  }
  intendedText = self->_intendedText;
  if (intendedText) {
    [v3 setObject:intendedText forKeyedSubscript:@"intended_text"];
  }

  return v3;
}

- (TTKTestCase)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TTKTestCase;
  v5 = [(TTKTestCase *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v6;

    v8 = [v4 objectForKey:@"records"];
    v9 = [MEMORY[0x263EFF980] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
          long long v15 = [TTKTestCaseRecord alloc];
          long long v16 = -[TTKTestCaseRecord initWithDictionary:](v15, "initWithDictionary:", v14, (void)v22);
          [v9 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v11);
    }

    objc_storeStrong((id *)&v5->_records, v9);
    uint64_t v17 = [v4 objectForKey:@"annotations"];
    annotations = v5->_annotations;
    v5->_annotations = (NSMutableDictionary *)v17;

    uint64_t v19 = [v4 objectForKey:@"intended_text"];
    intendedText = v5->_intendedText;
    v5->_intendedText = (NSString *)v19;
  }
  return v5;
}

- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4
{
  return [(TTKTestCase *)self initWithMetadata:a3 records:a4 intendedText:0];
}

- (TTKTestCase)initWithMetadata:(id)a3 records:(id)a4 intendedText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TTKTestCase;
  uint64_t v12 = [(TTKTestCase *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metadata, a3);
    objc_storeStrong((id *)&v13->_records, a4);
    objc_storeStrong((id *)&v13->_intendedText, a5);
  }

  return v13;
}

+ (id)convertToIsolatedWordMode:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v44 = v3;
  id v4 = [v3 intendedText];

  if (v4)
  {
    v46 = [MEMORY[0x263EFF980] array];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v5 = [v3 records];
    v47 = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v6)
    {
      int v7 = 0;
      uint64_t v51 = *(void *)v60;
      while (2)
      {
        uint64_t v49 = v6;
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v60 != v51) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v10 = [v3 intendedText];
          uint64_t v11 = v7;
          uint64_t v12 = [v10 substringFromIndex:v7];

          v53 = [v9 primaryIntendedText];
          if (![v53 length]) {
            goto LABEL_31;
          }
          uint64_t v13 = [v12 lowercaseString];
          uint64_t v14 = [v53 lowercaseString];
          int v15 = [v13 rangeOfString:v14];
          int v17 = v16;

          if (v15 >= 1)
          {
            uint64_t v18 = 0;
            while (1)
            {
              uint64_t v19 = [MEMORY[0x263F08708] whitespaceCharacterSet];
              char v20 = objc_msgSend(v19, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v18));

              if ((v20 & 1) == 0
                && [v12 characterAtIndex:v18] != 46
                && [v12 characterAtIndex:v18] != 42)
              {
                break;
              }
              if (v15 == ++v18) {
                goto LABEL_14;
              }
            }
LABEL_31:
            id v4 = 0;
            goto LABEL_32;
          }
LABEL_14:
          v21 = [v44 intendedText];
          long long v22 = objc_msgSend(v21, "substringWithRange:", 0, v11);

          [v46 addObject:v22];
          uint64_t v23 = v15 + v17;
          while (1)
          {
            long long v24 = [v44 intendedText];
            int v7 = v11 + v23;
            if ([v24 length] <= (unint64_t)(v11 + v23)) {
              break;
            }
            BOOL v25 = [v12 characterAtIndex:v23] == 32;

            ++v23;
            if (!v25)
            {
              int v7 = v11 + v23 - 1;
              goto LABEL_19;
            }
          }

LABEL_19:
          id v3 = v44;
          v5 = v47;
        }
        uint64_t v6 = [v47 countByEnumeratingWithState:&v59 objects:v64 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    [MEMORY[0x263EFF980] array];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    v47 = long long v56 = 0u;
    id obj = [v44 records];
    uint64_t v26 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v26)
    {
      int v27 = 0;
      uint64_t v50 = *(void *)v56;
      do
      {
        uint64_t v28 = 0;
        uint64_t v48 = v27;
        uint64_t v52 = v26;
        do
        {
          if (*(void *)v56 != v50) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v55 + 1) + 8 * v28);
          v30 = [v29 touchData];
          BOOL v31 = v30 == 0;

          if (!v31)
          {
            v32 = [TTKTestCaseRecord alloc];
            v54 = [v29 primaryIntendedText];
            v33 = [v29 additionalIntendedTexts];
            v34 = [v29 touchDataCollection];
            v35 = [v29 recordID];
            v36 = [v29 layoutName];
            v37 = [v29 inputText];
            v38 = [v29 transliteration];
            v39 = [v46 objectAtIndex:v48 + v28];
            v40 = [v29 annotations];
            v41 = [(TTKTestCaseRecord *)v32 initWithIntendedText:v54 additionalIntendedTexts:v33 touchDataCollection:v34 recordID:v35 layoutName:v36 inputText:v37 transliteration:v38 context:v39 annotations:v40];
            [v47 addObject:v41];
          }
          ++v28;
        }
        while (v52 != v28);
        uint64_t v26 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
        int v27 = v48 + v28;
      }
      while (v26);
    }

    v42 = [TTKTestCase alloc];
    uint64_t v12 = [v44 metadata];
    v53 = [v44 intendedText];
    id v4 = -[TTKTestCase initWithMetadata:records:intendedText:](v42, "initWithMetadata:records:intendedText:", v12, v47);
LABEL_32:

    id v3 = v44;
  }

  return v4;
}

@end