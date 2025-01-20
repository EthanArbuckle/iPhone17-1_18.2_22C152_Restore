@interface EXOAVState
- (EXOAVState)initWithEXReadState:(id)a3 packagePart:(id)a4;
- (EXReadState)exState;
@end

@implementation EXOAVState

- (EXReadState)exState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mEXReadState);
  return (EXReadState *)WeakRetained;
}

- (EXOAVState)initWithEXReadState:(id)a3 packagePart:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  v16.receiver = self;
  v16.super_class = (Class)EXOAVState;
  v9 = [(OAVReadState *)&v16 initWithClient:v8 packagePart:v7];
  id v10 = objc_storeWeak((id *)&v9->mEXReadState, v6);
  int mXMLFormat = v9->super.super.super.mXMLFormat;
  id v12 = v10;
  int v13 = [v6 xmlFormat];

  if (mXMLFormat != v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v9->mEXReadState);
    -[OCXState setupNSForXMLFormat:](v9, "setupNSForXMLFormat:", [WeakRetained xmlFormat]);
  }
  return v9;
}

- (void).cxx_destruct
{
}

@end