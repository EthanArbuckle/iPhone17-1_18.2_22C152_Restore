@interface PBOfficeArtReaderState
- (PBOfficeArtReaderState)initWithPresentationState:(id)a3;
- (PBPresentationReaderState)presentationState;
- (id)drawableOnTgtSlideForShapeId:(int)a3;
- (id)xmlDocumentState;
- (id)xmlDrawingState;
@end

@implementation PBOfficeArtReaderState

- (PBOfficeArtReaderState)initWithPresentationState:(id)a3
{
  id v4 = a3;
  v5 = [(OABReaderState *)self initWithClient:objc_opt_class()];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mPresentationState, v4);
  }

  return v6;
}

- (PBPresentationReaderState)presentationState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  return (PBPresentationReaderState *)WeakRetained;
}

- (id)xmlDrawingState
{
  mXmlDocumentState = self->mXmlDocumentState;
  if (!mXmlDocumentState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
    v5 = [WeakRetained tgtPresentation];

    v6 = objc_alloc_init(PXPresentationState);
    v7 = self->mXmlDocumentState;
    self->mXmlDocumentState = v6;

    v8 = [(PXPresentationState *)self->mXmlDocumentState officeArtState];
    +[OABDrawable setUpXmlDrawingState:v8 withBinaryReaderState:self targetDocument:v5 colorMap:0];

    mXmlDocumentState = self->mXmlDocumentState;
  }
  return [(PXPresentationState *)mXmlDocumentState officeArtState];
}

- (id)xmlDocumentState
{
  v2 = [(PBOfficeArtReaderState *)self xmlDrawingState];
  v3 = [v2 client];
  id v4 = [v3 presentationState];

  return v4;
}

- (id)drawableOnTgtSlideForShapeId:(int)a3
{
  id v4 = [(OABReaderState *)self drawableForShapeId:*(void *)&a3];
  if (v4)
  {
    v5 = [(PBOfficeArtReaderState *)self presentationState];
    v6 = [v5 tgtSlide];

    if (v6)
    {
      while (1)
      {
        v7 = [v6 drawables];
        char v8 = [v7 containsObject:v4];

        if (v8) {
          break;
        }
        uint64_t v9 = [v6 parentSlideBase];

        v6 = (void *)v9;
        if (!v9) {
          goto LABEL_5;
        }
      }
    }
    else
    {
LABEL_5:
      v6 = v4;
      id v4 = 0;
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mPresentationState);
  objc_storeStrong((id *)&self->mXmlDocumentState, 0);
}

@end