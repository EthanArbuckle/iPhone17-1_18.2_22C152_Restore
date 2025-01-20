@interface PXStoryColorGradingConfiguration
- (NSArray)cubeInfos;
- (PXStoryColorGradingConfiguration)init;
- (PXStoryColorGradingConfiguration)initWithCubeInfos:(id)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation PXStoryColorGradingConfiguration

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v3 = [(NSArray *)self->_cubeInfos objectAtIndexedSubscript:a3];
  v4 = [[PXStoryColorGradingCubeInfo alloc] initWithDictionary:v3];

  return v4;
}

- (PXStoryColorGradingConfiguration)initWithCubeInfos:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryColorGradingConfiguration;
  v6 = [(PXStoryColorGradingConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cubeInfos, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (NSArray)cubeInfos
{
  return self->_cubeInfos;
}

- (unint64_t)count
{
  return [(NSArray *)self->_cubeInfos count];
}

- (PXStoryColorGradingConfiguration)init
{
  return [(PXStoryColorGradingConfiguration *)self initWithCubeInfos:&unk_1F02D4EE8];
}

@end