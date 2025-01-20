@interface VITextLookupQuery
- (NSString)hintDomain;
- (NSString)queryTerm;
- (VIAnnotation)annotation;
- (VIImageContent)imageContext;
- (VIQueryContext)queryContext;
- (VITextContext)textContext;
- (VITextLookupQuery)initWithQueryTerm:(id)a3 domain:(id)a4 textContext:(id)a5 imageContext:(id)a6 annotation:(id)a7 queryContext:(id)a8;
- (VITextLookupQuery)initWithQueryTerm:(id)a3 hintDomain:(id)a4 textContext:(id)a5 imageContext:(id)a6 annotation:(id)a7 queryContext:(id)a8;
@end

@implementation VITextLookupQuery

- (VITextLookupQuery)initWithQueryTerm:(id)a3 domain:(id)a4 textContext:(id)a5 imageContext:(id)a6 annotation:(id)a7 queryContext:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [VITextContext alloc];
  v21 = [(VITextContext *)v20 initWithSurroundingText:v17 normalizedBoundingBoxes:MEMORY[0x1E4F1CBF0]];

  v22 = [(VITextLookupQuery *)self initWithQueryTerm:v19 hintDomain:v18 textContext:v21 imageContext:v16 annotation:v15 queryContext:v14];
  return v22;
}

- (VITextLookupQuery)initWithQueryTerm:(id)a3 hintDomain:(id)a4 textContext:(id)a5 imageContext:(id)a6 annotation:(id)a7 queryContext:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)VITextLookupQuery;
  v20 = [(VITextLookupQuery *)&v28 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    queryTerm = v20->_queryTerm;
    v20->_queryTerm = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    textContext = v20->_textContext;
    v20->_textContext = (VITextContext *)v23;

    uint64_t v25 = [v15 copy];
    hintDomain = v20->_hintDomain;
    v20->_hintDomain = (NSString *)v25;

    objc_storeStrong((id *)&v20->_imageContext, a6);
    objc_storeStrong((id *)&v20->_annotation, a7);
    objc_storeStrong((id *)&v20->_queryContext, a8);
  }

  return v20;
}

- (NSString)queryTerm
{
  return self->_queryTerm;
}

- (VITextContext)textContext
{
  return self->_textContext;
}

- (NSString)hintDomain
{
  return self->_hintDomain;
}

- (VIImageContent)imageContext
{
  return self->_imageContext;
}

- (VIAnnotation)annotation
{
  return self->_annotation;
}

- (VIQueryContext)queryContext
{
  return self->_queryContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_imageContext, 0);
  objc_storeStrong((id *)&self->_hintDomain, 0);
  objc_storeStrong((id *)&self->_textContext, 0);
  objc_storeStrong((id *)&self->_queryTerm, 0);
}

@end