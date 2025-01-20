@interface NIServerFindingPeerTracking
+ (NIServerFindingPeerTracking)peerTrackingWithDiscoveryState:(int)a3 advertisingState:(int)a4 rangingState:(int)a5 algorithmOutputFlags:(unsigned __int8)a6 receivedSignalFlags:(unsigned __int8)a7 tellClientAboutPeer:(BOOL)a8 clientWantsUpdates:(BOOL)a9 nbUwbAcquisitionChannelIdx:(id)a10;
+ (id)peerTrackingInitialState;
+ (id)peerTrackingTerminalState;
- (BOOL)clientWantsUpdates;
- (BOOL)hasReceivedRangingData;
- (BOOL)isAttemptingToRange;
- (BOOL)isDoingAnything;
- (BOOL)isEqual:(id)a3;
- (BOOL)tellClientAboutPeer;
- (NSNumber)nbUwbAcquisitionChannelIdx;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)advertisingState;
- (int)discoveryState;
- (int)rangingState;
- (unsigned)algorithmOutputFlags;
- (unsigned)receivedSignalFlags;
- (void)setAdvertisingState:(int)a3;
- (void)setAlgorithmOutputFlags:(unsigned __int8)a3;
- (void)setClientWantsUpdates:(BOOL)a3;
- (void)setDiscoveryState:(int)a3;
- (void)setNbUwbAcquisitionChannelIdx:(id)a3;
- (void)setRangingState:(int)a3;
- (void)setReceivedSignalFlags:(unsigned __int8)a3;
- (void)setTellClientAboutPeer:(BOOL)a3;
@end

@implementation NIServerFindingPeerTracking

+ (NIServerFindingPeerTracking)peerTrackingWithDiscoveryState:(int)a3 advertisingState:(int)a4 rangingState:(int)a5 algorithmOutputFlags:(unsigned __int8)a6 receivedSignalFlags:(unsigned __int8)a7 tellClientAboutPeer:(BOOL)a8 clientWantsUpdates:(BOOL)a9 nbUwbAcquisitionChannelIdx:(id)a10
{
  BOOL v10 = a8;
  uint64_t v11 = a7;
  uint64_t v12 = a6;
  uint64_t v13 = *(void *)&a5;
  uint64_t v14 = *(void *)&a4;
  uint64_t v15 = *(void *)&a3;
  id v16 = a10;
  v17 = objc_alloc_init(NIServerFindingPeerTracking);
  [(NIServerFindingPeerTracking *)v17 setDiscoveryState:v15];
  [(NIServerFindingPeerTracking *)v17 setAdvertisingState:v14];
  [(NIServerFindingPeerTracking *)v17 setRangingState:v13];
  [(NIServerFindingPeerTracking *)v17 setAlgorithmOutputFlags:v12];
  [(NIServerFindingPeerTracking *)v17 setReceivedSignalFlags:v11];
  [(NIServerFindingPeerTracking *)v17 setTellClientAboutPeer:v10];
  [(NIServerFindingPeerTracking *)v17 setClientWantsUpdates:a9];
  [(NIServerFindingPeerTracking *)v17 setNbUwbAcquisitionChannelIdx:v16];

  return v17;
}

+ (id)peerTrackingInitialState
{
  LOBYTE(v3) = 0;
  return +[NIServerFindingPeerTracking peerTrackingWithDiscoveryState:0 advertisingState:0 rangingState:0 algorithmOutputFlags:0 receivedSignalFlags:0 tellClientAboutPeer:0 clientWantsUpdates:v3 nbUwbAcquisitionChannelIdx:0];
}

+ (id)peerTrackingTerminalState
{
  LOBYTE(v3) = 0;
  return +[NIServerFindingPeerTracking peerTrackingWithDiscoveryState:4 advertisingState:2 rangingState:4 algorithmOutputFlags:0 receivedSignalFlags:0 tellClientAboutPeer:0 clientWantsUpdates:v3 nbUwbAcquisitionChannelIdx:0];
}

- (BOOL)isDoingAnything
{
  return (self->_discoveryState - 1) < 3
      || self->_advertisingState == 1
      || (self->_rangingState - 1) < 3;
}

- (BOOL)isAttemptingToRange
{
  return (self->_rangingState - 1) < 3;
}

- (BOOL)hasReceivedRangingData
{
  return (self->_rangingState & 0xFFFFFFFE) == 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LOBYTE(v4) = self->_clientWantsUpdates;
  +[NIServerFindingPeerTracking peerTrackingWithDiscoveryState:self->_discoveryState advertisingState:self->_advertisingState rangingState:self->_rangingState algorithmOutputFlags:self->_algorithmOutputFlags receivedSignalFlags:self->_receivedSignalFlags tellClientAboutPeer:self->_tellClientAboutPeer clientWantsUpdates:v4 nbUwbAcquisitionChannelIdx:self->_nbUwbAcquisitionChannelIdx];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NIServerFindingPeerTracking *)v4;
    v6 = v5;
    if (v5 == self)
    {
      char v8 = 1;
LABEL_22:

      goto LABEL_23;
    }
    if (self->_nbUwbAcquisitionChannelIdx)
    {
      BOOL v7 = 0;
    }
    else
    {
      v9 = [(NIServerFindingPeerTracking *)v5 nbUwbAcquisitionChannelIdx];
      BOOL v7 = v9 == 0;

      if (!self->_nbUwbAcquisitionChannelIdx)
      {
        unsigned __int8 v13 = 0;
LABEL_12:
        int discoveryState = self->_discoveryState;
        if (discoveryState == [(NIServerFindingPeerTracking *)v6 discoveryState]
          && (int advertisingState = self->_advertisingState,
              advertisingState == [(NIServerFindingPeerTracking *)v6 advertisingState])
          && (int rangingState = self->_rangingState,
              rangingState == [(NIServerFindingPeerTracking *)v6 rangingState])
          && (int algorithmOutputFlags = self->_algorithmOutputFlags,
              algorithmOutputFlags == [(NIServerFindingPeerTracking *)v6 algorithmOutputFlags])
          && (int receivedSignalFlags = self->_receivedSignalFlags,
              receivedSignalFlags == [(NIServerFindingPeerTracking *)v6 receivedSignalFlags])
          && (BOOL tellClientAboutPeer = self->_tellClientAboutPeer,
              tellClientAboutPeer == [(NIServerFindingPeerTracking *)v6 tellClientAboutPeer]))
        {
          BOOL clientWantsUpdates = self->_clientWantsUpdates;
          if (clientWantsUpdates == [(NIServerFindingPeerTracking *)v6 clientWantsUpdates]) {
            char v8 = v7 | v13;
          }
          else {
            char v8 = 0;
          }
        }
        else
        {
          char v8 = 0;
        }
        goto LABEL_22;
      }
    }
    BOOL v10 = [(NIServerFindingPeerTracking *)v6 nbUwbAcquisitionChannelIdx];
    if (v10)
    {
      nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
      uint64_t v12 = [(NIServerFindingPeerTracking *)v6 nbUwbAcquisitionChannelIdx];
      unsigned __int8 v13 = [(NSNumber *)nbUwbAcquisitionChannelIdx isEqualToNumber:v12];
    }
    else
    {
      unsigned __int8 v13 = 0;
    }

    goto LABEL_12;
  }
  char v8 = 0;
LABEL_23:

  return v8;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  uint64_t discoveryState = self->_discoveryState;
  if (discoveryState > 4) {
    v5 = "Unkn";
  }
  else {
    v5 = off_10085F340[discoveryState];
  }
  uint64_t advertisingState = self->_advertisingState;
  if (advertisingState > 2) {
    BOOL v7 = "Unkn ";
  }
  else {
    BOOL v7 = off_10085F368[advertisingState];
  }
  uint64_t rangingState = self->_rangingState;
  if (rangingState > 4) {
    v9 = "Unkn ";
  }
  else {
    v9 = off_10085F380[rangingState];
  }
  uint64_t algorithmOutputFlags = self->_algorithmOutputFlags;
  uint64_t receivedSignalFlags = self->_receivedSignalFlags;
  BOOL tellClientAboutPeer = self->_tellClientAboutPeer;
  BOOL clientWantsUpdates = self->_clientWantsUpdates;
  nbUwbAcquisitionChannelIdx = self->_nbUwbAcquisitionChannelIdx;
  if (nbUwbAcquisitionChannelIdx)
  {
    std::to_string(&v18, [(NSNumber *)nbUwbAcquisitionChannelIdx intValue]);
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v15 = &v18;
    }
    else {
      uint64_t v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
    }
  }
  else
  {
    uint64_t v15 = (std::string *)"---";
  }
  id v16 = [v3 initWithFormat:@"[ D:%s | A:%s | R:%s | G:%02X | S:%02X | N:%d | U:%d | C:%-3s ]", v5, v7, v9, algorithmOutputFlags, receivedSignalFlags, tellClientAboutPeer, clientWantsUpdates, v15];
  if (nbUwbAcquisitionChannelIdx && SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }

  return v16;
}

- (int)discoveryState
{
  return self->_discoveryState;
}

- (void)setDiscoveryState:(int)a3
{
  self->_uint64_t discoveryState = a3;
}

- (int)advertisingState
{
  return self->_advertisingState;
}

- (void)setAdvertisingState:(int)a3
{
  self->_uint64_t advertisingState = a3;
}

- (int)rangingState
{
  return self->_rangingState;
}

- (void)setRangingState:(int)a3
{
  self->_uint64_t rangingState = a3;
}

- (unsigned)algorithmOutputFlags
{
  return self->_algorithmOutputFlags;
}

- (void)setAlgorithmOutputFlags:(unsigned __int8)a3
{
  self->_uint64_t algorithmOutputFlags = a3;
}

- (unsigned)receivedSignalFlags
{
  return self->_receivedSignalFlags;
}

- (void)setReceivedSignalFlags:(unsigned __int8)a3
{
  self->_uint64_t receivedSignalFlags = a3;
}

- (BOOL)tellClientAboutPeer
{
  return self->_tellClientAboutPeer;
}

- (void)setTellClientAboutPeer:(BOOL)a3
{
  self->_BOOL tellClientAboutPeer = a3;
}

- (BOOL)clientWantsUpdates
{
  return self->_clientWantsUpdates;
}

- (void)setClientWantsUpdates:(BOOL)a3
{
  self->_BOOL clientWantsUpdates = a3;
}

- (NSNumber)nbUwbAcquisitionChannelIdx
{
  return self->_nbUwbAcquisitionChannelIdx;
}

- (void)setNbUwbAcquisitionChannelIdx:(id)a3
{
}

- (void).cxx_destruct
{
}

@end