@interface CRLPdfTaggerParagraphContext
- (BOOL)needsSpans;
- (CRLPdfTaggerParagraphContext)initWithStateOfTagger:(id)a3 needsSpans:(BOOL)a4;
@end

@implementation CRLPdfTaggerParagraphContext

- (CRLPdfTaggerParagraphContext)initWithStateOfTagger:(id)a3 needsSpans:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRLPdfTaggerParagraphContext;
  result = [(CRLPdfTaggerContext *)&v6 initWithStateOfTagger:a3];
  if (result) {
    result->_needsSpans = a4;
  }
  return result;
}

- (BOOL)needsSpans
{
  return self->_needsSpans;
}

@end