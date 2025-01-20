@interface STSSearchResultSection
- (NSArray)results;
- (NSString)title;
- (STSSearchResultSection)initWithResultsArray:(id)a3;
- (id)logResults;
- (void)setResults:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation STSSearchResultSection

- (STSSearchResultSection)initWithResultsArray:(id)a3
{
  v4 = (NSArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STSSearchResultSection;
  v5 = [(STSSearchResultSection *)&v8 init];
  results = v5->_results;
  v5->_results = v4;

  return v5;
}

- (id)logResults
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = [(STSSearchResultSection *)self results];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__STSSearchResultSection_logResults__block_invoke;
  v8[3] = &unk_264A05770;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v8];

  v6 = (void *)[v5 copy];

  return v6;
}

void __36__STSSearchResultSection_logResults__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 resultType];
  [v2 appendFormat:@"%@, resultType: %@\n", v3, v4];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end