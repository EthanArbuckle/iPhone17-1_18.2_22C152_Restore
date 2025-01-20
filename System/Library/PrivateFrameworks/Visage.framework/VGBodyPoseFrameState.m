@interface VGBodyPoseFrameState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)scores;
- (VGBodyPoseFrameState)initWithCoder:(id)a3;
- (float)aggregatedScore;
- (void)encodeWithCoder:(id)a3;
- (void)setAggregatedScore:(float)a3;
- (void)setScores:(id)a3;
@end

@implementation VGBodyPoseFrameState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGBodyPoseFrameState)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(VGBodyPoseFrameState *)self init];
  if (v5)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:3];
    v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", v6, v13, v14);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"scores"];
    scores = v5->_scores;
    v5->_scores = (NSDictionary *)v8;

    [v4 decodeFloatForKey:@"aggregatedScore"];
    v5->_aggregatedScore = v10;
    v11 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_scores forKey:@"scores"];
  *(float *)&double v4 = self->_aggregatedScore;
  [v5 encodeFloat:@"aggregatedScore" forKey:v4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (float *)v4;
    scores = self->_scores;
    BOOL v7 = (!((unint64_t)scores | *((void *)v5 + 2))
       || -[NSDictionary isEqualToDictionary:](scores, "isEqualToDictionary:"))
      && self->_aggregatedScore == v5[2];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSDictionary)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
}

- (float)aggregatedScore
{
  return self->_aggregatedScore;
}

- (void)setAggregatedScore:(float)a3
{
  self->_aggregatedScore = a3;
}

- (void).cxx_destruct
{
}

@end