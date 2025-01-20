@interface WRM_IdsMetricsController
+ (id)WRM_IdsMetricsControllerSingleton;
- (BOOL)getAnticipiatedTxPerValid;
- (BOOL)getTxPerAnticipatedMovAvgValid;
- (BOOL)getTxPerMovAvgValid;
- (BOOL)getTxPerValid;
- (BOOL)isIDSTransportMetricsGoodEnough:(int)a3 :(BOOL)a4;
- (WRM_IdsMetricsController)init;
- (double)evaluateDLThroughput;
- (double)evaluateULThroughput;
- (double)getAnticipiatedTxPer;
- (double)getTxPer;
- (double)getTxPerAnticipatedMovAvg;
- (double)getTxPerMovAvg;
- (double)mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg;
- (double)mLocalDeliveryMessageDeliveredMessageSizeMovAvg;
- (double)mLocalDeliveryMessageDeliveredMovAvg;
- (double)mLocalDeliveryMessageDeliveredRTTMovAvg;
- (double)mLocalDeliveryMessageReceivedMessageSizeMovAvg;
- (double)mLocalDeliveryMessageReceivedMovAvg;
- (double)mLocalDeliveryMessageSentMovAvg;
- (id)description;
- (int)getAvgRxPDUSize;
- (int)getAvgRxPDUSizeMovAvg;
- (int)getAvgTxPDUSize;
- (int)getAvgTxPDUSizeMovAvg;
- (int)getRTT;
- (int)getRTTMovAvg;
- (int)mMetricsConsiderationPeriod;
- (int)mReportDuration;
- (unint64_t)mLocalDeliveryCumulativeMessageDelivered;
- (unint64_t)mLocalDeliveryCumulativeMessageSent;
- (unint64_t)mLocalDeliveryMessageDelivered;
- (unint64_t)mLocalDeliveryMessageDeliveredDeliveryError;
- (unint64_t)mLocalDeliveryMessageDeliveredMessageSize;
- (unint64_t)mLocalDeliveryMessageDeliveredRTT;
- (unint64_t)mLocalDeliveryMessageReceived;
- (unint64_t)mLocalDeliveryMessageReceivedMessageSize;
- (unint64_t)mLocalDeliveryMessageSent;
- (unint64_t)mLocalDeliveryMessageSentMessageSize;
- (unint64_t)mStreamingReportBytesReceived;
- (unint64_t)mStreamingReportBytesSent;
- (unint64_t)mStreamingReportPacketsReceived;
- (unint64_t)mStreamingReportPacketsSent;
- (void)configureIDSMetricsReporting;
- (void)dealloc;
- (void)handlePeriodicIDSMetrics:(id)a3;
- (void)resetIDSMetrics;
- (void)setMLocalDeliveryCumulativeMessageDelivered:(unint64_t)a3;
- (void)setMLocalDeliveryCumulativeMessageSent:(unint64_t)a3;
- (void)setMLocalDeliveryMessageDelivered:(unint64_t)a3;
- (void)setMLocalDeliveryMessageDeliveredDeliveryError:(unint64_t)a3;
- (void)setMLocalDeliveryMessageDeliveredDeliveryErrorMovAvg:(double)a3;
- (void)setMLocalDeliveryMessageDeliveredMessageSize:(unint64_t)a3;
- (void)setMLocalDeliveryMessageDeliveredMessageSizeMovAvg:(double)a3;
- (void)setMLocalDeliveryMessageDeliveredMovAvg:(double)a3;
- (void)setMLocalDeliveryMessageDeliveredRTT:(unint64_t)a3;
- (void)setMLocalDeliveryMessageDeliveredRTTMovAvg:(double)a3;
- (void)setMLocalDeliveryMessageReceived:(unint64_t)a3;
- (void)setMLocalDeliveryMessageReceivedMessageSize:(unint64_t)a3;
- (void)setMLocalDeliveryMessageReceivedMessageSizeMovAvg:(double)a3;
- (void)setMLocalDeliveryMessageReceivedMovAvg:(double)a3;
- (void)setMLocalDeliveryMessageSent:(unint64_t)a3;
- (void)setMLocalDeliveryMessageSentMessageSize:(unint64_t)a3;
- (void)setMLocalDeliveryMessageSentMovAvg:(double)a3;
- (void)setMMetricsConsiderationPeriod:(int)a3;
- (void)setMReportDuration:(int)a3;
- (void)setMStreamingReportBytesReceived:(unint64_t)a3;
- (void)setMStreamingReportBytesSent:(unint64_t)a3;
- (void)setMStreamingReportPacketsReceived:(unint64_t)a3;
- (void)setMStreamingReportPacketsSent:(unint64_t)a3;
@end

@implementation WRM_IdsMetricsController

- (WRM_IdsMetricsController)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_IdsMetricsController;
  return [(WCM_Controller *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_IdsMetricsController;
  [(WCM_Controller *)&v2 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"IDSMetrics iRAT Manager Controller"];
}

+ (id)WRM_IdsMetricsControllerSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007483C;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027D080 != -1) {
    dispatch_once(&qword_10027D080, block);
  }
  return (id)qword_10027D078;
}

- (void)resetIDSMetrics
{
  +[WCM_Logging logLevel:27 message:@"Resetting IDS  metrics report"];
  [(WRM_IdsMetricsController *)self setMStreamingReportBytesSent:0];
  [(WRM_IdsMetricsController *)self setMStreamingReportPacketsSent:0];
  [(WRM_IdsMetricsController *)self setMStreamingReportBytesReceived:0];
  [(WRM_IdsMetricsController *)self setMStreamingReportPacketsReceived:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageSentMessageSize:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredMessageSize:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredRTT:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageReceivedMessageSize:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageSent:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDelivered:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredDeliveryError:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageReceived:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredMessageSizeMovAvg:0.0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredRTTMovAvg:0.0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageReceivedMessageSizeMovAvg:0.0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageSentMovAvg:0.0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredMovAvg:0.0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredDeliveryErrorMovAvg:0.0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageReceivedMovAvg:0.0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryCumulativeMessageSent:0];
  [(WRM_IdsMetricsController *)self setMLocalDeliveryCumulativeMessageDelivered:0];

  [(WRM_IdsMetricsController *)self setMMetricsConsiderationPeriod:0];
}

- (void)configureIDSMetricsReporting
{
  +[WCM_Logging logLevel:27 message:@"Configuring IDS  metrics report"];
  -[WRM_IdsMetricsController setMReportDuration:](self, "setMReportDuration:", [WRM_HandoverManager WRM_HandoverManagerSingleton].getiRATConfigController.idsPeriodicReportInterval);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    id v5 = [[+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton") getiRATClientFromList:4];
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_uint64(v4, "PeriodRptInval", [(WRM_IdsMetricsController *)self mReportDuration]);
      [v6 sendMessage:1103 withArgs:v4];
      CFStringRef v7 = @"Sending IDS  metrics Configure request";
    }
    else
    {
      CFStringRef v7 = @"Not sending IDS  metrics Configure request, IDS not registered";
    }
    +[WCM_Logging logLevel:27 message:v7];
    xpc_release(v4);
  }
}

- (void)handlePeriodicIDSMetrics:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  +[WCM_Logging logLevel:18 message:@"Periodic IDS metrics received from IDS Controller "];
  if (value)
  {
    if (xpc_dictionary_get_value(value, "StrmBytesSnt")) {
      [(WRM_IdsMetricsController *)self setMStreamingReportBytesSent:xpc_dictionary_get_uint64(value, "StrmBytesSnt")];
    }
    if (xpc_dictionary_get_value(value, "StrmPktsSnt")) {
      [(WRM_IdsMetricsController *)self setMStreamingReportPacketsSent:xpc_dictionary_get_uint64(value, "StrmPktsSnt")];
    }
    if (xpc_dictionary_get_value(value, "StrmBytesRcvd")) {
      [(WRM_IdsMetricsController *)self setMStreamingReportBytesReceived:xpc_dictionary_get_uint64(value, "StrmBytesRcvd")];
    }
    if (xpc_dictionary_get_value(value, "StrmPktRcvd")) {
      [(WRM_IdsMetricsController *)self setMStreamingReportPacketsReceived:xpc_dictionary_get_uint64(value, "StrmPktRcvd")];
    }
    if (xpc_dictionary_get_value(value, "LocMsgSntSz")) {
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageSentMessageSize:xpc_dictionary_get_uint64(value, "LocMsgSntSz")];
    }
    if (xpc_dictionary_get_value(value, "DeliveredMsgSz"))
    {
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredMessageSize:xpc_dictionary_get_uint64(value, "DeliveredMsgSz")];
      [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredMessageSizeMovAvg];
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredMessageSizeMovAvg:((double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredMessageSize]+ v5 * 11.0)/ 12.0];
    }
    if (xpc_dictionary_get_value(value, "LocMsgDeliveredRTT"))
    {
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredRTT:xpc_dictionary_get_uint64(value, "LocMsgDeliveredRTT")];
      [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredRTTMovAvg];
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredRTTMovAvg:((double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredRTT]+ v6 * 11.0)/ 12.0];
    }
    if (xpc_dictionary_get_value(value, "LocMsgRcvdMgSz"))
    {
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageReceivedMessageSize:xpc_dictionary_get_uint64(value, "LocMsgRcvdMgSz")];
      [(WRM_IdsMetricsController *)self mLocalDeliveryMessageReceivedMessageSizeMovAvg];
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageReceivedMessageSizeMovAvg:((double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageReceivedMessageSize]+ v7 * 11.0)/ 12.0];
    }
    if (xpc_dictionary_get_value(value, "LocMsgSnt"))
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(value, "LocMsgSnt");
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageSent:uint64];
      [(WRM_IdsMetricsController *)self setMLocalDeliveryCumulativeMessageSent:(char *)[(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageSent]+ uint64];
      [(WRM_IdsMetricsController *)self mLocalDeliveryMessageSentMovAvg];
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageSentMovAvg:((double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageSent] + v9 * 11.0)/ 12.0];
      [(WRM_IdsMetricsController *)self setMMetricsConsiderationPeriod:[(WRM_IdsMetricsController *)self mMetricsConsiderationPeriod] + 1];
      [(WRM_IdsMetricsController *)self setMMetricsConsiderationPeriod:([(WRM_IdsMetricsController *)self mMetricsConsiderationPeriod] % 12)];
      if (![(WRM_IdsMetricsController *)self mMetricsConsiderationPeriod]) {
        [(WRM_IdsMetricsController *)self resetIDSMetrics];
      }
    }
    if (xpc_dictionary_get_value(value, "LocMsgDelivered"))
    {
      uint64_t v10 = xpc_dictionary_get_uint64(value, "LocMsgDelivered");
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDelivered:v10];
      [(WRM_IdsMetricsController *)self setMLocalDeliveryCumulativeMessageDelivered:(char *)[(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageDelivered]+ v10];
      [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredMovAvg];
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredMovAvg:((double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageDelivered]+ v11 * 11.0)/ 12.0];
    }
    if (xpc_dictionary_get_value(value, "LocMsgDeliveryEr"))
    {
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredDeliveryError:xpc_dictionary_get_uint64(value, "LocMsgDeliveryEr")];
      [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg];
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageDeliveredDeliveryErrorMovAvg:((double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredDeliveryError]+ v12 * 11.0)/ 12.0];
    }
    if (xpc_dictionary_get_value(value, "LocMsgRcvd"))
    {
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageReceived:xpc_dictionary_get_uint64(value, "LocMsgRcvd")];
      [(WRM_IdsMetricsController *)self mLocalDeliveryMessageReceivedMovAvg];
      double v14 = ((double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageReceived]
           + v13 * 11.0)
          / 12.0;
      [(WRM_IdsMetricsController *)self setMLocalDeliveryMessageReceivedMovAvg:v14];
    }
  }
}

- (double)evaluateDLThroughput
{
  unint64_t v3 = [(WRM_IdsMetricsController *)self mStreamingReportBytesReceived];
  unint64_t v4 = [(WRM_IdsMetricsController *)self mLocalDeliveryMessageReceived];
  double v5 = (double)(v3
              + [(WRM_IdsMetricsController *)self mLocalDeliveryMessageReceivedMessageSize]* v4)* 8.0;
  return v5 / ((double)[(WRM_IdsMetricsController *)self mReportDuration] + 0.000001);
}

- (double)evaluateULThroughput
{
  unint64_t v3 = [(WRM_IdsMetricsController *)self mStreamingReportBytesSent];
  unint64_t v4 = [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDelivered];
  double v5 = (double)(v3
              + [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredMessageSize]* v4)* 8.0;
  return v5 / ((double)[(WRM_IdsMetricsController *)self mReportDuration] + 0.000001);
}

- (int)getRTT
{
  return [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredRTT];
}

- (int)getAvgRxPDUSize
{
  return [(WRM_IdsMetricsController *)self mLocalDeliveryMessageReceivedMessageSize];
}

- (int)getAvgTxPDUSize
{
  return [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredMessageSize];
}

- (double)getTxPer
{
  double v3 = (double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredDeliveryError];
  double v4 = (double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageDelivered];
  return v3
       / (v4
        + (double)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredDeliveryError]+ 0.000001);
}

- (BOOL)getTxPerValid
{
  unint64_t v3 = [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDelivered];
  return [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredDeliveryError]+ v3 > 0x22;
}

- (int)getRTTMovAvg
{
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredRTTMovAvg];
  return (int)v2;
}

- (int)getAvgRxPDUSizeMovAvg
{
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageReceivedMessageSizeMovAvg];
  return (int)v2;
}

- (int)getAvgTxPDUSizeMovAvg
{
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredMessageSizeMovAvg];
  return (int)v2;
}

- (double)getTxPerMovAvg
{
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg];
  double v4 = v3;
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredMovAvg];
  double v6 = v5;
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg];
  return v4 / (v6 + v7 + 0.000001);
}

- (BOOL)getTxPerMovAvgValid
{
  unint64_t v3 = [(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageSent];
  return [(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageDelivered]+ v3 > 0x22;
}

- (double)getAnticipiatedTxPer
{
  double v3 = (double)[(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageSent];
  double v4 = v3
     - (double)[(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageDelivered];
  +[WCM_Logging logLevel:27, @"getAnticipiatedTxPer: Sent: %ld, Delivered: %ld, Pkt Loss: %.2f", [(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageSent], [(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageDelivered], *(void *)&v4 message];
  double v5 = 0.0;
  if (v4 > 0.0
    && [(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageSent])
  {
    double v5 = v4
       / ((double)[(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageSent]+ 0.000001);
  }
  if (v5 > 1.0 || v5 < 0.0)
  {
    [(WRM_IdsMetricsController *)self setMLocalDeliveryCumulativeMessageSent:0];
    [(WRM_IdsMetricsController *)self setMLocalDeliveryCumulativeMessageDelivered:0];
    +[WCM_Logging logLevel:27 message:@"getAnticipiatedTxPer diacard bad value"];
    return 0.0;
  }
  return v5;
}

- (BOOL)getAnticipiatedTxPerValid
{
  unint64_t v3 = [(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageSent];
  double v4 = (char *)[(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageDelivered]+ v3;
  return (char *)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredDeliveryError]+ (unint64_t)v4 > (char *)0x45;
}

- (double)getTxPerAnticipatedMovAvg
{
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageSentMovAvg];
  double v4 = v3;
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredMovAvg];
  double v6 = v4 - v5;
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageSentMovAvg];
  uint64_t v8 = v7;
  [(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredMovAvg];
  +[WCM_Logging logLevel:27, @"getTxPerAnticipatedMovAvg: Sent: %.2f, Delivered: %.2f, Pkt Loss: %.2f", v8, v9, *(void *)&v6 message];
  double v10 = 0.0;
  if (v6 > 0.0)
  {
    [(WRM_IdsMetricsController *)self mLocalDeliveryMessageSentMovAvg];
    if (v11 >= 1.0)
    {
      [(WRM_IdsMetricsController *)self mLocalDeliveryMessageSentMovAvg];
      double v10 = v6 / (v12 + 0.000001);
      if (v10 > 1.0) {
        +[WCM_Logging logLevel:27 message:@"getTxPerAnticipatedMovAvg diacard bad value"];
      }
    }
  }
  return v10;
}

- (BOOL)getTxPerAnticipatedMovAvgValid
{
  unint64_t v3 = [(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageSent];
  double v4 = (char *)[(WRM_IdsMetricsController *)self mLocalDeliveryCumulativeMessageDelivered]+ v3;
  return (char *)[(WRM_IdsMetricsController *)self mLocalDeliveryMessageDeliveredDeliveryError]+ (unint64_t)v4 > (char *)0x45;
}

- (BOOL)isIDSTransportMetricsGoodEnough:(int)a3 :(BOOL)a4
{
  id v30 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", *(void *)&a3, a4) getiRATConfigController];
  uint64_t v5 = [(WRM_IdsMetricsController *)self getRTT];
  [(WRM_IdsMetricsController *)self getTxPer];
  double v7 = v6 * 100.0;
  unsigned int v8 = [(WRM_IdsMetricsController *)self getTxPerValid];
  [(WRM_IdsMetricsController *)self getAnticipiatedTxPer];
  double v10 = v9 * 100.0;
  unsigned int v11 = [(WRM_IdsMetricsController *)self getAnticipiatedTxPerValid];
  [(WRM_IdsMetricsController *)self getTxPerAnticipatedMovAvg];
  double v13 = v12 * 100.0;
  unsigned int v14 = [(WRM_IdsMetricsController *)self getTxPerAnticipatedMovAvgValid];
  uint64_t v15 = [(WRM_IdsMetricsController *)self getAvgTxPDUSize];
  uint64_t v16 = [(WRM_IdsMetricsController *)self getAvgRxPDUSize];
  [(WRM_IdsMetricsController *)self evaluateDLThroughput];
  uint64_t v18 = v17;
  [(WRM_IdsMetricsController *)self evaluateDLThroughput];
  double v20 = v19;
  uint64_t v21 = [(WRM_IdsMetricsController *)self getRTTMovAvg];
  [(WRM_IdsMetricsController *)self getTxPerMovAvg];
  double v23 = v22 * 100.0;
  uint64_t v24 = [(WRM_IdsMetricsController *)self getAvgTxPDUSizeMovAvg];
  uint64_t v25 = [(WRM_IdsMetricsController *)self getAvgRxPDUSizeMovAvg];
  +[WCM_Logging logLevel:27, @"Ant PER: %.2f,  Ant PER Valid: %d, Ant Mov PER: %.2f, Ant Mov PER Valid:%d", *(void *)&v10, v11, *(void *)&v13, v14 message];
  +[WCM_Logging logLevel:27, @"IDS Metrics For Cell/WiFi Eval, RTT: %d, M_avg RTT: %d, TX PER: %.2f, Tx PER Valid: %d, M_avg TX PER: %.2f, Rx Size: %d, MAvgRx Size: %d, DL Thr: %.2f, Tx Size: %d, MAvgTx Size: %d,  UL Thr: %.2f", v5, v21, *(void *)&v7, v8, *(void *)&v23, v16, v25, v18, v15, v24, *(void *)&v20 message];
  BOOL result = 1;
  if (a3 == 1 && v20 < 1000.0)
  {
    BOOL result = 0;
    if ((uint64_t)[v30 idsWiFiMinRttTh1] > (int)v5)
    {
      char v27 = v10 >= (double)(uint64_t)[v30 idsWiFiMinPerTh1] ? v11 : 0;
      if ((v27 & 1) == 0)
      {
        char v28 = v13 >= (double)(uint64_t)[v30 idsMovAvgWiFiMinPerTh1] ? v14 : 0;
        if ((v28 & 1) == 0)
        {
          unsigned int v29 = v7 >= (double)(uint64_t)[v30 idsAvgWiFiMinPerTh1] ? v8 : 0;
          if (v29 != 1) {
            return 1;
          }
        }
      }
    }
  }
  return result;
}

- (int)mReportDuration
{
  return *(&self->super.mProcessId + 1);
}

- (void)setMReportDuration:(int)a3
{
  *(&self->super.mProcessId + 1) = a3;
}

- (int)mMetricsConsiderationPeriod
{
  return self->_mReportDuration;
}

- (void)setMMetricsConsiderationPeriod:(int)a3
{
  self->_mReportDuration = a3;
}

- (unint64_t)mStreamingReportBytesSent
{
  return *(void *)&self->_mMetricsConsiderationPeriod;
}

- (void)setMStreamingReportBytesSent:(unint64_t)a3
{
  *(void *)&self->_mMetricsConsiderationPeriod = a3;
}

- (unint64_t)mStreamingReportPacketsSent
{
  return *(unint64_t *)((char *)&self->_mStreamingReportBytesSent + 4);
}

- (void)setMStreamingReportPacketsSent:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mStreamingReportBytesSent + 4) = a3;
}

- (unint64_t)mStreamingReportBytesReceived
{
  return *(unint64_t *)((char *)&self->_mStreamingReportPacketsSent + 4);
}

- (void)setMStreamingReportBytesReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mStreamingReportPacketsSent + 4) = a3;
}

- (unint64_t)mStreamingReportPacketsReceived
{
  return *(unint64_t *)((char *)&self->_mStreamingReportBytesReceived + 4);
}

- (void)setMStreamingReportPacketsReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mStreamingReportBytesReceived + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageSentMessageSize
{
  return *(unint64_t *)((char *)&self->_mStreamingReportPacketsReceived + 4);
}

- (void)setMLocalDeliveryMessageSentMessageSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mStreamingReportPacketsReceived + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageDeliveredMessageSize
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageSentMessageSize + 4);
}

- (void)setMLocalDeliveryMessageDeliveredMessageSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageSentMessageSize + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageDeliveredRTT
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredMessageSize + 4);
}

- (void)setMLocalDeliveryMessageDeliveredRTT:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredMessageSize + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageReceivedMessageSize
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredRTT + 4);
}

- (void)setMLocalDeliveryMessageReceivedMessageSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredRTT + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageSent
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageReceivedMessageSize + 4);
}

- (void)setMLocalDeliveryMessageSent:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageReceivedMessageSize + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageDelivered
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageSent + 4);
}

- (void)setMLocalDeliveryMessageDelivered:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageSent + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageDeliveredDeliveryError
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDelivered + 4);
}

- (void)setMLocalDeliveryMessageDeliveredDeliveryError:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDelivered + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageReceived
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredDeliveryError + 4);
}

- (void)setMLocalDeliveryMessageReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredDeliveryError + 4) = a3;
}

- (double)mLocalDeliveryMessageDeliveredMessageSizeMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageReceived + 4);
}

- (void)setMLocalDeliveryMessageDeliveredMessageSizeMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageReceived + 4) = a3;
}

- (double)mLocalDeliveryMessageDeliveredRTTMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredMessageSizeMovAvg + 4);
}

- (void)setMLocalDeliveryMessageDeliveredRTTMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredMessageSizeMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageReceivedMessageSizeMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredRTTMovAvg + 4);
}

- (void)setMLocalDeliveryMessageReceivedMessageSizeMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredRTTMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageSentMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageReceivedMessageSizeMovAvg + 4);
}

- (void)setMLocalDeliveryMessageSentMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageReceivedMessageSizeMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageDeliveredMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageSentMovAvg + 4);
}

- (void)setMLocalDeliveryMessageDeliveredMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageSentMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredMovAvg + 4);
}

- (void)setMLocalDeliveryMessageDeliveredDeliveryErrorMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageReceivedMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg + 4);
}

- (void)setMLocalDeliveryMessageReceivedMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg + 4) = a3;
}

- (unint64_t)mLocalDeliveryCumulativeMessageSent
{
  return *(void *)((char *)&self->_mLocalDeliveryMessageReceivedMovAvg + 4);
}

- (void)setMLocalDeliveryCumulativeMessageSent:(unint64_t)a3
{
  *(void *)((char *)&self->_mLocalDeliveryMessageReceivedMovAvg + 4) = a3;
}

- (unint64_t)mLocalDeliveryCumulativeMessageDelivered
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryCumulativeMessageSent + 4);
}

- (void)setMLocalDeliveryCumulativeMessageDelivered:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryCumulativeMessageSent + 4) = a3;
}

@end