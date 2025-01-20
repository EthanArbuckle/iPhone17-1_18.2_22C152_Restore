@interface CNVCardTesting
+ (BOOL)version21DataUsingAdapter:(id)a3 containsData:(id)a4;
+ (BOOL)version30CardForPerson:(id)a3 containsLine:(id)a4;
+ (BOOL)version30CardForPerson:(id)a3 containsString:(id)a4;
+ (BOOL)version30DataUsingAdapter:(id)a3 containsData:(id)a4;
+ (id)activityAlertResultWithTypes:(id)a3 sounds:(id)a4 vibrations:(id)a5;
+ (id)cardDataWithBodyLines:(id)a3 version:(id)a4 encoding:(unint64_t)a5;
+ (id)chineseDateWithEra:(int64_t)a3 year:(int64_t)a4 month:(int64_t)a5 day:(int64_t)a6;
+ (id)complexValueWithValue:(id)a3 label:(id)a4 isPrimary:(BOOL)a5;
+ (id)gregorianDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5;
+ (id)instantMessagingItemWithUsername:(id)a3 service:(id)a4 label:(id)a5;
+ (id)itemWithValue:(id)a3 label:(id)a4;
+ (id)linesUsingAdapter:(id)a3;
+ (id)linesUsingAdapter:(id)a3 options:(id)a4;
+ (id)parseCardWithBodyLine:(id)a3;
+ (id)parseCardWithBodyLines:(id)a3;
+ (id)parseCardWithBodyLines:(id)a3 version:(id)a4 encoding:(unint64_t)a5;
+ (id)parseCardWithData:(id)a3;
+ (id)parseCardWithData:(id)a3 options:(id)a4;
+ (id)resultWithProperty:(id)a3 value:(id)a4 label:(id)a5 isPrimary:(BOOL)a6;
+ (id)unknownPropertyWithName:(id)a3 line:(id)a4;
+ (id)version21DataUsingAdapter:(id)a3;
+ (id)version30DataUsingAdapter:(id)a3;
@end

@implementation CNVCardTesting

+ (id)parseCardWithBodyLine:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = objc_msgSend(a1, "parseCardWithBodyLines:", v6, v9, v10);

  return v7;
}

+ (id)parseCardWithBodyLines:(id)a3
{
  return (id)[a1 parseCardWithBodyLines:a3 version:@"3.0" encoding:4];
}

+ (id)parseCardWithBodyLines:(id)a3 version:(id)a4 encoding:(unint64_t)a5
{
  v6 = [a1 cardDataWithBodyLines:a3 version:a4 encoding:a5];
  v7 = [a1 parseCardWithData:v6];

  return v7;
}

+ (id)parseCardWithData:(id)a3
{
  v3 = +[CNVCardDictionarySerialization dictionariesWithData:a3 error:0];
  v4 = [v3 firstObject];

  return v4;
}

+ (id)parseCardWithData:(id)a3 options:(id)a4
{
  v4 = +[CNVCardDictionarySerialization dictionariesWithData:a3 options:a4 error:0];
  id v5 = [v4 firstObject];

  return v5;
}

+ (id)cardDataWithBodyLines:(id)a3 version:(id)a4 encoding:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28E78] string];
  [v9 appendString:@"BEGIN:VCARD\r\n"];
  [v9 appendFormat:@"VERSION:%@\r\n", v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        [v9 appendFormat:@"%@\r\n", *(void *)(*((void *)&v17 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [v9 appendString:@"END:VCARD\r\n"];
  v15 = [v9 dataUsingEncoding:a5];

  return v15;
}

+ (id)resultWithProperty:(id)a3 value:(id)a4 label:(id)a5 isPrimary:(BOOL)a6
{
  BOOL v6 = a6;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v10 = a3;
  uint64_t v11 = [a1 complexValueWithValue:a4 label:a5 isPrimary:v6];
  v15 = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v17[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  return v13;
}

+ (id)complexValueWithValue:(id)a3 label:(id)a4 isPrimary:(BOOL)a5
{
  BOOL v5 = a5;
  v15[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v14[0] = @"value";
  id v9 = v7;
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v9;
  v14[1] = @"label";
  id v10 = v8;
  if (!v8)
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  v14[2] = @"isPrimary";
  uint64_t v11 = [NSNumber numberWithBool:v5];
  v15[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  if (v8)
  {
    if (v7) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v7) {
      goto LABEL_7;
    }
  }

LABEL_7:
  return v12;
}

+ (id)unknownPropertyWithName:(id)a3 line:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(CNVCardUnknownPropertyDescription);
  [(CNVCardUnknownPropertyDescription *)v7 setPropertyName:v6];

  [(CNVCardUnknownPropertyDescription *)v7 setOriginalLine:v5];
  return v7;
}

+ (id)linesUsingAdapter:(id)a3
{
  return (id)[a1 linesUsingAdapter:a3 options:0];
}

+ (id)linesUsingAdapter:(id)a3 options:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 arrayWithObjects:&v12 count:1];
  id v9 = +[CNVCardWriting stringWithPeople:options:error:](CNVCardWriting, "stringWithPeople:options:error:", v8, v6, 0, v12, v13);

  id v10 = [v9 componentsSeparatedByString:@"\r\n"];

  return v10;
}

+ (id)version30DataUsingAdapter:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:&v8 count:1];
  id v6 = +[CNVCardWriting dataWithPeople:options:error:](CNVCardWriting, "dataWithPeople:options:error:", v5, 0, 0, v8, v9);

  return v6;
}

+ (id)version21DataUsingAdapter:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(CNVCardWritingOptions);
  [(CNVCardWritingOptions *)v4 setOutputVersion:1];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = +[CNVCardWriting dataWithPeople:v5 options:v4 error:0];

  return v6;
}

+ (BOOL)version30CardForPerson:(id)a3 containsLine:(id)a4
{
  id v6 = a4;
  id v7 = [a1 linesUsingAdapter:a3];
  LOBYTE(a1) = [v7 containsObject:v6];

  return (char)a1;
}

+ (BOOL)version30CardForPerson:(id)a3 containsString:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 arrayWithObjects:&v11 count:1];
  uint64_t v9 = +[CNVCardWriting stringWithPeople:options:error:](CNVCardWriting, "stringWithPeople:options:error:", v8, 0, 0, v11, v12);

  LOBYTE(v7) = [v9 containsString:v6];
  return (char)v7;
}

+ (BOOL)version30DataUsingAdapter:(id)a3 containsData:(id)a4
{
  id v6 = a4;
  id v7 = [a1 version30DataUsingAdapter:a3];
  LOBYTE(a1) = objc_msgSend(v7, "_cn_containsData:", v6);

  return (char)a1;
}

+ (BOOL)version21DataUsingAdapter:(id)a3 containsData:(id)a4
{
  id v6 = a4;
  id v7 = [a1 version21DataUsingAdapter:a3];
  LOBYTE(a1) = objc_msgSend(v7, "_cn_containsData:", v6);

  return (char)a1;
}

+ (id)itemWithValue:(id)a3 label:(id)a4
{
  return +[CNVCardPropertyItem itemWithValue:a3 label:a4 identifier:0];
}

+ (id)instantMessagingItemWithUsername:(id)a3 service:(id)a4 label:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = @"username";
  v15[1] = @"service";
  v16[0] = a3;
  v16[1] = a4;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 dictionaryWithObjects:v16 forKeys:v15 count:2];

  uint64_t v13 = [a1 itemWithValue:v12 label:v9];

  return v13;
}

+ (id)gregorianDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v8 setYear:a3];
  [v8 setMonth:a4];
  [v8 setDay:a5];
  id v9 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v8 setCalendar:v9];

  return v8;
}

+ (id)chineseDateWithEra:(int64_t)a3 year:(int64_t)a4 month:(int64_t)a5 day:(int64_t)a6
{
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v10 setEra:a3];
  [v10 setYear:a4];
  [v10 setMonth:a5];
  [v10 setDay:a6];
  id v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C2F0]];
  [v10 setCalendar:v11];

  return v10;
}

+ (id)activityAlertResultWithTypes:(id)a3 sounds:(id)a4 vibrations:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v7 count])
  {
    unint64_t v11 = 0;
    uint64_t v12 = *MEMORY[0x1E4F5A280];
    do
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
      v14 = [v8 objectAtIndexedSubscript:v11];
      int v15 = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v14);

      if (v15)
      {
        id v16 = [v8 objectAtIndexedSubscript:v11];
        [v13 setObject:v16 forKeyedSubscript:@"sound"];
      }
      long long v17 = [v9 objectAtIndexedSubscript:v11];
      int v18 = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v17);

      if (v18)
      {
        long long v19 = [v9 objectAtIndexedSubscript:v11];
        [v13 setObject:v19 forKeyedSubscript:@"vibration"];
      }
      long long v20 = [v7 objectAtIndexedSubscript:v11];
      [v10 setObject:v13 forKeyedSubscript:v20];

      ++v11;
    }
    while (v11 < [v7 count]);
  }
  v23 = @"ActivityAlert";
  v24[0] = v10;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  return v21;
}

@end