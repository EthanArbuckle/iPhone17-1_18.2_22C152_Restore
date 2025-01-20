@interface CRLPdfTaggerDrawableContext
- (CRLCanvasRep)drawableRep;
- (CRLPdfTaggerDrawableContext)initWithStateOfTagger:(id)a3 drawableRep:(id)a4;
- (CRLPdfTaggerState)taggerStateOutsideCore;
- (void)setTaggerStateOutsideCore:(id)a3;
@end

@implementation CRLPdfTaggerDrawableContext

- (CRLPdfTaggerDrawableContext)initWithStateOfTagger:(id)a3 drawableRep:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLPdfTaggerDrawableContext;
  v8 = [(CRLPdfTaggerContext *)&v11 initWithStateOfTagger:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_drawableRep, a4);
  }

  return v9;
}

- (CRLCanvasRep)drawableRep
{
  return self->_drawableRep;
}

- (CRLPdfTaggerState)taggerStateOutsideCore
{
  return self->_taggerStateOutsideCore;
}

- (void)setTaggerStateOutsideCore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taggerStateOutsideCore, 0);

  objc_storeStrong((id *)&self->_drawableRep, 0);
}

@end