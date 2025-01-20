@interface NRAnalyticsCmpnLinkQuickRelay
- (void)reset;
- (void)submit;
@end

@implementation NRAnalyticsCmpnLinkQuickRelay

- (void)reset
{
  if (self)
  {
    self->_idsSessionInvitationCollisionCount = 0;
    self->_idsSessionSendInvitationStart = 0;
    self->_idsSessionSendInvitationEnd = 0;
    self->_idsSessionReceiveInvitationStart = 0;
    self->_idsSessionReceiveInvitationEnd = 0;
    self->_idsSessionStart = 0;
    self->_idsSessionEnd = 0;
    self->super._ikeClassCAttempts = 0;
    self->super._ikeClassDAttempts = 0;
    self->super._ikeClassDSetupStart = 0;
    self->super._ikeClassDSetupEnd = 0;
    self->super._ikeClassCSetupStart = 0;
    self->super._ikeClassCSetupEnd = 0;
    self->_ikeClassDKeepAliveStart = 0;
    self->_ikeClassCKeepAliveStart = 0;
    self->_ikeClassDKeepAliveEnd = 0;
    self->_ikeClassCKeepAliveEnd = 0;
  }
}

- (void)submit
{
  sub_10012D3F4((uint64_t)self, v2, v3, v4);
  if (self)
  {
    unint64_t idsSessionSendInvitationStart = self->_idsSessionSendInvitationStart;
    unint64_t idsSessionSendInvitationEnd = self->_idsSessionSendInvitationEnd;
    double v10 = 0.0;
    if (idsSessionSendInvitationStart) {
      BOOL v11 = idsSessionSendInvitationEnd > idsSessionSendInvitationStart;
    }
    else {
      BOOL v11 = 0;
    }
    double v12 = 0.0;
    if (v11)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v6) = dword_1001F4BC0;
      LODWORD(v7) = *(_DWORD *)algn_1001F4BC4;
      double v7 = (double)*(unint64_t *)&v7;
      double v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      double v12 = (double)(idsSessionSendInvitationEnd - idsSessionSendInvitationStart) * v6 / v7;
    }
    unint64_t idsSessionReceiveInvitationStart = self->_idsSessionReceiveInvitationStart;
    unint64_t idsSessionReceiveInvitationEnd = self->_idsSessionReceiveInvitationEnd;
    if (idsSessionReceiveInvitationStart) {
      BOOL v15 = idsSessionReceiveInvitationEnd > idsSessionReceiveInvitationStart;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v6) = dword_1001F4BC0;
      LODWORD(v7) = *(_DWORD *)algn_1001F4BC4;
      double v7 = (double)*(unint64_t *)&v7;
      double v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      double v10 = (double)(idsSessionReceiveInvitationEnd - idsSessionReceiveInvitationStart) * v6 / v7;
    }
    unint64_t idsSessionStart = self->_idsSessionStart;
    unint64_t idsSessionEnd = self->_idsSessionEnd;
    double v18 = 0.0;
    if (idsSessionStart) {
      BOOL v19 = idsSessionEnd > idsSessionStart;
    }
    else {
      BOOL v19 = 0;
    }
    double v20 = 0.0;
    if (v19)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v6) = dword_1001F4BC0;
      LODWORD(v7) = *(_DWORD *)algn_1001F4BC4;
      double v7 = (double)*(unint64_t *)&v7;
      double v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      double v20 = (double)(idsSessionEnd - idsSessionStart) * v6 / v7;
    }
    unint64_t ikeClassDKeepAliveStart = self->_ikeClassDKeepAliveStart;
    unint64_t ikeClassDKeepAliveEnd = self->_ikeClassDKeepAliveEnd;
    if (ikeClassDKeepAliveStart) {
      BOOL v23 = ikeClassDKeepAliveEnd > ikeClassDKeepAliveStart;
    }
    else {
      BOOL v23 = 0;
    }
    if (v23)
    {
      if (qword_1001F4BB8 != -1) {
        dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
      }
      LODWORD(v6) = dword_1001F4BC0;
      LODWORD(v7) = *(_DWORD *)algn_1001F4BC4;
      double v7 = (double)*(unint64_t *)&v7;
      double v6 = 0.000000001 * (double)*(unint64_t *)&v6;
      double v18 = (double)(ikeClassDKeepAliveEnd - ikeClassDKeepAliveStart) * v6 / v7;
    }
    unint64_t ikeClassCKeepAliveStart = self->_ikeClassCKeepAliveStart;
    double v25 = 0.0;
    if (ikeClassCKeepAliveStart)
    {
      unint64_t ikeClassCKeepAliveEnd = self->_ikeClassCKeepAliveEnd;
      unint64_t v27 = ikeClassCKeepAliveEnd - ikeClassCKeepAliveStart;
      if (ikeClassCKeepAliveEnd > ikeClassCKeepAliveStart)
      {
        if (qword_1001F4BB8 != -1) {
          dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
        }
        LODWORD(v6) = dword_1001F4BC0;
        LODWORD(v7) = *(_DWORD *)algn_1001F4BC4;
        double v25 = (double)v27 * (0.000000001 * (double)*(unint64_t *)&v6) / (double)*(unint64_t *)&v7;
      }
    }
    if (self->_idsSessionInvitationFailed)
    {
      v28 = +[NSNumber numberWithDouble:round(v12 * 1000.0) * 0.001];
      [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v28 forKeyedSubscript:@"idsSessionInvitationTimeToFailureInSec"];

      [(NSMutableDictionary *)self->super.super._eventDictionary setObject:&off_1001D4DD8 forKeyedSubscript:@"idsSessionSendInvitationDurationInSec"];
      goto LABEL_45;
    }
    eventDictionary = self->super.super._eventDictionary;
  }
  else
  {
    eventDictionary = 0;
    double v25 = 0.0;
    double v18 = 0.0;
    double v20 = 0.0;
    double v10 = 0.0;
    double v12 = 0.0;
  }
  [(NSMutableDictionary *)eventDictionary setObject:&off_1001D4DD8 forKeyedSubscript:@"idsSessionInvitationTimeToFailureInSec"];
  v30 = +[NSNumber numberWithDouble:round(v12 * 1000.0) * 0.001];
  if (self) {
    v31 = self->super.super._eventDictionary;
  }
  else {
    v31 = 0;
  }
  [(NSMutableDictionary *)v31 setObject:v30 forKeyedSubscript:@"idsSessionSendInvitationDurationInSec"];

LABEL_45:
  v32 = +[NSNumber numberWithDouble:round(v10 * 1000.0) * 0.001];
  if (self) {
    v33 = self->super.super._eventDictionary;
  }
  else {
    v33 = 0;
  }
  [(NSMutableDictionary *)v33 setObject:v32 forKeyedSubscript:@"idsSessionReceiveInvitationDurationInSec"];

  v34 = +[NSNumber numberWithDouble:round(v20 * 1000.0) * 0.001];
  if (self) {
    v35 = self->super.super._eventDictionary;
  }
  else {
    v35 = 0;
  }
  [(NSMutableDictionary *)v35 setObject:v34 forKeyedSubscript:@"idsSessionDurationInSec"];

  v36 = +[NSNumber numberWithDouble:round(v18 * 1000.0) * 0.001];
  if (self) {
    v37 = self->super.super._eventDictionary;
  }
  else {
    v37 = 0;
  }
  [(NSMutableDictionary *)v37 setObject:v36 forKeyedSubscript:@"ikeClassDKeepAliveDurationInSec"];

  v38 = +[NSNumber numberWithDouble:round(v25 * 1000.0) * 0.001];
  if (self)
  {
    [(NSMutableDictionary *)self->super.super._eventDictionary setObject:v38 forKeyedSubscript:@"ikeClassCKeepAliveDurationInSec"];

    if (!self->_idsSessionEndedReason) {
      goto LABEL_55;
    }
    v38 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    v39 = self->super.super._eventDictionary;
    CFStringRef v40 = @"idsSessionEndedReason";
  }
  else
  {
    CFStringRef v40 = @"ikeClassCKeepAliveDurationInSec";
    v39 = 0;
  }
  [(NSMutableDictionary *)v39 setObject:v38 forKeyedSubscript:v40];

LABEL_55:

  sub_10012D730((uint64_t)self, @"com.apple.networkrelay.analytics.cmpnLinkQuickRelay");
}

@end