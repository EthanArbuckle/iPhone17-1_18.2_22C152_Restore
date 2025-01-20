@interface PGGraphEnabler
- (BOOL)locationIsFrequent:(id)a3;
- (BOOL)locationIsNearMyHomeOrWork:(id)a3;
- (PGGraph)graph;
- (PGGraphEnabler)initWithGraph:(id)a3;
@end

@implementation PGGraphEnabler

- (void).cxx_destruct
{
}

- (PGGraph)graph
{
  return (PGGraph *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)locationIsNearMyHomeOrWork:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  [v4 coordinate];
  CLLocationDegrees latitude = v17.latitude;
  CLLocationDegrees longitude = v17.longitude;
  if (CLLocationCoordinate2DIsValid(v17))
  {
    v7 = [(PGGraph *)self->_graph meNodeCollection];
    v8 = [v7 homeOrWorkNodes];
    v9 = [v8 addressNodes];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__PGGraphEnabler_locationIsNearMyHomeOrWork___block_invoke;
    v12[3] = &unk_1E68F09D8;
    *(CLLocationDegrees *)&v12[5] = latitude;
    *(CLLocationDegrees *)&v12[6] = longitude;
    v12[4] = &v13;
    [v9 enumerateNodesUsingBlock:v12];
  }
  char v10 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __45__PGGraphEnabler_locationIsNearMyHomeOrWork___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  [a2 coordinate];
  uint64_t result = CLLocationCoordinate2DGetDistanceFrom();
  if (v6 < 100.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)locationIsFrequent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  [v4 coordinate];
  CLLocationDegrees latitude = v15.latitude;
  CLLocationDegrees longitude = v15.longitude;
  if (CLLocationCoordinate2DIsValid(v15))
  {
    v7 = +[PGGraphNodeCollection nodesInGraph:self->_graph];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__PGGraphEnabler_locationIsFrequent___block_invoke;
    v10[3] = &unk_1E68E8C80;
    *(CLLocationDegrees *)&v10[5] = latitude;
    *(CLLocationDegrees *)&v10[6] = longitude;
    v10[4] = &v11;
    [v7 enumerateNodesUsingBlock:v10];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __37__PGGraphEnabler_locationIsFrequent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = [a2 addressNode];
  [v5 coordinate];

  uint64_t result = CLLocationCoordinate2DGetDistanceFrom();
  if (v7 <= 10000.0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (PGGraphEnabler)initWithGraph:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphEnabler;
  double v6 = [(PGGraphEnabler *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graph, a3);
  }

  return v7;
}

@end