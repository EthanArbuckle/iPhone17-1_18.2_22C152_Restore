@interface CLPedestrianFenceMetadata
- (BOOL)hasValidData;
- (NSString)clientIdentifier;
- (NSString)fenceID;
- (double)timeFenceExit;
- (double)timeFenceStart;
- (float)radius;
- (void)dealloc;
- (void)setClientIdentifier:(id)a3;
- (void)setFenceID:(id)a3;
- (void)setRadius:(float)a3;
- (void)setTimeFenceExit:(double)a3;
- (void)setTimeFenceStart:(double)a3;
@end

@implementation CLPedestrianFenceMetadata

- (void)dealloc
{
  self->_fenceID = 0;
  self->_clientIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceMetadata;
  [(CLPedestrianFenceMetadata *)&v3 dealloc];
}

- (BOOL)hasValidData
{
  return self->_timeFenceStart > 0.0
      && self->_timeFenceExit > 0.0
      && self->_fenceID
      && self->_clientIdentifier
      && self->_radius > 0.0;
}

- (double)timeFenceStart
{
  return self->_timeFenceStart;
}

- (void)setTimeFenceStart:(double)a3
{
  self->_timeFenceStart = a3;
}

- (double)timeFenceExit
{
  return self->_timeFenceExit;
}

- (void)setTimeFenceExit:(double)a3
{
  self->_timeFenceExit = a3;
}

- (NSString)fenceID
{
  return self->_fenceID;
}

- (void)setFenceID:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (float)radius
{
  return self->_radius;
}

- (void)setRadius:(float)a3
{
  self->_radius = a3;
}

@end