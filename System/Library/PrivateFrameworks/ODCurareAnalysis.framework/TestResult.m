@interface TestResult
- (BOOL)testRan;
- (NSDate)maxTimestamp;
- (NSDate)minTimestamp;
- (NSNumber)pValue;
- (NSNumber)rejectNullHypothesis;
- (NSString)testSkippedReason;
- (TestResult)initWithTestRan:(BOOL)a3 testSkippedReason:(id)a4 pValue:(id)a5 rejectNullHypothesis:(id)a6 sampleSize:(int64_t)a7 numSuccesses:(int64_t)a8 minTimestamp:(id)a9 maxTimestamp:(id)a10;
- (id)description;
- (int64_t)numSuccesses;
- (int64_t)sampleSize;
- (void)setMaxTimestamp:(id)a3;
- (void)setMinTimestamp:(id)a3;
- (void)setNumSuccesses:(int64_t)a3;
- (void)setPValue:(id)a3;
- (void)setRejectNullHypothesis:(id)a3;
- (void)setSampleSize:(int64_t)a3;
- (void)setTestRan:(BOOL)a3;
- (void)setTestSkippedReason:(id)a3;
@end

@implementation TestResult

- (TestResult)initWithTestRan:(BOOL)a3 testSkippedReason:(id)a4 pValue:(id)a5 rejectNullHypothesis:(id)a6 sampleSize:(int64_t)a7 numSuccesses:(int64_t)a8 minTimestamp:(id)a9 maxTimestamp:(id)a10
{
  BOOL v14 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  v24.receiver = self;
  v24.super_class = (Class)TestResult;
  v21 = [(TestResult *)&v24 init];
  v22 = v21;
  if (v21)
  {
    [(TestResult *)v21 setTestRan:v14];
    [(TestResult *)v22 setTestSkippedReason:v16];
    [(TestResult *)v22 setPValue:v17];
    [(TestResult *)v22 setRejectNullHypothesis:v18];
    [(TestResult *)v22 setSampleSize:a7];
    [(TestResult *)v22 setNumSuccesses:a8];
    [(TestResult *)v22 setMinTimestamp:v19];
    [(TestResult *)v22 setMaxTimestamp:v20];
  }

  return v22;
}

- (id)description
{
  v3 = NSString;
  v4 = [(TestResult *)self pValue];
  [v4 doubleValue];
  objc_msgSend(v3, "stringWithFormat:", @"%f", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = [(TestResult *)self pValue];

  if (!v7)
  {

    v6 = @"(null)";
  }
  v8 = NSString;
  v9 = [(TestResult *)self rejectNullHypothesis];
  objc_msgSend(v8, "stringWithFormat:", @"%d", objc_msgSend(v9, "BOOLValue"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v11 = [(TestResult *)self rejectNullHypothesis];

  if (!v11)
  {

    v10 = @"(null)";
  }
  v12 = NSString;
  BOOL v13 = [(TestResult *)self testRan];
  BOOL v14 = [(TestResult *)self testSkippedReason];
  int64_t v15 = [(TestResult *)self sampleSize];
  int64_t v16 = [(TestResult *)self numSuccesses];
  id v17 = [(TestResult *)self minTimestamp];
  id v18 = [(TestResult *)self maxTimestamp];
  id v19 = [v12 stringWithFormat:@"TestResult:\n testRan=%d\n testSkippedReason=%@\n pValue=%@\n rejectNullHypothesis=%@\n sampleSize=%ld\n numSuccesses=%ld\n minTimestamp=%@\n maxTimestamp=%@", v13, v14, v6, v10, v15, v16, v17, v18];

  return v19;
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

- (NSNumber)pValue
{
  return self->_pValue;
}

- (void)setPValue:(id)a3
{
}

- (NSNumber)rejectNullHypothesis
{
  return self->_rejectNullHypothesis;
}

- (void)setRejectNullHypothesis:(id)a3
{
}

- (int64_t)sampleSize
{
  return self->_sampleSize;
}

- (void)setSampleSize:(int64_t)a3
{
  self->_sampleSize = a3;
}

- (int64_t)numSuccesses
{
  return self->_numSuccesses;
}

- (void)setNumSuccesses:(int64_t)a3
{
  self->_numSuccesses = a3;
}

- (NSDate)minTimestamp
{
  return self->_minTimestamp;
}

- (void)setMinTimestamp:(id)a3
{
}

- (NSDate)maxTimestamp
{
  return self->_maxTimestamp;
}

- (void)setMaxTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTimestamp, 0);
  objc_storeStrong((id *)&self->_minTimestamp, 0);
  objc_storeStrong((id *)&self->_rejectNullHypothesis, 0);
  objc_storeStrong((id *)&self->_pValue, 0);
  objc_storeStrong((id *)&self->_testSkippedReason, 0);
}

@end