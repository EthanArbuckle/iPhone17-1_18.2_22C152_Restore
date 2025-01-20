@interface REScriptASTFeatureBuilder
- (BOOL)_loadIndexFromNode:(id)a3 index:(unint64_t *)a4 error:(id *)a5;
- (id)_buildTransformedFeature:(id)a3 features:(id)a4 node:(id)a5 error:(id *)a6;
- (id)buildObjectWithBinaryExpressionNode:(id)a3 previousExpression:(id)a4 error:(id *)a5;
- (id)buildObjectWithFunctionNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithIdentifierNode:(id)a3 error:(id *)a4;
- (id)buildObjectWithSubscriptExpressionNode:(id)a3 error:(id *)a4;
- (id)objectTypeErrorDescription;
@end

@implementation REScriptASTFeatureBuilder

- (id)objectTypeErrorDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)buildObjectWithIdentifierNode:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(REScriptASTObjectBuilder *)self table];
  v8 = [v6 name];
  uint64_t v17 = 0;
  if (![v7 typeForDefinition:v8 type:&v17] || v17)
  {
    if (!a4) {
      goto LABEL_13;
    }
    id v9 = [NSString stringWithFormat:@"Undefined feature %@", v8];
    v18 = @"REErrorTokenKey";
    v10 = [v6 token];
    v19 = v10;
    v11 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    RECreateErrorWithCodeMessageAndUseInfo(210, v9, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
  else
  {
    id v9 = [v7 objectValueForDefinition:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v9;
      a4 = (id *)v9;
    }
    else
    {
      v12 = [v7 nodeValueForDefinition:v8];
      if (v12)
      {
        a4 = [(REScriptASTObjectBuilder *)self buildObjectWithNode:v12 error:a4];
      }
      else if (a4)
      {
        v13 = [NSString stringWithFormat:@"Feature %@ doesn't have a definition", v8];
        v20 = @"REErrorTokenKey";
        v14 = [v6 token];
        v21[0] = v14;
        v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
        RECreateErrorWithCodeMessageAndUseInfo(210, v13, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        a4 = 0;
      }
    }
  }

LABEL_13:
  return a4;
}

- (id)buildObjectWithBinaryExpressionNode:(id)a3 previousExpression:(id)a4 error:(id *)a5
{
  v22[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 binaryOperator];
  uint64_t v11 = [v10 type];

  if (v11 != 28)
  {
    if (!a5) {
      goto LABEL_8;
    }
    v15 = NSString;
    v16 = [v8 binaryOperator];
    uint64_t v17 = REDescriptionForTokenType([v16 type]);
    v13 = [v15 stringWithFormat:@"Unsupported binary operator %@ for constructing feature", v17];

    v20 = @"REErrorTokenKey";
    v14 = [v8 binaryOperator];
    v21 = v14;
    v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    RECreateErrorWithCodeMessageAndUseInfo(209, v13, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
    goto LABEL_6;
  }
  v12 = [v8 expression];
  v13 = [(REScriptASTObjectBuilder *)self buildObjectWithNode:v12 error:a5];

  if (v13)
  {
    v22[0] = v9;
    v22[1] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    a5 = +[REFeature crossedFeatureWithFeatures:v14];
LABEL_6:

    goto LABEL_8;
  }
  a5 = 0;
LABEL_8:

  return a5;
}

- (id)buildObjectWithFunctionNode:(id)a3 error:(id *)a4
{
  v43[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(REScriptASTObjectBuilder *)self table];
  id v8 = [v6 functionIdentifier];
  id v9 = [v8 value];

  uint64_t v39 = 0;
  int v10 = [v7 typeForDefinition:v9 type:&v39];
  if (v39 == 4) {
    int v11 = v10;
  }
  else {
    int v11 = 0;
  }
  if (v11 == 1)
  {
    if ((objc_msgSend((id)objc_msgSend(v7, "objectValueForDefinition:", v9), "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      if (!a4) {
        goto LABEL_19;
      }
      v12 = [NSString stringWithFormat:@"Function %@ doesn't have a definition", v9];
      v42 = @"REErrorTokenKey";
      id v19 = [v6 functionIdentifier];
      v43[0] = v19;
      v21 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
      RECreateErrorWithCodeMessageAndUseInfo(210, v12, v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    v12 = objc_opt_new();
    if (v12)
    {
      v13 = (void *)MEMORY[0x263EFF980];
      v14 = [v6 arguments];
      v15 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      char v38 = 1;
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__14;
      v33 = __Block_byref_object_dispose__14;
      id v34 = 0;
      v16 = objc_alloc_init(RETransformerInvocation);
      uint64_t v17 = [v6 arguments];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __63__REScriptASTFeatureBuilder_buildObjectWithFunctionNode_error___block_invoke;
      v23[3] = &unk_2644BEDC8;
      v18 = v16;
      v24 = v18;
      v25 = self;
      v27 = &v29;
      v28 = &v35;
      id v19 = v15;
      id v26 = v19;
      [v17 enumerateObjectsUsingBlock:v23];

      [v12 configureWithInvocation:v18];
      if (a4) {
        *a4 = (id) v30[5];
      }
      if (*((unsigned char *)v36 + 24))
      {
        a4 = [(REScriptASTFeatureBuilder *)self _buildTransformedFeature:v12 features:v19 node:v6 error:a4];
      }
      else
      {
        a4 = 0;
      }

      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v35, 8);
      goto LABEL_18;
    }
  }
  if (!a4) {
    goto LABEL_19;
  }
  v12 = [NSString stringWithFormat:@"Undefined function %@", v9];
  v40 = @"REErrorTokenKey";
  id v19 = [v6 token];
  id v41 = v19;
  v20 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  RECreateErrorWithCodeMessageAndUseInfo(210, v12, v20);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
  a4 = 0;
LABEL_18:

LABEL_19:
  return a4;
}

void __63__REScriptASTFeatureBuilder_buildObjectWithFunctionNode_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [v7 token];

    id v8 = 0;
    switch([v16 type])
    {
      case 3:
        id v9 = [v16 value];
        uint64_t v10 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v9 longLongValue]);
        goto LABEL_9;
      case 4:
        id v9 = [v16 value];
        [v9 doubleValue];
        uint64_t v10 = +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
LABEL_9:
        id v8 = (void *)v10;
        goto LABEL_11;
      case 5:
        id v9 = [v16 value];
        id v8 = +[REFeatureValue featureValueWithString:v9];

LABEL_11:
        break;
      case 9:
        uint64_t v14 = 1;
        goto LABEL_14;
      case 10:
        uint64_t v14 = 0;
LABEL_14:
        id v8 = +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", v14, v16);
        break;
      default:
        break;
    }
    v15 = (const void *)RECreateFeatureValueTaggedPointer(v8);
    [*(id *)(a1 + 32) setArgument:v15 atIndex:a3];
    REReleaseFeatureValueTaggedPointer(v15);
  }
  else
  {
    int v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v12 + 40);
    v13 = [v11 buildObjectWithNode:v7 error:&obj];

    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      [*(id *)(a1 + 48) addObject:v13];
    }
    else
    {
      *a4 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
}

- (id)buildObjectWithSubscriptExpressionNode:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 expression];
  id v8 = [(REScriptASTObjectBuilder *)self buildObjectWithNode:v7 error:a4];

  if (!v8)
  {
LABEL_8:
    a4 = 0;
    goto LABEL_18;
  }
  uint64_t v9 = [v8 _bitCount];
  if (v9 <= 0)
  {
    if (!a4) {
      goto LABEL_18;
    }
    uint64_t v12 = NSString;
    v13 = [v8 name];
    uint64_t v14 = [v12 stringWithFormat:@"Unable to slice feature %@", v13];

    v25 = @"REErrorTokenKey";
    v15 = [v6 token];
    v26[0] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    RECreateErrorWithCodeMessageAndUseInfo(211, v14, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  uint64_t v10 = v9;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  int v11 = [v6 startIndex];
  if (!v11)
  {
    uint64_t v23 = 0;
LABEL_10:
    uint64_t v17 = [v6 endIndex];
    if (v17)
    {
      if (![(REScriptASTFeatureBuilder *)self _loadIndexFromNode:v17 index:&v22 error:a4])
      {
        a4 = 0;
        goto LABEL_16;
      }
      uint64_t v18 = v22;
    }
    else
    {
      uint64_t v18 = v10 - 1;
      uint64_t v22 = v10 - 1;
    }
    id v19 = +[REFeatureTransformer maskAndShiftTransformWithStartIndex:v23 endIndex:v18];
    v24 = v8;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    a4 = [(REScriptASTFeatureBuilder *)self _buildTransformedFeature:v19 features:v20 node:v6 error:a4];

LABEL_16:
    goto LABEL_17;
  }
  if ([(REScriptASTFeatureBuilder *)self _loadIndexFromNode:v11 index:&v23 error:a4])
  {
    goto LABEL_10;
  }
  a4 = 0;
LABEL_17:

LABEL_18:
  return a4;
}

- (id)_buildTransformedFeature:(id)a3 features:(id)a4 node:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[REFeature transformedFeatureWithTransformer:v8 features:v9];

  return v11;
}

- (BOOL)_loadIndexFromNode:(id)a3 index:(unint64_t *)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [v8 token];
    uint64_t v10 = [v9 type];

    if (v10 == 3)
    {
      if (a4)
      {
        int v11 = [v8 token];
        uint64_t v12 = [v11 value];
        *a4 = [v12 integerValue];
      }
      LOBYTE(a5) = 1;
      goto LABEL_11;
    }
    if (!a5)
    {
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v18 = @"REErrorTokenKey";
    v13 = [v8 token];
    v19[0] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    RECreateErrorWithCodeMessageAndUseInfo(204, @"Unexpected literal. Expecting integer", v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  if (a5)
  {
    id v16 = @"REErrorTokenKey";
    id v8 = [v7 token];
    id v17 = v8;
    v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    RECreateErrorWithCodeMessageAndUseInfo(204, @"Unexpected token. Expecting index", v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_12:

  return (char)a5;
}

@end