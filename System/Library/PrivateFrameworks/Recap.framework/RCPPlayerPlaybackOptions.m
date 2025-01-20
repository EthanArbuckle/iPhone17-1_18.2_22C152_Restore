@interface RCPPlayerPlaybackOptions
- (BOOL)ignoreSenderProperties;
- (BOOL)linkEventDeliveryToDisplayRefreshRate;
- (BOOL)useHIDEventTimestampsForDelivery;
- (BOOL)useVirtualHIDServices;
- (CGAffineTransform)transform;
- (RCPPlayerPlaybackOptions)init;
- (double)firstEventFrameDelay;
- (double)minDelayBetweenSends;
- (double)playbackSpeedFactor;
- (id)customizeHIDEvent;
- (unint64_t)timestampForEventReplay:(id)a3;
- (void)setCustomizeHIDEvent:(id)a3;
- (void)setFirstEventFrameDelay:(double)a3;
- (void)setIgnoreSenderProperties:(BOOL)a3;
- (void)setLinkEventDeliveryToDisplayRefreshRate:(BOOL)a3;
- (void)setMinDelayBetweenSends:(double)a3;
- (void)setPlaybackSpeedFactor:(double)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setUseHIDEventTimestampsForDelivery:(BOOL)a3;
- (void)setUseVirtualHIDServices:(BOOL)a3;
@end

@implementation RCPPlayerPlaybackOptions

- (void).cxx_destruct
{
}

- (unint64_t)timestampForEventReplay:(id)a3
{
  if (self->_useHIDEventTimestampsForDelivery) {
    return [a3 timestamp];
  }
  else {
    return [a3 deliveryTimestamp];
  }
}

- (BOOL)linkEventDeliveryToDisplayRefreshRate
{
  return self->_linkEventDeliveryToDisplayRefreshRate;
}

- (RCPPlayerPlaybackOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)RCPPlayerPlaybackOptions;
  v2 = [(RCPPlayerPlaybackOptions *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(RCPPlayerPlaybackOptions *)v2 setPlaybackSpeedFactor:1.0];
    [(RCPPlayerPlaybackOptions *)v3 setMinDelayBetweenSends:0.0];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v6[0] = *MEMORY[0x1E4F1DAB8];
    v6[1] = v4;
    v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(RCPPlayerPlaybackOptions *)v3 setTransform:v6];
    [(RCPPlayerPlaybackOptions *)v3 setLinkEventDeliveryToDisplayRefreshRate:0];
  }
  return v3;
}

- (void)setPlaybackSpeedFactor:(double)a3
{
  self->_playbackSpeedFactor = a3;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (void)setMinDelayBetweenSends:(double)a3
{
  self->_minDelayBetweenSends = a3;
}

- (void)setLinkEventDeliveryToDisplayRefreshRate:(BOOL)a3
{
  self->_linkEventDeliveryToDisplayRefreshRate = a3;
}

- (double)playbackSpeedFactor
{
  return self->_playbackSpeedFactor;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (double)minDelayBetweenSends
{
  return self->_minDelayBetweenSends;
}

- (id)customizeHIDEvent
{
  return self->_customizeHIDEvent;
}

- (double)firstEventFrameDelay
{
  return self->_firstEventFrameDelay;
}

- (void)setFirstEventFrameDelay:(double)a3
{
  self->_firstEventFrameDelay = a3;
}

- (BOOL)useVirtualHIDServices
{
  return self->_useVirtualHIDServices;
}

- (void)setUseVirtualHIDServices:(BOOL)a3
{
  self->_useVirtualHIDServices = a3;
}

- (BOOL)useHIDEventTimestampsForDelivery
{
  return self->_useHIDEventTimestampsForDelivery;
}

- (void)setUseHIDEventTimestampsForDelivery:(BOOL)a3
{
  self->_useHIDEventTimestampsForDelivery = a3;
}

- (BOOL)ignoreSenderProperties
{
  return self->_ignoreSenderProperties;
}

- (void)setIgnoreSenderProperties:(BOOL)a3
{
  self->_ignoreSenderProperties = a3;
}

- (void)setCustomizeHIDEvent:(id)a3
{
}

@end