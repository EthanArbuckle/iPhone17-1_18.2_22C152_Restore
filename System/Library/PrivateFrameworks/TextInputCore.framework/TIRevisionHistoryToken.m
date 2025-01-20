@interface TIRevisionHistoryToken
- (BOOL)isAccepted;
- (NSString)tokenDictionaryString;
- (NSString)tokenInputString;
- (NSString)tokenLatinInputString;
- (NSString)userTyping;
- (TITokenID)tokenID;
- (id)description;
- (unint64_t)offset;
- (unsigned)usageLearningMask;
- (unsigned)usageTrackingMask;
- (void)setAccepted:(BOOL)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setTokenDictionaryString:(id)a3;
- (void)setTokenID:(TITokenID)a3;
- (void)setTokenInputString:(id)a3;
- (void)setTokenLatinInputString:(id)a3;
- (void)setUsageLearningMask:(unsigned int)a3;
- (void)setUsageTrackingMask:(unsigned int)a3;
- (void)setUserTyping:(id)a3;
@end

@implementation TIRevisionHistoryToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenLatinInputString, 0);
  objc_storeStrong((id *)&self->_userTyping, 0);
  objc_storeStrong((id *)&self->_tokenDictionaryString, 0);

  objc_storeStrong((id *)&self->_tokenInputString, 0);
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (BOOL)isAccepted
{
  return self->_accepted;
}

- (void)setUsageTrackingMask:(unsigned int)a3
{
  self->_usageTrackingMask = a3;
}

- (unsigned)usageTrackingMask
{
  return self->_usageTrackingMask;
}

- (void)setUsageLearningMask:(unsigned int)a3
{
  self->_usageLearningMask = a3;
}

- (unsigned)usageLearningMask
{
  return self->_usageLearningMask;
}

- (void)setTokenLatinInputString:(id)a3
{
}

- (NSString)tokenLatinInputString
{
  return self->_tokenLatinInputString;
}

- (void)setUserTyping:(id)a3
{
}

- (NSString)userTyping
{
  return self->_userTyping;
}

- (void)setTokenDictionaryString:(id)a3
{
}

- (void)setTokenID:(TITokenID)a3
{
  self->_tokenID = a3;
}

- (TITokenID)tokenID
{
  return self->_tokenID;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setTokenInputString:(id)a3
{
}

- (NSString)tokenInputString
{
  return self->_tokenInputString;
}

- (NSString)tokenDictionaryString
{
  tokenDictionaryString = self->_tokenDictionaryString;
  if (!tokenDictionaryString) {
    tokenDictionaryString = self->_tokenInputString;
  }
  v3 = tokenDictionaryString;

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TIRevisionHistoryToken *)self tokenInputString];
  unint64_t v6 = [(TIRevisionHistoryToken *)self offset];
  TITokenID v7 = [(TIRevisionHistoryToken *)self tokenID];
  unint64_t v8 = (unint64_t)[(TIRevisionHistoryToken *)self tokenID] >> 32;
  v9 = [(TIRevisionHistoryToken *)self tokenDictionaryString];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; string %@; offset %u; ID [%u]%u; surface form %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  v10 = v9);

  return v10;
}

@end