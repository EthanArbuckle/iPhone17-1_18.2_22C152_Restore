@interface ULHomeSlamAnalyticEventAnalyzer
- (BOOL)_checkIfScreenTransitionedToOnBefore:(id)a3 after:(id)a4;
- (BOOL)_daemonWasRestarted;
- (BOOL)_wasLastScreenStateOnBefore:(id)a3;
- (ULDatabase)db;
- (ULHomeSlamAnalyticEventAnalyzer)initWithDB:(ULDatabase *)a3;
- (id).cxx_construct;
- (id)_analyzeTriggersAndGetCA:(id)a3 fromDate:(id)a4 untilDate:(id)a5;
- (id)runStopDetectionAnalysisAtTimepoint:(void *)a1;
- (int64_t)_aggregateTimeBetweenEvent:(signed __int16)a3 andEvent:(signed __int16)a4 startDate:(id)a5 endDate:(id)a6;
- (int64_t)_calcMiLoEnabledTimeFromDate:(id)a3 untilDate:(id)a4;
- (int64_t)_calcTimeAtHomeFromDate:(id)a3 untilDate:(id)a4;
- (int64_t)_hoursFromFirstEventToDate:(id)a3;
- (uint64_t)_timepointToDate:(double)a1;
- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)events;
- (void)setDb:(ULDatabase *)a3;
- (void)setEvents:()vector<CLMiLoHomeSlamAnalyticEventTable:(std::allocator<CLMiLoHomeSlamAnalyticEventTable::Entry>> *)a3 :Entry;
@end

@implementation ULHomeSlamAnalyticEventAnalyzer

- (ULHomeSlamAnalyticEventAnalyzer)initWithDB:(ULDatabase *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ULHomeSlamAnalyticEventAnalyzer;
  v4 = [(ULHomeSlamAnalyticEventAnalyzer *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULHomeSlamAnalyticEventAnalyzer *)v4 setDb:a3];
  }
  return v5;
}

- (id)runStopDetectionAnalysisAtTimepoint:(void *)a1
{
  id v4 = *(id *)([a1 db] + 128);
  v5 = v4;
  if (v4)
  {
    [v4 fetchAnalyticEventsASCFromTime:a2 + -86400.0 toTime:a2];
  }
  else
  {
    __p = 0;
    v13 = 0;
    uint64_t v14 = 0;
  }
  [a1 setEvents:&__p];
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }

  v6 = -[ULHomeSlamStopDetection initWithDB:]([ULHomeSlamStopDetection alloc], "initWithDB:", [a1 db]);
  objc_super v7 = [(ULHomeSlamStopDetection *)v6 runStopDetectionAnalysisFromTime:a2 + -86400.0 toTime:a2];

  v8 = [a1 _timepointToDate:a2 + -86400.0];
  v9 = [a1 _timepointToDate:a2];
  v10 = [a1 _analyzeTriggersAndGetCA:v7 fromDate:v8 untilDate:v9];

  return v10;
}

- (uint64_t)_timepointToDate:(double)a1
{
  return [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)a1];
}

- (id)_analyzeTriggersAndGetCA:(id)a3 fromDate:(id)a4 untilDate:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v41 = a4;
  id v42 = a5;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  v47 = self;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  if (v9)
  {
    char v13 = 0;
    v46 = 0;
    uint64_t v43 = 0;
    uint64_t v14 = *(void *)v49;
    LODWORD(v15) = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if ([v17 trigger] != 0 || (v13 & 1) == 0)
        {
          v21 = [v17 date];
          BOOL v22 = [(ULHomeSlamAnalyticEventAnalyzer *)v47 _wasLastScreenStateOnBefore:v21];

          if (v22)
          {
            char v13 = 0;
            ++v43;
            ++v10;
            v12 += (v15 & 1) == 0;
            LODWORD(v15) = 0;
          }
          else
          {
            uint64_t v23 = [v17 date];

            char v13 = 1;
            v46 = (void *)v23;
          }
        }
        else
        {
          v18 = [v17 date];
          BOOL v19 = [(ULHomeSlamAnalyticEventAnalyzer *)v47 _checkIfScreenTransitionedToOnBefore:v18 after:v46];

          char v13 = 0;
          unsigned int v20 = v15 ^ 1;
          v10 += v19;
          uint64_t v15 = !v19;
          v11 += v15;
          v12 += v19 & v20;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v9);
  }
  else
  {
    v46 = 0;
    uint64_t v43 = 0;
  }

  uint64_t v24 = [(ULHomeSlamAnalyticEventAnalyzer *)v47 _daemonWasRestarted];
  if (v11 + v10) {
    unint64_t v25 = 100 * v12 / (unint64_t)(v11 + v10);
  }
  else {
    unint64_t v25 = 200;
  }
  uint64_t v26 = [(ULHomeSlamAnalyticEventAnalyzer *)v47 _calcTimeAtHomeFromDate:v41 untilDate:v42];
  uint64_t v27 = [(ULHomeSlamAnalyticEventAnalyzer *)v47 _calcMiLoEnabledTimeFromDate:v41 untilDate:v42];
  v52[0] = @"stop_triggers_total";
  v40 = [NSNumber numberWithUnsignedInteger:v11 + v10];
  v53[0] = v40;
  v52[1] = @"stop_triggers_screen_on";
  uint64_t v28 = [NSNumber numberWithUnsignedInteger:v43];
  v53[1] = v28;
  v52[2] = @"stop_triggers_not_supressed";
  v44 = [NSNumber numberWithUnsignedInteger:v10];
  v53[2] = v44;
  v52[3] = @"stop_triggers_supressed";
  v29 = [NSNumber numberWithUnsignedInteger:v11];
  v53[3] = v29;
  v52[4] = @"num_valid_segments";
  v30 = [NSNumber numberWithUnsignedInteger:v12];
  v53[4] = v30;
  v52[5] = @"percent_valid_segments";
  v31 = [NSNumber numberWithUnsignedInteger:v25];
  uint64_t v32 = v24;
  v53[5] = v31;
  v52[6] = @"time_spent_at_home";
  v33 = [NSNumber numberWithInteger:v26];
  v53[6] = v33;
  v52[7] = @"time_spent_with_milo_enabled";
  v34 = [NSNumber numberWithInteger:v27];
  v35 = (void *)v28;
  v53[7] = v34;
  v52[8] = @"daemon_restarted";
  v36 = [NSNumber numberWithBool:v32];
  v53[8] = v36;
  v52[9] = @"hours_since_first_event";
  v37 = objc_msgSend(NSNumber, "numberWithInteger:", -[ULHomeSlamAnalyticEventAnalyzer _hoursFromFirstEventToDate:](v47, "_hoursFromFirstEventToDate:", v42));
  v53[9] = v37;
  v38 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:10];

  return v38;
}

- (int64_t)_hoursFromFirstEventToDate:(id)a3
{
  id v4 = a3;
  id v5 = (id)[(ULHomeSlamAnalyticEventAnalyzer *)self db][128];
  v6 = v5;
  if (v5)
  {
    [v5 fetchFirstEvent];
  }
  else
  {
    double v11 = 0.0;
    char v12 = 0;
  }

  if (v12)
  {
    objc_super v7 = [(ULHomeSlamAnalyticEventAnalyzer *)self _timepointToDate:v11];
    [v4 timeIntervalSinceDate:v7];
    int64_t v9 = vcvtpd_s64_f64(v8 / 60.0 / 60.0);
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_checkIfScreenTransitionedToOnBefore:(id)a3 after:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ULHomeSlamAnalyticEventAnalyzer *)self events];
  double v8 = __p;
  if (__p == v18)
  {
    BOOL v16 = 0;
    if (!__p) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  do
  {
    int64_t v9 = [(ULHomeSlamAnalyticEventAnalyzer *)self _timepointToDate:*v8];
    [v9 timeIntervalSinceDate:v6];
    double v11 = v10;

    if (v11 > 0.0) {
      break;
    }
    char v12 = [(ULHomeSlamAnalyticEventAnalyzer *)self _timepointToDate:*v8];
    [v12 timeIntervalSinceDate:v7];
    if (v13 <= 0.0)
    {
    }
    else
    {
      int v14 = *((unsigned __int16 *)v8 + 4);

      if (!v14)
      {
        BOOL v16 = 1;
        goto LABEL_9;
      }
    }
    v8 += 2;
  }
  while (v8 != v18);
  BOOL v16 = 0;
LABEL_9:
  double v8 = __p;
  if (__p) {
LABEL_10:
  }
    operator delete(v8);
LABEL_11:

  return v16;
}

- (BOOL)_wasLastScreenStateOnBefore:(id)a3
{
  id v4 = a3;
  [(ULHomeSlamAnalyticEventAnalyzer *)self events];
  id v5 = __p;
  if (__p == v13)
  {
    LOBYTE(v6) = 0;
    if (!__p) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  int v6 = 0;
  do
  {
    id v7 = [(ULHomeSlamAnalyticEventAnalyzer *)self _timepointToDate:*v5];
    [v7 timeIntervalSinceDate:v4];
    double v9 = v8;

    if (v9 > 0.0) {
      break;
    }
    int v10 = *((_WORD *)v5 + 4) == 1 ? 0 : v6;
    int v6 = *((_WORD *)v5 + 4) ? v10 : 1;
    v5 += 2;
  }
  while (v5 != v13);
  id v5 = __p;
  if (__p) {
LABEL_12:
  }
    operator delete(v5);
LABEL_13:

  return v6 & 1;
}

- (int64_t)_calcTimeAtHomeFromDate:(id)a3 untilDate:(id)a4
{
  return [(ULHomeSlamAnalyticEventAnalyzer *)self _aggregateTimeBetweenEvent:5 andEvent:6 startDate:a3 endDate:a4];
}

- (int64_t)_calcMiLoEnabledTimeFromDate:(id)a3 untilDate:(id)a4
{
  return [(ULHomeSlamAnalyticEventAnalyzer *)self _aggregateTimeBetweenEvent:2 andEvent:3 startDate:a3 endDate:a4];
}

- (int64_t)_aggregateTimeBetweenEvent:(signed __int16)a3 andEvent:(signed __int16)a4 startDate:(id)a5 endDate:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  [(ULHomeSlamAnalyticEventAnalyzer *)self events];
  int v12 = (unsigned __int16)a4;
  int v13 = (unsigned __int16)a3;
  id v14 = v11;
  uint64_t v15 = v14;
  BOOL v16 = v37;
  if (v37 != v36)
  {
    v17 = 0;
    double v18 = 0.0;
    BOOL v19 = v14;
    while (1)
    {
      int v20 = *((unsigned __int16 *)v16 - 4);
      if (v20 == v13)
      {
        v21 = [(ULHomeSlamAnalyticEventAnalyzer *)self _timepointToDate:*(v16 - 2)];

        [v19 timeIntervalSinceDate:v21];
        double v18 = v18 + v22;
        id v23 = v21;
        v17 = v23;
      }
      else
      {
        if (v20 != v12 && v20 != 4) {
          goto LABEL_12;
        }
        id v23 = [(ULHomeSlamAnalyticEventAnalyzer *)self _timepointToDate:*(v16 - 2)];
      }
      id v25 = v23;

      BOOL v19 = v25;
LABEL_12:
      v16 -= 2;
      if (v16 == v36) {
        goto LABEL_15;
      }
    }
  }
  v17 = 0;
  double v18 = 0.0;
  BOOL v19 = v14;
LABEL_15:
  id v26 = (id)[(ULHomeSlamAnalyticEventAnalyzer *)self db][128];
  uint64_t v27 = operator new(6uLL);
  v31 = v27 + 3;
  uint64_t v32 = v27 + 3;
  *uint64_t v27 = v13;
  v27[1] = v12;
  v27[2] = 4;
  __p = v27;
  [v10 timeIntervalSinceReferenceDate];
  if (v26)
  {
    objc_msgSend(v26, "fetchLatestAnalyticEventType:beforeTime:", &__p);
    uint64_t v27 = __p;
    if (!__p) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
  }
  v31 = v27;
  operator delete(v27);
LABEL_20:

  if ((_BYTE)v35 && (unsigned __int16)v34 == v13)
  {
    [v19 timeIntervalSinceDate:v10];
    double v18 = v18 + v28;
  }

  if (v36)
  {
    v37 = (double *)v36;
    operator delete(v36);
  }

  return vcvtpd_s64_f64(v18 / 60.0 / 60.0);
}

- (BOOL)_daemonWasRestarted
{
  [(ULHomeSlamAnalyticEventAnalyzer *)self events];
  if (v7 == v8)
  {
    BOOL v4 = 0;
    if (!v7) {
      return v4;
    }
    goto LABEL_9;
  }
  v2 = v7 + 16;
  do
  {
    int v3 = *((unsigned __int16 *)v2 - 4);
    BOOL v4 = v3 == 4;
    BOOL v5 = v3 == 4 || v2 == v8;
    v2 += 16;
  }
  while (!v5);
  if (v7) {
LABEL_9:
  }
    operator delete(v7);
  return v4;
}

- (vector<CLMiLoHomeSlamAnalyticEventTable::Entry,)events
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<CLMiLoHomeSlamAnalyticEventTable::Entry, std::allocator<CLMiLoHomeSlamAnalyticEventTable::Entry>> *)std::vector<CLMiLoHomeSlamAnalyticEventTable::Entry>::__init_with_size[abi:ne180100]<CLMiLoHomeSlamAnalyticEventTable::Entry*,CLMiLoHomeSlamAnalyticEventTable::Entry*>(retstr, self->_events.__begin_, (uint64_t)self->_events.__end_, self->_events.__end_ - self->_events.__begin_);
}

- (void)setEvents:()vector<CLMiLoHomeSlamAnalyticEventTable:(std::allocator<CLMiLoHomeSlamAnalyticEventTable::Entry>> *)a3 :Entry
{
  p_events = (char *)&self->_events;
  if (p_events != (char *)a3) {
    std::vector<CLMiLoHomeSlamAnalyticEventTable::Entry>::__assign_with_size[abi:ne180100]<CLMiLoHomeSlamAnalyticEventTable::Entry*,CLMiLoHomeSlamAnalyticEventTable::Entry*>(p_events, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (ULDatabase)db
{
  return self->_db;
}

- (void)setDb:(ULDatabase *)a3
{
  self->_db = a3;
}

- (void).cxx_destruct
{
  begin = self->_events.__begin_;
  if (begin)
  {
    self->_events.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end