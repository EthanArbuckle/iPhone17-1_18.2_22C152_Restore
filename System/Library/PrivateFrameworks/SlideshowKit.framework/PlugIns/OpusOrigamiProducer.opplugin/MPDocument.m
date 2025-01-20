@interface MPDocument
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)isNativeType:(id)a3;
+ (id)readableTypes;
+ (id)writableTypes;
+ (void)initialize;
- (BOOL)detectFacesInBackground;
- (BOOL)isAudioAtPath:(id)a3;
- (BOOL)isImageAtPath:(id)a3;
- (BOOL)isInBatchModify;
- (BOOL)isLive;
- (BOOL)isMovieAtPath:(id)a3;
- (BOOL)isSupportedMovieForAssetAtPath:(id)a3;
- (BOOL)layersCanPositionZIndex;
- (BOOL)nearingEndWithOptions:(id)a3;
- (BOOL)preserveMedia;
- (BOOL)savesPathsAsAbsolute;
- (CGColor)backgroundCGColor;
- (CGImage)CGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (CGImage)CGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4 orientation:(char *)a5 thumbnailIfPossible:(BOOL)a6 now:(BOOL)a7;
- (CGImage)thumbnailCGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (CGPoint)latLongPointForMap:(id)a3 withAttributes:(id)a4;
- (CGPoint)pointForMap:(id)a3 withAttributes:(id)a4;
- (CGSize)resolutionForAssetAtPath:(id)a3;
- (CGSize)resolutionForPath:(id)a3;
- (MPDocument)init;
- (double)aspectRatio;
- (double)aspectRatioDidChange:(double)a3 atTime:(double)a4;
- (double)duration;
- (double)durationForPath:(id)a3;
- (double)fadeInDuration;
- (double)fadeOutAudioDuration;
- (double)fadeOutDuration;
- (double)numberOfLoops;
- (double)posterTime;
- (double)startTimeForAssetAtPath:(id)a3;
- (double)startTimeForPath:(id)a3;
- (double)stopTimeForAssetAtPath:(id)a3;
- (double)stopTimeForPath:(id)a3;
- (double)videoDuration;
- (double)volumeForPath:(id)a3;
- (id)absolutePathForAssetAtPath:(id)a3;
- (id)absolutePathForAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)absoluteVideoPaths;
- (id)actionableObjectForID:(id)a3;
- (id)allEffectContainers;
- (id)allEffects;
- (id)allElements;
- (id)allSlides;
- (id)allSlides:(BOOL)a3;
- (id)allSongs;
- (id)altitudeForPath:(id)a3;
- (id)areaForPath:(id)a3;
- (id)assetKeyDelegate;
- (id)attributeForAssetAtPath:(id)a3 forKey:(id)a4;
- (id)audioPaths;
- (id)audioPlaylist;
- (id)authoringOptionForKey:(id)a3;
- (id)avAssetForAssetAtPath:(id)a3;
- (id)cachedAbsolutePathFromPath:(id)a3;
- (id)cachedAbsoluteStillPathFromPath:(id)a3;
- (id)captionForPath:(id)a3;
- (id)cityForPath:(id)a3;
- (id)countryForPath:(id)a3;
- (id)creationDateForPath:(id)a3;
- (id)currentStyle;
- (id)dataForAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)definedPlaceNameForPath:(id)a3;
- (id)description;
- (id)descriptionForRandomTransitionPresetID:(id)a3;
- (id)displayName;
- (id)documentAttributeForKey:(id)a3;
- (id)documentAttributes;
- (id)documentLayerGroup;
- (id)fileURL;
- (id)flightPlanFrom:(CGPoint)a3 to:(CGPoint)a4;
- (id)fullDebugLog;
- (id)keyedLayers;
- (id)keywordsForPath:(id)a3;
- (id)lastRandomTransition;
- (id)latitudeForPath:(id)a3;
- (id)layerForKey:(id)a3;
- (id)layers;
- (id)longitudeForPath:(id)a3;
- (id)mainLayers;
- (id)mediaProperties;
- (id)montage;
- (id)neighborhoodForPath:(id)a3;
- (id)objectInLayersAtIndex:(int64_t)a3;
- (id)oceanForPath:(id)a3;
- (id)orderedVideoPaths;
- (id)organizedRandomTransitions;
- (id)outroEffect;
- (id)placeForPath:(id)a3;
- (id)propertiesForMediaPath:(id)a3;
- (id)propertiesForMediaPathAndCreateIfNeeded:(id)a3 withValue:(id)a4 forKey:(id)a5;
- (id)regionsOfInterestForPath:(id)a3;
- (id)regionsOfInterestForPath:(id)a3 detect:(BOOL)a4;
- (id)stateForPath:(id)a3;
- (id)styleID;
- (id)tiledMapPathsForAttributes:(id)a3;
- (id)title;
- (id)titleEffect;
- (id)undoManager;
- (id)uuid;
- (id)valueInLayersWithName:(id)a3;
- (id)videoPaths;
- (int64_t)antialiasLevel;
- (int64_t)countOfLayers;
- (int64_t)mapLevelForPath:(id)a3;
- (int64_t)mediaTypeForPath:(id)a3;
- (unint64_t)applyStyle:(id)a3;
- (unint64_t)loopingMode;
- (void)addAudioPath:(id)a3;
- (void)addAudioPaths:(id)a3;
- (void)addLayer:(id)a3;
- (void)addLayers:(id)a3;
- (void)addVideoPath:(id)a3;
- (void)addVideoPaths:(id)a3;
- (void)beginBatchModify;
- (void)cleanup;
- (void)configureActions;
- (void)dealloc;
- (void)endBatchModify;
- (void)insertLayers:(id)a3 atIndex:(int64_t)a4;
- (void)insertObject:(id)a3 inLayersAtIndex:(int64_t)a4;
- (void)moveLayersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)organizeRandomTransitions;
- (void)reconnectAllTransitions;
- (void)removeAllAudioPaths;
- (void)removeAllLayers;
- (void)removeAllVideoPaths;
- (void)removeLayerForKey:(id)a3;
- (void)removeLayersAtIndices:(id)a3;
- (void)removeObjectFromLayersAtIndex:(int64_t)a3;
- (void)removePath:(id)a3;
- (void)removePaths:(id)a3;
- (void)removePropertiesForMediaPath:(id)a3;
- (void)replaceObjectInLayersAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)setAbsolutePath:(id)a3 forKey:(id)a4;
- (void)setAbsoluteStillPath:(id)a3 forKey:(id)a4;
- (void)setAlwaysLookupAbsolutePaths:(BOOL)a3;
- (void)setAssetKeyDelegate:(id)a3;
- (void)setAudioFadeOutDuration:(double)a3;
- (void)setAudioPaths:(id)a3;
- (void)setAudioPlaylist:(id)a3;
- (void)setAuthoringOption:(id)a3 forKey:(id)a4;
- (void)setBackgroundCGColor:(CGColor *)a3;
- (void)setDocumentAttribute:(id)a3 forKey:(id)a4;
- (void)setDocumentLayerGroup:(id)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setFileURL:(id)a3;
- (void)setLastRandomTransition:(id)a3;
- (void)setLayer:(id)a3 forKey:(id)a4;
- (void)setLoopingMode:(unint64_t)a3;
- (void)setMediaProperties:(id)a3;
- (void)setMontage:(id)a3;
- (void)setNumberOfLoops:(double)a3;
- (void)setPreserveMedia:(BOOL)a3;
- (void)setProperties:(id)a3 forMediaPath:(id)a4;
- (void)setSavesPathsAsAbsolute:(BOOL)a3;
- (void)setStyleID:(id)a3;
- (void)setTemporarilyCacheAbsolutePaths:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)setVideoPaths:(id)a3;
- (void)setupDocumentLayerGroup;
- (void)setupLayerGroups;
- (void)upgradeDocument;
@end

@implementation MPDocument

+ (void)initialize
{
  +[MPEffectManager sharedManager];
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MPDocument;
  objc_msgSendSuper2(&v3, "initialize");
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return [a3 isEqualToString:@"layers"] ^ 1;
}

+ (id)writableTypes
{
  return +[NSArray arrayWithObject:@"mTGE"];
}

+ (id)readableTypes
{
  return +[NSArray arrayWithObject:@"mTGE"];
}

+ (BOOL)isNativeType:(id)a3
{
  return [a3 isEqualToString:@"mTGE"];
}

- (MPDocument)init
{
  v19.receiver = self;
  v19.super_class = (Class)MPDocument;
  v2 = [(MPDocument *)&v19 init];
  if (v2)
  {
    v2->_documentAttributes = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_fileProperties = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_internal = objc_alloc_init(MPDocumentInternal);
    [(MPDocumentInternal *)v2->_internal setPropertiesLock:objc_alloc_init((Class)NSRecursiveLock)];
    [(NSRecursiveLock *)[(MPDocumentInternal *)v2->_internal propertiesLock] setName:@"MPDocument.propertiesLock"];
    [(MPDocumentInternal *)v2->_internal setAssetLogging:[+[NSUserDefaults standardUserDefaults] BOOLForKey:@"marimbaAssetLogging"]];
    [(MPDocumentInternal *)v2->_internal setCachedAbsolutePaths:+[NSMutableDictionary dictionary]];
    [(MPDocumentInternal *)v2->_internal setCachedAbsoluteStillPaths:+[NSMutableDictionary dictionary]];
    [(MPDocumentInternal *)v2->_internal setCachedPathLock:objc_alloc_init((Class)NSLock)];
    [(NSLock *)[(MPDocumentInternal *)v2->_internal cachedPathLock] setName:@"MPDocument.cachedPathLock"];
    [(MPDocumentInternal *)v2->_internal setBatchModifyCount:0];
    [(MPDocumentInternal *)v2->_internal setIsInBatchModify:0];
    [(MPDocumentInternal *)v2->_internal setNeedsActionConfigure:0];
    [(MPDocumentInternal *)v2->_internal setUuid:+[MPUtilities stringWithNewUUID]];
    [(MPDocumentInternal *)v2->_internal setCacheAbsolutePathOverride:0];
    [(MPDocumentInternal *)v2->_internal setAlwaysLookupAbsolutePaths:0];
    documentAttributes = v2->_documentAttributes;
    v4 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)documentAttributes setObject:v4 forKey:kMPDocumentEnforceSafeTiming];
    v5 = v2->_documentAttributes;
    v6 = +[NSNumber numberWithInteger:0];
    [(NSMutableDictionary *)v5 setObject:v6 forKey:kMPDocumentTimingMode];
    v7 = v2->_documentAttributes;
    v8 = +[NSNumber numberWithBool:0];
    [(NSMutableDictionary *)v7 setObject:v8 forKey:kMPDocumentPreparedForExport];
    v9 = v2->_documentAttributes;
    v10 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)v9 setObject:v10 forKey:kMPDocumentSupportsRandomTransition];
    v11 = v2->_documentAttributes;
    v12 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)v11 setObject:v12 forKey:kMPDocumentCacheAbsolutePaths];
    v13 = v2->_documentAttributes;
    LODWORD(v14) = *(_DWORD *)"ffF@";
    v15 = +[NSNumber numberWithFloat:v14];
    [(NSMutableDictionary *)v13 setObject:v15 forKey:kMPDocumentVersion];
    v2->_preserveMedia = 0;
    [(MPDocument *)v2 setUndoManager:0];
    v2->_montage = 0;
    id v16 = [[MCMontage alloc] initFromScratch];
    v17 = v16;
    if (v16) {
      objc_msgSend(objc_msgSend(v16, "rootPlug"), "setLoopDuration:", 10000000.0);
    }
    [(MPDocument *)v2 setMontage:v17];

    v2->_layerGroups = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(MPDocument *)v2 setupDocumentLayerGroup];
  }
  return v2;
}

- (id)description
{
  objc_super v3 = [+[NSString stringWithFormat:@"============================= Document Description =============================\n"] stringByAppendingFormat:@"\t                   Style ID: %@\n", [(MPDocument *)self currentStyle]];
  [(MPDocument *)self duration];
  return [(NSString *)v3 stringByAppendingFormat:@"\t                   Duration: %f\n", v4];
}

- (void)dealloc
{
  [(MPDocument *)self cleanup];
  [(MPDocument *)self setAssetKeyDelegate:0];
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] lock];

  self->_fileProperties = 0;
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] unlock];

  self->_internal = 0;
  self->_layerGroups = 0;
  montage = self->_montage;
  if (montage)
  {

    self->_montage = 0;
  }

  self->_documentAttributes = 0;
  objc_storeWeak((id *)&self->_assetKeyDelegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)MPDocument;
  [(MPDocument *)&v4 dealloc];
}

- (id)displayName
{
  return @"My Slideshow";
}

- (id)currentStyle
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 styleID];
}

- (unint64_t)applyStyle:(id)a3
{
  objc_super v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  v5 = v4;
  unint64_t v6 = [(MPLayerGroup *)v4 setStyleID:a3];

  return v6;
}

- (id)documentAttributeForKey:(id)a3
{
  if ([a3 isEqualToString:kMPDocumentAuthoringOptions])
  {
    v5 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
    return [(MPLayerGroup *)v5 authoringOptions];
  }
  else
  {
    id result = [(NSMutableDictionary *)self->_documentAttributes objectForKey:a3];
    if (!result)
    {
      if ([a3 isEqualToString:kMPDocumentNameAttribute])
      {
        return [(MPDocument *)self displayName];
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)setDocumentAttribute:(id)a3 forKey:(id)a4
{
  if ([a4 isEqualToString:kMPDocumentAuthoringOptions])
  {
    v7 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
    [(MPLayerGroup *)v7 setAuthoringOptions:a3];
  }
  else
  {
    documentAttributes = self->_documentAttributes;
    if (a3) {
      [(NSMutableDictionary *)documentAttributes setObject:a3 forKey:a4];
    }
    else {
      [(NSMutableDictionary *)documentAttributes removeObjectForKey:a4];
    }
    if ([a4 isEqualToString:kMPDocumentRandomTransitionList])
    {
      [(MPDocument *)self organizeRandomTransitions];
    }
  }
}

- (BOOL)preserveMedia
{
  return self->_preserveMedia;
}

- (void)setPreserveMedia:(BOOL)a3
{
  self->_preserveMedia = a3;
}

- (id)mediaProperties
{
  return self->_fileProperties;
}

- (void)setMediaProperties:(id)a3
{
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] lock];
  fileProperties = self->_fileProperties;
  if (fileProperties) {

  }
  self->_fileProperties = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v11 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v10), "mutableCopy");
        [(NSMutableDictionary *)self->_fileProperties setObject:v11 forKey:v10];
      }
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] unlock];
}

- (id)propertiesForMediaPath:(id)a3
{
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] lock];
  id v5 = [(NSMutableDictionary *)self->_fileProperties objectForKey:a3];
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] unlock];
  return v5;
}

- (void)setProperties:(id)a3 forMediaPath:(id)a4
{
  id v7 = [a3 mutableCopy];
  id v8 = [a3 objectForKey:kMPMetaDataRegionOfInterestRectangles];
  if (v8)
  {
    v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = v7;
      id v10 = +[NSMutableArray array];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            id v16 = [v9 objectForKey:v15];
            objc_msgSend(v10, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v15, kMPMetaDataRegionOfInterestID, v16, kMPMetaDataRegionOfInterestBounds, 0));
          }
          id v12 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }
      id v7 = v17;
      [v17 setObject:v10 forKey:kMPMetaDataRegionOfInterestRectangles];
    }
  }
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] lock];
  [(NSMutableDictionary *)self->_fileProperties setObject:v7 forKey:a4];
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] unlock];
  if (![(MPDocument *)self assetKeyDelegate]) {
    objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "cacheAttributes:forPath:", v7, a4);
  }
}

- (void)removePropertiesForMediaPath:(id)a3
{
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] lock];
  [(NSMutableDictionary *)self->_fileProperties removeObjectForKey:a3];
  id v5 = [(MPDocumentInternal *)self->_internal propertiesLock];
  [(NSRecursiveLock *)v5 unlock];
}

- (id)authoringOptionForKey:(id)a3
{
  objc_super v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v4 authoringOptionForKey:a3];
}

- (void)setAuthoringOption:(id)a3 forKey:(id)a4
{
  id v6 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v6 setAuthoringOption:a3 forKey:a4];
}

- (unint64_t)loopingMode
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 loopingMode];
}

- (void)setLoopingMode:(unint64_t)a3
{
  objc_super v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 setLoopingMode:a3];
}

- (double)numberOfLoops
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v2 numberOfLoops];
  return result;
}

- (void)setNumberOfLoops:(double)a3
{
  objc_super v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 setNumberOfLoops:a3];
}

- (id)assetKeyDelegate
{
  return objc_loadWeak((id *)&self->_assetKeyDelegate);
}

- (void)setAssetKeyDelegate:(id)a3
{
  if ([(MPDocument *)self assetKeyDelegate]) {
    objc_storeWeak((id *)&self->_assetKeyDelegate, 0);
  }
  if (a3)
  {
    objc_storeWeak((id *)&self->_assetKeyDelegate, a3);
    if ([(MPDocumentInternal *)self->_internal documentLayerGroup])
    {
      id v5 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
      [(MPLayerGroup *)v5 cachePaths];
    }
  }
}

- (BOOL)savesPathsAsAbsolute
{
  return [(MPDocumentInternal *)self->_internal savesPathsAsAbsolute];
}

- (void)setSavesPathsAsAbsolute:(BOOL)a3
{
}

- (id)undoManager
{
  return [(MPDocumentInternal *)self->_internal undoManager];
}

- (void)setUndoManager:(id)a3
{
}

- (id)fileURL
{
  return [(MPDocumentInternal *)self->_internal fileURL];
}

- (void)setFileURL:(id)a3
{
}

- (void)beginBatchModify
{
  if (![(MPDocumentInternal *)self->_internal batchModifyCount])
  {
    [(MPDocumentInternal *)self->_internal setIsInBatchModify:1];
    [(MCMontage *)self->_montage lock];
  }
  internal = self->_internal;
  objc_super v4 = (char *)[(MPDocumentInternal *)internal batchModifyCount] + 1;
  [(MPDocumentInternal *)internal setBatchModifyCount:v4];
}

- (void)endBatchModify
{
  [(MPDocumentInternal *)self->_internal setBatchModifyCount:(char *)[(MPDocumentInternal *)self->_internal batchModifyCount] - 1];
  if (![(MPDocumentInternal *)self->_internal batchModifyCount])
  {
    [(MPDocumentInternal *)self->_internal setIsInBatchModify:0];
    [(MCMontage *)self->_montage unlock];
    if ([(MPDocumentInternal *)self->_internal needsActionConfigure])
    {
      [(MPDocument *)self configureActions];
      internal = self->_internal;
      [(MPDocumentInternal *)internal setNeedsActionConfigure:0];
    }
  }
}

- (id)allSlides
{
  return [(MPDocument *)self allSlides:0];
}

- (id)allSlides:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MPDocumentInternal *)self->_internal documentLayerGroup])
  {
    id v5 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
    return [(MPLayerGroup *)v5 allSlides:v3];
  }
  else
  {
    id v7 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    layerGroups = self->_layerGroups;
    id v9 = [(NSMutableDictionary *)layerGroups countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(layerGroups);
          }
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layerGroups, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i)), "allSlides:", v3));
        }
        id v10 = [(NSMutableDictionary *)layerGroups countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
    return v7;
  }
}

- (id)allElements
{
  if (!objc_msgSend(-[MPDocument styleID](self, "styleID"), "isEqualToString:", @"Places")) {
    return 0;
  }
  id v3 = [(MPDocument *)self documentLayerGroup];
  if ((uint64_t)[v3 countOfLayers] < 2) {
    return 0;
  }
  id v4 = +[NSMutableArray array];
  id v6 = objc_msgSend(objc_msgSend(v3, "layers"), "objectAtIndex:", 0);
  id v7 = objc_msgSend(objc_msgSend(v3, "layers"), "objectAtIndex:", 1);
  id obj = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = [v6 effectContainers];
  id v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v13, "effects"), "lastObject"), "effectID"), "isEqualToString:", @"PinMap"))objc_msgSend(obj, "addObject:", v13); {
      }
        }
      id v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    uint64_t v17 = 1;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obj);
        }
        id v19 = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)j), "effects"), "lastObject");
        NSRange v20 = NSRangeFromString((NSString *)[v19 effectAttributeForKey:@"pinRange"]);
        if (!v20.location) {
          objc_msgSend(v4, "addObject:", objc_msgSend(objc_msgSend(v19, "texts"), "objectAtIndex:", 0));
        }
        if ((uint64_t)v20.length >= 1)
        {
          uint64_t v21 = 1;
          do
          {
            objc_msgSend(v4, "addObject:", objc_msgSend(objc_msgSend(v19, "texts"), "objectAtIndex:", v21));
            id v22 = [v7 objectInEffectContainersAtIndex:v17];
            if ((uint64_t)[v22 countOfEffects] >= 1)
            {
              do
              {
                objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(objc_msgSend(objc_msgSend(v22, "effects"), "lastObject"), "slides"));
                id v22 = [v7 objectInEffectContainersAtIndex:++v17];
              }
              while ((uint64_t)[v22 countOfEffects] > 0);
            }
            ++v17;
          }
          while (v21++ != v20.length);
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);
  }
  return v4;
}

- (id)documentAttributes
{
  return self->_documentAttributes;
}

- (void)cleanup
{
  [(MPDocument *)self setAssetKeyDelegate:0];
  [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] cleanup];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(NSMutableDictionary *)self->_layerGroups allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) cleanup];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(MPDocument *)self removeAllLayers];
  [(MPDocument *)self setAudioPlaylist:0];
  [(MCMontage *)self->_montage demolish];
}

- (double)fadeOutDuration
{
  [(MCMontage *)self->_montage fadeOutDuration];
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
}

- (double)fadeInDuration
{
  [(MCMontage *)self->_montage fadeInDuration];
  return result;
}

- (void)setFadeInDuration:(double)a3
{
}

- (double)posterTime
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v2 posterTime];
  return result;
}

- (void)addVideoPath:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 addVideoPath:a3];
}

- (void)addVideoPaths:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 addVideoPaths:a3];
}

- (void)addAudioPath:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 addAudioPath:a3];
}

- (void)addAudioPaths:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 addAudioPaths:a3];
}

- (void)removePath:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 removePath:a3];
}

- (void)removePaths:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 removePaths:a3];
}

- (id)videoPaths
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 videoPaths];
}

- (id)orderedVideoPaths
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 orderedVideoPaths];
}

- (void)setVideoPaths:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 setVideoPaths:a3];
}

- (id)audioPaths
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 audioPaths];
}

- (void)setAudioPaths:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 setAudioPaths:a3];
}

- (void)removeAllVideoPaths
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v2 removeAllVideoPaths];
}

- (void)removeAllAudioPaths
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v2 removeAllAudioPaths];
}

- (id)layers
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 layers];
}

- (void)addLayer:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  [(MPDocument *)self insertLayers:v4 atIndex:[(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] countOfLayers]];
}

- (void)addLayers:(id)a3
{
  int64_t v5 = [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] countOfLayers];
  [(MPDocument *)self insertLayers:a3 atIndex:v5];
}

- (void)insertLayers:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v6 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v6 insertLayers:a3 atIndex:a4];
}

- (void)removeAllLayers
{
  if ([(MPDocumentInternal *)self->_internal documentLayerGroup])
  {
    id v3 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
    [(MPLayerGroup *)v3 removeAllLayers];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [(NSMutableDictionary *)self->_layerGroups allKeys];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        long long v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(MPDocument *)self removeLayerForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
          long long v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)removeLayersAtIndices:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 removeLayersAtIndices:a3];
}

- (void)moveLayersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  id v6 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v6 moveLayersFromIndices:a3 toIndex:a4];
}

- (id)layerForKey:(id)a3
{
  return [(NSMutableDictionary *)self->_layerGroups objectForKey:a3];
}

- (void)setLayer:(id)a3 forKey:(id)a4
{
  [(MPDocument *)self setupLayerGroups];
  if ([(MPDocument *)self layerForKey:a4]) {
    [(MPDocument *)self removeLayerForKey:a4];
  }
  uint64_t v7 = [(MCPlug *)[(MCMontage *)self->_montage rootPlug] container];
  [a3 setParent:self];
  +[MPUtilities createPlugInContainer:v7 forLayer:a3 key:a4 inDocument:self];
  if (objc_opt_respondsToSelector()) {
    [a3 resetDuration];
  }
  [(NSMutableDictionary *)self->_layerGroups setObject:a3 forKey:a4];
  [(MPDocument *)self configureActions];
}

- (void)removeLayerForKey:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_layerGroups, "objectForKey:");
  id v6 = [(MCPlug *)[(MCMontage *)self->_montage rootPlug] container];
  id v7 = [v5 plug];
  if (v7) {
    [(MCContainer *)v6 removePlug:v7];
  }
  [v5 setPlug:0];
  [v5 setContainer:0];
  [v5 setParent:0];
  layerGroups = self->_layerGroups;
  [(NSMutableDictionary *)layerGroups removeObjectForKey:a3];
}

- (id)keyedLayers
{
  return self->_layerGroups;
}

- (CGColor)backgroundCGColor
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 backgroundCGColor];
}

- (void)setBackgroundCGColor:(CGColor *)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 setBackgroundCGColor:a3];
}

- (double)duration
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v2 duration];
  return result;
}

- (double)videoDuration
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v2 videoDuration];
  return result;
}

- (id)audioPlaylist
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 audioPlaylist];
}

- (void)setAudioPlaylist:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 setAudioPlaylist:a3];
}

- (id)mainLayers
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 mainLayers];
}

- (id)montage
{
  return self->_montage;
}

- (id)fullDebugLog
{
  return 0;
}

- (id)titleEffect
{
  id v3 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "titleEffectLayoutForStyleID:", -[MPDocument styleID](self, "styleID"));
  CFStringRef v4 = (const __CFString *)[v3 objectForKey:@"layer"];
  long long v18 = 0u;
  long long v19 = 0u;
  if (v4) {
    CFStringRef v5 = v4;
  }
  else {
    CFStringRef v5 = @"background";
  }
  long long v20 = 0uLL;
  long long v21 = 0uLL;
  id v6 = [(MPDocument *)self layers];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(id *)(*((void *)&v18 + 1) + 8 * v10);
      if (objc_msgSend(objc_msgSend(v11, "layerID"), "isEqualToString:", v5)) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }
    if (v11) {
      goto LABEL_16;
    }
  }
LABEL_14:
  id v12 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "descriptionForStyleID:", -[MPDocument styleID](self, "styleID")), "objectForKey:", @"layout"), "objectForKey:", v5), "objectForKey:", @"zIndex"), "integerValue");
  if ((uint64_t)v12 >= [(MPDocument *)self countOfLayers]) {
    return 0;
  }
  id v11 = [(MPDocument *)self objectInLayersAtIndex:v12];
LABEL_16:
  id v13 = objc_msgSend(objc_msgSend(v11, "effectContainers"), "objectAtIndex:", 0);
  id v14 = [v3 objectForKey:@"backgroundEffect"];
  if (v14) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  id v16 = objc_msgSend(objc_msgSend(v13, "effects"), "count");
  id result = 0;
  if (v15 <= (uint64_t)v16) {
    return objc_msgSend(objc_msgSend(v13, "effects"), "objectAtIndex:", v14 != 0);
  }
  return result;
}

- (id)outroEffect
{
  id v3 = objc_msgSend(-[MPDocument mainLayers](self, "mainLayers"), "lastObject");
  id v4 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "descriptionForStyleID:", -[MPDocument styleID](self, "styleID")), "objectForKey:", @"layout"), "objectForKey:", objc_msgSend(v3, "layerID")), "objectForKey:", @"outroEffect");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(v3, "effectContainers"), "lastObject"), "effects", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(v4, "hasPrefix:", objc_msgSend(v10, "effectID"))) {
      return v10;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)allEffectContainers
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 allEffectContainers];
}

- (id)allEffects
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 allEffects];
}

- (id)allSongs
{
  if ([(MPDocumentInternal *)self->_internal documentLayerGroup])
  {
    id v3 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
    return [(MPLayerGroup *)v3 allSongs];
  }
  else
  {
    id v5 = +[NSMutableArray array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    layerGroups = self->_layerGroups;
    id v7 = [(NSMutableDictionary *)layerGroups countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(layerGroups);
          }
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_layerGroups, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i)), "allSongs"));
        }
        id v8 = [(NSMutableDictionary *)layerGroups countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
    return v5;
  }
}

- (int64_t)antialiasLevel
{
  id v3 = +[MPStyleManager sharedManager];
  id v4 = [(MPDocument *)self styleID];
  return (int64_t)[v3 antialiasLevelForStyleID:v4];
}

- (void)reconnectAllTransitions
{
  if ([(MPDocumentInternal *)self->_internal documentLayerGroup]) {
    layerGroups = +[NSDictionary dictionaryWithObject:[(MPDocumentInternal *)self->_internal documentLayerGroup] forKey:@"docLayerGroup"];
  }
  else {
    layerGroups = self->_layerGroups;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = [(NSMutableDictionary *)layerGroups countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(layerGroups);
        }
        objc_msgSend(-[NSMutableDictionary objectForKey:](layerGroups, "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7)), "reconnectAll");
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableDictionary *)layerGroups countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)uuid
{
  return [(MPDocumentInternal *)self->_internal uuid];
}

- (CGSize)resolutionForPath:(id)a3
{
  if (NSStringHasPrefix(a3, "map"))
  {
    CGFloat height = 2048.0;
    CGFloat width = 2048.0;
  }
  else
  {
    id v7 = [(MPDocument *)self propertiesForMediaPath:a3];
    long long v8 = (NSString *)[v7 objectForKey:kMPMetaDataResolution];
    if (v8)
    {
      CGSize v9 = CGSizeFromString(v8);
      CGFloat width = v9.width;
      CGFloat height = v9.height;
    }
    else
    {
      if ([(MPDocument *)self assetKeyDelegate])
      {
        [(MPDocument *)self assetKeyDelegate];
        if (objc_opt_respondsToSelector())
        {
          objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "resolutionForAssetKey:", a3);
          CGFloat width = v11;
          CGFloat height = v10;
          if (v11 != CGSizeZero.width || v10 != CGSizeZero.height) {
            goto LABEL_16;
          }
        }
      }
      objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "resolutionForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
      CGFloat width = v14;
      CGFloat height = v13;
      if (v14 != CGSizeZero.width || v13 != CGSizeZero.height)
      {
LABEL_16:
        v18.CGFloat width = width;
        v18.CGFloat height = height;
        [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:NSStringFromCGSize(v18) forKey:kMPMetaDataResolution];
      }
    }
  }
  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (double)startTimeForPath:(id)a3
{
  double v5 = 0.0;
  if (-[MPDocument isImageAtPath:](self, "isImageAtPath:")) {
    return v5;
  }
  id v6 = [(MPDocument *)self propertiesForMediaPath:a3];
  id v7 = [v6 objectForKey:kMPMetaDataStartTime];
  if (!v7)
  {
    objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "startTimeForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    double v5 = v9;
    double v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:v10 forKey:kMPMetaDataStartTime];
    return v5;
  }
  [v7 doubleValue];
  return result;
}

- (double)stopTimeForPath:(id)a3
{
  double v5 = 0.0;
  if (-[MPDocument isImageAtPath:](self, "isImageAtPath:")) {
    return v5;
  }
  id v6 = [(MPDocument *)self propertiesForMediaPath:a3];
  id v7 = [v6 objectForKey:kMPMetaDataStopTime];
  if (!v7)
  {
    objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "stopTimeForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    double v5 = v9;
    double v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:v10 forKey:kMPMetaDataStopTime];
    return v5;
  }
  [v7 doubleValue];
  return result;
}

- (double)durationForPath:(id)a3
{
  double v5 = 0.0;
  if (-[MPDocument isImageAtPath:](self, "isImageAtPath:")) {
    return v5;
  }
  id v6 = [(MPDocument *)self propertiesForMediaPath:a3];
  id v7 = [v6 objectForKey:kMPMetaDataDuration];
  if (!v7)
  {
    objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "durationForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    double v5 = v9;
    double v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:v10 forKey:kMPMetaDataDuration];
    return v5;
  }
  [v7 doubleValue];
  return result;
}

- (int64_t)mediaTypeForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id v6 = [v5 objectForKey:kMPMetaDataMediaType];
  if (v6
    || ([(MPDocument *)self assetKeyDelegate], (objc_opt_respondsToSelector() & 1) != 0)
    && (id v8 = [(MPDocument *)self assetKeyDelegate],
        (id v6 = [v8 attributeForKey:kMPMetaDataMediaType forAssetKey:a3 withOptions:0]) != 0))
  {
    return (int64_t)[v6 integerValue];
  }
  else if ([(MPDocument *)self isImageAtPath:a3])
  {
    return 2;
  }
  else if ([(MPDocument *)self isMovieAtPath:a3])
  {
    return 3;
  }
  else
  {
    return [(MPDocument *)self isAudioAtPath:a3];
  }
}

- (id)propertiesForMediaPathAndCreateIfNeeded:(id)a3 withValue:(id)a4 forKey:(id)a5
{
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] lock];
  id v9 = [(NSMutableDictionary *)self->_fileProperties objectForKey:a3];
  id v10 = v9;
  if (a3 && !v9)
  {
    id v10 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->_fileProperties setObject:v10 forKey:a3];
  }
  [v10 setObject:a4 forKey:a5];
  [(NSRecursiveLock *)[(MPDocumentInternal *)self->_internal propertiesLock] unlock];
  return v10;
}

- (void)setDocumentLayerGroup:(id)a3
{
  if ([(MPDocumentInternal *)self->_internal documentLayerGroup])
  {
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] cleanup];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setContainer:0];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setPlug:0];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setParent:0];
    [(MPDocumentInternal *)self->_internal setDocumentLayerGroup:0];
  }
  if (a3)
  {
    id v5 = objc_msgSend(-[NSMutableDictionary allKeys](self->_layerGroups, "allKeys"), "copy");
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(MPDocument *)self removeLayerForKey:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(MPDocumentInternal *)self->_internal setDocumentLayerGroup:a3];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setIsDocumentLayerGroup:1];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setParent:self];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setContainer:[(MCPlug *)[(MCMontage *)self->_montage rootPlug] container]];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setPlug:[(MCMontage *)self->_montage rootPlug]];
  }
}

- (void)setupDocumentLayerGroup
{
  if (![(MPDocumentInternal *)self->_internal documentLayerGroup])
  {
    id v3 = objc_msgSend(-[NSMutableDictionary allKeys](self->_layerGroups, "allKeys"), "copy");
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
        id v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [(MPDocument *)self removeLayerForKey:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(MPDocumentInternal *)self->_internal setDocumentLayerGroup:objc_alloc_init(MPLayerGroup)];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setIsDocumentLayerGroup:1];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setParent:self];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setContainer:[(MCPlug *)[(MCMontage *)self->_montage rootPlug] container]];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setPlug:[(MCMontage *)self->_montage rootPlug]];
  }
}

- (void)setupLayerGroups
{
  if ([(MPDocumentInternal *)self->_internal documentLayerGroup])
  {
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] cleanup];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setContainer:0];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setPlug:0];
    [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] setParent:0];
    [(MPDocumentInternal *)self->_internal setDocumentLayerGroup:0];
    id v3 = [(MCMontage *)self->_montage rootPlug];
    [(MCPlug *)v3 setLoopDuration:10000000.0];
  }
}

- (id)actionableObjectForID:(id)a3
{
  if (![(MPDocumentInternal *)self->_internal cachedActionableLayers]
    || (id v5 = [(NSMutableDictionary *)[(MPDocumentInternal *)self->_internal cachedActionableLayers] objectForKey:a3]) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(NSMutableDictionary *)self->_layerGroups allValues];
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        long long v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) actionableObjectForID:a3];
          if (v12)
          {
            id v5 = v12;
            goto LABEL_13;
          }
          long long v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v5 = 0;
LABEL_13:
  }
  return v5;
}

- (id)documentLayerGroup
{
  return [(MPDocumentInternal *)self->_internal documentLayerGroup];
}

- (void)upgradeDocument
{
  objc_msgSend(-[MPDocument documentAttributeForKey:](self, "documentAttributeForKey:", kMPDocumentVersion), "floatValue");
  if (v3 < 3.1)
  {
    float v4 = v3;
    if ([(MPDocument *)self assetKeyDelegate])
    {
      if (v4 == 1.0)
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v5 = [(MPLayerGroup *)[(MPDocumentInternal *)self->_internal documentLayerGroup] layers];
        id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v16;
          do
          {
            id v9 = 0;
            do
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v11 = [v10 effectContainers];
                if ([v11 count] == (char *)&dword_0 + 1)
                {
                  id v12 = [v11 lastObject];
                  if ([v12 transition]) {
                    [v12 setTransition:0];
                  }
                }
              }
              id v9 = (char *)v9 + 1;
            }
            while (v7 != v9);
            id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v7);
        }
      }
      objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "upgradeDocument:withOptions:", self, 0);
      LODWORD(v13) = *(_DWORD *)"ffF@";
      long long v14 = +[NSNumber numberWithFloat:v13];
      [(MPDocument *)self setDocumentAttribute:v14 forKey:kMPDocumentVersion];
    }
  }
}

- (void)setMontage:(id)a3
{
  montage = self->_montage;
  if (montage) {

  }
  self->_montage = (MCMontage *)a3;
}

- (id)absoluteVideoPaths
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 absoluteVideoPaths];
}

- (double)volumeForPath:(id)a3
{
  if (-[MPDocument isImageAtPath:](self, "isImageAtPath:")) {
    return 1.0;
  }
  id v5 = [(MPDocument *)self propertiesForMediaPath:a3];
  id v6 = [v5 objectForKey:kMPMetaDataVolume];
  if (!v6) {
    return 1.0;
  }
  [v6 doubleValue];
  return result;
}

- (BOOL)isImageAtPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id v6 = [v5 objectForKey:kMPMetaDataMediaType];
  if (v6)
  {
    id v7 = (char *)[v6 integerValue];
  }
  else
  {
    id v7 = (char *)objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "mediaTypeForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    uint64_t v8 = +[NSNumber numberWithInteger:v7];
    [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:v8 forKey:kMPMetaDataMediaType];
  }
  return v7 == (unsigned char *)&dword_0 + 2;
}

- (BOOL)isMovieAtPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id v6 = [v5 objectForKey:kMPMetaDataMediaType];
  if (v6)
  {
    id v7 = (char *)[v6 integerValue];
  }
  else
  {
    id v7 = (char *)objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "mediaTypeForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    uint64_t v8 = +[NSNumber numberWithInteger:v7];
    [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:v8 forKey:kMPMetaDataMediaType];
  }
  return v7 == (unsigned char *)&dword_0 + 3;
}

- (BOOL)isAudioAtPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id v6 = [v5 objectForKey:kMPMetaDataMediaType];
  if (v6)
  {
    id v7 = (char *)[v6 integerValue];
  }
  else
  {
    id v7 = (char *)objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "mediaTypeForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    uint64_t v8 = +[NSNumber numberWithInteger:v7];
    [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:v8 forKey:kMPMetaDataMediaType];
  }
  return v7 == (unsigned char *)&dword_0 + 1;
}

- (id)regionsOfInterestForPath:(id)a3
{
  return [(MPDocument *)self regionsOfInterestForPath:a3 detect:0];
}

- (id)regionsOfInterestForPath:(id)a3 detect:(BOOL)a4
{
  BOOL v4 = a4;
  if (!-[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:"))
  {
    if (!v4) {
      return 0;
    }
    goto LABEL_17;
  }
  id v7 = [(MPDocument *)self propertiesForMediaPath:a3];
  id v8 = [v7 objectForKey:kMPMetaDataRegionOfInterestRectangles];
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_16;
  }
  id v9 = v8;
  [v8 lastObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v9;
  }
  id v10 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v10, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", *(void *)(*((void *)&v20 + 1) + 8 * i), kMPMetaDataRegionOfInterestBounds, 0));
      }
      id v12 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
  [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:v10 forKey:kMPMetaDataRegionOfInterestRectangles];
  if (!v10)
  {
LABEL_16:
    if (!v4) {
      return v10;
    }
LABEL_17:
    id v15 = [(MPDocument *)self absolutePathForAssetAtPath:a3];
    [(MPDocument *)self assetKeyDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v16 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "detectRegionsOfInterestForAssetKey:", a3);
    }
    else if (+[MPUtilities pathIsRelative:v15])
    {
      char v19 = 0;
      id v16 = objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "regionsOfInterestForAsset:", -[MPDocument CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:](self, "CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:", a3, &v19, 1, 0, 256.0, 256.0));
    }
    else
    {
      id v16 = objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "regionsOfInterestForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    }
    id v10 = v16;
    if (v16)
    {
      [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:v16 forKey:kMPMetaDataRegionOfInterestRectangles];
    }
    else
    {
      long long v17 = +[NSArray array];
      [(MPDocument *)self propertiesForMediaPathAndCreateIfNeeded:a3 withValue:v17 forKey:kMPMetaDataRegionOfInterestRectangles];
      return +[NSArray array];
    }
  }
  return v10;
}

- (id)creationDateForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataCreationDate];
  if (!result)
  {
    id v7 = +[MPAssetManager sharedManager];
    id v8 = [(MPDocument *)self absolutePathForAssetAtPath:a3];
    return [v7 creationDateForAssetAtPath:v8];
  }
  return result;
}

- (id)keywordsForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataKeywords];
  if (!result)
  {
    id v7 = +[MPAssetManager sharedManager];
    id v8 = [(MPDocument *)self absolutePathForAssetAtPath:a3];
    return [v7 keywordsForAssetAtPath:v8];
  }
  return result;
}

- (id)captionForPath:(id)a3
{
  id v3 = [(MPDocument *)self propertiesForMediaPath:a3];
  BOOL v4 = kMPMetaDataCaption;
  return [v3 objectForKey:v4];
}

- (id)latitudeForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataLatitude];
  if (!result)
  {
    objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "latitudeForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  return result;
}

- (id)longitudeForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataLongitude];
  if (!result)
  {
    objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "longitudeForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  return result;
}

- (id)countryForPath:(id)a3
{
  id v3 = [(MPDocument *)self propertiesForMediaPath:a3];
  BOOL v4 = kMPMetaDataCountry;
  return [v3 objectForKey:v4];
}

- (id)oceanForPath:(id)a3
{
  id v3 = [(MPDocument *)self propertiesForMediaPath:a3];
  BOOL v4 = kMPMetaDataOcean;
  return [v3 objectForKey:v4];
}

- (id)stateForPath:(id)a3
{
  id v3 = [(MPDocument *)self propertiesForMediaPath:a3];
  BOOL v4 = kMPMetaDataStateOrProvince;
  return [v3 objectForKey:v4];
}

- (id)cityForPath:(id)a3
{
  id v3 = [(MPDocument *)self propertiesForMediaPath:a3];
  BOOL v4 = kMPMetaDataCity;
  return [v3 objectForKey:v4];
}

- (id)placeForPath:(id)a3
{
  id v3 = [(MPDocument *)self propertiesForMediaPath:a3];
  BOOL v4 = kMPMetaDataPlace;
  return [v3 objectForKey:v4];
}

- (id)areaForPath:(id)a3
{
  id v3 = [(MPDocument *)self propertiesForMediaPath:a3];
  BOOL v4 = kMPMetaDataArea;
  return [v3 objectForKey:v4];
}

- (id)neighborhoodForPath:(id)a3
{
  id v3 = [(MPDocument *)self propertiesForMediaPath:a3];
  BOOL v4 = kMPMetaDataNeighborhood;
  return [v3 objectForKey:v4];
}

- (id)definedPlaceNameForPath:(id)a3
{
  id v3 = [(MPDocument *)self propertiesForMediaPath:a3];
  BOOL v4 = kMPMetaDataDefinedPlaceName;
  return [v3 objectForKey:v4];
}

- (id)altitudeForPath:(id)a3
{
  id v5 = -[MPDocument propertiesForMediaPath:](self, "propertiesForMediaPath:");
  id result = [v5 objectForKey:kMPMetaDataAltitude];
  if (!result)
  {
    objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "altitudeForAssetAtPath:", -[MPDocument absolutePathForAssetAtPath:](self, "absolutePathForAssetAtPath:", a3));
    return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  return result;
}

- (id)tiledMapPathsForAttributes:(id)a3
{
  [(MPDocument *)self assetKeyDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "relativeTiledPathsForAssetWithAttributes:", a3)) == 0)
  {
    id v6 = [a3 objectForKey:kMPAssetMapInset];
    if (v6)
    {
      [v6 CGSizeValue];
      double v8 = v7;
      double v10 = v9;
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
    }
    else
    {
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      double v10 = height;
      double v8 = CGSizeZero.width;
    }
    id v13 = [a3 objectForKey:kMPAssetMapLatLongPoints];
    id v14 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "mapTileCenteredAt:size:inset:", v13, 4096.0, 4096.0, width, height);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) CGPointValue];
          objc_msgSend(v14, "pointForLatLongCoordinates:");
          BOOL v21 = v20 < v8;
          if (v20 > 4096.0 - v8) {
            BOOL v21 = 1;
          }
          if (v19 < v10) {
            BOOL v21 = 1;
          }
          int v22 = v19 > 4096.0 - v10 || v21;
          if (v22) {
            goto LABEL_22;
          }
        }
        id v16 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      if (v22) {
LABEL_22:
      }
        id v14 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "mapTileCenteredAt:size:inset:", v13, 4096.0, 4096.0, v8, v10);
    }
    return [v14 mapGridWithRows:2 columns:2];
  }
  return result;
}

- (CGPoint)latLongPointForMap:(id)a3 withAttributes:(id)a4
{
  objc_msgSend(objc_msgSend(a4, "objectForKey:", kMPAssetOptionMapPoint), "CGPointValue");
  if (a3
    && (double v8 = v6,
        double v9 = v7,
        [(MPDocument *)self assetKeyDelegate],
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend(objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "mapTileForPath:", a3), "latLongCoordinatesForPoint:", v8, v9);
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)pointForMap:(id)a3 withAttributes:(id)a4
{
  [(MPDocument *)self assetKeyDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(objc_msgSend(a4, "objectForKey:", kMPAssetOptionMapLatLong), "CGPointValue");
    double v12 = v11;
    double v14 = v13;
    if (a3 && ([(MPDocument *)self assetKeyDelegate], (objc_opt_respondsToSelector() & 1) != 0))
    {
      id v15 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "mapTileForPath:", a3);
    }
    else
    {
      [(MPDocument *)self assetKeyDelegate];
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_30;
      }
      id v16 = [a4 objectForKey:kMPAssetMapLatLongPoints];
      id v17 = [(MPDocument *)self assetKeyDelegate];
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      id v20 = objc_msgSend(v17, "mapTileCenteredAt:size:inset:", v16, 4096.0, 4096.0, CGSizeZero.width, height);
      if (!v20) {
        goto LABEL_30;
      }
      id v21 = v20;
      id v22 = [a4 objectForKey:kMPAssetMapInset];
      if (v22)
      {
        [v22 CGSizeValue];
        double width = v23;
        double height = v24;
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v25 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v35;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v35 != v27) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v34 + 1) + 8 * i) CGPointValue];
            objc_msgSend(v21, "pointForLatLongCoordinates:");
            if (v29 < width || v29 > 4096.0 - width || v30 < height || v30 > 4096.0 - height)
            {
              id v21 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "mapTileCenteredAt:size:inset:", v16, 4096.0, 4096.0, width, height);
              goto LABEL_31;
            }
          }
          id v26 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v26);
      }
LABEL_31:
      id v15 = v21;
    }
    objc_msgSend(v15, "pointForLatLongCoordinates:", v12, v14);
    goto LABEL_33;
  }
  id v7 = [(MPDocument *)self assetKeyDelegate];
  id v8 = [v7 attributeForKey:kMPAssetAttributeMapPoint forAssetKey:a3 withOptions:a4];
  if (!v8)
  {
LABEL_30:
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    goto LABEL_33;
  }
  [v8 CGPointValue];
LABEL_33:
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)mapLevelForPath:(id)a3
{
  [(MPDocument *)self assetKeyDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v5 = [(MPDocument *)self assetKeyDelegate];
  id v6 = [v5 attributeForKey:kMPAssetAttributeMapLevel forAssetKey:a3 withOptions:0];
  return (int64_t)[v6 integerValue];
}

- (id)flightPlanFrom:(CGPoint)a3 to:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  [(MPDocument *)self assetKeyDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v9 = [(MPDocument *)self assetKeyDelegate];
  return objc_msgSend(v9, "flightPlanFrom:to:", v7, v6, x, y);
}

- (id)descriptionForRandomTransitionPresetID:(id)a3
{
  return [(MPDocument *)self organizedRandomTransitions];
}

- (id)lastRandomTransition
{
  return [(MPDocumentInternal *)self->_internal lastRandomTransition];
}

- (void)setLastRandomTransition:(id)a3
{
}

- (double)fadeOutAudioDuration
{
  [(MCMontage *)self->_montage audioFadeOutDuration];
  return result;
}

- (void)setAudioFadeOutDuration:(double)a3
{
}

- (void)organizeRandomTransitions
{
  id v3 = [(MPDocument *)self documentAttributeForKey:kMPDocumentRandomTransitionList];
  BOOL v4 = [(MPDocumentInternal *)self->_internal orderedRandomTransitions];
  id obj = v3;
  if (v3)
  {
    if (!v4) {
      [(MPDocumentInternal *)self->_internal setOrderedRandomTransitions:+[NSMutableDictionary dictionary]];
    }
    double v30 = self;
    [(NSMutableDictionary *)[(MPDocumentInternal *)self->_internal orderedRandomTransitions] removeAllObjects];
    id v5 = +[NSMutableDictionary dictionary];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v6 = [v3 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v44;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = [*(id *)(*((void *)&v43 + 1) + 8 * i) componentsSeparatedByString:@"/"];
          if ([v10 count]) {
            CFStringRef v11 = (const __CFString *)[v10 objectAtIndex:0];
          }
          else {
            CFStringRef v11 = 0;
          }
          CFStringRef v12 = @"Default";
          if ((unint64_t)[v10 count] >= 2) {
            CFStringRef v12 = (const __CFString *)[v10 objectAtIndex:1];
          }
          if (v11) {
            CFStringRef v13 = v11;
          }
          else {
            CFStringRef v13 = @"Dissolve";
          }
          id v14 = [v5 objectForKey:v13];
          if (v14)
          {
            [v14 addObject:v12];
          }
          else
          {
            id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v12, 0);
            [v5 setObject:v15 forKey:v13];
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v7);
    }
    id v16 = +[NSMutableArray array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v17 = [v5 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v40;
      uint64_t v31 = *(void *)v40;
      id v32 = v5;
      do
      {
        id v20 = 0;
        id obja = v18;
        do
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v5);
          }
          uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v20);
          id v22 = [v5 objectForKey:v21];
          if ([v22 count] == (char *)&dword_0 + 1)
          {
            double v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@", v21, [v22 lastObject]);
          }
          else
          {
            double v23 = (NSString *)+[NSMutableArray array];
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v24 = [v22 countByEnumeratingWithState:&v35 objects:v47 count:16];
            if (v24)
            {
              id v25 = v24;
              id v26 = v16;
              uint64_t v27 = *(void *)v36;
              do
              {
                for (j = 0; j != v25; j = (char *)j + 1)
                {
                  if (*(void *)v36 != v27) {
                    objc_enumerationMutation(v22);
                  }
                  [(NSString *)v23 addObject:+[NSString stringWithFormat:@"%@/%@", v21, *(void *)(*((void *)&v35 + 1) + 8 * (void)j)]];
                }
                id v25 = [v22 countByEnumeratingWithState:&v35 objects:v47 count:16];
              }
              while (v25);
              id v16 = v26;
              uint64_t v19 = v31;
              id v5 = v32;
            }
            id v18 = obja;
          }
          [v16 addObject:v23];
          id v20 = (char *)v20 + 1;
        }
        while (v20 != v18);
        id v18 = [v5 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v18);
    }
    [(NSMutableDictionary *)[(MPDocumentInternal *)v30->_internal orderedRandomTransitions] setObject:v16 forKey:@"transitionPresetIDs"];
  }
  else if (v4)
  {
    internal = self->_internal;
    [(MPDocumentInternal *)internal setOrderedRandomTransitions:0];
  }
}

- (id)organizedRandomTransitions
{
  if (![(MPDocumentInternal *)self->_internal orderedRandomTransitions]) {
    [(MPDocument *)self organizeRandomTransitions];
  }
  internal = self->_internal;
  return [(MPDocumentInternal *)internal orderedRandomTransitions];
}

- (BOOL)nearingEndWithOptions:(id)a3
{
  return 1;
}

- (double)aspectRatio
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  id v3 = [(MPLayerGroup *)v2 authoringOptionForKey:kMPAuthoringAspectRatio];
  if (!v3) {
    return 1.77777779;
  }
  [v3 floatValue];
  return v4;
}

- (double)aspectRatioDidChange:(double)a3 atTime:(double)a4
{
  id v6 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v6 aspectRatioDidChange:a3 atTime:a4];
  return result;
}

- (BOOL)detectFacesInBackground
{
  v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 detectFacesInBackground];
}

- (BOOL)isLive
{
  id v2 = [(MPDocument *)self authoringOptionForKey:kMPAuthoringLive];
  if (v2)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (id)cachedAbsolutePathFromPath:(id)a3
{
  [(NSLock *)[(MPDocumentInternal *)self->_internal cachedPathLock] lock];
  id v5 = [(NSMutableDictionary *)[(MPDocumentInternal *)self->_internal cachedAbsolutePaths] objectForKey:a3];
  [(NSLock *)[(MPDocumentInternal *)self->_internal cachedPathLock] unlock];
  return v5;
}

- (void)setAbsolutePath:(id)a3 forKey:(id)a4
{
  [(NSLock *)[(MPDocumentInternal *)self->_internal cachedPathLock] lock];
  id v7 = [(MPDocumentInternal *)self->_internal cachedAbsolutePaths];
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", [a3 copy], a4);
  }
  else {
    [(NSMutableDictionary *)v7 removeObjectForKey:a4];
  }
  uint64_t v8 = [(MPDocumentInternal *)self->_internal cachedPathLock];
  [(NSLock *)v8 unlock];
}

- (id)cachedAbsoluteStillPathFromPath:(id)a3
{
  [(NSLock *)[(MPDocumentInternal *)self->_internal cachedPathLock] lock];
  id v5 = [(NSMutableDictionary *)[(MPDocumentInternal *)self->_internal cachedAbsoluteStillPaths] objectForKey:a3];
  [(NSLock *)[(MPDocumentInternal *)self->_internal cachedPathLock] unlock];
  return v5;
}

- (void)setAbsoluteStillPath:(id)a3 forKey:(id)a4
{
  [(NSLock *)[(MPDocumentInternal *)self->_internal cachedPathLock] lock];
  id v7 = [(MPDocumentInternal *)self->_internal cachedAbsoluteStillPaths];
  if (a3) {
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", [a3 copy], a4);
  }
  else {
    [(NSMutableDictionary *)v7 removeObjectForKey:a4];
  }
  uint64_t v8 = [(MPDocumentInternal *)self->_internal cachedPathLock];
  [(NSLock *)v8 unlock];
}

- (void)setTemporarilyCacheAbsolutePaths:(BOOL)a3
{
  BOOL v3 = a3;
  if ((objc_msgSend(-[NSMutableDictionary objectForKey:](self->_documentAttributes, "objectForKey:", kMPDocumentCacheAbsolutePaths), "BOOLValue") & 1) == 0)
  {
    internal = self->_internal;
    [(MPDocumentInternal *)internal setCacheAbsolutePathOverride:v3];
  }
}

- (void)setAlwaysLookupAbsolutePaths:(BOOL)a3
{
}

- (BOOL)layersCanPositionZIndex
{
  return 0;
}

- (void)configureActions
{
  if ([(MPDocumentInternal *)self->_internal isInBatchModify])
  {
    internal = self->_internal;
    [(MPDocumentInternal *)internal setNeedsActionConfigure:1];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [(NSMutableDictionary *)self->_layerGroups allValues];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) configureActions];
        }
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)isInBatchModify
{
  return [(MPDocumentInternal *)self->_internal isInBatchModify];
}

- (int64_t)countOfLayers
{
  id v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 countOfLayers];
}

- (id)objectInLayersAtIndex:(int64_t)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v4 objectInLayersAtIndex:a3];
}

- (id)valueInLayersWithName:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v4 valueInLayersWithName:a3];
}

- (void)insertObject:(id)a3 inLayersAtIndex:(int64_t)a4
{
  id v6 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v6 insertObject:a3 inLayersAtIndex:a4];
}

- (void)removeObjectFromLayersAtIndex:(int64_t)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 removeObjectFromLayersAtIndex:a3];
}

- (void)replaceObjectInLayersAtIndex:(int64_t)a3 withObject:(id)a4
{
  id v6 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v6 replaceObjectInLayersAtIndex:a3 withObject:a4];
}

- (id)title
{
  return [(MPDocument *)self documentAttributeForKey:kMPDocumentNameAttribute];
}

- (void)setTitle:(id)a3
{
}

- (id)styleID
{
  id v2 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  return [(MPLayerGroup *)v2 styleID];
}

- (void)setStyleID:(id)a3
{
  id v4 = [(MPDocumentInternal *)self->_internal documentLayerGroup];
  [(MPLayerGroup *)v4 setStyleID:a3];
}

- (id)absolutePathForAssetAtPath:(id)a3
{
  if (![(MPDocumentInternal *)self->_internal alwaysLookupAbsolutePaths]
    && !+[MPUtilities pathIsRelative:a3])
  {
    return a3;
  }
  if (NSStringHasPrefix(a3, "mtg"))
  {
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"media/%@", [a3 substringFromIndex:6]);
    id v6 = objc_msgSend(objc_msgSend(-[MPDocument fileURL](self, "fileURL"), "path"), "stringByDeletingLastPathComponent");
    id v7 = [v6 stringByAppendingPathComponent:v5];
    uint64_t v8 = +[NSArray arrayWithObjects:@"2048", @"1024", @"768", @"512", @"384", @"256", 0];
    if (![+[NSFileManager defaultManager] fileExistsAtPath:v7]&& [(NSArray *)v8 count])
    {
      unint64_t v9 = 0;
      do
      {
        id v7 = [v6 stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"media/%d-%@", objc_msgSend(-[NSArray objectAtIndex:](v8, "objectAtIndex:", v9), "intValue"), objc_msgSend(a3, "substringFromIndex:", 6))];
        if ([+[NSFileManager defaultManager] fileExistsAtPath:v7])
        {
          break;
        }
        ++v9;
      }
      while (v9 < [(NSArray *)v8 count]);
    }
    return v7;
  }
  if ([(MPDocumentInternal *)self->_internal cacheAbsolutePathOverride]
    || objc_msgSend(-[NSMutableDictionary objectForKey:](self->_documentAttributes, "objectForKey:", kMPDocumentCacheAbsolutePaths), "BOOLValue"))
  {
    id v7 = [(MPDocument *)self cachedAbsolutePathFromPath:a3];
    if (v7) {
      return v7;
    }
  }
  if ([(MPDocument *)self assetKeyDelegate])
  {
    id v10 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "absolutePathForAssetKey:", a3);
    if (v10)
    {
      id v7 = v10;
      [(MPDocument *)self setAbsolutePath:v10 forKey:a3];
      return v7;
    }
  }
  id v12 = +[MPAssetManager sharedManager];
  return [v12 absolutePathFromPath:a3];
}

- (id)absolutePathForAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (![(MPDocumentInternal *)self->_internal alwaysLookupAbsolutePaths]
    && !+[MPUtilities pathIsRelative:a3])
  {
    return a3;
  }
  if (NSStringHasPrefix(a3, "mtg"))
  {
    uint64_t v8 = +[NSArray arrayWithObjects:@"256", @"384", @"512", @"768", @"1024", @"2048", 0];
    id v9 = objc_msgSend(objc_msgSend(-[MPDocument fileURL](self, "fileURL"), "path"), "stringByDeletingLastPathComponent");
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = [*(id *)(*((void *)&v25 + 1) + 8 * v13) integerValue];
        if (width < (double)(uint64_t)v14)
        {
          id v15 = [v9 stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"media/%d-%@", v14, objc_msgSend(a3, "substringFromIndex:", 6))];
          if ([+[NSFileManager defaultManager] fileExistsAtPath:v15])
          {
            break;
          }
        }
        if (v11 == (id)++v13)
        {
          id v11 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_20;
        }
      }
      if (v15) {
        return v15;
      }
    }
LABEL_20:
    id v17 = [v9 stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"media/%@", objc_msgSend(a3, "substringFromIndex:", 6))];
    if ([+[NSFileManager defaultManager] fileExistsAtPath:v17]|| ![(NSArray *)v8 count])
    {
      unint64_t v22 = 0;
    }
    else
    {
      unint64_t v18 = 0;
      uint64_t v19 = -1;
      do
      {
        uint64_t v20 = v19;
        id v17 = [v9 stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"media/%d-%@", objc_msgSend(-[NSArray objectAtIndex:](v8, "objectAtIndex:", (char *)-[NSArray count](v8, "count") + v19), "intValue"), objc_msgSend(a3, "substringFromIndex:", 6))];
        if ([+[NSFileManager defaultManager] fileExistsAtPath:v17])
        {
          break;
        }
        ++v18;
        NSUInteger v21 = [(NSArray *)v8 count];
        uint64_t v19 = v20 - 1;
      }
      while (v18 < v21);
      unint64_t v22 = -v20;
    }
    if (v22 >= [(NSArray *)v8 count]) {
      return 0;
    }
    else {
      return v17;
    }
  }
  id v15 = [(MPDocument *)self cachedAbsolutePathFromPath:a3];
  if (v15) {
    return v15;
  }
  if ([(MPDocument *)self assetKeyDelegate])
  {
    id v16 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "absolutePathForAssetKey:andSize:", a3, width, height);
    if (v16)
    {
      id v15 = v16;
      [(MPDocument *)self setAbsolutePath:v16 forKey:a3];
      return v15;
    }
  }
  id v24 = +[MPAssetManager sharedManager];
  return [v24 absolutePathFromPath:a3];
}

- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = -[MPDocument cachedAbsoluteStillPathFromPath:](self, "cachedAbsoluteStillPathFromPath:");
  if ([(MPDocument *)self assetKeyDelegate])
  {
    id v8 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "absolutePathForStillAssetAtPath:andSize:", a3, width, height);
    if (v8) {
      [(MPDocument *)self setAbsoluteStillPath:v8 forKey:a3];
    }
  }
  return v8;
}

- (CGImage)CGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  char v5 = 0;
  return -[MPDocument CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:](self, "CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:", a3, &v5, 0, 1, a4.width, a4.height);
}

- (CGImage)CGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4 orientation:(char *)a5 thumbnailIfPossible:(BOOL)a6 now:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v13 = [(MPDocument *)self assetKeyDelegate];
  if (!v13) {
    return 0;
  }
  id v14 = v13;
  if (objc_opt_respondsToSelector())
  {
    id v15 = objc_msgSend(v14, "retainedCGImageForAssetKey:andSize:orientation:thumbnailIfPossible:now:", a3, a5, v8, v7, width, height);
LABEL_8:
    return (CGImage *)v15;
  }
  if (objc_opt_respondsToSelector())
  {
    id v15 = objc_msgSend(v14, "retainedCGImageForAssetKey:andSize:orientation:", a3, a5, width, height);
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    id v15 = objc_msgSend(v14, "retainedCGImageForAssetKey:andSize:", a3, width, height);
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v15 = objc_msgSend(v14, "retainedThumbnailCGImageForAssetKey:andSize:", a3, width, height);
      goto LABEL_8;
    }
    return 0;
  }
  return (CGImage *)objc_msgSend(v14, "cgImageForAssetKey:andSize:", a3, width, height);
}

- (CGImage)thumbnailCGImageForAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [(MPDocument *)self assetKeyDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v8 = objc_msgSend(-[MPDocument assetKeyDelegate](self, "assetKeyDelegate"), "retainedThumbnailCGImageForAssetKey:andSize:", a3, width, height);
  return (CGImage *)v8;
}

- (id)avAssetForAssetAtPath:(id)a3
{
  if (![(MPDocument *)self assetKeyDelegate]) {
    return 0;
  }
  [(MPDocument *)self assetKeyDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v5 = [(MPDocument *)self assetKeyDelegate];
  return [v5 avAssetForAssetKey:a3];
}

- (id)dataForAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (![(MPDocument *)self assetKeyDelegate]) {
    return 0;
  }
  [(MPDocument *)self assetKeyDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v8 = [(MPDocument *)self assetKeyDelegate];
  return objc_msgSend(v8, "imageDataForAssetKey:andSize:", a3, width, height);
}

- (BOOL)isSupportedMovieForAssetAtPath:(id)a3
{
  if (NSStringHasPrefix(a3, "map")) {
    return 0;
  }
  id v6 = [(MPDocument *)self propertiesForMediaPath:a3];
  id v7 = [v6 objectForKey:kMPMetaDataMediaType];
  if (v7) {
    id v8 = (char *)[v7 integerValue];
  }
  else {
    id v8 = (char *)objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "mediaTypeForAssetAtPath:", a3);
  }
  return v8 == (unsigned char *)&dword_0 + 3;
}

- (CGSize)resolutionForAssetAtPath:(id)a3
{
  if (NSStringHasPrefix(a3, "map"))
  {
    double width = 2048.0;
    double height = 2048.0;
  }
  else
  {
    id v7 = [(MPDocument *)self propertiesForMediaPath:a3];
    id v8 = (NSString *)[v7 objectForKey:kMPMetaDataResolution];
    if (v8)
    {
      CGSize v9 = CGSizeFromString(v8);
      double height = v9.height;
      double width = v9.width;
    }
    else
    {
      [(MPDocument *)self resolutionForPath:a3];
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)attributeForAssetAtPath:(id)a3 forKey:(id)a4
{
  return 0;
}

- (double)startTimeForAssetAtPath:(id)a3
{
  if ([(MPDocumentInternal *)self->_internal assetLogging]) {
    NSLog(@"startTimeForAssetAtPath: %@", a3);
  }
  [(MPDocument *)self startTimeForPath:a3];
  return result;
}

- (double)stopTimeForAssetAtPath:(id)a3
{
  if ([(MPDocumentInternal *)self->_internal assetLogging]) {
    NSLog(@"stopTimeForAssetAtPath: %@", a3);
  }
  [(MPDocument *)self stopTimeForPath:a3];
  return result;
}

@end