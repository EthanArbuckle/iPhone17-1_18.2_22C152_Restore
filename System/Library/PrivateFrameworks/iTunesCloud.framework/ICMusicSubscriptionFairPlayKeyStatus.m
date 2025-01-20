@interface ICMusicSubscriptionFairPlayKeyStatus
- (BOOL)hasOfflinePlaybackKeys;
- (BOOL)hasOnlinePlaybackKeys;
- (BOOL)isEqual:(id)a3;
- (ICMusicSubscriptionFairPlayKeyStatus)initWithFairPlaySubscriptionInfo:(FPSubscriptionInfo_)a3;
- (id)description;
- (unint64_t)accountUniqueIdentifier;
- (void)setAccountUniqueIdentifier:(unint64_t)a3;
- (void)setHasOfflinePlaybackKeys:(BOOL)a3;
- (void)setHasOnlinePlaybackKeys:(BOOL)a3;
@end

@implementation ICMusicSubscriptionFairPlayKeyStatus

- (void)setHasOfflinePlaybackKeys:(BOOL)a3
{
  self->_hasOfflinePlaybackKeys = a3;
}

- (BOOL)hasOfflinePlaybackKeys
{
  return self->_hasOfflinePlaybackKeys;
}

- (void)setHasOnlinePlaybackKeys:(BOOL)a3
{
  self->_hasOnlinePlaybackKeys = a3;
}

- (BOOL)hasOnlinePlaybackKeys
{
  return self->_hasOnlinePlaybackKeys;
}

- (void)setAccountUniqueIdentifier:(unint64_t)a3
{
  self->_accountUniqueIdentifier = a3;
}

- (unint64_t)accountUniqueIdentifier
{
  return self->_accountUniqueIdentifier;
}

- (id)description
{
  v2 = @"YES";
  if (self->_hasOfflinePlaybackKeys) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (!self->_hasOnlinePlaybackKeys) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"<%p> - accountUniqueIdentifier: %llu - hasOfflinePlaybackKeys=%@ - hasOnlinePlaybackKeys=%@", self, self->_accountUniqueIdentifier, v3, v2];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_hasOfflinePlaybackKeys == v4[9]
    && self->_hasOnlinePlaybackKeys == v4[8];

  return v5;
}

- (ICMusicSubscriptionFairPlayKeyStatus)initWithFairPlaySubscriptionInfo:(FPSubscriptionInfo_)a3
{
  int var1 = a3.var1;
  unint64_t var0 = a3.var0;
  result = [(ICMusicSubscriptionFairPlayKeyStatus *)self init];
  if (result)
  {
    result->_accountUniqueIdentifier = var0;
    result->_hasOfflinePlaybackKeys = (var1 & 0xFFFFFFFE) == 2;
    result->_hasOnlinePlaybackKeys = (var1 & 0xFFFFFFFD) == 1;
  }
  return result;
}

@end