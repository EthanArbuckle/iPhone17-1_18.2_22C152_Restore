@interface EDTableColumn
+ (id)tableColumnWithResources:(id)a3;
- (EDTableColumn)initWithResources:(id)a3;
- (id)dataAreaDxf;
- (id)description;
- (id)headerRowDxf;
- (id)name;
- (id)totalsRowDxf;
- (id)totalsRowLabel;
- (id)uniqueName;
- (unint64_t)dataAreaDxfIndex;
- (unint64_t)headerRowDxfIndex;
- (unint64_t)totalsRowDxfIndex;
- (void)setDataAreaDxf:(id)a3;
- (void)setDataAreaDxfIndex:(unint64_t)a3;
- (void)setHeaderRowDxf:(id)a3;
- (void)setHeaderRowDxfIndex:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setTotalsRowDxf:(id)a3;
- (void)setTotalsRowDxfIndex:(unint64_t)a3;
- (void)setTotalsRowLabel:(id)a3;
- (void)setUniqueName:(id)a3;
@end

@implementation EDTableColumn

- (EDTableColumn)initWithResources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDTableColumn;
  v5 = [(EDTableColumn *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mHeaderRowDxfIndex = -1;
    v6->mTotalsRowDxfIndex = -1;
    v6->mDataAreaDxfIndex = -1;
  }

  return v6;
}

- (void)setName:(id)a3
{
  v5 = (EDString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }
}

- (void)setDataAreaDxfIndex:(unint64_t)a3
{
  self->mDataAreaDxfIndex = a3;
}

+ (id)tableColumnWithResources:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
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

- (id)name
{
  return self->mName;
}

- (id)uniqueName
{
  return self->mUniqueName;
}

- (void)setUniqueName:(id)a3
{
  v5 = (EDString *)a3;
  mUniqueName = self->mUniqueName;
  p_mUniqueName = &self->mUniqueName;
  if (mUniqueName != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mUniqueName, a3);
    v5 = v8;
  }
}

- (id)totalsRowLabel
{
  return self->mTotalsRowLabel;
}

- (void)setTotalsRowLabel:(id)a3
{
  v5 = (EDString *)a3;
  mTotalsRowLabel = self->mTotalsRowLabel;
  p_mTotalsRowLabel = &self->mTotalsRowLabel;
  if (mTotalsRowLabel != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mTotalsRowLabel, a3);
    v5 = v8;
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDTableColumn;
  v2 = [(EDTableColumn *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTotalsRowLabel, 0);
  objc_storeStrong((id *)&self->mUniqueName, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)headerRowDxfIndex
{
  return self->mHeaderRowDxfIndex;
}

- (void)setHeaderRowDxfIndex:(unint64_t)a3
{
  self->mHeaderRowDxfIndex = a3;
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

@end