@interface TSKAnnotationAuthorTextHighlightColorProvider
- (CGColor)cgColor;
- (TSKAnnotationAuthorTextHighlightColorProvider)initWithAnnotationAuthor:(id)a3;
- (void)dealloc;
@end

@implementation TSKAnnotationAuthorTextHighlightColorProvider

- (TSKAnnotationAuthorTextHighlightColorProvider)initWithAnnotationAuthor:(id)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKAnnotationAuthorTextHighlightColorProvider initWithAnnotationAuthor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 540, @"Invalid parameter not satisfying: %s", "annotationAuthor != nil");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSKAnnotationAuthorTextHighlightColorProvider;
  v7 = [(TSKAnnotationAuthorTextHighlightColorProvider *)&v9 init];
  if (v7) {
    v7->mAnnotationAuthor = (TSKAnnotationAuthor *)a3;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKAnnotationAuthorTextHighlightColorProvider;
  [(TSKAnnotationAuthorTextHighlightColorProvider *)&v3 dealloc];
}

- (CGColor)cgColor
{
  v2 = [(TSKAnnotationAuthor *)self->mAnnotationAuthor textHighlightColor];

  return (CGColor *)[(TSUColor *)v2 CGColor];
}

@end