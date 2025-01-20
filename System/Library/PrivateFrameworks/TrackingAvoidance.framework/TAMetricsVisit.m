@interface TAMetricsVisit
- (NSData)address;
- (NSDateInterval)visitEntryDelay;
- (NSDateInterval)visitExitDelay;
- (NSNumber)distanceToPreviousSeenVisit;
- (NSString)description;
- (TAMetricsVisit)initWithSnapshotHistory:(id)a3 andAddress:(id)a4 andVisitFilterSettings:(id)a5;
- (TASPAdvertisement)latestAdvertisement;
- (double)durationOfVisitEntryConsideration;
- (double)durationOfVisitExitConsideration;
- (double)latitude;
- (double)longitude;
- (id)descriptionDictionary;
- (unint64_t)consecutiveAndDistinctFromPrevVisitCount;
- (unint64_t)consecutiveVisitCount;
- (unint64_t)getMetricsCollectionType;
- (unint64_t)totalDistinctVisitCount;
- (unint64_t)totalVisitCount;
@end

@implementation TAMetricsVisit

- (TAMetricsVisit)initWithSnapshotHistory:(id)a3 andAddress:(id)a4 andVisitFilterSettings:(id)a5
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v110.receiver = self;
  v110.super_class = (Class)TAMetricsVisit;
  id v11 = [(TAMetricsVisit *)&v110 init];
  if (!v11)
  {
LABEL_41:
    v12 = (TAMetricsVisit *)v11;
    goto LABEL_44;
  }
  v12 = 0;
  if (v8 && v9 && v10)
  {
    if ([v8 count])
    {
      v13 = [v8 lastObject];
      v14 = v13;
      if (v13)
      {
        if ([v13 isClosed])
        {
          v15 = [v14 latestUtAdvertisements];
          v16 = [v15 objectForKey:v9];

          if (v16)
          {
            uint64_t v17 = [v9 copy];
            v18 = (void *)*((void *)v11 + 1);
            *((void *)v11 + 1) = v17;

            v19 = [v14 representativeVisit];
            [v19 coordinate];
            *((void *)v11 + 10) = v20;

            v21 = [v14 representativeVisit];
            [v21 coordinate];
            *((void *)v11 + 11) = v22;

            uint64_t v23 = [v14 getArrivalDelay];
            v24 = (void *)*((void *)v11 + 8);
            *((void *)v11 + 8) = v23;

            uint64_t v25 = [v14 getDepartureDelay];
            v26 = (void *)*((void *)v11 + 9);
            *((void *)v11 + 9) = v25;

            [v10 entryDisplayOnBudget];
            objc_msgSend(v14, "getDurationOfVisitEntryConsideredWithDisplayOnBudget:");
            *((void *)v11 + 6) = v27;
            [v10 exitDisplayOnBudget];
            objc_msgSend(v14, "getDurationOfVisitExitConsideredWithDisplayOnBudget:");
            *((void *)v11 + 7) = v28;
            v29 = [v14 latestUtAdvertisements];
            id v88 = v9;
            uint64_t v30 = [v29 objectForKey:v9];
            v31 = (void *)*((void *)v11 + 13);
            *((void *)v11 + 13) = v30;

            int64x2_t v32 = vdupq_n_s64(1uLL);
            int64x2_t v33 = vaddq_s64(*((int64x2_t *)v11 + 1), v32);
            int64x2_t v34 = vaddq_s64(*((int64x2_t *)v11 + 2), v32);
            *((int64x2_t *)v11 + 1) = v33;
            *((int64x2_t *)v11 + 2) = v34;
            v35 = [MEMORY[0x263EFF980] array];
            v36 = [TALocationLite alloc];
            v37 = [v14 representativeVisit];
            v38 = [v37 getDate];
            v39 = [v14 representativeVisit];
            [v39 coordinate];
            double v41 = v40;
            [v14 representativeVisit];
            v42 = v97 = v11;
            [v42 coordinate];
            double v44 = v43;
            [v14 representativeVisit];
            v45 = v94 = v14;
            [v45 horizontalAccuracy];
            v47 = [(TALocationLite *)v36 initWithTimestamp:v38 latitude:v41 longitude:v44 horizontalAccuracy:v46];

            v48 = v14;
            id v11 = v97;

            v91 = v35;
            [v35 addObject:v47];
            v49 = v47;
            long long v106 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            id v89 = v8;
            id obj = [v8 reverseObjectEnumerator];
            uint64_t v50 = [obj countByEnumeratingWithState:&v106 objects:v112 count:16];
            v90 = v49;
            if (v50)
            {
              uint64_t v51 = v50;
              uint64_t v52 = *(void *)v107;
              uint64_t v53 = 1;
              LODWORD(v54) = 1;
              uint64_t v93 = *(void *)v107;
              do
              {
                uint64_t v55 = 0;
                v101 = v49;
                uint64_t v95 = v51;
                do
                {
                  if (*(void *)v107 != v52) {
                    objc_enumerationMutation(obj);
                  }
                  v56 = *(void **)(*((void *)&v106 + 1) + 8 * v55);
                  if ([v56 isEqual:v48])
                  {
                    v49 = v101;
                  }
                  else
                  {
                    uint64_t v98 = v53;
                    int v100 = v54;
                    v57 = [TALocationLite alloc];
                    v58 = [v56 representativeVisit];
                    v59 = [v58 getDate];
                    v60 = [v56 representativeVisit];
                    [v60 coordinate];
                    double v62 = v61;
                    v63 = [v56 representativeVisit];
                    [v63 coordinate];
                    double v65 = v64;
                    v66 = [v56 representativeVisit];
                    [v66 horizontalAccuracy];
                    v49 = [(TALocationLite *)v57 initWithTimestamp:v59 latitude:v62 longitude:v65 horizontalAccuracy:v67];

                    id v11 = v97;
                    uint64_t v68 = [v10 minNSigmaBetweenVisits];
                    [v10 minInterVisitDistance];
                    BOOL v99 = +[TALocationLite distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:](TALocationLite, "distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:", v49, v101, v68);
                    v69 = [v56 latestUtAdvertisements];
                    v70 = [v69 objectForKey:v97[1]];

                    if (v70)
                    {
                      if (!v97[12])
                      {
                        id v71 = objc_alloc(NSNumber);
                        [(TALocationLite *)v90 distanceFromLocation:v49];
                        uint64_t v72 = objc_msgSend(v71, "initWithDouble:");
                        v73 = (void *)v97[12];
                        v97[12] = v72;
                      }
                      long long v104 = 0u;
                      long long v105 = 0u;
                      long long v102 = 0u;
                      long long v103 = 0u;
                      id v74 = v91;
                      uint64_t v75 = [v74 countByEnumeratingWithState:&v102 objects:v111 count:16];
                      if (v75)
                      {
                        uint64_t v76 = v75;
                        v92 = v70;
                        uint64_t v77 = *(void *)v103;
                        LOBYTE(v78) = 1;
                        while (2)
                        {
                          for (uint64_t i = 0; i != v76; ++i)
                          {
                            if (*(void *)v103 != v77) {
                              objc_enumerationMutation(v74);
                            }
                            if (!v78)
                            {

                              uint64_t v82 = 0;
                              id v11 = v97;
                              uint64_t v53 = v98;
                              v48 = v94;
                              uint64_t v51 = v95;
                              v70 = v92;
                              uint64_t v52 = v93;
                              goto LABEL_31;
                            }
                            uint64_t v80 = *(void *)(*((void *)&v102 + 1) + 8 * i);
                            uint64_t v81 = [v10 minNSigmaBetweenVisits];
                            [v10 minInterVisitDistance];
                            BOOL v78 = +[TALocationLite distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:](TALocationLite, "distanceFromLocation:toLocation:satisfyNSigma:satisfyMinDistance:", v49, v80, v81);
                          }
                          uint64_t v76 = [v74 countByEnumeratingWithState:&v102 objects:v111 count:16];
                          if (v76) {
                            continue;
                          }
                          break;
                        }

                        id v11 = v97;
                        v70 = v92;
                        if (!v78)
                        {
                          uint64_t v82 = 0;
                          goto LABEL_34;
                        }
                      }
                      else
                      {
                      }
                      [v74 addObject:v49];
                      uint64_t v82 = 1;
LABEL_34:
                      v48 = v94;
                      uint64_t v51 = v95;
                      uint64_t v52 = v93;
                      int v83 = v100;
                      uint64_t v53 = v98;
                    }
                    else
                    {
                      uint64_t v82 = 0;
                      uint64_t v53 = 0;
                      v48 = v94;
                      uint64_t v51 = v95;
                      uint64_t v52 = v93;
LABEL_31:
                      int v83 = v100;
                    }
                    uint64_t v54 = v83 & v53 & v99;
                    uint64_t v84 = *((void *)v11 + 2);
                    uint64_t v85 = *((void *)v11 + 3);
                    if (v70) {
                      ++v84;
                    }
                    *((void *)v11 + 2) = v84;
                    *((void *)v11 + 3) = v85 + v82;
                    uint64_t v86 = *((void *)v11 + 5) + v54;
                    *((void *)v11 + 4) += v53 & 1;
                    *((void *)v11 + 5) = v86;

                    v101 = v49;
                  }
                  ++v55;
                }
                while (v55 != v51);
                uint64_t v51 = [obj countByEnumeratingWithState:&v106 objects:v112 count:16];
              }
              while (v51);
            }

            id v9 = v88;
            id v8 = v89;
            goto LABEL_41;
          }
        }
      }
    }
    v12 = 0;
  }
LABEL_44:

  return v12;
}

- (unint64_t)getMetricsCollectionType
{
  return 2;
}

- (id)descriptionDictionary
{
  v37[13] = *MEMORY[0x263EF8340];
  v3 = [(TAMetricsVisit *)self visitEntryDelay];
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3)
  {
    v6 = [(TAMetricsVisit *)self visitEntryDelay];
    [v6 duration];
    double v5 = v7;
  }
  id v8 = [(TAMetricsVisit *)self visitExitDelay];
  if (v8)
  {
    id v9 = [(TAMetricsVisit *)self visitExitDelay];
    [v9 duration];
    double v4 = v10;
  }
  id v11 = [(TAMetricsVisit *)self distanceToPreviousSeenVisit];
  if (v11)
  {
    v12 = [(TAMetricsVisit *)self distanceToPreviousSeenVisit];
    [v12 doubleValue];
    double v14 = v13;
  }
  else
  {
    double v14 = 0.0;
  }

  v36[0] = @"MetricsType";
  v15 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v15);
  v37[0] = v35;
  v36[1] = @"Address";
  int64x2_t v34 = [(TAMetricsVisit *)self address];
  int64x2_t v33 = [v34 hexString];
  v37[1] = v33;
  v36[2] = @"TotalVisitCount";
  int64x2_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAMetricsVisit totalVisitCount](self, "totalVisitCount"));
  v37[2] = v32;
  v36[3] = @"TotalDistinctVisitCount";
  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAMetricsVisit totalDistinctVisitCount](self, "totalDistinctVisitCount"));
  v37[3] = v31;
  v36[4] = @"ConsecutiveVisitCount";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAMetricsVisit consecutiveVisitCount](self, "consecutiveVisitCount"));
  v37[4] = v16;
  v36[5] = @"ConsecutiveAndDistinctFromPrevVisitCount";
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TAMetricsVisit consecutiveAndDistinctFromPrevVisitCount](self, "consecutiveAndDistinctFromPrevVisitCount"));
  v37[5] = v17;
  v36[6] = @"DurationOfVisitEntryConsideration";
  v18 = NSNumber;
  [(TAMetricsVisit *)self durationOfVisitEntryConsideration];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  v37[6] = v19;
  v36[7] = @"DurationOfVisitExitConsideration";
  uint64_t v20 = NSNumber;
  [(TAMetricsVisit *)self durationOfVisitExitConsideration];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  v37[7] = v21;
  v36[8] = @"EntryDelay";
  uint64_t v22 = [NSNumber numberWithDouble:v5];
  v37[8] = v22;
  v36[9] = @"ExitDelay";
  uint64_t v23 = [NSNumber numberWithDouble:v4];
  v37[9] = v23;
  v36[10] = @"Latitude";
  v24 = NSNumber;
  [(TAMetricsVisit *)self latitude];
  uint64_t v25 = objc_msgSend(v24, "numberWithDouble:");
  v37[10] = v25;
  v36[11] = @"Longitude";
  v26 = NSNumber;
  [(TAMetricsVisit *)self longitude];
  uint64_t v27 = objc_msgSend(v26, "numberWithDouble:");
  v37[11] = v27;
  v36[12] = @"DistanceToPreviousSeenVisit";
  uint64_t v28 = [NSNumber numberWithDouble:v14];
  v37[12] = v28;
  v29 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:13];

  return v29;
}

- (NSString)description
{
  v3 = [(TAMetricsVisit *)self descriptionDictionary];
  id v10 = 0;
  double v4 = [MEMORY[0x263F08900] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
      [(TAOutgoingRequests *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  id v8 = v7;

  return (NSString *)v8;
}

- (NSData)address
{
  return self->_address;
}

- (unint64_t)totalVisitCount
{
  return self->_totalVisitCount;
}

- (unint64_t)totalDistinctVisitCount
{
  return self->_totalDistinctVisitCount;
}

- (unint64_t)consecutiveVisitCount
{
  return self->_consecutiveVisitCount;
}

- (unint64_t)consecutiveAndDistinctFromPrevVisitCount
{
  return self->_consecutiveAndDistinctFromPrevVisitCount;
}

- (double)durationOfVisitEntryConsideration
{
  return self->_durationOfVisitEntryConsideration;
}

- (double)durationOfVisitExitConsideration
{
  return self->_durationOfVisitExitConsideration;
}

- (NSDateInterval)visitEntryDelay
{
  return self->_visitEntryDelay;
}

- (NSDateInterval)visitExitDelay
{
  return self->_visitExitDelay;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSNumber)distanceToPreviousSeenVisit
{
  return self->_distanceToPreviousSeenVisit;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_distanceToPreviousSeenVisit, 0);
  objc_storeStrong((id *)&self->_visitExitDelay, 0);
  objc_storeStrong((id *)&self->_visitEntryDelay, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end