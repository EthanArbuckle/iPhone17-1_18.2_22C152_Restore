@interface FRArticleContentPoolEntry
- (FCArticleContent)content;
- (FRFlintDataProvider)flintDataProvider;
- (void)setContent:(id)a3;
- (void)setFlintDataProvider:(id)a3;
@end

@implementation FRArticleContentPoolEntry

- (FCArticleContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (FRFlintDataProvider)flintDataProvider
{
  return self->_flintDataProvider;
}

- (void)setFlintDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flintDataProvider, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end