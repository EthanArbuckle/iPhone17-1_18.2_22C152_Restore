@interface WDStyle
- (BOOL)hidden;
- (BOOL)isAnythingOverridden;
- (WDStyle)baseStyle;
- (WDStyle)initWithStyleSheet:(id)a3 id:(id)a4 type:(int)a5;
- (WDStyle)nextStyle;
- (WDStyleSheet)styleSheet;
- (id)characterProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)id;
- (id)name;
- (id)paragraphProperties;
- (id)tableCellProperties;
- (id)tableProperties;
- (id)tableRowProperties;
- (id)tableStyleOverrideForPart:(int)a3;
- (int)type;
- (void)setBaseStyle:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNextStyle:(id)a3;
@end

@implementation WDStyle

- (WDStyle)initWithStyleSheet:(id)a3 id:(id)a4 type:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WDStyle;
  v10 = [(WDStyle *)&v29 init];
  if (v10)
  {
    v11 = [WDParagraphProperties alloc];
    v12 = [v8 document];
    uint64_t v13 = [(WDParagraphProperties *)v11 initWithDocument:v12];
    mParagraphProperties = v10->mParagraphProperties;
    v10->mParagraphProperties = (WDParagraphProperties *)v13;

    v15 = [WDCharacterProperties alloc];
    v16 = [v8 document];
    uint64_t v17 = [(WDCharacterProperties *)v15 initWithDocument:v16];
    mCharacterProperties = v10->mCharacterProperties;
    v10->mCharacterProperties = (WDCharacterProperties *)v17;

    v10->mStyleType = a5;
    if (a5 == 3)
    {
      v19 = [v8 document];
      v20 = [[WDTableRowProperties alloc] initWithDocument:v19];
      mTableRowProperties = v10->mTableRowProperties;
      v10->mTableRowProperties = v20;

      v22 = objc_alloc_init(WDTableCellProperties);
      mTableCellProperties = v10->mTableCellProperties;
      v10->mTableCellProperties = v22;

      uint64_t v24 = 0;
      mTableStyleOverrides = v10->mTableStyleOverrides;
      do
      {
        v26 = [[WDTableStyleOverride alloc] initWithDocument:v19];
        v27 = mTableStyleOverrides[v24];
        mTableStyleOverrides[v24] = v26;

        [(WDTableStyleOverride *)mTableStyleOverrides[v24] setPart:v24];
        ++v24;
      }
      while (v24 != 12);
    }
    objc_storeStrong((id *)&v10->mId, a4);
    objc_storeWeak((id *)&v10->mStyleSheet, v8);
  }

  return v10;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mStyleSheet);
  [WeakRetained setName:v5 forId:self->mId];
}

- (void)setHidden:(BOOL)a3
{
  self->mHidden = a3;
}

- (void)setBaseStyle:(id)a3
{
  v4 = (WDStyle *)a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = v4;
    while (v5 != self)
    {
      uint64_t v6 = [(WDStyle *)v5 baseStyle];

      id v5 = (WDStyle *)v6;
      if (!v6)
      {
        v7 = 0;
        id v8 = v9;
        goto LABEL_8;
      }
    }
    id v8 = 0;
    v7 = self;
LABEL_8:
  }
  else
  {
    id v8 = 0;
  }
  objc_storeWeak((id *)&self->mBaseStyle, v8);
}

- (void)setNextStyle:(id)a3
{
}

- (WDStyleSheet)styleSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mStyleSheet);
  return (WDStyleSheet *)WeakRetained;
}

- (id)paragraphProperties
{
  return self->mParagraphProperties;
}

- (id)characterProperties
{
  return self->mCharacterProperties;
}

- (int)type
{
  return self->mStyleType;
}

- (id)name
{
  return self->mName;
}

- (WDStyle)baseStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mBaseStyle);
  return (WDStyle *)WeakRetained;
}

- (id)tableRowProperties
{
  return self->mTableRowProperties;
}

- (id)tableCellProperties
{
  return self->mTableCellProperties;
}

- (id)tableStyleOverrideForPart:(int)a3
{
  return self->mTableStyleOverrides[a3];
}

- (id)id
{
  return self->mId;
}

- (id)tableProperties
{
  return [(WDTableRowProperties *)self->mTableRowProperties tableProperties];
}

- (BOOL)hidden
{
  return self->mHidden;
}

- (BOOL)isAnythingOverridden
{
  if (self->mHidden
    || [(WDParagraphProperties *)self->mParagraphProperties isAnythingOverridden])
  {
    return 1;
  }
  mCharacterProperties = self->mCharacterProperties;
  return [(WDCharacterProperties *)mCharacterProperties isAnythingOverridden];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[WDStyle allocWithZone:a3] init];
  if (v4)
  {
    uint64_t v5 = [(WDParagraphProperties *)self->mParagraphProperties copy];
    mParagraphProperties = v4->mParagraphProperties;
    v4->mParagraphProperties = (WDParagraphProperties *)v5;

    uint64_t v7 = [(WDCharacterProperties *)self->mCharacterProperties copy];
    mCharacterProperties = v4->mCharacterProperties;
    v4->mCharacterProperties = (WDCharacterProperties *)v7;

    uint64_t v9 = [(WDTableRowProperties *)self->mTableRowProperties copy];
    mTableRowProperties = v4->mTableRowProperties;
    v4->mTableRowProperties = (WDTableRowProperties *)v9;

    uint64_t v11 = [(WDTableCellProperties *)self->mTableCellProperties copy];
    mTableCellProperties = v4->mTableCellProperties;
    v4->mTableCellProperties = (WDTableCellProperties *)v11;

    id WeakRetained = objc_loadWeakRetained((id *)&self->mStyleSheet);
    objc_storeWeak((id *)&v4->mStyleSheet, WeakRetained);

    for (uint64_t i = 40; i != 136; i += 8)
    {
      uint64_t v15 = [*(id *)((char *)&self->super.isa + i) copy];
      v16 = *(Class *)((char *)&v4->super.isa + i);
      *(Class *)((char *)&v4->super.isa + i) = (Class)v15;
    }
    uint64_t v17 = [(NSString *)self->mName copy];
    mName = v4->mName;
    v4->mName = (NSString *)v17;

    v4->mStyleType = self->mStyleType;
    id v19 = objc_loadWeakRetained((id *)&self->mBaseStyle);
    [(WDStyle *)v4 setBaseStyle:v19];

    id v20 = objc_loadWeakRetained((id *)&self->mNextStyle);
    [(WDStyle *)v4 setNextStyle:v20];
  }
  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDStyle;
  v2 = [(WDStyle *)&v4 description];
  return v2;
}

- (WDStyle)nextStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mNextStyle);
  return (WDStyle *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mNextStyle);
  objc_destroyWeak((id *)&self->mBaseStyle);
  objc_destroyWeak((id *)&self->mStyleSheet);
  objc_storeStrong((id *)&self->mId, 0);
  objc_storeStrong((id *)&self->mName, 0);
  for (uint64_t i = 128; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->mTableCellProperties, 0);
  objc_storeStrong((id *)&self->mTableRowProperties, 0);
  objc_storeStrong((id *)&self->mCharacterProperties, 0);
  objc_storeStrong((id *)&self->mParagraphProperties, 0);
}

@end