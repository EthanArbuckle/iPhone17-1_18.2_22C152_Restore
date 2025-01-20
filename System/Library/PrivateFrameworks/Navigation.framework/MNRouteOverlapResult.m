@interface MNRouteOverlapResult
- (GEOPolylineCoordinateRange)routeRange;
- (GEOPolylineCoordinateRangeArray)overlapRanges;
- (GEOPolylineCoordinateRangeArray)uniqueRanges;
- (NSUUID)routeID;
- (id).cxx_construct;
- (id)description;
- (void)setOverlapRanges:(id)a3;
- (void)setRouteID:(id)a3;
- (void)setRouteRange:(GEOPolylineCoordinateRange)a3;
- (void)setUniqueRanges:(id)a3;
@end

@implementation MNRouteOverlapResult

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOPolylineCoordinateRangeArray count](self->_overlapRanges, "count"));
  for (unint64_t i = 0; i < [(GEOPolylineCoordinateRangeArray *)self->_overlapRanges count]; ++i)
  {
    [(GEOPolylineCoordinateRangeArray *)self->_overlapRanges coordinateRangeAtIndex:i];
    v5 = NSString;
    v6 = GEOPolylineCoordinateRangeAsString();
    v7 = [v5 stringWithFormat:@"{%@}", v6];
    [v3 addObject:v7];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOPolylineCoordinateRangeArray count](self->_uniqueRanges, "count"));
  for (unint64_t j = 0; j < [(GEOPolylineCoordinateRangeArray *)self->_uniqueRanges count]; ++j)
  {
    [(GEOPolylineCoordinateRangeArray *)self->_uniqueRanges coordinateRangeAtIndex:j];
    v10 = NSString;
    v11 = GEOPolylineCoordinateRangeAsString();
    v12 = [v10 stringWithFormat:@"{%@}", v11];
    [v8 addObject:v12];
  }
  v13 = NSString;
  routeID = self->_routeID;
  v15 = [v3 componentsJoinedByString:@", "];
  v16 = [v8 componentsJoinedByString:@", "];
  v17 = [v13 stringWithFormat:@"Route ID: %@\n    Overlap: %@\n    Unique: %@", routeID, v15, v16];

  return v17;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
}

- (GEOPolylineCoordinateRange)routeRange
{
  PolylineCoordinate end = self->_routeRange.end;
  PolylineCoordinate start = self->_routeRange.start;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- (void)setRouteRange:(GEOPolylineCoordinateRange)a3
{
  self->_routeRange = a3;
}

- (GEOPolylineCoordinateRangeArray)overlapRanges
{
  return self->_overlapRanges;
}

- (void)setOverlapRanges:(id)a3
{
}

- (GEOPolylineCoordinateRangeArray)uniqueRanges
{
  return self->_uniqueRanges;
}

- (void)setUniqueRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueRanges, 0);
  objc_storeStrong((id *)&self->_overlapRanges, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0xBF80000000000000;
  *((void *)self + 5) = 0xBF80000000000000;
  return self;
}

@end