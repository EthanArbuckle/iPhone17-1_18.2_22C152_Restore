@interface CDMCATIBloomFilterUtils
+ (id)getCATIBloomFiltersFromFileURL:(id)a3 error:(id *)a4;
@end

@implementation CDMCATIBloomFilterUtils

+ (id)getCATIBloomFiltersFromFileURL:(id)a3 error:(id *)a4
{
  id v10 = 0;
  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:1 error:&v10];
  id v6 = v10;
  v7 = v6;
  if (v5)
  {
    v8 = [[FLTCDMCATIBloomFilters alloc] initWithFlatbuffData:v5];
  }
  else
  {
    v8 = 0;
    if (a4) {
      *a4 = v6;
    }
  }

  return v8;
}

@end