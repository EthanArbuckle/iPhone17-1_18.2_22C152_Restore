@interface SCDAAccessoryMetricMessage
- (BOOL)_decodeMetricDataPayload:(id)a3 decodedPayload:(MyriadMetricsDataV2 *)a4;
- (BOOL)_decodeMetricDataPayload:(id)a3 into:(MyriadMetricsDataV2 *)a4 expectedPayloadSize:(unint64_t)a5;
- (BOOL)coordinationAllowed;
- (BOOL)decision;
- (BOOL)homepodInvolved;
- (BOOL)lateToElection;
- (BOOL)previousDecision;
- (MyriadMetricsDataV2)messageAsStruct;
- (SCDAAccessoryMetricMessage)initWithDataPayload:(id)a3;
- (SCDAAccessoryMetricMessage)initWithMetricData:(id)a3;
- (char)electionParticipantDeviceType;
- (char)electionParticipantGoodnessScore;
- (char)electionParticipantProductType;
- (double)advDelay;
- (double)advInterval;
- (double)previousDecisionTime;
- (id)_extractMetricDataFromDataPayload:(id)a3;
- (id)messageAsData;
- (unint64_t)deviceElectionParticipantIdHighBits;
- (unint64_t)deviceElectionParticipantIdLowBits;
- (unint64_t)deviceRotatedElectionParticipantIdHighBits;
- (unint64_t)deviceRotatedElectionParticipantIdLowBits;
- (unint64_t)electionParticipantIdHighBits;
- (unint64_t)electionParticipantIdLowBits;
- (unint64_t)requestType;
- (unint64_t)sessionId;
- (unsigned)deviceGroup;
- (unsigned)electionParticipantCount;
- (unsigned)eventType;
- (unsigned)state;
- (unsigned)version;
- (unsigned)winnerDeviceClass;
- (unsigned)winnerGoodnessScore;
- (unsigned)winnerProductType;
@end

@implementation SCDAAccessoryMetricMessage

- (BOOL)_decodeMetricDataPayload:(id)a3 into:(MyriadMetricsDataV2 *)a4 expectedPayloadSize:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v8 = [v7 length];
  if (v8 < a5) {
    a5 = v8;
  }
  id v9 = v7;
  v10 = (const void *)[v9 bytes];

  memcpy(a4, v10, a5);
  return 1;
}

- (BOOL)_decodeMetricDataPayload:(id)a3 decodedPayload:(MyriadMetricsDataV2 *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (!v6 || ![v6 length])
  {
    uint64_t v10 = SCDALogContextAnalytics;
    if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SCDAAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:]";
      __int16 v20 = 2112;
      v21 = v7;
      v13 = "%s Invalid analytics data payload: %@";
      v14 = v10;
      uint32_t v15 = 22;
      goto LABEL_14;
    }
LABEL_7:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  unsigned __int8 v17 = 0;
  objc_msgSend(v7, "getBytes:range:", &v17, 0, 1);
  int v8 = v17;
  if (!v17)
  {
    uint64_t v12 = SCDALogContextAnalytics;
    if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SCDAAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:]";
      __int16 v20 = 1024;
      LODWORD(v21) = 0;
      v13 = "%s Analytics data has a invalid version %d";
      v14 = v12;
      uint32_t v15 = 18;
LABEL_14:
      _os_log_error_impl(&dword_25C707000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  bzero(a4, 0x428uLL);
  if (v8 == 1) {
    uint64_t v9 = 232;
  }
  else {
    uint64_t v9 = 1064;
  }
  BOOL v11 = [(SCDAAccessoryMetricMessage *)self _decodeMetricDataPayload:v7 into:a4 expectedPayloadSize:v9];
LABEL_12:

  return v11;
}

- (id)_extractMetricDataFromDataPayload:(id)a3
{
  id v3 = a3;
  v4 = +[SCDAMetrics sharedInstance];
  int v5 = [v4 isMyriadMetricsMessage:v3];

  if (v5)
  {
    id v6 = [v3 objectForKeyedSubscript:scdaAccessoryMetricsMessageKey];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)electionParticipantIdHighBits
{
  return self->_metric.electionParticipantIdHighBits;
}

- (unint64_t)electionParticipantIdLowBits
{
  return self->_metric.electionParticipantIdLowBits;
}

- (unint64_t)deviceRotatedElectionParticipantIdHighBits
{
  return self->_metric.deviceRotatedElectionParticipantIdHighBits;
}

- (unint64_t)deviceRotatedElectionParticipantIdLowBits
{
  return self->_metric.deviceRotatedElectionParticipantIdLowBits;
}

- (unint64_t)deviceElectionParticipantIdHighBits
{
  return self->_metric.deviceElectionParticipantIdHighBits;
}

- (unint64_t)deviceElectionParticipantIdLowBits
{
  return self->_metric.deviceElectionParticipantIdLowBits;
}

- (char)electionParticipantProductType
{
  return (char *)self->_metric.electionParticipantProductType;
}

- (char)electionParticipantDeviceType
{
  return (char *)self->_metric.electionParticipantDeviceType;
}

- (char)electionParticipantGoodnessScore
{
  return (char *)self->_metric.electionParticipantGoodnessScore;
}

- (unsigned)electionParticipantCount
{
  return self->_metric.electionParticipantCount;
}

- (BOOL)lateToElection
{
  return self->_metric.lateToElection != 0;
}

- (BOOL)decision
{
  return self->_metric.decision != 0;
}

- (unsigned)deviceGroup
{
  return self->_metric.deviceGroup;
}

- (double)previousDecisionTime
{
  return self->_metric.previousDecisionTime;
}

- (BOOL)previousDecision
{
  return self->_metric.previousDecision != 0;
}

- (BOOL)homepodInvolved
{
  return self->_metric.homepodInvolved != 0;
}

- (unsigned)winnerDeviceClass
{
  return self->_metric.winnerDeviceClass;
}

- (unsigned)winnerProductType
{
  return self->_metric.winnerProductType;
}

- (unsigned)winnerGoodnessScore
{
  return self->_metric.winnerGoodnessScore;
}

- (BOOL)coordinationAllowed
{
  return self->_metric.coordinationAllowed != 0;
}

- (double)advInterval
{
  return self->_metric.advInterval;
}

- (double)advDelay
{
  return self->_metric.advDelay;
}

- (unsigned)state
{
  return self->_metric.state;
}

- (unint64_t)requestType
{
  return self->_metric.requestType;
}

- (unsigned)eventType
{
  return self->_metric.eventType;
}

- (unint64_t)sessionId
{
  return self->_metric.sessionId;
}

- (unsigned)version
{
  return self->_metric.version;
}

- (MyriadMetricsDataV2)messageAsStruct
{
  return (MyriadMetricsDataV2 *)memcpy(retstr, &self->_metric, sizeof(MyriadMetricsDataV2));
}

- (id)messageAsData
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
  [v3 appendBytes:&self->_metric length:1064];
  return v3;
}

- (SCDAAccessoryMetricMessage)initWithDataPayload:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCDAAccessoryMetricMessage;
  int v5 = [(SCDAAccessoryMetricMessage *)&v10 init];
  id v6 = v5;
  if (!v5)
  {
LABEL_4:
    id v7 = v6;
    goto LABEL_6;
  }
  id v7 = [(SCDAAccessoryMetricMessage *)v5 _extractMetricDataFromDataPayload:v4];
  if (v7)
  {
    BOOL v8 = [(SCDAAccessoryMetricMessage *)v6 _decodeMetricDataPayload:v7 decodedPayload:&v6->_metric];

    if (!v8)
    {
      id v7 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v7;
}

- (SCDAAccessoryMetricMessage)initWithMetricData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCDAAccessoryMetricMessage;
  int v5 = [(SCDAAccessoryMetricMessage *)&v9 init];
  id v6 = v5;
  if (v5
    && ![(SCDAAccessoryMetricMessage *)v5 _decodeMetricDataPayload:v4 decodedPayload:&v5->_metric])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

@end