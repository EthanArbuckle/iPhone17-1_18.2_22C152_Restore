@interface PGPastSupersetGroup
+ (id)pastSupersetGroupWithMomentNodes:(id)a3 dateInterval:(id)a4 supersetCityNodeAsCollection:(id)a5 densestCloseLocationNodeAsCollection:(id)a6 locationHelper:(id)a7;
- (NSDateInterval)dateInterval;
- (PGGraphLocationCityNodeCollection)supersetCityNodes;
- (PGGraphLocationNodeCollection)densestCloseLocationNodes;
- (PGGraphLocationStateNodeCollection)stateNodeAsCollection;
- (PGGraphMomentNodeCollection)momentNodes;
- (void)setDateInterval:(id)a3;
- (void)setDensestCloseLocationNodes:(id)a3;
- (void)setMomentNodes:(id)a3;
- (void)setStateNodeAsCollection:(id)a3;
- (void)setSupersetCityNodes:(id)a3;
@end

@implementation PGPastSupersetGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_densestCloseLocationNodes, 0);
  objc_storeStrong((id *)&self->_supersetCityNodes, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
}

- (void)setStateNodeAsCollection:(id)a3
{
}

- (PGGraphLocationStateNodeCollection)stateNodeAsCollection
{
  return (PGGraphLocationStateNodeCollection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDensestCloseLocationNodes:(id)a3
{
}

- (PGGraphLocationNodeCollection)densestCloseLocationNodes
{
  return (PGGraphLocationNodeCollection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSupersetCityNodes:(id)a3
{
}

- (PGGraphLocationCityNodeCollection)supersetCityNodes
{
  return (PGGraphLocationCityNodeCollection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDateInterval:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMomentNodes:(id)a3
{
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return (PGGraphMomentNodeCollection *)objc_getProperty(self, a2, 8, 1);
}

+ (id)pastSupersetGroupWithMomentNodes:(id)a3 dateInterval:(id)a4 supersetCityNodeAsCollection:(id)a5 densestCloseLocationNodeAsCollection:(id)a6 locationHelper:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setMomentNodes:v15];

  [v16 setDateInterval:v14];
  [v16 setSupersetCityNodes:v13];
  [v16 setDensestCloseLocationNodes:v12];

  v17 = [v11 stateNodeFromCityNodeAsCollection:v13];

  [v16 setStateNodeAsCollection:v17];
  return v16;
}

@end