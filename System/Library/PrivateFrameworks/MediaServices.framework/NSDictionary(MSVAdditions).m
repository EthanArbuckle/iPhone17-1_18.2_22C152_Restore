@interface NSDictionary(MSVAdditions)
+ (id)msv_dictionaryWithContentsOfBase64EncodedJSONString:()MSVAdditions error:;
+ (id)msv_dictionaryWithContentsOfJSON:()MSVAdditions error:;
- (id)msv_compactDescription;
- (void)msv_enumerateKeysAndObjectsOrderedByKeyComparator:()MSVAdditions usingBlock:;
- (void)msv_enumerateKeysAndObjectsOrderedByKeyDescriptors:()MSVAdditions usingBlock:;
- (void)msv_enumerateKeysAndObjectsOrderedByKeySelector:()MSVAdditions usingBlock:;
@end

@implementation NSDictionary(MSVAdditions)

- (void)msv_enumerateKeysAndObjectsOrderedByKeyComparator:()MSVAdditions usingBlock:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 allKeys];
  id v9 = [v8 sortedArrayWithOptions:0 usingComparator:v7];

  -[NSDictionary _msv_enumerateKeysAndObjectsWithSortedKeys:usingBlock:](a1, v9, v6);
}

- (void)msv_enumerateKeysAndObjectsOrderedByKeySelector:()MSVAdditions usingBlock:
{
  id v6 = a4;
  id v7 = [a1 allKeys];
  id v8 = [v7 sortedArrayUsingSelector:a3];

  -[NSDictionary _msv_enumerateKeysAndObjectsWithSortedKeys:usingBlock:](a1, v8, v6);
}

- (void)msv_enumerateKeysAndObjectsOrderedByKeyDescriptors:()MSVAdditions usingBlock:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 allKeys];
  id v9 = [v8 sortedArrayUsingDescriptors:v7];

  -[NSDictionary _msv_enumerateKeysAndObjectsWithSortedKeys:usingBlock:](a1, v9, v6);
}

- (id)msv_compactDescription
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __52__NSDictionary_MSVAdditions__msv_compactDescription__block_invoke;
  v11 = &unk_1E5ADA798;
  id v12 = v2;
  id v3 = v2;
  [a1 enumerateKeysAndObjectsUsingBlock:&v8];
  v4 = NSString;
  v5 = objc_msgSend(v3, "msv_compactDescription");
  id v6 = [v4 stringWithFormat:@"{ %@ }", v5, v8, v9, v10, v11];

  return v6;
}

+ (id)msv_dictionaryWithContentsOfJSON:()MSVAdditions error:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v11];
  id v6 = v11;
  if (v5 && (_NSIsNSDictionary() & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"Unexpected non-dictionary object in JSON payload";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v9 = [v7 errorWithDomain:@"MediaServices" code:400 userInfo:v8];

    id v6 = (id)v9;
  }
  if (a4 && v6) {
    *a4 = v6;
  }

  return v5;
}

+ (id)msv_dictionaryWithContentsOfBase64EncodedJSONString:()MSVAdditions error:
{
  id v6 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithBase64EncodedString:v7 options:0];

  uint64_t v9 = objc_msgSend(a1, "msv_dictionaryWithContentsOfJSON:error:", v8, a4);

  return v9;
}

@end