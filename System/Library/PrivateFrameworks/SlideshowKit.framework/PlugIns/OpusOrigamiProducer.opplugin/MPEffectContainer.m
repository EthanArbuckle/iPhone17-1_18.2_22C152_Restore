@interface MPEffectContainer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)effectContainer;
- (BOOL)isTransitionConnected;
- (BOOL)shouldBeParallelizer;
- (CGColor)backgroundCGColor;
- (MPEffectContainer)init;
- (MPTransition)transition;
- (double)duration;
- (double)findMinDuration;
- (double)introTransitionDuration;
- (double)outroTransitionDuration;
- (double)startTime;
- (id)audioPlaylist;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effects;
- (id)filters;
- (id)fullDebugLog;
- (id)nearestLayerGroup;
- (id)objectID;
- (id)objectInEffectsAtIndex:(int64_t)a3;
- (id)objectInFiltersAtIndex:(int64_t)a3;
- (id)parentDocument;
- (id)parentLayer;
- (id)plug;
- (id)plugID;
- (id)scriptingTransition;
- (id)userInfoAttributeForKey:(id)a3;
- (id)uuid;
- (int64_t)countOfEffects;
- (int64_t)countOfFilters;
- (int64_t)index;
- (int64_t)slideCount;
- (int64_t)textCount;
- (void)addEffect:(id)a3;
- (void)addEffects:(id)a3;
- (void)addFilter:(id)a3;
- (void)addFilters:(id)a3;
- (void)adjustPhasesWithDuration:(double)a3;
- (void)calculateDurationToSmallest:(BOOL)a3;
- (void)cleanup;
- (void)convertFromEffectContainerToParallelizer;
- (void)convertFromParallelizerToEffectContainer;
- (void)copyAudioPlaylist:(id)a3;
- (void)copyEffects:(id)a3;
- (void)copyFilters:(id)a3;
- (void)copyTransition:(id)a3;
- (void)copyVars:(id)a3;
- (void)dealloc;
- (void)disconnectTransition;
- (void)dump;
- (void)insertEffects:(id)a3 atIndex:(int64_t)a4;
- (void)insertFilters:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inEffectsAtIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inFiltersAtIndex:(int64_t)a4;
- (void)moveEffectsFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)moveFiltersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)reconnectTransition;
- (void)removeAllEffects;
- (void)removeAllFilters;
- (void)removeEffectsAtIndices:(id)a3;
- (void)removeFiltersAtIndices:(id)a3;
- (void)removeObjectFromEffectsAtIndex:(int64_t)a3;
- (void)removeObjectFromFiltersAtIndex:(int64_t)a3;
- (void)replaceObjectInEffectsAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)setAudioPlaylist:(id)a3;
- (void)setBackgroundCGColor:(CGColor *)a3;
- (void)setBackgroundColorString:(id)a3;
- (void)setContainerEffect:(id)a3;
- (void)setContainerParallelizer:(id)a3;
- (void)setContainerPlug:(id)a3;
- (void)setDuration:(double)a3;
- (void)setParentLayer:(id)a3;
- (void)setScriptingTransition:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTransition:(id)a3;
- (void)setUserInfoAttribute:(id)a3 forKey:(id)a4;
@end

@implementation MPEffectContainer

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return [a3 isEqualToString:@"effects"] ^ 1;
}

+ (id)effectContainer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MPEffectContainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPEffectContainer;
  result = [(MPEffectContainer *)&v3 init];
  if (result)
  {
    result->_transitionDisconnected = 0;
    result->_audioPlaylist = 0;
    *(_OWORD *)&result->_containerPlug = 0u;
    *(_OWORD *)&result->_effects = 0u;
    *(_OWORD *)&result->_attributes = 0u;
    result->_backgroundColor = 0;
    result->_uuid = 0;
    result->_startTime = -1.0;
    result->_duration = 0.0;
  }
  return result;
}

- (id)description
{
  objc_super v3 = +[NSString stringWithFormat:@"======================== Effect Container %d Description =======================\n", [(MPEffectContainer *)self index]];
  effects = self->_effects;
  if (effects) {
    effects = (NSMutableArray *)[(NSMutableArray *)effects count];
  }
  v5 = [(NSString *)v3 stringByAppendingFormat:@"\t               Effect Count: %d\n", effects];
  filters = self->_filters;
  if (filters) {
    filters = (NSMutableArray *)[(NSMutableArray *)filters count];
  }
  v7 = [(NSString *)v5 stringByAppendingFormat:@"\t               Filter Count: %d\n", filters];
  [(MPEffectContainer *)self duration];
  v9 = [(NSString *)v7 stringByAppendingFormat:@"\t                   Duration: %f\n", v8];
  if ([(MPEffectContainer *)self transition]) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  v11 = [(NSString *)v9 stringByAppendingFormat:@"\t             Has Transition: %@\n", v10];
  if (self->_containerPlug) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  v13 = [(NSString *)v11 stringByAppendingFormat:@"\t         Has Container Plug: %@\n", v12];
  if (self->_containerParallelizer) {
    CFStringRef v14 = @"YES";
  }
  else {
    CFStringRef v14 = @"NO";
  }
  return [(NSString *)v13 stringByAppendingFormat:@"\t Has Container Parallelizer: %@\n", v14];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyVars:self];
  [v4 copyEffects:self->_effects];
  [v4 copyFilters:self->_filters];
  [v4 copyTransition:self->_transition];
  [v4 copyAudioPlaylist:self->_audioPlaylist];
  return v4;
}

- (void)dealloc
{
  [(MPEffectContainer *)self cleanup];
  containerPlug = self->_containerPlug;
  if (containerPlug) {

  }
  self->_containerPlug = 0;
  containerParallelizer = self->_containerParallelizer;
  if (containerParallelizer) {

  }
  self->_containerParallelizer = 0;
  self->_audioPlaylist = 0;

  self->_attributes = 0;
  self->_effects = 0;

  self->_filters = 0;
  self->_transition = 0;
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    CGColorRelease(backgroundColor);
    self->_backgroundColor = 0;
  }

  self->_uuid = 0;
  v6.receiver = self;
  v6.super_class = (Class)MPEffectContainer;
  [(MPEffectContainer *)&v6 dealloc];
}

- (id)effects
{
  return self->_effects;
}

- (void)addEffect:(id)a3
{
  id v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  effects = self->_effects;
  if (effects) {
    id v5 = [(NSMutableArray *)effects count];
  }
  else {
    id v5 = 0;
  }
  [(MPEffectContainer *)self insertEffects:v6 atIndex:v5];
}

- (void)addEffects:(id)a3
{
  effects = self->_effects;
  if (effects) {
    id v6 = [(NSMutableArray *)effects count];
  }
  else {
    id v6 = 0;
  }
  [(MPEffectContainer *)self insertEffects:a3 atIndex:v6];
}

- (void)insertEffects:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_effects) {
    self->_effects = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  [(MPEffectContainer *)self willChange:2 valuesAtIndexes:v7 forKey:@"effects"];
  [(NSMutableArray *)self->_effects insertObjects:a3 atIndexes:v7];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v44;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * i) setParentContainer:self];
      }
      id v9 = [a3 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v9);
  }
  if (self->_containerPlug)
  {
    if ([(MPEffectContainer *)self shouldBeParallelizer]
      || [a3 count] != (char *)&dword_0 + 1)
    {
      if (!self->_containerParallelizer) {
        [(MPEffectContainer *)self convertFromEffectContainerToParallelizer];
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v14 = [a3 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v40;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(a3);
            }
            v18 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
            id v19 = objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage"), "createEffectContainer");
            objc_msgSend(v18, "setPlug:", -[MCContainerParallelizer setPlugForContainer:forID:](self->_containerParallelizer, "setPlugForContainer:forID:", v19, +[MPUtilities stringWithNewUUID](MPUtilities, "stringWithNewUUID")));
            [v18 setContainer:v19];
          }
          id v15 = [a3 countByEnumeratingWithState:&v39 objects:v49 count:16];
        }
        while (v15);
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      effects = self->_effects;
      id v21 = [(NSMutableArray *)effects countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v21)
      {
        id v22 = v21;
        __int16 v23 = 0;
        uint64_t v24 = *(void *)v36;
        do
        {
          for (k = 0; k != v22; k = (char *)k + 1)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(effects);
            }
            objc_msgSend(objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)k), "plug"), "setZIndex:", (__int16)(v23 + (_WORD)k));
          }
          id v22 = [(NSMutableArray *)effects countByEnumeratingWithState:&v35 objects:v48 count:16];
          v23 += (__int16)k;
        }
        while (v22);
      }
    }
    else
    {
      if (self->_containerParallelizer) {
        [(MPEffectContainer *)self convertFromParallelizerToEffectContainer];
      }
      id v12 = objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage"), "createEffectContainer");
      [(MCPlug *)self->_containerPlug setContainer:v12];
      id v13 = [a3 lastObject];
      [v13 setPlug:0];
      [v13 setContainer:v12];
    }
  }
  if ([(NSMutableArray *)self->_effects count] && ([(MPEffectContainer *)self duration], v26 == 0.0))
  {
    [(MPEffectContainer *)self calculateDurationToSmallest:0];
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v27 = [a3 countByEnumeratingWithState:&v31 objects:v47 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (m = 0; m != v28; m = (char *)m + 1)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(a3);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * (void)m) scaleMainDuration];
        }
        id v28 = [a3 countByEnumeratingWithState:&v31 objects:v47 count:16];
      }
      while (v28);
    }
  }
  [(MPEffectContainer *)self outroTransitionDuration];
  -[MPEffectContainer adjustPhasesWithDuration:](self, "adjustPhasesWithDuration:");
  [(MPEffectContainer *)self didChange:2 valuesAtIndexes:v7 forKey:@"effects"];
}

- (void)removeEffectsAtIndices:(id)a3
{
  effects = self->_effects;
  if (effects && [(NSMutableArray *)effects count])
  {
    [(MPEffectContainer *)self willChange:3 valuesAtIndexes:a3 forKey:@"effects"];
    if ((unint64_t)[(NSMutableArray *)self->_effects count] < 2)
    {
      if (-[NSMutableArray count](self->_effects, "count") == (char *)&dword_0 + 1 && ![a3 firstIndex])
      {
        id v12 = [(NSMutableArray *)self->_effects objectAtIndex:0];
        id v13 = v12;
        if (self->_containerPlug)
        {
          containerParallelizer = self->_containerParallelizer;
          if (containerParallelizer)
          {
            -[MCContainerParallelizer removePlug:](containerParallelizer, "removePlug:", [v12 plug]);

            self->_containerParallelizer = 0;
          }
          id v15 = (MCContainerParallelizer *)objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage"), "createParallelizerContainer");
          self->_containerParallelizer = v15;
          [(MCPlug *)self->_containerPlug setContainer:v15];
        }
        [v13 setParentContainer:0];
        [v13 setPlug:0];
        [v13 setContainer:0];
      }
    }
    else
    {
      id v7 = [a3 lastIndex];
      if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        for (id i = v7; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
        {
          id v9 = [(NSMutableArray *)self->_effects objectAtIndex:i];
          uint64_t v10 = v9;
          v11 = self->_containerParallelizer;
          if (v11) {
            -[MCContainerParallelizer removePlug:](v11, "removePlug:", [v9 plug]);
          }
          [v10 setParentContainer:0];
          [v10 setPlug:0];
          [v10 setContainer:0];
        }
      }
    }
    [(NSMutableArray *)self->_effects removeObjectsAtIndexes:a3];
    if (self->_containerParallelizer)
    {
      if ([(MPEffectContainer *)self shouldBeParallelizer])
      {
        if (self->_containerParallelizer)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v16 = self->_effects;
          id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v17)
          {
            id v18 = v17;
            __int16 v19 = 0;
            uint64_t v20 = *(void *)v23;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v23 != v20) {
                  objc_enumerationMutation(v16);
                }
                objc_msgSend(objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "plug"), "setZIndex:", (__int16)(v19 + (_WORD)j));
              }
              id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
              v19 += (__int16)j;
            }
            while (v18);
          }
        }
      }
      else
      {
        [(MPEffectContainer *)self convertFromParallelizerToEffectContainer];
      }
    }
    [(MPEffectContainer *)self didChange:3 valuesAtIndexes:a3 forKey:@"effects"];
  }
}

- (void)removeAllEffects
{
  if ([(NSMutableArray *)self->_effects count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, -[NSMutableArray count](self->_effects, "count"));
    [(MPEffectContainer *)self removeEffectsAtIndices:v3];
  }
}

- (void)moveEffectsFromIndices:(id)a3 toIndex:(int64_t)a4
{
  if (self->_effects)
  {
    containerParallelizer = self->_containerParallelizer;
    if (containerParallelizer)
    {
      id v8 = +[NSMutableArray arrayWithArray:[(MCContainerParallelizer *)containerParallelizer zOrderedPlugs]];
      id v9 = [(NSMutableArray *)v8 objectsAtIndexes:a3];
      [(NSMutableArray *)v8 removeObjectsAtIndexes:a3];
      id v10 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(v9, "count"));
      [(NSMutableArray *)v8 insertObjects:v9 atIndexes:v10];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        id v12 = v11;
        __int16 v13 = 0;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (id i = 0; i != v12; id i = (char *)i + 1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v18 + 1) + 8 * i) setZIndex:(__int16)(v13 + (_WORD)i)];
          }
          id v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          v13 += (__int16)i;
        }
        while (v12);
      }
    }
    id v16 = [(NSMutableArray *)self->_effects objectsAtIndexes:a3];
    [(NSMutableArray *)self->_effects removeObjectsAtIndexes:a3];
    id v17 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(v16, "count"));
    [(NSMutableArray *)self->_effects insertObjects:v16 atIndexes:v17];
  }
}

- (MPTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  if (a3)
  {
    id v5 = objc_msgSend(-[MPEffectContainer parentLayer](self, "parentLayer"), "parentDocument");
    if (objc_msgSend(objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue"))
    {
      [(MPEffectContainer *)self duration];
      double v7 = v6;
      parentLayer = self->_parentLayer;
      if (parentLayer)
      {
        id v9 = [(MPLayer *)parentLayer effectContainers];
        if ([(MPEffectContainer *)self index]) {
          id v10 = objc_msgSend(v9, "objectAtIndex:", (char *)-[MPEffectContainer index](self, "index") - 1);
        }
        else {
          id v10 = 0;
        }
        id v11 = [(MPEffectContainer *)self index];
        if (v11 != (char *)[v9 count] - 1)
        {
          id v12 = objc_msgSend(v9, "objectAtIndex:", (char *)-[MPEffectContainer index](self, "index") + 1);
          if (v12)
          {
            __int16 v13 = v12;
            [v12 duration];
            if (v7 >= v14) {
              double v7 = v14;
            }
            if ([v13 transition])
            {
              [v13 duration];
              double v16 = v15;
              objc_msgSend(objc_msgSend(v13, "transition"), "duration");
              double v18 = v16 - v17;
              if (v7 >= v18) {
                double v7 = v18;
              }
            }
          }
        }
        if (v10)
        {
          if ([v10 transition])
          {
            [(MPEffectContainer *)self duration];
            double v20 = v19;
            objc_msgSend(objc_msgSend(v10, "transition"), "duration");
            double v22 = v20 - v21;
            if (v7 >= v22) {
              double v7 = v22;
            }
          }
        }
      }
      [a3 duration];
      if (v23 > v7) {
        [a3 setDuration:v7];
      }
    }
  }
  if (self->_parentLayer)
  {
    transition = self->_transition;
    double v25 = 0.0;
    double v26 = 0.0;
    if (transition && [(MPTransition *)transition parentContainer])
    {
      [(MPTransition *)self->_transition duration];
      double v26 = v27;
    }
    if (a3)
    {
      [a3 duration];
      double v25 = v28;
    }
    [(MPLayer *)self->_parentLayer duration];
    double v30 = v29 - (v25 - v26);
  }
  else
  {
    double v30 = -1.0;
    double v26 = 0.0;
  }
  long long v31 = self->_transition;
  if (v31)
  {
    [(MPTransition *)v31 setParent:0];
    long long v32 = self->_transition;
    if (v32)
    {

      self->_transition = 0;
    }
  }
  if (a3)
  {
    long long v33 = (MPTransition *)a3;
    self->_transition = v33;
    [(MPTransition *)v33 setParent:self];
    if (![(MPEffectContainer *)self isTransitionConnected])
    {
      long long v34 = self->_parentLayer;
      [(MPTransition *)self->_transition duration];
      [(MPLayer *)v34 updateDurationPadding:v35 - v26];
    }
  }
  else if (self->_containerPlug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![(MPEffectContainer *)self isTransitionConnected]) {
        [(MPLayer *)self->_parentLayer updateDurationPadding:-v26];
      }
      self->_transitionDisconnected = 0;
      [(MCPlug *)self->_containerPlug setTransitionID:0];
      [(MCPlug *)self->_containerPlug setTransitionDuration:0.0];
      [(MCPlug *)self->_containerPlug setTransitionAttributes:0];
    }
  }
  [(MPEffectContainer *)self outroTransitionDuration];
  -[MPEffectContainer adjustPhasesWithDuration:](self, "adjustPhasesWithDuration:");
  if (v30 != -1.0)
  {
    long long v36 = self->_parentLayer;
    [(MPLayer *)v36 setDuration:v30];
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
  [(MPEffectContainer *)self insertFilters:v4 atIndex:v6];
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
  [(MPEffectContainer *)self insertFilters:a3 atIndex:v6];
}

- (void)insertFilters:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_filters) {
    self->_filters = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  [(MPEffectContainer *)self willChange:2 valuesAtIndexes:v7 forKey:@"filters"];
  [(NSMutableArray *)self->_filters insertObjects:a3 atIndexes:v7];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (id i = 0; i != v9; id i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) setParent:self];
      }
      id v9 = [a3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }
  if (self->_containerPlug)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v12 = [a3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)j), "setFilter:", -[MCPlug insertFilterWithFilterID:atIndex:](self->_containerPlug, "insertFilterWithFilterID:atIndex:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)j), "filterID"), (char *)j + a4));
        }
        id v13 = [a3 countByEnumeratingWithState:&v16 objects:v24 count:16];
        a4 += (int64_t)j;
      }
      while (v13);
    }
  }
  [(MPEffectContainer *)self didChange:2 valuesAtIndexes:v7 forKey:@"filters"];
}

- (void)removeFiltersAtIndices:(id)a3
{
  filters = self->_filters;
  if (filters && [(NSMutableArray *)filters count])
  {
    [(MPEffectContainer *)self willChange:3 valuesAtIndexes:a3 forKey:@"filters"];
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
    containerPlug = self->_containerPlug;
    if (containerPlug) {
      [(MCPlug *)containerPlug removeFiltersAtIndices:a3];
    }
    [(NSMutableArray *)self->_filters removeObjectsAtIndexes:a3];
    [(MPEffectContainer *)self didChange:3 valuesAtIndexes:a3 forKey:@"filters"];
  }
}

- (void)removeAllFilters
{
  if ([(NSMutableArray *)self->_filters count])
  {
    id v3 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, -[NSMutableArray count](self->_filters, "count"));
    [(MPEffectContainer *)self removeFiltersAtIndices:v3];
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
    containerPlug = self->_containerPlug;
    if (containerPlug)
    {
      [(MCPlug *)containerPlug moveFiltersAtIndices:a3 toIndex:a4];
    }
  }
}

- (void)setBackgroundColorString:(id)a3
{
  id v4 = +[MPUtilities CGColorFromString:a3];
  [(MPEffectContainer *)self setBackgroundCGColor:v4];
}

- (void)setBackgroundCGColor:(CGColor *)a3
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    CGColorRelease(backgroundColor);
    self->_backgroundColor = 0;
  }
  if (a3)
  {
    self->_backgroundColor = CGColorRetain(a3);
    if (!self->_containerPlug) {
      return;
    }
    containerParallelizer = self->_containerParallelizer;
    if (!containerParallelizer)
    {
      [(MPEffectContainer *)self convertFromEffectContainerToParallelizer];
      containerParallelizer = self->_containerParallelizer;
      if (!containerParallelizer) {
        return;
      }
    }
    id v7 = a3;
    goto LABEL_14;
  }
  if (self->_containerPlug && self->_containerParallelizer)
  {
    if (![(MPEffectContainer *)self shouldBeParallelizer]) {
      [(MPEffectContainer *)self convertFromParallelizerToEffectContainer];
    }
    containerParallelizer = self->_containerParallelizer;
    if (containerParallelizer)
    {
      id v7 = 0;
LABEL_14:
      [(MCContainerParallelizer *)containerParallelizer setBackgroundColor:v7];
    }
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
    if (self->_containerPlug)
    {
      if (self->_containerParallelizer
        || ([(MPEffectContainer *)self convertFromEffectContainerToParallelizer], self->_containerParallelizer))
      {
        [(MPAudioPlaylist *)self->_audioPlaylist setMontage:[(MPLayer *)self->_parentLayer montage]];
        id v7 = self->_audioPlaylist;
        id v8 = [(MCContainer *)self->_containerParallelizer audioPlaylistCreateIfNeeded];
        [(MPAudioPlaylist *)v7 setAudioPlaylist:v8];
      }
    }
  }
  else if (self->_containerPlug {
         && self->_containerParallelizer
  }
         && ![(MPEffectContainer *)self shouldBeParallelizer])
  {
    [(MPEffectContainer *)self convertFromParallelizerToEffectContainer];
  }
}

- (int64_t)index
{
  parentLayer = self->_parentLayer;
  if (!parentLayer) {
    return -1;
  }
  if (!self->_containerPlug) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    parentLayer = self->_parentLayer;
LABEL_5:
    id v4 = [(MPLayer *)parentLayer effectContainers];
    return (int64_t)[v4 indexOfObject:self];
  }
  containerPlug = self->_containerPlug;
  return (int64_t)[(MCPlug *)containerPlug index];
}

- (id)parentLayer
{
  return self->_parentLayer;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setDuration:(double)a3
{
  if (a3 >= 0.0)
  {
    double v3 = a3;
    id v5 = objc_msgSend(-[MPEffectContainer parentLayer](self, "parentLayer"), "parentDocument");
    id v6 = [(MPEffectContainer *)self nearestLayerGroup];
    if (v6) {
      unsigned int v7 = [v6 autoAdjustDuration] ^ 1;
    }
    else {
      unsigned int v7 = 0;
    }
    if (objc_msgSend(objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue"))
    {
      if ((v7 & 1) == 0)
      {
        [(MPEffectContainer *)self findMinDuration];
        if (v8 > v3)
        {
          [(MPEffectContainer *)self findMinDuration];
          double v3 = v9;
        }
      }
    }
    [(MPEffectContainer *)self duration];
    double v11 = v3 - v10;
    self->_duration = v3;
    parentLayer = self->_parentLayer;
    if (parentLayer) {
      char v13 = v7;
    }
    else {
      char v13 = 1;
    }
    if ((v13 & 1) == 0)
    {
      [(MPLayer *)parentLayer duration];
      [(MPLayer *)self->_parentLayer setDuration:v11 + v14];
    }
    if ((v7 & 1) == 0)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      effects = self->_effects;
      id v16 = [(NSMutableArray *)effects countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v23;
        do
        {
          for (id i = 0; i != v17; id i = (char *)i + 1)
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(effects);
            }
            [*(id *)(*((void *)&v22 + 1) + 8 * i) scaleMainDuration];
          }
          id v17 = [(NSMutableArray *)effects countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v17);
      }
    }
    if (self->_containerPlug && [(NSMutableArray *)self->_effects count] != (char *)&dword_0 + 1)
    {
      [(MCPlug *)self->_containerPlug loopDuration];
      double v21 = -0.0;
      if (!v7) {
        double v21 = v11;
      }
      [(MCPlug *)self->_containerPlug setLoopDuration:v21 + v20];
    }
    if ((v7 & 1) == 0)
    {
      [(MPEffectContainer *)self outroTransitionDuration];
      -[MPEffectContainer adjustPhasesWithDuration:](self, "adjustPhasesWithDuration:");
    }
  }
}

- (double)introTransitionDuration
{
  int64_t v3 = [(MPEffectContainer *)self index];
  if (!v3) {
    return 0.0;
  }
  id v4 = objc_msgSend(objc_msgSend(-[MPLayer effectContainers](self->_parentLayer, "effectContainers"), "objectAtIndex:", v3 - 1), "transition");
  if (!v4) {
    return 0.0;
  }
  [v4 duration];
  return result;
}

- (double)outroTransitionDuration
{
  transition = self->_transition;
  if (!transition) {
    return 0.0;
  }
  [(MPTransition *)transition duration];
  return result;
}

- (CGColor)backgroundCGColor
{
  return self->_backgroundColor;
}

- (double)duration
{
  return self->_duration;
}

- (id)container
{
  if (self->_containerParallelizer) {
    return self->_containerParallelizer;
  }
  id v3 = [(NSMutableArray *)self->_effects lastObject];
  return [v3 container];
}

- (id)plug
{
  return self->_containerPlug;
}

- (void)dump
{
}

- (double)findMinDuration
{
  parentLayer = self->_parentLayer;
  if (!parentLayer) {
    return 0.0;
  }
  id v4 = [(MPLayer *)parentLayer effectContainers];
  if ([(MPEffectContainer *)self index]) {
    id v5 = objc_msgSend(v4, "objectAtIndex:", (char *)-[MPEffectContainer index](self, "index") - 1);
  }
  else {
    id v5 = 0;
  }
  if ([(MPEffectContainer *)self transition])
  {
    [(MPTransition *)[(MPEffectContainer *)self transition] duration];
    double v6 = v7 + 0.0;
    if (!v5) {
      return v6;
    }
  }
  else
  {
    double v6 = 0.0;
    if (!v5) {
      return v6;
    }
  }
  if ([v5 transition])
  {
    objc_msgSend(objc_msgSend(v5, "transition"), "duration");
    return v6 + v8;
  }
  return v6;
}

- (void)disconnectTransition
{
  if ([(MPEffectContainer *)self transition])
  {
    if (self->_containerPlug)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_transitionDisconnected)
      {
        self->_transitionDisconnected = 1;
        [(MCPlug *)self->_containerPlug setTransitionID:0];
        [(MCPlug *)self->_containerPlug setTransitionDuration:0.0];
        parentLayer = self->_parentLayer;
        [(MPTransition *)self->_transition duration];
        -[MPLayer updateDurationPadding:](parentLayer, "updateDurationPadding:");
      }
    }
  }
}

- (void)reconnectTransition
{
  if (self->_transitionDisconnected)
  {
    if (self->_containerPlug)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_transitionDisconnected = 0;
        [(MCPlug *)self->_containerPlug setTransitionID:[(MPTransition *)[(MPEffectContainer *)self transition] transitionID]];
        [(MPTransition *)[(MPEffectContainer *)self transition] duration];
        -[MCPlug setTransitionDuration:](self->_containerPlug, "setTransitionDuration:");
        parentLayer = self->_parentLayer;
        [(MPTransition *)self->_transition duration];
        double v5 = -v4;
        [(MPLayer *)parentLayer updateDurationPadding:v5];
      }
    }
  }
}

- (BOOL)isTransitionConnected
{
  return !self->_transitionDisconnected;
}

- (id)fullDebugLog
{
  id v3 = +[NSString stringWithFormat:@"\n%@\n", [(MPEffectContainer *)self description]];
  transition = self->_transition;
  if (transition) {
    id v3 = [(NSString *)v3 stringByAppendingFormat:@"%@\n", [(MPTransition *)transition fullDebugLog]];
  }
  double v5 = [(NSString *)v3 stringByAppendingFormat:@"========================= Effect Container %d Effects =========================\n", [(MPEffectContainer *)self index]];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  effects = self->_effects;
  id v7 = [(NSMutableArray *)effects countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (id i = 0; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(effects);
        }
        double v5 = -[NSString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @"%@\n", [*(id *)(*((void *)&v22 + 1) + 8 * i) fullDebugLog]);
      }
      id v8 = [(NSMutableArray *)effects countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }
  double v11 = [(NSString *)v5 stringByAppendingFormat:@"========================= Effect Container %d Filters =========================\n", [(MPEffectContainer *)self index]];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  filters = self->_filters;
  id v13 = [(NSMutableArray *)filters countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(filters);
        }
        double v11 = -[NSString stringByAppendingFormat:](v11, "stringByAppendingFormat:", @"%@\n", [*(id *)(*((void *)&v18 + 1) + 8 * (void)j) fullDebugLog]);
      }
      id v14 = [(NSMutableArray *)filters countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
  return v11;
}

- (id)plugID
{
  return [(MCObject *)self->_containerPlug objectID];
}

- (id)objectID
{
  return [(MCObject *)self->_containerPlug objectID];
}

- (id)uuid
{
  return self->_uuid;
}

- (id)parentDocument
{
  id v2 = [(MPEffectContainer *)self parentLayer];
  return [v2 parentDocument];
}

- (void)copyVars:(id)a3
{
  self->_startTime = *((double *)a3 + 10);
  self->_duration = *((double *)a3 + 11);
  uuid = self->_uuid;
  if (uuid)
  {

    self->_uuid = 0;
  }
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    CGColorRelease(backgroundColor);
    self->_backgroundColor = 0;
  }
  self->_backgroundColor = CGColorCreateCopy(*((CGColorRef *)a3 + 12));
}

- (void)copyEffects:(id)a3
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
    [(MPEffectContainer *)self addEffects:v5];
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
    [(MPEffectContainer *)self addFilters:a3];
  }
}

- (void)copyTransition:(id)a3
{
  id v4 = [a3 copy];
  [(MPEffectContainer *)self setTransition:v4];
}

- (void)copyAudioPlaylist:(id)a3
{
  id v4 = [a3 copy];
  [(MPEffectContainer *)self setAudioPlaylist:v4];
}

- (void)adjustPhasesWithDuration:(double)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  effects = self->_effects;
  id v6 = [(NSMutableArray *)effects countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (id i = 0; i != v7; id i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(effects);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v10, "effectAttributeForKey:", @"matchTransitionToPhase"), "BOOLValue"))
        {
          [v10 phaseInDuration];
          double v12 = v11;
          [(MPEffectContainer *)self introTransitionDuration];
          double v14 = v13;
          double v15 = v12 - v13;
          [v10 phaseOutDuration];
          double v17 = v16 - a3;
          [v10 mainDuration];
          double v19 = v18;
          if (v17 == 0.0)
          {
            if (v15 == 0.0) {
              continue;
            }
          }
          else
          {
            [v10 setPhaseOutDuration:a3];
            if (v15 == 0.0) {
              goto LABEL_12;
            }
          }
          [v10 setPhaseInDuration:v14];
LABEL_12:
          [v10 setMainDuration:v17 + v15 + v19];
          continue;
        }
      }
      id v7 = [(NSMutableArray *)effects countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)cleanup
{
  [(MPEffectContainer *)self removeAllEffects];
  [(MPEffectContainer *)self removeAllFilters];
  [(MPEffectContainer *)self setTransition:0];
  [(MPEffectContainer *)self setAudioPlaylist:0];
}

- (void)setContainerPlug:(id)a3
{
  containerPlug = self->_containerPlug;
  if (containerPlug)
  {

    self->_containerPlug = 0;
  }
  id v6 = (MCPlug *)a3;
  self->_containerPlug = v6;
  if (v6)
  {
    if ([(NSMutableArray *)self->_effects count] == (char *)&dword_0 + 1)
    {
      id v7 = [(NSMutableArray *)self->_effects lastObject];
      [v7 phaseInDuration];
      -[MCPlug setPhaseInDuration:](self->_containerPlug, "setPhaseInDuration:");
      [v7 phaseOutDuration];
      -[MCPlug setPhaseOutDuration:](self->_containerPlug, "setPhaseOutDuration:");
      [v7 mainDuration];
    }
    else
    {
      [(MPEffectContainer *)self duration];
    }
    -[MCPlug setLoopDuration:](self->_containerPlug, "setLoopDuration:");
    unsigned __int8 v19 = [(MPEffectContainer *)self shouldBeParallelizer];
    containerParallelizer = self->_containerParallelizer;
    if (v19)
    {
      if (!containerParallelizer) {
        [(MPEffectContainer *)self convertFromEffectContainerToParallelizer];
      }
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      obj = self->_effects;
      id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16, a3);
      if (v21)
      {
        id v22 = v21;
        __int16 v23 = 0;
        uint64_t v24 = *(void *)v51;
        do
        {
          for (id i = 0; i != v22; id i = (char *)i + 1)
          {
            if (*(void *)v51 != v24) {
              objc_enumerationMutation(obj);
            }
            double v26 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            id v27 = objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage"), "createEffectContainer");
            id v28 = [(MCContainerParallelizer *)self->_containerParallelizer setPlugForContainer:v27 forID:+[MPUtilities stringWithNewUUID]];
            [v26 setPlug:v28];
            [v26 setContainer:v27];
            [v28 setZIndex:(__int16)(v23 + (_WORD)i)];
          }
          id v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v50 objects:v57 count:16];
          v23 += (__int16)i;
        }
        while (v22);
      }
    }
    else
    {
      if (containerParallelizer) {

      }
      self->_containerParallelizer = 0;
      id v29 = objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage", a3), "createEffectContainer");
      [(MCPlug *)self->_containerPlug setContainer:v29];
      id v30 = [(NSMutableArray *)self->_effects lastObject];
      [v30 setPlug:0];
      [v30 setContainer:v29];
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    filters = self->_filters;
    id v32 = [(NSMutableArray *)filters countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v47;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation(filters);
          }
          objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * (void)j), "setFilter:", -[MCPlug addFilterWithFilterID:](self->_containerPlug, "addFilterWithFilterID:", objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * (void)j), "filterID")));
        }
        id v33 = [(NSMutableArray *)filters countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v33);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      transition = self->_transition;
      if (transition)
      {
        [(MCPlug *)self->_containerPlug setTransitionID:[(MPTransition *)transition transitionID]];
        [(MPTransition *)self->_transition duration];
        -[MCPlug setTransitionDuration:](self->_containerPlug, "setTransitionDuration:");
        [(MPTransition *)self->_transition applyFormattedAttributes];
      }
    }
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    effects = self->_effects;
    id v9 = [(NSMutableArray *)effects countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (k = 0; k != v10; k = (char *)k + 1)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(effects);
          }
          double v13 = *(void **)(*((void *)&v42 + 1) + 8 * (void)k);
          [v13 setPlug:0];
          [v13 setContainer:0];
        }
        id v10 = [(NSMutableArray *)effects countByEnumeratingWithState:&v42 objects:v55 count:16];
      }
      while (v10);
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    double v14 = self->_filters;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v38 objects:v54 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (m = 0; m != v16; m = (char *)m + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * (void)m) setFilter:0];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v38 objects:v54 count:16];
      }
      while (v16);
    }
  }
}

- (void)setContainerParallelizer:(id)a3
{
  containerParallelizer = self->_containerParallelizer;
  if (containerParallelizer)
  {

    self->_containerParallelizer = 0;
  }
  id v6 = (MCContainerParallelizer *)a3;
  self->_containerParallelizer = v6;
  if (v6)
  {
    [(MCContainerParallelizer *)v6 setBackgroundColor:self->_backgroundColor];
    audioPlaylist = self->_audioPlaylist;
    if (!audioPlaylist) {
      return;
    }
    [(MPAudioPlaylist *)audioPlaylist setMontage:[(MPLayer *)self->_parentLayer montage]];
    uint64_t v8 = self->_audioPlaylist;
    id v9 = [(MCContainer *)self->_containerParallelizer audioPlaylistCreateIfNeeded];
    id v10 = v8;
  }
  else
  {
    uint64_t v11 = self->_audioPlaylist;
    if (!v11) {
      return;
    }
    [(MPAudioPlaylist *)v11 setMontage:0];
    id v10 = self->_audioPlaylist;
    id v9 = 0;
  }
  [(MPAudioPlaylist *)v10 setAudioPlaylist:v9];
}

- (void)setContainerEffect:(id)a3
{
  id v4 = [(NSMutableArray *)self->_effects lastObject];
  [v4 setPlug:0];
  [v4 setContainer:a3];
}

- (void)setParentLayer:(id)a3
{
  if (a3 && self->_parentLayer) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"An effect container may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_transitionDisconnected = 0;
  self->_parentLayer = (MPLayer *)a3;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (BOOL)shouldBeParallelizer
{
  if ([(NSMutableArray *)self->_effects count] == (char *)&dword_0 + 1
    && ![(MPEffectContainer *)self backgroundCGColor]
    && ![(MPEffectContainer *)self audioPlaylist])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    effects = self->_effects;
    id v3 = [(NSMutableArray *)effects countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (!v3) {
      return (char)v3;
    }
    id v5 = v3;
    uint64_t v6 = *(void *)v10;
LABEL_8:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(effects);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) needsParallelizer]) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [(NSMutableArray *)effects countByEnumeratingWithState:&v9 objects:v13 count:16];
        LOBYTE(v3) = 0;
        if (v5) {
          goto LABEL_8;
        }
        return (char)v3;
      }
    }
  }
  LOBYTE(v3) = 1;
  return (char)v3;
}

- (void)convertFromParallelizerToEffectContainer
{
  if (![(MPEffectContainer *)self shouldBeParallelizer] && self->_containerPlug)
  {
    id v3 = objc_msgSend(-[MPEffectContainer parentLayer](self, "parentLayer"), "parentDocument");
    objc_msgSend(objc_msgSend(v3, "montage"), "lock");
    id v4 = [(NSMutableArray *)self->_effects lastObject];
    objc_msgSend(objc_msgSend(v4, "plug"), "phaseInDuration");
    double v6 = v5;
    objc_msgSend(objc_msgSend(v4, "plug"), "loopDuration");
    double v8 = v7;
    objc_msgSend(objc_msgSend(v4, "plug"), "phaseOutDuration");
    double v10 = v9;
    id v11 = [v4 container];
    if (v11)
    {
      long long v12 = v11;
      [v11 specialRetain];
      -[MCContainerParallelizer removePlug:](self->_containerParallelizer, "removePlug:", [v4 plug]);
      [(MCPlug *)self->_containerPlug setContainer:v12];
      [v12 specialRelease];
    }
    [(MCPlug *)self->_containerPlug setPhaseInDuration:v6];
    [(MCPlug *)self->_containerPlug setPhaseOutDuration:v10];
    [(MCPlug *)self->_containerPlug setLoopDuration:v8];
    containerParallelizer = self->_containerParallelizer;
    if (containerParallelizer)
    {

      self->_containerParallelizer = 0;
    }
    [v4 setPlug:0];
    id v14 = [v3 montage];
    [v14 unlock];
  }
}

- (void)convertFromEffectContainerToParallelizer
{
  id v3 = objc_msgSend(-[MPEffectContainer parentLayer](self, "parentLayer"), "parentDocument");
  objc_msgSend(objc_msgSend(v3, "montage"), "lock");
  id v4 = [(NSMutableArray *)self->_effects objectAtIndex:0];
  id v5 = objc_msgSend(objc_msgSend(v4, "container"), "specialRetain");
  containerParallelizer = self->_containerParallelizer;
  if (containerParallelizer)
  {

    self->_containerParallelizer = 0;
  }
  double v7 = (MCContainerParallelizer *)objc_msgSend(-[MPLayer montage](self->_parentLayer, "montage"), "createParallelizerContainer");
  self->_containerParallelizer = v7;
  [(MCPlug *)self->_containerPlug setContainer:v7];
  id v8 = [(MCContainerParallelizer *)self->_containerParallelizer setPlugForContainer:v5 forID:+[MPUtilities stringWithNewUUID]];
  [v5 specialRelease];
  [(MCPlug *)self->_containerPlug loopDuration];
  objc_msgSend(v8, "setLoopDuration:");
  [(MCPlug *)self->_containerPlug phaseInDuration];
  objc_msgSend(v8, "setPhaseInDuration:");
  [(MCPlug *)self->_containerPlug phaseOutDuration];
  objc_msgSend(v8, "setPhaseOutDuration:");
  containerPlug = self->_containerPlug;
  [(MCPlug *)containerPlug phaseInDuration];
  double v11 = v10;
  [(MCPlug *)self->_containerPlug phaseOutDuration];
  double v13 = v11 + v12;
  [(MCPlug *)containerPlug loopDuration];
  [(MCPlug *)containerPlug setLoopDuration:v14 + v13];
  [(MCPlug *)self->_containerPlug setPhaseInDuration:0.0];
  [(MCPlug *)self->_containerPlug setPhaseOutDuration:0.0];
  [v4 setPlug:v8];
  id v15 = [v3 montage];
  [v15 unlock];
}

- (void)calculateDurationToSmallest:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (char *)[(NSMutableArray *)self->_effects count];
  effects = self->_effects;
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    id v7 = [(NSMutableArray *)effects lastObject];
    [v7 phaseInDuration];
    double v9 = v8;
    [v7 phaseOutDuration];
    double v11 = v10;
    [v7 mainDuration];
    double v13 = v12;
    double v14 = v9 + v11 + v12;
    [(MPEffectContainer *)self duration];
    if (v14 != v15)
    {
      double v16 = v15;
      [(MPEffectContainer *)self willChangeValueForKey:@"duration"];
      self->_duration = v14;
      [(MPEffectContainer *)self didChangeValueForKey:@"duration"];
      parentLayer = self->_parentLayer;
      if (parentLayer)
      {
        [(MPLayer *)parentLayer duration];
        [(MPLayer *)self->_parentLayer setDuration:v14 - v16 + v18];
      }
      containerPlug = self->_containerPlug;
      if (containerPlug)
      {
        [(MCPlug *)containerPlug phaseInDuration];
        if (v20 != v9) {
          [(MCPlug *)self->_containerPlug setPhaseInDuration:v9];
        }
        [(MCPlug *)self->_containerPlug phaseOutDuration];
        if (v21 != v11) {
          [(MCPlug *)self->_containerPlug setPhaseOutDuration:v11];
        }
        [(MCPlug *)self->_containerPlug loopDuration];
        if (v22 != v13)
        {
          __int16 v23 = self->_containerPlug;
          [(MCPlug *)v23 setLoopDuration:v13];
        }
      }
    }
  }
  else if ((unint64_t)[(NSMutableArray *)effects count] >= 2)
  {
    objc_msgSend(-[NSMutableArray objectAtIndex:](self->_effects, "objectAtIndex:", 0), "fullDuration");
    double v25 = v24;
    if (v3)
    {
      long long v58 = 0uLL;
      long long v59 = 0uLL;
      long long v56 = 0uLL;
      long long v57 = 0uLL;
      double v26 = self->_effects;
      id v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v57;
        do
        {
          for (id i = 0; i != v28; id i = (char *)i + 1)
          {
            if (*(void *)v57 != v29) {
              objc_enumerationMutation(v26);
            }
            [*(id *)(*((void *)&v56 + 1) + 8 * i) fullDuration];
            if (v31 < v25) {
              double v25 = v31;
            }
          }
          id v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v56 objects:v62 count:16];
        }
        while (v28);
      }
    }
    else
    {
      long long v54 = 0uLL;
      long long v55 = 0uLL;
      long long v52 = 0uLL;
      long long v53 = 0uLL;
      id v32 = self->_effects;
      id v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v53;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v53 != v35) {
              objc_enumerationMutation(v32);
            }
            [*(id *)(*((void *)&v52 + 1) + 8 * (void)j) fullDuration];
            if (v37 > v25) {
              double v25 = v37;
            }
          }
          id v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v34);
      }
    }
    [(MPEffectContainer *)self duration];
    double v39 = v38;
    [(MPEffectContainer *)self willChangeValueForKey:@"duration"];
    self->_duration = v25;
    [(MPEffectContainer *)self didChangeValueForKey:@"duration"];
    long long v40 = self->_parentLayer;
    if (v40)
    {
      [(MPLayer *)v40 duration];
      [(MPLayer *)self->_parentLayer setDuration:v25 - v39 + v41];
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v42 = self->_effects;
    id v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v49;
      do
      {
        for (k = 0; k != v44; k = (char *)k + 1)
        {
          if (*(void *)v49 != v45) {
            objc_enumerationMutation(v42);
          }
          [*(id *)(*((void *)&v48 + 1) + 8 * (void)k) scaleMainDuration];
        }
        id v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v48 objects:v60 count:16];
      }
      while (v44);
    }
    long long v47 = self->_containerPlug;
    if (v47) {
      [(MCPlug *)v47 setLoopDuration:v25];
    }
  }
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

- (id)userInfoAttributeForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_attributes objectForKey:a3];
}

- (int64_t)slideCount
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  effects = self->_effects;
  id v3 = [(NSMutableArray *)effects countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  int64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (id i = 0; i != v4; id i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(effects);
      }
      v5 += (int64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) countOfSlides];
    }
    id v4 = [(NSMutableArray *)effects countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (int64_t)textCount
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  effects = self->_effects;
  id v3 = [(NSMutableArray *)effects countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  int64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (id i = 0; i != v4; id i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(effects);
      }
      v5 += (int64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) countOfTexts];
    }
    id v4 = [(NSMutableArray *)effects countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (id)nearestLayerGroup
{
  id v2 = [(MPEffectContainer *)self parentLayer];
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    id v2 = [v2 parent];
    objc_opt_class();
  }
  return v2;
}

- (int64_t)countOfEffects
{
  return (int64_t)[(NSMutableArray *)self->_effects count];
}

- (id)objectInEffectsAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_effects objectAtIndex:a3];
}

- (void)insertObject:(id)a3 inEffectsAtIndex:(int64_t)a4
{
  uint64_t v6 = +[NSArray arrayWithObject:a3];
  [(MPEffectContainer *)self insertEffects:v6 atIndex:a4];
}

- (void)removeObjectFromEffectsAtIndex:(int64_t)a3
{
  id v4 = +[NSIndexSet indexSetWithIndex:a3];
  [(MPEffectContainer *)self removeEffectsAtIndices:v4];
}

- (void)replaceObjectInEffectsAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPEffectContainer *)self removeEffectsAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  id v7 = +[NSArray arrayWithObject:a4];
  [(MPEffectContainer *)self insertEffects:v7 atIndex:a3];
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
  [(MPEffectContainer *)self insertFilters:v6 atIndex:a4];
}

- (void)removeObjectFromFiltersAtIndex:(int64_t)a3
{
  id v4 = +[NSIndexSet indexSetWithIndex:a3];
  [(MPEffectContainer *)self removeFiltersAtIndices:v4];
}

- (void)replaceObjectInFiltersAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPEffectContainer *)self removeFiltersAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  id v7 = +[NSArray arrayWithObject:a4];
  [(MPEffectContainer *)self insertFilters:v7 atIndex:a3];
}

- (id)scriptingTransition
{
  if (self->_transition)
  {
    id v3 = +[NSMutableDictionary dictionary];
    objc_msgSend(v3, "setObject:forKey:", -[MPTransition transitionID](self->_transition, "transitionID"), @"transitionID");
    objc_msgSend(v3, "setObject:forKey:", -[MPTransition presetID](self->_transition, "presetID"), @"presetID");
    [(MPTransition *)self->_transition duration];
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"duration");
    return v3;
  }
  else
  {
    return +[NSDictionary dictionary];
  }
}

- (void)setScriptingTransition:(id)a3
{
  if ([a3 objectForKey:@"transitionID"])
  {
    if (objc_msgSend(objc_msgSend(a3, "objectForKey:", @"transitionID"), "isEqualToString:", &stru_1AC850))
    {
      int64_t v5 = 0;
    }
    else
    {
      int64_t v5 = +[MPTransition transitionWithTransitionID:](MPTransition, "transitionWithTransitionID:", [a3 objectForKey:@"transitionID"]);
      if ([a3 objectForKey:@"presetID"]) {
        -[MPTransition setPresetID:](v5, "setPresetID:", [a3 objectForKey:@"presetID"]);
      }
      if ([a3 objectForKey:@"duration"])
      {
        objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duration"), "doubleValue");
        -[MPTransition setDuration:](v5, "setDuration:");
      }
    }
    [(MPEffectContainer *)self setTransition:v5];
  }
}

@end