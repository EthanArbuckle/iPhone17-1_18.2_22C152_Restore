@interface TPSContextualPortraitEvent
+ (BOOL)supportsSecureCoding;
- (NSString)topicID;
- (TPSContextualPortraitEvent)initWithCoder:(id)a3;
- (TPSContextualPortraitEvent)initWithDictionary:(id)a3;
- (double)confidenceThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unsigned)minObservationCount;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceThreshold:(double)a3;
- (void)setTopicID:(id)a3;
@end

@implementation TPSContextualPortraitEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualPortraitEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSContextualPortraitEvent;
  v5 = [(TPSContextualEvent *)&v12 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 TPSSafeNumberForKey:@"confidenceThreshold"];
    v7 = v6;
    if (v6) {
      [v6 doubleValue];
    }
    else {
      uint64_t v8 = 0x3FE999999999999ALL;
    }
    *(void *)&v5->_confidenceThreshold = v8;
    uint64_t v9 = [v4 TPSSafeStringForKey:@"topicID"];
    topicID = v5->_topicID;
    v5->_topicID = (NSString *)v9;
  }
  return v5;
}

- (TPSContextualPortraitEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSContextualPortraitEvent;
  v5 = [(TPSContextualEvent *)&v10 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"confidenceThreshold"];
    if (v6 == 0.0) {
      double v6 = 0.8;
    }
    v5->_confidenceThreshold = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topicID"];
    topicID = v5->_topicID;
    v5->_topicID = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSContextualPortraitEvent;
  id v4 = a3;
  [(TPSContextualEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"confidenceThreshold", self->_confidenceThreshold, v5.receiver, v5.super_class);
  [v4 encodeObject:self->_topicID forKey:@"topicID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualPortraitEvent;
  id v4 = [(TPSContextualEvent *)&v6 copyWithZone:a3];
  [v4 setConfidenceThreshold:self->_confidenceThreshold];
  [v4 setTopicID:self->_topicID];
  return v4;
}

- (unsigned)minObservationCount
{
  return 1;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)TPSContextualPortraitEvent;
  id v4 = [(TPSContextualEvent *)&v7 debugDescription];
  objc_super v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"%@ = %lf\n", @"confidenceThreshold", *(void *)&self->_confidenceThreshold];
  [v5 appendFormat:@"%@ = %@\n", @"topicID", self->_topicID];
  return v5;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

- (NSString)topicID
{
  return self->_topicID;
}

- (void)setTopicID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end