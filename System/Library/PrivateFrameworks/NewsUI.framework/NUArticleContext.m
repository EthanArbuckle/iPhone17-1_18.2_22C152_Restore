@interface NUArticleContext
- (BOOL)shouldAutoPlayVideo;
- (BOOL)shouldDisableTransparentNavigationBar;
- (NUArticleContext)initWithShouldAutoPlayVideo:(BOOL)a3 scrollPosition:(id)a4 shouldDisableTransparentNavigationBar:(BOOL)a5;
- (SXScrollPosition)scrollPosition;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NUArticleContext

- (NUArticleContext)initWithShouldAutoPlayVideo:(BOOL)a3 scrollPosition:(id)a4 shouldDisableTransparentNavigationBar:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NUArticleContext;
  v10 = [(NUArticleContext *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_shouldAutoPlayVideo = a3;
    objc_storeStrong((id *)&v10->_scrollPosition, a4);
    v11->_shouldDisableTransparentNavigationBar = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  *(unsigned char *)(v4 + 8) = self->_shouldAutoPlayVideo;
  objc_storeStrong((id *)(v4 + 16), self->_scrollPosition);
  *(unsigned char *)(v4 + 9) = self->_shouldDisableTransparentNavigationBar;
  return (id)v4;
}

- (BOOL)shouldAutoPlayVideo
{
  return self->_shouldAutoPlayVideo;
}

- (SXScrollPosition)scrollPosition
{
  return self->_scrollPosition;
}

- (BOOL)shouldDisableTransparentNavigationBar
{
  return self->_shouldDisableTransparentNavigationBar;
}

- (void).cxx_destruct
{
}

@end