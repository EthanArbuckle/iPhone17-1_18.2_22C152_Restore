@interface MTPlayMetricsEvent
+ (id)eventWithAccessLog:(id)a3 dataSource:(id)a4;
- (AVPlayerItemAccessLogEvent)accessLogEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRecorded;
- (MTEpisodeMetricDataSource)dataSource;
- (MTPlayMetricsEvent)initWithAccessLogEvent:(id)a3 dataSource:(id)a4;
- (id)_data;
- (id)description;
- (unint64_t)hash;
- (void)record;
- (void)setAccessLogEvent:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setRecorded:(BOOL)a3;
@end

@implementation MTPlayMetricsEvent

+ (id)eventWithAccessLog:(id)a3 dataSource:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithAccessLogEvent:v6 dataSource:v5];

  return v7;
}

- (MTPlayMetricsEvent)initWithAccessLogEvent:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTPlayMetricsEvent;
  v8 = [(MTPlayMetricsEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MTPlayMetricsEvent *)v8 setAccessLogEvent:v6];
    [(MTPlayMetricsEvent *)v9 setDataSource:v7];
  }

  return v9;
}

- (BOOL)isRecorded
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL recorded = v2->_recorded;
  objc_sync_exit(v2);

  return recorded;
}

- (void)record
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MTPlayMetricsEvent *)obj dataSource];
  v3 = [(MTPlayMetricsEvent *)obj _data];
  +[IMMetrics recordEvent:@"play_stats" dataSource:v2 data:v3];

  [(MTPlayMetricsEvent *)obj setRecorded:1];
  objc_sync_exit(obj);
}

- (id)_data
{
  v2 = [(MTPlayMetricsEvent *)self accessLogEvent];
  v3 = [v2 playbackStartDate];
  [v3 timeIntervalSince1970];
  uint64_t v5 = (uint64_t)(v4 * 1000.0);

  v37[0] = @"uri";
  uint64_t v6 = [v2 URI];
  v36 = (void *)v6;
  if (v6) {
    CFStringRef v7 = (const __CFString *)v6;
  }
  else {
    CFStringRef v7 = &stru_10056A8A0;
  }
  v38[0] = v7;
  v37[1] = @"server_address";
  uint64_t v8 = [v2 serverAddress];
  v35 = (void *)v8;
  if (v8) {
    CFStringRef v9 = (const __CFString *)v8;
  }
  else {
    CFStringRef v9 = &stru_10056A8A0;
  }
  v38[1] = v9;
  v37[2] = @"number_of_server_address_changes";
  v34 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 numberOfServerAddressChanges]);
  v38[2] = v34;
  v37[3] = @"media_requests_wwan";
  v33 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 mediaRequestsWWAN]);
  v38[3] = v33;
  v37[4] = @"transfer_duration";
  [v2 transferDuration];
  v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[4] = v32;
  v37[5] = @"number_of_bytes_transferred";
  v31 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v2 numberOfBytesTransferred]);
  v38[5] = v31;
  v37[6] = @"number_of_media_requests";
  v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 numberOfMediaRequests]);
  v38[6] = v30;
  v37[7] = @"playStartTime";
  v29 = +[NSNumber numberWithLongLong:v5];
  v38[7] = v29;
  v37[8] = @"playback_session_id";
  v28 = [v2 playbackSessionID];
  v38[8] = v28;
  v37[9] = @"playStartPosition";
  [v2 playbackStartOffset];
  v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[9] = v27;
  v37[10] = @"playback_type";
  uint64_t v10 = [v2 playbackType];
  objc_super v11 = (void *)v10;
  if (v10) {
    CFStringRef v12 = (const __CFString *)v10;
  }
  else {
    CFStringRef v12 = &stru_10056A8A0;
  }
  v38[10] = v12;
  v37[11] = @"startup_time";
  [v2 startupTime];
  v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[11] = v26;
  v37[12] = @"playDuration";
  [v2 durationWatched];
  v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[12] = v25;
  v37[13] = @"number_of_dropped_video_frames";
  v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 numberOfDroppedVideoFrames]);
  v38[13] = v24;
  v37[14] = @"number_of_stalls";
  v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 numberOfStalls]);
  v38[14] = v23;
  v37[15] = @"segments_downloaded_duration";
  [v2 segmentsDownloadedDuration];
  v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[15] = v22;
  v37[16] = @"download_overdue";
  v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 downloadOverdue]);
  v38[16] = v13;
  v37[17] = @"observed_bitrate_stdev";
  [v2 observedBitrateStandardDeviation];
  [v2 observedBitrateStandardDeviation];
  v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[17] = v14;
  v37[18] = @"observed_bitrate_max";
  [v2 observedMaxBitrate];
  [v2 observedMaxBitrate];
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[18] = v15;
  v37[19] = @"observed_bitrate_min";
  [v2 observedMinBitrate];
  [v2 observedMinBitrate];
  v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[19] = v16;
  v37[20] = @"switch_bitrate";
  [v2 switchBitrate];
  [v2 switchBitrate];
  v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[20] = v17;
  v37[21] = @"indicated_bitrate";
  [v2 indicatedBitrate];
  [v2 indicatedBitrate];
  v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[21] = v18;
  v37[22] = @"observed_bitrate";
  [v2 observedBitrate];
  [v2 observedBitrate];
  v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v38[22] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:23];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 dataSource];
    CFStringRef v7 = [(MTPlayMetricsEvent *)self dataSource];
    unsigned int v8 = [v6 isEqual:v7];

    if (v8)
    {
      CFStringRef v9 = [v5 _data];
      uint64_t v10 = [(MTPlayMetricsEvent *)self _data];
      unsigned __int8 v11 = [v9 isEqualToDictionary:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(MTPlayMetricsEvent *)self dataSource];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(MTPlayMetricsEvent *)self _data];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = [(MTPlayMetricsEvent *)self accessLogEvent];
  unint64_t v4 = [v3 playbackStartDate];
  id v5 = [(MTPlayMetricsEvent *)self accessLogEvent];
  [v5 playbackStartOffset];
  uint64_t v7 = v6;
  unsigned int v8 = [(MTPlayMetricsEvent *)self accessLogEvent];
  [v8 durationWatched];
  uint64_t v10 = +[NSString stringWithFormat:@"%@ @ %@: from %f for %f seconds", @"play_stats", v4, v7, v9];

  return v10;
}

- (AVPlayerItemAccessLogEvent)accessLogEvent
{
  return self->_accessLogEvent;
}

- (void)setAccessLogEvent:(id)a3
{
}

- (MTEpisodeMetricDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void)setRecorded:(BOOL)a3
{
  self->_BOOL recorded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_accessLogEvent, 0);
}

@end