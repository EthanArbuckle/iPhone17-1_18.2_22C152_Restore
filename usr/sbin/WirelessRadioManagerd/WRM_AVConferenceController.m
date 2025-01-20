@interface WRM_AVConferenceController
- (BOOL)isActiveClientFaceTime;
- (BOOL)mediaStallDetected;
- (BOOL)poorConnectionDetected;
- (BOOL)rtpMetricsReportingStarted;
- (BOOL)videoErasureSupported;
- (WRM_AVConferenceController)init;
- (double)movAvgIdleRxPktLoss;
- (double)movAvgRxPktLoss;
- (float)deltaVideoErasure;
- (float)primaryAudioPacketLossRate;
- (float)primaryVideoPacketLossRate;
- (float)totalAudioPacketLossRate;
- (float)totalVideoErasure;
- (float)totalVideoPacketLossRate;
- (id)description;
- (unint64_t)adaptationPaceketLoss;
- (unint64_t)audioPacketExpected;
- (unint64_t)averagedNominalJitterBufferDelay;
- (unint64_t)avgRxPktLoss;
- (unint64_t)callIdPrimaryLatteCall;
- (unint64_t)callType;
- (unint64_t)cumRxPktLoss;
- (unint64_t)cumulativeNominalJitterBufferDelay;
- (unint64_t)erasuresInSilence;
- (unint64_t)erasuresInSpeech;
- (unint64_t)frameCountCountSinceTxPacketLossReported;
- (unint64_t)frameCountSinceRttReported;
- (unint64_t)frameCountSinceTxJitterUpdated;
- (unint64_t)movAvgNominalJitterBufferDelay;
- (unint64_t)nominalJitterBufferDelay;
- (unint64_t)nominalJitterBufferQueueSize;
- (unint64_t)oneWayDealy;
- (unint64_t)periodicRtt;
- (unint64_t)primaryAudioPacketReceived;
- (unint64_t)primaryVideoPacketReceived;
- (unint64_t)reportedBandwitdh;
- (unint64_t)rtt;
- (unint64_t)rxJitter;
- (unint64_t)rxPktLoss;
- (unint64_t)rxRtpMetricsSampleCount;
- (unint64_t)rxSpeechPktLoss;
- (unint64_t)sidPacketsReceived;
- (unint64_t)silencePlayed;
- (unint64_t)speechPacketsReceived;
- (unint64_t)targetBitRate;
- (unint64_t)targetJitterBufferQueueSize;
- (unint64_t)timeStampRTPMetrics;
- (unint64_t)totalAudioPacketReceived;
- (unint64_t)totalErasures;
- (unint64_t)totalPacketsReceived;
- (unint64_t)totalPlayBacks;
- (unint64_t)totalPlayBacksInSpeech;
- (unint64_t)totalVideoPacketReceived;
- (unint64_t)txJitter;
- (unint64_t)txPacketLoss;
- (unint64_t)txPacketsCount;
- (unint64_t)videoPacketExpected;
- (void)configureFaceTimeRTPMetricsReporting;
- (void)configureRTPMetricsReporting;
- (void)dealloc;
- (void)handleFaceTimeRTPMetrics:(id)a3;
- (void)handleMessage:(id)a3;
- (void)handlePeriodicRTPMetrics:(id)a3;
- (void)handleRTPEvent:(id)a3;
- (void)handleTelephonyRTPMetrics:(id)a3;
- (void)resetCumulativeRTPMetrics;
- (void)resetPeriodicRTPStats;
- (void)resetRTPMetrics;
- (void)setAdaptationPaceketLoss:(unint64_t)a3;
- (void)setAudioPacketExpected:(unint64_t)a3;
- (void)setAveragedNominalJitterBufferDelay:(unint64_t)a3;
- (void)setAvgRxPktLoss:(unint64_t)a3;
- (void)setCallIdPrimaryLatteCall:(unint64_t)a3;
- (void)setCallType:(unint64_t)a3;
- (void)setCumRxPktLoss:(unint64_t)a3;
- (void)setCumulativeNominalJitterBufferDelay:(unint64_t)a3;
- (void)setDeltaVideoErasure:(float)a3;
- (void)setErasuresInSilence:(unint64_t)a3;
- (void)setErasuresInSpeech:(unint64_t)a3;
- (void)setFrameCountCountSinceTxPacketLossReported:(unint64_t)a3;
- (void)setFrameCountSinceRttReported:(unint64_t)a3;
- (void)setFrameCountSinceTxJitterUpdated:(unint64_t)a3;
- (void)setIsActiveClientFaceTime:(BOOL)a3;
- (void)setMediaStallDetected:(BOOL)a3;
- (void)setMovAvgIdleRxPktLoss:(double)a3;
- (void)setMovAvgNominalJitterBufferDelay:(unint64_t)a3;
- (void)setMovAvgRxPktLoss:(double)a3;
- (void)setNominalJitterBufferDelay:(unint64_t)a3;
- (void)setNominalJitterBufferQueueSize:(unint64_t)a3;
- (void)setOneWayDealy:(unint64_t)a3;
- (void)setPeriodicRtt:(unint64_t)a3;
- (void)setPoorConnectionDetected:(BOOL)a3;
- (void)setPrimaryAudioPacketLossRate:(float)a3;
- (void)setPrimaryAudioPacketReceived:(unint64_t)a3;
- (void)setPrimaryVideoPacketLossRate:(float)a3;
- (void)setPrimaryVideoPacketReceived:(unint64_t)a3;
- (void)setReportedBandwitdh:(unint64_t)a3;
- (void)setRtpMetricsReportingStarted:(BOOL)a3;
- (void)setRtt:(unint64_t)a3;
- (void)setRxJitter:(unint64_t)a3;
- (void)setRxPktLoss:(unint64_t)a3;
- (void)setRxRtpMetricsSampleCount:(unint64_t)a3;
- (void)setRxSpeechPktLoss:(unint64_t)a3;
- (void)setSidPacketsReceived:(unint64_t)a3;
- (void)setSilencePlayed:(unint64_t)a3;
- (void)setSpeechPacketsReceived:(unint64_t)a3;
- (void)setTargetBitRate:(unint64_t)a3;
- (void)setTargetJitterBufferQueueSize:(unint64_t)a3;
- (void)setTimeStampRTPMetrics:(unint64_t)a3;
- (void)setTotalAudioPacketLossRate:(float)a3;
- (void)setTotalAudioPacketReceived:(unint64_t)a3;
- (void)setTotalErasures:(unint64_t)a3;
- (void)setTotalPacketsReceived:(unint64_t)a3;
- (void)setTotalPlayBacks:(unint64_t)a3;
- (void)setTotalPlayBacksInSpeech:(unint64_t)a3;
- (void)setTotalVideoErasure:(float)a3;
- (void)setTotalVideoPacketLossRate:(float)a3;
- (void)setTotalVideoPacketReceived:(unint64_t)a3;
- (void)setTxJitter:(unint64_t)a3;
- (void)setTxPacketLoss:(unint64_t)a3;
- (void)setTxPacketsCount:(unint64_t)a3;
- (void)setVideoErasureSupported:(BOOL)a3;
- (void)setVideoPacketExpected:(unint64_t)a3;
@end

@implementation WRM_AVConferenceController

- (WRM_AVConferenceController)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_AVConferenceController;
  return [(WCM_Controller *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_AVConferenceController;
  [(WCM_Controller *)&v2 dealloc];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (!uint64)
  {
    uint64_t uint64 = xpc_dictionary_get_int64(a3, "kMessageId");
    if (!uint64)
    {
      +[WCM_Logging logLevel:23, @"Received AVConference Message  message-id: %lld", 0 message];
      return;
    }
    +[WCM_Logging logLevel:17 message:@"Got a message with a INT64 instead of a UINT64. Please file a radar in Purple Radio Manager"];
  }
  +[WCM_Logging logLevel:23, @"Received AVConference Message  message-id: %lld", uint64 message];
  if (uint64 == 201)
  {
    [(WRM_AVConferenceController *)self handleRTPEvent:a3];
  }
  else if (uint64 == 202)
  {
    [(WRM_AVConferenceController *)self handlePeriodicRTPMetrics:a3];
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"AVConference Controller"];
}

- (void)resetPeriodicRTPStats
{
  [(WRM_AVConferenceController *)self setTotalErasures:0];
  [(WRM_AVConferenceController *)self setTotalPlayBacks:0];
  [(WRM_AVConferenceController *)self setTotalPlayBacksInSpeech:0];
  [(WRM_AVConferenceController *)self setErasuresInSpeech:0];
  [(WRM_AVConferenceController *)self setErasuresInSilence:0];
  [(WRM_AVConferenceController *)self setTotalPacketsReceived:0];
  [(WRM_AVConferenceController *)self setSpeechPacketsReceived:0];
  [(WRM_AVConferenceController *)self setSidPacketsReceived:0];
  [(WRM_AVConferenceController *)self setSilencePlayed:0];
  [(WRM_AVConferenceController *)self setPeriodicRtt:0];
  [(WRM_AVConferenceController *)self setFrameCountSinceRttReported:0];
  [(WRM_AVConferenceController *)self setTxPacketsCount:0];
  [(WRM_AVConferenceController *)self setFrameCountCountSinceTxPacketLossReported:0];
  [(WRM_AVConferenceController *)self setRxJitter:0];
  [(WRM_AVConferenceController *)self setTxJitter:0];
  [(WRM_AVConferenceController *)self setFrameCountSinceTxJitterUpdated:0];
  [(WRM_AVConferenceController *)self setNominalJitterBufferQueueSize:0];
  [(WRM_AVConferenceController *)self setTargetJitterBufferQueueSize:0];
  [(WRM_AVConferenceController *)self setTimeStampRTPMetrics:0];
  [(WRM_AVConferenceController *)self setPrimaryVideoPacketLossRate:0.0];
  [(WRM_AVConferenceController *)self setPrimaryAudioPacketLossRate:0.0];
  [(WRM_AVConferenceController *)self setTotalVideoPacketLossRate:0.0];
  [(WRM_AVConferenceController *)self setTotalAudioPacketLossRate:0.0];
  [(WRM_AVConferenceController *)self setPoorConnectionDetected:0];
  [(WRM_AVConferenceController *)self setMediaStallDetected:0];
  [(WRM_AVConferenceController *)self setDeltaVideoErasure:0.0];

  [(WRM_AVConferenceController *)self setTotalVideoErasure:0.0];
}

- (void)resetRTPMetrics
{
  [(WRM_AVConferenceController *)self setCallType:0];
  [(WRM_AVConferenceController *)self setRxPktLoss:0];
  [(WRM_AVConferenceController *)self setRxSpeechPktLoss:0];
  [(WRM_AVConferenceController *)self setRtt:0];
  [(WRM_AVConferenceController *)self setPrimaryVideoPacketLossRate:0.0];
  [(WRM_AVConferenceController *)self setPrimaryAudioPacketLossRate:0.0];
  [(WRM_AVConferenceController *)self setTotalVideoPacketLossRate:0.0];
  [(WRM_AVConferenceController *)self setTotalAudioPacketLossRate:0.0];
  [(WRM_AVConferenceController *)self setPoorConnectionDetected:0];
  [(WRM_AVConferenceController *)self setMediaStallDetected:0];

  [(WRM_AVConferenceController *)self setDeltaVideoErasure:0.0];
}

- (void)resetCumulativeRTPMetrics
{
  [(WRM_AVConferenceController *)self setCumRxPktLoss:0];
  [(WRM_AVConferenceController *)self setAvgRxPktLoss:0];
  [(WRM_AVConferenceController *)self setMovAvgRxPktLoss:0.0];
  [(WRM_AVConferenceController *)self setMovAvgIdleRxPktLoss:0.0];
  [(WRM_AVConferenceController *)self setMovAvgNominalJitterBufferDelay:0];
  [(WRM_AVConferenceController *)self setCumulativeNominalJitterBufferDelay:0];
  [(WRM_AVConferenceController *)self setAveragedNominalJitterBufferDelay:0];

  [(WRM_AVConferenceController *)self setRxRtpMetricsSampleCount:0];
}

- (void)configureRTPMetricsReporting
{
  +[WCM_Logging logLevel:23 message:@"Configuring AVConference RTP metrics report"];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    [(WRM_AVConferenceController *)self setCallIdPrimaryLatteCall:0];
    [(WRM_AVConferenceController *)self setRtpMetricsReportingStarted:0];
    [(WRM_AVConferenceController *)self setIsActiveClientFaceTime:0];
    xpc_dictionary_set_uint64(v4, "kWRMAVConferenceMetricsConfig_PeriodicReportInterval", (uint64_t)[WRM_HandoverManager WRM_HandoverManagerSingleton].getiRATConfigController.periodicReportInterval);
    [(WCM_Controller *)self sendMessage:1102 withArgs:v4];
    xpc_release(v4);
  }
}

- (void)configureFaceTimeRTPMetricsReporting
{
  +[WCM_Logging logLevel:23 message:@"Configuring AVConference RTP metrics report"];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    [(WRM_AVConferenceController *)self setCallIdPrimaryLatteCall:0];
    [(WRM_AVConferenceController *)self setRtpMetricsReportingStarted:0];
    [(WRM_AVConferenceController *)self setIsActiveClientFaceTime:1];
    id v5 = [[+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton") getiRATClientFromList:7];
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_uint64(v4, "kWRMAVConferenceMetricsConfig_PeriodicReportInterval", (uint64_t)[WRM_HandoverManager WRM_HandoverManagerSingleton].getiRATConfigController.periodicReportInterval);
      [v6 sendMessage:1102 withArgs:v4];
    }
    else
    {
      +[WCM_Logging logLevel:29 message:@"Not sending FaceTimeCalling  metrics Configure request, FaceTimeCalling client not registered"];
    }
    xpc_release(v4);
  }
}

- (void)handleTelephonyRTPMetrics:(id)a3
{
  +[WCM_Logging logLevel:23, @"Received message from AVConference client, params are %@", a3 message];
  [(WRM_AVConferenceController *)self setRxRtpMetricsSampleCount:(char *)[(WRM_AVConferenceController *)self rxRtpMetricsSampleCount] + 1];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    CFStringRef v8 = @"Unable to extract content of IMG message, nothing to report";
    goto LABEL_6;
  }
  v6 = value;
  uint64_t uint64 = (void *)xpc_dictionary_get_uint64(value, "kWRMAVConferencePeriodicReport_CallID");
  if ([(WRM_AVConferenceController *)self rtpMetricsReportingStarted])
  {
    if (uint64 != (void *)[(WRM_AVConferenceController *)self callIdPrimaryLatteCall])
    {
      CFStringRef v8 = @"handleTelephonyRTPMetrics: discard WIFI RTP metrics call id not matching";
LABEL_6:
      +[WCM_Logging logLevel:23 message:v8];
      return;
    }
  }
  else
  {
    [(WRM_AVConferenceController *)self setCallIdPrimaryLatteCall:uint64];
    [(WRM_AVConferenceController *)self setRtpMetricsReportingStarted:1];
  }
  uint64_t v9 = xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_ErasuresInSpeech");
  uint64_t v10 = v9 - [(WRM_AVConferenceController *)self erasuresInSpeech];
  [(WRM_AVConferenceController *)self setErasuresInSpeech:v9];
  uint64_t v11 = xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_TotalPlaybacks");
  uint64_t v12 = v11 - [(WRM_AVConferenceController *)self totalPlayBacks];
  [(WRM_AVConferenceController *)self setTotalPlayBacks:v11];
  [(WRM_AVConferenceController *)self setRxSpeechPktLoss:(unint64_t)((double)v10 * 100.0 / (double)v12)];
  if (xpc_dictionary_get_value(v6, "kWRMAVConferencePeriodicReport_LinkType")
    && !xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_LinkType"))
  {
    +[WCM_Logging logLevel:23 message:@"handleTelephonyRTPMetrics: Cellular RTP metrics"];
    [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") updateAVCRTPMetric:(unint64_t)((double)v10 * 100.0 / (double)v12)];
    [(WRM_AVConferenceController *)self resetRTPMetrics];
    id v25 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    [v25 evaluateHandover];
  }
  else
  {
    uint64_t v13 = xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_TotalErasures");
    uint64_t v28 = v13 - [(WRM_AVConferenceController *)self totalErasures];
    [(WRM_AVConferenceController *)self setTotalErasures:v13];
    uint64_t v14 = xpc_dictionary_get_uint64(v6, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived");
    uint64_t v29 = v14 - [(WRM_AVConferenceController *)self sidPacketsReceived];
    [(WRM_AVConferenceController *)self setSidPacketsReceived:v14];
    uint64_t v15 = (-7 * v29 + v28) & ~((uint64_t)(-7 * v29 + v28) >> 63);
    uint64_t v27 = v10;
    unint64_t v16 = (unint64_t)((double)v15 * 100.0 / (double)v12);
    [(WRM_AVConferenceController *)self setRxPktLoss:v16];
    [(WRM_AVConferenceController *)self setCumRxPktLoss:(char *)[(WRM_AVConferenceController *)self cumRxPktLoss] + v16];
    double v17 = (double)[(WRM_AVConferenceController *)self cumRxPktLoss];
    uint64_t v26 = v12;
    unint64_t v18 = (unint64_t)(v17
                           / ((double)[(WRM_AVConferenceController *)self rxRtpMetricsSampleCount]+ 0.000001));
    [(WRM_AVConferenceController *)self setAvgRxPktLoss:v18];
    +[WCM_Logging logLevel:23, @"Rx periodic Average RTP packet loss=%lld", v18 message];
    [(WRM_AVConferenceController *)self movAvgRxPktLoss];
    double v20 = ((double)[(WRM_AVConferenceController *)self rxSpeechPktLoss] + v19 * 19.0) / 20.0;
    [(WRM_AVConferenceController *)self setMovAvgRxPktLoss:v20];
    [(WRM_AVConferenceController *)self movAvgIdleRxPktLoss];
    [(WRM_AVConferenceController *)self setMovAvgIdleRxPktLoss:((double)[(WRM_AVConferenceController *)self rxPktLoss] + v21 * 19.0) / 20.0];
    +[WCM_Logging logLevel:23, @"Rx periodic RTP metrics, Total Erasure=%lld, Total SID=%lld Total Played=%lld", v13, v14, v11 message];
    [(WRM_AVConferenceController *)self movAvgRxPktLoss];
    +[WCM_Logging logLevel:23, @"Delta Erasure=%lld, Delta SID=%lld, RxPktLoss=%lld, Mov Avg=%f, Delta Erasure in Speech=%lld, Delta Played=%lld Per Pkt=%lld, MovAvg total:%f", v28, v29, v15, *(void *)&v20, v27, v26, v16, v22 message];
    uint64_t v23 = xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize");
    [(WRM_AVConferenceController *)self setNominalJitterBufferDelay:v23];
    [(WRM_AVConferenceController *)self setMovAvgNominalJitterBufferDelay:(v23 + 19 * [(WRM_AVConferenceController *)self movAvgNominalJitterBufferDelay])/ 0x14];
    [(WRM_AVConferenceController *)self setCumulativeNominalJitterBufferDelay:(char *)[(WRM_AVConferenceController *)self cumulativeNominalJitterBufferDelay]+ v23];
    [(WRM_AVConferenceController *)self setAveragedNominalJitterBufferDelay:(unint64_t)((double)[(WRM_AVConferenceController *)self cumulativeNominalJitterBufferDelay]/ ((double)[(WRM_AVConferenceController *)self rxRtpMetricsSampleCount]+ 0.000001))];
    id v24 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    [v24 updateControllerState:a3];
  }
}

- (void)handleFaceTimeRTPMetrics:(id)a3
{
  id v5 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getiRATConfigController];
  +[WCM_Logging logLevel:23, @"Received message from AVConference client, params are %@", a3 message];
  [(WRM_AVConferenceController *)self setRxRtpMetricsSampleCount:(char *)[(WRM_AVConferenceController *)self rxRtpMetricsSampleCount] + 1];
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    [(WRM_AVConferenceController *)self setDeltaVideoErasure:0.0];
    CFStringRef v8 = @"Unable to extract content of IMG message, nothing to report";
    goto LABEL_5;
  }
  v7 = value;
  if (xpc_dictionary_get_uint64(value, "kWRMAVConferencePeriodicReport_VideoPause"))
  {
    CFStringRef v8 = @"handleFaceTimeRTPMetrics: discard RTP metrics, video Paused";
LABEL_5:
    +[WCM_Logging logLevel:23 message:v8];
    return;
  }
  if (xpc_dictionary_get_value(v7, "kWRMAVConferencePeriodicReport_LinkType")) {
    int uint64 = xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_LinkType");
  }
  else {
    int uint64 = 1;
  }
  uint64_t v10 = (void *)xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_CallID");
  if ([(WRM_AVConferenceController *)self rtpMetricsReportingStarted])
  {
    if (v10 != (void *)[(WRM_AVConferenceController *)self callIdPrimaryLatteCall])
    {
      CFStringRef v8 = @"handleFaceTimeRTPMetrics: discard WIFI RTP metrics call id not matching";
      goto LABEL_5;
    }
  }
  else
  {
    [(WRM_AVConferenceController *)self setCallIdPrimaryLatteCall:v10];
    [(WRM_AVConferenceController *)self setRtpMetricsReportingStarted:1];
  }
  int v66 = uint64;
  [(WRM_AVConferenceController *)self setCallType:xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_CallType")];
  [(WRM_AVConferenceController *)self setReportedBandwitdh:xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_BWEstimation")];
  [(WRM_AVConferenceController *)self setTargetBitRate:xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_TargetBitRate")];
  [(WRM_AVConferenceController *)self setOneWayDealy:xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_OneWayRelativeDelay")];
  [(WRM_AVConferenceController *)self setAdaptationPaceketLoss:xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_AdaptationPacketLoss")];
  uint64_t v11 = xpc_dictionary_get_uint64(v7, "PriVidRxCnt");
  unint64_t v12 = [(WRM_AVConferenceController *)self primaryVideoPacketReceived];
  [(WRM_AVConferenceController *)self setPrimaryVideoPacketReceived:v11];
  uint64_t v13 = xpc_dictionary_get_uint64(v7, "TotVidRxExpCnt");
  unint64_t v14 = [(WRM_AVConferenceController *)self videoPacketExpected];
  [(WRM_AVConferenceController *)self setVideoPacketExpected:v13];
  unint64_t v15 = [(WRM_AVConferenceController *)self callType];
  float v16 = 0.0;
  double v17 = 0.0;
  if (v15 == 2 && v13 != v14 && v11 != v12)
  {
    double v17 = 1.0 - (double)(v11 - v12) / ((double)(v13 - v14) + 0.000001);
    *(float *)&double v17 = v17;
  }
  [(WRM_AVConferenceController *)self setPrimaryVideoPacketLossRate:v17];
  uint64_t v18 = xpc_dictionary_get_uint64(v7, "PriAudRxCnt");
  unint64_t v19 = [(WRM_AVConferenceController *)self primaryAudioPacketReceived];
  [(WRM_AVConferenceController *)self setPrimaryAudioPacketReceived:v18];
  uint64_t v20 = xpc_dictionary_get_uint64(v7, "TotAudRxExpCnt");
  unint64_t v21 = v20 - [(WRM_AVConferenceController *)self audioPacketExpected];
  [(WRM_AVConferenceController *)self setAudioPacketExpected:v20];
  if (v18 != v19)
  {
    double v22 = 1.0 - (double)(v18 - v19) / ((double)v21 + 0.000001);
    float v16 = v22;
  }
  *(float *)&double v22 = v16;
  [(WRM_AVConferenceController *)self setPrimaryAudioPacketLossRate:v22];
  uint64_t v23 = xpc_dictionary_get_uint64(v7, "TotVidRxCnt");
  unint64_t v24 = [(WRM_AVConferenceController *)self totalVideoPacketReceived];
  [(WRM_AVConferenceController *)self setTotalVideoPacketReceived:v23];
  unint64_t v25 = [(WRM_AVConferenceController *)self callType];
  float v26 = 0.0;
  double v27 = 0.0;
  if (v25 == 2 && v13 != v14 && v23 != v24)
  {
    double v27 = 1.0 - (double)(v23 - v24) / ((double)(v13 - v14) + 0.000001);
    *(float *)&double v27 = v27;
  }
  [(WRM_AVConferenceController *)self setTotalVideoPacketLossRate:v27];
  uint64_t v28 = xpc_dictionary_get_uint64(v7, "TotAudRxCnt");
  unint64_t v29 = [(WRM_AVConferenceController *)self totalAudioPacketReceived];
  [(WRM_AVConferenceController *)self setTotalAudioPacketReceived:v28];
  if (v28 != v29)
  {
    double v30 = 1.0 - (double)(v28 - v29) / ((double)v21 + 0.000001);
    float v26 = v30;
  }
  *(float *)&double v30 = v26;
  [(WRM_AVConferenceController *)self setTotalAudioPacketLossRate:v30];
  if (xpc_dictionary_get_value(v7, "VidErasure"))
  {
    [(WRM_AVConferenceController *)self setVideoErasureSupported:1];
    float v31 = (float)xpc_dictionary_get_uint64(v7, "VidErasure");
    [(WRM_AVConferenceController *)self totalVideoErasure];
    *(float *)&double v33 = v31 - v32;
    [(WRM_AVConferenceController *)self setDeltaVideoErasure:v33];
    [(WRM_AVConferenceController *)self deltaVideoErasure];
    if (*(float *)&v34 > 10000.0) {
      [(WRM_AVConferenceController *)self setDeltaVideoErasure:0.0];
    }
    *(float *)&double v34 = v31;
    [(WRM_AVConferenceController *)self setTotalVideoErasure:v34];
  }
  else
  {
    [(WRM_AVConferenceController *)self setVideoErasureSupported:0];
  }
  [(WRM_AVConferenceController *)self primaryVideoPacketLossRate];
  double v36 = v35;
  [(WRM_AVConferenceController *)self primaryAudioPacketLossRate];
  double v38 = v37;
  [(WRM_AVConferenceController *)self totalAudioPacketLossRate];
  double v40 = v39;
  [(WRM_AVConferenceController *)self totalVideoPacketLossRate];
  double v42 = v41;
  [(WRM_AVConferenceController *)self deltaVideoErasure];
  +[WCM_Logging logLevel:23, @"Primary Video packet loss rate: %f, primary Audio packet loss rate: %f, total audio packet loss rate: %f, total video packet loss rate: %f, video erasure: %f", *(void *)&v36, *(void *)&v38, *(void *)&v40, *(void *)&v42, v43 message];
  if (v66)
  {
    uint64_t v44 = xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_ErasuresInSpeech");
    uint64_t v63 = v44 - [(WRM_AVConferenceController *)self erasuresInSpeech];
    [(WRM_AVConferenceController *)self setErasuresInSpeech:v44];
    uint64_t v67 = xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_TotalPlaybacks");
    uint64_t v45 = v67 - [(WRM_AVConferenceController *)self totalPlayBacks];
    [(WRM_AVConferenceController *)self setTotalPlayBacks:v67];
    uint64_t v46 = xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_TotalErasures");
    uint64_t v64 = v46 - [(WRM_AVConferenceController *)self totalErasures];
    [(WRM_AVConferenceController *)self setTotalErasures:v46];
    uint64_t v47 = xpc_dictionary_get_uint64(v7, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived");
    uint64_t v65 = v47 - [(WRM_AVConferenceController *)self sidPacketsReceived];
    [(WRM_AVConferenceController *)self setSidPacketsReceived:v47];
    uint64_t v48 = (-7 * v65 + v64) & ~((uint64_t)(-7 * v65 + v64) >> 63);
    double v49 = (double)v45;
    uint64_t v50 = v45;
    unint64_t v51 = (unint64_t)((double)v48 * 100.0 / (double)v45);
    [(WRM_AVConferenceController *)self setRxPktLoss:v51];
    [(WRM_AVConferenceController *)self setRxSpeechPktLoss:(unint64_t)((double)v63 * 100.0 / v49)];
    [(WRM_AVConferenceController *)self setCumRxPktLoss:(char *)[(WRM_AVConferenceController *)self cumRxPktLoss] + v51];
    double v52 = (double)[(WRM_AVConferenceController *)self cumRxPktLoss];
    unint64_t v53 = (unint64_t)(v52
                           / ((double)[(WRM_AVConferenceController *)self rxRtpMetricsSampleCount]+ 0.000001));
    [(WRM_AVConferenceController *)self setAvgRxPktLoss:v53];
    +[WCM_Logging logLevel:23, @"Rx periodic Average RTP packet loss=%lld", v53 message];
    double v54 = (double)((unint64_t)[v5 faceTimeMovingAverageWindow] - 1);
    [(WRM_AVConferenceController *)self movAvgRxPktLoss];
    double v56 = (double)[(WRM_AVConferenceController *)self rxSpeechPktLoss] + v54 * v55;
    double v57 = v56 / (double)(uint64_t)[v5 faceTimeMovingAverageWindow];
    [(WRM_AVConferenceController *)self setMovAvgRxPktLoss:v57];
    [(WRM_AVConferenceController *)self movAvgIdleRxPktLoss];
    [(WRM_AVConferenceController *)self setMovAvgIdleRxPktLoss:((double)[(WRM_AVConferenceController *)self rxPktLoss] + v58 * 19.0) / 20.0];
    +[WCM_Logging logLevel:23, @"Rx periodic RTP metrics, Total Erasure=%lld, Total SID=%lld Total Played=%lld", v46, v47, v67 message];
    [(WRM_AVConferenceController *)self movAvgRxPktLoss];
    +[WCM_Logging logLevel:23, @"Delta Erasure=%lld, Delta SID=%lld, RxPktLoss=%lld, Mov Avg=%f, Delta Erasure in Speech=%lld, Delta Played=%lld Per Pkt=%lld, MovAvg total:%f", v64, v65, v48, *(void *)&v57, v63, v50, v51, v59 message];
    uint64_t v60 = xpc_dictionary_get_uint64(v7, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize");
    [(WRM_AVConferenceController *)self setNominalJitterBufferDelay:v60];
    [(WRM_AVConferenceController *)self setMovAvgNominalJitterBufferDelay:(v60 + 19 * [(WRM_AVConferenceController *)self movAvgNominalJitterBufferDelay])/ 0x14];
    [(WRM_AVConferenceController *)self setCumulativeNominalJitterBufferDelay:(char *)[(WRM_AVConferenceController *)self cumulativeNominalJitterBufferDelay]+ v60];
    double v61 = (double)[(WRM_AVConferenceController *)self cumulativeNominalJitterBufferDelay];
    unint64_t v62 = (unint64_t)(v61
                           / ((double)[(WRM_AVConferenceController *)self rxRtpMetricsSampleCount]+ 0.000001));
    [(WRM_AVConferenceController *)self setAveragedNominalJitterBufferDelay:v62];
  }
}

- (void)handleRTPEvent:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    id v5 = value;
    [(WRM_AVConferenceController *)self setPoorConnectionDetected:xpc_dictionary_get_uint64(value, "AnyPoorCon") != 0];
    BOOL v6 = xpc_dictionary_get_uint64(v5, "IsMedStall") != 0;
    [(WRM_AVConferenceController *)self setMediaStallDetected:v6];
  }
}

- (void)handlePeriodicRTPMetrics:(id)a3
{
  if ([(WRM_AVConferenceController *)self isActiveClientFaceTime])
  {
    [(WRM_AVConferenceController *)self handleFaceTimeRTPMetrics:a3];
  }
  else
  {
    [(WRM_AVConferenceController *)self handleTelephonyRTPMetrics:a3];
  }
}

- (BOOL)isActiveClientFaceTime
{
  return *((unsigned char *)&self->super.mProcessId + 4);
}

- (void)setIsActiveClientFaceTime:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 4) = a3;
}

- (unint64_t)rxPktLoss
{
  return *(void *)&self->_deltaVideoErasure;
}

- (void)setRxPktLoss:(unint64_t)a3
{
  *(void *)&self->_deltaVideoErasure = a3;
}

- (unint64_t)rxSpeechPktLoss
{
  return *(unint64_t *)((char *)&self->_rxPktLoss + 4);
}

- (void)setRxSpeechPktLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rxPktLoss + 4) = a3;
}

- (unint64_t)cumRxPktLoss
{
  return *(unint64_t *)((char *)&self->_rxSpeechPktLoss + 4);
}

- (void)setCumRxPktLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rxSpeechPktLoss + 4) = a3;
}

- (unint64_t)avgRxPktLoss
{
  return *(unint64_t *)((char *)&self->_cumRxPktLoss + 4);
}

- (void)setAvgRxPktLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_cumRxPktLoss + 4) = a3;
}

- (unint64_t)rtt
{
  return *(unint64_t *)((char *)&self->_avgRxPktLoss + 4);
}

- (void)setRtt:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_avgRxPktLoss + 4) = a3;
}

- (unint64_t)nominalJitterBufferDelay
{
  return *(unint64_t *)((char *)&self->_rtt + 4);
}

- (void)setNominalJitterBufferDelay:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rtt + 4) = a3;
}

- (unint64_t)cumulativeNominalJitterBufferDelay
{
  return *(unint64_t *)((char *)&self->_nominalJitterBufferDelay + 4);
}

- (void)setCumulativeNominalJitterBufferDelay:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_nominalJitterBufferDelay + 4) = a3;
}

- (unint64_t)averagedNominalJitterBufferDelay
{
  return *(unint64_t *)((char *)&self->_cumulativeNominalJitterBufferDelay + 4);
}

- (void)setAveragedNominalJitterBufferDelay:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_cumulativeNominalJitterBufferDelay + 4) = a3;
}

- (unint64_t)rxRtpMetricsSampleCount
{
  return *(unint64_t *)((char *)&self->_averagedNominalJitterBufferDelay + 4);
}

- (void)setRxRtpMetricsSampleCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_averagedNominalJitterBufferDelay + 4) = a3;
}

- (unint64_t)movAvgNominalJitterBufferDelay
{
  return *(unint64_t *)((char *)&self->_rxRtpMetricsSampleCount + 4);
}

- (void)setMovAvgNominalJitterBufferDelay:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rxRtpMetricsSampleCount + 4) = a3;
}

- (double)movAvgRxPktLoss
{
  return *(double *)((char *)&self->_movAvgNominalJitterBufferDelay + 4);
}

- (void)setMovAvgRxPktLoss:(double)a3
{
  *(double *)((char *)&self->_movAvgNominalJitterBufferDelay + 4) = a3;
}

- (double)movAvgIdleRxPktLoss
{
  return *(double *)((char *)&self->_movAvgRxPktLoss + 4);
}

- (void)setMovAvgIdleRxPktLoss:(double)a3
{
  *(double *)((char *)&self->_movAvgRxPktLoss + 4) = a3;
}

- (unint64_t)totalErasures
{
  return *(void *)((char *)&self->_movAvgIdleRxPktLoss + 4);
}

- (void)setTotalErasures:(unint64_t)a3
{
  *(void *)((char *)&self->_movAvgIdleRxPktLoss + 4) = a3;
}

- (unint64_t)totalPlayBacks
{
  return *(unint64_t *)((char *)&self->_totalErasures + 4);
}

- (void)setTotalPlayBacks:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalErasures + 4) = a3;
}

- (unint64_t)totalPlayBacksInSpeech
{
  return *(unint64_t *)((char *)&self->_totalPlayBacks + 4);
}

- (void)setTotalPlayBacksInSpeech:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalPlayBacks + 4) = a3;
}

- (unint64_t)erasuresInSpeech
{
  return *(unint64_t *)((char *)&self->_totalPlayBacksInSpeech + 4);
}

- (void)setErasuresInSpeech:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalPlayBacksInSpeech + 4) = a3;
}

- (unint64_t)erasuresInSilence
{
  return *(unint64_t *)((char *)&self->_erasuresInSpeech + 4);
}

- (void)setErasuresInSilence:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_erasuresInSpeech + 4) = a3;
}

- (unint64_t)totalPacketsReceived
{
  return *(unint64_t *)((char *)&self->_erasuresInSilence + 4);
}

- (void)setTotalPacketsReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_erasuresInSilence + 4) = a3;
}

- (unint64_t)speechPacketsReceived
{
  return *(unint64_t *)((char *)&self->_totalPacketsReceived + 4);
}

- (void)setSpeechPacketsReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalPacketsReceived + 4) = a3;
}

- (unint64_t)sidPacketsReceived
{
  return *(unint64_t *)((char *)&self->_speechPacketsReceived + 4);
}

- (void)setSidPacketsReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_speechPacketsReceived + 4) = a3;
}

- (unint64_t)silencePlayed
{
  return *(unint64_t *)((char *)&self->_sidPacketsReceived + 4);
}

- (void)setSilencePlayed:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_sidPacketsReceived + 4) = a3;
}

- (unint64_t)periodicRtt
{
  return *(unint64_t *)((char *)&self->_silencePlayed + 4);
}

- (void)setPeriodicRtt:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_silencePlayed + 4) = a3;
}

- (unint64_t)frameCountSinceRttReported
{
  return *(unint64_t *)((char *)&self->_periodicRtt + 4);
}

- (void)setFrameCountSinceRttReported:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_periodicRtt + 4) = a3;
}

- (unint64_t)txPacketsCount
{
  return *(unint64_t *)((char *)&self->_frameCountSinceRttReported + 4);
}

- (void)setTxPacketsCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_frameCountSinceRttReported + 4) = a3;
}

- (unint64_t)txPacketLoss
{
  return *(unint64_t *)((char *)&self->_txPacketsCount + 4);
}

- (void)setTxPacketLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_txPacketsCount + 4) = a3;
}

- (unint64_t)frameCountCountSinceTxPacketLossReported
{
  return *(unint64_t *)((char *)&self->_txPacketLoss + 4);
}

- (void)setFrameCountCountSinceTxPacketLossReported:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_txPacketLoss + 4) = a3;
}

- (unint64_t)rxJitter
{
  return *(unint64_t *)((char *)&self->_frameCountCountSinceTxPacketLossReported + 4);
}

- (void)setRxJitter:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_frameCountCountSinceTxPacketLossReported + 4) = a3;
}

- (unint64_t)txJitter
{
  return *(unint64_t *)((char *)&self->_rxJitter + 4);
}

- (void)setTxJitter:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rxJitter + 4) = a3;
}

- (unint64_t)frameCountSinceTxJitterUpdated
{
  return *(unint64_t *)((char *)&self->_txJitter + 4);
}

- (void)setFrameCountSinceTxJitterUpdated:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_txJitter + 4) = a3;
}

- (unint64_t)nominalJitterBufferQueueSize
{
  return *(unint64_t *)((char *)&self->_frameCountSinceTxJitterUpdated + 4);
}

- (void)setNominalJitterBufferQueueSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_frameCountSinceTxJitterUpdated + 4) = a3;
}

- (unint64_t)targetJitterBufferQueueSize
{
  return *(unint64_t *)((char *)&self->_nominalJitterBufferQueueSize + 4);
}

- (void)setTargetJitterBufferQueueSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_nominalJitterBufferQueueSize + 4) = a3;
}

- (unint64_t)timeStampRTPMetrics
{
  return *(unint64_t *)((char *)&self->_targetJitterBufferQueueSize + 4);
}

- (void)setTimeStampRTPMetrics:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_targetJitterBufferQueueSize + 4) = a3;
}

- (unint64_t)callIdPrimaryLatteCall
{
  return *(unint64_t *)((char *)&self->_timeStampRTPMetrics + 4);
}

- (void)setCallIdPrimaryLatteCall:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_timeStampRTPMetrics + 4) = a3;
}

- (BOOL)rtpMetricsReportingStarted
{
  return *((unsigned char *)&self->super.mProcessId + 5);
}

- (void)setRtpMetricsReportingStarted:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 5) = a3;
}

- (unint64_t)primaryVideoPacketReceived
{
  return *(unint64_t *)((char *)&self->_callIdPrimaryLatteCall + 4);
}

- (void)setPrimaryVideoPacketReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_callIdPrimaryLatteCall + 4) = a3;
}

- (unint64_t)primaryAudioPacketReceived
{
  return *(unint64_t *)((char *)&self->_primaryVideoPacketReceived + 4);
}

- (void)setPrimaryAudioPacketReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_primaryVideoPacketReceived + 4) = a3;
}

- (unint64_t)totalVideoPacketReceived
{
  return *(unint64_t *)((char *)&self->_primaryAudioPacketReceived + 4);
}

- (void)setTotalVideoPacketReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_primaryAudioPacketReceived + 4) = a3;
}

- (unint64_t)totalAudioPacketReceived
{
  return *(unint64_t *)((char *)&self->_totalVideoPacketReceived + 4);
}

- (void)setTotalAudioPacketReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalVideoPacketReceived + 4) = a3;
}

- (unint64_t)audioPacketExpected
{
  return *(unint64_t *)((char *)&self->_totalAudioPacketReceived + 4);
}

- (void)setAudioPacketExpected:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalAudioPacketReceived + 4) = a3;
}

- (unint64_t)videoPacketExpected
{
  return *(unint64_t *)((char *)&self->_audioPacketExpected + 4);
}

- (void)setVideoPacketExpected:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_audioPacketExpected + 4) = a3;
}

- (float)primaryVideoPacketLossRate
{
  return *(float *)&self->_videoErasureSupported;
}

- (void)setPrimaryVideoPacketLossRate:(float)a3
{
  *(float *)&self->_videoErasureSupported = a3;
}

- (float)primaryAudioPacketLossRate
{
  return self->_primaryVideoPacketLossRate;
}

- (void)setPrimaryAudioPacketLossRate:(float)a3
{
  self->_primaryVideoPacketLossRate = a3;
}

- (float)totalVideoPacketLossRate
{
  return self->_primaryAudioPacketLossRate;
}

- (void)setTotalVideoPacketLossRate:(float)a3
{
  self->_primaryAudioPacketLossRate = a3;
}

- (float)totalAudioPacketLossRate
{
  return self->_totalVideoPacketLossRate;
}

- (void)setTotalAudioPacketLossRate:(float)a3
{
  self->_totalVideoPacketLossRate = a3;
}

- (BOOL)poorConnectionDetected
{
  return *((unsigned char *)&self->super.mProcessId + 6);
}

- (void)setPoorConnectionDetected:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 6) = a3;
}

- (BOOL)mediaStallDetected
{
  return *((unsigned char *)&self->super.mProcessId + 7);
}

- (void)setMediaStallDetected:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 7) = a3;
}

- (BOOL)videoErasureSupported
{
  return self->_isActiveClientFaceTime;
}

- (void)setVideoErasureSupported:(BOOL)a3
{
  self->_isActiveClientFaceTime = a3;
}

- (float)totalVideoErasure
{
  return self->_totalAudioPacketLossRate;
}

- (void)setTotalVideoErasure:(float)a3
{
  self->_totalAudioPacketLossRate = a3;
}

- (float)deltaVideoErasure
{
  return self->_totalVideoErasure;
}

- (void)setDeltaVideoErasure:(float)a3
{
  self->_totalVideoErasure = a3;
}

- (unint64_t)callType
{
  return *(unint64_t *)((char *)&self->_videoPacketExpected + 4);
}

- (void)setCallType:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_videoPacketExpected + 4) = a3;
}

- (unint64_t)reportedBandwitdh
{
  return *(unint64_t *)((char *)&self->_callType + 4);
}

- (void)setReportedBandwitdh:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_callType + 4) = a3;
}

- (unint64_t)targetBitRate
{
  return *(unint64_t *)((char *)&self->_reportedBandwitdh + 4);
}

- (void)setTargetBitRate:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_reportedBandwitdh + 4) = a3;
}

- (unint64_t)oneWayDealy
{
  return *(unint64_t *)((char *)&self->_targetBitRate + 4);
}

- (void)setOneWayDealy:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_targetBitRate + 4) = a3;
}

- (unint64_t)adaptationPaceketLoss
{
  return *(unint64_t *)((char *)&self->_oneWayDealy + 4);
}

- (void)setAdaptationPaceketLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_oneWayDealy + 4) = a3;
}

@end