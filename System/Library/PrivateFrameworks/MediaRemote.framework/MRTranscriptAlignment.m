@interface MRTranscriptAlignment
+ (BOOL)supportsSecureCoding;
- (BOOL)matchedBeginning;
- (BOOL)matchedEnd;
- (MRTranscriptAlignment)initWithCoder:(id)a3;
- (MRTranscriptAlignment)initWithPlayerStartTime:(double)a3 playerEndTime:(double)a4 referenceStartTime:(double)a5 referenceEndTime:(double)a6 matchedBeginning:(BOOL)a7 matchedEnd:(BOOL)a8;
- (MRTranscriptAlignment)initWithProtobuf:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (_MRTranscriptAlignmentProtobuf)protobuf;
- (double)playerEndTime;
- (double)playerStartTime;
- (double)referenceEndTime;
- (double)referenceStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (void)encodeWithCoder:(id)a3;
- (void)setMatchedBeginning:(BOOL)a3;
- (void)setMatchedEnd:(BOOL)a3;
- (void)setPlayerEndTime:(double)a3;
- (void)setPlayerStartTime:(double)a3;
- (void)setReferenceEndTime:(double)a3;
- (void)setReferenceStartTime:(double)a3;
@end

@implementation MRTranscriptAlignment

- (MRTranscriptAlignment)initWithPlayerStartTime:(double)a3 playerEndTime:(double)a4 referenceStartTime:(double)a5 referenceEndTime:(double)a6 matchedBeginning:(BOOL)a7 matchedEnd:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)MRTranscriptAlignment;
  result = [(MRTranscriptAlignment *)&v15 init];
  if (result)
  {
    result->_playerStartTime = a3;
    result->_playerEndTime = a4;
    result->_referenceStartTime = a5;
    result->_referenceEndTime = a6;
    result->_matchedBeginning = a7;
    result->_matchedEnd = a8;
  }
  return result;
}

- (MRTranscriptAlignment)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)MRTranscriptAlignment;
    v5 = [(MRTranscriptAlignment *)&v12 init];
    if (v5)
    {
      [v4 playerStartTime];
      v5->_playerStartTime = v6;
      [v4 playerEndTime];
      v5->_playerEndTime = v7;
      [v4 referenceStartTime];
      v5->_referenceStartTime = v8;
      [v4 referenceEndTime];
      v5->_referenceEndTime = v9;
      v5->_matchedBeginning = [v4 matchedBeginning];
      v5->_matchedEnd = [v4 matchedEnd];
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_MRTranscriptAlignmentProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRTranscriptAlignmentProtobuf);
  [(MRTranscriptAlignment *)self playerStartTime];
  -[_MRTranscriptAlignmentProtobuf setPlayerStartTime:](v3, "setPlayerStartTime:");
  [(MRTranscriptAlignment *)self playerEndTime];
  -[_MRTranscriptAlignmentProtobuf setPlayerEndTime:](v3, "setPlayerEndTime:");
  [(MRTranscriptAlignment *)self referenceStartTime];
  -[_MRTranscriptAlignmentProtobuf setReferenceStartTime:](v3, "setReferenceStartTime:");
  [(MRTranscriptAlignment *)self referenceEndTime];
  -[_MRTranscriptAlignmentProtobuf setReferenceEndTime:](v3, "setReferenceEndTime:");
  [(_MRTranscriptAlignmentProtobuf *)v3 setMatchedBeginning:[(MRTranscriptAlignment *)self matchedBeginning]];
  [(_MRTranscriptAlignmentProtobuf *)v3 setMatchedEnd:[(MRTranscriptAlignment *)self matchedEnd]];

  return v3;
}

- (id)data
{
  v2 = [(MRTranscriptAlignment *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v16[6] = *MEMORY[0x1E4F143B8];
  v15[0] = @"playerStartTime";
  v3 = NSNumber;
  [(MRTranscriptAlignment *)self playerStartTime];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v16[0] = v4;
  v15[1] = @"playerEndTime";
  v5 = NSNumber;
  [(MRTranscriptAlignment *)self playerEndTime];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  v16[1] = v6;
  v15[2] = @"referenceStartTime";
  double v7 = NSNumber;
  [(MRTranscriptAlignment *)self referenceStartTime];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  v16[2] = v8;
  v15[3] = @"referenceEndTime";
  double v9 = NSNumber;
  [(MRTranscriptAlignment *)self referenceEndTime];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v16[3] = v10;
  v15[4] = @"matchedBeginning";
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[MRTranscriptAlignment matchedBeginning](self, "matchedBeginning"));
  v16[4] = v11;
  v15[5] = @"matchedEnd";
  objc_super v12 = objc_msgSend(NSNumber, "numberWithBool:", -[MRTranscriptAlignment matchedEnd](self, "matchedEnd"));
  v16[5] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];

  return (NSDictionary *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(MRTranscriptAlignment *)self playerStartTime];
  objc_msgSend(v4, "setPlayerStartTime:");
  [(MRTranscriptAlignment *)self playerEndTime];
  objc_msgSend(v4, "setPlayerEndTime:");
  [(MRTranscriptAlignment *)self referenceStartTime];
  objc_msgSend(v4, "setReferenceStartTime:");
  [(MRTranscriptAlignment *)self referenceEndTime];
  objc_msgSend(v4, "setReferenceEndTime:");
  objc_msgSend(v4, "setMatchedBeginning:", -[MRTranscriptAlignment matchedBeginning](self, "matchedBeginning"));
  objc_msgSend(v4, "setMatchedEnd:", -[MRTranscriptAlignment matchedEnd](self, "matchedEnd"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    [(MRTranscriptAlignment *)self playerStartTime];
    objc_msgSend(v5, "encodeDouble:forKey:", @"playerStartTime");
    [(MRTranscriptAlignment *)self playerEndTime];
    objc_msgSend(v5, "encodeDouble:forKey:", @"playerEndTime");
    [(MRTranscriptAlignment *)self referenceStartTime];
    objc_msgSend(v5, "encodeDouble:forKey:", @"referenceStartTime");
    [(MRTranscriptAlignment *)self referenceEndTime];
    objc_msgSend(v5, "encodeDouble:forKey:", @"referenceEndTime");
    objc_msgSend(v5, "encodeBool:forKey:", -[MRTranscriptAlignment matchedBeginning](self, "matchedBeginning"), @"matchedBeginning");
    objc_msgSend(v5, "encodeBool:forKey:", -[MRTranscriptAlignment matchedEnd](self, "matchedEnd"), @"matchedEnd");
    id v4 = [(MRTranscriptAlignment *)self protobuf];
    [v5 encodeObject:v4 forKey:@"protobuf"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"coder must support key-value coding"];
  }
}

- (MRTranscriptAlignment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRTranscriptAlignment;
  id v5 = [(MRTranscriptAlignment *)&v11 init];
  if (!v5) {
    goto LABEL_11;
  }
  if (![v4 allowsKeyedCoding])
  {
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:38];
    [v4 failWithError:v8];

LABEL_11:
    double v7 = v5;
    goto LABEL_12;
  }
  double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MRLanguageOption initWithCoder:]((uint64_t)v6, v9);
    }

    goto LABEL_10;
  }
  if (!v6)
  {
LABEL_10:
    [v4 decodeDoubleForKey:@"playerStartTime"];
    -[MRTranscriptAlignment setPlayerStartTime:](v5, "setPlayerStartTime:");
    [v4 decodeDoubleForKey:@"playerEndTime"];
    -[MRTranscriptAlignment setPlayerEndTime:](v5, "setPlayerEndTime:");
    [v4 decodeDoubleForKey:@"referenceStartTime"];
    -[MRTranscriptAlignment setReferenceStartTime:](v5, "setReferenceStartTime:");
    [v4 decodeDoubleForKey:@"referenceEndTime"];
    -[MRTranscriptAlignment setReferenceEndTime:](v5, "setReferenceEndTime:");
    -[MRTranscriptAlignment setMatchedBeginning:](v5, "setMatchedBeginning:", [v4 decodeBoolForKey:@"matchedBeginning"]);
    -[MRTranscriptAlignment setMatchedEnd:](v5, "setMatchedEnd:", [v4 decodeBoolForKey:@"matchedEnd"]);
    goto LABEL_11;
  }
  double v7 = [(MRTranscriptAlignment *)v5 initWithProtobuf:v6];

LABEL_12:
  return v7;
}

- (double)playerStartTime
{
  return self->_playerStartTime;
}

- (void)setPlayerStartTime:(double)a3
{
  self->_playerStartTime = a3;
}

- (double)playerEndTime
{
  return self->_playerEndTime;
}

- (void)setPlayerEndTime:(double)a3
{
  self->_playerEndTime = a3;
}

- (double)referenceStartTime
{
  return self->_referenceStartTime;
}

- (void)setReferenceStartTime:(double)a3
{
  self->_referenceStartTime = a3;
}

- (double)referenceEndTime
{
  return self->_referenceEndTime;
}

- (void)setReferenceEndTime:(double)a3
{
  self->_referenceEndTime = a3;
}

- (BOOL)matchedBeginning
{
  return self->_matchedBeginning;
}

- (void)setMatchedBeginning:(BOOL)a3
{
  self->_matchedBeginning = a3;
}

- (BOOL)matchedEnd
{
  return self->_matchedEnd;
}

- (void)setMatchedEnd:(BOOL)a3
{
  self->_matchedEnd = a3;
}

@end