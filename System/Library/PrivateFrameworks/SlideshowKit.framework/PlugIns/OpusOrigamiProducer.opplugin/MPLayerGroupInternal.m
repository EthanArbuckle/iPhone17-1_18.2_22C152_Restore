@interface MPLayerGroupInternal
- (BOOL)autoAdjustDuration;
- (BOOL)isDocumentLayerGroup;
- (BOOL)isTriggered;
- (BOOL)startsPaused;
- (BOOL)usedAllPaths;
- (CGColor)backgroundColor;
- (CGPoint)position;
- (CGSize)size;
- (NSDictionary)authoredVersionInfo;
- (NSDictionary)initialState;
- (NSMutableDictionary)layerKeyDictionary;
- (NSRecursiveLock)liveLock;
- (NSString)backgroundAudioID;
- (NSString)uuid;
- (double)duration;
- (double)durationPadding;
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
- (int64_t)sendLiveNotification;
- (int64_t)zIndex;
- (unint64_t)loopingMode;
- (void)dealloc;
- (void)setAuthoredVersionInfo:(id)a3;
- (void)setAutoAdjustDuration:(BOOL)a3;
- (void)setBackgroundAudioID:(id)a3;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setDuration:(double)a3;
- (void)setDurationPadding:(double)a3;
- (void)setInitialState:(id)a3;
- (void)setIsDocumentLayerGroup:(BOOL)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setLayerKeyDictionary:(id)a3;
- (void)setLiveLock:(id)a3;
- (void)setLoopingMode:(unint64_t)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setSendLiveNotification:(int64_t)a3;
- (void)setSize:(CGSize)a3;
- (void)setStartsPaused:(BOOL)a3;
- (void)setTimeIn:(double)a3;
- (void)setUsedAllPaths:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setXRotationAngle:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)setZPosition:(double)a3;
@end

@implementation MPLayerGroupInternal

- (void)dealloc
{
  backgroundColor = self->backgroundColor;
  if (backgroundColor) {
    CGColorRelease(backgroundColor);
  }

  self->backgroundAudioID = 0;
  self->authoredVersionInfo = 0;

  self->liveLock = 0;
  self->uuid = 0;

  self->layerKeyDictionary = 0;
  self->initialState = 0;
  v4.receiver = self;
  v4.super_class = (Class)MPLayerGroupInternal;
  [(MPLayerGroupInternal *)&v4 dealloc];
}

- (void)setBackgroundColor:(CGColor *)a3
{
  backgroundColor = self->backgroundColor;
  if (backgroundColor) {
    CGColorRelease(backgroundColor);
  }
  self->backgroundColor = CGColorRetain(a3);
}

- (double)numberOfLoops
{
  return self->numberOfLoops;
}

- (void)setNumberOfLoops:(double)a3
{
  self->numberOfLoops = a3;
}

- (double)durationPadding
{
  return self->durationPadding;
}

- (void)setDurationPadding:(double)a3
{
  self->durationPadding = a3;
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

- (NSString)backgroundAudioID
{
  return self->backgroundAudioID;
}

- (void)setBackgroundAudioID:(id)a3
{
}

- (unint64_t)loopingMode
{
  return self->loopingMode;
}

- (void)setLoopingMode:(unint64_t)a3
{
  self->loopingMode = a3;
}

- (CGColor)backgroundColor
{
  return self->backgroundColor;
}

- (NSDictionary)authoredVersionInfo
{
  return self->authoredVersionInfo;
}

- (void)setAuthoredVersionInfo:(id)a3
{
}

- (int64_t)sendLiveNotification
{
  return self->sendLiveNotification;
}

- (void)setSendLiveNotification:(int64_t)a3
{
  self->sendLiveNotification = a3;
}

- (NSRecursiveLock)liveLock
{
  return self->liveLock;
}

- (void)setLiveLock:(id)a3
{
}

- (BOOL)autoAdjustDuration
{
  return self->autoAdjustDuration;
}

- (void)setAutoAdjustDuration:(BOOL)a3
{
  self->autoAdjustDuration = a3;
}

- (BOOL)isDocumentLayerGroup
{
  return self->isDocumentLayerGroup;
}

- (void)setIsDocumentLayerGroup:(BOOL)a3
{
  self->isDocumentLayerGroup = a3;
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

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)zIndex
{
  return self->zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->zIndedouble x = a3;
}

- (NSMutableDictionary)layerKeyDictionary
{
  return self->layerKeyDictionary;
}

- (void)setLayerKeyDictionary:(id)a3
{
}

- (NSDictionary)initialState
{
  return self->initialState;
}

- (void)setInitialState:(id)a3
{
}

- (BOOL)usedAllPaths
{
  return self->usedAllPaths;
}

- (void)setUsedAllPaths:(BOOL)a3
{
  self->usedAllPaths = a3;
}

@end