@interface WFActionParameterSummaryValue
+ (id)parenthesisRegularExpression;
- (NSArray)requiredVisibleParameterKeys;
- (NSDictionary)requiredValues;
- (NSString)key;
- (NSString)localizedString;
- (NSString)localizedSummaryString;
- (WFActionParameterSummaryValue)initWithKey:(id)a3 localizedSummaryString:(id)a4;
- (WFActionParameterSummaryValue)initWithKey:(id)a3 summaryString:(id)a4;
- (_NSLocalizedStringResource)summaryString;
- (id)matchVisibleParameterKeys:(id)a3 checkingRequiredValuesInAction:(id)a4;
@end

@implementation WFActionParameterSummaryValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSummaryString, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_requiredValues, 0);
  objc_storeStrong((id *)&self->_requiredVisibleParameterKeys, 0);
}

- (NSString)localizedSummaryString
{
  return self->_localizedSummaryString;
}

- (_NSLocalizedStringResource)summaryString
{
  return self->_summaryString;
}

- (NSString)key
{
  return self->_key;
}

- (NSDictionary)requiredValues
{
  return self->_requiredValues;
}

- (NSArray)requiredVisibleParameterKeys
{
  return self->_requiredVisibleParameterKeys;
}

- (id)matchVisibleParameterKeys:(id)a3 checkingRequiredValuesInAction:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v9 = [(WFActionParameterSummaryValue *)self requiredVisibleParameterKeys];
  v10 = (void *)[v8 initWithArray:v9];

  if ([v10 isSubsetOfSet:v6])
  {
    v31 = v10;
    v32 = v6;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [(WFActionParameterSummaryValue *)self requiredValues];
    uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v37;
      id v33 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v16 = [(WFActionParameterSummaryValue *)self requiredValues];
          v17 = [v16 objectForKey:v15];

          v18 = [v7 parameterStateForKey:v15];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = v18;
            v35 = v17;
            v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v17, "BOOLValue"));
            v21 = [v19 number];
            int v22 = [v21 isEqualToNumber:v20];

            if (!v22)
            {
              v29 = +[WFActionParameterSummaryValueMatchResult noMatchWithValue:self];

              id v6 = v32;
              id v7 = v33;
              v10 = v31;
              v17 = v35;
              goto LABEL_23;
            }

            id v7 = v33;
            v23 = v35;
          }
          else
          {
            if (!v18) {
              goto LABEL_22;
            }
            v24 = [v18 serializedRepresentation];
            v23 = v17;
            char v25 = [v24 isEqual:v17];

            if ((v25 & 1) == 0)
            {
              v17 = v23;
LABEL_22:
              v29 = +[WFActionParameterSummaryValueMatchResult noMatchWithValue:self];
              id v19 = v18;
              v10 = v31;
              id v6 = v32;
LABEL_23:

              goto LABEL_24;
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v10 = v31;
    uint64_t v26 = [v31 count];
    id v6 = v32;
    if (v26 == [v32 count]) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = 1;
    }
    v28 = -[WFActionParameterSummaryValueMatchResult initWithValue:matchType:numberOfMatchingParameters:]([WFActionParameterSummaryValueMatchResult alloc], "initWithValue:matchType:numberOfMatchingParameters:", self, v27, [v31 count]);
  }
  else
  {
    v28 = +[WFActionParameterSummaryValueMatchResult noMatchWithValue:self];
  }
  v29 = v28;
LABEL_24:

  return v29;
}

- (NSString)localizedString
{
  summaryString = self->_summaryString;
  if (summaryString)
  {
    v4 = [(_NSLocalizedStringResource *)summaryString localize];
  }
  else
  {
    localizedSummaryString = self->_localizedSummaryString;
    if (localizedSummaryString) {
      v4 = localizedSummaryString;
    }
    else {
      v4 = &stru_1F229A4D8;
    }
  }
  return (NSString *)v4;
}

- (WFActionParameterSummaryValue)initWithKey:(id)a3 localizedSummaryString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFActionParameterSummaryValue;
  id v8 = [(WFActionParameterSummaryValue *)&v14 init];
  v9 = v8;
  if (v8)
  {
    WFActionParameterSummaryValueCommonInit(v8, v6);
    uint64_t v10 = [v7 copy];
    localizedSummaryString = v9->_localizedSummaryString;
    v9->_localizedSummaryString = (NSString *)v10;

    uint64_t v12 = v9;
  }

  return v9;
}

- (WFActionParameterSummaryValue)initWithKey:(id)a3 summaryString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFActionParameterSummaryValue;
  id v8 = [(WFActionParameterSummaryValue *)&v14 init];
  v9 = v8;
  if (v8)
  {
    WFActionParameterSummaryValueCommonInit(v8, v6);
    uint64_t v10 = [v7 copy];
    summaryString = v9->_summaryString;
    v9->_summaryString = (_NSLocalizedStringResource *)v10;

    uint64_t v12 = v9;
  }

  return v9;
}

+ (id)parenthesisRegularExpression
{
  if (parenthesisRegularExpression_onceToken != -1) {
    dispatch_once(&parenthesisRegularExpression_onceToken, &__block_literal_global_50694);
  }
  v2 = (void *)parenthesisRegularExpression_regularExpression;
  return v2;
}

void __61__WFActionParameterSummaryValue_parenthesisRegularExpression__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\((.*)\\)" options:0 error:0];
  v1 = (void *)parenthesisRegularExpression_regularExpression;
  parenthesisRegularExpression_regularExpression = v0;
}

@end