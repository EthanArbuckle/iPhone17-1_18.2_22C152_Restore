@interface CLElevationLocationFilter
- (BOOL)readyToFilter;
- (CLElevationLocationFilter)initWithWindowSize:(double)a3;
- (CLElevationLocationFilter)initWithWindowSize:(double)a3 andCadence:(double)a4 andVerticalAccuracyThreshold:(double)a5;
- (double)interpolateWithStartTime:(double)a3 andStartValue:(double)a4 andEndTime:(double)a5 andEndValue:(double)a6 atTargetTime:(double)a7;
- (id).cxx_construct;
- (unint64_t)_getElevationStartIndex:(id)a3;
- (void)_interpolatePressureValuesWithElevationArray:(id)a3;
- (void)aggregateFilteredLocations:(id)a3 andAddTo:(id)a4;
- (void)append:(id)a3;
- (void)dealloc;
- (void)fetchFilteredLocations:(id)a3 withElevationArray:(id)a4;
- (void)reset;
- (void)setReadyToFilter:(BOOL)a3;
@end

@implementation CLElevationLocationFilter

- (CLElevationLocationFilter)initWithWindowSize:(double)a3
{
  sub_101A1F180(v6, "ElevationLocationFilterVerticalAccuracyThreshold", &qword_101D985C8, 0);
  return [(CLElevationLocationFilter *)self initWithWindowSize:a3 andCadence:a3 * 0.5 andVerticalAccuracyThreshold:v7];
}

- (CLElevationLocationFilter)initWithWindowSize:(double)a3 andCadence:(double)a4 andVerticalAccuracyThreshold:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CLElevationLocationFilter;
  v8 = [(CLElevationLocationFilter *)&v12 init];
  if (v8)
  {
    v8->_locationBuffer = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v8->_windowSize = a3;
    v8->_cadence = a4;
    v8->_verticalAccuracyThreshold = a5;
    v8->_firstUnfilteredLocationTime = 1.79769313e308;
    v8->_readyToFilter = 0;
    unsigned __int8 v10 = 0;
    sub_10006ACBC(v11, "ElevationVerbose", &v10, 0);
    v8->_isVerboseLogging = v11[1];
  }
  return v8;
}

- (void)dealloc
{
  self->_locationBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLElevationLocationFilter;
  [(CLElevationLocationFilter *)&v3 dealloc];
}

- (void)reset
{
  self->_deltaElevationsInWindow.__end_ = self->_deltaElevationsInWindow.__begin_;
  self->_verticalAccuraciesInWindow.__end_ = self->_verticalAccuraciesInWindow.__begin_;
  self->_firstUnfilteredLocationTime = 1.79769313e308;
  self->_readyToFilter = 0;
}

- (void)append:(id)a3
{
  [a3 latitude];
  double v6 = v5;
  [a3 longitude];
  double v8 = v7;
  [a3 horizontalAccuracy];
  float v9 = v6;
  float v10 = v8;
  float v12 = v11;
  if (sub_1014BE6B4(v9, v10, v12))
  {
    if (self->_firstUnfilteredLocationTime == 1.79769313e308)
    {
      [a3 timestamp];
      self->_firstUnfilteredLocationTime = v13;
    }
    v14 = objc_alloc_init(CLLocationFilterEntry);
    [a3 timestamp];
    -[CLLocationDBEntry setTimestamp:](v14, "setTimestamp:");
    [a3 elevation];
    -[CLLocationDBEntry setElevation:](v14, "setElevation:");
    [a3 verticalAccuracy];
    -[CLLocationDBEntry setVerticalAccuracy:](v14, "setVerticalAccuracy:");
    [a3 latitude];
    -[CLLocationDBEntry setLatitude:](v14, "setLatitude:");
    [a3 longitude];
    -[CLLocationDBEntry setLongitude:](v14, "setLongitude:");
    [(NSMutableArray *)self->_locationBuffer addObject:v14];

    [a3 timestamp];
    if (v15 - self->_firstUnfilteredLocationTime > self->_cadence) {
      self->_readyToFilter = 1;
    }
  }
}

- (void)fetchFilteredLocations:(id)a3 withElevationArray:(id)a4
{
  self->_readyToFilter = 0;
  if ([a4 count])
  {
    [(CLElevationLocationFilter *)self _interpolatePressureValuesWithElevationArray:a4];
    if ([(NSMutableArray *)self->_locationBuffer count])
    {
      begin = self->_deltaElevationsInWindow.__begin_;
      end = self->_deltaElevationsInWindow.__end_;
      float v9 = begin + 1;
      double v10 = *begin;
      if (begin != end && v9 != end)
      {
        double v11 = *begin;
        float v12 = begin + 1;
        double v13 = self->_deltaElevationsInWindow.__begin_;
        v14 = begin + 1;
        do
        {
          double v15 = *v14++;
          double v16 = v15;
          if (v11 < v15)
          {
            double v11 = v16;
            double v13 = v12;
          }
          float v12 = v14;
        }
        while (v14 != end);
        double v17 = *v13;
        v18 = begin + 1;
        do
        {
          double v19 = *v18++;
          double v20 = v19;
          if (v19 < v10)
          {
            double v10 = v20;
            begin = v9;
          }
          float v9 = v18;
        }
        while (v18 != end);
        double v10 = v17;
      }
      double v21 = *begin;
      v22 = self->_verticalAccuraciesInWindow.__begin_;
      v23 = self->_verticalAccuraciesInWindow.__end_;
      v24 = v22 + 1;
      if (v22 != v23 && v24 != v23)
      {
        double v26 = *v22;
        v27 = v22 + 1;
        do
        {
          double v28 = *v27++;
          double v29 = v28;
          if (v28 < v26)
          {
            double v26 = v29;
            v22 = v24;
          }
          v24 = v27;
        }
        while (v27 != v23);
      }
      double verticalAccuracyThreshold = *v22;
      if (self->_verticalAccuracyThreshold < *v22) {
        double verticalAccuracyThreshold = self->_verticalAccuracyThreshold;
      }
      if (v10 - v21 >= verticalAccuracyThreshold)
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        locationBuffer = self->_locationBuffer;
        id v48 = [(NSMutableArray *)locationBuffer countByEnumeratingWithState:&v56 objects:v65 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = *(void *)v57;
          while (2)
          {
            for (i = 0; i != v49; i = (char *)i + 1)
            {
              if (*(void *)v57 != v50) {
                objc_enumerationMutation(locationBuffer);
              }
              v52 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              [v52 timestamp];
              if (v53 > self->_firstUnfilteredLocationTime + self->_cadence)
              {
                v54 = v52;
LABEL_58:
                [v54 timestamp];
                self->_firstUnfilteredLocationTime = v55;
                return;
              }
            }
            id v49 = [(NSMutableArray *)locationBuffer countByEnumeratingWithState:&v56 objects:v65 count:16];
            if (v49) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        v31 = self->_locationBuffer;
        id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v60 objects:v66 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v61;
          while (2)
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v61 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
              [v36 timestamp];
              if (v37 >= self->_firstUnfilteredLocationTime)
              {
                [v36 timestamp];
                if (v38 > self->_firstUnfilteredLocationTime + self->_cadence)
                {
                  v54 = v36;
                  goto LABEL_58;
                }
                [v36 elevation];
                float v40 = v39;
                [v36 interpPressure];
                float v42 = v41;
                float v43 = sub_1014BE5D0(v40, v42);
                if (v43 >= 80000.0 && v43 <= 115000.0)
                {
                  v44 = objc_alloc_init(CLLocationDBEntry);
                  [v36 timestamp];
                  -[CLLocationDBEntry setTimestamp:](v44, "setTimestamp:");
                  [v36 elevation];
                  -[CLLocationDBEntry setElevation:](v44, "setElevation:");
                  [v36 verticalAccuracy];
                  -[CLLocationDBEntry setVerticalAccuracy:](v44, "setVerticalAccuracy:");
                  [v36 interpPressure];
                  -[CLLocationDBEntry setInterpPressure:](v44, "setInterpPressure:");
                  [v36 latitude];
                  -[CLLocationDBEntry setLatitude:](v44, "setLatitude:");
                  [v36 longitude];
                  -[CLLocationDBEntry setLongitude:](v44, "setLongitude:");
                  [a3 addObject:v44];
                }
              }
            }
            id v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v60 objects:v66 count:16];
            if (v33) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  else
  {
    if (qword_1024190D0 != -1) {
      dispatch_once(&qword_1024190D0, &stru_102305C60);
    }
    v45 = qword_1024190D8;
    if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "warning: location filter requires a non-empty elevationArray", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190D0 != -1) {
        dispatch_once(&qword_1024190D0, &stru_102305C60);
      }
      __int16 v64 = 0;
      v46 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationLocationFilter fetchFilteredLocations:withElevationArray:]", "%s\n", v46);
      if (v46 != (char *)buf) {
        free(v46);
      }
    }
  }
}

- (void)aggregateFilteredLocations:(id)a3 andAddTo:(id)a4
{
  if ([a3 count])
  {
    double v6 = objc_alloc_init(CLLocationDBEntry);
    [(CLLocationDBEntry *)v6 setTimestamp:0.0];
    [(CLLocationDBEntry *)v6 setElevation:0.0];
    [(CLLocationDBEntry *)v6 setVerticalAccuracy:0.0];
    [(CLLocationDBEntry *)v6 setInterpPressure:0.0];
    [(CLLocationDBEntry *)v6 setLatitude:0.0];
    [(CLLocationDBEntry *)v6 setLongitude:0.0];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v7 = [a3 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v43;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(a3);
          }
          double v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          [v11 timestamp];
          double v13 = v12;
          [(CLLocationDBEntry *)v6 timestamp];
          [(CLLocationDBEntry *)v6 setTimestamp:v13 + v14];
          [v11 elevation];
          double v16 = v15;
          [(CLLocationDBEntry *)v6 elevation];
          [(CLLocationDBEntry *)v6 setElevation:v16 + v17];
          [v11 verticalAccuracy];
          double v19 = v18;
          [(CLLocationDBEntry *)v6 verticalAccuracy];
          [(CLLocationDBEntry *)v6 setVerticalAccuracy:v19 + v20];
          [v11 interpPressure];
          double v22 = v21;
          [(CLLocationDBEntry *)v6 interpPressure];
          [(CLLocationDBEntry *)v6 setInterpPressure:v22 + v23];
          [v11 latitude];
          double v25 = v24;
          [(CLLocationDBEntry *)v6 latitude];
          [(CLLocationDBEntry *)v6 setLatitude:v25 + v26];
          [v11 longitude];
          double v28 = v27;
          [(CLLocationDBEntry *)v6 longitude];
          [(CLLocationDBEntry *)v6 setLongitude:v28 + v29];
        }
        id v8 = [a3 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v8);
    }
    id v30 = [a3 count];
    [(CLLocationDBEntry *)v6 timestamp];
    [(CLLocationDBEntry *)v6 setTimestamp:v31 / (double)(unint64_t)v30];
    id v32 = [a3 count];
    [(CLLocationDBEntry *)v6 elevation];
    [(CLLocationDBEntry *)v6 setElevation:v33 / (double)(unint64_t)v32];
    id v34 = [a3 count];
    [(CLLocationDBEntry *)v6 verticalAccuracy];
    [(CLLocationDBEntry *)v6 setVerticalAccuracy:v35 / (double)(unint64_t)v34];
    id v36 = [a3 count];
    [(CLLocationDBEntry *)v6 interpPressure];
    [(CLLocationDBEntry *)v6 setInterpPressure:v37 / (double)(unint64_t)v36];
    id v38 = [a3 count];
    [(CLLocationDBEntry *)v6 latitude];
    [(CLLocationDBEntry *)v6 setLatitude:v39 / (double)(unint64_t)v38];
    id v40 = [a3 count];
    [(CLLocationDBEntry *)v6 longitude];
    [(CLLocationDBEntry *)v6 setLongitude:v41 / (double)(unint64_t)v40];
    [a4 addObject:v6];
  }
}

- (void)_interpolatePressureValuesWithElevationArray:(id)a3
{
  double v5 = -[CLElevationLocationFilter _getElevationStartIndex:](self, "_getElevationStartIndex:");
  if (v5 < (char *)[a3 count] - 1)
  {
    [objc_msgSend(a3, "objectAtIndex:", v5) pressure];
    *(float *)&double v6 = v6;
    float v7 = sub_1001C1F30(*(float *)&v6, 101320.0);
    [objc_msgSend(a3, "objectAtIndex:", v5 + 1) pressure];
    *(float *)&double v8 = v8;
    float v9 = sub_1001C1F30(*(float *)&v8, 101320.0);
    [objc_msgSend(a3, "objectAtIndex:", v5) timestamp];
    double v11 = v10;
    [objc_msgSend(a3, "objectAtIndex:", v5 + 1) timestamp];
    double v13 = v12;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    begin = self->_verticalAccuraciesInWindow.__begin_;
    p_verticalAccuraciesInWindow = &self->_verticalAccuraciesInWindow;
    p_deltaElevationsInWindow = &self->_deltaElevationsInWindow;
    self->_deltaElevationsInWindow.__end_ = self->_deltaElevationsInWindow.__begin_;
    self->_verticalAccuraciesInWindow.__end_ = begin;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    locationBuffer = self->_locationBuffer;
    id v17 = [(NSMutableArray *)locationBuffer countByEnumeratingWithState:&v93 objects:v98 count:16];
    if (!v17) {
      goto LABEL_85;
    }
    double v18 = v9;
    double v19 = v7;
    uint64_t v20 = *(void *)v94;
    p_end_cap = &self->_verticalAccuraciesInWindow.__end_cap_;
    v90 = &self->_deltaElevationsInWindow.__end_cap_;
    while (1)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v94 != v20) {
          objc_enumerationMutation(locationBuffer);
        }
        double v22 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        [v22 timestamp];
        if (v23 >= self->_firstUnfilteredLocationTime)
        {
          [v22 timestamp];
          if (v13 < v32)
          {
            unint64_t v33 = (unint64_t)(v5 + 2);
            if (v5 + 2 >= [a3 count])
            {
              ++v5;
LABEL_20:
              double v19 = v18;
              double v11 = v13;
            }
            else
            {
              double v19 = v18;
              double v11 = v13;
              while (1)
              {
                [objc_msgSend(a3, "objectAtIndex:", v33) timestamp];
                double v13 = v34;
                [objc_msgSend(a3, "objectAtIndex:", v33) pressure];
                *(float *)&double v35 = v35;
                float v36 = sub_1001C1F30(*(float *)&v35, 101320.0);
                [v22 timestamp];
                double v18 = v36;
                if (v13 >= v37) {
                  break;
                }
                ++v33;
                double v19 = v18;
                double v11 = v13;
                if (v33 >= (unint64_t)[a3 count])
                {
                  double v5 = (char *)(v33 - 1);
                  goto LABEL_20;
                }
              }
              double v5 = (char *)(v33 - 1);
            }
          }
          if (v5 >= (char *)[a3 count] - 1) {
            goto LABEL_85;
          }
          [objc_msgSend(a3, "objectAtIndex:", v5) pressure];
          double v39 = v38;
          [objc_msgSend(a3, "objectAtIndex:", v5 + 1) pressure];
          double v41 = v40;
          [v22 timestamp];
          [(CLElevationLocationFilter *)self interpolateWithStartTime:v11 andStartValue:v39 andEndTime:v13 andEndValue:v41 atTargetTime:v42];
          [v22 setInterpPressure:];
          [v22 timestamp];
          [(CLElevationLocationFilter *)self interpolateWithStartTime:v11 andStartValue:v19 andEndTime:v13 andEndValue:v18 atTargetTime:v43];
          double v45 = v44;
          [v22 elevation];
          [v22 setDeltaElevation:v46 - v45];
          [v14 addObject:v22];
          [v22 deltaElevation];
          uint64_t v48 = v47;
          end = self->_deltaElevationsInWindow.__end_;
          value = self->_deltaElevationsInWindow.__end_cap_.__value_;
          if (end >= value)
          {
            v52 = p_deltaElevationsInWindow->__begin_;
            uint64_t v53 = end - p_deltaElevationsInWindow->__begin_;
            unint64_t v54 = v53 + 1;
            if ((unint64_t)(v53 + 1) >> 61) {
              sub_1001D7FD4();
            }
            uint64_t v55 = (char *)value - (char *)v52;
            if (v55 >> 2 > v54) {
              unint64_t v54 = v55 >> 2;
            }
            if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v56 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v56 = v54;
            }
            if (v56)
            {
              long long v57 = (char *)sub_1000DA54C((uint64_t)v90, v56);
              v52 = self->_deltaElevationsInWindow.__begin_;
              end = self->_deltaElevationsInWindow.__end_;
            }
            else
            {
              long long v57 = 0;
            }
            long long v58 = (double *)&v57[8 * v53];
            *(void *)long long v58 = v48;
            v51 = v58 + 1;
            while (end != v52)
            {
              uint64_t v59 = *((void *)end-- - 1);
              *((void *)v58-- - 1) = v59;
            }
            self->_deltaElevationsInWindow.__begin_ = v58;
            self->_deltaElevationsInWindow.__end_ = v51;
            self->_deltaElevationsInWindow.__end_cap_.__value_ = (double *)&v57[8 * v56];
            if (v52) {
              operator delete(v52);
            }
          }
          else
          {
            *(void *)end = v47;
            v51 = end + 1;
          }
          self->_deltaElevationsInWindow.__end_ = v51;
          [v22 verticalAccuracy];
          uint64_t v61 = v60;
          long long v63 = self->_verticalAccuraciesInWindow.__end_;
          long long v62 = self->_verticalAccuraciesInWindow.__end_cap_.__value_;
          if (v63 < v62) {
            goto LABEL_40;
          }
          v65 = p_verticalAccuraciesInWindow->__begin_;
          uint64_t v66 = v63 - p_verticalAccuraciesInWindow->__begin_;
          unint64_t v67 = v66 + 1;
          if ((unint64_t)(v66 + 1) >> 61) {
            sub_1001D7FD4();
          }
          uint64_t v68 = (char *)v62 - (char *)v65;
          if (v68 >> 2 > v67) {
            unint64_t v67 = v68 >> 2;
          }
          if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v69 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v69 = v67;
          }
          if (v69)
          {
            v70 = (char *)sub_1000DA54C((uint64_t)p_end_cap, v69);
            v65 = self->_verticalAccuraciesInWindow.__begin_;
            long long v63 = self->_verticalAccuraciesInWindow.__end_;
          }
          else
          {
            v70 = 0;
          }
          v71 = (double *)&v70[8 * v66];
          *(void *)v71 = v61;
          __int16 v64 = v71 + 1;
          while (v63 != v65)
          {
            uint64_t v72 = *((void *)v63-- - 1);
            *((void *)v71-- - 1) = v72;
          }
LABEL_80:
          self->_verticalAccuraciesInWindow.__begin_ = v71;
          self->_verticalAccuraciesInWindow.__end_ = v64;
          self->_verticalAccuraciesInWindow.__end_cap_.__value_ = (double *)&v70[8 * v69];
          if (v65) {
            operator delete(v65);
          }
LABEL_82:
          self->_verticalAccuraciesInWindow.__end_ = v64;
          continue;
        }
        [v22 interpPressure];
        if (v24 != 1.79769313e308)
        {
          [v22 deltaElevation];
          if (v25 != 1.79769313e308)
          {
            [v22 timestamp];
            if (v26 > self->_firstUnfilteredLocationTime - (self->_windowSize - self->_cadence))
            {
              [v14 addObject:v22];
              [v22 deltaElevation];
              uint64_t v28 = v27;
              id v30 = self->_deltaElevationsInWindow.__end_;
              double v29 = self->_deltaElevationsInWindow.__end_cap_.__value_;
              if (v30 >= v29)
              {
                v73 = p_deltaElevationsInWindow->__begin_;
                uint64_t v74 = v30 - p_deltaElevationsInWindow->__begin_;
                unint64_t v75 = v74 + 1;
                if ((unint64_t)(v74 + 1) >> 61) {
                  sub_1001D7FD4();
                }
                uint64_t v76 = (char *)v29 - (char *)v73;
                if (v76 >> 2 > v75) {
                  unint64_t v75 = v76 >> 2;
                }
                if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v77 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v77 = v75;
                }
                if (v77)
                {
                  v78 = (char *)sub_1000DA54C((uint64_t)v90, v77);
                  v73 = self->_deltaElevationsInWindow.__begin_;
                  id v30 = self->_deltaElevationsInWindow.__end_;
                }
                else
                {
                  v78 = 0;
                }
                v79 = (double *)&v78[8 * v74];
                *(void *)v79 = v28;
                double v31 = v79 + 1;
                while (v30 != v73)
                {
                  uint64_t v80 = *((void *)v30-- - 1);
                  *((void *)v79-- - 1) = v80;
                }
                self->_deltaElevationsInWindow.__begin_ = v79;
                self->_deltaElevationsInWindow.__end_ = v31;
                self->_deltaElevationsInWindow.__end_cap_.__value_ = (double *)&v78[8 * v77];
                if (v73) {
                  operator delete(v73);
                }
              }
              else
              {
                *(void *)id v30 = v27;
                double v31 = v30 + 1;
              }
              self->_deltaElevationsInWindow.__end_ = v31;
              [v22 verticalAccuracy];
              uint64_t v61 = v81;
              long long v63 = self->_verticalAccuraciesInWindow.__end_;
              v82 = self->_verticalAccuraciesInWindow.__end_cap_.__value_;
              if (v63 >= v82)
              {
                v65 = p_verticalAccuraciesInWindow->__begin_;
                uint64_t v83 = v63 - p_verticalAccuraciesInWindow->__begin_;
                unint64_t v84 = v83 + 1;
                if ((unint64_t)(v83 + 1) >> 61) {
                  sub_1001D7FD4();
                }
                uint64_t v85 = (char *)v82 - (char *)v65;
                if (v85 >> 2 > v84) {
                  unint64_t v84 = v85 >> 2;
                }
                if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v69 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v69 = v84;
                }
                if (v69)
                {
                  v70 = (char *)sub_1000DA54C((uint64_t)p_end_cap, v69);
                  v65 = self->_verticalAccuraciesInWindow.__begin_;
                  long long v63 = self->_verticalAccuraciesInWindow.__end_;
                }
                else
                {
                  v70 = 0;
                }
                v71 = (double *)&v70[8 * v83];
                *(void *)v71 = v61;
                __int16 v64 = v71 + 1;
                while (v63 != v65)
                {
                  uint64_t v86 = *((void *)v63-- - 1);
                  *((void *)v71-- - 1) = v86;
                }
                goto LABEL_80;
              }
LABEL_40:
              *(void *)long long v63 = v61;
              __int16 v64 = v63 + 1;
              goto LABEL_82;
            }
          }
        }
      }
      id v17 = [(NSMutableArray *)locationBuffer countByEnumeratingWithState:&v93 objects:v98 count:16];
      if (!v17)
      {
LABEL_85:
        [(NSMutableArray *)self->_locationBuffer removeAllObjects];
        [(NSMutableArray *)self->_locationBuffer addObjectsFromArray:v14];

        return;
      }
    }
  }
  if (qword_1024190D0 != -1) {
    dispatch_once(&qword_1024190D0, &stru_102305C60);
  }
  v87 = qword_1024190D8;
  if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "warning: cannot interpolate pressure values in location filter", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190D0 != -1) {
      dispatch_once(&qword_1024190D0, &stru_102305C60);
    }
    __int16 v97 = 0;
    v88 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationLocationFilter _interpolatePressureValuesWithElevationArray:]", "%s\n", v88);
    if (v88 != (char *)buf) {
      free(v88);
    }
  }
}

- (double)interpolateWithStartTime:(double)a3 andStartValue:(double)a4 andEndTime:(double)a5 andEndValue:(double)a6 atTargetTime:(double)a7
{
  if (a3 <= a7 && a7 <= a5)
  {
    double v9 = a7 - a3;
    if (v9 != 0.0)
    {
      double v10 = a5 - a7;
      if (v10 == 0.0) {
        return a6;
      }
      else {
        return (v10 * a4 + v9 * a6) / (v9 + v10);
      }
    }
  }
  else
  {
    if (qword_1024190D0 != -1) {
      dispatch_once(&qword_1024190D0, &stru_102305C60);
    }
    double v8 = qword_1024190D8;
    if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "warning: startTime, targetTime & endTime should be ascending", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190D0 != -1) {
        dispatch_once(&qword_1024190D0, &stru_102305C60);
      }
      double v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationLocationFilter interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    return 1.79769313e308;
  }
  return a4;
}

- (unint64_t)_getElevationStartIndex:(id)a3
{
  unint64_t v5 = (unint64_t)[a3 count];
  unint64_t v6 = v5 >> 1;
  if (v5 >= 2)
  {
    unint64_t v7 = v5;
    unint64_t v8 = 0;
    do
    {
      [objc_msgSend(a3, "objectAtIndex:", v6) timestamp];
      if (v9 > self->_firstUnfilteredLocationTime) {
        unint64_t v7 = v6;
      }
      else {
        unint64_t v8 = v6;
      }
      unint64_t v6 = (v8 + v7) >> 1;
    }
    while (v8 < v6);
  }
  return v6;
}

- (BOOL)readyToFilter
{
  return self->_readyToFilter;
}

- (void)setReadyToFilter:(BOOL)a3
{
  self->_readyToFilter = a3;
}

- (void).cxx_destruct
{
  begin = self->_verticalAccuraciesInWindow.__begin_;
  if (begin)
  {
    self->_verticalAccuraciesInWindow.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_deltaElevationsInWindow.__begin_;
  if (v4)
  {
    self->_deltaElevationsInWindow.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end