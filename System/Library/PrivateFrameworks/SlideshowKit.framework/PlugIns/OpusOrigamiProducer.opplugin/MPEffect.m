@interface MPEffect
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)effectWithEffectID:(id)a3;
+ (id)effectWithEffectID:(id)a3 andPaths:(id)a4;
+ (id)effectWithEffectID:(id)a3 andStrings:(id)a4;
+ (id)effectWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5;
- (BOOL)hasMovies;
- (BOOL)hasPanoramasInDocument:(id)a3;
- (BOOL)isLive;
- (BOOL)isTextOnly;
- (BOOL)needsParallelizer;
- (BOOL)replaceSlides;
- (BOOL)supportsEffectTiming;
- (BOOL)supportsUnlimitedSlides;
- (CGPoint)position;
- (CGSize)size;
- (MPEffect)init;
- (MPEffect)initWithEffectID:(id)a3;
- (MPEffect)initWithEffectID:(id)a3 andPaths:(id)a4;
- (MPEffect)initWithEffectID:(id)a3 andStrings:(id)a4;
- (MPEffect)initWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5;
- (MZEffectTiming)effectTiming;
- (NSArray)slides;
- (NSArray)texts;
- (NSString)effectID;
- (NSString)presetID;
- (double)fullDuration;
- (double)height;
- (double)lowestDisplayTime;
- (double)mainDuration;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)rotationAngle;
- (double)scale;
- (double)xRotationAngle;
- (double)yPosition;
- (double)yRotationAngle;
- (double)zPosition;
- (id)_effectAttributes;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)audioPlaylist;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectAttributeForKey:(id)a3;
- (id)effectPresetID;
- (id)filters;
- (id)formattedAttributes;
- (id)fullDebugLog;
- (id)nearestLayerGroup;
- (id)nearestPlug;
- (id)objectID;
- (id)objectInFiltersAtIndex:(int64_t)a3;
- (id)objectInSlidesAtIndex:(int64_t)a3;
- (id)objectInTextsAtIndex:(int64_t)a3;
- (id)parentContainer;
- (id)parentDocument;
- (id)plug;
- (id)plugID;
- (id)scriptingAnimations;
- (id)secondarySlides;
- (id)slideForMCSlide:(id)a3;
- (id)slideInformationWithDocument:(id)a3;
- (id)uuid;
- (id)videoPaths;
- (int64_t)audioPriority;
- (int64_t)countOfFilters;
- (int64_t)countOfSlides;
- (int64_t)countOfTexts;
- (int64_t)liveIndex;
- (int64_t)maxNumberOfSecondarySlides;
- (int64_t)maxNumberOfSlides;
- (int64_t)randomSeed;
- (int64_t)zIndex;
- (void)_updateEffectTimingWithDocument:(id)a3;
- (void)_updateEffectTimingWithDocument:(id)a3 forExport:(BOOL)a4;
- (void)_updateTiming:(BOOL)a3;
- (void)_updateTiming:(BOOL)a3 forExport:(BOOL)a4;
- (void)addFilter:(id)a3;
- (void)addFilters:(id)a3;
- (void)addSecondarySlide:(id)a3;
- (void)addSecondarySlides:(id)a3;
- (void)addSlide:(id)a3;
- (void)addSlides:(id)a3;
- (void)addText:(id)a3;
- (void)addTexts:(id)a3;
- (void)applyFormattedAttributes;
- (void)cleanup;
- (void)copyAnimationPaths:(id)a3;
- (void)copyAudioPlaylist:(id)a3;
- (void)copyFilters:(id)a3;
- (void)copySecondarySlides:(id)a3;
- (void)copySlides:(id)a3;
- (void)copyTexts:(id)a3;
- (void)copyVars:(id)a3;
- (void)createSecondarySlidesWithPaths:(id)a3;
- (void)createSlidesWithPaths:(id)a3;
- (void)createTextsWithDefaultStrings;
- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4;
- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4 fillIn:(BOOL)a5;
- (void)dealloc;
- (void)dump;
- (void)insertFilters:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inFiltersAtIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inSlidesAtIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inTextsAtIndex:(int64_t)a4;
- (void)insertSecondarySlides:(id)a3 atIndex:(int64_t)a4;
- (void)insertSlides:(id)a3 atIndex:(int64_t)a4;
- (void)insertTexts:(id)a3 atIndex:(int64_t)a4;
- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)moveSlidesFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)moveTextsFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)reconfigureSlides;
- (void)removeAllFilters;
- (void)removeAllSecondarySlides;
- (void)removeAllSlides;
- (void)removeAllTexts;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)removeObjectFromFiltersAtIndex:(int64_t)a3;
- (void)removeObjectFromSlidesAtIndex:(int64_t)a3;
- (void)removeObjectFromTextsAtIndex:(int64_t)a3;
- (void)removeSecondarySlidesAtIndices:(id)a3;
- (void)removeSlidesAtIndices:(id)a3;
- (void)removeTextsAtIndices:(id)a3;
- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceObjectInSlidesAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceObjectInTextsAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceSlide:(id)a3 atIndex:(int64_t)a4;
- (void)replaceSlideAtIndex:(int64_t)a3 withSlide:(id)a4;
- (void)replaceTextsWitStrings:(id)a3;
- (void)scaleMainDuration;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setAudioPlaylist:(id)a3;
- (void)setAudioPriority:(int64_t)a3;
- (void)setContainer:(id)a3;
- (void)setEffectAttribute:(id)a3 forKey:(id)a4;
- (void)setEffectAttributes:(id)a3;
- (void)setEffectID:(id)a3;
- (void)setFullDuration:(double)a3;
- (void)setHeight:(double)a3;
- (void)setLiveIndex:(int64_t)a3;
- (void)setMainDuration:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setParentContainer:(id)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPlug:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setPresetID:(id)a3;
- (void)setRandomSeed:(int64_t)a3;
- (void)setReplaceSlides:(BOOL)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setScriptingAnimations:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setSkipEffectTiming:(BOOL)a3;
- (void)setWidth:(double)a3;
- (void)setXPosition:(double)a3;
- (void)setXRotationAngle:(double)a3;
- (void)setYPosition:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZPosition:(double)a3;
- (void)updateEffectAttributes;
- (void)updateTiming;
- (void)updateTimingForExport;
@end

@implementation MPEffect

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if ([a3 isEqualToString:@"slides"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"texts"] ^ 1;
  }
}

+ (id)effectWithEffectID:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithEffectID:a3];
  return v3;
}

+ (id)effectWithEffectID:(id)a3 andPaths:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithEffectID:a3 andPaths:a4];
  return v4;
}

+ (id)effectWithEffectID:(id)a3 andStrings:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithEffectID:a3 andStrings:a4];
  return v4;
}

+ (id)effectWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5
{
  id v5 = [objc_alloc((Class)a1) initWithEffectID:a3 strings:a4 paths:a5];
  return v5;
}

- (MPEffect)initWithEffectID:(id)a3
{
  return [(MPEffect *)self initWithEffectID:a3 andPaths:0];
}

- (MPEffect)initWithEffectID:(id)a3 andPaths:(id)a4
{
  v6 = [(MPEffect *)self init];
  v7 = v6;
  if (v6)
  {
    effectID = v6->_effectID;
    if (effectID)
    {

      v7->_effectID = 0;
    }
    v7->_effectID = (NSString *)[a3 copy];
    presetID = v7->_presetID;
    if (presetID)
    {

      v7->_presetID = 0;
    }
    v7->_presetID = (NSString *)[@"Default" copy];
    v7->_supportsEffectTiming = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", a3);
    if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectNeedsRandomSeedInformation:", v7->_effectID))v7->_randomSeed = arc4random(); {
    [(MPEffect *)v7 createSlidesWithPaths:a4];
    }
    [(MPEffect *)v7 _updateTiming:0];
  }
  return v7;
}

- (MPEffect)initWithEffectID:(id)a3 andStrings:(id)a4
{
  v6 = [(MPEffect *)self init];
  v7 = v6;
  if (v6)
  {
    effectID = v6->_effectID;
    if (effectID)
    {

      v7->_effectID = 0;
    }
    v7->_effectID = (NSString *)[a3 copy];
    presetID = v7->_presetID;
    if (presetID)
    {

      v7->_presetID = 0;
    }
    v7->_presetID = (NSString *)[@"Default" copy];
    v7->_supportsEffectTiming = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", a3);
    if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectNeedsRandomSeedInformation:", v7->_effectID))v7->_randomSeed = arc4random(); {
    [(MPEffect *)v7 createTextsWithStrings:a4 secondLineFactor:1.0];
    }
    [(MPEffect *)v7 _updateTiming:0];
  }
  return v7;
}

- (MPEffect)initWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5
{
  v8 = [(MPEffect *)self init];
  v9 = v8;
  if (v8)
  {
    effectID = v8->_effectID;
    if (effectID)
    {

      v9->_effectID = 0;
    }
    v9->_effectID = (NSString *)[a3 copy];
    presetID = v9->_presetID;
    if (presetID)
    {

      v9->_presetID = 0;
    }
    v9->_presetID = (NSString *)[@"Default" copy];
    v9->_supportsEffectTiming = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", a3);
    if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectNeedsRandomSeedInformation:", v9->_effectID))v9->_randomSeed = arc4random(); {
    [(MPEffect *)v9 createTextsWithStrings:a4 secondLineFactor:1.0];
    }
    [(MPEffect *)v9 createSlidesWithPaths:a5];
    [(MPEffect *)v9 _updateTiming:0];
  }
  return v9;
}

- (MPEffect)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPEffect;
  v2 = [(MPEffect *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    *((void *)v2 + 5) = 0;
    *((void *)v2 + 13) = 0x3FF0000000000000;
    *((CGPoint *)v2 + 7) = CGPointZero;
    *((_OWORD *)v2 + 8) = xmmword_1653B0;
    *((void *)v2 + 18) = 0x4000000000000000;
    *((void *)v2 + 20) = 0;
    *((void *)v2 + 21) = 0;
    *((void *)v2 + 22) = 0x3FF0000000000000;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    *(_OWORD *)(v2 + 232) = xmmword_1653C0;
    *((void *)v2 + 27) = [@"Undefined" copy];
    *((void *)v3 + 28) = [@"Default" copy];
    *(_OWORD *)(v3 + 8) = 0u;
    *(_OWORD *)(v3 + 24) = 0u;
    *((_OWORD *)v3 + 3) = 0u;
    *((_OWORD *)v3 + 4) = 0u;
    *(_OWORD *)(v3 + 73) = 0u;
    *((void *)v3 + 31) = 0;
    *((void *)v3 + 32) = 0;
    v3[264] = 0;
  }
  return (MPEffect *)v3;
}

- (id)description
{
  id v3 = [[[+[NSString stringWithFormat:@"============================= Effect %d Description ============================\n", [(MPEffect *)self zIndex]] stringByAppendingFormat:@"\t                         ID: %@\n" stringByAppendingFormat:"stringByAppendingFormat:" stringByAppendingFormat:[(MPEffect *)self presetID]], "stringByAppendingFormat:", @"\t                 Attributes: %@\n", [(MPEffect *)self effectAttributes]];
  slides = self->_slides;
  if (slides) {
    slides = (NSMutableArray *)[(NSMutableArray *)slides count];
  }
  objc_super v5 = [(NSString *)v3 stringByAppendingFormat:@"\t                Slide Count: %d\n", slides];
  texts = self->_texts;
  if (texts) {
    texts = (NSMutableArray *)[(NSMutableArray *)texts count];
  }
  v7 = [(NSString *)v5 stringByAppendingFormat:@"\t                 Text Count: %d\n", texts];
  filters = self->_filters;
  if (filters) {
    filters = (NSMutableArray *)[(NSMutableArray *)filters count];
  }
  v9 = [(NSString *)v7 stringByAppendingFormat:@"\t               Filter Count: %d\n", filters];
  [(MPEffect *)self mainDuration];
  v11 = [(NSString *)v9 stringByAppendingFormat:@"\t              Main Duration: %f\n", v10];
  [(MPEffect *)self phaseInDuration];
  v13 = [(NSString *)v11 stringByAppendingFormat:@"\t          Phase In Duration: %f\n", v12];
  [(MPEffect *)self phaseOutDuration];
  v15 = [(NSString *)v13 stringByAppendingFormat:@"\t         Phase Out Duration: %f\n", v14];
  [(MPEffect *)self opacity];
  v17 = [(NSString *)v15 stringByAppendingFormat:@"\t                    Opacity: %f\n", v16];
  [(MPEffect *)self position];
  v18 = [(NSString *)v17 stringByAppendingFormat:@"\t                   Position: %@\n", NSStringFromCGPoint(v32)];
  [(MPEffect *)self size];
  v19 = [(NSString *)v18 stringByAppendingFormat:@"\t                       Size: %@\n", NSStringFromCGSize(v33)];
  [(MPEffect *)self zPosition];
  id v21 = objc_msgSend(v19, "stringByAppendingFormat:", @"\t                 Z Position: %f\n", v20);
  [(MPEffect *)self xRotationAngle];
  id v23 = objc_msgSend(v21, "stringByAppendingFormat:", @"\t           X Rotation Angle: %f\n", v22);
  [(MPEffect *)self yRotationAngle];
  id v25 = objc_msgSend(v23, "stringByAppendingFormat:", @"\t           Y Rotation Angle: %f\n", v24);
  [(MPEffect *)self rotationAngle];
  id v27 = objc_msgSend(v25, "stringByAppendingFormat:", @"\t           Z Rotation Angle: %f\n", v26);
  if (self->_plug) {
    CFStringRef v28 = @"YES";
  }
  else {
    CFStringRef v28 = @"NO";
  }
  id v29 = [v27 stringByAppendingFormat:@"\t            Has Effect Plug: %@\n", v28];
  if (self->_container) {
    CFStringRef v30 = @"YES";
  }
  else {
    CFStringRef v30 = @"NO";
  }
  return [v29 stringByAppendingFormat:@"\t Has Effect EffectContainer: %@\n", v30];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  [v4 copySlides:self->_slides];
  [v4 copySecondarySlides:self->_secondarySlides];
  [v4 copyTexts:self->_texts];
  [v4 copyFilters:self->_filters];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyAudioPlaylist:self->_audioPlaylist];
  return v4;
}

- (void)dealloc
{
  [(MPEffect *)self cleanup];
  plug = self->_plug;
  if (plug) {

  }
  self->_plug = 0;
  container = self->_container;
  if (container) {

  }
  self->_container = 0;
  self->_attributes = 0;

  self->_slides = 0;
  self->_secondarySlides = 0;

  self->_texts = 0;
  self->_animationPaths = 0;

  self->_filters = 0;
  self->_audioPlaylist = 0;

  self->_effectTiming = 0;
  self->_effectID = 0;

  self->_presetID = 0;
  self->_uuid = 0;
  v5.receiver = self;
  v5.super_class = (Class)MPEffect;
  [(MPEffect *)&v5 dealloc];
}

- (NSString)effectID
{
  return self->_effectID;
}

- (void)setEffectID:(id)a3
{
  effectID = self->_effectID;
  if (effectID)
  {

    self->_effectID = 0;
  }
  self->_effectID = (NSString *)[a3 copy];
  self->_supportsEffectTiming = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", a3);
  [(MPEffect *)self _updateTiming:1];
  if (self->_randomSeed == -1
    && objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectNeedsRandomSeedInformation:", self->_effectID))
  {
    self->_randomSeed = arc4random();
  }
  [(MPEffect *)self setPresetID:@"Default"];
  if (self->_replaceSlides) {
    [(MPEffect *)self reconfigureSlides];
  }
  container = self->_container;
  if (container)
  {
    [(MCContainerEffect *)container setEffectID:a3];
  }
}

- (NSString)presetID
{
  if (self->_presetID) {
    return self->_presetID;
  }
  else {
    return (NSString *)@"Default";
  }
}

- (void)setPresetID:(id)a3
{
  presetID = self->_presetID;
  if (presetID)
  {

    self->_presetID = 0;
  }
  self->_presetID = (NSString *)[a3 copy];
  attributes = self->_attributes;
  if (attributes)
  {

    self->_attributes = 0;
  }
  [(MPEffect *)self applyFormattedAttributes];
  if (self->_supportsEffectTiming)
  {
    [(MPEffect *)self _updateTiming:1];
  }
}

- (void)setEffectAttributes:(id)a3
{
  attributes = self->_attributes;
  if (attributes)
  {

    self->_attributes = 0;
  }
  self->_attributes = (NSMutableDictionary *)[a3 mutableCopy];
  [(MPEffect *)self applyFormattedAttributes];
  if (self->_supportsEffectTiming)
  {
    [(MPEffect *)self _updateTiming:1];
  }
}

- (id)effectAttributeForKey:(id)a3
{
  id v4 = [(MPEffect *)self _effectAttributes];
  return [v4 objectForKey:a3];
}

- (void)setEffectAttribute:(id)a3 forKey:(id)a4
{
  attributes = self->_attributes;
  if (!attributes)
  {
    attributes = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_attributes = attributes;
  }
  [(NSMutableDictionary *)attributes setValue:a3 forKey:a4];
  container = self->_container;
  if (container)
  {
    [(MCContainerEffect *)container setEffectAttribute:a3 forKey:a4];
  }
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
  if (self->_container)
  {
    if (a3 == 1.0
      && self->_plug
      && (objc_super v5 = self->_parentContainer) != 0
      && ![(MPEffectContainer *)v5 shouldBeParallelizer])
    {
      parentContainer = self->_parentContainer;
      [(MPEffectContainer *)parentContainer convertFromParallelizerToEffectContainer];
    }
    else
    {
      plug = self->_plug;
      if (a3 != 1.0 && plug == 0)
      {
        v8 = self->_parentContainer;
        [(MPEffectContainer *)v8 convertFromEffectContainerToParallelizer];
      }
      else if (plug)
      {
        [(MCPlugParallel *)plug setOpacity:a3];
      }
    }
  }
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  if (self->_container)
  {
    if (a3 != 1.0
      && self->_plug
      && (objc_super v5 = self->_parentContainer) != 0
      && ![(MPEffectContainer *)v5 shouldBeParallelizer])
    {
      parentContainer = self->_parentContainer;
      [(MPEffectContainer *)parentContainer convertFromParallelizerToEffectContainer];
    }
    else
    {
      plug = self->_plug;
      if (a3 == 1.0 && plug == 0)
      {
        v8 = self->_parentContainer;
        [(MPEffectContainer *)v8 convertFromEffectContainerToParallelizer];
      }
      else if (plug)
      {
        [(MCPlugParallel *)plug setScale:a3];
      }
    }
  }
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
  if (!self->_container) {
    return;
  }
  double y = a3.y;
  double x = a3.x;
  plug = self->_plug;
  if (a3.x != CGPointZero.x || a3.y != CGPointZero.y)
  {
    if (!plug)
    {
      parentContainer = self->_parentContainer;
      [(MPEffectContainer *)parentContainer convertFromEffectContainerToParallelizer];
      return;
    }
    goto LABEL_13;
  }
  if (!plug) {
    return;
  }
  if ([(MPEffect *)self needsParallelizer])
  {
    plug = self->_plug;
    if (!plug) {
      return;
    }
LABEL_13:
    -[MCPlugParallel setPosition:](plug, "setPosition:", x, y);
    return;
  }
  v9 = self->_parentContainer;
  [(MPEffectContainer *)v9 convertFromParallelizerToEffectContainer];
}

- (double)zPosition
{
  return self->_zPosition;
}

- (void)setZPosition:(double)a3
{
  self->_zPosition = a3;
  if (self->_container)
  {
    if (a3 == 0.0
      && self->_plug
      && (objc_super v5 = self->_parentContainer) != 0
      && ![(MPEffectContainer *)v5 shouldBeParallelizer])
    {
      parentContainer = self->_parentContainer;
      [(MPEffectContainer *)parentContainer convertFromParallelizerToEffectContainer];
    }
    else
    {
      plug = self->_plug;
      if (a3 != 0.0 && plug == 0)
      {
        v8 = self->_parentContainer;
        [(MPEffectContainer *)v8 convertFromEffectContainerToParallelizer];
      }
      else if (plug)
      {
        [(MCPlugParallel *)plug setZPosition:a3];
      }
    }
  }
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
  if (self->_container)
  {
    if (a3 == 0.0
      && self->_plug
      && (objc_super v5 = self->_parentContainer) != 0
      && ![(MPEffectContainer *)v5 shouldBeParallelizer])
    {
      parentContainer = self->_parentContainer;
      [(MPEffectContainer *)parentContainer convertFromParallelizerToEffectContainer];
    }
    else
    {
      plug = self->_plug;
      if (a3 != 0.0 && plug == 0)
      {
        v8 = self->_parentContainer;
        [(MPEffectContainer *)v8 convertFromEffectContainerToParallelizer];
      }
      else if (plug)
      {
        [(MCPlugParallel *)plug setRotationAngle:a3];
      }
    }
  }
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
  if (!self->_container) {
    return;
  }
  double height = a3.height;
  double width = a3.width;
  plug = self->_plug;
  if (a3.width != 2.0 || a3.height != 2.0)
  {
    if (!plug)
    {
      parentContainer = self->_parentContainer;
      [(MPEffectContainer *)parentContainer convertFromEffectContainerToParallelizer];
      return;
    }
    goto LABEL_14;
  }
  if (!plug) {
    return;
  }
  if (!self->_parentContainer)
  {
LABEL_14:
    -[MCPlugParallel setSize:](plug, "setSize:", width, height);
    return;
  }
  if ([(MPEffectContainer *)self->_parentContainer shouldBeParallelizer])
  {
    plug = self->_plug;
    if (!plug) {
      return;
    }
    goto LABEL_14;
  }
  v9 = self->_parentContainer;
  [(MPEffectContainer *)v9 convertFromParallelizerToEffectContainer];
}

- (double)xRotationAngle
{
  return self->_xRotationAngle;
}

- (void)setXRotationAngle:(double)a3
{
  self->_xRotationAngle = a3;
  if (self->_container)
  {
    if (a3 == 0.0
      && self->_plug
      && (objc_super v5 = self->_parentContainer) != 0
      && ![(MPEffectContainer *)v5 shouldBeParallelizer])
    {
      parentContainer = self->_parentContainer;
      [(MPEffectContainer *)parentContainer convertFromParallelizerToEffectContainer];
    }
    else
    {
      plug = self->_plug;
      if (a3 != 0.0 && plug == 0)
      {
        v8 = self->_parentContainer;
        [(MPEffectContainer *)v8 convertFromEffectContainerToParallelizer];
      }
      else if (plug)
      {
        [(MCPlugParallel *)plug setXRotationAngle:a3];
      }
    }
  }
}

- (double)yRotationAngle
{
  return self->_yRotationAngle;
}

- (void)setYRotationAngle:(double)a3
{
  self->_yRotationAngle = a3;
  if (self->_container)
  {
    if (a3 == 0.0
      && self->_plug
      && (objc_super v5 = self->_parentContainer) != 0
      && ![(MPEffectContainer *)v5 shouldBeParallelizer])
    {
      parentContainer = self->_parentContainer;
      [(MPEffectContainer *)parentContainer convertFromParallelizerToEffectContainer];
    }
    else
    {
      plug = self->_plug;
      if (a3 != 0.0 && plug == 0)
      {
        v8 = self->_parentContainer;
        [(MPEffectContainer *)v8 convertFromEffectContainerToParallelizer];
      }
      else if (plug)
      {
        [(MCPlugParallel *)plug setYRotationAngle:a3];
      }
    }
  }
}

- (double)fullDuration
{
  [(MPEffect *)self phaseInDuration];
  double v4 = v3;
  [(MPEffect *)self mainDuration];
  double v6 = v4 + v5;
  [(MPEffect *)self phaseOutDuration];
  return v6 + v7;
}

- (void)setFullDuration:(double)a3
{
  [(MPEffect *)self fullDuration];
  double v6 = v5 - a3;
  [(MPEffect *)self mainDuration];
  double v8 = v7 + v6;
  [(MPEffect *)self setMainDuration:v8];
}

- (double)phaseInDuration
{
  return self->_phaseInDuration;
}

- (void)setPhaseInDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    [(MPEffect *)self phaseInDuration];
    if (v5 != v3)
    {
      id v6 = objc_msgSend(objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "parentLayer"), "parentDocument");
      id v7 = [(MPEffect *)self nearestLayerGroup];
      if (v7) {
        unsigned int v8 = [v7 autoAdjustDuration] ^ 1;
      }
      else {
        unsigned int v8 = 0;
      }
      if (self->_parentContainer)
      {
        if (((objc_msgSend(objc_msgSend(v6, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue") ^ 1 | v8) & 1) == 0)
        {
          [(MPEffect *)self phaseInDuration];
          double v10 = v9 - v3;
          [(MPEffect *)self fullDuration];
          double v12 = v11 - v10;
          [(MPEffectContainer *)self->_parentContainer findMinDuration];
          if (v12 < v13)
          {
            [(MPEffectContainer *)self->_parentContainer findMinDuration];
            double v15 = v14;
            [(MPEffect *)self phaseOutDuration];
            double v17 = v15 - v16;
            [(MPEffect *)self mainDuration];
            double v3 = v17 - v18;
          }
        }
      }
      [(MPEffect *)self phaseInDuration];
      self->_double phaseInDuration = v3;
      if ((v8 & 1) == 0) {
        [(MPEffectContainer *)self->_parentContainer calculateDurationToSmallest:v3 < v19];
      }
      if (self->_container)
      {
        plug = self->_plug;
        if (!plug) {
          plug = [(MPEffectContainer *)self->_parentContainer plug];
        }
        [(MCPlug *)plug setPhaseInDuration:v3];
      }
      effectTiming = self->_effectTiming;
      if (effectTiming)
      {
        double phaseOutDuration = self->_phaseOutDuration;
        double mainDuration = self->_mainDuration;
        double phaseInDuration = self->_phaseInDuration;
        [(MZEffectTiming *)effectTiming setPhaseInDuration:phaseInDuration mainDuration:mainDuration phaseOutDuration:phaseOutDuration];
      }
    }
  }
}

- (double)phaseOutDuration
{
  return self->_phaseOutDuration;
}

- (void)setPhaseOutDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    [(MPEffect *)self phaseOutDuration];
    if (v5 != v3)
    {
      id v6 = objc_msgSend(objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "parentLayer"), "parentDocument");
      id v7 = [(MPEffect *)self nearestLayerGroup];
      if (v7) {
        unsigned int v8 = [v7 autoAdjustDuration] ^ 1;
      }
      else {
        unsigned int v8 = 0;
      }
      if (self->_parentContainer)
      {
        if (((objc_msgSend(objc_msgSend(v6, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue") ^ 1 | v8) & 1) == 0)
        {
          [(MPEffect *)self phaseOutDuration];
          double v10 = v9 - v3;
          [(MPEffect *)self fullDuration];
          double v12 = v11 - v10;
          [(MPEffectContainer *)self->_parentContainer findMinDuration];
          if (v12 < v13)
          {
            [(MPEffectContainer *)self->_parentContainer findMinDuration];
            double v15 = v14;
            [(MPEffect *)self phaseInDuration];
            double v17 = v15 - v16;
            [(MPEffect *)self mainDuration];
            double v3 = v17 - v18;
          }
        }
      }
      [(MPEffect *)self phaseOutDuration];
      self->_double phaseOutDuration = v3;
      if ((v8 & 1) == 0) {
        [(MPEffectContainer *)self->_parentContainer calculateDurationToSmallest:v3 < v19];
      }
      if (self->_container)
      {
        plug = self->_plug;
        if (!plug) {
          plug = [(MPEffectContainer *)self->_parentContainer plug];
        }
        [(MCPlug *)plug setPhaseOutDuration:v3];
      }
      effectTiming = self->_effectTiming;
      if (effectTiming)
      {
        double phaseOutDuration = self->_phaseOutDuration;
        double mainDuration = self->_mainDuration;
        double phaseInDuration = self->_phaseInDuration;
        [(MZEffectTiming *)effectTiming setPhaseInDuration:phaseInDuration mainDuration:mainDuration phaseOutDuration:phaseOutDuration];
      }
    }
  }
}

- (double)mainDuration
{
  return self->_mainDuration;
}

- (void)setMainDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    [(MPEffect *)self mainDuration];
    if (v5 != v3)
    {
      id v6 = objc_msgSend(objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "parentLayer"), "parentDocument");
      id v7 = [(MPEffect *)self nearestLayerGroup];
      if (v7) {
        unsigned int v8 = [v7 autoAdjustDuration] ^ 1;
      }
      else {
        unsigned int v8 = 0;
      }
      if (self->_parentContainer)
      {
        if (((objc_msgSend(objc_msgSend(v6, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue") ^ 1 | v8) & 1) == 0)
        {
          [(MPEffect *)self mainDuration];
          double v10 = v9 - v3;
          [(MPEffect *)self fullDuration];
          double v12 = v11 - v10;
          [(MPEffectContainer *)self->_parentContainer findMinDuration];
          if (v12 < v13)
          {
            [(MPEffectContainer *)self->_parentContainer findMinDuration];
            double v15 = v14;
            [(MPEffect *)self phaseInDuration];
            double v17 = v15 - v16;
            [(MPEffect *)self phaseOutDuration];
            double v3 = v17 - v18;
          }
        }
      }
      [(MPEffect *)self mainDuration];
      self->_double mainDuration = v3;
      if ((v8 & 1) == 0) {
        [(MPEffectContainer *)self->_parentContainer calculateDurationToSmallest:v3 < v19];
      }
      if (self->_container)
      {
        plug = self->_plug;
        if (!plug) {
          plug = [(MPEffectContainer *)self->_parentContainer plug];
        }
        [(MCPlug *)plug setLoopDuration:v3];
      }
      effectTiming = self->_effectTiming;
      if (effectTiming)
      {
        double phaseOutDuration = self->_phaseOutDuration;
        double mainDuration = self->_mainDuration;
        double phaseInDuration = self->_phaseInDuration;
        [(MZEffectTiming *)effectTiming setPhaseInDuration:phaseInDuration mainDuration:mainDuration phaseOutDuration:phaseOutDuration];
      }
    }
  }
}

- (int64_t)zIndex
{
  parentContainer = self->_parentContainer;
  if (!parentContainer) {
    return -1;
  }
  if (self->_container) {
    return [(MCPlugParallel *)self->_plug zIndex];
  }
  id v5 = [(MPEffectContainer *)parentContainer effects];
  return (int64_t)[v5 indexOfObject:self];
}

- (NSArray)slides
{
  return &self->_slides->super;
}

- (void)addSlide:(id)a3
{
  id v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  slides = self->_slides;
  if (slides) {
    id v5 = [(NSMutableArray *)slides count];
  }
  else {
    id v5 = 0;
  }
  [(MPEffect *)self insertSlides:v6 atIndex:v5];
}

- (void)addSlides:(id)a3
{
  slides = self->_slides;
  if (slides) {
    id v6 = [(NSMutableArray *)slides count];
  }
  else {
    id v6 = 0;
  }
  [(MPEffect *)self insertSlides:a3 atIndex:v6];
}

- (void)insertSlides:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_slides) {
    self->_slides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  if (!self->_replaceSlides) {
    [(MPEffect *)self willChange:2 valuesAtIndexes:v8 forKey:@"slides"];
  }
  if ([(NSMutableArray *)self->_slides count]) {
    unsigned int v9 = [(MCContainerEffect *)self->_container isLive];
  }
  else {
    unsigned int v9 = 0;
  }
  id v59 = v8;
  [(NSMutableArray *)self->_slides insertObjects:a3 atIndexes:v8];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v82;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v82 != v12) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v81 + 1) + 8 * i) setParent:self];
      }
      id v11 = [a3 countByEnumeratingWithState:&v81 objects:v90 count:16];
    }
    while (v11);
  }
  if (self->_container)
  {
    v57 = v7;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    if (v9) {
      a4 = [(MCContainerEffect *)self->_container nextAvailableSlideIndex];
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v15 = [a3 countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v60 = *(void *)v78;
      uint64_t v17 = -1;
      while (2)
      {
        double v18 = 0;
        uint64_t v19 = v17;
        do
        {
          if (*(void *)v78 != v60) {
            objc_enumerationMutation(a3);
          }
          id v20 = [*(id *)(*((void *)&v77 + 1) + 8 * (void)v18) path];
          id v21 = v20;
          uint64_t v17 = v20 == 0;
          if (v19 != -1 && v19 != v17) {
            goto LABEL_36;
          }
          double v18 = (char *)v18 + 1;
          uint64_t v19 = v20 == 0;
        }
        while (v16 != v18);
        id v16 = [a3 countByEnumeratingWithState:&v77 objects:v89 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      if (!v21)
      {
LABEL_36:
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v27 = [a3 countByEnumeratingWithState:&v73 objects:v88 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v74;
          do
          {
            for (j = 0; j != v28; j = (char *)j + 1)
            {
              if (*(void *)v74 != v29) {
                objc_enumerationMutation(a3);
              }
              v31 = *(void **)(*((void *)&v73 + 1) + 8 * (void)j);
              if ([v31 path]) {
                id v32 = -[MCContainerEffect insertSlideForAsset:atIndex:](self->_container, "insertSlideForAsset:atIndex:", objc_msgSend(objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage"), "videoAssetForFileAtPath:", objc_msgSend(v31, "path")), a4);
              }
              else {
                id v32 = [(MCContainerEffect *)self->_container insertSlideAtIndex:a4];
              }
              [v14 addObject:v32];
              if (v9) {
                a4 = [(MCContainerEffect *)self->_container nextAvailableSlideIndex];
              }
              else {
                ++a4;
              }
            }
            id v28 = [a3 countByEnumeratingWithState:&v73 objects:v88 count:16];
          }
          while (v28);
        }
        goto LABEL_49;
      }
    }
    id v22 = objc_alloc_init((Class)NSMutableArray);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v23 = [a3 countByEnumeratingWithState:&v69 objects:v87 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v70;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v70 != v25) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v22, "addObject:", objc_msgSend(objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage"), "videoAssetForFileAtPath:", objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * (void)k), "path")));
        }
        id v24 = [a3 countByEnumeratingWithState:&v69 objects:v87 count:16];
      }
      while (v24);
    }
    objc_msgSend(v14, "addObjectsFromArray:", -[MCContainerEffect insertSlidesForAssets:atIndex:](self->_container, "insertSlidesForAssets:atIndex:", v22, a4));

LABEL_49:
    id v33 = [v14 objectEnumerator];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v34 = [a3 countByEnumeratingWithState:&v65 objects:v86 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v66;
      do
      {
        for (m = 0; m != v35; m = (char *)m + 1)
        {
          if (*(void *)v66 != v36) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * (void)m), "setSlide:", objc_msgSend(v33, "nextObject"));
        }
        id v35 = [a3 countByEnumeratingWithState:&v65 objects:v86 count:16];
      }
      while (v35);
    }

    id v7 = v57;
  }
  v38 = v59;
  if (!self->_replaceSlides) {
    [(MPEffect *)self didChange:2 valuesAtIndexes:v59 forKey:@"slides"];
  }
  if (self->_supportsEffectTiming)
  {
    id v39 = [(MPEffect *)self parentDocument];
    if (!v39)
    {
      if (objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "isAuthoring"))id v39 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument"); {
      else
      }
        id v39 = 0;
    }
    id v40 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument");
    if [v39 isLive] && (objc_opt_respondsToSelector())
    {
      v58 = v7;
      id v41 = objc_alloc_init((Class)NSMutableArray);
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v42 = [a3 countByEnumeratingWithState:&v61 objects:v85 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v62;
        double height = CGSizeZero.height;
        do
        {
          for (n = 0; n != v43; n = (char *)n + 1)
          {
            if (*(void *)v62 != v44) {
              objc_enumerationMutation(a3);
            }
            id v47 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)n) path];
            if (v47)
            {
              id v48 = v47;
              id v49 = objc_alloc_init((Class)NSMutableDictionary);
              if (v39) {
                [v39 resolutionForPath:v48];
              }
              else {
                objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "resolutionForAssetAtPath:", v48);
              }
              if (v50 == CGSizeZero.width && v51 == height && v40 != 0) {
                [v40 resolutionForPath:v48];
              }
              double v54 = v50 / v51;
              *(float *)&double v54 = v54;
              objc_msgSend(v49, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v54), @"aspectRatio");
              [v41 addObject:v49];
            }
          }
          id v43 = [a3 countByEnumeratingWithState:&v61 objects:v85 count:16];
        }
        while (v43);
      }
      if ([v41 count]) {
        [(MZEffectTiming *)self->_effectTiming appendSlideInformation:v41 andTextInformation:0];
      }

      [(MZEffectTiming *)self->_effectTiming phaseInDuration];
      -[MPEffect setPhaseInDuration:](self, "setPhaseInDuration:");
      [(MZEffectTiming *)self->_effectTiming phaseOutDuration];
      -[MPEffect setPhaseOutDuration:](self, "setPhaseOutDuration:");
      [(MZEffectTiming *)self->_effectTiming mainDuration];
      -[MPEffect setMainDuration:](self, "setMainDuration:");
      id v7 = v58;
      v38 = v59;
      if ([(NSMutableArray *)self->_slides count])
      {
        v55 = objc_msgSend(objc_msgSend(-[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", 0), "slide"), "index");
        v56 = (char *)((unsigned char *)objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](self->_slides, "lastObject"), "slide"), "index")- v55+ 1);
      }
      else
      {
        v55 = 0;
        v56 = 0;
      }
      -[MZEffectTiming setMultiImageSlideRange:](self->_effectTiming, "setMultiImageSlideRange:", v55, v56);
    }
    else
    {
      [(MPEffect *)self _updateTiming:1];
    }
  }
}

- (void)removeSlidesAtIndices:(id)a3
{
  slides = self->_slides;
  if (slides)
  {
    if ([(NSMutableArray *)slides count])
    {
      id v6 = [a3 lastIndex];
      if (v6 < [(NSMutableArray *)self->_slides count])
      {
        if (self->_replaceSlides) {
          uint64_t v8 = 4;
        }
        else {
          uint64_t v8 = 3;
        }
        [(MPEffect *)self willChange:v8 valuesAtIndexes:a3 forKey:@"slides"];
        if (self->_container)
        {
          id v9 = [a3 mutableCopy];
          if ([(MCContainerEffect *)self->_container isLive]) {
            objc_msgSend(v9, "shiftIndexesStartingAtIndex:by:", objc_msgSend(v9, "firstIndex"), self->_liveIndex - (void)objc_msgSend(a3, "count"));
          }
          [(MCContainerEffect *)self->_container removeSlidesAtIndices:v9];
        }
        id v10 = [a3 lastIndex];
        if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          for (id i = v10; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
          {
            id v12 = [(NSMutableArray *)self->_slides objectAtIndex:i];
            [v12 setParent:0];
            [v12 setSlide:0];
          }
        }
        [(NSMutableArray *)self->_slides removeObjectsAtIndexes:a3];
        if (self->_replaceSlides)
        {
          id v13 = [a3 firstIndex];
          if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            for (id j = v13; j != (id)0x7FFFFFFFFFFFFFFFLL; id j = [a3 indexGreaterThanIndex:j])
            {
              id v15 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", +[MPSlide slide](MPSlide, "slide"), 0);
              [(MPEffect *)self insertSlides:v15 atIndex:j];
            }
          }
        }
        [(MPEffect *)self didChange:v8 valuesAtIndexes:a3 forKey:@"slides"];
        if (self->_supportsEffectTiming)
        {
          id v16 = [(MPEffect *)self parentDocument];
          if (!v16)
          {
            if (objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "isAuthoring"))id v16 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument"); {
            else
            }
              id v16 = 0;
          }
          if (![v16 isLive] || (objc_opt_respondsToSelector() & 1) == 0) {
            [(MPEffect *)self _updateTiming:1];
          }
          if ([v16 isLive])
          {
            if ([(NSMutableArray *)self->_slides count])
            {
              uint64_t v17 = objc_msgSend(objc_msgSend(-[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", 0), "slide"), "index");
              double v18 = (char *)((unsigned char *)objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](self->_slides, "lastObject"), "slide"), "index")- v17+ 1);
            }
            else
            {
              uint64_t v17 = 0;
              double v18 = 0;
            }
            -[MZEffectTiming setMultiImageSlideRange:](self->_effectTiming, "setMultiImageSlideRange:", v17, v18);
          }
        }
      }
    }
  }
}

- (void)removeAllSlides
{
  if ([(NSMutableArray *)self->_slides count])
  {
    id v3 = objc_alloc((Class)NSIndexSet);
    slides = self->_slides;
    if (slides) {
      id v5 = [(NSMutableArray *)slides count];
    }
    else {
      id v5 = 0;
    }
    id v6 = objc_msgSend(v3, "initWithIndexesInRange:", 0, v5);
    [(MPEffect *)self removeSlidesAtIndices:v6];
  }
}

- (void)replaceSlideAtIndex:(int64_t)a3 withSlide:(id)a4
{
  if (self->_slides)
  {
    id v7 = [objc_alloc((Class)NSIndexSet) initWithIndex:a3];
    [(MPEffect *)self willChange:4 valuesAtIndexes:v7 forKey:@"slides"];
    container = self->_container;
    if (container)
    {
      [(MCContainerEffect *)container removeSlidesAtIndices:v7];
      id v9 = [(NSMutableArray *)self->_slides objectAtIndex:a3];
      [v9 setParent:0];
      [v9 setSlide:0];
    }
    [(NSMutableArray *)self->_slides removeObjectsAtIndexes:v7];
    BOOL replaceSlides = self->_replaceSlides;
    self->_BOOL replaceSlides = 1;
    id v11 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a4, 0);
    [(MPEffect *)self insertSlides:v11 atIndex:a3];

    self->_BOOL replaceSlides = replaceSlides;
    [(MPEffect *)self didChange:4 valuesAtIndexes:v7 forKey:@"slides"];

    if (self->_supportsEffectTiming)
    {
      [(MPEffect *)self _updateTiming:1];
    }
  }
}

- (void)replaceSlide:(id)a3 atIndex:(int64_t)a4
{
}

- (void)moveSlidesFromIndices:(id)a3 toIndex:(int64_t)a4
{
  slides = self->_slides;
  if (slides)
  {
    if (self->_container)
    {
      [(MCContainerEffect *)self->_container moveSlidesAtIndices:a3 toIndex:a4];
      slides = self->_slides;
    }
    id v8 = [(NSMutableArray *)slides objectsAtIndexes:a3];
    [(NSMutableArray *)self->_slides removeObjectsAtIndexes:a3];
    id v9 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(v8, "count"));
    [(NSMutableArray *)self->_slides insertObjects:v8 atIndexes:v9];
  }
}

- (id)secondarySlides
{
  return self->_secondarySlides;
}

- (void)addSecondarySlide:(id)a3
{
  id v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  secondarySlides = self->_secondarySlides;
  if (secondarySlides) {
    id v5 = [(NSMutableArray *)secondarySlides count];
  }
  else {
    id v5 = 0;
  }
  [(MPEffect *)self insertSecondarySlides:v6 atIndex:v5];
}

- (void)addSecondarySlides:(id)a3
{
  secondarySlides = self->_secondarySlides;
  if (secondarySlides) {
    id v6 = [(NSMutableArray *)secondarySlides count];
  }
  else {
    id v6 = 0;
  }
  [(MPEffect *)self insertSecondarySlides:a3 atIndex:v6];
}

- (void)insertSecondarySlides:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_secondarySlides) {
    self->_secondarySlides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  if (!self->_replaceSlides) {
    [(MPEffect *)self willChange:2 valuesAtIndexes:v8 forKey:@"secondarySlides"];
  }
  [(NSMutableArray *)self->_secondarySlides insertObjects:a3 atIndexes:v8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (id i = 0; i != v10; id i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(a3);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v13 setParent:self];
        [v13 setIsSecondary:1];
      }
      id v10 = [a3 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v10);
  }
  if (self->_container)
  {
    uint64_t v26 = v7;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = [a3 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (id j = 0; j != v16; id j = (char *)j + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(a3);
          }
          uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          if ([v19 path]) {
            id v20 = -[MCContainerEffect insertSlideForAsset:atIndex:](self->_container, "insertSlideForAsset:atIndex:", objc_msgSend(objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage"), "videoAssetForFileAtPath:", objc_msgSend(v19, "path")), (char *)-[MPEffect maxNumberOfSlides](self, "maxNumberOfSlides") + (void)j + a4);
          }
          else {
            id v20 = [(MCContainerEffect *)self->_container insertSlideAtIndex:(char *)[(MPEffect *)self maxNumberOfSlides] + (void)j + a4];
          }
          [v14 addObject:v20];
        }
        id v16 = [a3 countByEnumeratingWithState:&v31 objects:v40 count:16];
        a4 += (int64_t)j;
      }
      while (v16);
    }
    id v21 = [v14 objectEnumerator];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = [a3 countByEnumeratingWithState:&v27 objects:v39 count:16];
    id v7 = v26;
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)k), "setSlide:", objc_msgSend(v21, "nextObject"));
        }
        id v23 = [a3 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v23);
    }
  }
  if (!self->_replaceSlides) {
    [(MPEffect *)self didChange:2 valuesAtIndexes:v8 forKey:@"secondarySlides"];
  }
}

- (void)removeSecondarySlidesAtIndices:(id)a3
{
  secondarySlides = self->_secondarySlides;
  if (secondarySlides)
  {
    if ([(NSMutableArray *)secondarySlides count])
    {
      id v6 = [a3 lastIndex];
      if (v6 < [(NSMutableArray *)self->_secondarySlides count])
      {
        if (self->_replaceSlides) {
          uint64_t v8 = 4;
        }
        else {
          uint64_t v8 = 3;
        }
        [(MPEffect *)self willChange:v8 valuesAtIndexes:a3 forKey:@"secondarySlides"];
        if (self->_container)
        {
          id v9 = +[NSMutableIndexSet indexSet];
          id v10 = (char *)[a3 firstIndex];
          if (v10 != (char *)0x7FFFFFFFFFFFFFFFLL)
          {
            for (id i = v10; i != (char *)0x7FFFFFFFFFFFFFFFLL; id i = (char *)[a3 indexGreaterThanIndex:i])
              objc_msgSend(v9, "addIndex:", &i[-[MPEffect maxNumberOfSlides](self, "maxNumberOfSlides")]);
          }
          [(MCContainerEffect *)self->_container removeSlidesAtIndices:v9];
        }
        id v12 = [a3 lastIndex];
        if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          for (id j = v12; j != (id)0x7FFFFFFFFFFFFFFFLL; id j = [a3 indexLessThanIndex:j])
          {
            id v14 = [(NSMutableArray *)self->_secondarySlides objectAtIndex:j];
            [v14 setParent:0];
            [v14 setSlide:0];
          }
        }
        [(NSMutableArray *)self->_secondarySlides removeObjectsAtIndexes:a3];
        [(MPEffect *)self didChange:v8 valuesAtIndexes:a3 forKey:@"secondarySlides"];
      }
    }
  }
}

- (void)removeAllSecondarySlides
{
  if ([(NSMutableArray *)self->_secondarySlides count])
  {
    id v3 = objc_alloc((Class)NSIndexSet);
    secondarySlides = self->_secondarySlides;
    if (secondarySlides) {
      id v5 = [(NSMutableArray *)secondarySlides count];
    }
    else {
      id v5 = 0;
    }
    id v6 = objc_msgSend(v3, "initWithIndexesInRange:", 0, v5);
    [(MPEffect *)self removeSecondarySlidesAtIndices:v6];
  }
}

- (BOOL)supportsUnlimitedSlides
{
  return objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfImagesForEffectID:", -[MPEffect effectID](self, "effectID")) == (id)-1;
}

- (BOOL)replaceSlides
{
  return self->_replaceSlides;
}

- (void)setReplaceSlides:(BOOL)a3
{
  self->_BOOL replaceSlides = a3;
}

- (void)_updateEffectTimingWithDocument:(id)a3
{
}

- (void)_updateEffectTimingWithDocument:(id)a3 forExport:(BOOL)a4
{
  if (!self->_supportsEffectTiming || self->_skipEffectTiming) {
    return;
  }
  BOOL v5 = a4;

  self->_effectTiming = 0;
  id v7 = [(MPEffect *)self formattedAttributes];
  if (!a3)
  {
    a3 = [(MPEffect *)self parentDocument];
    if (!a3)
    {
      double v9 = 1.77777779;
      if (!objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "isAuthoring"))
      {
        a3 = 0;
        goto LABEL_7;
      }
      a3 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument");
      if (!a3) {
        goto LABEL_7;
      }
    }
  }
  [a3 aspectRatio];
  double v9 = v8;
LABEL_7:
  if (v5)
  {
    id v7 = +[NSMutableDictionary dictionaryWithDictionary:v7];
    [(NSMutableDictionary *)v7 setObject:+[NSNumber numberWithBool:1] forKey:@"updateEffectAuthoredTimingForExport"];
  }
  self->_effectTiming = (MZEffectTiming *)objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:", self->_effectID, v7, -[MPEffect slideInformationWithDocument:](self, "slideInformationWithDocument:", a3), self->_texts, v9);
  if ((objc_opt_respondsToSelector() & 1) != 0 && v5)
  {
    id v10 = [(MZEffectTiming *)self->_effectTiming effectAuthoredAttributes];
    if (v10)
    {
      uint64_t v11 = v10;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v12 = objc_msgSend(v10, "keyEnumerator", 0);
      id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          for (id i = 0; i != v14; id i = (char *)i + 1)
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v12);
            }
            -[MPEffect setEffectAttribute:forKey:](self, "setEffectAttribute:forKey:", [v11 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)], *(void *)(*((void *)&v17 + 1) + 8 * i));
          }
          id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v14);
      }
    }
  }
}

- (void)_updateTiming:(BOOL)a3
{
}

- (void)_updateTiming:(BOOL)a3 forExport:(BOOL)a4
{
  if (!self->_cleaningUp)
  {
    BOOL v4 = a4;
    id v7 = +[MPEffectManager sharedManager];
    double v15 = 0.0;
    double v16 = 0.0;
    double v14 = 0.0;
    if (self->_supportsEffectTiming)
    {
      [(MPEffect *)self _updateEffectTimingWithDocument:0 forExport:v4];
      [(MZEffectTiming *)self->_effectTiming phaseInDuration];
      double v9 = v8;
      [(MZEffectTiming *)self->_effectTiming phaseOutDuration];
      double v11 = v10;
      [(MZEffectTiming *)self->_effectTiming mainDuration];
      double v13 = v12;
      if (a3)
      {
        if (self->_supportsEffectTiming)
        {
          [(MPEffect *)self setPhaseInDuration:v9];
          [(MPEffect *)self setPhaseOutDuration:v11];
          [(MPEffect *)self setMainDuration:v13];
        }
        return;
      }
    }
    else
    {
      if (a3) {
        return;
      }
      [v7 defaultDurationsForEffectID:self->_effectID phaseInDuration:&v15 mainDuration:&v16 phaseOutDuration:&v14];
      double v11 = v14;
      double v9 = v15;
      double v13 = v16;
    }
    self->_double phaseInDuration = v9;
    self->_double phaseOutDuration = v11;
    self->_double mainDuration = v13;
  }
}

- (double)lowestDisplayTime
{
  effectTiming = self->_effectTiming;
  if (!effectTiming) {
    return -1.0;
  }
  [(MZEffectTiming *)effectTiming lowestDisplayTime];
  return result;
}

- (NSArray)texts
{
  return &self->_texts->super;
}

- (void)addText:(id)a3
{
  id v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  texts = self->_texts;
  if (texts) {
    id v5 = [(NSMutableArray *)texts count];
  }
  else {
    id v5 = 0;
  }
  [(MPEffect *)self insertTexts:v6 atIndex:v5];
}

- (void)addTexts:(id)a3
{
  texts = self->_texts;
  if (texts) {
    id v6 = [(NSMutableArray *)texts count];
  }
  else {
    id v6 = 0;
  }
  [(MPEffect *)self insertTexts:a3 atIndex:v6];
}

- (void)insertTexts:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_texts) {
    self->_texts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  [(MPEffect *)self willChange:2 valuesAtIndexes:v8 forKey:@"texts"];
  [(NSMutableArray *)self->_texts insertObjects:a3 atIndexes:v8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)v12) setParent:self];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v10);
  }
  if (self->_container)
  {
    id v13 = objc_alloc_init((Class)NSMutableArray);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v14 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        long long v17 = 0;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v17), "attributedString"));
          long long v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v15);
    }
    id v18 = objc_msgSend(-[MCContainerEffect insertTextsForAttributedStrings:atIndex:](self->_container, "insertTextsForAttributedStrings:atIndex:", v13, a4), "objectEnumerator");
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        id v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)v22), "setText:", objc_msgSend(v18, "nextObject"));
          id v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v20);
    }
  }
  [(MPEffect *)self didChange:2 valuesAtIndexes:v8 forKey:@"texts"];
}

- (void)removeTextsAtIndices:(id)a3
{
  texts = self->_texts;
  if (texts && [(NSMutableArray *)texts count])
  {
    [(MPEffect *)self willChange:3 valuesAtIndexes:a3 forKey:@"texts"];
    container = self->_container;
    if (container) {
      [(MCContainerEffect *)container removeTextsAtIndices:a3];
    }
    id v8 = [a3 lastIndex];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v8; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v10 = [(NSMutableArray *)self->_texts objectAtIndex:i];
        [v10 setParent:0];
        [v10 setText:0];
      }
    }
    [(NSMutableArray *)self->_texts removeObjectsAtIndexes:a3];
    [(MPEffect *)self didChange:3 valuesAtIndexes:a3 forKey:@"texts"];
  }
}

- (void)removeAllTexts
{
  if ([(NSMutableArray *)self->_texts count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, -[NSMutableArray count](self->_texts, "count"));
    [(MPEffect *)self removeTextsAtIndices:v3];
  }
}

- (void)moveTextsFromIndices:(id)a3 toIndex:(int64_t)a4
{
  texts = self->_texts;
  if (texts)
  {
    if (self->_container)
    {
      [(MCContainerEffect *)self->_container moveTextsAtIndices:a3 toIndex:a4];
      texts = self->_texts;
    }
    id v8 = [(NSMutableArray *)texts objectsAtIndexes:a3];
    [(NSMutableArray *)self->_texts removeObjectsAtIndexes:a3];
    id v9 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(v8, "count"));
    [(NSMutableArray *)self->_texts insertObjects:v8 atIndexes:v9];
  }
}

- (BOOL)isTextOnly
{
  return ![(NSMutableArray *)self->_slides count] && [(NSMutableArray *)self->_texts count] != 0;
}

- (id)filters
{
  return self->_filters;
}

- (void)addFilter:(id)a3
{
  BOOL v4 = +[NSArray arrayWithObject:a3];
  filters = self->_filters;
  if (filters) {
    id v6 = [(NSMutableArray *)filters count];
  }
  else {
    id v6 = 0;
  }
  [(MPEffect *)self insertFilters:v4 atIndex:v6];
}

- (void)addFilters:(id)a3
{
  filters = self->_filters;
  if (filters) {
    id v6 = [(NSMutableArray *)filters count];
  }
  else {
    id v6 = 0;
  }
  [(MPEffect *)self insertFilters:a3 atIndex:v6];
}

- (void)insertFilters:(id)a3 atIndex:(int64_t)a4
{
  int64_t v4 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  [(MPEffect *)self willChange:2 valuesAtIndexes:v7 forKey:@"filters"];
  filters = self->_filters;
  if (!filters)
  {
    filters = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_filters = filters;
  }
  [(NSMutableArray *)filters insertObjects:a3 atIndexes:v7];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)v12) setParent:self];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }
  id v13 = [(NSMutableArray *)self->_filters count];
  plug = self->_plug;
  if (v13)
  {
    if (!plug)
    {
      [(MPEffectContainer *)self->_parentContainer convertFromEffectContainerToParallelizer];
      goto LABEL_21;
    }
  }
  else if (!plug)
  {
    goto LABEL_21;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v15 = [a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v18), "setFilter:", -[MCPlugParallel insertFilterWithFilterID:atIndex:](self->_plug, "insertFilterWithFilterID:atIndex:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v18), "filterID"), (char *)v18 + v4));
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
      v4 += (int64_t)v18;
    }
    while (v16);
  }
LABEL_21:
  [(MPEffect *)self didChange:2 valuesAtIndexes:v7 forKey:@"filters"];
}

- (void)removeFiltersAtIndices:(id)a3
{
  filters = self->_filters;
  if (filters && [(NSMutableArray *)filters count])
  {
    [(MPEffect *)self willChange:3 valuesAtIndexes:a3 forKey:@"filters"];
    id v6 = [a3 lastIndex];
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v6; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v8 = [(NSMutableArray *)self->_filters objectAtIndex:i];
        [v8 setParent:0];
        [v8 setFilter:0];
      }
    }
    plug = self->_plug;
    if (plug) {
      [(MCPlugParallel *)plug removeFiltersAtIndices:a3];
    }
    [(NSMutableArray *)self->_filters removeObjectsAtIndexes:a3];
    if (![(NSMutableArray *)self->_filters count]
      && self->_plug
      && ![(MPEffect *)self needsParallelizer])
    {
      [(MPEffectContainer *)self->_parentContainer convertFromParallelizerToEffectContainer];
    }
    [(MPEffect *)self didChange:3 valuesAtIndexes:a3 forKey:@"filters"];
  }
}

- (void)removeAllFilters
{
  if ([(NSMutableArray *)self->_filters count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, -[NSMutableArray count](self->_filters, "count"));
    [(MPEffect *)self removeFiltersAtIndices:v3];
  }
}

- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  if (self->_filters)
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
}

- (id)animationPaths
{
  return self->_animationPaths;
}

- (id)animationPathForKey:(id)a3
{
  id result = self->_animationPaths;
  if (result) {
    return [result objectForKey:a3];
  }
  return result;
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (!self->_animationPaths) {
      self->_animationPaths = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    id v7 = [(MPEffect *)self animationPathForKey:a4];
    if (v7)
    {
      id v8 = v7;
      [v7 setParent:0];
      [v8 setAnimationPath:0];
    }
    [a3 setParent:self];
    [(NSMutableDictionary *)self->_animationPaths setObject:a3 forKey:a4];
    plug = self->_plug;
    if (plug)
    {
      [(MCPlug *)plug removeAnimationPathForKey:a4];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v11 = off_1A4DC0;
      if ((isKindOfClass & 1) == 0) {
        uint64_t v11 = off_1A4DC8;
      }
      id v12 = [(__objc2_class *)*v11 animationPathWithKey:a4];
      [(MCPlug *)self->_plug addAnimationPath:v12];
      [a3 setAnimationPath:v12];
    }
  }
  else
  {
    [(MPEffect *)self removeAnimationPathForKey:a4];
  }
}

- (void)removeAnimationPathForKey:(id)a3
{
  if (self->_animationPaths)
  {
    id v5 = -[MPEffect animationPathForKey:](self, "animationPathForKey:");
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
}

- (id)audioPlaylist
{
  return self->_audioPlaylist;
}

- (void)setAudioPlaylist:(id)a3
{
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {
    [(MPAudioPlaylist *)audioPlaylist setParentObject:0];
    [(MPAudioPlaylist *)self->_audioPlaylist setMontage:0];
    [(MPAudioPlaylist *)self->_audioPlaylist setAudioPlaylist:0];

    self->_audioPlaylist = 0;
  }
  if (a3)
  {
    id v6 = (MPAudioPlaylist *)a3;
    self->_audioPlaylist = v6;
    [(MPAudioPlaylist *)v6 setParentObject:self];
    if (self->_container)
    {
      -[MPAudioPlaylist setMontage:](self->_audioPlaylist, "setMontage:", objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage"));
      id v7 = self->_audioPlaylist;
      id v8 = [(MCContainer *)self->_container audioPlaylistCreateIfNeeded];
      [(MPAudioPlaylist *)v7 setAudioPlaylist:v8];
    }
  }
}

- (int64_t)audioPriority
{
  return self->_audioPriority;
}

- (void)setAudioPriority:(int64_t)a3
{
  self->_audioPrioritdouble y = a3;
}

- (id)parentContainer
{
  return self->_parentContainer;
}

- (int64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(int64_t)a3
{
  self->_randomSeed = a3;
  container = self->_container;
  if (container) {
    [(MCContainerEffect *)container setEffectAttribute:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:") forKey:@"PresetID"];
  }
  if (self->_supportsEffectTiming)
  {
    [(MPEffect *)self _updateTiming:1];
  }
}

- (MZEffectTiming)effectTiming
{
  return self->_effectTiming;
}

- (int64_t)maxNumberOfSlides
{
  id v3 = +[MPEffectManager sharedManager];
  int64_t v4 = [(MPEffect *)self effectID];
  return (int64_t)[v3 numberOfSlidesForEffectID:v4];
}

- (int64_t)maxNumberOfSecondarySlides
{
  id v3 = +[MPEffectManager sharedManager];
  int64_t v4 = [(MPEffect *)self effectID];
  return (int64_t)[v3 numberOfSecondarySlidesForEffectID:v4];
}

- (int64_t)liveIndex
{
  return self->_liveIndex;
}

- (void)setLiveIndex:(int64_t)a3
{
  self->_liveIndedouble x = a3;
}

- (id)container
{
  return self->_container;
}

- (id)plug
{
  return self->_plug;
}

- (void)createTextsWithDefaultStrings
{
  id v3 = (char *)objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfTextsForEffectID:", -[MPEffect effectID](self, "effectID"));
  int64_t v4 = v3;
  if (self->_texts) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = (uint64_t)v3 < 1;
  }
  if (v5)
  {
    if ((uint64_t)v3 < 1) {
      return;
    }
  }
  else
  {
    self->_texts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v6 = 0;
  do
  {
    id v7 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "defaultStringForTextInEffectID:presetID:atIndex:", -[MPEffect effectID](self, "effectID"), -[MPEffect presetID](self, "presetID"), v6);
    if (v7)
    {
      id v8 = +[MPText textWithAttributedString:v7];
      [(MPText *)v8 setParent:self];
      [(NSMutableArray *)self->_texts addObject:v8];
    }
    ++v6;
  }
  while (v4 != v6);
}

- (void)replaceTextsWitStrings:(id)a3
{
  CGAffineTransform *(__cdecl **v8)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  CGAffineTransform *(__cdecl **v9)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CGAffineTransform *(__cdecl **v20)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  CGAffineTransform *(__cdecl **v21)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  NSString *v22;
  NSString *v23;
  NSString *v24;
  id v25;
  id v26;
  id v27;

  if (a3)
  {
    id v3 = a3;
    id v5 = [a3 count];
    if ((uint64_t)v5 >= 1)
    {
      id v6 = v5;
      unint64_t v7 = 0;
      id v8 = &CATransform3DGetAffineTransform_ptr;
      id v9 = &CATransform3DGetAffineTransform_ptr;
      while (v7 >= (unint64_t)[(NSMutableArray *)self->_texts count])
      {
LABEL_15:
        if (v6 == (id)++v7) {
          return;
        }
      }
      id v10 = [v3 objectAtIndex:v7];
      uint64_t v11 = [(NSMutableArray *)self->_texts objectAtIndex:v7];
      if (v10)
      {
        objc_opt_class();
        id v12 = v10;
        if (objc_opt_isKindOfClass())
        {
          id v13 = [objc_alloc((Class)v8[469]) initWithAttributedString:v10];
LABEL_14:
          [v11 setAttributedString:v13];

          goto LABEL_15;
        }
      }
      else
      {
        id v12 = 0;
      }
      if ([0 length])
      {
        id v14 = objc_alloc((Class)v8[469]);
        id v15 = [v11 attributedString];
        id v16 = v14;
      }
      else
      {
        long long v27 = +[MPEffectManager sharedManager];
        uint64_t v17 = v12;
        id v18 = v6;
        long long v19 = v3;
        long long v20 = v8;
        long long v21 = v9;
        long long v22 = [(MPEffect *)self effectID];
        long long v23 = [(MPEffect *)self presetID];
        long long v24 = v22;
        id v9 = v21;
        id v8 = v20;
        id v3 = v19;
        id v6 = v18;
        id v12 = v17;
        long long v25 = [v27 defaultStringForTextInEffectID:v24 presetID:v23 atIndex:v7];
        id v16 = objc_alloc((Class)v8[469]);
        id v15 = v25;
      }
      long long v26 = [v16 initWithAttributedString:v15];
      id v13 = v26;
      if (v10) {
        objc_msgSend(v26, "replaceCharactersInRange:withString:", 0, objc_msgSend(v26, "length"), v12);
      }
      goto LABEL_14;
    }
  }
}

- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4
{
}

- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4 fillIn:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3 && !self->_texts && [a3 count]) {
    self->_texts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  p_cache = MCConditionalAction.cache;
  id v10 = (char *)objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfTextsForEffectID:", -[MPEffect effectID](self, "effectID"));
  if (a3) {
    uint64_t v11 = (char *)[a3 count];
  }
  else {
    uint64_t v11 = 0;
  }
  if ((uint64_t)v11 >= (uint64_t)v10) {
    id v12 = v10;
  }
  else {
    id v12 = v11;
  }
  if (!v5) {
    id v10 = v12;
  }
  if ((uint64_t)v10 >= 1)
  {
    id v13 = 0;
    long long v29 = v11;
    do
    {
      if (a3)
      {
        if ((uint64_t)v13 >= (uint64_t)v11) {
          id v14 = [a3 lastObject];
        }
        else {
          id v14 = [a3 objectAtIndex:v13];
        }
        id v15 = v14;
      }
      else
      {
        id v15 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
      }
      else
      {
        id v17 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", objc_msgSend(objc_msgSend(p_cache + 213, "sharedManager"), "defaultStringForTextInEffectID:presetID:atIndex:", -[MPEffect effectID](self, "effectID"), -[MPEffect presetID](self, "presetID"), v13));
        id v16 = v17;
        if (v15)
        {
          objc_msgSend(v17, "replaceCharactersInRange:withString:", 0, objc_msgSend(v17, "length"), v15);
          if (a4 != 1.0)
          {
            if ([v15 length])
            {
              id v18 = (char *)objc_msgSend(v15, "lineRangeForRange:", 0, 1);
              long long v20 = &v18[v19];
              long long v21 = (char *)[v15 length];
              if (v21 != v20)
              {
                v31[0] = 0;
                v31[1] = 0;
                long long v30 = (char *)(v21 - v20);
                long long v22 = (const __CTFont *)objc_msgSend(objc_msgSend(v16, "attributesAtIndex:effectiveRange:", 0, v31), "objectForKey:", kCTFontAttributeName);
                long long v23 = p_cache;
                CFStringRef v24 = CTFontCopyPostScriptName(v22);
                CGFloat Size = CTFontGetSize(v22);
                CTFontRef v26 = CTFontCreateWithName(v24, Size * a4, 0);
                CFStringRef v27 = v24;
                p_cache = v23;
                CFRelease(v27);
                uint64_t v11 = v29;
                objc_msgSend(v16, "addAttribute:value:range:", kCTFontAttributeName, v26, v20, v30);
                CFRelease(v26);
              }
            }
          }
        }
      }
      long long v28 = [[MPText alloc] initWithAttributedString:v16];

      [(MPText *)v28 setParent:self];
      [(NSMutableArray *)self->_texts addObject:v28];

      ++v13;
    }
    while (v10 != v13);
  }
}

- (void)createSlidesWithPaths:(id)a3
{
  id v5 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSlidesForEffectID:", -[MPEffect effectID](self, "effectID"));
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = [a3 count];
  }
  if (self->_slides || (uint64_t)v5 < 1)
  {
    if ((uint64_t)v5 < 1) {
      return;
    }
  }
  else
  {
    self->_slides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  for (unint64_t i = 0; (id)i != v5; ++i)
  {
    if (i < (unint64_t)[a3 count] && (id v7 = objc_msgSend(a3, "objectAtIndex:", i)) != 0) {
      id v8 = [[MPSlide alloc] initWithPath:v7];
    }
    else {
      id v8 = objc_alloc_init(MPSlide);
    }
    id v9 = v8;
    [(MPSlide *)v8 setParent:self];
    [(NSMutableArray *)self->_slides addObject:v9];
  }
}

- (void)createSecondarySlidesWithPaths:(id)a3
{
  id v5 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSecondarySlidesForEffectID:", -[MPEffect effectID](self, "effectID"));
  id v6 = v5;
  if (self->_secondarySlides) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = (uint64_t)v5 < 1;
  }
  if (v7)
  {
    if ((uint64_t)v5 < 1) {
      return;
    }
  }
  else
  {
    self->_secondarySlides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  unint64_t v8 = 0;
  do
  {
    if (a3 && v8 < (unint64_t)[a3 count] && (id v9 = objc_msgSend(a3, "objectAtIndex:", v8)) != 0) {
      id v10 = [[MPSlide alloc] initWithPath:v9];
    }
    else {
      id v10 = objc_alloc_init(MPSlide);
    }
    uint64_t v11 = v10;
    [(MPSlide *)v10 setParent:self];
    [(MPSlide *)v11 setIsSecondary:1];
    [(NSMutableArray *)self->_secondarySlides addObject:v11];

    ++v8;
  }
  while (v6 != (id)v8);
}

- (void)reconfigureSlides
{
  id v3 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSlidesForEffectID:", -[MPEffect effectID](self, "effectID"));
  int64_t v4 = [(NSMutableArray *)self->_slides count];
  id v5 = [(NSMutableArray *)self->_slides count];
  if (v4 >= v3)
  {
    if (v3 >= v5) {
      return;
    }
    id v13 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", v3, (unsigned char *)-[NSMutableArray count](self->_slides, "count") - v3);
    id v14 = [(NSMutableArray *)self->_slides objectsAtIndexes:v13];
    self->_BOOL replaceSlides = 0;
    [(MPEffect *)self removeSlidesAtIndices:v13];

    self->_BOOL replaceSlides = 1;
    id v15 = +[NSDictionary dictionaryWithObjectsAndKeys:v14, @"slides", 0];
    id v9 = +[NSNotificationCenter defaultCenter];
    id v10 = MPEffectDidRemoveSlidesNotification;
    uint64_t v11 = self;
    id v12 = v15;
  }
  else
  {
    uint64_t v6 = v3 - v5;
    id v7 = objc_alloc_init((Class)NSMutableArray);
    if (v6 >= 1)
    {
      do
      {
        objc_msgSend(v7, "addObject:", +[MPSlide slide](MPSlide, "slide"));
        --v6;
      }
      while (v6);
    }
    self->_BOOL replaceSlides = 0;
    [(MPEffect *)self addSlides:v7];
    self->_BOOL replaceSlides = 1;
    unint64_t v8 = +[NSDictionary dictionaryWithObjectsAndKeys:v7, @"slides", 0];

    id v9 = +[NSNotificationCenter defaultCenter];
    id v10 = MPEffectDidAddSlidesNotification;
    uint64_t v11 = self;
    id v12 = v8;
  }
  [(NSNotificationCenter *)v9 postNotificationName:v10 object:v11 userInfo:v12];
}

- (void)dump
{
}

- (id)fullDebugLog
{
  id v3 = [+[NSString stringWithFormat:@"\n%@\n", [(MPEffect *)self description]] stringByAppendingFormat:@"=============================== Effect %d Slides =============================\n", [(MPEffect *)self zIndex]];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  slides = self->_slides;
  id v5 = [(NSMutableArray *)slides countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(slides);
        }
        id v3 = -[NSString stringByAppendingFormat:](v3, "stringByAppendingFormat:", @"%@\n", [*(id *)(*((void *)&v30 + 1) + 8 * i) fullDebugLog]);
      }
      id v6 = [(NSMutableArray *)slides countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }
  id v9 = [(NSString *)v3 stringByAppendingFormat:@"=============================== Effect %d Texts ==============================\n", [(MPEffect *)self zIndex]];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  texts = self->_texts;
  id v11 = [(NSMutableArray *)texts countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (id j = 0; j != v12; id j = (char *)j + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(texts);
        }
        id v9 = -[NSString stringByAppendingFormat:](v9, "stringByAppendingFormat:", @"%@\n", [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) fullDebugLog]);
      }
      id v12 = [(NSMutableArray *)texts countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }
  id v15 = [(NSString *)v9 stringByAppendingFormat:@"============================== Effect %d Filters =============================\n", [(MPEffect *)self zIndex]];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  filters = self->_filters;
  id v17 = [(NSMutableArray *)filters countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(filters);
        }
        id v15 = -[NSString stringByAppendingFormat:](v15, "stringByAppendingFormat:", @"%@\n", [*(id *)(*((void *)&v22 + 1) + 8 * (void)k) fullDebugLog]);
      }
      id v18 = [(NSMutableArray *)filters countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }
  return v15;
}

- (id)videoPaths
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v4 = [(MPEffect *)self slides];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      unint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) path];
        if (v9) {
          [v3 addObject:v9];
        }
        unint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)effectPresetID
{
  return +[NSString stringWithFormat:@"%@/%@", [(MPEffect *)self effectID], [(MPEffect *)self presetID]];
}

- (BOOL)isLive
{
  if (self->_container) {
    container = self->_container;
  }
  else {
    container = [(MPEffect *)self parentDocument];
  }
  return [(MCContainerEffect *)container isLive];
}

- (void)setSkipEffectTiming:(BOOL)a3
{
  self->_skipEffectTiming = a3;
}

- (void)updateTiming
{
}

- (void)updateTimingForExport
{
}

- (id)_effectAttributes
{
  id v3 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", -[MPEffect effectID](self, "effectID"), -[MPEffect presetID](self, "presetID")), "mutableCopy");
  [v3 addEntriesFromDictionary:self->_attributes];
  return v3;
}

- (id)formattedAttributes
{
  if (self->_attributes) {
    id v3 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", -[MPEffect _effectAttributes](self, "_effectAttributes"));
  }
  else {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
  }
  int64_t v4 = v3;
  objc_msgSend(v3, "setObject:forKey:", -[MPEffect presetID](self, "presetID"), @"PresetID");
  if ((self->_randomSeed & 0x8000000000000000) == 0) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"), @"RandomSeed");
  }
  return v4;
}

- (void)applyFormattedAttributes
{
  if (self->_container)
  {
    [(MCContainerEffect *)self->_container setEffectAttributes:[(MPEffect *)self _effectAttributes]];
    [(MCContainerEffect *)self->_container setEffectAttribute:[(MPEffect *)self presetID] forKey:@"PresetID"];
    if ((self->_randomSeed & 0x8000000000000000) == 0)
    {
      container = self->_container;
      int64_t v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
      [(MCContainerEffect *)container setEffectAttribute:v4 forKey:@"RandomSeed"];
    }
  }
}

- (BOOL)supportsEffectTiming
{
  return self->_supportsEffectTiming;
}

- (id)slideInformationWithDocument:(id)a3
{
  id v23 = +[NSMutableArray array];
  if (!a3)
  {
    a3 = [(MPEffect *)self parentDocument];
    if (!a3)
    {
      if (objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "isAuthoring"))a3 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument"); {
      else
      }
        a3 = 0;
    }
  }
  id v5 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  slides = self->_slides;
  id v7 = [(NSMutableArray *)slides countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    double height = CGSizeZero.height;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(slides);
        }
        long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v11);
        id v13 = [v12 path];
        if (v13)
        {
          id v14 = v13;
          id v15 = objc_alloc_init((Class)NSMutableDictionary);
          if (a3) {
            [a3 resolutionForPath:v14];
          }
          else {
            objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "resolutionForAssetAtPath:", v14);
          }
          if (v16 == CGSizeZero.width && v17 == height && v5 != 0) {
            [v5 resolutionForPath:v14];
          }
          double v20 = v16 / v17;
          *(float *)&double v20 = v20;
          objc_msgSend(v15, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20), @"aspectRatio");
          if ([v12 slide])
          {
            if ([v12 hasMovie]) {
              goto LABEL_25;
            }
          }
          else if ([a3 isMovieAtPath:v14])
          {
LABEL_25:
            objc_msgSend(v15, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"isMovie");
            [a3 durationForPath:v14];
            objc_msgSend(v15, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"duration");
          }
          [v23 addObject:v15];
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v21 = [(NSMutableArray *)slides countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v8 = v21;
    }
    while (v21);
  }
  return v23;
}

- (void)updateEffectAttributes
{
  id v3 = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "defaultEffectAttributesWithEffectID:andSlideInformation:", self->_effectID, -[MPEffect slideInformationWithDocument:](self, "slideInformationWithDocument:", 0));
  if (v3)
  {
    id v4 = v3;
    id v5 = [(MPEffect *)self effectAttributes];
    [v5 addEntriesFromDictionary:v4];
    [(MPEffect *)self setEffectAttributes:v5];
  }
}

- (id)plugID
{
  id v2 = [(MPEffect *)self nearestPlug];
  return [v2 objectID];
}

- (id)objectID
{
  id v2 = [(MPEffect *)self nearestPlug];
  return [v2 objectID];
}

- (id)uuid
{
  return self->_uuid;
}

- (id)parentDocument
{
  id v2 = objc_msgSend(-[MPEffect parentContainer](self, "parentContainer"), "parentLayer");
  return [v2 parentDocument];
}

- (id)nearestPlug
{
  if (self->_plug) {
    return self->_plug;
  }
  id v3 = [(MPEffect *)self parentContainer];
  return [v3 plug];
}

- (void)copyVars:(id)a3
{
  self->_position = (CGPoint)*((_OWORD *)a3 + 7);
  self->_size = *(CGSize *)((char *)a3 + 136);
  self->_zPosition = *((double *)a3 + 16);
  self->_rotationAngle = *((double *)a3 + 19);
  self->_xRotationAngle = *((double *)a3 + 20);
  self->_yRotationAngle = *((double *)a3 + 21);
  self->_scale = *((double *)a3 + 22);
  self->_opacitdouble y = *((double *)a3 + 13);
  self->_timeIn = *((double *)a3 + 23);
  self->_double phaseInDuration = *((double *)a3 + 24);
  self->_double phaseOutDuration = *((double *)a3 + 25);
  self->_double mainDuration = *((double *)a3 + 26);
  self->_audioPrioritdouble y = *((void *)a3 + 29);
  effectID = self->_effectID;
  if (effectID)
  {

    self->_effectID = 0;
  }
  self->_effectID = (NSString *)[*((id *)a3 + 27) copy];
  presetID = self->_presetID;
  if (presetID)
  {

    self->_presetID = 0;
  }
  self->_presetID = (NSString *)[*((id *)a3 + 28) copy];
  uuid = self->_uuid;
  if (uuid)
  {

    self->_uuid = 0;
  }
}

- (void)copySlides:(id)a3
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
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
          [v5 addObject:v10];

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [(MPEffect *)self addSlides:v5];
  }
}

- (void)copySecondarySlides:(id)a3
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
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
          [v5 addObject:v10];

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [(MPEffect *)self addSecondarySlides:v5];
  }
}

- (void)copyTexts:(id)a3
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
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
          [v5 addObject:v10];

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [(MPEffect *)self addTexts:v5];
  }
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
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
          [v5 addObject:v10];

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [(MPEffect *)self addFilters:a3];
  }
}

- (void)copyAnimationPaths:(id)a3
{
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
          [(MPEffect *)self setAnimationPath:v10 forKey:v9];
        }
        id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)copyAudioPlaylist:(id)a3
{
  id v4 = [a3 copy];
  [(MPEffect *)self setAudioPlaylist:v4];
}

- (void)cleanup
{
  self->_cleaningUp = 1;
  *(_WORD *)&self->_BOOL replaceSlides = 0;
  [(MPEffect *)self removeAllSlides];
  [(MPEffect *)self removeAllSecondarySlides];
  [(MPEffect *)self removeAllTexts];
  [(MPEffect *)self removeAllFilters];
  [(MPEffect *)self setAudioPlaylist:0];
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
        [(MPEffect *)self removeAnimationPathForKey:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setPlug:(id)a3
{
  plug = self->_plug;
  if (plug)
  {

    self->_plug = 0;
  }
  uint64_t v6 = (MCPlugParallel *)a3;
  self->_plug = v6;
  if (v6)
  {
    [(MPEffect *)self opacity];
    -[MCPlugParallel setOpacity:](self->_plug, "setOpacity:");
    [(MPEffect *)self position];
    -[MCPlugParallel setPosition:](self->_plug, "setPosition:");
    [(MPEffect *)self rotationAngle];
    -[MCPlugParallel setRotationAngle:](self->_plug, "setRotationAngle:");
    [(MPEffect *)self size];
    -[MCPlugParallel setSize:](self->_plug, "setSize:");
    [(MPEffect *)self xRotationAngle];
    -[MCPlugParallel setXRotationAngle:](self->_plug, "setXRotationAngle:");
    [(MPEffect *)self yRotationAngle];
    -[MCPlugParallel setYRotationAngle:](self->_plug, "setYRotationAngle:");
    [(MPEffect *)self scale];
    -[MCPlugParallel setScale:](self->_plug, "setScale:");
    [(MPEffect *)self phaseOutDuration];
    -[MCPlug setPhaseOutDuration:](self->_plug, "setPhaseOutDuration:");
    [(MPEffect *)self phaseInDuration];
    -[MCPlug setPhaseInDuration:](self->_plug, "setPhaseInDuration:");
    [(MPEffect *)self mainDuration];
    -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:");
    [(MCPlugParallel *)self->_plug setAudioPriority:(__int16)[(MPEffect *)self audioPriority]];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    filters = self->_filters;
    id v8 = [(NSMutableArray *)filters countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v44;
      do
      {
        for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(filters);
          }
          objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * i), "setFilter:", -[MCPlugParallel addFilterWithFilterID:](self->_plug, "addFilterWithFilterID:", objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * i), "filterID")));
        }
        id v9 = [(NSMutableArray *)filters countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v9);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    animationPaths = self->_animationPaths;
    id v13 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (id j = 0; j != v14; id j = (char *)j + 1)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
          id v18 = [(NSMutableDictionary *)self->_animationPaths objectForKey:v17];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v19 = off_1A4DC0;
          }
          else {
            uint64_t v19 = off_1A4DC8;
          }
          id v20 = [(__objc2_class *)*v19 animationPathWithKey:v17];
          [(MCPlug *)self->_plug addAnimationPath:v20];
          [v18 setAnimationPath:v20];
        }
        id v14 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v14);
    }
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v21 = self->_filters;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * (void)k) setFilter:0];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v35 objects:v48 count:16];
      }
      while (v23);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v26 = self->_animationPaths;
    id v27 = [(NSMutableDictionary *)v26 countByEnumeratingWithState:&v31 objects:v47 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (m = 0; m != v28; m = (char *)m + 1)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(v26);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", *(void *)(*((void *)&v31 + 1) + 8 * (void)m)), "setAnimationPath:", 0);
        }
        id v28 = [(NSMutableDictionary *)v26 countByEnumeratingWithState:&v31 objects:v47 count:16];
      }
      while (v28);
    }
  }
}

- (void)setContainer:(id)a3
{
  container = self->_container;
  if (container)
  {
    [(MCContainer *)container specialRelease];
    self->_container = 0;
  }
  uint64_t v6 = (MCContainerEffect *)[a3 specialRetain];
  self->_container = v6;
  if (v6)
  {
    if (objc_msgSend(-[MPEffect parentDocument](self, "parentDocument"), "isLive")) {
      [(MCContainerEffect *)self->_container setIsLive:1];
    }
    [(MCContainerEffect *)self->_container setEffectID:[(MPEffect *)self effectID]];
    [(MPEffect *)self applyFormattedAttributes];
    id v7 = objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage");
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    slides = self->_slides;
    id v11 = [(NSMutableArray *)slides countByEnumeratingWithState:&v92 objects:v103 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v93;
      do
      {
        for (unint64_t i = 0; i != v12; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v93 != v13) {
            objc_enumerationMutation(slides);
          }
          uint64_t v15 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          if ([v15 path])
          {
            id v16 = objc_msgSend(v7, "videoAssetForFileAtPath:", objc_msgSend(v15, "path"));
            uint64_t v17 = v9;
          }
          else
          {
            objc_msgSend(v8, "addObjectsFromArray:", -[MCContainerEffect addSlidesForAssets:](self->_container, "addSlidesForAssets:", v9));
            [v9 removeAllObjects];
            id v16 = [(MCContainerEffect *)self->_container addSlide];
            uint64_t v17 = v8;
          }
          [v17 addObject:v16];
        }
        id v12 = [(NSMutableArray *)slides countByEnumeratingWithState:&v92 objects:v103 count:16];
      }
      while (v12);
    }
    objc_msgSend(v8, "addObjectsFromArray:", -[MCContainerEffect addSlidesForAssets:](self->_container, "addSlidesForAssets:", v9));
    [v9 removeAllObjects];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    secondarySlides = self->_secondarySlides;
    id v19 = [(NSMutableArray *)secondarySlides countByEnumeratingWithState:&v88 objects:v102 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v89;
      do
      {
        for (id j = 0; j != v20; id j = (char *)j + 1)
        {
          if (*(void *)v89 != v21) {
            objc_enumerationMutation(secondarySlides);
          }
          id v23 = *(void **)(*((void *)&v88 + 1) + 8 * (void)j);
          if ([v23 path])
          {
            id v24 = objc_msgSend(v7, "videoAssetForFileAtPath:", objc_msgSend(v23, "path"));
            long long v25 = v9;
          }
          else
          {
            objc_msgSend(v8, "addObjectsFromArray:", -[MCContainerEffect addSlidesForAssets:](self->_container, "addSlidesForAssets:", v9));
            [v9 removeAllObjects];
            id v24 = [(MCContainerEffect *)self->_container addSlide];
            long long v25 = v8;
          }
          [v25 addObject:v24];
        }
        id v20 = [(NSMutableArray *)secondarySlides countByEnumeratingWithState:&v88 objects:v102 count:16];
      }
      while (v20);
    }
    objc_msgSend(v8, "addObjectsFromArray:", -[MCContainerEffect addSlidesForAssets:](self->_container, "addSlidesForAssets:", v9));

    id v26 = [v8 objectEnumerator];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v27 = self->_slides;
    id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v84 objects:v101 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v85;
      do
      {
        for (k = 0; k != v29; k = (char *)k + 1)
        {
          if (*(void *)v85 != v30) {
            objc_enumerationMutation(v27);
          }
          objc_msgSend(*(id *)(*((void *)&v84 + 1) + 8 * (void)k), "setSlide:", objc_msgSend(v26, "nextObject"));
        }
        id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v84 objects:v101 count:16];
      }
      while (v29);
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v32 = self->_secondarySlides;
    id v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v80 objects:v100 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v81;
      do
      {
        for (m = 0; m != v34; m = (char *)m + 1)
        {
          if (*(void *)v81 != v35) {
            objc_enumerationMutation(v32);
          }
          objc_msgSend(*(id *)(*((void *)&v80 + 1) + 8 * (void)m), "setSlide:", objc_msgSend(v26, "nextObject"));
        }
        id v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v80 objects:v100 count:16];
      }
      while (v34);
    }

    id v37 = objc_alloc_init((Class)NSMutableArray);
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    texts = self->_texts;
    id v39 = [(NSMutableArray *)texts countByEnumeratingWithState:&v76 objects:v99 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v77;
      do
      {
        for (n = 0; n != v40; n = (char *)n + 1)
        {
          if (*(void *)v77 != v41) {
            objc_enumerationMutation(texts);
          }
          objc_msgSend(v37, "addObject:", objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * (void)n), "attributedString"));
        }
        id v40 = [(NSMutableArray *)texts countByEnumeratingWithState:&v76 objects:v99 count:16];
      }
      while (v40);
    }
    id v43 = objc_msgSend(-[MCContainerEffect addTextsForAttributedStrings:](self->_container, "addTextsForAttributedStrings:", v37), "objectEnumerator");
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v44 = self->_texts;
    id v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v72 objects:v98 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v73;
      do
      {
        for (iunint64_t i = 0; ii != v46; iunint64_t i = (char *)ii + 1)
        {
          if (*(void *)v73 != v47) {
            objc_enumerationMutation(v44);
          }
          objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * (void)ii), "setText:", objc_msgSend(v43, "nextObject"));
        }
        id v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v72 objects:v98 count:16];
      }
      while (v46);
    }

    audioPlaylist = self->_audioPlaylist;
    if (audioPlaylist)
    {
      -[MPAudioPlaylist setMontage:](audioPlaylist, "setMontage:", objc_msgSend(-[MPEffectContainer parentLayer](self->_parentContainer, "parentLayer"), "montage"));
      double v50 = self->_audioPlaylist;
      double v51 = [(MCContainer *)self->_container audioPlaylistCreateIfNeeded];
      v52 = v50;
LABEL_72:
      [(MPAudioPlaylist *)v52 setAudioPlaylist:v51];
    }
  }
  else
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v53 = self->_slides;
    id v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v68 objects:v97 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v69;
      do
      {
        for (jid j = 0; jj != v55; jid j = (char *)jj + 1)
        {
          if (*(void *)v69 != v56) {
            objc_enumerationMutation(v53);
          }
          [*(id *)(*((void *)&v68 + 1) + 8 * (void)jj) setSlide:0];
        }
        id v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v68 objects:v97 count:16];
      }
      while (v55);
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v58 = self->_texts;
    id v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v64 objects:v96 count:16];
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v65;
      do
      {
        for (kk = 0; kk != v60; kk = (char *)kk + 1)
        {
          if (*(void *)v65 != v61) {
            objc_enumerationMutation(v58);
          }
          [*(id *)(*((void *)&v64 + 1) + 8 * (void)kk) setText:0];
        }
        id v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v64 objects:v96 count:16];
      }
      while (v60);
    }
    long long v63 = self->_audioPlaylist;
    if (v63)
    {
      [(MPAudioPlaylist *)v63 setMontage:0];
      v52 = self->_audioPlaylist;
      double v51 = 0;
      goto LABEL_72;
    }
  }
}

- (void)setParentContainer:(id)a3
{
  if (a3 && self->_parentContainer) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"An effect container may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parentContainer = (MPEffectContainer *)a3;
}

- (BOOL)needsParallelizer
{
  [(MPEffect *)self opacity];
  if (v3 != 1.0) {
    return 1;
  }
  [(MPEffect *)self position];
  if (v5 != CGPointZero.x || v4 != CGPointZero.y) {
    return 1;
  }
  [(MPEffect *)self rotationAngle];
  if (v7 != 0.0) {
    return 1;
  }
  [(MPEffect *)self size];
  BOOL result = 1;
  if (v10 == 2.0 && v9 == 2.0)
  {
    [(MPEffect *)self zPosition];
    if (v11 == 0.0)
    {
      [(MPEffect *)self xRotationAngle];
      if (v12 == 0.0)
      {
        [(MPEffect *)self yRotationAngle];
        if (v13 == 0.0)
        {
          [(MPEffect *)self scale];
          if (v14 == 1.0
            && !objc_msgSend(-[MPEffect filters](self, "filters"), "count")
            && !objc_msgSend(-[MPEffect animationPaths](self, "animationPaths"), "count"))
          {
            parentContainer = self->_parentContainer;
            if (!parentContainer || [(MPEffectContainer *)parentContainer countOfEffects] <= 1) {
              return 0;
            }
          }
        }
      }
    }
    return 1;
  }
  return result;
}

- (void)scaleMainDuration
{
  [(MPEffectContainer *)self->_parentContainer duration];
  double v4 = v3;
  [(MPEffect *)self phaseInDuration];
  double v6 = v5;
  [(MPEffect *)self phaseOutDuration];
  double v8 = v7;
  [(MPEffect *)self mainDuration];
  double v10 = v9;
  double v11 = v6 + v8 + v9;
  if (v4 != v11)
  {
    double v12 = v9 + v4 - v11;
    if (v12 >= 0.0)
    {
      if (v9 != v12)
      {
        [(MPEffect *)self willChangeValueForKey:@"mainDuration"];
        self->_double mainDuration = v12;
        [(MPEffect *)self didChangeValueForKey:@"mainDuration"];
      }
      if (self->_container)
      {
        plug = self->_plug;
        if (!plug) {
          plug = [(MPEffectContainer *)self->_parentContainer plug];
        }
        [(MCPlug *)plug loopDuration];
        if (v24 != v12)
        {
          id v22 = plug;
          double v21 = v12;
          goto LABEL_25;
        }
      }
    }
    else
    {
      double v13 = v6 / (v6 + v8);
      double v14 = v4 * v13;
      double v15 = 1.0 - v13;
      if (v4 * v13 != v6)
      {
        [(MPEffect *)self willChangeValueForKey:@"phaseInDuration"];
        self->_double phaseInDuration = v14;
        [(MPEffect *)self didChangeValueForKey:@"phaseInDuration"];
      }
      double v16 = v4 * v15;
      if (v10 != 0.0)
      {
        [(MPEffect *)self willChangeValueForKey:@"mainDuration"];
        self->_double mainDuration = 0.0;
        [(MPEffect *)self didChangeValueForKey:@"mainDuration"];
      }
      if (v16 != v8)
      {
        [(MPEffect *)self willChangeValueForKey:@"phaseOutDuration"];
        self->_double phaseOutDuration = v16;
        [(MPEffect *)self didChangeValueForKey:@"phaseOutDuration"];
      }
      if (self->_container)
      {
        uint64_t v17 = self->_plug;
        if (!v17) {
          uint64_t v17 = [(MPEffectContainer *)self->_parentContainer plug];
        }
        [(MCPlug *)v17 phaseInDuration];
        if (v18 != v14) {
          [(MCPlug *)v17 setPhaseInDuration:v14];
        }
        [(MCPlug *)v17 phaseOutDuration];
        if (v19 != v16) {
          [(MCPlug *)v17 setPhaseOutDuration:v16];
        }
        [(MCPlug *)v17 loopDuration];
        if (v20 != 0.0)
        {
          double v21 = 0.0;
          id v22 = v17;
LABEL_25:
          [(MCPlug *)v22 setLoopDuration:v21];
        }
      }
    }
  }
  effectTiming = self->_effectTiming;
  if (effectTiming)
  {
    double phaseOutDuration = self->_phaseOutDuration;
    double mainDuration = self->_mainDuration;
    double phaseInDuration = self->_phaseInDuration;
    [(MZEffectTiming *)effectTiming setPhaseInDuration:phaseInDuration mainDuration:mainDuration phaseOutDuration:phaseOutDuration];
  }
}

- (BOOL)hasMovies
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  slides = self->_slides;
  id v3 = [(NSMutableArray *)slides countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      double v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(slides);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) hasMovie])
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [(NSMutableArray *)slides countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (BOOL)hasPanoramasInDocument:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  slides = self->_slides;
  id v5 = [(NSMutableArray *)slides countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(slides);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) isPanoramaInDocument:a3])
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [(NSMutableArray *)slides countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

- (id)nearestLayerGroup
{
  id v2 = [(MPEffect *)self parentContainer];
  return [v2 nearestLayerGroup];
}

- (id)slideForMCSlide:(id)a3
{
  id v5 = [(NSArray *)[(MPEffect *)self slides] copy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      id v11 = objc_msgSend(objc_msgSend(v10, "slide"), "index");
      if (v11 == [a3 index]) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (v10) {
      return v10;
    }
  }
  else
  {
LABEL_9:
  }
  id v12 = objc_msgSend(-[MPEffect secondarySlides](self, "secondarySlides"), "copy");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
LABEL_13:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v20 != v15) {
        objc_enumerationMutation(v12);
      }
      long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
      id v17 = objc_msgSend(objc_msgSend(v10, "slide"), "index");
      if (v17 == [a3 index]) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    long long v10 = 0;
  }

  return v10;
}

- (int64_t)countOfSlides
{
  return (int64_t)[(NSMutableArray *)self->_slides count];
}

- (id)objectInSlidesAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_slides objectAtIndex:a3];
}

- (void)insertObject:(id)a3 inSlidesAtIndex:(int64_t)a4
{
  id v6 = +[NSArray arrayWithObject:a3];
  [(MPEffect *)self insertSlides:v6 atIndex:a4];
}

- (void)removeObjectFromSlidesAtIndex:(int64_t)a3
{
  id v4 = +[NSIndexSet indexSetWithIndex:a3];
  [(MPEffect *)self removeSlidesAtIndices:v4];
}

- (void)replaceObjectInSlidesAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPEffect *)self removeSlidesAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  id v7 = +[NSArray arrayWithObject:a4];
  [(MPEffect *)self insertSlides:v7 atIndex:a3];
}

- (int64_t)countOfTexts
{
  return (int64_t)[(NSMutableArray *)self->_texts count];
}

- (id)objectInTextsAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_texts objectAtIndex:a3];
}

- (void)insertObject:(id)a3 inTextsAtIndex:(int64_t)a4
{
  id v6 = +[NSArray arrayWithObject:a3];
  [(MPEffect *)self insertTexts:v6 atIndex:a4];
}

- (void)removeObjectFromTextsAtIndex:(int64_t)a3
{
  id v4 = +[NSIndexSet indexSetWithIndex:a3];
  [(MPEffect *)self removeTextsAtIndices:v4];
}

- (void)replaceObjectInTextsAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPEffect *)self removeTextsAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  id v7 = +[NSArray arrayWithObject:a4];
  [(MPEffect *)self insertTexts:v7 atIndex:a3];
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
  id v6 = +[NSArray arrayWithObject:a3];
  [(MPEffect *)self insertFilters:v6 atIndex:a4];
}

- (void)removeObjectFromFiltersAtIndex:(int64_t)a3
{
  id v4 = +[NSIndexSet indexSetWithIndex:a3];
  [(MPEffect *)self removeFiltersAtIndices:v4];
}

- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPEffect *)self removeFiltersAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  id v7 = +[NSArray arrayWithObject:a4];
  [(MPEffect *)self insertFilters:v7 atIndex:a3];
}

- (void)setXPosition:(double)a3
{
  [(MPEffect *)self yPosition];
  -[MPEffect setPosition:](self, "setPosition:", a3, v5);
}

- (double)yPosition
{
  [(MPEffect *)self position];
  return v2;
}

- (void)setYPosition:(double)a3
{
  [(MPEffect *)self xPosition];
  -[MPEffect setPosition:](self, "setPosition:");
}

- (double)height
{
  [(MPEffect *)self size];
  return v2;
}

- (void)setHeight:(double)a3
{
  [(MPEffect *)self width];
  -[MPEffect setSize:](self, "setSize:");
}

- (void)setWidth:(double)a3
{
  [(MPEffect *)self height];
  -[MPEffect setSize:](self, "setSize:", a3, v5);
}

- (id)scriptingAnimations
{
  id v20 = +[NSMutableDictionary dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obid j = self->_animationPaths;
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
            for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              if (([v3 isEqualToString:@"size"] & 1) != 0
                || [v3 isEqualToString:@"position"])
              {
                int v24 = 0;
                [v12 point];
                LOWORD(v24) = (int)v13;
                [v12 point];
                HIWORD(v24) = (int)v14;
                uint64_t v15 = +[NSData dataWithBytes:&v24 length:4];
              }
              else
              {
                [v12 scalar];
                uint64_t v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
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
      for (unint64_t i = 0; i != v21; unint64_t i = (char *)i + 1)
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
          id v11 = v10;
          for (id j = 0; j != v11; ++j)
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
        [(MPEffect *)self setAnimationPath:v9 forKey:v5];
      }
      id v21 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v21);
  }
}

@end