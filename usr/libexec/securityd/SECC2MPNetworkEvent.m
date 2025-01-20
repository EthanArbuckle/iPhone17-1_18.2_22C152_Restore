@interface SECC2MPNetworkEvent
- (BOOL)hasNetworkConnectionReused;
- (BOOL)hasNetworkConnectionUuid;
- (BOOL)hasNetworkFatalError;
- (BOOL)hasNetworkHostname;
- (BOOL)hasNetworkInterfaceIdentifier;
- (BOOL)hasNetworkPreviousAttemptCount;
- (BOOL)hasNetworkProtocolName;
- (BOOL)hasNetworkRemoteAddresssAndPort;
- (BOOL)hasNetworkRequestBodyBytesSent;
- (BOOL)hasNetworkRequestHeaderSize;
- (BOOL)hasNetworkRequestUri;
- (BOOL)hasNetworkResponseBodyBytesReceived;
- (BOOL)hasNetworkResponseHeaderSize;
- (BOOL)hasNetworkStatusCode;
- (BOOL)hasNetworkTaskDescription;
- (BOOL)hasOptionsAllowExpensiveAccess;
- (BOOL)hasOptionsAllowPowerNapScheduling;
- (BOOL)hasOptionsAppleIdContext;
- (BOOL)hasOptionsOutOfProcess;
- (BOOL)hasOptionsOutOfProcessForceDiscretionary;
- (BOOL)hasOptionsQualityOfService;
- (BOOL)hasOptionsSourceApplicationBundleIdentifier;
- (BOOL)hasOptionsSourceApplicationSecondaryIdentifier;
- (BOOL)hasOptionsTimeoutIntervalForRequest;
- (BOOL)hasOptionsTimeoutIntervalForResource;
- (BOOL)hasOptionsTlsPinningRequired;
- (BOOL)hasReportFrequency;
- (BOOL)hasReportFrequencyBase;
- (BOOL)hasTimestampC2Init;
- (BOOL)hasTimestampC2Now;
- (BOOL)hasTimestampC2Start;
- (BOOL)hasTimestampDnsEnd;
- (BOOL)hasTimestampDnsStart;
- (BOOL)hasTimestampRequestEnd;
- (BOOL)hasTimestampRequestStart;
- (BOOL)hasTimestampResponseEnd;
- (BOOL)hasTimestampResponseStart;
- (BOOL)hasTimestampSslStart;
- (BOOL)hasTimestampTcpEnd;
- (BOOL)hasTimestampTcpStart;
- (BOOL)hasTriggers;
- (BOOL)isEqual:(id)a3;
- (BOOL)networkConnectionReused;
- (BOOL)optionsAllowExpensiveAccess;
- (BOOL)optionsAllowPowerNapScheduling;
- (BOOL)optionsAppleIdContext;
- (BOOL)optionsOutOfProcess;
- (BOOL)optionsOutOfProcessForceDiscretionary;
- (BOOL)optionsTlsPinningRequired;
- (BOOL)readFrom:(id)a3;
- (NSString)networkConnectionUuid;
- (NSString)networkHostname;
- (NSString)networkInterfaceIdentifier;
- (NSString)networkProtocolName;
- (NSString)networkRemoteAddresssAndPort;
- (NSString)networkRequestUri;
- (NSString)networkTaskDescription;
- (NSString)optionsQualityOfService;
- (NSString)optionsSourceApplicationBundleIdentifier;
- (NSString)optionsSourceApplicationSecondaryIdentifier;
- (SECC2MPError)networkFatalError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)networkRequestBodyBytesSent;
- (unint64_t)networkResponseBodyBytesReceived;
- (unint64_t)networkStatusCode;
- (unint64_t)reportFrequency;
- (unint64_t)reportFrequencyBase;
- (unint64_t)timestampC2Init;
- (unint64_t)timestampC2Now;
- (unint64_t)timestampC2Start;
- (unint64_t)timestampDnsEnd;
- (unint64_t)timestampDnsStart;
- (unint64_t)timestampRequestEnd;
- (unint64_t)timestampRequestStart;
- (unint64_t)timestampResponseEnd;
- (unint64_t)timestampResponseStart;
- (unint64_t)timestampSslStart;
- (unint64_t)timestampTcpEnd;
- (unint64_t)timestampTcpStart;
- (unint64_t)triggers;
- (unsigned)networkPreviousAttemptCount;
- (unsigned)networkRequestHeaderSize;
- (unsigned)networkResponseHeaderSize;
- (unsigned)optionsTimeoutIntervalForRequest;
- (unsigned)optionsTimeoutIntervalForResource;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNetworkConnectionReused:(BOOL)a3;
- (void)setHasNetworkPreviousAttemptCount:(BOOL)a3;
- (void)setHasNetworkRequestBodyBytesSent:(BOOL)a3;
- (void)setHasNetworkRequestHeaderSize:(BOOL)a3;
- (void)setHasNetworkResponseBodyBytesReceived:(BOOL)a3;
- (void)setHasNetworkResponseHeaderSize:(BOOL)a3;
- (void)setHasNetworkStatusCode:(BOOL)a3;
- (void)setHasOptionsAllowExpensiveAccess:(BOOL)a3;
- (void)setHasOptionsAllowPowerNapScheduling:(BOOL)a3;
- (void)setHasOptionsAppleIdContext:(BOOL)a3;
- (void)setHasOptionsOutOfProcess:(BOOL)a3;
- (void)setHasOptionsOutOfProcessForceDiscretionary:(BOOL)a3;
- (void)setHasOptionsTimeoutIntervalForRequest:(BOOL)a3;
- (void)setHasOptionsTimeoutIntervalForResource:(BOOL)a3;
- (void)setHasOptionsTlsPinningRequired:(BOOL)a3;
- (void)setHasReportFrequency:(BOOL)a3;
- (void)setHasReportFrequencyBase:(BOOL)a3;
- (void)setHasTimestampC2Init:(BOOL)a3;
- (void)setHasTimestampC2Now:(BOOL)a3;
- (void)setHasTimestampC2Start:(BOOL)a3;
- (void)setHasTimestampDnsEnd:(BOOL)a3;
- (void)setHasTimestampDnsStart:(BOOL)a3;
- (void)setHasTimestampRequestEnd:(BOOL)a3;
- (void)setHasTimestampRequestStart:(BOOL)a3;
- (void)setHasTimestampResponseEnd:(BOOL)a3;
- (void)setHasTimestampResponseStart:(BOOL)a3;
- (void)setHasTimestampSslStart:(BOOL)a3;
- (void)setHasTimestampTcpEnd:(BOOL)a3;
- (void)setHasTimestampTcpStart:(BOOL)a3;
- (void)setHasTriggers:(BOOL)a3;
- (void)setNetworkConnectionReused:(BOOL)a3;
- (void)setNetworkConnectionUuid:(id)a3;
- (void)setNetworkFatalError:(id)a3;
- (void)setNetworkHostname:(id)a3;
- (void)setNetworkInterfaceIdentifier:(id)a3;
- (void)setNetworkPreviousAttemptCount:(unsigned int)a3;
- (void)setNetworkProtocolName:(id)a3;
- (void)setNetworkRemoteAddresssAndPort:(id)a3;
- (void)setNetworkRequestBodyBytesSent:(unint64_t)a3;
- (void)setNetworkRequestHeaderSize:(unsigned int)a3;
- (void)setNetworkRequestUri:(id)a3;
- (void)setNetworkResponseBodyBytesReceived:(unint64_t)a3;
- (void)setNetworkResponseHeaderSize:(unsigned int)a3;
- (void)setNetworkStatusCode:(unint64_t)a3;
- (void)setNetworkTaskDescription:(id)a3;
- (void)setOptionsAllowExpensiveAccess:(BOOL)a3;
- (void)setOptionsAllowPowerNapScheduling:(BOOL)a3;
- (void)setOptionsAppleIdContext:(BOOL)a3;
- (void)setOptionsOutOfProcess:(BOOL)a3;
- (void)setOptionsOutOfProcessForceDiscretionary:(BOOL)a3;
- (void)setOptionsQualityOfService:(id)a3;
- (void)setOptionsSourceApplicationBundleIdentifier:(id)a3;
- (void)setOptionsSourceApplicationSecondaryIdentifier:(id)a3;
- (void)setOptionsTimeoutIntervalForRequest:(unsigned int)a3;
- (void)setOptionsTimeoutIntervalForResource:(unsigned int)a3;
- (void)setOptionsTlsPinningRequired:(BOOL)a3;
- (void)setReportFrequency:(unint64_t)a3;
- (void)setReportFrequencyBase:(unint64_t)a3;
- (void)setTimestampC2Init:(unint64_t)a3;
- (void)setTimestampC2Now:(unint64_t)a3;
- (void)setTimestampC2Start:(unint64_t)a3;
- (void)setTimestampDnsEnd:(unint64_t)a3;
- (void)setTimestampDnsStart:(unint64_t)a3;
- (void)setTimestampRequestEnd:(unint64_t)a3;
- (void)setTimestampRequestStart:(unint64_t)a3;
- (void)setTimestampResponseEnd:(unint64_t)a3;
- (void)setTimestampResponseStart:(unint64_t)a3;
- (void)setTimestampSslStart:(unint64_t)a3;
- (void)setTimestampTcpEnd:(unint64_t)a3;
- (void)setTimestampTcpStart:(unint64_t)a3;
- (void)setTriggers:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPNetworkEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsSourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_optionsSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_optionsQualityOfService, 0);
  objc_storeStrong((id *)&self->_networkTaskDescription, 0);
  objc_storeStrong((id *)&self->_networkRequestUri, 0);
  objc_storeStrong((id *)&self->_networkRemoteAddresssAndPort, 0);
  objc_storeStrong((id *)&self->_networkProtocolName, 0);
  objc_storeStrong((id *)&self->_networkInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_networkHostname, 0);
  objc_storeStrong((id *)&self->_networkFatalError, 0);

  objc_storeStrong((id *)&self->_networkConnectionUuid, 0);
}

- (BOOL)optionsTlsPinningRequired
{
  return self->_optionsTlsPinningRequired;
}

- (BOOL)optionsAppleIdContext
{
  return self->_optionsAppleIdContext;
}

- (void)setOptionsSourceApplicationSecondaryIdentifier:(id)a3
{
}

- (NSString)optionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier;
}

- (void)setOptionsSourceApplicationBundleIdentifier:(id)a3
{
}

- (NSString)optionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier;
}

- (unsigned)optionsTimeoutIntervalForResource
{
  return self->_optionsTimeoutIntervalForResource;
}

- (unsigned)optionsTimeoutIntervalForRequest
{
  return self->_optionsTimeoutIntervalForRequest;
}

- (BOOL)optionsAllowPowerNapScheduling
{
  return self->_optionsAllowPowerNapScheduling;
}

- (BOOL)optionsAllowExpensiveAccess
{
  return self->_optionsAllowExpensiveAccess;
}

- (BOOL)optionsOutOfProcessForceDiscretionary
{
  return self->_optionsOutOfProcessForceDiscretionary;
}

- (BOOL)optionsOutOfProcess
{
  return self->_optionsOutOfProcess;
}

- (void)setOptionsQualityOfService:(id)a3
{
}

- (NSString)optionsQualityOfService
{
  return self->_optionsQualityOfService;
}

- (unint64_t)timestampResponseEnd
{
  return self->_timestampResponseEnd;
}

- (unint64_t)timestampResponseStart
{
  return self->_timestampResponseStart;
}

- (unint64_t)timestampRequestEnd
{
  return self->_timestampRequestEnd;
}

- (unint64_t)timestampRequestStart
{
  return self->_timestampRequestStart;
}

- (unint64_t)timestampSslStart
{
  return self->_timestampSslStart;
}

- (unint64_t)timestampTcpEnd
{
  return self->_timestampTcpEnd;
}

- (unint64_t)timestampTcpStart
{
  return self->_timestampTcpStart;
}

- (unint64_t)timestampDnsEnd
{
  return self->_timestampDnsEnd;
}

- (unint64_t)timestampDnsStart
{
  return self->_timestampDnsStart;
}

- (unint64_t)timestampC2Now
{
  return self->_timestampC2Now;
}

- (unint64_t)timestampC2Start
{
  return self->_timestampC2Start;
}

- (unint64_t)timestampC2Init
{
  return self->_timestampC2Init;
}

- (void)setNetworkRequestUri:(id)a3
{
}

- (NSString)networkRequestUri
{
  return self->_networkRequestUri;
}

- (unint64_t)networkStatusCode
{
  return self->_networkStatusCode;
}

- (void)setNetworkFatalError:(id)a3
{
}

- (SECC2MPError)networkFatalError
{
  return self->_networkFatalError;
}

- (unsigned)networkPreviousAttemptCount
{
  return self->_networkPreviousAttemptCount;
}

- (unint64_t)networkResponseBodyBytesReceived
{
  return self->_networkResponseBodyBytesReceived;
}

- (unsigned)networkResponseHeaderSize
{
  return self->_networkResponseHeaderSize;
}

- (unint64_t)networkRequestBodyBytesSent
{
  return self->_networkRequestBodyBytesSent;
}

- (unsigned)networkRequestHeaderSize
{
  return self->_networkRequestHeaderSize;
}

- (void)setNetworkProtocolName:(id)a3
{
}

- (NSString)networkProtocolName
{
  return self->_networkProtocolName;
}

- (void)setNetworkInterfaceIdentifier:(id)a3
{
}

- (NSString)networkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier;
}

- (BOOL)networkConnectionReused
{
  return self->_networkConnectionReused;
}

- (void)setNetworkConnectionUuid:(id)a3
{
}

- (NSString)networkConnectionUuid
{
  return self->_networkConnectionUuid;
}

- (void)setNetworkRemoteAddresssAndPort:(id)a3
{
}

- (NSString)networkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort;
}

- (void)setNetworkHostname:(id)a3
{
}

- (NSString)networkHostname
{
  return self->_networkHostname;
}

- (void)setNetworkTaskDescription:(id)a3
{
}

- (NSString)networkTaskDescription
{
  return self->_networkTaskDescription;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (void)mergeFrom:(id)a3
{
  v4 = (unint64_t *)a3;
  v5 = v4;
  int v6 = *((_DWORD *)v4 + 70);
  if ((v6 & 0x20000) != 0)
  {
    self->_triggers = v4[18];
    *(_DWORD *)&self->_has |= 0x20000u;
    int v6 = *((_DWORD *)v4 + 70);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_reportFrequency = v4[4];
  *(_DWORD *)&self->_has |= 8u;
  if ((v4[35] & 0x10) != 0)
  {
LABEL_4:
    self->_reportFrequencyBase = v4[5];
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_5:
  v13 = v4;
  if (v4[29])
  {
    -[SECC2MPNetworkEvent setNetworkTaskDescription:](self, "setNetworkTaskDescription:");
    v5 = v13;
  }
  if (v5[21])
  {
    -[SECC2MPNetworkEvent setNetworkHostname:](self, "setNetworkHostname:");
    v5 = v13;
  }
  if (v5[25])
  {
    -[SECC2MPNetworkEvent setNetworkRemoteAddresssAndPort:](self, "setNetworkRemoteAddresssAndPort:");
    v5 = v13;
  }
  if (v5[19])
  {
    -[SECC2MPNetworkEvent setNetworkConnectionUuid:](self, "setNetworkConnectionUuid:");
    v5 = v13;
  }
  if ((*((unsigned char *)v5 + 282) & 0x80) != 0)
  {
    self->_networkConnectionReused = *((unsigned char *)v5 + 272);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
  if (v5[22])
  {
    -[SECC2MPNetworkEvent setNetworkInterfaceIdentifier:](self, "setNetworkInterfaceIdentifier:");
    v5 = v13;
  }
  if (v5[24])
  {
    -[SECC2MPNetworkEvent setNetworkProtocolName:](self, "setNetworkProtocolName:");
    v5 = v13;
  }
  int v7 = *((_DWORD *)v5 + 70);
  if ((v7 & 0x80000) != 0)
  {
    self->_networkRequestHeaderSize = *((_DWORD *)v5 + 52);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v7 = *((_DWORD *)v5 + 70);
    if ((v7 & 1) == 0)
    {
LABEL_21:
      if ((v7 & 0x100000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_33;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_21;
  }
  self->_networkRequestBodyBytesSent = v5[1];
  *(_DWORD *)&self->_has |= 1u;
  int v7 = *((_DWORD *)v5 + 70);
  if ((v7 & 0x100000) == 0)
  {
LABEL_22:
    if ((v7 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_networkResponseHeaderSize = *((_DWORD *)v5 + 56);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v7 = *((_DWORD *)v5 + 70);
  if ((v7 & 2) == 0)
  {
LABEL_23:
    if ((v7 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_34:
  self->_networkResponseBodyBytesReceived = v5[2];
  *(_DWORD *)&self->_has |= 2u;
  if ((v5[35] & 0x40000) != 0)
  {
LABEL_24:
    self->_networkPreviousAttemptCount = *((_DWORD *)v5 + 46);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_25:
  networkFatalError = self->_networkFatalError;
  unint64_t v9 = v5[20];
  if (networkFatalError)
  {
    if (!v9) {
      goto LABEL_39;
    }
    -[SECC2MPError mergeFrom:](networkFatalError, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_39;
    }
    -[SECC2MPNetworkEvent setNetworkFatalError:](self, "setNetworkFatalError:");
  }
  v5 = v13;
LABEL_39:
  if ((v5[35] & 4) != 0)
  {
    self->_networkStatusCode = v5[3];
    *(_DWORD *)&self->_has |= 4u;
  }
  if (v5[27])
  {
    -[SECC2MPNetworkEvent setNetworkRequestUri:](self, "setNetworkRequestUri:");
    v5 = v13;
  }
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x20) != 0)
  {
    self->_timestampC2Init = v5[6];
    *(_DWORD *)&self->_has |= 0x20u;
    int v10 = *((_DWORD *)v5 + 70);
    if ((v10 & 0x80) == 0)
    {
LABEL_45:
      if ((v10 & 0x40) == 0) {
        goto LABEL_46;
      }
      goto LABEL_78;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_45;
  }
  self->_timestampC2Start = v5[8];
  *(_DWORD *)&self->_has |= 0x80u;
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x40) == 0)
  {
LABEL_46:
    if ((v10 & 0x200) == 0) {
      goto LABEL_47;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_timestampC2Now = v5[7];
  *(_DWORD *)&self->_has |= 0x40u;
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x200) == 0)
  {
LABEL_47:
    if ((v10 & 0x100) == 0) {
      goto LABEL_48;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_timestampDnsStart = v5[10];
  *(_DWORD *)&self->_has |= 0x200u;
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x100) == 0)
  {
LABEL_48:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_timestampDnsEnd = v5[9];
  *(_DWORD *)&self->_has |= 0x100u;
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x10000) == 0)
  {
LABEL_49:
    if ((v10 & 0x8000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_timestampTcpStart = v5[17];
  *(_DWORD *)&self->_has |= 0x10000u;
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x8000) == 0)
  {
LABEL_50:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_timestampTcpEnd = v5[16];
  *(_DWORD *)&self->_has |= 0x8000u;
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x4000) == 0)
  {
LABEL_51:
    if ((v10 & 0x800) == 0) {
      goto LABEL_52;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_timestampSslStart = v5[15];
  *(_DWORD *)&self->_has |= 0x4000u;
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x800) == 0)
  {
LABEL_52:
    if ((v10 & 0x400) == 0) {
      goto LABEL_53;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_timestampRequestStart = v5[12];
  *(_DWORD *)&self->_has |= 0x800u;
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x400) == 0)
  {
LABEL_53:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_timestampRequestEnd = v5[11];
  *(_DWORD *)&self->_has |= 0x400u;
  int v10 = *((_DWORD *)v5 + 70);
  if ((v10 & 0x2000) == 0)
  {
LABEL_54:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
LABEL_86:
  self->_timestampResponseStart = v5[14];
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((v5[35] & 0x1000) != 0)
  {
LABEL_55:
    self->_timestampResponseEnd = v5[13];
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_56:
  if (v5[30])
  {
    -[SECC2MPNetworkEvent setOptionsQualityOfService:](self, "setOptionsQualityOfService:");
    v5 = v13;
  }
  int v11 = *((_DWORD *)v5 + 70);
  if ((v11 & 0x8000000) != 0)
  {
    self->_optionsOutOfProcess = *((unsigned char *)v5 + 276);
    *(_DWORD *)&self->_has |= 0x8000000u;
    int v11 = *((_DWORD *)v5 + 70);
    if ((v11 & 0x10000000) == 0)
    {
LABEL_60:
      if ((v11 & 0x1000000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_90;
    }
  }
  else if ((v11 & 0x10000000) == 0)
  {
    goto LABEL_60;
  }
  self->_optionsOutOfProcessForceDiscretionary = *((unsigned char *)v5 + 277);
  *(_DWORD *)&self->_has |= 0x10000000u;
  int v11 = *((_DWORD *)v5 + 70);
  if ((v11 & 0x1000000) == 0)
  {
LABEL_61:
    if ((v11 & 0x2000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_optionsAllowExpensiveAccess = *((unsigned char *)v5 + 273);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v11 = *((_DWORD *)v5 + 70);
  if ((v11 & 0x2000000) == 0)
  {
LABEL_62:
    if ((v11 & 0x200000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_optionsAllowPowerNapScheduling = *((unsigned char *)v5 + 274);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v11 = *((_DWORD *)v5 + 70);
  if ((v11 & 0x200000) == 0)
  {
LABEL_63:
    if ((v11 & 0x400000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
LABEL_92:
  self->_optionsTimeoutIntervalForRequest = *((_DWORD *)v5 + 66);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((v5[35] & 0x400000) != 0)
  {
LABEL_64:
    self->_optionsTimeoutIntervalForResource = *((_DWORD *)v5 + 67);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_65:
  if (v5[31])
  {
    -[SECC2MPNetworkEvent setOptionsSourceApplicationBundleIdentifier:](self, "setOptionsSourceApplicationBundleIdentifier:");
    v5 = v13;
  }
  if (v5[32])
  {
    -[SECC2MPNetworkEvent setOptionsSourceApplicationSecondaryIdentifier:](self, "setOptionsSourceApplicationSecondaryIdentifier:");
    v5 = v13;
  }
  int v12 = *((_DWORD *)v5 + 70);
  if ((v12 & 0x4000000) != 0)
  {
    self->_optionsAppleIdContext = *((unsigned char *)v5 + 275);
    *(_DWORD *)&self->_has |= 0x4000000u;
    int v12 = *((_DWORD *)v5 + 70);
  }
  if ((v12 & 0x20000000) != 0)
  {
    self->_optionsTlsPinningRequired = *((unsigned char *)v5 + 278);
    *(_DWORD *)&self->_has |= 0x20000000u;
  }

  _objc_release_x1();
}

- (unint64_t)hash
{
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    unint64_t v50 = 0;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v49 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v50 = 2654435761u * self->_triggers;
  if ((*(unsigned char *)&has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v49 = 2654435761u * self->_reportFrequency;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_4:
    unint64_t v48 = 2654435761u * self->_reportFrequencyBase;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v48 = 0;
LABEL_8:
  NSUInteger v47 = [(NSString *)self->_networkTaskDescription hash];
  NSUInteger v46 = [(NSString *)self->_networkHostname hash];
  NSUInteger v45 = [(NSString *)self->_networkRemoteAddresssAndPort hash];
  NSUInteger v44 = [(NSString *)self->_networkConnectionUuid hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    uint64_t v43 = 2654435761 * self->_networkConnectionReused;
  }
  else {
    uint64_t v43 = 0;
  }
  NSUInteger v42 = [(NSString *)self->_networkInterfaceIdentifier hash];
  NSUInteger v41 = [(NSString *)self->_networkProtocolName hash];
  $AF884E7ED10AB980613DA027D2B84F87 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
    uint64_t v40 = 2654435761 * self->_networkRequestHeaderSize;
    if (*(unsigned char *)&v4)
    {
LABEL_13:
      unint64_t v39 = 2654435761u * self->_networkRequestBodyBytesSent;
      if ((*(_DWORD *)&v4 & 0x100000) != 0) {
        goto LABEL_14;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if (*(unsigned char *)&v4) {
      goto LABEL_13;
    }
  }
  unint64_t v39 = 0;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_14:
    uint64_t v38 = 2654435761 * self->_networkResponseHeaderSize;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_15;
    }
LABEL_20:
    unint64_t v37 = 0;
    if ((*(_DWORD *)&v4 & 0x40000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v38 = 0;
  if ((*(unsigned char *)&v4 & 2) == 0) {
    goto LABEL_20;
  }
LABEL_15:
  unint64_t v37 = 2654435761u * self->_networkResponseBodyBytesReceived;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_16:
    uint64_t v36 = 2654435761 * self->_networkPreviousAttemptCount;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v36 = 0;
LABEL_22:
  unint64_t v35 = [(SECC2MPError *)self->_networkFatalError hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v34 = 2654435761u * self->_networkStatusCode;
  }
  else {
    unint64_t v34 = 0;
  }
  NSUInteger v33 = [(NSString *)self->_networkRequestUri hash];
  $AF884E7ED10AB980613DA027D2B84F87 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) != 0)
  {
    unint64_t v32 = 2654435761u * self->_timestampC2Init;
    if ((*(unsigned char *)&v5 & 0x80) != 0)
    {
LABEL_27:
      unint64_t v31 = 2654435761u * self->_timestampC2Start;
      if ((*(unsigned char *)&v5 & 0x40) != 0) {
        goto LABEL_28;
      }
      goto LABEL_40;
    }
  }
  else
  {
    unint64_t v32 = 0;
    if ((*(unsigned char *)&v5 & 0x80) != 0) {
      goto LABEL_27;
    }
  }
  unint64_t v31 = 0;
  if ((*(unsigned char *)&v5 & 0x40) != 0)
  {
LABEL_28:
    unint64_t v30 = 2654435761u * self->_timestampC2Now;
    if ((*(_WORD *)&v5 & 0x200) != 0) {
      goto LABEL_29;
    }
    goto LABEL_41;
  }
LABEL_40:
  unint64_t v30 = 0;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
LABEL_29:
    unint64_t v29 = 2654435761u * self->_timestampDnsStart;
    if ((*(_WORD *)&v5 & 0x100) != 0) {
      goto LABEL_30;
    }
    goto LABEL_42;
  }
LABEL_41:
  unint64_t v29 = 0;
  if ((*(_WORD *)&v5 & 0x100) != 0)
  {
LABEL_30:
    unint64_t v28 = 2654435761u * self->_timestampDnsEnd;
    if ((*(_DWORD *)&v5 & 0x10000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_43;
  }
LABEL_42:
  unint64_t v28 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_31:
    unint64_t v27 = 2654435761u * self->_timestampTcpStart;
    if ((*(_WORD *)&v5 & 0x8000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_44;
  }
LABEL_43:
  unint64_t v27 = 0;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
LABEL_32:
    unint64_t v26 = 2654435761u * self->_timestampTcpEnd;
    if ((*(_WORD *)&v5 & 0x4000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v26 = 0;
  if ((*(_WORD *)&v5 & 0x4000) != 0)
  {
LABEL_33:
    unint64_t v25 = 2654435761u * self->_timestampSslStart;
    if ((*(_WORD *)&v5 & 0x800) != 0) {
      goto LABEL_34;
    }
    goto LABEL_46;
  }
LABEL_45:
  unint64_t v25 = 0;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
LABEL_34:
    unint64_t v24 = 2654435761u * self->_timestampRequestStart;
    if ((*(_WORD *)&v5 & 0x400) != 0) {
      goto LABEL_35;
    }
    goto LABEL_47;
  }
LABEL_46:
  unint64_t v24 = 0;
  if ((*(_WORD *)&v5 & 0x400) != 0)
  {
LABEL_35:
    unint64_t v23 = 2654435761u * self->_timestampRequestEnd;
    if ((*(_WORD *)&v5 & 0x2000) != 0) {
      goto LABEL_36;
    }
LABEL_48:
    unint64_t v22 = 0;
    if ((*(_WORD *)&v5 & 0x1000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_49;
  }
LABEL_47:
  unint64_t v23 = 0;
  if ((*(_WORD *)&v5 & 0x2000) == 0) {
    goto LABEL_48;
  }
LABEL_36:
  unint64_t v22 = 2654435761u * self->_timestampResponseStart;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
LABEL_37:
    unint64_t v21 = 2654435761u * self->_timestampResponseEnd;
    goto LABEL_50;
  }
LABEL_49:
  unint64_t v21 = 0;
LABEL_50:
  NSUInteger v19 = [(NSString *)self->_optionsQualityOfService hash];
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    uint64_t v7 = 2654435761 * self->_optionsOutOfProcess;
    if ((*(_DWORD *)&v6 & 0x10000000) != 0)
    {
LABEL_52:
      uint64_t v8 = 2654435761 * self->_optionsOutOfProcessForceDiscretionary;
      if ((*(_DWORD *)&v6 & 0x1000000) != 0) {
        goto LABEL_53;
      }
      goto LABEL_59;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(_DWORD *)&v6 & 0x10000000) != 0) {
      goto LABEL_52;
    }
  }
  uint64_t v8 = 0;
  if ((*(_DWORD *)&v6 & 0x1000000) != 0)
  {
LABEL_53:
    uint64_t v9 = 2654435761 * self->_optionsAllowExpensiveAccess;
    if ((*(_DWORD *)&v6 & 0x2000000) != 0) {
      goto LABEL_54;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
LABEL_54:
    uint64_t v10 = 2654435761 * self->_optionsAllowPowerNapScheduling;
    if ((*(_DWORD *)&v6 & 0x200000) != 0) {
      goto LABEL_55;
    }
LABEL_61:
    uint64_t v11 = 0;
    if ((*(_DWORD *)&v6 & 0x400000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_62;
  }
LABEL_60:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&v6 & 0x200000) == 0) {
    goto LABEL_61;
  }
LABEL_55:
  uint64_t v11 = 2654435761 * self->_optionsTimeoutIntervalForRequest;
  if ((*(_DWORD *)&v6 & 0x400000) != 0)
  {
LABEL_56:
    uint64_t v12 = 2654435761 * self->_optionsTimeoutIntervalForResource;
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v12 = 0;
LABEL_63:
  NSUInteger v13 = [(NSString *)self->_optionsSourceApplicationBundleIdentifier hash];
  NSUInteger v14 = [(NSString *)self->_optionsSourceApplicationSecondaryIdentifier hash];
  $AF884E7ED10AB980613DA027D2B84F87 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x4000000) != 0)
  {
    uint64_t v16 = 2654435761 * self->_optionsAppleIdContext;
    if ((*(_DWORD *)&v15 & 0x20000000) != 0) {
      goto LABEL_65;
    }
LABEL_67:
    uint64_t v17 = 0;
    return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17;
  }
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v15 & 0x20000000) == 0) {
    goto LABEL_67;
  }
LABEL_65:
  uint64_t v17 = 2654435761 * self->_optionsTlsPinningRequired;
  return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_193;
  }
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  int v6 = *((_DWORD *)v4 + 70);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_triggers != *((void *)v4 + 18)) {
      goto LABEL_193;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_reportFrequency != *((void *)v4 + 4)) {
      goto LABEL_193;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_193;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_reportFrequencyBase != *((void *)v4 + 5)) {
      goto LABEL_193;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_193;
  }
  networkTaskDescription = self->_networkTaskDescription;
  if ((unint64_t)networkTaskDescription | *((void *)v4 + 29)
    && !-[NSString isEqual:](networkTaskDescription, "isEqual:"))
  {
    goto LABEL_193;
  }
  networkHostname = self->_networkHostname;
  if ((unint64_t)networkHostname | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](networkHostname, "isEqual:")) {
      goto LABEL_193;
    }
  }
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if ((unint64_t)networkRemoteAddresssAndPort | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](networkRemoteAddresssAndPort, "isEqual:")) {
      goto LABEL_193;
    }
  }
  networkConnectionUuid = self->_networkConnectionUuid;
  if ((unint64_t)networkConnectionUuid | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](networkConnectionUuid, "isEqual:")) {
      goto LABEL_193;
    }
  }
  int v11 = *((_DWORD *)v4 + 70);
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    if ((v11 & 0x800000) == 0) {
      goto LABEL_193;
    }
    if (self->_networkConnectionReused)
    {
      if (!*((unsigned char *)v4 + 272)) {
        goto LABEL_193;
      }
    }
    else if (*((unsigned char *)v4 + 272))
    {
      goto LABEL_193;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_193;
  }
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if ((unint64_t)networkInterfaceIdentifier | *((void *)v4 + 22)
    && !-[NSString isEqual:](networkInterfaceIdentifier, "isEqual:"))
  {
    goto LABEL_193;
  }
  networkProtocolName = self->_networkProtocolName;
  if ((unint64_t)networkProtocolName | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](networkProtocolName, "isEqual:")) {
      goto LABEL_193;
    }
  }
  $AF884E7ED10AB980613DA027D2B84F87 v14 = self->_has;
  int v15 = *((_DWORD *)v4 + 70);
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_networkRequestHeaderSize != *((_DWORD *)v4 + 52)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_193;
  }
  if (*(unsigned char *)&v14)
  {
    if ((v15 & 1) == 0 || self->_networkRequestBodyBytesSent != *((void *)v4 + 1)) {
      goto LABEL_193;
    }
  }
  else if (v15)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v15 & 0x100000) == 0 || self->_networkResponseHeaderSize != *((_DWORD *)v4 + 56)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x100000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(unsigned char *)&v14 & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_networkResponseBodyBytesReceived != *((void *)v4 + 2)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 2) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_networkPreviousAttemptCount != *((_DWORD *)v4 + 46)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_193;
  }
  networkFatalError = self->_networkFatalError;
  if ((unint64_t)networkFatalError | *((void *)v4 + 20))
  {
    if (!-[SECC2MPError isEqual:](networkFatalError, "isEqual:")) {
      goto LABEL_193;
    }
    $AF884E7ED10AB980613DA027D2B84F87 v14 = self->_has;
    int v15 = *((_DWORD *)v4 + 70);
  }
  if ((*(unsigned char *)&v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_networkStatusCode != *((void *)v4 + 3)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_193;
  }
  networkRequestUri = self->_networkRequestUri;
  if ((unint64_t)networkRequestUri | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](networkRequestUri, "isEqual:")) {
      goto LABEL_193;
    }
    $AF884E7ED10AB980613DA027D2B84F87 v14 = self->_has;
    int v15 = *((_DWORD *)v4 + 70);
  }
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_timestampC2Init != *((void *)v4 + 6)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_193;
  }
  if ((*(unsigned char *)&v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0 || self->_timestampC2Start != *((void *)v4 + 8)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_193;
  }
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_timestampC2Now != *((void *)v4 + 7)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0 || self->_timestampDnsStart != *((void *)v4 + 10)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_timestampDnsEnd != *((void *)v4 + 9)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0 || self->_timestampTcpStart != *((void *)v4 + 17)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
    if ((v15 & 0x8000) == 0 || self->_timestampTcpEnd != *((void *)v4 + 16)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x8000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0 || self->_timestampSslStart != *((void *)v4 + 15)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
    if ((v15 & 0x800) == 0 || self->_timestampRequestStart != *((void *)v4 + 12)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x800) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v15 & 0x400) == 0 || self->_timestampRequestEnd != *((void *)v4 + 11)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x400) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0 || self->_timestampResponseStart != *((void *)v4 + 14)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v15 & 0x1000) == 0 || self->_timestampResponseEnd != *((void *)v4 + 13)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x1000) != 0)
  {
    goto LABEL_193;
  }
  optionsQualityOfService = self->_optionsQualityOfService;
  if ((unint64_t)optionsQualityOfService | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](optionsQualityOfService, "isEqual:")) {
      goto LABEL_193;
    }
    $AF884E7ED10AB980613DA027D2B84F87 v14 = self->_has;
    int v15 = *((_DWORD *)v4 + 70);
  }
  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    if ((v15 & 0x8000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsOutOfProcess)
    {
      if (!*((unsigned char *)v4 + 276)) {
        goto LABEL_193;
      }
    }
    else if (*((unsigned char *)v4 + 276))
    {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x8000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    if ((v15 & 0x10000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsOutOfProcessForceDiscretionary)
    {
      if (!*((unsigned char *)v4 + 277)) {
        goto LABEL_193;
      }
    }
    else if (*((unsigned char *)v4 + 277))
    {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x10000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x1000000) != 0)
  {
    if ((v15 & 0x1000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsAllowExpensiveAccess)
    {
      if (!*((unsigned char *)v4 + 273)) {
        goto LABEL_193;
      }
    }
    else if (*((unsigned char *)v4 + 273))
    {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x1000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x2000000) != 0)
  {
    if ((v15 & 0x2000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsAllowPowerNapScheduling)
    {
      if (!*((unsigned char *)v4 + 274)) {
        goto LABEL_193;
      }
    }
    else if (*((unsigned char *)v4 + 274))
    {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x2000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    if ((v15 & 0x200000) == 0 || self->_optionsTimeoutIntervalForRequest != *((_DWORD *)v4 + 66)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x200000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v14 & 0x400000) != 0)
  {
    if ((v15 & 0x400000) == 0 || self->_optionsTimeoutIntervalForResource != *((_DWORD *)v4 + 67)) {
      goto LABEL_193;
    }
  }
  else if ((v15 & 0x400000) != 0)
  {
    goto LABEL_193;
  }
  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if ((unint64_t)optionsSourceApplicationBundleIdentifier | *((void *)v4 + 31)
    && !-[NSString isEqual:](optionsSourceApplicationBundleIdentifier, "isEqual:"))
  {
    goto LABEL_193;
  }
  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if ((unint64_t)optionsSourceApplicationSecondaryIdentifier | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](optionsSourceApplicationSecondaryIdentifier, "isEqual:")) {
      goto LABEL_193;
    }
  }
  $AF884E7ED10AB980613DA027D2B84F87 v21 = self->_has;
  int v22 = *((_DWORD *)v4 + 70);
  if ((*(_DWORD *)&v21 & 0x4000000) != 0)
  {
    if ((v22 & 0x4000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsAppleIdContext)
    {
      if (!*((unsigned char *)v4 + 275)) {
        goto LABEL_193;
      }
    }
    else if (*((unsigned char *)v4 + 275))
    {
      goto LABEL_193;
    }
  }
  else if ((v22 & 0x4000000) != 0)
  {
    goto LABEL_193;
  }
  if ((*(_DWORD *)&v21 & 0x20000000) != 0)
  {
    if ((v22 & 0x20000000) != 0)
    {
      if (self->_optionsTlsPinningRequired)
      {
        if (!*((unsigned char *)v4 + 278)) {
          goto LABEL_193;
        }
      }
      else if (*((unsigned char *)v4 + 278))
      {
        goto LABEL_193;
      }
      BOOL v23 = 1;
      goto LABEL_194;
    }
LABEL_193:
    BOOL v23 = 0;
    goto LABEL_194;
  }
  BOOL v23 = (v22 & 0x20000000) == 0;
LABEL_194:

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  $AF884E7ED10AB980613DA027D2B84F87 v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  int v6 = v5;
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v5[18] = self->_triggers;
    *((_DWORD *)v5 + 70) |= 0x20000u;
    $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_reportFrequency;
  *((_DWORD *)v5 + 70) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5[5] = self->_reportFrequencyBase;
    *((_DWORD *)v5 + 70) |= 0x10u;
  }
LABEL_5:
  id v8 = [(NSString *)self->_networkTaskDescription copyWithZone:a3];
  uint64_t v9 = (void *)v6[29];
  v6[29] = v8;

  id v10 = [(NSString *)self->_networkHostname copyWithZone:a3];
  int v11 = (void *)v6[21];
  v6[21] = v10;

  id v12 = [(NSString *)self->_networkRemoteAddresssAndPort copyWithZone:a3];
  NSUInteger v13 = (void *)v6[25];
  v6[25] = v12;

  id v14 = [(NSString *)self->_networkConnectionUuid copyWithZone:a3];
  int v15 = (void *)v6[19];
  v6[19] = v14;

  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *((unsigned char *)v6 + 272) = self->_networkConnectionReused;
    *((_DWORD *)v6 + 70) |= 0x800000u;
  }
  id v16 = [(NSString *)self->_networkInterfaceIdentifier copyWithZone:a3];
  uint64_t v17 = (void *)v6[22];
  v6[22] = v16;

  id v18 = [(NSString *)self->_networkProtocolName copyWithZone:a3];
  NSUInteger v19 = (void *)v6[24];
  v6[24] = v18;

  $AF884E7ED10AB980613DA027D2B84F87 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x80000) != 0)
  {
    *((_DWORD *)v6 + 52) = self->_networkRequestHeaderSize;
    *((_DWORD *)v6 + 70) |= 0x80000u;
    $AF884E7ED10AB980613DA027D2B84F87 v20 = self->_has;
    if ((*(unsigned char *)&v20 & 1) == 0)
    {
LABEL_9:
      if ((*(_DWORD *)&v20 & 0x100000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_45;
    }
  }
  else if ((*(unsigned char *)&v20 & 1) == 0)
  {
    goto LABEL_9;
  }
  v6[1] = self->_networkRequestBodyBytesSent;
  *((_DWORD *)v6 + 70) |= 1u;
  $AF884E7ED10AB980613DA027D2B84F87 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x100000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v20 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 56) = self->_networkResponseHeaderSize;
  *((_DWORD *)v6 + 70) |= 0x100000u;
  $AF884E7ED10AB980613DA027D2B84F87 v20 = self->_has;
  if ((*(unsigned char *)&v20 & 2) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v20 & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_46:
  v6[2] = self->_networkResponseBodyBytesReceived;
  *((_DWORD *)v6 + 70) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_12:
    *((_DWORD *)v6 + 46) = self->_networkPreviousAttemptCount;
    *((_DWORD *)v6 + 70) |= 0x40000u;
  }
LABEL_13:
  id v21 = [(SECC2MPError *)self->_networkFatalError copyWithZone:a3];
  int v22 = (void *)v6[20];
  v6[20] = v21;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v6[3] = self->_networkStatusCode;
    *((_DWORD *)v6 + 70) |= 4u;
  }
  id v23 = [(NSString *)self->_networkRequestUri copyWithZone:a3];
  unint64_t v24 = (void *)v6[27];
  v6[27] = v23;

  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x20) != 0)
  {
    v6[6] = self->_timestampC2Init;
    *((_DWORD *)v6 + 70) |= 0x20u;
    $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
    if ((*(unsigned char *)&v25 & 0x80) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&v25 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_50;
    }
  }
  else if ((*(unsigned char *)&v25 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  v6[8] = self->_timestampC2Start;
  *((_DWORD *)v6 + 70) |= 0x80u;
  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v25 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  v6[7] = self->_timestampC2Now;
  *((_DWORD *)v6 + 70) |= 0x40u;
  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v25 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  v6[10] = self->_timestampDnsStart;
  *((_DWORD *)v6 + 70) |= 0x200u;
  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v25 & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  v6[9] = self->_timestampDnsEnd;
  *((_DWORD *)v6 + 70) |= 0x100u;
  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v25 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  v6[17] = self->_timestampTcpStart;
  *((_DWORD *)v6 + 70) |= 0x10000u;
  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v25 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  v6[16] = self->_timestampTcpEnd;
  *((_DWORD *)v6 + 70) |= 0x8000u;
  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v25 & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  v6[15] = self->_timestampSslStart;
  *((_DWORD *)v6 + 70) |= 0x4000u;
  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v25 & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  v6[12] = self->_timestampRequestStart;
  *((_DWORD *)v6 + 70) |= 0x800u;
  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v25 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  v6[11] = self->_timestampRequestEnd;
  *((_DWORD *)v6 + 70) |= 0x400u;
  $AF884E7ED10AB980613DA027D2B84F87 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v25 & 0x1000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_58:
  v6[14] = self->_timestampResponseStart;
  *((_DWORD *)v6 + 70) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_27:
    v6[13] = self->_timestampResponseEnd;
    *((_DWORD *)v6 + 70) |= 0x1000u;
  }
LABEL_28:
  id v26 = [(NSString *)self->_optionsQualityOfService copyWithZone:a3];
  unint64_t v27 = (void *)v6[30];
  v6[30] = v26;

  $AF884E7ED10AB980613DA027D2B84F87 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x8000000) != 0)
  {
    *((unsigned char *)v6 + 276) = self->_optionsOutOfProcess;
    *((_DWORD *)v6 + 70) |= 0x8000000u;
    $AF884E7ED10AB980613DA027D2B84F87 v28 = self->_has;
    if ((*(_DWORD *)&v28 & 0x10000000) == 0)
    {
LABEL_30:
      if ((*(_DWORD *)&v28 & 0x1000000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_62;
    }
  }
  else if ((*(_DWORD *)&v28 & 0x10000000) == 0)
  {
    goto LABEL_30;
  }
  *((unsigned char *)v6 + 277) = self->_optionsOutOfProcessForceDiscretionary;
  *((_DWORD *)v6 + 70) |= 0x10000000u;
  $AF884E7ED10AB980613DA027D2B84F87 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x1000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v28 & 0x2000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((unsigned char *)v6 + 273) = self->_optionsAllowExpensiveAccess;
  *((_DWORD *)v6 + 70) |= 0x1000000u;
  $AF884E7ED10AB980613DA027D2B84F87 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x2000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v28 & 0x200000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((unsigned char *)v6 + 274) = self->_optionsAllowPowerNapScheduling;
  *((_DWORD *)v6 + 70) |= 0x2000000u;
  $AF884E7ED10AB980613DA027D2B84F87 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x200000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v28 & 0x400000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_64:
  *((_DWORD *)v6 + 66) = self->_optionsTimeoutIntervalForRequest;
  *((_DWORD *)v6 + 70) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_34:
    *((_DWORD *)v6 + 67) = self->_optionsTimeoutIntervalForResource;
    *((_DWORD *)v6 + 70) |= 0x400000u;
  }
LABEL_35:
  id v29 = [(NSString *)self->_optionsSourceApplicationBundleIdentifier copyWithZone:a3];
  unint64_t v30 = (void *)v6[31];
  v6[31] = v29;

  id v31 = [(NSString *)self->_optionsSourceApplicationSecondaryIdentifier copyWithZone:a3];
  unint64_t v32 = (void *)v6[32];
  v6[32] = v31;

  $AF884E7ED10AB980613DA027D2B84F87 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x4000000) != 0)
  {
    *((unsigned char *)v6 + 275) = self->_optionsAppleIdContext;
    *((_DWORD *)v6 + 70) |= 0x4000000u;
    $AF884E7ED10AB980613DA027D2B84F87 v33 = self->_has;
  }
  if ((*(_DWORD *)&v33 & 0x20000000) != 0)
  {
    *((unsigned char *)v6 + 278) = self->_optionsTlsPinningRequired;
    *((_DWORD *)v6 + 70) |= 0x20000000u;
  }
  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v4[18] = self->_triggers;
    *((_DWORD *)v4 + 70) |= 0x20000u;
    $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_reportFrequency;
  *((_DWORD *)v4 + 70) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4[5] = self->_reportFrequencyBase;
    *((_DWORD *)v4 + 70) |= 0x10u;
  }
LABEL_5:
  id v10 = v4;
  if (self->_networkTaskDescription)
  {
    [v4 setNetworkTaskDescription:];
    id v4 = v10;
  }
  if (self->_networkHostname)
  {
    [v10 setNetworkHostname:];
    id v4 = v10;
  }
  if (self->_networkRemoteAddresssAndPort)
  {
    [v10 setNetworkRemoteAddresssAndPort:];
    id v4 = v10;
  }
  if (self->_networkConnectionUuid)
  {
    [v10 setNetworkConnectionUuid:];
    id v4 = v10;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    *((unsigned char *)v4 + 272) = self->_networkConnectionReused;
    *((_DWORD *)v4 + 70) |= 0x800000u;
  }
  if (self->_networkInterfaceIdentifier)
  {
    [v10 setNetworkInterfaceIdentifier:];
    id v4 = v10;
  }
  if (self->_networkProtocolName)
  {
    [v10 setNetworkProtocolName:];
    id v4 = v10;
  }
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    *((_DWORD *)v4 + 52) = self->_networkRequestHeaderSize;
    *((_DWORD *)v4 + 70) |= 0x80000u;
    $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v6 & 0x100000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_69;
    }
  }
  else if ((*(unsigned char *)&v6 & 1) == 0)
  {
    goto LABEL_21;
  }
  v4[1] = self->_networkRequestBodyBytesSent;
  *((_DWORD *)v4 + 70) |= 1u;
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 56) = self->_networkResponseHeaderSize;
  *((_DWORD *)v4 + 70) |= 0x100000u;
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_70:
  v4[2] = self->_networkResponseBodyBytesReceived;
  *((_DWORD *)v4 + 70) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_24:
    *((_DWORD *)v4 + 46) = self->_networkPreviousAttemptCount;
    *((_DWORD *)v4 + 70) |= 0x40000u;
  }
LABEL_25:
  if (self->_networkFatalError)
  {
    [v10 setNetworkFatalError:];
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[3] = self->_networkStatusCode;
    *((_DWORD *)v4 + 70) |= 4u;
  }
  if (self->_networkRequestUri)
  {
    [v10 setNetworkRequestUri:];
    id v4 = v10;
  }
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x20) != 0)
  {
    v4[6] = self->_timestampC2Init;
    *((_DWORD *)v4 + 70) |= 0x20u;
    $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 0x80) == 0)
    {
LABEL_33:
      if ((*(unsigned char *)&v7 & 0x40) == 0) {
        goto LABEL_34;
      }
      goto LABEL_74;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
    goto LABEL_33;
  }
  v4[8] = self->_timestampC2Start;
  *((_DWORD *)v4 + 70) |= 0x80u;
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v7 & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_75;
  }
LABEL_74:
  v4[7] = self->_timestampC2Now;
  *((_DWORD *)v4 + 70) |= 0x40u;
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v7 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_76;
  }
LABEL_75:
  v4[10] = self->_timestampDnsStart;
  *((_DWORD *)v4 + 70) |= 0x200u;
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_77;
  }
LABEL_76:
  v4[9] = self->_timestampDnsEnd;
  *((_DWORD *)v4 + 70) |= 0x100u;
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v7 & 0x8000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_78;
  }
LABEL_77:
  v4[17] = self->_timestampTcpStart;
  *((_DWORD *)v4 + 70) |= 0x10000u;
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_79;
  }
LABEL_78:
  v4[16] = self->_timestampTcpEnd;
  *((_DWORD *)v4 + 70) |= 0x8000u;
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v7 & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_80;
  }
LABEL_79:
  v4[15] = self->_timestampSslStart;
  *((_DWORD *)v4 + 70) |= 0x4000u;
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_41;
    }
    goto LABEL_81;
  }
LABEL_80:
  v4[12] = self->_timestampRequestStart;
  *((_DWORD *)v4 + 70) |= 0x800u;
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_82;
  }
LABEL_81:
  v4[11] = self->_timestampRequestEnd;
  *((_DWORD *)v4 + 70) |= 0x400u;
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v7 & 0x1000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_82:
  v4[14] = self->_timestampResponseStart;
  *((_DWORD *)v4 + 70) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_43:
    v4[13] = self->_timestampResponseEnd;
    *((_DWORD *)v4 + 70) |= 0x1000u;
  }
LABEL_44:
  if (self->_optionsQualityOfService)
  {
    [v10 setOptionsQualityOfService:];
    id v4 = v10;
  }
  $AF884E7ED10AB980613DA027D2B84F87 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) != 0)
  {
    *((unsigned char *)v4 + 276) = self->_optionsOutOfProcess;
    *((_DWORD *)v4 + 70) |= 0x8000000u;
    $AF884E7ED10AB980613DA027D2B84F87 v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x10000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
        goto LABEL_49;
      }
      goto LABEL_86;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x10000000) == 0)
  {
    goto LABEL_48;
  }
  *((unsigned char *)v4 + 277) = self->_optionsOutOfProcessForceDiscretionary;
  *((_DWORD *)v4 + 70) |= 0x10000000u;
  $AF884E7ED10AB980613DA027D2B84F87 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v8 & 0x2000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((unsigned char *)v4 + 273) = self->_optionsAllowExpensiveAccess;
  *((_DWORD *)v4 + 70) |= 0x1000000u;
  $AF884E7ED10AB980613DA027D2B84F87 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v8 & 0x200000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((unsigned char *)v4 + 274) = self->_optionsAllowPowerNapScheduling;
  *((_DWORD *)v4 + 70) |= 0x2000000u;
  $AF884E7ED10AB980613DA027D2B84F87 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_88:
  *((_DWORD *)v4 + 66) = self->_optionsTimeoutIntervalForRequest;
  *((_DWORD *)v4 + 70) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_52:
    *((_DWORD *)v4 + 67) = self->_optionsTimeoutIntervalForResource;
    *((_DWORD *)v4 + 70) |= 0x400000u;
  }
LABEL_53:
  if (self->_optionsSourceApplicationBundleIdentifier)
  {
    [v10 setOptionsSourceApplicationBundleIdentifier:];
    id v4 = v10;
  }
  if (self->_optionsSourceApplicationSecondaryIdentifier)
  {
    [v10 setOptionsSourceApplicationSecondaryIdentifier:];
    id v4 = v10;
  }
  $AF884E7ED10AB980613DA027D2B84F87 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x4000000) != 0)
  {
    *((unsigned char *)v4 + 275) = self->_optionsAppleIdContext;
    *((_DWORD *)v4 + 70) |= 0x4000000u;
    $AF884E7ED10AB980613DA027D2B84F87 v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x20000000) != 0)
  {
    *((unsigned char *)v4 + 278) = self->_optionsTlsPinningRequired;
    *((_DWORD *)v4 + 70) |= 0x20000000u;
  }
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_networkTaskDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_networkHostname) {
    PBDataWriterWriteStringField();
  }
  if (self->_networkRemoteAddresssAndPort) {
    PBDataWriterWriteStringField();
  }
  if (self->_networkConnectionUuid) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_networkInterfaceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_networkProtocolName) {
    PBDataWriterWriteStringField();
  }
  $AF884E7ED10AB980613DA027D2B84F87 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $AF884E7ED10AB980613DA027D2B84F87 v5 = self->_has;
    if ((*(unsigned char *)&v5 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v5 & 0x100000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_69;
    }
  }
  else if ((*(unsigned char *)&v5 & 1) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v5 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  $AF884E7ED10AB980613DA027D2B84F87 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v5 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x40000) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_networkFatalError) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_networkRequestUri) {
    PBDataWriterWriteStringField();
  }
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x80) == 0)
    {
LABEL_33:
      if ((*(unsigned char *)&v6 & 0x40) == 0) {
        goto LABEL_34;
      }
      goto LABEL_74;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_41;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint64Field();
  $AF884E7ED10AB980613DA027D2B84F87 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_82:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_43:
  }
    PBDataWriterWriteUint64Field();
LABEL_44:
  if (self->_optionsQualityOfService) {
    PBDataWriterWriteStringField();
  }
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x10000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
        goto LABEL_49;
      }
      goto LABEL_86;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x10000000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteBOOLField();
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteBOOLField();
  $AF884E7ED10AB980613DA027D2B84F87 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x400000) != 0) {
LABEL_52:
  }
    PBDataWriterWriteUint32Field();
LABEL_53:
  if (self->_optionsSourceApplicationBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_optionsSourceApplicationSecondaryIdentifier) {
    PBDataWriterWriteStringField();
  }
  $AF884E7ED10AB980613DA027D2B84F87 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $AF884E7ED10AB980613DA027D2B84F87 v8 = self->_has;
  }
  if ((*(_DWORD *)&v8 & 0x20000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001B4A54((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    id v31 = +[NSNumber numberWithUnsignedLongLong:self->_triggers];
    [v3 setObject:v31 forKey:@"triggers"];

    $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  unint64_t v32 = +[NSNumber numberWithUnsignedLongLong:self->_reportFrequency];
  [v3 setObject:v32 forKey:@"report_frequency"];

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    $AF884E7ED10AB980613DA027D2B84F87 v5 = +[NSNumber numberWithUnsignedLongLong:self->_reportFrequencyBase];
    [v3 setObject:v5 forKey:@"report_frequency_base"];
  }
LABEL_5:
  networkTaskDescription = self->_networkTaskDescription;
  if (networkTaskDescription) {
    [v3 setObject:networkTaskDescription forKey:@"network_task_description"];
  }
  networkHostname = self->_networkHostname;
  if (networkHostname) {
    [v3 setObject:networkHostname forKey:@"network_hostname"];
  }
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if (networkRemoteAddresssAndPort) {
    [v3 setObject:networkRemoteAddresssAndPort forKey:@"network_remote_addresss_and_port"];
  }
  networkConnectionUuid = self->_networkConnectionUuid;
  if (networkConnectionUuid) {
    [v3 setObject:networkConnectionUuid forKey:@"network_connection_uuid"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0)
  {
    id v10 = +[NSNumber numberWithBool:self->_networkConnectionReused];
    [v3 setObject:v10 forKey:@"network_connection_reused"];
  }
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if (networkInterfaceIdentifier) {
    [v3 setObject:networkInterfaceIdentifier forKey:@"network_interface_identifier"];
  }
  networkProtocolName = self->_networkProtocolName;
  if (networkProtocolName) {
    [v3 setObject:networkProtocolName forKey:@"network_protocol_name"];
  }
  $AF884E7ED10AB980613DA027D2B84F87 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) != 0)
  {
    $AF884E7ED10AB980613DA027D2B84F87 v33 = +[NSNumber numberWithUnsignedInt:self->_networkRequestHeaderSize];
    [v3 setObject:v33 forKey:@"network_request_header_size"];

    $AF884E7ED10AB980613DA027D2B84F87 v13 = self->_has;
    if ((*(unsigned char *)&v13 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v13 & 0x100000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_67;
    }
  }
  else if ((*(unsigned char *)&v13 & 1) == 0)
  {
    goto LABEL_21;
  }
  unint64_t v34 = +[NSNumber numberWithUnsignedLongLong:self->_networkRequestBodyBytesSent];
  [v3 setObject:v34 forKey:@"network_request_body_bytes_sent"];

  $AF884E7ED10AB980613DA027D2B84F87 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v13 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_68;
  }
LABEL_67:
  unint64_t v35 = +[NSNumber numberWithUnsignedInt:self->_networkResponseHeaderSize];
  [v3 setObject:v35 forKey:@"network_response_header_size"];

  $AF884E7ED10AB980613DA027D2B84F87 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v13 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_68:
  uint64_t v36 = +[NSNumber numberWithUnsignedLongLong:self->_networkResponseBodyBytesReceived];
  [v3 setObject:v36 forKey:@"network_response_body_bytes_received"];

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_24:
    id v14 = +[NSNumber numberWithUnsignedInt:self->_networkPreviousAttemptCount];
    [v3 setObject:v14 forKey:@"network_previous_attempt_count"];
  }
LABEL_25:
  networkFatalError = self->_networkFatalError;
  if (networkFatalError)
  {
    id v16 = [(SECC2MPError *)networkFatalError dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"network_fatal_error"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:self->_networkStatusCode];
    [v3 setObject:v17 forKey:@"network_status_code"];
  }
  networkRequestUri = self->_networkRequestUri;
  if (networkRequestUri) {
    [v3 setObject:networkRequestUri forKey:@"network_request_uri"];
  }
  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 0x20) != 0)
  {
    unint64_t v37 = +[NSNumber numberWithUnsignedLongLong:self->_timestampC2Init];
    [v3 setObject:v37 forKey:@"timestamp_c2_init"];

    $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
    if ((*(unsigned char *)&v19 & 0x80) == 0)
    {
LABEL_33:
      if ((*(unsigned char *)&v19 & 0x40) == 0) {
        goto LABEL_34;
      }
      goto LABEL_72;
    }
  }
  else if ((*(unsigned char *)&v19 & 0x80) == 0)
  {
    goto LABEL_33;
  }
  uint64_t v38 = +[NSNumber numberWithUnsignedLongLong:self->_timestampC2Start];
  [v3 setObject:v38 forKey:@"timestamp_c2_start"];

  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v19 & 0x200) == 0) {
      goto LABEL_35;
    }
    goto LABEL_73;
  }
LABEL_72:
  unint64_t v39 = +[NSNumber numberWithUnsignedLongLong:self->_timestampC2Now];
  [v3 setObject:v39 forKey:@"timestamp_c2_now"];

  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x200) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v19 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v40 = +[NSNumber numberWithUnsignedLongLong:self->_timestampDnsStart];
  [v3 setObject:v40 forKey:@"timestamp_dns_start"];

  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v19 & 0x10000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_75;
  }
LABEL_74:
  NSUInteger v41 = +[NSNumber numberWithUnsignedLongLong:self->_timestampDnsEnd];
  [v3 setObject:v41 forKey:@"timestamp_dns_end"];

  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x10000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v19 & 0x8000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_76;
  }
LABEL_75:
  NSUInteger v42 = +[NSNumber numberWithUnsignedLongLong:self->_timestampTcpStart];
  [v3 setObject:v42 forKey:@"timestamp_tcp_start"];

  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x8000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v19 & 0x4000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v43 = +[NSNumber numberWithUnsignedLongLong:self->_timestampTcpEnd];
  [v3 setObject:v43 forKey:@"timestamp_tcp_end"];

  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v19 & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_78;
  }
LABEL_77:
  NSUInteger v44 = +[NSNumber numberWithUnsignedLongLong:self->_timestampSslStart];
  [v3 setObject:v44 forKey:@"timestamp_ssl_start"];

  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v19 & 0x400) == 0) {
      goto LABEL_41;
    }
    goto LABEL_79;
  }
LABEL_78:
  NSUInteger v45 = +[NSNumber numberWithUnsignedLongLong:self->_timestampRequestStart];
  [v3 setObject:v45 forKey:@"timestamp_request_start"];

  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v19 & 0x2000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_80;
  }
LABEL_79:
  NSUInteger v46 = +[NSNumber numberWithUnsignedLongLong:self->_timestampRequestEnd];
  [v3 setObject:v46 forKey:@"timestamp_request_end"];

  $AF884E7ED10AB980613DA027D2B84F87 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x2000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v19 & 0x1000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_80:
  NSUInteger v47 = +[NSNumber numberWithUnsignedLongLong:self->_timestampResponseStart];
  [v3 setObject:v47 forKey:@"timestamp_response_start"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_43:
    $AF884E7ED10AB980613DA027D2B84F87 v20 = +[NSNumber numberWithUnsignedLongLong:self->_timestampResponseEnd];
    [v3 setObject:v20 forKey:@"timestamp_response_end"];
  }
LABEL_44:
  optionsQualityOfService = self->_optionsQualityOfService;
  if (optionsQualityOfService) {
    [v3 setObject:optionsQualityOfService forKey:@"options_quality_of_service"];
  }
  $AF884E7ED10AB980613DA027D2B84F87 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x8000000) != 0)
  {
    unint64_t v48 = +[NSNumber numberWithBool:self->_optionsOutOfProcess];
    [v3 setObject:v48 forKey:@"options_out_of_process"];

    $AF884E7ED10AB980613DA027D2B84F87 v22 = self->_has;
    if ((*(_DWORD *)&v22 & 0x10000000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v22 & 0x1000000) == 0) {
        goto LABEL_49;
      }
      goto LABEL_84;
    }
  }
  else if ((*(_DWORD *)&v22 & 0x10000000) == 0)
  {
    goto LABEL_48;
  }
  unint64_t v49 = +[NSNumber numberWithBool:self->_optionsOutOfProcessForceDiscretionary];
  [v3 setObject:v49 forKey:@"options_out_of_process_force_discretionary"];

  $AF884E7ED10AB980613DA027D2B84F87 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x1000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v22 & 0x2000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_85;
  }
LABEL_84:
  unint64_t v50 = +[NSNumber numberWithBool:self->_optionsAllowExpensiveAccess];
  [v3 setObject:v50 forKey:@"options_allow_expensive_access"];

  $AF884E7ED10AB980613DA027D2B84F87 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v22 & 0x200000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_86;
  }
LABEL_85:
  v51 = +[NSNumber numberWithBool:self->_optionsAllowPowerNapScheduling];
  [v3 setObject:v51 forKey:@"options_allow_power_nap_scheduling"];

  $AF884E7ED10AB980613DA027D2B84F87 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x200000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v22 & 0x400000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_86:
  v52 = +[NSNumber numberWithUnsignedInt:self->_optionsTimeoutIntervalForRequest];
  [v3 setObject:v52 forKey:@"options_timeout_interval_for_request"];

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_52:
    id v23 = +[NSNumber numberWithUnsignedInt:self->_optionsTimeoutIntervalForResource];
    [v3 setObject:v23 forKey:@"options_timeout_interval_for_resource"];
  }
LABEL_53:
  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if (optionsSourceApplicationBundleIdentifier) {
    [v3 setObject:optionsSourceApplicationBundleIdentifier forKey:@"options_source_application_bundle_identifier"];
  }
  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if (optionsSourceApplicationSecondaryIdentifier) {
    [v3 setObject:optionsSourceApplicationSecondaryIdentifier forKey:@"options_source_application_secondary_identifier"];
  }
  $AF884E7ED10AB980613DA027D2B84F87 v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x4000000) != 0)
  {
    unint64_t v27 = +[NSNumber numberWithBool:self->_optionsAppleIdContext];
    [v3 setObject:v27 forKey:@"options_apple_id_context"];

    $AF884E7ED10AB980613DA027D2B84F87 v26 = self->_has;
  }
  if ((*(_DWORD *)&v26 & 0x20000000) != 0)
  {
    $AF884E7ED10AB980613DA027D2B84F87 v28 = +[NSNumber numberWithBool:self->_optionsTlsPinningRequired];
    [v3 setObject:v28 forKey:@"options_tls_pinning_required"];
  }
  id v29 = v3;

  return v29;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPNetworkEvent;
  v3 = [(SECC2MPNetworkEvent *)&v7 description];
  id v4 = [(SECC2MPNetworkEvent *)self dictionaryRepresentation];
  $AF884E7ED10AB980613DA027D2B84F87 v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasOptionsTlsPinningRequired
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasOptionsTlsPinningRequired:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (void)setOptionsTlsPinningRequired:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_optionsTlsPinningRequired = a3;
}

- (BOOL)hasOptionsAppleIdContext
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasOptionsAppleIdContext:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (void)setOptionsAppleIdContext:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_optionsAppleIdContext = a3;
}

- (BOOL)hasOptionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier != 0;
}

- (BOOL)hasOptionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier != 0;
}

- (BOOL)hasOptionsTimeoutIntervalForResource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasOptionsTimeoutIntervalForResource:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (void)setOptionsTimeoutIntervalForResource:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_optionsTimeoutIntervalForResource = a3;
}

- (BOOL)hasOptionsTimeoutIntervalForRequest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasOptionsTimeoutIntervalForRequest:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (void)setOptionsTimeoutIntervalForRequest:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_optionsTimeoutIntervalForRequest = a3;
}

- (BOOL)hasOptionsAllowPowerNapScheduling
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasOptionsAllowPowerNapScheduling:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (void)setOptionsAllowPowerNapScheduling:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_optionsAllowPowerNapScheduling = a3;
}

- (BOOL)hasOptionsAllowExpensiveAccess
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasOptionsAllowExpensiveAccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (void)setOptionsAllowExpensiveAccess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_optionsAllowExpensiveAccess = a3;
}

- (BOOL)hasOptionsOutOfProcessForceDiscretionary
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (void)setOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_optionsOutOfProcessForceDiscretionary = a3;
}

- (BOOL)hasOptionsOutOfProcess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasOptionsOutOfProcess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (void)setOptionsOutOfProcess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_optionsOutOfProcess = a3;
}

- (BOOL)hasOptionsQualityOfService
{
  return self->_optionsQualityOfService != 0;
}

- (BOOL)hasTimestampResponseEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasTimestampResponseEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (void)setTimestampResponseEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_timestampResponseEnd = a3;
}

- (BOOL)hasTimestampResponseStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasTimestampResponseStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)setTimestampResponseStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_timestampResponseStart = a3;
}

- (BOOL)hasTimestampRequestEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasTimestampRequestEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (void)setTimestampRequestEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_timestampRequestEnd = a3;
}

- (BOOL)hasTimestampRequestStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasTimestampRequestStart:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (void)setTimestampRequestStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_timestampRequestStart = a3;
}

- (BOOL)hasTimestampSslStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasTimestampSslStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (void)setTimestampSslStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_timestampSslStart = a3;
}

- (BOOL)hasTimestampTcpEnd
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasTimestampTcpEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (void)setTimestampTcpEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_timestampTcpEnd = a3;
}

- (BOOL)hasTimestampTcpStart
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasTimestampTcpStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (void)setTimestampTcpStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_timestampTcpStart = a3;
}

- (BOOL)hasTimestampDnsEnd
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasTimestampDnsEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (void)setTimestampDnsEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_timestampDnsEnd = a3;
}

- (BOOL)hasTimestampDnsStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasTimestampDnsStart:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (void)setTimestampDnsStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_timestampDnsStart = a3;
}

- (BOOL)hasTimestampC2Now
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasTimestampC2Now:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (void)setTimestampC2Now:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_timestampC2Now = a3;
}

- (BOOL)hasTimestampC2Start
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasTimestampC2Start:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (void)setTimestampC2Start:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_timestampC2Start = a3;
}

- (BOOL)hasTimestampC2Init
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasTimestampC2Init:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (void)setTimestampC2Init:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_timestampC2Init = a3;
}

- (BOOL)hasNetworkRequestUri
{
  return self->_networkRequestUri != 0;
}

- (BOOL)hasNetworkStatusCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNetworkStatusCode:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (void)setNetworkStatusCode:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_networkStatusCode = a3;
}

- (BOOL)hasNetworkFatalError
{
  return self->_networkFatalError != 0;
}

- (BOOL)hasNetworkPreviousAttemptCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasNetworkPreviousAttemptCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (void)setNetworkPreviousAttemptCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_networkPreviousAttemptCount = a3;
}

- (BOOL)hasNetworkResponseBodyBytesReceived
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNetworkResponseBodyBytesReceived:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (void)setNetworkResponseBodyBytesReceived:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_networkResponseBodyBytesReceived = a3;
}

- (BOOL)hasNetworkResponseHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasNetworkResponseHeaderSize:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (void)setNetworkResponseHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_networkResponseHeaderSize = a3;
}

- (BOOL)hasNetworkRequestBodyBytesSent
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasNetworkRequestBodyBytesSent:(BOOL)a3
{
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (void)setNetworkRequestBodyBytesSent:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_networkRequestBodyBytesSent = a3;
}

- (BOOL)hasNetworkRequestHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasNetworkRequestHeaderSize:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (void)setNetworkRequestHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_networkRequestHeaderSize = a3;
}

- (BOOL)hasNetworkProtocolName
{
  return self->_networkProtocolName != 0;
}

- (BOOL)hasNetworkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier != 0;
}

- (BOOL)hasNetworkConnectionReused
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasNetworkConnectionReused:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (void)setNetworkConnectionReused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_networkConnectionReused = a3;
}

- (BOOL)hasNetworkConnectionUuid
{
  return self->_networkConnectionUuid != 0;
}

- (BOOL)hasNetworkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort != 0;
}

- (BOOL)hasNetworkHostname
{
  return self->_networkHostname != 0;
}

- (BOOL)hasNetworkTaskDescription
{
  return self->_networkTaskDescription != 0;
}

- (BOOL)hasReportFrequencyBase
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_reportFrequencyBase = a3;
}

- (BOOL)hasReportFrequency
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_reportFrequency = a3;
}

- (BOOL)hasTriggers
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasTriggers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$AF884E7ED10AB980613DA027D2B84F87 has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (void)setTriggers:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_triggers = a3;
}

@end