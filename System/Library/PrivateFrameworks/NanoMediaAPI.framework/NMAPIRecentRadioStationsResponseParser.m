@interface NMAPIRecentRadioStationsResponseParser
- (id)resultsWithDictionary:(id)a3 error:(id *)a4;
@end

@implementation NMAPIRecentRadioStationsResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = [v6 objectForKey:@"data"];

  v9 = NMAPIArrayWithObject(v8, @"data", a4);

  if (v9)
  {
    v10 = [[NMAPISectionResult alloc] initWithSectionIdentifier:@"Recently Played" sectionDictionary:&unk_26DA89798 itemsArray:v9];
    [v7 addObject:v10];

    v11 = (void *)[v7 copy];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end