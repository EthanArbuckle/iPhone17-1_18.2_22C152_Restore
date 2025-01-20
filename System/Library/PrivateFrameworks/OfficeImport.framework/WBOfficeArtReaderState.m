@interface WBOfficeArtReaderState
- (WBOfficeArtReaderState)initWithClient:(Class)a3;
- (WBReader)reader;
- (id)xmlDrawingState;
- (int)currentTextType;
- (void)setCurrentTextType:(int)a3;
- (void)setReader:(id)a3;
@end

@implementation WBOfficeArtReaderState

- (WBOfficeArtReaderState)initWithClient:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WBOfficeArtReaderState;
  result = [(OABReaderState *)&v4 initWithClient:a3];
  if (result) {
    result->mCurrentTextType = -1;
  }
  return result;
}

- (void)setReader:(id)a3
{
}

- (void)setCurrentTextType:(int)a3
{
  self->mCurrentTextType = a3;
}

- (int)currentTextType
{
  return self->mCurrentTextType;
}

- (WBReader)reader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mReader);
  return (WBReader *)WeakRetained;
}

- (id)xmlDrawingState
{
  mXmlDocumentState = self->mXmlDocumentState;
  if (!mXmlDocumentState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mReader);
    v5 = [WeakRetained targetDocument];

    v6 = objc_alloc_init(WXReadState);
    v7 = self->mXmlDocumentState;
    self->mXmlDocumentState = v6;

    v8 = [(WXReadState *)self->mXmlDocumentState drawingState];
    v9 = [v5 colorMap];
    +[OABDrawable setUpXmlDrawingState:v8 withBinaryReaderState:self targetDocument:v5 colorMap:v9];

    mXmlDocumentState = self->mXmlDocumentState;
  }
  return [(WXReadState *)mXmlDocumentState drawingState];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mXmlDocumentState, 0);
  objc_destroyWeak((id *)&self->mReader);
}

@end