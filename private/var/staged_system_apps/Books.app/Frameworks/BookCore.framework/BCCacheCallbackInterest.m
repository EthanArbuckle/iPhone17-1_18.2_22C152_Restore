@interface BCCacheCallbackInterest
- (BICDescribedImage)describedImageRequested;
- (BICDescribedImage)describedImageShown;
- (BOOL)needsNewVersion;
- (id)description;
- (id)handler;
- (void)setDescribedImage:(id)a3;
- (void)setDescribedImageRequested:(id)a3;
- (void)setDescribedImageShown:(id)a3;
- (void)setHandler:(id)a3;
- (void)setNeedsNewVersion:(BOOL)a3;
@end

@implementation BCCacheCallbackInterest

- (void)setDescribedImage:(id)a3
{
  id v4 = a3;
  [(BCCacheCallbackInterest *)self setDescribedImageShown:v4];
  v5 = [(BCCacheCallbackInterest *)self handler];
  v5[2](v5, v4, 0);
}

- (id)description
{
  v3 = [(BCCacheCallbackInterest *)self describedImageShown];
  id v4 = [(BCCacheCallbackInterest *)self describedImageRequested];
  v5 = +[NSString stringWithFormat:@"shown: %@, requested: %@", v3, v4];

  return v5;
}

- (BICDescribedImage)describedImageRequested
{
  return self->describedImageRequested;
}

- (void)setDescribedImageRequested:(id)a3
{
}

- (BICDescribedImage)describedImageShown
{
  return (BICDescribedImage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDescribedImageShown:(id)a3
{
}

- (BOOL)needsNewVersion
{
  return self->needsNewVersion;
}

- (void)setNeedsNewVersion:(BOOL)a3
{
  self->needsNewVersion = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->describedImageShown, 0);

  objc_storeStrong((id *)&self->describedImageRequested, 0);
}

@end