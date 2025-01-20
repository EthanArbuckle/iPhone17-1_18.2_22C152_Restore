@interface _CNVCardParsingConcurrentStrategy
- (id)parseData:(id)a3 options:(id)a4 resultFactory:(id)a5;
- (id)seriallyParsedData:(id)a3 options:(id)a4 resultFactory:(id)a5;
@end

@implementation _CNVCardParsingConcurrentStrategy

- (id)parseData:(id)a3 options:(id)a4 resultFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[CNVCardRangeFinder allRangesInData:v8];
  v12 = [v11 left];

  v13 = objc_msgSend(v12, "_cn_balancedSlicesWithMaximumCount:", 128);
  v14 = objc_msgSend(v13, "_cn_map:", &__block_literal_global_13);

  if ((unint64_t)[v14 count] <= 1)
  {
    v16 = [(_CNVCardParsingConcurrentStrategy *)self seriallyParsedData:v8 options:v9 resultFactory:v10];
  }
  else
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __69___CNVCardParsingConcurrentStrategy_parseData_options_resultFactory___block_invoke;
    v21 = &unk_1E6C2D328;
    id v22 = v8;
    v23 = self;
    id v24 = v9;
    id v25 = v10;
    v15 = objc_msgSend(v14, "_cn_concurrentMap:", &v18);
    v16 = objc_msgSend(v15, "_cn_flatten", v18, v19, v20, v21);
  }
  return v16;
}

- (id)seriallyParsedData:(id)a3 options:(id)a4 resultFactory:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(_CNVCardParsingSerialStrategy);
  v11 = [(_CNVCardParsingSerialStrategy *)v10 parseData:v9 options:v8 resultFactory:v7];

  return v11;
}

@end