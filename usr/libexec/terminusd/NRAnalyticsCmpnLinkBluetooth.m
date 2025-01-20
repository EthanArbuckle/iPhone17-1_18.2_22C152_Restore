@interface NRAnalyticsCmpnLinkBluetooth
- (void)submit;
@end

@implementation NRAnalyticsCmpnLinkBluetooth

- (void)submit
{
  sub_10012D3F4((uint64_t)self, v2, v3, v4);
  double v8 = 0.0;
  if (self)
  {
    unint64_t ikePairingSessionSetupStart = self->_ikePairingSessionSetupStart;
    unint64_t ikePairingSessionSetupEnd = self->_ikePairingSessionSetupEnd;
    if (ikePairingSessionSetupStart && ikePairingSessionSetupEnd > ikePairingSessionSetupStart)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v6) = dword_1001F4BC0;
      LODWORD(v7) = *(_DWORD *)algn_1001F4BC4;
      double v8 = (double)v6 * 0.000001 * (double)(ikePairingSessionSetupEnd - ikePairingSessionSetupStart) / (double)v7;
    }
  }
  v12 = +[NSNumber numberWithDouble:round(v8) * 0.001];
  if (!self)
  {
    CFStringRef v22 = @"ikePairingSessionSetupTimeInSec";
    eventDictionary = 0;
    goto LABEL_29;
  }
  [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v12 forKeyedSubscript:@"ikePairingSessionSetupTimeInSec"];

  if (self->_ikePairingSessionSetupAttempts)
  {
    v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v13 forKeyedSubscript:@"ikePairingSessionSetupAttempts"];
  }
  if (self->_urgentLoopChecksumError)
  {
    v14 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v14 forKeyedSubscript:@"urgentLoopChecksumError"];
  }
  if (self->_loopChecksumError)
  {
    v15 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v15 forKeyedSubscript:@"loopChecksumError"];
  }
  if (self->_bufferChecksumError)
  {
    v16 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v16 forKeyedSubscript:@"bufferChecksumError"];
  }
  if (self->_preludeChecksumError)
  {
    v17 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v17 forKeyedSubscript:@"preludeChecksumError"];
  }
  if (self->_urgentPreludeChecksumError)
  {
    v18 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v18 forKeyedSubscript:@"urgentPreludeChecksumError"];
  }
  if (self->_preludeTimeoutError)
  {
    v19 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v19 forKeyedSubscript:@"preludeTimeoutError"];
  }
  if (self->_urgentPreludeTimeoutError)
  {
    v20 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v20 forKeyedSubscript:@"urgentPreludeTimeoutError"];
  }
  if (self->_urgentPipeDisconnections)
  {
    v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    eventDictionary = self->super.super._eventDictionary;
    CFStringRef v22 = @"urgentPipeDisconnections";
LABEL_29:
    [(NSMutableDictionary *)eventDictionary setObject:v12 forKeyedSubscript:v22];
  }

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.cmpnLinkBluetooth");
}

@end