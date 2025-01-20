@interface PLLocationOfInterest
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)visits;
- (NSUUID)identifier;
- (PLLocationOfInterest)initWithIdentifier:(id)a3 locationOfInterestType:(int64_t)a4 typeRadius:(double)a5 routineLocation:(id)a6 mapItemLocation:(id)a7;
- (PLLocationOfInterestLocation)mapItemLocation;
- (PLLocationOfInterestLocation)routineLocation;
- (double)centerDistanceFromLocation:(id)a3;
- (double)distanceFromLocation:(id)a3;
- (double)typeRadius;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)addVisit:(id)a3;
- (void)removeVisit:(id)a3;
- (void)setVisits:(id)a3;
@end

@implementation PLLocationOfInterest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_mapItemLocation, 0);
  objc_storeStrong((id *)&self->_routineLocation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setVisits:(id)a3
{
}

- (NSMutableArray)visits
{
  return self->_visits;
}

- (PLLocationOfInterestLocation)mapItemLocation
{
  return self->_mapItemLocation;
}

- (PLLocationOfInterestLocation)routineLocation
{
  return self->_routineLocation;
}

- (double)typeRadius
{
  return self->_typeRadius;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLLocationOfInterest *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      v6 = [(PLLocationOfInterest *)v4 identifier];
      char v7 = [(NSUUID *)identifier isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PLLocationOfInterest;
  v4 = [(PLLocationOfInterest *)&v12 description];
  v5 = [(PLLocationOfInterest *)self routineLocation];
  uint64_t v6 = [(PLLocationOfInterest *)self mapItemLocation];
  char v7 = (void *)v6;
  unint64_t v8 = self->_type + 1;
  if (v8 > 2) {
    v9 = 0;
  }
  else {
    v9 = off_1E5876170[v8];
  }
  v10 = [v3 stringWithFormat:@"%@ - %@ - %@ - %@", v4, v5, v6, v9];

  return v10;
}

- (double)centerDistanceFromLocation:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1E568];
  uint64_t v6 = self->_routineLocation;
  char v7 = v6;
  double v8 = v5;
  if (v6)
  {
    v9 = [(PLLocationOfInterestLocation *)v6 location];
    [v9 distanceFromLocation:v4];
    double v8 = v10;
  }
  mapItemLocation = self->_mapItemLocation;
  if (mapItemLocation)
  {
    objc_super v12 = [(PLLocationOfInterestLocation *)mapItemLocation location];
    [v12 distanceFromLocation:v4];
    double v5 = v13;
  }
  if (v8 < v5) {
    double v5 = v8;
  }

  return v5;
}

- (double)distanceFromLocation:(id)a3
{
  id v4 = a3;
  double typeRadius = self->_typeRadius;
  double v6 = *MEMORY[0x1E4F1E568];
  char v7 = self->_routineLocation;
  double v8 = v7;
  double v9 = v6;
  if (v7)
  {
    [(PLLocationOfInterestLocation *)v7 distanceFromLocation:v4 withTypeRadius:typeRadius];
    double v9 = v10;
  }
  mapItemLocation = self->_mapItemLocation;
  if (mapItemLocation)
  {
    [(PLLocationOfInterestLocation *)mapItemLocation distanceFromLocation:v4 withTypeRadius:typeRadius];
    double v6 = v12;
  }
  if (v9 >= v6) {
    double v13 = v6;
  }
  else {
    double v13 = v9;
  }

  return v13;
}

- (void)removeVisit:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLLocationOfInterest.m", 84, @"Invalid parameter not satisfying: %@", @"visit != nil" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableArray *)self->_visits removeObject:v5];
  [v7 setLocationOfInterest:0];
}

- (void)addVisit:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLLocationOfInterest.m", 73, @"Invalid parameter not satisfying: %@", @"visit != nil" object file lineNumber description];

    id v5 = 0;
  }
  if (([(NSMutableArray *)self->_visits containsObject:v5] & 1) == 0)
  {
    [(NSMutableArray *)self->_visits addObject:v7];
    [v7 setLocationOfInterest:self];
  }
}

- (PLLocationOfInterest)initWithIdentifier:(id)a3 locationOfInterestType:(int64_t)a4 typeRadius:(double)a5 routineLocation:(id)a6 mapItemLocation:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PLLocationOfInterest;
  v16 = [(PLLocationOfInterest *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    v17->_type = a4;
    v17->_double typeRadius = a5;
    objc_storeStrong((id *)&v17->_routineLocation, a6);
    objc_storeStrong((id *)&v17->_mapItemLocation, a7);
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    visits = v17->_visits;
    v17->_visits = (NSMutableArray *)v18;
  }
  return v17;
}

@end