@interface NSArray(CHCSVAdditions)
+ (id)arrayWithContentsOfDelimitedURL:()CHCSVAdditions options:delimiter:error:;
+ (uint64_t)arrayWithContentsOfCSVURL:()CHCSVAdditions;
+ (uint64_t)arrayWithContentsOfCSVURL:()CHCSVAdditions options:;
+ (uint64_t)arrayWithContentsOfDelimitedURL:()CHCSVAdditions delimiter:;
+ (uint64_t)arrayWithContentsOfDelimitedURL:()CHCSVAdditions options:delimiter:;
- (id)CSVString;
@end

@implementation NSArray(CHCSVAdditions)

+ (uint64_t)arrayWithContentsOfCSVURL:()CHCSVAdditions
{
  return [a1 arrayWithContentsOfDelimitedURL:a3 options:0 delimiter:44 error:0];
}

+ (uint64_t)arrayWithContentsOfDelimitedURL:()CHCSVAdditions delimiter:
{
  return [a1 arrayWithContentsOfDelimitedURL:a3 options:0 delimiter:a4 error:0];
}

+ (uint64_t)arrayWithContentsOfCSVURL:()CHCSVAdditions options:
{
  return [a1 arrayWithContentsOfDelimitedURL:a3 options:a4 delimiter:44 error:0];
}

+ (uint64_t)arrayWithContentsOfDelimitedURL:()CHCSVAdditions options:delimiter:
{
  return [a1 arrayWithContentsOfDelimitedURL:a3 options:a4 delimiter:a5 error:0];
}

+ (id)arrayWithContentsOfDelimitedURL:()CHCSVAdditions options:delimiter:error:
{
  id v11 = a3;
  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"CHCSVParser.m", 829, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];
  }
  v12 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v11];
  v13 = _CHCSVParserParse(v12, a4, a5, a6);

  return v13;
}

- (id)CSVString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CAA8] outputStreamToMemory];
  v3 = [[CHCSVWriter alloc] initWithOutputStream:v2 encoding:4 delimiter:44];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EFC24390, (void)v13)) {
          [(CHCSVWriter *)v3 writeLineOfFields:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [(CHCSVWriter *)v3 closeStream];
  v10 = [v2 propertyForKey:*MEMORY[0x1E4F1C4C0]];
  id v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];

  return v11;
}

@end