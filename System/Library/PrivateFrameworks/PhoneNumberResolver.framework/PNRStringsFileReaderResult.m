@interface PNRStringsFileReaderResult
+ (int64_t)maxPossibleScore;
- (BOOL)isEqualTo:(id)a3;
- (BOOL)isPlaceHolderForEmpty;
- (BOOL)shouldOrderCityFirstForLanguage:(id)a3 phoneNumberInCC:(id)a4;
- (NSString)city;
- (NSString)country;
- (NSString)region;
- (PNRStringsFileReaderResult)initWithCountry:(id)a3 region:(id)a4 city:(id)a5;
- (id)aggregateStringWhileInCountry:(id)a3 forLanguage:(id)a4 ccOfNumber:(id)a5;
- (id)separatorForLanguage:(id)a3;
- (int64_t)score;
- (void)setCity:(id)a3;
- (void)setCountry:(id)a3;
- (void)setRegion:(id)a3;
@end

@implementation PNRStringsFileReaderResult

- (PNRStringsFileReaderResult)initWithCountry:(id)a3 region:(id)a4 city:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PNRStringsFileReaderResult;
  v12 = [(PNRStringsFileReaderResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_country, a3);
    objc_storeStrong((id *)&v13->_region, a4);
    objc_storeStrong((id *)&v13->_city, a5);
  }

  return v13;
}

- (BOOL)isEqualTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PNRStringsFileReaderResult *)self country];
    v7 = [v5 country];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(PNRStringsFileReaderResult *)self region];
      id v9 = [v5 region];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [(PNRStringsFileReaderResult *)self city];
        id v11 = [v5 city];
        char v12 = [v10 isEqualToString:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (int64_t)score
{
  v3 = [(PNRStringsFileReaderResult *)self country];

  BOOL v4 = v3 != 0;
  if (v3) {
    uint64_t v5 = 10;
  }
  else {
    uint64_t v5 = 1;
  }
  v6 = [(PNRStringsFileReaderResult *)self region];

  uint64_t v7 = 2 * v5;
  BOOL v8 = v6 == 0;
  if (v6) {
    uint64_t v9 = 10 * v5;
  }
  else {
    uint64_t v9 = v5;
  }
  if (v8) {
    uint64_t v7 = 0;
  }
  uint64_t v10 = v7 | v4;
  id v11 = [(PNRStringsFileReaderResult *)self city];

  uint64_t v12 = 3 * v9;
  if (!v11) {
    uint64_t v12 = 0;
  }
  return v10 + v12;
}

- (id)separatorForLanguage:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [&unk_26ECC8BD0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    uint64_t v7 = @" ";
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(&unk_26ECC8BD0);
      }
      if ([*(id *)(*((void *)&v10 + 1) + 8 * v8) isEqualToString:v3]) {
        break;
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [&unk_26ECC8BD0 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        uint64_t v7 = @", ";
        break;
      }
    }
  }
  else
  {
    uint64_t v7 = @", ";
  }

  return v7;
}

- (BOOL)shouldOrderCityFirstForLanguage:(id)a3 phoneNumberInCC:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [&unk_26ECC8BE8 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(&unk_26ECC8BE8);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isEqualToString:v4])
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [&unk_26ECC8BE8 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (id)aggregateStringWhileInCountry:(id)a3 forLanguage:(id)a4 ccOfNumber:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(PNRStringsFileReaderResult *)self shouldOrderCityFirstForLanguage:v9 phoneNumberInCC:a5];
  long long v11 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  long long v12 = [(PNRStringsFileReaderResult *)self city];
  if ([v12 length])
  {
    long long v13 = [(PNRStringsFileReaderResult *)self region];
    long long v14 = [(PNRStringsFileReaderResult *)self city];
    char v15 = [v13 isEqualToString:v14];

    if (v15) {
      goto LABEL_5;
    }
    long long v12 = [(PNRStringsFileReaderResult *)self city];
    [v11 addObject:v12];
  }

LABEL_5:
  uint64_t v16 = [(PNRStringsFileReaderResult *)self region];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    v18 = [(PNRStringsFileReaderResult *)self region];
    if (v10) {
      [v11 addObject:v18];
    }
    else {
      [v11 insertObject:v18 atIndex:0];
    }
  }
  v19 = [(PNRStringsFileReaderResult *)self country];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    v21 = [(PNRStringsFileReaderResult *)self country];
    v22 = [v21 componentsSeparatedByString:@":"];

    if ([v22 count] == 2)
    {
      v23 = [v22 objectAtIndexedSubscript:0];
      if ([v8 caseInsensitiveCompare:v23]
        && ([v23 caseInsensitiveCompare:@"CN"]
         || [v8 caseInsensitiveCompare:@"HK"]
         && [v8 caseInsensitiveCompare:@"MO"]))
      {

        v23 = [v22 objectAtIndexedSubscript:1];
        if (v10) {
          [v11 addObject:v23];
        }
        else {
          [v11 insertObject:v23 atIndex:0];
        }
      }
    }
  }
  v24 = [(PNRStringsFileReaderResult *)self separatorForLanguage:v9];
  v25 = [v11 componentsJoinedByString:v24];

  return v25;
}

+ (int64_t)maxPossibleScore
{
  return 321;
}

- (BOOL)isPlaceHolderForEmpty
{
  id v3 = [(PNRStringsFileReaderResult *)self country];
  if ([v3 isEqualToString:@":NONE"])
  {
    id v4 = [(PNRStringsFileReaderResult *)self region];
    if ([v4 isEqualToString:@"NONE"])
    {
      uint64_t v5 = [(PNRStringsFileReaderResult *)self city];
      char v6 = [v5 isEqualToString:@"NONE"];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_region, 0);

  objc_storeStrong((id *)&self->_country, 0);
}

@end