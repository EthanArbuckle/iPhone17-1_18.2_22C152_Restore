@interface RTParkingQualityProvider
- (NSMutableArray)movingHistorgram;
- (RTParkingQualityProvider)init;
- (id)getCdfFromHistogram:(id)a3 numSamples:(double)a4;
- (id)getHistogramFromSamples:(id)a3;
- (int)indexOfSmallestElement:(double *)a3 size:(int)a4;
- (unint64_t)calculateParkingQualityWithLocations:(id)a3 parkingTimestamp:(double)a4;
- (unint64_t)classifySamples:(id)a3;
- (unint64_t)parkingQualityIndicator;
- (unint64_t)parkingQualityToLocationQuality:(unint64_t)a3;
- (void)reset;
- (void)setMovingHistorgram:(id)a3;
- (void)setParkingQualityIndicator:(unint64_t)a3;
@end

@implementation RTParkingQualityProvider

- (int)indexOfSmallestElement:(double *)a3 size:(int)a4
{
  if (a4 < 2) {
    return 0;
  }
  int result = 0;
  for (uint64_t i = 1; i != a4; ++i)
  {
    if (a3[i] < a3[result]) {
      int result = i;
    }
  }
  return result;
}

- (RTParkingQualityProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)RTParkingQualityProvider;
  v2 = [(RTParkingQualityProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_parkingQualityIndicator = 0;
    uint64_t v4 = objc_opt_new();
    movingHistorgram = v3->_movingHistorgram;
    v3->_movingHistorgram = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)reset
{
  v3 = [(RTParkingQualityProvider *)self movingHistorgram];
  [v3 removeAllObjects];

  [(RTParkingQualityProvider *)self setParkingQualityIndicator:0];
}

- (id)getHistogramFromSamples:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  for (uint64_t i = 0; i != 17; ++i)
    [v4 setObject:&unk_1F3452388 atIndexedSubscript:i];
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      objc_super v7 = [v3 objectAtIndexedSubscript:v6];
      [v7 doubleValue];
      int v9 = (int)(v8 / 5.0);

      unsigned int v10 = v9 & ~(v9 >> 31);
      if (v10 >= 0x10) {
        uint64_t v11 = 16;
      }
      else {
        uint64_t v11 = v10;
      }
      v12 = NSNumber;
      v13 = [v4 objectAtIndexedSubscript:v11];
      v14 = [v12 numberWithInt:[v13 intValue] + 1];
      [v4 setObject:v14 atIndexedSubscript:v11];

      ++v6;
    }
    while ([v3 count] > v6);
  }

  return v4;
}

- (id)getCdfFromHistogram:(id)a3 numSamples:(double)a4
{
  id v5 = a3;
  unint64_t v6 = v5;
  if (a4 >= 1.0 && [v5 count])
  {
    objc_super v7 = objc_opt_new();
    if ([v6 count])
    {
      unint64_t v8 = 0;
      do
        [v7 setObject:&unk_1F3452388 atIndexedSubscript:v8++];
      while ([v6 count] > v8);
    }
    int v9 = [v6 objectAtIndexedSubscript:0];
    [v7 setObject:v9 atIndexedSubscript:0];

    if ((unint64_t)[v7 count] >= 2)
    {
      unint64_t v10 = 1;
      do
      {
        uint64_t v11 = NSNumber;
        v12 = [v7 objectAtIndexedSubscript:v10 - 1];
        [v12 doubleValue];
        double v14 = v13;
        v15 = [v6 objectAtIndexedSubscript:v10];
        [v15 doubleValue];
        v17 = [v11 numberWithDouble:v14 + v16];
        [v7 setObject:v17 atIndexedSubscript:v10];

        ++v10;
      }
      while ([v7 count] > v10);
    }
    if ([v7 count])
    {
      unint64_t v18 = 0;
      do
      {
        v19 = NSNumber;
        v20 = [v7 objectAtIndexedSubscript:v18];
        [v20 doubleValue];
        v22 = [v19 numberWithDouble:v21 * 100.0 / a4];
        [v7 setObject:v22 atIndexedSubscript:v18];

        ++v18;
      }
      while ([v7 count] > v18);
    }
  }
  else
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "noSamples <1 or histogram is empty", v25, 2u);
    }

    objc_super v7 = 0;
  }

  return v7;
}

- (unint64_t)calculateParkingQualityWithLocations:(id)a3 parkingTimestamp:(double)a4
{
  id v6 = a3;
  [(RTParkingQualityProvider *)self reset];
  objc_super v7 = objc_opt_new();
  if ([v6 count])
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      unint64_t v10 = [v6 objectAtIndexedSubscript:v8];
      [v10 horizontalAccuracy];
      if (v11 > 0.0)
      {
        v12 = [v10 timestamp];
        [v12 timeIntervalSinceReferenceDate];
        if (a4 - v13 <= 10.0)
        {
          double v14 = [v10 timestamp];
          [v14 timeIntervalSinceReferenceDate];
          double v16 = v15 - a4;

          if (v16 > 16.0
            || [v10 type] != 1
            && [v10 type] != 3
            && [v10 type] != 2
            && [v10 type] != 10)
          {
            goto LABEL_12;
          }
          v17 = NSNumber;
          [v10 horizontalAccuracy];
          v12 = [v17 numberWithDouble:];
          [v7 addObject:v12];
        }
      }
LABEL_12:

      uint64_t v8 = v9;
    }
    while ([v6 count] > (unint64_t)v9++);
  }
  if ([v7 count]) {
    unint64_t v19 = [(RTParkingQualityProvider *)self classifySamples:v7];
  }
  else {
    unint64_t v19 = 0;
  }
  unint64_t v20 = [(RTParkingQualityProvider *)self parkingQualityToLocationQuality:v19];

  return v20;
}

- (unint64_t)classifySamples:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  if ([v4 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      objc_super v7 = [v4 objectAtIndexedSubscript:v6];
      [v7 doubleValue];
      if (v8 <= 0.0) {
        goto LABEL_6;
      }
      unsigned int v9 = [v4 objectAtIndexedSubscript:v6];
      [v9 doubleValue];
      double v11 = v10;

      if (v11 < 65000.0) {
        break;
      }
LABEL_7:
      if ([v4 count] <= (unint64_t)++v6) {
        goto LABEL_8;
      }
    }
    objc_super v7 = [v4 objectAtIndexedSubscript:v6];
    [v5 addObject:v7];
LABEL_6:

    goto LABEL_7;
  }
LABEL_8:
  if ([v5 count])
  {
    v12 = [(RTParkingQualityProvider *)self movingHistorgram];
    unint64_t v13 = [v12 count];

    if (v13 >= 3)
    {
      double v14 = [(RTParkingQualityProvider *)self movingHistorgram];
      [v14 removeLastObject];

      double v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Window length is larger than the max allowed", buf, 2u);
      }
    }
    double v16 = [(RTParkingQualityProvider *)self getHistogramFromSamples:v5];
    v17 = [(RTParkingQualityProvider *)self movingHistorgram];
    [v17 insertObject:v16 atIndex:0];

    unint64_t v18 = [(RTParkingQualityProvider *)self movingHistorgram];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      v70 = v5;
      id v71 = v4;
      unint64_t v20 = objc_opt_new();
      for (uint64_t i = 0; i != 17; ++i)
        [v20 setObject:&unk_1F3452388 atIndexedSubscript:i];
      v22 = [(RTParkingQualityProvider *)self movingHistorgram];
      v23 = [v22 objectAtIndexedSubscript:0];
      uint64_t v24 = [v23 count];

      if (v24)
      {
        uint64_t v25 = 0;
        unsigned int v26 = 0;
        do
        {
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          v27 = self;
          v28 = [(RTParkingQualityProvider *)self movingHistorgram];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v81 objects:v90 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            LODWORD(v31) = 0;
            uint64_t v32 = *(void *)v82;
            do
            {
              for (uint64_t j = 0; j != v30; ++j)
              {
                if (*(void *)v82 != v32) {
                  objc_enumerationMutation(v28);
                }
                v34 = [*(id *)(*((void *)&v81 + 1) + 8 * j) objectAtIndexedSubscript:v25];
                uint64_t v31 = [v34 intValue] + v31;
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v81 objects:v90 count:16];
            }
            while (v30);
          }
          else
          {
            uint64_t v31 = 0;
          }

          v35 = [NSNumber numberWithUnsignedInt:v31];
          [v20 setObject:v35 atIndexedSubscript:v25];

          self = v27;
          v36 = [(RTParkingQualityProvider *)v27 movingHistorgram];
          v37 = [v36 objectAtIndexedSubscript:0];
          unint64_t v38 = [v37 count];

          uint64_t v25 = ++v26;
        }
        while (v38 > v26);
      }
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v39 = v20;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v78;
        double v43 = 0.0;
        id v4 = v71;
        do
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v78 != v42) {
              objc_enumerationMutation(v39);
            }
            [*(id *)(*((void *)&v77 + 1) + 8 * k) doubleValue];
            double v43 = v43 + v45;
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v77 objects:v89 count:16];
        }
        while (v41);
      }
      else
      {
        double v43 = 0.0;
        id v4 = v71;
      }

      v48 = [(RTParkingQualityProvider *)self getCdfFromHistogram:v39 numSamples:v43];
      v49 = v48;
      if (!v48)
      {
        [(RTParkingQualityProvider *)self reset];
        unint64_t v47 = 0;
        id v5 = v70;
LABEL_63:

        goto LABEL_64;
      }
      if ([v48 count] != 17)
      {
        v67 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        id v5 = v70;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D9BFA000, v67, OS_LOG_TYPE_ERROR, "unexpected trained cdf data size issue", buf, 2u);
        }

        [(RTParkingQualityProvider *)self reset];
        unint64_t v47 = 0;
        goto LABEL_63;
      }
      v72 = self;
      *(double *)buf = 0.0;
      double v87 = 0.0;
      double v88 = 0.0;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      v69 = v49;
      id v50 = v49;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v73 objects:v85 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        int v53 = 0;
        uint64_t v54 = *(void *)v74;
        double v55 = 0.0;
        double v56 = 0.0;
        double v57 = 0.0;
        do
        {
          uint64_t v58 = 0;
          int v59 = v53;
          v60 = (char *)&kCDFHigh + 8 * v53;
          v61 = (char *)&kCDFMedium + 8 * v53;
          v62 = (char *)&kCDFLow + 8 * v53;
          do
          {
            if (*(void *)v74 != v54) {
              objc_enumerationMutation(v50);
            }
            [*(id *)(*((void *)&v73 + 1) + 8 * v58) doubleValue];
            double v57 = v57 + (v63 - *(double *)&v62[8 * v58]) * (v63 - *(double *)&v62[8 * v58]);
            double v56 = v56 + (v63 - *(double *)&v61[8 * v58]) * (v63 - *(double *)&v61[8 * v58]);
            double v55 = v55 + (v63 - *(double *)&v60[8 * v58]) * (v63 - *(double *)&v60[8 * v58]);
            double v87 = v56;
            double v88 = v57;
            *(double *)buf = v55;
            ++v58;
          }
          while (v52 != v58);
          uint64_t v52 = [v50 countByEnumeratingWithState:&v73 objects:v85 count:16];
          int v53 = v59 + v58;
        }
        while (v52);
      }

      [(RTParkingQualityProvider *)v72 setParkingQualityIndicator:[(RTParkingQualityProvider *)v72 indexOfSmallestElement:buf size:3] + 1];
      unint64_t parkingQualityIndicator = v72->_parkingQualityIndicator;
      if (parkingQualityIndicator == 1)
      {
        double v64 = v87 * 0.93;
        v49 = v69;
        id v5 = v70;
        if (v87 * 0.93 > *(double *)buf)
        {
LABEL_62:
          unint64_t v47 = [(RTParkingQualityProvider *)v72 parkingQualityIndicator];
          goto LABEL_63;
        }
        uint64_t v66 = 2;
      }
      else
      {
        v49 = v69;
        id v5 = v70;
        if (parkingQualityIndicator != 2) {
          goto LABEL_62;
        }
        double v64 = v88 * 0.98;
        if (v88 * 0.98 > v87) {
          goto LABEL_62;
        }
        uint64_t v66 = 3;
      }
      -[RTParkingQualityProvider setParkingQualityIndicator:](v72, "setParkingQualityIndicator:", v66, v64);
      goto LABEL_62;
    }
    v46 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v46, OS_LOG_TYPE_ERROR, " Size of moving histograms was zero", buf, 2u);
    }
  }
  else
  {
    [(RTParkingQualityProvider *)self reset];
  }
  unint64_t v47 = 0;
LABEL_64:

  return v47;
}

- (unint64_t)parkingQualityToLocationQuality:(unint64_t)a3
{
  unint64_t result = a3;
  if (a3 >= 4)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v7 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Unrecognized parking quality.", v7, 2u);
    }

    return 0;
  }
  return result;
}

- (NSMutableArray)movingHistorgram
{
  return self->_movingHistorgram;
}

- (void)setMovingHistorgram:(id)a3
{
}

- (unint64_t)parkingQualityIndicator
{
  return self->_parkingQualityIndicator;
}

- (void)setParkingQualityIndicator:(unint64_t)a3
{
  self->_unint64_t parkingQualityIndicator = a3;
}

- (void).cxx_destruct
{
}

@end