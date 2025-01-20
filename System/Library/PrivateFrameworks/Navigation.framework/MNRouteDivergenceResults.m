@interface MNRouteDivergenceResults
- (NSArray)results;
- (NSUUID)routeID;
- (id)description;
- (void)setResults:(id)a3;
- (void)setRouteID:(id)a3;
@end

@implementation MNRouteDivergenceResults

- (id)description
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_results = &self->_results;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_results, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = *p_results;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v8 = NSString;
        [v7 routeCoordinate];
        v9 = GEOPolylineCoordinateAsString();
        [v7 locationCoordinate];
        uint64_t v11 = v10;
        [v7 locationCoordinate];
        uint64_t v13 = v12;
        uint64_t v14 = [v7 resultType];
        v15 = @"None";
        if (v14 == 1) {
          v15 = @"Divergence";
        }
        if (v14 == 2) {
          v15 = @"Convergence";
        }
        v16 = v15;
        v17 = [v8 stringWithFormat:@"%@ (%f, %f) - %@", v9, v11, v13, v16];
        [v3 addObject:v17];
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  v18 = NSString;
  routeID = self->_routeID;
  v20 = [v3 componentsJoinedByString:@"\n    "];
  v21 = [v18 stringWithFormat:@"Route ID: %@\n    %@", routeID, v20];

  return v21;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end