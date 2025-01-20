@interface TADisplayOnCalculator
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)useBudget;
- (NSDate)evaluatedUntil;
- (NSDate)startTime;
- (TADisplayOnCalculator)initWithCoder:(id)a3;
- (TADisplayOnCalculator)initWithStartTime:(id)a3;
- (TADisplayOnCalculator)initWithStartTime:(id)a3 budget:(double)a4;
- (double)budgetRemaining;
- (double)calculateDisplayOnWithEvents:(id)a3 advertisements:(id)a4 endDate:(id)a5;
- (void)completeDisplayOnWithEndDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBudgetRemaining:(double)a3;
- (void)setStartTime:(id)a3;
- (void)setUseBudget:(BOOL)a3;
@end

@implementation TADisplayOnCalculator

- (TADisplayOnCalculator)initWithStartTime:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TADisplayOnCalculator;
  v6 = [(TADisplayOnCalculator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_startTime, a3);
    v7->_useBudget = 0;
    objc_storeStrong((id *)&v7->_evaluatedUntil, v7->_startTime);
  }

  return v7;
}

- (TADisplayOnCalculator)initWithStartTime:(id)a3 budget:(double)a4
{
  result = [(TADisplayOnCalculator *)self initWithStartTime:a3];
  if (result)
  {
    result->_useBudget = 1;
    result->_budgetRemaining = a4;
  }
  return result;
}

- (void)completeDisplayOnWithEndDate:(id)a3
{
  id v5 = a3;
  if (!self->_useBudget)
  {
    v6 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
      -[TADisplayOnCalculator completeDisplayOnWithEndDate:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_budgetRemaining > 0.0)
  {
    if ([(NSDate *)self->_evaluatedUntil compare:v5] == NSOrderedAscending) {
      objc_storeStrong((id *)&self->_evaluatedUntil, a3);
    }
    self->_budgetRemaining = 0.0;
  }
}

- (double)calculateDisplayOnWithEvents:(id)a3 advertisements:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = 0.0;
  if ([(NSDate *)self->_evaluatedUntil compare:v10] != NSOrderedAscending
    || self->_useBudget && self->_budgetRemaining <= 0.0)
  {
    goto LABEL_46;
  }
  uint64_t v12 = self->_evaluatedUntil;
  if (![v8 count])
  {
    if ([v9 count])
    {
      [v10 timeIntervalSinceDate:self->_startTime];
      double v11 = v22;
      if (v22 >= 0.0)
      {
        objc_storeStrong((id *)&self->_evaluatedUntil, a5);
        if (self->_useBudget)
        {
          double budgetRemaining = self->_budgetRemaining;
          if (v11 <= budgetRemaining)
          {
            self->_double budgetRemaining = budgetRemaining - v11;
          }
          else
          {
            self->_double budgetRemaining = 0.0;
            double v11 = 0.0;
          }
        }
      }
      else
      {
        v23 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
          -[TADisplayOnCalculator calculateDisplayOnWithEvents:advertisements:endDate:](v23, v24, v25, v26, v27, v28, v29, v30);
        }
      }
    }
    goto LABEL_45;
  }
  p_evaluatedUntil = &self->_evaluatedUntil;
  id v59 = v9;
  uint64_t v13 = [v8 lastObject];
  v14 = [v13 getDate];
  uint64_t v15 = [v14 compare:v12];

  uint64_t v16 = [v8 count];
  if (v15 != 1)
  {
    LODWORD(v17) = v16 - 1;
    uint64_t v31 = (int)v16 - 1;
LABEL_17:
    v32 = v8;
LABEL_18:
    v33 = [v32 objectAtIndexedSubscript:v31];
    char v21 = [v33 isOn];
LABEL_19:

    goto LABEL_20;
  }
  if (v16)
  {
    uint64_t v17 = 0;
    while (1)
    {
      v18 = [v8 objectAtIndexedSubscript:v17];
      v19 = [v18 getDate];
      uint64_t v20 = [v19 compare:v12];

      if (v20 == 1) {
        break;
      }
      if (!v20)
      {
        v32 = v8;
        uint64_t v31 = v17;
        goto LABEL_18;
      }
      if ([v8 count] <= (unint64_t)++v17) {
        goto LABEL_11;
      }
    }
    if (v17)
    {
      LODWORD(v17) = v17 - 1;
      uint64_t v31 = v17;
      goto LABEL_17;
    }
    v33 = [v8 objectAtIndexedSubscript:v17];
    char v21 = [v33 isOn] ^ 1;
    LODWORD(v17) = -1;
    goto LABEL_19;
  }
LABEL_11:
  char v21 = 0;
  LODWORD(v17) = -1;
LABEL_20:
  v34 = 0;
  unint64_t v35 = (int)v17 + 1;
  double v11 = 0.0;
  while (1)
  {
    unint64_t v36 = [v8 count];
    BOOL v37 = v36 > v35;
    if (v36 <= v35) {
      goto LABEL_24;
    }
    v38 = [v8 objectAtIndexedSubscript:v35];
    v39 = [v38 getDate];

    if ([(NSDate *)v39 compare:v10] == NSOrderedAscending) {
      break;
    }
    v34 = v39;
LABEL_24:
    v39 = (NSDate *)v10;

    if (v21) {
      goto LABEL_25;
    }
LABEL_34:
    if (v37 || v35 == [v8 count] || self->_useBudget && self->_budgetRemaining <= 0.0) {
      goto LABEL_44;
    }
    v45 = [v8 objectAtIndexedSubscript:v35];
    char v21 = [v45 isOn];

    v34 = v39;
    ++v35;
    uint64_t v12 = v34;
  }
  BOOL v37 = 0;
  if ((v21 & 1) == 0) {
    goto LABEL_34;
  }
LABEL_25:
  [(NSDate *)v39 timeIntervalSinceDate:v12];
  if (!self->_useBudget)
  {
LABEL_33:
    [(NSDate *)v39 timeIntervalSinceDate:v12];
    double v11 = v11 + v44;
    goto LABEL_34;
  }
  if (v40 >= 0.0)
  {
    double v41 = self->_budgetRemaining;
    if (v40 <= v41)
    {
      double v43 = v41 - v40;
    }
    else
    {
      uint64_t v42 = [(NSDate *)v12 dateByAddingTimeInterval:self->_budgetRemaining];

      double v43 = 0.0;
      v39 = (NSDate *)v42;
    }
    self->_double budgetRemaining = v43;
    goto LABEL_33;
  }
  v47 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
    -[TADisplayOnCalculator calculateDisplayOnWithEvents:advertisements:endDate:](v47, v48, v49, v50, v51, v52, v53, v54);
  }
LABEL_44:
  v55 = *p_evaluatedUntil;
  *p_evaluatedUntil = v39;
  v56 = v39;

  id v9 = v59;
LABEL_45:

LABEL_46:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (TADisplayOnCalculator *)a3;
  if (self == v5)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      BOOL v7 = [(TADisplayOnCalculator *)self useBudget];
      if (v7 != [(TADisplayOnCalculator *)v6 useBudget]
        || ([(TADisplayOnCalculator *)self budgetRemaining],
            double v9 = v8,
            [(TADisplayOnCalculator *)v6 budgetRemaining],
            v9 != v10))
      {
        char v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
      double v11 = [(TADisplayOnCalculator *)self startTime];
      uint64_t v12 = [(TADisplayOnCalculator *)v6 startTime];
      if (v11 != v12)
      {
        uint64_t v13 = [(TADisplayOnCalculator *)self startTime];
        v3 = [(TADisplayOnCalculator *)v6 startTime];
        if (![v13 isEqual:v3])
        {
          char v14 = 0;
LABEL_16:

LABEL_17:
          goto LABEL_18;
        }
        char v21 = v13;
      }
      uint64_t v15 = [(TADisplayOnCalculator *)self evaluatedUntil];
      uint64_t v16 = [(TADisplayOnCalculator *)v6 evaluatedUntil];
      if (v15 == (void *)v16)
      {

        char v14 = 1;
      }
      else
      {
        uint64_t v17 = (void *)v16;
        v18 = [(TADisplayOnCalculator *)self evaluatedUntil];
        v19 = [(TADisplayOnCalculator *)v6 evaluatedUntil];
        char v14 = [v18 isEqual:v19];
      }
      uint64_t v13 = v21;
      if (v11 == v12) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    char v14 = 0;
  }
LABEL_19:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TADisplayOnCalculator)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TADisplayOnCalculator;
  id v5 = [(TADisplayOnCalculator *)&v12 init];
  if (v5)
  {
    v5->_useBudget = [v4 decodeBoolForKey:@"UseBudget"];
    [v4 decodeDoubleForKey:@"BudgetRemaining"];
    v5->_double budgetRemaining = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StartTime"];
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EvalUntil"];
    evaluatedUntil = v5->_evaluatedUntil;
    v5->_evaluatedUntil = (NSDate *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL useBudget = self->_useBudget;
  id v5 = a3;
  [v5 encodeBool:useBudget forKey:@"UseBudget"];
  [v5 encodeDouble:@"BudgetRemaining" forKey:self->_budgetRemaining];
  [v5 encodeObject:self->_startTime forKey:@"StartTime"];
  [v5 encodeObject:self->_evaluatedUntil forKey:@"EvalUntil"];
}

- (NSDate)evaluatedUntil
{
  return self->_evaluatedUntil;
}

- (BOOL)useBudget
{
  return self->_useBudget;
}

- (void)setUseBudget:(BOOL)a3
{
  self->_BOOL useBudget = a3;
}

- (double)budgetRemaining
{
  return self->_budgetRemaining;
}

- (void)setBudgetRemaining:(double)a3
{
  self->_double budgetRemaining = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_evaluatedUntil, 0);
}

- (void)completeDisplayOnWithEndDate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)calculateDisplayOnWithEvents:(uint64_t)a3 advertisements:(uint64_t)a4 endDate:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)calculateDisplayOnWithEvents:(uint64_t)a3 advertisements:(uint64_t)a4 endDate:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end