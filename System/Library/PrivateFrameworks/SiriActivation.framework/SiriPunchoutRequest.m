@interface SiriPunchoutRequest
- (NSString)bundleIdentifier;
- (NSURL)url;
- (SiriPunchoutRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)punchoutStyle;
- (void)setBundleIdentifier:(id)a3;
- (void)setPunchoutStyle:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation SiriPunchoutRequest

- (SiriPunchoutRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)SiriPunchoutRequest;
  result = [(SiriPunchoutRequest *)&v3 init];
  if (result) {
    result->_punchoutStyle = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SiriPunchoutRequest);
  v5 = [(SiriPunchoutRequest *)self bundleIdentifier];
  [(SiriPunchoutRequest *)v4 setBundleIdentifier:v5];

  v6 = [(SiriPunchoutRequest *)self url];
  [(SiriPunchoutRequest *)v4 setUrl:v6];

  [(SiriPunchoutRequest *)v4 setPunchoutStyle:[(SiriPunchoutRequest *)self punchoutStyle]];
  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int64_t)punchoutStyle
{
  return self->_punchoutStyle;
}

- (void)setPunchoutStyle:(int64_t)a3
{
  self->_punchoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end