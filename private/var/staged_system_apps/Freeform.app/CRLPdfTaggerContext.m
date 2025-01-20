@interface CRLPdfTaggerContext
- (CRLPdfTaggerContext)initWithStateOfTagger:(id)a3;
- (CRLPdfTaggerState)taggerState;
@end

@implementation CRLPdfTaggerContext

- (CRLPdfTaggerContext)initWithStateOfTagger:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLPdfTaggerContext;
  v5 = [(CRLPdfTaggerContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 state];
    taggerState = v5->_taggerState;
    v5->_taggerState = (CRLPdfTaggerState *)v6;
  }
  return v5;
}

- (CRLPdfTaggerState)taggerState
{
  return self->_taggerState;
}

- (void).cxx_destruct
{
}

@end