@interface NanoRoutePlanningResponseSnapshot
- (BOOL)isEqual:(id)a3;
- (NSArray)revisionIdentifiers;
- (NSArray)routeIdentifiers;
- (NSArray)selectedRideIndexes;
- (NSDate)timestamp;
- (NSString)description;
- (NSUUID)selectedRouteIdentifier;
- (NanoRoutePlanningResponseSnapshot)init;
- (id)deltaFromSnapshot:(id)a3;
- (void)setRevisionIdentifiers:(id)a3;
- (void)setRouteIdentifiers:(id)a3;
- (void)setSelectedRideIndexes:(id)a3;
- (void)setSelectedRouteIdentifier:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation NanoRoutePlanningResponseSnapshot

- (NanoRoutePlanningResponseSnapshot)init
{
  v6.receiver = self;
  v6.super_class = (Class)NanoRoutePlanningResponseSnapshot;
  v2 = [(NanoRoutePlanningResponseSnapshot *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    objc_super v6 = [(NanoRoutePlanningResponseSnapshot *)self revisionIdentifiers];
    v7 = [v5 revisionIdentifiers];
    if (+[MNComparison isValue:v6 equalTo:v7])
    {
      v8 = [(NanoRoutePlanningResponseSnapshot *)self selectedRouteIdentifier];
      v9 = [v5 selectedRouteIdentifier];
      if (+[MNComparison isValue:v8 equalTo:v9])
      {
        v10 = [(NanoRoutePlanningResponseSnapshot *)self selectedRideIndexes];
        v11 = [v5 selectedRideIndexes];
        unsigned __int8 v12 = +[MNComparison isValue:v10 equalTo:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (id)deltaFromSnapshot:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = (NanoRoutePlanningResponseSnapshot *)v4;
    objc_super v6 = objc_alloc_init(NanoRoutePlanningResponseDelta);
    v7 = [(NanoRoutePlanningResponseSnapshot *)self routeIdentifiers];
    v8 = [(NanoRoutePlanningResponseSnapshot *)v5 routeIdentifiers];
    [(NanoRoutePlanningResponseDelta *)v6 setRoutesChanged:+[MNComparison isValue:v7 equalTo:v8] ^ 1];

    v9 = [(NanoRoutePlanningResponseSnapshot *)self selectedRouteIdentifier];
    v10 = [(NanoRoutePlanningResponseSnapshot *)v5 selectedRouteIdentifier];
    [(NanoRoutePlanningResponseDelta *)v6 setSelectedRouteChanged:+[MNComparison isValue:v9 equalTo:v10] ^ 1];

    v11 = [(NanoRoutePlanningResponseSnapshot *)self revisionIdentifiers];
    unsigned __int8 v12 = [(NanoRoutePlanningResponseSnapshot *)v5 revisionIdentifiers];
    [(NanoRoutePlanningResponseDelta *)v6 setRouteRevisionsChanged:+[MNComparison isValue:v11 equalTo:v12] ^ 1];

    v13 = [(NanoRoutePlanningResponseSnapshot *)self selectedRideIndexes];
    v14 = [(NanoRoutePlanningResponseSnapshot *)v5 selectedRideIndexes];
    [(NanoRoutePlanningResponseDelta *)v6 setSelectedRideIndexesChanged:+[MNComparison isValue:v13 equalTo:v14] ^ 1];

    if ([(NanoRoutePlanningResponseDelta *)v6 routeRevisionsChanged])
    {
      v15 = [(NanoRoutePlanningResponseSnapshot *)v5 timestamp];
      v16 = [(NanoRoutePlanningResponseSnapshot *)self timestamp];
      id v17 = [v15 compare:v16];

      if (v17 == (id)-1) {
        v18 = v5;
      }
      else {
        v18 = self;
      }
      if (v17 == (id)-1) {
        v19 = self;
      }
      else {
        v19 = v5;
      }
      v20 = v18;
      v21 = v19;
      id v22 = objc_alloc((Class)NSMutableOrderedSet);
      v23 = [(NanoRoutePlanningResponseSnapshot *)v21 revisionIdentifiers];
      id v24 = [v22 initWithArray:v23];

      v25 = [(NanoRoutePlanningResponseSnapshot *)v20 revisionIdentifiers];
      v26 = +[NSSet setWithArray:v25];
      [v24 minusSet:v26];

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100487A04;
      v30[3] = &unk_1012EB910;
      v31 = v21;
      v27 = v21;
      v28 = sub_100099700(v24, v30);
      [(NanoRoutePlanningResponseDelta *)v6 setIdentifiersForChangedRoutes:v28];
    }
  }
  else
  {
    objc_super v6 = +[NanoRoutePlanningResponseDelta everythingChanged];
  }

  return v6;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)NanoRoutePlanningResponseSnapshot;
  uint64_t v3 = [(NanoRoutePlanningResponseSnapshot *)&v10 description];
  id v4 = [(NanoRoutePlanningResponseSnapshot *)self routeIdentifiers];
  id v5 = [(NanoRoutePlanningResponseSnapshot *)self selectedRouteIdentifier];
  objc_super v6 = [(NanoRoutePlanningResponseSnapshot *)self revisionIdentifiers];
  v7 = [(NanoRoutePlanningResponseSnapshot *)self selectedRideIndexes];
  v8 = +[NSString stringWithFormat:@"%@ {\nrouteIdentifiers: %@\nselectedRouteIdentifier: %@\nrevisionIdentifiers: %@\nselectedRideIndexes: %@\n}", v3, v4, v5, v6, v7];

  return (NSString *)v8;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSArray)routeIdentifiers
{
  return self->_routeIdentifiers;
}

- (void)setRouteIdentifiers:(id)a3
{
}

- (NSArray)revisionIdentifiers
{
  return self->_revisionIdentifiers;
}

- (void)setRevisionIdentifiers:(id)a3
{
}

- (NSUUID)selectedRouteIdentifier
{
  return self->_selectedRouteIdentifier;
}

- (void)setSelectedRouteIdentifier:(id)a3
{
}

- (NSArray)selectedRideIndexes
{
  return self->_selectedRideIndexes;
}

- (void)setSelectedRideIndexes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRideIndexes, 0);
  objc_storeStrong((id *)&self->_selectedRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_revisionIdentifiers, 0);
  objc_storeStrong((id *)&self->_routeIdentifiers, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end