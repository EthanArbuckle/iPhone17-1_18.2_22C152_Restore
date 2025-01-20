@interface TIKBUserModelValues
- (TIKBUserModelValues)initWithInputMode:(id)a3 context:(id)a4 userModelDataStore:(id)a5 durableCounters:(id)a6 settingsDictionary:(id)a7;
- (id)bucketCountsByWordLength:(id)a3;
- (id)calcAutocorrectionEnabled;
- (id)calcFloatingKeyboardUsageFromUserModel:(id)a3;
- (id)calcTypingSpeedFromUserModel:(id)a3;
- (id)computeValueFromCount:(id)a3 bucketThresholds:(id)a4 bucketValues:(id)a5;
- (id)computeValueFromExpression:(id)a3 precondition:(id)a4 defaultValue:(id)a5 bindings:(id)a6 bucketThresholds:(id)a7 bucketValues:(id)a8;
- (id)computeValueWithDescriptor:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5;
- (id)computeValuesByWordLengthWithDescriptor:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5;
- (id)metricValue:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5;
- (id)metricValuesByWordLength:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5;
- (id)settingValueFromName:(id)a3;
- (void)persistForDate:(id)a3;
@end

@implementation TIKBUserModelValues

- (void).cxx_destruct
{
}

- (id)calcAutocorrectionEnabled
{
  v3 = [(TIKBUserModelValues *)self kbContext];
  int v4 = [v3 keyboardType];

  v5 = [(TIUserModelValues *)self settingsDictionary];
  v6 = v5;
  v7 = (void *)MEMORY[0x1E4FAE5F0];
  if (v4 != 5) {
    v7 = (void *)MEMORY[0x1E4FAE7A8];
  }
  v8 = [v5 objectForKey:*v7];

  return v8;
}

- (id)calcTypingSpeedFromUserModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kFeatureCounterDurationPathedWords;
  v6 = (unsigned int *)MEMORY[0x1E4FAEF78];
  uint64_t v7 = *MEMORY[0x1E4FAEF78];
  v8 = [v4 loadedDate];
  uint64_t v9 = [(TIUserModelValues *)self countsFromTransientCounterWithName:v5 forNumberOfDays:v7 fromLoadedDate:v8];

  uint64_t v10 = kFeatureCounterDurationTappedWords;
  uint64_t v11 = *v6;
  v12 = [v4 loadedDate];
  v71 = [(TIUserModelValues *)self countsFromTransientCounterWithName:v10 forNumberOfDays:v11 fromLoadedDate:v12];

  uint64_t v13 = kFeatureValueWithWordLenWholeWordsPathed;
  uint64_t v14 = *v6;
  v15 = [v4 loadedDate];
  uint64_t v16 = v13;
  v17 = (void *)v9;
  v18 = [(TIUserModelValues *)self countsFromTransientCounterWithName:v16 forNumberOfDays:v14 fromLoadedDate:v15];

  uint64_t v19 = kFeatureValueWithWordLenWordCompletionsPathed;
  uint64_t v20 = *v6;
  v21 = [v4 loadedDate];
  v22 = [(TIUserModelValues *)self countsFromTransientCounterWithName:v19 forNumberOfDays:v20 fromLoadedDate:v21];

  uint64_t v23 = kFeatureValueWithWordLenPathEligibleWordsTapped;
  uint64_t v24 = *v6;
  v25 = [v4 loadedDate];
  uint64_t v26 = [(TIUserModelValues *)self countsFromTransientCounterWithName:v23 forNumberOfDays:v24 fromLoadedDate:v25];

  uint64_t v27 = kFeatureValueWithWordLenPathIneligibleWordsTapped;
  uint64_t v28 = *v6;
  v66 = v4;
  v29 = [v4 loadedDate];
  v30 = [(TIUserModelValues *)self countsFromTransientCounterWithName:v27 forNumberOfDays:v28 fromLoadedDate:v29];

  unsigned int v31 = [v17 count];
  v69 = (void *)v26;
  v70 = v18;
  if (v31)
  {
    uint64_t v32 = 0;
    uint64_t v67 = v31;
    v68 = v30;
    int v33 = 0;
    int v34 = 0;
    do
    {
      v35 = [v18 objectAtIndex:v32];
      int v74 = [v35 intValue];
      v36 = [v22 objectAtIndex:v32];
      int v73 = [v36 intValue];

      v37 = [v17 objectAtIndex:v32];
      int v72 = [v37 intValue];

      v38 = [v69 objectAtIndex:v32];
      int v39 = [v38 intValue];
      [v68 objectAtIndex:v32];
      v41 = v40 = v17;
      v42 = v22;
      int v43 = [v41 intValue];

      v44 = [v71 objectAtIndex:v32];
      LODWORD(v41) = [v44 intValue];

      int v45 = v39 + v43;
      v22 = v42;
      v33 += (v73 + v74 + v45) * (v32 + 1);
      v18 = v70;
      v34 += v72 + v41;
      v17 = v40;
      ++v32;
    }
    while (v67 != v32);
    double v46 = (double)v34;
    double v47 = (double)v33;
    v30 = v68;
  }
  else
  {
    double v46 = 0.0;
    double v47 = 0.0;
  }
  double v48 = v47 / (v46 / 1000.0) / 5.0;
  double v49 = v48 * 60.0;
  v50 = (void *)MEMORY[0x1E4F1C978];
  LODWORD(v48) = 5.0;
  v51 = [NSNumber numberWithFloat:v48];
  LODWORD(v52) = 10.0;
  v53 = [NSNumber numberWithFloat:v52];
  LODWORD(v54) = 20.0;
  v55 = [NSNumber numberWithFloat:v54];
  LODWORD(v56) = 1109393408;
  v57 = [NSNumber numberWithFloat:v56];
  LODWORD(v58) = 1117782016;
  v59 = [NSNumber numberWithFloat:v58];
  v60 = objc_msgSend(v50, "arrayWithObjects:", v51, v53, v55, v57, v59, 0);

  v61 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", kFeatureStringTypingSpeedVerySlow, kFeatureStringTypingSpeedSlow, kFeatureStringTypingSpeedMedium, kFeatureStringTypingSpeedFast, kFeatureStringTypingSpeedVeryFast, kFeatureStringTypingSpeedUnusual, 0);
  v62 = (void *)MEMORY[0x1E4FAE268];
  v63 = [NSNumber numberWithDouble:v49];
  v64 = [v62 bucketNumber:v63 bucketThresholds:v60 bucketValues:v61];

  return v64;
}

- (id)calcFloatingKeyboardUsageFromUserModel:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(TIKBUserModelValues *)self kbContext];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1)
  {
    uint64_t v7 = [(TIKBUserModelValues *)self kbContext];
    int v8 = [v7 keyboardType];

    if (v8 == 3)
    {
      uint64_t v9 = kFeatureCounterWithWordLenWordsTypedOnFloatingKeyboard;
      uint64_t v10 = (unsigned int *)MEMORY[0x1E4FAEF78];
      uint64_t v11 = *MEMORY[0x1E4FAEF78];
      v12 = [v4 loadedDate];
      uint64_t v13 = [(TIUserModelValues *)self aggregatedCountFromTransientCounterWithName:v9 forNumberOfDays:v11 fromLoadedDate:v12];
      [v13 doubleValue];
      double v15 = v14;

      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id obj = [v4 contexts];
      uint64_t v16 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
      double v17 = 0.0;
      if (v16)
      {
        uint64_t v18 = v16;
        uint64_t v19 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v72 != v19) {
              objc_enumerationMutation(obj);
            }
            id v21 = *(id *)(*((void *)&v71 + 1) + 8 * i);
            if ([v21 userInterfaceIdiom] == 1)
            {
              v22 = [v4 valuesFromContext:v21];
              uint64_t v23 = kFeatureValueWithWordLenWholeWordsPathed;
              uint64_t v24 = *v10;
              v25 = [v4 loadedDate];
              uint64_t v26 = [v22 aggregatedCountFromTransientCounterWithName:v23 forNumberOfDays:v24 fromLoadedDate:v25];
              [v26 doubleValue];
              double v28 = v17 + v27;

              uint64_t v29 = kFeatureValueWithWordLenWordCompletionsPathed;
              uint64_t v30 = *v10;
              unsigned int v31 = [v4 loadedDate];
              uint64_t v32 = [v22 aggregatedCountFromTransientCounterWithName:v29 forNumberOfDays:v30 fromLoadedDate:v31];
              [v32 doubleValue];
              double v34 = v28 + v33;

              uint64_t v35 = kFeatureValueWithWordLenPathEligibleWordsTapped;
              uint64_t v36 = *v10;
              v37 = [v4 loadedDate];
              v38 = [v22 aggregatedCountFromTransientCounterWithName:v35 forNumberOfDays:v36 fromLoadedDate:v37];
              [v38 doubleValue];
              double v40 = v34 + v39;

              uint64_t v41 = kFeatureValueWithWordLenPathIneligibleWordsTapped;
              uint64_t v42 = *v10;
              int v43 = [v4 loadedDate];
              v44 = [v22 aggregatedCountFromTransientCounterWithName:v41 forNumberOfDays:v42 fromLoadedDate:v43];
              [v44 doubleValue];
              double v17 = v40 + v45;
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
        }
        while (v18);
      }

      double v46 = v15 / v17;
      if (v17 == 0.0) {
        double v47 = 0.0;
      }
      else {
        double v47 = v15 / v17;
      }
      double v48 = (void *)MEMORY[0x1E4F1C978];
      LODWORD(v46) = 1008981770;
      double v49 = [NSNumber numberWithFloat:v46];
      LODWORD(v50) = 1045220557;
      v51 = [NSNumber numberWithFloat:v50];
      LODWORD(v52) = 1053609165;
      v53 = [NSNumber numberWithFloat:v52];
      LODWORD(v54) = 1058642330;
      v55 = [NSNumber numberWithFloat:v54];
      LODWORD(v56) = 1061997773;
      v57 = [NSNumber numberWithFloat:v56];
      LODWORD(v58) = 1065185444;
      v59 = [NSNumber numberWithFloat:v58];
      v60 = objc_msgSend(v48, "arrayWithObjects:", v49, v51, v53, v55, v57, v59, 0);

      v61 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4FAEFB0], *MEMORY[0x1E4FAEFA8], *MEMORY[0x1E4FAEF88], *MEMORY[0x1E4FAEF90], *MEMORY[0x1E4FAEF80], *MEMORY[0x1E4FAEFA0], *MEMORY[0x1E4FAEF98], 0);
      v62 = (void *)MEMORY[0x1E4FAE268];
      v63 = [NSNumber numberWithDouble:v47];
      id v64 = [v62 bucketNumber:v63 bucketThresholds:v60 bucketValues:v61];
    }
    else
    {
      v60 = [(id)*MEMORY[0x1E4FAF000] stringByAppendingString:kFeatureCounterTotalWordsTypedOnFloatingKeyboard];
      v66 = [(TIUserModelValues *)self userModelDataStore];
      v61 = [v66 getDurableValueForKey:v60];

      v63 = [v61 value];
      int v67 = [v63 intValue];
      v68 = (id *)MEMORY[0x1E4FAEFB0];
      if (v67 <= 0) {
        v68 = (id *)MEMORY[0x1E4FAEFC8];
      }
      id v64 = *v68;
    }
    id v65 = v64;
  }
  else
  {
    id v65 = (id)*MEMORY[0x1E4FAEFD0];
  }

  return v65;
}

- (id)computeValueFromExpression:(id)a3 precondition:(id)a4 defaultValue:(id)a5 bindings:(id)a6 bucketThresholds:(id)a7 bucketValues:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = v15;
  if (!v14 || (uint64_t v20 = v19, [v14 evaluateWithObject:v16]))
  {
    uint64_t v20 = [v13 expressionValueWithObject:v16 context:0];
  }
  id v21 = [MEMORY[0x1E4FAE268] bucketNumber:v20 bucketThresholds:v17 bucketValues:v18];

  return v21;
}

- (id)computeValueFromCount:(id)a3 bucketThresholds:(id)a4 bucketValues:(id)a5
{
  return (id)[MEMORY[0x1E4FAE268] bucketNumber:a3 bucketThresholds:a4 bucketValues:a5];
}

- (id)bucketCountsByWordLength:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKBUserModelValues *)self kbContext];
  uint64_t v6 = [v5 inputLanguage];
  if ([v6 hasPrefix:@"zh"]) {
    uint64_t v7 = &unk_1F3FA7988;
  }
  else {
    uint64_t v7 = &unk_1F3FA79A0;
  }

  int v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3FA79B8];
  uint64_t v9 = *MEMORY[0x1E4FAEFF0];
  if (*MEMORY[0x1E4FAEFF0])
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = [v7 objectAtIndexedSubscript:v10];
      uint64_t v12 = [v11 integerValue];

      id v13 = [v8 objectAtIndexedSubscript:v12];
      uint64_t v14 = [v13 integerValue];
      id v15 = [v4 objectAtIndexedSubscript:v10];
      uint64_t v16 = [v15 integerValue] + v14;

      id v17 = [NSNumber numberWithInteger:v16];
      [v8 setObject:v17 atIndexedSubscript:v12];

      ++v10;
    }
    while (v9 != v10);
  }

  return v8;
}

- (id)computeValuesByWordLengthWithDescriptor:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [v8 calculationExpression];

  id v64 = v8;
  if (v11)
  {
    id v65 = self;
    v63 = v10;
    uint64_t v12 = objc_opt_new();
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v13 = [v8 calculationDependencies];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v79 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v71 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v70 + 1) + 8 * i);
          id v19 = [(TIKBUserModelValues *)v65 metricValuesByWordLength:v18 userModel:v9 forNumberOfDays:v5];
          [v12 setObject:v19 forKey:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v70 objects:v79 count:16];
      }
      while (v15);
    }

    uint64_t v20 = (void *)MEMORY[0x1E4F28C68];
    id v21 = [v8 calculationExpression];
    id v22 = [v20 expressionWithFormat:v21];

    uint64_t v23 = [v8 calculationPrecondition];
    id v57 = v9;
    if (v23)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28F60];
      v25 = [v8 calculationPrecondition];
      v62 = [v24 predicateWithFormat:v25];
    }
    else
    {
      v62 = 0;
    }

    v61 = [v8 calculationDefaultValue];
    uint64_t v60 = *MEMORY[0x1E4FAEFF8];
    if (*MEMORY[0x1E4FAEFF8])
    {
      uint64_t v41 = 0;
      id v59 = v22;
      do
      {
        uint64_t v42 = objc_opt_new();
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        int v43 = [v8 calculationDependencies];
        uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v78 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v67;
          do
          {
            for (uint64_t j = 0; j != v45; ++j)
            {
              if (*(void *)v67 != v46) {
                objc_enumerationMutation(v43);
              }
              uint64_t v48 = *(void *)(*((void *)&v66 + 1) + 8 * j);
              double v49 = objc_msgSend(v12, "objectForKey:", v48, v57);
              double v50 = [v49 objectAtIndexedSubscript:v41];
              [v42 setObject:v50 forKey:v48];
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v78 count:16];
          }
          while (v45);
        }

        v51 = [NSNumber numberWithInt:v41];
        [v42 setObject:v51 forKey:@"index"];

        id v8 = v64;
        double v52 = [v64 bucketThresholds];
        v53 = [v64 bucketValues];
        id v22 = v59;
        double v54 = [(TIKBUserModelValues *)v65 computeValueFromExpression:v59 precondition:v62 defaultValue:v61 bindings:v42 bucketThresholds:v52 bucketValues:v53];

        [v63 addObject:v54];
        ++v41;
      }
      while (v41 != v60);
    }

    id v9 = v57;
    uint64_t v10 = v63;
  }
  else
  {
    uint64_t v26 = [v8 metricName];
    double v27 = [v9 loadedDate];
    double v28 = [(TIUserModelValues *)self countsFromTransientCounterWithName:v26 forNumberOfDays:v5 fromLoadedDate:v27];
    uint64_t v29 = self;
    uint64_t v30 = [(TIKBUserModelValues *)self bucketCountsByWordLength:v28];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v22 = v30;
    uint64_t v31 = [v22 countByEnumeratingWithState:&v74 objects:v80 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      id v58 = v9;
      uint64_t v33 = *(void *)v75;
      double v34 = v29;
      do
      {
        uint64_t v35 = v22;
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v75 != v33) {
            objc_enumerationMutation(v35);
          }
          uint64_t v37 = *(void *)(*((void *)&v74 + 1) + 8 * k);
          v38 = objc_msgSend(v8, "bucketThresholds", v58);
          double v39 = [v8 bucketValues];
          double v40 = [(TIKBUserModelValues *)v34 computeValueFromCount:v37 bucketThresholds:v38 bucketValues:v39];

          [v10 addObject:v40];
        }
        id v22 = v35;
        uint64_t v32 = [v35 countByEnumeratingWithState:&v74 objects:v80 count:16];
      }
      while (v32);
      uint64_t v12 = v35;
      id v9 = v58;
    }
    else
    {
      uint64_t v12 = v22;
    }
  }

  v55 = (void *)[v10 copy];

  return v55;
}

- (id)computeValueWithDescriptor:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 calculationExpression];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C68];
    uint64_t v12 = [v8 calculationExpression];
    uint64_t v35 = [v11 expressionWithFormat:v12];

    id v13 = [v8 calculationPrecondition];
    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v15 = [v8 calculationPrecondition];
      double v34 = [v14 predicateWithFormat:v15];
    }
    else
    {
      double v34 = 0;
    }

    uint64_t v33 = [v8 calculationDefaultValue];
    id v22 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v36 = v8;
    uint64_t v23 = [v8 calculationDependencies];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v29 = -[TIKBUserModelValues metricValue:userModel:forNumberOfDays:](self, "metricValue:userModel:forNumberOfDays:", v28, v9, v5, v33);
          [v22 setObject:v29 forKey:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v25);
    }

    id v8 = v36;
    uint64_t v30 = [v36 bucketThresholds];
    uint64_t v31 = [v36 bucketValues];
    id v21 = [(TIKBUserModelValues *)self computeValueFromExpression:v35 precondition:v34 defaultValue:v33 bindings:v22 bucketThresholds:v30 bucketValues:v31];
  }
  else
  {
    uint64_t v16 = [v8 metricName];
    id v17 = [v9 loadedDate];
    uint64_t v18 = [(TIUserModelValues *)self aggregatedCountFromTransientCounterWithName:v16 forNumberOfDays:v5 fromLoadedDate:v17];

    id v19 = [v8 bucketThresholds];
    uint64_t v20 = [v8 bucketValues];
    id v21 = [(TIKBUserModelValues *)self computeValueFromCount:v18 bucketThresholds:v19 bucketValues:v20];
  }

  return v21;
}

- (id)metricValuesByWordLength:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 metricDescriptorRegistry];
  uint64_t v11 = [v10 metricDescriptorWithName:v9];

  if (v11 && [v11 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v12 = [(TIKBUserModelValues *)self computeValuesByWordLengthWithDescriptor:v11 userModel:v8 forNumberOfDays:v5];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)persistForDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)TIKBUserModelValues;
  [(TIUserModelValues *)&v16 persistForDate:a3];
  id v4 = IXADefaultLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = NSString;
    uint64_t v15 = [(TIUserModelValues *)self inputMode];
    uint64_t v5 = [(NSMutableDictionary *)self->_stringValues objectForKey:kFeatureStringKeyboardLanguage];
    uint64_t v6 = [(NSMutableDictionary *)self->_stringValues objectForKey:kFeatureStringKeyboardRegion];
    uint64_t v7 = [(NSMutableDictionary *)self->_stringValues objectForKey:kFeatureStringKeyboardVariant];
    id v8 = [(NSMutableDictionary *)self->_stringValues objectForKey:kFeatureStringKeyboardSecondaryLanguage];
    id v9 = [(NSMutableDictionary *)self->_stringValues objectForKey:kFeatureStringKeyboardSecondaryRegion];
    uint64_t v10 = [(NSMutableDictionary *)self->_stringValues objectForKey:kFeatureStringKeyboardLayout];
    uint64_t v11 = [(NSMutableDictionary *)self->_stringValues objectForKey:kFeatureStringKeyboardType];
    uint64_t v12 = [(NSMutableDictionary *)self->_stringValues objectForKey:kFeatureStringKeyboardConfiguration];
    id v13 = [v14 stringWithFormat:@"%s TIKBUserModelValues persisted: %@ %@_%@-%@ %@_%@ %@ %@ %@", "-[TIKBUserModelValues persistForDate:]", v15, v5, v6, v7, v8, v9, v10, v11, v12];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v13;
    _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
}

- (id)settingValueFromName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kSettingValueAutocorrectionEnabled])
  {
    uint64_t v5 = [(TIKBUserModelValues *)self calcAutocorrectionEnabled];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKBUserModelValues;
    uint64_t v5 = [(TIUserModelValues *)&v8 settingValueFromName:v4];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)metricValue:(id)a3 userModel:(id)a4 forNumberOfDays:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:kFeatureFloatingKeyboardUsage])
  {
    uint64_t v10 = [(TIKBUserModelValues *)self calcFloatingKeyboardUsageFromUserModel:v9];
LABEL_5:
    id v11 = (id)v10;
    goto LABEL_28;
  }
  if ([v8 isEqualToString:kFeatureStringTypingSpeed])
  {
    uint64_t v10 = [(TIKBUserModelValues *)self calcTypingSpeedFromUserModel:v9];
    goto LABEL_5;
  }
  uint64_t v12 = [v9 metricDescriptorRegistry];
  id v13 = [v12 metricDescriptorWithName:v8];

  if (!v13) {
    goto LABEL_26;
  }
  if ([v13 isMemberOfClass:objc_opt_class()])
  {
    id v14 = v13;
    uint64_t v15 = [v14 configString];

    if (v15)
    {
      objc_super v16 = [v14 configString];
      id v17 = [(TIKBUserModelValues *)self settingValueFromName:v16];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v17 BOOLValue])
      {
        id v11 = (id)*MEMORY[0x1E4FAEFC0];

LABEL_25:
        goto LABEL_27;
      }
    }
    if ([v14 discoveryThreshold] < 1) {
      goto LABEL_21;
    }
    uint64_t v18 = [v14 discoveryCounter];

    if (!v18) {
      goto LABEL_21;
    }
    uint64_t v19 = [(TIUserModelValues *)self durableCounters];
    uint64_t v20 = [v14 discoveryCounter];
    id v21 = [v19 objectForKey:v20];
    id v22 = [v21 count];
    int v23 = [v22 intValue];

    if ([v14 discoveryThreshold] > v23)
    {
      id v24 = (id)*MEMORY[0x1E4FAEFC8];
    }
    else
    {
LABEL_21:
      id v24 = [(TIKBUserModelValues *)self computeValueWithDescriptor:v14 userModel:v9 forNumberOfDays:*MEMORY[0x1E4FAEF78]];
    }
LABEL_24:
    id v11 = v24;
    goto LABEL_25;
  }
  if (![v13 isMemberOfClass:objc_opt_class()])
  {
    if ([v13 isMemberOfClass:objc_opt_class()])
    {
      stringValues = self->_stringValues;
      id v14 = [v13 contextFieldName];
      id v24 = [(NSMutableDictionary *)stringValues objectForKey:v14];
      goto LABEL_24;
    }
    if ([v13 isMemberOfClass:objc_opt_class()])
    {
      id v14 = [v13 settingName];
      id v24 = [(TIKBUserModelValues *)self settingValueFromName:v14];
      goto LABEL_24;
    }
LABEL_26:
    id v11 = 0;
    goto LABEL_27;
  }
  id v11 = [(TIKBUserModelValues *)self computeValueWithDescriptor:v13 userModel:v9 forNumberOfDays:v5];
LABEL_27:

LABEL_28:

  return v11;
}

- (TIKBUserModelValues)initWithInputMode:(id)a3 context:(id)a4 userModelDataStore:(id)a5 durableCounters:(id)a6 settingsDictionary:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v50.receiver = self;
  v50.super_class = (Class)TIKBUserModelValues;
  id v14 = [(TIUserModelValues *)&v50 initWithInputMode:v12 context:v13 userModelDataStore:a5 durableCounters:a6 settingsDictionary:a7];
  if (v14)
  {
    id v49 = v12;
    id v15 = v13;
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
    stringValues = v14->_stringValues;
    v14->_stringValues = (NSMutableDictionary *)v16;

    uint64_t v18 = v14->_stringValues;
    uint64_t v19 = [v15 inputLanguage];
    [(NSMutableDictionary *)v18 setObject:v19 forKey:kFeatureStringKeyboardLanguage];

    uint64_t v20 = v14->_stringValues;
    id v21 = [v15 inputRegion];
    [(NSMutableDictionary *)v20 setObject:v21 forKey:kFeatureStringKeyboardRegion];

    id v22 = v14->_stringValues;
    int v23 = [v15 inputVariant];
    [(NSMutableDictionary *)v22 setObject:v23 forKey:kFeatureStringKeyboardVariant];

    id v24 = v14->_stringValues;
    uint64_t v25 = [v15 secondaryLanguage];
    [(NSMutableDictionary *)v24 setObject:v25 forKey:kFeatureStringKeyboardSecondaryLanguage];

    uint64_t v26 = v14->_stringValues;
    double v27 = [v15 secondaryRegion];
    [(NSMutableDictionary *)v26 setObject:v27 forKey:kFeatureStringKeyboardSecondaryRegion];

    uint64_t v28 = v14->_stringValues;
    uint64_t v29 = [v15 layoutName];
    [(NSMutableDictionary *)v28 setObject:v29 forKey:kFeatureStringKeyboardLayout];

    uint64_t v30 = v14->_stringValues;
    uint64_t v31 = +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", [v15 keyboardType]);
    [(NSMutableDictionary *)v30 setObject:v31 forKey:kFeatureStringKeyboardType];

    uint64_t v32 = v14->_stringValues;
    uint64_t v33 = [v15 keyboardConfiguration];
    double v34 = v33;
    if (!v33) {
      uint64_t v33 = @"None";
    }
    uint64_t v35 = (void *)[(__CFString *)v33 copy];
    [(NSMutableDictionary *)v32 setObject:v35 forKey:kFeatureStringKeyboardConfiguration];

    uint64_t v36 = IXADefaultLogFacility();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      uint64_t v46 = NSString;
      uint64_t v48 = [(NSMutableDictionary *)v14->_stringValues objectForKey:kFeatureStringKeyboardLanguage];
      long long v37 = [(NSMutableDictionary *)v14->_stringValues objectForKey:kFeatureStringKeyboardRegion];
      [(NSMutableDictionary *)v14->_stringValues objectForKey:kFeatureStringKeyboardVariant];
      v38 = id v47 = v13;
      long long v39 = [(NSMutableDictionary *)v14->_stringValues objectForKey:kFeatureStringKeyboardSecondaryLanguage];
      uint64_t v45 = [(NSMutableDictionary *)v14->_stringValues objectForKey:kFeatureStringKeyboardSecondaryRegion];
      long long v40 = [(NSMutableDictionary *)v14->_stringValues objectForKey:kFeatureStringKeyboardLayout];
      uint64_t v41 = [(NSMutableDictionary *)v14->_stringValues objectForKey:kFeatureStringKeyboardType];
      uint64_t v42 = [(NSMutableDictionary *)v14->_stringValues objectForKey:kFeatureStringKeyboardConfiguration];
      int v43 = [v46 stringWithFormat:@"%s TIKBUserModelValues created: %@ %@_%@-%@ %@_%@ %@ %@ %@", "-[TIKBUserModelValues initWithInputMode:context:userModelDataStore:durableCounters:settingsDictionary:]", v49, v48, v37, v38, v39, v45, v40, v41, v42];
      *(_DWORD *)buf = 138412290;
      double v52 = v43;
      _os_log_impl(&dword_1E3F0E000, v36, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      id v13 = v47;
    }

    id v12 = v49;
  }

  return v14;
}

@end