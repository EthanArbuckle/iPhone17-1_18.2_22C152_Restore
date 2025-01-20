@interface OKAutoLayoutLiveFeedContext
- (NSMutableDictionary)layoutInfos;
- (NSString)primaryResolutionKey;
- (int64_t)mediasUsed;
- (int64_t)pagesGenerated;
- (void)dealloc;
- (void)setLayoutInfos:(id)a3;
- (void)setMediasUsed:(int64_t)a3;
- (void)setPagesGenerated:(int64_t)a3;
- (void)setPrimaryResolutionKey:(id)a3;
@end

@implementation OKAutoLayoutLiveFeedContext

- (void)dealloc
{
  layoutInfos = self->_layoutInfos;
  if (layoutInfos)
  {

    self->_layoutInfos = 0;
  }
  primaryResolutionKey = self->_primaryResolutionKey;
  if (primaryResolutionKey)
  {

    self->_primaryResolutionKey = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)OKAutoLayoutLiveFeedContext;
  [(OKAutoLayoutLiveFeedContext *)&v5 dealloc];
}

- (NSMutableDictionary)layoutInfos
{
  return self->_layoutInfos;
}

- (void)setLayoutInfos:(id)a3
{
}

- (NSString)primaryResolutionKey
{
  return self->_primaryResolutionKey;
}

- (void)setPrimaryResolutionKey:(id)a3
{
}

- (int64_t)pagesGenerated
{
  return self->_pagesGenerated;
}

- (void)setPagesGenerated:(int64_t)a3
{
  self->_pagesGenerated = a3;
}

- (int64_t)mediasUsed
{
  return self->_mediasUsed;
}

- (void)setMediasUsed:(int64_t)a3
{
  self->_mediasUsed = a3;
}

@end