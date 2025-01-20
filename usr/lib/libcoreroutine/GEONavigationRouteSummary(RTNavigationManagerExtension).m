@interface GEONavigationRouteSummary(RTNavigationManagerExtension)
- (id)description;
- (uint64_t)isEqual:()RTNavigationManagerExtension;
- (uint64_t)isEqualToRouteSummary:()RTNavigationManagerExtension;
@end

@implementation GEONavigationRouteSummary(RTNavigationManagerExtension)

- (uint64_t)isEqualToRouteSummary:()RTNavigationManagerExtension
{
  id v5 = a3;
  if (v5)
  {
    v6 = [a1 destinationName];
    if (v6 || ([v5 destinationName], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = [a1 destinationName];
      v8 = [v5 destinationName];
      int v9 = [v7 isEqualToString:v8];

      if (v6) {
        goto LABEL_9;
      }
    }
    else
    {
      int v9 = 1;
    }

LABEL_9:
    v11 = [a1 destination];
    v12 = [v11 latLng];
    if (!v12)
    {
      v30 = [v5 destination];
      uint64_t v13 = [v30 latLng];
      if (!v13)
      {
        v29 = 0;
        BOOL v27 = 1;
LABEL_18:

LABEL_19:
        uint64_t v10 = v9 & v27;
        goto LABEL_20;
      }
      v29 = (void *)v13;
    }
    v14 = [a1 destination];
    v15 = [v14 latLng];
    [v15 lat];
    double v17 = v16;
    v18 = [v5 destination];
    v19 = [v18 latLng];
    [v19 lat];
    if (vabdd_f64(v17, v20) >= 2.22044605e-16)
    {
      BOOL v27 = 0;
    }
    else
    {
      v31 = [a1 destination];
      [v31 latLng];
      v21 = v32 = v14;
      [v21 lng];
      double v23 = v22;
      [v5 destination];
      v24 = int v33 = v9;
      v25 = [v24 latLng];
      [v25 lng];
      BOOL v27 = vabdd_f64(v23, v26) < 2.22044605e-16;

      int v9 = v33;
      v14 = v32;
    }
    if (v12) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v10 = 0;
LABEL_20:

  return v10;
}

- (uint64_t)isEqual:()RTNavigationManagerExtension
{
  id v4 = a3;
  if (a1 == v4)
  {
    uint64_t v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = [a1 isEqualToRouteSummary:v4];
    }
    else {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  v2 = NSString;
  v3 = [a1 origin];
  id v4 = [v3 latLng];
  [v4 lat];
  uint64_t v6 = v5;
  v7 = [a1 origin];
  v8 = [v7 latLng];
  [v8 lng];
  uint64_t v10 = v9;
  v11 = [a1 destinationName];
  v12 = [a1 destination];
  uint64_t v13 = [v12 latLng];
  [v13 lat];
  uint64_t v15 = v14;
  double v16 = [a1 destination];
  double v17 = [v16 latLng];
  [v17 lng];
  v19 = [v2 stringWithFormat:@"origin location, <%f, %f>, destination name, %@, destination location, <%f, %f>", v6, v10, v11, v15, v18];

  return v19;
}

@end