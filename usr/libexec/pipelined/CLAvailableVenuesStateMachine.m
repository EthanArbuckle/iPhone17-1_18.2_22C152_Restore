@interface CLAvailableVenuesStateMachine
+ (double)deg2rad:(double)a3;
+ (double)distBetweenLatLon:(id)a3 latlon1:(id)a4;
+ (double)metersFromGreatCircleDistance:(double)a3;
+ (int64_t)getLocationContextFromVenueBounds:(const void *)a3;
- (BOOL)isVenueDisabled:(id)a3 locationId:(id)a4;
- (BOOL)shouldRecompute:(id)a3;
- (CLAvailableVenuesStateMachine)init;
- (CLIndoorAvailabilityTileParams)availabilityTileParams;
- (GeographicCoordinate)lastFix;
- (NSSet)disabledVenues;
- (double)maxLoadRadius;
- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4;
- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4 withError:(BOOL *)a5;
- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4;
- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5;
- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4;
- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5;
- (id)openTileParserAtPath:(id)a3;
- (id)recomputeIfNecessary:(id)a3 withGlobalAvailabilityTile:(id)a4 andAdditionalLOIs:(id)a5;
- (void)clearLastFix;
- (void)setDisabledVenues:(id)a3;
- (void)setMaxLoadRadius:(double)a3;
@end

@implementation CLAvailableVenuesStateMachine

- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4
{
  v4 = [(CLAvailableVenuesStateMachine *)self getNearbyLocationGroupsForTile:a3 withUpdatedPos:a4 nearLocationsOfInterest:0];

  return v4;
}

- (BOOL)shouldRecompute:(id)a3
{
  id v4 = a3;
  lastFix = self->_lastFix;
  if (!lastFix)
  {
    BOOL v9 = 1;
    goto LABEL_7;
  }
  +[CLAvailableVenuesStateMachine distBetweenLatLon:lastFix latlon1:v4];
  double v7 = v6;
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
    v8 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v8 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_4:
    int v11 = 134217984;
    double v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "@IndoorAvl, load, CLAvailableVenuesStateMachine, shouldRecompute, moveDist, %lf", (uint8_t *)&v11, 0xCu);
  }
LABEL_5:
  BOOL v9 = v7 >= self->_maxLoadRadius * 0.5;
LABEL_7:

  return v9;
}

- (CLAvailableVenuesStateMachine)init
{
  v8.receiver = self;
  v8.super_class = (Class)CLAvailableVenuesStateMachine;
  v2 = [(CLAvailableVenuesStateMachine *)&v8 init];
  v3 = v2;
  if (v2)
  {
    lastFix = v2->_lastFix;
    v2->_lastFix = 0;

    disabledVenues = v3->_disabledVenues;
    v3->_maxLoadRadius = 100000.0;
    v3->_disabledVenues = 0;

    availabilityTileParams = v3->_availabilityTileParams;
    v3->_availabilityTileParams = 0;
  }
  return v3;
}

- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v12 = 0;
  objc_super v8 = [(CLAvailableVenuesStateMachine *)self computeAvailableVenues:v6 nearCoordinates:v7 withError:&v12];
  if (v12)
  {
    sub_1000BA17C();
    BOOL v9 = [(CLAvailableVenuesStateMachine *)self computeAvailableVenues:v6 nearCoordinates:v7 withError:&v12];

    if (v12)
    {
      sub_1000BA17C();
      objc_super v8 = [(CLAvailableVenuesStateMachine *)self computeAvailableVenues:v6 nearCoordinates:v7 withError:&v12];

      if (v12)
      {
        sub_1000BA17C();
        uint64_t v10 = [(CLAvailableVenuesStateMachine *)self computeAvailableVenues:v6 nearCoordinates:v7 withError:&v12];

        if (v12)
        {
          sub_1003A3048(&v13);

          id result = (id)abort_report_np();
          __break(1u);
          return result;
        }
        objc_super v8 = (void *)v10;
      }
    }
    else
    {
      objc_super v8 = v9;
    }
  }

  return v8;
}

- (id)getNearbyLocationGroupsForTile:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = -[CLIndoorAvailabilityTileParams initWithAvailabilityTile:]([CLIndoorAvailabilityTileParams alloc], "initWithAvailabilityTile:", [v8 getAvlTile]);
  availabilityTileParams = self->_availabilityTileParams;
  self->_availabilityTileParams = v11;

  if (!self->_lastFix)
  {
    if (qword_10047BEE8 == -1)
    {
      v19 = qword_10047BEF0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEE8, &stru_1004529F0);
      v19 = qword_10047BEF0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
    }
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "No previous location stored in state, we should definitely recompute", (uint8_t *)&v21, 2u);
    goto LABEL_11;
  }
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
  }
  v13 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    [(GeographicCoordinate *)self->_lastFix latitude];
    uint64_t v15 = v14;
    [(GeographicCoordinate *)self->_lastFix longitude];
    int v21 = 134283777;
    uint64_t v22 = v15;
    __int16 v23 = 2049;
    uint64_t v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Previous load occurred at %{private}.7lf, %{private}.7lf", (uint8_t *)&v21, 0x16u);
  }

LABEL_11:
  v17 = [(CLAvailableVenuesStateMachine *)self recomputeIfNecessary:v9 withGlobalAvailabilityTile:v8 andAdditionalLOIs:v10];

  return v17;
}

- (id)recomputeIfNecessary:(id)a3 withGlobalAvailabilityTile:(id)a4 andAdditionalLOIs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = v11;
  if (v9)
  {
    if (v11)
    {
      if (qword_10047BEE8 != -1)
      {
        dispatch_once(&qword_10047BEE8, &stru_1004529F0);
        v13 = qword_10047BEF0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_15;
        }
        goto LABEL_5;
      }
      v13 = qword_10047BEF0;
      if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:
        LOWORD(v24) = 0;
        uint64_t v14 = "Have to recompute because we have locations of interest";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v24, 2u);
      }
LABEL_15:
      objc_storeStrong((id *)&self->_lastFix, a3);
      goto LABEL_16;
    }
    if ([(CLAvailableVenuesStateMachine *)self shouldRecompute:v9])
    {
      if (qword_10047BEE8 == -1)
      {
        v13 = qword_10047BEF0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_15;
        }
      }
      else
      {
        dispatch_once(&qword_10047BEE8, &stru_1004529F0);
        v13 = qword_10047BEF0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_15;
        }
      }
      LOWORD(v24) = 0;
      uint64_t v14 = "Have to recompute nearby location groups because we moved far enough away";
      goto LABEL_14;
    }
    if (qword_10047BEE8 == -1)
    {
      uint64_t v22 = qword_10047BEF0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
      {
LABEL_26:
        v18 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEE8, &stru_1004529F0);
      uint64_t v22 = qword_10047BEF0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_26;
      }
    }
    BOOL v20 = self->_lastFix == 0;
    LODWORD(v24) = 67109120;
    HIDWORD(v24) = v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "No need to recompute nearby location groups, (_lastFix==nil) = %d", (uint8_t *)&v24, 8u);
    goto LABEL_26;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
    uint64_t v15 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  uint64_t v15 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_8:
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Have to recompute nearby location groups because newCoordinate was not nil?", (uint8_t *)&v24, 2u);
  }
LABEL_16:
  id v16 = [objc_alloc((Class)NSMutableArray) initWithArray:v12];
  v17 = v16;
  if (v9) {
    [v16 addObject:v9];
  }
  v18 = -[CLAvailableVenuesStateMachine computeAvailableVenues:nearCoordinates:](self, "computeAvailableVenues:nearCoordinates:", v10, v17, v24);

LABEL_19:

  return v18;
}

- (id)computeAvailableVenues:(id)a3 nearCoordinates:(id)a4 withError:(BOOL *)a5
{
  id v149 = a3;
  id v138 = a4;
  v139 = a5;
  *a5 = 0;
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:120];
  uint64_t v8 = 120;
  do
  {
    id v9 = objc_alloc_init(ECEFCoordinate);
    [v7 addObject:v9];

    --v8;
  }
  while (v8);
  id v151 = [objc_alloc((Class)NSMutableArray) initWithCapacity:120];
  id v157 = v7;
  v152 = objc_alloc_init(GeographicCoordinate);
  v158 = objc_alloc_init(ENUCoordinate);
  v141 = objc_alloc_init(ECEFCoordinate);
  v145 = objc_alloc_init(GeographicCoordinate);
  signed int v10 = [v149 numVenuesExpected];
  v146 = +[NSMutableArray arrayWithCapacity:v10];
  signed int v11 = [v149 numTotalExpectedExteriorsInVenues];
  int v144 = v10;
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
  }
  char v12 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v179 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "@IndoorAvl, load, Reserving %zu entries for AvailabilityTile entries in result", buf, 0xCu);
  }

  v136 = +[NSMutableArray arrayWithCapacity:v11];
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
  }
  v13 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v179) = v144;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "@IndoorAvl, load, iterating over %d venues in the availability tile", buf, 8u);
  }

  if (v144 >= 1)
  {
    uint64_t v137 = 0;
    uint64_t v135 = 0;
    int v150 = 0;
    while (1)
    {
      sub_1000678D0((uint64_t)buf);
      if ([v149 tileIsOpenForIncrementalIO])
      {
        if (([v149 getNextVenueBoundsIncrementally:buf] & 1) == 0)
        {
          if (qword_10047BEE8 == -1)
          {
            uint64_t v14 = qword_10047BEF0;
            if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR))
            {
LABEL_19:
              int v15 = 1;
              BOOL *v139 = 1;
              goto LABEL_214;
            }
          }
          else
          {
            dispatch_once(&qword_10047BEE8, &stru_1004529F0);
            uint64_t v14 = qword_10047BEF0;
            if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR)) {
              goto LABEL_19;
            }
          }
          *(_WORD *)v177 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, failed to incrementally read venue bounds from tile", v177, 2u);
          goto LABEL_19;
        }
      }
      else
      {
        sub_1001E0EEC((uint64_t)[v149 getAvlTile], v150, (uint64_t)v177);
        sub_1003778E8((uint64_t)buf, (uint64_t)v177);
        sub_1000678CC(v177);
      }
      sub_10006B500(&v181[2], ", ", (uint64_t)__p);
      if (!v184)
      {
        if (qword_10047BEE8 == -1)
        {
          v40 = qword_10047BEF0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR)) {
            goto LABEL_227;
          }
        }
        else
        {
          dispatch_once(&qword_10047BEE8, &stru_1004529F0);
          v40 = qword_10047BEF0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR))
          {
LABEL_227:
            int v15 = 11;
            if ((v174 & 0x80000000) == 0) {
              goto LABEL_214;
            }
LABEL_213:
            operator delete(__p[0]);
            goto LABEL_214;
          }
        }
        v41 = __p;
        if (v174 < 0) {
          v41 = (void **)__p[0];
        }
        *(_DWORD *)v177 = 136446210;
        *(void *)&v177[4] = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, venue [%{public}s] is missing exterior", v177, 0xCu);
        int v15 = 11;
        if (v174 < 0) {
          goto LABEL_213;
        }
        goto LABEL_214;
      }
      v171 = 0;
      uint64_t v172 = 0;
      v170 = &v171;
      v168 = 0;
      uint64_t v169 = 0;
      v167 = &v168;
      if ((v186 & 4) != 0)
      {
        uint64_t v16 = v185;
        if (!v185) {
          uint64_t v16 = *(void *)(qword_100492AC8 + 64);
        }
        sub_10006C4AC(v177, v16);
        uint64_t v17 = *(unsigned int *)&v177[24];
        if (*(int *)&v177[24] >= 1)
        {
          uint64_t v18 = 0;
          uint64_t v19 = v169;
          do
          {
            int v20 = *(_DWORD *)(*(void *)&v177[16] + 4 * v18);
            int v21 = v168;
            uint64_t v22 = &v168;
LABEL_33:
            __int16 v23 = v22;
            if (v21)
            {
              do
              {
                uint64_t v22 = (void **)v21;
                int v24 = *((_DWORD *)v21 + 7);
                if (v20 < v24)
                {
                  int v21 = *v22;
                  goto LABEL_33;
                }
                if (v24 >= v20) {
                  goto LABEL_30;
                }
                int v21 = v22[1];
              }
              while (v21);
              __int16 v23 = v22 + 1;
            }
            v25 = operator new(0x20uLL);
            *((_DWORD *)v25 + 7) = v20;
            void *v25 = 0;
            v25[1] = 0;
            v25[2] = v22;
            *__int16 v23 = v25;
            if (*v167)
            {
              v167 = (void *)*v167;
              v25 = (void *)*v23;
            }
            v26 = v168;
            BOOL v27 = v25 == v168;
            *((unsigned char *)v25 + 24) = v25 == v168;
            if (!v27)
            {
              do
              {
                uint64_t v28 = v25[2];
                if (*(unsigned char *)(v28 + 24)) {
                  break;
                }
                v29 = *(void **)(v28 + 16);
                uint64_t v30 = *v29;
                if (*v29 == v28)
                {
                  uint64_t v33 = v29[1];
                  if (!v33 || (int v34 = *(unsigned __int8 *)(v33 + 24), v31 = (unsigned char *)(v33 + 24), v34))
                  {
                    if (*(void **)v28 == v25)
                    {
                      *(unsigned char *)(v28 + 24) = 1;
                      *((unsigned char *)v29 + 24) = 0;
                      uint64_t v37 = *(void *)(v28 + 8);
                      void *v29 = v37;
                      if (v37) {
                        goto LABEL_55;
                      }
                    }
                    else
                    {
                      v35 = *(uint64_t **)(v28 + 8);
                      uint64_t v36 = *v35;
                      *(void *)(v28 + 8) = *v35;
                      if (v36)
                      {
                        *(void *)(v36 + 16) = v28;
                        v29 = *(void **)(v28 + 16);
                      }
                      v35[2] = (uint64_t)v29;
                      *(void *)(*(void *)(v28 + 16) + 8 * (**(void **)(v28 + 16) != v28)) = v35;
                      uint64_t *v35 = v28;
                      *(void *)(v28 + 16) = v35;
                      v29 = (void *)v35[2];
                      uint64_t v28 = *v29;
                      *((unsigned char *)v35 + 24) = 1;
                      *((unsigned char *)v29 + 24) = 0;
                      uint64_t v37 = *(void *)(v28 + 8);
                      void *v29 = v37;
                      if (v37) {
LABEL_55:
                      }
                        *(void *)(v37 + 16) = v29;
                    }
                    *(void *)(v28 + 16) = v29[2];
                    *(void *)(v29[2] + 8 * (*(void *)v29[2] != (void)v29)) = v28;
                    *(void *)(v28 + 8) = v29;
LABEL_28:
                    v29[2] = v28;
                    break;
                  }
                }
                else if (!v30 || (int v32 = *(unsigned __int8 *)(v30 + 24), v31 = (unsigned char *)(v30 + 24), v32))
                {
                  if (*(void **)v28 == v25)
                  {
                    uint64_t v38 = v25[1];
                    *(void *)uint64_t v28 = v38;
                    if (v38)
                    {
                      *(void *)(v38 + 16) = v28;
                      v29 = *(void **)(v28 + 16);
                    }
                    v25[2] = v29;
                    *(void *)(*(void *)(v28 + 16) + 8 * (**(void **)(v28 + 16) != v28)) = v25;
                    v25[1] = v28;
                    *(void *)(v28 + 16) = v25;
                    v29 = (void *)v25[2];
                  }
                  else
                  {
                    v25 = (void *)v25[2];
                  }
                  *((unsigned char *)v25 + 24) = 1;
                  *((unsigned char *)v29 + 24) = 0;
                  uint64_t v28 = v29[1];
                  v39 = *(void **)v28;
                  v29[1] = *(void *)v28;
                  if (v39) {
                    v39[2] = v29;
                  }
                  *(void *)(v28 + 16) = v29[2];
                  *(void *)(v29[2] + 8 * (*(void *)v29[2] != (void)v29)) = v28;
                  *(void *)uint64_t v28 = v29;
                  goto LABEL_28;
                }
                *(unsigned char *)(v28 + 24) = 1;
                v25 = v29;
                *((unsigned char *)v29 + 24) = v29 == v26;
                unsigned char *v31 = 1;
              }
              while (v29 != v26);
            }
            uint64_t v169 = ++v19;
LABEL_30:
            ++v18;
          }
          while (v18 != v17);
        }
        sub_10006BF98(v177);
      }
      [v146 removeAllObjects];
      if (v182 < 1) {
        goto LABEL_205;
      }
      uint64_t v42 = 0;
      id v43 = 0;
      do
      {
        v44 = *(uint64_t **)(*(void *)&v181[2] + 8 * v42);
        if (*((char *)v44 + 23) < 0) {
          v44 = (uint64_t *)*v44;
        }
        v45 = +[NSString stringWithUTF8String:v44];
        if ([v45 hasPrefix:@"G"])
        {
          if (v43)
          {

            if (qword_10047BEE8 == -1)
            {
              uint64_t v107 = qword_10047BEF0;
              if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR)) {
                goto LABEL_211;
              }
            }
            else
            {
              dispatch_once(&qword_10047BEE8, &stru_1004529F0);
              uint64_t v107 = qword_10047BEF0;
              if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR)) {
                goto LABEL_211;
              }
            }
            v108 = __p;
            if (v174 < 0) {
              v108 = (void **)__p[0];
            }
            *(_DWORD *)v177 = 136446210;
            *(void *)&v177[4] = v108;
            v109 = v107;
            os_log_type_t v110 = OS_LOG_TYPE_ERROR;
            v111 = "Multiple groups associated with venue [%{public}s].  Ignoring from availability tile";
            goto LABEL_222;
          }
          if ([(CLAvailableVenuesStateMachine *)self isVenueDisabled:v45 locationId:0])
          {
            if (qword_10047BEE8 != -1) {
              dispatch_once(&qword_10047BEE8, &stru_1004529F0);
            }
            v112 = (id)qword_10047BEF0;
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
            {
              id v113 = [v45 UTF8String];
              *(_DWORD *)v177 = 136315138;
              *(void *)&v177[4] = v113;
              _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEBUG, "%s in availability tile is disabled by settings", v177, 0xCu);
            }

LABEL_205:
            if (qword_10047BEE8 == -1)
            {
              v114 = qword_10047BEF0;
              if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_207;
              }
            }
            else
            {
              dispatch_once(&qword_10047BEE8, &stru_1004529F0);
              v114 = qword_10047BEF0;
              if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEFAULT))
              {
LABEL_207:
                v115 = __p;
                if (v174 < 0) {
                  v115 = (void **)__p[0];
                }
                *(_DWORD *)v177 = 136315138;
                *(void *)&v177[4] = v115;
                _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "#Warning Cannot find location group in venue [%s]", v177, 0xCu);
              }
            }
            id v43 = 0;
            goto LABEL_211;
          }
          id v43 = v45;
        }
        else
        {
          if (![v45 hasPrefix:@"L"])
          {
            if (qword_10047BEE8 != -1) {
              dispatch_once(&qword_10047BEE8, &stru_1004529F0);
            }
            v46 = (id)qword_10047BEF0;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              id v48 = [v45 UTF8String];
              *(_DWORD *)v177 = 136315138;
              *(void *)&v177[4] = v48;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "#Warning Encountered invalid venue id %s in availability tile. Skipping", v177, 0xCu);
            }
            goto LABEL_92;
          }
          if ([(CLAvailableVenuesStateMachine *)self isVenueDisabled:0 locationId:v45])
          {
            if (qword_10047BEE8 != -1) {
              dispatch_once(&qword_10047BEE8, &stru_1004529F0);
            }
            v46 = (id)qword_10047BEF0;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              id v47 = [v45 UTF8String];
              *(_DWORD *)v177 = 136315138;
              *(void *)&v177[4] = v47;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%s in availability tile is disabled by settings", v177, 0xCu);
            }
LABEL_92:

            goto LABEL_93;
          }
          [v146 addObject:v45];
          if (v42 >= v182)
          {
            sub_1003A32E4();
            abort_report_np();
            goto LABEL_277;
          }
          if ((v186 & 4) != 0)
          {
            v49 = v168;
            if (!v168) {
              goto LABEL_93;
            }
            v50 = &v168;
            do
            {
              v51 = v49;
              v52 = v50;
              uint64_t v53 = *((int *)v49 + 7);
              if (v42 <= v53) {
                v50 = (void **)v49;
              }
              else {
                ++v49;
              }
              v49 = (void *)*v49;
            }
            while (v49);
            if (v50 == &v168) {
              goto LABEL_93;
            }
            if (v42 > v53) {
              v51 = v52;
            }
            if (v42 < *((int *)v51 + 7)) {
              goto LABEL_93;
            }
          }
          else if (!+[CLLocationContextUtil isRegional:](CLLocationContextUtil, "isRegional:", +[CLAvailableVenuesStateMachine getLocationContextFromVenueBounds:buf]))
          {
            goto LABEL_93;
          }
          v54 = (char *)[v146 count] - 1;
          v55 = v171;
          v56 = &v171;
LABEL_111:
          v57 = v56;
          if (v55)
          {
            do
            {
              v56 = (uint64_t **)v55;
              unint64_t v58 = v55[4];
              if ((unint64_t)v54 < v58)
              {
                v55 = *v56;
                goto LABEL_111;
              }
              if (v58 >= (unint64_t)v54) {
                goto LABEL_93;
              }
              v55 = v56[1];
            }
            while (v55);
            v57 = v56 + 1;
          }
          v59 = (uint64_t *)operator new(0x28uLL);
          v59[4] = (uint64_t)v54;
          uint64_t *v59 = 0;
          v59[1] = 0;
          v59[2] = (uint64_t)v56;
          *v57 = v59;
          if (*v170)
          {
            v170 = (uint64_t **)*v170;
            v59 = *v57;
          }
          sub_1000619B8(v171, v59);
          ++v172;
        }
LABEL_93:

        ++v42;
      }
      while (v42 < v182);
      if (!v43) {
        goto LABEL_205;
      }
      if (![v146 count] || !v146)
      {
        if (qword_10047BEE8 == -1)
        {
          uint64_t v116 = qword_10047BEF0;
          if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_219;
          }
LABEL_211:
          int v15 = 11;
          goto LABEL_212;
        }
        dispatch_once(&qword_10047BEE8, &stru_1004529F0);
        uint64_t v116 = qword_10047BEF0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_211;
        }
LABEL_219:
        v117 = __p;
        if (v174 < 0) {
          v117 = (void **)__p[0];
        }
        *(_DWORD *)v177 = 136315138;
        *(void *)&v177[4] = v117;
        v109 = v116;
        os_log_type_t v110 = OS_LOG_TYPE_DEFAULT;
        v111 = "#Warning No venues associated with availability tile [%s]";
LABEL_222:
        _os_log_impl((void *)&_mh_execute_header, v109, v110, v111, v177, 0xCu);
        goto LABEL_211;
      }
      id v60 = [v146 count];
      uint64_t v134 = [v43 substringFromIndex:1];

      int64_t v133 = +[CLAvailableVenuesStateMachine getLocationContextFromVenueBounds:buf];
      v137 += (uint64_t)v60;
      if (v184)
      {
        BOOL v142 = 0;
        v143 = v183;
        v140 = &v183[v184];
        while (1)
        {
          if (v142)
          {
            BOOL v142 = 1;
            goto LABEL_125;
          }
          unint64_t v61 = *(unsigned int *)(*v143 + 24);
          uint64_t v148 = *v143;
          if (v61 == *(_DWORD *)(*v143 + 48)) {
            break;
          }
          if (qword_10047BEE8 == -1)
          {
            v77 = qword_10047BEF0;
            if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR)) {
              goto LABEL_153;
            }
          }
          else
          {
            dispatch_once(&qword_10047BEE8, &stru_1004529F0);
            v77 = qword_10047BEF0;
            if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_ERROR))
            {
LABEL_153:
              v78 = __p;
              if (v174 < 0) {
                v78 = (void **)__p[0];
              }
              int v79 = *(_DWORD *)(v148 + 24);
              int v80 = *(_DWORD *)(v148 + 48);
              *(_DWORD *)v177 = 136446722;
              *(void *)&v177[4] = v78;
              *(_WORD *)&v177[12] = 1026;
              *(_DWORD *)&v177[14] = v79;
              *(_WORD *)&v177[18] = 1026;
              *(_DWORD *)&v177[20] = v80;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, exterior polygon of venue [%{public}s] is corrupt.  %{public}d latitudes, %{public}d longitudes", v177, 0x18u);
              BOOL v142 = 0;
              goto LABEL_125;
            }
          }
          BOOL v142 = 0;
LABEL_125:
          if (++v143 == v140) {
            goto LABEL_223;
          }
        }
        if ((v61 & 0x80000000) != 0)
        {
          v127 = sub_1000BA10C();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
          {
            int v128 = *(_DWORD *)(v148 + 48);
            *(_DWORD *)v177 = 68289795;
            *(_DWORD *)&v177[4] = 0;
            *(_WORD *)&v177[8] = 2082;
            *(void *)&v177[10] = "";
            *(_WORD *)&v177[18] = 1026;
            *(_DWORD *)&v177[20] = v128;
            *(_WORD *)&v177[24] = 2082;
            *(void *)&v177[26] = "assert";
            *(_WORD *)&v177[34] = 2081;
            *(void *)&v177[36] = "exterior.longitude_size() >= 0";
            _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v177, 0x2Cu);
          }

          v129 = sub_1000BA10C();
          if (os_signpost_enabled(v129))
          {
            int v130 = *(_DWORD *)(v148 + 48);
            *(_DWORD *)v177 = 68289795;
            *(_DWORD *)&v177[4] = 0;
            *(_WORD *)&v177[8] = 2082;
            *(void *)&v177[10] = "";
            *(_WORD *)&v177[18] = 1026;
            *(_DWORD *)&v177[20] = v130;
            *(_WORD *)&v177[24] = 2082;
            *(void *)&v177[26] = "assert";
            *(_WORD *)&v177[34] = 2081;
            *(void *)&v177[36] = "exterior.longitude_size() >= 0";
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v129, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "@IndoorAvl, load, exterior longitude_size() returned a negative value?!", "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v177, 0x2Cu);
          }

          v131 = sub_1000BA10C();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
          {
            int v132 = *(_DWORD *)(v148 + 48);
            *(_DWORD *)v177 = 68289795;
            *(_DWORD *)&v177[4] = 0;
            *(_WORD *)&v177[8] = 2082;
            *(void *)&v177[10] = "";
            *(_WORD *)&v177[18] = 1026;
            *(_DWORD *)&v177[20] = v132;
            *(_WORD *)&v177[24] = 2082;
            *(void *)&v177[26] = "assert";
            *(_WORD *)&v177[34] = 2081;
            *(void *)&v177[36] = "exterior.longitude_size() >= 0";
            _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, load, exterior longitude_size() returned a negative value?!\", \"longitude_size\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v177, 0x2Cu);
          }

          abort_report_np();
LABEL_277:
          while (2)
          {
            __break(1u);
            dispatch_once(&qword_10047BEE8, &stru_1004529F0);
            v124 = (id)qword_10047BEF0;
            if (os_log_type_enabled(v124, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v177 = 68289539;
              *(_DWORD *)&v177[4] = 0;
              *(_WORD *)&v177[8] = 2082;
              *(void *)&v177[10] = "";
              *(_WORD *)&v177[18] = 2082;
              *(void *)&v177[20] = "assert";
              *(_WORD *)&v177[28] = 2081;
              *(void *)&v177[30] = "!std::isnan(vertexENU.x())";
              _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v177, 0x26u);
            }

            if (qword_10047BEE8 == -1)
            {
              v125 = (id)qword_10047BEF0;
              if (os_signpost_enabled(v125)) {
                goto LABEL_260;
              }
            }
            else
            {
              dispatch_once(&qword_10047BEE8, &stru_1004529F0);
              v125 = (id)qword_10047BEF0;
              if (os_signpost_enabled(v125))
              {
LABEL_260:
                *(_DWORD *)v177 = 68289539;
                *(_DWORD *)&v177[4] = 0;
                *(_WORD *)&v177[8] = 2082;
                *(void *)&v177[10] = "";
                *(_WORD *)&v177[18] = 2082;
                *(void *)&v177[20] = "assert";
                *(_WORD *)&v177[28] = 2081;
                *(void *)&v177[30] = "!std::isnan(vertexENU.x())";
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v125, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "vertexENU.x() must not be NaN", "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v177, 0x26u);
              }
            }

            if (qword_10047BEE8 != -1) {
              dispatch_once(&qword_10047BEE8, &stru_1004529F0);
            }
            v126 = (id)qword_10047BEF0;
            if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v177 = 68289539;
              *(_DWORD *)&v177[4] = 0;
              *(_WORD *)&v177[8] = 2082;
              *(void *)&v177[10] = "";
              *(_WORD *)&v177[18] = 2082;
              *(void *)&v177[20] = "assert";
              *(_WORD *)&v177[28] = 2081;
              *(void *)&v177[30] = "!std::isnan(vertexENU.x())";
              _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"vertexENU.x() must not be NaN\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v177, 0x26u);
            }

            abort_report_np();
            continue;
          }
        }
        if ((unint64_t)[v7 count] < v61)
        {
          id v62 = [v7 count];
          if ((id)v61 != v62)
          {
            if (v61 - (unint64_t)v62 <= 1) {
              uint64_t v63 = 1;
            }
            else {
              uint64_t v63 = v61 - (void)v62;
            }
            do
            {
              v64 = objc_alloc_init(ECEFCoordinate);
              [v7 addObject:v64];

              --v63;
            }
            while (v63);
          }
          if (qword_10047BEE8 == -1)
          {
            v65 = qword_10047BEF0;
            if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_FAULT)) {
              goto LABEL_137;
            }
          }
          else
          {
            dispatch_once(&qword_10047BEE8, &stru_1004529F0);
            v65 = qword_10047BEF0;
            if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_FAULT))
            {
LABEL_137:
              *(_DWORD *)v177 = 67109120;
              *(_DWORD *)&v177[4] = v61;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_FAULT, "@IndoorAvl, load, Needed to allocate additional ECEFCoordinates for the pool: total required %d", v177, 8u);
            }
          }
        }
        if ((int)v61 >= 1)
        {
          uint64_t v66 = 0;
          uint64_t v67 = 8 * v61;
          do
          {
            [(GeographicCoordinate *)v152 setFromLatitude:*(double *)(*(void *)(v148 + 16) + v66) longitude:*(double *)(*(void *)(v148 + 40) + v66) andAltitude:0.0];
            v68 = [v7 lastObject];
            [v7 removeLastObject];
            [v68 setFromLatLon:v152];
            [v151 addObject:v68];

            v66 += 8;
          }
          while (v67 != v66);
        }
        +[CLLocationGroup storeAverage:v141 ofVertices:v151];
        [(GeographicCoordinate *)v145 setFromECEFCoordinate:v141];
        if ([v138 count])
        {
          long long v165 = 0u;
          long long v166 = 0u;
          long long v163 = 0u;
          long long v164 = 0u;
          id v69 = v138;
          id v70 = [v69 countByEnumeratingWithState:&v163 objects:v176 count:16];
          if (v70)
          {
            uint64_t v71 = *(void *)v164;
LABEL_144:
            uint64_t v72 = 0;
            while (1)
            {
              if (*(void *)v164 != v71) {
                objc_enumerationMutation(v69);
              }
              id v73 = *(id *)(*((void *)&v163 + 1) + 8 * v72);
              +[CLAvailableVenuesStateMachine distBetweenLatLon:v145 latlon1:v73];
              double v75 = v74;
              BOOL v76 = v74 >= self->_maxLoadRadius;

              if (!v76) {
                break;
              }
              if (v70 == (id)++v72)
              {
                id v70 = [v69 countByEnumeratingWithState:&v163 objects:v176 count:16];
                if (v70) {
                  goto LABEL_144;
                }
                break;
              }
            }
          }
          else
          {
            double v75 = 1.79769313e308;
          }
        }
        else
        {
          double v75 = 0.0;
        }
        double maxLoadRadius = self->_maxLoadRadius;
        BOOL v142 = v75 > maxLoadRadius;
        if (v75 > maxLoadRadius)
        {
          v137 -= (uint64_t)[v146 count];
        }
        else
        {
          v82 = [[CLLocationGroup alloc] initWithGroupId:v134 locationIds:v146 center:v141 wifiOnlyDownloadLocIdxs:&v170 locationContext:v133 andTolerance:*(double *)(v148 + 64)];
          v156 = v82;
          v83 = [(CLLocationGroup *)v82 getVertices];
          long long v161 = 0u;
          long long v162 = 0u;
          long long v159 = 0u;
          long long v160 = 0u;
          id obj = v151;
          id v84 = [obj countByEnumeratingWithState:&v159 objects:v175 count:16];
          id v85 = v84;
          if (v84)
          {
            uint64_t v155 = *(void *)v160;
            do
            {
              v86 = 0;
              do
              {
                if (*(void *)v160 != v155) {
                  objc_enumerationMutation(obj);
                }
                v87 = *(void **)(*((void *)&v159 + 1) + 8 * (void)v86);
                v88 = *v83;
                v89 = [(CLLocationGroup *)v82 centerLatLon];
                v90 = [(CLLocationGroup *)v82 centerECEF];
                [v87 toBoostEnuWithLatLonOrigin:v89 andEcefOrigin:v90 usingENU:v158];
                uint64_t v93 = v91;
                uint64_t v94 = v92;
                v96 = (void *)v88[1];
                unint64_t v95 = v88[2];
                if ((unint64_t)v96 < v95)
                {
                  void *v96 = v91;
                  v96[1] = v92;
                  v97 = v96 + 2;
                  id v7 = v157;
                  goto LABEL_182;
                }
                v98 = (void *)*v88;
                uint64_t v99 = ((uint64_t)v96 - *v88) >> 4;
                unint64_t v100 = v99 + 1;
                if ((unint64_t)(v99 + 1) >> 60) {
                  sub_1000A9108();
                }
                uint64_t v101 = v95 - (void)v98;
                if (v101 >> 3 > v100) {
                  unint64_t v100 = v101 >> 3;
                }
                if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v102 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v102 = v100;
                }
                if (v102)
                {
                  if (v102 >> 60) {
                    sub_1000A6A10();
                  }
                  v103 = (char *)operator new(16 * v102);
                  v104 = &v103[16 * v99];
                  *(void *)v104 = v93;
                  *((void *)v104 + 1) = v94;
                  uint64_t v105 = (uint64_t)v104;
                  if (v96 == v98)
                  {
LABEL_185:
                    id v7 = v157;
                    v97 = v104 + 16;
                    void *v88 = v105;
                    v88[1] = v104 + 16;
                    v88[2] = &v103[16 * v102];
                    if (v96) {
                      goto LABEL_181;
                    }
                    goto LABEL_182;
                  }
                }
                else
                {
                  v103 = 0;
                  v104 = (char *)(16 * v99);
                  *(void *)v104 = v91;
                  *((void *)v104 + 1) = v92;
                  uint64_t v105 = 16 * v99;
                  if (v96 == v98) {
                    goto LABEL_185;
                  }
                }
                id v7 = v157;
                do
                {
                  *(_OWORD *)(v105 - 16) = *((_OWORD *)v96 - 1);
                  v105 -= 16;
                  v96 -= 2;
                }
                while (v96 != v98);
                v96 = (void *)*v88;
                v97 = v104 + 16;
                void *v88 = v105;
                v88[1] = v104 + 16;
                v88[2] = &v103[16 * v102];
                if (v96) {
LABEL_181:
                }
                  operator delete(v96);
LABEL_182:
                v88[1] = v97;

                v82 = v156;
                v86 = (char *)v86 + 1;
              }
              while (v86 != v85);
              id v106 = [obj countByEnumeratingWithState:&v159 objects:v175 count:16];
              id v85 = v106;
            }
            while (v106);
          }

          if (*(_DWORD *)(v148 + 48) != ((char *)(*v83)[1] - (char *)**v83) >> 4)
          {
            sub_1003A3178((NSObject **)v177);

            abort_report_np();
            goto LABEL_277;
          }
          sub_10006C958(*v83);
          [v136 addObject:v156];

          ++v135;
        }
        [v7 addObjectsFromArray:v151];
        [v151 removeAllObjects];
        goto LABEL_125;
      }
LABEL_223:
      int v15 = 0;
      id v43 = (id)v134;
LABEL_212:
      sub_10006A9DC((uint64_t)&v167, v168);
      sub_10006A9DC((uint64_t)&v170, v171);

      if (v174 < 0) {
        goto LABEL_213;
      }
LABEL_214:
      sub_1000678CC(buf);
      if (v15 != 11 && v15)
      {
        id v122 = 0;
        v123 = v136;
        goto LABEL_253;
      }
      if (++v150 == v144) {
        goto LABEL_236;
      }
    }
  }
  uint64_t v135 = 0;
  uint64_t v137 = 0;
LABEL_236:
  if ([v149 tileIsOpenForIncrementalIO])
  {
    sub_1000678D0((uint64_t)buf);
    if (qword_10047BEE8 != -1) {
      dispatch_once(&qword_10047BEE8, &stru_1004529F0);
    }
    v118 = (id)qword_10047BEF0;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v177 = 0;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_INFO, "@IndoorAvl, load, make sure we have no more venue bounds to read", v177, 2u);
    }

    if ([v149 getNextVenueBoundsIncrementally:buf])
    {
      if (qword_10047BEE8 != -1) {
        dispatch_once(&qword_10047BEE8, &stru_1004529F0);
      }
      v119 = (id)qword_10047BEF0;
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v177 = 0;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "@IndoorAvl, load, had venues left over after iterating over all venues in tile. why?", v177, 2u);
      }
    }
    sub_1000678CC(buf);
  }
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
  }
  v120 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v179 = v137;
    __int16 v180 = 2048;
    *(void *)v181 = v135;
    _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEBUG, "Found %zu floors across %zu venues", buf, 0x16u);
  }

  v123 = v136;
  id v122 = v136;
LABEL_253:

  return v122;
}

- (BOOL)isVenueDisabled:(id)a3 locationId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  disabledVenues = self->_disabledVenues;
  if (disabledVenues)
  {
    id v9 = [(NSSet *)disabledVenues member:v6];
    if (v9)
    {
      BOOL v10 = 1;
    }
    else
    {
      signed int v11 = [(NSSet *)self->_disabledVenues member:v7];
      BOOL v10 = v11 != 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (double)distBetweenLatLon:(id)a3 latlon1:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    v25 = sub_1000BA10C();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v31 = 0;
      __int16 v32 = 2082;
      uint64_t v33 = "";
      __int16 v34 = 2082;
      v35 = "assert";
      __int16 v36 = 2081;
      uint64_t v37 = "latlon0 != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v26 = sub_1000BA10C();
    if (os_signpost_enabled(v26))
    {
      *(_DWORD *)buf = 68289539;
      int v31 = 0;
      __int16 v32 = 2082;
      uint64_t v33 = "";
      __int16 v34 = 2082;
      v35 = "assert";
      __int16 v36 = 2081;
      uint64_t v37 = "latlon0 != nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "distBetweenLatLon: first coordinate must be valid!", "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    BOOL v27 = sub_1000BA10C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v31 = 0;
      __int16 v32 = 2082;
      uint64_t v33 = "";
      __int16 v34 = 2082;
      v35 = "assert";
      __int16 v36 = 2081;
      uint64_t v37 = "latlon0 != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"distBetweenLatLon: first coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
LABEL_17:

    abort_report_np();
    __break(1u);
  }
  if (!v6)
  {
    uint64_t v28 = sub_1000BA10C();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v31 = 0;
      __int16 v32 = 2082;
      uint64_t v33 = "";
      __int16 v34 = 2082;
      v35 = "assert";
      __int16 v36 = 2081;
      uint64_t v37 = "latlon1 != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    v29 = sub_1000BA10C();
    if (os_signpost_enabled(v29))
    {
      *(_DWORD *)buf = 68289539;
      int v31 = 0;
      __int16 v32 = 2082;
      uint64_t v33 = "";
      __int16 v34 = 2082;
      v35 = "assert";
      __int16 v36 = 2081;
      uint64_t v37 = "latlon1 != nullptr";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "distBetweenLatLon: second coordinate must be valid!", "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }

    BOOL v27 = sub_1000BA10C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v31 = 0;
      __int16 v32 = 2082;
      uint64_t v33 = "";
      __int16 v34 = 2082;
      v35 = "assert";
      __int16 v36 = 2081;
      uint64_t v37 = "latlon1 != nullptr";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"distBetweenLatLon: second coordinate must be valid!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_17;
  }
  [v5 latitude];
  +[CLAvailableVenuesStateMachine deg2rad:](CLAvailableVenuesStateMachine, "deg2rad:");
  long double v9 = v8;
  [v5 longitude];
  +[CLAvailableVenuesStateMachine deg2rad:](CLAvailableVenuesStateMachine, "deg2rad:");
  double v11 = v10;
  [v7 latitude];
  +[CLAvailableVenuesStateMachine deg2rad:](CLAvailableVenuesStateMachine, "deg2rad:");
  long double v13 = v12;
  [v7 longitude];
  +[CLAvailableVenuesStateMachine deg2rad:](CLAvailableVenuesStateMachine, "deg2rad:");
  long double v15 = sin((v11 - v14) * 0.5);
  long double v16 = v15 * v15;
  long double v17 = sin((v9 - v13) * 0.5);
  long double v18 = v17 * v17;
  double v19 = cos(v9);
  long double v20 = cos(v13);
  long double v21 = asin(sqrt(v18 + v19 * v20 * v16));
  +[CLAvailableVenuesStateMachine metersFromGreatCircleDistance:(double)(v21 + v21)];
  double v23 = v22;

  return v23;
}

+ (double)deg2rad:(double)a3
{
  return a3 * 3.14159265 / 180.0;
}

+ (double)metersFromGreatCircleDistance:(double)a3
{
  return a3 * 180.0 / 3.14159265 * 60.0 * 1852.0;
}

+ (int64_t)getLocationContextFromVenueBounds:(const void *)a3
{
  if ((*((unsigned char *)a3 + 104) & 8) != 0) {
    return *((_DWORD *)a3 + 24) != 1;
  }
  uint64_t v3 = *((int *)a3 + 6);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *((void *)a3 + 2);
  uint64_t v5 = 8 * v3;
  while (1)
  {
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    if (([v6 hasPrefix:@"G"] & 1) == 0) {
      break;
    }

    v4 += 8;
    v5 -= 8;
    if (!v5) {
      return 0;
    }
  }
  unsigned int v8 = [v6 hasPrefix:@"LR"];

  return v8;
}

- (void)setDisabledVenues:(id)a3
{
}

- (void)clearLastFix
{
  lastFix = self->_lastFix;
  self->_lastFix = 0;
}

- (id)openTileParserAtPath:(id)a3
{
  id v3 = a3;
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
  }
  uint64_t v4 = (id)qword_10047BEF0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 absoluteString];
    int v16 = 136315138;
    id v17 = [v5 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Request to get nearby location groups from availability tile at %s", (uint8_t *)&v16, 0xCu);
  }
  id v6 = +[NSFileManager defaultManager];
  id v7 = [v3 path];
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7];

  if ((v8 & 1) == 0)
  {
    if (qword_10047BEE8 == -1)
    {
      p_super = (id)qword_10047BEF0;
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
LABEL_11:
        double v11 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEE8, &stru_1004529F0);
      p_super = (id)qword_10047BEF0;
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
    }
    id v12 = [v3 path];
    id v13 = [v12 UTF8String];
    int v16 = 136315138;
    id v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "#warning, cannot find file %s on-disk", (uint8_t *)&v16, 0xCu);

    goto LABEL_11;
  }
  long double v9 = [[CLAvailabilityTileParser alloc] initWithTilePathIncrementalIO:v3];
  p_super = &v9->super;
  if (v9)
  {
    p_super = v9;
    double v11 = p_super;
    goto LABEL_16;
  }
  if (qword_10047BEE8 != -1)
  {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
    double v14 = qword_10047BEF0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  double v14 = qword_10047BEF0;
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_DEFAULT))
  {
LABEL_14:
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Warning Couldn't load availability tile - ignoring request for nearby locations", (uint8_t *)&v16, 2u);
  }
LABEL_15:
  double v11 = 0;
LABEL_16:

  return v11;
}

- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4
{
  uint64_t v4 = [(CLAvailableVenuesStateMachine *)self getNearbyLocationGroups:a3 withUpdatedPos:a4 nearLocationsOfInterest:0];

  return v4;
}

- (id)getNearbyLocationGroups:(id)a3 withUpdatedPos:(id)a4 nearLocationsOfInterest:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [(CLAvailableVenuesStateMachine *)self openTileParserAtPath:a3];
  if (v10)
  {
    double v11 = [(CLAvailableVenuesStateMachine *)self getNearbyLocationGroupsForTile:v10 withUpdatedPos:v8 nearLocationsOfInterest:v9];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (GeographicCoordinate)lastFix
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 8, 1);
}

- (double)maxLoadRadius
{
  return self->_maxLoadRadius;
}

- (void)setMaxLoadRadius:(double)a3
{
  self->_double maxLoadRadius = a3;
}

- (NSSet)disabledVenues
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (CLIndoorAvailabilityTileParams)availabilityTileParams
{
  return (CLIndoorAvailabilityTileParams *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityTileParams, 0);
  objc_storeStrong((id *)&self->_disabledVenues, 0);

  objc_storeStrong((id *)&self->_lastFix, 0);
}

@end