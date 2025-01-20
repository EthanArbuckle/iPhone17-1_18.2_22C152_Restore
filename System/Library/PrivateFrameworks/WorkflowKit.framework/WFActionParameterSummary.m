@interface WFActionParameterSummary
- (NSArray)possibleValues;
- (NSString)singleFormatLocalizedString;
- (WFActionParameterSummary)initWithLocalizedString:(id)a3;
- (WFActionParameterSummary)initWithString:(id)a3;
- (WFActionParameterSummary)initWithString:(id)a3 title:(id)a4;
- (WFActionParameterSummary)initWithValues:(id)a3;
- (WFActionParameterSummary)initWithValues:(id)a3 title:(id)a4;
- (_NSLocalizedStringResource)singleFormatString;
- (_NSLocalizedStringResource)title;
- (id)localizedFormatStringWithAction:(id)a3;
- (id)localizedTitle;
@end

@implementation WFActionParameterSummary

- (WFActionParameterSummary)initWithLocalizedString:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFActionParameterSummary.m", 46, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFActionParameterSummary;
  v7 = [(WFActionParameterSummary *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_singleFormatLocalizedString, a3);
    v9 = v8;
  }

  return v8;
}

- (WFActionParameterSummary)initWithString:(id)a3 title:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFActionParameterSummary.m", 61, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFActionParameterSummary;
  v10 = [(WFActionParameterSummary *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_singleFormatString, a3);
    objc_storeStrong((id *)&v11->_title, a4);
    objc_super v12 = v11;
  }

  return v11;
}

- (WFActionParameterSummary)initWithString:(id)a3
{
  return [(WFActionParameterSummary *)self initWithString:a3 title:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_singleFormatLocalizedString, 0);
  objc_storeStrong((id *)&self->_singleFormatString, 0);
  objc_storeStrong((id *)&self->_possibleValues, 0);
}

- (_NSLocalizedStringResource)title
{
  return self->_title;
}

- (NSString)singleFormatLocalizedString
{
  return self->_singleFormatLocalizedString;
}

- (_NSLocalizedStringResource)singleFormatString
{
  return self->_singleFormatString;
}

- (NSArray)possibleValues
{
  return self->_possibleValues;
}

- (id)localizedTitle
{
  v2 = [(WFActionParameterSummary *)self title];
  v3 = [v2 localize];

  return v3;
}

- (id)localizedFormatStringWithAction:(id)a3
{
  id v4 = a3;
  v5 = [(WFActionParameterSummary *)self singleFormatString];

  if (v5)
  {
    id v6 = [(WFActionParameterSummary *)self singleFormatString];
    v7 = [v6 localize];
LABEL_3:

    goto LABEL_6;
  }
  id v8 = [(WFActionParameterSummary *)self singleFormatLocalizedString];

  if (!v8)
  {
    id v6 = [v4 visibleParametersForParameterSummary];
    v10 = [v4 parameterKeysIgnoredForParameterSummary];
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke;
    v25[3] = &unk_1E65539A8;
    id v26 = v10;
    id v12 = v10;
    v13 = objc_msgSend(v6, "if_compactMap:", v25);
    v14 = (void *)[v11 initWithArray:v13];

    objc_super v15 = [(WFActionParameterSummary *)self possibleValues];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke_2;
    v22[3] = &unk_1E65539D0;
    id v23 = v14;
    id v24 = v4;
    id v16 = v14;
    v17 = objc_msgSend(v15, "if_map:", v22);

    v18 = [v17 sortedArrayUsingComparator:&__block_literal_global_43078];

    v19 = [v18 lastObject];
    v20 = v19;
    if (v19)
    {
      v21 = [v19 value];
      v7 = [v21 localizedString];
    }
    else
    {
      v7 = 0;
    }

    goto LABEL_3;
  }
  v7 = [(WFActionParameterSummary *)self singleFormatLocalizedString];
LABEL_6:

  return v7;
}

id __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 key];
  if ([v4 containsObject:v5] & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v3 key];
  }

  return v6;
}

uint64_t __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 matchVisibleParameterKeys:*(void *)(a1 + 32) checkingRequiredValuesInAction:*(void *)(a1 + 40)];
}

uint64_t __60__WFActionParameterSummary_localizedFormatStringWithAction___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (![v4 matchType]) {
    goto LABEL_4;
  }
  if (![v5 matchType]) {
    goto LABEL_6;
  }
  unint64_t v6 = [v4 numberOfMatchingParameters];
  if (v6 < [v5 numberOfMatchingParameters])
  {
LABEL_4:
    uint64_t v7 = -1;
    goto LABEL_11;
  }
  unint64_t v8 = [v4 numberOfMatchingParameters];
  if (v8 > [v5 numberOfMatchingParameters])
  {
LABEL_6:
    uint64_t v7 = 1;
    goto LABEL_11;
  }
  id v9 = [v4 value];
  v10 = [v9 requiredValues];
  unint64_t v11 = [v10 count];
  id v12 = [v5 value];
  v13 = [v12 requiredValues];
  if (v11 < [v13 count]) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }

LABEL_11:
  return v7;
}

- (WFActionParameterSummary)initWithValues:(id)a3 title:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFActionParameterSummary.m", 73, @"Invalid parameter not satisfying: %@", @"values" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFActionParameterSummary;
  v10 = [(WFActionParameterSummary *)&v15 init];
  unint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_possibleValues, a3);
    objc_storeStrong((id *)&v11->_title, a4);
    id v12 = v11;
  }

  return v11;
}

- (WFActionParameterSummary)initWithValues:(id)a3
{
  return [(WFActionParameterSummary *)self initWithValues:a3 title:0];
}

@end