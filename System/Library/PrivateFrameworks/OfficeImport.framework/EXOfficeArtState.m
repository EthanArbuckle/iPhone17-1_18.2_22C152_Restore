@interface EXOfficeArtState
- (EXOfficeArtState)initWithExcelState:(id)a3;
- (EXReadState)excelState;
@end

@implementation EXOfficeArtState

- (EXOfficeArtState)initWithExcelState:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(EXOfficeArtClient);
  v14.receiver = self;
  v14.super_class = (Class)EXOfficeArtState;
  v6 = [(OAXDrawingState *)&v14 initWithClient:v5];
  v7 = v6;
  if (v6)
  {
    id v8 = objc_storeWeak((id *)&v6->mExcelState, v4);
    int mXMLFormat = v7->super.super.super.mXMLFormat;
    id v10 = v8;
    int v11 = [v4 xmlFormat];

    if (mXMLFormat != v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v7->mExcelState);
      -[OAXDrawingState setupNSForXMLFormat:](v7, "setupNSForXMLFormat:", [WeakRetained xmlFormat]);
    }
  }

  return v7;
}

- (EXReadState)excelState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mExcelState);
  return (EXReadState *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end