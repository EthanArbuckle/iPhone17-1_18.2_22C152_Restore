@interface MPLayerGroup
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)autoAdjustDuration;
- (BOOL)detectFacesInBackground;
- (BOOL)isTriggered;
- (BOOL)layersCanPositionZIndex;
- (BOOL)nearingEndWithOptions:(id)a3;
- (BOOL)startsPaused;
- (CGColor)backgroundCGColor;
- (CGPoint)position;
- (CGSize)size;
- (MPLayerGroup)init;
- (NSArray)audioPaths;
- (NSArray)videoPaths;
- (NSDictionary)initialState;
- (NSString)uuid;
- (double)aspectRatioDidChange:(double)a3 atTime:(double)a4;
- (double)duration;
- (double)durationPadding;
- (double)numberOfLoops;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)posterTime;
- (double)rotationAngle;
- (double)scale;
- (double)timeIn;
- (double)videoDuration;
- (double)xRotationAngle;
- (double)yRotationAngle;
- (double)zPosition;
- (id)absoluteVideoPaths;
- (id)actionForKey:(id)a3;
- (id)actionableObjectForID:(id)a3;
- (id)actions;
- (id)allEffectContainers;
- (id)allEffects;
- (id)allSlides:(BOOL)a3;
- (id)allSongs;
- (id)animationPathForKey:(id)a3;
- (id)animationPaths;
- (id)audioPlaylist;
- (id)authoredVersionInfo;
- (id)authoringOptionForKey:(id)a3;
- (id)authoringOptions;
- (id)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyedLayers;
- (id)layerForKey:(id)a3;
- (id)layerKey;
- (id)layerKeyDictionary;
- (id)layers;
- (id)liveLock;
- (id)mainLayers;
- (id)navigatorKey;
- (id)objectID;
- (id)objectInLayersAtIndex:(int64_t)a3;
- (id)observer;
- (id)orderedVideoPaths;
- (id)parent;
- (id)parentDocument;
- (id)plug;
- (id)plugID;
- (id)styleID;
- (id)valueInLayersWithName:(id)a3;
- (int64_t)countOfLayers;
- (int64_t)lastSlideUsed;
- (int64_t)zIndex;
- (unint64_t)loopingMode;
- (unint64_t)setStyleID:(id)a3;
- (void)addAudioPath:(id)a3;
- (void)addAudioPaths:(id)a3;
- (void)addLayer:(id)a3;
- (void)addLayers:(id)a3;
- (void)addVideoPath:(id)a3;
- (void)addVideoPaths:(id)a3;
- (void)cleanup;
- (void)configureActions;
- (void)copyActions:(id)a3;
- (void)copyAnimationPaths:(id)a3;
- (void)copyAudioPlaylist:(id)a3;
- (void)copyLayerDictionary:(id)a3;
- (void)copyLayers:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)insertLayers:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inLayersAtIndex:(int64_t)a4;
- (void)moveLayersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)reconfigureLoopingMode;
- (void)reconnectAll;
- (void)removeActionForKey:(id)a3;
- (void)removeAllAudioPaths;
- (void)removeAllLayers;
- (void)removeAllVideoPaths;
- (void)removeAnimationPathForKey:(id)a3;
- (void)removeLayerForKey:(id)a3;
- (void)removeLayersAtIndices:(id)a3;
- (void)removeObjectFromLayersAtIndex:(int64_t)a3;
- (void)removePath:(id)a3;
- (void)removePaths:(id)a3;
- (void)replaceObjectInLayersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)resetDuration;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setAnimationPath:(id)a3 forKey:(id)a4;
- (void)setAudioPaths:(id)a3;
- (void)setAudioPlaylist:(id)a3;
- (void)setAuthoredVersionInfo:(id)a3;
- (void)setAuthoringOption:(id)a3 forKey:(id)a4;
- (void)setAuthoringOptions:(id)a3;
- (void)setAutoAdjustDuration:(BOOL)a3;
- (void)setBackgroundCGColor:(CGColor *)a3;
- (void)setBackgroundColorString:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDuration:(double)a3;
- (void)setDurationPadding:(double)a3;
- (void)setInitialState:(id)a3;
- (void)setIsDocumentLayerGroup:(BOOL)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setLastSlideUsed:(int64_t)a3;
- (void)setLayer:(id)a3 forKey:(id)a4;
- (void)setLoopingMode:(unint64_t)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setOpacity:(double)a3;
- (void)setParent:(id)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPlug:(id)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRotationAngle:(double)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setStartsPaused:(BOOL)a3;
- (void)setTimeIn:(double)a3;
- (void)setUsedAllPaths:(BOOL)a3;
- (void)setVideoPaths:(id)a3;
- (void)setXRotationAngle:(double)a3;
- (void)setYRotationAngle:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)setZPosition:(double)a3;
@end

@implementation MPLayerGroup

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if (([a3 isEqualToString:@"layers"] & 1) != 0
    || ([a3 isEqualToString:@"numberOfLoops"] & 1) != 0
    || ([a3 isEqualToString:@"audioPlaylist"] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [a3 isEqualToString:@"backgroundColor"] ^ 1;
  }
}

- (MPLayerGroup)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPLayerGroup;
  v2 = [(MPLayerGroup *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(MPLayerGroupInternal);
    v2->_userProvidedVideoPaths = 0;
    v2->_userProvidedAudioPaths = 0;
    v2->_internal = v3;
    v2->_layers = 0;
    v2->_layerDictionary = 0;
    v2->_animationPaths = 0;
    v2->_actions = 0;
    v2->_authoringOptions = 0;
    [(MPLayerGroupInternal *)v2->_internal setUuid:+[MPUtilities stringWithNewUUID]];
    [(MPLayerGroupInternal *)v2->_internal setLayerKeyDictionary:0];
    [(MPLayerGroupInternal *)v2->_internal setNumberOfLoops:1.0];
    [(MPLayerGroupInternal *)v2->_internal setLoopingMode:0];
    [(MPLayerGroupInternal *)v2->_internal setDurationPadding:0.0];
    [(MPLayerGroupInternal *)v2->_internal setDuration:0.0];
    [(MPLayerGroupInternal *)v2->_internal setTimeIn:0.0];
    [(MPLayerGroupInternal *)v2->_internal setStartsPaused:0];
    [(MPLayerGroupInternal *)v2->_internal setIsTriggered:0];
    [(MPLayerGroupInternal *)v2->_internal setPhaseInDuration:0.0];
    [(MPLayerGroupInternal *)v2->_internal setPhaseOutDuration:0.0];
    [(MPLayerGroupInternal *)v2->_internal setSendLiveNotification:0];
    [(MPLayerGroupInternal *)v2->_internal setLiveLock:objc_alloc_init((Class)NSRecursiveLock)];
    [(NSRecursiveLock *)[(MPLayerGroupInternal *)v2->_internal liveLock] setName:@"MPLayerGroupInternal.liveLock"];
    [(MPLayerGroupInternal *)v2->_internal setAutoAdjustDuration:1];
    [(MPLayerGroupInternal *)v2->_internal setIsDocumentLayerGroup:0];
    [(MPLayerGroupInternal *)v2->_internal setOpacity:1.0];
    -[MPLayerGroupInternal setPosition:](v2->_internal, "setPosition:", CGPointZero.x, CGPointZero.y);
    [(MPLayerGroupInternal *)v2->_internal setZPosition:0.0];
    -[MPLayerGroupInternal setSize:](v2->_internal, "setSize:", 2.0, 2.0);
    [(MPLayerGroupInternal *)v2->_internal setXRotationAngle:0.0];
    [(MPLayerGroupInternal *)v2->_internal setYRotationAngle:0.0];
    [(MPLayerGroupInternal *)v2->_internal setScale:1.0];
    [(MPLayerGroupInternal *)v2->_internal setZIndex:0];
    v2->_audioPlaylist = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copyStruct:self->_internal];
  [v4 copyLayers:self->_layers];
  [v4 copyLayerDictionary:self->_layerDictionary];
  [v4 copyAudioPlaylist:self->_audioPlaylist];
  [v4 copyAnimationPaths:self->_animationPaths];
  [v4 copyActions:self->_actions];
  [v4 setVideoPaths:self->_userProvidedVideoPaths];
  [v4 setAudioPaths:self->_userProvidedAudioPaths];
  [v4 setAuthoringOptions:self->_authoringOptions];
  return v4;
}

- (void)dealloc
{
  v3 = [(MPLayerGroupInternal *)self->_internal liveLock];
  [(NSRecursiveLock *)v3 lock];
  [(MPLayerGroup *)self cleanup];

  self->_internal = 0;
  self->_parallelizer = 0;

  self->_plug = 0;
  self->_layers = 0;

  self->_layerDictionary = 0;
  self->_animationPaths = 0;

  self->_actions = 0;
  self->_audioPlaylist = 0;

  self->_authoringOptions = 0;
  self->_userProvidedVideoPaths = 0;

  self->_userProvidedAudioPaths = 0;
  [(NSRecursiveLock *)v3 unlock];

  v4.receiver = self;
  v4.super_class = (Class)MPLayerGroup;
  [(MPLayerGroup *)&v4 dealloc];
}

- (id)navigatorKey
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  id v4 = [self->_parent layerKeyDictionary];
  objc_super v5 = [(MPLayerGroup *)self uuid];
  return [v4 objectForKey:v5];
}

- (id)styleID
{
  return [(NSMutableDictionary *)self->_authoringOptions objectForKey:kMPAuthoringStyleID];
}

- (unint64_t)setStyleID:(id)a3
{
  id v5 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "antialiasLevelForStyleID:", -[MPLayerGroup styleID](self, "styleID"));
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] lock];
  authoringOptions = self->_authoringOptions;
  if (!authoringOptions)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_authoringOptions = v7;
    [(NSMutableDictionary *)v7 setObject:@"Classic" forKey:kMPAuthoringStyleID];
    v8 = self->_authoringOptions;
    v9 = +[NSNumber numberWithInteger:0];
    [(NSMutableDictionary *)v8 setObject:v9 forKey:kMPAuthoringAudioScalingMode];
    authoringOptions = self->_authoringOptions;
  }
  [(NSMutableDictionary *)authoringOptions setObject:a3 forKey:kMPAuthoringStyleID];
  id v10 = [(NSMutableDictionary *)self->_authoringOptions objectForKey:@"wasLive"];
  if (objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "needsToBeLiveForStyleID:", a3))
  {
    if (objc_msgSend(-[NSMutableDictionary objectForKey:](self->_authoringOptions, "objectForKey:", kMPAuthoringLive), "BOOLValue"))goto LABEL_10; {
    v11 = self->_authoringOptions;
    }
    v12 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)v11 setObject:v12 forKey:kMPAuthoringLive];
    v13 = self->_authoringOptions;
    v14 = +[NSNumber numberWithBool:0];
    CFStringRef v15 = @"wasLive";
    goto LABEL_9;
  }
  if (v10 && ([v10 BOOLValue] & 1) == 0)
  {
    v13 = self->_authoringOptions;
    v14 = +[NSNumber numberWithBool:0];
    CFStringRef v15 = kMPAuthoringLive;
LABEL_9:
    [(NSMutableDictionary *)v13 setObject:v14 forKey:v15];
    [(MPLayerGroupInternal *)self->_internal setSendLiveNotification:1];
  }
LABEL_10:
  id v16 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:self->_authoringOptions];
  unsigned int v17 = objc_msgSend(objc_msgSend(v16, "objectForKey:", kMPAuthoringLive), "BOOLValue");
  unsigned int v18 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "isDynamicForStyleID:", a3);
  if (!v17) {
    goto LABEL_20;
  }
  unsigned int v19 = v18;
  id v20 = [v16 objectForKey:kMPAuthoringLiveMaxSlidePreload];
  if (!v20)
  {
    v21 = (unsigned char *)(&dword_C + 3);
    if (!v19) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v21 = (char *)[v20 integerValue];
  if (v19)
  {
LABEL_13:
    v21 = (char *)objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "dynamicBatchSizeForStyleID:", a3);
    v22 = +[NSNumber numberWithInteger:v21];
    [v16 setObject:v22 forKey:kMPAuthoringDynamicMinimumSlidesToAdd];
  }
LABEL_14:
  int64_t v23 = [(MPLayerGroup *)self lastSlideUsed];
  v24 = (char *)[(NSMutableArray *)self->_userProvidedVideoPaths count];
  if (&v24[-v23] < v21) {
    v21 = &v24[-v23];
  }
  id v25 = [v16 objectForKeyedSubscript:kMPAuthoringUseTitleEffect];
  if (!v25 || [v25 BOOLValue])
  {
    v26 = +[NSNumber numberWithBool:v23 == 0];
    [v16 setObject:v26 forKey:kMPAuthoringUseTitleEffect];
  }
  v27 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v23, v21);
  [v16 setObject:v27 forKey:kMPAuthoringVideoPathIndicies];
  v28 = +[NSNumber numberWithBool:1];
  [v16 setObject:v28 forKey:kMPAuthoringLiveReset];
LABEL_20:
  id v29 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authorLayerGroup:inDocument:withOptions:", self, -[MPLayerGroup parentDocument](self, "parentDocument"), v16);
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] unlock];

  if (v29 != (id)-1)
  {
    [(MPLayerGroup *)self reconfigureLoopingMode];
    if (v5 != objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "antialiasLevelForStyleID:", a3))-[NSNotificationCenter postNotificationName:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:", @"documentAntialiasLevelDidChange", -[MPLayerGroup parentDocument](self, "parentDocument")); {
  }
    }
  if ([(MPLayerGroupInternal *)self->_internal sendLiveNotification])
  {
    v30 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v30 postNotificationName:kMPAuthoringLiveDidChangeNotification object:[(MPLayerGroup *)self parentDocument] userInfo:0];
    [(MPLayerGroupInternal *)self->_internal setSendLiveNotification:0];
  }
  if (v17)
  {
    id v31 = [(MPLayerGroup *)self authoringOptions];
    id v32 = [v31 objectForKey:kMPAuthoringLiveMissedImages];
    if (v32) {
      v33 = (char *)[v32 count];
    }
    else {
      v33 = 0;
    }
    unint64_t v34 = [(MPLayerGroup *)self lastSlideUsed];
    if ((char *)v34 >= &v33[(void)[(NSMutableArray *)self->_userProvidedVideoPaths count]]
      || [(MPLayerGroupInternal *)self->_internal usedAllPaths])
    {
      v35 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v35 postNotificationName:kMPAuthoringLiveUsedAllPathsNotification object:[(MPLayerGroup *)self parentDocument] userInfo:0];
      if ((char *)[(MPLayerGroup *)self loopingMode] == (char *)&dword_4 + 1
        || (char *)[(MPLayerGroup *)self loopingMode] == (char *)&dword_0 + 2)
      {
        if (v34 >= (unint64_t)[(NSMutableArray *)self->_userProvidedVideoPaths count]) {
          unint64_t v36 = 0;
        }
        else {
          unint64_t v36 = v34;
        }
        [(MPLayerGroup *)self setLastSlideUsed:v36];
      }
    }
    [(MPLayerGroupInternal *)self->_internal setUsedAllPaths:0];
  }
  return (unint64_t)v29;
}

- (id)authoringOptions
{
  return self->_authoringOptions;
}

- (void)setAuthoringOption:(id)a3 forKey:(id)a4
{
  authoringOptions = self->_authoringOptions;
  objc_sync_enter(authoringOptions);
  if (!self->_authoringOptions)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_authoringOptions = v8;
    [(NSMutableDictionary *)v8 setObject:@"Classic" forKey:kMPAuthoringStyleID];
    v9 = self->_authoringOptions;
    id v10 = +[NSNumber numberWithInteger:0];
    [(NSMutableDictionary *)v9 setObject:v10 forKey:kMPAuthoringAudioScalingMode];
  }
  if (a3)
  {
    v11 = +[NSNull null];
    v12 = self->_authoringOptions;
    if (v11 != a3)
    {
      [(NSMutableDictionary *)v12 setObject:a3 forKey:a4];
      goto LABEL_8;
    }
  }
  else
  {
    v12 = self->_authoringOptions;
  }
  [(NSMutableDictionary *)v12 removeObjectForKey:a4];
LABEL_8:
  objc_sync_exit(authoringOptions);
}

- (id)authoringOptionForKey:(id)a3
{
  authoringOptions = self->_authoringOptions;
  objc_sync_enter(authoringOptions);
  id v6 = [(NSMutableDictionary *)self->_authoringOptions objectForKey:a3];
  objc_sync_exit(authoringOptions);
  return v6;
}

- (void)setAuthoringOptions:(id)a3
{
  authoringOptions = self->_authoringOptions;
  objc_sync_enter(authoringOptions);
  if (!self->_authoringOptions)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->_authoringOptions = v6;
    [(NSMutableDictionary *)v6 setObject:@"Classic" forKey:kMPAuthoringStyleID];
    v7 = self->_authoringOptions;
    v8 = +[NSNumber numberWithInteger:0];
    [(NSMutableDictionary *)v7 setObject:v8 forKey:kMPAuthoringAudioScalingMode];
  }
  if ([a3 objectForKey:kMPAuthoringLive])
  {
    if (objc_msgSend(-[MPLayerGroup layers](self, "layers"), "count"))
    {
      v9 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v9 postNotificationName:kMPAuthoringLiveDidChangeNotification object:[(MPLayerGroup *)self parentDocument] userInfo:0];
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = 1;
    }
    [(MPLayerGroupInternal *)self->_internal setSendLiveNotification:v10];
  }
  [(NSMutableDictionary *)self->_authoringOptions removeAllObjects];
  [(NSMutableDictionary *)self->_authoringOptions addEntriesFromDictionary:a3];
  objc_sync_exit(authoringOptions);
}

- (id)layers
{
  return self->_layers;
}

- (void)addLayer:(id)a3
{
  id v4 = +[NSArray arrayWithObject:a3];
  id v5 = [(NSMutableArray *)self->_layers count];
  [(MPLayerGroup *)self insertLayers:v4 atIndex:v5];
}

- (void)addLayers:(id)a3
{
  id v5 = [(NSMutableArray *)self->_layers count];
  [(MPLayerGroup *)self insertLayers:a3 atIndex:v5];
}

- (void)insertLayers:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_layers) {
    self->_layers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChange:valuesAtIndexes:forKey:", 2, v7, @"layers");
  unsigned int v19 = v7;
  [(NSMutableArray *)self->_layers insertObjects:a3 atIndexes:v7];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(a3);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v12 setParent:self];
        +[MPUtilities createPlugInContainer:forLayer:key:inDocument:](MPUtilities, "createPlugInContainer:forLayer:key:inDocument:", self->_parallelizer, v12, +[MPUtilities stringWithNewUUID], [(MPLayerGroup *)self parentDocument]);
      }
      id v9 = [a3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
  if (self->_parallelizer)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    layers = self->_layers;
    id v14 = [(NSMutableArray *)layers countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      __int16 v16 = 0;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(layers);
          }
          objc_msgSend(objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)j), "plug"), "setZIndex:", (__int16)(v16 + (_WORD)j));
        }
        id v15 = [(NSMutableArray *)layers countByEnumeratingWithState:&v21 objects:v29 count:16];
        v16 += (__int16)j;
      }
      while (v15);
    }
  }
  if ([(MPLayerGroup *)self parentDocument]) {
    [(MPLayerGroup *)self reconfigureLoopingMode];
  }
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "didChange:valuesAtIndexes:forKey:", 2, v19, @"layers");
}

- (void)removeAllLayers
{
  objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "lock");
  id v3 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, -[NSMutableArray count](self->_layers, "count"));
  [(MPLayerGroup *)self removeLayersAtIndices:v3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMutableDictionary *)self->_layerDictionary allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MPLayerGroup *)self removeLayerForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "unlock");
}

- (void)removeLayersAtIndices:(id)a3
{
  objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "lock");
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChange:valuesAtIndexes:forKey:", 3, a3, @"layers");
  id v5 = [a3 lastIndex];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (id i = v5; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
    {
      id v7 = [(NSMutableArray *)self->_layers objectAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v7 reconnectAllTransitions];
      }
      if (self->_parallelizer)
      {
        objc_opt_respondsToSelector();
        -[MCContainerParallelizer removePlug:](self->_parallelizer, "removePlug:", [v7 plug]);
        [v7 setPlug:0];
      }
      [v7 setParent:0];
      if (objc_opt_respondsToSelector()) {
        [v7 setMontage:0];
      }
      if (objc_opt_respondsToSelector())
      {
        [v7 setLayerSerializer:0];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v7 setLayerEffect:0];
      }
      else if (objc_opt_respondsToSelector())
      {
        [v7 setContainer:0];
      }
      else
      {
        NSLog(@"what kind of container is that?!?!?");
      }
    }
  }
  [(NSMutableArray *)self->_layers removeObjectsAtIndexes:a3];
  if (self->_parallelizer)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    layers = self->_layers;
    id v9 = [(NSMutableArray *)layers countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      __int16 v11 = 0;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(layers);
          }
          id v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
          objc_opt_respondsToSelector();
          objc_msgSend(objc_msgSend(v14, "plug"), "setZIndex:", (__int16)(v11 + (_WORD)j));
        }
        id v10 = [(NSMutableArray *)layers countByEnumeratingWithState:&v16 objects:v20 count:16];
        v11 += (__int16)j;
      }
      while (v10);
    }
  }
  [(MPLayerGroup *)self resetDuration];
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "didChange:valuesAtIndexes:forKey:", 3, a3, @"layers");
  objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "unlock");
}

- (void)moveLayersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChangeValueForKey:", @"layers");
  parallelizer = self->_parallelizer;
  if (parallelizer)
  {
    id v8 = +[NSMutableArray arrayWithArray:[(MCContainerParallelizer *)parallelizer zOrderedPlugs]];
    id v9 = [(NSMutableArray *)v8 objectsAtIndexes:a3];
    [(NSMutableArray *)v8 removeObjectsAtIndexes:a3];
    -[NSMutableArray insertObjects:atIndexes:](v8, "insertObjects:atIndexes:", v9, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [v9 count]));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      __int16 v12 = 0;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (id i = 0; i != v11; id i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * i) setZIndex:(__int16)(v12 + (_WORD)i)];
        }
        id v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        v12 += (__int16)i;
      }
      while (v11);
    }
  }
  id v15 = [(NSMutableArray *)self->_layers objectsAtIndexes:a3];
  [(NSMutableArray *)self->_layers removeObjectsAtIndexes:a3];
  -[NSMutableArray insertObjects:atIndexes:](self->_layers, "insertObjects:atIndexes:", v15, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [v15 count]));
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "didChangeValueForKey:", @"layers");
}

- (double)videoDuration
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  layers = self->_layers;
  id v3 = [(NSMutableArray *)layers countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    double v6 = 0.0;
    while (1)
    {
      for (id i = 0; i != v4; id i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(layers);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 conformsToProtocol:&OBJC_PROTOCOL___MPNavigatorSupportInternal])
        {
          [v8 duration];
        }
        else
        {
          if ([v8 isAudioLayer]) {
            continue;
          }
          [v8 timeIn];
          double v11 = v10;
          [v8 duration];
          double v9 = v11 + v12;
        }
        if (v9 >= v6) {
          double v6 = v9;
        }
      }
      id v4 = [(NSMutableArray *)layers countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v4) {
        return v6;
      }
    }
  }
  return 0.0;
}

- (double)duration
{
  if ([(MPLayerGroupInternal *)self->_internal autoAdjustDuration])
  {
    audioPlaylist = self->_audioPlaylist;
    if (audioPlaylist)
    {
      [(MPAudioPlaylist *)audioPlaylist duration];
      double v5 = v4;
    }
    else
    {
      double v5 = 0.0;
    }
    [(MPLayerGroup *)self videoDuration];
    if (result < v5) {
      return v5;
    }
  }
  else
  {
    internal = self->_internal;
    [(MPLayerGroupInternal *)internal duration];
  }
  return result;
}

- (void)setDuration:(double)a3
{
  [(MPLayerGroupInternal *)self->_internal duration];
  if (a3 >= 0.0 || v5 != a3)
  {
    [(MPLayerGroupInternal *)self->_internal setDuration:a3];
    if (self->_plug)
    {
      [(MPLayerGroupInternal *)self->_internal phaseInDuration];
      double v8 = a3 - v7;
      [(MPLayerGroupInternal *)self->_internal phaseOutDuration];
      double v10 = v8 - v9;
      if (v10 < 0.0) {
        double v10 = 0.0;
      }
      plug = self->_plug;
      [(MCPlug *)plug setLoopDuration:v10];
    }
  }
}

- (double)timeIn
{
  [(MPLayerGroupInternal *)self->_internal timeIn];
  return result;
}

- (void)setTimeIn:(double)a3
{
  -[MPLayerGroupInternal setTimeIn:](self->_internal, "setTimeIn:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setTimeIn:a3];
  }
}

- (BOOL)isTriggered
{
  return [(MPLayerGroupInternal *)self->_internal isTriggered];
}

- (void)setIsTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPLayerGroupInternal setIsTriggered:](self->_internal, "setIsTriggered:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlugParallel *)plug setIsTriggered:v3];
  }
}

- (BOOL)startsPaused
{
  return [(MPLayerGroupInternal *)self->_internal startsPaused];
}

- (void)setStartsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  -[MPLayerGroupInternal setStartsPaused:](self->_internal, "setStartsPaused:");
  plug = self->_plug;
  if (plug)
  {
    [(MCPlug *)plug setStartsPaused:v3];
  }
}

- (id)parent
{
  return self->_parent;
}

- (id)audioPlaylist
{
  return self->_audioPlaylist;
}

- (void)setAudioPlaylist:(id)a3
{
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChangeValueForKey:", @"audioPlaylist");
  id v5 = [(MPLayerGroup *)self parentDocument];
  if (self->_audioPlaylist)
  {
    if ([(MPLayerGroupInternal *)self->_internal backgroundAudioID]) {
      [(MCContainerParallelizer *)self->_parallelizer removePlugForID:[(MPLayerGroupInternal *)self->_internal backgroundAudioID]];
    }
    if (v5 && [v5 documentLayerGroup] == self)
    {
      [(MPAudioPlaylist *)self->_audioPlaylist fadeOutDuration];
      objc_msgSend(v5, "setAudioFadeOutDuration:");
    }
    [(MPAudioPlaylist *)self->_audioPlaylist setPlug:0];
    [(MPAudioPlaylist *)self->_audioPlaylist setParentObject:0];
    [(MPAudioPlaylist *)self->_audioPlaylist setMontage:0];
    [(MPAudioPlaylist *)self->_audioPlaylist setAudioPlaylist:0];

    self->_audioPlaylist = 0;
  }
  if (a3)
  {
    double v6 = (MPAudioPlaylist *)a3;
    self->_audioPlaylist = v6;
    [(MPAudioPlaylist *)v6 setParentObject:self];
    if (self->_parallelizer)
    {
      if (v5 && [v5 documentLayerGroup] == self)
      {
        if (![(MPLayerGroupInternal *)self->_internal backgroundAudioID]) {
          [(MPLayerGroupInternal *)self->_internal setBackgroundAudioID:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ba%@", +[MPUtilities stringWithNewUUID])];
        }
        id v7 = objc_msgSend(objc_msgSend(v5, "montage"), "createParallelizerContainer");
        id v8 = [(MCContainerParallelizer *)self->_parallelizer setPlugForContainer:v7 forID:[(MPLayerGroupInternal *)self->_internal backgroundAudioID]];
        [v8 setLoopDuration:0.0];
        [v8 setZIndex:100];
        -[MPAudioPlaylist setMontage:](self->_audioPlaylist, "setMontage:", [v5 montage]);
        -[MPAudioPlaylist setAudioPlaylist:](self->_audioPlaylist, "setAudioPlaylist:", [v7 audioPlaylistCreateIfNeeded]);
        [(MPAudioPlaylist *)self->_audioPlaylist setPlug:v8];
        [(MPAudioPlaylist *)self->_audioPlaylist fadeOutDuration];
        objc_msgSend(v5, "setAudioFadeOutDuration:");
      }
      else
      {
        -[MPAudioPlaylist setMontage:](self->_audioPlaylist, "setMontage:", [v5 montage]);
        [(MPAudioPlaylist *)self->_audioPlaylist setAudioPlaylist:[(MCContainer *)self->_parallelizer audioPlaylistCreateIfNeeded]];
        [(MPAudioPlaylist *)self->_audioPlaylist setPlug:self->_plug];
      }
    }
  }
  [(MPLayerGroup *)self reconfigureLoopingMode];
  id v9 = [(MPLayerGroup *)self observer];
  [v9 didChangeValueForKey:@"audioPlaylist"];
}

- (unint64_t)loopingMode
{
  return [(MPLayerGroupInternal *)self->_internal loopingMode];
}

- (void)setLoopingMode:(unint64_t)a3
{
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChangeValueForKey:", @"loopingMode");
  [(MPLayerGroupInternal *)self->_internal setLoopingMode:a3];
  [(MPLayerGroup *)self reconfigureLoopingMode];
  id v5 = [(MPLayerGroup *)self observer];
  [v5 didChangeValueForKey:@"loopingMode"];
}

- (CGColor)backgroundCGColor
{
  return [(MPLayerGroupInternal *)self->_internal backgroundColor];
}

- (void)setBackgroundColorString:(id)a3
{
  double v4 = +[MPUtilities CGColorFromString:a3];
  [(MPLayerGroup *)self setBackgroundCGColor:v4];
}

- (void)setBackgroundCGColor:(CGColor *)a3
{
  double v4 = self;
  objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChangeValueForKey:", @"backgroundColor");
  if (CGColorGetNumberOfComponents(a3) == 2)
  {
    id v5 = +[MPUtilities newColorSpaceForDevice];
    double v6 = CGColorGetComponents(a3);
    components[0] = *v6;
    components[1] = *v6;
    components[2] = *v6;
    components[3] = v6[1];
    id v7 = CGColorCreate(v5, components);
    parallelizer = v4->_parallelizer;
    if (parallelizer) {
      [(MCContainerParallelizer *)parallelizer setBackgroundColor:v7];
    }
    [(MPLayerGroupInternal *)v4->_internal setBackgroundColor:a3];
    CGColorSpaceRelease(v5);
    CGColorRelease(v7);
  }
  else
  {
    [(MPLayerGroupInternal *)v4->_internal setBackgroundColor:a3];
    id v9 = v4->_parallelizer;
    if (v9) {
      [(MCContainerParallelizer *)v9 setBackgroundColor:a3];
    }
  }
  objc_msgSend(-[MPLayerGroup observer](v4, "observer"), "didChangeValueForKey:", @"backgroundColor");
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "backgroundColorLayersForStyleID:", -[MPLayerGroup styleID](v4, "styleID"));
  id v25 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v47;
    long long v24 = v4;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v10;
        uint64_t v29 = *(void *)(*((void *)&v46 + 1) + 8 * v10);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v27 = [(MPLayerGroup *)v4 layers];
        id v30 = [v27 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v30)
        {
          uint64_t v28 = *(void *)v43;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v43 != v28) {
                objc_enumerationMutation(v27);
              }
              uint64_t v31 = v11;
              double v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
              if (objc_msgSend(objc_msgSend(v12, "layerID"), "isEqualToString:", v29))
              {
                long long v40 = 0u;
                long long v41 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                id v32 = [v12 effectContainers];
                id v13 = [v32 countByEnumeratingWithState:&v38 objects:v51 count:16];
                if (v13)
                {
                  id v14 = v13;
                  uint64_t v33 = *(void *)v39;
                  do
                  {
                    long long v15 = 0;
                    do
                    {
                      if (*(void *)v39 != v33) {
                        objc_enumerationMutation(v32);
                      }
                      long long v16 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v15);
                      long long v34 = 0u;
                      long long v35 = 0u;
                      long long v36 = 0u;
                      long long v37 = 0u;
                      id v17 = [v16 effects];
                      id v18 = [v17 countByEnumeratingWithState:&v34 objects:v50 count:16];
                      if (v18)
                      {
                        id v19 = v18;
                        uint64_t v20 = *(void *)v35;
                        do
                        {
                          long long v21 = 0;
                          do
                          {
                            if (*(void *)v35 != v20) {
                              objc_enumerationMutation(v17);
                            }
                            objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * (void)v21), "setEffectAttribute:forKey:", +[MPUtilities stringFromCGColor:](MPUtilities, "stringFromCGColor:", a3), @"backgroundColorAsString");
                            long long v21 = (char *)v21 + 1;
                          }
                          while (v19 != v21);
                          id v19 = [v17 countByEnumeratingWithState:&v34 objects:v50 count:16];
                        }
                        while (v19);
                      }
                      long long v15 = (char *)v15 + 1;
                    }
                    while (v15 != v14);
                    id v14 = [v32 countByEnumeratingWithState:&v38 objects:v51 count:16];
                  }
                  while (v14);
                }
              }
              uint64_t v11 = v31 + 1;
            }
            while ((id)(v31 + 1) != v30);
            id v30 = [v27 countByEnumeratingWithState:&v42 objects:v52 count:16];
          }
          while (v30);
        }
        uint64_t v10 = v26 + 1;
        double v4 = v24;
      }
      while ((id)(v26 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v25);
  }
}

- (NSString)uuid
{
  return [(MPLayerGroupInternal *)self->_internal uuid];
}

- (NSDictionary)initialState
{
  return [(MPLayerGroupInternal *)self->_internal initialState];
}

- (void)setInitialState:(id)a3
{
  parallelizer = self->_parallelizer;
  if (parallelizer) {
    [(MCContainer *)parallelizer setInitialState:a3];
  }
  internal = self->_internal;
  [(MPLayerGroupInternal *)internal setInitialState:a3];
}

- (void)addVideoPath:(id)a3
{
  userProvidedVideoPaths = self->_userProvidedVideoPaths;
  if (!userProvidedVideoPaths)
  {
    userProvidedVideoPaths = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_userProvidedVideoPaths = userProvidedVideoPaths;
  }
  [(NSMutableArray *)userProvidedVideoPaths addObject:a3];
}

- (void)addVideoPaths:(id)a3
{
  userProvidedVideoPaths = self->_userProvidedVideoPaths;
  if (!userProvidedVideoPaths)
  {
    userProvidedVideoPaths = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_userProvidedVideoPaths = userProvidedVideoPaths;
  }
  [(NSMutableArray *)userProvidedVideoPaths addObjectsFromArray:a3];
}

- (void)addAudioPath:(id)a3
{
  userProvidedAudioPaths = self->_userProvidedAudioPaths;
  if (!userProvidedAudioPaths)
  {
    userProvidedAudioPaths = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_userProvidedAudioPaths = userProvidedAudioPaths;
  }
  [(NSMutableArray *)userProvidedAudioPaths addObject:a3];
}

- (void)addAudioPaths:(id)a3
{
  userProvidedAudioPaths = self->_userProvidedAudioPaths;
  if (!userProvidedAudioPaths)
  {
    userProvidedAudioPaths = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_userProvidedAudioPaths = userProvidedAudioPaths;
  }
  [(NSMutableArray *)userProvidedAudioPaths addObjectsFromArray:a3];
}

- (void)removePath:(id)a3
{
  p_userProvidedVideoPaths = (id *)&self->_userProvidedVideoPaths;
  if ((-[NSMutableArray containsObject:](self->_userProvidedVideoPaths, "containsObject:") & 1) == 0)
  {
    userProvidedAudioPaths = self->_userProvidedAudioPaths;
    p_userProvidedAudioPaths = &self->_userProvidedAudioPaths;
    if (![(NSMutableArray *)userProvidedAudioPaths containsObject:a3]) {
      return;
    }
    p_userProvidedVideoPaths = (id *)p_userProvidedAudioPaths;
  }
  id v8 = *p_userProvidedVideoPaths;
  id v9 = [*p_userProvidedVideoPaths indexOfObject:a3];
  [v8 removeObjectAtIndex:v9];
}

- (void)removePaths:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [(MPLayerGroup *)self removePath:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSArray)videoPaths
{
  return &self->_userProvidedVideoPaths->super;
}

- (id)orderedVideoPaths
{
  id v2 = [(MPLayerGroup *)self mainLayers];
  id v3 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v2;
  id v23 = [v2 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v42;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v4;
        id v5 = *(void **)(*((void *)&v41 + 1) + 8 * v4);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v25 = [v5 effectContainers];
        id v27 = [v25 countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v27)
        {
          uint64_t v26 = *(void *)v38;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(void *)v38 != v26) {
                objc_enumerationMutation(v25);
              }
              uint64_t v28 = v6;
              uint64_t v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v8 = [v7 effects];
              id v9 = [v8 countByEnumeratingWithState:&v33 objects:v46 count:16];
              if (v9)
              {
                id v10 = v9;
                uint64_t v11 = *(void *)v34;
                do
                {
                  for (id i = 0; i != v10; id i = (char *)i + 1)
                  {
                    if (*(void *)v34 != v11) {
                      objc_enumerationMutation(v8);
                    }
                    id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                    long long v29 = 0u;
                    long long v30 = 0u;
                    long long v31 = 0u;
                    long long v32 = 0u;
                    id v14 = [v13 slides];
                    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v45 count:16];
                    if (v15)
                    {
                      id v16 = v15;
                      uint64_t v17 = *(void *)v30;
                      do
                      {
                        for (j = 0; j != v16; j = (char *)j + 1)
                        {
                          if (*(void *)v30 != v17) {
                            objc_enumerationMutation(v14);
                          }
                          id v19 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
                          if ([v19 path]) {
                            objc_msgSend(v3, "addObject:", objc_msgSend(v19, "path"));
                          }
                        }
                        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v45 count:16];
                      }
                      while (v16);
                    }
                  }
                  id v10 = [v8 countByEnumeratingWithState:&v33 objects:v46 count:16];
                }
                while (v10);
              }
              uint64_t v6 = v28 + 1;
            }
            while ((id)(v28 + 1) != v27);
            id v27 = [v25 countByEnumeratingWithState:&v37 objects:v47 count:16];
          }
          while (v27);
        }
        uint64_t v4 = v24 + 1;
      }
      while ((id)(v24 + 1) != v23);
      id v23 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v23);
  }
  return v3;
}

- (void)setVideoPaths:(id)a3
{
  userProvidedVideoPaths = self->_userProvidedVideoPaths;
  if (userProvidedVideoPaths) {

  }
  self->_userProvidedVideoPaths = (NSMutableArray *)[a3 mutableCopy];
}

- (NSArray)audioPaths
{
  return &self->_userProvidedAudioPaths->super;
}

- (void)setAudioPaths:(id)a3
{
  userProvidedAudioPaths = self->_userProvidedAudioPaths;
  if (userProvidedAudioPaths) {

  }
  self->_userProvidedAudioPaths = (NSMutableArray *)[a3 mutableCopy];
}

- (void)removeAllVideoPaths
{
}

- (void)removeAllAudioPaths
{
}

- (id)mainLayers
{
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] lock];
  id v3 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfMainLayerForStyleID:", -[MPLayerGroup styleID](self, "styleID"));
  int64_t v4 = [(MPLayerGroup *)self countOfLayers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(MPLayerGroup *)self layers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (id i = 0; i != v7; id i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v4 -= [*(id *)(*((void *)&v13 + 1) + 8 * i) isAudioLayer];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  if ((uint64_t)v3 >= v4) {
    int64_t v10 = v4 - 1;
  }
  else {
    int64_t v10 = (int64_t)v3;
  }
  if (v10 < 0) {
    id v11 = 0;
  }
  else {
    id v11 = -[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:");
  }
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] unlock];
  if (v11) {
    return +[NSArray arrayWithObject:v11];
  }
  else {
    return +[NSArray array];
  }
}

- (double)numberOfLoops
{
  [(MPLayerGroupInternal *)self->_internal numberOfLoops];
  return result;
}

- (void)setNumberOfLoops:(double)a3
{
  if (a3 > 0.0)
  {
    objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChangeValueForKey:", @"numberOfLoops");
    [(MPLayerGroupInternal *)self->_internal setNumberOfLoops:a3];
    plug = self->_plug;
    if (plug)
    {
      [(MCPlug *)plug setNumberOfLoops:a3];
      if ([(MPLayerGroupInternal *)self->_internal autoAdjustDuration])
      {
        [(MPLayerGroup *)self resetDuration];
      }
      else
      {
        [(MPLayerGroupInternal *)self->_internal duration];
        double v8 = v7;
        [(MPLayerGroupInternal *)self->_internal phaseInDuration];
        double v10 = v8 - v9;
        [(MPLayerGroupInternal *)self->_internal phaseOutDuration];
        double v12 = v10 - v11;
        if (v12 < 0.0) {
          double v12 = 0.0;
        }
        [(MCPlug *)self->_plug setLoopDuration:v12];
      }
    }
    id v13 = [(MPLayerGroup *)self observer];
    [v13 didChangeValueForKey:@"numberOfLoops"];
  }
}

- (double)phaseInDuration
{
  [(MPLayerGroupInternal *)self->_internal phaseInDuration];
  return result;
}

- (void)setPhaseInDuration:(double)a3
{
  [(MPLayerGroupInternal *)self->_internal phaseInDuration];
  if (v5 != a3)
  {
    [(MPLayerGroupInternal *)self->_internal setPhaseInDuration:a3];
    plug = self->_plug;
    if (plug)
    {
      [(MCPlug *)plug setPhaseInDuration:a3];
      if ([(MPLayerGroupInternal *)self->_internal autoAdjustDuration])
      {
        [(MPLayerGroup *)self resetDuration];
      }
      else
      {
        [(MPLayerGroupInternal *)self->_internal duration];
        double v8 = v7;
        [(MPLayerGroupInternal *)self->_internal phaseInDuration];
        double v10 = v8 - v9;
        [(MPLayerGroupInternal *)self->_internal phaseOutDuration];
        double v12 = v10 - v11;
        if (v12 < 0.0) {
          double v12 = 0.0;
        }
        id v13 = self->_plug;
        [(MCPlug *)v13 setLoopDuration:v12];
      }
    }
  }
}

- (double)phaseOutDuration
{
  [(MPLayerGroupInternal *)self->_internal phaseOutDuration];
  return result;
}

- (void)setPhaseOutDuration:(double)a3
{
  [(MPLayerGroupInternal *)self->_internal phaseOutDuration];
  if (a3 >= 0.0 && v5 != a3)
  {
    [(MPLayerGroupInternal *)self->_internal setPhaseOutDuration:a3];
    plug = self->_plug;
    if (plug)
    {
      [(MCPlug *)plug setPhaseOutDuration:a3];
      if ([(MPLayerGroupInternal *)self->_internal autoAdjustDuration])
      {
        [(MPLayerGroup *)self resetDuration];
      }
      else
      {
        [(MPLayerGroupInternal *)self->_internal duration];
        double v9 = v8;
        [(MPLayerGroupInternal *)self->_internal phaseInDuration];
        double v11 = v9 - v10;
        [(MPLayerGroupInternal *)self->_internal phaseOutDuration];
        double v13 = v11 - v12;
        if (v13 < 0.0) {
          double v13 = 0.0;
        }
        long long v14 = self->_plug;
        [(MCPlug *)v14 setLoopDuration:v13];
      }
    }
  }
}

- (BOOL)autoAdjustDuration
{
  return [(MPLayerGroupInternal *)self->_internal autoAdjustDuration];
}

- (void)setAutoAdjustDuration:(BOOL)a3
{
}

- (id)layerKey
{
  if (!objc_msgSend(-[MPLayerGroup parent](self, "parent"), "layersCanPositionZIndex")) {
    return 0;
  }
  id v3 = objc_msgSend(-[MPLayerGroup parent](self, "parent"), "layerKeyDictionary");
  int64_t v4 = [(MPLayerGroup *)self uuid];
  return [v3 objectForKey:v4];
}

- (id)keyedLayers
{
  return self->_layerDictionary;
}

- (id)layerForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_layerDictionary objectForKey:a3];
}

- (void)setLayer:(id)a3 forKey:(id)a4
{
  layerDictionary = self->_layerDictionary;
  if (!layerDictionary)
  {
    self->_layerDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(MPLayerGroupInternal *)self->_internal setLayerKeyDictionary:objc_alloc_init((Class)NSMutableDictionary)];
    layerDictionary = self->_layerDictionary;
  }
  if ([(NSMutableDictionary *)layerDictionary objectForKey:a4]) {
    [(MPLayerGroup *)self removeLayerForKey:a4];
  }
  [a3 setParent:self];
  [(NSMutableDictionary *)self->_layerDictionary setObject:a3 forKey:a4];
  -[NSMutableDictionary setObject:forKey:](-[MPLayerGroupInternal layerKeyDictionary](self->_internal, "layerKeyDictionary"), "setObject:forKey:", a4, [a3 uuid]);
  if (self->_plug) {
    +[MPUtilities createPlugInContainer:self->_parallelizer forLayer:a3 key:a4 inDocument:[(MPLayerGroup *)self parentDocument]];
  }
  if ([(MPLayerGroup *)self parentDocument])
  {
    [(MPLayerGroup *)self reconfigureLoopingMode];
    objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "configureActions");
  }
}

- (void)removeLayerForKey:(id)a3
{
  objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "lock");
  id v6 = [(NSMutableDictionary *)self->_layerDictionary objectForKey:a3];
  if (v6)
  {
    double v7 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 reconnectAllTransitions];
    }
    parallelizer = self->_parallelizer;
    if (parallelizer)
    {
      -[MCContainerParallelizer removePlug:](parallelizer, "removePlug:", [v7 plug]);
      [v7 setPlug:0];
    }
    [v7 setParent:0];
    if (objc_opt_respondsToSelector()) {
      [v7 setMontage:0];
    }
    if (objc_opt_respondsToSelector())
    {
      [v7 setLayerSerializer:0];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v7 setLayerEffect:0];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v7 setContainer:0];
    }
    else
    {
      NSLog(@"what kind of container is that?!?!?");
    }
    -[NSMutableDictionary removeObjectForKey:](-[MPLayerGroupInternal layerKeyDictionary](self->_internal, "layerKeyDictionary"), "removeObjectForKey:", [v7 uuid]);
    [(NSMutableDictionary *)self->_layerDictionary removeObjectForKey:a3];
    [(MPLayerGroup *)self resetDuration];
    id v9 = objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage");
    [v9 unlock];
  }
  else
  {
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
    id v7 = [(MPLayerGroup *)self animationPathForKey:a4];
    if (v7)
    {
      double v8 = v7;
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
      double v12 = off_1A4DC0;
      if ((isKindOfClass & 1) == 0) {
        double v12 = off_1A4DC8;
      }
      id v13 = [(__objc2_class *)*v12 animationPathWithKey:a4];
      [(MCPlug *)self->_plug addAnimationPath:v13];
      [a3 setAnimationPath:v13];
    }
  }
  else
  {
    [(MPLayerGroup *)self removeAnimationPathForKey:a4];
  }
}

- (void)removeAnimationPathForKey:(id)a3
{
  id v5 = -[MPLayerGroup animationPathForKey:](self, "animationPathForKey:");
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
  [(MPLayerGroupInternal *)self->_internal opacity];
  return result;
}

- (void)setOpacity:(double)a3
{
  -[MPLayerGroupInternal setOpacity:](self->_internal, "setOpacity:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlugParallel *)plug setOpacity:a3];
    }
  }
}

- (CGPoint)position
{
  [(MPLayerGroupInternal *)self->_internal position];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[MPLayerGroupInternal setPosition:](self->_internal, "setPosition:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      -[MCPlugParallel setPosition:](plug, "setPosition:", x, y);
    }
  }
}

- (double)zPosition
{
  [(MPLayerGroupInternal *)self->_internal zPosition];
  return result;
}

- (void)setZPosition:(double)a3
{
  -[MPLayerGroupInternal setZPosition:](self->_internal, "setZPosition:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlugParallel *)plug setZPosition:a3];
    }
  }
}

- (double)rotationAngle
{
  [(MPLayerGroupInternal *)self->_internal rotationAngle];
  return result;
}

- (void)setRotationAngle:(double)a3
{
  -[MPLayerGroupInternal setRotationAngle:](self->_internal, "setRotationAngle:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlugParallel *)plug setRotationAngle:a3];
    }
  }
}

- (CGSize)size
{
  [(MPLayerGroupInternal *)self->_internal size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[MPLayerGroupInternal setSize:](self->_internal, "setSize:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      -[MCPlugParallel setSize:](plug, "setSize:", width, height);
    }
  }
}

- (double)xRotationAngle
{
  [(MPLayerGroupInternal *)self->_internal xRotationAngle];
  return result;
}

- (void)setXRotationAngle:(double)a3
{
  -[MPLayerGroupInternal setXRotationAngle:](self->_internal, "setXRotationAngle:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlugParallel *)plug setXRotationAngle:a3];
    }
  }
}

- (double)yRotationAngle
{
  [(MPLayerGroupInternal *)self->_internal yRotationAngle];
  return result;
}

- (void)setYRotationAngle:(double)a3
{
  -[MPLayerGroupInternal setYRotationAngle:](self->_internal, "setYRotationAngle:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlugParallel *)plug setYRotationAngle:a3];
    }
  }
}

- (double)scale
{
  [(MPLayerGroupInternal *)self->_internal scale];
  return result;
}

- (void)setScale:(double)a3
{
  -[MPLayerGroupInternal setScale:](self->_internal, "setScale:");
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      plug = self->_plug;
      [(MCPlugParallel *)plug setScale:a3];
    }
  }
}

- (int64_t)zIndex
{
  if (self->_plug)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return [(MCPlugParallel *)self->_plug zIndex];
    }
  }
  internal = self->_internal;
  return [(MPLayerGroupInternal *)internal zIndex];
}

- (void)setZIndex:(int64_t)a3
{
  __int16 v3 = a3;
  -[MPLayerGroupInternal setZIndex:](self->_internal, "setZIndex:");
  if (objc_msgSend(-[MPLayerGroup parent](self, "parent"), "layersCanPositionZIndex"))
  {
    plug = self->_plug;
    if (plug)
    {
      [(MCPlugParallel *)plug setZIndex:v3];
    }
  }
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
    id v7 = [(MPLayerGroup *)self actionForKey:a4];
    if (v7) {
      [v7 setParent:0];
    }
    [a3 setParent:self];
    actions = self->_actions;
    if (!actions)
    {
      actions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->_actions = actions;
    }
    [(NSMutableDictionary *)actions setObject:a3 forKey:a4];
    plug = self->_plug;
    if (plug)
    {
      id v10 = +[MPUtilities createMCAction:a3 forPlug:plug withKey:a4];
      [a3 setAction:v10];
    }
  }
  else
  {
    [(MPLayerGroup *)self removeActionForKey:a4];
  }
}

- (void)removeActionForKey:(id)a3
{
  id v5 = -[MPLayerGroup actionForKey:](self, "actionForKey:");
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

- (id)allEffectContainers
{
  id v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  layers = self->_layers;
  id v5 = [(NSMutableArray *)layers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(layers);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "effectContainers"));
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)layers countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)allEffects
{
  id v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(MPLayerGroup *)self allEffectContainers];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "effects"));
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)allSlides:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [(MPLayerGroup *)self mainLayers];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (id i = 0; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "allSlides:", v3));
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  layerDictionardouble y = self->_layerDictionary;
  id v12 = [(NSMutableDictionary *)layerDictionary countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(layerDictionary);
        }
        objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layerDictionary, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * (void)j)), "allSlides:", v3));
      }
      id v13 = [(NSMutableDictionary *)layerDictionary countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
  return v5;
}

- (id)allSongs
{
  id v3 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  layers = self->_layers;
  id v5 = [(NSMutableArray *)layers countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (id i = 0; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(layers);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "allSongs"));
      }
      id v6 = [(NSMutableArray *)layers countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  layerDictionardouble y = self->_layerDictionary;
  id v10 = [(NSMutableDictionary *)layerDictionary countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(layerDictionary);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layerDictionary, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * (void)j)), "allSongs"));
      }
      id v11 = [(NSMutableDictionary *)layerDictionary countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }
  objc_msgSend(v3, "addObjectsFromArray:", -[MPAudioPlaylist songs](self->_audioPlaylist, "songs"));
  return v3;
}

- (double)posterTime
{
  objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "posterTimeForStyleID:", -[MPLayerGroup styleID](self, "styleID"));
  double v4 = v3;
  if (v3 == -1.0)
  {
    signed int v6 = objc_msgSend(objc_msgSend(-[MPLayerGroup mainLayers](self, "mainLayers"), "lastObject"), "zIndex");
    uint64_t v7 = (unint64_t)[(NSMutableArray *)self->_layers count] <= v6
       ? (char *)[(NSMutableArray *)self->_layers count] - 1
       : (char *)v6;
    double v4 = 1.0;
    if (((unint64_t)v7 & 0x8000000000000000) == 0)
    {
      id v8 = -[MPLayerGroup objectInLayersAtIndex:](self, "objectInLayersAtIndex:");
      if ((uint64_t)[v8 countOfEffectContainers] >= 1)
      {
        uint64_t v9 = objc_msgSend(objc_msgSend(v8, "objectInEffectContainersAtIndex:", 0), "countOfEffects") == 0;
        if ((uint64_t)[v8 countOfEffectContainers] > v9)
        {
          id v10 = objc_msgSend(objc_msgSend(v8, "objectInEffectContainersAtIndex:", v9), "objectInEffectsAtIndex:", 0);
          [v10 phaseInDuration];
          double v4 = v11;
          objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "fadeInDuration");
          if (v4 < v12) {
            double v4 = v12;
          }
          if (v4 == 0.0)
          {
            [v10 mainDuration];
            return v13 * 0.5;
          }
        }
      }
    }
  }
  return v4;
}

- (id)absoluteVideoPaths
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = [(MPLayerGroup *)self videoPaths];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (id i = 0; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v11 + 1) + 8 * i);
        if (+[MPUtilities pathIsRelative:v9]) {
          id v9 = objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "absolutePathForAssetAtPath:", v9);
        }
        [v3 addObject:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)parentDocument
{
  id v2 = [(MPLayerGroup *)self parent];
  objc_opt_class();
  while ((objc_opt_isKindOfClass() & 1) == 0 && v2)
  {
    id v2 = [v2 parent];
    objc_opt_class();
  }
  return v2;
}

- (id)plugID
{
  return [(MCPlugParallel *)self->_plug idInSupercontainer];
}

- (id)objectID
{
  return [(MCObject *)self->_plug objectID];
}

- (BOOL)layersCanPositionZIndex
{
  return self->_layerDictionary != 0;
}

- (id)observer
{
  if (![(MPLayerGroupInternal *)self->_internal isDocumentLayerGroup]
    || !objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "documentLayerGroup"))
  {
    return self;
  }
  return [(MPLayerGroup *)self parentDocument];
}

- (void)setParent:(id)a3
{
  if (a3 && self->_parent) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A layer may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parent = a3;
  if (![(MPLayerGroupInternal *)self->_internal uuid]) {
    [(MPLayerGroupInternal *)self->_internal setUuid:+[MPUtilities stringWithNewUUID]];
  }
  if (self->_parent && objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "assetKeyDelegate"))
  {
    [(MPLayerGroup *)self cachePaths];
  }
}

- (void)configureActions
{
  if ([(MPLayerGroup *)self parentDocument]
    && (objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "isInBatchModify") & 1) == 0)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    layers = self->_layers;
    id v4 = [(NSMutableArray *)layers countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v27;
      do
      {
        for (id i = 0; i != v5; id i = (char *)i + 1)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(layers);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) configureActions];
        }
        id v5 = [(NSMutableArray *)layers countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v5);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = [(NSMutableDictionary *)self->_layerDictionary allValues];
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) configureActions];
        }
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v10);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    actions = self->_actions;
    id v14 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (k = 0; k != v15; k = (char *)k + 1)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(actions);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * (void)k)), "configureTarget");
        }
        id v15 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v18 objects:v30 count:16];
      }
      while (v15);
    }
  }
}

- (id)container
{
  return self->_parallelizer;
}

- (void)setContainer:(id)a3
{
  if (self->_parallelizer)
  {
    if ([(MPLayerGroupInternal *)self->_internal backgroundAudioID]) {
      [(MCContainerParallelizer *)self->_parallelizer removePlugForID:[(MPLayerGroupInternal *)self->_internal backgroundAudioID]];
    }
    [(MCContainer *)self->_parallelizer specialRelease];
    self->_parallelizer = 0;
  }
  id v5 = (MCContainerParallelizer *)[a3 specialRetain];
  self->_parallelizer = v5;
  if (v5)
  {
    if ([(MPLayerGroupInternal *)self->_internal backgroundColor]) {
      [(MCContainerParallelizer *)self->_parallelizer setBackgroundColor:[(MPLayerGroupInternal *)self->_internal backgroundColor]];
    }
    if ([(MPLayerGroupInternal *)self->_internal initialState])
    {
      uint64_t v6 = [(MPLayerGroupInternal *)self->_internal initialState];
      parallelizer = self->_parallelizer;
      [(MCContainer *)parallelizer setInitialState:v6];
    }
  }
  else
  {
    [(MPAudioPlaylist *)self->_audioPlaylist setAudioPlaylist:0];
    audioPlaylist = self->_audioPlaylist;
    [(MPAudioPlaylist *)audioPlaylist setPlug:0];
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
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[MCPlugParallel setSize:](self->_plug, "setSize:", 2.0, 2.0);
      [(MCPlugParallel *)self->_plug setAudioPriority:2];
      [(MPLayerGroup *)self position];
      -[MCPlugParallel setPosition:](self->_plug, "setPosition:");
      [(MPLayerGroup *)self size];
      -[MCPlugParallel setSize:](self->_plug, "setSize:");
      [(MPLayerGroup *)self zPosition];
      -[MCPlugParallel setZPosition:](self->_plug, "setZPosition:");
      [(MPLayerGroup *)self rotationAngle];
      -[MCPlugParallel setRotationAngle:](self->_plug, "setRotationAngle:");
      [(MPLayerGroup *)self xRotationAngle];
      -[MCPlugParallel setXRotationAngle:](self->_plug, "setXRotationAngle:");
      [(MPLayerGroup *)self yRotationAngle];
      -[MCPlugParallel setYRotationAngle:](self->_plug, "setYRotationAngle:");
      [(MPLayerGroup *)self scale];
      -[MCPlugParallel setScale:](self->_plug, "setScale:");
      [(MPLayerGroup *)self opacity];
      -[MCPlugParallel setOpacity:](self->_plug, "setOpacity:");
      [(MPLayerGroup *)self timeIn];
      -[MCPlugParallel setTimeIn:](self->_plug, "setTimeIn:");
      [(MCPlugParallel *)self->_plug setIsTriggered:[(MPLayerGroup *)self isTriggered]];
      [(MCPlug *)self->_plug setStartsPaused:[(MPLayerGroup *)self startsPaused]];
      if (objc_msgSend(-[MPLayerGroup parent](self, "parent"), "layersCanPositionZIndex")) {
        [(MCPlugParallel *)self->_plug setZIndex:(__int16)[(MPLayerGroupInternal *)self->_internal zIndex]];
      }
    }
    if (![(MPLayerGroupInternal *)self->_internal autoAdjustDuration])
    {
      [(MPLayerGroupInternal *)self->_internal duration];
      double v8 = v7;
      [(MPLayerGroupInternal *)self->_internal phaseInDuration];
      double v10 = v8 - v9;
      [(MPLayerGroupInternal *)self->_internal phaseOutDuration];
      double v12 = v10 - v11;
      if (v12 < 0.0) {
        double v12 = 0.0;
      }
      [(MCPlug *)self->_plug setLoopDuration:v12];
      [(MPLayerGroupInternal *)self->_internal numberOfLoops];
      -[MCPlug setNumberOfLoops:](self->_plug, "setNumberOfLoops:");
    }
    [(MPLayerGroup *)self phaseInDuration];
    -[MCPlug setPhaseInDuration:](self->_plug, "setPhaseInDuration:");
    [(MPLayerGroup *)self phaseOutDuration];
    -[MCPlug setPhaseOutDuration:](self->_plug, "setPhaseOutDuration:");
    id obj = self->_layers;
    if (obj)
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v85 objects:v95 count:16];
      if (v13)
      {
        id v14 = v13;
        __int16 v15 = 0;
        uint64_t v16 = *(void *)v86;
        do
        {
          for (id i = 0; i != v14; id i = (char *)i + 1)
          {
            if (*(void *)v86 != v16) {
              objc_enumerationMutation(obj);
            }
            objc_msgSend(+[MPUtilities createPlugInContainer:forLayer:key:inDocument:](MPUtilities, "createPlugInContainer:forLayer:key:inDocument:", self->_parallelizer, *(void *)(*((void *)&v85 + 1) + 8 * i), +[MPUtilities stringWithNewUUID](MPUtilities, "stringWithNewUUID"), -[MPLayerGroup parentDocument](self, "parentDocument")), "setZIndex:", (__int16)(v15 + (_WORD)i));
          }
          id v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v85 objects:v95 count:16];
          v15 += (__int16)i;
        }
        while (v14);
      }
    }
    layerDictionardouble y = self->_layerDictionary;
    if (layerDictionary)
    {
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v19 = [(NSMutableDictionary *)layerDictionary countByEnumeratingWithState:&v81 objects:v94 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v82;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v82 != v21) {
              objc_enumerationMutation(layerDictionary);
            }
            +[MPUtilities createPlugInContainer:self->_parallelizer forLayer:[(NSMutableDictionary *)self->_layerDictionary objectForKey:*(void *)(*((void *)&v81 + 1) + 8 * (void)j)] key:*(void *)(*((void *)&v81 + 1) + 8 * (void)j) inDocument:[(MPLayerGroup *)self parentDocument]];
          }
          id v20 = [(NSMutableDictionary *)layerDictionary countByEnumeratingWithState:&v81 objects:v94 count:16];
        }
        while (v20);
      }
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    animationPaths = self->_animationPaths;
    id v24 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v77 objects:v93 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v78;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(void *)v78 != v26) {
            objc_enumerationMutation(animationPaths);
          }
          uint64_t v28 = *(void *)(*((void *)&v77 + 1) + 8 * (void)k);
          id v29 = [(NSMutableDictionary *)self->_animationPaths objectForKey:v28];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v30 = off_1A4DC0;
          }
          else {
            long long v30 = off_1A4DC8;
          }
          id v31 = [(__objc2_class *)*v30 animationPathWithKey:v28];
          [(MCPlug *)self->_plug addAnimationPath:v31];
          [v29 setAnimationPath:v31];
        }
        id v25 = [(NSMutableDictionary *)animationPaths countByEnumeratingWithState:&v77 objects:v93 count:16];
      }
      while (v25);
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    actions = self->_actions;
    id v33 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v73 objects:v92 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v74;
      do
      {
        for (m = 0; m != v34; m = (char *)m + 1)
        {
          if (*(void *)v74 != v35) {
            objc_enumerationMutation(actions);
          }
          uint64_t v37 = *(void *)(*((void *)&v73 + 1) + 8 * (void)m);
          id v38 = [(NSMutableDictionary *)self->_actions objectForKey:v37];
          objc_msgSend(v38, "setAction:", +[MPUtilities createMCAction:forPlug:withKey:](MPUtilities, "createMCAction:forPlug:withKey:", v38, self->_plug, v37));
        }
        id v34 = [(NSMutableDictionary *)actions countByEnumeratingWithState:&v73 objects:v92 count:16];
      }
      while (v34);
    }
    if (self->_audioPlaylist)
    {
      id v39 = [(MPLayerGroup *)self parentDocument];
      if (v39 && [v39 documentLayerGroup] == self)
      {
        if (![(MPLayerGroupInternal *)self->_internal backgroundAudioID]) {
          [(MPLayerGroupInternal *)self->_internal setBackgroundAudioID:+[MPUtilities stringWithNewUUID]];
        }
        id v57 = objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "createParallelizerContainer");
        id v58 = [(MCContainerParallelizer *)self->_parallelizer setPlugForContainer:v57 forID:[(MPLayerGroupInternal *)self->_internal backgroundAudioID]];
        [v58 setLoopDuration:0.0];
        [v58 setZIndex:100];
        -[MPAudioPlaylist setMontage:](self->_audioPlaylist, "setMontage:", objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"));
        -[MPAudioPlaylist setAudioPlaylist:](self->_audioPlaylist, "setAudioPlaylist:", [v57 audioPlaylistCreateIfNeeded]);
        [(MPAudioPlaylist *)self->_audioPlaylist setPlug:v58];
        id v59 = [(MPLayerGroup *)self parentDocument];
        [(MPAudioPlaylist *)self->_audioPlaylist fadeOutDuration];
        objc_msgSend(v59, "setAudioFadeOutDuration:");
      }
      else
      {
        -[MPAudioPlaylist setMontage:](self->_audioPlaylist, "setMontage:", objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"));
        [(MPAudioPlaylist *)self->_audioPlaylist setAudioPlaylist:[(MCContainer *)self->_parallelizer audioPlaylistCreateIfNeeded]];
        [(MPAudioPlaylist *)self->_audioPlaylist setPlug:self->_plug];
      }
      [(MPLayerGroup *)self reconfigureLoopingMode];
    }
    [(MPLayerGroup *)self resetDuration];
    [(MPLayerGroup *)self configureActions];
  }
  else
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    layers = self->_layers;
    id v41 = [(NSMutableArray *)layers countByEnumeratingWithState:&v69 objects:v91 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v70;
      do
      {
        for (n = 0; n != v42; n = (char *)n + 1)
        {
          if (*(void *)v70 != v43) {
            objc_enumerationMutation(layers);
          }
          long long v45 = *(void **)(*((void *)&v69 + 1) + 8 * (void)n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v45 setPlug:0];
            [v45 setLayerSerializer:0];
          }
          else
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            [v45 setPlug:0];
            if (isKindOfClass) {
              [v45 setLayerEffect:0];
            }
            else {
              [v45 setContainer:0];
            }
          }
        }
        id v42 = [(NSMutableArray *)layers countByEnumeratingWithState:&v69 objects:v91 count:16];
      }
      while (v42);
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v47 = self->_animationPaths;
    id v48 = [(NSMutableDictionary *)v47 countByEnumeratingWithState:&v65 objects:v90 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v66;
      do
      {
        for (iid i = 0; ii != v49; iid i = (char *)ii + 1)
        {
          if (*(void *)v66 != v50) {
            objc_enumerationMutation(v47);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_animationPaths, "objectForKey:", *(void *)(*((void *)&v65 + 1) + 8 * (void)ii)), "setAnimationPath:", 0);
        }
        id v49 = [(NSMutableDictionary *)v47 countByEnumeratingWithState:&v65 objects:v90 count:16];
      }
      while (v49);
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v52 = self->_actions;
    id v53 = [(NSMutableDictionary *)v52 countByEnumeratingWithState:&v61 objects:v89 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v62;
      do
      {
        for (jj = 0; jj != v54; jj = (char *)jj + 1)
        {
          if (*(void *)v62 != v55) {
            objc_enumerationMutation(v52);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->_actions, "objectForKey:", *(void *)(*((void *)&v61 + 1) + 8 * (void)jj)), "setAction:", 0);
        }
        id v54 = [(NSMutableDictionary *)v52 countByEnumeratingWithState:&v61 objects:v89 count:16];
      }
      while (v54);
    }
  }
}

- (void)cleanup
{
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] lock];
  [(MPLayerGroup *)self removeAllLayers];
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] unlock];
  [(MPLayerGroup *)self setAudioPlaylist:0];
  id v3 = [(NSMutableDictionary *)self->_animationPaths allKeys];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MPLayerGroup *)self removeAnimationPathForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)v7)];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
  id v8 = [(NSMutableDictionary *)self->_actions allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(MPLayerGroup *)self removeActionForKey:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12)];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
  self->_parent = 0;
}

- (void)resetDuration
{
  if ([(MPLayerGroupInternal *)self->_internal autoAdjustDuration])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    layers = self->_layers;
    id v4 = [(NSMutableArray *)layers countByEnumeratingWithState:&v35 objects:v39 count:16];
    double v5 = 0.0;
    double v6 = 0.0;
    if (v4)
    {
      id v7 = v4;
      uint64_t v8 = *(void *)v36;
      do
      {
        for (id i = 0; i != v7; id i = (char *)i + 1)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(layers);
          }
          id v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ([v10 conformsToProtocol:&OBJC_PROTOCOL___MPNavigatorSupportInternal])
          {
            [v10 duration];
            double v12 = v11;
            [v10 numberOfLoops];
            double v14 = v12 * v13;
          }
          else
          {
            [v10 timeIn];
            double v16 = v15;
            [v10 duration];
            double v18 = v17;
            [v10 numberOfLoops];
            double v14 = v16 + v18 * v19;
          }
          if (v14 >= v6) {
            double v6 = v14;
          }
        }
        id v7 = [(NSMutableArray *)layers countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v7);
    }
    objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "lock");
    id v20 = [(MCContainerParallelizer *)self->_parallelizer plugForID:[(MPLayerGroupInternal *)self->_internal backgroundAudioID]];
    if ((int *)[(MPLayerGroup *)self loopingMode] != &dword_4
      && [(MPLayerGroup *)self loopingMode])
    {
      [v20 loopDuration];
      double v22 = v21;
      [(MPLayerGroup *)self numberOfLoops];
      double v5 = v22 * v23;
    }
    [(MPLayerGroupInternal *)self->_internal phaseInDuration];
    double v25 = v24;
    [(MPLayerGroupInternal *)self->_internal phaseOutDuration];
    double v27 = v25 + v26;
    double v28 = v6 - v27;
    if (v6 - v27 < 0.0) {
      double v28 = 0.0;
    }
    double v29 = v27 + v28;
    if (v29 >= v5) {
      double v30 = v29;
    }
    else {
      double v30 = v5;
    }
    [(MPLayerGroupInternal *)self->_internal durationPadding];
    double v32 = v31 + v30 - v27;
    [(MCPlug *)self->_plug loopDuration];
    if (v33 != v32 || ([(MPLayerGroupInternal *)self->_internal durationPadding], v34 > 0.00001))
    {
      objc_msgSend(-[MPLayerGroup observer](self, "observer"), "willChangeValueForKey:", @"duration");
      [(MCPlug *)self->_plug setLoopDuration:v32];
      objc_msgSend(-[MPLayerGroup observer](self, "observer"), "didChangeValueForKey:", @"duration");
    }
    objc_msgSend(objc_msgSend(-[MPLayerGroup parentDocument](self, "parentDocument"), "montage"), "unlock");
  }
}

- (double)durationPadding
{
  [(MPLayerGroupInternal *)self->_internal durationPadding];
  return result;
}

- (void)setDurationPadding:(double)a3
{
  [(MPLayerGroupInternal *)self->_internal setDurationPadding:a3];
  [(MPLayerGroupInternal *)self->_internal durationPadding];
  if (v4 < 0.0) {
    [(MPLayerGroupInternal *)self->_internal setDurationPadding:0.0];
  }
  [(MPLayerGroup *)self resetDuration];
}

- (void)reconnectAll
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  layers = self->_layers;
  id v3 = [(NSMutableArray *)layers countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (id i = 0; i != v4; id i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(layers);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MPNavigatorSupportInternal])
        {
          [v7 reconnectAll];
        }
        else
        {
          long long v16 = 0u;
          long long v17 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          id v8 = objc_msgSend(v7, "effectContainers", 0);
          id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v15;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v15 != v11) {
                  objc_enumerationMutation(v8);
                }
                double v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)j);
                if (([v13 isTransitionConnected] & 1) == 0) {
                  [v13 reconnectTransition];
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
            }
            while (v10);
          }
        }
      }
      id v4 = [(NSMutableArray *)layers countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)reconfigureLoopingMode
{
  if (![(MPLayerGroupInternal *)self->_internal autoAdjustDuration]) {
    return;
  }
  if ((int *)[(MPLayerGroup *)self loopingMode] == &dword_4)
  {
    [(MPLayerGroup *)self setNumberOfLoops:1.0];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    layers = self->_layers;
    id v4 = [(NSMutableArray *)layers countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v58;
      do
      {
        for (id i = 0; i != v5; id i = (char *)i + 1)
        {
          if (*(void *)v58 != v6) {
            objc_enumerationMutation(layers);
          }
          [*(id *)(*((void *)&v57 + 1) + 8 * i) setNumberOfLoops:1.0];
        }
        id v5 = [(NSMutableArray *)layers countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v5);
    }
LABEL_23:
    id v17 = [(MCContainerParallelizer *)self->_parallelizer plugForID:[(MPLayerGroupInternal *)self->_internal backgroundAudioID]];
    if (v17)
    {
      long long v18 = v17;
      [v17 setNumberOfLoops:25000.0];
      audioPlaylist = self->_audioPlaylist;
      if (audioPlaylist) {
        [(MPAudioPlaylist *)audioPlaylist duration];
      }
      else {
        double v20 = 0.0;
      }
      [v18 setLoopDuration:v20];
    }
    return;
  }
  if ((char *)[(MPLayerGroup *)self loopingMode] == (char *)&dword_0 + 1)
  {
    id v8 = [(MCContainerParallelizer *)self->_parallelizer plugForID:[(MPLayerGroupInternal *)self->_internal backgroundAudioID]];
    if (v8)
    {
      id v9 = v8;
      [v8 setNumberOfLoops:1.0];
      id v10 = self->_audioPlaylist;
      if (v10) {
        [(MPAudioPlaylist *)v10 duration];
      }
      else {
        double v11 = 0.0;
      }
      [v9 setLoopDuration:v11];
    }
    [(MPLayerGroup *)self setNumberOfLoops:25000.0];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    double v31 = self->_layers;
    id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v54;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v54 != v34) {
            objc_enumerationMutation(v31);
          }
          [*(id *)(*((void *)&v53 + 1) + 8 * (void)j) setNumberOfLoops:1.0];
        }
        id v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v33);
    }
  }
  else
  {
    if ((char *)[(MPLayerGroup *)self loopingMode] == (char *)&dword_0 + 2)
    {
      [(MPLayerGroup *)self setNumberOfLoops:1.0];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      double v12 = self->_layers;
      id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v63 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v50;
        do
        {
          for (k = 0; k != v14; k = (char *)k + 1)
          {
            if (*(void *)v50 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v49 + 1) + 8 * (void)k) setNumberOfLoops:25000.0];
          }
          id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v63 count:16];
        }
        while (v14);
      }
      goto LABEL_23;
    }
    unint64_t v21 = [(MPLayerGroup *)self loopingMode];
    id v22 = [(MCContainerParallelizer *)self->_parallelizer plugForID:[(MPLayerGroupInternal *)self->_internal backgroundAudioID]];
    double v23 = v22;
    if (v21 == 5)
    {
      if (v22)
      {
        [v22 setNumberOfLoops:25000.0];
        [(MPLayerGroup *)self videoDuration];
        objc_msgSend(v23, "setLoopDuration:");
      }
      [(MPLayerGroup *)self setNumberOfLoops:25000.0];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      double v24 = self->_layers;
      id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v45 objects:v62 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v46;
        do
        {
          for (m = 0; m != v26; m = (char *)m + 1)
          {
            if (*(void *)v46 != v27) {
              objc_enumerationMutation(v24);
            }
            [*(id *)(*((void *)&v45 + 1) + 8 * (void)m) setNumberOfLoops:25000.0];
          }
          id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v45 objects:v62 count:16];
        }
        while (v26);
      }
    }
    else
    {
      if (v22)
      {
        [v22 setNumberOfLoops:1.0];
        double v29 = self->_audioPlaylist;
        if (v29) {
          [(MPAudioPlaylist *)v29 duration];
        }
        else {
          double v30 = 0.0;
        }
        [v23 setLoopDuration:v30];
      }
      [(MPLayerGroup *)self setNumberOfLoops:1.0];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v36 = self->_layers;
      id v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v41 objects:v61 count:16];
      if (v37)
      {
        id v38 = v37;
        uint64_t v39 = *(void *)v42;
        do
        {
          for (n = 0; n != v38; n = (char *)n + 1)
          {
            if (*(void *)v42 != v39) {
              objc_enumerationMutation(v36);
            }
            [*(id *)(*((void *)&v41 + 1) + 8 * (void)n) setNumberOfLoops:1.0];
          }
          id v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v41 objects:v61 count:16];
        }
        while (v38);
      }
    }
  }
}

- (void)copyStruct:(id)a3
{
  [a3 numberOfLoops];
  -[MPLayerGroupInternal setNumberOfLoops:](self->_internal, "setNumberOfLoops:");
  -[MPLayerGroupInternal setLoopingMode:](self->_internal, "setLoopingMode:", [a3 loopingMode]);
  [a3 duration];
  -[MPLayerGroupInternal setDuration:](self->_internal, "setDuration:");
  [a3 timeIn];
  -[MPLayerGroupInternal setTimeIn:](self->_internal, "setTimeIn:");
  -[MPLayerGroupInternal setIsTriggered:](self->_internal, "setIsTriggered:", [a3 isTriggered]);
  -[MPLayerGroupInternal setStartsPaused:](self->_internal, "setStartsPaused:", [a3 startsPaused]);
  [a3 phaseInDuration];
  -[MPLayerGroupInternal setPhaseInDuration:](self->_internal, "setPhaseInDuration:");
  [a3 phaseOutDuration];
  -[MPLayerGroupInternal setPhaseOutDuration:](self->_internal, "setPhaseOutDuration:");
  -[MPLayerGroupInternal setBackgroundAudioID:](self->_internal, "setBackgroundAudioID:", objc_msgSend(objc_msgSend(a3, "backgroundAudioID"), "copy"));
  [a3 position];
  -[MPLayerGroupInternal setPosition:](self->_internal, "setPosition:");
  [a3 size];
  -[MPLayerGroupInternal setSize:](self->_internal, "setSize:");
  [a3 zPosition];
  -[MPLayerGroupInternal setZPosition:](self->_internal, "setZPosition:");
  [a3 rotationAngle];
  -[MPLayerGroupInternal setRotationAngle:](self->_internal, "setRotationAngle:");
  [a3 xRotationAngle];
  -[MPLayerGroupInternal setXRotationAngle:](self->_internal, "setXRotationAngle:");
  [a3 yRotationAngle];
  -[MPLayerGroupInternal setYRotationAngle:](self->_internal, "setYRotationAngle:");
  [a3 scale];
  -[MPLayerGroupInternal setScale:](self->_internal, "setScale:");
  [a3 opacity];
  -[MPLayerGroupInternal setOpacity:](self->_internal, "setOpacity:");
  -[MPLayerGroupInternal setZIndex:](self->_internal, "setZIndex:", [a3 zIndex]);
  -[MPLayerGroupInternal setAutoAdjustDuration:](self->_internal, "setAutoAdjustDuration:", [a3 autoAdjustDuration]);
  [(MPLayerGroupInternal *)self->_internal setUuid:0];
  -[MPLayerGroupInternal setInitialState:](self->_internal, "setInitialState:", [a3 initialState]);
  Copdouble y = CGColorCreateCopy((CGColorRef)[a3 backgroundColor]);
  [(MPLayerGroupInternal *)self->_internal setBackgroundColor:Copy];
  CGColorRelease(Copy);
}

- (void)copyLayers:(id)a3
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
  if ([v5 count]) {
    [(MPLayerGroup *)self addLayers:v5];
  }
}

- (void)copyLayerDictionary:(id)a3
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
        [(MPLayerGroup *)self setLayer:v10 forKey:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)copyAudioPlaylist:(id)a3
{
  id v4 = [a3 copy];
  [(MPLayerGroup *)self setAudioPlaylist:v4];
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
        [(MPLayerGroup *)self setAnimationPath:v10 forKey:v9];
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
        [(MPLayerGroup *)self setAction:v10 forKey:v9];
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)authoredVersionInfo
{
  return [(MPLayerGroupInternal *)self->_internal authoredVersionInfo];
}

- (void)setAuthoredVersionInfo:(id)a3
{
}

- (id)liveLock
{
  return [(MPLayerGroupInternal *)self->_internal liveLock];
}

- (BOOL)nearingEndWithOptions:(id)a3
{
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] lock];
  id v5 = [a3 objectForKey:@"requestedNumberOfSlides"];
  id v6 = [a3 objectForKey:@"container"];
  id v7 = [(MPLayerGroup *)self parentDocument];
  if (v5)
  {
    id v8 = +[MPUtilities effectForMCContainerEffect:v6 inDocument:v7];
    if (v8)
    {
      id v9 = v8;
      id v10 = 0;
      goto LABEL_6;
    }
LABEL_9:
    [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] unlock];
    return 0;
  }
  id v11 = +[MPUtilities layerForContainer:v6 inDocument:v7];
  if (!v11) {
    goto LABEL_9;
  }
  id v10 = v11;
  id v9 = 0;
LABEL_6:
  if ((objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "hasImagesForLayerID:forStyleID:", objc_msgSend(v10, "layerID"), -[MPLayerGroup styleID](self, "styleID")) & 1) == 0)goto LABEL_9; {
  long long v12 = +[NSNotificationCenter defaultCenter];
  }
  [(NSNotificationCenter *)v12 postNotificationName:kMPAuthoringLiveNeedsPathsNotification object:[(MPLayerGroup *)self parentDocument] userInfo:0];
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", -[MPLayerGroup authoringOptions](self, "authoringOptions"));
  unint64_t v14 = [(MPLayerGroup *)self lastSlideUsed];
  id v15 = [v13 objectForKey:kMPAuthoringLiveMissedImages];
  if (v15) {
    long long v16 = (char *)[v15 count];
  }
  else {
    long long v16 = 0;
  }
  if ((char *)v14 >= &v16[(void)[(NSMutableArray *)self->_userProvidedVideoPaths count]])
  {
    objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "cleanup");
    [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] unlock];

    return 0;
  }
  id v18 = [v13 objectForKey:kMPAuthoringLiveMaxSlidePreload];
  if (!v18)
  {
    long long v19 = (unsigned char *)(&dword_C + 3);
    if (!v5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  long long v19 = (char *)[v18 integerValue];
  if (v5) {
LABEL_15:
  }
    long long v19 = (char *)[v5 integerValue];
LABEL_16:
  BOOL v20 = (char *)[(MPLayerGroup *)self loopingMode] == (char *)&dword_4 + 1
     || (char *)[(MPLayerGroup *)self loopingMode] == (char *)&dword_0 + 2;
  unint64_t v21 = &v16[(void)[(NSMutableArray *)self->_userProvidedVideoPaths count] - v14];
  if (v21 >= v19) {
    unint64_t v21 = v19;
  }
  if (v5) {
    int v22 = 1;
  }
  else {
    int v22 = v20;
  }
  if (v22) {
    double v23 = v19;
  }
  else {
    double v23 = v21;
  }
  double v24 = +[NSNumber numberWithBool:0];
  [v13 setObject:v24 forKey:kMPAuthoringUseTitleEffect];
  id v25 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v14, v23);
  [v13 setObject:v25 forKey:kMPAuthoringVideoPathIndicies];
  if (v5)
  {
    [v13 setObject:v9 forKey:kMPAuthoringDynamicEffect];
    id v26 = [a3 objectForKey:@"firstSlideIndexStillNeeded"];
    [v13 setObject:v26 forKey:kMPAuthoringDynamicLastIndexUsed];
    [v13 setObject:v5 forKey:kMPAuthoringDynamicMinimumSlidesToAdd];
  }
  id v27 = objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "authorLayerGroup:inDocument:withOptions:", self, -[MPLayerGroup parentDocument](self, "parentDocument"), v13);
  if (v27 == (id)-1) {
    objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "prepareDocumentForPlayback:withOptions:", -[MPLayerGroup parentDocument](self, "parentDocument"), v13);
  }
  unint64_t v28 = [(MPLayerGroup *)self lastSlideUsed];
  double v29 = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithInteger:v28], @"lastUsedIndex");
  double v30 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v30 postNotificationName:kMPAuthoringLiveDidAddEffectsNotification object:[(MPLayerGroup *)self parentDocument] userInfo:v29];
  id v31 = [v13 objectForKey:kMPAuthoringLiveMissedImages];
  if (v31) {
    id v32 = (char *)[v31 count];
  }
  else {
    id v32 = 0;
  }
  if ((char *)v28 >= &v32[(void)[(NSMutableArray *)self->_userProvidedVideoPaths count]]
    || [(MPLayerGroupInternal *)self->_internal usedAllPaths])
  {
    id v33 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v33 postNotificationName:kMPAuthoringLiveUsedAllPathsNotification object:[(MPLayerGroup *)self parentDocument] userInfo:0];
    if (v20)
    {
      if (v28 >= (unint64_t)[(NSMutableArray *)self->_userProvidedVideoPaths count]) {
        unint64_t v34 = 0;
      }
      else {
        unint64_t v34 = v28;
      }
      [(MPLayerGroup *)self setLastSlideUsed:v34];
    }
  }
  [(MPLayerGroupInternal *)self->_internal setUsedAllPaths:0];

  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] unlock];
  return v27 != (id)-1;
}

- (double)aspectRatioDidChange:(double)a3 atTime:(double)a4
{
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] lock];
  id v7 = [(MPLayerGroup *)self authoringOptionForKey:kMPAuthoringAuthorOnAspectRatioChange];
  if (!v7 || ([v7 BOOLValue] & 1) != 0)
  {
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id obj = +[MPUtilities effectContainersForTime:[(MPLayerGroup *)self parentDocument] inDocument:a4];
    id v9 = [obj countByEnumeratingWithState:&v98 objects:v107 count:16];
    long long v71 = self;
    if (v9)
    {
      id v10 = v9;
      BOOL v11 = 0;
      long long v12 = 0;
      uint64_t v75 = *(void *)v99;
      do
      {
        for (id i = 0; i != v10; id i = (char *)i + 1)
        {
          if (*(void *)v99 != v75) {
            objc_enumerationMutation(obj);
          }
          unint64_t v14 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          id v15 = [v14 effects];
          id v16 = [v15 countByEnumeratingWithState:&v94 objects:v106 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v95;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v95 != v18) {
                  objc_enumerationMutation(v15);
                }
                if ((uint64_t)[*(id *)(*((void *)&v94 + 1) + 8 * (void)j) countOfSlides] >= 1)
                {
                  BOOL v11 = v12 != 0;
                  if (v12 && (id v20 = [v12 index], (uint64_t)v20 >= (uint64_t)objc_msgSend(v14, "index"))) {
                    BOOL v11 = 1;
                  }
                  else {
                    long long v12 = v14;
                  }
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v94 objects:v106 count:16];
            }
            while (v17);
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v98 objects:v107 count:16];
      }
      while (v10);
    }
    else
    {
      BOOL v11 = 0;
      long long v12 = 0;
    }
    id v23 = +[NSMutableArray array];
    id v24 = [v12 parentLayer];
    id v25 = [v24 countOfEffectContainers];
    if ((uint64_t)v25 <= 3)
    {
      internal = v71->_internal;
      goto LABEL_70;
    }
    id v26 = v25;
    long long v68 = v24;
    [v12 startTime];
    double v28 = a4 - v27;
    [v12 duration];
    double v30 = v29 - v28;
    id v31 = (char *)[v12 index];
    if (v30 >= 3.0) {
      id v32 = v31 + 1;
    }
    else {
      id v32 = v31 + 2;
    }
    obja = (char *)[v12 index];
    uint64_t v33 = -2;
    if (!v11) {
      uint64_t v33 = -1;
    }
    uint64_t v69 = v33;
    long long v76 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v32, v26 - v32);
    long long v66 = v32;
    if ((uint64_t)v26 > (uint64_t)v32)
    {
      id v35 = objc_msgSend(objc_msgSend(v68, "effectContainers"), "objectsAtIndexes:", v76);
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v36 = [v35 countByEnumeratingWithState:&v90 objects:v105 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v91;
        do
        {
          for (k = 0; k != v37; k = (char *)k + 1)
          {
            if (*(void *)v91 != v38) {
              objc_enumerationMutation(v35);
            }
            long long v40 = *(void **)(*((void *)&v90 + 1) + 8 * (void)k);
            long long v86 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            id v41 = objc_msgSend(v40, "effects", v66);
            id v42 = [v41 countByEnumeratingWithState:&v86 objects:v104 count:16];
            if (v42)
            {
              id v43 = v42;
              uint64_t v44 = *(void *)v87;
              do
              {
                for (m = 0; m != v43; m = (char *)m + 1)
                {
                  if (*(void *)v87 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  objc_msgSend(v23, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v86 + 1) + 8 * (void)m), "videoPaths"));
                }
                id v43 = [v41 countByEnumeratingWithState:&v86 objects:v104 count:16];
              }
              while (v43);
            }
          }
          id v37 = [v35 countByEnumeratingWithState:&v90 objects:v105 count:16];
        }
        while (v37);
      }
    }
    *(float *)&double v34 = a3;
    long long v46 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34, v66);
    long long v47 = v71;
    [(MPLayerGroup *)v71 setAuthoringOption:v46 forKey:kMPAuthoringAspectRatio];
    id v48 = objc_msgSend(-[MPLayerGroup authoringOptions](v71, "authoringOptions"), "mutableCopy");
    long long v49 = +[NSNumber numberWithInteger:1];
    [v48 setObject:v49 forKey:kMPAuthoringReorderMode];
    objc_msgSend(v48, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"skipEmptyContainerCheck");
    objc_msgSend(v48, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"keepTransitions");
    objc_msgSend(v48, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"fastInsert");
    objc_msgSend(v48, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"isChangingAspectRatio");
    [v48 removeObjectForKey:kMPAuthoringIntroEffectID];
    if ([v23 count])
    {
      objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "removeSlidesAtIndicies:inDocument:withOptions:", v76, -[MPLayerGroup parentDocument](v71, "parentDocument"), v48);
      objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "insertVideoPaths:atIndex:inDocument:withOptions:", v23, v67, -[MPLayerGroup parentDocument](v71, "parentDocument"), v48);
    }
    unint64_t v50 = (unint64_t)&obja[v69];
    id v51 = [(MPLayerGroup *)v71 authoringOptionForKey:kMPAuthoringAuthorOldEffectsOnAspectRatioChange];
    if (v51)
    {
      unsigned int v52 = [v51 BOOLValue] ^ 1;
      if ((v50 & 0x8000000000000000) != 0) {
        goto LABEL_69;
      }
    }
    else
    {
      LOBYTE(v52) = 0;
      if ((v50 & 0x8000000000000000) != 0)
      {
LABEL_69:
        [v12 startTime];
        a4 = v28 + v64;

        internal = v47->_internal;
        goto LABEL_70;
      }
    }
    if ((v52 & 1) == 0)
    {
      id v77 = v48;
      BOOL objb = objc_msgSend(objc_msgSend(objc_msgSend(v68, "effectContainers"), "objectAtIndex:", 0), "countOfEffects") == 0;
      long long v70 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:");
      id v53 = objc_msgSend(objc_msgSend(v68, "effectContainers"), "objectsAtIndexes:", v70);
      [v23 removeAllObjects];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v54 = [v53 countByEnumeratingWithState:&v82 objects:v103 count:16];
      if (v54)
      {
        id v55 = v54;
        uint64_t v56 = *(void *)v83;
        do
        {
          for (n = 0; n != v55; n = (char *)n + 1)
          {
            if (*(void *)v83 != v56) {
              objc_enumerationMutation(v53);
            }
            long long v58 = *(void **)(*((void *)&v82 + 1) + 8 * (void)n);
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            id v59 = [v58 effects];
            id v60 = [v59 countByEnumeratingWithState:&v78 objects:v102 count:16];
            if (v60)
            {
              id v61 = v60;
              uint64_t v62 = *(void *)v79;
              do
              {
                for (iid i = 0; ii != v61; iid i = (char *)ii + 1)
                {
                  if (*(void *)v79 != v62) {
                    objc_enumerationMutation(v59);
                  }
                  objc_msgSend(v23, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * (void)ii), "videoPaths"));
                }
                id v61 = [v59 countByEnumeratingWithState:&v78 objects:v102 count:16];
              }
              while (v61);
            }
          }
          id v55 = [v53 countByEnumeratingWithState:&v82 objects:v103 count:16];
        }
        while (v55);
      }
      long long v47 = v71;
      id v48 = v77;
      objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "removeSlidesAtIndicies:inDocument:withOptions:", v70, -[MPLayerGroup parentDocument](v71, "parentDocument"), v77);
      objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "insertVideoPaths:atIndex:inDocument:withOptions:", v23, objb, -[MPLayerGroup parentDocument](v71, "parentDocument"), v77);
    }
    goto LABEL_69;
  }
  *(float *)&double v8 = a3;
  unint64_t v21 = +[NSNumber numberWithFloat:v8];
  [(MPLayerGroup *)self setAuthoringOption:v21 forKey:kMPAuthoringAspectRatio];
  objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "cleanup");
  internal = self->_internal;
LABEL_70:
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)internal liveLock] unlock];
  return a4;
}

- (void)setUsedAllPaths:(BOOL)a3
{
}

- (void)setLastSlideUsed:(int64_t)a3
{
  [(NSRecursiveLock *)[(MPLayerGroupInternal *)self->_internal liveLock] lock];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", -[MPLayerGroup authoringOptions](self, "authoringOptions"));
  id v6 = +[NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forKey:kMPAuthoringLiveSlideIndex];
  [(MPLayerGroup *)self setAuthoringOptions:v5];

  id v7 = [(MPLayerGroupInternal *)self->_internal liveLock];
  [(NSRecursiveLock *)v7 unlock];
}

- (int64_t)lastSlideUsed
{
  id v2 = [(MPLayerGroup *)self authoringOptions];
  int64_t result = (int64_t)[v2 objectForKey:kMPAuthoringLiveSlideIndex];
  if (result)
  {
    return (int64_t)[(id)result integerValue];
  }
  return result;
}

- (void)setIsDocumentLayerGroup:(BOOL)a3
{
}

- (id)actionableObjectForID:(id)a3
{
  if (self->_layerDictionary) {
    layers = (NSMutableArray *)[(NSMutableDictionary *)self->_layerDictionary allValues];
  }
  else {
    layers = self->_layers;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = [(NSMutableArray *)layers countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v36;
  double v8 = &off_1BB000;
LABEL_6:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v36 != v7) {
      objc_enumerationMutation(layers);
    }
    id v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
    if (objc_msgSend(objc_msgSend(v10, "uuid"), "isEqualToString:", a3)) {
      return v10;
    }
    if ([v10 conformsToProtocol:v8[118]])
    {
      id v11 = [v10 actionableObjectForID:a3];
      if (v11) {
        return v11;
      }
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v12 = [v10 effectContainers];
      id v13 = [v12 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v32;
        uint64_t v23 = v7;
        id v24 = layers;
        uint64_t v25 = *(void *)v32;
        id v26 = v12;
LABEL_15:
        id v16 = 0;
        while (1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          id v10 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v16);
          if (objc_msgSend(objc_msgSend(v10, "uuid", v23, v24), "isEqualToString:", a3)) {
            return v10;
          }
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v17 = [v10 effects];
          id v18 = [v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v28;
LABEL_21:
            uint64_t v21 = 0;
            while (1)
            {
              if (*(void *)v28 != v20) {
                objc_enumerationMutation(v17);
              }
              id v10 = *(void **)(*((void *)&v27 + 1) + 8 * v21);
              if (objc_msgSend(objc_msgSend(v10, "uuid"), "isEqualToString:", a3)) {
                return v10;
              }
              if (v19 == (id)++v21)
              {
                id v19 = [v17 countByEnumeratingWithState:&v27 objects:v39 count:16];
                if (v19) {
                  goto LABEL_21;
                }
                break;
              }
            }
          }
          id v16 = (char *)v16 + 1;
          uint64_t v15 = v25;
          id v12 = v26;
          if (v16 == v14)
          {
            id v14 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
            uint64_t v7 = v23;
            layers = v24;
            double v8 = &off_1BB000;
            if (v14) {
              goto LABEL_15;
            }
            break;
          }
        }
      }
    }
    if ((id)++v9 == v6)
    {
      id v6 = [(NSMutableArray *)layers countByEnumeratingWithState:&v35 objects:v41 count:16];
      id v10 = 0;
      if (v6) {
        goto LABEL_6;
      }
      return v10;
    }
  }
}

- (id)layerKeyDictionary
{
  return [(MPLayerGroupInternal *)self->_internal layerKeyDictionary];
}

- (BOOL)detectFacesInBackground
{
  id v2 = [(MPLayerGroup *)self authoringOptionForKey:kMPAuthoringDetectFacesInBackground];
  if (v2)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (int64_t)countOfLayers
{
  return (int64_t)[(NSMutableArray *)self->_layers count];
}

- (id)objectInLayersAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_layers objectAtIndex:a3];
}

- (id)valueInLayersWithName:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  layers = self->_layers;
  id v5 = [(NSMutableArray *)layers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(layers);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "title"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)layers countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)insertObject:(id)a3 inLayersAtIndex:(int64_t)a4
{
  id v6 = +[NSArray arrayWithObject:a3];
  [(MPLayerGroup *)self insertLayers:v6 atIndex:a4];
}

- (void)removeObjectFromLayersAtIndex:(int64_t)a3
{
  id v4 = +[NSIndexSet indexSetWithIndex:a3];
  [(MPLayerGroup *)self removeLayersAtIndices:v4];
}

- (void)replaceObjectInLayersAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPLayerGroup *)self removeLayersAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  uint64_t v7 = +[NSArray arrayWithObject:a4];
  [(MPLayerGroup *)self insertLayers:v7 atIndex:a3];
}

@end