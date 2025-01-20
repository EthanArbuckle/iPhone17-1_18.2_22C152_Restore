@interface PTCinematographyTrack
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeRangeEndForTime:(SEL)a3;
- ($69C59A32909E13F94AB58097350E6BB9)timeRange;
- ($69C59A32909E13F94AB58097350E6BB9)timeRangeAtIndex:(SEL)a3;
- ($69C59A32909E13F94AB58097350E6BB9)timeRangeForTime:(SEL)a3;
- (BOOL)isDiscrete;
- (BOOL)isUserCreated;
- (NSArray)timeRanges;
- (NSString)cachedTrackIdentifierString;
- (PTCinematographyScript)script;
- (PTCinematographyTrack)init;
- (PTCinematographyTrack)initWithDetectionType:(unint64_t)a3;
- (id)_asCinematographyDictionary;
- (id)_asMutableCinematographyDictionary;
- (id)_calculateTimeRanges;
- (id)_initWithCinematographyDictionary:(id)a3;
- (id)_initWithTrack:(id)a3;
- (id)debugTrackIdentifierString;
- (id)detectionAtOrBeforeTime:(id *)a3;
- (id)detectionInFrame:(id)a3;
- (id)detectionNearestTime:(id *)a3;
- (id)detectionsInTimeRange:(id *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)groupIdentifier;
- (int64_t)trackIdentifier;
- (unint64_t)detectionType;
- (unint64_t)timeRangeCount;
- (unint64_t)trackType;
- (void)_addStartTime:(id *)a3 endTime:(id *)a4 toTimeRanges:(id)a5;
- (void)setGroupIdentifier:(int64_t)a3;
- (void)setScript:(id)a3;
- (void)setTrackIdentifier:(int64_t)a3;
- (void)setUserCreated:(BOOL)a3;
@end

@implementation PTCinematographyTrack

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 _initWithTrack:self];
}

- (id)_initWithTrack:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyTrack;
  v5 = [(PTCinematographyTrack *)&v10 init];
  if (v5)
  {
    v6 = [v4 script];
    objc_storeWeak((id *)&v5->_script, v6);

    uint64_t v7 = [v4 timeRanges];
    timeRanges = v5->_timeRanges;
    v5->_timeRanges = (NSArray *)v7;

    v5->_detectionType = [v4 detectionType];
    v5->_trackIdentifier = [v4 trackIdentifier];
    v5->_groupIdentifier = [v4 groupIdentifier];
    v5->_userCreated = [v4 isUserCreated];
  }

  return v5;
}

- (BOOL)isDiscrete
{
  return 1;
}

- (PTCinematographyTrack)init
{
  return [(PTCinematographyTrack *)self initWithDetectionType:0];
}

- (PTCinematographyTrack)initWithDetectionType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PTCinematographyTrack;
  result = [(PTCinematographyTrack *)&v5 init];
  if (result)
  {
    result->_trackIdentifier = -1;
    result->_groupIdentifier = -1;
    result->_detectionType = a3;
    result->_userCreated = 1;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeRangeEndForTime:(SEL)a3
{
  memset(&v7[1], 0, sizeof(CMTimeRange));
  v7[0].start = (CMTime)*a4;
  result = [(PTCinematographyTrack *)self timeRangeForTime:v7];
  if ((v7[1].start.flags & 1) == 0
    || (v7[1].duration.flags & 1) == 0
    || v7[1].duration.epoch
    || v7[1].duration.value < 0)
  {
    uint64_t v6 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v6 + 16);
  }
  else
  {
    v7[0] = v7[1];
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeRangeGetEnd((CMTime *)retstr, v7);
  }
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeForTime:(SEL)a3
{
  uint64_t v7 = MEMORY[0x1E4F1FA20];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v15 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v7 + 32);
  result = [(PTCinematographyTrack *)self timeRangeCount];
  objc_super v10 = (char *)&result[-1].var1.var3 + 7;
  if ((uint64_t)&result[-1].var1.var3 + 7 >= 0)
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = (uint64_t)&v10[v11];
      memset(&v18.start.epoch, 0, 32);
      if ((uint64_t)&v10[v11] < 0 != __OFADD__(v10, v11)) {
        ++v12;
      }
      uint64_t v13 = v12 >> 1;
      *(_OWORD *)&v18.start.value = 0uLL;
      [(PTCinematographyTrack *)self timeRangeAtIndex:v12 >> 1];
      CMTimeRange range = v18;
      CMTime time = (CMTime)*a4;
      result = ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeRangeContainsTime(&range, &time);
      if (result) {
        break;
      }
      *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0;
      range.start.epoch = a4->var3;
      *(_OWORD *)&time.value = v15;
      time.epoch = *(void *)(v7 + 16);
      result = ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeCompare(&range.start, &time);
      if ((int)result < 0) {
        objc_super v10 = (char *)(v13 - 1);
      }
      else {
        uint64_t v11 = v13 + 1;
      }
      if (v11 > (uint64_t)v10) {
        return result;
      }
    }
    long long v14 = *(_OWORD *)&v18.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v18.start.value;
    *(_OWORD *)&retstr->var0.var3 = v14;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v18.duration.timescale;
  }
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRange
{
  result = [(PTCinematographyTrack *)self timeRangeCount];
  if (result)
  {
    [(PTCinematographyTrack *)self timeRangeAtIndex:0];
    CMTime v13 = v12;
    memset(&v11, 0, sizeof(v11));
    [(PTCinematographyTrack *)self timeRangeAtIndex:[(PTCinematographyTrack *)self timeRangeCount] - 1];
    CMTimeRangeGetEnd(&v11, &range);
    CMTime start = v13;
    CMTime v8 = v11;
    return ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v8);
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1FA30];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA30];
    *(_OWORD *)&retstr->var0.var3 = v7;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v6 + 32);
  }
  return result;
}

- (unint64_t)timeRangeCount
{
  v3 = [(PTCinematographyTrack *)self timeRanges];

  if (!v3)
  {
    id v4 = [(PTCinematographyTrack *)self _calculateTimeRanges];
    timeRanges = self->_timeRanges;
    self->_timeRanges = v4;
  }
  uint64_t v6 = [(PTCinematographyTrack *)self timeRanges];
  unint64_t v7 = [v6 count];

  return v7;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeAtIndex:(SEL)a3
{
  unint64_t v7 = [(PTCinematographyTrack *)self timeRanges];

  if (!v7)
  {
    CMTime v8 = [(PTCinematographyTrack *)self _calculateTimeRanges];
    timeRanges = self->_timeRanges;
    self->_timeRanges = v8;
  }
  id v13 = [(PTCinematographyTrack *)self timeRanges];
  objc_super v10 = [v13 objectAtIndexedSubscript:a4];
  CMTime v11 = v10;
  if (v10)
  {
    [v10 CMTimeRangeValue];
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (id)detectionNearestTime:(id *)a3
{
  return 0;
}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  return 0;
}

- (id)detectionsInTimeRange:(id *)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setTrackIdentifier:(int64_t)a3
{
  self->_trackIdentifier = a3;
}

- (void)setGroupIdentifier:(int64_t)a3
{
  self->_groupIdentifier = a3;
}

- (void)setScript:(id)a3
{
}

- (id)detectionInFrame:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(v4, "detectionForTrackIdentifier:", -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier"));

  return v5;
}

- (id)_calculateTimeRanges
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  memset(&v34, 0, sizeof(v34));
  CMTimeMake(&v34, 1, 1);
  v3 = objc_opt_new();
  id v4 = [(PTCinematographyTrack *)self script];
  objc_super v5 = [(PTCinematographyTrack *)self script];
  uint64_t v6 = v5;
  if (v5) {
    [v5 timeRange];
  }
  else {
    memset(v33, 0, sizeof(v33));
  }
  unint64_t v7 = [v4 framesInTimeRange:v33];

  CMTime v32 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  CMTime v31 = v32;
  CMTime v30 = v32;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (!v9)
  {

    goto LABEL_41;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  LOBYTE(v12) = 0;
  uint64_t v13 = *(void *)v27;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v8);
      }
      long long v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
      v16 = [(PTCinematographyTrack *)self detectionInFrame:v15];

      if (v16)
      {
        if (v12)
        {
          char v11 = 0;
        }
        else
        {
          if (v15) {
            [v15 time];
          }
          else {
            memset(&lhs, 0, sizeof(lhs));
          }
          char v11 = 0;
          CMTime v32 = lhs;
        }
        goto LABEL_20;
      }
      if (v12)
      {
        if ((v11 & 1) == 0)
        {
          if (v15) {
            [v15 time];
          }
          else {
            memset(&lhs, 0, sizeof(lhs));
          }
          CMTime v31 = lhs;
          CMTime rhs = v34;
          CMTimeAdd(&v30, &lhs, &rhs);
        }
        if (v15) {
          [v15 time];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime lhs = v30;
        if (CMTimeCompare(&time1, &lhs) < 1)
        {
          char v11 = 1;
LABEL_20:
          int v12 = 1;
          goto LABEL_29;
        }
        CMTime lhs = v32;
        CMTime rhs = v31;
        [(PTCinematographyTrack *)self _addStartTime:&lhs endTime:&rhs toTimeRanges:v3];
        char v11 = 0;
      }
      int v12 = 0;
LABEL_29:
      ++v14;
    }
    while (v10 != v14);
    uint64_t v17 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
    uint64_t v10 = v17;
  }
  while (v17);

  if (v12)
  {
    if ((v11 & 1) == 0)
    {
      CMTimeRange v18 = [(PTCinematographyTrack *)self script];
      v19 = v18;
      if (v18) {
        [v18 timeRange];
      }
      else {
        memset(&v22, 0, sizeof(v22));
      }
      CMTimeRangeGetEnd(&v31, &v22);
    }
    CMTime lhs = v32;
    CMTime rhs = v31;
    -[PTCinematographyTrack _addStartTime:endTime:toTimeRanges:](self, "_addStartTime:endTime:toTimeRanges:", &lhs, &rhs, v3, *(_OWORD *)&v22.start.value, *(_OWORD *)&v22.start.epoch, *(_OWORD *)&v22.duration.timescale);
  }
LABEL_41:
  v20 = (void *)[v3 copy];

  return v20;
}

- (void)_addStartTime:(id *)a3 endTime:(id *)a4 toTimeRanges:(id)a5
{
  memset(&v9, 0, sizeof(v9));
  v7.CMTime start = (CMTime)*a3;
  CMTime end = *(CMTime *)a4;
  id v5 = a5;
  CMTimeRangeFromTimeToTime(&v9, &v7.start, &end);
  CMTimeRange v7 = v9;
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:&v7];
  [v5 addObject:v6];
}

- (id)debugTrackIdentifierString
{
  v3 = [(PTCinematographyTrack *)self cachedTrackIdentifierString];

  if (!v3)
  {
    _PTFocusIdentifierMake([(PTCinematographyTrack *)self detectionType], [(PTCinematographyTrack *)self trackIdentifier]);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedTrackIdentifierString = self->_cachedTrackIdentifierString;
    self->_cachedTrackIdentifierString = v4;
  }

  return [(PTCinematographyTrack *)self cachedTrackIdentifierString];
}

- (unint64_t)trackType
{
  return 0;
}

- (id)_asMutableCinematographyDictionary
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PTCinematographyTrack isUserCreated](self, "isUserCreated"));
  [v3 setObject:v4 forKeyedSubscript:@"user_created"];

  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PTCinematographyTrack trackType](self, "trackType"));
  [v3 setObject:v5 forKeyedSubscript:@"track_type"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier"));
  [v3 setObject:v6 forKeyedSubscript:@"track_id"];

  CMTimeRange v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[PTCinematographyTrack groupIdentifier](self, "groupIdentifier"));
  [v3 setObject:v7 forKeyedSubscript:@"group_id"];

  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PTCinematographyTrack detectionType](self, "detectionType"));
  [v3 setObject:v8 forKeyedSubscript:@"detection_type"];

  return v3;
}

- (id)_asCinematographyDictionary
{
  v2 = [(PTCinematographyTrack *)self _asMutableCinematographyDictionary];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    int v12 = [v4 objectForKeyedSubscript:@"track_type"];
    uint64_t v13 = [v12 unsignedIntegerValue];

    if (v13 == 3)
    {
      uint64_t v14 = PTCinematographyFixedFocusTrack;
    }
    else
    {
      if (v13 != 2)
      {
        long long v15 = 0;
        goto LABEL_11;
      }
      uint64_t v14 = PTCinematographyCustomTrack;
    }
    char v11 = (PTCinematographyTrack *)[[v14 alloc] _initWithCinematographyDictionary:v4];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PTCinematographyTrack;
    uint64_t v6 = [(PTCinematographyTrack *)&v17 init];
    if (v6)
    {
      CMTimeRange v7 = [v4 objectForKeyedSubscript:@"user_created"];
      v6->_userCreated = [v7 BOOLValue];

      id v8 = [v4 objectForKeyedSubscript:@"track_id"];
      v6->_trackIdentifier = [v8 integerValue];

      CMTimeRange v9 = [v4 objectForKeyedSubscript:@"group_id"];
      v6->_groupIdentifier = [v9 integerValue];

      uint64_t v10 = [v4 objectForKeyedSubscript:@"detection_type"];
      v6->_detectionType = [v10 unsignedIntegerValue];
    }
    char v11 = v6;
    self = v11;
  }
  long long v15 = v11;
LABEL_11:

  return v15;
}

- (int64_t)trackIdentifier
{
  return self->_trackIdentifier;
}

- (int64_t)groupIdentifier
{
  return self->_groupIdentifier;
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (BOOL)isUserCreated
{
  return self->_userCreated;
}

- (void)setUserCreated:(BOOL)a3
{
  self->_userCreated = a3;
}

- (PTCinematographyScript)script
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_script);

  return (PTCinematographyScript *)WeakRetained;
}

- (NSArray)timeRanges
{
  return self->_timeRanges;
}

- (NSString)cachedTrackIdentifierString
{
  return self->_cachedTrackIdentifierString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTrackIdentifierString, 0);
  objc_storeStrong((id *)&self->_timeRanges, 0);

  objc_destroyWeak((id *)&self->_script);
}

@end