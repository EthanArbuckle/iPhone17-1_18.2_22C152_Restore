@interface MPSlide
+ (id)slide;
+ (id)slideWithPath:(id)a3;
- (BOOL)canZoom;
- (BOOL)determineShowTime:(double *)a3 showDuration:(double *)a4;
- (BOOL)hasAnimationPathForKey:(id)a3;
- (BOOL)hasMovie;
- (BOOL)isPanoramaInDocument:(id)a3;
- (BOOL)isSecondary;
- (BOOL)needsStyleUpdateOnSlideChange;
- (BOOL)needsTimingUpdateOnSlideChange;
- (CGPoint)center;
- (MPFrame)frame;
- (MPLayerGroup)layerGroup;
- (MPSlide)init;
- (MPSlide)initWithLayerGroup:(id)a3;
- (MPSlide)initWithPath:(id)a3;
- (NSString)absolutePath;
- (NSString)path;
- (NSString)sizingMode;
- (double)aspectRatio;
- (double)audioDuckInDuration;
- (double)audioDuckLevel;
- (double)audioDuckOutDuration;
- (double)audioFadeInDuration;
- (double)audioFadeOutDuration;
- (double)audioVolume;
- (double)duration;
- (double)maxDuration;
- (double)originalAspectRatio;
- (double)rotation;
- (double)scale;
- (double)showDisplayStartTime;
- (double)showDisplayTime;
- (double)showDuration;
- (double)showTime;
- (double)startTime;
- (id)action;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filters;
- (id)fullDebugLog;
- (id)keyframedAnimationPathForKey:(id)a3;
- (id)nearestLayer;
- (id)objectInFilterAtIndex:(int64_t)a3;
- (id)parent;
- (id)parentDocument;
- (id)parentEffect;
- (id)parentSubtitleEffect;
- (id)scriptingAnimations;
- (id)scriptingFrame;
- (id)slide;
- (id)userInfoAttributeForKey:(id)a3;
- (int64_t)countOfFilter;
- (int64_t)index;
- (int64_t)liveIndex;
- (void)addFilter:(id)a3;
- (void)addFilters:(id)a3;
- (void)cleanup;
- (void)copyAnimationPaths:(id)a3;
- (void)copyFilters:(id)a3;
- (void)copyFrame:(id)a3;
- (void)copyLayerGroup:(id)a3;
- (void)copyVars:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)duplicateAnimationPaths;
- (void)insertFilters:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inFilterAtIndex:(int64_t)a4;
- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)removeAllFilters;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)removeObjectFromFilterAtIndex:(int64_t)a3;
- (void)replaceObjectInFilterAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)resetCachedTimes;
- (void)setAbsolutePath:(id)a3;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setAudioDuckInDuration:(double)a3;
- (void)setAudioDuckLevel:(double)a3;
- (void)setAudioDuckOutDuration:(double)a3;
- (void)setAudioFadeInDuration:(double)a3;
- (void)setAudioFadeOutDuration:(double)a3;
- (void)setAudioVolume:(double)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setDuration:(double)a3;
- (void)setFrame:(id)a3;
- (void)setIsSecondary:(BOOL)a3;
- (void)setLayerGroup:(id)a3;
- (void)setMediaType:(unint64_t)a3;
- (void)setMirrorToDuplicatePaths:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setPath:(id)a3;
- (void)setRotation:(double)a3;
- (void)setScale:(double)a3;
- (void)setScriptingAnimations:(id)a3;
- (void)setScriptingFrame:(id)a3;
- (void)setSizingMode:(id)a3;
- (void)setSlide:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setUserInfoAttribute:(id)a3 forKey:(id)a4;
@end

@implementation MPSlide

+ (id)slide
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)slideWithPath:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithPath:a3];
  return v3;
}

- (MPSlide)init
{
  v9.receiver = self;
  v9.super_class = (Class)MPSlide;
  result = [(MPSlide *)&v9 init];
  if (result)
  {
    result->_slide = 0;
    *(_OWORD *)&result->_filters = 0u;
    *(_OWORD *)&result->_path = 0u;
    *(_OWORD *)&result->_frame = 0u;
    __asm { FMOV            V1.2D, #-1.0 }
    *(_OWORD *)&result->_startTime = _Q1;
    *(_OWORD *)&result->_audioFadeInDuration = 0u;
    *(_OWORD *)&result->_audioDuckInDuration = 0u;
    result->_sizingMode = 0;
    result->_mediaType = -1;
    *(_OWORD *)&result->_center.y = xmmword_165380;
    *(_OWORD *)&result->_rotation = xmmword_165390;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_audioDuckLevel = _Q0;
    result->_mirrorToDuplicatePaths = 0;
    *(int64x2_t *)&result->_cachedShowTime = vdupq_n_s64(0xC059000000000000);
  }
  return result;
}

- (MPSlide)initWithPath:(id)a3
{
  v4 = [(MPSlide *)self init];
  v5 = v4;
  if (a3 && v4) {
    v4->_path = (NSString *)[a3 copy];
  }
  return v5;
}

- (MPSlide)initWithLayerGroup:(id)a3
{
  v4 = [(MPSlide *)self init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      layerGroup = (MPLayerGroup *)a3;
      v5->_layerGroup = layerGroup;
    }
    else
    {
      layerGroup = v4->_layerGroup;
    }
    [(MPLayerGroup *)layerGroup setParent:v5];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  if (self->_path) {
    objc_msgSend(v4, "setPath:");
  }
  if (self->_layerGroup) {
    objc_msgSend(v4, "copyLayerGroup:");
  }
  [v4 copyFilters:self->_filters];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyFrame:self->_frame];
  return v4;
}

- (id)description
{
  id v3 = [[+[NSString stringWithFormat:@"============================= Slide %d Description =============================\n", [(MPSlide *)self index]] stringByAppendingFormat:@"\t                          Path: %@\n" stringByAppendingFormat:"stringByAppendingFormat:", @"\t                 Absolute Path: %@\n", [(MPSlide *)self absolutePath]];
  filters = self->_filters;
  if (filters) {
    filters = (NSMutableArray *)[(NSMutableArray *)filters count];
  }
  v5 = [(NSString *)v3 stringByAppendingFormat:@"\t                  Filter Count: %d\n", filters];
  if ([(MPSlide *)self frame]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  v7 = [(NSString *)v5 stringByAppendingFormat:@"\t                     Has Frame: %@\n", v6];
  if (self->_slide) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  return [(NSString *)v7 stringByAppendingFormat:@"\t                     Has Slide: %@\n", v8];
}

- (void)dealloc
{
  [(MPSlide *)self cleanup];

  self->_slide = 0;
  self->_filters = 0;

  self->_animationPaths = 0;
  self->_attributes = 0;

  self->_path = 0;
  self->_layerGroup = 0;

  self->_frame = 0;
  self->_sizingMode = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPSlide;
  [(MPSlide *)&v3 dealloc];
}

- (MPFrame)frame
{
  return self->_frame;
}

- (void)setFrame:(id)a3
{
  frame = self->_frame;
  if (frame)
  {

    self->_frame = 0;
  }
  CFStringRef v6 = (MPFrame *)a3;
  self->_frame = v6;
  [(MPFrame *)v6 setParentSlide:self];
  if (self->_slide)
  {
    id v7 = [a3 frameID];
    slide = self->_slide;
    [(MCSlide *)slide setFrameID:v7];
  }
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  if (a3) {
    [(MPSlide *)self setLayerGroup:0];
  }
  if (![(MPSlide *)self isSecondary]) {
    [(MPSlide *)self setAbsolutePath:0];
  }
  path = self->_path;
  if (path)
  {

    self->_path = 0;
  }
  if (a3) {
    self->_path = (NSString *)[a3 copy];
  }
  double v6 = -1.0;
  double v7 = -1.0;
  if (self->_duration != -1.0) {
    [(MPSlide *)self duration];
  }
  [(MPSlide *)self setDuration:v7];
  if (self->_startTime != -1.0)
  {
    [(MPSlide *)self startTime];
    double v6 = v8;
  }
  [(MPSlide *)self setStartTime:v6];
  objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "resolutionForPath:", a3);
  self->_cachedSize.width = v9;
  self->_cachedSize.height = v10;
  slide = self->_slide;
  if (slide)
  {
    if (self->_path)
    {
      id v12 = objc_msgSend(objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "montage"), "videoAssetForFileAtPath:", self->_path);
      slide = self->_slide;
    }
    else
    {
      id v12 = 0;
    }
    [(MCSlide *)slide setAsset:v12];
  }
}

- (NSString)absolutePath
{
  path = self->_path;
  if (!+[MPUtilities pathIsRelative:path]) {
    return path;
  }
  id v4 = [(MPSlide *)self parentDocument];
  if (!v4) {
    return path;
  }
  v5 = self->_path;
  return (NSString *)[v4 absolutePathForAssetAtPath:v5];
}

- (void)setAbsolutePath:(id)a3
{
  if (self->_path) {
    objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "setAbsolutePath:forKey:", a3, self->_path);
  }
  if (a3)
  {
    objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "resolutionForPath:", a3);
    self->_cachedSize.width = v5;
    self->_cachedSize.height = v6;
  }
  else
  {
    objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "absolutePathForAssetAtPath:", self->_path);
  }
  if ([(MCSlide *)self->_slide asset]) {
    [(MCAsset *)[(MCSlide *)self->_slide asset] setPath:self->_path];
  }
  if (self->_mirrorToDuplicatePaths)
  {
    slide = self->_slide;
    if (slide)
    {
      double v8 = [(MCAssetVideo *)[(MCSlide *)slide asset] slides];
      if (v8)
      {
        CGFloat v9 = v8;
        if ([(NSSet *)v8 count] >= 2)
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v10 = [(NSSet *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v19;
            do
            {
              for (i = 0; i != v11; i = (char *)i + 1)
              {
                if (*(void *)v19 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(MCSlide **)(*((void *)&v18 + 1) + 8 * i);
                if (v14 != self->_slide)
                {
                  v15 = +[MPUtilities slideForSlide:v14 inDocument:[(MPSlide *)self parentDocument]];
                  if (v15) {
                    BOOL v16 = v15 == self;
                  }
                  else {
                    BOOL v16 = 1;
                  }
                  if (!v16)
                  {
                    v17 = v15;
                    if ((objc_msgSend(objc_msgSend(-[MPSlide parent](v15, "parent"), "effectID"), "isEqualToString:", objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)-[MPSlide setAbsolutePath:](v17, "setAbsolutePath:", a3); {
                  }
                    }
                }
              }
              id v11 = [(NSSet *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
            }
            while (v11);
          }
        }
      }
    }
  }
}

- (MPLayerGroup)layerGroup
{
  return self->_layerGroup;
}

- (void)setLayerGroup:(id)a3
{
  layerGroup = self->_layerGroup;
  if (layerGroup != a3)
  {
    if (a3)
    {
      [(MPSlide *)self setPath:0];
      layerGroup = self->_layerGroup;
    }
    if (layerGroup)
    {
      [(MPLayerGroup *)layerGroup setParent:0];

      self->_layerGroup = 0;
    }
    if (a3)
    {
      CGFloat v6 = (MPLayerGroup *)a3;
      self->_layerGroup = v6;
      [(MPLayerGroup *)v6 setParent:self];
    }
    slide = self->_slide;
    if (slide)
    {
      double v8 = self->_layerGroup;
      if (v8)
      {
        id v9 = +[MPUtilities createPlugInSlide:slide forLayer:v8 inDocument:[(MPSlide *)self parentDocument]];
        id v10 = self->_slide;
      }
      else
      {
        id v10 = self->_slide;
        id v9 = 0;
      }
      [(MCSlide *)v10 setPlug:v9];
    }
  }
}

- (id)filters
{
  return self->_filters;
}

- (void)addFilter:(id)a3
{
  id v4 = +[NSArray arrayWithObject:a3];
  filters = self->_filters;
  if (filters) {
    id v6 = [(NSMutableArray *)filters count];
  }
  else {
    id v6 = 0;
  }
  [(MPSlide *)self insertFilters:v4 atIndex:v6];
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
  [(MPSlide *)self insertFilters:a3 atIndex:v6];
}

- (void)insertFilters:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_filters) {
    self->_filters = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  [(MPSlide *)self willChange:2 valuesAtIndexes:v7 forKey:@"filters"];
  [(NSMutableArray *)self->_filters insertObjects:a3 atIndexes:v7];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * i) setParent:self];
      }
      id v9 = [a3 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v9);
  }
  if (self->_slide)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v12 = [a3 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v47;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v47 != v14) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * (void)j), "setFilter:", -[MCSlide insertFilterWithFilterID:atIndex:](self->_slide, "insertFilterWithFilterID:atIndex:", objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * (void)j), "filterID"), (char *)j + a4));
        }
        id v13 = [a3 countByEnumeratingWithState:&v46 objects:v56 count:16];
        a4 += (int64_t)j;
      }
      while (v13);
    }
  }
  id v16 = [(MPSlide *)self parentDocument];
  v35 = v7;
  [(MPSlide *)self didChange:2 valuesAtIndexes:v7 forKey:@"filters"];
  if (self->_mirrorToDuplicatePaths)
  {
    slide = self->_slide;
    if (slide)
    {
      long long v18 = [(MCAssetVideo *)[(MCSlide *)slide asset] slides];
      if (v18)
      {
        long long v19 = v18;
        if ([(NSSet *)v18 count] >= 2)
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v20 = [(NSSet *)v19 countByEnumeratingWithState:&v42 objects:v55 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v43;
            p_superclass = &OBJC_METACLASS___MPLayer.superclass;
            v36 = v19;
            id v37 = v16;
            do
            {
              for (k = 0; k != v21; k = (char *)k + 1)
              {
                if (*(void *)v43 != v22) {
                  objc_enumerationMutation(v19);
                }
                v25 = *(MCSlide **)(*((void *)&v42 + 1) + 8 * (void)k);
                if (v25 != self->_slide)
                {
                  v26 = (MPSlide *)[p_superclass + 74 slideForSlide:v25 inDocument:v16];
                  if (v26 && v26 != self)
                  {
                    v28 = v26;
                    if ((objc_msgSend(objc_msgSend(-[MPSlide parent](v26, "parent"), "effectID"), "isEqualToString:", objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)
                    {
                      id v29 = +[NSMutableArray array];
                      long long v38 = 0u;
                      long long v39 = 0u;
                      long long v40 = 0u;
                      long long v41 = 0u;
                      filters = self->_filters;
                      id v31 = [(NSMutableArray *)filters countByEnumeratingWithState:&v38 objects:v54 count:16];
                      if (v31)
                      {
                        id v32 = v31;
                        uint64_t v33 = *(void *)v39;
                        do
                        {
                          for (m = 0; m != v32; m = (char *)m + 1)
                          {
                            if (*(void *)v39 != v33) {
                              objc_enumerationMutation(filters);
                            }
                            objc_msgSend(v29, "addObject:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * (void)m), "copy"));
                          }
                          id v32 = [(NSMutableArray *)filters countByEnumeratingWithState:&v38 objects:v54 count:16];
                        }
                        while (v32);
                      }
                      [(MPSlide *)v28 removeAllFilters];
                      [(MPSlide *)v28 insertFilters:v29 atIndex:0];
                      long long v19 = v36;
                      id v16 = v37;
                      p_superclass = (__objc2_class **)(&OBJC_METACLASS___MPLayer + 8);
                    }
                  }
                }
              }
              id v21 = [(NSSet *)v19 countByEnumeratingWithState:&v42 objects:v55 count:16];
            }
            while (v21);
          }
        }
      }
    }
  }
}

- (void)removeFiltersAtIndices:(id)a3
{
  filters = self->_filters;
  if (filters && [(NSMutableArray *)filters count])
  {
    [(MPSlide *)self willChange:3 valuesAtIndexes:a3 forKey:@"filters"];
    id v6 = [(MPSlide *)self parentDocument];
    id v7 = [a3 lastIndex];
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v7; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v9 = [(NSMutableArray *)self->_filters objectAtIndex:i];
        [v9 setParent:0];
        [v9 setFilter:0];
      }
    }
    slide = self->_slide;
    if (slide) {
      [(MCSlide *)slide removeFiltersAtIndices:a3];
    }
    [(NSMutableArray *)self->_filters removeObjectsAtIndexes:a3];
    if (self->_mirrorToDuplicatePaths)
    {
      id v11 = self->_slide;
      if (v11)
      {
        id v12 = [(MCAssetVideo *)[(MCSlide *)v11 asset] slides];
        if (v12)
        {
          id v13 = v12;
          if ([(NSSet *)v12 count] >= 2)
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            id v14 = [(NSSet *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v14)
            {
              id v15 = v14;
              uint64_t v16 = *(void *)v23;
              do
              {
                for (j = 0; j != v15; j = (char *)j + 1)
                {
                  if (*(void *)v23 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  long long v18 = *(MCSlide **)(*((void *)&v22 + 1) + 8 * (void)j);
                  if (v18 != self->_slide)
                  {
                    long long v19 = +[MPUtilities slideForSlide:v18 inDocument:v6];
                    if (v19) {
                      BOOL v20 = v19 == self;
                    }
                    else {
                      BOOL v20 = 1;
                    }
                    if (!v20)
                    {
                      id v21 = v19;
                      if ((objc_msgSend(objc_msgSend(-[MPSlide parent](v19, "parent"), "effectID"), "isEqualToString:", objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)-[MPSlide removeFiltersAtIndices:](v21, "removeFiltersAtIndices:", a3); {
                    }
                      }
                  }
                }
                id v15 = [(NSSet *)v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
              }
              while (v15);
            }
          }
        }
      }
    }
    [(MPSlide *)self didChange:3 valuesAtIndexes:a3 forKey:@"filters"];
  }
}

- (void)removeAllFilters
{
  if ([(NSMutableArray *)self->_filters count])
  {
    id v3 = objc_alloc((Class)NSIndexSet);
    filters = self->_filters;
    if (filters) {
      id v5 = [(NSMutableArray *)filters count];
    }
    else {
      id v5 = 0;
    }
    id v6 = objc_msgSend(v3, "initWithIndexesInRange:", 0, v5);
    [(MPSlide *)self removeFiltersAtIndices:v6];
  }
}

- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  if (self->_filters)
  {
    id v6 = [a3 firstIndex];
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = v6;
      do
      {
        id v8 = [(NSMutableArray *)self->_filters objectAtIndex:v7];
        [(NSMutableArray *)self->_filters removeObjectAtIndex:v7];
        [(NSMutableArray *)self->_filters insertObject:v8 atIndex:(void)((__PAIR128__(a4, (unint64_t)v7) - (unint64_t)a4) >> 64)];
        id v7 = [a3 indexGreaterThanIndex:v7];
        ++a4;
      }
      while (v7 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
    slide = self->_slide;
    if (slide) {
      [(MCSlide *)slide moveFiltersAtIndices:a3 toIndex:a4];
    }
    id v10 = [(MPSlide *)self parentDocument];
    if (self->_mirrorToDuplicatePaths)
    {
      id v11 = v10;
      id v12 = self->_slide;
      if (v12)
      {
        id v13 = [(MCAssetVideo *)[(MCSlide *)v12 asset] slides];
        if (v13)
        {
          id v14 = v13;
          if ([(NSSet *)v13 count] >= 2)
          {
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v15 = [(NSSet *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v25;
              do
              {
                for (id i = 0; i != v16; id i = (char *)i + 1)
                {
                  if (*(void *)v25 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  long long v19 = *(MCSlide **)(*((void *)&v24 + 1) + 8 * i);
                  if (v19 != self->_slide)
                  {
                    BOOL v20 = +[MPUtilities slideForSlide:v19 inDocument:v11];
                    if (v20) {
                      BOOL v21 = v20 == self;
                    }
                    else {
                      BOOL v21 = 1;
                    }
                    if (!v21)
                    {
                      long long v22 = v20;
                      if ((objc_msgSend(objc_msgSend(-[MPSlide parent](v20, "parent"), "effectID"), "isEqualToString:", objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)-[MPSlide moveFiltersFromIndices:toIndex:](v22, "moveFiltersFromIndices:toIndex:", a3, a4); {
                    }
                      }
                  }
                }
                id v16 = [(NSSet *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
              }
              while (v16);
            }
          }
        }
      }
    }
  }
}

- (id)animationPaths
{
  [(MPSlide *)self center];
  BOOL v5 = v4 == 0.5 && v3 == 0.5;
  if (!v5 && ![(NSMutableDictionary *)self->_animationPaths objectForKey:@"center"])
  {
    id v6 = +[MPAnimationPathKeyframed animationPath];
    [(MPSlide *)self center];
    objc_msgSend(v6, "createKeyframeWithPoint:atTime:");
    [(MPSlide *)self setAnimationPath:v6 forKey:@"center"];
  }
  [(MPSlide *)self scale];
  if (v7 != 1.0 && ![(NSMutableDictionary *)self->_animationPaths objectForKey:@"scale"])
  {
    id v8 = +[MPAnimationPathKeyframed animationPath];
    [(MPSlide *)self scale];
    objc_msgSend(v8, "createKeyframeWithScalar:atTime:");
    [(MPSlide *)self setAnimationPath:v8 forKey:@"scale"];
  }
  [(MPSlide *)self rotation];
  if (v9 != 0.0 && ![(NSMutableDictionary *)self->_animationPaths objectForKey:@"angle"])
  {
    id v10 = +[MPAnimationPathKeyframed animationPath];
    [(MPSlide *)self rotation];
    objc_msgSend(v10, "createKeyframeWithScalar:atTime:");
    [(MPSlide *)self setAnimationPath:v10 forKey:@"angle"];
  }
  return self->_animationPaths;
}

- (id)animationPathForKey:(id)a3
{
  animationPaths = self->_animationPaths;
  if (!animationPaths || (id v6 = [(NSMutableDictionary *)animationPaths objectForKey:a3]) == 0)
  {
    if ([a3 isEqualToString:@"center"])
    {
      id v6 = +[MPAnimationPathKeyframed animationPath];
      [(MPSlide *)self center];
      objc_msgSend(v6, "createKeyframeWithPoint:atTime:");
      CFStringRef v7 = @"center";
    }
    else if ([a3 isEqualToString:@"scale"])
    {
      id v6 = +[MPAnimationPathKeyframed animationPath];
      [(MPSlide *)self scale];
      objc_msgSend(v6, "createKeyframeWithScalar:atTime:");
      CFStringRef v7 = @"scale";
    }
    else
    {
      if (![a3 isEqualToString:@"angle"]) {
        return 0;
      }
      id v6 = +[MPAnimationPathKeyframed animationPath];
      [(MPSlide *)self rotation];
      objc_msgSend(v6, "createKeyframeWithScalar:atTime:");
      CFStringRef v7 = @"angle";
    }
    [(MPSlide *)self setAnimationPath:v6 forKey:v7];
  }
  return v6;
}

- (BOOL)hasAnimationPathForKey:(id)a3
{
  animationPaths = self->_animationPaths;
  if (animationPaths) {
    LOBYTE(animationPaths) = [(NSMutableDictionary *)animationPaths objectForKeyedSubscript:a3] != 0;
  }
  return (char)animationPaths;
}

- (id)keyframedAnimationPathForKey:(id)a3
{
  id v3 = [(MPSlide *)self animationPathForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)setAnimationPath:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    animationPaths = self->_animationPaths;
    if (animationPaths
      || (animationPaths = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary),
          (self->_animationPaths = animationPaths) != 0))
    {
      id v8 = [(NSMutableDictionary *)animationPaths objectForKey:a4];
      if (v8)
      {
        double v9 = v8;
        [v8 setParent:0];
        [v9 setAnimationPath:0];
      }
    }
    [a3 setParent:self];
    [(NSMutableDictionary *)self->_animationPaths setObject:a3 forKey:a4];
    slide = self->_slide;
    if (slide)
    {
      [(MCSlide *)slide removeAnimationPathForKey:a4];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v12 = off_1A4DC0;
      if ((isKindOfClass & 1) == 0) {
        id v12 = off_1A4DC8;
      }
      id v13 = [(__objc2_class *)*v12 animationPathWithKey:a4];
      [(MCSlide *)self->_slide addAnimationPath:v13];
      [a3 setAnimationPath:v13];
    }
    id v27 = a3;
    id v14 = [(MPSlide *)self parentDocument];
    if (self->_mirrorToDuplicatePaths)
    {
      id v15 = v14;
      id v16 = self->_slide;
      if (v16)
      {
        uint64_t v17 = [(MCAssetVideo *)[(MCSlide *)v16 asset] slides];
        if (v17)
        {
          long long v18 = v17;
          if ([(NSSet *)v17 count] >= 2)
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v19 = [(NSSet *)v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v19)
            {
              id v20 = v19;
              uint64_t v21 = *(void *)v29;
              do
              {
                for (id i = 0; i != v20; id i = (char *)i + 1)
                {
                  if (*(void *)v29 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  long long v23 = *(MCSlide **)(*((void *)&v28 + 1) + 8 * i);
                  if (v23 != self->_slide)
                  {
                    long long v24 = +[MPUtilities slideForSlide:v23 inDocument:v15];
                    if (v24) {
                      BOOL v25 = v24 == self;
                    }
                    else {
                      BOOL v25 = 1;
                    }
                    if (!v25)
                    {
                      long long v26 = v24;
                      if ((objc_msgSend(objc_msgSend(-[MPSlide parent](v24, "parent"), "effectID"), "isEqualToString:", objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)-[MPSlide setAnimationPath:forKey:](v26, "setAnimationPath:forKey:", objc_msgSend(v27, "copy"), a4); {
                    }
                      }
                  }
                }
                id v20 = [(NSSet *)v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
              }
              while (v20);
            }
          }
        }
      }
    }
  }
  else
  {
    [(MPSlide *)self removeAnimationPathForKey:a4];
  }
}

- (void)removeAnimationPathForKey:(id)a3
{
  animationPaths = self->_animationPaths;
  if (animationPaths)
  {
    id v6 = -[NSMutableDictionary objectForKey:](animationPaths, "objectForKey:");
    id v7 = [(MPSlide *)self parentDocument];
    slide = self->_slide;
    if (slide)
    {
      [(MCSlide *)slide removeAnimationPathForKey:a3];
      [v6 setAnimationPath:0];
    }
    [v6 setParent:0];
    [(NSMutableDictionary *)self->_animationPaths removeObjectForKey:a3];
    if (self->_mirrorToDuplicatePaths)
    {
      double v9 = self->_slide;
      if (v9)
      {
        id v10 = [(MCAssetVideo *)[(MCSlide *)v9 asset] slides];
        if (v10)
        {
          id v11 = v10;
          if ([(NSSet *)v10 count] >= 2)
          {
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            id v12 = [(NSSet *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v12)
            {
              id v13 = v12;
              uint64_t v14 = *(void *)v21;
              do
              {
                for (id i = 0; i != v13; id i = (char *)i + 1)
                {
                  if (*(void *)v21 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  id v16 = *(MCSlide **)(*((void *)&v20 + 1) + 8 * i);
                  if (v16 != self->_slide)
                  {
                    uint64_t v17 = +[MPUtilities slideForSlide:v16 inDocument:v7];
                    if (v17) {
                      BOOL v18 = v17 == self;
                    }
                    else {
                      BOOL v18 = 1;
                    }
                    if (!v18)
                    {
                      id v19 = v17;
                      if ((objc_msgSend(objc_msgSend(-[MPSlide parent](v17, "parent"), "effectID"), "isEqualToString:", objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)-[MPSlide removeAnimationPathForKey:](v19, "removeAnimationPathForKey:", a3); {
                    }
                      }
                  }
                }
                id v13 = [(NSSet *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
              }
              while (v13);
            }
          }
        }
      }
    }
  }
}

- (double)showTime
{
  double result = self->_cachedShowTime;
  if (result < 0.0)
  {
    if ([(MPEffectSupport *)self->_parent effectTiming])
    {
      objc_msgSend(-[MPEffectSupport effectTiming](self->_parent, "effectTiming"), "showTimeForSlideAtIndex:", -[MPSlide liveIndex](self, "liveIndex"));
    }
    else
    {
      unint64_t v5 = 0xBFF0000000000000;
      double v6 = 0.0;
      unsigned int v4 = [(MPSlide *)self determineShowTime:&v6 showDuration:&v5];
      double result = 0.0;
      if (!v4) {
        return result;
      }
      double result = v6;
    }
    self->_cachedShowTime = result;
  }
  return result;
}

- (double)showDuration
{
  double cachedShowDuration = self->_cachedShowDuration;
  if (cachedShowDuration < 0.0)
  {
    if ([(MPEffectSupport *)self->_parent effectTiming])
    {
      objc_msgSend(-[MPEffectSupport effectTiming](self->_parent, "effectTiming"), "showDurationForSlideAtIndex:", -[MPSlide liveIndex](self, "liveIndex"));
      double cachedShowDuration = v4;
      self->_double cachedShowDuration = v4;
    }
    else
    {
      double v8 = -1.0;
      double v9 = 0.0;
      [(MPEffectSupport *)self->_parent fullDuration];
      double cachedShowDuration = v5;
      if ([(MPSlide *)self determineShowTime:&v9 showDuration:&v8])
      {
        if (v8 + v9 > cachedShowDuration || v8 < 0.0) {
          double cachedShowDuration = cachedShowDuration - v9;
        }
        else {
          double cachedShowDuration = v8;
        }
        self->_double cachedShowDuration = cachedShowDuration;
      }
    }
  }
  return cachedShowDuration;
}

- (double)showDisplayTime
{
  parent = self->_parent;
  if (!parent) {
    return 0.0;
  }
  id v4 = [(MPEffectSupport *)parent effectTiming];
  if (v4)
  {
    double v5 = v4;
    int64_t v6 = [(MPSlide *)self liveIndex];
    [v5 displayTimeForSlideAtIndex:v6];
  }
  else
  {
    id v7 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "imageInputInfoForEffectID:", -[MPEffectSupport effectID](self->_parent, "effectID"));
    unint64_t v8 = [(MPSlide *)self index];
    if (v8 >= (unint64_t)[v7 count]) {
      id v9 = [v7 lastObject];
    }
    else {
      id v9 = objc_msgSend(v7, "objectAtIndex:", -[MPSlide index](self, "index"));
    }
    id v10 = [v9 objectForKey:@"showDisplayTime"];
    if (v10)
    {
      [v10 doubleValue];
      double v12 = v11;
      double v21 = 0.0;
      objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:", -[MPEffectSupport effectID](self->_parent, "effectID"), 0, &v21, 0);
      if (objc_msgSend(-[MPEffectSupport effectID](self->_parent, "effectID"), "hasPrefix:", @"SlidingPanels"))
      {
        double v12 = v12 + -0.5;
        double v21 = v21 + 0.83333;
      }
      [(MPEffectSupport *)self->_parent mainDuration];
      double v14 = v12 * (v13 / v21);
      [(MPEffectSupport *)self->_parent phaseInDuration];
      double v16 = v14 + v15;
      objc_msgSend(-[MPEffectSupport parentContainer](self->_parent, "parentContainer"), "introTransitionDuration");
      if (v16 >= result) {
        return v16;
      }
    }
    else
    {
      [(MPSlide *)self showTime];
      double v18 = v17;
      [(MPSlide *)self showDuration];
      return v18 + v19 * 0.5;
    }
  }
  return result;
}

- (double)showDisplayStartTime
{
  double v13 = 0.0;
  id v3 = [(MPEffectSupport *)self->_parent effectTiming];
  if (v3 && (id v4 = v3, (objc_opt_respondsToSelector() & 1) != 0))
  {
    int64_t v5 = [(MPSlide *)self liveIndex];
    [v4 showTimeForSlideAtIndex:v5];
  }
  else if ([(MPSlide *)self determineShowTime:&v13 showDuration:&v12])
  {
    return v13;
  }
  else
  {
    id v7 = objc_msgSend(objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "imageInputInfoForEffectID:", -[MPEffectSupport effectID](self->_parent, "effectID")), "objectAtIndex:", -[MPSlide index](self, "index")), "objectForKey:", @"showDisplayStartTime");
    if (v7)
    {
      unint64_t v8 = v7;
      [(MPSlide *)self showDisplayTime];
      double v10 = v9;
      [v8 doubleValue];
      return fmax(v10 - v11, 0.0);
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (double)startTime
{
  double result = self->_startTime;
  if (result == -1.0)
  {
    id v4 = [(MPSlide *)self parentDocument];
    if (v4)
    {
      int64_t v5 = v4;
      int64_t v6 = [(MPSlide *)self path];
      [v5 startTimeForPath:v6];
    }
    else
    {
      id v7 = +[MPAssetManager sharedManager];
      unint64_t v8 = [(MPSlide *)self absolutePath];
      [v7 startTimeForAssetAtPath:v8];
    }
  }
  return result;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
  slide = self->_slide;
  if (a3 == -1.0 || slide == 0)
  {
    if (a3 == -1.0 && slide != 0) {
      [(MCSlide *)slide undefineStartTime];
    }
  }
  else
  {
    -[MCSlide setStartTime:](slide, "setStartTime:");
  }
}

- (double)duration
{
  double result = self->_duration;
  if (result == -1.0)
  {
    id v4 = [(MPSlide *)self parentDocument];
    if (v4) {
      objc_msgSend(v4, "stopTimeForPath:", -[MPSlide path](self, "path"));
    }
    else {
      objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "durationForAssetAtPath:", -[MPSlide absolutePath](self, "absolutePath"));
    }
    double v6 = v5;
    [(MPSlide *)self startTime];
    return v6 - v7;
  }
  return result;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  slide = self->_slide;
  if (a3 == -1.0 || slide == 0)
  {
    if (a3 == -1.0 && slide != 0) {
      [(MCSlide *)slide undefineDuration];
    }
  }
  else
  {
    -[MCSlide setDuration:](slide, "setDuration:");
  }
}

- (double)audioVolume
{
  double result = self->_audioVolume;
  if (result == -1.0) {
    return 1.0;
  }
  return result;
}

- (void)setAudioVolume:(double)a3
{
  self->_audioVolume = a3;
  slide = self->_slide;
  if (slide)
  {
    *(float *)&a3 = a3;
    [(MCSlide *)slide setAudioVolume:a3];
  }
}

- (double)audioFadeInDuration
{
  return self->_audioFadeInDuration;
}

- (void)setAudioFadeInDuration:(double)a3
{
  self->_audioFadeInDuration = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setAudioFadeInDuration:](slide, "setAudioFadeInDuration:");
  }
}

- (double)audioFadeOutDuration
{
  return self->_audioFadeOutDuration;
}

- (void)setAudioFadeOutDuration:(double)a3
{
  self->_audioFadeOutDuration = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setAudioFadeOutDuration:](slide, "setAudioFadeOutDuration:");
  }
}

- (double)audioDuckInDuration
{
  return self->_audioDuckInDuration;
}

- (void)setAudioDuckInDuration:(double)a3
{
  self->_audioDuckInDuration = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setAudioDuckInDuration:](slide, "setAudioDuckInDuration:");
  }
}

- (double)audioDuckOutDuration
{
  return self->_audioDuckOutDuration;
}

- (void)setAudioDuckOutDuration:(double)a3
{
  self->_audioDuckOutDuration = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setAudioDuckOutDuration:](slide, "setAudioDuckOutDuration:");
  }
}

- (double)audioDuckLevel
{
  return self->_audioDuckLevel;
}

- (void)setAudioDuckLevel:(double)a3
{
  self->_audioDuckLevel = a3;
  slide = self->_slide;
  if (slide)
  {
    *(float *)&a3 = a3;
    [(MCSlide *)slide setAudioDuckLevel:a3];
  }
}

- (NSString)sizingMode
{
  double result = self->_sizingMode;
  if (result) {
    return result;
  }
  if (!self->_parent) {
    return 0;
  }
  id v4 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "imageInputInfoForEffectID:", -[MPEffectSupport effectID](self->_parent, "effectID"));
  BOOL isSecondary = self->_isSecondary;
  unint64_t v6 = [(MPSlide *)self index];
  if (isSecondary) {
    v6 += (unint64_t)[(MPEffectSupport *)self->_parent maxNumberOfSlides];
  }
  if (v6 < (unint64_t)[v4 count])
  {
    double result = (NSString *)[v4 objectAtIndex:v6];
    if (!result) {
      return result;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSlidesForEffectID:", -[MPEffectSupport effectID](self->_parent, "effectID")) != (id)0x7FFFFFFFFFFFFFFFLL)return 0; {
  double result = (NSString *)[v4 lastObject];
  }
  if (!result) {
    return result;
  }
LABEL_10:
  return (NSString *)[(NSString *)result objectForKey:@"kenBurnsType"];
}

- (void)setSizingMode:(id)a3
{
  sizingMode = self->_sizingMode;
  if (sizingMode)
  {

    self->_sizingMode = 0;
  }
  self->_sizingMode = (NSString *)[a3 copy];
  frame = self->_frame;
  if (frame) {
    [(MPFrame *)frame setFrameAttribute:a3 forKey:@"sizingMode"];
  }
  slide = self->_slide;
  if (slide
    && ([(MCSlide *)slide kenBurnsType]
     || ![(NSString *)self->_sizingMode isEqualToString:@"Crop to Fit"]))
  {
    [(MCSlide *)self->_slide setKenBurnsType:a3];
  }
  if (self->_mirrorToDuplicatePaths)
  {
    unint64_t v8 = self->_slide;
    if (v8)
    {
      double v9 = [(MCAssetVideo *)[(MCSlide *)v8 asset] slides];
      if (v9)
      {
        double v10 = v9;
        if ([(NSSet *)v9 count] >= 2)
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = [(NSSet *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (id i = 0; i != v12; id i = (char *)i + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                double v15 = *(MCSlide **)(*((void *)&v19 + 1) + 8 * i);
                if (v15 != self->_slide)
                {
                  double v16 = +[MPUtilities slideForSlide:v15 inDocument:[(MPSlide *)self parentDocument]];
                  if (v16) {
                    BOOL v17 = v16 == self;
                  }
                  else {
                    BOOL v17 = 1;
                  }
                  if (!v17)
                  {
                    double v18 = v16;
                    if ((objc_msgSend(objc_msgSend(-[MPSlide parent](v16, "parent"), "effectID"), "isEqualToString:", objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)-[MPSlide setSizingMode:](v18, "setSizingMode:", a3); {
                  }
                    }
                }
              }
              id v12 = [(NSSet *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
            }
            while (v12);
          }
        }
      }
    }
  }
}

- (int64_t)index
{
  parent = self->_parent;
  if (!parent) {
    return -1;
  }
  if (self->_isSecondary && !self->_slide) {
    goto LABEL_7;
  }
  if (!objc_msgSend(-[MPSlide parentEffect](self, "parentEffect"), "isLive") || !self->_isSecondary)
  {
    if (!self->_slide || objc_msgSend(-[MPSlide parentEffect](self, "parentEffect"), "isLive"))
    {
      id v4 = [(MPEffectSupport *)self->_parent slides];
      goto LABEL_13;
    }
    BOOL isSecondary = self->_isSecondary;
    int64_t v5 = [(MCSlide *)self->_slide index];
    if (isSecondary) {
      v5 -= (uint64_t)objc_msgSend(-[MPEffectSupport slides](self->_parent, "slides"), "count");
    }
    return v5;
  }
  parent = self->_parent;
LABEL_7:
  id v4 = [(MPEffectSupport *)parent secondarySlides];
LABEL_13:
  return (int64_t)[v4 indexOfObject:self];
}

- (int64_t)liveIndex
{
  parent = self->_parent;
  if (!parent) {
    return -1;
  }
  slide = self->_slide;
  if (self->_isSecondary)
  {
    if (slide)
    {
      unint64_t v5 = [(MCSlide *)self->_slide index];
      return v5 - (void)objc_msgSend(-[MPEffectSupport slides](self->_parent, "slides"), "count");
    }
    id v8 = [(MPEffectSupport *)parent secondarySlides];
    goto LABEL_12;
  }
  if (!slide)
  {
    id v8 = [(MPEffectSupport *)parent slides];
LABEL_12:
    return (int64_t)[v8 indexOfObject:self];
  }
  double v7 = self->_slide;
  return [(MCSlide *)v7 index];
}

- (double)aspectRatio
{
  return 9.22337204e18;
}

- (id)parentEffect
{
  return self->_parent;
}

- (id)parent
{
  return self->_parent;
}

- (id)parentSubtitleEffect
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = [(MPSlide *)self nearestLayer];
  id v4 = [(MPEffectSupport *)self->_parent parentContainer];
  unint64_t v5 = (char *)objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "subtitleOrderForStyleID:", objc_msgSend(objc_msgSend(v3, "parentDocument"), "styleID"));
  if (v5)
  {
    if (v5 == (unsigned char *)&dword_0 + 2) {
      uint64_t v6 = -1;
    }
    else {
      uint64_t v6 = 1;
    }
    id v4 = objc_msgSend(v3, "objectInEffectContainersAtIndex:", (char *)objc_msgSend(v4, "index") + v6);
  }
  id v7 = [v4 effects];
  return [v7 lastObject];
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setCenter:](slide, "setCenter:");
  }
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setScale:](slide, "setScale:");
  }
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
  slide = self->_slide;
  if (slide) {
    -[MCSlide setRotation:](slide, "setRotation:");
  }
}

- (BOOL)isSecondary
{
  return self->_isSecondary;
}

- (id)userInfoAttributeForKey:(id)a3
{
  id result = self->_attributes;
  if (result) {
    return [result objectForKey:a3];
  }
  return result;
}

- (void)setUserInfoAttribute:(id)a3 forKey:(id)a4
{
  attributes = self->_attributes;
  if (!attributes)
  {
    attributes = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_attributes = attributes;
  }
  [(NSMutableDictionary *)attributes setObject:a3 forKey:a4];
}

- (BOOL)hasMovie
{
  unint64_t mediaType = self->_mediaType;
  if (mediaType != -1) {
    return mediaType == 3;
  }
  slide = self->_slide;
  if ((!slide || ![(MCSlide *)slide asset]) && !self->_path) {
    return 0;
  }
  id v6 = [(MPSlide *)self parentDocument];
  if (v6) {
    unsigned int v7 = objc_msgSend(v6, "isMovieAtPath:", -[MPSlide path](self, "path"));
  }
  else {
    unsigned int v7 = +[MPFileValidationManager validateFilesForMovies:extensionsOnly:](MPFileValidationManager, "validateFilesForMovies:extensionsOnly:", +[NSArray arrayWithObject:[(MPSlide *)self absolutePath]], 0);
  }
  BOOL v3 = v7;
  if (v7) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 2;
  }
  [(MPSlide *)self setMediaType:v8];
  return v3;
}

- (BOOL)needsStyleUpdateOnSlideChange
{
  id v3 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "imageInputInfoForEffectID:", -[MPEffectSupport effectID](self->_parent, "effectID"));
  BOOL isSecondary = self->_isSecondary;
  unint64_t v5 = [(MPSlide *)self index];
  if (isSecondary) {
    v5 += (unint64_t)[(MPEffectSupport *)self->_parent maxNumberOfSlides];
  }
  if (v5 >= (unint64_t)[v3 count])
  {
    if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSlidesForEffectID:", -[MPEffectSupport effectID](self->_parent, "effectID")) == (id)0x7FFFFFFFFFFFFFFFLL)id v6 = objc_msgSend(v3, "lastObject"); {
    else
    }
      id v6 = 0;
  }
  else
  {
    id v6 = [v3 objectAtIndex:v5];
  }
  id v7 = [v6 objectForKey:@"panoType"];
  if (v7) {
    BOOL v8 = [v7 integerValue] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = [(MPSlide *)self parentDocument];
  id v10 = [v9 styleID];
  if (v9) {
    return objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "needsStyleUpdateOnSlideChangeForStyleID:", v10) & v8;
  }
  else {
    return 0;
  }
}

- (BOOL)needsTimingUpdateOnSlideChange
{
  id v3 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "imageInputInfoForEffectID:", -[MPEffectSupport effectID](self->_parent, "effectID"));
  BOOL isSecondary = self->_isSecondary;
  unint64_t v5 = [(MPSlide *)self index];
  if (isSecondary) {
    v5 += (unint64_t)[(MPEffectSupport *)self->_parent maxNumberOfSlides];
  }
  if (v5 >= (unint64_t)[v3 count])
  {
    if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSlidesForEffectID:", -[MPEffectSupport effectID](self->_parent, "effectID")) == (id)0x7FFFFFFFFFFFFFFFLL)id v6 = objc_msgSend(v3, "lastObject"); {
    else
    }
      id v6 = 0;
  }
  else
  {
    id v6 = [v3 objectAtIndex:v5];
  }
  id v7 = [v6 objectForKey:@"panoType"];
  if (v7) {
    BOOL v8 = [v7 integerValue] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = [(MPSlide *)self parentDocument];
  id v10 = [v9 styleID];
  if (v9) {
    return objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "needsTimingUpdateOnSlideChangeForStyleID:", v10) & v8;
  }
  else {
    return 0;
  }
}

- (double)originalAspectRatio
{
  double width = self->_cachedSize.width;
  double result = 0.0;
  if (width != 0.0)
  {
    double height = self->_cachedSize.height;
    if (height != 0.0) {
      return width / height;
    }
  }
  return result;
}

- (id)slide
{
  return self->_slide;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  id v3 = +[NSString stringWithFormat:@"\n%@\n", [(MPSlide *)self description]];
  frame = self->_frame;
  if (frame) {
    id v3 = [(NSString *)v3 stringByAppendingFormat:@"%@\n", [(MPFrame *)frame fullDebugLog]];
  }
  unint64_t v5 = [(NSString *)v3 stringByAppendingFormat:@"=============================== Slide %d Filters =============================\n", [(MPSlide *)self index]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  filters = self->_filters;
  id v7 = [(NSMutableArray *)filters countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(filters);
        }
        unint64_t v5 = -[NSString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @"%@\n", [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) fullDebugLog]);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)filters countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  return v5;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_unint64_t mediaType = a3;
}

- (double)maxDuration
{
  return 0.0;
}

- (BOOL)canZoom
{
  id v3 = [(MPSlide *)self parentDocument];
  id v4 = [v3 styleID];
  if (([v4 isEqualToString:@"KenBurns"] & 1) != 0
    || ([v4 isEqualToString:@"Classic"] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return ![(MPSlide *)self isPanoramaInDocument:v3];
  }
}

- (id)action
{
  id v3 = objc_msgSend(-[MPSlide parent](self, "parent"), "container");
  id v4 = +[NSString stringWithFormat:@"slide%d", [(MPSlide *)self index]];
  return [v3 actionForKey:v4];
}

- (void)resetCachedTimes
{
  *(int64x2_t *)&self->_cachedShowTime = vdupq_n_s64(0xC059000000000000);
}

- (void)setMirrorToDuplicatePaths:(BOOL)a3
{
  self->_mirrorToDuplicatePaths = a3;
}

- (void)setIsSecondary:(BOOL)a3
{
  self->_BOOL isSecondary = a3;
}

- (void)copyVars:(id)a3
{
  self->_startTime = *((double *)a3 + 9);
  self->_duration = *((double *)a3 + 10);
  self->_audioVolume = *((double *)a3 + 20);
  self->_audioFadeInDuration = *((double *)a3 + 11);
  self->_audioFadeOutDuration = *((double *)a3 + 12);
  self->_audioDuckInDuration = *((double *)a3 + 13);
  self->_audioDuckOutDuration = *((double *)a3 + 14);
  self->_audioDuckLevel = *((double *)a3 + 15);
  sizingMode = self->_sizingMode;
  if (sizingMode)
  {

    self->_sizingMode = 0;
  }
  self->_sizingMode = (NSString *)[*((id *)a3 + 21) copy];
}

- (void)copyFrame:(id)a3
{
  frame = self->_frame;
  if (frame)
  {

    self->_frame = 0;
  }
  id v6 = [a3 copy];
  [(MPSlide *)self setFrame:v6];
}

- (void)copyLayerGroup:(id)a3
{
  layerGroup = self->_layerGroup;
  if (layerGroup)
  {

    self->_layerGroup = 0;
  }
  id v6 = [a3 copy];
  [(MPSlide *)self setLayerGroup:v6];
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
    [(MPSlide *)self addFilters:v5];
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
        for (id i = 0; i != v6; id i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          id v10 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v9), "copy");
          [(MPSlide *)self setAnimationPath:v10 forKey:v9];
        }
        id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)cleanup
{
  [(MPSlide *)self removeAllFilters];
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
        [(MPSlide *)self removeAnimationPathForKey:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)parentDocument
{
  return [(MPEffectSupport *)self->_parent parentDocument];
}

- (id)nearestLayer
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return self->_parent;
  }
  id v3 = objc_msgSend(-[MPSlide parent](self, "parent"), "parentContainer");
  return [v3 parentLayer];
}

- (BOOL)determineShowTime:(double *)a3 showDuration:(double *)a4
{
  if ([(MPSlide *)self index] == -1 || !self->_parent)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    id v7 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "showTimeScriptForEffectID:atSlideIndex:", -[MPEffectSupport effectID](self->_parent, "effectID"), -[MPSlide index](self, "index"));
    if (v7)
    {
      id v8 = v7;
      id v9 = objc_alloc((Class)NSDictionary);
      [(MPEffectSupport *)self->_parent phaseInDuration];
      long long v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MPEffectSupport *)self->_parent mainDuration];
      long long v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MPEffectSupport *)self->_parent phaseOutDuration];
      long long v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MPEffectSupport *)self->_parent fullDuration];
      id v13 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, @"phaseInDuration", v11, @"mainDuration", v12, @"phaseOutDuration", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"fullDuration", 0);
      long long v14 = +[MPUtilities executeScript:v8 withHeader:v13 andAttributes:[(MPEffectSupport *)self->_parent effectAttributes]];

      if (v14)
      {
        CGSize v15 = CGSizeFromString(v14);
        if (a3) {
          *a3 = v15.width;
        }
        if (a4) {
          *a4 = v15.height;
        }
      }
      LOBYTE(v7) = 1;
    }
  }
  return (char)v7;
}

- (void)setSlide:(id)a3
{
  slide = self->_slide;
  if (slide)
  {

    self->_slide = 0;
  }
  uint64_t v6 = (MCSlide *)a3;
  self->_slide = v6;
  if (v6)
  {
    frame = self->_frame;
    if (frame)
    {
      [(MCSlide *)self->_slide setFrameID:[(MPFrame *)frame frameID]];
      [(MCSlide *)self->_slide setFrameAttribute:[(MPFrame *)self->_frame presetID] forKey:@"PresetID"];
      [(MCSlide *)self->_slide setFrameAttribute:[(MPFrame *)self->_frame frameAttributes] forKey:@"specificAttributes"];
    }
    if (self->_sizingMode
      && ([(MCSlide *)self->_slide kenBurnsType]
       || ![(NSString *)self->_sizingMode isEqualToString:@"Crop to Fit"]))
    {
      [(MCSlide *)self->_slide setKenBurnsType:self->_sizingMode];
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    filters = self->_filters;
    id v9 = [(NSMutableArray *)filters countByEnumeratingWithState:&v84 objects:v94 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v85;
      do
      {
        for (id i = 0; i != v10; id i = (char *)i + 1)
        {
          if (*(void *)v85 != v11) {
            objc_enumerationMutation(filters);
          }
          objc_msgSend(*(id *)(*((void *)&v84 + 1) + 8 * i), "setFilter:", -[MCSlide addFilterWithFilterID:](self->_slide, "addFilterWithFilterID:", objc_msgSend(*(id *)(*((void *)&v84 + 1) + 8 * i), "filterID")));
        }
        id v10 = [(NSMutableArray *)filters countByEnumeratingWithState:&v84 objects:v94 count:16];
      }
      while (v10);
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    animationPaths = self->_animationPaths;
    id v14 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v80 objects:v93 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v81;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v81 != v16) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v18 = *(void *)(*((void *)&v80 + 1) + 8 * (void)j);
          id v19 = [(NSMutableDictionary *)self->_animationPaths objectForKey:v18];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v20 = off_1A4DC0;
          }
          else {
            long long v20 = off_1A4DC8;
          }
          id v21 = [(__objc2_class *)*v20 animationPathWithKey:v18];
          [(MCSlide *)self->_slide addAnimationPath:v21];
          [v19 setAnimationPath:v21];
        }
        id v15 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v80 objects:v93 count:16];
      }
      while (v15);
    }
    if (self->_cachedSize.width == CGSizeZero.width && self->_cachedSize.height == CGSizeZero.height)
    {
      objc_msgSend(-[MPSlide parentDocument](self, "parentDocument"), "resolutionForPath:", -[MPSlide path](self, "path"));
      self->_cachedSize.double width = v23;
      self->_cachedSize.double height = v24;
    }
    [(MPSlide *)self center];
    -[MCSlide setCenter:](self->_slide, "setCenter:");
    [(MPSlide *)self rotation];
    -[MCSlide setRotation:](self->_slide, "setRotation:");
    [(MPSlide *)self scale];
    -[MCSlide setScale:](self->_slide, "setScale:");
    if ([(MPSlide *)self hasMovie])
    {
      if (self->_path)
      {
        if (self->_startTime != -1.0) {
          -[MCSlide setStartTime:](self->_slide, "setStartTime:");
        }
        if (self->_duration != -1.0) {
          -[MCSlide setDuration:](self->_slide, "setDuration:");
        }
      }
      double audioVolume = self->_audioVolume;
      if (audioVolume != -1.0)
      {
        *(float *)&double audioVolume = audioVolume;
        [(MCSlide *)self->_slide setAudioVolume:audioVolume];
      }
      [(MPSlide *)self audioFadeInDuration];
      -[MCSlide setAudioFadeInDuration:](self->_slide, "setAudioFadeInDuration:");
      [(MPSlide *)self audioFadeOutDuration];
      -[MCSlide setAudioFadeOutDuration:](self->_slide, "setAudioFadeOutDuration:");
      [(MPSlide *)self audioDuckInDuration];
      -[MCSlide setAudioDuckInDuration:](self->_slide, "setAudioDuckInDuration:");
      [(MPSlide *)self audioDuckOutDuration];
      -[MCSlide setAudioDuckOutDuration:](self->_slide, "setAudioDuckOutDuration:");
      [(MPSlide *)self audioDuckLevel];
      *(float *)&double v26 = v26;
      [(MCSlide *)self->_slide setAudioDuckLevel:v26];
    }
    layerGroup = self->_layerGroup;
    if (layerGroup) {
      id v28 = +[MPUtilities createPlugInSlide:self->_slide forLayer:layerGroup inDocument:[(MPSlide *)self parentDocument]];
    }
    else {
      id v28 = 0;
    }
    [(MCSlide *)self->_slide setPlug:v28];
    if (self->_mirrorToDuplicatePaths)
    {
      long long v39 = self->_slide;
      if (v39)
      {
        obj = [(MCAssetVideo *)[(MCSlide *)v39 asset] slides];
        if (obj)
        {
          if ([(NSSet *)obj count] >= 2)
          {
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v40 = [(NSSet *)obj countByEnumeratingWithState:&v76 objects:v92 count:16];
            if (v40)
            {
              id v41 = v40;
              uint64_t v42 = *(void *)v77;
              do
              {
                for (k = 0; k != v41; k = (char *)k + 1)
                {
                  if (*(void *)v77 != v42) {
                    objc_enumerationMutation(obj);
                  }
                  long long v44 = *(MCSlide **)(*((void *)&v76 + 1) + 8 * (void)k);
                  if (v44 != self->_slide)
                  {
                    long long v45 = +[MPUtilities slideForSlide:v44 inDocument:[(MPSlide *)self parentDocument]];
                    if (v45 && v45 != self)
                    {
                      long long v47 = v45;
                      if ((objc_msgSend(objc_msgSend(-[MPSlide parent](v45, "parent"), "effectID"), "isEqualToString:", objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)
                      {
                        id v48 = +[NSMutableArray array];
                        long long v72 = 0u;
                        long long v73 = 0u;
                        long long v74 = 0u;
                        long long v75 = 0u;
                        long long v49 = self->_filters;
                        id v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v72 objects:v91 count:16];
                        if (v50)
                        {
                          id v51 = v50;
                          uint64_t v52 = *(void *)v73;
                          do
                          {
                            for (m = 0; m != v51; m = (char *)m + 1)
                            {
                              if (*(void *)v73 != v52) {
                                objc_enumerationMutation(v49);
                              }
                              objc_msgSend(v48, "addObject:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * (void)m), "copy"));
                            }
                            id v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v72 objects:v91 count:16];
                          }
                          while (v51);
                        }
                        [(MPSlide *)v47 removeAllFilters];
                        [(MPSlide *)v47 addFilters:v48];
                        [(MPSlide *)v47 setSizingMode:self->_sizingMode];
                        long long v70 = 0u;
                        long long v71 = 0u;
                        long long v68 = 0u;
                        long long v69 = 0u;
                        v54 = self->_animationPaths;
                        id v55 = [(NSMutableDictionary *)v54 countByEnumeratingWithState:&v68 objects:v90 count:16];
                        if (v55)
                        {
                          id v56 = v55;
                          uint64_t v57 = *(void *)v69;
                          do
                          {
                            for (n = 0; n != v56; n = (char *)n + 1)
                            {
                              if (*(void *)v69 != v57) {
                                objc_enumerationMutation(v54);
                              }
                              -[MPSlide setAnimationPath:forKey:](v47, "setAnimationPath:forKey:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", *(void *)(*((void *)&v68 + 1) + 8 * (void)n)), "copy"), *(void *)(*((void *)&v68 + 1) + 8 * (void)n));
                            }
                            id v56 = [(NSMutableDictionary *)v54 countByEnumeratingWithState:&v68 objects:v90 count:16];
                          }
                          while (v56);
                        }
                      }
                    }
                  }
                }
                id v41 = [(NSSet *)obj countByEnumeratingWithState:&v76 objects:v92 count:16];
              }
              while (v41);
            }
          }
        }
      }
    }
  }
  else
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v29 = self->_filters;
    id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v64 objects:v89 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v65;
      do
      {
        for (iid i = 0; ii != v31; iid i = (char *)ii + 1)
        {
          if (*(void *)v65 != v32) {
            objc_enumerationMutation(v29);
          }
          [*(id *)(*((void *)&v64 + 1) + 8 * (void)ii) setFilter:0];
        }
        id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v64 objects:v89 count:16];
      }
      while (v31);
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v34 = self->_animationPaths;
    id v35 = [(NSMutableDictionary *)v34 countByEnumeratingWithState:&v60 objects:v88 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v61;
      do
      {
        for (jj = 0; jj != v36; jj = (char *)jj + 1)
        {
          if (*(void *)v61 != v37) {
            objc_enumerationMutation(v34);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", *(void *)(*((void *)&v60 + 1) + 8 * (void)jj)), "setAnimationPath:", 0);
        }
        id v36 = [(NSMutableDictionary *)v34 countByEnumeratingWithState:&v60 objects:v88 count:16];
      }
      while (v36);
    }
  }
}

- (void)duplicateAnimationPaths
{
  if (self->_mirrorToDuplicatePaths)
  {
    slide = self->_slide;
    if (slide)
    {
      obj = [(MCAssetVideo *)[(MCSlide *)slide asset] slides];
      if (obj)
      {
        if ([(NSSet *)obj count] >= 2)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v4 = [(NSSet *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v4)
          {
            id v5 = v4;
            uint64_t v6 = *(void *)v23;
            do
            {
              for (id i = 0; i != v5; id i = (char *)i + 1)
              {
                if (*(void *)v23 != v6) {
                  objc_enumerationMutation(obj);
                }
                id v8 = *(MCSlide **)(*((void *)&v22 + 1) + 8 * i);
                if (v8 != self->_slide)
                {
                  id v9 = +[MPUtilities slideForSlide:v8 inDocument:[(MPSlide *)self parentDocument]];
                  if (v9 && v9 != self)
                  {
                    uint64_t v11 = v9;
                    if ((objc_msgSend(objc_msgSend(-[MPSlide parent](v9, "parent"), "effectID"), "isEqualToString:", objc_msgSend(-[MPSlide parent](self, "parent"), "effectID")) & 1) == 0)
                    {
                      long long v20 = 0u;
                      long long v21 = 0u;
                      long long v18 = 0u;
                      long long v19 = 0u;
                      animationPaths = self->_animationPaths;
                      id v13 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v18 objects:v26 count:16];
                      if (v13)
                      {
                        id v14 = v13;
                        uint64_t v15 = *(void *)v19;
                        do
                        {
                          for (j = 0; j != v14; j = (char *)j + 1)
                          {
                            if (*(void *)v19 != v15) {
                              objc_enumerationMutation(animationPaths);
                            }
                            -[MPSlide setAnimationPath:forKey:](v11, "setAnimationPath:forKey:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * (void)j)), "copy"), *(void *)(*((void *)&v18 + 1) + 8 * (void)j));
                          }
                          id v14 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v18 objects:v26 count:16];
                        }
                        while (v14);
                      }
                    }
                  }
                }
              }
              id v5 = [(NSSet *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
            }
            while (v5);
          }
        }
      }
    }
  }
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parent) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A slide may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parent = (MPEffectSupport *)a3;
  [(MPSlide *)self resetCachedTimes];
}

- (BOOL)isPanoramaInDocument:(id)a3
{
  objc_msgSend(a3, "resolutionForPath:", -[MPSlide path](self, "path"));
  double v5 = v3 / v4;
  return v5 > 2.0 || v5 < 0.5;
}

- (int64_t)countOfFilter
{
  return (int64_t)[(NSMutableArray *)self->_filters count];
}

- (id)objectInFilterAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_filters objectAtIndex:a3];
}

- (void)insertObject:(id)a3 inFilterAtIndex:(int64_t)a4
{
  id v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  [(MPSlide *)self insertFilters:v6 atIndex:a4];
}

- (void)removeObjectFromFilterAtIndex:(int64_t)a3
{
  id v4 = [objc_alloc((Class)NSIndexSet) initWithIndex:a3];
  [(MPSlide *)self removeFiltersAtIndices:v4];
}

- (void)replaceObjectInFilterAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPSlide *)self removeFiltersAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  id v7 = +[NSArray arrayWithObject:a4];
  [(MPSlide *)self insertFilters:v7 atIndex:a3];
}

- (id)scriptingAnimations
{
  id v20 = +[NSMutableDictionary dictionary];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_animationPaths;
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
        double v3 = *(void **)(*((void *)&v29 + 1) + 8 * v2);
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
              if ([v3 isEqualToString:@"center"])
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
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (id i = 0; i != v5; id i = (char *)i + 1)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(a3);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v8 = [a3 objectForKey:v7];
        id v9 = [v8 objectForKey:@"times"];
        id v10 = [v8 objectForKey:@"values"];
        id v11 = +[MPAnimationPathKeyframed animationPath];
        long long v12 = (char *)[v9 count];
        if ((uint64_t)v12 >= 1)
        {
          double v13 = v12;
          for (j = 0; j != v13; ++j)
          {
            if ([v7 isEqualToString:@"center"])
            {
              int v23 = 0;
              objc_msgSend(objc_msgSend(v10, "objectAtIndex:", j), "getBytes:length:", &v23, 4);
              double v15 = (double)(__int16)v23;
              double v16 = (double)SHIWORD(v23);
              objc_msgSend(objc_msgSend(v9, "objectAtIndex:", j), "doubleValue");
              objc_msgSend(v11, "createKeyframeWithPoint:atTime:", v15, v16, v17);
            }
            else
            {
              objc_msgSend(objc_msgSend(v10, "objectAtIndex:", j), "doubleValue");
              double v19 = v18;
              objc_msgSend(objc_msgSend(v9, "objectAtIndex:", j), "doubleValue");
              [v11 createKeyframeWithScalar:v19 atTime:v20];
            }
          }
        }
        [(MPSlide *)self setAnimationPath:v11 forKey:v7];
      }
      id v5 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
}

- (id)scriptingFrame
{
  if (self->_frame)
  {
    id v3 = +[NSMutableDictionary dictionary];
    objc_msgSend(v3, "setObject:forKey:", -[MPFrame frameID](self->_frame, "frameID"), @"frameID");
    objc_msgSend(v3, "setObject:forKey:", -[MPFrame presetID](self->_frame, "presetID"), @"presetID");
    return v3;
  }
  else
  {
    return +[NSDictionary dictionary];
  }
}

- (void)setScriptingFrame:(id)a3
{
  if ([a3 objectForKey:@"frameID"])
  {
    if (objc_msgSend(objc_msgSend(a3, "objectForKey:", @"frameID"), "isEqualToString:", &stru_1AC850))
    {
      id v5 = 0;
    }
    else
    {
      id v5 = +[MPFrame frameWithFrameID:](MPFrame, "frameWithFrameID:", [a3 objectForKey:@"frameID"]);
      if ([a3 objectForKey:@"presetID"]) {
        -[MPFrame setPresetID:](v5, "setPresetID:", [a3 objectForKey:@"presetID"]);
      }
    }
    [(MPSlide *)self setFrame:v5];
  }
}

@end