@interface RAPCorrectableEntryPoints
- (BOOL)isEdited;
- (NSArray)addedPoints;
- (NSArray)correctedPoints;
- (NSArray)removedPoints;
- (NSArray)workingPoints;
- (RAPCorrectableEntryPoints)initWithGEORoadAccessPoints:(id)a3;
- (id)_entryPointWithCoordinates:(CLLocationCoordinate2D)a3 entryPointType:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createEntryPointWithCoordinates:(CLLocationCoordinate2D)a3 entryPointType:(int64_t)a4;
- (id)editedPointWithCorrectedPoint:(id)a3;
- (void)modifyEntryPoint:(id)a3 withCoordinates:(CLLocationCoordinate2D)a4 entryPointType:(int64_t)a5;
- (void)removeEntryPoint:(id)a3;
@end

@implementation RAPCorrectableEntryPoints

- (RAPCorrectableEntryPoints)initWithGEORoadAccessPoints:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)RAPCorrectableEntryPoints;
  v5 = [(RAPCorrectableEntryPoints *)&v44 init];
  if (v5)
  {
    id v38 = [v4 count];
    id v33 = v4;
    v6 = sub_100099700(v4, &stru_10131A718);
    v7 = +[NSPredicate predicateWithFormat:@"isDestinationEntryPoint == YES"];
    uint64_t v8 = +[NSPredicate predicateWithFormat:@"entryPointType == %d", 0];
    uint64_t v9 = +[NSPredicate predicateWithFormat:@"entryPointType == %d", 1];
    uint64_t v10 = +[NSPredicate predicateWithFormat:@"entryPointType == %d", 2];
    uint64_t v11 = +[NSPredicate predicateWithFormat:@"entryPointType == %d", 4];
    uint64_t v12 = +[NSPredicate predicateWithFormat:@"entryPointType == %d", 3];
    uint64_t v13 = +[NSPredicate predicateWithFormat:@"entryPointType == %d", 5];
    v39 = (void *)v8;
    v46[0] = v8;
    v46[1] = v9;
    v36 = (void *)v10;
    v37 = (void *)v9;
    v46[2] = v10;
    v46[3] = v12;
    v34 = (void *)v12;
    v35 = (void *)v11;
    v14 = (void *)v13;
    v46[4] = v11;
    v46[5] = v13;
    v15 = +[NSArray arrayWithObjects:v46 count:6];
    uint64_t v16 = +[NSMutableArray array];
    originalPoints = v5->_originalPoints;
    v5->_originalPoints = (NSMutableArray *)v16;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v18 = v15;
    id v19 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v41;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [v6 filteredArrayUsingPredicate:*(void *)(*((void *)&v40 + 1) + 8 * (void)v22)];
          v24 = [v23 filteredArrayUsingPredicate:v7];
          if ([v24 count]) {
            v25 = v24;
          }
          else {
            v25 = v23;
          }
          [(NSMutableArray *)v5->_originalPoints addObjectsFromArray:v25];

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v20);
    }

    uint64_t v26 = +[NSMutableArray arrayWithCapacity:v38];
    addedPoints = v5->_addedPoints;
    v5->_addedPoints = (NSMutableArray *)v26;

    uint64_t v28 = +[NSMutableArray arrayWithCapacity:v38];
    correctedPoints = v5->_correctedPoints;
    v5->_correctedPoints = (NSMutableArray *)v28;

    uint64_t v30 = +[NSMutableArray arrayWithCapacity:v38];
    deletedPoints = v5->_deletedPoints;
    v5->_deletedPoints = (NSMutableArray *)v30;

    id v4 = v33;
  }

  return v5;
}

- (BOOL)isEdited
{
  return [(NSMutableArray *)self->_addedPoints count]
      || [(NSMutableArray *)self->_correctedPoints count]
      || [(NSMutableArray *)self->_deletedPoints count] != 0;
}

- (void)modifyEntryPoint:(id)a3 withCoordinates:(CLLocationCoordinate2D)a4 entryPointType:(int64_t)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v16 = a3;
  uint64_t v9 = -[RAPCorrectableEntryPoints _entryPointWithCoordinates:entryPointType:](self, "_entryPointWithCoordinates:entryPointType:", a5, latitude, longitude);
  if ([(NSMutableArray *)self->_originalPoints containsObject:v16])
  {
    [(NSMutableArray *)self->_originalPoints removeObject:v16];
    id v10 = objc_alloc_init((Class)GEORPEditedAccessPoint);
    uint64_t v11 = [v16 accessPoint];
    [v10 setOriginal:v11];

    uint64_t v12 = [v9 accessPoint];
    [v10 setCorrected:v12];

    [(NSMutableArray *)self->_correctedPoints addObject:v10];
  }
  else if ([(NSMutableArray *)self->_addedPoints containsObject:v16])
  {
    [(NSMutableArray *)self->_addedPoints removeObject:v16];
    [(NSMutableArray *)self->_addedPoints addObject:v9];
  }
  else
  {
    uint64_t v13 = [v16 accessPoint];
    v14 = [(RAPCorrectableEntryPoints *)self editedPointWithCorrectedPoint:v13];

    v15 = [v9 accessPoint];
    [v14 setCorrected:v15];
  }
}

- (id)_entryPointWithCoordinates:(CLLocationCoordinate2D)a3 entryPointType:(int64_t)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = objc_alloc_init((Class)GEOLatLng);
  [v7 setLat:latitude];
  [v7 setLng:longitude];
  id v8 = objc_alloc_init((Class)GEORoadAccessPoint);
  [v8 setLocation:v7];
  uint64_t v9 = [[RAPEntryPoint alloc] initWithAccessPoint:v8 type:a4];

  return v9;
}

- (id)createEntryPointWithCoordinates:(CLLocationCoordinate2D)a3 entryPointType:(int64_t)a4
{
  v5 = -[RAPCorrectableEntryPoints _entryPointWithCoordinates:entryPointType:](self, "_entryPointWithCoordinates:entryPointType:", a4, a3.latitude, a3.longitude);
  [(NSMutableArray *)self->_addedPoints addObject:v5];

  return v5;
}

- (void)removeEntryPoint:(id)a3
{
  id v6 = a3;
  if (-[NSMutableArray containsObject:](self->_originalPoints, "containsObject:")) {
    [(NSMutableArray *)self->_deletedPoints addObject:v6];
  }
  [(NSMutableArray *)self->_originalPoints removeObject:v6];
  [(NSMutableArray *)self->_addedPoints removeObject:v6];
  id v4 = [v6 accessPoint];
  v5 = [(RAPCorrectableEntryPoints *)self editedPointWithCorrectedPoint:v4];

  if (v5) {
    [(NSMutableArray *)self->_correctedPoints removeObject:v5];
  }
}

- (id)editedPointWithCorrectedPoint:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100BB3EFC;
  v9[3] = &unk_10131A740;
  id v10 = a3;
  id v4 = v10;
  v5 = +[NSPredicate predicateWithBlock:v9];
  id v6 = [(NSMutableArray *)self->_correctedPoints filteredArrayUsingPredicate:v5];
  id v7 = [v6 firstObject];

  return v7;
}

- (NSArray)removedPoints
{
  return (NSArray *)sub_100099700(self->_deletedPoints, &stru_10131A780);
}

- (NSArray)addedPoints
{
  return (NSArray *)sub_100099700(self->_addedPoints, &stru_10131A7A0);
}

- (NSArray)correctedPoints
{
  id v2 = [(NSMutableArray *)self->_correctedPoints copy];

  return (NSArray *)v2;
}

- (NSArray)workingPoints
{
  v3 = [&__NSArray0__struct arrayByAddingObjectsFromArray:self->_originalPoints];
  id v4 = [v3 arrayByAddingObjectsFromArray:self->_addedPoints];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_correctedPoints;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      id v10 = v4;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v9);
        uint64_t v12 = [RAPEntryPoint alloc];
        uint64_t v13 = [v11 corrected:v16];
        v14 = [(RAPEntryPoint *)v12 initWithAccessPoint:v13];
        id v4 = [v10 arrayByAddingObject:v14];

        uint64_t v9 = (char *)v9 + 1;
        id v10 = v4;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v5 = +[NSMutableArray arrayWithArray:self->_originalPoints];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = +[NSMutableArray arrayWithArray:self->_deletedPoints];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = +[NSMutableArray arrayWithArray:self->_addedPoints];
  id v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = +[NSMutableArray arrayWithArray:self->_correctedPoints];
  uint64_t v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedPoints, 0);
  objc_storeStrong((id *)&self->_addedPoints, 0);
  objc_storeStrong((id *)&self->_deletedPoints, 0);

  objc_storeStrong((id *)&self->_originalPoints, 0);
}

@end