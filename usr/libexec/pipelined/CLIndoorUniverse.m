@interface CLIndoorUniverse
- (BOOL)debouceUpdateUniverse:(duration<long)long fromLocation:()std:(1000000000>>)a3 :(id *)a4 ratio<1;
- (BOOL)isAllowedToUpdateUniverse:(id *)a3;
- (BOOL)updateLocalizerUniverseIfAllowed:(duration<long)long fromLocation:()std:(1000000000>>)a3 :(id *)a4 ratio<1 withUniverseUpdatedHandler:(id)a5;
- (CLIndoorUniverse)initWithAvailableVenues:(id)a3 availabilityZScoreConfidenceInterval:(double)a4 dynamicUniverseParameters:(const void *)a5;
- (id).cxx_construct;
- (id)stripLocatationGroupIdsPrefix:(id)a3;
- (void)mutableAvailabilityData;
- (void)mutableUniverseState;
- (void)updateLocalizerUniverse:(duration<long)long fromLocation:()std:(1000000000>>)a3 :(id *)a4 ratio<1 withUniverseUpdatedHandler:(id)a5;
@end

@implementation CLIndoorUniverse

- (CLIndoorUniverse)initWithAvailableVenues:(id)a3 availabilityZScoreConfidenceInterval:(double)a4 dynamicUniverseParameters:(const void *)a5
{
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLIndoorUniverse;
  v10 = [(CLIndoorUniverse *)&v19 init];
  v11 = v10;
  if (v10)
  {
    *(double *)[(CLIndoorUniverse *)v10 mutableAvailabilityData] = a4;
    objc_storeStrong((id *)[(CLIndoorUniverse *)v11 mutableAvailabilityData] + 1, a3);
    if ((*((unsigned char *)a5 + 56) & 4) == 0)
    {
      sub_1000AE4B0(v21, "");
      sub_10036383C("Debounce interval must be set in the dynamicUniverseParameters", &__p);
      sub_10016A2C4((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v22 < 0) {
        operator delete(v21[0]);
      }
      sub_1000D11E0((uint64_t)v20);
    }
    double v12 = *((double *)a5 + 4);
    *((void *)[(CLIndoorUniverse *)v11 mutableAvailabilityData] + 2) = (uint64_t)(v12 * 1000000000.0);
    if ((*((unsigned char *)a5 + 56) & 2) == 0)
    {
      sub_1000AE4B0(v21, "");
      sub_10036383C("Debounce distance must be set in the dynamicUniverseParameters", &__p);
      sub_10016A2C4((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v22 < 0) {
        operator delete(v21[0]);
      }
      sub_1000D11E0((uint64_t)v20);
    }
    uint64_t v13 = *((void *)a5 + 3);
    *((void *)[(CLIndoorUniverse *)v11 mutableAvailabilityData] + 3) = v13;
    if ((*((unsigned char *)a5 + 56) & 1) == 0)
    {
      sub_1000AE4B0(v21, "");
      sub_1002803AC("Venue group distance must be set in the dynamicUniverseParameters", &__p);
      sub_10016A2C4((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v22 < 0) {
        operator delete(v21[0]);
      }
      sub_1000D11E0((uint64_t)v20);
    }
    uint64_t v14 = *((void *)a5 + 2);
    *((void *)[(CLIndoorUniverse *)v11 mutableAvailabilityData] + 4) = v14;
    if ((*((unsigned char *)a5 + 56) & 8) == 0)
    {
      sub_1000AE4B0(v21, "");
      sub_10036383C("Update radius cap must be set in the dynamicUniverseParameters", &__p);
      sub_10016A2C4((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v22 < 0) {
        operator delete(v21[0]);
      }
      sub_1000D11E0((uint64_t)v20);
    }
    uint64_t v15 = *((void *)a5 + 5);
    *((void *)[(CLIndoorUniverse *)v11 mutableAvailabilityData] + 5) = v15;
    if ((*((unsigned char *)a5 + 56) & 0x10) == 0)
    {
      sub_1000AE4B0(v21, "");
      sub_100267DC4("Disable dynamic universe must be set in the dynamicUniverseParameters", &__p);
      sub_10016A2C4((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v22 < 0) {
        operator delete(v21[0]);
      }
      sub_1000D11E0((uint64_t)v20);
    }
    char v16 = *((unsigned char *)a5 + 48);
    *((unsigned char *)[(CLIndoorUniverse *)v11 mutableAvailabilityData] + 48) = v16;
    v11->_indoorUniverseFirstDidChange = 1;
    v17 = v11;
  }

  return v11;
}

- (void)mutableAvailabilityData
{
  if (!self->_availabilityData.m_initialized)
  {
    self->_anon_c9[47] = 0;
    *(_OWORD *)&self->_anon_c9[31] = 0u;
    *(_OWORD *)&self->_anon_c9[15] = 0u;
    *(_OWORD *)((char *)&self->_availabilityData.m_storage.dummy_.aligner_ + 7) = 0u;
    self->_availabilityData.m_initialized = 1;
  }
  return (char *)&self->_availabilityData.m_storage.dummy_.aligner_ + 7;
}

- (id)stripLocatationGroupIdsPrefix:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v14 + 1) + 8 * (void)v8);
        if ((objc_msgSend(v9, "hasPrefix:", @"G", (void)v14) & 1) == 0)
        {
          sub_1000AE4B0(v19, "");
          sub_100267DC4("LocationGroupIds must be prefixed with \"G\" prior to stripping prefix.", &v22);
          sub_10016A2C4((uint64_t)v19, (uint64_t)&v22, 1);
          if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v22.__r_.__value_.__l.__data_);
            if (v20 < 0) {
              goto LABEL_13;
            }
          }
          else
          {
            if ((v20 & 0x80000000) == 0) {
              goto LABEL_11;
            }
LABEL_13:
            operator delete(v19[0]);
          }
LABEL_11:
          sub_1000D11E0((uint64_t)&__p);
        }
        v10 = [v9 substringFromIndex:1];
        [v4 addObject:v10];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v11 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
      id v6 = v11;
    }
    while (v11);
  }

  double v12 = +[NSSet setWithArray:v4];

  return v12;
}

- (BOOL)updateLocalizerUniverseIfAllowed:(duration<long)long fromLocation:()std:(1000000000>>)a3 :(id *)a4 ratio<1 withUniverseUpdatedHandler:(id)a5
{
  id v8 = a5;
  if (!self->_availabilityData.m_initialized)
  {
    sub_1000AE4B0(v18, "");
    sub_10025351C("AvailabilityTile is not loaded.", &v20);
    sub_10016A2C4((uint64_t)v18, (uint64_t)&v20, 1);
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20.__r_.__value_.__l.__data_);
    }
    if (v19 < 0) {
      operator delete(v18[0]);
    }
    sub_1000D11E0((uint64_t)&v17);
  }
  if (self->_anon_c9[47]) {
    goto LABEL_6;
  }
  if (![(CLIndoorUniverse *)self isAllowedToUpdateUniverse:a4]) {
    goto LABEL_6;
  }
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a4->var13;
  v15[6] = *(_OWORD *)&a4->var11;
  v15[7] = var13;
  v16[0] = *(_OWORD *)&a4->var14;
  *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)&a4->var16;
  long long v10 = *(_OWORD *)&a4->var5;
  v15[2] = *(_OWORD *)&a4->var3;
  v15[3] = v10;
  long long v11 = *(_OWORD *)&a4->var9;
  v15[4] = *(_OWORD *)&a4->var7;
  v15[5] = v11;
  long long v12 = *(_OWORD *)&a4->var1.var1;
  v15[0] = *(_OWORD *)&a4->var0;
  v15[1] = v12;
  if ([(CLIndoorUniverse *)self debouceUpdateUniverse:a3.__rep_ fromLocation:v15])
  {
    [(CLIndoorUniverse *)self updateLocalizerUniverse:a3.__rep_ fromLocation:a4 withUniverseUpdatedHandler:v8];
    BOOL v13 = 1;
  }
  else
  {
LABEL_6:
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isAllowedToUpdateUniverse:(id *)a3
{
  double v3 = *(double *)((char *)&a3->var1.var1 + 4);
  double v4 = *(double *)&self->_anon_c9[39];
  if (v3 > v4)
  {
    if (qword_10047BEF8 != -1)
    {
      dispatch_once(&qword_10047BEF8, &stru_10046AF58);
      uint64_t v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        return v3 <= v4;
      }
      goto LABEL_4;
    }
    uint64_t v7 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
    {
LABEL_4:
      uint64_t v8 = *(void *)((char *)&a3->var1.var1 + 4);
      uint64_t v9 = *(void *)&self->_anon_c9[39];
      int v11 = 134349312;
      uint64_t v12 = v8;
      __int16 v13 = 2050;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[CLIndoorUniverse] Location accuracy %{public}.02f [m] not enough to update universe (> %{public}.02f [m]", (uint8_t *)&v11, 0x16u);
    }
  }
  return v3 <= v4;
}

- (BOOL)debouceUpdateUniverse:(duration<long)long fromLocation:()std:(1000000000>>)a3 :(id *)a4 ratio<1
{
  if (!self->_localizerUniverseState.m_initialized) {
    goto LABEL_8;
  }
  int64_t v5 = a3.__rep_ - *(void *)&self->_anon_11[7];
  if (v5 >= *(void *)&self->_anon_c9[15])
  {
    *(_OWORD *)&buf[8] = 0uLL;
    *(void *)buf = off_10045DAB8;
    char v21 = 0;
    sub_100076484((uint64_t)buf, *(double *)(&a4->var0 + 1));
    sub_10007647C((uint64_t)buf, *(double *)((char *)&a4->var1.var0 + 4));
    v14[1] = 0;
    v14[2] = 0;
    v14[0] = off_10045DAB8;
    char v15 = 0;
    sub_100076484((uint64_t)v14, *(double *)&self->_anon_11[19]);
    sub_10007647C((uint64_t)v14, *(double *)&self->_anon_11[27]);
    double v10 = sub_10014B1B4((uint64_t)buf, (uint64_t)v14);
    double v11 = *(double *)&self->_anon_c9[23]
        - *(double *)((char *)&a4->var1.var1 + 4)
        * *(double *)((char *)&self->_availabilityData.m_storage.dummy_.aligner_ + 7);
    if (v10 >= v11)
    {
      nullsub_15(v14);
      nullsub_15(buf);
LABEL_8:
      LOBYTE(v7) = 1;
      return v7;
    }
    if (qword_10047BEF8 == -1)
    {
      uint64_t v12 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
      {
LABEL_12:
        nullsub_15(v14);
        nullsub_15(buf);
        goto LABEL_13;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046AF58);
      uint64_t v12 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_12;
      }
    }
    *(_DWORD *)long long v16 = 134283777;
    double v17 = v10;
    __int16 v18 = 2049;
    double v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[CLIndoorUniverse] not enough distance %{private}.02f m moved since universe was set (waiting for at least: %{private}.02f m", v16, 0x16u);
    goto LABEL_12;
  }
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046AF58);
    id v6 = qword_10047BF00;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG);
    if (!v7) {
      return v7;
    }
    goto LABEL_5;
  }
  id v6 = qword_10047BF00;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
LABEL_5:
    uint64_t v8 = *(void *)&self->_anon_c9[15] / 1000000000;
    *(_DWORD *)buf = 134349312;
    *(void *)&buf[4] = v5 / 1000000000;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CLIndoorUniverse] not enough time %{public}lld sec since universe was set (waiting until: %{public}lld sec)", buf, 0x16u);
LABEL_13:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)updateLocalizerUniverse:(duration<long)long fromLocation:()std:(1000000000>>)a3 :(id *)a4 ratio<1 withUniverseUpdatedHandler:(id)a5
{
  uint64_t v8 = (void (**)(id, void *, uint64_t, BOOL))a5;
  v35[0] = 0;
  id v36 = 0;
  char v37 = 0;
  uint64_t v9 = sub_10009D0B4();
  sub_1000776C8((uint64_t)v9);
  int v10 = (int)v39[0];
  sub_100077BC8((uint64_t)v39);
  if (v10 != v10 >> 31)
  {
    double v11 = sub_10009D0B4();
    sub_1000776C8((uint64_t)v11);
    int v12 = (int)v39[0];
    sub_100077BC8((uint64_t)v39);
    if (v12 != v12 >> 31)
    {
      sub_1000AE4B0(buf, "");
      sub_10036F3E8("Override of DYNAMIC_UNIVERSE_FORCED_VENUES is not supported.", (std::string *)v39);
      sub_10016A2C4((uint64_t)buf, (uint64_t)v39, 1);
      if (SBYTE7(v40) < 0)
      {
        operator delete(v39[0]);
        if ((v72 & 0x80000000) == 0) {
          goto LABEL_5;
        }
      }
      else if ((v72 & 0x80000000) == 0)
      {
        goto LABEL_5;
      }
      operator delete(*(void **)buf);
LABEL_5:
      sub_1000D11E0((uint64_t)__p);
    }
  }
  __int16 v13 = sub_10009D0C4();
  sub_1000776C8((uint64_t)v13);
  int v14 = (int)v39[0];
  sub_100077BC8((uint64_t)v39);
  if (v14 != v14 >> 31)
  {
    char v15 = sub_10009D0C4();
    sub_1000776C8((uint64_t)v15);
    int v16 = (int)v39[0];
    sub_100077BC8((uint64_t)v39);
    if (v16 != v16 >> 31)
    {
      sub_1000AE4B0(buf, "");
      sub_10036F3E8("Override of DYNAMIC_UNIVERSE_FAKE_LAST_FIX is not supported.", (std::string *)v39);
      sub_10016A2C4((uint64_t)buf, (uint64_t)v39, 1);
      if (SBYTE7(v40) < 0)
      {
        operator delete(v39[0]);
        if ((v72 & 0x80000000) == 0) {
          goto LABEL_10;
        }
      }
      else if ((v72 & 0x80000000) == 0)
      {
        goto LABEL_10;
      }
      operator delete(*(void **)buf);
LABEL_10:
      sub_1000D11E0((uint64_t)__p);
    }
  }
  v35[1] = *(id *)&self->_anon_c9[31];
  char v37 = 1;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  *(_OWORD *)v39 = 0u;
  +[CLClientTypesPrivate defaultCLClientLocationPrivate];
  double v17 = [[CLGpsPosition alloc] initWithLocation:a4 andPrivateLocation:v39];
  if (![*(id *)&self->_anon_c9[7] count])
  {
    if (qword_10047BEF8 == -1)
    {
      __int16 v18 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    dispatch_once(&qword_10047BEF8, &stru_10046AF58);
    __int16 v18 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "zero _availabilityData->availableVenues when computed nearestVenues.", buf, 2u);
    }
  }
LABEL_15:
  double v19 = +[CLIndoorCommonHooks nearestVenues:std::chrono::steady_clock::now().__d_.__rep_ availableVenues:*(void *)&self->_anon_c9[7] latestPosition:v17 availabilityZScoreConfidenceInterval:v35 settings:1 isAllowedMultipleVenues:*(double *)((char *)&self->_availabilityData.m_storage.dummy_.aligner_ + 7)];
  std::string v20 = [(CLIndoorUniverse *)self stripLocatationGroupIdsPrefix:v19];

  if (![v20 count])
  {
    if (qword_10047BEF8 != -1)
    {
      dispatch_once(&qword_10047BEF8, &stru_10046AF58);
      char v21 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    char v21 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "zero selectedLocationGroups returned in nearestVenues.", buf, 2u);
    }
  }
LABEL_19:
  *((duration<long long, std::ratio<1, 1000000000>> *)[(CLIndoorUniverse *)self mutableUniverseState]+ 1) = a3;
  std::string v22 = [(CLIndoorUniverse *)self mutableUniverseState];
  long long v23 = *(_OWORD *)&a4->var1.var1;
  v22[1] = *(_OWORD *)&a4->var0;
  v22[2] = v23;
  long long v24 = *(_OWORD *)&a4->var3;
  long long v25 = *(_OWORD *)&a4->var5;
  long long v26 = *(_OWORD *)&a4->var9;
  v22[5] = *(_OWORD *)&a4->var7;
  v22[6] = v26;
  v22[3] = v24;
  v22[4] = v25;
  long long v27 = *(_OWORD *)&a4->var11;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a4->var13;
  long long v29 = *(_OWORD *)&a4->var14;
  *(_OWORD *)((char *)v22 + 156) = *(_OWORD *)&a4->var16;
  v22[8] = var13;
  v22[9] = v29;
  v22[7] = v27;
  if (!*(void *)((char *)&self->_localizerUniverseState.m_storage.dummy_.aligner_ + 7)
    || (objc_msgSend(v20, "isSubsetOfSet:") & 1) == 0)
  {
    if (qword_10047BEF8 == -1)
    {
      v31 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
LABEL_25:

        objc_storeStrong((id *)[(CLIndoorUniverse *)self mutableUniverseState], v20);
        uint64_t v30 = 1;
        goto LABEL_26;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046AF58);
      v31 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
    }
    v32 = [v20 allObjects];
    id v33 = [v32 componentsJoinedByString:@", "];
    id v34 = [v33 UTF8String];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v34;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "updateUniverse setting _universeState.locationGroupIds: %s", buf, 0xCu);

    goto LABEL_25;
  }
  uint64_t v30 = 0;
LABEL_26:
  v8[2](v8, [(CLIndoorUniverse *)self mutableUniverseState], v30, self->_indoorUniverseFirstDidChange);
  if (v30 && self->_indoorUniverseFirstDidChange) {
    self->_indoorUniverseFirstDidChange = 0;
  }
}

- (void)mutableUniverseState
{
  if (!self->_localizerUniverseState.m_initialized)
  {
    *(_OWORD *)&self->_anon_11[155] = 0u;
    *(_OWORD *)&self->_anon_11[127] = 0u;
    *(_OWORD *)&self->_anon_11[143] = 0u;
    *(_OWORD *)&self->_anon_11[95] = 0u;
    *(_OWORD *)&self->_anon_11[111] = 0u;
    *(_OWORD *)&self->_anon_11[63] = 0u;
    *(_OWORD *)&self->_anon_11[79] = 0u;
    *(_OWORD *)&self->_anon_11[31] = 0u;
    *(_OWORD *)&self->_anon_11[47] = 0u;
    *(_OWORD *)((char *)&self->_localizerUniverseState.m_storage.dummy_.aligner_ + 7) = 0u;
    *(_OWORD *)&self->_anon_11[15] = 0u;
    self->_localizerUniverseState.m_initialized = 1;
  }
  return (char *)&self->_localizerUniverseState.m_storage.dummy_.aligner_ + 7;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 192) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (self->_availabilityData.m_initialized)
  {

    self->_availabilityData.m_initialized = 0;
  }
  if (self->_localizerUniverseState.m_initialized)
  {

    self->_localizerUniverseState.m_initialized = 0;
  }
}

@end