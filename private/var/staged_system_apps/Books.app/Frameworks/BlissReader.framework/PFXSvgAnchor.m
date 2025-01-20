@interface PFXSvgAnchor
- (BOOL)mapStartElementWithState:(id)a3;
- (NSURL)URL;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation PFXSvgAnchor

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXSvgAnchor;
  [(PFXSvgAnchor *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "valueForAttribute:", "href");
  if (v4)
  {
    id v5 = v4;
    if ([v4 length]) {
      [(PFXSvgAnchor *)self setURL:+[NSURL URLWithString:v5]];
    }
  }
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  objc_msgSend(objc_msgSend(v4, "parentEntryMediaState"), "addChildResultsFromState:", v4);
  id v5 = (char *)[v4 childResultCount];
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      [v4 childResultAtIndex:i];
      objc_opt_class();
      v8 = (void *)TSUDynamicCast();
      if ([(PFXSvgAnchor *)self URL]) {
        [v8 setHyperlinkURL:[self URL]];
      }
    }
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

@end