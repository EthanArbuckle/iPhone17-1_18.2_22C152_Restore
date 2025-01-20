@interface VMVoicemailTranscript
+ (BOOL)supportsSecureCoding;
- (NSArray)segments;
- (NSString)transcriptionString;
- (VMVoicemailTranscript)init;
- (VMVoicemailTranscript)initWithCoder:(id)a3;
- (VMVoicemailTranscript)initWithTranscription:(id)a3;
- (float)confidence;
- (id)archivedData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)confidenceRating;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VMVoicemailTranscript

- (VMVoicemailTranscript)init
{
  v7.receiver = self;
  v7.super_class = (Class)VMVoicemailTranscript;
  v2 = [(VMVoicemailTranscript *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_confidence = 0.0;
    v2->_confidenceRating = 0;
    transcriptionString = v2->_transcriptionString;
    v2->_transcriptionString = (NSString *)&stru_26CD13F88;

    segments = v3->_segments;
    v3->_segments = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (VMVoicemailTranscript)initWithTranscription:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)VMVoicemailTranscript;
  v5 = [(VMVoicemailTranscript *)&v37 init];
  v6 = v5;
  if (v5)
  {
    v5->_float confidence = 0.0;
    v5->_confidenceRating = 0;
    uint64_t v7 = [v4 formattedString];
    transcriptionString = v6->_transcriptionString;
    v6->_transcriptionString = (NSString *)v7;

    id v9 = objc_alloc(MEMORY[0x263EFF980]);
    v10 = [v4 segments];
    v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    +[VMConfiguration confidenceSegmentThreshold];
    int v13 = v12;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v14 = objc_msgSend(v4, "segments", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v34;
      float v18 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          v21 = [VMVoicemailTranscriptSegment alloc];
          LODWORD(v22) = v13;
          v23 = [(VMVoicemailTranscriptSegment *)v21 initWithTranscriptionSegment:v20 confidenceThreshold:v22];
          [(VMVoicemailTranscriptSegment *)v23 confidence];
          float v18 = v18 + v24;
          [v11 addObject:v23];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v16);
    }
    else
    {
      float v18 = 0.0;
    }

    uint64_t v25 = [v11 copy];
    segments = v6->_segments;
    v6->_segments = (NSArray *)v25;

    if (v18 == 0.0)
    {
      float confidence = v6->_confidence;
    }
    else
    {
      float confidence = v18 / (float)[(NSArray *)v6->_segments count];
      v6->_float confidence = confidence;
    }
    if (confidence == 0.0)
    {
      uint64_t v28 = 0;
    }
    else
    {
      +[VMConfiguration confidenceLowQualityThreshold];
      if (confidence >= v29)
      {
        uint64_t v28 = 3;
      }
      else
      {
        float v30 = v6->_confidence;
        +[VMConfiguration confidenceThreshold];
        uint64_t v28 = 2;
        if (v30 < v31) {
          uint64_t v28 = 1;
        }
      }
    }
    v6->_confidenceRating = v28;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(VMVoicemailTranscript *)self confidence];
  *(_DWORD *)(v5 + 8) = v6;
  *(void *)(v5 + 32) = [(VMVoicemailTranscript *)self confidenceRating];
  uint64_t v7 = [(VMVoicemailTranscript *)self segments];
  uint64_t v8 = [v7 copyWithZone:a3];
  id v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  v10 = [(VMVoicemailTranscript *)self transcriptionString];
  uint64_t v11 = [v10 copyWithZone:a3];
  int v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float confidence = self->_confidence;
  id v5 = a3;
  int v6 = NSStringFromSelector(sel_confidence);
  *(float *)&double v7 = confidence;
  [v5 encodeFloat:v6 forKey:v7];

  unint64_t confidenceRating = self->_confidenceRating;
  id v9 = NSStringFromSelector(sel_confidenceRating);
  [v5 encodeInteger:confidenceRating forKey:v9];

  segments = self->_segments;
  uint64_t v11 = NSStringFromSelector(sel_segments);
  [v5 encodeObject:segments forKey:v11];

  transcriptionString = self->_transcriptionString;
  NSStringFromSelector(sel_transcriptionString);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:transcriptionString forKey:v13];
}

- (VMVoicemailTranscript)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VMVoicemailTranscript;
  id v5 = [(VMVoicemailTranscript *)&v20 init];
  if (v5)
  {
    int v6 = NSStringFromSelector(sel_confidence);
    [v4 decodeFloatForKey:v6];
    v5->_float confidence = v7;

    uint64_t v8 = NSStringFromSelector(sel_confidenceRating);
    v5->_unint64_t confidenceRating = [v4 decodeIntegerForKey:v8];

    id v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    int v12 = NSStringFromSelector(sel_segments);
    uint64_t v13 = [v4 decodeObjectOfClasses:v11 forKey:v12];
    segments = v5->_segments;
    v5->_segments = (NSArray *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = NSStringFromSelector(sel_transcriptionString);
    uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    transcriptionString = v5->_transcriptionString;
    v5->_transcriptionString = (NSString *)v17;
  }
  return v5;
}

- (id)debugDescription
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"=====================================================\n"];
  id v4 = [(VMVoicemailTranscript *)self transcriptionString];
  [v3 appendFormat:@"%@\n", v4];

  [v3 appendFormat:@"=====================================================\n"];
  [v3 appendString:@"Comprised of:\n"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(VMVoicemailTranscript *)self segments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) debugDescription];
        [v3 appendFormat:@"%@\n", v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(VMVoicemailTranscript *)self confidence];
  objc_msgSend(v3, "appendFormat:", @"With an overall confidence of %f (rating:%lu)", v11, -[VMVoicemailTranscript confidenceRating](self, "confidenceRating"));
  int v12 = (void *)[v3 copy];

  return v12;
}

- (id)archivedData
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self];
}

- (NSString)transcriptionString
{
  return self->_transcriptionString;
}

- (NSArray)segments
{
  return self->_segments;
}

- (float)confidence
{
  return self->_confidence;
}

- (unint64_t)confidenceRating
{
  return self->_confidenceRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_transcriptionString, 0);
}

@end