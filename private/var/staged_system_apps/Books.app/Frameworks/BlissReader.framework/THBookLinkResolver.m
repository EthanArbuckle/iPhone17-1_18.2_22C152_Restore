@interface THBookLinkResolver
- (THBookLinkResolver)initWithDocumentLinkResolver:(id)a3 glossaryLinkResolver:(id)a4;
- (THDocumentLinkResolver)documentLinkResolver;
- (THGlossaryLinkResolver)glossaryLinkResolver;
- (id)anchorFromAbsoluteLink:(id)a3 presentationType:(id)a4;
- (void)dealloc;
- (void)setDocumentLinkResolver:(id)a3;
- (void)setGlossaryLinkResolver:(id)a3;
@end

@implementation THBookLinkResolver

- (THBookLinkResolver)initWithDocumentLinkResolver:(id)a3 glossaryLinkResolver:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THBookLinkResolver;
  v6 = [(THBookLinkResolver *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(THBookLinkResolver *)v6 setDocumentLinkResolver:a3];
    [(THBookLinkResolver *)v7 setGlossaryLinkResolver:a4];
  }
  return v7;
}

- (void)dealloc
{
  [(THBookLinkResolver *)self setDocumentLinkResolver:0];
  [(THBookLinkResolver *)self setGlossaryLinkResolver:0];
  v3.receiver = self;
  v3.super_class = (Class)THBookLinkResolver;
  [(THBookLinkResolver *)&v3 dealloc];
}

- (id)anchorFromAbsoluteLink:(id)a3 presentationType:(id)a4
{
  if (![(THBookLinkResolver *)self documentLinkResolver]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookLinkResolver anchorFromAbsoluteLink:presentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THBookLinkResolver.m") lineNumber:49 description:@"Book link resolver lacks document link resolver; initialization sequence error?"];
  }
  if (![(THBookLinkResolver *)self glossaryLinkResolver]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookLinkResolver anchorFromAbsoluteLink:presentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THBookLinkResolver.m") lineNumber:50 description:@"Book link resolver lacks glossary link resolver; initialization sequence error?"];
  }
  id result = [(THDocumentLinkResolver *)[(THBookLinkResolver *)self documentLinkResolver] anchorFromCustomLink:a3 presentationType:a4];
  if (!result)
  {
    if ([a3 isRelative])
    {
      return 0;
    }
    else
    {
      id result = [(THDocumentLinkResolver *)[(THBookLinkResolver *)self documentLinkResolver] anchorFromAbsoluteLink:a3 presentationType:a4];
      if (!result)
      {
        v8 = [(THBookLinkResolver *)self glossaryLinkResolver];
        return [(THGlossaryLinkResolver *)v8 anchorFromAbsoluteLink:a3];
      }
    }
  }
  return result;
}

- (THDocumentLinkResolver)documentLinkResolver
{
  return self->mDocumentLinkResolver;
}

- (void)setDocumentLinkResolver:(id)a3
{
}

- (THGlossaryLinkResolver)glossaryLinkResolver
{
  return self->mGlossaryLinkResolver;
}

- (void)setGlossaryLinkResolver:(id)a3
{
}

@end