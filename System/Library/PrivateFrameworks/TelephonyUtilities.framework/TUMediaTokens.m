@interface TUMediaTokens
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMediaTokens:(id)a3;
- (NSDictionary)streamTokensByParticipantID;
- (TUMediaTokens)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)combinedAudioStreamToken;
- (int64_t)downlinkStreamToken;
- (int64_t)uplinkStreamToken;
- (void)encodeWithCoder:(id)a3;
- (void)setCombinedAudioStreamToken:(int64_t)a3;
- (void)setDownlinkStreamToken:(int64_t)a3;
- (void)setStreamTokensByParticipantID:(id)a3;
- (void)setUplinkStreamToken:(int64_t)a3;
@end

@implementation TUMediaTokens

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" uST=%ld", -[TUMediaTokens uplinkStreamToken](self, "uplinkStreamToken"));
  objc_msgSend(v3, "appendFormat:", @" dST=%ld", -[TUMediaTokens downlinkStreamToken](self, "downlinkStreamToken"));
  objc_msgSend(v3, "appendFormat:", @" cAST=%ld", -[TUMediaTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"));
  v4 = [(TUMediaTokens *)self streamTokensByParticipantID];
  [v3 appendFormat:@" sTPID=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUplinkStreamToken:", -[TUMediaTokens uplinkStreamToken](self, "uplinkStreamToken"));
  objc_msgSend(v4, "setDownlinkStreamToken:", -[TUMediaTokens downlinkStreamToken](self, "downlinkStreamToken"));
  objc_msgSend(v4, "setCombinedAudioStreamToken:", -[TUMediaTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"));
  v5 = [(TUMediaTokens *)self streamTokensByParticipantID];
  [v4 setStreamTokensByParticipantID:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUMediaTokens)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUMediaTokens *)self init];
  if (v5)
  {
    v5->_uplinkStreamToken = [v4 decodeIntegerForKey:@"uplinkStreamToken"];
    v5->_downlinkStreamToken = [v4 decodeIntegerForKey:@"downlinkStreamToken"];
    v5->_combinedAudioStreamToken = [v4 decodeIntegerForKey:@"combinedAudioStreamToken"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"streamTokensByParticipantID"];
    streamTokensByParticipantID = v5->_streamTokensByParticipantID;
    v5->_streamTokensByParticipantID = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TUMediaTokens uplinkStreamToken](self, "uplinkStreamToken"), @"uplinkStreamToken");
  objc_msgSend(v4, "encodeInteger:forKey:", -[TUMediaTokens downlinkStreamToken](self, "downlinkStreamToken"), @"downlinkStreamToken");
  objc_msgSend(v4, "encodeInteger:forKey:", -[TUMediaTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"), @"combinedAudioStreamToken");
  id v5 = [(TUMediaTokens *)self streamTokensByParticipantID];
  [v4 encodeObject:v5 forKey:@"streamTokensByParticipantID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TUMediaTokens *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUMediaTokens *)self isEqualToMediaTokens:v4];
  }

  return v5;
}

- (BOOL)isEqualToMediaTokens:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUMediaTokens *)self uplinkStreamToken];
  if (v5 == [v4 uplinkStreamToken]
    && (int64_t v6 = [(TUMediaTokens *)self downlinkStreamToken],
        v6 == [v4 downlinkStreamToken])
    && (int64_t v7 = [(TUMediaTokens *)self combinedAudioStreamToken],
        v7 == [v4 combinedAudioStreamToken]))
  {
    uint64_t v8 = [(TUMediaTokens *)self streamTokensByParticipantID];
    v9 = [v4 streamTokensByParticipantID];
    BOOL v10 = v8 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (int64_t)uplinkStreamToken
{
  return self->_uplinkStreamToken;
}

- (void)setUplinkStreamToken:(int64_t)a3
{
  self->_uplinkStreamToken = a3;
}

- (int64_t)downlinkStreamToken
{
  return self->_downlinkStreamToken;
}

- (void)setDownlinkStreamToken:(int64_t)a3
{
  self->_downlinkStreamToken = a3;
}

- (NSDictionary)streamTokensByParticipantID
{
  return self->_streamTokensByParticipantID;
}

- (void)setStreamTokensByParticipantID:(id)a3
{
}

- (int64_t)combinedAudioStreamToken
{
  return self->_combinedAudioStreamToken;
}

- (void)setCombinedAudioStreamToken:(int64_t)a3
{
  self->_combinedAudioStreamToken = a3;
}

- (void).cxx_destruct
{
}

@end