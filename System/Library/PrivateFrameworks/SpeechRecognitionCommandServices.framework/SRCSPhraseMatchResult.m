@interface SRCSPhraseMatchResult
- (NSString)matchedString;
- (SRCSPhraseMatchResult)initWithMarkerRange:(id)a3 matchedString:(id)a4 userInfo:(id)a5;
- (SRCSTextMarkerRangeProtocol)markerRange;
- (id)description;
- (id)userInfo;
- (int64_t)location;
- (void)setUserInfo:(id)a3;
@end

@implementation SRCSPhraseMatchResult

- (SRCSPhraseMatchResult)initWithMarkerRange:(id)a3 matchedString:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SRCSPhraseMatchResult;
  v12 = [(SRCSPhraseMatchResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_markerRange, a3);
    objc_storeStrong((id *)&v13->_matchedString, a4);
    objc_storeStrong(&v13->_userInfo, a5);
  }

  return v13;
}

- (int64_t)location
{
  return [(SRCSTextMarkerRangeProtocol *)self->_markerRange nsRange];
}

- (id)description
{
  v3 = NSString;
  id userInfo = self->_userInfo;
  matchedString = self->_matchedString;
  uint64_t v6 = [(SRCSTextMarkerRangeProtocol *)self->_markerRange nsRange];
  [(SRCSTextMarkerRangeProtocol *)self->_markerRange nsRange];
  return (id)[v3 stringWithFormat:@"%@: %@ (%ld, %ld)", userInfo, matchedString, v6, v7];
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)matchedString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (SRCSTextMarkerRangeProtocol)markerRange
{
  return (SRCSTextMarkerRangeProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerRange, 0);
  objc_storeStrong((id *)&self->_matchedString, 0);
  objc_storeStrong(&self->_userInfo, 0);
}

@end