@interface PrivacyProxyTokenInfo
+ (BOOL)supportsSecureCoding;
- (PrivacyProxyTokenInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)agentLowWaterMark;
- (unint64_t)agentTokens;
- (unint64_t)cacheLowWaterMark;
- (unint64_t)cachedTokens;
- (void)encodeWithCoder:(id)a3;
- (void)setAgentLowWaterMark:(unint64_t)a3;
- (void)setAgentTokens:(unint64_t)a3;
- (void)setCacheLowWaterMark:(unint64_t)a3;
- (void)setCachedTokens:(unint64_t)a3;
@end

@implementation PrivacyProxyTokenInfo

- (id)description
{
  if (self)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyTokenInfo *)self cachedTokens], @"Cached token Count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyTokenInfo *)self agentTokens], @"Agent token Count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyTokenInfo *)self cacheLowWaterMark], @"Cache low water mark", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyTokenInfo *)self agentLowWaterMark], @"Agent low water mark", 0, 14);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PrivacyProxyTokenInfo allocWithZone:a3] init];
  [(PrivacyProxyTokenInfo *)v4 setCachedTokens:[(PrivacyProxyTokenInfo *)self cachedTokens]];
  [(PrivacyProxyTokenInfo *)v4 setAgentTokens:[(PrivacyProxyTokenInfo *)self agentTokens]];
  [(PrivacyProxyTokenInfo *)v4 setCacheLowWaterMark:[(PrivacyProxyTokenInfo *)self cacheLowWaterMark]];
  [(PrivacyProxyTokenInfo *)v4 setAgentLowWaterMark:[(PrivacyProxyTokenInfo *)self agentLowWaterMark]];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyTokenInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PrivacyProxyTokenInfo;
  v5 = [(PrivacyProxyTokenInfo *)&v7 init];
  if (v5)
  {
    v5->_cachedTokens = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoCachedTokenCount"];
    v5->_agentTokens = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoAgentTokenCount"];
    v5->_cacheLowWaterMark = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoCacheLowWaterMark"];
    v5->_agentLowWaterMark = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoAgentLowWaterMark"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyTokenInfo cachedTokens](self, "cachedTokens"), @"PrivacyProxyInfoCachedTokenCount");
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyTokenInfo agentTokens](self, "agentTokens"), @"PrivacyProxyInfoAgentTokenCount");
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyTokenInfo cacheLowWaterMark](self, "cacheLowWaterMark"), @"PrivacyProxyInfoCacheLowWaterMark");
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyTokenInfo agentLowWaterMark](self, "agentLowWaterMark"), @"PrivacyProxyInfoAgentLowWaterMark");
}

- (unint64_t)cachedTokens
{
  return self->_cachedTokens;
}

- (void)setCachedTokens:(unint64_t)a3
{
  self->_cachedTokens = a3;
}

- (unint64_t)agentTokens
{
  return self->_agentTokens;
}

- (void)setAgentTokens:(unint64_t)a3
{
  self->_agentTokens = a3;
}

- (unint64_t)agentLowWaterMark
{
  return self->_agentLowWaterMark;
}

- (void)setAgentLowWaterMark:(unint64_t)a3
{
  self->_agentLowWaterMark = a3;
}

- (unint64_t)cacheLowWaterMark
{
  return self->_cacheLowWaterMark;
}

- (void)setCacheLowWaterMark:(unint64_t)a3
{
  self->_cacheLowWaterMark = a3;
}

@end