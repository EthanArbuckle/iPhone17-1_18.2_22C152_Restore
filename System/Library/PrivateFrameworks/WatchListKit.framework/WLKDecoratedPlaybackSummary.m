@interface WLKDecoratedPlaybackSummary
+ (BOOL)supportsSecureCoding;
- (NSString)canonicalID;
- (WLKDecoratedPlaybackSummary)initWithCoder:(id)a3;
- (WLKDecoratedPlaybackSummary)initWithSummary:(id)a3 canonicalID:(id)a4;
- (WLKPlaybackSummary)summary;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WLKDecoratedPlaybackSummary

- (WLKDecoratedPlaybackSummary)initWithSummary:(id)a3 canonicalID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WLKDecoratedPlaybackSummary;
  v9 = [(WLKDecoratedPlaybackSummary *)&v13 init];
  if (v9 == self)
  {
    objc_storeStrong((id *)&self->_summary, a3);
    v10 = (NSString *)[v8 copy];
    canonicalID = self->_canonicalID;
    self->_canonicalID = v10;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKDecoratedPlaybackSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v5 = [(WLKDecoratedPlaybackSummary *)self init];
    if (v5)
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKDecoratedPlaybackSummary.summary"];
      summary = v5->_summary;
      v5->_summary = (WLKPlaybackSummary *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WLKDecoratedPlaybackSummary.canonicalID"];
      canonicalID = v5->_canonicalID;
      v5->_canonicalID = (NSString *)v8;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_summary forKey:@"WLKDecoratedPlaybackSummary.summary"];
  [v4 encodeObject:self->_canonicalID forKey:@"WLKDecoratedPlaybackSummary.canonicalID"];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WLKDecoratedPlaybackSummary;
  id v4 = [(WLKDecoratedPlaybackSummary *)&v8 description];
  v5 = [(WLKDecoratedPlaybackSummary *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"summary";
  summary = self->_summary;
  id v4 = summary;
  if (!summary)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"canonicalID";
  v10[0] = v4;
  canonicalID = self->_canonicalID;
  uint64_t v6 = canonicalID;
  if (!canonicalID)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (canonicalID)
  {
    if (summary) {
      goto LABEL_7;
    }
  }
  else
  {

    if (summary) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (WLKPlaybackSummary)summary
{
  return self->_summary;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);

  objc_storeStrong((id *)&self->_summary, 0);
}

@end