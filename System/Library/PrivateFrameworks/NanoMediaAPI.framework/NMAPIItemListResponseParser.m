@interface NMAPIItemListResponseParser
- (id)resultsWithDictionary:(id)a3 error:(id *)a4;
@end

@implementation NMAPIItemListResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = [v6 objectForKey:@"data"];

  v9 = NMAPIArrayWithObject(v8, @"data", a4);

  if (v9)
  {
    v10 = [NMAPISectionResult alloc];
    v11 = [(NMAPISectionResult *)v10 initWithSectionIdentifier:@"Empty Section" sectionDictionary:MEMORY[0x263EFFA78] itemsArray:v9];
    [v7 addObject:v11];

    v12 = (void *)[v7 copy];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end