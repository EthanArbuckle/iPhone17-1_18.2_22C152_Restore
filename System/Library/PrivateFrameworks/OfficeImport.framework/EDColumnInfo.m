@interface EDColumnInfo
+ (id)columnInfoWithResources:(id)a3 worksheet:(id)a4;
- (BOOL)isHidden;
- (EDColumnInfo)initWithResources:(id)a3 worksheet:(id)a4;
- (NSString)description;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)range;
- (id)style;
- (int)widthInXlUnits;
- (int64_t)key;
- (unint64_t)styleIndex;
- (unsigned)outlineLevel;
- (void)setHidden:(BOOL)a3;
- (void)setOutlineLevel:(unsigned __int8)a3;
- (void)setRange:(id)a3;
- (void)setRangeWithFirstColumn:(int)a3 lastColumn:(int)a4;
- (void)setStyle:(id)a3;
- (void)setStyleIndex:(unint64_t)a3;
- (void)setWidth:(double)a3;
- (void)setWidthInXlUnits:(int)a3;
@end

@implementation EDColumnInfo

- (EDColumnInfo)initWithResources:(id)a3 worksheet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EDColumnInfo;
  v8 = [(EDColumnInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->mWorksheet, v7);
    objc_storeWeak((id *)&v9->mResources, v6);
    v9->mWidth = 0;
    v9->mHidden = 0;
    v9->mStyleIndex = -1;
    v9->mOutlineLevel = 0;
  }

  return v9;
}

- (void)setWidthInXlUnits:(int)a3
{
  self->mWidth = a3;
}

- (void)setHidden:(BOOL)a3
{
  self->mHidden = a3;
}

- (void)setRangeWithFirstColumn:(int)a3 lastColumn:(int)a4
{
  id v5 = +[EDReference referenceWithFirstRow:0xFFFFFFFFLL lastRow:0xFFFFFFFFLL firstColumn:*(void *)&a3 lastColumn:*(void *)&a4];
  -[EDColumnInfo setRange:](self, "setRange:");
}

- (void)setRange:(id)a3
{
  id v5 = (EDReference *)a3;
  mRange = self->mRange;
  p_mRange = &self->mRange;
  if (mRange != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mRange, a3);
    id v5 = v8;
  }
}

- (void)setStyleIndex:(unint64_t)a3
{
  self->mStyleIndex = a3;
}

- (void)setOutlineLevel:(unsigned __int8)a3
{
  self->mOutlineLevel = a3;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mWorksheet);
    [WeakRetained updateMaxColumnOutlineLevelIfNeeded:self->mOutlineLevel];
  }
}

- (int64_t)key
{
  return [(EDReference *)self->mRange firstColumn];
}

- (id)range
{
  return self->mRange;
}

- (BOOL)isHidden
{
  return self->mHidden;
}

- (double)width
{
  double v3 = (double)[(EDColumnInfo *)self widthInXlUnits] * 0.00390625;
  if (v3 == 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mWorksheet);
    [WeakRetained defaultColumnWidth];
    double v3 = v5;
  }
  p_mWorksheet = &self->mWorksheet;
  id v7 = objc_loadWeakRetained((id *)p_mWorksheet);
  if (v7)
  {
    v8 = v7;
    id v9 = objc_loadWeakRetained((id *)p_mWorksheet);
    int v10 = [v9 isDisplayFormulas];

    if (v10) {
      return v3 + v3;
    }
  }
  return v3;
}

- (int)widthInXlUnits
{
  return self->mWidth;
}

- (id)style
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v4 = [WeakRetained styles];

  double v5 = [v4 objectAtIndex:self->mStyleIndex];

  return v5;
}

- (void)setWidth:(double)a3
{
  int v3 = vcvtd_n_s64_f64(a3, 8uLL);
  if (v3 <= 0) {
    int v4 = -(-v3 & 7);
  }
  else {
    int v4 = v3 & 7;
  }
  [(EDColumnInfo *)self setWidthInXlUnits:(v4 + v3)];
}

- (unint64_t)styleIndex
{
  return self->mStyleIndex;
}

+ (id)columnInfoWithResources:(id)a3 worksheet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v5 worksheet:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v7 = objc_loadWeakRetained((id *)&self->mWorksheet);
  uint64_t v8 = [v5 initWithResources:WeakRetained worksheet:v7];

  if (v8)
  {
    *(_DWORD *)(v8 + 24) = self->mWidth;
    *(unsigned char *)(v8 + 28) = self->mHidden;
    id v9 = [(EDReference *)self->mRange copyWithZone:a3];
    int v10 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v9;

    *(void *)(v8 + 40) = self->mStyleIndex;
    *(unsigned char *)(v8 + 48) = self->mOutlineLevel;
    id v11 = (id)v8;
  }

  return (id)v8;
}

- (void)setStyle:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v5 = [WeakRetained styles];

  self->mStyleIndex = [v5 addOrEquivalentObject:v6];
}

- (unsigned)outlineLevel
{
  return self->mOutlineLevel;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDColumnInfo;
  v2 = [(EDColumnInfo *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRange, 0);
  objc_destroyWeak((id *)&self->mWorksheet);
  objc_destroyWeak((id *)&self->mResources);
}

@end