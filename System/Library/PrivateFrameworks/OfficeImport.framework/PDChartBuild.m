@interface PDChartBuild
- (BOOL)isEqual:(id)a3;
- (PDChartBuild)initWithBuildType:(int)a3;
- (int)type;
- (unint64_t)hash;
- (void)setType:(int)a3;
@end

@implementation PDChartBuild

- (PDChartBuild)initWithBuildType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDChartBuild;
  result = [(PDBuild *)&v5 init];
  if (result) {
    result->mChartBuildType = a3;
  }
  return result;
}

- (int)type
{
  return self->mChartBuildType;
}

- (void)setType:(int)a3
{
  self->mChartBuildType = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TSUDynamicCast(v5, (uint64_t)v4);
  v7 = v6;
  if (v6
    && (int mChartBuildType = self->mChartBuildType, v9 = [v6 type], v7, mChartBuildType == v9))
  {
    v12.receiver = self;
    v12.super_class = (Class)PDChartBuild;
    BOOL v10 = [(PDBuild *)&v12 isEqual:v4];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t mChartBuildType = self->mChartBuildType;
  v4.receiver = self;
  v4.super_class = (Class)PDChartBuild;
  return [(PDBuild *)&v4 hash] ^ mChartBuildType;
}

@end