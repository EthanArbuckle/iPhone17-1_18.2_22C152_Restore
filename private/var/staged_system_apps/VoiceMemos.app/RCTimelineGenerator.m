@interface RCTimelineGenerator
+ (id)emptyTimelineWithIdentifier:(id)a3;
- (NSDate)recordingStartTime;
- (RCElapsedRecordingTimeInfo)elapsedRecordingTimeInfo;
- (RCRecordingStartTimeInfo)recordingStartTimeInfo;
- (RCTimelineGenerator)initWithRecordingStartTimeInfo:(id)a3 elapsedRecordingTimeInfo:(id)a4;
- (double)_recordingDurationForDurationAtStartTime:(double)result currentTime:(double)a4;
- (id)_dateEntriesForRecordingStartTime:(id)a3 lastRecordingTime:(double)a4 elapsedTimeAtRecordingStart:(double)a5 recordingDurationAtRecordingStart:(double)a6 timelineDateInterval:(id)a7;
- (id)_recordingStartTimeSyncedWithDisplayedTime;
- (id)timelinesForDateInterval:(id)a3 displayedRecordingTime:(double)a4 timelineIdentifier:(id)a5;
- (void)setElapsedRecordingTimeInfo:(id)a3;
- (void)setRecordingStartTimeInfo:(id)a3;
@end

@implementation RCTimelineGenerator

- (RCTimelineGenerator)initWithRecordingStartTimeInfo:(id)a3 elapsedRecordingTimeInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RCTimelineGenerator;
  v9 = [(RCTimelineGenerator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordingStartTimeInfo, a3);
    objc_storeStrong((id *)&v10->_elapsedRecordingTimeInfo, a4);
    uint64_t v11 = [(RCTimelineGenerator *)v10 _recordingStartTimeSyncedWithDisplayedTime];
    recordingStartTime = v10->_recordingStartTime;
    v10->_recordingStartTime = (NSDate *)v11;
  }
  return v10;
}

+ (id)emptyTimelineWithIdentifier:(id)a3
{
  v3 = +[BLSAlwaysOnTimeline emptyTimelineWithIdentifier:a3];
  v6 = v3;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (id)timelinesForDateInterval:(id)a3 displayedRecordingTime:(double)a4 timelineIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(RCTimelineGenerator *)self recordingStartTime];

  if (v10)
  {
    id v30 = v9;
    uint64_t v11 = [(RCTimelineGenerator *)self recordingStartTimeInfo];
    v12 = [(RCTimelineGenerator *)self recordingStartTime];
    [v11 recordingTimeAtStartTime];
    double v14 = v13;
    [v11 recordingDurationAtStartTime];
    v16 = [(RCTimelineGenerator *)self _dateEntriesForRecordingStartTime:v12 lastRecordingTime:v8 elapsedTimeAtRecordingStart:a4 recordingDurationAtRecordingStart:v14 timelineDateInterval:v15];

    v17 = +[NSMutableArray array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v24 = [v23 dateEntry];
          v25 = +[BLSAlwaysOnTimelineUnconfiguredEntry entryForPresentationTime:withRequestedFidelity:](BLSAlwaysOnTimelineUnconfiguredEntry, "entryForPresentationTime:withRequestedFidelity:", v24, [v23 updateFidelity]);

          v26 = [v23 userInfo];
          [v25 setUserObject:v26];

          [v17 addObject:v25];
        }
        id v20 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v20);
    }

    id v9 = v30;
    v27 = +[BLSAlwaysOnTimeline timelineWithEntries:v17 identifier:v30 configure:0];
    v35 = v27;
    v28 = +[NSArray arrayWithObjects:&v35 count:1];
  }
  else
  {
    uint64_t v11 = OSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10016BD64(v11);
    }
    v28 = &__NSArray0__struct;
  }

  return v28;
}

- (id)_dateEntriesForRecordingStartTime:(id)a3 lastRecordingTime:(double)a4 elapsedTimeAtRecordingStart:(double)a5 recordingDurationAtRecordingStart:(double)a6 timelineDateInterval:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  double v14 = [v13 endDate];
  v49 = v12;
  id v15 = [v12 compare:v14];

  if (v15 == (id)1)
  {
    v16 = OSLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10016BDE8((uint64_t)v12, v13, v16);
    }
    id v17 = &__NSArray0__struct;
    goto LABEL_39;
  }
  v16 = +[NSMutableArray array];
  if (RCSupportsDebugAODLogs())
  {
    id v18 = OSLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10016C08C(v12);
    }

    id v19 = OSLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10016BFFC();
    }

    id v20 = OSLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_10016BF54(v13);
    }

    uint64_t v21 = OSLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10016BEAC(v13);
    }
  }
  v22 = [v13 startDate];
  [v22 timeIntervalSinceDate:v12];
  double v24 = v23;

  unint64_t v26 = vcvtpd_u64_f64(v24);
  unint64_t v27 = vcvtpd_u64_f64(a4);
  if (v26 <= v27) {
    unint64_t v28 = v27;
  }
  else {
    unint64_t v28 = v26;
  }
  *(void *)&long long v25 = 136315394;
  long long v48 = v25;
  do
  {
    +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v49, (double)v28 - a5, v48);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = [v13 endDate];
    if ([v29 compare:v30] == (id)-1)
    {
    }
    else
    {
      long long v31 = [v13 endDate];
      id v32 = [v29 compare:v31];

      if (v32)
      {
        id v17 = [v16 copy];
        goto LABEL_38;
      }
    }
    [(RCTimelineGenerator *)self _recordingDurationForDurationAtStartTime:a6 currentTime:(double)v28];
    long long v34 = [[RCTimelineDateEntryUserInfo alloc] initWithCurrentTime:(double)v28 recordingDuration:v33];
    v35 = [[RCTimelineDateEntry alloc] initWithDateEntry:v29 updateFidelity:2 userInfo:v34];
    [v16 addObject:v35];
    if (RCSupportsDebugAODLogs())
    {
      v36 = OSLogForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v48;
        v51 = "-[RCTimelineGenerator _dateEntriesForRecordingStartTime:lastRecordingTime:elapsedTimeAtRecordingStart:reco"
              "rdingDurationAtRecordingStart:timelineDateInterval:]";
        __int16 v52 = 2112;
        v53 = v35;
        _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%s -- per second date entry: %@", buf, 0x16u);
      }
    }
    ++v28;
  }
  while (v28 < 0x3C);
  double v37 = (double)(60 * (unint64_t)(a4 / 60.0) + 60);
  id v29 = +[NSDate dateWithTimeInterval:v49 sinceDate:v37 - a5];
  for (i = v29; ; i = (void *)v46)
  {
    v39 = [v13 endDate];
    if ([i compare:v39] != (id)-1) {
      break;
    }

LABEL_33:
    [(RCTimelineGenerator *)self _recordingDurationForDurationAtStartTime:a6 currentTime:v37];
    v43 = [[RCTimelineDateEntryUserInfo alloc] initWithCurrentTime:v37 recordingDuration:v42];
    v44 = [[RCTimelineDateEntry alloc] initWithDateEntry:i updateFidelity:1 userInfo:v43];
    [v16 addObject:v44];
    if (RCSupportsDebugAODLogs())
    {
      v45 = OSLogForCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v48;
        v51 = "-[RCTimelineGenerator _dateEntriesForRecordingStartTime:lastRecordingTime:elapsedTimeAtRecordingStart:reco"
              "rdingDurationAtRecordingStart:timelineDateInterval:]";
        __int16 v52 = 2112;
        v53 = v44;
        _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "%s -- per minute date entry: %@", buf, 0x16u);
      }
    }
    uint64_t v46 = [i dateByAddingTimeInterval:60.0];

    double v37 = v37 + 60.0;
  }
  v40 = [v13 endDate];
  id v41 = [i compare:v40];

  if (!v41) {
    goto LABEL_33;
  }
  id v17 = [v16 copy];

LABEL_38:
LABEL_39:

  return v17;
}

- (double)_recordingDurationForDurationAtStartTime:(double)result currentTime:(double)a4
{
  if (result < a4) {
    return a4;
  }
  return result;
}

- (id)_recordingStartTimeSyncedWithDisplayedTime
{
  v3 = [(RCTimelineGenerator *)self recordingStartTimeInfo];
  v4 = [v3 dateRecordingStartTime];
  v5 = [v3 machRecordingStartTime];
  v6 = [(RCTimelineGenerator *)self elapsedRecordingTimeInfo];
  id v7 = v6;
  if (v6)
  {
    [v6 elapsedRecordingTime];
    double v9 = v8;
    v10 = [v7 machElapsedRecordingTime];
  }
  else
  {
    [v3 recordingTimeAtStartTime];
    double v9 = v11;
    v10 = v5;
  }
  [v3 recordingTimeAtStartTime];
  +[AVAudioTime secondsForHostTime:](AVAudioTime, "secondsForHostTime:", v10 - v5 - +[AVAudioTime hostTimeForSeconds:v9 - v12]);
  id v13 = [v4 dateByAddingTimeInterval:];

  return v13;
}

- (NSDate)recordingStartTime
{
  return self->_recordingStartTime;
}

- (RCRecordingStartTimeInfo)recordingStartTimeInfo
{
  return self->_recordingStartTimeInfo;
}

- (void)setRecordingStartTimeInfo:(id)a3
{
}

- (RCElapsedRecordingTimeInfo)elapsedRecordingTimeInfo
{
  return self->_elapsedRecordingTimeInfo;
}

- (void)setElapsedRecordingTimeInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elapsedRecordingTimeInfo, 0);
  objc_storeStrong((id *)&self->_recordingStartTimeInfo, 0);

  objc_storeStrong((id *)&self->_recordingStartTime, 0);
}

@end