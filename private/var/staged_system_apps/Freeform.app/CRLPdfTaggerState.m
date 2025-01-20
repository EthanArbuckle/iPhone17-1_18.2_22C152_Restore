@interface CRLPdfTaggerState
- (CRLPdfTaggerState)initWithTagStackHeight:(unint64_t)a3;
- (unint64_t)tagStackHeight;
@end

@implementation CRLPdfTaggerState

- (CRLPdfTaggerState)initWithTagStackHeight:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLPdfTaggerState;
  result = [(CRLPdfTaggerState *)&v5 init];
  if (result) {
    result->_tagStackHeight = a3;
  }
  return result;
}

- (unint64_t)tagStackHeight
{
  return self->_tagStackHeight;
}

@end