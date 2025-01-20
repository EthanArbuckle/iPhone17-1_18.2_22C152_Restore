@interface FCDateRange
+ (BOOL)supportsSecureCoding;
+ (FCDateRange)dateRangeWithEarlierDate:(id)a3 laterDate:(id)a4;
+ (FCDateRange)dateRangeWithStartDate:(id)a3 endDate:(id)a4;
- (BOOL)containsDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinite;
- (BOOL)isFromInfinity;
- (BOOL)isToInfinity;
- (BOOL)isWithinTimeInterval:(double)a3 ofDateRange:(id)a4;
- (BOOL)startsLaterThanDateRange:(id)a3;
- (FCDateRange)init;
- (FCDateRange)initWithCoder:(id)a3;
- (FCDateRange)initWithEarlierDate:(id)a3 laterDate:(id)a4;
- (FCDateRange)initWithStartDate:(id)a3 endDate:(id)a4;
- (FCDateRange)initWithStartDate:(id)a3 timeInterval:(double)a4;
- (NSDate)earlierDate;
- (NSDate)endDate;
- (NSDate)laterDate;
- (NSDate)startDate;
- (double)absoluteTimeInterval;
- (double)timeInterval;
- (id)description;
- (id)intersectionWithDateRange:(id)a3;
- (id)sliceForDate:(id)a3 withInterval:(double)a4;
- (id)slicesWithTimeInterval:(double)a3;
- (id)timestampDescription;
- (int64_t)compare:(id)a3;
- (int64_t)sliceIndexForDate:(id)a3 withInterval:(double)a4;
- (unint64_t)hash;
- (unint64_t)maxMillisecondsTimeIntervalSince1970;
- (unint64_t)minMillisecondsTimeIntervalSince1970;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCDateRange

- (FCDateRange)initWithEarlierDate:(id)a3 laterDate:(id)a4
{
  return [(FCDateRange *)self initWithStartDate:a4 endDate:a3];
}

- (NSDate)earlierDate
{
  uint64_t v3 = [(FCDateRange *)self startDate];
  if (v3
    && (v4 = (void *)v3,
        [(FCDateRange *)self endDate],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [(FCDateRange *)self startDate];
    v7 = [(FCDateRange *)self endDate];
    v8 = [v6 earlierDate:v7];
  }
  else
  {
    v9 = [(FCDateRange *)self startDate];

    if (v9) {
      [(FCDateRange *)self startDate];
    }
    else {
    v8 = [(FCDateRange *)self endDate];
    }
  }
  return (NSDate *)v8;
}

- (NSDate)laterDate
{
  uint64_t v3 = [(FCDateRange *)self startDate];
  if (v3
    && (v4 = (void *)v3,
        [(FCDateRange *)self endDate],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [(FCDateRange *)self startDate];
    v7 = [(FCDateRange *)self endDate];
    v8 = [v6 laterDate:v7];
  }
  else
  {
    v9 = [(FCDateRange *)self startDate];

    if (v9) {
      [(FCDateRange *)self startDate];
    }
    else {
    v8 = [(FCDateRange *)self endDate];
    }
  }
  return (NSDate *)v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (FCDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCDateRange;
  v9 = [(FCDateRange *)&v12 init];
  if (v9)
  {
    if (v7 && v8 && [v7 compare:v8] == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)[[NSString alloc] initWithFormat:@"Tried to create a date range with a startDate %@ earlier than the endDate %@", v7, v8];
        *(_DWORD *)buf = 136315906;
        v14 = "-[FCDateRange initWithStartDate:endDate:]";
        __int16 v15 = 2080;
        v16 = "FCDateRange.m";
        __int16 v17 = 1024;
        int v18 = 43;
        __int16 v19 = 2114;
        v20 = v11;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      v9 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v9->_startDate, a3);
      objc_storeStrong((id *)&v9->_endDate, a4);
    }
  }

  return v9;
}

- (BOOL)isToInfinity
{
  v2 = [(FCDateRange *)self endDate];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)isFromInfinity
{
  v2 = [(FCDateRange *)self startDate];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)isFinite
{
  if ([(FCDateRange *)self isFromInfinity]) {
    return 0;
  }
  else {
    return ![(FCDateRange *)self isToInfinity];
  }
}

- (double)absoluteTimeInterval
{
  if (![(FCDateRange *)self isFinite]) {
    return 1.79769313e308;
  }
  BOOL v3 = [(FCDateRange *)self endDate];
  v4 = [(FCDateRange *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = fabs(v5);

  return v6;
}

+ (FCDateRange)dateRangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithStartDate:v7 endDate:v6];

  return (FCDateRange *)v8;
}

+ (FCDateRange)dateRangeWithEarlierDate:(id)a3 laterDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithEarlierDate:v7 laterDate:v6];

  return (FCDateRange *)v8;
}

- (FCDateRange)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCDateRange init]";
    __int16 v9 = 2080;
    v10 = "FCDateRange.m";
    __int16 v11 = 1024;
    int v12 = 29;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  double v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCDateRange init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCDateRange)initWithStartDate:(id)a3 timeInterval:(double)a4
{
  double v5 = fabs(a4);
  id v6 = a3;
  id v7 = objc_msgSend(v6, "fc_dateBySubtractingTimeInterval:", v5);
  id v8 = [(FCDateRange *)self initWithStartDate:v6 endDate:v7];

  return v8;
}

- (double)timeInterval
{
  if (![(FCDateRange *)self isFinite]) {
    return 1.79769313e308;
  }
  BOOL v3 = [(FCDateRange *)self endDate];
  uint64_t v4 = [(FCDateRange *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (unint64_t)minMillisecondsTimeIntervalSince1970
{
  v2 = [(FCDateRange *)self earlierDate];
  unint64_t v3 = objc_msgSend(v2, "fc_millisecondTimeIntervalSince1970");

  return v3;
}

- (unint64_t)maxMillisecondsTimeIntervalSince1970
{
  v2 = [(FCDateRange *)self laterDate];
  unint64_t v3 = objc_msgSend(v2, "fc_millisecondTimeIntervalSince1970");

  return v3;
}

- (BOOL)containsDate:(id)a3
{
  id v4 = a3;
  double v5 = [(FCDateRange *)self startDate];

  if (v5)
  {
    double v6 = [(FCDateRange *)self startDate];
    [v6 timeIntervalSince1970];
    double v8 = v7;
    [v4 timeIntervalSince1970];
    double v10 = v9;

    if (v8 < v10)
    {
LABEL_3:
      BOOL v11 = 0;
      goto LABEL_8;
    }
  }
  else if (!v4)
  {
    goto LABEL_3;
  }
  int v12 = [(FCDateRange *)self endDate];

  if (v12)
  {
    __int16 v13 = [(FCDateRange *)self endDate];
    [v13 timeIntervalSince1970];
    double v15 = v14;
    [v4 timeIntervalSince1970];
    BOOL v11 = v15 < v16;
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_8:

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4FBA8A8];
  double v6 = [(FCDateRange *)self endDate];
  double v7 = [v4 endDate];
  LODWORD(v5) = objc_msgSend(v5, "nf_object:isEqualToObject:", v6, v7);

  if (v5)
  {
    double v8 = (void *)MEMORY[0x1E4FBA8A8];
    double v9 = [(FCDateRange *)self startDate];
    double v10 = [v4 startDate];
    LOBYTE(v8) = objc_msgSend(v8, "nf_object:isEqualToObject:", v9, v10);

    if (v8)
    {
      int64_t v11 = 0;
      goto LABEL_16;
    }
    uint64_t v20 = [(FCDateRange *)self startDate];
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      v22 = [v4 startDate];

      if (v22)
      {
        double v15 = [(FCDateRange *)self startDate];
        uint64_t v16 = [v4 startDate];
        goto LABEL_11;
      }
    }
    v24 = [(FCDateRange *)self startDate];

    BOOL v18 = v24 == 0;
    uint64_t v19 = 1;
  }
  else
  {
    uint64_t v12 = [(FCDateRange *)self endDate];
    if (v12)
    {
      __int16 v13 = (void *)v12;
      double v14 = [v4 endDate];

      if (v14)
      {
        double v15 = [(FCDateRange *)self endDate];
        uint64_t v16 = [v4 endDate];
LABEL_11:
        v23 = (void *)v16;
        int64_t v11 = [v15 compare:v16];

        goto LABEL_16;
      }
    }
    __int16 v17 = [(FCDateRange *)self endDate];

    BOOL v18 = v17 == 0;
    uint64_t v19 = -1;
  }
  if (v18) {
    int64_t v11 = v19;
  }
  else {
    int64_t v11 = -v19;
  }
LABEL_16:

  return v11;
}

- (BOOL)isWithinTimeInterval:(double)a3 ofDateRange:(id)a4
{
  id v6 = a4;
  double v7 = [(FCDateRange *)self startDate];
  double v8 = [v6 startDate];
  if (objc_msgSend(v7, "fc_isWithinTimeInterval:ofDate:", v8, a3))
  {
    double v9 = [(FCDateRange *)self endDate];
    double v10 = [v6 endDate];
    char v11 = objc_msgSend(v9, "fc_isWithinTimeInterval:ofDate:", v10, a3);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)startsLaterThanDateRange:(id)a3
{
  id v4 = a3;
  double v5 = [(FCDateRange *)self startDate];
  id v6 = [v4 startDate];

  LOBYTE(v4) = objc_msgSend(v5, "fc_isLaterThan:", v6);
  return (char)v4;
}

- (id)slicesWithTimeInterval:(double)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__FCDateRange_slicesWithTimeInterval___block_invoke;
  v5[3] = &unk_1E5B59A48;
  *(double *)&v5[5] = a3;
  v5[4] = self;
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v5);
  return v3;
}

void __38__FCDateRange_slicesWithTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (uint64_t)*(double *)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) startDate];
  [v5 timeIntervalSince1970];
  uint64_t v7 = vcvtmd_s64_f64(v6);

  double v8 = [*(id *)(a1 + 32) endDate];
  [v8 timeIntervalSince1970];
  uint64_t v10 = vcvtmd_s64_f64(v9);

  if (objc_msgSend(*(id *)(a1 + 32), "isFinite", MEMORY[0x1E4F143A8], 3221225472, __38__FCDateRange_slicesWithTimeInterval___block_invoke_2, &unk_1E5B59A20, *(void *)(a1 + 32))&& (v7 - v10 > v4 || v10 % v4 > v7 % v4))
  {
    if (v7 > v10)
    {
      uint64_t v11 = v7 / v4 * v4;
      do
      {
        uint64_t v12 = v11;
        __int16 v13 = [FCDateRange alloc];
        double v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v7];
        double v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v12];
        uint64_t v16 = [(FCDateRange *)v13 initWithStartDate:v14 endDate:v15];
        [v3 addObject:v16];

        uint64_t v11 = v12 - v4;
        if (v12 - v4 <= v10) {
          uint64_t v11 = v10;
        }
        uint64_t v7 = v12;
      }
      while (v12 > v10);
    }
  }
  else
  {
    [v3 addObject:*(void *)(a1 + 32)];
  }
}

BOOL __38__FCDateRange_slicesWithTimeInterval___block_invoke_2(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isFinite]) {
    return 1;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  return v2 - v3 <= v4 && v3 % v4 <= v2 % v4;
}

- (id)sliceForDate:(id)a3 withInterval:(double)a4
{
  id v6 = a3;
  BOOL v7 = [(FCDateRange *)self containsDate:v6];
  if (a4 <= 0.0 || !v7)
  {
    v22 = 0;
  }
  else
  {
    double v9 = [(FCDateRange *)self startDate];
    [v9 timeIntervalSince1970];
    double v11 = v10;
    [v6 timeIntervalSince1970];
    double v13 = v11 - v12;

    unint64_t v14 = vcvtmd_s64_f64(v13 / a4) + 1;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __41__FCDateRange_sliceForDate_withInterval___block_invoke;
    v24[3] = &unk_1E5B59A70;
    double v15 = -((double)(uint64_t)floor(v13 / a4) * a4);
    v24[4] = self;
    v24[5] = v14;
    *(double *)&v24[6] = a4;
    double v16 = __41__FCDateRange_sliceForDate_withInterval___block_invoke((uint64_t)v24);
    __int16 v17 = [FCDateRange alloc];
    BOOL v18 = [(FCDateRange *)self startDate];
    uint64_t v19 = [v18 dateByAddingTimeInterval:v15];
    uint64_t v20 = [(FCDateRange *)self startDate];
    uint64_t v21 = [v20 dateByAddingTimeInterval:v16];
    v22 = [(FCDateRange *)v17 initWithStartDate:v19 endDate:v21];
  }
  return v22;
}

double __41__FCDateRange_sliceForDate_withInterval___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) endDate];

  double v3 = -(*(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 40));
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) endDate];
    [v4 timeIntervalSince1970];
    double v6 = v5;
    BOOL v7 = [*(id *)(a1 + 32) startDate];
    [v7 timeIntervalSince1970];
    double v9 = v6 - v8;

    if (v3 < v9) {
      return v9;
    }
  }
  return v3;
}

- (int64_t)sliceIndexForDate:(id)a3 withInterval:(double)a4
{
  id v6 = a3;
  BOOL v7 = [(FCDateRange *)self containsDate:v6];
  if (a4 <= 0.0 || !v7)
  {
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    double v9 = [(FCDateRange *)self startDate];
    [v9 timeIntervalSince1970];
    double v11 = v10;
    [v6 timeIntervalSince1970];
    int64_t v13 = vcvtmd_s64_f64((v11 - v12) / a4);
  }
  return v13;
}

- (id)intersectionWithDateRange:(id)a3
{
  id v4 = a3;
  if (-[FCDateRange isFromInfinity](self, "isFromInfinity") && ([v4 isFromInfinity] & 1) != 0)
  {
    double v5 = 0;
  }
  else if ([(FCDateRange *)self isFromInfinity])
  {
    double v5 = [v4 startDate];
  }
  else
  {
    char v6 = [v4 isFromInfinity];
    double v5 = [(FCDateRange *)self startDate];
    if ((v6 & 1) == 0)
    {
      BOOL v7 = [v4 startDate];
      uint64_t v8 = [v5 earlierDate:v7];

      double v5 = (void *)v8;
    }
  }
  if (-[FCDateRange isToInfinity](self, "isToInfinity") && ([v4 isToInfinity] & 1) != 0)
  {
    double v9 = 0;
  }
  else if ([(FCDateRange *)self isToInfinity])
  {
    double v9 = [v4 endDate];
  }
  else
  {
    char v10 = [v4 isToInfinity];
    double v9 = [(FCDateRange *)self endDate];
    if ((v10 & 1) == 0)
    {
      double v11 = [v4 endDate];
      uint64_t v12 = [v9 laterDate:v11];

      double v9 = (void *)v12;
    }
  }
  if (objc_msgSend(v9, "fc_isLaterThan:", v5))
  {
    id v13 = v5;

    double v9 = v13;
  }
  unint64_t v14 = +[FCDateRange dateRangeWithStartDate:v5 endDate:v9];

  return v14;
}

- (id)description
{
  if (qword_1EB5D19D0 != -1) {
    dispatch_once(&qword_1EB5D19D0, &__block_literal_global_147);
  }
  if ([(FCDateRange *)self isFinite])
  {
    double v3 = NSString;
    id v4 = (void *)_MergedGlobals_203;
    double v5 = [(FCDateRange *)self startDate];
    char v6 = [v4 stringFromDate:v5];
    BOOL v7 = (void *)_MergedGlobals_203;
    uint64_t v8 = [(FCDateRange *)self endDate];
    double v9 = [v7 stringFromDate:v8];
    char v10 = [v3 stringWithFormat:@"<%@ to %@>", v6, v9];

LABEL_10:
    goto LABEL_11;
  }
  double v11 = [(FCDateRange *)self startDate];

  if (v11)
  {
    uint64_t v12 = NSString;
    id v13 = (void *)_MergedGlobals_203;
    double v5 = [(FCDateRange *)self startDate];
    char v6 = [v13 stringFromDate:v5];
    [v12 stringWithFormat:@"<Infinite from %@>", v6];
LABEL_9:
    char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  unint64_t v14 = [(FCDateRange *)self endDate];

  if (v14)
  {
    double v15 = NSString;
    double v16 = (void *)_MergedGlobals_203;
    double v5 = [(FCDateRange *)self endDate];
    char v6 = [v16 stringFromDate:v5];
    [v15 stringWithFormat:@"<Infinite to %@>", v6];
    goto LABEL_9;
  }
  char v10 = @"<Empty>";
LABEL_11:
  return v10;
}

uint64_t __26__FCDateRange_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_203;
  _MergedGlobals_203 = (uint64_t)v0;

  uint64_t v2 = (void *)_MergedGlobals_203;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (id)timestampDescription
{
  double v3 = [(FCDateRange *)self startDate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  char v6 = v5;

  BOOL v7 = [(FCDateRange *)self endDate];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  char v10 = v9;

  [v6 timeIntervalSince1970];
  unint64_t v12 = (unint64_t)(v11 * 1000.0);
  [v10 timeIntervalSince1970];
  unint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu", v12, (unint64_t)(v13 * 1000.0));

  return v14;
}

- (unint64_t)hash
{
  double v3 = [(FCDateRange *)self startDate];
  uint64_t v4 = [v3 hash];
  id v5 = [(FCDateRange *)self endDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCDateRange *)self startDate];
  uint64_t v6 = [v4 startDate];
  if (v5 | v6 && ![(id)v5 isEqualToDate:v6])
  {
    char v9 = 0;
  }
  else
  {
    uint64_t v7 = [(FCDateRange *)self endDate];
    uint64_t v8 = [v4 endDate];
    if (v7 | v8) {
      char v9 = [(id)v7 isEqualToDate:v8];
    }
    else {
      char v9 = 1;
    }
  }
  return v9;
}

- (FCDateRange)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"startDate"])
  {
    uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([v4 containsValueForKey:@"endDate"])
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(FCDateRange *)self initWithStartDate:v5 endDate:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(FCDateRange *)self startDate];

  if (v4)
  {
    uint64_t v5 = [(FCDateRange *)self startDate];
    [v8 encodeObject:v5 forKey:@"startDate"];
  }
  uint64_t v6 = [(FCDateRange *)self endDate];

  if (v6)
  {
    uint64_t v7 = [(FCDateRange *)self endDate];
    [v8 encodeObject:v7 forKey:@"endDate"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end