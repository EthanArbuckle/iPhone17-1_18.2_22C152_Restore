@interface _LTDisambiguationLinkConfiguration(Daemon)
+ (id)_linkConfigurationWithSourceRange:()Daemon targetRange:unvalidatedAdjacencyList:expectedNumberOfEdges:;
+ (id)linkConfigurationWithEMTSelectionSpan:()Daemon sourceText:targetText:;
+ (id)linkConfigurationWithFTSelectionSpan:()Daemon descriptions:sourceText:targetText:;
@end

@implementation _LTDisambiguationLinkConfiguration(Daemon)

+ (id)_linkConfigurationWithSourceRange:()Daemon targetRange:unvalidatedAdjacencyList:expectedNumberOfEdges:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v13 = a7;
  if ([v13 count] == a8)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1C0B8]), "initWithSourceRange:targetRange:unvalidatedAdjacencyList:", a3, a4, a5, a6, v13);
  }
  else
  {
    v15 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      int v18 = 134218240;
      uint64_t v19 = [v13 count];
      __int16 v20 = 2048;
      uint64_t v21 = a8;
      _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Only %zu out of %zu edges were valid, won't create a link for this selectionSpan", (uint8_t *)&v18, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)linkConfigurationWithEMTSelectionSpan:()Daemon sourceText:targetText:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v8 alternatives];
    v12 = (void *)v11;
    id v13 = (void *)MEMORY[0x263EFFA68];
    if (v11) {
      id v13 = (void *)v11;
    }
    id v14 = v13;

    v15 = [v14 _ltCompactMap:&__block_literal_global_7];
    uint64_t v16 = [v8 source];
    uint64_t v18 = objc_msgSend(v9, "lt_codeUnitsRangeFromCodePointsRange:", v16, v17);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      __int16 v20 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[_LTDisambiguationLinkConfiguration(Daemon) linkConfigurationWithEMTSelectionSpan:sourceText:targetText:](v20, v8);
      }
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v22 = v18;
      uint64_t v23 = v19;
      v34 = v15;
      uint64_t v24 = [v8 projection];
      uint64_t v26 = objc_msgSend(v10, "lt_codeUnitsRangeFromCodePointsRange:", v24, v25);
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = _LTOSLogDisambiguation();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          +[_LTDisambiguationLinkConfiguration(Daemon) linkConfigurationWithEMTSelectionSpan:sourceText:targetText:](v28, v8);
        }
        uint64_t v21 = 0;
      }
      else
      {
        uint64_t v29 = v26;
        uint64_t v30 = v27;
        uint64_t v31 = [v14 count];
        uint64_t v32 = v29;
        v15 = v34;
        uint64_t v21 = objc_msgSend(a1, "_linkConfigurationWithSourceRange:targetRange:unvalidatedAdjacencyList:expectedNumberOfEdges:", v22, v23, v32, v30, v34, v31);
      }
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

+ (id)linkConfigurationWithFTSelectionSpan:()Daemon descriptions:sourceText:targetText:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 alternatives];
  v15 = (void *)v14;
  uint64_t v16 = (void *)MEMORY[0x263EFFA68];
  if (v14) {
    uint64_t v16 = (void *)v14;
  }
  id v17 = v16;

  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __118___LTDisambiguationLinkConfiguration_Daemon__linkConfigurationWithFTSelectionSpan_descriptions_sourceText_targetText___block_invoke;
  v48[3] = &unk_2655467C0;
  id v49 = v11;
  id v18 = v11;
  uint64_t v19 = [v17 _ltCompactMap:v48];
  __int16 v20 = objc_msgSend(v10, "source_range");
  uint64_t v21 = v20;
  if (v20)
  {
    v44 = a1;
    v46 = v13;
    NSUInteger v22 = (int)[v20 start];
    uint64_t v23 = (void *)(int)[v21 length];
    uint64_t v24 = objc_msgSend(v12, "lt_codeUnitsRangeFromCodePointsRange:", v22, v23);
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v45 = v17;
      uint64_t v26 = v19;
      id v27 = v18;
      v28 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        +[_LTDisambiguationLinkConfiguration(Daemon) linkConfigurationWithFTSelectionSpan:descriptions:sourceText:targetText:](v28, v22, v23);
      }
      uint64_t v29 = 0;
      id v18 = v27;
      uint64_t v19 = v26;
      id v17 = v45;
      goto LABEL_22;
    }
    uint64_t v31 = v24;
    uint64_t v32 = v25;
    v33 = objc_msgSend(v10, "projection_ranges");
    v34 = [v33 firstObject];

    if (!v34)
    {
      v40 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v40, OS_LOG_TYPE_INFO, "Can't get target range on selectionSpan; won't create link",
          buf,
          2u);
      }
      uint64_t v29 = 0;
      id v13 = v46;
      goto LABEL_21;
    }
    id v43 = v18;
    NSUInteger v35 = (int)[v34 start];
    v36 = (void *)(int)[v34 length];
    NSUInteger v42 = v35;
    uint64_t v37 = objc_msgSend(v46, "lt_codeUnitsRangeFromCodePointsRange:", v35, v36);
    if (v37 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        id v13 = v46;
        +[_LTDisambiguationLinkConfiguration(Daemon) linkConfigurationWithFTSelectionSpan:descriptions:sourceText:targetText:](v39, v42, v36);
        uint64_t v29 = 0;
        goto LABEL_20;
      }
      uint64_t v29 = 0;
    }
    else
    {
      uint64_t v29 = objc_msgSend(v44, "_linkConfigurationWithSourceRange:targetRange:unvalidatedAdjacencyList:expectedNumberOfEdges:", v31, v32, v37, v38, v19, objc_msgSend(v17, "count"));
    }
    id v13 = v46;
LABEL_20:
    id v18 = v43;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v30 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v30, OS_LOG_TYPE_INFO, "No source range set on selectionSpan; won't create link",
      buf,
      2u);
  }
  uint64_t v29 = 0;
LABEL_22:

  return v29;
}

+ (void)linkConfigurationWithEMTSelectionSpan:()Daemon sourceText:targetText:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  v11.location = [a2 source];
  NSStringFromRange(v11);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_2600DC000, v4, v5, "Code points source range: %{public}@ cannot be converted to NSString code units source range, source text length: %zu", v6, v7, v8, v9, v10);
}

+ (void)linkConfigurationWithEMTSelectionSpan:()Daemon sourceText:targetText:.cold.2(void *a1, void *a2)
{
  id v3 = a1;
  v11.location = [a2 projection];
  NSStringFromRange(v11);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_2(&dword_2600DC000, v4, v5, "Code points target range: %{public}@ cannot be converted to NSString code units target range, target text length: %zu", v6, v7, v8, v9, v10);
}

+ (void)linkConfigurationWithFTSelectionSpan:()Daemon descriptions:sourceText:targetText:.cold.1(void *a1, NSUInteger a2, void *a3)
{
  id v5 = a1;
  v13.location = a2;
  v13.length = (NSUInteger)a3;
  NSStringFromRange(v13);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2(&dword_2600DC000, v6, v7, "Code points source range: %{public}@ cannot be converted to NSString code units source range, source text length: %zu", v8, v9, v10, v11, v12);
}

+ (void)linkConfigurationWithFTSelectionSpan:()Daemon descriptions:sourceText:targetText:.cold.2(void *a1, NSUInteger a2, void *a3)
{
  id v5 = a1;
  v13.location = a2;
  v13.length = (NSUInteger)a3;
  NSStringFromRange(v13);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2(&dword_2600DC000, v6, v7, "Code points target range: %{public}@ cannot be converted to NSString code units target range, target text length: %zu", v8, v9, v10, v11, v12);
}

@end