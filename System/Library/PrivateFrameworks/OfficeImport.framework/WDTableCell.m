@interface WDTableCell
- (BOOL)useTrackedProperties;
- (WDTableCell)initWithRow:(id)a3 at:(unint64_t)a4;
- (WDTableRow)row;
- (id)description;
- (id)identifier;
- (id)properties;
- (id)text;
- (int64_t)compareIndex:(id)a3;
- (unint64_t)index;
- (void)clearProperties;
- (void)setIdentifier:(id)a3;
- (void)setUseTrackedProperties:(BOOL)a3;
@end

@implementation WDTableCell

- (WDTableCell)initWithRow:(id)a3 at:(unint64_t)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WDTableCell;
  v7 = [(WDTableCell *)&v22 init];
  v8 = v7;
  if (v7)
  {
    id v9 = objc_storeWeak((id *)&v7->mRow, v6);
    v8->mIndex = a4;
    id v10 = v9;
    v11 = [v6 table];

    v12 = [WDText alloc];
    v13 = [v11 document];
    uint64_t v14 = -[WDText initWithDocument:textType:tableCell:](v12, "initWithDocument:textType:tableCell:", v13, [v11 textType], v8);
    mText = v8->mText;
    v8->mText = (WDText *)v14;

    v16 = [WDTableCellProperties alloc];
    v17 = [v11 document];
    uint64_t v18 = [(WDTableCellProperties *)v16 initWithDocument:v17];
    mProperties = v8->mProperties;
    v8->mProperties = (WDTableCellProperties *)v18;

    mIdentifier = v8->mIdentifier;
    v8->mIdentifier = 0;
  }
  return v8;
}

- (id)properties
{
  return self->mProperties;
}

- (id)text
{
  return self->mText;
}

- (WDTableRow)row
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mRow);
  return (WDTableRow *)WeakRetained;
}

- (BOOL)useTrackedProperties
{
  return self->mUseTrackedProperties;
}

- (void)setUseTrackedProperties:(BOOL)a3
{
  self->mUseTrackedProperties = a3;
}

- (unint64_t)index
{
  return self->mIndex;
}

- (int64_t)compareIndex:(id)a3
{
  unint64_t mIndex = self->mIndex;
  unint64_t v4 = *((void *)a3 + 1);
  BOOL v5 = mIndex >= v4;
  int64_t v6 = mIndex > v4;
  if (v5) {
    return v6;
  }
  else {
    return -1;
  }
}

- (void)clearProperties
{
  mProperties = self->mProperties;
  self->mProperties = 0;
}

- (id)identifier
{
  return self->mIdentifier;
}

- (void)setIdentifier:(id)a3
{
  id v6 = a3;
  unint64_t v4 = (NSString *)[v6 copy];
  mIdentifier = self->mIdentifier;
  self->mIdentifier = v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDTableCell;
  v2 = [(WDTableCell *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mRow);
  objc_storeStrong((id *)&self->mIdentifier, 0);
  objc_storeStrong((id *)&self->mText, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end