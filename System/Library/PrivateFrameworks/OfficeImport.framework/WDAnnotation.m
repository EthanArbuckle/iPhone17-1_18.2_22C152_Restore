@interface WDAnnotation
- (BOOL)isResolved;
- (BOOL)referencePropertiesFixed;
- (WDAnnotation)initWithParagraph:(id)a3 type:(int)a4;
- (WDAnnotation)parent;
- (id)data;
- (id)date;
- (id)description;
- (id)otherEndOfRangedAnnotation;
- (id)owner;
- (id)paragraphIds;
- (id)reference;
- (id)text;
- (int)annotationType;
- (int)runType;
- (unint64_t)lastParagraphId;
- (void)setDate:(id)a3;
- (void)setIsResolved:(BOOL)a3;
- (void)setOtherEndOfRangedAnnotation:(id)a3;
- (void)setOwner:(id)a3;
- (void)setParent:(id)a3;
- (void)setReferencePropertiesFixed;
- (void)useDataFromOtherEnd;
@end

@implementation WDAnnotation

- (WDAnnotation)initWithParagraph:(id)a3 type:(int)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WDAnnotation;
  v7 = [(WDRun *)&v18 initWithParagraph:v6];
  if (v7)
  {
    v8 = [v6 document];
    v9 = [[WDCharacterRun alloc] initWithParagraph:v6];
    mReference = v7->mReference;
    v7->mReference = v9;

    [(WDCharacterRun *)v7->mReference setString:@"\x05"];
    v11 = [WDText alloc];
    v12 = [v6 text];
    v13 = [v12 tableCell];
    v14 = [(WDText *)v11 initWithDocument:v8 textType:4 tableCell:v13];

    v15 = [[WDAnnotationData alloc] initWithText:v14];
    mData = v7->mData;
    v7->mData = v15;

    v7->mType = a4;
  }

  return v7;
}

- (id)text
{
  return [(WDAnnotationData *)self->mData text];
}

- (id)reference
{
  return self->mReference;
}

- (void)setDate:(id)a3
{
}

- (void)setOwner:(id)a3
{
}

- (int)runType
{
  return 9;
}

- (BOOL)referencePropertiesFixed
{
  return self->mReferencePopertiesFixed;
}

- (void)setReferencePropertiesFixed
{
  self->mReferencePopertiesFixed = 1;
}

- (int)annotationType
{
  return self->mType;
}

- (id)date
{
  return [(WDAnnotationData *)self->mData date];
}

- (id)owner
{
  return [(WDAnnotationData *)self->mData owner];
}

- (id)data
{
  return self->mData;
}

- (void)useDataFromOtherEnd
{
  p_mOtherEndOfRangedAnnotation = &self->mOtherEndOfRangedAnnotation;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mOtherEndOfRangedAnnotation);
  v5 = [WeakRetained data];

  id v6 = objc_loadWeakRetained((id *)p_mOtherEndOfRangedAnnotation);
  v7 = [v6 parent];
  int v8 = [v7 annotationType];

  id v9 = objc_loadWeakRetained((id *)p_mOtherEndOfRangedAnnotation);
  v10 = [v9 parent];
  if (v8 == 2)
  {
    [(WDAnnotation *)self setParent:v10];
  }
  else
  {
    v11 = [v10 otherEndOfRangedAnnotation];
    [(WDAnnotation *)self setParent:v11];
  }
  mData = self->mData;
  self->mData = v5;
}

- (id)otherEndOfRangedAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mOtherEndOfRangedAnnotation);
  return WeakRetained;
}

- (void)setOtherEndOfRangedAnnotation:(id)a3
{
}

- (id)paragraphIds
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(WDAnnotation *)self text];
  v5 = [v4 paragraphs];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__WDAnnotation_paragraphIds__block_invoke;
  v8[3] = &unk_264D683B8;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __28__WDAnnotation_paragraphIds__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = objc_opt_class();
  v4 = TSUDynamicCast(v3, (uint64_t)v8);
  v5 = v4;
  if (v4)
  {
    id v6 = *(void **)(a1 + 32);
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "identifier"));
    [v6 addObject:v7];
  }
}

- (unint64_t)lastParagraphId
{
  v2 = [(WDAnnotation *)self text];
  uint64_t v3 = [v2 paragraphs];
  v4 = [v3 lastObject];
  unint64_t v5 = [v4 identifier];

  return v5;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDAnnotation;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (BOOL)isResolved
{
  return self->isResolved;
}

- (void)setIsResolved:(BOOL)a3
{
  self->isResolved = a3;
}

- (WDAnnotation)parent
{
  return self->parent;
}

- (void)setParent:(id)a3
{
  self->parent = (WDAnnotation *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mOtherEndOfRangedAnnotation);
  objc_storeStrong((id *)&self->mData, 0);
  objc_storeStrong((id *)&self->mReference, 0);
}

@end