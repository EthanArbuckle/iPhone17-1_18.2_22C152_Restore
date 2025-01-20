@interface MPLayerEffect
+ (id)layerEffectWithEffectID:(id)a3;
+ (id)layerEffectWithEffectID:(id)a3 andPaths:(id)a4;
+ (id)layerEffectWithEffectID:(id)a3 andStrings:(id)a4;
+ (id)layerEffectWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5;
- (BOOL)isLive;
- (MPLayerEffect)init;
- (MPLayerEffect)initWithEffectID:(id)a3;
- (MPLayerEffect)initWithEffectID:(id)a3 andPaths:(id)a4;
- (MPLayerEffect)initWithEffectID:(id)a3 andStrings:(id)a4;
- (MPLayerEffect)initWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5;
- (MZEffectTiming)effectTiming;
- (NSArray)slides;
- (NSArray)texts;
- (NSString)effectID;
- (NSString)presetID;
- (double)lowestDisplayTime;
- (double)mainDuration;
- (id)_effectAttributes;
- (id)allSlides:(BOOL)a3;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectAttributeForKey:(id)a3;
- (id)effectAttributes;
- (id)formattedAttributes;
- (id)secondarySlides;
- (id)slideForMCSlide:(id)a3;
- (id)slideInformation;
- (int64_t)liveIndex;
- (int64_t)maxNumberOfSecondarySlides;
- (int64_t)maxNumberOfSlides;
- (int64_t)randomSeed;
- (void)_updateEffectTiming;
- (void)_updateTiming:(BOOL)a3;
- (void)addSecondarySlide:(id)a3;
- (void)addSecondarySlides:(id)a3;
- (void)addSlide:(id)a3;
- (void)addSlides:(id)a3;
- (void)addText:(id)a3;
- (void)addTexts:(id)a3;
- (void)applyFormattedAttributes;
- (void)copySecondarySlides:(id)a3;
- (void)copySlides:(id)a3;
- (void)copyTexts:(id)a3;
- (void)createSecondarySlidesWithPaths:(id)a3;
- (void)createSlidesWithPaths:(id)a3;
- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4;
- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4 fillIn:(BOOL)a5;
- (void)dealloc;
- (void)insertSecondarySlides:(id)a3 atIndex:(int64_t)a4;
- (void)insertSlides:(id)a3 atIndex:(int64_t)a4;
- (void)insertTexts:(id)a3 atIndex:(int64_t)a4;
- (void)moveSlidesFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)moveTextsFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)removeAllSecondarySlides;
- (void)removeAllSlides;
- (void)removeAllTexts;
- (void)removeSecondarySlidesAtIndices:(id)a3;
- (void)removeSlidesAtIndices:(id)a3;
- (void)removeTextsAtIndices:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEffectAttribute:(id)a3 forKey:(id)a4;
- (void)setEffectAttributes:(id)a3;
- (void)setEffectID:(id)a3;
- (void)setLayerEffect:(id)a3;
- (void)setLiveIndex:(int64_t)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPresetID:(id)a3;
- (void)setRandomSeed:(int64_t)a3;
- (void)setSkipEffectTiming:(BOOL)a3;
- (void)updateTiming;
@end

@implementation MPLayerEffect

- (MPLayerEffect)init
{
  v4.receiver = self;
  v4.super_class = (Class)MPLayerEffect;
  v2 = [(MPLayer *)&v4 init];
  if (v2)
  {
    v2->_effectID = (NSString *)@"Undefined";
    v2->_presetID = (NSString *)@"Default";
    v2->_slides = 0;
    v2->_secondarySlides = 0;
    v2->_texts = 0;
    v2->_randomSeed = -1;
    v2->_effectAttributes = 0;
    v2->_liveIndex = 0;
  }
  return v2;
}

+ (id)layerEffectWithEffectID:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithEffectID:a3];
  return v3;
}

+ (id)layerEffectWithEffectID:(id)a3 andPaths:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithEffectID:a3 andPaths:a4];
  return v4;
}

+ (id)layerEffectWithEffectID:(id)a3 andStrings:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithEffectID:a3 andStrings:a4];
  return v4;
}

+ (id)layerEffectWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5
{
  id v5 = [objc_alloc((Class)a1) initWithEffectID:a3 strings:a4 paths:a5];
  return v5;
}

- (MPLayerEffect)initWithEffectID:(id)a3
{
  return [(MPLayerEffect *)self initWithEffectID:a3 andPaths:0];
}

- (MPLayerEffect)initWithEffectID:(id)a3 andPaths:(id)a4
{
  v6 = [(MPLayerEffect *)self init];
  if (v6)
  {
    v6->_effectID = (NSString *)[a3 copy];
    v6->_presetID = (NSString *)[@"Default" copy];
    if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectNeedsRandomSeedInformation:", v6->_effectID))v6->_randomSeed = arc4random(); {
    v6->_supportsEffectTiming = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", a3);
    }
    [(MPLayerEffect *)v6 createSlidesWithPaths:a4];
    [(MPLayerEffect *)v6 _updateTiming:0];
  }
  return v6;
}

- (MPLayerEffect)initWithEffectID:(id)a3 andStrings:(id)a4
{
  v6 = [(MPLayerEffect *)self init];
  if (v6)
  {
    v6->_effectID = (NSString *)[a3 copy];
    v6->_presetID = (NSString *)[@"Default" copy];
    if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectNeedsRandomSeedInformation:", v6->_effectID))v6->_randomSeed = arc4random(); {
    v6->_supportsEffectTiming = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", a3);
    }
    [(MPLayerEffect *)v6 createTextsWithStrings:a4 secondLineFactor:1.0];
    [(MPLayerEffect *)v6 _updateTiming:0];
  }
  return v6;
}

- (MPLayerEffect)initWithEffectID:(id)a3 strings:(id)a4 paths:(id)a5
{
  v8 = [(MPLayerEffect *)self init];
  if (v8)
  {
    v8->_effectID = (NSString *)[a3 copy];
    v8->_presetID = (NSString *)[@"Default" copy];
    if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectNeedsRandomSeedInformation:", v8->_effectID))v8->_randomSeed = arc4random(); {
    v8->_supportsEffectTiming = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", a3);
    }
    [(MPLayerEffect *)v8 createTextsWithStrings:a4 secondLineFactor:1.0];
    [(MPLayerEffect *)v8 createSlidesWithPaths:a5];
    [(MPLayerEffect *)v8 _updateTiming:0];
  }
  return v8;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)MPLayerEffect;
  id v3 = [(MPLayer *)&v6 description];
  if (self->_layerEffect) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  return [v3 stringByAppendingFormat:@"\t          Has Layer Effect: %@\n", v4];
}

- (void)dealloc
{
  v4.receiver = self;
  v4.super_class = (Class)MPLayerEffect;
  [(MPLayer *)&v4 cleanup];

  self->_effectTiming = 0;
  self->_effectID = 0;

  self->_presetID = 0;
  self->_slides = 0;

  self->_secondarySlides = 0;
  self->_texts = 0;

  self->_layerEffect = 0;
  self->_effectAttributes = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPLayerEffect;
  [(MPLayer *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPLayerEffect;
  id v4 = [(MPLayer *)&v6 copyWithZone:a3];
  [v4 copySlides:self->_slides];
  [v4 copySecondarySlides:self->_secondarySlides];
  [v4 copyTexts:self->_texts];
  [v4 setEffectID:self->_effectID];
  [v4 setPresetID:self->_presetID];
  [v4 setRandomSeed:self->_randomSeed];
  if (self->_effectAttributes) {
    objc_msgSend(v4, "setEffectAttributes:");
  }
  return v4;
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
  if (self->_randomSeed == -1
    && objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectNeedsRandomSeedInformation:", self->_effectID))
  {
    self->_randomSeed = arc4random();
  }
  [(MPLayerEffect *)self setPresetID:@"Default"];
  layerEffect = self->_layerEffect;
  if (layerEffect) {
    [(MCContainerEffect *)layerEffect setEffectID:a3];
  }
  self->_supportsEffectTiming = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", self->_effectID);
  [(MPLayerEffect *)self _updateTiming:1];
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
  effectAttributes = self->_effectAttributes;
  if (effectAttributes)
  {

    self->_effectAttributes = 0;
  }
  if (self->_layerEffect) {
    [(MPLayerEffect *)self applyFormattedAttributes];
  }
  if (self->_supportsEffectTiming)
  {
    [(MPLayerEffect *)self _updateTiming:1];
  }
}

- (int64_t)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(int64_t)a3
{
  self->_randomSeed = a3;
  layerEffect = self->_layerEffect;
  if (layerEffect) {
    [(MCContainerEffect *)layerEffect setEffectAttribute:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:") forKey:@"PresetID"];
  }
  if (self->_supportsEffectTiming)
  {
    [(MPLayerEffect *)self _updateTiming:1];
  }
}

- (id)effectAttributes
{
  id result = self->_effectAttributes;
  if (!result)
  {
    id v4 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", -[MPLayerEffect effectID](self, "effectID"), -[MPLayerEffect presetID](self, "presetID")), "mutableCopy");
    return v4;
  }
  return result;
}

- (void)setEffectAttributes:(id)a3
{
  effectAttributes = self->_effectAttributes;
  if (effectAttributes)
  {

    self->_effectAttributes = 0;
  }
  self->_effectAttributes = (NSMutableDictionary *)[a3 mutableCopy];
  if (self->_layerEffect)
  {
    [(MPLayerEffect *)self applyFormattedAttributes];
  }
}

- (id)effectAttributeForKey:(id)a3
{
  effectAttributes = self->_effectAttributes;
  if (effectAttributes)
  {
    objc_sync_enter(self->_effectAttributes);
    id v6 = [(NSMutableDictionary *)self->_effectAttributes objectForKey:a3];
    objc_sync_exit(effectAttributes);
    return v6;
  }
  else
  {
    id v8 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", -[MPLayerEffect effectID](self, "effectID"), -[MPLayerEffect presetID](self, "presetID"));
    return [v8 objectForKey:a3];
  }
}

- (void)setEffectAttribute:(id)a3 forKey:(id)a4
{
  effectAttributes = self->_effectAttributes;
  if (!effectAttributes)
  {
    effectAttributes = (NSMutableDictionary *)objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", -[MPLayerEffect effectID](self, "effectID"), -[MPLayerEffect presetID](self, "presetID")), "mutableCopy");
    self->_effectAttributes = effectAttributes;
  }
  objc_sync_enter(effectAttributes);
  [(NSMutableDictionary *)self->_effectAttributes setValue:a3 forKey:a4];
  objc_sync_exit(effectAttributes);
  layerEffect = self->_layerEffect;
  if (layerEffect)
  {
    [(MCContainerEffect *)layerEffect setEffectAttribute:a3 forKey:a4];
  }
}

- (NSArray)slides
{
  return &self->_slides->super;
}

- (void)addSlide:(id)a3
{
  id v4 = +[NSArray arrayWithObject:a3];
  slides = self->_slides;
  if (slides) {
    id v6 = [(NSMutableArray *)slides count];
  }
  else {
    id v6 = 0;
  }
  [(MPLayerEffect *)self insertSlides:v4 atIndex:v6];
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
  [(MPLayerEffect *)self insertSlides:a3 atIndex:v6];
}

- (void)insertSlides:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_slides) {
    self->_slides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  v59 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]);
  -[MPLayerEffect willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2);
  if ([(NSMutableArray *)self->_slides count]) {
    unsigned int v7 = [(MCContainerEffect *)self->_layerEffect isLive];
  }
  else {
    unsigned int v7 = 0;
  }
  -[NSMutableArray insertObjects:atIndexes:](self->_slides, "insertObjects:atIndexes:", a3, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]));
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v83 objects:v92 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v84;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v84 != v10) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v83 + 1) + 8 * i) setParent:self];
      }
      id v9 = [a3 countByEnumeratingWithState:&v83 objects:v92 count:16];
    }
    while (v9);
  }
  if (self->_layerEffect)
  {
    id v62 = objc_alloc_init((Class)NSMutableArray);
    if (v7) {
      a4 = [(MCContainerEffect *)self->_layerEffect nextAvailableSlideIndex];
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v12 = [a3 countByEnumeratingWithState:&v79 objects:v91 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v61 = *(void *)v80;
      uint64_t v14 = -1;
      while (2)
      {
        v15 = 0;
        uint64_t v16 = v14;
        do
        {
          if (*(void *)v80 != v61) {
            objc_enumerationMutation(a3);
          }
          id v17 = [*(id *)(*((void *)&v79 + 1) + 8 * (void)v15) path];
          id v18 = v17;
          uint64_t v14 = v17 == 0;
          if (v16 != -1 && v16 != v14) {
            goto LABEL_34;
          }
          v15 = (char *)v15 + 1;
          uint64_t v16 = v17 == 0;
        }
        while (v13 != v15);
        id v13 = [a3 countByEnumeratingWithState:&v79 objects:v91 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      if (!v18)
      {
LABEL_34:
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v24 = [a3 countByEnumeratingWithState:&v75 objects:v90 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v76;
          do
          {
            for (j = 0; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v76 != v26) {
                objc_enumerationMutation(a3);
              }
              v28 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
              if ([v28 path]) {
                id v29 = -[MCContainerEffect insertSlideForAsset:atIndex:](self->_layerEffect, "insertSlideForAsset:atIndex:", objc_msgSend(-[MPLayer montage](self, "montage"), "videoAssetForFileAtPath:", objc_msgSend(v28, "path")), a4);
              }
              else {
                id v29 = [(MCContainerEffect *)self->_layerEffect insertSlideAtIndex:a4];
              }
              [v62 addObject:v29];
              if (v7) {
                a4 = [(MCContainerEffect *)self->_layerEffect nextAvailableSlideIndex];
              }
              else {
                ++a4;
              }
            }
            id v25 = [a3 countByEnumeratingWithState:&v75 objects:v90 count:16];
          }
          while (v25);
        }
        goto LABEL_47;
      }
    }
    id v19 = objc_alloc_init((Class)NSMutableArray);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v20 = [a3 countByEnumeratingWithState:&v71 objects:v89 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v72;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v72 != v22) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v19, "addObject:", objc_msgSend(-[MPLayer montage](self, "montage"), "videoAssetForFileAtPath:", objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * (void)k), "path")));
        }
        id v21 = [a3 countByEnumeratingWithState:&v71 objects:v89 count:16];
      }
      while (v21);
    }
    objc_msgSend(v62, "addObjectsFromArray:", -[MCContainerEffect insertSlidesForAssets:atIndex:](self->_layerEffect, "insertSlidesForAssets:atIndex:", v19, a4));

LABEL_47:
    id v30 = [v62 objectEnumerator];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v31 = [a3 countByEnumeratingWithState:&v67 objects:v88 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v68;
      do
      {
        for (m = 0; m != v32; m = (char *)m + 1)
        {
          if (*(void *)v68 != v33) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * (void)m), "setSlide:", objc_msgSend(v30, "nextObject"));
        }
        id v32 = [a3 countByEnumeratingWithState:&v67 objects:v88 count:16];
      }
      while (v32);
    }
  }
  [(MPLayerEffect *)self didChange:2 valuesAtIndexes:v59 forKey:@"slides"];
  if (self->_supportsEffectTiming)
  {
    id v35 = [(MPLayer *)self parentDocument];
    if (!v35)
    {
      if (objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "isAuthoring"))id v35 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument"); {
      else
      }
        id v35 = 0;
    }
    id v36 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument");
    if [v35 isLive] && (objc_opt_respondsToSelector())
    {
      id v37 = objc_alloc_init((Class)NSMutableArray);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v38 = [a3 countByEnumeratingWithState:&v63 objects:v87 count:16];
      if (v38)
      {
        id v39 = v38;
        uint64_t v40 = *(void *)v64;
        double height = CGSizeZero.height;
        do
        {
          for (n = 0; n != v39; n = (char *)n + 1)
          {
            if (*(void *)v64 != v40) {
              objc_enumerationMutation(a3);
            }
            id v43 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)n) path];
            if (v43)
            {
              id v44 = v43;
              id v45 = +[NSMutableDictionary dictionary];
              if (v35) {
                [v35 resolutionForPath:v44];
              }
              else {
                objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "resolutionForAssetAtPath:", v44);
              }
              if (v46 == CGSizeZero.width && v47 == height && v36 != 0) {
                [v36 resolutionForPath:v44];
              }
              double v50 = v46 / v47;
              *(float *)&double v50 = v50;
              objc_msgSend(v45, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v50), @"aspectRatio");
              [v37 addObject:v45];
            }
          }
          id v39 = [a3 countByEnumeratingWithState:&v63 objects:v87 count:16];
        }
        while (v39);
      }
      if ([v37 count]) {
        [(MZEffectTiming *)self->_effectTiming appendSlideInformation:v37 andTextInformation:0];
      }

      [(MZEffectTiming *)self->_effectTiming phaseInDuration];
      double v52 = v51;
      [(MZEffectTiming *)self->_effectTiming phaseOutDuration];
      double v54 = v53;
      [(MZEffectTiming *)self->_effectTiming mainDuration];
      double v56 = v55;
      [(MPLayerEffect *)self setPhaseInDuration:v52];
      [(MPLayerEffect *)self setPhaseOutDuration:v54];
      [(MPLayerEffect *)self setDuration:v54 + v52 + v56];
      if ([(NSMutableArray *)self->_slides count])
      {
        v57 = objc_msgSend(objc_msgSend(-[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", 0), "slide"), "index");
        v58 = (char *)((unsigned char *)objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](self->_slides, "lastObject"), "slide"), "index")- v57+ 1);
      }
      else
      {
        v57 = 0;
        v58 = 0;
      }
      -[MZEffectTiming setMultiImageSlideRange:](self->_effectTiming, "setMultiImageSlideRange:", v57, v58);
    }
    else
    {
      [(MPLayerEffect *)self _updateTiming:1];
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
        [(MPLayerEffect *)self willChange:3 valuesAtIndexes:a3 forKey:@"slides"];
        if (self->_layerEffect)
        {
          id v8 = [a3 mutableCopy];
          if ([(MCContainerEffect *)self->_layerEffect isLive]) {
            objc_msgSend(v8, "shiftIndexesStartingAtIndex:by:", objc_msgSend(v8, "firstIndex"), self->_liveIndex - (void)objc_msgSend(a3, "count"));
          }
          [(MCContainerEffect *)self->_layerEffect removeSlidesAtIndices:v8];
        }
        id v9 = [a3 lastIndex];
        if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          for (id i = v9; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
          {
            id v11 = [(NSMutableArray *)self->_slides objectAtIndex:i];
            [v11 setParent:0];
            [v11 setSlide:0];
          }
        }
        [(NSMutableArray *)self->_slides removeObjectsAtIndexes:a3];
        [(MPLayerEffect *)self didChange:3 valuesAtIndexes:a3 forKey:@"slides"];
        if (self->_supportsEffectTiming)
        {
          id v12 = [(MPLayer *)self parentDocument];
          if (!v12)
          {
            if (objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "isAuthoring"))id v12 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument"); {
            else
            }
              id v12 = 0;
          }
          if (![v12 isLive] || (objc_opt_respondsToSelector() & 1) == 0) {
            [(MPLayerEffect *)self _updateTiming:1];
          }
          if ([v12 isLive])
          {
            if ([(NSMutableArray *)self->_slides count])
            {
              id v13 = objc_msgSend(objc_msgSend(-[NSMutableArray objectAtIndex:](self->_slides, "objectAtIndex:", 0), "slide"), "index");
              uint64_t v14 = (char *)((unsigned char *)objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](self->_slides, "lastObject"), "slide"), "index")- v13+ 1);
            }
            else
            {
              id v13 = 0;
              uint64_t v14 = 0;
            }
            -[MZEffectTiming setMultiImageSlideRange:](self->_effectTiming, "setMultiImageSlideRange:", v13, v14);
          }
        }
      }
    }
  }
}

- (void)removeAllSlides
{
  slides = self->_slides;
  if (slides) {
    id v4 = [(NSMutableArray *)slides count];
  }
  else {
    id v4 = 0;
  }
  id v5 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v4);
  [(MPLayerEffect *)self removeSlidesAtIndices:v5];
}

- (void)moveSlidesFromIndices:(id)a3 toIndex:(int64_t)a4
{
  slides = self->_slides;
  if (slides)
  {
    if (self->_layerEffect)
    {
      [(MCContainerEffect *)self->_layerEffect moveSlidesAtIndices:a3 toIndex:a4];
      slides = self->_slides;
    }
    id v8 = [(NSMutableArray *)slides objectsAtIndexes:a3];
    [(NSMutableArray *)self->_slides removeObjectsAtIndexes:a3];
    id v9 = self->_slides;
    uint64_t v10 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [v8 count]);
    [(NSMutableArray *)v9 insertObjects:v8 atIndexes:v10];
  }
}

- (id)secondarySlides
{
  return self->_secondarySlides;
}

- (void)addSecondarySlide:(id)a3
{
  id v4 = +[NSArray arrayWithObject:a3];
  secondarySlides = self->_secondarySlides;
  if (secondarySlides) {
    id v6 = [(NSMutableArray *)secondarySlides count];
  }
  else {
    id v6 = 0;
  }
  [(MPLayerEffect *)self insertSecondarySlides:v4 atIndex:v6];
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
  [(MPLayerEffect *)self insertSecondarySlides:a3 atIndex:v6];
}

- (void)insertSecondarySlides:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_secondarySlides) {
    self->_secondarySlides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v24 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]);
  -[MPLayerEffect willChange:valuesAtIndexes:forKey:](self, "willChange:valuesAtIndexes:forKey:", 2);
  -[NSMutableArray insertObjects:atIndexes:](self->_secondarySlides, "insertObjects:atIndexes:", a3, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (id i = 0; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v11 setParent:self];
        [v11 setIsSecondary:1];
      }
      id v8 = [a3 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }
  if (self->_layerEffect)
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = [a3 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v31;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(a3);
          }
          id v17 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
          if ([v17 path]) {
            id v18 = -[MCContainerEffect insertSlideForAsset:atIndex:](self->_layerEffect, "insertSlideForAsset:atIndex:", objc_msgSend(-[MPLayer montage](self, "montage"), "videoAssetForFileAtPath:", objc_msgSend(v17, "path")), (char *)-[MPLayerEffect maxNumberOfSlides](self, "maxNumberOfSlides") + (void)j + a4);
          }
          else {
            id v18 = [(MCContainerEffect *)self->_layerEffect insertSlideAtIndex:(char *)[(MPLayerEffect *)self maxNumberOfSlides] + (void)j + a4];
          }
          [v12 addObject:v18];
        }
        id v14 = [a3 countByEnumeratingWithState:&v30 objects:v39 count:16];
        a4 += (int64_t)j;
      }
      while (v14);
    }
    id v19 = [v12 objectEnumerator];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v20 = [a3 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)k), "setSlide:", objc_msgSend(v19, "nextObject"));
        }
        id v21 = [a3 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v21);
    }
  }
  [(MPLayerEffect *)self didChange:2 valuesAtIndexes:v24 forKey:@"secondarySlides"];
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
        [(MPLayerEffect *)self willChange:3 valuesAtIndexes:a3 forKey:@"secondarySlides"];
        layerEffect = self->_layerEffect;
        if (layerEffect) {
          [(MCContainerEffect *)layerEffect removeSlidesAtIndices:a3];
        }
        id v9 = [a3 lastIndex];
        if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          for (id i = v9; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
          {
            id v11 = [(NSMutableArray *)self->_secondarySlides objectAtIndex:i];
            [v11 setParent:0];
            [v11 setSlide:0];
          }
        }
        [(NSMutableArray *)self->_secondarySlides removeObjectsAtIndexes:a3];
        [(MPLayerEffect *)self didChange:3 valuesAtIndexes:a3 forKey:@"secondarySlides"];
      }
    }
  }
}

- (NSArray)texts
{
  return &self->_texts->super;
}

- (void)addText:(id)a3
{
  id v4 = +[NSArray arrayWithObject:a3];
  texts = self->_texts;
  if (texts) {
    id v6 = [(NSMutableArray *)texts count];
  }
  else {
    id v6 = 0;
  }
  [(MPLayerEffect *)self insertTexts:v4 atIndex:v6];
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
  [(MPLayerEffect *)self insertTexts:a3 atIndex:v6];
}

- (void)insertTexts:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_texts) {
    self->_texts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v8 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]);
  [(MPLayerEffect *)self willChange:2 valuesAtIndexes:v8 forKey:@"texts"];
  -[NSMutableArray insertObjects:atIndexes:](self->_texts, "insertObjects:atIndexes:", a3, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]));
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
      id v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * (void)v12) setParent:self];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [a3 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v10);
  }
  if (self->_layerEffect)
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
        id v17 = 0;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v17), "attributedString"));
          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v15);
    }
    id v18 = objc_msgSend(-[MCContainerEffect insertTextsForAttributedStrings:atIndex:](self->_layerEffect, "insertTextsForAttributedStrings:atIndex:", v13, a4), "objectEnumerator");
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
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)v22), "setText:", objc_msgSend(v18, "nextObject"));
          uint64_t v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v20);
    }
  }
  [(MPLayerEffect *)self didChange:2 valuesAtIndexes:v8 forKey:@"texts"];
}

- (void)removeTextsAtIndices:(id)a3
{
  texts = self->_texts;
  if (texts && [(NSMutableArray *)texts count])
  {
    [(MPLayerEffect *)self willChange:3 valuesAtIndexes:a3 forKey:@"texts"];
    layerEffect = self->_layerEffect;
    if (layerEffect) {
      [(MCContainerEffect *)layerEffect removeTextsAtIndices:a3];
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
    [(MPLayerEffect *)self didChange:3 valuesAtIndexes:a3 forKey:@"texts"];
  }
}

- (void)removeAllTexts
{
  objc_super v3 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [(NSMutableArray *)self->_texts count]);
  [(MPLayerEffect *)self removeTextsAtIndices:v3];
}

- (void)moveTextsFromIndices:(id)a3 toIndex:(int64_t)a4
{
  texts = self->_texts;
  if (texts)
  {
    if (self->_layerEffect)
    {
      [(MCContainerEffect *)self->_layerEffect moveTextsAtIndices:a3 toIndex:a4];
      texts = self->_texts;
    }
    id v8 = [(NSMutableArray *)texts objectsAtIndexes:a3];
    [(NSMutableArray *)self->_texts removeObjectsAtIndexes:a3];
    id v9 = self->_texts;
    id v10 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [v8 count]);
    [(NSMutableArray *)v9 insertObjects:v8 atIndexes:v10];
  }
}

- (void)removeAllSecondarySlides
{
  secondarySlides = self->_secondarySlides;
  if (secondarySlides) {
    id v4 = [(NSMutableArray *)secondarySlides count];
  }
  else {
    id v4 = 0;
  }
  id v5 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v4);
  [(MPLayerEffect *)self removeSecondarySlidesAtIndices:v5];
}

- (double)mainDuration
{
  [(MPLayer *)self duration];
  double v4 = v3;
  [(MPLayer *)self phaseInDuration];
  double v6 = v4 - v5;
  [(MPLayer *)self phaseOutDuration];
  return v6 - v7;
}

- (void)setDuration:(double)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MPLayerEffect;
  [(MPLayer *)&v19 setDuration:a3];
  effectTiming = self->_effectTiming;
  if (effectTiming)
  {
    [(MPLayerInternal *)self->super._internal phaseInDuration];
    double v6 = v5;
    [(MPLayerEffect *)self mainDuration];
    double v8 = v7;
    [(MPLayerInternal *)self->super._internal phaseOutDuration];
    [(MZEffectTiming *)effectTiming setPhaseInDuration:v6 mainDuration:v8 phaseOutDuration:v9];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = [(MPLayerEffect *)self slides];
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (id i = 0; i != v12; id i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) resetCachedTimes];
      }
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)setPhaseInDuration:(double)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MPLayerEffect;
  [(MPLayer *)&v19 setPhaseInDuration:a3];
  effectTiming = self->_effectTiming;
  if (effectTiming)
  {
    [(MPLayerInternal *)self->super._internal phaseInDuration];
    double v6 = v5;
    [(MPLayerEffect *)self mainDuration];
    double v8 = v7;
    [(MPLayerInternal *)self->super._internal phaseOutDuration];
    [(MZEffectTiming *)effectTiming setPhaseInDuration:v6 mainDuration:v8 phaseOutDuration:v9];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = [(MPLayerEffect *)self slides];
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (id i = 0; i != v12; id i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) resetCachedTimes];
      }
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)setPhaseOutDuration:(double)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MPLayerEffect;
  [(MPLayer *)&v19 setPhaseOutDuration:a3];
  effectTiming = self->_effectTiming;
  if (effectTiming)
  {
    [(MPLayerInternal *)self->super._internal phaseInDuration];
    double v6 = v5;
    [(MPLayerEffect *)self mainDuration];
    double v8 = v7;
    [(MPLayerInternal *)self->super._internal phaseOutDuration];
    [(MZEffectTiming *)effectTiming setPhaseInDuration:v6 mainDuration:v8 phaseOutDuration:v9];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = [(MPLayerEffect *)self slides];
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (id i = 0; i != v12; id i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) resetCachedTimes];
      }
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)_updateEffectTiming
{
  if (self->_supportsEffectTiming && !self->_skipEffectTiming)
  {

    self->_effectTiming = 0;
    id v3 = [(MPLayerEffect *)self formattedAttributes];
    id v4 = [(MPLayer *)self parentDocument];
    if (v4
      || (double v6 = 1.77777779,
          objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "isAuthoring"))&& (id v4 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument")) != 0)
    {
      [v4 aspectRatio];
      double v6 = v5;
    }
    self->_effectTiming = (MZEffectTiming *)objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:", self->_effectID, v3, -[MPLayerEffect slideInformation](self, "slideInformation"), self->_texts, v6);
  }
}

- (id)_effectAttributes
{
  id v3 = objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", -[MPLayerEffect effectID](self, "effectID"), -[MPLayerEffect presetID](self, "presetID")), "mutableCopy");
  [v3 addEntriesFromDictionary:self->super._attributes];
  return v3;
}

- (void)_updateTiming:(BOOL)a3
{
  id v5 = +[MPEffectManager sharedManager];
  double v13 = 0.0;
  double v14 = 0.0;
  double v12 = 0.0;
  if (!self->_supportsEffectTiming)
  {
    if (a3) {
      return;
    }
    [v5 defaultDurationsForEffectID:self->_effectID phaseInDuration:&v13 mainDuration:&v14 phaseOutDuration:&v12];
    double v7 = v13;
    goto LABEL_9;
  }
  [(MPLayerEffect *)self _updateEffectTiming];
  [(MZEffectTiming *)self->_effectTiming phaseInDuration];
  double v7 = v6;
  double v13 = v6;
  [(MZEffectTiming *)self->_effectTiming phaseOutDuration];
  double v9 = v8;
  double v12 = v8;
  [(MZEffectTiming *)self->_effectTiming mainDuration];
  double v14 = v10;
  if (!a3)
  {
LABEL_9:
    [(MPLayerInternal *)self->super._internal setPhaseInDuration:v7];
    [(MPLayerInternal *)self->super._internal setPhaseOutDuration:v12];
    [(MPLayerInternal *)self->super._internal setDuration:v14 + v13 + v12];
    return;
  }
  if (self->_supportsEffectTiming)
  {
    double v11 = v10;
    [(MPLayerEffect *)self setPhaseInDuration:v7];
    [(MPLayerEffect *)self setPhaseOutDuration:v9];
    [(MPLayerEffect *)self setDuration:v11 + v7 + v9];
  }
}

- (id)allSlides:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v6 = [(MPLayerEffect *)self slides];
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (id i = 0; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v11 path]) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  if (v3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = [(MPLayerEffect *)self secondarySlides];
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
          if ([v17 path]) {
            [v5 addObject:v17];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
  return v5;
}

- (MZEffectTiming)effectTiming
{
  return self->_effectTiming;
}

- (int64_t)liveIndex
{
  return self->_liveIndex;
}

- (void)setLiveIndex:(int64_t)a3
{
  self->_liveIndex = a3;
}

- (double)lowestDisplayTime
{
  effectTiming = self->_effectTiming;
  if (!effectTiming) {
    return 0.0;
  }
  [(MZEffectTiming *)effectTiming lowestDisplayTime];
  return result;
}

- (id)container
{
  return self->_layerEffect;
}

- (int64_t)maxNumberOfSlides
{
  id v3 = +[MPEffectManager sharedManager];
  id v4 = [(MPLayerEffect *)self effectID];
  return (int64_t)[v3 numberOfSlidesForEffectID:v4];
}

- (int64_t)maxNumberOfSecondarySlides
{
  id v3 = +[MPEffectManager sharedManager];
  id v4 = [(MPLayerEffect *)self effectID];
  return (int64_t)[v3 numberOfSecondarySlidesForEffectID:v4];
}

- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4
{
}

- (void)createTextsWithStrings:(id)a3 secondLineFactor:(double)a4 fillIn:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  uint64_t v9 = 136;
  if (a3 && !self->_texts && [a3 count]) {
    self->_texts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v10 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfTextsForEffectID:", -[MPLayerEffect effectID](self, "effectID"));
  if (v7) {
    id v11 = [v7 count];
  }
  else {
    id v11 = 0;
  }
  if ((uint64_t)v11 >= (uint64_t)v10) {
    uint64_t v12 = (uint64_t)v10;
  }
  else {
    uint64_t v12 = (uint64_t)v11;
  }
  if (v5) {
    uint64_t v13 = (uint64_t)v10;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 >= 1)
  {
    uint64_t v14 = 0;
    p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
    while (1)
    {
      if (v7)
      {
        id v16 = v14 >= (uint64_t)v11 ? [v7 lastObject] : objc_msgSend(v7, "objectAtIndex:", v14);
        long long v17 = v16;
      }
      else
      {
        long long v17 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v18 = v17;
LABEL_32:
      id v32 = [objc_alloc((Class)(p_info + 266)) initWithAttributedString:v18];

      [v32 setParent:self];
      [*(id *)((char *)&self->super.super.isa + v9) addObject:v32];

      if (v13 == ++v14) {
        return;
      }
    }
    id v19 = v7;
    uint64_t v20 = v9;
    id v21 = v11;
    id v22 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "defaultStringForTextInEffectID:presetID:atIndex:", -[MPLayerEffect effectID](self, "effectID"), -[MPLayerEffect presetID](self, "presetID"), v14));
    id v18 = v22;
    if (v17)
    {
      objc_msgSend(v22, "replaceCharactersInRange:withString:", 0, objc_msgSend(v22, "length"), v17);
      if (a4 == 1.0 || ![v17 length])
      {
        uint64_t v9 = v20;
LABEL_31:
        p_info = MRTiledSprite.info;
        goto LABEL_32;
      }
      long long v23 = (char *)objc_msgSend(v17, "lineRangeForRange:", 0, 1);
      long long v25 = &v23[v24];
      long long v26 = (char *)[v17 length];
      if (v26 != v25)
      {
        v34[0] = 0;
        v34[1] = 0;
        long long v33 = (char *)(v26 - v25);
        long long v27 = (const __CTFont *)objc_msgSend(objc_msgSend(v18, "attributesAtIndex:effectiveRange:", 0, v34), "objectForKey:", kCTFontAttributeName);
        CFStringRef v28 = CTFontCopyPostScriptName(v27);
        CGFloat Size = CTFontGetSize(v27);
        CTFontRef v30 = CTFontCreateWithName(v28, Size * a4, 0);
        CFRelease(v28);
        objc_msgSend(v18, "addAttribute:value:range:", kCTFontAttributeName, v30, v25, v33);
        CTFontRef v31 = v30;
        id v11 = v21;
        CFRelease(v31);
      }
    }
    uint64_t v9 = v20;
    id v7 = v19;
    goto LABEL_31;
  }
}

- (void)createSlidesWithPaths:(id)a3
{
  id v5 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSlidesForEffectID:", -[MPLayerEffect effectID](self, "effectID"));
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = [a3 count];
  }
  if (self->_slides) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = (uint64_t)v5 < 1;
  }
  if (v6)
  {
    if ((uint64_t)v5 < 1) {
      return;
    }
  }
  else
  {
    self->_slides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  unint64_t v7 = 0;
  do
  {
    if (v7 < (unint64_t)[a3 count] && (id v8 = objc_msgSend(a3, "objectAtIndex:", v7)) != 0) {
      uint64_t v9 = [[MPSlide alloc] initWithPath:v8];
    }
    else {
      uint64_t v9 = objc_alloc_init(MPSlide);
    }
    id v10 = v9;
    [(MPSlide *)v9 setParent:self];
    [(NSMutableArray *)self->_slides addObject:v10];

    ++v7;
  }
  while (v5 != (id)v7);
}

- (void)createSecondarySlidesWithPaths:(id)a3
{
  id v5 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSecondarySlidesForEffectID:", -[MPLayerEffect effectID](self, "effectID"));
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
    id v11 = v10;
    [(MPSlide *)v10 setParent:self];
    [(MPSlide *)v11 setIsSecondary:1];
    [(NSMutableArray *)self->_secondarySlides addObject:v11];

    ++v8;
  }
  while (v6 != (id)v8);
}

- (BOOL)isLive
{
  if (self->_layerEffect) {
    layerEffect = self->_layerEffect;
  }
  else {
    layerEffect = [(MPLayer *)self parentDocument];
  }
  return [(MCContainerEffect *)layerEffect isLive];
}

- (void)setSkipEffectTiming:(BOOL)a3
{
  self->_skipEffectTiming = a3;
}

- (void)updateTiming
{
}

- (id)formattedAttributes
{
  if (self->super._attributes) {
    id v3 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", -[MPLayerEffect _effectAttributes](self, "_effectAttributes"));
  }
  else {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v4 = v3;
  objc_msgSend(v3, "setObject:forKey:", -[MPLayerEffect presetID](self, "presetID"), @"PresetID");
  if ((self->_randomSeed & 0x8000000000000000) == 0) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"), @"RandomSeed");
  }
  return v4;
}

- (void)applyFormattedAttributes
{
  if (self->_layerEffect)
  {
    [(MCContainerEffect *)self->_layerEffect setEffectAttributes:[(MPLayerEffect *)self _effectAttributes]];
    [(MCContainerEffect *)self->_layerEffect setEffectAttribute:[(MPLayerEffect *)self presetID] forKey:@"PresetID"];
    if ((self->_randomSeed & 0x8000000000000000) == 0)
    {
      layerEffect = self->_layerEffect;
      id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
      [(MCContainerEffect *)layerEffect setEffectAttribute:v4 forKey:@"RandomSeed"];
    }
  }
}

- (id)slideInformation
{
  id v21 = +[NSMutableArray array];
  id v3 = [(MPLayer *)self parentDocument];
  if (!v3)
  {
    if (objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "isAuthoring"))id v3 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument"); {
    else
    }
      id v3 = 0;
  }
  id v4 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authoredDocument");
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  slides = self->_slides;
  id v6 = [(NSMutableArray *)slides countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    double height = CGSizeZero.height;
    do
    {
      for (id i = 0; i != v7; id i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(slides);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = [v11 path];
        if (v12)
        {
          id v13 = v12;
          id v14 = objc_alloc_init((Class)NSMutableDictionary);
          if (v3) {
            [v3 resolutionForPath:v13];
          }
          else {
            objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "resolutionForAssetAtPath:", v13);
          }
          if (v15 == CGSizeZero.width && v16 == height && v4 != 0) {
            [v4 resolutionForPath:v13];
          }
          double v19 = v15 / v16;
          *(float *)&double v19 = v19;
          objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19), @"aspectRatio");
          if ([v11 hasMovie])
          {
            objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"isMovie");
            [v3 durationForPath:v13];
            objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"duration");
          }
          [v21 addObject:v14];
        }
      }
      id v7 = [(NSMutableArray *)slides countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
  return v21;
}

- (void)setLayerEffect:(id)a3
{
  id v5 = (MCContainerEffect *)a3;
  self->_layerEffect = v5;
  if (v5)
  {
    if (objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "isLive")) {
      [(MCContainerEffect *)self->_layerEffect setIsLive:1];
    }
    [(MCContainerEffect *)self->_layerEffect setEffectID:[(MPLayerEffect *)self effectID]];
    [(MPLayerEffect *)self applyFormattedAttributes];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = objc_alloc_init((Class)NSMutableArray);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    slides = self->_slides;
    id v9 = [(NSMutableArray *)slides countByEnumeratingWithState:&v86 objects:v97 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v87;
      do
      {
        for (id i = 0; i != v10; id i = (char *)i + 1)
        {
          if (*(void *)v87 != v11) {
            objc_enumerationMutation(slides);
          }
          id v13 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          if ([v13 path])
          {
            id v14 = objc_msgSend(-[MPLayer montage](self, "montage"), "videoAssetForFileAtPath:", objc_msgSend(v13, "path"));
            double v15 = v7;
          }
          else
          {
            objc_msgSend(v6, "addObjectsFromArray:", -[MCContainerEffect addSlidesForAssets:](self->_layerEffect, "addSlidesForAssets:", v7));
            [v7 removeAllObjects];
            id v14 = [(MCContainerEffect *)self->_layerEffect addSlide];
            double v15 = v6;
          }
          [v15 addObject:v14];
        }
        id v10 = [(NSMutableArray *)slides countByEnumeratingWithState:&v86 objects:v97 count:16];
      }
      while (v10);
    }
    objc_msgSend(v6, "addObjectsFromArray:", -[MCContainerEffect addSlidesForAssets:](self->_layerEffect, "addSlidesForAssets:", v7));
    [v7 removeAllObjects];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    secondarySlides = self->_secondarySlides;
    id v17 = [(NSMutableArray *)secondarySlides countByEnumeratingWithState:&v82 objects:v96 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v83;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v83 != v19) {
            objc_enumerationMutation(secondarySlides);
          }
          id v21 = *(void **)(*((void *)&v82 + 1) + 8 * (void)j);
          if ([v21 path])
          {
            id v22 = objc_msgSend(-[MPLayer montage](self, "montage"), "videoAssetForFileAtPath:", objc_msgSend(v21, "path"));
            long long v23 = v7;
          }
          else
          {
            objc_msgSend(v6, "addObjectsFromArray:", -[MCContainerEffect addSlidesForAssets:](self->_layerEffect, "addSlidesForAssets:", v7));
            [v7 removeAllObjects];
            id v22 = [(MCContainerEffect *)self->_layerEffect addSlide];
            long long v23 = v6;
          }
          [v23 addObject:v22];
        }
        id v18 = [(NSMutableArray *)secondarySlides countByEnumeratingWithState:&v82 objects:v96 count:16];
      }
      while (v18);
    }
    objc_msgSend(v6, "addObjectsFromArray:", -[MCContainerEffect addSlidesForAssets:](self->_layerEffect, "addSlidesForAssets:", v7));

    id v24 = [v6 objectEnumerator];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v25 = self->_slides;
    id v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v78 objects:v95 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v79;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v79 != v28) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * (void)k), "setSlide:", objc_msgSend(v24, "nextObject"));
        }
        id v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v78 objects:v95 count:16];
      }
      while (v27);
    }
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    CTFontRef v30 = self->_secondarySlides;
    id v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v74 objects:v94 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v75;
      do
      {
        for (m = 0; m != v32; m = (char *)m + 1)
        {
          if (*(void *)v75 != v33) {
            objc_enumerationMutation(v30);
          }
          objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * (void)m), "setSlide:", objc_msgSend(v24, "nextObject"));
        }
        id v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v74 objects:v94 count:16];
      }
      while (v32);
    }

    id v35 = objc_alloc_init((Class)NSMutableArray);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    texts = self->_texts;
    id v37 = [(NSMutableArray *)texts countByEnumeratingWithState:&v70 objects:v93 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v71;
      do
      {
        for (n = 0; n != v38; n = (char *)n + 1)
        {
          if (*(void *)v71 != v39) {
            objc_enumerationMutation(texts);
          }
          objc_msgSend(v35, "addObject:", objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * (void)n), "attributedString"));
        }
        id v38 = [(NSMutableArray *)texts countByEnumeratingWithState:&v70 objects:v93 count:16];
      }
      while (v38);
    }
    id v41 = objc_msgSend(-[MCContainerEffect addTextsForAttributedStrings:](self->_layerEffect, "addTextsForAttributedStrings:", v35), "objectEnumerator");
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v42 = self->_texts;
    id v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v66 objects:v92 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v67;
      do
      {
        for (iid i = 0; ii != v44; iid i = (char *)ii + 1)
        {
          if (*(void *)v67 != v45) {
            objc_enumerationMutation(v42);
          }
          objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * (void)ii), "setText:", objc_msgSend(v41, "nextObject"));
        }
        id v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v66 objects:v92 count:16];
      }
      while (v44);
    }

    v65.receiver = self;
    v65.super_class = (Class)MPLayerEffect;
    [(MPLayer *)&v65 configureActions];
  }
  else
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    double v47 = self->_slides;
    id v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v61 objects:v91 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v62;
      do
      {
        for (jj = 0; jj != v49; jj = (char *)jj + 1)
        {
          if (*(void *)v62 != v50) {
            objc_enumerationMutation(v47);
          }
          [*(id *)(*((void *)&v61 + 1) + 8 * (void)jj) setSlide:0];
        }
        id v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v61 objects:v91 count:16];
      }
      while (v49);
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    double v52 = self->_texts;
    id v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v57 objects:v90 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v58;
      do
      {
        for (kk = 0; kk != v54; kk = (char *)kk + 1)
        {
          if (*(void *)v58 != v55) {
            objc_enumerationMutation(v52);
          }
          [*(id *)(*((void *)&v57 + 1) + 8 * (void)kk) setText:0];
        }
        id v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v57 objects:v90 count:16];
      }
      while (v54);
    }
  }
}

- (void)copySlides:(id)a3
{
  if (a3)
  {
    id v5 = +[NSMutableArray array];
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
    [(MPLayerEffect *)self addSlides:v5];
  }
}

- (void)copySecondarySlides:(id)a3
{
  if (a3)
  {
    id v5 = +[NSMutableArray array];
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
    [(MPLayerEffect *)self addSecondarySlides:v5];
  }
}

- (void)copyTexts:(id)a3
{
  if (a3)
  {
    id v5 = +[NSMutableArray array];
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
    [(MPLayerEffect *)self addTexts:v5];
  }
}

- (id)slideForMCSlide:(id)a3
{
  id v5 = [(NSArray *)[(MPLayerEffect *)self slides] copy];
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
      id v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
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
  id v12 = objc_msgSend(-[MPLayerEffect secondarySlides](self, "secondarySlides"), "copy");
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
      id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
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
    id v10 = 0;
  }

  return v10;
}

@end