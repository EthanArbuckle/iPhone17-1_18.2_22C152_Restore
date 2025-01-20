@interface TSDgPTPPortStatistics
- (NSString)portIdentifier;
- (TSDgPTPPortStatistics)init;
- (TSDgPTPPortStatistics)initWithPort:(id)a3;
- (int)portRole;
- (int)portType;
- (unsigned)allowedLostResponsesExceededCounter;
- (unsigned)announceReceiptTimeoutCounter;
- (unsigned)attemptedAnnounceCounter;
- (unsigned)attemptedDelayRequestCounter;
- (unsigned)attemptedDelayResponseCounter;
- (unsigned)attemptedFollowUpCounter;
- (unsigned)attemptedPDelayRequestCounter;
- (unsigned)attemptedPDelayResponseCounter;
- (unsigned)attemptedPDelayResponseFollowUpCounter;
- (unsigned)attemptedSignalCounter;
- (unsigned)attemptedSyncCounter;
- (unsigned)rawDelayExceededCounter;
- (unsigned)rawDelayMeasurementCounter;
- (unsigned)receivedAnnounceCounter;
- (unsigned)receivedDelayRequestCounter;
- (unsigned)receivedDelayResponseCounter;
- (unsigned)receivedFollowUpCounter;
- (unsigned)receivedPDelayRequestCounter;
- (unsigned)receivedPDelayResponseCounter;
- (unsigned)receivedPDelayResponseFollowUpCounter;
- (unsigned)receivedPacketDiscardCounter;
- (unsigned)receivedSignalCounter;
- (unsigned)receivedSyncCounter;
- (unsigned)supersededDelayCounter;
- (unsigned)supersededSyncCounter;
- (unsigned)syncReceiptTimeoutCounter;
- (unsigned)transmittedAnnounceCounter;
- (unsigned)transmittedDelayRequestCounter;
- (unsigned)transmittedDelayResponseCounter;
- (unsigned)transmittedFollowUpCounter;
- (unsigned)transmittedPDelayRequestCounter;
- (unsigned)transmittedPDelayResponseCounter;
- (unsigned)transmittedPDelayResponseFollowUpCounter;
- (unsigned)transmittedPacketDiscardCounter;
- (unsigned)transmittedSignalCounter;
- (unsigned)transmittedSyncCounter;
@end

@implementation TSDgPTPPortStatistics

- (TSDgPTPPortStatistics)init
{
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSDgPTPPortStatistics init]");
  +[NSException raise:NSInvalidArgumentException, @"Do not call %@", v3 format];

  return 0;
}

- (TSDgPTPPortStatistics)initWithPort:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)TSDgPTPPortStatistics;
  v5 = [(TSDgPTPPortStatistics *)&v64 init];
  if (v5)
  {
    v5->_portType = [v4 portType];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = objc_alloc((Class)NSString);
      v7 = [v4 interfaceName];
      v8 = (NSString *)[v6 initWithFormat:@"Ethernet|%@", v7];
      portIdentifier = v5->_portIdentifier;
      v5->_portIdentifier = v8;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = objc_alloc((Class)NSString);
        v7 = [v4 interfaceName];
        portIdentifier = [v4 destinationAddressString];
        v11 = (NSString *)[v10 initWithFormat:@"LLPtP|%@|%@", v7, portIdentifier];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = objc_alloc((Class)NSString);
          v7 = [v4 interfaceName];
          portIdentifier = [v4 destinationAddressString];
          v11 = (NSString *)[v12 initWithFormat:@"UDPv4PtP|%@|%@", v7, portIdentifier];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = objc_alloc((Class)NSString);
            v7 = [v4 interfaceName];
            portIdentifier = [v4 destinationAddressString];
            v11 = (NSString *)[v13 initWithFormat:@"UDPv6PtP|%@|%@", v7, portIdentifier];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = objc_alloc((Class)NSString);
              v7 = [v4 interfaceName];
              portIdentifier = [v4 destinationAddressString];
              v11 = (NSString *)[v14 initWithFormat:@"LLEtE|%@|%@", v7, portIdentifier];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v15 = objc_alloc((Class)NSString);
                v7 = [v4 interfaceName];
                portIdentifier = [v4 destinationAddressString];
                v11 = (NSString *)[v15 initWithFormat:@"UDPv4EtE|%@|%@", v7, portIdentifier];
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_18;
                }
                id v16 = objc_alloc((Class)NSString);
                v7 = [v4 interfaceName];
                portIdentifier = [v4 destinationAddressString];
                v11 = (NSString *)[v16 initWithFormat:@"UDPv6EtE|%@|%@", v7, portIdentifier];
              }
            }
          }
        }
      }
      v17 = v5->_portIdentifier;
      v5->_portIdentifier = v11;
    }
LABEL_18:
    v5->_portRole = [v4 portRole];
    v18 = [v4 service];
    v19 = [v18 iodProperties];

    if (v19)
    {
      v20 = [v19 objectForKeyedSubscript:@"ReceivedSyncCounter"];
      v5->_receivedSyncCounter = [v20 unsignedIntValue];

      v21 = [v19 objectForKeyedSubscript:@"ReceivedFollowUpCounter"];
      v5->_receivedFollowUpCounter = [v21 unsignedIntValue];

      v22 = [v19 objectForKeyedSubscript:@"ReceivedAnnounceCounter"];
      v5->_receivedAnnounceCounter = [v22 unsignedIntValue];

      v23 = [v19 objectForKeyedSubscript:@"ReceivedSignalCounter"];
      v5->_receivedSignalCounter = [v23 unsignedIntValue];

      v5->_receivedPacketDiscardCounter = 0;
      v24 = [v19 objectForKeyedSubscript:@"SyncReceiptTimeoutCounter"];
      v5->_syncReceiptTimeoutCounter = [v24 unsignedIntValue];

      v25 = [v19 objectForKeyedSubscript:@"AnnounceReceiptTimeoutCounter"];
      v5->_announceReceiptTimeoutCounter = [v25 unsignedIntValue];

      v26 = [v19 objectForKeyedSubscript:@"AllowedLostResponsesExceededCounter"];
      v5->_allowedLostResponsesExceededCounter = [v26 unsignedIntValue];

      v27 = [v19 objectForKeyedSubscript:@"TransmittedSyncCounter"];
      v5->_transmittedSyncCounter = [v27 unsignedIntValue];

      v28 = [v19 objectForKeyedSubscript:@"TransmittedFollowUpCounter"];
      v5->_transmittedFollowUpCounter = [v28 unsignedIntValue];

      v29 = [v19 objectForKeyedSubscript:@"TransmittedAnnounceCounter"];
      v5->_transmittedAnnounceCounter = [v29 unsignedIntValue];

      v30 = [v19 objectForKeyedSubscript:@"TransmittedSignalCounter"];
      v5->_transmittedSignalCounter = [v30 unsignedIntValue];

      v31 = [v19 objectForKeyedSubscript:@"TransmittedPacketDiscardCounter"];
      v5->_transmittedPacketDiscardCounter = [v31 unsignedIntValue];

      v32 = [v19 objectForKeyedSubscript:@"AttemptedSyncCounter"];
      v5->_attemptedSyncCounter = [v32 unsignedIntValue];

      v33 = [v19 objectForKeyedSubscript:@"AttemptedFollowUpCounter"];
      v5->_attemptedFollowUpCounter = [v33 unsignedIntValue];

      v34 = [v19 objectForKeyedSubscript:@"AttemptedAnnounceCounter"];
      v5->_attemptedAnnounceCounter = [v34 unsignedIntValue];

      v35 = [v19 objectForKeyedSubscript:@"AttemptedSignalCounter"];
      v5->_attemptedSignalCounter = [v35 unsignedIntValue];

      v36 = [v19 objectForKeyedSubscript:@"RawDelayExceededCounter"];
      v5->_rawDelayExceededCounter = [v36 unsignedIntValue];

      v37 = [v19 objectForKeyedSubscript:@"RawDelayMeasurementCounter"];
      v5->_rawDelayMeasurementCounter = [v37 unsignedIntValue];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = [v19 objectForKeyedSubscript:@"ReceivedPDelayRequestCounter"];
        v5->_receivedPDelayRequestCounter = [v38 unsignedIntValue];

        CFStringRef v62 = @"ReceivedPDelayResponseCounter";
        CFStringRef v63 = @"ReceivedPDelayResponseFollowUpCounter";
        CFStringRef v39 = @"AttemptedPDelayResponseCounter";
        CFStringRef v40 = @"TransmittedPDelayResponseFollowUpCounter";
        CFStringRef v60 = @"AttemptedPDelayRequestCounter";
        uint64_t v61 = 124;
        CFStringRef v58 = @"TransmittedPDelayRequestCounter";
        uint64_t v59 = 120;
        CFStringRef v56 = @"AttemptedPDelayResponseFollowUpCounter";
        uint64_t v57 = 116;
        uint64_t v55 = 112;
        uint64_t v41 = 108;
        uint64_t v42 = 104;
        uint64_t v43 = 100;
        uint64_t v44 = 96;
        CFStringRef v45 = @"TransmittedPDelayResponseCounter";
LABEL_23:
        v46 = [v19 objectForKeyedSubscript:v45];
        *(_DWORD *)((char *)&v5->super.isa + v44) = [v46 unsignedIntValue];

        v47 = [v19 objectForKeyedSubscript:v40];
        *(_DWORD *)((char *)&v5->super.isa + v43) = [v47 unsignedIntValue];

        v48 = [v19 objectForKeyedSubscript:v39];
        *(_DWORD *)((char *)&v5->super.isa + v42) = [v48 unsignedIntValue];

        v49 = [v19 objectForKeyedSubscript:v56];
        *(_DWORD *)((char *)&v5->super.isa + v41) = [v49 unsignedIntValue];

        v50 = [v19 objectForKeyedSubscript:v58];
        *(_DWORD *)((char *)&v5->super.isa + v55) = [v50 unsignedIntValue];

        v51 = [v19 objectForKeyedSubscript:v60];
        *(_DWORD *)((char *)&v5->super.isa + v57) = [v51 unsignedIntValue];

        v52 = [v19 objectForKeyedSubscript:v62];
        *(_DWORD *)((char *)&v5->super.isa + v59) = [v52 unsignedIntValue];

        v53 = [v19 objectForKeyedSubscript:v63];
        *(_DWORD *)((char *)&v5->super.isa + v61) = [v53 unsignedIntValue];

        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFStringRef v62 = @"SupersededSyncCounter";
        CFStringRef v63 = @"SupersededDelayCounter";
        CFStringRef v39 = @"AttemptedDelayResponseCounter";
        CFStringRef v40 = @"TransmittedDelayResponseCounter";
        CFStringRef v60 = @"ReceivedDelayResponseCounter";
        uint64_t v61 = 156;
        CFStringRef v58 = @"AttemptedDelayRequestCounter";
        uint64_t v59 = 152;
        CFStringRef v56 = @"TransmittedDelayRequestCounter";
        uint64_t v57 = 148;
        uint64_t v55 = 144;
        uint64_t v41 = 140;
        uint64_t v42 = 136;
        uint64_t v43 = 132;
        uint64_t v44 = 128;
        CFStringRef v45 = @"ReceivedDelayRequestCounter";
        goto LABEL_23;
      }
    }
LABEL_24:
  }
  return v5;
}

- (NSString)portIdentifier
{
  return self->_portIdentifier;
}

- (int)portType
{
  return self->_portType;
}

- (int)portRole
{
  return self->_portRole;
}

- (unsigned)receivedSyncCounter
{
  return self->_receivedSyncCounter;
}

- (unsigned)receivedFollowUpCounter
{
  return self->_receivedFollowUpCounter;
}

- (unsigned)receivedAnnounceCounter
{
  return self->_receivedAnnounceCounter;
}

- (unsigned)receivedSignalCounter
{
  return self->_receivedSignalCounter;
}

- (unsigned)receivedPacketDiscardCounter
{
  return self->_receivedPacketDiscardCounter;
}

- (unsigned)syncReceiptTimeoutCounter
{
  return self->_syncReceiptTimeoutCounter;
}

- (unsigned)announceReceiptTimeoutCounter
{
  return self->_announceReceiptTimeoutCounter;
}

- (unsigned)allowedLostResponsesExceededCounter
{
  return self->_allowedLostResponsesExceededCounter;
}

- (unsigned)transmittedSyncCounter
{
  return self->_transmittedSyncCounter;
}

- (unsigned)transmittedFollowUpCounter
{
  return self->_transmittedFollowUpCounter;
}

- (unsigned)transmittedAnnounceCounter
{
  return self->_transmittedAnnounceCounter;
}

- (unsigned)transmittedSignalCounter
{
  return self->_transmittedSignalCounter;
}

- (unsigned)transmittedPacketDiscardCounter
{
  return self->_transmittedPacketDiscardCounter;
}

- (unsigned)attemptedSyncCounter
{
  return self->_attemptedSyncCounter;
}

- (unsigned)attemptedFollowUpCounter
{
  return self->_attemptedFollowUpCounter;
}

- (unsigned)attemptedAnnounceCounter
{
  return self->_attemptedAnnounceCounter;
}

- (unsigned)attemptedSignalCounter
{
  return self->_attemptedSignalCounter;
}

- (unsigned)rawDelayExceededCounter
{
  return self->_rawDelayExceededCounter;
}

- (unsigned)rawDelayMeasurementCounter
{
  return self->_rawDelayMeasurementCounter;
}

- (unsigned)receivedPDelayRequestCounter
{
  return self->_receivedPDelayRequestCounter;
}

- (unsigned)transmittedPDelayResponseCounter
{
  return self->_transmittedPDelayResponseCounter;
}

- (unsigned)transmittedPDelayResponseFollowUpCounter
{
  return self->_transmittedPDelayResponseFollowUpCounter;
}

- (unsigned)attemptedPDelayResponseCounter
{
  return self->_attemptedPDelayResponseCounter;
}

- (unsigned)attemptedPDelayResponseFollowUpCounter
{
  return self->_attemptedPDelayResponseFollowUpCounter;
}

- (unsigned)transmittedPDelayRequestCounter
{
  return self->_transmittedPDelayRequestCounter;
}

- (unsigned)attemptedPDelayRequestCounter
{
  return self->_attemptedPDelayRequestCounter;
}

- (unsigned)receivedPDelayResponseCounter
{
  return self->_receivedPDelayResponseCounter;
}

- (unsigned)receivedPDelayResponseFollowUpCounter
{
  return self->_receivedPDelayResponseFollowUpCounter;
}

- (unsigned)receivedDelayRequestCounter
{
  return self->_receivedDelayRequestCounter;
}

- (unsigned)transmittedDelayResponseCounter
{
  return self->_transmittedDelayResponseCounter;
}

- (unsigned)attemptedDelayResponseCounter
{
  return self->_attemptedDelayResponseCounter;
}

- (unsigned)transmittedDelayRequestCounter
{
  return self->_transmittedDelayRequestCounter;
}

- (unsigned)attemptedDelayRequestCounter
{
  return self->_attemptedDelayRequestCounter;
}

- (unsigned)receivedDelayResponseCounter
{
  return self->_receivedDelayResponseCounter;
}

- (unsigned)supersededSyncCounter
{
  return self->_supersededSyncCounter;
}

- (unsigned)supersededDelayCounter
{
  return self->_supersededDelayCounter;
}

- (void).cxx_destruct
{
}

@end