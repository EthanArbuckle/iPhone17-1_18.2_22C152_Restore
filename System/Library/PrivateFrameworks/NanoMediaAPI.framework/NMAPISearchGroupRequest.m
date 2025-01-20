@interface NMAPISearchGroupRequest
- (Class)responseParserClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4;
- (unint64_t)resultsPerSection;
- (void)setResultsPerSection:(unint64_t)a3;
@end

@implementation NMAPISearchGroupRequest

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)NMAPISearchGroupRequest;
  v5 = [(NMAPIURLRequest *)&v23 urlComponentsWithStoreURLBag:a3 error:a4];
  v6 = v5;
  if (self->_resultsPerSection)
  {
    v7 = [v5 queryItems];
    v8 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_0];
    v9 = [v7 filteredArrayUsingPredicate:v8];
    [v6 setQueryItems:v9];

    v10 = (void *)MEMORY[0x263F08BD0];
    v11 = [NSNumber numberWithUnsignedInteger:self->_resultsPerSection];
    v12 = [v11 stringValue];
    v13 = [v10 queryItemWithName:@"limit" value:v12];

    v14 = [v6 queryItems];
    v15 = [v14 arrayByAddingObject:v13];
    [v6 setQueryItems:v15];
  }
  v16 = [v6 queryItems];
  v17 = (void *)MEMORY[0x263F08BD0];
  v18 = [&unk_26DA89750 componentsJoinedByString:@","];
  v19 = [v17 queryItemWithName:@"with" value:v18];
  v24[0] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  v21 = [v16 arrayByAddingObjectsFromArray:v20];
  [v6 setQueryItems:v21];

  return v6;
}

uint64_t __62__NMAPISearchGroupRequest_urlComponentsWithStoreURLBag_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"limit"] ^ 1;

  return v3;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NMAPISearchGroupRequest;
  id result = [(NMAPIURLRequest *)&v5 copyWithZone:a3];
  if (result) {
    *((void *)result + 17) = self->_resultsPerSection;
  }
  return result;
}

- (unint64_t)resultsPerSection
{
  return self->_resultsPerSection;
}

- (void)setResultsPerSection:(unint64_t)a3
{
  self->_resultsPerSection = a3;
}

@end