@interface MPNavigatorInternal
- (BOOL)isTriggered;
- (BOOL)startsPaused;
- (CGPoint)position;
- (CGSize)size;
- (NSMutableDictionary)layerKeyDictionary;
- (NSString)startPlugID;
- (NSString)uuid;
- (double)duration;
- (double)numberOfLoops;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)rotationAngle;
- (double)scale;
- (double)timeIn;
- (double)xRotationAngle;
- (double)yRotationAngle;
- (double)zPosition;
- (int64_t)zIndex;
- (void)dealloc;
- (void)setDuration:(double)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setLayerKeyDictionary:(id)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setStartPlugID:(id)a3;
- (void)setStartsPaused:(BOOL)a3;
- (void)setTimeIn:(double)a3;
- (void)setUuid:(id)a3;
- (void)setXRotationAngle:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)setZPosition:(double)a3;
@end

@implementation MPNavigatorInternal

- (void)dealloc
{
  self->startPlugID = 0;
  self->layerKeyDictionary = 0;

  self->uuid = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPNavigatorInternal;
  [(MPNavigatorInternal *)&v3 dealloc];
}

- (NSString)startPlugID
{
  return self->startPlugID;
}

- (void)setStartPlugID:(id)a3
{
}

- (double)opacity
{
  return self->opacity;
}

- (void)setOpacity:(double)a3
{
  self->opacity = a3;
}

- (CGPoint)position
{
  double x = self->position.x;
  double y = self->position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->position = a3;
}

- (double)zPosition
{
  return self->zPosition;
}

- (void)setZPosition:(double)a3
{
  self->zPosition = a3;
}

- (CGSize)size
{
  double width = self->size.width;
  double height = self->size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->size = a3;
}

- (double)rotationAngle
{
  return self->rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->rotationAngle = a3;
}

- (double)xRotationAngle
{
  return self->xRotationAngle;
}

- (void)setXRotationAngle:(double)a3
{
  self->xRotationAngle = a3;
}

- (double)yRotationAngle
{
  return self->yRotationAngle;
}

- (void)setYRotationAngle:(double)a3
{
  self->yRotationAngle = a3;
}

- (double)scale
{
  return self->scale;
}

- (void)setScale:(double)a3
{
  self->scale = a3;
}

- (int64_t)zIndex
{
  return self->zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->zIndedouble x = a3;
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)numberOfLoops
{
  return self->numberOfLoops;
}

- (void)setNumberOfLoops:(double)a3
{
  self->numberOfLoops = a3;
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (double)timeIn
{
  return self->timeIn;
}

- (void)setTimeIn:(double)a3
{
  self->timeIn = a3;
}

- (BOOL)isTriggered
{
  return self->isTriggered;
}

- (void)setIsTriggered:(BOOL)a3
{
  self->isTriggered = a3;
}

- (BOOL)startsPaused
{
  return self->startsPaused;
}

- (void)setStartsPaused:(BOOL)a3
{
  self->startsPaused = a3;
}

- (double)phaseInDuration
{
  return self->phaseInDuration;
}

- (void)setPhaseInDuration:(double)a3
{
  self->phaseInDuration = a3;
}

- (double)phaseOutDuration
{
  return self->phaseOutDuration;
}

- (void)setPhaseOutDuration:(double)a3
{
  self->phaseOutDuration = a3;
}

- (NSMutableDictionary)layerKeyDictionary
{
  return self->layerKeyDictionary;
}

- (void)setLayerKeyDictionary:(id)a3
{
}

@end