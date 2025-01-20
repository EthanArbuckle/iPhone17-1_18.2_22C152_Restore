@interface COSWristModelTranslator
+ (id)translatorWithBeamBridgeMultiArray:(id)a3;
+ (id)translatorWithMultiArray:(id)a3;
- (COSWristAttributeConfidences)confidences;
- (COSWristModelTranslator)translatorWithBeamBridgeMultiArray:(id)a3;
- (double)dock;
- (double)invalidValue;
- (double)leftWristLeftCrownValue;
- (double)leftWristRightCrownValue;
- (double)noneValue;
- (double)palm;
- (double)rightWristLeftCrownValue;
- (double)rightWristRightCrownValue;
- (void)setConfidences:(id)a3;
- (void)translateMultiArray:(id)a3;
@end

@implementation COSWristModelTranslator

+ (id)translatorWithMultiArray:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(COSWristModelTranslator);
  [(COSWristModelTranslator *)v4 translateMultiArray:v3];

  return v4;
}

- (void)translateMultiArray:(id)a3
{
  id v4 = a3;
  if ([v4 count] == (id)6)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    [v5 doubleValue];
    self->_noneValue = v6;

    v7 = [v4 objectAtIndexedSubscript:2];
    [v7 doubleValue];
    self->_invalidValue = v8;

    v9 = [v4 objectAtIndexedSubscript:1];
    [v9 doubleValue];
    self->_leftWristRightCrownValue = v10;

    v11 = [v4 objectAtIndexedSubscript:4];
    [v11 doubleValue];
    self->_leftWristLeftCrownValue = v12;

    v13 = [v4 objectAtIndexedSubscript:3];
    [v13 doubleValue];
    self->_rightWristRightCrownValue = v14;

    v15 = [v4 objectAtIndexedSubscript:5];
    [v15 doubleValue];
    self->_rightWristLeftCrownValue = v16;
LABEL_5:

    goto LABEL_9;
  }
  if ([v4 count] == (id)8)
  {
    v17 = [v4 objectAtIndexedSubscript:0];
    [v17 doubleValue];
    self->_noneValue = v18;

    v19 = [v4 objectAtIndexedSubscript:2];
    [v19 doubleValue];
    self->_invalidValue = v20;

    v21 = [v4 objectAtIndexedSubscript:1];
    [v21 doubleValue];
    self->_leftWristRightCrownValue = v22;

    v23 = [v4 objectAtIndexedSubscript:6];
    [v23 doubleValue];
    self->_leftWristLeftCrownValue = v24;

    v25 = [v4 objectAtIndexedSubscript:3];
    [v25 doubleValue];
    self->_rightWristRightCrownValue = v26;

    v27 = [v4 objectAtIndexedSubscript:7];
    [v27 doubleValue];
    self->_rightWristLeftCrownValue = v28;

    v29 = [v4 objectAtIndexedSubscript:4];
    [v29 doubleValue];
    self->_dock = v30;

    v15 = [v4 objectAtIndexedSubscript:5];
    [v15 doubleValue];
    self->_palm = v31;
    goto LABEL_5;
  }
  v32 = pbb_setupflow_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_100172AB0(v32);
  }

LABEL_9:
}

- (COSWristModelTranslator)translatorWithBeamBridgeMultiArray:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectAtIndexedSubscript:4];
  [v5 doubleValue];
  self->_noneValue = v6;

  v7 = [v4 objectAtIndexedSubscript:0];
  [v7 doubleValue];
  self->_invalidValue = v8;

  v9 = [v4 objectAtIndexedSubscript:3];
  [v9 doubleValue];
  self->_leftWristRightCrownValue = v10;

  v11 = [v4 objectAtIndexedSubscript:2];
  [v11 doubleValue];
  self->_leftWristLeftCrownValue = v12;

  v13 = [v4 objectAtIndexedSubscript:7];
  [v13 doubleValue];
  self->_rightWristRightCrownValue = v14;

  v15 = [v4 objectAtIndexedSubscript:6];
  [v15 doubleValue];
  self->_rightWristLeftCrownValue = v16;

  v17 = [v4 objectAtIndexedSubscript:1];
  [v17 doubleValue];
  self->_dock = v18;

  id v21 = [v4 objectAtIndexedSubscript:5];

  [v21 doubleValue];
  self->_palm = v19;

  return result;
}

+ (id)translatorWithBeamBridgeMultiArray:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(COSWristModelTranslator);
  [(COSWristModelTranslator *)v4 translatorWithBeamBridgeMultiArray:v3];

  return v4;
}

- (COSWristAttributeConfidences)confidences
{
  confidences = self->_confidences;
  if (!confidences)
  {
    id v4 = [COSWristAttributeConfidences alloc];
    v5 = +[NSDate date];
    [v5 timeIntervalSinceReferenceDate];
    double v6 = -[COSWristAttributeConfidences initWithObservationTime:none:invalid:lr:ll:rr:rl:palm:dock:](v4, "initWithObservationTime:none:invalid:lr:ll:rr:rl:palm:dock:", *(void *)&self->_dock);

    v7 = self->_confidences;
    self->_confidences = v6;

    confidences = self->_confidences;
  }

  return confidences;
}

- (double)noneValue
{
  return self->_noneValue;
}

- (double)invalidValue
{
  return self->_invalidValue;
}

- (double)leftWristRightCrownValue
{
  return self->_leftWristRightCrownValue;
}

- (double)rightWristRightCrownValue
{
  return self->_rightWristRightCrownValue;
}

- (double)leftWristLeftCrownValue
{
  return self->_leftWristLeftCrownValue;
}

- (double)rightWristLeftCrownValue
{
  return self->_rightWristLeftCrownValue;
}

- (double)dock
{
  return self->_dock;
}

- (double)palm
{
  return self->_palm;
}

- (void)setConfidences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end