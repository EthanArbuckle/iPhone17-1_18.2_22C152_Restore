@interface TSgPTPPortStatistics
- (NSString)portIdentifier;
- (TSgPTPPortStatistics)init;
- (TSgPTPPortStatistics)initWithDC:(id)a3;
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

@implementation TSgPTPPortStatistics

- (TSgPTPPortStatistics)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[TSgPTPPortStatistics init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (TSgPTPPortStatistics)initWithDC:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSgPTPPortStatistics;
  v5 = [(TSgPTPPortStatistics *)&v9 init];
  if (v5)
  {
    v5->_portType = [v4 portType];
    uint64_t v6 = [v4 portIdentifier];
    portIdentifier = v5->_portIdentifier;
    v5->_portIdentifier = (NSString *)v6;

    v5->_portRole = [v4 portRole];
    v5->_receivedSyncCounter = [v4 receivedSyncCounter];
    v5->_receivedFollowUpCounter = [v4 receivedFollowUpCounter];
    v5->_receivedAnnounceCounter = [v4 receivedAnnounceCounter];
    v5->_receivedSignalCounter = [v4 receivedSignalCounter];
    v5->_receivedPacketDiscardCounter = [v4 receivedPacketDiscardCounter];
    v5->_syncReceiptTimeoutCounter = [v4 syncReceiptTimeoutCounter];
    v5->_announceReceiptTimeoutCounter = [v4 announceReceiptTimeoutCounter];
    v5->_allowedLostResponsesExceededCounter = [v4 allowedLostResponsesExceededCounter];
    v5->_transmittedSyncCounter = [v4 transmittedSyncCounter];
    v5->_transmittedFollowUpCounter = [v4 transmittedFollowUpCounter];
    v5->_transmittedAnnounceCounter = [v4 transmittedAnnounceCounter];
    v5->_transmittedSignalCounter = [v4 transmittedSignalCounter];
    v5->_transmittedPacketDiscardCounter = [v4 transmittedPacketDiscardCounter];
    v5->_attemptedSyncCounter = [v4 attemptedSyncCounter];
    v5->_attemptedFollowUpCounter = [v4 attemptedFollowUpCounter];
    v5->_attemptedAnnounceCounter = [v4 attemptedAnnounceCounter];
    v5->_attemptedSignalCounter = [v4 attemptedSignalCounter];
    v5->_rawDelayExceededCounter = [v4 rawDelayExceededCounter];
    v5->_rawDelayMeasurementCounter = [v4 rawDelayMeasurementCounter];
    v5->_receivedPDelayRequestCounter = [v4 receivedPDelayRequestCounter];
    v5->_transmittedPDelayResponseCounter = [v4 transmittedPDelayResponseCounter];
    v5->_transmittedPDelayResponseFollowUpCounter = [v4 transmittedPDelayResponseFollowUpCounter];
    v5->_attemptedPDelayResponseCounter = [v4 attemptedPDelayResponseCounter];
    v5->_attemptedPDelayResponseFollowUpCounter = [v4 attemptedPDelayResponseFollowUpCounter];
    v5->_transmittedPDelayRequestCounter = [v4 transmittedPDelayRequestCounter];
    v5->_attemptedPDelayRequestCounter = [v4 attemptedPDelayRequestCounter];
    v5->_receivedPDelayResponseCounter = [v4 receivedPDelayResponseCounter];
    v5->_receivedPDelayResponseFollowUpCounter = [v4 receivedPDelayResponseFollowUpCounter];
    v5->_receivedDelayRequestCounter = [v4 receivedDelayRequestCounter];
    v5->_transmittedDelayResponseCounter = [v4 transmittedDelayResponseCounter];
    v5->_attemptedDelayResponseCounter = [v4 attemptedDelayResponseCounter];
    v5->_transmittedDelayRequestCounter = [v4 transmittedDelayRequestCounter];
    v5->_attemptedDelayRequestCounter = [v4 attemptedDelayRequestCounter];
    v5->_receivedDelayResponseCounter = [v4 receivedDelayResponseCounter];
    v5->_supersededSyncCounter = [v4 supersededSyncCounter];
    v5->_supersededDelayCounter = [v4 supersededDelayCounter];
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