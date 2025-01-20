@interface PTCinematographyNetworkUncertaintySignal
- (PTCinematographyNetworkUncertaintySignal)initWithModelDictionary:(id)a3;
- (float)_timerUncertaintyForPayload:(id)a3;
- (float)timerSecondsDivisor;
- (void)writePayload:(id)a3 toStream:(id)a4;
@end

@implementation PTCinematographyNetworkUncertaintySignal

- (PTCinematographyNetworkUncertaintySignal)initWithModelDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyNetworkUncertaintySignal;
  v5 = [(PTCinematographyNetworkSignal *)&v10 initWithModelDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"params"];
    v7 = [v6 objectForKeyedSubscript:@"timer_seconds_divisor"];
    [v7 floatValue];
    v5->_timerSecondsDivisor = v8;
  }
  return v5;
}

- (void)writePayload:(id)a3 toStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PTCinematographyNetworkSignal *)self checkSignalForStream:v7])
  {
    [(PTCinematographyNetworkUncertaintySignal *)self _timerUncertaintyForPayload:v6];
    objc_msgSend(v7, "writeFloat:");
  }
  else
  {
    float v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyNetworkNamedSignal writePayload:toStream:](v8);
    }
  }
}

- (float)_timerUncertaintyForPayload:(id)a3
{
  id v4 = a3;
  v5 = [v4 detection];
  id v6 = v5;
  if (v5)
  {
    [v5 time];

    float v7 = 0.0;
    if ((BYTE4(v18) & 0x1D) == 1)
    {
      memset(&v16, 0, sizeof(v16));
      if (v4) {
        [v4 time];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      float v8 = [v4 detection];
      v9 = v8;
      if (v8) {
        [v8 time];
      }
      else {
        memset(&rhs, 0, sizeof(rhs));
      }
      CMTimeSubtract(&v16, &lhs, &rhs);

      CMTime v13 = v16;
      double Seconds = CMTimeGetSeconds(&v13);
      if (Seconds >= 0.0)
      {
        float timerSecondsDivisor = self->_timerSecondsDivisor;
        if (timerSecondsDivisor > 0.0) {
          float v7 = Seconds / timerSecondsDivisor;
        }
      }
    }
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;

    float v7 = 0.0;
  }

  return v7;
}

- (float)timerSecondsDivisor
{
  return self->_timerSecondsDivisor;
}

@end