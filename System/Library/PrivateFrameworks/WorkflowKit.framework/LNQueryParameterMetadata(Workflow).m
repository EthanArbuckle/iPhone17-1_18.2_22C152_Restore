@interface LNQueryParameterMetadata(Workflow)
- (id)wf_propertyQueryWithValue:()Workflow contentOperator:parameterIndex:;
- (id)wf_supportedContentOperators;
@end

@implementation LNQueryParameterMetadata(Workflow)

- (id)wf_propertyQueryWithValue:()Workflow contentOperator:parameterIndex:
{
  id v7 = a5;
  id v8 = a3;
  v9 = WFContentOperatorToLNComparisonPropertyMapping();
  v10 = [NSNumber numberWithInteger:a4];
  v11 = [v9 objectForKey:v10];

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F72B78]), "initWithPropertyIndex:value:type:", v7, v8, objc_msgSend(v11, "unsignedIntegerValue"));
  return v12;
}

- (id)wf_supportedContentOperators
{
  v2 = WFContentOperatorToLNComparisonPropertyMapping();
  v3 = [a1 comparators];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__LNQueryParameterMetadata_Workflow__wf_supportedContentOperators__block_invoke;
  v7[3] = &unk_1E6554558;
  id v8 = v2;
  id v4 = v2;
  v5 = objc_msgSend(v3, "if_compactMap:", v7);

  return v5;
}

@end