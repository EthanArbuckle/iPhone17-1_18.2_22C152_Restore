@interface UIWebClipLinkTag
- (BOOL)mediaMatchesLandscapeOrientation;
- (BOOL)mediaMatchesPortraitOrientation;
- (NSString)href;
- (NSString)rel;
- (NSString)sizes;
- (NSURL)hrefURL;
- (void)setHref:(id)a3;
- (void)setMediaMatchesLandscapeOrientation:(BOOL)a3;
- (void)setMediaMatchesPortraitOrientation:(BOOL)a3;
- (void)setRel:(id)a3;
- (void)setSizes:(id)a3;
@end

@implementation UIWebClipLinkTag

- (NSURL)hrefURL
{
  v3 = [(NSString *)self->_href length];
  if (v3)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:self->_href encodingInvalidCharacters:0];
  }
  return (NSURL *)v3;
}

- (NSString)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
}

- (NSString)rel
{
  return self->_rel;
}

- (void)setRel:(id)a3
{
}

- (NSString)sizes
{
  return self->_sizes;
}

- (void)setSizes:(id)a3
{
}

- (BOOL)mediaMatchesPortraitOrientation
{
  return self->_mediaMatchesPortraitOrientation;
}

- (void)setMediaMatchesPortraitOrientation:(BOOL)a3
{
  self->_mediaMatchesPortraitOrientation = a3;
}

- (BOOL)mediaMatchesLandscapeOrientation
{
  return self->_mediaMatchesLandscapeOrientation;
}

- (void)setMediaMatchesLandscapeOrientation:(BOOL)a3
{
  self->_mediaMatchesLandscapeOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_rel, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end