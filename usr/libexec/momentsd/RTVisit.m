@interface RTVisit
- (BOOL)isEqualToLoiVisit:(id)a3;
- (BOOL)isEqualToVisitMoment:(id)a3;
- (id)getFinerGranularityPlaceName;
- (id)getLocation;
- (id)getPlaceName;
@end

@implementation RTVisit

- (id)getPlaceName
{
  v3 = [(RTVisit *)self placeInference];
  v4 = [v3 preferredName];

  v5 = [(RTVisit *)self placeInference];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 preferredName];
    id v8 = [v7 copy];
LABEL_5:

    goto LABEL_6;
  }
  v9 = [v5 mapItem];
  v10 = [v9 name];

  if (v10)
  {
    v6 = [(RTVisit *)self placeInference];
    v7 = [v6 mapItem];
    v11 = [v7 name];
    id v8 = [v11 copy];

    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

- (id)getFinerGranularityPlaceName
{
  v3 = [(RTVisit *)self placeInference];
  uint64_t v4 = [v3 preferredName];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(RTVisit *)self placeInference];
    id v7 = [v6 userType];

    if (v7)
    {
      id v8 = [(RTVisit *)self placeInference];
      v9 = [v8 preferredName];
      id v10 = [v9 copy];
LABEL_7:

      goto LABEL_9;
    }
  }
  else
  {
  }
  v11 = [(RTVisit *)self placeInference];
  v12 = [v11 finerGranularityMapItem];
  v13 = [v12 name];

  if (v13)
  {
    id v8 = [(RTVisit *)self placeInference];
    v9 = [v8 finerGranularityMapItem];
    v14 = [v9 name];
    id v10 = [v14 copy];

    goto LABEL_7;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (id)getLocation
{
  v3 = [(RTVisit *)self location];

  if (v3)
  {
    uint64_t v4 = [(RTVisit *)self location];
    id v5 = [v4 copy];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToVisitMoment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RTVisit *)self entry];
  if (v5
    && (v6 = (void *)v5,
        [(RTVisit *)self exit],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [(RTVisit *)self entry];
    uint64_t v9 = [v4 startDate];
    unsigned __int8 v10 = [v8 isEqualToDate:v9];

    v11 = [(RTVisit *)self exit];
    v12 = [v4 endDate];
    LOBYTE(v9) = [v11 isEqualToDate:v12];

    char v13 = v10 & v9;
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isEqualToLoiVisit:(id)a3
{
  id v6 = a3;
  id v7 = [(RTVisit *)self location];
  if (!v7)
  {
    v3 = [v6 location];
    if (!v3)
    {
      unsigned __int8 v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [(RTVisit *)self location];
  id v8 = [v6 location];
  unsigned __int8 v9 = [v4 isEqualToLocation:v8];

  if (!v7) {
    goto LABEL_6;
  }
LABEL_7:

  unsigned __int8 v10 = [(RTVisit *)self entry];
  if (!v10)
  {
    id v4 = [v6 entryDate];
    if (!v4)
    {
      unsigned __int8 v13 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  v11 = [(RTVisit *)self entry];
  v12 = [v6 entryDate];
  unsigned __int8 v13 = [v11 isEqualToDate:v12];

  if (!v10) {
    goto LABEL_12;
  }
LABEL_13:

  v14 = [(RTVisit *)self exit];
  if (!v14)
  {
    id v4 = [v6 exitDate];
    if (!v4)
    {
      unsigned __int8 v17 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  v15 = [(RTVisit *)self exit];
  v16 = [v6 exitDate];
  unsigned __int8 v17 = [v15 isEqualToDate:v16];

  if (!v14) {
    goto LABEL_18;
  }
LABEL_19:

  return v9 & v13 & v17;
}

@end