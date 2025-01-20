@interface WDTableStyleOverride
- (BOOL)isCharacterPropertiesOverridden;
- (BOOL)isParagraphPropertiesOverridden;
- (BOOL)isTableCellStylePropertiesOverridden;
- (BOOL)isTablePropertiesOverridden;
- (BOOL)isTableRowPropertiesOverridden;
- (WDStyle)style;
- (WDTableStyleOverride)initWithDocument:(id)a3;
- (id)characterProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCharacterProperties;
- (id)mutableParagraphProperties;
- (id)mutableTableCellStyleProperties;
- (id)mutableTableRowProperties;
- (id)paragraphProperties;
- (id)tableCellStyleProperties;
- (id)tableProperties;
- (id)tableRowProperties;
- (int)part;
- (void)setCharacterPropertiesOverridden:(BOOL)a3;
- (void)setParagraphPropertiesOverridden:(BOOL)a3;
- (void)setPart:(int)a3;
- (void)setStyle:(id)a3;
- (void)setTableCellStylePropertiesOverridden:(BOOL)a3;
- (void)setTableRowPropertiesOverridden:(BOOL)a3;
@end

@implementation WDTableStyleOverride

- (WDTableStyleOverride)initWithDocument:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WDTableStyleOverride;
  v5 = [(WDTableStyleOverride *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mDocument, v4);
  }

  return v6;
}

- (void)setPart:(int)a3
{
  self->mPart = a3;
}

- (void)setStyle:(id)a3
{
}

- (WDStyle)style
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mStyle);
  return (WDStyle *)WeakRetained;
}

- (id)mutableParagraphProperties
{
  mParagraphProperties = self->mParagraphProperties;
  if (!mParagraphProperties)
  {
    id v4 = [WDParagraphProperties alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    v6 = [(WDParagraphProperties *)v4 initWithDocument:WeakRetained];
    v7 = self->mParagraphProperties;
    self->mParagraphProperties = v6;

    *((unsigned char *)self + 56) |= 1u;
    mParagraphProperties = self->mParagraphProperties;
  }
  return mParagraphProperties;
}

- (id)mutableCharacterProperties
{
  mCharacterProperties = self->mCharacterProperties;
  if (!mCharacterProperties)
  {
    id v4 = [WDCharacterProperties alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    v6 = [(WDCharacterProperties *)v4 initWithDocument:WeakRetained];
    v7 = self->mCharacterProperties;
    self->mCharacterProperties = v6;

    *((unsigned char *)self + 56) |= 2u;
    mCharacterProperties = self->mCharacterProperties;
  }
  return mCharacterProperties;
}

- (id)mutableTableCellStyleProperties
{
  mTableCellStyleProperties = self->mTableCellStyleProperties;
  if (!mTableCellStyleProperties)
  {
    id v4 = objc_alloc_init(WDTableCellProperties);
    v5 = self->mTableCellStyleProperties;
    self->mTableCellStyleProperties = v4;

    *((unsigned char *)self + 56) |= 8u;
    mTableCellStyleProperties = self->mTableCellStyleProperties;
  }
  return mTableCellStyleProperties;
}

- (BOOL)isTableRowPropertiesOverridden
{
  return (*((unsigned __int8 *)self + 56) >> 2) & 1;
}

- (BOOL)isTableCellStylePropertiesOverridden
{
  return (*((unsigned __int8 *)self + 56) >> 3) & 1;
}

- (id)tableCellStyleProperties
{
  return self->mTableCellStyleProperties;
}

- (id)mutableTableRowProperties
{
  mTableRowProperties = self->mTableRowProperties;
  if (!mTableRowProperties)
  {
    id v4 = [WDTableRowProperties alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    v6 = [(WDTableRowProperties *)v4 initWithDocument:WeakRetained];
    v7 = self->mTableRowProperties;
    self->mTableRowProperties = v6;

    *((unsigned char *)self + 56) |= 4u;
    mTableRowProperties = self->mTableRowProperties;
  }
  return mTableRowProperties;
}

- (int)part
{
  return self->mPart;
}

- (id)paragraphProperties
{
  return self->mParagraphProperties;
}

- (BOOL)isParagraphPropertiesOverridden
{
  return *((unsigned char *)self + 56) & 1;
}

- (void)setParagraphPropertiesOverridden:(BOOL)a3
{
  *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xFE | a3;
}

- (id)characterProperties
{
  return self->mCharacterProperties;
}

- (BOOL)isCharacterPropertiesOverridden
{
  return (*((unsigned __int8 *)self + 56) >> 1) & 1;
}

- (void)setCharacterPropertiesOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xFD | v3;
}

- (id)tableProperties
{
  return [(WDTableRowProperties *)self->mTableRowProperties tableProperties];
}

- (BOOL)isTablePropertiesOverridden
{
  return (*((unsigned __int8 *)self + 56) >> 2) & 1;
}

- (id)tableRowProperties
{
  return self->mTableRowProperties;
}

- (void)setTableRowPropertiesOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xFB | v3;
}

- (void)setTableCellStylePropertiesOverridden:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xF7 | v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[WDTableStyleOverride allocWithZone:a3] init];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mStyle);
    objc_storeWeak((id *)&v4->mStyle, WeakRetained);

    v4->mPart = self->mPart;
    uint64_t v6 = [(WDParagraphProperties *)self->mParagraphProperties copy];
    mParagraphProperties = v4->mParagraphProperties;
    v4->mParagraphProperties = (WDParagraphProperties *)v6;

    *((unsigned char *)v4 + 56) = *((unsigned char *)v4 + 56) & 0xFE | *((unsigned char *)self + 56) & 1;
    uint64_t v8 = [(WDCharacterProperties *)self->mCharacterProperties copy];
    mCharacterProperties = v4->mCharacterProperties;
    v4->mCharacterProperties = (WDCharacterProperties *)v8;

    *((unsigned char *)v4 + 56) = *((unsigned char *)v4 + 56) & 0xFD | *((unsigned char *)self + 56) & 2;
    uint64_t v10 = [(WDTableRowProperties *)self->mTableRowProperties copy];
    mTableRowProperties = v4->mTableRowProperties;
    v4->mTableRowProperties = (WDTableRowProperties *)v10;

    *((unsigned char *)v4 + 56) = *((unsigned char *)v4 + 56) & 0xFB | *((unsigned char *)self + 56) & 4;
    uint64_t v12 = [(WDTableCellProperties *)self->mTableCellStyleProperties copy];
    mTableCellStyleProperties = v4->mTableCellStyleProperties;
    v4->mTableCellStyleProperties = (WDTableCellProperties *)v12;

    *((unsigned char *)v4 + 56) = *((unsigned char *)v4 + 56) & 0xF7 | *((unsigned char *)self + 56) & 8;
    v14 = v4;
  }

  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDTableStyleOverride;
  v2 = [(WDTableStyleOverride *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mStyle);
  objc_storeStrong((id *)&self->mTableCellStyleProperties, 0);
  objc_storeStrong((id *)&self->mTableRowProperties, 0);
  objc_storeStrong((id *)&self->mCharacterProperties, 0);
  objc_storeStrong((id *)&self->mParagraphProperties, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end