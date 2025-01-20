@interface SUIBRegexMatch
- (SUIBBridgedMatch)bridgedMatch;
- (SUIBRegexMatch)initWithBridgedMatch:(id)a3;
- (_NSRange)range;
- (id)captured;
@end

@implementation SUIBRegexMatch

- (SUIBRegexMatch)initWithBridgedMatch:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUIBRegexMatch;
  v6 = [(SUIBRegexMatch *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bridgedMatch, a3);
  }

  return v7;
}

- (_NSRange)range
{
  v2 = [(SUIBRegexMatch *)self bridgedMatch];
  uint64_t v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)captured
{
  v2 = [(SUIBRegexMatch *)self bridgedMatch];
  uint64_t v3 = [v2 captured];

  return v3;
}

- (SUIBBridgedMatch)bridgedMatch
{
  return self->_bridgedMatch;
}

- (void).cxx_destruct
{
}

@end