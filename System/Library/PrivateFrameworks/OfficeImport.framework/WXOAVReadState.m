@interface WXOAVReadState
- (WXOAVReadState)initWithWXReadState:(id)a3;
- (id)currentParagraph;
- (id)nextVmlShapeIdToTextBoxMap;
- (id)wxReadState;
- (void)setCurrentParagraph:(id)a3;
@end

@implementation WXOAVReadState

- (WXOAVReadState)initWithWXReadState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 packagePart];
  v11.receiver = self;
  v11.super_class = (Class)WXOAVReadState;
  v7 = [(OAVReadState *)&v11 initWithClient:v5 packagePart:v6];

  objc_storeWeak((id *)&v7->mWxState, v4);
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mNextVmlShapeIdToTextBoxMap = v7->mNextVmlShapeIdToTextBoxMap;
  v7->mNextVmlShapeIdToTextBoxMap = v8;

  LODWORD(v6) = v7->super.super.super.mXMLFormat;
  if (v6 != [v4 xmlFormat]) {
    -[OCXState setupNSForXMLFormat:](v7, "setupNSForXMLFormat:", [v4 xmlFormat]);
  }

  return v7;
}

- (id)wxReadState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mWxState);
  return WeakRetained;
}

- (id)currentParagraph
{
  return self->mParagraph;
}

- (void)setCurrentParagraph:(id)a3
{
}

- (id)nextVmlShapeIdToTextBoxMap
{
  return self->mNextVmlShapeIdToTextBoxMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNextVmlShapeIdToTextBoxMap, 0);
  objc_storeStrong((id *)&self->mParagraph, 0);
  objc_destroyWeak((id *)&self->mWxState);
}

@end