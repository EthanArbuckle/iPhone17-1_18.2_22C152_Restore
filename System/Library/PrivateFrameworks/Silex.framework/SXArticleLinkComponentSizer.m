@interface SXArticleLinkComponentSizer
- (SXArticleLinkComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
@end

@implementation SXArticleLinkComponentSizer

- (SXArticleLinkComponentSizer)initWithComponent:(id)a3 componentLayout:(id)a4 componentStyle:(id)a5 DOMObjectProvider:(id)a6 layoutOptions:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)SXArticleLinkComponentSizer;
  return [(SXComponentSizer *)&v8 initWithComponent:a3 componentLayout:a4 componentStyle:a5 DOMObjectProvider:a6 layoutOptions:a7];
}

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  return 100.0;
}

@end