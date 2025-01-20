@interface USOMatchInfo
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)matchedAliasTypes;
- (NSNumber)editDistance;
- (NSNumber)matchScore;
- (NSNumber)matchedAliasCount;
- (NSNumber)matchedStopWordCount;
- (NSNumber)matchedTokenCount;
- (NSNumber)maxAliasCount;
- (NSNumber)maxStopWordCount;
- (NSNumber)maxTokenCount;
- (USOMatchInfo)init;
- (USOMatchInfo)initWithCoder:(id)a3;
- (USOMatchInfo)initWithMatchSignalBitSet:(unsigned int)a3;
- (USOMatchInfo)initWithMatchSignalBitSet:(unsigned int)a3 matchScore:(float)a4 maxTokenCount:(unsigned int)a5 matchedTokenCount:(unsigned int)a6 maxStopWordCount:(unsigned int)a7 matchedStopWordCount:(unsigned int)a8 editDistance:(unsigned int)a9 maxAliasCount:(unsigned int)a10 matchedAliasCount:(unsigned int)a11 matchedAliasTypes:(id)a12;
- (unsigned)matchSignalBitSet;
- (void)addAliasType:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEditDistance:(id)a3;
- (void)setMatchScore:(id)a3;
- (void)setMatchSignalBitSet:(unsigned int)a3;
- (void)setMatchedAliasCount:(id)a3;
- (void)setMatchedAliasTypes:(id)a3;
- (void)setMatchedStopWordCount:(id)a3;
- (void)setMatchedTokenCount:(id)a3;
- (void)setMaxAliasCount:(id)a3;
- (void)setMaxStopWordCount:(id)a3;
- (void)setMaxTokenCount:(id)a3;
@end

@implementation USOMatchInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedAliasTypes, 0);
  objc_storeStrong((id *)&self->_matchedAliasCount, 0);
  objc_storeStrong((id *)&self->_maxAliasCount, 0);
  objc_storeStrong((id *)&self->_editDistance, 0);
  objc_storeStrong((id *)&self->_matchedStopWordCount, 0);
  objc_storeStrong((id *)&self->_maxStopWordCount, 0);
  objc_storeStrong((id *)&self->_matchedTokenCount, 0);
  objc_storeStrong((id *)&self->_maxTokenCount, 0);
  objc_storeStrong((id *)&self->_matchScore, 0);
}

- (void)setMatchedAliasTypes:(id)a3
{
}

- (NSMutableArray)matchedAliasTypes
{
  return self->_matchedAliasTypes;
}

- (void)setMatchedAliasCount:(id)a3
{
}

- (NSNumber)matchedAliasCount
{
  return self->_matchedAliasCount;
}

- (void)setMaxAliasCount:(id)a3
{
}

- (NSNumber)maxAliasCount
{
  return self->_maxAliasCount;
}

- (void)setEditDistance:(id)a3
{
}

- (NSNumber)editDistance
{
  return self->_editDistance;
}

- (void)setMatchedStopWordCount:(id)a3
{
}

- (NSNumber)matchedStopWordCount
{
  return self->_matchedStopWordCount;
}

- (void)setMaxStopWordCount:(id)a3
{
}

- (NSNumber)maxStopWordCount
{
  return self->_maxStopWordCount;
}

- (void)setMatchedTokenCount:(id)a3
{
}

- (NSNumber)matchedTokenCount
{
  return self->_matchedTokenCount;
}

- (void)setMaxTokenCount:(id)a3
{
}

- (NSNumber)maxTokenCount
{
  return self->_maxTokenCount;
}

- (void)setMatchScore:(id)a3
{
}

- (NSNumber)matchScore
{
  return self->_matchScore;
}

- (void)setMatchSignalBitSet:(unsigned int)a3
{
  self->_matchSignalBitSet = a3;
}

- (unsigned)matchSignalBitSet
{
  return self->_matchSignalBitSet;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[USOMatchInfo matchSignalBitSet](self, "matchSignalBitSet"), @"matchSignalBitSet");
  v5 = [(USOMatchInfo *)self matchScore];
  [v4 encodeObject:v5 forKey:@"matchScore"];

  v6 = [(USOMatchInfo *)self maxTokenCount];
  [v4 encodeObject:v6 forKey:@"maxTokenCount"];

  v7 = [(USOMatchInfo *)self matchedTokenCount];
  [v4 encodeObject:v7 forKey:@"matchedTokenCount"];

  v8 = [(USOMatchInfo *)self maxStopWordCount];
  [v4 encodeObject:v8 forKey:@"maxStopWordCount"];

  v9 = [(USOMatchInfo *)self matchedStopWordCount];
  [v4 encodeObject:v9 forKey:@"matchedStopWordCount"];

  v10 = [(USOMatchInfo *)self editDistance];
  [v4 encodeObject:v10 forKey:@"editDistance"];

  v11 = [(USOMatchInfo *)self maxAliasCount];
  [v4 encodeObject:v11 forKey:@"maxAliasCount"];

  v12 = [(USOMatchInfo *)self matchedAliasCount];
  [v4 encodeObject:v12 forKey:@"matchedAliasCount"];

  id v13 = [(USOMatchInfo *)self matchedAliasTypes];
  [v4 encodeObject:v13 forKey:@"matchedAliasTypes"];
}

- (USOMatchInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)USOMatchInfo;
  v5 = [(USOMatchInfo *)&v28 init];
  if (v5)
  {
    v5->_matchSignalBitSet = [v4 decodeInt32ForKey:@"matchSignalBitSet"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchScore"];
    matchScore = v5->_matchScore;
    v5->_matchScore = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxTokenCount"];
    maxTokenCount = v5->_maxTokenCount;
    v5->_maxTokenCount = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchedTokenCount"];
    matchedTokenCount = v5->_matchedTokenCount;
    v5->_matchedTokenCount = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxStopWordCount"];
    maxStopWordCount = v5->_maxStopWordCount;
    v5->_maxStopWordCount = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchedStopWordCount"];
    matchedStopWordCount = v5->_matchedStopWordCount;
    v5->_matchedStopWordCount = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"editDistance"];
    editDistance = v5->_editDistance;
    v5->_editDistance = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxAliasCount"];
    maxAliasCount = v5->_maxAliasCount;
    v5->_maxAliasCount = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchedAliasCount"];
    matchedAliasCount = v5->_matchedAliasCount;
    v5->_matchedAliasCount = (NSNumber *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"matchedAliasTypes"];
    matchedAliasTypes = v5->_matchedAliasTypes;
    v5->_matchedAliasTypes = (NSMutableArray *)v25;
  }
  return v5;
}

- (void)addAliasType:(unsigned int)a3
{
  matchedAliasTypes = self->_matchedAliasTypes;
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(NSMutableArray *)matchedAliasTypes addObject:v4];
}

- (USOMatchInfo)initWithMatchSignalBitSet:(unsigned int)a3 matchScore:(float)a4 maxTokenCount:(unsigned int)a5 matchedTokenCount:(unsigned int)a6 maxStopWordCount:(unsigned int)a7 matchedStopWordCount:(unsigned int)a8 editDistance:(unsigned int)a9 maxAliasCount:(unsigned int)a10 matchedAliasCount:(unsigned int)a11 matchedAliasTypes:(id)a12
{
  uint64_t v12 = *(void *)&a9;
  uint64_t v13 = *(void *)&a8;
  uint64_t v14 = *(void *)&a7;
  uint64_t v15 = *(void *)&a6;
  uint64_t v16 = *(void *)&a5;
  id v20 = a12;
  v43.receiver = self;
  v43.super_class = (Class)USOMatchInfo;
  v21 = [(USOMatchInfo *)&v43 init];
  uint64_t v23 = v21;
  if (v21)
  {
    v21->_matchSignalBitSet = a3;
    *(float *)&double v22 = a4;
    uint64_t v24 = [NSNumber numberWithFloat:v22];
    matchScore = v23->_matchScore;
    v23->_matchScore = (NSNumber *)v24;

    uint64_t v26 = [NSNumber numberWithUnsignedInt:v16];
    maxTokenCount = v23->_maxTokenCount;
    v23->_maxTokenCount = (NSNumber *)v26;

    uint64_t v28 = [NSNumber numberWithUnsignedInt:v15];
    matchedTokenCount = v23->_matchedTokenCount;
    v23->_matchedTokenCount = (NSNumber *)v28;

    uint64_t v30 = [NSNumber numberWithUnsignedInt:v14];
    maxStopWordCount = v23->_maxStopWordCount;
    v23->_maxStopWordCount = (NSNumber *)v30;

    uint64_t v32 = [NSNumber numberWithUnsignedInt:v13];
    matchedStopWordCount = v23->_matchedStopWordCount;
    v23->_matchedStopWordCount = (NSNumber *)v32;

    uint64_t v34 = [NSNumber numberWithUnsignedInt:v12];
    editDistance = v23->_editDistance;
    v23->_editDistance = (NSNumber *)v34;

    uint64_t v36 = [NSNumber numberWithUnsignedInt:a10];
    maxAliasCount = v23->_maxAliasCount;
    v23->_maxAliasCount = (NSNumber *)v36;

    uint64_t v38 = [NSNumber numberWithUnsignedInt:a11];
    matchedAliasCount = v23->_matchedAliasCount;
    v23->_matchedAliasCount = (NSNumber *)v38;

    if (v20)
    {
      uint64_t v40 = [v20 mutableCopy];
    }
    else
    {
      uint64_t v40 = [MEMORY[0x1E4F1CA48] array];
    }
    matchedAliasTypes = v23->_matchedAliasTypes;
    v23->_matchedAliasTypes = (NSMutableArray *)v40;
  }
  return v23;
}

- (USOMatchInfo)initWithMatchSignalBitSet:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)USOMatchInfo;
  id v4 = [(USOMatchInfo *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_matchSignalBitSet = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    matchedAliasTypes = v5->_matchedAliasTypes;
    v5->_matchedAliasTypes = (NSMutableArray *)v6;
  }
  return v5;
}

- (USOMatchInfo)init
{
  return [(USOMatchInfo *)self initWithMatchSignalBitSet:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end