@interface ICMusicSubscriptionStatusTerms
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICMusicSubscriptionStatusTerms)initWithCoder:(id)a3;
- (ICMusicSubscriptionStatusTerms)initWithResponseTermsDictionary:(id)a3;
- (int64_t)acceptedVersion;
- (int64_t)currentVersion;
- (int64_t)sourceType;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICMusicSubscriptionStatusTerms

- (int64_t)type
{
  return self->_type;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (int64_t)currentVersion
{
  return self->_currentVersion;
}

- (int64_t)acceptedVersion
{
  return self->_acceptedVersion;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_sourceType forKey:@"sourceType"];
  [v5 encodeInteger:self->_currentVersion forKey:@"currentVersion"];
  [v5 encodeInteger:self->_acceptedVersion forKey:@"acceptedVersion"];
}

- (ICMusicSubscriptionStatusTerms)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMusicSubscriptionStatusTerms;
  id v5 = [(ICMusicSubscriptionStatusTerms *)&v7 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"type"];
    v5->_sourceType = [v4 decodeIntegerForKey:@"sourceType"];
    v5->_currentVersion = [v4 decodeIntegerForKey:@"currentVersion"];
    v5->_acceptedVersion = [v4 decodeIntegerForKey:@"acceptedVersion"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICMusicSubscriptionStatusTerms *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = self->_acceptedVersion == v5->_acceptedVersion
        && self->_currentVersion == v5->_currentVersion
        && self->_sourceType == v5->_sourceType
        && self->_type == v5->_type;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (ICMusicSubscriptionStatusTerms)initWithResponseTermsDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionStatusTerms;
  id v5 = [(ICMusicSubscriptionStatusTerms *)&v11 init];
  if (v5)
  {
    BOOL v6 = [v4 objectForKey:@"source"];
    if (_NSIsNSString()) {
      v5->_int64_t type = [v6 isEqualToString:@"Store"];
    }
    objc_super v7 = [v4 objectForKey:@"source"];
    if (_NSIsNSString()) {
      v5->_sourceType = [v7 isEqualToString:@"account"];
    }
    v8 = [v4 objectForKey:@"latestTerms"];
    if (objc_opt_respondsToSelector()) {
      v5->_currentVersion = [v8 integerValue];
    }
    v9 = [v4 objectForKey:@"agreedToTerms"];
    if (objc_opt_respondsToSelector()) {
      v5->_acceptedVersion = [v9 integerValue];
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end