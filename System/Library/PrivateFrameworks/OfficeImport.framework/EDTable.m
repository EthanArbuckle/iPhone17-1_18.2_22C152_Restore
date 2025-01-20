@interface EDTable
+ (id)tableWithResources:(id)a3;
- (BOOL)showColumnStripes;
- (BOOL)showFirstColumn;
- (BOOL)showLastColumn;
- (BOOL)showRowStripes;
- (EDTable)initWithResources:(id)a3;
- (id)columnFilters;
- (id)dataAreaBorderDxf;
- (id)dataAreaDxf;
- (id)description;
- (id)displayName;
- (id)headerRowBorderDxf;
- (id)headerRowDxf;
- (id)name;
- (id)style;
- (id)styleName;
- (id)tableBorderDxf;
- (id)tableColumns;
- (id)tableRange;
- (id)totalsRowBorderDxf;
- (id)totalsRowDxf;
- (unint64_t)dataAreaBorderDxfIndex;
- (unint64_t)dataAreaDxfIndex;
- (unint64_t)headerRowBorderDxfIndex;
- (unint64_t)headerRowCount;
- (unint64_t)headerRowDxfIndex;
- (unint64_t)styleIndex;
- (unint64_t)tableBorderDxfIndex;
- (unint64_t)totalsRowBorderDxfIndex;
- (unint64_t)totalsRowCount;
- (unint64_t)totalsRowDxfIndex;
- (void)setDataAreaBorderDxf:(id)a3;
- (void)setDataAreaBorderDxfIndex:(unint64_t)a3;
- (void)setDataAreaDxf:(id)a3;
- (void)setDataAreaDxfIndex:(unint64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setHeaderRowBorderDxf:(id)a3;
- (void)setHeaderRowBorderDxfIndex:(unint64_t)a3;
- (void)setHeaderRowCount:(unint64_t)a3;
- (void)setHeaderRowDxf:(id)a3;
- (void)setHeaderRowDxfIndex:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setShowColumnStripes:(BOOL)a3;
- (void)setShowFirstColumn:(BOOL)a3;
- (void)setShowLastColumn:(BOOL)a3;
- (void)setShowRowStripes:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setStyleIndex:(unint64_t)a3;
- (void)setStyleName:(id)a3;
- (void)setTableBorderDxf:(id)a3;
- (void)setTableBorderDxfIndex:(unint64_t)a3;
- (void)setTableRange:(id)a3;
- (void)setTotalsRowBorderDxf:(id)a3;
- (void)setTotalsRowBorderDxfIndex:(unint64_t)a3;
- (void)setTotalsRowCount:(unint64_t)a3;
- (void)setTotalsRowDxf:(id)a3;
- (void)setTotalsRowDxfIndex:(unint64_t)a3;
@end

@implementation EDTable

- (EDTable)initWithResources:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EDTable;
  v5 = [(EDTable *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(void *)&long long v7 = -1;
    *((void *)&v7 + 1) = -1;
    *(_OWORD *)&v6->mStyleIndex = v7;
    *(_OWORD *)&v6->mTotalsRowDxfIndex = v7;
    *(_OWORD *)&v6->mHeaderRowBorderDxfIndex = v7;
    *(_OWORD *)&v6->mDataAreaBorderDxfIndex = v7;
    *(_OWORD *)&v6->mHeaderRowCount = xmmword_238EDD5C0;
    v8 = objc_alloc_init(EDCollection);
    mTableColumns = v6->mTableColumns;
    v6->mTableColumns = v8;

    v10 = objc_alloc_init(EDCollection);
    mColumnFilters = v6->mColumnFilters;
    v6->mColumnFilters = v10;

    *(_DWORD *)&v6->mShowFirstColumn = 0x10000;
  }

  return v6;
}

- (void)setName:(id)a3
{
  v5 = (NSString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }
}

- (void)setDisplayName:(id)a3
{
  v5 = (NSString *)a3;
  mDisplayName = self->mDisplayName;
  p_mDisplayName = &self->mDisplayName;
  if (mDisplayName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDisplayName, a3);
    v5 = v8;
  }
}

- (void)setTableRange:(id)a3
{
  v5 = (EDReference *)a3;
  mTableRange = self->mTableRange;
  p_mTableRange = &self->mTableRange;
  if (mTableRange != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mTableRange, a3);
    v5 = v8;
  }
}

- (id)tableColumns
{
  return self->mTableColumns;
}

- (id)name
{
  return self->mName;
}

- (void)setTableBorderDxfIndex:(unint64_t)a3
{
  self->mTableBorderDxfIndex = a3;
}

- (void)setShowFirstColumn:(BOOL)a3
{
  self->mShowFirstColumn = a3;
}

- (void)setShowLastColumn:(BOOL)a3
{
  self->mShowLastColumn = a3;
}

- (void)setShowRowStripes:(BOOL)a3
{
  self->mShowRowStripes = a3;
}

- (void)setShowColumnStripes:(BOOL)a3
{
  self->mShowColumnStripes = a3;
}

- (id)columnFilters
{
  return self->mColumnFilters;
}

- (void)setStyleName:(id)a3
{
  v5 = (NSString *)a3;
  mStyleName = self->mStyleName;
  p_mStyleName = &self->mStyleName;
  if (mStyleName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mStyleName, a3);
    v5 = v8;
  }
}

- (id)tableRange
{
  return self->mTableRange;
}

- (unint64_t)headerRowCount
{
  return self->mHeaderRowCount;
}

- (unint64_t)totalsRowCount
{
  return self->mTotalsRowCount;
}

- (id)style
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained tableStyles];

  v5 = [v4 objectWithName:self->mStyleName];

  return v5;
}

- (id)tableBorderDxf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained differentialStyles];

  v5 = [v4 objectAtIndex:self->mTableBorderDxfIndex];

  return v5;
}

- (BOOL)showFirstColumn
{
  return self->mShowFirstColumn;
}

- (BOOL)showLastColumn
{
  return self->mShowLastColumn;
}

- (BOOL)showColumnStripes
{
  return self->mShowColumnStripes;
}

- (BOOL)showRowStripes
{
  return self->mShowRowStripes;
}

- (void)setHeaderRowDxfIndex:(unint64_t)a3
{
  self->mHeaderRowDxfIndex = a3;
}

- (void)setHeaderRowBorderDxfIndex:(unint64_t)a3
{
  self->mHeaderRowBorderDxfIndex = a3;
}

- (void)setTotalsRowBorderDxfIndex:(unint64_t)a3
{
  self->mTotalsRowBorderDxfIndex = a3;
}

- (void)setDataAreaDxfIndex:(unint64_t)a3
{
  self->mDataAreaDxfIndex = a3;
}

+ (id)tableWithResources:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
}

- (void)setStyle:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained tableStyles];

  self->mStyleIndex = [v5 addObject:v6];
}

- (id)headerRowDxf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained differentialStyles];

  v5 = [v4 objectAtIndex:self->mHeaderRowDxfIndex];

  return v5;
}

- (void)setHeaderRowDxf:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained differentialStyles];

  self->mHeaderRowDxfIndex = [v5 addObject:v6];
}

- (id)totalsRowDxf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained differentialStyles];

  v5 = [v4 objectAtIndex:self->mTotalsRowDxfIndex];

  return v5;
}

- (void)setTotalsRowDxf:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained differentialStyles];

  self->mTotalsRowDxfIndex = [v5 addObject:v6];
}

- (id)dataAreaDxf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained differentialStyles];

  v5 = [v4 objectAtIndex:self->mDataAreaDxfIndex];

  return v5;
}

- (void)setDataAreaDxf:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained differentialStyles];

  self->mDataAreaDxfIndex = [v5 addObject:v6];
}

- (id)headerRowBorderDxf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained differentialStyles];

  v5 = [v4 objectAtIndex:self->mHeaderRowBorderDxfIndex];

  return v5;
}

- (void)setHeaderRowBorderDxf:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained differentialStyles];

  self->mHeaderRowBorderDxfIndex = [v5 addObject:v6];
}

- (id)totalsRowBorderDxf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained differentialStyles];

  v5 = [v4 objectAtIndex:self->mTotalsRowBorderDxfIndex];

  return v5;
}

- (void)setTotalsRowBorderDxf:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained differentialStyles];

  self->mTotalsRowBorderDxfIndex = [v5 addObject:v6];
}

- (id)dataAreaBorderDxf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained differentialStyles];

  v5 = [v4 objectAtIndex:self->mDataAreaBorderDxfIndex];

  return v5;
}

- (void)setDataAreaBorderDxf:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained differentialStyles];

  self->mDataAreaBorderDxfIndex = [v5 addObject:v6];
}

- (void)setTableBorderDxf:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained differentialStyles];

  self->mTableBorderDxfIndex = [v5 addObject:v6];
}

- (id)displayName
{
  return self->mDisplayName;
}

- (id)styleName
{
  return self->mStyleName;
}

- (void)setHeaderRowCount:(unint64_t)a3
{
  self->mHeaderRowCount = a3;
}

- (void)setTotalsRowCount:(unint64_t)a3
{
  self->mTotalsRowCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColumnFilters, 0);
  objc_storeStrong((id *)&self->mTableColumns, 0);
  objc_storeStrong((id *)&self->mStyleName, 0);
  objc_storeStrong((id *)&self->mTableRange, 0);
  objc_storeStrong((id *)&self->mDisplayName, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)styleIndex
{
  return self->mStyleIndex;
}

- (void)setStyleIndex:(unint64_t)a3
{
  self->mStyleIndex = a3;
}

- (unint64_t)headerRowDxfIndex
{
  return self->mHeaderRowDxfIndex;
}

- (unint64_t)totalsRowDxfIndex
{
  return self->mTotalsRowDxfIndex;
}

- (void)setTotalsRowDxfIndex:(unint64_t)a3
{
  self->mTotalsRowDxfIndex = a3;
}

- (unint64_t)dataAreaDxfIndex
{
  return self->mDataAreaDxfIndex;
}

- (unint64_t)headerRowBorderDxfIndex
{
  return self->mHeaderRowBorderDxfIndex;
}

- (unint64_t)totalsRowBorderDxfIndex
{
  return self->mTotalsRowBorderDxfIndex;
}

- (unint64_t)dataAreaBorderDxfIndex
{
  return self->mDataAreaBorderDxfIndex;
}

- (void)setDataAreaBorderDxfIndex:(unint64_t)a3
{
  self->mDataAreaBorderDxfIndex = a3;
}

- (unint64_t)tableBorderDxfIndex
{
  return self->mTableBorderDxfIndex;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDTable;
  v2 = [(EDTable *)&v4 description];
  return v2;
}

@end