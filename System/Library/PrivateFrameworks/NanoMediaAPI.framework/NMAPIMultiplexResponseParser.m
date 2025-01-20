@interface NMAPIMultiplexResponseParser
- (id)resultsWithDictionary:(id)a3 error:(id *)a4;
@end

@implementation NMAPIMultiplexResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = [v6 valueForKeyPath:@"results.target"];

  v9 = NMAPIDictionaryWithObject(v8, @"target", a4);

  if (v9)
  {
    v10 = [v9 objectForKey:@"type"];
    v11 = NMAPIStringWithObject(v10, @"type", a4);

    if (v11)
    {
      v12 = [NMAPISectionResult alloc];
      v17[0] = v9;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      v14 = [(NMAPISectionResult *)v12 initWithSectionIdentifier:v11 sectionDictionary:v9 itemsArray:v13];
      [v7 addObject:v14];

      v15 = (void *)[v7 copy];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end