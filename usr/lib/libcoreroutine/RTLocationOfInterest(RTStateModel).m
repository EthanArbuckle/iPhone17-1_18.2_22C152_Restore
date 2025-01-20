@interface RTLocationOfInterest(RTStateModel)
- (id)initWithOneState:()RTStateModel;
@end

@implementation RTLocationOfInterest(RTStateModel)

- (id)initWithOneState:()RTStateModel
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v60 = a1;
    v6 = [v4 stateDepiction];
    v7 = [v6 location];
    [v7 Latitude_deg];
    double v9 = v8;

    v10 = [v5 stateDepiction];
    v11 = [v10 location];
    [v11 Longitude_deg];
    double v13 = v12;

    v14 = [v5 stateDepiction];
    v15 = [v14 location];
    [v15 uncertainty_m];
    uint64_t v17 = v16;

    v18 = [v5 stateDepiction];
    v19 = [v18 location];
    uint64_t v20 = [v19 referenceFrame];

    v21 = [v5 stateDepiction];
    v22 = [v21 mapItem];
    uint64_t v23 = [v22 source] & 0xC;

    if (v23)
    {
      v24 = [v5 stateDepiction];
      v25 = [v24 mapItem];
      v26 = [v25 location];
      [v26 latitude];
      double v9 = v27;

      v28 = [v5 stateDepiction];
      v29 = [v28 mapItem];
      v30 = [v29 location];
      [v30 longitude];
      double v13 = v31;

      v32 = [v5 stateDepiction];
      v33 = [v32 mapItem];
      v34 = [v33 location];
      uint64_t v20 = [v34 referenceFrame];
    }
    v35 = [v5 stateDepiction];
    v36 = [v35 getRecentVisits:0.0];

    v58 = v36;
    if ([v36 count])
    {
      v37 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:[v36 count]];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __55__RTLocationOfInterest_RTStateModel__initWithOneState___block_invoke;
      v61[3] = &unk_1E6B9A740;
      double v63 = v9;
      double v64 = v13;
      uint64_t v65 = v17;
      id v59 = v37;
      id v62 = v59;
      [v36 enumerateObjectsUsingBlock:v61];
    }
    else
    {
      id v59 = 0;
    }
    id v39 = objc_alloc(MEMORY[0x1E4F5CE00]);
    v40 = [v5 stateDepiction];
    v41 = [v40 location];
    [v41 uncertainty_m];
    v54 = (void *)[v39 initWithLatitude:0 longitude:v20 horizontalUncertainty:v9 date:v13 referenceFrame:v42];

    v57 = [v5 stateDepiction];
    v56 = [v57 location];
    [v56 confidence];
    double v44 = v43;
    v45 = [v5 uniqueId];
    v55 = [v5 stateDepiction];
    uint64_t v46 = [v55 type];
    v47 = [v5 stateDepiction];
    uint64_t v48 = [v47 typeSource];
    v49 = [v5 stateDepiction];
    v50 = [v49 customLabel];
    v51 = [v5 stateDepiction];
    v52 = [v51 mapItem];
    a1 = (id)[v60 initWithLocation:v54 confidence:v45 identifier:v46 type:v48 typeSource:v59 visits:v50 customLabel:v44 mapItem:v52];

    id v38 = a1;
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

@end