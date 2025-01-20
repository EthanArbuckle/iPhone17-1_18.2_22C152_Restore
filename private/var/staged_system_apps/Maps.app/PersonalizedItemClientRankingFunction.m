@interface PersonalizedItemClientRankingFunction
+ (id)clientRankingFunctionForGEOClientRankingModel:(id)a3;
- (GEOClientRankingModel)model;
- (PersonalizedItemClientRankingFunction)initWithModel:(id)a3;
- (double)clientRankingScoreForPersonalizedItemSignalPack:(id)a3 withServerScore:(id)a4 hasContributionsFromDiscreteFeaturesResult:(BOOL *)a5;
- (double)weightedScoreForModelFeatureIdentifier:(id)a3 function:(id)a4 personalizedItemSignalPack:(id)a5;
- (void)describeInLog:(id)a3 withType:(unsigned __int8)a4;
@end

@implementation PersonalizedItemClientRankingFunction

+ (id)clientRankingFunctionForGEOClientRankingModel:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithModel:v4];

  return v5;
}

- (PersonalizedItemClientRankingFunction)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonalizedItemClientRankingFunction;
  v6 = [(PersonalizedItemClientRankingFunction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (double)clientRankingScoreForPersonalizedItemSignalPack:(id)a3 withServerScore:(id)a4 hasContributionsFromDiscreteFeaturesResult:(BOOL *)a5
{
  id v8 = a3;
  [a4 normalizedScore];
  if (a5) {
    *a5 = 0;
  }
  double v10 = v9;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v11 = [(PersonalizedItemClientRankingFunction *)self model];
  v12 = [v11 features];

  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v18 = [v17 featureIdentifier];
        v19 = [v17 function];
        [(PersonalizedItemClientRankingFunction *)self weightedScoreForModelFeatureIdentifier:v18 function:v19 personalizedItemSignalPack:v8];
        double v21 = v20;

        if (a5)
        {
          if (v21 != 0.0)
          {
            v22 = [v17 function];
            id v23 = [v22 functionType];

            if (v23 == (id)2) {
              *a5 = 1;
            }
          }
        }
        double v10 = v10 + v21;
      }
      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  double v24 = exp(-v10);
  return 1.0 / (v24 + 1.0);
}

- (double)weightedScoreForModelFeatureIdentifier:(id)a3 function:(id)a4 personalizedItemSignalPack:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v56 = a5;
  id v10 = [v8 featureIdentifierType];
  if (v10 == (id)3)
  {
    id v53 = v9;
    id v54 = v8;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v52 = v8;
    id obj = [v52 unitExponentPairs];
    id v16 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (!v16)
    {
      v18 = 0;
      goto LABEL_27;
    }
    id v17 = v16;
    v18 = 0;
    uint64_t v19 = *(void *)v58;
    while (1)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v58 != v19) {
          objc_enumerationMutation(obj);
        }
        double v21 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v22 = [v21 unit];
        id v23 = [v22 featureType];

        if (v23 == (id)2)
        {
          v25 = [v21 unit];
          uint64_t v26 = [v25 feature];
        }
        else
        {
          long double v24 = 0.0;
          if (v23 != (id)1) {
            goto LABEL_18;
          }
          v25 = [v21 unit];
          uint64_t v26 = [v25 source];
        }
        long long v27 = (void *)v26;
        long long v28 = [v21 unit];
        long long v29 = [v28 function];
        [(PersonalizedItemClientRankingFunction *)self weightedScoreForModelFeatureIdentifier:v27 function:v29 personalizedItemSignalPack:v56];
        long double v24 = v30;

LABEL_18:
        double v31 = pow(v24, (double)[v21 exponent]);
        double v32 = v31;
        if (v18)
        {
          [v18 doubleValue];
          uint64_t v34 = +[NSNumber numberWithDouble:v32 * v33];

          v18 = (void *)v34;
        }
        else
        {
          v18 = +[NSNumber numberWithDouble:v31];
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (!v17)
      {
LABEL_27:

        [v18 doubleValue];
        double v38 = v37;
        [v52 featureWeight];
        double v11 = v38 * v39;

        id v9 = v53;
        id v8 = v54;
        goto LABEL_39;
      }
    }
  }
  double v11 = 0.0;
  if (v10 == (id)2)
  {
    id v35 = [v8 featureType];
    if (![v56 hasValueForFeatureType:v35]) {
      goto LABEL_39;
    }
    [v56 valueForFeatureType:v35];
    double v15 = v36;
LABEL_29:
    id v40 = [v9 functionType];
    if (v40 != (id)2)
    {
      if (v40 != (id)1) {
        goto LABEL_39;
      }
      id v41 = v9;
      [v41 maxRelativeValue];
      double v11 = 0.0;
      if (v42 != 0.0)
      {
        [v41 meanValue];
        double v44 = v15 - v43;
        [v41 maxRelativeValue];
        double v46 = v44 / v45;
        [v41 weight];
        double v11 = fmin(fmax(v46, -1.0), 1.0) * v47;
      }
LABEL_38:

      goto LABEL_39;
    }
    id v41 = v9;
    [v41 valueThresholdLow];
    if (v15 <= v48)
    {
      [v41 weightLow];
    }
    else
    {
      [v41 valueThresholdHigh];
      if (v15 < v49) {
        goto LABEL_38;
      }
      [v41 weightHigh];
    }
    double v11 = v50;
    goto LABEL_38;
  }
  if (v10 != (id)1) {
    goto LABEL_39;
  }
  unsigned int v12 = [v8 suggestionType];
  unsigned int v13 = [v8 serverEntryType];
  id v14 = [v8 sourceType];
  if (v14 == (id)1)
  {
    double v15 = 1.0;
    if (v13 != [v56 itemServerEntryTypeSource]) {
      goto LABEL_39;
    }
    goto LABEL_29;
  }
  if (!v14)
  {
    double v15 = 1.0;
    if (v12 == [v56 itemSuggestionTypeSource]) {
      goto LABEL_29;
    }
  }
LABEL_39:

  return v11;
}

- (void)describeInLog:(id)a3 withType:(unsigned __int8)a4
{
  v6 = a3;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v7 = [(PersonalizedItemClientRankingFunction *)self model];
  id v8 = [v7 features];

  id obj = v8;
  id v50 = [v8 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v57;
    unsigned __int8 v46 = a4;
    float v45 = v6;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v57 != v49) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        double v11 = [v10 featureIdentifier];
        id v12 = [v11 featureIdentifierType];

        if (v12 != (id)3)
        {
          if (v12 == (id)2)
          {
            v51 = i;
            unsigned int v13 = [v10 featureIdentifier];
            uint64_t v14 = sub_100C6E8D8(v13);
          }
          else
          {
            if (v12 != (id)1)
            {
              id v15 = 0;
              goto LABEL_28;
            }
            v51 = i;
            unsigned int v13 = [v10 featureIdentifier];
            uint64_t v14 = sub_100C6E7B8(v13);
          }
          id v15 = (id)v14;
          goto LABEL_26;
        }
        v51 = i;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v16 = [v10 featureIdentifier];
        unsigned int v13 = [v16 unitExponentPairs];

        id v15 = [v13 countByEnumeratingWithState:&v52 objects:v64 count:16];
        if (!v15) {
          goto LABEL_26;
        }
        float v47 = v10;
        uint64_t v17 = *(void *)v53;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v53 != v17) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
            id v20 = [v19 exponent];
            double v21 = [v19 unit];
            id v22 = [v21 featureType];

            if (v22 == (id)2)
            {
              id v23 = [v19 unit];
              long double v24 = [v23 feature];
              uint64_t v25 = sub_100C6E8D8(v24);
              goto LABEL_21;
            }
            if (v22 == (id)1)
            {
              id v23 = [v19 unit];
              long double v24 = [v23 source];
              uint64_t v25 = sub_100C6E7B8(v24);
LABEL_21:
              uint64_t v26 = (void *)v25;

              goto LABEL_23;
            }
            uint64_t v26 = 0;
LABEL_23:
            id v27 = [@"Composite:" stringByAppendingFormat:@"[Exp:%u,Desc:%@],", v20, v26];
          }
          id v15 = [v13 countByEnumeratingWithState:&v52 objects:v64 count:16];
        }
        while (v15);
        a4 = v46;
        v6 = v45;
        id v10 = v47;
LABEL_26:

        i = v51;
LABEL_28:
        long long v28 = [v10 function];
        id v29 = [v28 functionType];

        if (v29 == (id)2)
        {
          double v30 = [v10 function];
          [v30 valueThresholdLow];
          double v37 = v36;
          [v30 weightLow];
          double v39 = v38;
          [v30 valueThresholdHigh];
          double v41 = v40;
          [v30 weightHigh];
          +[NSString stringWithFormat:@"Discrete: ThresholdLow=%f, WeightLow=%f, ThresholdHigh=%f, WeightHigh=%f", *(void *)&v37, *(void *)&v39, *(void *)&v41, v42];
          float v43 = LABEL_32:;
        }
        else
        {
          if (v29 == (id)1)
          {
            double v30 = [v10 function];
            [v30 weight];
            double v32 = v31;
            [v30 meanValue];
            double v34 = v33;
            [v30 maxRelativeValue];
            +[NSString stringWithFormat:@"Weight=%f, Mean=%f, MaxRelative=%f", *(void *)&v32, *(void *)&v34, v35, v44];
            goto LABEL_32;
          }
          float v43 = 0;
        }
        if (os_log_type_enabled(v6, (os_log_type_t)a4))
        {
          *(_DWORD *)buf = 138412546;
          id v61 = v15;
          __int16 v62 = 2112;
          v63 = v43;
          _os_log_impl((void *)&_mh_execute_header, v6, (os_log_type_t)a4, "Client ranking model feature: %@ -> %@", buf, 0x16u);
        }
      }
      id v50 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v50);
  }
}

- (GEOClientRankingModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

@end