@interface MPLayer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)effectLayer;
+ (id)layer;
+ (id)sequentialLayer;
- (BOOL)isAudioLayer;
- (BOOL)isTriggered;
- (BOOL)skipTimeCalculations;
- (BOOL)startsPaused;
- (CGPoint)position;
- (CGSize)size;
- (MPLayer)init;
- (NSString)layerID;
- (NSString)title;
- (double)duration;
- (double)height;
- (double)numberOfLoops;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)rotationAngle;
- (double)scale;
- (double)timeIn;
- (double)xRotationAngle;
- (double)yPosition;
- (double)yRotationAngle;
- (double)zPosition;
- (id)action;
- (id)actionForKey:(id)a3;
- (id)actions;
- (id)allSlides:(BOOL)a3;
- (id)allSongs;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)audioPlaylist;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectContainers;
- (id)filters;
- (id)fullDebugLog;
- (id)layerKey;
- (id)montage;
- (id)objectID;
- (id)objectInEffectContainersAtIndex:(int64_t)a3;
- (id)objectInFiltersAtIndex:(int64_t)a3;
- (id)parent;
- (id)parentDocument;
- (id)plug;
- (id)plugID;
- (id)scriptingAnimations;
- (id)uuid;
- (int64_t)audioPriority;
- (int64_t)countOfEffectContainers;
- (int64_t)countOfFilters;
- (int64_t)zIndex;
- (void)addEffectContainer:(id)a3;
- (void)addEffectContainers:(id)a3;
- (void)addFilter:(id)a3;
- (void)addFilters:(id)a3;
- (void)cleanup;
- (void)configureActions;
- (void)copyActions:(id)a3;
- (void)copyAnimationPaths:(id)a3;
- (void)copyAudioPlaylist:(id)a3;
- (void)copyEffectContainers:(id)a3;
- (void)copyFilters:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)insertFilters:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inEffectContainersAtIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inFiltersAtIndex:(int64_t)a4;
- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)reconnectAllTransitions;
- (void)reconnectTransitionForEffectContainerAtIndex:(int64_t)a3;
- (void)removeActionForKey:(id)a3;
- (void)removeAllEffectContainers;
- (void)removeAllFilters;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)removeObjectFromEffectContainersAtIndex:(int64_t)a3;
- (void)removeObjectFromFiltersAtIndex:(int64_t)a3;
- (void)replaceObjectInEffectContainersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)resetStartTimes;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setAudioPriority:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setHeight:(double)a3;
- (void)setIsAudioLayer:(BOOL)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setLayerID:(id)a3;
- (void)setMontage:(id)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setParent:(id)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPlug:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setScriptingAnimations:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setSkipTimeCalculations:(BOOL)a3;
- (void)setStartsPaused:(BOOL)a3;
- (void)setTimeIn:(double)a3;
- (void)setTitle:(id)a3;
- (void)setWidth:(double)a3;
- (void)setXPosition:(double)a3;
- (void)setXRotationAngle:(double)a3;
- (void)setYPosition:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)setZPosition:(double)a3;
- (void)updateDurationPadding:(double)a3;
- (void)updateMainDuration;
@end

@implementation MPLayer

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return [a3 isEqualToString:@"effectContainers"] ^ 1;
}

+ (id)layer
{
  v2 = objc_alloc_init(MPLayerSerializer);
  return v2;
}

+ (id)sequentialLayer
{
  v2 = objc_alloc_init(MPLayerSerializer);
  return v2;
}

+ (id)effectLayer
{
  v2 = objc_alloc_init(MPLayerEffect);
  return v2;
}

- (MPLayer)init
{
  v4.receiver = self;
  v4.super_class = (Class)MPLayer;
  v2 = [(MPLayer *)&v4 init];
  if (v2)
  {
    v2->_internal = objc_alloc_init(MPLayerInternal);
    v2->_effectContainers = 0;
    v2->_filters = 0;
    v2->_attributes = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_skipTimeCalculations = 0;
    v2->_actions = 0;
    v2->_audioPlaylist = 0;
    v2->_animationPaths = 0;
    [(MPLayerInternal *)v2->_internal setTitle:0];
    [(MPLayerInternal *)v2->_internal setNumberOfLoops:1.0];
    [(MPLayerInternal *)v2->_internal setOpacity:1.0];
    -[MPLayerInternal setPosition:](v2->_internal, "setPosition:", CGPointZero.x, CGPointZero.y);
    [(MPLayerInternal *)v2->_internal setZPosition:0.0];
    -[MPLayerInternal setSize:](v2->_internal, "setSize:", 2.0, 2.0);
    [(MPLayerInternal *)v2->_internal setXRotationAngle:0.0];
    [(MPLayerInternal *)v2->_internal setYRotationAngle:0.0];
    [(MPLayerInternal *)v2->_internal setScale:1.0];
    [(MPLayerInternal *)v2->_internal setTimeIn:0.0];
    [(MPLayerInternal *)v2->_internal setStartsPaused:0];
    [(MPLayerInternal *)v2->_internal setIsTriggered:0];
    [(MPLayerInternal *)v2->_internal setDuration:0.0];
    [(MPLayerInternal *)v2->_internal setPhaseInDuration:0.0];
    [(MPLayerInternal *)v2->_internal setPhaseOutDuration:0.0];
    [(MPLayerInternal *)v2->_internal setIsAudioLayer:0];
    [(MPLayerInternal *)v2->_internal setAudioPriority:0];
    [(MPLayerInternal *)v2->_internal setDurationPadding:0.0];
    [(MPLayerInternal *)v2->_internal setLayerID:0];
    [(MPLayerInternal *)v2->_internal setZIndex:0];
    [(MPLayerInternal *)v2->_internal setContainerLock:objc_alloc_init((Class)NSLock)];
    [(NSLock *)[(MPLayerInternal *)v2->_internal containerLock] setName:@"MPLayerInternal.containerLock"];
    [(MPLayerInternal *)v2->_internal setUuid:+[MPUtilities stringWithNewUUID]];
    [(MPLayerInternal *)v2->_internal setCleaningUp:0];
  }
  return v2;
}

- (id)description
{
  v3 = [[+[NSString stringWithFormat:@"============================= Layer %d Description =============================\n", [(MPLayer *)self zIndex]] stringByAppendingFormat:@"\t        Effect Container Count: %d\n" stringByAppendingFormat:"stringByAppendingFormat:", @"\t                  Filter Count: %d\n", [(NSMutableArray *)self->_filters count]];
  [(MPLayer *)self duration];
  v5 = [(NSString *)v3 stringByAppendingFormat:@"\t                      Duration: %f\n", v4];
  if (self->_plug) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  return [(NSString *)v5 stringByAppendingFormat:@"\t                Has Layer Plug: %@\n", v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  [v4 copyEffectContainers:self->_effectContainers];
  [v4 copyFilters:self->_filters];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyAudioPlaylist:self->_audioPlaylist];
  [v4 copyActions:self->_actions];
  return v4;
}

- (void)dealloc
{
  montage = self->_montage;
  if (montage) {

  }
  self->_montage = 0;
  self->_internal = 0;

  self->_audioPlaylist = 0;
  self->_effectContainers = 0;

  self->_filters = 0;
  self->_attributes = 0;

  self->_animationPaths = 0;
  self->_actions = 0;
  v4.receiver = self;
  v4.super_class = (Class)MPLayer;
  [(MPLayer *)&v4 dealloc];
}

- (NSString)title
{
  return [(MPLayerInternal *)self->_internal title];
}

- (void)setTitle:(id)a3
{
}

- (id)effectContainers
{
  return self->_effectContainers;
}

- (void)addEffectContainer:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  [(MPLayer *)self insertEffectContainers:v4 atIndex:[(NSMutableArray *)self->_effectContainers count]];
}

- (void)addEffectContainers:(id)a3
{
  id v5 = [(NSMutableArray *)self->_effectContainers count];
  [(MPLayer *)self insertEffectContainers:a3 atIndex:v5];
}

- (void)removeAllEffectContainers
{
  if ([(NSMutableArray *)self->_effectContainers count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, -[NSMutableArray count](self->_effectContainers, "count"));
    [(MPLayer *)self removeEffectContainersAtIndices:v3];
  }
}

- (id)filters
{
  return self->_filters;
}

- (void)addFilter:(id)a3
{
  id v4 = +[NSArray arrayWithObject:a3];
  id v5 = [(NSMutableArray *)self->_filters count];
  [(MPLayer *)self insertFilters:v4 atIndex:v5];
}

- (void)addFilters:(id)a3
{
  id v5 = [(NSMutableArray *)self->_filters count];
  [(MPLayer *)self insertFilters:a3 atIndex:v5];
}

- (void)insertFilters:(id)a3 atIndex:(int64_t)a4
{
  int64_t v4 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  [(MPLayer *)self willChange:2 valuesAtIndexes:v7 forKey:@"filters"];
  filters = self->_filters;
  if (!filters)
  {
    filters = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_filters = filters;
  }
  [(NSMutableArray *)filters insertObjects:a3 atIndexes:v7];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) setParent:self];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v10);
  }
  if (self->_plug)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v13 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v16), "setFilter:", -[MCPlugParallel insertFilterWithFilterID:atIndex:](self->_plug, "insertFilterWithFilterID:atIndex:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v16), "filterID"), (char *)v16 + v4));
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
        v4 += (int64_t)v16;
      }
      while (v14);
    }
  }
  [(MPLayer *)self didChange:2 valuesAtIndexes:v7 forKey:@"filters"];
}

- (void)removeFiltersAtIndices:(id)a3
{
  if ([(NSMutableArray *)self->_filters count])
  {
    [(MPLayer *)self willChange:3 valuesAtIndexes:a3 forKey:@"filters"];
    id v5 = [a3 lastIndex];
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v5; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v7 = [(NSMutableArray *)self->_filters objectAtIndex:i];
        [v7 setParent:0];
        [v7 setFilter:0];
      }
    }
    plug = self->_plug;
    if (plug) {
      [(MCPlugParallel *)plug removeFiltersAtIndices:a3];
    }
    [(NSMutableArray *)self->_filters removeObjectsAtIndexes:a3];
    [(MPLayer *)self didChange:3 valuesAtIndexes:a3 forKey:@"filters"];
  }
}

- (void)removeAllFilters
{
  if ([(NSMutableArray *)self->_filters count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, -[NSMutableArray count](self->_filters, "count"));
    [(MPLayer *)self removeFiltersAtIndices:v3];
  }
}

- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  id v7 = [a3 firstIndex];
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = v7;
    do
    {
      id v9 = [(NSMutableArray *)self->_filters objectAtIndex:v8];
      [(NSMutableArray *)self->_filters removeObjectAtIndex:v8];
      [(NSMutableArray *)self->_filters insertObject:v9 atIndex:a4 - ((uint64_t)v8 < a4)];
      id v8 = [a3 indexGreaterThanIndex:v8];
      ++a4;
    }
    while (v8 != (id)0x7FFFFFFFFFFFFFFFLL);
  }
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug moveFiltersAtIndices:a3 toIndex:a4];
  }
}

- (id)animationPaths
{
  return self->_animationPaths;
}

- (id)animationPathForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_animationPaths objectForKey:a3];
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v7 = [(MPLayer *)self animationPathForKey:a4];
    if (v7)
    {
      id v8 = v7;
      [v7 setParent:0];
      [v8 setAnimationPath:0];
    }
    [a3 setParent:self];
    animationPaths = self->_animationPaths;
    if (!animationPaths)
    {
      animationPaths = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->_animationPaths = animationPaths;
    }
    [(NSMutableDictionary *)animationPaths setObject:a3 forKey:a4];
    plug = self->_plug;
    if (plug)
    {
      [(MCPlug *)plug removeAnimationPathForKey:a4];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v12 = off_1A4DC0;
      if ((isKindOfClass & 1) == 0) {
        v12 = off_1A4DC8;
      }
      id v13 = [(__objc2_class *)*v12 animationPathWithKey:a4];
      [(MCPlug *)self->_plug addAnimationPath:v13];
      [a3 setAnimationPath:v13];
    }
  }
  else
  {
    [(MPLayer *)self removeAnimationPathForKey:a4];
  }
}

- (void)removeAnimationPathForKey:(id)a3
{
  id v5 = -[MPLayer animationPathForKey:](self, "animationPathForKey:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug removeAnimationPathForKey:a3];
    [v5 setAnimationPath:0];
  }
  [v5 setParent:0];
  animationPaths = self->_animationPaths;
  [(NSMutableDictionary *)animationPaths removeObjectForKey:a3];
}

- (double)opacity
{
  [(MPLayerInternal *)self->_internal opacity];
  return result;
}

- (void)setOpacity:(double)a3
{
  -[MPLayerInternal setOpacity:](self->_internal, "setOpacity:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setOpacity:a3];
  }
}

- (double)scale
{
  [(MPLayerInternal *)self->_internal scale];
  return result;
}

- (void)setScale:(double)a3
{
  -[MPLayerInternal setScale:](self->_internal, "setScale:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setScale:a3];
  }
}

- (CGPoint)position
{
  [(MPLayerInternal *)self->_internal position];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[MPLayerInternal setPosition:](self->_internal, "setPosition:");
  plug = self->_plug;
  if (plug)
  {
    -[MCPlugParallel setPosition:](plug, "setPosition:", x, y);
  }
}

- (double)zPosition
{
  [(MPLayerInternal *)self->_internal zPosition];
  return result;
}

- (void)setZPosition:(double)a3
{
  -[MPLayerInternal setZPosition:](self->_internal, "setZPosition:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setZPosition:a3];
  }
}

- (double)rotationAngle
{
  [(MPLayerInternal *)self->_internal rotationAngle];
  return result;
}

- (void)setRotationAngle:(double)a3
{
  -[MPLayerInternal setRotationAngle:](self->_internal, "setRotationAngle:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setRotationAngle:a3];
  }
}

- (CGSize)size
{
  [(MPLayerInternal *)self->_internal size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[MPLayerInternal setSize:](self->_internal, "setSize:");
  plug = self->_plug;
  if (plug)
  {
    -[MCPlugParallel setSize:](plug, "setSize:", width, height);
  }
}

- (double)xRotationAngle
{
  [(MPLayerInternal *)self->_internal xRotationAngle];
  return result;
}

- (void)setXRotationAngle:(double)a3
{
  -[MPLayerInternal setXRotationAngle:](self->_internal, "setXRotationAngle:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setXRotationAngle:a3];
  }
}

- (double)yRotationAngle
{
  [(MPLayerInternal *)self->_internal yRotationAngle];
  return result;
}

- (void)setYRotationAngle:(double)a3
{
  -[MPLayerInternal setYRotationAngle:](self->_internal, "setYRotationAngle:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setYRotationAngle:a3];
  }
}

- (int64_t)zIndex
{
  plug = self->_plug;
  if (plug) {
    return [(MCPlugParallel *)plug zIndex];
  }
  internal = self->_internal;
  return [(MPLayerInternal *)internal zIndex];
}

- (void)setZIndex:(int64_t)a3
{
  __int16 v3 = a3;
  -[MPLayerInternal setZIndex:](self->_internal, "setZIndex:");
  if (objc_msgSend(-[MPLayer parent](self, "parent"), "layersCanPositionZIndex"))
  {
    plug = self->_plug;
    if (plug)
    {
      [(MCPlugParallel *)plug setZIndex:v3];
    }
  }
}

- (id)parent
{
  return self->_parent;
}

- (double)timeIn
{
  [(MPLayerInternal *)self->_internal timeIn];
  return result;
}

- (void)setTimeIn:(double)a3
{
  -[MPLayerInternal setTimeIn:](self->_internal, "setTimeIn:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setTimeIn:a3];
  }
}

- (double)duration
{
  [(MPLayerInternal *)self->_internal duration];
  return result;
}

- (void)setDuration:(double)a3
{
  if (a3 < 0.0)
  {
    NSLog(@"iLifeSlideshow: Trying to set a duration less than 0.", a2);
    a3 = 0.0;
  }
  [(MPLayerInternal *)self->_internal setDuration:a3];
  [(MPLayer *)self updateMainDuration];
  [(MPLayer *)self resetStartTimes];
  if (!self->_skipTimeCalculations)
  {
    id v4 = [(MPLayer *)self parent];
    [v4 resetDuration];
  }
}

- (double)phaseInDuration
{
  [(MPLayerInternal *)self->_internal phaseInDuration];
  return result;
}

- (void)setPhaseInDuration:(double)a3
{
  -[MPLayerInternal setPhaseInDuration:](self->_internal, "setPhaseInDuration:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug setPhaseInDuration:a3];
    [(MPLayer *)self updateMainDuration];
  }
}

- (double)phaseOutDuration
{
  [(MPLayerInternal *)self->_internal phaseOutDuration];
  return result;
}

- (void)setPhaseOutDuration:(double)a3
{
  -[MPLayerInternal setPhaseOutDuration:](self->_internal, "setPhaseOutDuration:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug setPhaseOutDuration:a3];
    [(MPLayer *)self updateMainDuration];
  }
}

- (BOOL)isTriggered
{
  return [(MPLayerInternal *)self->_internal isTriggered];
}

- (void)setIsTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPLayerInternal setIsTriggered:](self->_internal, "setIsTriggered:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlugParallel *)plug setIsTriggered:v3];
    }
  }
}

- (BOOL)startsPaused
{
  return [(MPLayerInternal *)self->_internal startsPaused];
}

- (void)setStartsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPLayerInternal setStartsPaused:](self->_internal, "setStartsPaused:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug setStartsPaused:v3];
  }
}

- (id)audioPlaylist
{
  return self->_audioPlaylist;
}

- (int64_t)audioPriority
{
  return [(MPLayerInternal *)self->_internal audioPriority];
}

- (void)setAudioPriority:(int64_t)a3
{
  __int16 v3 = a3;
  -[MPLayerInternal setAudioPriority:](self->_internal, "setAudioPriority:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setAudioPriority:v3];
  }
}

- (double)numberOfLoops
{
  [(MPLayerInternal *)self->_internal numberOfLoops];
  return result;
}

- (void)setNumberOfLoops:(double)a3
{
  -[MPLayerInternal setNumberOfLoops:](self->_internal, "setNumberOfLoops:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug setNumberOfLoops:a3];
    [(MPLayer *)self updateMainDuration];
  }
  id parent = self->_parent;
  [parent resetDuration];
}

- (BOOL)isAudioLayer
{
  return [(MPLayerInternal *)self->_internal isAudioLayer];
}

- (void)setIsAudioLayer:(BOOL)a3
{
  [(MPLayerInternal *)self->_internal setIsAudioLayer:a3];
  if ([(MPLayerInternal *)self->_internal isAudioLayer])
  {
    double height = CGSizeZero.height;
    -[MPLayer setSize:](self, "setSize:", CGSizeZero.width, height);
  }
}

- (void)setLayerID:(id)a3
{
}

- (NSString)layerID
{
  return [(MPLayerInternal *)self->_internal layerID];
}

- (id)layerKey
{
  if (!objc_msgSend(-[MPLayer parent](self, "parent"), "layersCanPositionZIndex")) {
    return 0;
  }
  id v3 = objc_msgSend(-[MPLayer parent](self, "parent"), "layerKeyDictionary");
  id v4 = [(MPLayer *)self uuid];
  return [v3 objectForKey:v4];
}

- (id)actions
{
  return self->_actions;
}

- (id)actionForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_actions objectForKey:a3];
}

- (void)setAction:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (!self->_actions) {
      self->_actions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    id v7 = [(MPLayer *)self actionForKey:a4];
    if (v7) {
      [v7 setParent:0];
    }
    [a3 setParent:self];
    [(NSMutableDictionary *)self->_actions setObject:a3 forKey:a4];
    plug = self->_plug;
    if (plug)
    {
      id v9 = +[MPUtilities createMCAction:a3 forPlug:plug withKey:a4];
      [a3 setAction:v9];
    }
  }
  else
  {
    [(MPLayer *)self removeActionForKey:a4];
  }
}

- (void)removeActionForKey:(id)a3
{
  id v5 = -[MPLayer actionForKey:](self, "actionForKey:");
  plug = self->_plug;
  if (plug) {
    [(MCPlug *)plug removeActionForKey:a3];
  }
  [v5 setParent:0];
  actions = self->_actions;
  [(NSMutableDictionary *)actions removeObjectForKey:a3];
}

- (id)plug
{
  return self->_plug;
}

- (id)montage
{
  return self->_montage;
}

- (id)allSlides:(BOOL)a3
{
  BOOL v31 = a3;
  id v4 = +[NSMutableArray array];
  [(NSLock *)[(MPLayerInternal *)self->_internal containerLock] lock];
  id v5 = [(NSMutableArray *)self->_effectContainers copy];
  [(NSLock *)[(MPLayerInternal *)self->_internal containerLock] unlock];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  id v28 = [v5 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v45;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        id v7 = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * v6), "effects"), "copy");
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v30 = v7;
        id v8 = [v7 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v41;
          do
          {
            for (id i = 0; i != v9; id i = (char *)i + 1)
            {
              if (*(void *)v41 != v10) {
                objc_enumerationMutation(v30);
              }
              v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              id v13 = objc_msgSend(objc_msgSend(v12, "slides"), "copy");
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              id v14 = [v13 countByEnumeratingWithState:&v36 objects:v49 count:16];
              if (v14)
              {
                id v15 = v14;
                uint64_t v16 = *(void *)v37;
                do
                {
                  for (j = 0; j != v15; j = (char *)j + 1)
                  {
                    if (*(void *)v37 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    long long v18 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
                    if ([v18 path] && objc_msgSend(v18, "parent")) {
                      [v4 addObject:v18];
                    }
                  }
                  id v15 = [v13 countByEnumeratingWithState:&v36 objects:v49 count:16];
                }
                while (v15);
              }

              if (v31)
              {
                id v19 = objc_msgSend(objc_msgSend(v12, "secondarySlides"), "copy");
                long long v32 = 0u;
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                id v20 = [v19 countByEnumeratingWithState:&v32 objects:v48 count:16];
                if (v20)
                {
                  id v21 = v20;
                  uint64_t v22 = *(void *)v33;
                  do
                  {
                    for (k = 0; k != v21; k = (char *)k + 1)
                    {
                      if (*(void *)v33 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      long long v24 = *(void **)(*((void *)&v32 + 1) + 8 * (void)k);
                      if ([v24 path] && objc_msgSend(v24, "parent")) {
                        [v4 addObject:v24];
                      }
                    }
                    id v21 = [v19 countByEnumeratingWithState:&v32 objects:v48 count:16];
                  }
                  while (v21);
                }
              }
            }
            id v9 = [v30 countByEnumeratingWithState:&v40 objects:v50 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v28);
  }

  return v4;
}

- (id)allSongs
{
  id v3 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  effectContainers = self->_effectContainers;
  id v5 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (id i = 0; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(effectContainers);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(objc_msgSend(v9, "audioPlaylist"), "songs"));
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v10 = objc_msgSend(v9, "effects", 0);
        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)j), "audioPlaylist"), "songs"));
            }
            id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v12);
        }
      }
      id v6 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  id v3 = [+[NSString stringWithFormat:@"\n%@\n", [(MPLayer *)self description]] stringByAppendingFormat:@"============================ Layer %d Effect Containers =======================\n", [(MPLayer *)self zIndex]];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  effectContainers = self->_effectContainers;
  id v5 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (id i = 0; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(effectContainers);
        }
        id v3 = -[NSString stringByAppendingFormat:](v3, "stringByAppendingFormat:", @"%@\n", [*(id *)(*((void *)&v20 + 1) + 8 * i) fullDebugLog]);
      }
      id v6 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  id v9 = [(NSString *)v3 stringByAppendingFormat:@"================================ Layer %d Filters =============================\n", [(MPLayer *)self zIndex]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  filters = self->_filters;
  id v11 = [(NSMutableArray *)filters countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(filters);
        }
        id v9 = -[NSString stringByAppendingFormat:](v9, "stringByAppendingFormat:", @"%@\n", [*(id *)(*((void *)&v16 + 1) + 8 * (void)j) fullDebugLog]);
      }
      id v12 = [(NSMutableArray *)filters countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
  return v9;
}

- (id)parentDocument
{
  id v2 = [(MPLayer *)self parent];
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    id v2 = [v2 parent];
    objc_opt_class();
  }
  return v2;
}

- (id)action
{
  return [(MCPlug *)self->_plug actionForKey:@"onHitStart"];
}

- (id)plugID
{
  return [(MCPlugParallel *)self->_plug idInSupercontainer];
}

- (id)objectID
{
  return [(MCObject *)self->_plug objectID];
}

- (id)uuid
{
  return [(MPLayerInternal *)self->_internal uuid];
}

- (void)copyStruct:(id)a3
{
  [a3 numberOfLoops];
  -[MPLayerInternal setNumberOfLoops:](self->_internal, "setNumberOfLoops:");
  [a3 position];
  -[MPLayerInternal setPosition:](self->_internal, "setPosition:");
  [a3 size];
  -[MPLayerInternal setSize:](self->_internal, "setSize:");
  [a3 zPosition];
  -[MPLayerInternal setZPosition:](self->_internal, "setZPosition:");
  [a3 rotationAngle];
  -[MPLayerInternal setRotationAngle:](self->_internal, "setRotationAngle:");
  [a3 xRotationAngle];
  -[MPLayerInternal setXRotationAngle:](self->_internal, "setXRotationAngle:");
  [a3 yRotationAngle];
  -[MPLayerInternal setYRotationAngle:](self->_internal, "setYRotationAngle:");
  [a3 scale];
  -[MPLayerInternal setScale:](self->_internal, "setScale:");
  [a3 opacity];
  -[MPLayerInternal setOpacity:](self->_internal, "setOpacity:");
  [a3 timeIn];
  -[MPLayerInternal setTimeIn:](self->_internal, "setTimeIn:");
  -[MPLayerInternal setIsTriggered:](self->_internal, "setIsTriggered:", [a3 isTriggered]);
  -[MPLayerInternal setStartsPaused:](self->_internal, "setStartsPaused:", [a3 startsPaused]);
  [a3 duration];
  -[MPLayerInternal setDuration:](self->_internal, "setDuration:");
  [a3 phaseInDuration];
  -[MPLayerInternal setPhaseInDuration:](self->_internal, "setPhaseInDuration:");
  [a3 phaseOutDuration];
  -[MPLayerInternal setPhaseOutDuration:](self->_internal, "setPhaseOutDuration:");
  -[MPLayerInternal setAudioPriority:](self->_internal, "setAudioPriority:", [a3 audioPriority]);
  -[MPLayerInternal setTitle:](self->_internal, "setTitle:", objc_msgSend(objc_msgSend(a3, "title"), "copy"));
  -[MPLayerInternal setLayerID:](self->_internal, "setLayerID:", objc_msgSend(objc_msgSend(a3, "layerID"), "copy"));
  -[MPLayerInternal setZIndex:](self->_internal, "setZIndex:", [a3 zIndex]);
  internal = self->_internal;
  [(MPLayerInternal *)internal setUuid:0];
}

- (void)copyEffectContainers:(id)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
        [v5 addObject:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(MPLayer *)self addEffectContainers:v5];
}

- (void)copyFilters:(id)a3
{
  if (a3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
          [v5 addObject:v10];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [(MPLayer *)self addFilters:a3];
  }
}

- (void)copyAnimationPaths:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (id i = 0; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        [(MPLayer *)self setAnimationPath:v10 forKey:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)copyActions:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (id i = 0; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
        [(MPLayer *)self setAction:v10 forKey:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)copyAudioPlaylist:(id)a3
{
  id v4 = [a3 copy];
  [(MPLayer *)self setAudioPlaylist:v4];
}

- (void)cleanup
{
  [(MPLayerInternal *)self->_internal setCleaningUp:1];
  self->_skipTimeCalculations = 1;
  [(MPLayer *)self removeAllEffectContainers];
  [(MPLayer *)self removeAllFilters];
  id v3 = [(NSMutableDictionary *)self->_animationPaths allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MPLayer *)self removeAnimationPathForKey:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(MPLayer *)self setAudioPlaylist:0];
}

- (void)setPlug:(id)a3
{
  id v5 = (MCPlugParallel *)a3;
  self->_plug = v5;
  if (v5)
  {
    [(MPLayer *)self numberOfLoops];
    -[MCPlug setNumberOfLoops:](self->_plug, "setNumberOfLoops:");
    [(MPLayer *)self position];
    -[MCPlugParallel setPosition:](self->_plug, "setPosition:");
    [(MPLayer *)self size];
    -[MCPlugParallel setSize:](self->_plug, "setSize:");
    [(MPLayer *)self zPosition];
    -[MCPlugParallel setZPosition:](self->_plug, "setZPosition:");
    [(MPLayer *)self rotationAngle];
    -[MCPlugParallel setRotationAngle:](self->_plug, "setRotationAngle:");
    [(MPLayer *)self xRotationAngle];
    -[MCPlugParallel setXRotationAngle:](self->_plug, "setXRotationAngle:");
    [(MPLayer *)self yRotationAngle];
    -[MCPlugParallel setYRotationAngle:](self->_plug, "setYRotationAngle:");
    [(MPLayer *)self scale];
    -[MCPlugParallel setScale:](self->_plug, "setScale:");
    [(MPLayer *)self opacity];
    -[MCPlugParallel setOpacity:](self->_plug, "setOpacity:");
    [(MPLayer *)self timeIn];
    -[MCPlugParallel setTimeIn:](self->_plug, "setTimeIn:");
    [(MCPlugParallel *)self->_plug setIsTriggered:[(MPLayer *)self isTriggered]];
    [(MCPlug *)self->_plug setStartsPaused:[(MPLayer *)self startsPaused]];
    [(MPLayer *)self phaseInDuration];
    -[MCPlug setPhaseInDuration:](self->_plug, "setPhaseInDuration:");
    [(MPLayer *)self phaseOutDuration];
    -[MCPlug setPhaseOutDuration:](self->_plug, "setPhaseOutDuration:");
    [(MCPlugParallel *)self->_plug setAudioPriority:(__int16)[(MPLayer *)self audioPriority]];
    if (objc_msgSend(-[MPLayer parent](self, "parent"), "layersCanPositionZIndex")) {
      [(MCPlugParallel *)self->_plug setZIndex:(__int16)[(MPLayerInternal *)self->_internal zIndex]];
    }
    [(MPLayer *)self updateMainDuration];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    filters = self->_filters;
    id v7 = [(NSMutableArray *)filters countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v54;
      do
      {
        for (id i = 0; i != v8; id i = (char *)i + 1)
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(filters);
          }
          objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "setFilter:", -[MCPlugParallel addFilterWithFilterID:](self->_plug, "addFilterWithFilterID:", objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "filterID")));
        }
        id v8 = [(NSMutableArray *)filters countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v8);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    animationPaths = self->_animationPaths;
    id v12 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v50;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v16 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
          id v17 = [(NSMutableDictionary *)self->_animationPaths objectForKey:v16];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v18 = off_1A4DC0;
          }
          else {
            long long v18 = off_1A4DC8;
          }
          id v19 = [(__objc2_class *)*v18 animationPathWithKey:v16];
          [(MCPlug *)self->_plug addAnimationPath:v19];
          [v17 setAnimationPath:v19];
        }
        id v13 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v49 objects:v60 count:16];
      }
      while (v13);
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    actions = self->_actions;
    id v21 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(actions);
          }
          uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * (void)k);
          id v26 = [(NSMutableDictionary *)self->_actions objectForKey:v25];
          objc_msgSend(v26, "setAction:", +[MPUtilities createMCAction:forPlug:withKey:](MPUtilities, "createMCAction:forPlug:withKey:", v26, self->_plug, v25));
        }
        id v22 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v45 objects:v59 count:16];
      }
      while (v22);
    }
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v27 = self->_filters;
    id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v41 objects:v58 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (m = 0; m != v29; m = (char *)m + 1)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * (void)m) setFilter:0];
        }
        id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v41 objects:v58 count:16];
      }
      while (v29);
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v32 = self->_animationPaths;
    id v33 = [(NSMutableDictionary *)v32 countByEnumeratingWithState:&v37 objects:v57 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v38;
      do
      {
        for (n = 0; n != v34; n = (char *)n + 1)
        {
          if (*(void *)v38 != v35) {
            objc_enumerationMutation(v32);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", *(void *)(*((void *)&v37 + 1) + 8 * (void)n)), "setAnimationPath:", 0);
        }
        id v34 = [(NSMutableDictionary *)v32 countByEnumeratingWithState:&v37 objects:v57 count:16];
      }
      while (v34);
    }
  }
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parent) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A layer may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_id parent = a3;
  if (![(MPLayerInternal *)self->_internal uuid])
  {
    id v4 = +[MPUtilities stringWithNewUUID];
    internal = self->_internal;
    [(MPLayerInternal *)internal setUuid:v4];
  }
}

- (void)setMontage:(id)a3
{
  montage = self->_montage;
  if (montage)
  {

    self->_montage = 0;
  }
  self->_montage = (MCMontage *)a3;
}

- (BOOL)skipTimeCalculations
{
  return self->_skipTimeCalculations;
}

- (void)setSkipTimeCalculations:(BOOL)a3
{
  self->_skipTimeCalculations = a3;
  [(MPLayer *)self resetStartTimes];
  if (!self->_skipTimeCalculations)
  {
    id v4 = [(MPLayer *)self parent];
    [v4 resetDuration];
  }
}

- (void)updateDurationPadding:(double)a3
{
  internal = self->_internal;
  [(MPLayerInternal *)internal durationPadding];
  [(MPLayerInternal *)internal setDurationPadding:v6 + a3];
  [(MPLayerInternal *)self->_internal durationPadding];
  if (v7 < 0.0) {
    [(MPLayerInternal *)self->_internal setDurationPadding:0.0];
  }
  [(MPLayer *)self updateMainDuration];
  id v8 = [(MPLayer *)self parent];
  objc_msgSend(-[MPLayer parent](self, "parent"), "durationPadding");
  double v10 = v9 + a3;
  [v8 setDurationPadding:v10];
}

- (void)updateMainDuration
{
  if (self->_plug)
  {
    [(MPLayer *)self phaseInDuration];
    double v4 = v3;
    [(MPLayer *)self phaseOutDuration];
    double v6 = v4 + v5;
    [(MPLayer *)self duration];
    double v8 = v7 - v6;
    if (v8 >= 0.0) {
      double v9 = v8;
    }
    else {
      double v9 = 0.0;
    }
    [(MPLayerInternal *)self->_internal durationPadding];
    double v11 = v10 + v9;
    plug = self->_plug;
    [(MCPlug *)plug setLoopDuration:v11];
  }
}

- (void)reconnectTransitionForEffectContainerAtIndex:(int64_t)a3
{
  if ([(MPLayer *)self countOfEffectContainers] > a3)
  {
    id v5 = [(NSMutableArray *)self->_effectContainers objectAtIndex:a3];
    if (([v5 isTransitionConnected] & 1) == 0)
    {
      objc_msgSend(objc_msgSend(v5, "transition"), "duration");
      [(MPLayer *)self updateDurationPadding:-v6];
      effectContainers = self->_effectContainers;
      id v8 = a3
         ? [(NSMutableArray *)effectContainers objectAtIndex:a3 - 1]
         : [(NSMutableArray *)effectContainers lastObject];
      double v9 = v8;
      if (([v8 isTransitionConnected] & 1) == 0)
      {
        objc_msgSend(objc_msgSend(v9, "transition"), "duration");
        double v11 = -v10;
        [(MPLayer *)self updateDurationPadding:v11];
      }
    }
  }
}

- (void)reconnectAllTransitions
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  effectContainers = self->_effectContainers;
  id v3 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (id i = 0; i != v4; id i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(effectContainers);
        }
        double v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v7 isTransitionConnected] & 1) == 0) {
          [v7 reconnectTransition];
        }
      }
      id v4 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)resetStartTimes
{
  if (!self->_skipTimeCalculations)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    effectContainers = self->_effectContainers;
    id v3 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v13;
      double v6 = 0.0;
      do
      {
        for (id i = 0; i != v4; id i = (char *)i + 1)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(effectContainers);
          }
          long long v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          [v8 setStartTime:v6];
          [v8 duration];
          double v10 = v9;
          [v8 outroTransitionDuration];
          double v6 = v6 + v10 - v11;
        }
        id v4 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
  }
}

- (void)configureActions
{
  if ([(MPLayer *)self parentDocument])
  {
    if ((objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "isInBatchModify") & 1) == 0)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      actions = self->_actions;
      id v4 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v9;
        do
        {
          for (id i = 0; i != v5; id i = (char *)i + 1)
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(actions);
            }
            objc_msgSend(-[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * i)), "configureTarget");
          }
          id v5 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v8 objects:v12 count:16];
        }
        while (v5);
      }
    }
  }
}

- (int64_t)countOfEffectContainers
{
  return (int64_t)[(NSMutableArray *)self->_effectContainers count];
}

- (id)objectInEffectContainersAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_effectContainers objectAtIndex:a3];
}

- (void)insertObject:(id)a3 inEffectContainersAtIndex:(int64_t)a4
{
  uint64_t v6 = +[NSArray arrayWithObject:a3];
  [(MPLayer *)self insertEffectContainers:v6 atIndex:a4];
}

- (void)removeObjectFromEffectContainersAtIndex:(int64_t)a3
{
  id v4 = +[NSIndexSet indexSetWithIndex:a3];
  [(MPLayer *)self removeEffectContainersAtIndices:v4];
}

- (void)replaceObjectInEffectContainersAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPLayer *)self removeEffectContainersAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  double v7 = +[NSArray arrayWithObject:a4];
  [(MPLayer *)self insertEffectContainers:v7 atIndex:a3];
}

- (int64_t)countOfFilters
{
  return (int64_t)[(NSMutableArray *)self->_filters count];
}

- (id)objectInFiltersAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_filters objectAtIndex:a3];
}

- (void)insertObject:(id)a3 inFiltersAtIndex:(int64_t)a4
{
  uint64_t v6 = +[NSArray arrayWithObject:a3];
  [(MPLayer *)self insertFilters:v6 atIndex:a4];
}

- (void)removeObjectFromFiltersAtIndex:(int64_t)a3
{
  id v4 = +[NSIndexSet indexSetWithIndex:a3];
  [(MPLayer *)self removeFiltersAtIndices:v4];
}

- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPLayer *)self removeFiltersAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  double v7 = +[NSArray arrayWithObject:a4];
  [(MPLayer *)self insertFilters:v7 atIndex:a3];
}

- (void)setXPosition:(double)a3
{
  [(MPLayer *)self yPosition];
  -[MPLayer setPosition:](self, "setPosition:", a3, v5);
}

- (double)yPosition
{
  [(MPLayer *)self position];
  return v2;
}

- (void)setYPosition:(double)a3
{
  [(MPLayer *)self xPosition];
  -[MPLayer setPosition:](self, "setPosition:");
}

- (double)height
{
  [(MPLayer *)self size];
  return v2;
}

- (void)setHeight:(double)a3
{
  [(MPLayer *)self width];
  -[MPLayer setSize:](self, "setSize:");
}

- (void)setWidth:(double)a3
{
  [(MPLayer *)self height];
  -[MPLayer setSize:](self, "setSize:", a3, v5);
}

- (id)scriptingAnimations
{
  id v20 = +[NSMutableDictionary dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = self->_animationPaths;
  id v21 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v21)
  {
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v2;
        id v3 = *(void **)(*((void *)&v29 + 1) + 8 * v2);
        id v22 = +[NSMutableDictionary dictionary];
        id v4 = [(NSMutableDictionary *)self->_animationPaths objectForKey:v3];
        id v5 = +[NSMutableArray array];
        id v6 = +[NSMutableArray array];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v7 = [v4 orderedKeyframes];
        id v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            for (id i = 0; i != v9; id i = (char *)i + 1)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              if (([v3 isEqualToString:@"size"] & 1) != 0
                || [v3 isEqualToString:@"position"])
              {
                int v24 = 0;
                [v12 point];
                LOWORD(v24) = (int)v13;
                [v12 point];
                HIWORD(v24) = (int)v14;
                long long v15 = +[NSData dataWithBytes:&v24 length:4];
              }
              else
              {
                [v12 scalar];
                long long v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              }
              [v6 addObject:v15];
              [v12 time];
              objc_msgSend(v5, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            }
            id v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v9);
        }
        [v22 setObject:v5 forKey:@"times"];
        [v22 setObject:v6 forKey:@"values"];
        [v20 setObject:v22 forKey:v3];
        uint64_t v2 = v23 + 1;
      }
      while ((id)(v23 + 1) != v21);
      id v21 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v21);
  }
  return v20;
}

- (void)setScriptingAnimations:(id)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v21 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      for (id i = 0; i != v21; id i = (char *)i + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(a3);
        }
        id v5 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v6 = objc_msgSend(a3, "objectForKey:", v5, v19);
        id v7 = [v6 objectForKey:@"times"];
        id v8 = [v6 objectForKey:@"values"];
        id v9 = +[MPAnimationPathKeyframed animationPath];
        uint64_t v10 = (char *)[v7 count];
        if ((uint64_t)v10 >= 1)
        {
          long long v11 = v10;
          for (j = 0; j != v11; ++j)
          {
            if (([v5 isEqualToString:@"size"] & 1) != 0
              || [v5 isEqualToString:@"position"])
            {
              int v22 = 0;
              objc_msgSend(objc_msgSend(v8, "objectAtIndex:", j), "getBytes:length:", &v22, 4);
              double v13 = (double)(__int16)v22;
              double v14 = (double)SHIWORD(v22);
              objc_msgSend(objc_msgSend(v7, "objectAtIndex:", j), "doubleValue");
              objc_msgSend(v9, "createKeyframeWithPoint:atTime:", v13, v14, v15);
            }
            else
            {
              objc_msgSend(objc_msgSend(v8, "objectAtIndex:", j), "doubleValue");
              double v17 = v16;
              objc_msgSend(objc_msgSend(v7, "objectAtIndex:", j), "doubleValue");
              [v9 createKeyframeWithScalar:v17 atTime:v18];
            }
          }
        }
        [(MPLayer *)self setAnimationPath:v9 forKey:v5];
      }
      id v21 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v21);
  }
}

@end