@interface SXArticleURLFactory
- (id)createArticleURLWithIdentifier:(id)a3;
@end

@implementation SXArticleURLFactory

- (id)createArticleURLWithIdentifier:(id)a3
{
  v3 = NSURL;
  v4 = [NSString stringWithFormat:@"https://apple.news/%@", a3];
  v5 = [v3 URLWithString:v4];

  return v5;
}

@end