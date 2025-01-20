@interface CMPedometerTable
+ (id)convertToCMPedometerBins:(id)a3;
+ (id)convertToCMStrideCalibrationData:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForValueIn:(double)a3;
- (BOOL)isBin:(unint64_t)a3 sameActivityAsBin:(unint64_t)a4;
- (BOOL)isNativeValueOutAvailableInBinsFromIndex:(unint64_t)a3 withLength:(unint64_t)a4;
- (BOOL)isRunNativeValueOutAvailable;
- (BOOL)isValueInRun:(double)a3;
- (BOOL)isValueInValid:(double)a3;
- (BOOL)isWalkNativeValueOutAvailable;
- (BOOL)testMode;
- (CMPedometerTable)initWithTableName:(id)a3 valueInName:(id)a4 valueOutName:(id)a5 defaultValue:(double)a6 binBoundariesWalk:()vector<double binBoundariesRun:(std:()vector<double :(std:(BOOL)a9 :allocator<double>> *)a8 allocator<double>> *)a7 testMode:;
- (double)valueOutForValueIn:(double)a3;
- (id).cxx_construct;
- (id)binArrayToArchivedData:(id)a3;
- (id)copyBins;
- (id)defaultBins;
- (id)description;
- (unint64_t)binIndexForValueIn:(double)a3;
- (unint64_t)walkBinCount;
- (void)dealloc;
- (void)setBins:(id)a3;
- (void)updateAdjacentBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5 nativeBin:(unint64_t)a6;
- (void)updateBinsWithValueOut:(double)a3 valueIn:(double)a4 alpha:(double)a5;
- (void)updateNativeBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5;
@end

@implementation CMPedometerTable

- (id)copyBins
{
  objc_sync_enter(self);
  id v3 = [objc_alloc((Class)NSArray) initWithArray:self->_bins];
  objc_sync_exit(self);
  return v3;
}

- (BOOL)isNativeValueOutAvailableInBinsFromIndex:(unint64_t)a3 withLength:(unint64_t)a4
{
  id v6 = [(CMPedometerTable *)self copyBins];
  if ([v6 count]
    && (long long v16 = 0u,
        long long v17 = 0u,
        long long v14 = 0u,
        long long v15 = 0u,
        id v7 = objc_msgSend(v6, "subarrayWithRange:", a3, a4, 0),
        (id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16]) != 0))
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if ((uint64_t)[*(id *)(*((void *)&v14 + 1) + 8 * i) state] > 1)
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_13:

  return v12;
}

- (BOOL)isWalkNativeValueOutAvailable
{
  unint64_t v3 = [(CMPedometerTable *)self binIndexForValueIn:*self->_binBoundariesWalk.__begin_];
  int64_t v4 = self->_binBoundariesWalk.__end_ - self->_binBoundariesWalk.__begin_;

  return [(CMPedometerTable *)self isNativeValueOutAvailableInBinsFromIndex:v3 withLength:v4];
}

- (BOOL)isValueInRun:(double)a3
{
  return *(self->_binBoundariesWalk.__end_ - 1) < a3;
}

- (unint64_t)binIndexForValueIn:(double)a3
{
  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:")
    && (unint64_t result = [(CMPedometerTable *)self walkBinCount]) != 0)
  {
    uint64_t v6 = 64;
  }
  else
  {
    unint64_t result = 0;
    uint64_t v6 = 40;
  }
  id v8 = (char *)self + v6;
  id v7 = *(double **)((char *)&self->super.isa + v6);
  uint64_t v9 = *((void *)v8 + 1) - (void)v7;
  if (!v9) {
    return self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 2;
  }
  unint64_t v10 = v9 >> 3;
  if (v10 <= 1) {
    unint64_t v10 = 1;
  }
  while (*v7 < a3)
  {
    ++result;
    ++v7;
    if (!--v10) {
      return self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 2;
    }
  }
  return result;
}

- (CMPedometerTable)initWithTableName:(id)a3 valueInName:(id)a4 valueOutName:(id)a5 defaultValue:(double)a6 binBoundariesWalk:()vector<double binBoundariesRun:(std:()vector<double :(std:(BOOL)a9 :allocator<double>> *)a8 allocator<double>> *)a7 testMode:
{
  BOOL v9 = a9;
  v42.receiver = self;
  v42.super_class = (Class)CMPedometerTable;
  long long v16 = [(CMPedometerTable *)&v42 init];
  if (!v16) {
    return (CMPedometerTable *)v16;
  }
  *((void *)v16 + 1) = a3;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((double *)v16 + 4) = a6;
  if (v16 + 40 != (char *)a7) {
    sub_1002DD194(v16 + 40, (char *)a7->__begin_, (uint64_t)a7->__end_, a7->__end_ - a7->__begin_);
  }
  if (v16 + 64 != (char *)a8) {
    sub_1002DD194(v16 + 64, (char *)a8->__begin_, (uint64_t)a8->__end_, a8->__end_ - a8->__begin_);
  }
  long long v17 = (void **)(v16 + 88);
  sub_10017C3FC((void **)v16 + 11, a7->__end_ - a7->__begin_ + a8->__end_ - a8->__begin_ + 1);
  unint64_t v18 = *((void *)v16 + 13);
  v19 = (char *)*((void *)v16 + 12);
  if ((unint64_t)v19 >= v18)
  {
    v21 = (char *)*v17;
    uint64_t v22 = (v19 - (unsigned char *)*v17) >> 3;
    unint64_t v23 = v22 + 1;
    if ((unint64_t)(v22 + 1) >> 61) {
      sub_1001D7FD4();
    }
    uint64_t v24 = v18 - (void)v21;
    if (v24 >> 2 > v23) {
      unint64_t v23 = v24 >> 2;
    }
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v25 = v23;
    }
    if (v25)
    {
      v26 = (char *)sub_1000DA54C((uint64_t)(v16 + 104), v25);
      v21 = (char *)*((void *)v16 + 11);
      v19 = (char *)*((void *)v16 + 12);
    }
    else
    {
      v26 = 0;
    }
    v27 = &v26[8 * v22];
    v28 = &v26[8 * v25];
    *(void *)v27 = 0;
    v20 = v27 + 8;
    while (v19 != v21)
    {
      uint64_t v29 = *((void *)v19 - 1);
      v19 -= 8;
      *((void *)v27 - 1) = v29;
      v27 -= 8;
    }
    *((void *)v16 + 11) = v27;
    *((void *)v16 + 12) = v20;
    *((void *)v16 + 13) = v28;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    *(void *)v19 = 0;
    v20 = v19 + 8;
  }
  *((void *)v16 + 12) = v20;
  sub_100C86308(a7->__begin_, a7->__end_, (uint64_t)(v16 + 88));
  sub_100C86308(a8->__begin_, a8->__end_, (uint64_t)(v16 + 88));
  v16[112] = v9;
  if (v9)
  {
    id v30 = [v16 defaultBins];
  }
  else
  {
    uint64_t v31 = sub_1000A6958();
    *((void *)v16 + 15) = v31;
    *(void *)buf = 0;
    id v32 = 0;
    if (sub_1004D01D8(v31, *((void *)v16 + 1), (CFTypeRef *)buf)) {
      uint64_t v33 = *(void *)buf;
    }
    else {
      uint64_t v33 = 0;
    }
    if (!v33)
    {
      id v34 = [v16 defaultBins];
      id v32 = v34;
      [v16 binArrayToArchivedData:v34];
      sub_1004D258C(*((void *)v16 + 15));
      (*(void (**)(void))(**((void **)v16 + 15) + 944))(*((void *)v16 + 15));
    }
    uint64_t v35 = objc_opt_class();
    v36 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v35, objc_opt_class(), 0);
    if (!v33) {
      goto LABEL_32;
    }
    id v30 = [[+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v36, v33, 0) mutableCopy];
  }
  id v32 = v30;
LABEL_32:
  *((void *)v16 + 16) = v32;
  if (![v32 count])
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022F0548);
    }
    v37 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_FAULT))
    {
      id v38 = [*((id *)v16 + 1) UTF8String];
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      __int16 v44 = 2082;
      v45 = "";
      __int16 v46 = 2081;
      id v47 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Pedometer Calibration Table Empty After Initialization\", \"tableName\":%{private, location:escape_only}s}", buf, 0x1Cu);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022F0548);
      }
    }
    v39 = qword_102419038;
    if (os_signpost_enabled((os_log_t)qword_102419038))
    {
      id v40 = [*((id *)v16 + 1) UTF8String];
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      __int16 v44 = 2082;
      v45 = "";
      __int16 v46 = 2081;
      id v47 = v40;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Pedometer Calibration Table Empty After Initialization", "{\"msg%{public}.0s\":\"Pedometer Calibration Table Empty After Initialization\", \"tableName\":%{private, location:escape_only}s}", buf, 0x1Cu);
    }
  }
  return (CMPedometerTable *)v16;
}

- (id)binArrayToArchivedData:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  int64_t v4 = +[NSArray arrayWithArray:a3];

  return +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
}

- (id)defaultBins
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 1];
  for (i = self->_binBoundaries.__begin_; i != self->_binBoundaries.__end_ - 1; ++i)
  {
    id v5 = objc_alloc((Class)CMPedometerBin);
    double v6 = *i;
    double v7 = i[1];
    [v3 addObject:[v5 initWithValueOut:0 begin:self->_defaultValue end:v6 state:v7]];
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMPedometerTable;
  [(CMPedometerTable *)&v3 dealloc];
}

- (double)valueOutForValueIn:(double)a3
{
  id v5 = [(CMPedometerTable *)self copyBins];
  double defaultValue = self->_defaultValue;
  unint64_t v7 = [(CMPedometerTable *)self binIndexForValueIn:a3];
  if ([v5 count] && v7 < (unint64_t)objc_msgSend(v5, "count"))
  {
    if ([(CMPedometerTable *)self isValueInRun:a3])
    {
      id v8 = (char *)[v5 count];
      int64_t v9 = [(CMPedometerTable *)self walkBinCount];
    }
    else
    {
      id v8 = [(CMPedometerTable *)self walkBinCount];
      int64_t v9 = 0;
    }
    [v5[v7] valueOut];
    double defaultValue = v10;
    uint64_t v11 = [(uint64_t)[v5 objectAtIndexedSubscript:v7] state];
    int64_t v12 = v7 - 1;
    if (v11 <= 1)
    {
      v13 = (char *)(v7 + 1);
      if (v11 != 1
        || (v12 < v9
         || (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7 - 1), "state") < 2
         || (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "upperQuartile"), v14 < a3))
        && ((uint64_t)v13 >= (uint64_t)v8
         || (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7 + 1), "state") < 2
         || (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "lowerQuartile"), v15 >= a3)))
      {
        [v5[v7] upperQuartile];
        if (v16 >= a3) {
          v13 = (char *)v7;
        }
        if ((uint64_t)v13 < (uint64_t)v8)
        {
          while ((uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v13), "state") <= 0)
          {
            if (v8 == ++v13)
            {
              v13 = v8;
              break;
            }
          }
        }
        [v5 objectAtIndexedSubscript:v7] lowerQuartile];
        if (v17 < a3) {
          int64_t v12 = v7;
        }
        if (v12 >= v9)
        {
          while ((uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v12), "state") <= 0)
          {
            unint64_t v18 = (char *)(v12 - 1);
            if (v12-- <= v9) {
              goto LABEL_27;
            }
          }
        }
        unint64_t v18 = (char *)v12;
LABEL_27:
        if (v13 != v18)
        {
          int64_t v20 = v9 - 1;
          if (v13 == v8)
          {
            if (v18 != (char *)v20)
            {
              v21 = v5;
              uint64_t v22 = v18;
LABEL_33:
              [objc_msgSend(v21, "objectAtIndexedSubscript:", v22) valueOut];
              double defaultValue = v23;
            }
          }
          else
          {
            v21 = v5;
            if (v18 == (char *)v20)
            {
              uint64_t v22 = v13;
              goto LABEL_33;
            }
            uint64_t v24 = [(uint64_t)[v5 objectAtIndexedSubscript:v18] state];
            id v25 = [v5 objectAtIndexedSubscript:v18];
            if (v24 < 2) {
              [v25 upperQuartile];
            }
            else {
              [v25 end];
            }
            double v27 = v26;
            uint64_t v28 = (uint64_t)[v5 objectAtIndexedSubscript:v13].state;
            id v29 = [v5 objectAtIndexedSubscript:v13];
            if (v28 < 2) {
              [v29 lowerQuartile];
            }
            else {
              [v29 begin];
            }
            double v31 = v30;
            [objc_msgSend(v5, "objectAtIndexedSubscript:", v18) valueOut];
            double v33 = v32;
            [objc_msgSend(v5, "objectAtIndexedSubscript:", v13) valueOut];
            double defaultValue = v33 + (a3 - v27) * (v34 - v33) / (v31 - v27);
          }
        }
      }
    }
  }

  return defaultValue;
}

- (BOOL)isRunNativeValueOutAvailable
{
  unint64_t v3 = [(CMPedometerTable *)self binIndexForValueIn:*self->_binBoundariesRun.__begin_];
  int64_t v4 = self->_binBoundariesRun.__end_ - self->_binBoundariesRun.__begin_;

  return [(CMPedometerTable *)self isNativeValueOutAvailableInBinsFromIndex:v3 withLength:v4];
}

- (void)updateNativeBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5
{
  id v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:");
  [v9 valueOut];
  double v11 = a4 * a5 + v10 * (1.0 - a4);
  id v12 = objc_alloc((Class)CMPedometerBin);
  [v9 begin];
  double v14 = v13;
  [v9 end];
  double v16 = v15;
  uint64_t v17 = (uint64_t)[v9 state];
  if (v17 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v17;
  }
  id v19 = [v12 initWithValueOut:v18 + 1 begin:v11 end:v14 state:v16];
  bins = self->_bins;

  [(NSMutableArray *)bins setObject:v19 atIndexedSubscript:a3];
}

- (void)updateAdjacentBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5 nativeBin:(unint64_t)a6
{
  if ([(CMPedometerTable *)self isBin:a3 sameActivityAsBin:a6])
  {
    id v10 = [(NSMutableArray *)self->_bins objectAtIndexedSubscript:a3];
    if ((uint64_t)[v10 state] <= 10)
    {
      [v10 valueOut];
      double v12 = a4 * a5 + v11 * (1.0 - a4);
      id v13 = objc_alloc((Class)CMPedometerBin);
      [v10 begin];
      double v15 = v14;
      [v10 end];
      double v17 = v16;
      uint64_t v18 = (uint64_t)[v10 state];
      if (v18 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v18;
      }
      id v20 = [v13 initWithValueOut:v19 begin:v12 end:v15 state:v17];
      bins = self->_bins;
      [(NSMutableArray *)bins setObject:v20 atIndexedSubscript:a3];
    }
  }
}

- (BOOL)isBin:(unint64_t)a3 sameActivityAsBin:(unint64_t)a4
{
  unint64_t v4 = self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 1;
  if (v4 <= a3 || v4 <= a4) {
    return 0;
  }
  BOOL v9 = [(CMPedometerTable *)self walkBinCount] <= a3;
  return v9 ^ ([(CMPedometerTable *)self walkBinCount] > a4);
}

- (BOOL)isValueInValid:(double)a3
{
  return a3 >= 0.0 && *(self->_binBoundariesRun.__end_ - 1) >= a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForValueIn:(double)a3
{
  begin = self->_binBoundaries.__begin_;
  end = self->_binBoundaries.__end_;
  double v6 = -1.0;
  if (begin == end) {
    goto LABEL_10;
  }
  uint64_t v7 = 0;
  while (begin[v7] < a3)
  {
    if (&begin[++v7] == end) {
      goto LABEL_10;
    }
  }
  if (!(v7 * 8))
  {
LABEL_10:
    double v8 = -1.0;
  }
  else
  {
    double v8 = -1.0;
    if (&begin[v7] != end)
    {
      double v6 = begin[v7 - 1];
      double v8 = begin[v7];
    }
  }
  result.var1 = v8;
  result.var0 = v6;
  return result;
}

- (void)setBins:(id)a3
{
  objc_sync_enter(self);
  bins = self->_bins;
  if (bins != a3)
  {

    self->_bins = (NSMutableArray *)[a3 mutableCopy];
  }
  objc_sync_exit(self);
  if (!self->_testMode)
  {
    [(CMPedometerTable *)self binArrayToArchivedData:a3];
    sub_1004D258C((uint64_t)self->_persistentStore);
    (*(void (**)(void))(*(void *)self->_persistentStore + 944))();
  }
  [(CMPedometerTable *)self logBins];

  [(CMPedometerTable *)self binsDidChange];
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (unint64_t)walkBinCount
{
  return self->_binBoundariesWalk.__end_ - self->_binBoundariesWalk.__begin_;
}

- (id)description
{
  id v3 = [(CMPedometerTable *)self copyBins];
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = sub_100177DE0;
  double v11 = sub_1001774FC;
  double v12 = 0;
  double v12 = &stru_10234F018;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C859C8;
  v6[3] = &unk_1022F04D8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)updateBinsWithValueOut:(double)a3 valueIn:(double)a4 alpha:(double)a5
{
  objc_sync_enter(self);
  unint64_t v9 = [(CMPedometerTable *)self binIndexForValueIn:a4];
  if (v9 >= (unint64_t)[(NSMutableArray *)self->_bins count])
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022F0548);
    }
    double v16 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      unint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "binIndex %{public}lu invalid", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022F0548);
      }
      double v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMPedometerTable updateBinsWithValueOut:valueIn:alpha:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
  else
  {
    id v10 = [(NSMutableArray *)self->_bins objectAtIndexedSubscript:v9];
    [(CMPedometerTable *)self updateNativeBin:v9 withAlpha:a5 valueOut:a3];
    [(CMPedometerTable *)self updateAdjacentBin:v9 - 1 withAlpha:v9 valueOut:a5 nativeBin:a3];
    [(CMPedometerTable *)self updateAdjacentBin:v9 + 1 withAlpha:v9 valueOut:a5 nativeBin:a3];
    [(CMPedometerTable *)self setBins:self->_bins];
    id v11 = [(NSMutableArray *)self->_bins objectAtIndexedSubscript:v9];
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022F0548);
    }
    double v12 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
    {
      id v13 = [(NSString *)self->_tableName UTF8String];
      double v14 = [(NSString *)self->_valueInName UTF8String];
      double v15 = [(NSString *)self->_valueOutName UTF8String];
      *(_DWORD *)buf = 136317186;
      unint64_t v20 = (unint64_t)v13;
      __int16 v21 = 2080;
      uint64_t v22 = v14;
      __int16 v23 = 2048;
      double v24 = a4;
      __int16 v25 = 2080;
      double v26 = v15;
      __int16 v27 = 2048;
      double v28 = a3;
      __int16 v29 = 2048;
      double v30 = a5;
      __int16 v31 = 2048;
      unint64_t v32 = v9;
      __int16 v33 = 2080;
      id v34 = [[objc_msgSend(v10, "description") UTF8String];
      __int16 v35 = 2080;
      id v36 = [[[v11 description] UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,NativeBinIndex,%lu,OldBinStatus,%s,NewBinStatus,%s", buf, 0x5Cu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022F0548);
      }
      [(NSString *)self->_tableName UTF8String];
      [(NSString *)self->_valueInName UTF8String];
      [(NSString *)self->_valueOutName UTF8String];
      [objc_msgSend(v10, "description") UTF8String];
      [objc_msgSend(v11, "description") UTF8String];
      uint64_t v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMPedometerTable updateBinsWithValueOut:valueIn:alpha:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
  objc_sync_exit(self);
}

+ (id)convertToCMPedometerBins:(id)a3
{
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[a3 count]];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C86058;
  v6[3] = &unk_1022F0500;
  v6[4] = v4;
  [a3 enumerateObjectsUsingBlock:v6];
  return v4;
}

+ (id)convertToCMStrideCalibrationData:(id)a3
{
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[a3 count]];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C861B0;
  v6[3] = &unk_1022F0528;
  v6[4] = v4;
  [a3 enumerateObjectsUsingBlock:v6];
  return v4;
}

- (void).cxx_destruct
{
  begin = self->_binBoundaries.__begin_;
  if (begin)
  {
    self->_binBoundaries.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_binBoundariesRun.__begin_;
  if (v4)
  {
    self->_binBoundariesRun.__end_ = v4;
    operator delete(v4);
  }
  id v5 = self->_binBoundariesWalk.__begin_;
  if (v5)
  {
    self->_binBoundariesWalk.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end