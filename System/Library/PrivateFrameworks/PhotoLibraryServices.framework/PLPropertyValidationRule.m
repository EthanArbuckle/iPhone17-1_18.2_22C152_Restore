@interface PLPropertyValidationRule
- (BOOL)evaluateWithObject:(id)a3 outMessage:(id *)a4;
- (NSArray)expectedValues;
- (NSObject)expectedValue;
- (NSObject)expectedValueRangeHigh;
- (NSObject)expectedValueRangeLow;
- (NSString)keyPath;
- (id)currentValuesOfObject:(id)a3;
- (id)descriptionOfCurrentValuesOfObject:(id)a3;
- (id)keyPaths;
- (id)predicate;
- (id)reverseRule;
- (int64_t)type;
- (void)setExpectedValue:(id)a3;
- (void)setExpectedValueRangeHigh:(id)a3;
- (void)setExpectedValueRangeLow:(id)a3;
- (void)setExpectedValues:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PLPropertyValidationRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedValues, 0);
  objc_storeStrong((id *)&self->_expectedValueRangeHigh, 0);
  objc_storeStrong((id *)&self->_expectedValueRangeLow, 0);
  objc_storeStrong((id *)&self->_expectedValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (void)setExpectedValues:(id)a3
{
}

- (NSArray)expectedValues
{
  return self->_expectedValues;
}

- (void)setExpectedValueRangeHigh:(id)a3
{
}

- (NSObject)expectedValueRangeHigh
{
  return self->_expectedValueRangeHigh;
}

- (void)setExpectedValueRangeLow:(id)a3
{
}

- (NSObject)expectedValueRangeLow
{
  return self->_expectedValueRangeLow;
}

- (void)setExpectedValue:(id)a3
{
}

- (NSObject)expectedValue
{
  return self->_expectedValue;
}

- (void)setKeyPath:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (id)descriptionOfCurrentValuesOfObject:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [(PLPropertyValidationRule *)self currentValuesOfObject:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v6 objectForKeyedSubscript:v11];
        v13 = [NSString stringWithFormat:@"%@=%@", v11, v12];
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  v14 = [v5 componentsJoinedByString:@", "];

  return v14;
}

- (id)currentValuesOfObject:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLPropertyValidationRule *)self keyPath];
  v6 = [v4 valueForKey:v5];

  uint64_t v7 = [(PLPropertyValidationRule *)self keyPath];
  uint64_t v11 = v7;
  uint64_t v8 = v6;
  if (!v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  if (!v6) {

  }
  return v9;
}

- (id)keyPaths
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(PLPropertyValidationRule *)self keyPath];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)predicate
{
  v34[2] = *MEMORY[0x1E4F143B8];
  switch([(PLPropertyValidationRule *)self type])
  {
    case 2:
      v3 = (void *)MEMORY[0x1E4F28F60];
      id v4 = [(PLPropertyValidationRule *)self keyPath];
      objc_msgSend(v3, "predicateWithFormat:", @"%K != NULL", v4);
      goto LABEL_13;
    case 3:
      v6 = (void *)MEMORY[0x1E4F28F60];
      id v4 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v7 = [(PLPropertyValidationRule *)self expectedValue];
      [v6 predicateWithFormat:@"%K == %@", v4, v7];
      goto LABEL_21;
    case 4:
      uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
      id v4 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v7 = [(PLPropertyValidationRule *)self expectedValue];
      [v8 predicateWithFormat:@"%K != %@", v4, v7];
      goto LABEL_21;
    case 5:
      uint64_t v9 = [(PLPropertyValidationRule *)self expectedValueRangeLow];

      if (!v9)
      {
        v29 = (void *)MEMORY[0x1E4F28F60];
        id v4 = [(PLPropertyValidationRule *)self keyPath];
        uint64_t v7 = [(PLPropertyValidationRule *)self expectedValueRangeHigh];
        [v29 predicateWithFormat:@"%K <= %@", v4, v7];
        id v5 = LABEL_21:;
        goto LABEL_25;
      }
      v10 = [(PLPropertyValidationRule *)self expectedValueRangeHigh];

      uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
      v12 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v13 = [(PLPropertyValidationRule *)self expectedValueRangeLow];
      v14 = (void *)v13;
      if (v10)
      {
        v34[0] = v13;
        v15 = [(PLPropertyValidationRule *)self expectedValueRangeHigh];
        v34[1] = v15;
        long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
        id v5 = [v11 predicateWithFormat:@"%K BETWEEN %@", v12, v16];
        goto LABEL_19;
      }
      id v5 = [v11 predicateWithFormat:@"%K >= %@", v12, v13];
      goto LABEL_33;
    case 6:
      long long v17 = (void *)MEMORY[0x1E4F28F60];
      id v4 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v7 = [(PLPropertyValidationRule *)self expectedValues];
      [v17 predicateWithFormat:@"%K in %@", v4, v7];
      goto LABEL_21;
    case 7:
      long long v18 = (void *)MEMORY[0x1E4F28F60];
      id v4 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v7 = [(PLPropertyValidationRule *)self expectedValueRangeLow];
      v32[0] = v7;
      long long v19 = [(PLPropertyValidationRule *)self expectedValueRangeHigh];
      v32[1] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
      id v5 = [v18 predicateWithFormat:@"NOT (%K BETWEEN %@)", v4, v20];

      goto LABEL_24;
    case 8:
      uint64_t v21 = (void *)MEMORY[0x1E4F28F60];
      id v4 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v7 = [(PLPropertyValidationRule *)self expectedValues];
      [v21 predicateWithFormat:@"NOT (%K in %@)", v4, v7];
      goto LABEL_21;
    case 9:
      v22 = (void *)MEMORY[0x1E4F28F60];
      id v4 = [(PLPropertyValidationRule *)self keyPath];
      objc_msgSend(v22, "predicateWithFormat:", @"%K == nil", v4);
      id v5 = LABEL_13:;
      goto LABEL_26;
    case 10:
      v23 = (void *)MEMORY[0x1E4F28F60];
      id v4 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v7 = [(PLPropertyValidationRule *)self keyPath];
      objc_msgSend(v23, "predicateWithFormat:", @"%K == NULL OR %K == 0", v4, v7);
      goto LABEL_21;
    case 11:
      v24 = (void *)MEMORY[0x1E4F28F60];
      id v4 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v7 = [(PLPropertyValidationRule *)self keyPath];
      long long v19 = [(PLPropertyValidationRule *)self expectedValue];
      [v24 predicateWithFormat:@"%K == nil OR %K == %@", v4, v7, v19];
      goto LABEL_23;
    case 12:
      v25 = [(PLPropertyValidationRule *)self expectedValueRangeHigh];

      if (v25)
      {
        v26 = [(PLPropertyValidationRule *)self expectedValueRangeLow];

        v27 = (void *)MEMORY[0x1E4F28F60];
        v12 = [(PLPropertyValidationRule *)self keyPath];
        v14 = [(PLPropertyValidationRule *)self keyPath];
        if (v26)
        {
          v15 = [(PLPropertyValidationRule *)self expectedValueRangeLow];
          v33[0] = v15;
          long long v16 = [(PLPropertyValidationRule *)self expectedValueRangeHigh];
          v33[1] = v16;
          v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
          id v5 = [v27 predicateWithFormat:@"%K == NULL OR (%K BETWEEN %@)", v12, v14, v28];

LABEL_19:
        }
        else
        {
          v15 = [(PLPropertyValidationRule *)self expectedValueRangeHigh];
          id v5 = [v27 predicateWithFormat:@"%K == NULL OR %K <= %@", v12, v14, v15];
        }

LABEL_33:
      }
      else
      {
        v30 = (void *)MEMORY[0x1E4F28F60];
        id v4 = [(PLPropertyValidationRule *)self keyPath];
        uint64_t v7 = [(PLPropertyValidationRule *)self keyPath];
        long long v19 = [(PLPropertyValidationRule *)self expectedValueRangeLow];
        [v30 predicateWithFormat:@"%K == NULL OR %K >= %@", v4, v7, v19];
        id v5 = LABEL_23:;
LABEL_24:

LABEL_25:
LABEL_26:
      }
LABEL_27:
      return v5;
    default:
      id v5 = 0;
      goto LABEL_27;
  }
}

- (BOOL)evaluateWithObject:(id)a3 outMessage:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  int64_t v7 = [(PLPropertyValidationRule *)self type];
  if (v7 == 1)
  {
LABEL_7:
    char v15 = 1;
    goto LABEL_12;
  }
  if (!v7)
  {
    if (a4)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      uint64_t v11 = [(PLPropertyValidationRule *)self keyPaths];
      v12 = [v11 allObjects];
      uint64_t v13 = [v12 componentsJoinedByString:@", "];
      v14 = [(PLPropertyValidationRule *)self descriptionOfCurrentValuesOfObject:v6];
      *a4 = [v8 stringWithFormat:@"Skipping property validation for: %@.(%@). Actual value: %@", v10, v13, v14];
      char v15 = 1;
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_7;
  }
  long long v16 = [(PLPropertyValidationRule *)self predicate];
  char v15 = [v16 evaluateWithObject:v6];

  if (a4 && (v15 & 1) == 0)
  {
    v22 = NSString;
    long long v17 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v17);
    uint64_t v11 = [(PLPropertyValidationRule *)self keyPaths];
    v12 = [v11 allObjects];
    uint64_t v13 = [v12 componentsJoinedByString:@", "];
    v14 = [v6 objectID];
    long long v18 = [(PLPropertyValidationRule *)self descriptionOfCurrentValuesOfObject:v6];
    long long v19 = [(PLPropertyValidationRule *)self predicate];
    v20 = [v19 description];
    *a4 = [v22 stringWithFormat:@"Property value validation failure: %@.(%@) (%@). Actual values: (%@). Expected values: (%@)", v10, v13, v14, v18, v20];

    char v15 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v15;
}

- (id)reverseRule
{
  switch([(PLPropertyValidationRule *)self type])
  {
    case 2:
      v3 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v4 = 9;
      goto LABEL_16;
    case 3:
      v3 = [(PLPropertyValidationRule *)self keyPath];
      id v6 = [(PLPropertyValidationRule *)self expectedValue];
      uint64_t v7 = 4;
      goto LABEL_6;
    case 4:
      v3 = [(PLPropertyValidationRule *)self keyPath];
      id v6 = [(PLPropertyValidationRule *)self expectedValue];
      uint64_t v7 = 3;
LABEL_6:
      uint64_t v8 = v3;
      uint64_t v9 = v6;
      v10 = 0;
      goto LABEL_13;
    case 5:
      v3 = [(PLPropertyValidationRule *)self keyPath];
      id v6 = [(PLPropertyValidationRule *)self expectedValueRangeLow];
      uint64_t v11 = [(PLPropertyValidationRule *)self expectedValueRangeHigh];
      uint64_t v12 = 7;
      goto LABEL_10;
    case 6:
      v3 = [(PLPropertyValidationRule *)self keyPath];
      id v6 = [(PLPropertyValidationRule *)self expectedValues];
      uint64_t v7 = 8;
      goto LABEL_12;
    case 7:
      v3 = [(PLPropertyValidationRule *)self keyPath];
      id v6 = [(PLPropertyValidationRule *)self expectedValueRangeLow];
      uint64_t v11 = [(PLPropertyValidationRule *)self expectedValueRangeHigh];
      uint64_t v12 = 5;
LABEL_10:
      id v5 = _PLPropertyValidationRuleMake(v12, v3, 0, v6, v11, 0);

      goto LABEL_14;
    case 8:
      v3 = [(PLPropertyValidationRule *)self keyPath];
      id v6 = [(PLPropertyValidationRule *)self expectedValues];
      uint64_t v7 = 6;
LABEL_12:
      uint64_t v8 = v3;
      uint64_t v9 = 0;
      v10 = v6;
LABEL_13:
      id v5 = _PLPropertyValidationRuleMake(v7, v8, v9, 0, 0, v10);
LABEL_14:

      goto LABEL_17;
    case 9:
      v3 = [(PLPropertyValidationRule *)self keyPath];
      uint64_t v4 = 2;
LABEL_16:
      id v5 = _PLPropertyValidationRuleMake(v4, v3, 0, 0, 0, 0);
LABEL_17:

      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

@end