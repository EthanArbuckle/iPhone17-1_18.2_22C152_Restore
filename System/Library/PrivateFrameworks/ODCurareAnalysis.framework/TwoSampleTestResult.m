@interface TwoSampleTestResult
- (BOOL)testRan;
- (NSDate)maxTimestamp1;
- (NSDate)maxTimestamp2;
- (NSDate)minTimestamp1;
- (NSDate)minTimestamp2;
- (NSNumber)rejectNullHypothesis;
- (NSNumber)testStatistic;
- (NSString)testSkippedReason;
- (TwoSampleTestResult)initWithTestRan:(BOOL)a3 testSkippedReason:(id)a4 testStatistic:(id)a5 rejectNullHypothesis:(id)a6 sampleSize1:(int64_t)a7 numSuccesses1:(int64_t)a8 minTimestamp1:(id)a9 maxTimestamp1:(id)a10 sampleSize2:(int64_t)a11 numSuccesses2:(int64_t)a12 minTimestamp2:(id)a13 maxTimestamp2:(id)a14;
- (id)description;
- (int64_t)numSuccesses1;
- (int64_t)numSuccesses2;
- (int64_t)sampleSize1;
- (int64_t)sampleSize2;
- (void)setMaxTimestamp1:(id)a3;
- (void)setMaxTimestamp2:(id)a3;
- (void)setMinTimestamp1:(id)a3;
- (void)setMinTimestamp2:(id)a3;
- (void)setNumSuccesses1:(int64_t)a3;
- (void)setNumSuccesses2:(int64_t)a3;
- (void)setRejectNullHypothesis:(id)a3;
- (void)setSampleSize1:(int64_t)a3;
- (void)setSampleSize2:(int64_t)a3;
- (void)setTestRan:(BOOL)a3;
- (void)setTestSkippedReason:(id)a3;
- (void)setTestStatistic:(id)a3;
@end

@implementation TwoSampleTestResult

- (TwoSampleTestResult)initWithTestRan:(BOOL)a3 testSkippedReason:(id)a4 testStatistic:(id)a5 rejectNullHypothesis:(id)a6 sampleSize1:(int64_t)a7 numSuccesses1:(int64_t)a8 minTimestamp1:(id)a9 maxTimestamp1:(id)a10 sampleSize2:(int64_t)a11 numSuccesses2:(int64_t)a12 minTimestamp2:(id)a13 maxTimestamp2:(id)a14
{
  BOOL v17 = a3;
  id v29 = a4;
  id v28 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  id v22 = a13;
  id v23 = a14;
  v30.receiver = self;
  v30.super_class = (Class)TwoSampleTestResult;
  v24 = [(TwoSampleTestResult *)&v30 init];
  v25 = v24;
  if (v24)
  {
    [(TwoSampleTestResult *)v24 setTestRan:v17];
    [(TwoSampleTestResult *)v25 setTestSkippedReason:v29];
    [(TwoSampleTestResult *)v25 setTestStatistic:v28];
    [(TwoSampleTestResult *)v25 setRejectNullHypothesis:v19];
    [(TwoSampleTestResult *)v25 setSampleSize1:a7];
    [(TwoSampleTestResult *)v25 setNumSuccesses1:a8];
    [(TwoSampleTestResult *)v25 setMinTimestamp1:v20];
    [(TwoSampleTestResult *)v25 setMaxTimestamp1:v21];
    [(TwoSampleTestResult *)v25 setSampleSize2:a11];
    [(TwoSampleTestResult *)v25 setNumSuccesses2:a12];
    [(TwoSampleTestResult *)v25 setMinTimestamp2:v22];
    [(TwoSampleTestResult *)v25 setMaxTimestamp2:v23];
  }

  return v25;
}

- (id)description
{
  v3 = NSString;
  v4 = [(TwoSampleTestResult *)self testStatistic];
  [v4 doubleValue];
  objc_msgSend(v3, "stringWithFormat:", @"%f", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = [(TwoSampleTestResult *)self testStatistic];

  if (!v7)
  {

    v6 = @"(null)";
  }
  v8 = NSString;
  v9 = [(TwoSampleTestResult *)self rejectNullHypothesis];
  objc_msgSend(v8, "stringWithFormat:", @"%d", objc_msgSend(v9, "BOOLValue"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v11 = [(TwoSampleTestResult *)self rejectNullHypothesis];

  v25 = v6;
  if (!v11)
  {

    v10 = @"(null)";
  }
  v24 = NSString;
  BOOL v23 = [(TwoSampleTestResult *)self testRan];
  v12 = [(TwoSampleTestResult *)self testSkippedReason];
  int64_t v13 = [(TwoSampleTestResult *)self sampleSize1];
  int64_t v14 = [(TwoSampleTestResult *)self numSuccesses1];
  v15 = [(TwoSampleTestResult *)self minTimestamp1];
  v16 = [(TwoSampleTestResult *)self maxTimestamp1];
  int64_t v17 = [(TwoSampleTestResult *)self sampleSize2];
  int64_t v18 = [(TwoSampleTestResult *)self numSuccesses2];
  id v19 = [(TwoSampleTestResult *)self minTimestamp2];
  id v20 = [(TwoSampleTestResult *)self maxTimestamp2];
  id v21 = [v24 stringWithFormat:@"TwoSampleTestResult:\n testRan=%d\n testSkippedReason=%@\n testStatistic=%@\n rejectNullHypothesis=%@\n sampleSize1=%ld\n numSuccesses1=%ld\n minTimestamp1=%@\n maxTimestamp1=%@\n sampleSize2=%ld\n numSuccesses2=%ld\n minTimestamp2=%@\n maxTimestamp2=%@\n", v23, v12, v25, v10, v13, v14, v15, v16, v17, v18, v19, v20];

  return v21;
}

- (BOOL)testRan
{
  return self->_testRan;
}

- (void)setTestRan:(BOOL)a3
{
  self->_testRan = a3;
}

- (NSString)testSkippedReason
{
  return self->_testSkippedReason;
}

- (void)setTestSkippedReason:(id)a3
{
}

- (NSNumber)testStatistic
{
  return self->_testStatistic;
}

- (void)setTestStatistic:(id)a3
{
}

- (NSNumber)rejectNullHypothesis
{
  return self->_rejectNullHypothesis;
}

- (void)setRejectNullHypothesis:(id)a3
{
}

- (int64_t)sampleSize1
{
  return self->_sampleSize1;
}

- (void)setSampleSize1:(int64_t)a3
{
  self->_sampleSize1 = a3;
}

- (int64_t)numSuccesses1
{
  return self->_numSuccesses1;
}

- (void)setNumSuccesses1:(int64_t)a3
{
  self->_numSuccesses1 = a3;
}

- (NSDate)minTimestamp1
{
  return self->_minTimestamp1;
}

- (void)setMinTimestamp1:(id)a3
{
}

- (NSDate)maxTimestamp1
{
  return self->_maxTimestamp1;
}

- (void)setMaxTimestamp1:(id)a3
{
}

- (int64_t)sampleSize2
{
  return self->_sampleSize2;
}

- (void)setSampleSize2:(int64_t)a3
{
  self->_sampleSize2 = a3;
}

- (int64_t)numSuccesses2
{
  return self->_numSuccesses2;
}

- (void)setNumSuccesses2:(int64_t)a3
{
  self->_numSuccesses2 = a3;
}

- (NSDate)minTimestamp2
{
  return self->_minTimestamp2;
}

- (void)setMinTimestamp2:(id)a3
{
}

- (NSDate)maxTimestamp2
{
  return self->_maxTimestamp2;
}

- (void)setMaxTimestamp2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTimestamp2, 0);
  objc_storeStrong((id *)&self->_minTimestamp2, 0);
  objc_storeStrong((id *)&self->_maxTimestamp1, 0);
  objc_storeStrong((id *)&self->_minTimestamp1, 0);
  objc_storeStrong((id *)&self->_rejectNullHypothesis, 0);
  objc_storeStrong((id *)&self->_testStatistic, 0);
  objc_storeStrong((id *)&self->_testSkippedReason, 0);
}

@end