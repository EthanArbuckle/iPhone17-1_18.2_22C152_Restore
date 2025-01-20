@interface PFAIFlowInfo
+ (double)lengthForAttribute:(const char *)a3 contentState:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIFlowInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIFlowInfo;
  [(PFAIFlowInfo *)&v3 dealloc];
}

+ (double)lengthForAttribute:(const char *)a3 contentState:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a4, "currentStackEntry"), "valueForAttribute:", a3);

  +[PFXStyleUtilities pointLengthInString:v5 readerState:a4];
  return result;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  id v6 = [a3 flowState];
  v7 = objc_alloc_init(PFSStyleSelector);
  PFSStyleSimpleSelector::setElement((PFSStyleSimpleSelector *)[(PFSStyleSelector *)v7 addSimpleSelector], "html");
  PFSStyleSimpleSelector::setElement((PFSStyleSimpleSelector *)[(PFSStyleSelector *)v7 addSimpleSelector], "body");
  [(PFSStyleSelector *)v7 freeze];
  self->mPropertySet = (PFSPropertySet *)objc_msgSend(objc_msgSend(v6, "styleCache"), "createPropertySetWithSelector:", v7);

  +[PFXStyleUtilities pointLengthInArray:[(PFSPropertySet *)self->mPropertySet valueForProperty:PFXPropNmApplePubHeadHeight[0]] readerState:a3];
  double v9 = v8;
  v10 = -[THModelPageInfo initWithContext:]([THModelFlowPageInfo alloc], "initWithContext:", [a3 tspContext]);
  id v11 = [objc_alloc((Class)TSDInfoGeometry) initWithSize:768.0, v9];
  [(THModelPageInfo *)v10 setGeometry:v11];
  [(THModelPageInfo *)v10 setAutosizes:1];
  objc_msgSend(objc_msgSend(v6, "contentNodeBody"), "addPageInfo:", v10);

  objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", 1);
  objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", 0);
  [v6 takeHintsFromState:[a3 paginatedState]];
  [a3 setInFlowHeader:1];
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 flowState];
  objc_opt_class();
  [(PFSPropertySet *)self->mPropertySet valueForProperty:"margin"];
  id v6 = (void *)TSUDynamicCast();
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if ([v6 count] == &dword_4)
  {
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v6 objectAtIndex:0], a3);
    double v9 = v10;
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v6 objectAtIndex:1], a3);
    double v8 = v11;
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v6 objectAtIndex:3], a3);
    double v7 = v12;
  }
  +[PFXStyleUtilities pointLengthInArray:[(PFSPropertySet *)self->mPropertySet valueForProperty:PFXPropNmApplePubHeadHeight[0]] readerState:a3];
  double v14 = v13;
  id v15 = [[[v5 contentNodeBody] pages] lastObject];
  id v16 = [objc_alloc((Class)TSDInfoGeometry) initWithPosition:v7 size:v9 + v14];
  v17 = -[THModelBodyTextInfo initWithContext:geometry:]([THModelBodyTextInfo alloc], "initWithContext:geometry:", [a3 tspContext], v16);

  [(THModelBodyTextInfo *)v17 setAutosizes:1];
  id v18 = [objc_alloc((Class)TSSPropertyMap) initWithCapacity:3];
  id v19 = [objc_alloc((Class)TSWPColumns) initWithColumnCount:1];
  [v18 setObject:v19 forProperty:148];

  id v20 = [objc_alloc((Class)TSWPPadding) initWithTopInset:0.0 leftInset:0.0 bottomInset:0.0 rightInset:0.0];
  [v18 setObject:v20 forProperty:146];

  [v18 setIntValue:0 forProperty:149];
  id v21 = objc_msgSend(objc_alloc((Class)TSWPColumnStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), @"Flow Column Style", v18, 0);
  [(THModelBodyTextInfo *)v17 setColumnStyle:v21];

  [v15 addBodyBoxInfo:v17 insertContext:0];
  objc_msgSend(objc_msgSend(v15, "drawablesZOrder"), "addDrawable:", v17);
  objc_msgSend(objc_msgSend(v15, "drawablesZOrder"), "addDrawable:", objc_msgSend(v5, "bodyStorage"));

  objc_msgSend(objc_msgSend(a3, "paginatedState"), "takeHintsFromState:", v5);

  [a3 setInFlowHeader:0];
}

@end