@interface NUArticleScrollPosition
- (NUArticleScrollPosition)initWithPosition:(id)a3 source:(int64_t)a4;
- (SXScrollPosition)position;
- (int64_t)source;
@end

@implementation NUArticleScrollPosition

- (NUArticleScrollPosition)initWithPosition:(id)a3 source:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NUArticleScrollPosition;
  v8 = [(NUArticleScrollPosition *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_position, a3);
    v9->_source = a4;
  }

  return v9;
}

- (SXScrollPosition)position
{
  return self->_position;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
}

@end