@interface RPClipBuffer
- (BOOL)firstSampleReceived;
- (BOOL)getSamplesForDuration:(double)a3 latestSeconds:(double)a4 withOutputArray:(id)a5;
- (BOOL)isVideo;
- (NSMutableArray)bufferArray;
- (RPClipBuffer)init;
- (float)newestSeconds;
- (float)oldestSeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForVideo:(BOOL)a3;
- (opaqueCMFormatDescription)getFormatDescription;
- (unint64_t)getTotalNumberOfSamples;
- (void)addFrameToBuffer:(opaqueCMSampleBuffer *)a3 isKeyFrame:(BOOL)a4;
- (void)flushBuffer;
- (void)setBufferArray:(id)a3;
- (void)setFirstSampleReceived:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setNewestSeconds:(float)a3;
- (void)setOldestSeconds:(float)a3;
@end

@implementation RPClipBuffer

- (RPClipBuffer)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPClipBuffer;
  v2 = [(RPClipBuffer *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    bufferArray = v2->_bufferArray;
    v2->_bufferArray = v3;

    v2->_oldestSeconds = 0.0;
    v2->_newestSeconds = 0.0;
    v2->_firstSampleReceived = 0;
  }
  return v2;
}

- (id)initForVideo:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RPClipBuffer;
  v4 = [(RPClipBuffer *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    bufferArray = v4->_bufferArray;
    v4->_bufferArray = v5;

    v4->_isVideo = a3;
  }
  return v4;
}

- (void)addFrameToBuffer:(opaqueCMSampleBuffer *)a3 isKeyFrame:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    memset(&v23, 0, sizeof(v23));
    CMSampleBufferGetPresentationTimeStamp(&v23, a3);
    float v7 = (float)v23.value / (float)v23.timescale;
    if (self->_firstSampleReceived)
    {
      if (v7 <= self->_newestSeconds)
      {
        if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          double newestSeconds = self->_newestSeconds;
          *(_DWORD *)buf = 136446978;
          v25 = "-[RPClipBuffer addFrameToBuffer:isKeyFrame:]";
          __int16 v26 = 1024;
          int v27 = 80;
          __int16 v28 = 2048;
          double v29 = v7;
          __int16 v30 = 2048;
          double v31 = newestSeconds;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d discarding %f older than %f", buf, 0x26u);
        }
        return;
      }
    }
    else
    {
      self->_firstSampleReceived = 1;
      self->_double oldestSeconds = v7;
    }
    self->_double newestSeconds = v7;
    v9 = objc_alloc_init(RPClipSample);
    CFRetain(a3);
    [(RPClipSample *)v9 setSampleBuffer:a3];
    *(float *)&double v10 = v7;
    [(RPClipSample *)v9 setSeconds:v10];
    [(RPClipSample *)v9 setIsKeyFrame:v4];
    [(NSMutableArray *)self->_bufferArray addObject:v9];
    if ((float)(self->_newestSeconds - self->_oldestSeconds) <= 15.0)
    {
      double v12 = 0.0;
      if (dword_100099BB8)
      {
LABEL_30:

        return;
      }
    }
    else
    {
      BOOL v11 = 0;
      double v12 = 0.0;
      do
      {
        v13 = [(NSMutableArray *)self->_bufferArray objectAtIndex:v11];
        v14 = v13;
        if (self->_isVideo && [v13 isKeyFrame])
        {
          if (v12 != 0.0)
          {
            CFRelease([*(id *)&v12 sampleBuffer]);
            [(NSMutableArray *)self->_bufferArray removeObjectAtIndex:0];
          }
          id v15 = v14;

          double v12 = *(double *)&v15;
        }
        else
        {
          CFRelease([v14 sampleBuffer]);
          [(NSMutableArray *)self->_bufferArray removeObjectAtIndex:v11];
        }
        BOOL v11 = *(void *)&v12 != 0;
        v16 = [(NSMutableArray *)self->_bufferArray objectAtIndex:v11];
        [v16 seconds];
        self->_double oldestSeconds = v17;
      }
      while ((float)(self->_newestSeconds - self->_oldestSeconds) > 15.0);
      int v18 = dword_100099BB8;
      if (v12 != 0.0 && !dword_100099BB8)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)&v12 seconds];
          double oldestSeconds = self->_oldestSeconds;
          *(_DWORD *)buf = 136447234;
          v25 = "-[RPClipBuffer addFrameToBuffer:isKeyFrame:]";
          __int16 v26 = 1024;
          int v27 = 117;
          __int16 v28 = 2048;
          double v29 = v12;
          __int16 v30 = 2048;
          double v31 = v20;
          __int16 v32 = 2048;
          *(double *)v33 = oldestSeconds;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d keeping key frame:%p with time:%f outside of expected buffer start time:%f", buf, 0x30u);
        }
        int v18 = dword_100099BB8;
      }
      if (v18) {
        goto LABEL_30;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double v21 = COERCE_DOUBLE([(NSMutableArray *)self->_bufferArray count]);
      double v22 = (float)(self->_newestSeconds - self->_oldestSeconds);
      *(_DWORD *)buf = 136447490;
      v25 = "-[RPClipBuffer addFrameToBuffer:isKeyFrame:]";
      __int16 v26 = 1024;
      int v27 = 119;
      __int16 v28 = 2048;
      double v29 = v21;
      __int16 v30 = 2048;
      double v31 = v22;
      __int16 v32 = 1024;
      LODWORD(v33[0]) = v4;
      WORD2(v33[0]) = 2048;
      *(double *)((char *)v33 + 6) = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d buffer count %lu size %f isKeyFrame %d current time %f", buf, 0x36u);
    }
    goto LABEL_30;
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004EF2C();
  }
}

- (opaqueCMFormatDescription)getFormatDescription
{
  v2 = [(NSMutableArray *)self->_bufferArray objectAtIndex:0];
  v3 = v2;
  if (v2) {
    FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)[v2 sampleBuffer]);
  }
  else {
    FormatDescription = 0;
  }

  return FormatDescription;
}

- (BOOL)getSamplesForDuration:(double)a3 latestSeconds:(double)a4 withOutputArray:(id)a5
{
  id v8 = a5;
  float v9 = a4 - a3;
  if ([(NSMutableArray *)self->_bufferArray count])
  {
    double v10 = [(NSMutableArray *)self->_bufferArray objectAtIndex:0];
    uint64_t v11 = [(NSMutableArray *)self->_bufferArray objectAtIndex:(char *)[(NSMutableArray *)self->_bufferArray count] - 1];
    double v12 = (void *)v11;
    if (v10)
    {
      BOOL v13 = !v11 || dword_100099BB8 > 1;
      if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        [v12 seconds];
        double v15 = v14;
        [v10 seconds];
        double v17 = v16;
        id v18 = [(NSMutableArray *)self->_bufferArray count];
        *(_DWORD *)buf = 136447746;
        *(void *)&uint8_t buf[4] = "-[RPClipBuffer getSamplesForDuration:latestSeconds:withOutputArray:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 141;
        *(_WORD *)&buf[18] = 2048;
        *(double *)&buf[20] = a4;
        __int16 v42 = 2048;
        double v43 = v9;
        __int16 v44 = 2048;
        double v45 = v15;
        __int16 v46 = 2048;
        double v47 = v17;
        __int16 v48 = 2048;
        id v49 = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d current %f start %f newest %f oldest %f count %lu", buf, 0x44u);
      }
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v19 = self->_bufferArray;
  id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v20)
  {
    id v21 = v20;
    double v22 = 0;
    char v23 = 0;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v19);
        }
        __int16 v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        [v26 seconds];
        if (v27 <= v9)
        {
          if ([v26 isKeyFrame])
          {
            id v28 = v26;

            if (dword_100099BB8 <= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              [v28 seconds];
              *(_DWORD *)buf = 136446722;
              *(void *)&uint8_t buf[4] = "-[RPClipBuffer getSamplesForDuration:latestSeconds:withOutputArray:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 160;
              *(_WORD *)&buf[18] = 2048;
              *(double *)&buf[20] = v29;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d latest idle sample:%f", buf, 0x1Cu);
            }
            double v22 = v28;
          }
        }
        else if ((v23 & 1) != 0 || [v26 isKeyFrame])
        {
          [v8 addObject:[v26 sampleBuffer]];
          char v23 = 1;
        }
        else
        {
          char v23 = 0;
        }
      }
      id v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v21);

    BOOL v30 = 0;
    if (self->_isVideo && v22)
    {
      memset(&v35, 0, sizeof(v35));
      CMSampleBufferGetPresentationTimeStamp(&v35, (CMSampleBufferRef)[v22 sampleBuffer]);
      memset(&v34, 0, sizeof(v34));
      CMTimeMakeWithSeconds(&v34, v9, v35.timescale);
      double v31 = (opaqueCMSampleBuffer *)[v22 sampleBuffer];
      *(CMTime *)buf = v34;
      CMSampleBufferRef v32 = sub_100048F00(v31, (uint64_t)buf);
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "-[RPClipBuffer getSamplesForDuration:latestSeconds:withOutputArray:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 172;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v32;
        __int16 v42 = 2048;
        double v43 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appending first sample %p at timestamp:%f", buf, 0x26u);
      }
      [v8 insertObject:v32 atIndex:0];

      double v22 = 0;
      BOOL v30 = 1;
    }
  }
  else
  {

    BOOL v30 = 0;
    double v22 = 0;
  }

  return v30;
}

- (unint64_t)getTotalNumberOfSamples
{
  return (unint64_t)[(NSMutableArray *)self->_bufferArray count];
}

- (void)flushBuffer
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_bufferArray;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      float v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) sampleBuffer:(void)v9];
        if (v8) {
          CFRelease(v8);
        }
        float v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_bufferArray removeAllObjects];
  self->_double oldestSeconds = 0.0;
  self->_double newestSeconds = 0.0;
  self->_firstSampleReceived = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(RPClipBuffer);
  id v5 = [objc_alloc((Class)NSMutableArray) initWithArray:self->_bufferArray];
  [(RPClipBuffer *)v4 setBufferArray:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(RPClipBuffer *)v4 bufferArray];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        CFRetain([*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) sampleBuffer]);
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  *(float *)&double v11 = self->_oldestSeconds;
  [(RPClipBuffer *)v4 setOldestSeconds:v11];
  *(float *)&double v12 = self->_newestSeconds;
  [(RPClipBuffer *)v4 setNewestSeconds:v12];
  [(RPClipBuffer *)v4 setFirstSampleReceived:self->_firstSampleReceived];
  [(RPClipBuffer *)v4 setIsVideo:self->_isVideo];
  return v4;
}

- (NSMutableArray)bufferArray
{
  return self->_bufferArray;
}

- (void)setBufferArray:(id)a3
{
}

- (float)oldestSeconds
{
  return self->_oldestSeconds;
}

- (void)setOldestSeconds:(float)a3
{
  self->_double oldestSeconds = a3;
}

- (float)newestSeconds
{
  return self->_newestSeconds;
}

- (void)setNewestSeconds:(float)a3
{
  self->_double newestSeconds = a3;
}

- (BOOL)firstSampleReceived
{
  return self->_firstSampleReceived;
}

- (void)setFirstSampleReceived:(BOOL)a3
{
  self->_firstSampleReceived = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (void).cxx_destruct
{
}

@end