@interface APLogVideoAnalyticsEventRequester
- (APLogVideoAnalyticsEventRequester)initWithMetric:(id)a3 internalContent:(id)a4 andContext:(id)a5 clientInfo:(id)a6 idAccount:(id)a7;
- (BOOL)isAllowedEmptyResponse;
- (Class)responseClass;
- (double)position;
- (double)videoVisibility;
- (double)visibilityTimestamp;
- (double)volume;
- (id)protoBuffer;
- (int)duration;
- (int)videoState;
- (int64_t)visiblePercent;
- (void)setDuration:(int)a3;
- (void)setPosition:(double)a3;
- (void)setVideoState:(int)a3;
- (void)setVideoVisibility:(double)a3;
- (void)setVisibilityTimestamp:(double)a3;
- (void)setVisiblePercent:(int64_t)a3;
- (void)setVolume:(double)a3;
@end

@implementation APLogVideoAnalyticsEventRequester

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAllowedEmptyResponse
{
  return 1;
}

- (APLogVideoAnalyticsEventRequester)initWithMetric:(id)a3 internalContent:(id)a4 andContext:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v83.receiver = self;
  v83.super_class = (Class)APLogVideoAnalyticsEventRequester;
  v14 = [(APLegacyMetricRequester *)&v83 initWithMetric:v12 internalContent:v13 andContext:a5 clientInfo:a6 idAccount:a7];
  if (!v14) {
    goto LABEL_66;
  }
  v15 = [v13 transientContent];
  unsigned int v16 = [v15 videoUnloadedSent];

  if (!v16)
  {
    v22 = [(APLegacyMetricRequester *)v14 metric];
    v23 = metricPropertyValue(v22, (void *)0x12);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [(APLegacyMetricRequester *)v14 metric];
      v25 = metricPropertyValue(v24, (void *)0x12);
      v14->_visiblePercent = (int)[v25 intValue];
    }
    else
    {
      v14->_visiblePercent = -1;
    }

    v26 = [(APLegacyMetricRequester *)v14 metric];
    v27 = metricPropertyValue(v26, (void *)8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [(APLegacyMetricRequester *)v14 metric];
      v29 = metricPropertyValue(v28, (void *)8);
      p_duration = &v14->_duration;
      v14->_duration = [v29 intValue];
    }
    else
    {
      p_duration = &v14->_duration;
      v14->_duration = -1;
    }

    v31 = [(APLegacyMetricRequester *)v14 metric];
    v32 = metricPropertyValue(v31, (void *)0x17);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [(APLegacyMetricRequester *)v14 metric];
      v34 = metricPropertyValue(v33, (void *)0x17);
      int v82 = [v34 intValue];
    }
    else
    {
      int v82 = -1;
    }

    v35 = [(APLegacyMetricRequester *)v14 metric];
    v36 = metricPropertyValue(v35, (void *)0x16);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [(APLegacyMetricRequester *)v14 metric];
      v38 = metricPropertyValue(v37, (void *)0x16);
      [v38 doubleValue];
      p_position = &v14->_position;
      v14->_position = v40;
    }
    else
    {
      p_position = &v14->_position;
      v14->_position = -1.0;
    }

    v41 = [(APLegacyMetricRequester *)v14 metric];
    v42 = metricPropertyValue(v41, (void *)0x2C);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [(APLegacyMetricRequester *)v14 metric];
      v44 = metricPropertyValue(v43, (void *)0x2C);
      [v44 doubleValue];
      p_volume = &v14->_volume;
      v14->_volume = v46;
    }
    else
    {
      p_volume = &v14->_volume;
      v14->_volume = -1.0;
    }

    v14->_videoState = -1;
    v47 = [(APLegacyMetricRequester *)v14 metric];
    uint64_t v48 = (uint64_t)[v47 metric];

    if (v48 > 2502)
    {
      if (v48 == 2503)
      {
        int v50 = 16;
LABEL_64:
        v14->_videoState = v50;
      }
      else
      {
        if (v48 != 77003)
        {
LABEL_31:
          v17 = APLogForCategory();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            goto LABEL_6;
          }
          uint64_t v51 = objc_opt_class();
          v19 = [(APLegacyMetricRequester *)v14 metric];
          id v52 = [v19 metric];
          *(_DWORD *)buf = 138543618;
          uint64_t v85 = v51;
          __int16 v86 = 2048;
          id v87 = v52;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid metric type for %{public}@: %ld. Not sending legacy metric.", buf, 0x16u);
          goto LABEL_5;
        }
        v14->_videoState = 1;
        [v13 videoUnloaded];
      }
    }
    else
    {
      switch(v48)
      {
        case 1600:
          v14->_videoState = 0;
          v49 = [(APLegacyMetricRequester *)v14 internalContent];
          [v49 videoLoaded:(double)*p_duration];

          break;
        case 1601:
          goto LABEL_31;
        case 1602:
          v53 = [(APLegacyMetricRequester *)v14 internalContent];
          v54 = [v53 transientContent];
          unsigned __int8 v55 = [v54 playbackInProgress];

          v56 = [(APLegacyMetricRequester *)v14 internalContent];
          double v57 = *p_position;
          v58 = [(APLegacyMetricRequester *)v14 metric];
          [v56 videoStateChanged:[v58 metric] fromMetric:v57];

          if (v55) {
            goto LABEL_7;
          }
          v59 = [(APLegacyMetricRequester *)v14 internalContent];
          v60 = [v59 transientContent];
          [v60 lastPosition];
          double v62 = v61;

          if (v62 <= 0.0) {
            goto LABEL_7;
          }
          int v50 = 5;
          goto LABEL_64;
        case 1603:
          v63 = [(APLegacyMetricRequester *)v14 internalContent];
          double v64 = *p_position;
          v65 = [(APLegacyMetricRequester *)v14 metric];
          [v63 videoStateChanged:[v65 metric] fromMetric:v64];

          int v50 = 4;
          goto LABEL_64;
        case 1604:
          v66 = [(APLegacyMetricRequester *)v14 internalContent];
          double v67 = *p_position;
          v68 = [(APLegacyMetricRequester *)v14 metric];
          [v66 videoStateChanged:[v68 metric] fromMetric:v67];

          int v50 = 6;
          goto LABEL_64;
        case 1605:
          v69 = [(APLegacyMetricRequester *)v14 internalContent];
          v70 = [v69 transientContent];
          [v70 volume];
          double v72 = v71;

          if (v72 > 0.0 && (double v73 = *p_volume, *p_volume <= 0.0) || v72 == -1.0 && (double v73 = *p_volume, *p_volume <= 0.0))
          {
            int v74 = 7;
            goto LABEL_55;
          }
          if (v72 == 0.0 && (double v73 = *p_volume, *p_volume > 0.0)
            || (double v73 = -1.0, v72 == -1.0) && (double v73 = *p_volume, *p_volume > 0.0))
          {
            int v74 = 8;
LABEL_55:
            v14->_videoState = v74;
          }
          v77 = [(APLegacyMetricRequester *)v14 internalContent];
          double v78 = *p_position;
          v79 = [(APLegacyMetricRequester *)v14 metric];
          [v77 videoStateChanged:[v79 metric] fromMetric:v78];

          v80 = [(APLegacyMetricRequester *)v14 internalContent];
          [v80 volumeChanged:*p_volume];

          if (v14->_videoState < 0) {
            goto LABEL_7;
          }
          break;
        case 1606:
          int v50 = 9;
          goto LABEL_64;
        case 1607:
          int v50 = 10;
          goto LABEL_64;
        case 1608:
          int v50 = 11;
          goto LABEL_64;
        case 1609:
          v75 = [(APLegacyMetricRequester *)v14 internalContent];
          v76 = [(APLegacyMetricRequester *)v14 metric];
          [v75 videoStateChanged:objc_msgSend(v76, "metric") fromMetric:(double)v82 / 100.0];

          if (v82)
          {
            if ((v82 - 25) > 0x18)
            {
              if ((v82 - 50) > 0x18)
              {
                if ((v82 - 75) > 0x18) {
                  int v50 = 3;
                }
                else {
                  int v50 = 14;
                }
              }
              else
              {
                int v50 = 13;
              }
            }
            else
            {
              int v50 = 12;
            }
          }
          else
          {
            int v50 = 2;
          }
          goto LABEL_64;
        default:
          if (v48 != 1406) {
            goto LABEL_31;
          }
          int v50 = 15;
          goto LABEL_64;
      }
    }
    [v13 incrementVideoEventSequence];
LABEL_66:
    v21 = v14;
    goto LABEL_67;
  }
  v17 = APLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    id v18 = [v12 metric];
    v19 = [v13 content];
    v20 = [v19 identifier];
    *(_DWORD *)buf = 134218242;
    uint64_t v85 = (uint64_t)v18;
    __int16 v86 = 2114;
    id v87 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Attempting to send LogVideoAnalytic for metric %ld for content %{public}@, but Unloaded has already been sent.", buf, 0x16u);

LABEL_5:
  }
LABEL_6:

LABEL_7:
  v21 = 0;
LABEL_67:

  return v21;
}

- (id)protoBuffer
{
  v3 = objc_alloc_init(APPBLogVideoAnalyticsEventRequest);
  [(APPBLogVideoAnalyticsEventRequest *)v3 setVideoState:[(APLogVideoAnalyticsEventRequester *)self videoState]];
  v4 = [(APLegacyMetricRequester *)self logMetadata];
  [(APPBLogVideoAnalyticsEventRequest *)v3 setMetaData:v4];

  v5 = [(APServerRequester *)self bundleID];
  [(APPBLogVideoAnalyticsEventRequest *)v3 setBundleID:v5];

  v6 = [(APLegacyMetricRequester *)self internalContent];
  v7 = [v6 transientContent];
  [v7 accumulatedPlaybackTime];
  -[APPBLogVideoAnalyticsEventRequest setCurrentPlaybackTime:](v3, "setCurrentPlaybackTime:");

  v8 = [(APLegacyMetricRequester *)self internalContent];
  v9 = [v8 transientContent];
  [v9 duration];
  -[APPBLogVideoAnalyticsEventRequest setTotalDuration:](v3, "setTotalDuration:");

  v10 = [(APLegacyMetricRequester *)self metric];
  id v11 = [v10 metric];

  if (v11 == (id)1406)
  {
    [(APLogVideoAnalyticsEventRequester *)self videoVisibility];
    -[APPBLogVideoAnalyticsEventRequest setVisiblePercentage:](v3, "setVisiblePercentage:");
    [(APLogVideoAnalyticsEventRequester *)self visibilityTimestamp];
    -[APPBLogVideoAnalyticsEventRequest setTimestamp:](v3, "setTimestamp:");
  }
  else
  {
    [(APPBLogVideoAnalyticsEventRequest *)v3 setVisiblePercentage:(double)[(APLogVideoAnalyticsEventRequester *)self visiblePercent] / 100.0];
    id v12 = +[NSDate date];
    [v12 timeIntervalSince1970];
    -[APPBLogVideoAnalyticsEventRequest setTimestamp:](v3, "setTimestamp:");
  }
  id v13 = [(APLegacyMetricRequester *)self internalContent];
  v14 = [v13 transientContent];
  -[APPBLogVideoAnalyticsEventRequest setEventSequence:](v3, "setEventSequence:", [v14 videoEventSequence]);

  [(APLogVideoAnalyticsEventRequester *)self volume];
  if (v15 >= 0.0)
  {
    [(APLogVideoAnalyticsEventRequester *)self volume];
    *(float *)&double v16 = v16;
    [(APPBLogVideoAnalyticsEventRequest *)v3 setVolume:v16];
  }

  return v3;
}

- (double)videoVisibility
{
  return self->_videoVisibility;
}

- (void)setVideoVisibility:(double)a3
{
  self->_videoVisibility = a3;
}

- (double)visibilityTimestamp
{
  return self->_visibilityTimestamp;
}

- (void)setVisibilityTimestamp:(double)a3
{
  self->_visibilityTimestamp = a3;
}

- (int)videoState
{
  return self->_videoState;
}

- (void)setVideoState:(int)a3
{
  self->_videoState = a3;
}

- (int)duration
{
  return self->_duration;
}

- (void)setDuration:(int)a3
{
  self->_duration = a3;
}

- (double)position
{
  return self->_position;
}

- (void)setPosition:(double)a3
{
  self->_position = a3;
}

- (int64_t)visiblePercent
{
  return self->_visiblePercent;
}

- (void)setVisiblePercent:(int64_t)a3
{
  self->_visiblePercent = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

@end