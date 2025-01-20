@interface PMShapeTextMapper
- (BOOL)isTableCellContent;
- (PMShapeTextMapper)initWithOadTextBody:(id)a3 bounds:(id)a4 parent:(id)a5;
- (unsigned)textAnchor;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)setRectangular:(BOOL)a3;
@end

@implementation PMShapeTextMapper

- (PMShapeTextMapper)initWithOadTextBody:(id)a3 bounds:(id)a4 parent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PMShapeTextMapper;
  v12 = [(CMMapper *)&v17 initWithParent:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mTextBody, a3);
    objc_storeStrong((id *)&v13->mBounds, a4);
    v14 = objc_alloc_init(CMStyle);
    mStyle = v13->mStyle;
    v13->mStyle = v14;
  }
  return v13;
}

- (void)setRectangular:(BOOL)a3
{
  self->mRectangular = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mTextBody = self->mTextBody;
  if (!mTextBody) {
    goto LABEL_28;
  }
  id v9 = [(OADTextBody *)mTextBody properties];
  v36 = +[OIXMLElement elementWithType:3];
  [v6 addChild:v36];
  id v37 = v36;

  if ([v9 hasTopInset])
  {
    mStyle = self->mStyle;
    [v9 topInset];
    [(CMStyle *)mStyle appendPropertyForName:0x26EC07B78 length:1 unit:v11];
  }
  float v12 = 0.0;
  if ([v9 hasLeftInset])
  {
    v13 = self->mStyle;
    [v9 leftInset];
    [(CMStyle *)v13 appendPropertyForName:0x26EC07B58 length:1 unit:v14];
    [v9 leftInset];
    float v12 = 0.0 - v15;
  }
  if ([v9 hasBottomInset])
  {
    v16 = self->mStyle;
    [v9 bottomInset];
    [(CMStyle *)v16 appendPropertyForName:0x26EC19458 length:1 unit:v17];
  }
  if ([v9 hasRightInset])
  {
    v18 = self->mStyle;
    [v9 rightInset];
    [(CMStyle *)v18 appendPropertyForName:0x26EC19478 length:1 unit:v19];
    [v9 rightInset];
    float v12 = v12 - v20;
  }
  if ([(PMShapeTextMapper *)self isTableCellContent])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);
    [WeakRetained widthWithState:v7];
    [(CMStyle *)self->mStyle appendPropertyForName:0x26EBFB8D8 length:1 unit:(float)(v12 + v22)];
    [(CMStyle *)self->mStyle appendPropertyForName:0x26EC060D8 stringValue:0x26EC07AF8];
  }
  int v23 = [v9 textAnchorType];
  BOOL v24 = [(PMShapeTextMapper *)self isTableCellContent];
  v25 = &_OBJC_LABEL_PROTOCOL___CMMapperRootArchiver;
  if (v24)
  {
    id v26 = v37;
  }
  else
  {
    id v26 = v37;
    if ((v23 - 1) <= 1u)
    {
      -[CMStyle appendPropertyForName:stringValue:](self->mStyle, "appendPropertyForName:stringValue:");
      if (v23 == 2)
      {
        [(OADOrientedBounds *)self->mBounds bounds];
        double Width = CGRectGetWidth(v40);
        [(OADOrientedBounds *)self->mBounds bounds];
        -[CMStyle appendPositionInfoFromRect:](self->mStyle, "appendPositionInfoFromRect:", 0.0, -10000.0, Width, CGRectGetHeight(v41) + 10000.0);
        [(CMStyle *)self->mStyle appendPropertyForName:0x26EC07038 stringWithColons:@":absolute;"];
      }
      else
      {
        v28 = self->mStyle;
        [(OADOrientedBounds *)self->mBounds bounds];
        -[CMStyle appendSizeInfoFromRect:](v28, "appendSizeInfoFromRect:");
      }
      id v6 = +[OIXMLElement elementWithType:3];
      v29 = objc_alloc_init(CMStyle);
      [(CMStyle *)v29 appendPropertyForName:0x26EC193F8 stringValue:@"table-cell"];
      v30 = (uint64_t *)HUPropValBottom;
      if (v23 == 1) {
        v30 = &HUPropValMiddle;
      }
      [(CMStyle *)v29 appendPropertyForName:0x26EC18B78 stringValue:*v30];
      v39.receiver = self;
      v39.super_class = (Class)PMShapeTextMapper;
      [(CMMapper *)&v39 addStyleUsingGlobalCacheTo:v6 style:v29];
      [v37 addChild:v6];
      id v26 = v37;

      v25 = &_OBJC_LABEL_PROTOCOL___CMMapperRootArchiver;
      goto LABEL_22;
    }
  }
  id v6 = v26;
LABEL_22:
  v31 = self->mStyle;
  v38.receiver = self;
  v38.super_class = (Class)PMShapeTextMapper;
  objc_msgSendSuper2(&v38, (SEL)v25[388], v26, v31);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [v7 listState];
    [v32 reset];
    for (unint64_t i = 0; i < [(OADTextBody *)self->mTextBody paragraphCount]; ++i)
    {
      v34 = [(OADTextBody *)self->mTextBody paragraphAtIndex:i];
      v35 = [[PMParagraphMapper alloc] initWithOadParagraph:v34 parent:self];
      [(PMParagraphMapper *)v35 mapAt:v6 withState:v7 isFirstParagraph:i == 0];
    }
  }

LABEL_28:
}

- (BOOL)isTableCellContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unsigned)textAnchor
{
  v2 = [(OADTextBody *)self->mTextBody properties];
  unsigned __int8 v3 = [v2 textAnchorType];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mBounds, 0);
  objc_storeStrong((id *)&self->mTextBody, 0);
}

@end