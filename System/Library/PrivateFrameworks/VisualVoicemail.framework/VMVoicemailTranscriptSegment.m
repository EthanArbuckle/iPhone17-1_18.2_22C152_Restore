@interface VMVoicemailTranscriptSegment
+ (BOOL)supportsSecureCoding;
- (NSString)substring;
- (VMVoicemailTranscriptSegment)init;
- (VMVoicemailTranscriptSegment)initWithCoder:(id)a3;
- (VMVoicemailTranscriptSegment)initWithTranscriptionSegment:(id)a3 confidenceThreshold:(float)a4;
- (_NSRange)substringRange;
- (double)duration;
- (double)timestamp;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)confidenceRating;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceRating:(unint64_t)a3;
@end

@implementation VMVoicemailTranscriptSegment

- (VMVoicemailTranscriptSegment)init
{
  return 0;
}

- (VMVoicemailTranscriptSegment)initWithTranscriptionSegment:(id)a3 confidenceThreshold:(float)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VMVoicemailTranscriptSegment;
  v7 = [(VMVoicemailTranscriptSegment *)&v16 init];
  if (v7)
  {
    [v6 confidence];
    v7->_confidence = v8;
    uint64_t v9 = 3;
    if (v8 < a4) {
      uint64_t v9 = 1;
    }
    if (v8 == 0.0) {
      uint64_t v9 = 0;
    }
    v7->_confidenceRating = v9;
    [v6 duration];
    v7->_duration = v10;
    uint64_t v11 = [v6 substring];
    substring = v7->_substring;
    v7->_substring = (NSString *)v11;

    v7->_substringRange.location = [v6 substringRange];
    v7->_substringRange.length = v13;
    [v6 timestamp];
    v7->_timestamp = v14;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(VMVoicemailTranscriptSegment *)self confidence];
  *(_DWORD *)(v5 + 8) = v6;
  *(void *)(v5 + 40) = [(VMVoicemailTranscriptSegment *)self confidenceRating];
  [(VMVoicemailTranscriptSegment *)self duration];
  *(void *)(v5 + 24) = v7;
  float v8 = [(VMVoicemailTranscriptSegment *)self substring];
  uint64_t v9 = [v8 copyWithZone:a3];
  double v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  *(void *)(v5 + 48) = [(VMVoicemailTranscriptSegment *)self substringRange];
  *(void *)(v5 + 56) = v11;
  [(VMVoicemailTranscriptSegment *)self timestamp];
  *(void *)(v5 + 32) = v12;
  return (id)v5;
}

- (id)debugDescription
{
  v3 = (void *)MEMORY[0x263EFF910];
  [(VMVoicemailTranscriptSegment *)self timestamp];
  v4 = objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  uint64_t v5 = (void *)MEMORY[0x263F08D40];
  uint64_t v6 = [(VMVoicemailTranscriptSegment *)self substringRange];
  float v8 = objc_msgSend(v5, "valueWithRange:", v6, v7);
  uint64_t v9 = NSString;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = NSNumber;
  [(VMVoicemailTranscriptSegment *)self confidence];
  uint64_t v12 = objc_msgSend(v11, "numberWithFloat:");
  NSUInteger v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VMVoicemailTranscriptSegment confidenceRating](self, "confidenceRating"));
  double v14 = NSNumber;
  [(VMVoicemailTranscriptSegment *)self duration];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  objc_super v16 = [(VMVoicemailTranscriptSegment *)self substring];
  v17 = [v9 stringWithFormat:@"<%@ %p timestampDate=%@, confidence=%@, confidenceRating=%@, duration=%@, substring=%@, substringRange=%@>", v10, self, v4, v12, v13, v15, v16, v8];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float confidence = self->_confidence;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_confidence);
  *(float *)&double v7 = confidence;
  [v5 encodeFloat:v6 forKey:v7];

  unint64_t confidenceRating = self->_confidenceRating;
  uint64_t v9 = NSStringFromSelector(sel_confidenceRating);
  [v5 encodeInteger:confidenceRating forKey:v9];

  double duration = self->_duration;
  uint64_t v11 = NSStringFromSelector(sel_duration);
  [v5 encodeDouble:v11 forKey:duration];

  substring = self->_substring;
  NSUInteger v13 = NSStringFromSelector(sel_substring);
  [v5 encodeObject:substring forKey:v13];

  double v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_substringRange.location, self->_substringRange.length);
  v15 = NSStringFromSelector(sel_substringRange);
  [v5 encodeObject:v14 forKey:v15];

  double timestamp = self->_timestamp;
  NSStringFromSelector(sel_timestamp);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeDouble:v17 forKey:timestamp];
}

- (VMVoicemailTranscriptSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VMVoicemailTranscriptSegment;
  id v5 = [(VMVoicemailTranscriptSegment *)&v22 init];
  if (v5)
  {
    uint64_t v6 = NSStringFromSelector(sel_confidence);
    [v4 decodeFloatForKey:v6];
    v5->_float confidence = v7;

    float v8 = NSStringFromSelector(sel_confidenceRating);
    v5->_unint64_t confidenceRating = [v4 decodeIntegerForKey:v8];

    uint64_t v9 = NSStringFromSelector(sel_duration);
    [v4 decodeDoubleForKey:v9];
    v5->_double duration = v10;

    uint64_t v11 = NSStringFromSelector(sel_timestamp);
    [v4 decodeDoubleForKey:v11];
    v5->_double timestamp = v12;

    uint64_t v13 = objc_opt_class();
    double v14 = NSStringFromSelector(sel_substring);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    substring = v5->_substring;
    v5->_substring = (NSString *)v15;

    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_substringRange);
    v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    v5->_substringRange.location = [v19 rangeValue];
    v5->_substringRange.length = v20;
  }
  return v5;
}

- (NSString)substring
{
  return self->_substring;
}

- (_NSRange)substringRange
{
  NSUInteger length = self->_substringRange.length;
  NSUInteger location = self->_substringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (float)confidence
{
  return self->_confidence;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unint64_t)confidenceRating
{
  return self->_confidenceRating;
}

- (void)setConfidenceRating:(unint64_t)a3
{
  self->_unint64_t confidenceRating = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C797000, a2, OS_LOG_TYPE_ERROR, "Decoding timestamp as a double failed due to the following exception: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCoder:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C797000, a2, OS_LOG_TYPE_ERROR, "Decoding duration as a double failed due to the following exception: %@", (uint8_t *)&v2, 0xCu);
}

@end