@interface MPAuthoringController
+ (id)sharedController;
+ (void)releaseSharedController;
- (BOOL)canDocumentFitToAudio:(id)a3 withOptions:(id)a4 requiredAudioDuration:(double *)a5;
- (BOOL)canLayerGroupFitToAudio:(id)a3 inDocument:(id)a4 withOptions:(id)a5 requiredAudioDuration:(double *)a6;
- (BOOL)canScaleToAudioInDocument:(id)a3 withOptions:(id)a4;
- (BOOL)determineIfSlideDisplayesForTheWholeDurationForEffect:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5 inStyleID:(id)a6;
- (BOOL)imagesHaveMovie:(id)a3 start:(int64_t)a4 count:(int64_t)a5;
- (BOOL)isAuthoring;
- (BOOL)prepareDocumentForExport:(id)a3 withOptions:(id)a4;
- (MPAuthoringController)init;
- (double)maximumDurationForLayer:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (double)minimumDurationForLayer:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (id)_addVideoPaths:(id)a3 toEndOfLayer:(id)a4 inDocument:(id)a5 withOptions:(id)a6;
- (id)_collectVersionInformationFromStyle:(id)a3;
- (id)_grabAndRemoveTitleEffectFromDocument:(id)a3 withOptions:(id)a4;
- (id)authoredDocument;
- (id)createAudioPlayListFromAudioPaths:(id)a3 andOptions:(id)a4;
- (id)createEffectToTransitionMapWithOptions:(id)a3;
- (id)createLayerWithImages:(id)a3 effects:(id)a4 andOptions:(id)a5;
- (id)delegate;
- (id)dynamicLayerWithImages:(id)a3 withOptions:(id)a4;
- (id)effectAuthoredLayerWithImages:(id)a3 withOptions:(id)a4;
- (id)effectContainersWithImages:(id)a3 effects:(id)a4 andOptions:(id)a5;
- (id)effectContainersWithPaths:(id)a3 forDocument:(id)a4 withOptions:(id)a5;
- (id)effectsForImages:(id)a3 withOptions:(id)a4;
- (id)exportTransitionFromOptions:(id)a3;
- (id)filtersForEffectFromOptions:(id)a3;
- (id)filtersForLayerFromOptions:(id)a3;
- (id)filtersForSlideFromOptions:(id)a3;
- (id)findEffectIDInPresetArray:(id)a3 forImages:(id)a4 withOptions:(id)a5;
- (id)findEffectIDInWeighter:(id)a3 images:(id)a4 startingIndex:(int64_t)a5 count:(int64_t)a6 triesToFind:(int64_t *)a7 constraints:(id)a8 previousTags:(id)a9;
- (id)frameFromOptions:(id)a3;
- (id)loopTransitionFromOptions:(id)a3;
- (id)orderImages:(id)a3 withOptions:(id)a4;
- (id)pickRandomPathsInArray:(id)a3 excludingPaths:(id)a4 count:(int64_t)a5;
- (id)shuffleImagesByRating:(id)a3 withOptions:(id)a4;
- (id)slidesWithImages:(id)a3 andOptions:(id)a4;
- (id)sortImagePaths:(id)a3 toAspectRatiosInEffectPresetID:(id)a4 withOptions:(id)a5;
- (id)titleEffectsForImages:(id)a3 withOptions:(id)a4;
- (id)transitionFromOptions:(id)a3;
- (id)transitionFromOptions:(id)a3 firstEffectContainer:(id)a4 nextEffectContainer:(id)a5;
- (int64_t)_countOfEmptyContainersInIntroOfLayer:(id)a3 withOptions:(id)a4;
- (int64_t)_numberOfSlidesForOutroInLayer:(id)a3 withOptions:(id)a4;
- (int64_t)bestCountFromClusterForEffectWithImages:(id)a3 atStartIndex:(int64_t)a4 withWeighter:(id)a5 usedIndex:(int64_t *)a6;
- (unint64_t)authorDocument:(id)a3 withOptions:(id)a4;
- (unint64_t)authorLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)_checkForEmptyLayersInDocument:(id)a3;
- (void)_readdTitleEffect:(id)a3 toDocument:(id)a4 withOptions:(id)a5;
- (void)_reorderImagesInDocument:(id)a3 withOptions:(id)a4;
- (void)addStyledCaptionToSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)authorPlacesWithImages:(id)a3 forLayerGroup:(id)a4 inDocument:(id)a5 withOptions:(id)a6;
- (void)beatAlignEffectContainers:(id)a3 toBeats:(id)a4 withOptions:(id)a5;
- (void)beatAlignLayer:(id)a3 toBeats:(id)a4 withOptions:(id)a5;
- (void)beatAlignLayers:(id)a3 toAudioPlaylist:(id)a4 forDocument:(id)a5 withOptions:(id)a6;
- (void)cacheROIInformationForImages:(id)a3 withOptions:(id)a4;
- (void)checkForOffsetsForLayers:(id)a3 withOptions:(id)a4;
- (void)cleanup;
- (void)cleanup:(BOOL)a3;
- (void)cleanupClusters;
- (void)clearROICache;
- (void)combineEffectsNearSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)combineSlides:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)configureFiltersInDocument:(id)a3 withOptions:(id)a4;
- (void)configureIntroInDocument:(id)a3 withOptions:(id)a4;
- (void)configureOutroInDocument:(id)a3 withOptions:(id)a4;
- (void)configurePanoramaInformationToEffect:(id)a3 inDocument:(id)a4 startingIndex:(int64_t)a5 count:(int64_t)a6 removeOldIndex:(int64_t)a7;
- (void)configureTransitionsInDocument:(id)a3 withOptions:(id)a4;
- (void)dealloc;
- (void)fillDurationsForLayers:(id)a3 withOptions:(id)a4;
- (void)findUsableClustersForUserDefinedSlideOrderPresentation:(id)a3 inClusters:(id)a4;
- (void)finishLogging;
- (void)insertVideoPaths:(id)a3 atIndex:(int64_t)a4 inDocument:(id)a5 withOptions:(id)a6;
- (void)matchDurationsForLayers:(id)a3 withOptions:(id)a4;
- (void)moveSlidesFromIndicies:(id)a3 toIndex:(int64_t)a4 inDocument:(id)a5 withOptions:(id)a6;
- (void)performInitialFaceDetectionInGroup:(id)a3 withOptions:(id)a4;
- (void)populateWeighter:(id)a3 withEffects:(id)a4 andOptions:(id)a5;
- (void)populateWeighter:(id)a3 withTransitions:(id)a4 andOptions:(id)a5;
- (void)prepareDocumentForPlayback:(id)a3 withOptions:(id)a4;
- (void)reconfigureColorSchemeForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)reconfigureColorSchemeInDocument:(id)a3 withOptions:(id)a4;
- (void)reconfigureImagesInDocument:(id)a3 withOptions:(id)a4;
- (void)reconfigureTitleEffectForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)reconfigureTitleEffectInDocument:(id)a3 withOptions:(id)a4;
- (void)removeSlidesAtIndicies:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)removeStyledCaptionFromSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)scaleDurationsForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)scaleDurationsInDocument:(id)a3 withOptions:(id)a4;
- (void)scaleDurationsInEffectContainers:(id)a3 withOptions:(id)a4;
- (void)scaleDurationsInLayer:(id)a3 withMutableOptions:(id)a4;
- (void)scaleDurationsInLayer:(id)a3 withOptions:(id)a4;
- (void)scaleLayerToMatchAudio:(id)a3 withBeats:(id)a4 withOptions:(id)a5;
- (void)scaleLayerToMatchAudio:(id)a3 withOptions:(id)a4;
- (void)setAuthoredDocument:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitleTextToColor:(CGColor *)a3 forLayerGroup:(id)a4 inDocument:(id)a5 withOptions:(id)a6;
- (void)setTitleTextToColor:(CGColor *)a3 inDocument:(id)a4 withOptions:(id)a5;
- (void)setupClustersWithPaths:(id)a3 withOptions:(id)a4;
- (void)startLogging;
- (void)upgradeDocument:(id)a3 withOptions:(id)a4;
- (void)upgradeLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5;
@end

@implementation MPAuthoringController

+ (id)sharedController
{
  id result = (id)qword_1F13D0;
  if (!qword_1F13D0)
  {
    objc_sync_enter(a1);
    if (!qword_1F13D0) {
      qword_1F13D0 = objc_alloc_init(MPAuthoringController);
    }
    objc_sync_exit(a1);
    return (id)qword_1F13D0;
  }
  return result;
}

+ (void)releaseSharedController
{
  if (qword_1F13D0)
  {
    objc_sync_enter(a1);

    qword_1F13D0 = 0;
    objc_sync_exit(a1);
  }
  +[MPClusterController releaseSharedController];
}

- (MPAuthoringController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPAuthoringController;
  v2 = [(MPAuthoringController *)&v8 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    v2->_beatLock = v3;
    [(NSRecursiveLock *)v3 setName:@"MPAuthoringController.beatLock"];
    v2->_weighter = objc_alloc_init(MPWeighter);
    v2->_transitionWeighter = objc_alloc_init(MPWeighter);
    v2->_stats = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4 = (NSLock *)objc_alloc_init((Class)NSLock);
    v2->_cachedROILock = v4;
    [(NSLock *)v4 setName:@"MPAuthoringController.cachedROILock"];
    v2->_cachedROIInformation = 0;
    v2->_authorLock = (NSLock *)objc_alloc_init((Class)NSLock);
    v2->_logLevel = 0;
    v2->_placesDistanceSeperation = 2000.0;
    v2->_placesDebug = 0;
    v5 = +[NSUserDefaults standardUserDefaults];
    if ([(NSUserDefaults *)v5 objectForKey:@"PlacesDebug"]) {
      v2->_placesDebug = [(NSUserDefaults *)v5 BOOLForKey:@"PlacesDebug"];
    }
    if ([(NSUserDefaults *)v5 objectForKey:@"placesDistanceSeperation"])
    {
      [(NSUserDefaults *)v5 floatForKey:@"placesDistanceSeperation"];
      v2->_placesDistanceSeperation = v6;
    }
    if ([(NSUserDefaults *)v5 objectForKey:@"logLevel"]) {
      v2->_logLevel = [(NSUserDefaults *)v5 integerForKey:@"logLevel"];
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MPAuthoringController;
  [(MPAuthoringController *)&v3 dealloc];
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (unint64_t)authorDocument:(id)a3 withOptions:(id)a4
{
  id v7 = [a3 documentLayerGroup];
  return [(MPAuthoringController *)self authorLayerGroup:v7 inDocument:a3 withOptions:a4];
}

- (unint64_t)authorLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  [(NSLock *)self->_authorLock lock];
  [(MPAuthoringController *)self startLogging];
  self->_cancelAuthoring = 0;
  if (!a5) {
    a5 = [a3 authoringOptions];
  }
  [(MPAuthoringController *)self setAuthoredDocument:a4];
  self->_isAuthoring = 1;
  unint64_t v9 = +[MPAuthoringUtilities randomSeedFromOptions:a5];
  self->_seed = v9;
  srandom(v9);
  id v10 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:a5];
  v11 = +[NSNumber numberWithInteger:self->_seed];
  [v10 setObject:v11 forKey:kMPAuthoringSeed];
  CFStringRef v12 = (const __CFString *)[v10 objectForKey:kMPAuthoringStyleID];
  if (!v12
    || (CFStringRef v13 = v12,
        !objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "descriptionForStyleID:", v12)))
  {
    CFStringRef v13 = @"Classic";
    [v10 setObject:@"Classic" forKey:kMPAuthoringStyleID];
  }
  if ([+[NSUserDefaults standardUserDefaults] BOOLForKey:@"MPUseImageOnlyTitleEffect"])
  {
    v14 = +[NSNumber numberWithBool:0];
    [v10 setObject:v14 forKey:kMPAuthoringUseTitleEffect];
    v15 = +[NSNumber numberWithBool:1];
    [v10 setObject:v15 forKey:kMPAuthoringUseImageOnlyTitleEffect];
  }
  unsigned int v167 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "isDynamicForStyleID:", v13);
  unsigned int v180 = objc_msgSend(objc_msgSend(v10, "objectForKey:", kMPAuthoringLive), "BOOLValue");
  if ([a3 countOfLayers])
  {
    if ([v10 objectForKey:kMPAuthoringLiveReset]) {
      unsigned int v16 = objc_msgSend(objc_msgSend(v10, "objectForKey:", kMPAuthoringLiveReset), "BOOLValue") ^ 1;
    }
    else {
      unsigned int v16 = 1;
    }
    unsigned int v175 = v16;
  }
  else
  {
    unsigned int v175 = 0;
  }
  if (v180)
  {
    objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v175), @"isSetup");
    v17 = +[NSNumber numberWithBool:1];
    [v10 setObject:v17 forKey:kMPAuthoringAlwaysIncludeLastTransition];
    if (v175)
    {
      [v10 removeObjectForKey:kMPAuthoringIntroEffectID];
    }
    else
    {
      [(MPWeighter *)self->_weighter clearAllItems];
      [(MPWeighter *)self->_transitionWeighter clearAllItems];
    }
  }
  v178 = (__CFString *)v13;
  if (objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "canCancelAuthoringForStyleID:", v13))id v18 = objc_msgSend(a3, "copy"); {
  else
  }
    id v18 = 0;
  id v183 = a5;
  unint64_t v19 = +[MPAuthoringUtilities presentationOrderFromOptions:a5];
  v20 = (NSMutableArray *)[a3 videoPaths];
  unint64_t v21 = (unint64_t)+[MPAuthoringUtilities videoPathsRangeFromOptions:v10];
  id v179 = a4;
  v184 = v10;
  v185 = v22;
  id v187 = a3;
  v165 = v18;
  unint64_t v162 = v21;
  if (v21 | (unint64_t)v22)
  {
    unint64_t v23 = v21;
    v169 = v22;
    if (&v22[v21] > [(NSMutableArray *)v20 count]) {
      v169 = (char *)[(NSMutableArray *)v20 count] - v23;
    }
    if (v19 == 4)
    {
      v20 = +[NSMutableArray arrayWithArray:[(MPAuthoringController *)self shuffleImagesByRating:v20 withOptions:v10]];
    }
    else
    {
      id v24 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", v23, v169);
      if (v169) {
        v25 = +[NSMutableArray arrayWithArray:[(NSMutableArray *)v20 objectsAtIndexes:v24]];
      }
      else {
        v25 = (NSMutableArray *)+[NSMutableArray array];
      }
      v20 = v25;
    }
    id v26 = [v10 objectForKey:kMPAuthoringLiveMissedImages];
    BOOL v27 = 0;
    if (v26 && v19 != 4)
    {
      v28 = v26;
      id v181 = [v26 copy];
      if ([v28 count])
      {
        id v29 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, objc_msgSend(v28, "count"));
        [(NSMutableArray *)v20 insertObjects:v28 atIndexes:v29];
      }
      v30 = (NSMutableArray *)+[NSMutableArray array];
      v31 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      long long v200 = 0u;
      long long v201 = 0u;
      long long v202 = 0u;
      long long v203 = 0u;
      id v32 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v200 objects:v207 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v201;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v201 != v34) {
              objc_enumerationMutation(v20);
            }
            uint64_t v36 = *(void *)(*((void *)&v200 + 1) + 8 * i);
            if ([+[NSFileManager defaultManager] fileExistsAtPath:[(MPDocument *)self->_authoredDocument absolutePathForAssetAtPath:v36]])
            {
              v37 = v30;
            }
            else
            {
              v37 = v31;
            }
            [(NSMutableArray *)v37 addObject:v36];
          }
          id v33 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v200 objects:v207 count:16];
        }
        while (v33);
      }
      v38 = +[NSMutableSet setWithArray:v181];
      [(NSMutableSet *)v38 intersectsSet:+[NSSet setWithArray:v31]];
      long long v196 = 0u;
      long long v197 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      id v39 = [(NSMutableSet *)v38 countByEnumeratingWithState:&v196 objects:v206 count:16];
      a3 = v187;
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v197;
        do
        {
          for (j = 0; j != v40; j = (char *)j + 1)
          {
            if (*(void *)v197 != v41) {
              objc_enumerationMutation(v38);
            }
            [(NSMutableArray *)v31 removeObject:*(void *)(*((void *)&v196 + 1) + 8 * (void)j)];
          }
          id v40 = [(NSMutableSet *)v38 countByEnumeratingWithState:&v196 objects:v206 count:16];
        }
        while (v40);
      }

      [(MPDocument *)self->_authoredDocument setAuthoringOption:v31 forKey:kMPAuthoringLiveMissedImages];
      BOOL v27 = [(NSMutableArray *)v31 count] != 0;

      v20 = v30;
      a4 = v179;
      id v10 = v184;
    }
    if (v180)
    {
      id v43 = [v10 objectForKey:kMPAuthoringLiveUseOutro];
      unsigned int v44 = v43 ? [v43 BOOLValue] : 1;
      char v45 = &v169[v162] < objc_msgSend(objc_msgSend(a3, "videoPaths"), "count") || v27;
      if ((v45 & 1) != 0 || !v44)
      {
        v46 = +[NSNumber numberWithBool:0];
        [v10 setObject:v46 forKey:kMPAuthoringUseLoopTransition];
        [v10 setObject:kMPFadeNone forKey:kMPAuthoringOutroEffectID];
        objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"hasMoreImages");
      }
    }
  }
  else
  {
    v169 = 0;
  }
  id v47 = [(NSMutableArray *)v20 count];
  BOOL v171 = v47 != 0;
  int64_t v48 = +[MPAuthoringUtilities minimumNumberOfDynamicSlidesToAddFromOptions:v10];
  if ([a3 loopingMode] == (char *)&dword_4 + 1)
  {
    if (v167)
    {
      BOOL v158 = 1;
      int v164 = 0;
      goto LABEL_76;
    }
    BOOL v158 = 1;
    int v164 = 1;
    v51 = v185;
  }
  else
  {
    v49 = (char *)[a3 loopingMode];
    char v50 = v167;
    int v164 = v167 ^ 1;
    if (v49 != (unsigned char *)&dword_0 + 2) {
      char v50 = 0;
    }
    if (v50)
    {
      BOOL v158 = 1;
      goto LABEL_76;
    }
    BOOL v158 = v49 == (unsigned char *)&dword_0 + 2;
    v51 = v185;
    if (v49 != (unsigned char *)&dword_0 + 2) {
      v51 = v169;
    }
  }
  v52 = (char *)objc_msgSend(objc_msgSend(a3, "videoPaths"), "count");
  if (v51 >= v52) {
    int64_t v48 = (int64_t)v52;
  }
  else {
    int64_t v48 = (int64_t)v51;
  }
LABEL_76:
  uint64_t v53 = v48 - (void)[(NSMutableArray *)v20 count];
  v160 = (char *)[(NSMutableArray *)v20 count];
  v159 = (char *)objc_msgSend(objc_msgSend(a3, "videoPaths"), "count");
  char v54 = v175;
  if (v47) {
    char v54 = 1;
  }
  unint64_t v173 = v53;
  if (v54)
  {
    if (v53 > 0) {
      unsigned int v55 = v180;
    }
    else {
      unsigned int v55 = 0;
    }
    p_cancelAuthoring = &self->_cancelAuthoring;
    if (v55 != 1)
    {
      uint64_t v157 = -1;
      goto LABEL_105;
    }
    id v57 = [a3 videoPaths];
    id v58 = objc_alloc_init((Class)NSMutableArray);
    id v59 = [v10 objectForKey:kMPAuthoringLivePlaceholderIndex];
    if (v59) {
      v60 = (char *)[v59 integerValue];
    }
    else {
      v60 = 0;
    }
    v62 = (char *)[v57 count];
    if ((uint64_t)v62 < 1)
    {
      a3 = v187;
    }
    else
    {
      v63 = v62;
      uint64_t v64 = 0;
      if ((uint64_t)v60 >= (uint64_t)v62) {
        v60 = 0;
      }
      do
      {
        if ((unint64_t)[v58 count] >= v173) {
          break;
        }
        id v65 = [v57 objectAtIndex:v60];
        if ([+[NSFileManager defaultManager] fileExistsAtPath:[(MPDocument *)self->_authoredDocument absolutePathForAssetAtPath:v65]])
        {
          [v58 addObject:v65];
        }
        else
        {
          ++v64;
        }
        a4 = v179;
        id v10 = v184;
        if ((uint64_t)(v60 + 1) < (uint64_t)v63) {
          ++v60;
        }
        else {
          v60 = 0;
        }
      }
      while (v64 < (uint64_t)v63);
      a3 = v187;
      if ([v58 count])
      {
        [(NSMutableArray *)v20 addObjectsFromArray:v58];
        BOOL v171 = 1;
      }
      authoredDocument = self->_authoredDocument;
      v67 = +[NSNumber numberWithInteger:v60];
      [(MPDocument *)authoredDocument setAuthoringOption:v67 forKey:kMPAuthoringLivePlaceholderIndex];
    }
    uint64_t v157 = (uint64_t)v60;
  }
  else
  {
    uint64_t v157 = -1;
    self->_seed = -1;
    v61 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v61 postNotificationName:kMPAuthoringNoImagesAvailableNotification object:self->_authoredDocument userInfo:0];
    BOOL v171 = 0;
  }
  p_cancelAuthoring = &self->_cancelAuthoring;
LABEL_105:
  unsigned int v172 = v180 ^ 1;
  [(MPAuthoringController *)self clearROICache];
  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  id v68 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v192 objects:v205 count:16];
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v193;
    do
    {
      for (k = 0; k != v69; k = (char *)k + 1)
      {
        if (*(void *)v193 != v70) {
          objc_enumerationMutation(v20);
        }
        [(MPDocument *)self->_authoredDocument absolutePathForAssetAtPath:*(void *)(*((void *)&v192 + 1) + 8 * (void)k)];
      }
      id v69 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v192 objects:v205 count:16];
    }
    while (v69);
  }
  [a4 setTemporarilyCacheAbsolutePaths:1];
  [(MPAuthoringController *)self cacheROIInformationForImages:v20 withOptions:v10];
  id v174 = objc_msgSend(objc_msgSend(a3, "audioPaths"), "mutableCopy");
  p_info = MRTiledSprite.info;
  unsigned __int8 v182 = +[MPAuthoringUtilities ignoreClusteringForImages:v20 withOptions:v10];
  int v163 = v175 ^ 1;
  int v168 = v172 | v175 ^ 1;
  if (v168 != 1)
  {
    unsigned int v75 = 0;
    goto LABEL_142;
  }
  objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
  unsigned int v73 = +[MPAuthoringUtilities replaceAudioPlaylistFromOptions:v10];
  if (v73)
  {
    objc_msgSend(objc_msgSend(a3, "audioPlaylist"), "removeAllSongs");
    if ([v174 count]) {
      char v74 = v73;
    }
    else {
      char v74 = 0;
    }
    if ((v74 & 1) == 0)
    {
      [v174 count];
      goto LABEL_122;
    }
LABEL_128:
    objc_msgSend(a3, "setAudioPlaylist:", -[MPAuthoringController createAudioPlayListFromAudioPaths:andOptions:](self, "createAudioPlayListFromAudioPaths:andOptions:", v174, v10));
    goto LABEL_129;
  }
  [v174 count];
  if ([v174 count])
  {
    id v76 = objc_msgSend(objc_msgSend(a3, "audioPlaylist"), "countOfSongs");
    if (v76 != [v174 count]) {
      goto LABEL_128;
    }
  }
LABEL_122:
  if (![v174 count]
    && +[MPAuthoringUtilities useDefaultAudioFromOptions:v10])
  {
    id v77 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "songPathsForStyleID:", v178);
    [a3 setAudioPaths:v77];
    if (v77 && [v77 count]) {
      objc_msgSend(a3, "setAudioPlaylist:", -[MPAuthoringController createAudioPlayListFromAudioPaths:andOptions:](self, "createAudioPlayListFromAudioPaths:andOptions:", v77, v10));
    }
    [v174 addObjectsFromArray:v77];
    char v78 = 1;
    goto LABEL_130;
  }
LABEL_129:
  char v78 = 0;
LABEL_130:
  unsigned int v75 = +[MPAuthoringUtilities alignToBeatsFromOptions:v10];
  unsigned int v79 = +[MPAuthoringUtilities createBeatsFromOptions:v10];
  if ((v78 & 1) == 0 && v75)
  {
    unsigned int v80 = v79;
    unsigned int v81 = [v174 count] ? v80 : 0;
    if (v81 == 1)
    {
      p_cancelAuthoring = &self->_cancelAuthoring;
      +[NSThread detachNewThreadSelector:toTarget:withObject:](NSThread, "detachNewThreadSelector:toTarget:withObject:", "createBeatsThreaded:", self, +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v174, 0));
    }
  }
  objc_msgSend(objc_msgSend(a3, "audioPlaylist"), "duration");
  if (v82 > 0.0
    && (char *)+[MPAuthoringUtilities audioScalingModeFromOptions:](MPAuthoringUtilities, "audioScalingModeFromOptions:", v10) == (char *)&dword_0 + 1&& ![v10 objectForKey:kMPAuthoringAudioDuration])
  {
    objc_msgSend(objc_msgSend(a3, "audioPlaylist"), "duration");
    v83 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v10 setObject:v83 forKey:kMPAuthoringAudioDuration];
  }
  objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "unlock");
LABEL_142:
  v84 = v178;
  unsigned int v161 = v75;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [self->_delegate authoringDocument:self->_authoredDocument progress:p_cancelAuthoring shouldCancel:0.1];
  }
  id v170 = objc_alloc_init((Class)NSMutableArray);
  if ([(__CFString *)v178 isEqualToString:@"Places"])
  {
    objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
    [(MPAuthoringController *)self authorPlacesWithImages:v20 forLayerGroup:a3 inDocument:a4 withOptions:v10];
    id v186 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", objc_msgSend(a3, "layers"));
    objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "unlock");
    *(void *)&v177[4] = 0;
    goto LABEL_229;
  }
  id v186 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v85 = +[MPAuthoringUtilities numberOfLayersFromOptions:v10];
  if (v85 >= 1)
  {
    uint64_t v86 = v85;
    uint64_t v87 = 0;
    *(_DWORD *)&v177[8] = 0;
    *(void *)v177 = v164 | v163;
    char v176 = v164 | v175;
    double v88 = 0.0;
    double v89 = 0.0;
    while (1)
    {
      if (*p_cancelAuthoring) {
        goto LABEL_167;
      }
      v91 = +[NSNumber numberWithInteger:v87];
      [v10 setObject:v91 forKey:kMPAuthoringLayerIndex];
      unsigned int v92 = [p_info + 186 isLayerEffectAuthoredFromOptions:v183];
      id v93 = v10;
      unsigned int v94 = v92;
      if ((v182 & 1) == 0 && (unint64_t)[(NSMutableArray *)v20 count] >= 3) {
        [(MPAuthoringController *)self setupClustersWithPaths:v20 withOptions:v93];
      }
      id v95 = [(MPAuthoringController *)self orderImages:v20 withOptions:v93];
      if (((v164 | v163) & 1) == 0) {
        break;
      }
      if ((v176 & 1) == 0)
      {
        id v10 = v184;
        objc_msgSend(v186, "addObject:", -[MPAuthoringController dynamicLayerWithImages:withOptions:](self, "dynamicLayerWithImages:withOptions:", v95, v184));
        goto LABEL_164;
      }
      if (v94)
      {
        p_info = MRTiledSprite.info;
        if (+[MPAuthoringUtilities useTitleEffectFromOptions:v183])
        {
          v96 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", [v95 objectAtIndex:0]);
          id v97 = [(MPAuthoringController *)self titleEffectsForImages:v96 withOptions:v183];
          if (v97)
          {
            id v98 = objc_msgSend(-[MPAuthoringController effectContainersWithImages:effects:andOptions:](self, "effectContainersWithImages:effects:andOptions:", v96, v97, v183), "mutableCopy");
            id v10 = v184;
            id v99 = [(MPAuthoringController *)self effectAuthoredLayerWithImages:v95 withOptions:v184];
            id v100 = v99;
            if (v98 && (uint64_t)[v99 countOfEffectContainers] >= 1) {
              [v100 insertEffectContainers:v98 atIndex:0];
            }
          }
          else
          {
            id v10 = v184;
            id v100 = [(MPAuthoringController *)self effectAuthoredLayerWithImages:v95 withOptions:v184];
            id v98 = 0;
          }

          v109 = v186;
          id v108 = v100;
        }
        else
        {
          id v10 = v184;
          id v108 = [(MPAuthoringController *)self effectAuthoredLayerWithImages:v95 withOptions:v184];
          v109 = v186;
        }
        [v109 addObject:v108];
        goto LABEL_165;
      }
      id v93 = v184;
      id v101 = [(MPAuthoringController *)self effectsForImages:v95 withOptions:v184];
      if (![v101 count]) {
        goto LABEL_162;
      }
      id v102 = [(MPAuthoringController *)self createLayerWithImages:v95 effects:v101 andOptions:v184];
      id v10 = v184;
      if ((uint64_t)[v102 countOfEffectContainers] <= 0 && !objc_msgSend(v95, "count")) {
        goto LABEL_164;
      }
      [v102 setAudioPriority:v87 + 10];
      [v186 addObject:v102];
      [(MPAuthoringController *)self checkForOffsetsForLayers:v186 withOptions:v184];
      [v184 removeObjectForKey:kMPAuthoringMinimumDuration];
      [v184 removeObjectForKey:kMPAuthoringMaximumDuration];
      [(MPAuthoringController *)self scaleDurationsInLayer:v102 withMutableOptions:v184];
      objc_msgSend(objc_msgSend(v184, "objectForKeyedSubscript:", kMPAuthoringMinimumDuration), "doubleValue");
      double v104 = v103;
      objc_msgSend(objc_msgSend(v184, "objectForKeyedSubscript:", kMPAuthoringMaximumDuration), "doubleValue");
      if (v104 >= v89) {
        double v89 = v104;
      }
      if (v105 >= v88) {
        double v106 = v88;
      }
      else {
        double v106 = v105;
      }
      if (v105 <= 0.0) {
        double v106 = v88;
      }
      if (v88 == 0.0) {
        double v88 = v105;
      }
      else {
        double v88 = v106;
      }
      p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
      if (v161)
      {
        p_cancelAuthoring = &self->_cancelAuthoring;
        if ([v174 count])
        {
          id v107 = -[MPAuthoringController beatsForAudioPlaylist:withOptions:](self, "beatsForAudioPlaylist:withOptions:", [v187 audioPlaylist], v184);
          if (v107) {
            [(MPAuthoringController *)self beatAlignLayer:v102 toBeats:v107 withOptions:v184];
          }
        }
        goto LABEL_166;
      }
LABEL_165:
      p_cancelAuthoring = &self->_cancelAuthoring;
LABEL_166:
      a3 = v187;
LABEL_167:
      ++v87;
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
        [self->_delegate authoringDocument:self->_authoredDocument progress:p_cancelAuthoring shouldCancel:(double)(v87 / v86) * 0.8 + 0.1];
      }
      if (v86 == v87) {
        goto LABEL_194;
      }
    }
    *(void *)&v177[4] = [(MPAuthoringController *)self slidesWithImages:v95 andOptions:v93];
LABEL_162:
    id v10 = v93;
LABEL_164:
    p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
    goto LABEL_165;
  }
  *(void *)&v177[4] = 0;
  double v89 = 0.0;
  double v88 = 0.0;
LABEL_194:
  v110 = self->_authoredDocument;
  v111 = +[NSNumber numberWithDouble:v89];
  [(MPDocument *)v110 setAuthoringOption:v111 forKey:kMPAuthoringMinimumDuration];
  v112 = self->_authoredDocument;
  v113 = +[NSNumber numberWithDouble:v88];
  [(MPDocument *)v112 setAuthoringOption:v113 forKey:kMPAuthoringMaximumDuration];
  v114 = +[NSNumber numberWithDouble:v89];
  [v10 setObject:v114 forKeyedSubscript:kMPAuthoringMinimumDuration];
  v115 = +[NSNumber numberWithDouble:v88];
  [v10 setObject:v115 forKeyedSubscript:kMPAuthoringMaximumDuration];
  v84 = v178;
  v116 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfMainLayerForStyleID:", v178));
  [v10 setObject:v116 forKey:kMPAuthoringLayerIndex];
  if (!v171)
  {
    objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
    [a3 removeAllLayers];
    [a3 addLayers:v186];
    objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "unlock");
    a4 = v179;
    goto LABEL_247;
  }
  a4 = v179;
  if ((v164 | v163) == 1)
  {
    if (v168)
    {
      objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
      [a3 removeAllLayers];
      [a3 addLayers:v186];
      objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "unlock");
      [(MPAuthoringController *)self performInitialFaceDetectionInGroup:a3 withOptions:v183];
      goto LABEL_221;
    }
    v125 = v186;
    v126 = (char *)[v186 count];
    if ((uint64_t)v126 >= 1)
    {
      v127 = v126;
      for (m = 0; m != v127; ++m)
      {
        id v129 = [v125 objectAtIndex:m];
        unsigned int v130 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "hasImagesForLayerID:forStyleID:", objc_msgSend(v129, "layerID"), v178);
        id v131 = [v187 layers];
        v132 = (char *)[v187 countOfLayers];
        if ((uint64_t)(v132 - 1) >= (uint64_t)m) {
          v133 = m;
        }
        else {
          v133 = v132 - 1;
        }
        id v134 = [v131 objectAtIndex:v133];
        if (v130)
        {
          v135 = v134;
          if (objc_msgSend(objc_msgSend(v134, "layerID"), "isEqualToString:", objc_msgSend(v129, "layerID")))
          {
            id v136 = objc_msgSend(objc_msgSend(v129, "effectContainers"), "copy");
            [v129 removeAllEffectContainers];
            if ((uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(v135, "effectContainers"), "lastObject"), "countOfEffects") >= 1)
            {
              objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
              [v135 addEffectContainers:v136];
              objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "unlock");
              [v170 addObjectsFromArray:v136];
            }

            a4 = v179;
          }
        }
        v125 = v186;
      }
    }
    if (v125) {

    }
    a3 = v187;
    id v186 = [v187 layers];
    id v10 = v184;
  }
  else
  {
    objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
    id v117 = [v10 objectForKey:kMPAuthoringDynamicEffect];
    id v118 = objc_msgSend(objc_msgSend(v117, "slides"), "count");
    [v117 addSlides:*(void *)&v177[4]];
    id v119 = [v10 objectForKey:kMPAuthoringDynamicLastIndexUsed];
    if (v119)
    {
      id v120 = objc_alloc((Class)NSIndexSet);
      v121 = [v119 integerValue];
      uint64_t v122 = v121 - (unsigned char *)[v117 liveIndex];
      id v10 = v184;
      if (v122 >= (uint64_t)v118) {
        uint64_t v122 = (uint64_t)v118;
      }
      v123 = v120;
      a3 = v187;
      id v124 = objc_msgSend(v123, "initWithIndexesInRange:", 0, v122 & ~(v122 >> 63));
      objc_msgSend(v117, "setLiveIndex:", objc_msgSend(v119, "integerValue"));
      [v117 removeSlidesAtIndices:v124];
    }
    -[MPAuthoringController configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:](self, "configurePanoramaInformationToEffect:inDocument:startingIndex:count:removeOldIndex:", v117, v179, (unsigned char *)objc_msgSend(objc_msgSend(v117, "slides"), "count") - (unsigned char *)objc_msgSend(*(id *)&v177[4], "count"), -1, objc_msgSend(v119, "integerValue"));
    if (v186) {

    }
    id v186 = [a3 layers];
    objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "unlock");
  }
  p_cancelAuthoring = &self->_cancelAuthoring;
  v84 = v178;
LABEL_221:
  if (!v180) {
    goto LABEL_229;
  }
  v137 = &v169[v162];
  if (&v160[v173 + v162] > v159)
  {
    if (v167)
    {
      uint64_t v138 = v157;
      BOOL v139 = v158;
      if (v157 == -1) {
        goto LABEL_226;
      }
    }
    else
    {
      uint64_t v138 = v157;
      BOOL v139 = v158;
      if (v157 == -1 || !v158)
      {
LABEL_226:
        if (v139)
        {
          [a3 setUsedAllPaths:1];
          v140 = self->_authoredDocument;
          v141 = +[NSNumber numberWithInteger:0];
          v142 = v140;
          v84 = v178;
          [(MPDocument *)v142 setAuthoringOption:v141 forKey:kMPAuthoringLivePlaceholderIndex];
        }
        goto LABEL_228;
      }
    }
    v137 = (char *)v138;
    goto LABEL_226;
  }
LABEL_228:
  [a3 setLastSlideUsed:v137];
LABEL_229:
  if (!*p_cancelAuthoring && v171)
  {
    id v144 = [p_info + 186 subtitlesFromOptions:v10];
    if (v144)
    {
      v145 = v144;
      if ([v144 count])
      {
        objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
        long long v190 = 0u;
        long long v191 = 0u;
        long long v188 = 0u;
        long long v189 = 0u;
        id v146 = [v145 countByEnumeratingWithState:&v188 objects:v204 count:16];
        if (v146)
        {
          id v147 = v146;
          uint64_t v148 = *(void *)v189;
          do
          {
            for (n = 0; n != v147; n = (char *)n + 1)
            {
              if (*(void *)v189 != v148) {
                objc_enumerationMutation(v145);
              }
              [(MPAuthoringController *)self addStyledCaptionToSlide:+[MPUtilities slideForPath:*(void *)(*((void *)&v188 + 1) + 8 * (void)n) inDocument:a4] inDocument:a4 withOptions:v10];
            }
            id v147 = [v145 countByEnumeratingWithState:&v188 objects:v204 count:16];
          }
          while (v147);
        }
        [(MPAuthoringController *)self configureFiltersInDocument:a4 withOptions:v10];
        [(MPAuthoringController *)self configureTransitionsInDocument:a4 withOptions:v10];
        [(MPAuthoringController *)self scaleDurationsInDocument:a4 withOptions:v10];
        objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "unlock");
        p_info = MRTiledSprite.info;
        p_cancelAuthoring = &self->_cancelAuthoring;
        v84 = v178;
      }
    }
    if ((unint64_t)[v186 count] >= 2)
    {
      objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
      [(MPAuthoringController *)self matchDurationsForLayers:v186 withOptions:v10];
      [(MPAuthoringController *)self fillDurationsForLayers:v186 withOptions:v10];
      [(MPAuthoringController *)self checkForOffsetsForLayers:v186 withOptions:v10];
      objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "unlock");
    }
    if (!v168)
    {
      id v150 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v170, @"effectContainers", a4, @"document", v10, @"options", 0);
      v84 = v178;
      p_cancelAuthoring = &self->_cancelAuthoring;
      +[NSThread detachNewThreadSelector:toTarget:withObject:](NSThread, "detachNewThreadSelector:toTarget:withObject:", "_applyCropToSlidesInEffectContainersWithArguments:", +[MPCropController sharedController], v150);

      goto LABEL_250;
    }
    objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "lock");
    [(MPAuthoringController *)self reconfigureColorSchemeForLayerGroup:a3 inDocument:a4 withOptions:v10];
    objc_msgSend(-[MPDocument montage](self->_authoredDocument, "montage"), "unlock");
    objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "cropSlidesForLayerGroup:inDocument:withOptions:", a3, a4, v10);

    goto LABEL_248;
  }
LABEL_247:

  if (v168)
  {
LABEL_248:
    [(MPAuthoringController *)self configureIntroInDocument:self->_authoredDocument withOptions:v10];
    [(MPAuthoringController *)self configureOutroInDocument:self->_authoredDocument withOptions:v10];
  }
LABEL_250:
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    [self->_delegate authoringDocument:self->_authoredDocument progress:p_cancelAuthoring shouldCancel:1.0];
  }
  if (*p_cancelAuthoring && v165)
  {
    id v151 = [a3 navigatorKey];
    if (v151) {
      [a4 setLayer:v165 forKey:v151];
    }
    else {
      [a4 setDocumentLayerGroup:v165];
    }
  }
  if (*(void *)&v177[4]) {

  }
  if (v165) {
  self->_isAuthoring = 0;
  }
  if (!self->_cancelAuthoring && (!v180 || self->_logLevel >= 2))
  {
    if ([p_info + 186 collectVersionInformationFromOptions:v10])
    {
      v152 = self->_authoredDocument;
      id v153 = [(MPAuthoringController *)self _collectVersionInformationFromStyle:v84];
      [(MPDocument *)v152 setDocumentAttribute:v153 forKey:kMPDocumentAuthoringVersions];
    }
    [(MPAuthoringController *)self finishLogging];
  }

  [a4 setTemporarilyCacheAbsolutePaths:0];
  v154 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v154 postNotificationName:kMPAuthoringDidFinishApplyingStyleNotification object:self->_authoredDocument userInfo:0];
  [(MPAuthoringController *)self cleanup:v172];
  [(NSLock *)self->_authorLock unlock];
  if (self->_cancelAuthoring) {
    return -1;
  }
  else {
    return self->_seed;
  }
}

- (void)upgradeDocument:(id)a3 withOptions:(id)a4
{
  id v7 = [a3 documentLayerGroup];
  [(MPAuthoringController *)self upgradeLayerGroup:v7 inDocument:a3 withOptions:a4];
}

- (void)upgradeLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  objc_msgSend(objc_msgSend(a4, "montage"), "lock");
  id v7 = objc_msgSend(objc_msgSend(a3, "authoredVersionInfo"), "mutableCopy");
  LODWORD(v8) = 1032805417;
  objc_msgSend(v7, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8), @"authoringVersion");
  [a3 setAuthoredVersionInfo:v7];

  if (v7) {
    [a4 setDocumentAttribute:v7 forKey:kMPDocumentAuthoringVersions];
  }
  id v9 = [a4 montage];
  [v9 unlock];
}

- (id)effectContainersWithPaths:(id)a3 forDocument:(id)a4 withOptions:(id)a5
{
  id v5 = a5;
  if (!a5) {
    id v5 = [a4 documentAttributeForKey:kMPDocumentAuthoringOptions];
  }
  [(MPAuthoringController *)self setAuthoredDocument:a4];
  id v9 = [(MPAuthoringController *)self orderImages:a3 withOptions:v5];
  id v10 = [(MPAuthoringController *)self effectContainersWithImages:v9 effects:[(MPAuthoringController *)self effectsForImages:v9 withOptions:v5] andOptions:v5];
  [(MPAuthoringController *)self scaleDurationsInEffectContainers:v10 withOptions:v5];
  objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "applyCropToSlidesInEffectContainers:inDocument:withOptions:", v10, a4, v5);
  [(MPWeighter *)self->_weighter clearAllItems];
  [(MPAuthoringController *)self cleanup];
  return v10;
}

- (id)transitionFromOptions:(id)a3
{
  return [(MPAuthoringController *)self transitionFromOptions:a3 firstEffectContainer:0 nextEffectContainer:0];
}

- (void)beatAlignLayers:(id)a3 toAudioPlaylist:(id)a4 forDocument:(id)a5 withOptions:(id)a6
{
  id v6 = a6;
  if (!a6) {
    id v6 = [a5 documentAttributeForKey:kMPDocumentAuthoringOptions];
  }
  [(MPAuthoringController *)self setAuthoredDocument:a5];
  id v11 = [(MPAuthoringController *)self beatsForAudioPlaylist:a4 withOptions:v6];
  if (v11)
  {
    id v12 = v11;
    if ([v11 count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v13 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          unsigned int v16 = 0;
          do
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(a3);
            }
            [(MPAuthoringController *)self beatAlignLayer:*(void *)(*((void *)&v17 + 1) + 8 * (void)v16) toBeats:v12 withOptions:v6];
            unsigned int v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v14);
      }
    }
  }
  [(MPAuthoringController *)self cleanup];
}

- (void)scaleDurationsInDocument:(id)a3 withOptions:(id)a4
{
  id v7 = [a3 documentLayerGroup];
  [(MPAuthoringController *)self scaleDurationsForLayerGroup:v7 inDocument:a3 withOptions:a4];
}

- (void)scaleDurationsForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v5 = a5;
  if (objc_msgSend(objc_msgSend(a5, "objectForKey:", kMPAuthoringStyleID), "isEqualToString:", @"Places"))
  {
    [(MPAuthoringController *)self scaleDurationsInPlacesForDocument:a4 withOptions:v5];
    return;
  }
  if (!self->_isAuthoring)
  {
    objc_msgSend(objc_msgSend(a4, "montage", context), "lock");
    [a3 reconnectAll];
    if (v5) {
      goto LABEL_7;
    }
LABEL_35:
    id v5 = objc_msgSend(a3, "authoringOptions", context);
    goto LABEL_7;
  }
  if (!v5) {
    goto LABEL_35;
  }
LABEL_7:
  if (!self->_isAuthoring) {
    [(MPAuthoringController *)self setAuthoredDocument:a4];
  }
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v5];
  if (![v7 objectForKey:kMPAuthoringAudioDuration])
  {
    objc_msgSend(objc_msgSend(a3, "audioPlaylist"), "duration");
    double v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 setObject:v8 forKey:kMPAuthoringAudioDuration];
  }
  unsigned int v32 = +[MPAuthoringUtilities alignToBeatsFromOptions:](MPAuthoringUtilities, "alignToBeatsFromOptions:", v7, context);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [a3 layers];
  id v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  id v33 = self;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    double v12 = 0.0;
    double v13 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (!+[MPAuthoringUtilities isLayerEffectAuthoredFromOptions:v5])
        {
          unsigned int v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 zIndex]);
          [v7 setObject:v16 forKey:kMPAuthoringLayerIndex];
          [v7 removeObjectForKey:kMPAuthoringMinimumDuration];
          [v7 removeObjectForKey:kMPAuthoringMaximumDuration];
          [(MPAuthoringController *)self scaleDurationsInLayer:v15 withMutableOptions:v7];
          objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", kMPAuthoringMinimumDuration), "doubleValue");
          double v18 = v17;
          objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", kMPAuthoringMaximumDuration), "doubleValue");
          if (v18 >= v13) {
            double v13 = v18;
          }
          if (v19 >= v12) {
            double v20 = v12;
          }
          else {
            double v20 = v19;
          }
          if (v19 <= 0.0) {
            double v20 = v12;
          }
          if (v12 == 0.0) {
            double v12 = v19;
          }
          else {
            double v12 = v20;
          }
          if (v32)
          {
            if ((uint64_t)objc_msgSend(objc_msgSend(a4, "audioPlaylist"), "countOfSongs") >= 1)
            {
              id v21 = -[MPAuthoringController beatsForAudioPlaylist:withOptions:](self, "beatsForAudioPlaylist:withOptions:", [a3 audioPlaylist], v7);
              if (v21) {
                [(MPAuthoringController *)self beatAlignLayer:v15 toBeats:v21 withOptions:v7];
              }
            }
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
    double v13 = 0.0;
  }
  authoredDocument = self->_authoredDocument;
  unint64_t v23 = +[NSNumber numberWithDouble:v13];
  [(MPDocument *)authoredDocument setAuthoringOption:v23 forKey:kMPAuthoringMinimumDuration];
  id v24 = v33->_authoredDocument;
  v25 = +[NSNumber numberWithDouble:v12];
  [(MPDocument *)v24 setAuthoringOption:v25 forKey:kMPAuthoringMaximumDuration];
  id v26 = +[NSNumber numberWithDouble:v13];
  [v7 setObject:v26 forKeyedSubscript:kMPAuthoringMinimumDuration];
  BOOL v27 = +[NSNumber numberWithDouble:v12];
  [v7 setObject:v27 forKeyedSubscript:kMPAuthoringMaximumDuration];
  [(MPAuthoringController *)v33 matchDurationsForLayers:obj withOptions:v7];
  [(MPAuthoringController *)v33 fillDurationsForLayers:obj withOptions:v7];
  [(MPAuthoringController *)v33 checkForOffsetsForLayers:obj withOptions:v7];

  [a3 reconfigureLoopingMode];
  if (!v33->_isAuthoring)
  {
    [(MPAuthoringController *)v33 cleanup];
    objc_msgSend(objc_msgSend(a4, "montage"), "unlock");
  }
}

- (void)reconfigureImagesInDocument:(id)a3 withOptions:(id)a4
{
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "documentLayerGroup"), "styleID"), "isEqualToString:", @"Places"))
  {
    [(MPAuthoringController *)self authorDocument:a3 withOptions:a4];
  }
  else
  {
    [(MPAuthoringController *)self _reorderImagesInDocument:a3 withOptions:a4];
  }
}

- (void)reconfigureTitleEffectInDocument:(id)a3 withOptions:(id)a4
{
  id v7 = [a3 documentLayerGroup];
  [(MPAuthoringController *)self reconfigureTitleEffectForLayerGroup:v7 inDocument:a3 withOptions:a4];
}

- (void)reconfigureTitleEffectForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  if ((uint64_t)[a3 countOfLayers] >= 1)
  {
    objc_msgSend(objc_msgSend(a4, "montage"), "lock");
    if (!a5) {
      a5 = [a3 authoringOptions];
    }
    id v8 = +[MPAuthoringUtilities styleFromOptions:a5];
    id v9 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "titleEffectLayoutForStyleID:", v8);
    id v10 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfTitleEffectLayerForStyleID:", v8);
    id v11 = [a3 layers];
    if (v10 < [v11 count])
    {
      id v12 = objc_msgSend(objc_msgSend(objc_msgSend(v11, "objectAtIndex:", v10), "effectContainers"), "objectAtIndex:", 0);
      id v13 = [v9 objectForKey:@"backgroundEffect"];
      uint64_t v14 = v13 ? 2 : 1;
      if (v14 <= (uint64_t)[v12 countOfEffects])
      {
        id v15 = objc_msgSend(objc_msgSend(v12, "effects"), "objectAtIndex:", v13 != 0);
        objc_msgSend(v15, "replaceTextsWitStrings:", objc_msgSend(a5, "objectForKey:", kMPAuthoringTitleStrings));
      }
    }
    id v16 = [a4 montage];
    [v16 unlock];
  }
}

- (void)reconfigureColorSchemeInDocument:(id)a3 withOptions:(id)a4
{
  id v7 = [a3 documentLayerGroup];
  [(MPAuthoringController *)self reconfigureColorSchemeForLayerGroup:v7 inDocument:a3 withOptions:a4];
}

- (void)reconfigureColorSchemeForLayerGroup:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  objc_msgSend(objc_msgSend(a4, "montage"), "lock");
  if (!a5) {
    a5 = [a3 authoringOptions];
  }
  id v9 = +[MPAuthoringUtilities colorSchemeFromOptions:a5];
  if (v9)
  {
    id v10 = v9;
    if ([a5 objectForKey:kMPAuthoringBackgroundColor]
      || (id v14 = [v10 objectForKey:@"background"]) == 0)
    {
      id v11 = +[MPAuthoringUtilities backgroundColorFromOptions:a5];
    }
    else
    {
      id v11 = +[MPUtilities CGColorFromString:v14];
    }
    [a3 setBackgroundCGColor:v11];
    id v15 = [v10 objectForKey:@"titleText"];
    if (v15)
    {
      id v16 = v15;
      if ([a5 objectForKeyedSubscript:kMPAuthoringColorScheme])
      {
        id v13 = +[MPUtilities CGColorFromString:v16];
LABEL_14:
        [(MPAuthoringController *)self setTitleTextToColor:v13 forLayerGroup:a3 inDocument:a4 withOptions:a5];
      }
    }
  }
  else
  {
    objc_msgSend(a3, "setBackgroundCGColor:", +[MPAuthoringUtilities backgroundColorFromOptions:](MPAuthoringUtilities, "backgroundColorFromOptions:", a5));
    id v12 = [a5 objectForKey:kMPAuthoringTitleColor];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = +[MPUtilities CGColorFromString:v12];
      if (v13) {
        goto LABEL_14;
      }
    }
  }
  id v17 = [a4 montage];
  [v17 unlock];
}

- (BOOL)prepareDocumentForExport:(id)a3 withOptions:(id)a4
{
  id v4 = a4;
  if (!a4) {
    id v4 = [a3 documentAttributeForKey:kMPDocumentAuthoringOptions];
  }
  id v7 = (char *)objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfMainLayerForStyleID:", +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", v4));
  id v8 = (char *)[a3 countOfLayers];
  if ((uint64_t)v7 >= (uint64_t)v8) {
    id v9 = v8 - 1;
  }
  else {
    id v9 = v7;
  }
  if (((unint64_t)v9 & 0x8000000000000000) == 0)
  {
    objc_msgSend(objc_msgSend(a3, "montage"), "lock");
    id v10 = objc_msgSend(objc_msgSend(a3, "layers"), "objectAtIndex:", v9);
    id v11 = objc_msgSend(objc_msgSend(v10, "effectContainers"), "lastObject");
    id v12 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    id v13 = +[NSNumber numberWithInteger:v9];
    [(NSMutableDictionary *)v12 setObject:v13 forKey:kMPAuthoringLayerIndex];
    if (+[MPAuthoringUtilities exportTransitionIDFromOptions:v12])
    {
      id v14 = [(MPAuthoringController *)self exportTransitionFromOptions:v12];
      id v15 = +[MPEffectContainer effectContainer];
      +[MPAuthoringUtilities exportTransitionDurationFromOptions:v12];
      double v17 = v16;
      objc_msgSend(v14, "setDuration:");
      [v15 setDuration:v17];
      [v10 addEffectContainer:v15];
      [v11 duration];
      double v19 = v18;
      [v11 introTransitionDuration];
      if (v19 - v20 >= v17)
      {
        objc_msgSend(v11, "setUserInfoAttribute:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -1.0), @"savedExportDuration");
      }
      else
      {
        [v11 duration];
        objc_msgSend(v11, "setUserInfoAttribute:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"savedExportDuration");
        [v11 duration];
        double v22 = v21;
        [v11 duration];
        double v24 = v23;
        [v11 introTransitionDuration];
        [v11 setDuration:v22 + v17 - (v24 - v25)];
      }
      id v29 = v11;
      id v30 = v14;
      goto LABEL_16;
    }
    id v27 = [v11 countOfEffects];
    id v28 = [v11 transition];
    if (v27)
    {
      if (v28)
      {
        id v29 = v11;
        id v30 = 0;
LABEL_16:
        [v29 setTransition:v30];
LABEL_17:
        if ((char *)+[MPAuthoringUtilities audioScalingModeFromOptions:v4] == (char *)&dword_0 + 1)
        {
          objc_msgSend(a3, "setDocumentAttribute:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "loopingMode")), @"exportLoopingMode");
          [a3 setLoopingMode:0];
        }
        BOOL v26 = 1;
        v31 = +[NSNumber numberWithBool:1];
        [a3 setDocumentAttribute:v31 forKey:kMPDocumentPreparedForExport];
        -[MPAuthoringController matchDurationsForLayers:withOptions:](self, "matchDurationsForLayers:withOptions:", [a3 layers], v12);
        -[MPAuthoringController fillDurationsForLayers:withOptions:](self, "fillDurationsForLayers:withOptions:", [a3 layers], v12);
        goto LABEL_20;
      }
    }
    else if (v28)
    {
      [v28 duration];
      double v34 = v33;
      [v11 setTransition:0];
      [v11 duration];
      objc_msgSend(v11, "setUserInfoAttribute:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"savedExportDuration");
      [v11 duration];
      [v11 setDuration:v35 - v34];
      goto LABEL_17;
    }
    BOOL v26 = 0;
LABEL_20:
    objc_msgSend(objc_msgSend(a3, "montage"), "unlock");
    return v26;
  }
  return 0;
}

- (void)prepareDocumentForPlayback:(id)a3 withOptions:(id)a4
{
  CGAffineTransform *(__cdecl **v12)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  NSNumber *v13;
  id v14;
  unsigned int v15;
  id v16;
  unsigned int v17;
  char *v18;
  id v19;
  id v20;
  char v21;
  int v22;
  int v23;
  unsigned int v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  double v31;
  unsigned int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  id v42;
  uint64_t vars8;

  id v4 = a4;
  if (!a4) {
    id v4 = [a3 documentAttributeForKey:kMPDocumentAuthoringOptions];
  }
  id v7 = (char *)objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfMainLayerForStyleID:", +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", v4));
  id v8 = (char *)[a3 countOfLayers];
  if ((uint64_t)v7 >= (uint64_t)v8) {
    id v9 = v8 - 1;
  }
  else {
    id v9 = v7;
  }
  if (((unint64_t)v9 & 0x8000000000000000) == 0)
  {
    objc_msgSend(objc_msgSend(a3, "montage"), "lock");
    id v10 = [a3 objectInLayersAtIndex:v9];
    if ([v10 countOfEffectContainers])
    {
      id v11 = +[NSMutableDictionary dictionaryWithDictionary:v4];
      id v12 = &CATransform3DGetAffineTransform_ptr;
      id v13 = +[NSNumber numberWithInteger:v9];
      [(NSMutableDictionary *)v11 setObject:v13 forKey:kMPAuthoringLayerIndex];
      id v14 = objc_msgSend(objc_msgSend(v10, "effectContainers"), "lastObject");
      if ([a3 documentAttributeForKey:@"exportLoopingMode"])
      {
        objc_msgSend(a3, "setLoopingMode:", objc_msgSend(objc_msgSend(a3, "documentAttributeForKey:", @"exportLoopingMode"), "integerValue"));
        [a3 setDocumentAttribute:0 forKey:@"exportLoopingMode"];
      }
      id v15 = +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:v11];
      double v16 = +[MPAuthoringUtilities exportTransitionIDFromOptions:v11];
      if (!v16)
      {
        double v17 = [v14 countOfEffects] ? v15 : 1;
        if (v17 != 1) {
          goto LABEL_51;
        }
      }
      double v18 = (char *)[v14 index];
      double v19 = [a3 documentAttributeForKey:kMPDocumentPreparedForExport];
      if (v16 && v19 && [v19 BOOLValue])
      {
        double v20 = objc_msgSend(objc_msgSend(v10, "effectContainers"), "objectAtIndex:", v18 - 1);
        objc_msgSend(v10, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v18));
      }
      else
      {
        double v20 = objc_msgSend(objc_msgSend(v10, "effectContainers"), "objectAtIndex:", v18);
      }
      double v21 = objc_opt_respondsToSelector();
      double v22 = objc_opt_respondsToSelector();
      if (v21)
      {
        double v23 = v22;
        double v24 = objc_msgSend(self->_delegate, "document:shouldUseDefaultTransitionForEffectContainer:containerIndex:layerIndex:", a3, v20, objc_msgSend(v20, "index"), v9);
        if ((v24 & 1) == 0)
        {
          id v12 = &CATransform3DGetAffineTransform_ptr;
          if (((v23 ^ 1) & 1) == 0)
          {
            double v25 = objc_msgSend(self->_delegate, "document:needsTransitionForEffectContainer:containerIndex:layerIndex:", a3, v20, objc_msgSend(v20, "index"), v9);
            if (!v25) {
              goto LABEL_33;
            }
            goto LABEL_30;
          }
LABEL_28:
          if ((v24 & v15) != 1
            || (double v25 = [(MPAuthoringController *)self loopTransitionFromOptions:v11],
                +[MPAuthoringUtilities transitionDurationFromOptions:](MPAuthoringUtilities, "transitionDurationFromOptions:", v11), objc_msgSend(v25, "setDuration:"), !v25))
          {
LABEL_33:
            if ([v20 transition])
            {
              id v30 = [v20 userInfoAttributeForKey:@"savedExportDuration"];
              [v20 setTransition:0];
              if (v30)
              {
                [v30 doubleValue];
                if (v31 > 0.0)
                {
                  [v30 doubleValue];
LABEL_47:
                  objc_msgSend(v20, "setDuration:");
                  goto LABEL_48;
                }
              }
              if (![v20 countOfEffects])
              {
                [v20 introTransitionDuration];
                goto LABEL_47;
              }
            }
LABEL_48:
            if (objc_msgSend(objc_msgSend(v4, "objectForKey:", kMPAuthoringAudioScalingMode), "integerValue") == (char *)&dword_0 + 1) {
              [(MPAuthoringController *)self scaleDurationsInDocument:a3 withOptions:v11];
            }
            -[MPAuthoringController matchDurationsForLayers:withOptions:](self, "matchDurationsForLayers:withOptions:", [a3 layers], v11);
            -[MPAuthoringController fillDurationsForLayers:withOptions:](self, "fillDurationsForLayers:withOptions:", [a3 layers], v11);
LABEL_51:
            uint64_t v41 = [v12[476] numberWithBool:0];
            [a3 setDocumentAttribute:v41 forKey:kMPDocumentPreparedForExport];
            v42 = [a3 montage];
            [v42 unlock];
            return;
          }
LABEL_30:
          BOOL v26 = [v20 userInfoAttributeForKey:@"savedExportDuration"];
          if (v26 && (id v27 = v26, [v26 doubleValue], v28 > 0.0))
          {
            [v27 doubleValue];
          }
          else
          {
            if ([v20 countOfEffects]) {
              unsigned int v32 = 0;
            }
            else {
              unsigned int v32 = v15;
            }
            if (v32 != 1) {
              goto LABEL_44;
            }
            [v20 duration];
            double v34 = v33;
            [v20 introTransitionDuration];
            long long v36 = v35;
            [v25 duration];
            if (v34 >= v36 + v37) {
              goto LABEL_44;
            }
            [v20 introTransitionDuration];
            id v39 = v38;
            [v25 duration];
            id v29 = v39 + v40;
          }
          [v20 setDuration:v29];
LABEL_44:
          [v20 setTransition:v25];
          goto LABEL_48;
        }
      }
      else
      {
        double v24 = 1;
      }
      id v12 = &CATransform3DGetAffineTransform_ptr;
      goto LABEL_28;
    }
  }
}

- (BOOL)canDocumentFitToAudio:(id)a3 withOptions:(id)a4 requiredAudioDuration:(double *)a5
{
  id v9 = [a3 documentLayerGroup];
  return [(MPAuthoringController *)self canLayerGroupFitToAudio:v9 inDocument:a3 withOptions:a4 requiredAudioDuration:a5];
}

- (BOOL)canLayerGroupFitToAudio:(id)a3 inDocument:(id)a4 withOptions:(id)a5 requiredAudioDuration:(double *)a6
{
  id v7 = a5;
  if (!a5) {
    id v7 = [a3 authoringOptions];
  }
  id v10 = objc_alloc_init(MPDocument);
  id v11 = +[NSMutableDictionary dictionaryWithDictionary:v7];
  id v12 = +[NSNumber numberWithInteger:1];
  [(NSMutableDictionary *)v11 setObject:v12 forKey:kMPAuthoringAudioScalingMode];
  id v13 = +[NSNumber numberWithBool:0];
  [(NSMutableDictionary *)v11 setObject:v13 forKey:kMPAuthoringRequestGeneratedImages];
  [(NSMutableDictionary *)v11 removeObjectForKey:kMPAuthoringLayerTimeScale];
  -[MPDocument setVideoPaths:](v10, "setVideoPaths:", [a3 videoPaths]);
  -[MPDocument setAudioPaths:](v10, "setAudioPaths:", [a3 audioPaths]);
  -[MPDocument _setMediaProperties:](v10, "_setMediaProperties:", [a4 mediaProperties]);
  [(MPDocument *)v10 setDocumentAttribute:v11 forKey:kMPDocumentAuthoringOptions];
  -[MPDocument setAssetKeyDelegate:](v10, "setAssetKeyDelegate:", [a4 assetKeyDelegate]);
  id v14 = objc_alloc_init(MPAuthoringController);
  [(MPAuthoringController *)v14 authorLayerGroup:[(MPDocument *)v10 documentLayerGroup] inDocument:v10 withOptions:v11];

  id v15 = [v7 objectForKey:kMPAuthoringAudioDuration];
  if (v15) {
    [v15 doubleValue];
  }
  else {
    objc_msgSend(-[MPDocument audioPlaylist](v10, "audioPlaylist"), "duration");
  }
  double v17 = v16;
  [(MPDocument *)v10 videoDuration];
  if (a6) {
    *a6 = v18;
  }
  BOOL v19 = vabdd_f64(v18, v17) < 1.0;

  return v19;
}

- (BOOL)canScaleToAudioInDocument:(id)a3 withOptions:(id)a4
{
  return [(MPAuthoringController *)self canDocumentFitToAudio:a3 withOptions:a4 requiredAudioDuration:0];
}

- (void)cleanup
{
}

- (void)cleanup:(BOOL)a3
{
  BOOL v3 = a3;
  [(MPAuthoringController *)self cleanupClusters];
  if (v3)
  {
    [(MPWeighter *)self->_weighter clearAllItems];
    [(MPWeighter *)self->_transitionWeighter clearAllItems];
    shuffleWeighter = self->_shuffleWeighter;
    if (shuffleWeighter)
    {
      [(MPWeighter *)shuffleWeighter clearAllItems];

      self->_shuffleWeighter = 0;
    }
  }
  cachedROIInformation = self->_cachedROIInformation;
  if (cachedROIInformation)
  {

    self->_cachedROIInformation = 0;
  }
  [(MPAuthoringController *)self setAuthoredDocument:0];
}

- (void)clearROICache
{
  cachedROIInformation = self->_cachedROIInformation;
  if (cachedROIInformation)
  {

    self->_cachedROIInformation = 0;
  }
}

- (void)configureIntroInDocument:(id)a3 withOptions:(id)a4
{
  id v4 = a4;
  if (!objc_msgSend(objc_msgSend(a4, "objectForKey:", kMPAuthoringLive), "BOOLValue")
    || !MRIsAppleTV())
  {
LABEL_20:
    id v17 = +[MPAuthoringUtilities introEffectIDFromOptions:](MPAuthoringUtilities, "introEffectIDFromOptions:", v4, v19, v20);
    if (v17 && [v17 isEqualToString:kMPFadeInEffect])
    {
      +[MPAuthoringUtilities introDurationFromOptions:v4];
      if (v18 == -1.0) {
        double v18 = 0.5;
      }
      [a3 setFadeInDuration:v18];
    }
    return;
  }
  id v6 = [v4 mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [a3 layers];
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v8)
  {

    goto LABEL_20;
  }
  id v9 = v8;
  id v19 = v4;
  id v20 = a3;
  uint64_t v10 = 0;
  char v21 = 0;
  uint64_t v11 = *(void *)v24;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = +[NSNumber numberWithInteger:(char *)i + v10];
        [v6 setObject:v14 forKey:kMPAuthoringLayerIndex];
        if (+[MPAuthoringUtilities useIntroTransition:v6])
        {
          id v15 = (uint64_t)[v13 countOfEffectContainers] < 1
              ? 0
              : [v13 objectInEffectContainersAtIndex:0];
          id v16 = -[MPAuthoringController transitionFromOptions:firstEffectContainer:nextEffectContainer:](self, "transitionFromOptions:firstEffectContainer:nextEffectContainer:", v6, v15, v15, v19, v20);
          if ((objc_msgSend(objc_msgSend(v16, "transitionID"), "isEqualToString:", @"FadeThroughColor") & 1) == 0)
          {
            [v13 setIntroTransition:v16];
            char v21 = 1;
          }
        }
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    v10 += (uint64_t)i;
  }
  while (v9);

  id v4 = v19;
  a3 = v20;
  if ((v21 & 1) == 0) {
    goto LABEL_20;
  }
}

- (void)configureOutroInDocument:(id)a3 withOptions:(id)a4
{
  id v7 = +[MPAuthoringUtilities outroEffectIDFromOptions:a4];
  if (v7 && [v7 isEqualToString:kMPFadeOutEffect])
  {
    +[MPAuthoringUtilities outroDurationFromOptions:a4];
    if (v8 == -1.0) {
      objc_msgSend(-[MPAuthoringController transitionFromOptions:](self, "transitionFromOptions:", a4), "duration");
    }
    objc_msgSend(a3, "setFadeOutDuration:");
  }
}

- (void)setTitleTextToColor:(CGColor *)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v9 = [a4 documentLayerGroup];
  [(MPAuthoringController *)self setTitleTextToColor:a3 forLayerGroup:v9 inDocument:a4 withOptions:a5];
}

- (void)setTitleTextToColor:(CGColor *)a3 forLayerGroup:(id)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v23 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager", a3, a4, a5), "titleEffectLayoutForStyleID:", +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a6));
  id v8 = [a4 layers];
  if ([v8 count])
  {
    id obj = objc_msgSend(objc_msgSend(v8, "objectAtIndex:", 0), "effectContainers");
    if ([obj count])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v24)
      {
        uint64_t v22 = *(void *)v31;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = v9;
            uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
            id v11 = [v23 objectForKey:@"backgroundEffect"];
            if (v11) {
              uint64_t v12 = 2;
            }
            else {
              uint64_t v12 = 1;
            }
            if (v12 <= (uint64_t)[v10 countOfEffects])
            {
              id v13 = objc_msgSend(objc_msgSend(v10, "effects"), "objectAtIndex:", v11 != 0);
              long long v26 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              id v14 = [v13 texts];
              id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v15)
              {
                id v16 = v15;
                uint64_t v17 = *(void *)v27;
                do
                {
                  for (i = 0; i != v16; i = (char *)i + 1)
                  {
                    if (*(void *)v27 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    id v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                    id v20 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", objc_msgSend(v19, "attributedString"));
                    objc_msgSend(v20, "addAttributes:range:", +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", a3, kCTForegroundColorAttributeName), 0, objc_msgSend(v20, "length"));
                    [v19 setAttributedString:v20];
                  }
                  id v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
                }
                while (v16);
              }
            }
            uint64_t v9 = v25 + 1;
          }
          while ((id)(v25 + 1) != v24);
          id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v24);
      }
    }
  }
}

- (BOOL)isAuthoring
{
  return self->_isAuthoring;
}

- (id)authoredDocument
{
  return self->_authoredDocument;
}

- (void)setAuthoredDocument:(id)a3
{
  authoredDocument = self->_authoredDocument;
  if (authoredDocument)
  {

    self->_authoredDocument = 0;
  }
  if (a3) {
    self->_authoredDocument = (MPDocument *)a3;
  }
}

- (id)_collectVersionInformationFromStyle:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "effectIDsForStyleID:", a3);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v10);
        id v12 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "versionOfEffectID:", v11);
        if (v12) {
          [v5 setObject:v12 forKey:v11];
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v8);
  }
  [v4 setObject:v5 forKey:@"effectVersions"];

  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  id v14 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "transitionsForStyleID:", a3);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v37;
    do
    {
      double v18 = 0;
      do
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v18);
        id v20 = objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "versionOfTransitionID:", v19);
        if (v20) {
          [v13 setObject:v20 forKey:v19];
        }
        double v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v16);
  }
  [v4 setObject:v13 forKey:@"transitionVersions"];

  id v21 = objc_alloc_init((Class)NSMutableDictionary);
  id v22 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "framesForStyleID:", a3);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v23 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      long long v26 = 0;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v26);
        id v28 = objc_msgSend(+[MPFrameManager sharedManager](MPFrameManager, "sharedManager"), "versionOfFrameID:", v27);
        if (v28) {
          [v21 setObject:v28 forKey:v27];
        }
        long long v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v24);
  }
  [v4 setObject:v21 forKey:@"frameVersions"];

  id v29 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "versionOfStyleID:", a3);
  if (v29) {
    [v4 setObject:v29 forKey:@"styleVersion"];
  }
  LODWORD(v30) = 1032805417;
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30), @"authoringVersion");
  return v4;
}

- (id)shuffleImagesByRating:(id)a3 withOptions:(id)a4
{
  +[MPAuthoringUtilities videoPathsRangeFromOptions:a4];
  unint64_t v7 = v6;
  id v8 = [a3 count];
  if (v7 >= (unint64_t)v8) {
    uint64_t v9 = (uint64_t)v8;
  }
  else {
    uint64_t v9 = v7;
  }
  if (!self->_shuffleWeighter)
  {
    self->_shuffleWeighter = objc_alloc_init(MPWeighter);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(a3);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v15 = [(MPDocument *)self->_authoredDocument propertiesForMediaPath:v14];
          objc_msgSend(objc_msgSend(v15, "objectForKey:", kMPMetaDataRating), "floatValue");
          [(MPWeighter *)self->_shuffleWeighter addItem:v14 withWeight:(uint64_t)(float)(v16 * 100.0) andContraints:0];
        }
        id v11 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
  }
  id v17 = objc_alloc_init((Class)NSMutableIndexSet);
  id v18 = objc_alloc_init((Class)NSMutableArray);
  if (v9 >= 1)
  {
    do
    {
      int64_t v19 = [(MPWeighter *)self->_shuffleWeighter getRandomIndex];
      objc_msgSend(v18, "addObject:", objc_msgSend(-[MPWeighter allItems](self->_weighter, "allItems"), "objectAtIndex:", v19));
      [v17 addIndex:v19];
      [(MPWeighter *)self->_shuffleWeighter addIndexToIgnore:v19];
      --v9;
    }
    while (v9);
  }
  [(MPWeighter *)self->_shuffleWeighter ignoreIndices:v17];

  return v18;
}

- (id)orderImages:(id)a3 withOptions:(id)a4
{
  if (+[MPAuthoringUtilities layerHasImagesFromOptions:a4])
  {
    switch(+[MPAuthoringUtilities presentationOrderFromOptions:a4])
    {
      case 0uLL:
        if (!self->_isAuthoring) {
          [(MPAuthoringController *)self setupClustersWithPaths:a3 withOptions:a4];
        }
        id v8 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", objc_msgSend(+[MPClusterController sharedController](MPClusterController, "sharedController"), "orderedAndPrioritizedSlideClusters"));
        uint64_t v9 = +[NSMutableArray arrayWithArray:a3];
        a3 = +[NSMutableArray array];
        while ([(NSMutableArray *)v9 count])
        {
          if (![(NSMutableArray *)v8 count]
            || (id v10 = [(NSMutableArray *)v8 objectAtIndex:0]) == 0)
          {
            [a3 addObjectsFromArray:v9];
            [(NSMutableArray *)v9 removeAllObjects];
            break;
          }
          id v11 = v10;
          id v12 = [v10 allSlides];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v32;
LABEL_15:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              if (!-[NSMutableArray containsObject:](v9, "containsObject:", [*(id *)(*((void *)&v31 + 1) + 8 * v16) path]))break; {
              if (v14 == (id)++v16)
              }
              {
                id v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
                if (v14) {
                  goto LABEL_15;
                }
                goto LABEL_21;
              }
            }
          }
          else
          {
LABEL_21:
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v17 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v28;
              do
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(void *)v28 != v19) {
                    objc_enumerationMutation(v12);
                  }
                  long long v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                  objc_msgSend(a3, "addObject:", objc_msgSend(v21, "path"));
                  -[NSMutableArray removeObject:](v9, "removeObject:", [v21 path]);
                }
                id v18 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
              }
              while (v18);
            }
          }
          [(NSMutableArray *)v8 removeObject:v11];
        }
        if (!self->_isAuthoring) {
          [(MPAuthoringController *)self cleanupClusters];
        }
        break;
      case 1uLL:
      case 6uLL:
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_A183C;
        v35[3] = &unk_1AB388;
        v35[4] = self;
        a3 = [a3 sortedArrayUsingComparator:v35];
        break;
      case 3uLL:
        id v22 = +[NSMutableArray array];
        id v23 = [a3 mutableCopy];
        long long v24 = v23;
        while ([v23 count])
        {
          unint64_t v25 = random();
          unint64_t v26 = v25 % (unint64_t)[v24 count];
          objc_msgSend(v22, "addObject:", objc_msgSend(v24, "objectAtIndex:", v26));
          [v24 removeObjectAtIndex:v26];
          id v23 = v24;
        }

        a3 = v22;
        break;
      default:
        return a3;
    }
    return a3;
  }
  else
  {
    return +[NSArray array];
  }
}

- (void)authorPlacesWithImages:(id)a3 forLayerGroup:(id)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v12 = [(MPAuthoringController *)self orderImages:a3 withOptions:a6];
  if ([v12 count])
  {
    id v13 = [(MPAuthoringController *)self createLayersForPlacesForImages:v12 forDocument:a5 withOptions:a6];
    if (!self->_cancelAuthoring)
    {
      id v14 = v13;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = 0;
        uint64_t v18 = *(void *)v21;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * i) setAudioPriority:(char *)i + v17 + 10];
          }
          id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
          v17 += (uint64_t)i;
        }
        while (v16);
      }
      [a4 removeAllLayers];
      [a4 addLayers:v14];
      [(MPAuthoringController *)self scaleDurationsInDocument:a5 withOptions:a6];
    }
  }
  else
  {
    [a4 removeAllLayers];
  }
}

- (void)cacheROIInformationForImages:(id)a3 withOptions:(id)a4
{
  if (!self->_cachedROIInformation)
  {
    self->_cachedROIInformation = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if ([a3 count])
    {
      uint64_t v8 = 0;
      uint64_t v9 = &v8;
      uint64_t v10 = 0x2020000000;
      char v11 = 0;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_A1B40;
      v6[3] = &unk_1AB3B0;
      char v7 = 0;
      v6[4] = self;
      v6[5] = &v8;
      [a3 enumerateObjectsWithOptions:1 usingBlock:v6];
      [(NSMutableDictionary *)self->_cachedROIInformation setObject:+[NSNumber numberWithBool:*((unsigned __int8 *)v9 + 24)] forKey:@"movieExists"];
      _Block_object_dispose(&v8, 8);
    }
  }
}

- (id)effectsForImages:(id)a3 withOptions:(id)a4
{
  id v7 = +[NSMutableArray array];
  id v8 = +[MPClusterController sharedController];
  id v9 = +[MPEffectManager sharedManager];
  id v176 = +[MPAuthoringUtilities styleFromOptions:a4];
  id v167 = +[MPAuthoringUtilities layerIndexFromOptions:a4];
  id v174 = +[MPAuthoringUtilities effectListFromOptions:a4];
  unsigned int v10 = +[MPAuthoringUtilities layerHasImagesFromOptions:a4];
  unsigned __int8 v164 = +[MPAuthoringUtilities canRepeatEffectWithPreset:a4];
  unsigned __int8 v157 = +[MPAuthoringUtilities canRepeatPreset:a4];
  unsigned int v163 = +[MPAuthoringUtilities useLargestEffectsFromOptions:a4];
  unsigned int v158 = +[MPAuthoringUtilities matchEffectsUsingTagsFromOptions:a4];
  id v11 = +[MPAuthoringUtilities outroEffectIDFromOptions:a4];
  id v179 = a3;
  id v12 = [a3 count];
  id v170 = v9;
  v155 = v11;
  int64_t v13 = v12 - (unsigned char *)[v9 numberOfSlidesForEffectID:v11];
  if ([(NSMutableDictionary *)self->_cachedROIInformation objectForKey:@"movieExists"]) {
    unsigned int v162 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->_cachedROIInformation, "objectForKey:", @"movieExists"), "BOOLValue");
  }
  else {
    unsigned int v162 = 1;
  }
  unsigned int v14 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "canUseClusteringForStyleID:", v176);
  unsigned __int8 v15 = objc_msgSend(objc_msgSend(a4, "objectForKey:", @"isSetup"), "BOOLValue");
  id v16 = v7;
  if (v13 < 0) {
    goto LABEL_8;
  }
  if (!v13)
  {
    if (![v179 count])
    {
      int64_t v13 = 0;
      goto LABEL_6;
    }
LABEL_8:
    id v17 = v179;
    int64_t v13 = (int64_t)[v179 count];
    v155 = 0;
    goto LABEL_9;
  }
LABEL_6:
  id v17 = v179;
LABEL_9:
  unsigned int v159 = +[MPAuthoringUtilities ignoreClusteringForImages:v17 withOptions:a4] | v14 ^ 1;
  if ((v159 & 1) == 0 && ((v10 ^ 1) & 1) == 0)
  {
    [v8 updateClusterRatings];
    id v18 = [a4 objectForKey:kMPAuthoringCachedAbsolutePaths];
    if (v18) {
      id v19 = v18;
    }
    else {
      id v19 = v179;
    }
    id v20 = [v8 clustersBasedOnOrderedPaths:v19];
    id v21 = [v8 allSlidesSortedByPaths:v19];
    if (v21)
    {
      [(MPAuthoringController *)self findUsableClustersForUserDefinedSlideOrderPresentation:v21 inClusters:v20];
      LOBYTE(v159) = 0;
    }
    else
    {
      LOBYTE(v159) = 1;
    }
  }
  [(MPAuthoringController *)self cacheROIInformationForImages:v179 withOptions:a4];
  v166 = v7;
  id v156 = a4;
  BOOL v171 = self;
  int64_t v161 = v13;
  if (v15) {
    goto LABEL_58;
  }
  if (+[MPAuthoringUtilities useTitleEffectFromOptions:a4])
  {
    id v22 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "titleEffectLayoutsForStyleID:", v176);
    id v23 = objc_alloc_init((Class)NSMutableArray);
    long long v206 = 0u;
    long long v207 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    id v24 = [v22 objectEnumerator];
    id v25 = [v24 countByEnumeratingWithState:&v206 objects:v216 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v207;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v207 != v27) {
            objc_enumerationMutation(v24);
          }
          long long v29 = *(void **)(*((void *)&v206 + 1) + 8 * i);
          if ((objc_msgSend(objc_msgSend(v29, "objectForKey:", @"imageOnlyTitleEffect"), "BOOLValue") & 1) == 0)objc_msgSend(v23, "addObject:", v29); {
        }
          }
        id v26 = [v24 countByEnumeratingWithState:&v206 objects:v216 count:16];
      }
      while (v26);
    }
    self = v171;
    id v30 = [(MPAuthoringController *)v171 findEffectIDInPresetArray:v23 forImages:v179 withOptions:v156];

    id v16 = v7;
    int64_t v13 = v161;
    long long v31 = v174;
    if (!v30)
    {
      id v30 = +[MPAuthoringUtilities titleEffectFromOptions:v156];
      if (!v30) {
        goto LABEL_53;
      }
    }
  }
  else
  {
    if (!+[MPAuthoringUtilities useImageOnlyTitleEffectFromOptions:a4])goto LABEL_58; {
    id v32 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "titleEffectLayoutsForStyleID:", v176);
    }
    id v33 = objc_alloc_init((Class)NSMutableArray);
    long long v202 = 0u;
    long long v203 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    id v34 = [v32 objectEnumerator];
    id v35 = [v34 countByEnumeratingWithState:&v202 objects:v215 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v203;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v203 != v37) {
            objc_enumerationMutation(v34);
          }
          long long v39 = *(void **)(*((void *)&v202 + 1) + 8 * (void)j);
          if (objc_msgSend(objc_msgSend(v39, "objectForKey:", @"imageOnlyTitleEffect"), "BOOLValue"))objc_msgSend(v33, "addObject:", v39); {
        }
          }
        id v36 = [v34 countByEnumeratingWithState:&v202 objects:v215 count:16];
      }
      while (v36);
    }
    if ([v33 count])
    {
      self = v171;
      id v30 = [(MPAuthoringController *)v171 findEffectIDInPresetArray:v33 forImages:v179 withOptions:v156];
    }
    else
    {
      id v30 = 0;
      self = v171;
    }

    id v16 = v7;
    int64_t v13 = v161;
    long long v31 = v174;
    if (!v30) {
      goto LABEL_53;
    }
  }
  if (v167 != objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfTitleEffectLayerForStyleID:", v176))
  {
LABEL_53:
    unsigned int v172 = 0;
    goto LABEL_60;
  }
  long long v40 = (NSArray *)[v30 objectForKey:@"presetID"];
  id v41 = [v30 objectForKey:@"backgroundEffect"];
  long long v42 = (char *)objc_msgSend(v170, "numberOfSlidesForEffectID:", +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v40));
  if (!v41)
  {
    unsigned int v172 = v42;
    if ((uint64_t)v42 > v13) {
      char v44 = v10;
    }
    else {
      char v44 = 0;
    }
    if ((v44 & 1) == 0) {
      goto LABEL_267;
    }
LABEL_58:
    unsigned int v172 = 0;
    goto LABEL_59;
  }
  unsigned int v172 = &v42[(void)objc_msgSend(v170, "numberOfSlidesForEffectID:", +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v41))];
  if ((uint64_t)v172 > v13) {
    char v43 = v10;
  }
  else {
    char v43 = 0;
  }
  if ((v43 & 1) == 0)
  {
    long long v40 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v41, v40, 0);
LABEL_267:
    [v16 addObject:v40];
    goto LABEL_59;
  }
  unsigned int v172 = 0;
LABEL_59:
  long long v31 = v174;
LABEL_60:
  if ([(NSArray *)v31 count]) {
    unsigned int v45 = 0;
  }
  else {
    unsigned int v45 = v10;
  }
  if (v45 == 1) {
    long long v31 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @"JustASlide/Default", @"presetID", +[NSNumber numberWithInteger:1], @"likelihood", 0));
  }
  if ((char *)[(NSArray *)v31 count] == (char *)&dword_0 + 1)
  {
    id v46 = objc_msgSend(-[NSArray lastObject](v31, "lastObject"), "objectForKey:", @"presetID");
    id v47 = [v170 numOfImagesForEffectPresetID:v46];
    if (v47 == (id)0x7FFFFFFFFFFFFFFFLL) {
      unsigned int v48 = v10;
    }
    else {
      unsigned int v48 = 0;
    }
    if (((v48 ^ ((uint64_t)v47 > 0)) & v10) == 1)
    {
      v49 = v172;
      if ((uint64_t)v172 < v13)
      {
        uint64_t v50 = (uint64_t)v47;
        do
        {
          if (v13 - (uint64_t)v49 >= v50)
          {
            [v16 addObject:v46];
            uint64_t v51 = v50;
          }
          else
          {
            [v16 addObject:@"JustASlide/Default"];
            uint64_t v51 = 1;
          }
          v49 += v51;
        }
        while ((uint64_t)v49 < v13);
      }
    }
    else
    {
      [v16 addObject:v46];
    }
    goto LABEL_259;
  }
  if (v10)
  {
    [(MPAuthoringController *)self populateWeighter:self->_weighter withEffects:v31 andOptions:v156];
    id v154 = [(MPWeighter *)self->_weighter imageCounts];
    id v160 = [v154 lastIndex];
    [(MPWeighter *)self->_weighter setEvenlyPickByID:+[MPAuthoringUtilities pickEffectsEvenlyByIDWithOptions:v156]];
    id v52 = [v156 objectForKey:kMPAuthoringInitiallyIgnoreEffect];
    if (v52)
    {
      id v53 = objc_msgSend(-[MPWeighter allItems](self->_weighter, "allItems"), "indexOfObject:", v52);
      if (v53 != (id)0x7FFFFFFFFFFFFFFFLL) {
        [(MPWeighter *)self->_weighter ignoreIndex:v53];
      }
    }
    id v177 = objc_alloc_init((Class)NSMutableArray);
    if ((v15 & 1) == 0)
    {
      long long v200 = 0u;
      long long v201 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      id v54 = [(NSArray *)v31 countByEnumeratingWithState:&v198 objects:v214 count:16];
      if (v54)
      {
        id v55 = v54;
        uint64_t v56 = *(void *)v199;
        do
        {
          for (k = 0; k != v55; k = (char *)k + 1)
          {
            if (*(void *)v199 != v56) {
              objc_enumerationMutation(v31);
            }
            id v58 = *(void **)(*((void *)&v198 + 1) + 8 * (void)k);
            id v59 = [v58 objectForKey:@"order"];
            if (v59)
            {
              id v60 = v59;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                || (!MRIsAppleTV() ? (CFStringRef v61 = @"Desktop") : (CFStringRef v61 = @"AppleTV"),
                    (id v60 = [v60 objectForKey:v61]) != 0))
              {
                id v62 = [v60 integerValue];
                if (v62 >= [v177 count]) {
                  [v177 addObject:v58];
                }
                else {
                  [v177 insertObject:v58 atIndex:v62];
                }
              }
            }
          }
          id v55 = [(NSArray *)v31 countByEnumeratingWithState:&v198 objects:v214 count:16];
        }
        while (v55);
      }
    }
    v63 = v177;
    if ([v177 count])
    {
      uint64_t v64 = objc_alloc_init(MPWeighter);
      [(MPAuthoringController *)v171 populateWeighter:v64 withEffects:v177 andOptions:v156];
      long long v196 = 0u;
      long long v197 = 0u;
      long long v194 = 0u;
      long long v195 = 0u;
      id v65 = [(MPWeighter *)v64 allItems];
      id v66 = [v65 countByEnumeratingWithState:&v194 objects:v213 count:16];
      if (v66)
      {
        id v67 = v66;
        uint64_t v68 = *(void *)v195;
        do
        {
          for (m = 0; m != v67; m = (char *)m + 1)
          {
            if (*(void *)v195 != v68) {
              objc_enumerationMutation(v65);
            }
            uint64_t v70 = *(void *)(*((void *)&v194 + 1) + 8 * (void)m);
            id v71 = +[MPUtilities idOfCombinedID:v70];
            id v72 = -[MPAuthoringController findEffectIDInWeighter:images:startingIndex:count:triesToFind:constraints:previousTags:](v171, "findEffectIDInWeighter:images:startingIndex:count:triesToFind:constraints:previousTags:", v64, v179, v172, [v170 numberOfSlidesForEffectID:v70], 0, 0, 0);
            if (v72)
            {
              id v73 = v72;
              unsigned int v172 = &v172[(void)[v170 numberOfSlidesForEffectID:v71]];
              [v166 addObject:v73];
            }
          }
          id v67 = [v65 countByEnumeratingWithState:&v194 objects:v213 count:16];
        }
        while (v67);
      }

      id v16 = v166;
      if ([v166 count])
      {
        char v74 = v171;
        id v75 = objc_msgSend(-[MPWeighter allItems](v171->_weighter, "allItems"), "indexOfObject:", objc_msgSend(v166, "lastObject"));
        id v76 = v156;
        uint64_t v77 = v161;
        v63 = v177;
        if (v75 != (id)0x7FFFFFFFFFFFFFFFLL) {
          [(MPWeighter *)v171->_weighter ignoreIndex:v75];
        }
      }
      else
      {
        id v76 = v156;
        char v74 = v171;
        uint64_t v77 = v161;
        v63 = v177;
      }
    }
    else
    {
      id v76 = v156;
      char v74 = v171;
      uint64_t v77 = v161;
      id v16 = v166;
    }

    unsigned int v153 = objc_msgSend(objc_msgSend(v76, "objectForKey:", kMPAuthoringLive), "BOOLValue");
    if (v153
      && objc_msgSend(-[MPDocument layers](v74->_authoredDocument, "layers"), "count") > v167
      && (id v78 = objc_msgSend(-[MPDocument layers](v74->_authoredDocument, "layers"), "objectAtIndex:", v167),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) == 0)
      && (id v79 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v78, "effectContainers"), "lastObject"), "effects"), "lastObject"), (v80 = -[MPWeighter constraintsForItem:](v74->_weighter, "constraintsForItem:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@", objc_msgSend(v79, "effectID"), objc_msgSend(v79, "presetID")))) != 0))
    {
      uint64_t v178 = v80[2];
    }
    else
    {
      uint64_t v178 = 0;
    }
    unsigned int v81 = v172;
    if ((uint64_t)v172 < v77)
    {
      id v175 = 0;
      while (1)
      {
        unint64_t v173 = v81;
        uint64_t v193 = 0x7FFFFFFFFFFFFFFFLL;
        int64_t v82 = 0x7FFFFFFFFFFFFFFFLL;
        if ((v159 & 1) == 0) {
          int64_t v82 = [(MPAuthoringController *)v74 bestCountFromClusterForEffectWithImages:v179 atStartIndex:v81 withWeighter:v74->_weighter usedIndex:&v193];
        }
        uint64_t v165 = v77 - (void)v173;
        uint64_t v83 = v77 - (uint64_t)v173 >= (uint64_t)v160 ? (uint64_t)v160 : v77 - (void)v173;
        unsigned int v84 = v83 > 0 ? v162 : 0;
        if (v84 == 1)
        {
          int64_t v85 = v82;
          uint64_t v86 = 0;
          unsigned int v87 = v163;
          while (1)
          {
            unsigned __int8 v88 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](v74->_cachedROIInformation, "objectForKey:", objc_msgSend(v179, "objectAtIndex:", &v173[v86++])), "objectForKey:", @"isMovie"), "BOOLValue");
            if (v88) {
              break;
            }
            if (v83 == v86) {
              goto LABEL_137;
            }
          }
          [(MPWeighter *)v74->_weighter clearIgnoreIndices];
          uint64_t v83 = v86;
LABEL_137:
          int64_t v82 = v85;
        }
        else
        {
          unsigned int v87 = v163;
        }
        if (v82 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
LABEL_155:
        id v96 = objc_alloc_init((Class)NSMutableIndexSet);
        id v97 = [(MPWeighter *)v74->_weighter ignoredIndices];
        if ((v87 & 1) == 0)
        {
          int64_t v168 = v82;
          long long v191 = 0u;
          long long v192 = 0u;
          long long v189 = 0u;
          long long v190 = 0u;
          id v98 = [(MPWeighter *)v171->_weighter allConstraints];
          id v99 = [v98 countByEnumeratingWithState:&v189 objects:v212 count:16];
          if (v99)
          {
            id v100 = v99;
            uint64_t v101 = 0;
            uint64_t v102 = *(void *)v190;
            do
            {
              for (n = 0; n != v100; n = (char *)n + 1)
              {
                if (*(void *)v190 != v102) {
                  objc_enumerationMutation(v98);
                }
                uint64_t v104 = *(void *)(*(void *)(*((void *)&v189 + 1) + 8 * (void)n) + 8);
                if (v104 <= v83 && ([v97 containsIndex:(char *)n + v101] & 1) == 0) {
                  [v96 addIndex:v104];
                }
              }
              id v100 = [v98 countByEnumeratingWithState:&v189 objects:v212 count:16];
              v101 += (uint64_t)n;
            }
            while (v100);
          }
          int64_t v82 = v168;
          [v96 removeIndex:v168];
          unsigned int v87 = v163;
        }
        BOOL v169 = 0;
        uint64_t v188 = 0;
        uint64_t v105 = -1;
        while (1)
        {
          char v106 = v105 == -1 ? 1 : v87;
          if ((v106 & 1) == 0) {
            break;
          }
LABEL_183:
          if (v87)
          {
            v115 = v171;
            uint64_t v116 = [(MPWeighter *)v171->_weighter numberOfItemsWithImageCount:v82];
            uint64_t v117 = (v116 & ~(v116 >> 63)) + 1;
            while (--v117)
            {
              int64_t v118 = v82;
              CFStringRef v95 = [(MPAuthoringController *)v171 findEffectIDInWeighter:v171->_weighter images:v179 startingIndex:v173 count:v82 triesToFind:&v188 constraints:0 previousTags:v175];
              id v119 = objc_msgSend(-[MPWeighter allItems](v171->_weighter, "allItems"), "indexOfObject:", v95);
              if (![(MPWeighter *)v171->_weighter itemAtIndex:v119 meetsContraints:v178])
              {
                [(MPWeighter *)v171->_weighter addIndexToIgnore:v119];
                CFStringRef v95 = 0;
              }
              int64_t v82 = v118;
              if (v95) {
                goto LABEL_194;
              }
            }
            CFStringRef v95 = 0;
          }
          else if (v82 == v105)
          {
            CFStringRef v95 = 0;
            v115 = v171;
          }
          else
          {
            v115 = v171;
            CFStringRef v95 = [(MPAuthoringController *)v171 findEffectIDInWeighter:v171->_weighter images:v179 startingIndex:v173 count:v82 triesToFind:&v188 constraints:v178 previousTags:v175];
          }
LABEL_194:
          if (v164)
          {
            uint64_t v120 = v165;
          }
          else
          {
            uint64_t v120 = v165;
            if (objc_msgSend(v97, "containsIndex:", objc_msgSend(-[MPWeighter allItems](v115->_weighter, "allItems"), "indexOfObject:", v95))&& objc_msgSend(v96, "count"))
            {
              CFStringRef v95 = 0;
            }
          }
          if (((unint64_t)[v96 count] | (unint64_t)v95) == 0 && !v169)
          {
            int64_t v121 = v82;
            [v96 addIndex:1];
            id v122 = [v97 firstIndex];
            if (v122 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              for (id ii = v122; ii != (id)0x7FFFFFFFFFFFFFFFLL; id ii = [v97 indexGreaterThanIndex:ii])
              {
                if (*(objc_msgSend(-[MPWeighter allConstraints](v115->_weighter, "allConstraints"), "objectAtIndex:", ii)+ 1) <= v120)objc_msgSend(v96, "addIndex:"); {
              }
                }
            }
            BOOL v169 = [v96 count] != 0;
            int64_t v82 = v121;
          }
          if ([v96 count])
          {
            uint64_t v105 = v82;
            if (!v95) {
              continue;
            }
          }
          goto LABEL_210;
        }
        if ([v96 count])
        {
          id v107 = objc_alloc_init((Class)NSMutableIndexSet);
          long long v184 = 0u;
          long long v185 = 0u;
          long long v186 = 0u;
          long long v187 = 0u;
          id v108 = [(MPWeighter *)v171->_weighter allConstraints];
          id v109 = [v108 countByEnumeratingWithState:&v184 objects:v211 count:16];
          if (v109)
          {
            id v110 = v109;
            uint64_t v111 = 0;
            uint64_t v112 = *(void *)v185;
            do
            {
              for (jj = 0; jj != v110; jj = (char *)jj + 1)
              {
                if (*(void *)v185 != v112) {
                  objc_enumerationMutation(v108);
                }
                if ([v96 containsIndex:*(void *)(*(void *)(*((void *)&v184 + 1) + 8 * (void)jj) + 8)])objc_msgSend(v107, "addIndex:", (char *)jj + v111); {
              }
                }
              id v110 = [v108 countByEnumeratingWithState:&v184 objects:v211 count:16];
              v111 += (uint64_t)jj;
            }
            while (v110);
          }
          id v114 = [(MPWeighter *)v171->_weighter getRandomIndexInSubset:v107];

          int64_t v82 = *(objc_msgSend(-[MPWeighter allConstraints](v171->_weighter, "allConstraints"), "objectAtIndex:", v114)+ 1);
          [v96 removeIndex:v82];
          unsigned int v87 = v163;
          goto LABEL_183;
        }
        CFStringRef v95 = 0;
LABEL_210:
        BOOL v124 = v188 < 1 || v82 < 1;
        char v74 = v171;
        if (!v124)
        {
          uint64_t v125 = 0;
          int64_t v126 = v82;
          v127 = v173;
          v128 = &v173[v126];
          do
          {
            id v129 = -[NSMutableDictionary objectForKey:](v171->_cachedROIInformation, "objectForKey:", [v179 objectAtIndex:v127]);
            if (objc_msgSend(objc_msgSend(v129, "objectForKey:", @"canSwitch"), "BOOLValue"))
            {
              if ((v188 & v125) != 0) {
                objc_msgSend(v129, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), @"wasFlipped");
              }
              ++v125;
            }
            ++v127;
          }
          while ((uint64_t)v127 < (uint64_t)v128);
        }
        if (v95) {
          unsigned int v130 = 0;
        }
        else {
          unsigned int v130 = v162;
        }
        if (v130 == 1)
        {
          if ([(MPAuthoringController *)v171 imagesHaveMovie:v179 start:v173 count:v160])
          {
            id v131 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1), @"numOfImages", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), @"ignoreMovies", 0);
            id v132 = [(MPWeighter *)v171->_weighter indicesMeetingConstraints:v131];

            if ([v132 count])
            {
              id v133 = [v132 firstIndex];
              if (v133 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                id v134 = v133;
                do
                {
                  if (-[MPAuthoringController imagesHaveMovie:start:count:](v171, "imagesHaveMovie:start:count:", v179, v173, *(objc_msgSend(-[MPWeighter allConstraints](v171->_weighter, "allConstraints"), "objectAtIndex:", v134)+ 1)))
                  {
                    CFStringRef v95 = (const __CFString *)objc_msgSend(-[MPWeighter allItems](v171->_weighter, "allItems"), "objectAtIndex:", v134);
                  }
                  else
                  {
                    CFStringRef v95 = 0;
                  }
                  id v135 = [v132 indexGreaterThanIndex:v134];
                  if (v135 == (id)0x7FFFFFFFFFFFFFFFLL) {
                    break;
                  }
                  id v134 = v135;
                }
                while (!v95);
                goto LABEL_233;
              }
            }
          }
LABEL_234:
          id v136 = [(MPWeighter *)v171->_weighter allItems];
          CFStringRef v95 = (const __CFString *)[v136 objectAtIndex:v193];
        }
        else
        {
LABEL_233:
          if (!v95) {
            goto LABEL_234;
          }
        }

LABEL_236:
        weighter = v74->_weighter;
        if (v164)
        {
          [(MPWeighter *)weighter clearIgnoreIndices];
        }
        else
        {
          id v138 = objc_msgSend(-[MPWeighter allItems](weighter, "allItems"), "indexOfObject:", v95);
          if (v138 != (id)0x7FFFFFFFFFFFFFFFLL) {
            [(MPWeighter *)v74->_weighter ignoreIndex:v138];
          }
          if ((v157 & 1) == 0)
          {
            id v139 = +[MPUtilities presetIDOfCombinedID:v95];
            long long v180 = 0u;
            long long v181 = 0u;
            long long v182 = 0u;
            long long v183 = 0u;
            id v140 = [(MPWeighter *)v74->_weighter allItems];
            id v141 = [v140 countByEnumeratingWithState:&v180 objects:v210 count:16];
            if (v141)
            {
              id v142 = v141;
              uint64_t v143 = 0;
              uint64_t v144 = *(void *)v181;
              do
              {
                for (kk = 0; kk != v142; kk = (char *)kk + 1)
                {
                  if (*(void *)v181 != v144) {
                    objc_enumerationMutation(v140);
                  }
                  if ([*(id *)(*((void *)&v180 + 1) + 8 * (void)kk) hasSuffix:v139])-[MPWeighter addIndexToIgnore:](v74->_weighter, "addIndexToIgnore:", (char *)kk + v143); {
                }
                  }
                id v142 = [v140 countByEnumeratingWithState:&v180 objects:v210 count:16];
                v143 += (uint64_t)kk;
              }
              while (v142);
            }
          }
        }
        if (v74->_logLevel >= 2)
        {
          id v146 = objc_msgSend(-[MPWeighter allItems](v74->_weighter, "allItems"), "indexOfObject:", v95);
          if (v146 != (id)0x7FFFFFFFFFFFFFFFLL) {
            [(MPWeighter *)v74->_weighter increaseUsageCountOfObjectAtIndex:v146];
          }
        }
        id v147 = [v170 numOfImagesForEffectPresetID:v95];
        id v16 = v166;
        [v166 addObject:v95];
        uint64_t v148 = [(MPWeighter *)v74->_weighter constraintsForItem:v95];
        uint64_t v77 = v161;
        if (v148) {
          uint64_t v178 = v148[2];
        }
        else {
          uint64_t v178 = 0;
        }
        if (v158)
        {
          uint64_t v77 = v161;
          id v175 = objc_msgSend(objc_msgSend(v170, "attributesForEffectID:andPresetID:", +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v95), +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v95)), "objectForKey:", @"endLayoutTags");
        }
        unsigned int v81 = &v173[(void)v147];
        if ((uint64_t)&v173[(void)v147] >= v77) {
          goto LABEL_259;
        }
      }
      if (v178)
      {
        id v89 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v83), @"numOfImages", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), @"hasPanorama", 0);
        [v89 addEntriesFromDictionary:v178];
        uint64_t v193 = [(MPWeighter *)v74->_weighter getRandomIndexMeetingContraints:v89];

        if (v87) {
          goto LABEL_141;
        }
      }
      else
      {
        uint64_t v193 = [(MPWeighter *)v74->_weighter getRandomIndexWithNoPanoramasForImageCount:v83];
        if (v87)
        {
LABEL_141:
          id v90 = [v154 lastIndex];
          if (v153)
          {
            unint64_t v91 = vcvtpd_s64_f64((double)v165 * 0.5);
            if (v165 <= (unint64_t)v90) {
              int64_t v82 = v83;
            }
            else {
              int64_t v82 = v91;
            }
          }
          else
          {
            int64_t v82 = v83;
            if (v83 > (unint64_t)v90)
            {
              if (v83 >= (unint64_t)(2 * (void)[v154 lastIndex])) {
                int64_t v82 = (int64_t)[v154 lastIndex];
              }
              else {
                int64_t v82 = vcvtpd_s64_f64((double)v83 * 0.5);
              }
            }
          }
LABEL_152:
          if (v82 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_153:
            [(MPWeighter *)v74->_weighter clearIgnoreIndices];
            id v93 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v165), @"numOfImages", 0);
            id v94 = [(MPWeighter *)v74->_weighter getRandomIndexMeetingContraints:v93];

            CFStringRef v95 = @"JustASlide/Default";
            if (v94 != (id)0x7FFFFFFFFFFFFFFFLL) {
              CFStringRef v95 = (const __CFString *)objc_msgSend(-[MPWeighter allItems](v74->_weighter, "allItems"), "objectAtIndex:", v94);
            }
            goto LABEL_236;
          }
          goto LABEL_155;
        }
      }
      if (v193 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_153;
      }
      id v92 = [(MPWeighter *)v74->_weighter allConstraints];
      int64_t v82 = *((void *)[v92 objectAtIndex:v193] + 1);
      goto LABEL_152;
    }
  }
LABEL_259:
  id v149 = +[MPAuthoringUtilities lastPresetFromOptions:v156];
  if (v149)
  {
    id v150 = v149;
    if ((objc_msgSend(objc_msgSend(v156, "objectForKey:", @"hasMoreImages"), "BOOLValue") & 1) == 0)
    {
      id v151 = +[MPAuthoringUtilities idFromPresetID:](MPAuthoringUtilities, "idFromPresetID:", [v16 lastObject]);
      objc_msgSend(v16, "removeObjectAtIndex:", (char *)objc_msgSend(v16, "count") - 1);
      [v16 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@", v151, v150)];
    }
  }
  if (v155 && ([v155 hasPrefix:@"Fade"] & 1) == 0) {
    [v16 addObject:v155];
  }
  return v16;
}

- (BOOL)imagesHaveMovie:(id)a3 start:(int64_t)a4 count:(int64_t)a5
{
  id v9 = [a3 count];
  if (a5 < 1) {
    return 0;
  }
  int64_t v10 = (int64_t)v9;
  int64_t v11 = a5 + a4;
  while (a4 >= v10
       || (objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->_cachedROIInformation, "objectForKey:", objc_msgSend(a3, "objectAtIndex:", a4)), "objectForKey:", @"isMovie"), "BOOLValue") & 1) == 0)
  {
    if (++a4 >= v11) {
      return 0;
    }
  }
  return 1;
}

- (int64_t)bestCountFromClusterForEffectWithImages:(id)a3 atStartIndex:(int64_t)a4 withWeighter:(id)a5 usedIndex:(int64_t *)a6
{
  id v9 = objc_msgSend(+[MPClusterController sharedController](MPClusterController, "sharedController"), "slideForPath:", objc_msgSend(a3, "objectAtIndex:", a4));
  id v10 = objc_msgSend(+[MPClusterController sharedController](MPClusterController, "sharedController"), "findBestCluster:withMaxEffectSize:idealEffectSize:", objc_msgSend(v9, "usableSlideClusters"), objc_msgSend(objc_msgSend(a5, "imageCounts"), "lastIndex"), 4);
  if (!v10) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v11 = [v10 allSlides];
  id v12 = [v11 count];
  int64_t v13 = v12 - (unsigned char *)[v11 indexOfObject:v9];
  [(MPWeighter *)self->_weighter clearIgnoreIndices];
  id v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13), @"numOfImages", 0);
  id v15 = [a5 indicesEqualingConstraints:v14];
  if ([v15 count]) {
    id v16 = [a5 getRandomIndexInSubset:v15];
  }
  else {
    id v16 = [a5 getRandomIndexMeetingContraints:v14];
  }
  int64_t v17 = *(objc_msgSend(objc_msgSend(a5, "allConstraints"), "objectAtIndex:", v16) + 1);

  if (a6) {
    *a6 = v17;
  }
  return v17;
}

- (id)findEffectIDInPresetArray:(id)a3 forImages:(id)a4 withOptions:(id)a5
{
  id v9 = objc_alloc_init(MPWeighter);
  [(MPAuthoringController *)self populateWeighter:v9 withEffects:a3 andOptions:a5];
  id v10 = [(MPWeighter *)v9 imageCounts];
  if (![v10 lastIndex]) {
    goto LABEL_26;
  }
  if (+[MPAuthoringUtilities ignoreClusteringForImages:a4 withOptions:a5])
  {
    goto LABEL_14;
  }
  id v11 = [(MPAuthoringController *)self bestCountFromClusterForEffectWithImages:a4 atStartIndex:0 withWeighter:v9 usedIndex:0];
  if (([v10 containsIndex:v11] & 1) == 0) {
    id v11 = [v10 indexLessThanIndex:v11];
  }
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL
    || (id v12 = [(MPAuthoringController *)self findEffectIDInWeighter:v9 images:a4 startingIndex:0 count:v11 triesToFind:0 constraints:0 previousTags:0]) == 0)
  {
LABEL_14:
    id v13 = [v10 lastIndex];
    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_26;
    }
    unint64_t v14 = (unint64_t)v13;
    do
    {
      if ((unint64_t)[a4 count] >= v14) {
        id v12 = [(MPAuthoringController *)self findEffectIDInWeighter:v9 images:a4 startingIndex:0 count:v14 triesToFind:0 constraints:0 previousTags:0];
      }
      else {
        id v12 = 0;
      }
      id v15 = [v10 indexLessThanIndex:v14];
      if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v14 = (unint64_t)v15;
    }
    while (!v12);
    if (!v12) {
      goto LABEL_26;
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
LABEL_17:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v25 != v18) {
        objc_enumerationMutation(a3);
      }
      id v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
      id v21 = [v20 objectForKey:@"presetID"];
      id v22 = [v20 objectForKey:@"backgroundEffect"];
      if (!v22) {
        id v22 = v21;
      }
      if ([v22 isEqualToString:v12]) {
        break;
      }
      if (v17 == (id)++v19)
      {
        id v17 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
        id v20 = 0;
        if (v17) {
          goto LABEL_17;
        }
        break;
      }
    }
  }
  else
  {
LABEL_26:
    id v20 = 0;
  }

  return v20;
}

- (void)populateWeighter:(id)a3 withEffects:(id)a4 andOptions:(id)a5
{
  if ([a3 count])
  {
    if (objc_msgSend(objc_msgSend(a5, "objectForKey:", kMPAuthoringLive), "BOOLValue")) {
      return;
    }
    [a3 clearAllItems];
  }
  id v100 = +[MPEffectManager sharedManager];
  +[MPAuthoringUtilities aspectRatioFromOptions:a5];
  double v8 = v7;
  unint64_t v9 = +[MPAuthoringUtilities screenSizeFromOptions:a5];
  unsigned int v88 = +[MPAuthoringUtilities matchEffectsUsingTagsFromOptions:a5];
  id v10 = +[MPAuthoringUtilities styleFromOptions:a5];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v11 = [a4 countByEnumeratingWithState:&v137 objects:v147 count:16];
  if (v11)
  {
    id v12 = v11;
    char v95 = 0;
    uint64_t v101 = *(void *)v138;
    int64_t v85 = self;
    id v86 = v10;
    unint64_t v87 = v9;
    do
    {
      id v13 = 0;
      id v91 = v12;
      do
      {
        if (*(void *)v138 != v101) {
          objc_enumerationMutation(a4);
        }
        unint64_t v14 = *(void **)(*((void *)&v137 + 1) + 8 * (void)v13);
        id v15 = [v14 objectForKey:@"likelihood"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (MRIsAppleTV()) {
            CFStringRef v16 = @"AppleTV";
          }
          else {
            CFStringRef v16 = @"Desktop";
          }
          id v15 = [v15 objectForKey:v16];
        }
        id v17 = [v14 objectForKey:@"presetID"];
        if ([v14 objectForKey:@"backgroundEffect"]) {
          id v17 = [v14 objectForKey:@"backgroundEffect"];
        }
        id v18 = [v14 objectForKey:@"exclusion"];
        uint64_t v102 = v15;
        double v103 = v14;
        if (MRIsAppleTV())
        {
          long long v135 = 0u;
          long long v136 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          id v19 = [v18 countByEnumeratingWithState:&v133 objects:v146 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v134;
            char v22 = 1;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v134 != v21) {
                  objc_enumerationMutation(v18);
                }
                if ([*(id *)(*((void *)&v133 + 1) + 8 * i) isEqualToString:@"AppleTV"])char v22 = 0; {
              }
                }
              id v20 = [v18 countByEnumeratingWithState:&v133 objects:v146 count:16];
            }
            while (v20);
          }
          else
          {
            char v22 = 1;
          }
          int v24 = v22 & 1;
        }
        else
        {
          int v24 = 1;
        }
        switch(v9)
        {
          case 2uLL:
            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            id v33 = [v18 countByEnumeratingWithState:&v121 objects:v143 count:16];
            if (v33)
            {
              id v34 = v33;
              uint64_t v35 = *(void *)v122;
              do
              {
                for (j = 0; j != v34; j = (char *)j + 1)
                {
                  if (*(void *)v122 != v35) {
                    objc_enumerationMutation(v18);
                  }
                  v24 &= [*(id *)(*((void *)&v121 + 1) + 8 * (void)j) isEqualToString:@"smallScreen"] ^ 1;
                }
                id v34 = [v18 countByEnumeratingWithState:&v121 objects:v143 count:16];
              }
              while (v34);
            }
            break;
          case 1uLL:
            long long v127 = 0u;
            long long v128 = 0u;
            long long v125 = 0u;
            long long v126 = 0u;
            id v29 = [v18 countByEnumeratingWithState:&v125 objects:v144 count:16];
            if (v29)
            {
              id v30 = v29;
              uint64_t v31 = *(void *)v126;
              do
              {
                for (k = 0; k != v30; k = (char *)k + 1)
                {
                  if (*(void *)v126 != v31) {
                    objc_enumerationMutation(v18);
                  }
                  v24 &= [*(id *)(*((void *)&v125 + 1) + 8 * (void)k) isEqualToString:@"mediumScreen"] ^ 1;
                }
                id v30 = [v18 countByEnumeratingWithState:&v125 objects:v144 count:16];
              }
              while (v30);
            }
            break;
          case 0uLL:
            long long v131 = 0u;
            long long v132 = 0u;
            long long v129 = 0u;
            long long v130 = 0u;
            id v25 = [v18 countByEnumeratingWithState:&v129 objects:v145 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v130;
              do
              {
                for (m = 0; m != v26; m = (char *)m + 1)
                {
                  if (*(void *)v130 != v27) {
                    objc_enumerationMutation(v18);
                  }
                  v24 &= [*(id *)(*((void *)&v129 + 1) + 8 * (void)m) isEqualToString:@"largeScreen"] ^ 1;
                }
                id v26 = [v18 countByEnumeratingWithState:&v129 objects:v145 count:16];
              }
              while (v26);
            }
            break;
        }
        id v37 = [v103 objectForKey:@"minAspectRatio"];
        if (v37)
        {
          [v37 floatValue];
          BOOL v39 = v38 <= 1.0 || v8 <= 1.0;
          if ((!v39 || v38 < 1.0 && v8 < 1.0) && v8 < v38 + -0.00999999978) {
            int v24 = 0;
          }
        }
        id v40 = [v103 objectForKey:@"maxAspectRatio"];
        if (!v40
          || (([v40 floatValue], v41 <= 1.0) || v8 <= 1.0) && (v41 >= 1.0 || v8 >= 1.0)
          || v8 <= v41 + 0.00999999978)
        {
          int v42 = v17 ? v24 : 0;
          if (v42 == 1)
          {
            id v43 = v17;
            id v44 = [v100 numOfImagesForEffectPresetID:v17];
            unsigned int v45 = objc_alloc_init(MPWeighterConstraint);
            uint64_t v97 = (uint64_t)v44;
            v45->numOfImages = (int64_t)v44;
            unsigned __int8 v99 = objc_msgSend(objc_msgSend(v103, "objectForKey:", @"moviesOnly"), "BOOLValue");
            unsigned __int8 v98 = objc_msgSend(objc_msgSend(v103, "objectForKey:", @"ignoreMovies"), "BOOLValue");
            id v46 = +[MPUtilities idOfCombinedID:v43];
            id v47 = [v100 orientationForEffectID:v46];
            unsigned int v48 = v47;
            if ((v8 >= 1.0 || ([v47 isEqualToString:@"landscape"] & 1) == 0)
              && (v8 < 1.0 || ([v48 isEqualToString:@"portrait"] & 1) == 0))
            {
              id v92 = v45;
              id v93 = v43;
              id v94 = v13;
              id v49 = +[MPUtilities presetIDOfCombinedID:v43];
              id v50 = v46;
              id v51 = objc_msgSend(objc_msgSend(v100, "mediaAspectRatioHintsForEffectID:usingPresetID:defaultAspectRatio:", v46, v49, v8), "allValues");
              id v52 = [v103 objectForKey:@"aspectRatios"];
              if (v52) {
                id v51 = v52;
              }
              long long v117 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v120 = 0u;
              id v53 = [v51 countByEnumeratingWithState:&v117 objects:v142 count:16];
              if (v53)
              {
                id v54 = v53;
                int64_t v104 = 0;
                uint64_t v55 = 0;
                uint64_t v56 = 0;
                int64_t v112 = 0;
                uint64_t v57 = *(void *)v118;
                do
                {
                  for (n = 0; n != v54; n = (char *)n + 1)
                  {
                    if (*(void *)v118 != v57) {
                      objc_enumerationMutation(v51);
                    }
                    [*(id *)(*((void *)&v117 + 1) + 8 * (void)n) floatValue];
                    double v60 = v59;
                    if (v59 >= 1.075 || v60 <= 0.95)
                    {
                      if (v59 >= 3.0)
                      {
                        ++v112;
                      }
                      else if (v60 >= 1.075)
                      {
                        ++v104;
                      }
                      else
                      {
                        ++v55;
                      }
                    }
                    else
                    {
                      ++v56;
                    }
                  }
                  id v54 = [v51 countByEnumeratingWithState:&v117 objects:v142 count:16];
                }
                while (v54);
              }
              else
              {
                int64_t v104 = 0;
                uint64_t v55 = 0;
                int64_t v112 = 0;
              }
              int64_t v90 = v55;
              id v111 = +[NSMutableArray array];
              id v61 = +[NSMutableArray array];
              id v62 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "imageInputInfoForEffectID:", v50);
              long long v113 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              long long v116 = 0u;
              id v63 = [v62 countByEnumeratingWithState:&v113 objects:v141 count:16];
              if (v63)
              {
                id v64 = v63;
                int64_t v109 = 0;
                int64_t v110 = 0;
                uint64_t v106 = 0;
                int64_t v107 = 0;
                int64_t v108 = 0;
                int64_t v105 = 0;
                uint64_t v65 = 0;
                uint64_t v66 = *(void *)v114;
                do
                {
                  for (id ii = 0; ii != v64; id ii = (char *)ii + 1)
                  {
                    if (*(void *)v114 != v66) {
                      objc_enumerationMutation(v62);
                    }
                    uint64_t v68 = *(void **)(*((void *)&v113 + 1) + 8 * (void)ii);
                    switch((unint64_t)objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "panoTypeForSlideAtIndex:inEffect:forPresetID:", (char *)ii + v65, v50, v49))
                    {
                      case 1uLL:
                        ++v106;
                        break;
                      case 2uLL:
                        ++v110;
                        break;
                      case 3uLL:
                        ++v105;
                        break;
                      case 4uLL:
                        ++v109;
                        break;
                      case 5uLL:
                        ++v108;
                        break;
                      case 6uLL:
                        ++v107;
                        break;
                      default:
                        break;
                    }
                    id v69 = [v68 objectForKey:@"maxBreak"];
                    if (v69) {
                      [v111 addObject:v69];
                    }
                    id v70 = [v68 objectForKey:@"minBreak"];
                    if (v70) {
                      [v61 addObject:v70];
                    }
                  }
                  id v64 = [v62 countByEnumeratingWithState:&v113 objects:v141 count:16];
                  v65 += (uint64_t)ii;
                }
                while (v64);
              }
              else
              {
                int64_t v109 = 0;
                int64_t v110 = 0;
                uint64_t v106 = 0;
                int64_t v107 = 0;
                int64_t v108 = 0;
                int64_t v105 = 0;
              }
              uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
              if (v97 == 0x7FFFFFFFFFFFFFFFLL)
              {
                int64_t v72 = 0;
                int64_t v73 = 0;
                int64_t v74 = 0;
                int64_t v75 = 0;
              }
              else
              {
                if (v97 < 1)
                {
                  int64_t v75 = 0;
                  int64_t v72 = v90;
                }
                else
                {
                  uint64_t v76 = 0;
                  int64_t v75 = 0;
                  int64_t v72 = v90;
                  do
                  {
                    unsigned int v77 = [(MPAuthoringController *)v85 determineIfSlideDisplayesForTheWholeDurationForEffect:v50 presetID:v49 atIndex:v76 inStyleID:v86];
                    if (v97 == 1) {
                      uint64_t v78 = 1;
                    }
                    else {
                      uint64_t v78 = v77;
                    }
                    v75 += v78;
                    ++v76;
                  }
                  while (v97 != v76);
                }
                int64_t v74 = v112;
                int64_t v73 = v104;
                uint64_t v71 = v97 - v112 - (v104 + v72);
              }
              unint64_t v9 = v87;
              -[MPWeighterConstraint setNextConstraints:](v92, "setNextConstraints:", [v103 objectForKey:@"nextConstraints"]);
              [(MPWeighterConstraint *)v92 setPresetID:v49];
              v92->movieCount = v75;
              unsigned int v45 = v92;
              v92->moviesOnly = v99;
              v92->ignoreMovies = v98;
              v92->wideLandscape = v74;
              v92->square = v71;
              v92->landscape = v73;
              v92->portrait = v72;
              v92->hPanoramas = v106;
              v92->vPanoramas = v110;
              v92->supportsHPanoramas = v109;
              v92->supportsVPanoramas = v108;
              v92->supportsAllPanoramas = v107;
              v92->allPanoramas = v105;
              BOOL v84 = v106 > 0 || v110 > 0 || v105 > 0 || v109 > 0 || v108 > 0 || v107 > 0;
              v92->hasPanorama = v84;
              [(MPWeighterConstraint *)v92 setMaxAspectRatios:v111];
              [(MPWeighterConstraint *)v92 setMinAspectRatios:v61];
              if (v88) {
                -[MPWeighterConstraint setTags:](v92, "setTags:", objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", v50, v49), "objectForKey:", @"startLayoutTags"));
              }
              v95 |= v92->hasPanorama;
              objc_msgSend(a3, "addItem:withWeight:andContraints:", v93, objc_msgSend(v102, "integerValue"), v92);
              id v13 = v94;
            }

            id v12 = v91;
          }
        }
        id v13 = (char *)v13 + 1;
      }
      while (v13 != v12);
      id v12 = [a4 countByEnumeratingWithState:&v137 objects:v147 count:16];
    }
    while (v12);
  }
  else
  {
    char v95 = 0;
  }
  [a3 setIgnorePanoramas:(v95 & 1) == 0];
}

- (void)populateWeighter:(id)a3 withTransitions:(id)a4 andOptions:(id)a5
{
  if ([a3 count])
  {
    if (objc_msgSend(objc_msgSend(a5, "objectForKey:", kMPAuthoringLive), "BOOLValue")) {
      return;
    }
    [a3 clearAllItems];
  }
  unsigned int v7 = +[MPAuthoringUtilities useTransitionLayoutTagsWithOptions:a5];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v17 = objc_alloc_init(MPWeighterConstraint);
          if (v7)
          {
            id v22 = objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "attributesForTransitionID:andPresetID:", +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v12), +[MPUtilities presetIDOfCombinedID:](MPUtilities, "presetIDOfCombinedID:", v12));
            -[MPWeighterConstraint setTags:](v17, "setTags:", [v22 objectForKey:@"tags"]);
            v17->tagsOnSourceOnly = objc_msgSend(objc_msgSend(v22, "objectForKey:", @"tagsOnSourceOnly"), "BOOLValue");
          }
          id v20 = a3;
          uint64_t v21 = v12;
          id v19 = &dword_0 + 1;
          goto LABEL_22;
        }
        id v13 = [v12 objectForKey:@"likelihood"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (MRIsAppleTV()) {
            CFStringRef v14 = @"AppleTV";
          }
          else {
            CFStringRef v14 = @"Desktop";
          }
          id v13 = [v13 objectForKey:v14];
        }
        id v15 = [v12 objectForKey:@"presetID"];
        if (v15)
        {
          id v16 = v15;
          id v17 = objc_alloc_init(MPWeighterConstraint);
          id v18 = [v12 objectForKey:@"constraints"];
          if (v18) {
            -[MPWeighterConstraint setPresetID:](v17, "setPresetID:", [v18 objectForKey:@"presetID"]);
          }
          id v19 = [v13 integerValue];
          id v20 = a3;
          uint64_t v21 = v16;
LABEL_22:
          [v20 addItem:v21 withWeight:v19 andContraints:v17];

          continue;
        }
      }
      id v9 = [a4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
}

- (id)findEffectIDInWeighter:(id)a3 images:(id)a4 startingIndex:(int64_t)a5 count:(int64_t)a6 triesToFind:(int64_t *)a7 constraints:(id)a8 previousTags:(id)a9
{
  id v12 = [a4 count];
  int64_t v13 = a6 + a5;
  int64_t v42 = a6;
  int64_t v40 = a5;
  if (a6 < 1)
  {
    uint64_t v45 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v45 = 0;
    do
    {
      if (a5 < (uint64_t)v12)
      {
        id v15 = -[NSMutableDictionary objectForKey:](self->_cachedROIInformation, "objectForKey:", [a4 objectAtIndex:a5]);
        v14 += objc_msgSend(objc_msgSend(v15, "objectForKey:", @"canSwitch"), "BOOLValue");
        v45 += objc_msgSend(objc_msgSend(v15, "objectForKey:", @"isMovie"), "BOOLValue");
      }
      ++a5;
    }
    while (a5 < v13);
  }
  float v16 = exp2f((float)v14);
  int64_t v17 = 0;
  uint64_t v41 = (uint64_t)v16;
  id v49 = v12;
  do
  {
    int64_t v46 = v17;
    id v51 = +[NSMutableArray array];
    if (v42 < 1)
    {
      uint64_t v22 = 0;
      uint64_t v21 = 0;
      uint64_t v20 = 0;
      uint64_t v19 = 0;
      uint64_t v18 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
    }
    else
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      int64_t v23 = v40;
      do
      {
        if (v23 < (uint64_t)v12)
        {
          uint64_t v52 = v19;
          int64_t v24 = v13;
          id v25 = [a4 objectAtIndex:v23];
          id v26 = [(NSMutableDictionary *)self->_cachedROIInformation objectForKey:v25];
          objc_msgSend(objc_msgSend(v26, "objectForKey:", @"aspectRatio"), "floatValue");
          id v27 = [v26 objectForKey:@"imageAspectRatio"];
          long long v28 = self;
          if (v27)
          {
            id v29 = v27;
            [v27 floatValue];
            double v31 = v30;
            [v51 addObject:v29];
            self = v28;
          }
          else
          {
            authoredDocument = self->_authoredDocument;
            if (!authoredDocument)
            {
              NSLog(@"Going to create some bad layouts!!!");
              authoredDocument = self->_authoredDocument;
            }
            [(MPDocument *)authoredDocument resolutionForPath:v25];
            double v31 = v33 / v34;
            *(float *)&double v33 = v33 / v34;
            objc_msgSend(v51, "addObject:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v33));
          }
          int64_t v13 = v24;
          uint64_t v35 = (char *)objc_msgSend(objc_msgSend(v26, "objectForKey:", @"panoramaType"), "integerValue");
          if (v35 == (unsigned char *)&dword_0 + 2)
          {
            ++v47;
          }
          else if (v35 == (unsigned char *)&dword_0 + 1)
          {
            ++v48;
          }
          v18 += objc_msgSend(objc_msgSend(v26, "objectForKey:", @"fitsInExtraWide"), "BOOLValue");
          objc_msgSend(objc_msgSend(v26, "objectForKey:", @"canSwitch"), "BOOLValue");
          if (v31 <= 1.0)
          {
            ++v21;
          }
          else
          {
            ++v22;
            ++v20;
          }
          uint64_t v19 = v52;
          if (v31 <= 1.0) {
            uint64_t v19 = v52 + 1;
          }
          id v12 = v49;
        }
        ++v23;
      }
      while (v23 < v13);
    }
    id v36 = [a3 getRandomItemMeetingNumberOfFaceLandscapes:v22 facePortraits:v21 imageLandscapes:v20 imagePortraits:v19 vPanoramas:v47 hPanoramas:v48 movies:v45 fitsInExtraWide:v18 aspectRatios:v51 previousTags:a9];
    id v37 = v36;
    if (a8
      && v36
      && !objc_msgSend(a3, "itemAtIndex:meetsContraints:", objc_msgSend(-[MPWeighter allItems](self->_weighter, "allItems"), "indexOfObject:", v36), a8))
    {
      id v37 = 0;
    }
    int64_t v17 = v46;
    if (v37) {
      break;
    }
    int64_t v17 = v46 + 1;
  }
  while (v46 + 1 < v41);
  if (a7) {
    *a7 = v17;
  }
  return v37;
}

- (BOOL)determineIfSlideDisplayesForTheWholeDurationForEffect:(id)a3 presetID:(id)a4 atIndex:(int64_t)a5 inStyleID:(id)a6
{
  if (objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "hasCustomTimingForEffectID:", a3))
  {
    objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "allowUserDefinedDurationForStyleID:", a6);
    if (v10 == 0.0) {
      return 0;
    }
  }
  id v11 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "showTimeScriptForEffectID:atSlideIndex:", a3, a5);
  if (!v11) {
    return 1;
  }
  id v12 = v11;
  double v23 = 0.0;
  double v24 = 0.0;
  double v22 = 0.0;
  objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "defaultDurationsForEffectID:phaseInDuration:mainDuration:phaseOutDuration:", a3, &v23, &v24, &v22);
  double v13 = v24 + v23 + v22;
  id v14 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", a3, a4);
  id v15 = objc_alloc((Class)NSDictionary);
  float v16 = +[NSNumber numberWithDouble:v23];
  int64_t v17 = +[NSNumber numberWithDouble:v24];
  id v18 = objc_msgSend(v15, "initWithObjectsAndKeys:", v16, @"phaseInDuration", v17, @"mainDuration", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v22), @"phaseOutDuration", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13), @"fullDuration", 0);
  uint64_t v19 = +[MPUtilities executeScript:v12 withHeader:v18 andAttributes:v14];

  if (!v19) {
    return 1;
  }
  CGSize v20 = CGSizeFromString(v19);
  if (v20.height < 0.0 && v20.width == 0.0) {
    return 1;
  }
  if (v20.height + v20.width > v13) {
    return v20.height == 0.0;
  }
  return 0;
}

- (void)scaleDurationsInLayer:(id)a3 withOptions:(id)a4
{
  if (!+[MPAuthoringUtilities layerCanSkipScaleCalculation:withOptions:](MPAuthoringUtilities, "layerCanSkipScaleCalculation:withOptions:"))
  {
    +[MPAuthoringUtilities audioDurationFromOptions:a4];
    double v9 = v8;
    +[MPAuthoringUtilities audioDurationFactorFromOptions:a4];
    double v11 = v10;
    unint64_t v12 = +[MPAuthoringUtilities audioScalingModeFromOptions:a4];
    id v13 = [a4 mutableCopy];
    id v14 = v13;
    if ((v11 > -1.0 || v9 > 0.0) && v12 == 1)
    {
      [v13 removeObjectForKey:kMPAuthoringLayerTimeScale];
      [a3 setSkipTimeCalculations:1];
      -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:](self, "scaleDurationsInEffectContainers:withOptions:", [a3 effectContainers], v14);
      [a3 setSkipTimeCalculations:0];
      [(MPAuthoringController *)self scaleLayerToMatchAudio:a3 withOptions:v14];
    }
    else
    {
      [a3 setSkipTimeCalculations:1];
      -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:](self, "scaleDurationsInEffectContainers:withOptions:", [a3 effectContainers], v14);
      [a3 setSkipTimeCalculations:0];
    }
  }
}

- (void)scaleDurationsInLayer:(id)a3 withMutableOptions:(id)a4
{
  if (!+[MPAuthoringUtilities layerCanSkipScaleCalculation:withOptions:](MPAuthoringUtilities, "layerCanSkipScaleCalculation:withOptions:"))
  {
    +[MPAuthoringUtilities audioDurationFromOptions:a4];
    double v9 = v8;
    +[MPAuthoringUtilities audioDurationFactorFromOptions:a4];
    double v11 = v10;
    unint64_t v12 = +[MPAuthoringUtilities audioScalingModeFromOptions:a4];
    BOOL v13 = v11 > -1.0 || v9 > 0.0;
    BOOL v14 = v12 == 1 && v13;
    id v15 = [a4 mutableCopy];
    float v16 = v15;
    if (v14) {
      [v15 removeObjectForKey:kMPAuthoringLayerTimeScale];
    }
    [a3 setSkipTimeCalculations:1];
    -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:](self, "scaleDurationsInEffectContainers:withOptions:", [a3 effectContainers], v16);

    [a3 setSkipTimeCalculations:0];
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kMPAuthoringMinimumDuration), "doubleValue");
    if (v17 == 0.0)
    {
      [(MPAuthoringController *)self minimumDurationForLayer:a3 inDocument:self->_authoredDocument withOptions:a4];
      id v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [a4 setObject:v18 forKeyedSubscript:kMPAuthoringMinimumDuration];
    }
    objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kMPAuthoringMaximumDuration), "doubleValue");
    if (v19 == 0.0)
    {
      [(MPAuthoringController *)self maximumDurationForLayer:a3 inDocument:self->_authoredDocument withOptions:a4];
      CGSize v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [a4 setObject:v20 forKeyedSubscript:kMPAuthoringMaximumDuration];
    }
    if (v14) {
      [(MPAuthoringController *)self scaleLayerToMatchAudio:a3 withOptions:a4];
    }
  }
}

- (void)scaleDurationsInEffectContainers:(id)a3 withOptions:(id)a4
{
  id v129 = +[MPEffectManager sharedManager];
  +[MPAuthoringUtilities durationPerEffectFromOptions:a4];
  double v8 = v7;
  objc_msgSend(-[MPAuthoringController transitionFromOptions:](self, "transitionFromOptions:", a4), "duration");
  double v108 = v9;
  +[MPAuthoringUtilities layerTimeScaleFromOptions:a4];
  double v110 = v10;
  +[MPAuthoringUtilities minimumTransitionDurationFromOptions:a4];
  double v12 = v11;
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:a4];
  double v121 = v13;
  unsigned int v120 = +[MPAuthoringUtilities matchPhasesWithTransitionFromOptions:a4];
  unsigned int v107 = +[MPAuthoringUtilities useUniformDurations:a4];
  id v115 = +[MPAuthoringUtilities idFromPresetID:](MPAuthoringUtilities, "idFromPresetID:", +[MPAuthoringUtilities outroEffectIDFromOptions:a4]);
  unsigned int v114 = +[MPAuthoringUtilities scaleOutroEffectFromOptions:a4];
  objc_msgSend(objc_msgSend(a3, "lastObject"), "outroTransitionDuration");
  double v15 = v14;
  unsigned int v119 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:a4];
  +[MPAuthoringUtilities breakDurationScaleFromOptions:a4];
  double v112 = v16;
  +[MPAuthoringUtilities portraitBreakDurationScaleFromOptions:a4];
  double v111 = v17;
  objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "allowUserDefinedDurationForStyleID:", +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a4));
  double v113 = v18;
  id v19 = +[MPAuthoringUtilities customDurationsFromOptions:a4];
  +[MPAuthoringUtilities baseBreakAspectRatioFromOptions:a4];
  double v21 = v20;
  +[MPAuthoringUtilities basePortraitBreakAspectRatioFromOptions:a4];
  double v23 = v22;
  +[MPAuthoringUtilities aspectRatioFromOptions:a4];
  double v138 = v24;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id obj = a3;
  id v122 = [a3 countByEnumeratingWithState:&v160 objects:v168 count:16];
  if (v122)
  {
    uint64_t v118 = *(void *)v161;
    double v117 = v8 * v110;
    double v25 = 1.0 / v21;
    if (v23 > 0.0) {
      double v25 = v23;
    }
    double v109 = v25;
    double v26 = v108;
    if (v108 < v12) {
      double v26 = v12;
    }
    double v123 = v26;
    double v136 = v21;
    id v137 = v19;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v161 != v118) {
          objc_enumerationMutation(obj);
        }
        long long v28 = *(void **)(*((void *)&v160 + 1) + 8 * v27);
        double v125 = v15;
        uint64_t v124 = v27;
        if (!objc_msgSend(objc_msgSend(v28, "effects"), "count"))
        {
          int v32 = 0;
          int v33 = 0;
          id v135 = 0;
          double v34 = 0.0;
          double v35 = v121;
          double v36 = 0.0;
          double v37 = v8 * v110;
          goto LABEL_95;
        }
        id v29 = objc_msgSend(objc_msgSend(v28, "effects"), "objectAtIndex:", 0);
        if ((objc_msgSend(v115, "isEqualToString:", objc_msgSend(v29, "effectID")) ^ 1 | v114) != 1)
        {
          int v32 = 0;
          int v38 = 0;
          id v135 = 0;
          double v34 = 0.0;
          double v35 = v121;
          double v36 = 0.0;
          double v37 = v8 * v110;
          goto LABEL_94;
        }
        long long v140 = v29;
        if ([v29 supportsEffectTiming] && (double v30 = v113, v113 == 0.0)) {
          objc_msgSend(v29, "fullDuration", v113);
        }
        else {
          objc_msgSend(v129, "defaultFullDurationForEffectID:", objc_msgSend(v29, "effectID", v30));
        }
        double v39 = v110 * v31;
        double v34 = 0.0;
        BOOL v40 = v39 > v117 || v117 < 0.0;
        long long v158 = 0u;
        long long v159 = 0u;
        if (v40) {
          double v37 = v39;
        }
        else {
          double v37 = v8 * v110;
        }
        long long v156 = 0uLL;
        long long v157 = 0uLL;
        id v126 = [v28 effects];
        id v130 = [v126 countByEnumeratingWithState:&v156 objects:v167 count:16];
        if (!v130)
        {
          int v139 = 0;
          id v135 = 0;
          BOOL v41 = 0;
          unsigned int v44 = 0;
          double v36 = 0.0;
          double v35 = v121;
          goto LABEL_91;
        }
        int v139 = 0;
        id v135 = 0;
        LOBYTE(v41) = 0;
        char v42 = 0;
        uint64_t v43 = 0;
        LOBYTE(v44) = 0;
        uint64_t v127 = *(void *)v157;
        long long v128 = v28;
        double v35 = v121;
        double v36 = 0.0;
        do
        {
          for (id i = 0; i != v130; id i = v73 + 1)
          {
            char v132 = v44;
            double v134 = v35;
            if (*(void *)v157 != v127) {
              objc_enumerationMutation(v126);
            }
            BOOL v133 = v41;
            long long v131 = (char *)i;
            int64_t v46 = *(void **)(*((void *)&v156 + 1) + 8 * i);
            objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "durationPaddingForEffectID:", objc_msgSend(v46, "effectID"));
            double v48 = v47;
            long long v152 = 0u;
            long long v153 = 0u;
            long long v154 = 0u;
            long long v155 = 0u;
            id v142 = v46;
            id v143 = [v46 slides];
            id v49 = [v143 countByEnumeratingWithState:&v152 objects:v166 count:16];
            if (v49)
            {
              id v50 = v49;
              uint64_t v141 = 0;
              uint64_t v51 = *(void *)v153;
              uint64_t v52 = v43;
              do
              {
                for (j = 0; j != v50; j = (char *)j + 1)
                {
                  if (*(void *)v153 != v51) {
                    objc_enumerationMutation(v143);
                  }
                  id v54 = *(void **)(*((void *)&v152 + 1) + 8 * (void)j);
                  id v55 = objc_msgSend(v19, "objectForKeyedSubscript:", objc_msgSend(v54, "path"));
                  if ([v54 hasMovie])
                  {
                    -[MPDocument stopTimeForPath:](self->_authoredDocument, "stopTimeForPath:", [v54 path]);
                    if (v56 == 0.0) {
                      -[MPDocument durationForPath:](self->_authoredDocument, "durationForPath:", [v54 path]);
                    }
                    double v57 = v56;
                    -[MPDocument startTimeForPath:](self->_authoredDocument, "startTimeForPath:", [v54 path]);
                    double v59 = v58;
                    if (self->_logLevel >= 2) {
                      -[NSMutableDictionary setObject:forKey:](self->_stats, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_stats, "objectForKey:", @"movieCount"), "integerValue")+ 1), @"movieCount");
                    }
                    if ((v42 & (v48 + v57 - v59 < v37)) == 0) {
                      double v37 = v48 + v57 - v59;
                    }
                    char v42 = 1;
                  }
                  else if (v55)
                  {
                    [v55 doubleValue];
                    if (v60 >= v37) {
                      double v61 = v60;
                    }
                    else {
                      double v61 = v37;
                    }
                    if (v52) {
                      double v37 = v61;
                    }
                    else {
                      double v37 = v60;
                    }
                    uint64_t v52 = 1;
                  }
                  else if ((objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "skipPanoramaScaleForEffectID:", objc_msgSend(v142, "effectID")) & 1) == 0)
                  {
                    -[MPDocument resolutionForPath:](self->_authoredDocument, "resolutionForPath:", [v54 path]);
                    double v64 = v62 / v63;
                    if (v62 / v63 < 0.5 || v64 > 2.0)
                    {
                      objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "mediaAspectRatioForEffectID:usingAttributes:atIndex:defaultAspectRatio:imageAspectRatio:", objc_msgSend(v140, "effectID"), objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", objc_msgSend(v140, "effectID"), objc_msgSend(v140, "presetID")), (char *)j + v141, v138, v64);
                      double v67 = v66;
                      if (v64 >= 1.0 || v64 <= v66)
                      {
                        BOOL v69 = v64 > 1.0;
                        if (v64 >= v66) {
                          BOOL v69 = 0;
                        }
                      }
                      else
                      {
                        BOOL v69 = 1;
                      }
                      uint64_t v52 = v52;
                      if (v69 && v136 < 0.0)
                      {
                        id v19 = v137;
                      }
                      else
                      {
                        double v70 = v64 / v66;
                        double v71 = v34 / v36;
                        if ((v139 & 1) == 0) {
                          double v71 = 0.0;
                        }
                        double v72 = v36 / v34;
                        if ((v139 & 1) == 0) {
                          double v72 = 0.0;
                        }
                        if (v64 < 1.0)
                        {
                          double v70 = v67 / v64;
                          double v71 = v72;
                        }
                        id v19 = v137;
                        if (v70 <= v71)
                        {
                          int v139 = 1;
                        }
                        else
                        {
                          if (!v135) {
                            id v135 = [v142 effectID];
                          }
                          int v139 = 1;
                          double v34 = v64;
                          double v36 = v67;
                        }
                      }
                    }
                  }
                }
                id v50 = [v143 countByEnumeratingWithState:&v152 objects:v166 count:16];
                v141 += (uint64_t)j;
              }
              while (v50);
            }
            else
            {
              uint64_t v52 = v43;
            }
            uint64_t v43 = v52;
            if (v133)
            {
              BOOL v41 = 1;
              long long v28 = v128;
              double v35 = v134;
              int64_t v73 = v131;
              int64_t v74 = v142;
              if ((v132 & 1) == 0) {
                goto LABEL_82;
              }
            }
            else
            {
              int64_t v74 = v142;
              BOOL v41 = (uint64_t)[v142 countOfSlides] > 0;
              long long v28 = v128;
              double v35 = v134;
              int64_t v73 = v131;
              if ((v132 & 1) == 0)
              {
LABEL_82:
                unsigned int v44 = [v74 supportsEffectTiming];
                goto LABEL_85;
              }
            }
            unsigned int v44 = 1;
LABEL_85:
            objc_msgSend(v129, "minimumEffectDurationForEffectID:", objc_msgSend(v74, "effectID"));
            if (v75 > v35) {
              double v35 = v75;
            }
          }
          id v130 = [v126 countByEnumeratingWithState:&v156 objects:v167 count:16];
        }
        while (v130);
LABEL_91:
        int v76 = v44 ^ 1;
        if (v113 != 0.0) {
          int v76 = 1;
        }
        int v32 = v41 & v76;
        int v38 = v139;
LABEL_94:
        int v33 = v38;
LABEL_95:
        id v77 = [v28 transition];
        if (v77) {
          double v78 = v123;
        }
        else {
          double v78 = 0.0;
        }
        if ((v33 & v119) == 1)
        {
          double v79 = v112;
          if (v111 > 0.0 && v34 < 1.0) {
            double v79 = v111;
          }
          if (v136 >= 0.0)
          {
            double v81 = v34 / v136;
            double v82 = v109 / v34;
          }
          else
          {
            double v81 = v34 / v36;
            double v82 = v36 / v34;
          }
          if (v34 < 1.0) {
            double v81 = v82;
          }
          if (v81 > 1.1)
          {
            double v83 = v79 * v81;
            [v129 panoramaScaleOffsetForEffectID:v135];
            double v37 = v84 + v83 * (v37 - v84);
          }
        }
        if (v32)
        {
          double v85 = v125 + v78;
          if (v37 >= v125 + v78) {
            double v85 = v37;
          }
          if (v85 >= v35) {
            double v86 = v85;
          }
          else {
            double v86 = v35;
          }
          [v28 duration];
          if (v86 > 0.0 && v86 != v87) {
            [v28 setDuration:v86];
          }
        }
        if (v77) {
          objc_msgSend(objc_msgSend(v28, "transition"), "setDuration:", v123);
        }
        if (v120)
        {
          long long v150 = 0u;
          long long v151 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          id v89 = [v28 effects];
          id v90 = [v89 countByEnumeratingWithState:&v148 objects:v165 count:16];
          if (v90)
          {
            id v91 = v90;
            uint64_t v92 = *(void *)v149;
            do
            {
              for (k = 0; k != v91; k = (char *)k + 1)
              {
                if (*(void *)v149 != v92) {
                  objc_enumerationMutation(v89);
                }
                id v94 = *(void **)(*((void *)&v148 + 1) + 8 * (void)k);
                [v94 setPhaseInDuration:v125];
                [v28 outroTransitionDuration];
                objc_msgSend(v94, "setPhaseOutDuration:");
              }
              id v91 = [v89 countByEnumeratingWithState:&v148 objects:v165 count:16];
            }
            while (v91);
          }
        }
        [v28 outroTransitionDuration];
        double v15 = v95;
        uint64_t v27 = v124 + 1;
      }
      while ((id)(v124 + 1) != v122);
      id v122 = [obj countByEnumeratingWithState:&v160 objects:v168 count:16];
    }
    while (v122);
  }
  if (v107)
  {
    objc_msgSend(objc_msgSend(obj, "lastObject"), "outroTransitionDuration");
    double v97 = v96;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id v98 = [obj countByEnumeratingWithState:&v144 objects:v164 count:16];
    if (v98)
    {
      id v99 = v98;
      uint64_t v100 = *(void *)v145;
      do
      {
        for (m = 0; m != v99; m = (char *)m + 1)
        {
          if (*(void *)v145 != v100) {
            objc_enumerationMutation(obj);
          }
          uint64_t v102 = *(void **)(*((void *)&v144 + 1) + 8 * (void)m);
          [v102 outroTransitionDuration];
          double v104 = -(v97 + v103 - v108 * 2.0);
          if (v104 > 0.0)
          {
            [v102 duration];
            [v102 setDuration:v105 - v104];
          }
          [v102 outroTransitionDuration];
          double v97 = v106;
        }
        id v99 = [obj countByEnumeratingWithState:&v144 objects:v164 count:16];
      }
      while (v99);
    }
  }
}

- (void)matchDurationsForLayers:(id)a3 withOptions:(id)a4
{
  p_info = MRTiledSprite.info;
  id v6 = +[MPAuthoringUtilities styleFromOptions:a4];
  p_cache = MCConditionalAction.cache;
  id v8 = objc_msgSend(objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "descriptionForStyleID:", v6), "objectForKey:", @"layout");
  double v9 = (char *)[a3 count];
  if ((uint64_t)v9 >= 1)
  {
    double v10 = v9;
    double v11 = 0;
    id v35 = v8;
    do
    {
      id v12 = objc_msgSend(objc_msgSend(p_info + 186, "layerDescriptionForLayerWithZIndex:forStyle:", v11, v6), "objectForKey:", @"matchDuration");
      if (v12)
      {
        id v13 = v12;
        id v14 = [a3 objectAtIndex:v11];
        id v15 = objc_msgSend(objc_msgSend(p_cache + 428, "sharedManager"), "layerIDForLayerIndex:ofStyle:", v11, v6);
        if (![v14 layerID]
          || objc_msgSend(v15, "isEqualToString:", objc_msgSend(v14, "layerID")))
        {
          double v16 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(v8, "objectForKey:", v13), "objectForKey:", @"zIndex"), "integerValue");
          if ((uint64_t)v16 < (uint64_t)v10)
          {
            id v17 = a3;
            objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v16), "duration");
            double v19 = v18;
            [v14 duration];
            double v21 = v20;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v22 = [v14 effectContainers];
            id v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
            if (v23)
            {
              id v24 = v23;
              uint64_t v25 = *(void *)v37;
              double v26 = v19 / v21;
              do
              {
                for (id i = 0; i != v24; id i = (char *)i + 1)
                {
                  if (*(void *)v37 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  long long v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                  if ((uint64_t)[v28 countOfEffects] >= 1)
                  {
                    [v28 duration];
                    [v28 setDuration:v26 * v29];
                  }
                }
                id v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
              }
              while (v24);
            }
            [v14 duration];
            p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
            a3 = v17;
            p_cache = (void **)(MCConditionalAction + 16);
            id v8 = v35;
            if (v19 != v30)
            {
              id v31 = objc_msgSend(objc_msgSend(v14, "effectContainers"), "lastObject");
              [v31 duration];
              double v33 = v32;
              [v14 duration];
              [v31 setDuration:v33 + v19 - v34];
            }
          }
        }
      }
      ++v11;
    }
    while (v11 != v10);
  }
}

- (void)fillDurationsForLayers:(id)a3 withOptions:(id)a4
{
  id v5 = +[MPAuthoringUtilities styleFromOptions:a4];
  id v6 = objc_msgSend(objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "descriptionForStyleID:", v5), "objectForKey:", @"layout");
  double v7 = (char *)[a3 count];
  if ((uint64_t)v7 >= 1)
  {
    id v8 = v7;
    for (id i = 0; i != v8; ++i)
    {
      id v10 = objc_msgSend(+[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:](MPAuthoringUtilities, "layerDescriptionForLayerWithZIndex:forStyle:", i, v5), "objectForKey:", @"fillDuration");
      if (v10)
      {
        id v11 = v10;
        id v12 = [a3 objectAtIndex:i];
        id v13 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIDForLayerIndex:ofStyle:", i, v5);
        if (![v12 layerID]
          || objc_msgSend(v13, "isEqualToString:", objc_msgSend(v12, "layerID")))
        {
          id v14 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(v6, "objectForKey:", v11), "objectForKey:", @"zIndex"), "integerValue");
          if ((uint64_t)v14 < (uint64_t)v8)
          {
            objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v14), "duration");
            double v16 = v15;
            [v12 duration];
            double v18 = v17;
            id v19 = objc_msgSend(objc_msgSend(v12, "effectContainers"), "lastObject");
            if (v19 && (double v20 = v19, !objc_msgSend(objc_msgSend(v19, "effects"), "count")))
            {
              [v20 startTime];
              [v20 setDuration:v18 + v16 - v18 - v22];
            }
            else
            {
              id v21 = +[MPEffectContainer effectContainer];
              [v21 setDuration:v16 - v18];
              [v12 addEffectContainer:v21];
            }
          }
        }
      }
    }
  }
}

- (void)checkForOffsetsForLayers:(id)a3 withOptions:(id)a4
{
  if ([a3 count] == (char *)&dword_0 + 1)
  {
    id v5 = [a3 lastObject];
    if (objc_msgSend(objc_msgSend(v5, "effectContainers"), "count"))
    {
      id v6 = objc_msgSend(objc_msgSend(v5, "effectContainers"), "objectAtIndex:", 0);
      if (!objc_msgSend(objc_msgSend(v6, "effects"), "count") && !objc_msgSend(v6, "transition"))
      {
        double v7 = +[NSIndexSet indexSetWithIndex:0];
        [v5 removeEffectContainersAtIndices:v7];
      }
    }
  }
}

- (void)beatAlignLayer:(id)a3 toBeats:(id)a4 withOptions:(id)a5
{
  -[MPAuthoringController beatAlignEffectContainers:toBeats:withOptions:](self, "beatAlignEffectContainers:toBeats:withOptions:", [a3 effectContainers], a4, a5);
  +[MPAuthoringUtilities audioDurationFromOptions:a5];
  double v10 = v9;
  if (!+[MPAuthoringUtilities layerCanSkipScaleCalculation:withOptions:](MPAuthoringUtilities, "layerCanSkipScaleCalculation:withOptions:", a3, a5)&& v10 > 0.0&& (char *)+[MPAuthoringUtilities audioScalingModeFromOptions:a5] == (char *)&dword_0 + 1)
  {
    id v11 = [a4 count];
    +[MPAuthoringUtilities minimumEffectDurationFromOptions:a5];
    double v13 = v12;
    +[MPAuthoringUtilities minimumTransitionDurationFromOptions:a5];
    double v15 = v14;
    double v16 = (double)(uint64_t)[a3 countOfEffectContainers];
    BOOL v18 = (double)(unint64_t)[a4 count] * 0.5 <= v16;
    double v17 = (double)(unint64_t)v11 / v10;
    BOOL v18 = v18 || v17 <= v13 - v15;
    if (!v18)
    {
      -[MPAuthoringController scaleLayerToMatchAudio:withBeats:withOptions:](self, "scaleLayerToMatchAudio:withBeats:withOptions:", a3, a4, a5, v17);
      [a3 duration];
      double v17 = vabdd_f64(v20, v10);
      if (v17 > 1.0)
      {
        -[MPAuthoringController beatAlignEffectContainers:toBeats:withOptions:](self, "beatAlignEffectContainers:toBeats:withOptions:", [a3 effectContainers], a4, a5);
        [(MPAuthoringController *)self scaleLayerToMatchAudio:a3 withBeats:a4 withOptions:a5];
        [a3 duration];
        if (vabdd_f64(v17, v10) > 1.0)
        {
          double v21 = v17 - v10;
          +[MPAuthoringUtilities minimumEffectDurationFromOptions:a5];
          double v23 = v22;
          id v24 = objc_msgSend(objc_msgSend(a3, "effectContainers"), "lastObject");
          [v24 duration];
          double v17 = v25 - v21;
          if (v17 >= v23) {
            objc_msgSend(v24, "setDuration:");
          }
        }
      }
    }
    objc_msgSend(a3, "duration", v17);
    if (vabdd_f64(v19, v10) > 1.0)
    {
      [a3 setSkipTimeCalculations:1];
      -[MPAuthoringController scaleDurationsInEffectContainers:withOptions:](self, "scaleDurationsInEffectContainers:withOptions:", [a3 effectContainers], a5);
      [a3 setSkipTimeCalculations:0];
      [(MPAuthoringController *)self scaleLayerToMatchAudio:a3 withOptions:a5];
    }
  }
}

- (void)scaleLayerToMatchAudio:(id)a3 withOptions:(id)a4
{
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:a4];
  double v7 = v6;
  +[MPAuthoringUtilities minimumTransitionDurationFromOptions:a4];
  double v9 = v8;
  +[MPAuthoringUtilities maximumTransitionDurationFromOptions:a4];
  double v11 = v10;
  +[MPAuthoringUtilities audioDurationFromOptions:a4];
  double v13 = v12;
  +[MPAuthoringUtilities audioDurationFactorFromOptions:a4];
  double v15 = v14;
  id v126 = a3;
  [a3 duration];
  double v17 = v16;
  id v141 = +[MPEffectManager sharedManager];
  unsigned int v132 = +[MPAuthoringUtilities matchPhasesWithTransitionFromOptions:a4];
  unsigned int v142 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:a4];
  id v18 = +[MPAuthoringUtilities customDurationsFromOptions:a4];
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kMPAuthoringMinimumDuration), "doubleValue");
  double v20 = v19;
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", kMPAuthoringMaximumDuration), "doubleValue");
  if (v15 <= -1.0 || v21 <= 0.0)
  {
    if (v13 >= v20)
    {
      if (v21 <= 0.0 || v13 <= v21) {
        double v20 = v13;
      }
      else {
        double v20 = v21;
      }
    }
  }
  else
  {
    double v20 = v20 + (v21 - v20) * v15;
  }
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id v23 = [a3 effectContainers];
  id v24 = [v23 countByEnumeratingWithState:&v183 objects:v197 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v184;
    double v27 = 0.0;
    do
    {
      for (id i = 0; i != v25; id i = (char *)i + 1)
      {
        if (*(void *)v184 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v183 + 1) + 8 * i) outroTransitionDuration];
        double v27 = v27 + v29;
      }
      id v25 = [v23 countByEnumeratingWithState:&v183 objects:v197 count:16];
    }
    while (v25);
  }
  else
  {
    double v27 = 0.0;
  }
  if (v27 <= v20)
  {
    id v133 = [v126 effectContainers];
    id v58 = [v133 objectAtIndex:0];
    if ([v58 countOfEffects])
    {
      id v125 = 0;
      double v59 = 0.0;
    }
    else
    {
      id v125 = v58;
      [v58 duration];
      double v59 = v60;
    }
    id v61 = [v133 lastObject];
    if ((uint64_t)[v61 countOfEffects] >= 1
      && ((id v62 = +[MPAuthoringUtilities outroEffectIDFromOptions:](MPAuthoringUtilities, "outroEffectIDFromOptions:", a4), v63 = +[MPAuthoringUtilities scaleOutroEffectFromOptions:](MPAuthoringUtilities, "scaleOutroEffectFromOptions:", a4), !objc_msgSend(v62, "hasPrefix:", objc_msgSend(objc_msgSend(objc_msgSend(v61, "effects"), "lastObject"), "effectID")))|| (v63 & 1) != 0))
    {
      id v65 = 0;
    }
    else
    {
      [v61 duration];
      double v59 = v59 + v64;
      id v65 = v61;
    }
    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    id v66 = [v133 countByEnumeratingWithState:&v167 objects:v193 count:16];
    double v67 = 0.0;
    id v124 = v65;
    if (!v66)
    {
      double v70 = 0.0;
      goto LABEL_127;
    }
    id v68 = v66;
    uint64_t v69 = *(void *)v168;
    double v70 = 0.0;
    id v71 = v125;
    uint64_t v120 = *(void *)v168;
    while (1)
    {
      id v72 = 0;
      id v122 = v68;
      do
      {
        if (*(void *)v168 != v69) {
          objc_enumerationMutation(v133);
        }
        id v73 = *(id *)(*((void *)&v167 + 1) + 8 * (void)v72);
        if (v73 != v71 && v73 != v65)
        {
          uint64_t v127 = *(void **)(*((void *)&v167 + 1) + 8 * (void)v72);
          id obja = v72;
          long long v165 = 0u;
          long long v166 = 0u;
          long long v163 = 0u;
          long long v164 = 0u;
          id v139 = [v73 effects];
          id v75 = [v139 countByEnumeratingWithState:&v163 objects:v192 count:16];
          if (v75)
          {
            id v76 = v75;
            LOBYTE(v77) = 0;
            int v135 = 0;
            uint64_t v78 = *(void *)v164;
            do
            {
              for (j = 0; j != v76; j = (char *)j + 1)
              {
                if (*(void *)v164 != v78) {
                  objc_enumerationMutation(v139);
                }
                unsigned int v80 = *(void **)(*((void *)&v163 + 1) + 8 * (void)j);
                long long v159 = 0u;
                long long v160 = 0u;
                long long v161 = 0u;
                long long v162 = 0u;
                id v81 = objc_msgSend(v80, "slides", v120);
                id v82 = [v81 countByEnumeratingWithState:&v159 objects:v191 count:16];
                if (!v82)
                {
LABEL_106:
                  int v86 = 1;
                  if (v77) {
                    goto LABEL_110;
                  }
                  goto LABEL_107;
                }
                id v83 = v82;
                uint64_t v84 = *(void *)v160;
LABEL_100:
                uint64_t v85 = 0;
                while (1)
                {
                  if (*(void *)v160 != v84) {
                    objc_enumerationMutation(v81);
                  }
                  if (objc_msgSend(v18, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v159 + 1) + 8 * v85), "path")))
                  {
                    break;
                  }
                  if (v83 == (id)++v85)
                  {
                    id v83 = [v81 countByEnumeratingWithState:&v159 objects:v191 count:16];
                    if (!v83) {
                      goto LABEL_106;
                    }
                    goto LABEL_100;
                  }
                }
                int v86 = 0;
                if (v77)
                {
LABEL_110:
                  unsigned int v77 = 1;
                  goto LABEL_111;
                }
LABEL_107:
                if ((uint64_t)[v80 countOfSlides] < 1)
                {
                  unsigned int v77 = 0;
                }
                else
                {
                  unsigned int v77 = v86 & ([v80 hasMovies] ^ 1);
LABEL_111:
                  if ((v142 & v77) == 1)
                  {
                    if ((objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "skipPanoramaScaleForEffectID:", objc_msgSend(v80, "effectID")) & 1) == 0)v135 |= objc_msgSend(v80, "hasPanoramasInDocument:", self->_authoredDocument); {
                    unsigned int v77 = 1;
                    }
                  }
                }
              }
              id v76 = [v139 countByEnumeratingWithState:&v163 objects:v192 count:16];
            }
            while (v76);
            if ((v77 & v135) == 1)
            {
              [v127 duration];
              double v70 = v70 + v87;
LABEL_122:
              id v65 = v124;
              id v71 = v125;
              uint64_t v69 = v120;
              id v68 = v122;
              id v72 = obja;
              goto LABEL_123;
            }
            if (v77) {
              goto LABEL_122;
            }
          }
          objc_msgSend(v127, "duration", v120);
          double v59 = v59 + v88;
          goto LABEL_122;
        }
LABEL_123:
        id v72 = (char *)v72 + 1;
      }
      while (v72 != v68);
      id v68 = [v133 countByEnumeratingWithState:&v167 objects:v193 count:16];
      if (!v68)
      {
LABEL_127:
        double v89 = v27 + v17 - v59 - v70;
        if (v89 > 0.0)
        {
          double v90 = v20 - v59;
          double v67 = (v27 + v20 - v59 - v70) / v89;
          if (v67 > 1.0)
          {
            if (v70 <= 0.0)
            {
LABEL_136:
              int v136 = 0;
              goto LABEL_137;
            }
LABEL_135:
            int v136 = 1;
            double v67 = (v27 + v90) / (v27 + v17 - v59);
LABEL_137:
            long long v157 = 0u;
            long long v158 = 0u;
            long long v155 = 0u;
            long long v156 = 0u;
            id v123 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v155, v190, 16, v120);
            if (!v123) {
              return;
            }
            uint64_t v121 = *(void *)v156;
            while (1)
            {
              for (id k = 0; k != v123; id k = (char *)k + 1)
              {
                if (*(void *)v156 != v121) {
                  objc_enumerationMutation(v133);
                }
                uint64_t v92 = *(void **)(*((void *)&v155 + 1) + 8 * (void)k);
                long long v151 = 0u;
                long long v152 = 0u;
                long long v153 = 0u;
                long long v154 = 0u;
                id v140 = objc_msgSend(v92, "effects", v121);
                id v93 = [v140 countByEnumeratingWithState:&v151 objects:v189 count:16];
                if (v93)
                {
                  id v94 = v93;
                  id v128 = v92;
                  id objb = k;
                  LOBYTE(v95) = 0;
                  uint64_t v96 = *(void *)v152;
                  do
                  {
                    for (m = 0; m != v94; m = (char *)m + 1)
                    {
                      if (*(void *)v152 != v96) {
                        objc_enumerationMutation(v140);
                      }
                      id v98 = *(void **)(*((void *)&v151 + 1) + 8 * (void)m);
                      long long v147 = 0u;
                      long long v148 = 0u;
                      long long v149 = 0u;
                      long long v150 = 0u;
                      id v99 = [v98 slides];
                      id v100 = [v99 countByEnumeratingWithState:&v147 objects:v188 count:16];
                      if (!v100)
                      {
LABEL_155:
                        int v104 = 1;
                        if (v95) {
                          goto LABEL_159;
                        }
                        goto LABEL_156;
                      }
                      id v101 = v100;
                      uint64_t v102 = *(void *)v148;
LABEL_149:
                      uint64_t v103 = 0;
                      while (1)
                      {
                        if (*(void *)v148 != v102) {
                          objc_enumerationMutation(v99);
                        }
                        if (objc_msgSend(v18, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v147 + 1) + 8 * v103), "path")))
                        {
                          break;
                        }
                        if (v101 == (id)++v103)
                        {
                          id v101 = [v99 countByEnumeratingWithState:&v147 objects:v188 count:16];
                          if (!v101) {
                            goto LABEL_155;
                          }
                          goto LABEL_149;
                        }
                      }
                      int v104 = 0;
                      if (v95)
                      {
LABEL_159:
                        unsigned int v95 = 1;
                        goto LABEL_160;
                      }
LABEL_156:
                      if ((uint64_t)[v98 countOfSlides] < 1)
                      {
                        unsigned int v95 = 0;
                      }
                      else
                      {
                        unsigned int v95 = v104 & ([v98 hasMovies] ^ 1);
LABEL_160:
                        if ((v142 & v95) == 1)
                        {
                          if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "skipPanoramaScaleForEffectID:", objc_msgSend(v98, "effectID")))unsigned int v95 = 1; {
                          else
                          }
                            unsigned int v95 = v136 | [v98 hasPanoramasInDocument:self->_authoredDocument] ^ 1;
                        }
                      }
                    }
                    id v94 = [v140 countByEnumeratingWithState:&v151 objects:v189 count:16];
                  }
                  while (v94);
                  id k = objb;
                  if (v128 != v125 && v128 != v124 && ((v95 ^ 1) & 1) == 0)
                  {
                    long long v145 = 0u;
                    long long v146 = 0u;
                    long long v143 = 0u;
                    long long v144 = 0u;
                    id v105 = [v128 effects];
                    id v106 = [v105 countByEnumeratingWithState:&v143 objects:v187 count:16];
                    double v107 = v7;
                    if (v106)
                    {
                      id v108 = v106;
                      uint64_t v109 = *(void *)v144;
                      double v107 = v7;
                      do
                      {
                        for (n = 0; n != v108; n = (char *)n + 1)
                        {
                          if (*(void *)v144 != v109) {
                            objc_enumerationMutation(v105);
                          }
                          objc_msgSend(v141, "minimumEffectDurationForEffectID:", objc_msgSend(*(id *)(*((void *)&v143 + 1) + 8 * (void)n), "effectID"));
                          if (v111 > v107) {
                            double v107 = v111;
                          }
                        }
                        id v108 = [v105 countByEnumeratingWithState:&v143 objects:v187 count:16];
                      }
                      while (v108);
                    }
                    [v128 duration];
                    double v113 = v112;
                    [v128 introTransitionDuration];
                    double v115 = v114;
                    if (objc_msgSend(objc_msgSend(v133, "lastObject"), "transition") && !objc_msgSend(v128, "index"))
                    {
                      [v128 outroTransitionDuration];
                      double v115 = v116;
                    }
                    double v117 = v67 * v113;
                    [v128 outroTransitionDuration];
                    double v119 = v115 + v118;
                    if (v117 >= v119) {
                      double v119 = v117;
                    }
                    if (v119 < v107) {
                      double v119 = v107;
                    }
                    [v128 setDuration:v119];
                  }
                }
              }
              id v123 = [v133 countByEnumeratingWithState:&v155 objects:v190 count:16];
              if (!v123) {
                return;
              }
            }
          }
          if (v67 != 0.0) {
            goto LABEL_136;
          }
        }
        int v136 = 0;
        if (v20 <= v17 || v70 <= 0.0) {
          goto LABEL_137;
        }
        double v90 = v20 - v59;
        goto LABEL_135;
      }
    }
  }
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  id obj = [v126 effectContainers];
  id v138 = [obj countByEnumeratingWithState:&v179 objects:v196 count:16];
  if (!v138) {
    return;
  }
  uint64_t v134 = *(void *)v180;
  double v30 = v20 / v27;
  do
  {
    for (id ii = 0; ii != v138; id ii = (char *)ii + 1)
    {
      if (*(void *)v180 != v134) {
        objc_enumerationMutation(obj);
      }
      double v32 = *(void **)(*((void *)&v179 + 1) + 8 * (void)ii);
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      id v33 = [v32 effects];
      id v34 = [v33 countByEnumeratingWithState:&v175 objects:v195 count:16];
      if (!v34)
      {
        unsigned int v36 = 0;
        double v38 = v7;
        goto LABEL_46;
      }
      id v35 = v34;
      LOBYTE(v36) = 0;
      uint64_t v37 = *(void *)v176;
      double v38 = v7;
      do
      {
        for (jj = 0; jj != v35; jj = (char *)jj + 1)
        {
          if (*(void *)v176 != v37) {
            objc_enumerationMutation(v33);
          }
          BOOL v40 = *(void **)(*((void *)&v175 + 1) + 8 * (void)jj);
          objc_msgSend(v141, "minimumEffectDurationForEffectID:", objc_msgSend(v40, "effectID"));
          if (v41 > v38) {
            double v38 = v41;
          }
          if (v36)
          {
            unsigned int v36 = 1;
          }
          else
          {
            if ((uint64_t)[v40 countOfSlides] < 1)
            {
              unsigned int v36 = 0;
              continue;
            }
            unsigned int v36 = [v40 hasMovies] ^ 1;
          }
          if ((v142 & v36) == 1)
          {
            if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "skipPanoramaScaleForEffectID:", objc_msgSend(v40, "effectID")))unsigned int v36 = 1; {
            else
            }
              unsigned int v36 = [v40 hasPanoramasInDocument:self->_authoredDocument] ^ 1;
          }
        }
        id v35 = [v33 countByEnumeratingWithState:&v175 objects:v195 count:16];
      }
      while (v35);
LABEL_46:
      [v32 outroTransitionDuration];
      double v43 = v42;
      if ([v32 transition])
      {
        double v44 = v30 * v43;
        if (v30 * v43 < v9) {
          double v44 = v9;
        }
        if (v44 <= v11) {
          double v45 = v44;
        }
        else {
          double v45 = v11;
        }
        objc_msgSend(objc_msgSend(v32, "transition"), "setDuration:", v45);
        if (v132)
        {
          long long v173 = 0u;
          long long v174 = 0u;
          long long v171 = 0u;
          long long v172 = 0u;
          id v46 = [v32 effects];
          id v47 = [v46 countByEnumeratingWithState:&v171 objects:v194 count:16];
          if (v47)
          {
            id v48 = v47;
            uint64_t v49 = *(void *)v172;
            do
            {
              for (kid k = 0; kk != v48; kid k = (char *)kk + 1)
              {
                if (*(void *)v172 != v49) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v51 = *(void **)(*((void *)&v171 + 1) + 8 * (void)kk);
                [v51 setPhaseInDuration:v9];
                [v51 setPhaseOutDuration:v9];
              }
              id v48 = [v46 countByEnumeratingWithState:&v171 objects:v194 count:16];
            }
            while (v48);
          }
        }
        if (v36)
        {
          [v32 introTransitionDuration];
          double v53 = v52;
          if (objc_msgSend(objc_msgSend(objc_msgSend(v126, "effectContainers"), "lastObject"), "transition")
            && ![v32 index])
          {
            [v32 outroTransitionDuration];
            double v53 = v54;
          }
          double v55 = v45 + v53;
LABEL_70:
          if (v55 < v38) {
            double v55 = v38;
          }
          [v32 setDuration:v55];
        }
      }
      else
      {
        [v32 introTransitionDuration];
        if (v56 == 0.0) {
          unsigned int v57 = 0;
        }
        else {
          unsigned int v57 = v36;
        }
        if (v57 == 1)
        {
          [v32 introTransitionDuration];
          goto LABEL_70;
        }
      }
    }
    id v138 = [obj countByEnumeratingWithState:&v179 objects:v196 count:16];
  }
  while (v138);
}

- (void)scaleLayerToMatchAudio:(id)a3 withBeats:(id)a4 withOptions:(id)a5
{
  +[MPAuthoringUtilities audioDurationFromOptions:a5];
  double v10 = v9;
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:a5];
  double v12 = v11;
  id v113 = +[MPEffectManager sharedManager];
  unsigned int v13 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:a5];
  [a3 duration];
  id v102 = a4;
  if (v14 < v10)
  {
    id v100 = (char *)[a4 count];
    uint64_t v138 = 0x7FFFFFFFFFFFFFFFLL;
    [a3 duration];
    -[MPAuthoringController findClosestBeatForTime:inBeats:atIndex:](self, "findClosestBeatForTime:inBeats:atIndex:", a4, &v138);
    uint64_t v97 = v138;
    id v99 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"duration" ascending:1];
    id v103 = objc_alloc_init((Class)NSMutableArray);
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id obj = [a3 effectContainers];
    id v109 = [obj countByEnumeratingWithState:&v134 objects:v144 count:16];
    if (!v109) {
      goto LABEL_27;
    }
    id v107 = *(id *)v135;
    while (1)
    {
      for (id i = 0; i != v109; id i = (char *)i + 1)
      {
        if (*(id *)v135 != v107) {
          objc_enumerationMutation(obj);
        }
        double v16 = *(void **)(*((void *)&v134 + 1) + 8 * i);
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        id v17 = objc_msgSend(v16, "effects", v97);
        id v18 = [v17 countByEnumeratingWithState:&v130 objects:v143 count:16];
        if (v18)
        {
          id v19 = v18;
          double v111 = v16;
          LOBYTE(v20) = 0;
          uint64_t v21 = *(void *)v131;
          while (1)
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v131 != v21) {
                objc_enumerationMutation(v17);
              }
              id v23 = *(void **)(*((void *)&v130 + 1) + 8 * (void)j);
              if (v20)
              {
                unsigned int v20 = 1;
              }
              else
              {
                if ((uint64_t)[*(id *)(*((void *)&v130 + 1) + 8 * (void)j) countOfSlides] < 1)
                {
                  unsigned int v20 = 0;
                  continue;
                }
                unsigned int v20 = [v23 hasMovies] ^ 1;
              }
              if ((v13 & v20) == 1)
              {
                if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "skipPanoramaScaleForEffectID:", objc_msgSend(v23, "effectID")))unsigned int v20 = 1; {
                else
                }
                  unsigned int v20 = [v23 hasPanoramasInDocument:self->_authoredDocument] ^ 1;
              }
            }
            id v19 = [v17 countByEnumeratingWithState:&v130 objects:v143 count:16];
            if (!v19)
            {
              if (v20) {
                [v103 addObject:v111];
              }
              break;
            }
          }
        }
      }
      id v109 = [obj countByEnumeratingWithState:&v134 objects:v144 count:16];
      if (!v109)
      {
LABEL_27:
        id v24 = objc_msgSend(v103, "sortedArrayUsingDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v99, v97));

        if ([v24 count] && (uint64_t)&v100[-v98] >= 1)
        {
          unint64_t v25 = 0;
          do
          {
            id v26 = [v24 count];
            unint64_t v27 = v25;
            if ((unint64_t)v26 <= v25) {
              unint64_t v27 = v25 % (unint64_t)objc_msgSend(v24, "count", v25);
            }
            id v28 = [v24 objectAtIndex:v27];
            long long v126 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            id v29 = [v28 effects];
            id v30 = [v29 countByEnumeratingWithState:&v126 objects:v142 count:16];
            double v31 = v12;
            if (v30)
            {
              id v32 = v30;
              uint64_t v33 = *(void *)v127;
              double v31 = v12;
              do
              {
                for (id k = 0; k != v32; id k = (char *)k + 1)
                {
                  if (*(void *)v127 != v33) {
                    objc_enumerationMutation(v29);
                  }
                  objc_msgSend(v113, "minimumEffectDurationForEffectID:", objc_msgSend(*(id *)(*((void *)&v126 + 1) + 8 * (void)k), "effectID"));
                  if (v35 > v31) {
                    double v31 = v35;
                  }
                }
                id v32 = [v29 countByEnumeratingWithState:&v126 objects:v142 count:16];
              }
              while (v32);
            }
            [v28 startTime];
            double v37 = v36;
            [v28 duration];
            [(MPAuthoringController *)self findClosestBeatForTime:v102 inBeats:&v138 atIndex:v37 + v38];
            if ((char *)v138 != v100 - 1)
            {
              objc_msgSend(objc_msgSend(v102, "objectAtIndex:", v138 + 1), "doubleValue");
              double v40 = v39;
              objc_msgSend(objc_msgSend(v102, "objectAtIndex:", v138), "doubleValue");
              double v42 = v40 - v41;
              [v28 duration];
              double v44 = v43 + v42;
              [v28 outroTransitionDuration];
              double v46 = v45;
              [v28 introTransitionDuration];
              if (v44 >= v46 + v47)
              {
                if (v44 >= v31) {
                  double v48 = v44;
                }
                else {
                  double v48 = v31;
                }
                [v28 setDuration:v48];
              }
            }
            ++v25;
          }
          while ((char *)v25 != &v100[-v98]);
        }
        return;
      }
    }
  }
  if (v14 > v10)
  {
    double v49 = v14;
    objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 0), "doubleValue");
    double v51 = v50;
    double v52 = v49 - v10 + v50;
    double v53 = (char *)[a4 count];
    int64_t v54 = 0;
    if (v51 < v52 && (uint64_t)v53 >= 2)
    {
      int64_t v54 = 0;
      double v56 = v53 - 1;
      do
        objc_msgSend(objc_msgSend(a4, "objectAtIndex:", ++v54), "doubleValue");
      while (v57 < v52 && v54 < (uint64_t)v56);
    }
    unint64_t v104 = v54;
    uint64_t v138 = v54;
    id v101 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"duration" ascending:0];
    id obja = objc_alloc_init((Class)NSMutableArray);
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v108 = [a3 effectContainers];
    id v112 = [v108 countByEnumeratingWithState:&v122 objects:v141 count:16];
    if (v112)
    {
      uint64_t v110 = *(void *)v123;
      do
      {
        for (m = 0; m != v112; m = (char *)m + 1)
        {
          if (*(void *)v123 != v110) {
            objc_enumerationMutation(v108);
          }
          double v60 = *(void **)(*((void *)&v122 + 1) + 8 * (void)m);
          long long v118 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          id v61 = [v60 effects];
          id v62 = [v61 countByEnumeratingWithState:&v118 objects:v140 count:16];
          if (v62)
          {
            id v63 = v62;
            LOBYTE(v64) = 0;
            uint64_t v65 = *(void *)v119;
            do
            {
              for (n = 0; n != v63; n = (char *)n + 1)
              {
                if (*(void *)v119 != v65) {
                  objc_enumerationMutation(v61);
                }
                if (v64)
                {
                  int v64 = 1;
                }
                else
                {
                  double v67 = *(void **)(*((void *)&v118 + 1) + 8 * (void)n);
                  if ((uint64_t)[v67 countOfSlides] < 1) {
                    unsigned int v68 = 0;
                  }
                  else {
                    unsigned int v68 = [v67 hasMovies] ^ 1;
                  }
                  if ((v13 ^ 1 | v68)) {
                    int v64 = v13 | v68;
                  }
                  else {
                    int v64 = [v67 hasPanoramasInDocument:self->_authoredDocument] ^ 1;
                  }
                }
              }
              id v63 = [v61 countByEnumeratingWithState:&v118 objects:v140 count:16];
            }
            while (v63);
            if (v64) {
              [obja addObject:v60];
            }
          }
        }
        id v112 = [v108 countByEnumeratingWithState:&v122 objects:v141 count:16];
      }
      while (v112);
    }
    uint64_t v69 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", objc_msgSend(obja, "sortedArrayUsingDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v101)));

    if ([(NSMutableArray *)v69 count])
    {
      if (v104 <= (unint64_t)[(NSMutableArray *)v69 count])
      {
        if (!v104) {
          return;
        }
      }
      else
      {
        double v70 = (char *)(v104 - (void)[(NSMutableArray *)v69 count]);
        if (v70 >= [(NSMutableArray *)v69 count]) {
          double v70 = (char *)[(NSMutableArray *)v69 count] - 1;
        }
        [(NSMutableArray *)v69 addObjectsFromArray:[(NSMutableArray *)v69 objectsAtIndexes:+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v70)]];
      }
      unint64_t v71 = 0;
      do
      {
        id v72 = [(NSMutableArray *)v69 count];
        unint64_t v73 = v71;
        if ((unint64_t)v72 <= v71) {
          unint64_t v73 = v71 % (unint64_t)[(NSMutableArray *)v69 count];
        }
        id v74 = [(NSMutableArray *)v69 objectAtIndex:v73];
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id v75 = [v74 effects];
        id v76 = [v75 countByEnumeratingWithState:&v114 objects:v139 count:16];
        double v77 = v12;
        if (v76)
        {
          id v78 = v76;
          uint64_t v79 = *(void *)v115;
          double v77 = v12;
          do
          {
            for (id ii = 0; ii != v78; id ii = (char *)ii + 1)
            {
              if (*(void *)v115 != v79) {
                objc_enumerationMutation(v75);
              }
              objc_msgSend(v113, "minimumEffectDurationForEffectID:", objc_msgSend(*(id *)(*((void *)&v114 + 1) + 8 * (void)ii), "effectID"));
              if (v81 > v77) {
                double v77 = v81;
              }
            }
            id v78 = [v75 countByEnumeratingWithState:&v114 objects:v139 count:16];
          }
          while (v78);
        }
        [v74 startTime];
        double v83 = v82;
        [v74 duration];
        [(MPAuthoringController *)self findClosestBeatForTime:v102 inBeats:&v138 atIndex:v83 + v84];
        if (v138)
        {
          objc_msgSend(objc_msgSend(v102, "objectAtIndex:"), "doubleValue");
          double v86 = v85;
          objc_msgSend(objc_msgSend(v102, "objectAtIndex:", v138 - 1), "doubleValue");
          double v88 = v86 - v87;
          [v74 duration];
          double v90 = v89;
          [v74 duration];
          double v92 = v91 - v88;
          [v74 outroTransitionDuration];
          double v94 = v93;
          [v74 introTransitionDuration];
          if (v92 >= v94 + v95)
          {
            double v96 = v90 - v88;
            if (v90 - v88 < v77) {
              double v96 = v77;
            }
            [v74 setDuration:v96];
          }
        }
        ++v71;
      }
      while (v71 != v104);
    }
  }
}

- (void)beatAlignEffectContainers:(id)a3 toBeats:(id)a4 withOptions:(id)a5
{
  id v82 = +[MPEffectManager sharedManager];
  unsigned __int8 v81 = +[MPAuthoringUtilities lockTransitionDurationFromOptions:a5];
  +[MPAuthoringUtilities minimumTransitionDurationFromOptions:a5];
  double v78 = v9;
  +[MPAuthoringUtilities maximumTransitionDurationFromOptions:a5];
  double v77 = v10;
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:a5];
  double v90 = v11;
  unsigned int v80 = +[MPAuthoringUtilities matchPhasesWithTransitionFromOptions:a5];
  unsigned int v85 = +[MPAuthoringUtilities canAdjustPhaseDurations:a5];
  unsigned int v12 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:a5];
  id v79 = [a4 count];
  uint64_t v99 = 0;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = a3;
  id v89 = [a3 countByEnumeratingWithState:&v95 objects:v101 count:16];
  if (v89)
  {
    double v87 = 0;
    uint64_t v88 = *(void *)v96;
    do
    {
      for (id i = 0; i != v89; id i = (char *)i + 1)
      {
        if (*(void *)v96 != v88) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v15 = [v14 effects];
        id v16 = [v15 countByEnumeratingWithState:&v91 objects:v100 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v92;
          while (2)
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v92 != v18) {
                objc_enumerationMutation(v15);
              }
              unsigned int v20 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
              if (([v20 hasMovies] & 1) != 0
                || v12 && ([v20 hasPanoramasInDocument:self->_authoredDocument] & 1) != 0)
              {
                [v14 countOfEffects];
                goto LABEL_80;
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v91 objects:v100 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
        if ((uint64_t)[v14 countOfEffects] >= 1)
        {
          id v21 = objc_msgSend(objc_msgSend(v14, "effects"), "objectAtIndex:", 0);
          objc_msgSend(v82, "minimumEffectDurationForEffectID:", objc_msgSend(v21, "effectID"));
          if (v22 <= v90) {
            double v23 = v90;
          }
          else {
            double v23 = v22;
          }
          [v14 startTime];
          double v25 = v24;
          [v21 mainDuration];
          double v27 = v26;
          [v21 phaseInDuration];
          double v29 = v28;
          [v21 phaseOutDuration];
          double v31 = v30;
          [v14 outroTransitionDuration];
          double v83 = v32;
          if (v29 == 0.0) {
            unsigned int v33 = 0;
          }
          else {
            unsigned int v33 = v85;
          }
          double v34 = v25 + v29;
          if (v33 == 1)
          {
            [(MPAuthoringController *)self findClosestBeatForTime:a4 inBeats:&v99 atIndex:v25 + v29];
            double v34 = v35;
          }
          [(MPAuthoringController *)self findClosestBeatForTime:a4 inBeats:&v99 atIndex:v27 + v34];
          double v37 = v36;
          if (v31 == 0.0) {
            unsigned int v38 = 0;
          }
          else {
            unsigned int v38 = v85;
          }
          double v39 = v31 + v36;
          if (v38 == 1)
          {
            [(MPAuthoringController *)self findClosestBeatForTime:a4 inBeats:&v99 atIndex:v31 + v36];
            double v39 = v40;
          }
          uint64_t v41 = v99;
          if (v29 == 0.0) {
            double v42 = 0.0;
          }
          else {
            double v42 = v34 - v25;
          }
          double v43 = v37 - v42 - v25;
          if (v31 == 0.0) {
            double v44 = 0.0;
          }
          else {
            double v44 = v39 - v43 - v42 - v25;
          }
          double v84 = v42;
          double v45 = v42 + v43 + v44;
          if (v45 >= v23)
          {
            double v58 = v42;
          }
          else
          {
            if (v99 + 1 < (uint64_t)v79)
            {
              uint64_t v46 = v99 + 2;
              do
              {
                objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v46 - 1), "doubleValue");
                double v48 = v47;
                objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v99), "doubleValue");
                double v50 = v48 - v49;
                double v51 = v37 + v50;
                double v52 = v43 + v50;
                double v53 = v45 + v50;
                BOOL v54 = v53 >= v23 || v46 < (uint64_t)v79;
                double v55 = v90 - v53;
                if (v54) {
                  double v55 = -0.0;
                }
                double v37 = v51 + v55;
                double v43 = v52 + v55;
                double v45 = v53 + v55;
              }
              while (v53 + v55 < v23 && v46++ < (uint64_t)v79);
            }
            if (v31 != 0.0)
            {
              [(MPAuthoringController *)self findClosestBeatForTime:a4 inBeats:&v99 atIndex:v31 + v37];
              double v37 = v57;
            }
            double v58 = v84;
            if (v31 == 0.0) {
              double v44 = 0.0;
            }
            else {
              double v44 = v37 - v43 - v84 - v25;
            }
            uint64_t v41 = v99;
            double v39 = v37;
          }
          objc_msgSend(objc_msgSend(a4, "lastObject"), "doubleValue");
          if (v39 >= v59) {
            return;
          }
          id v60 = [v14 transition];
          if (v60) {
            char v61 = v81;
          }
          else {
            char v61 = 1;
          }
          if ((v61 & 1) == 0)
          {
            id v62 = v60;
            [(MPAuthoringController *)self findClosestBeatForTime:a4 inBeats:&v99 atIndex:v39 - v83];
            double v64 = vabdd_f64(v39, v63);
            objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "beatStrengthForTransitionID:", objc_msgSend(v62, "transitionID"));
            BOOL v66 = vabdd_f64(v83, v64) > v65 * 0.4 + 0.1 || v64 < v78;
            if (!v66 && v64 <= v77) {
              [v62 setDuration:v64];
            }
          }
          double v68 = v58 + v43 + v44;
          [v14 outroTransitionDuration];
          double v70 = v69;
          [v14 introTransitionDuration];
          if (v68 < v70 + v71)
          {
            [v14 outroTransitionDuration];
            double v73 = v72;
            [v14 introTransitionDuration];
            double v43 = v43 + v73 + v74 - v68;
          }
          if (v80)
          {
            [v14 introTransitionDuration];
            objc_msgSend(v21, "setPhaseInDuration:");
            [v21 setMainDuration:v43];
            [v14 outroTransitionDuration];
            double v44 = v75;
          }
          else
          {
            [v21 setPhaseInDuration:v58];
            [v21 setMainDuration:v43];
          }
          [v21 setPhaseOutDuration:v44];
          if (v87 == (char *)[a4 count] - 1) {
            return;
          }
          double v76 = (double)v41;
          if ((double)v41 == 9.22337204e18) {
            double v76 = (double)(uint64_t)(v87 + 1);
          }
          double v87 = (unsigned char *)(uint64_t)v76;
        }
LABEL_80:
        ;
      }
      id v89 = [obj countByEnumeratingWithState:&v95 objects:v101 count:16];
    }
    while (v89);
  }
}

- (double)minimumDurationForLayer:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:a5];
  double v8 = v7;
  unsigned int v42 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:a5];
  id v41 = +[MPEffectManager sharedManager];
  id v9 = +[MPAuthoringUtilities customDurationsFromOptions:a5];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [a3 effectContainers];
  id v36 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v52;
    double v10 = 0.0;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(obj);
        }
        unsigned int v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v37 = v11;
        unsigned int v38 = v12;
        id v40 = [v12 effects];
        id v13 = [v40 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v13)
        {
          id v14 = v13;
          char v15 = 0;
          uint64_t v16 = *(void *)v48;
          double v17 = v8;
          while (1)
          {
            for (id i = 0; i != v14; id i = (char *)i + 1)
            {
              if (*(void *)v48 != v16) {
                objc_enumerationMutation(v40);
              }
              id v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              id v20 = [v19 slides];
              id v21 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
              if (v21)
              {
                id v22 = v21;
                uint64_t v23 = *(void *)v44;
LABEL_13:
                uint64_t v24 = 0;
                while (1)
                {
                  if (*(void *)v44 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  if (objc_msgSend(v9, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * v24), "path")))
                  {
                    break;
                  }
                  if (v22 == (id)++v24)
                  {
                    id v22 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
                    if (v22) {
                      goto LABEL_13;
                    }
                    goto LABEL_19;
                  }
                }
                int v25 = 0;
                if ((v15 & 1) == 0) {
                  goto LABEL_20;
                }
LABEL_23:
                unsigned int v26 = 1;
                goto LABEL_24;
              }
LABEL_19:
              int v25 = 1;
              if (v15) {
                goto LABEL_23;
              }
LABEL_20:
              if ((uint64_t)[v19 countOfSlides] < 1) {
                goto LABEL_34;
              }
              unsigned int v26 = v25 & ([v19 hasMovies] ^ 1);
LABEL_24:
              if ((v42 & v26) == 1
                && (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "skipPanoramaScaleForEffectID:", objc_msgSend(v19, "effectID")) & 1) == 0)
              {
                if ([v19 hasPanoramasInDocument:a4]) {
                  goto LABEL_34;
                }
              }
              else if (!v26)
              {
                goto LABEL_34;
              }
              objc_msgSend(v41, "minimumEffectDurationForEffectID:", objc_msgSend(v19, "effectID"));
              if (v27 >= v17) {
                double v17 = v27;
              }
              char v15 = 1;
            }
            id v14 = [v40 countByEnumeratingWithState:&v47 objects:v56 count:16];
            if (!v14)
            {
              [v38 outroTransitionDuration];
              double v29 = v17 + v28;
              goto LABEL_35;
            }
          }
        }
LABEL_34:
        [v38 duration];
        double v31 = v30;
        [v38 outroTransitionDuration];
        double v29 = v31 - v32;
LABEL_35:
        double v10 = v10 + v29;
        uint64_t v11 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (!v36) {
        return v10;
      }
    }
  }
  return 0.0;
}

- (double)maximumDurationForLayer:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  +[MPAuthoringUtilities audioDurationFromOptions:a5];
  double v8 = v7;
  +[MPAuthoringUtilities audioDurationFactorFromOptions:a5];
  double v10 = v9;
  +[MPAuthoringUtilities minimumEffectDurationFromOptions:a5];
  double v12 = v11;
  unsigned int v53 = +[MPAuthoringUtilities scaleEffectsForPanoramasFromOptions:a5];
  id v52 = +[MPEffectManager sharedManager];
  id v13 = +[MPAuthoringUtilities customDurationsFromOptions:a5];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v14 = [a3 effectContainers];
  id v15 = [v14 countByEnumeratingWithState:&v66 objects:v73 count:16];
  double v16 = 0.0;
  double v17 = 0.0;
  if (v15)
  {
    id v18 = v15;
    uint64_t v19 = *(void *)v67;
    do
    {
      for (id i = 0; i != v18; id i = (char *)i + 1)
      {
        if (*(void *)v67 != v19) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v66 + 1) + 8 * i) outroTransitionDuration];
        double v17 = v17 + v21;
      }
      id v18 = [v14 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v18);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = [a3 effectContainers];
  id v47 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v63;
    double v16 = 0.0;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v63 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v62 + 1) + 8 * v22);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v48 = v23;
        uint64_t v49 = v22;
        id v51 = [v23 effects];
        id v24 = [v51 countByEnumeratingWithState:&v58 objects:v71 count:16];
        if (!v24) {
          goto LABEL_45;
        }
        id v25 = v24;
        LOBYTE(v26) = 0;
        uint64_t v27 = *(void *)v59;
        double v28 = v12;
        while (2)
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v59 != v27) {
              objc_enumerationMutation(v51);
            }
            double v30 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v31 = [v30 slides];
            id v32 = [v31 countByEnumeratingWithState:&v54 objects:v70 count:16];
            if (v32)
            {
              id v33 = v32;
              uint64_t v34 = *(void *)v55;
LABEL_20:
              uint64_t v35 = 0;
              while (1)
              {
                if (*(void *)v55 != v34) {
                  objc_enumerationMutation(v31);
                }
                if (objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * v35), "path")))
                {
                  break;
                }
                if (v33 == (id)++v35)
                {
                  id v33 = [v31 countByEnumeratingWithState:&v54 objects:v70 count:16];
                  if (v33) {
                    goto LABEL_20;
                  }
                  goto LABEL_26;
                }
              }
              int v36 = 0;
              if ((v26 & 1) == 0) {
                goto LABEL_27;
              }
LABEL_30:
              unsigned int v26 = 1;
              goto LABEL_31;
            }
LABEL_26:
            int v36 = 1;
            if (v26) {
              goto LABEL_30;
            }
LABEL_27:
            if ((uint64_t)[v30 countOfSlides] < 1) {
              goto LABEL_45;
            }
            unsigned int v26 = v36 & ([v30 hasMovies] ^ 1);
LABEL_31:
            if ((v53 & v26) == 1
              && (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "skipPanoramaScaleForEffectID:", objc_msgSend(v30, "effectID")) & 1) == 0)
            {
              unsigned int v37 = [v30 hasPanoramasInDocument:a4];
            }
            else
            {
              unsigned int v37 = 0;
            }
            if ((v26 ^ 1 | v37) == 1)
            {
              if ((v26 & 1) == 0) {
                goto LABEL_45;
              }
              if (v37)
              {
                [v48 duration];
                double v16 = v16 + v39 * 2.0;
                goto LABEL_46;
              }
              goto LABEL_48;
            }
            objc_msgSend(v52, "minimumEffectDurationForEffectID:", objc_msgSend(v30, "effectID"));
            if (v38 >= v28) {
              double v28 = v38;
            }
          }
          id v25 = [v51 countByEnumeratingWithState:&v58 objects:v71 count:16];
          if (v25) {
            continue;
          }
          break;
        }
        if (v26)
        {
LABEL_48:
          double v16 = v16 + v28 * 29.0;
          goto LABEL_46;
        }
LABEL_45:
        [v48 duration];
        double v16 = v16 + v40;
LABEL_46:
        uint64_t v22 = v49 + 1;
      }
      while ((id)(v49 + 1) != v47);
      id v41 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
      id v47 = v41;
    }
    while (v41);
  }
  double result = v17 + v16;
  if (v8 > v17 + v16 && v10 == -1.0 && v8 != -1.0) {
    return v8;
  }
  return result;
}

- (void)configureFiltersInDocument:(id)a3 withOptions:(id)a4
{
  int v50 = objc_opt_respondsToSelector();
  int v7 = objc_opt_respondsToSelector();
  id v32 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:a4];
  id v47 = a4;
  id v40 = +[MPAuthoringUtilities reconfigureRangeFromOptions:a4];
  NSUInteger range1 = v8;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v49 = a3;
  id obj = [a3 layers];
  id v33 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v33)
  {
    *(_DWORD *)&v48[8] = 0;
    NSUInteger v46 = 0;
    uint64_t v31 = *(void *)v64;
    *(void *)long long v48 = v7 ^ 1u;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v64 != v31) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v63 + 1) + 8 * v9);
        double v11 = +[NSNumber numberWithInteger:*(void *)&v48[4]];
        [v32 setObject:v11 forKey:kMPAuthoringLayerIndex];
        unsigned int v12 = +[MPAuthoringUtilities shouldComputeSlideFiltersFromOptions:v32];
        uint64_t v34 = v9;
        if ((v12 | v50))
        {
          unsigned int v13 = v12;
          id v14 = [v10 effectContainers];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v35 = v14;
          id v37 = [v14 countByEnumeratingWithState:&v59 objects:v69 count:16];
          if (v37)
          {
            uint64_t v15 = 0;
            uint64_t v36 = *(void *)v60;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v60 != v36) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v38 = v16;
                double v17 = *(void **)(*((void *)&v59 + 1) + 8 * v16);
                long long v55 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                id v39 = [v17 effects];
                id v42 = [v39 countByEnumeratingWithState:&v55 objects:v68 count:16];
                if (v42)
                {
                  uint64_t v18 = 0;
                  uint64_t v41 = *(void *)v56;
                  do
                  {
                    uint64_t v19 = 0;
                    do
                    {
                      if (*(void *)v56 != v41) {
                        objc_enumerationMutation(v39);
                      }
                      uint64_t v44 = v19;
                      id v20 = *(void **)(*((void *)&v55 + 1) + 8 * v19);
                      NSUInteger v45 = (NSUInteger)objc_msgSend(objc_msgSend(v20, "slides"), "count");
                      if (!range1
                        || (v71.location = (NSUInteger)v40,
                            v71.length = range1,
                            v72.length = v45,
                            v72.location = v46,
                            NSIntersectionRange(v71, v72).length))
                      {
                        long long v53 = 0u;
                        long long v54 = 0u;
                        long long v51 = 0u;
                        long long v52 = 0u;
                        id v21 = [v20 slides];
                        id v22 = [v21 countByEnumeratingWithState:&v51 objects:v67 count:16];
                        if (v22)
                        {
                          id v23 = v22;
                          uint64_t v24 = *(void *)v52;
                          do
                          {
                            for (id i = 0; i != v23; id i = (char *)i + 1)
                            {
                              if (*(void *)v52 != v24) {
                                objc_enumerationMutation(v21);
                              }
                              unsigned int v26 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                              if (v50)
                              {
                                unsigned int v27 = [self->_delegate document:v49 shouldUseDefaultFiltersForSlide:*(void *)(*((void *)&v51 + 1) + 8 * i) effectIndex:v18 containerIndex:v15 layerIndex:*(void *)&v48[4]];
                                if (((v27 | *(_DWORD *)v48) & 1) == 0)
                                {
                                  id v28 = [self->_delegate document:v49 needsFiltersForSlide:v26 effectIndex:v18 containerIndex:v15 layerIndex:*(void *)&v48[4]];
                                  goto LABEL_30;
                                }
                              }
                              else
                              {
                                unsigned int v27 = 1;
                              }
                              if ((v13 & v27) != 1) {
                                continue;
                              }
                              id v28 = [(MPAuthoringController *)self filtersForSlideFromOptions:v47];
LABEL_30:
                              id v29 = v28;
                              if (v28 && [v28 count]) {
                                [v26 addFilters:v29];
                              }
                            }
                            id v23 = [v21 countByEnumeratingWithState:&v51 objects:v67 count:16];
                          }
                          while (v23);
                        }
                      }
                      v46 += v45;
                      ++v18;
                      uint64_t v19 = v44 + 1;
                    }
                    while ((id)(v44 + 1) != v42);
                    id v42 = [v39 countByEnumeratingWithState:&v55 objects:v68 count:16];
                  }
                  while (v42);
                }
                ++v15;
                uint64_t v16 = v38 + 1;
              }
              while ((id)(v38 + 1) != v37);
              id v37 = [v35 countByEnumeratingWithState:&v59 objects:v69 count:16];
            }
            while (v37);
          }
        }
        ++*(void *)&v48[4];
        uint64_t v9 = v34 + 1;
      }
      while ((id)(v34 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v33);
  }
}

- (void)configureTransitionsInDocument:(id)a3 withOptions:(id)a4
{
  char v7 = objc_opt_respondsToSelector();
  int v8 = objc_opt_respondsToSelector();
  id v39 = a4;
  unsigned int v33 = +[MPAuthoringUtilities shouldComputeTransitionsFromOptions:a4];
  if (v33 & 1) != 0 || (v7)
  {
    id v9 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:a4];
    id v40 = +[MPAuthoringUtilities reconfigureRangeFromOptions:a4];
    unint64_t v11 = v10;
    unsigned __int8 v12 = objc_msgSend(objc_msgSend(a4, "objectForKey:", @"keepTransitions"), "BOOLValue");
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v35 = a3;
    id obj = [a3 layers];
    id v13 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (!v13) {
      goto LABEL_43;
    }
    id v14 = v13;
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    uint64_t v31 = *(void *)v48;
    int v34 = v8 ^ 1;
    id v28 = v9;
    while (1)
    {
      uint64_t v17 = 0;
      id v29 = v14;
      do
      {
        if (*(void *)v48 != v31)
        {
          uint64_t v18 = v17;
          objc_enumerationMutation(obj);
          uint64_t v17 = v18;
        }
        uint64_t v32 = v17;
        uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * v17);
        id v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15, v28);
        [v9 setObject:v20 forKey:kMPAuthoringLayerIndex];
        if (+[MPAuthoringUtilities canHaveTransitionsFromOptions:v9])
        {
          uint64_t v38 = v15;
          id v21 = [v19 effectContainers];
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v42 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (!v42) {
            goto LABEL_40;
          }
          id v22 = 0;
          uint64_t v41 = *(void *)v44;
          id v36 = v21;
          id v37 = v19;
          while (1)
          {
            for (id i = 0; i != v42; id i = (char *)i + 1)
            {
              if (*(void *)v44 != v41) {
                objc_enumerationMutation(v21);
              }
              uint64_t v24 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              if ([v24 transition]) {
                unsigned __int8 v25 = v12;
              }
              else {
                unsigned __int8 v25 = 0;
              }
              if ((v25 & 1) == 0)
              {
                if (v11 && (v16 < (unint64_t)v40 || v16 - (unint64_t)v40 >= v11)) {
                  goto LABEL_37;
                }
                if (v7)
                {
                  unsigned int v26 = [self->_delegate document:v35 shouldUseDefaultTransitionForEffectContainer:v24 containerIndex:v22 layerIndex:v38];
                  if ((v26 | v34))
                  {
                    id v21 = v36;
                    uint64_t v19 = v37;
                    if (v26) {
                      goto LABEL_24;
                    }
LABEL_37:
                    ++v16;
                    ++v22;
                    continue;
                  }
                  id v21 = v36;
                  uint64_t v19 = v37;
                  if (![self->_delegate document:v35 needsTransitionForEffectContainer:v24 containerIndex:v22 layerIndex:v38])goto LABEL_37; {
                }
                  }
                else
                {
LABEL_24:
                  if (v22 == (char *)objc_msgSend(objc_msgSend(v19, "effectContainers"), "count") - 1
                    && +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:v39])
                  {
                    id v27 = [(MPAuthoringController *)self loopTransitionFromOptions:v39];
                  }
                  else
                  {
                    if (v22 == (char *)objc_msgSend(objc_msgSend(v19, "effectContainers"), "count") - 1)
                    {
                      if ((v33 & +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:v39] & 1) == 0)goto LABEL_37; {
                    }
                      }
                    else if (!v33)
                    {
                      goto LABEL_37;
                    }
                    if (v22 >= (char *)objc_msgSend(objc_msgSend(v19, "effectContainers"), "count") - 1) {
                      goto LABEL_37;
                    }
                    id v27 = [(MPAuthoringController *)self transitionFromOptions:v39];
                  }
                  if (!v27) {
                    goto LABEL_37;
                  }
                }
                objc_msgSend(v24, "setTransition:");
                goto LABEL_37;
              }
            }
            id v42 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (!v42)
            {
LABEL_40:
              uint64_t v15 = v38 + 1;
              id v9 = v28;
              id v14 = v29;
              break;
            }
          }
        }
        uint64_t v17 = v32 + 1;
      }
      while ((id)(v32 + 1) != v14);
      id v14 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (!v14)
      {
LABEL_43:

        return;
      }
    }
  }
}

- (id)createLayerWithImages:(id)a3 effects:(id)a4 andOptions:(id)a5
{
  id v9 = +[MPAuthoringUtilities styleFromOptions:a5];
  int64_t v10 = +[MPAuthoringUtilities layerIndexFromOptions:a5];
  id v11 = +[MPLayer layer];
  id v12 = objc_msgSend(-[MPAuthoringController effectContainersWithImages:effects:andOptions:](self, "effectContainersWithImages:effects:andOptions:", a3, a4, a5), "mutableCopy");
  +[MPAuthoringUtilities layerOffsetFromOptions:a5];
  if (v13 != 0.0)
  {
    double v14 = v13;
    id v15 = +[MPEffectContainer effectContainer];
    [v15 setDuration:v14];
    [v12 insertObject:v15 atIndex:0];
  }
  [v11 addEffectContainers:v12];

  id v16 = [(MPAuthoringController *)self filtersForLayerFromOptions:a5];
  if ([v16 count]) {
    [v11 addFilters:v16];
  }
  objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "defaultSizeForZIndex:ofStyle:", v10, v9);
  objc_msgSend(v11, "setSize:");
  objc_msgSend(v11, "setLayerID:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIDForLayerIndex:ofStyle:", v10, v9));
  return v11;
}

- (id)slidesWithImages:(id)a3 andOptions:(id)a4
{
  id v7 = [a3 count];
  unsigned int v8 = +[MPAuthoringUtilities shouldComputeFramesFromOptions:a4];
  unsigned __int8 v9 = +[MPAuthoringUtilities shouldComputeSlideFiltersFromOptions:a4];
  int64_t v25 = +[MPAuthoringUtilities layerIndexFromOptions:a4];
  +[MPAuthoringUtilities movieVolumeFromOptions:a4];
  double v11 = v10;
  unsigned int v26 = +[MPAuthoringUtilities shouldDuckMoviesFromOptions:a4];
  id v28 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:a4];
  if (self->_delegate)
  {
    char v12 = objc_opt_respondsToSelector();
    int v27 = objc_opt_respondsToSelector();
  }
  else
  {
    char v12 = 0;
    int v27 = 0;
  }
  id v13 = +[NSMutableArray array];
  id v14 = [a4 objectForKey:kMPAuthoringCachedAbsolutePaths];
  if ((uint64_t)v7 >= 1)
  {
    id v15 = v14;
    uint64_t v16 = 0;
    char v17 = v9 | v12;
    while (1)
    {
      uint64_t v18 = -[MPSlide initWithPath:]([MPSlide alloc], "initWithPath:", [a3 objectAtIndex:v16]);
      if (v15) {
        -[MPSlide setAbsolutePath:](v18, "setAbsolutePath:", [v15 objectAtIndex:v16]);
      }
      if ([(MPDocument *)self->_authoredDocument isMovieAtPath:[(MPSlide *)v18 path]]) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = 2;
      }
      [(MPSlide *)v18 setMediaType:v19];
      if ([(MPSlide *)v18 hasMovie])
      {
        [(MPDocument *)self->_authoredDocument volumeForPath:[(MPSlide *)v18 path]];
        -[MPSlide setAudioVolume:](v18, "setAudioVolume:");
        if (v11 != 1.0) {
          [(MPSlide *)v18 setAudioVolume:v11];
        }
        if (v26)
        {
          [(MPSlide *)v18 setAudioDuckInDuration:1.0];
          [(MPSlide *)v18 setAudioDuckOutDuration:1.0];
          [(MPSlide *)v18 setAudioDuckLevel:0.25];
        }
      }
      if (v8)
      {
        id v20 = [(MPAuthoringController *)self frameFromOptions:v28];
        if (v20) {
          [(MPSlide *)v18 setFrame:v20];
        }
      }
      if ((v17 & 1) == 0) {
        goto LABEL_28;
      }
      if ((v27 & 1) == 0) {
        break;
      }
      unsigned int v21 = [self->_delegate document:self->_authoredDocument shouldUseDefaultFiltersForSlide:v18 effectIndex:0 containerIndex:0 layerIndex:v25];
      if (((v21 | v27 ^ 1) & 1) == 0)
      {
        id v22 = [self->_delegate document:self->_authoredDocument needsFiltersForSlide:v18 effectIndex:0 containerIndex:0 layerIndex:v25];
        goto LABEL_25;
      }
      if (v21) {
        break;
      }
LABEL_28:
      [v13 addObject:v18];

      if (v7 == (id)++v16) {
        goto LABEL_29;
      }
    }
    id v22 = [(MPAuthoringController *)self filtersForSlideFromOptions:v28];
LABEL_25:
    id v23 = v22;
    if (v22 && [v22 count]) {
      [(MPSlide *)v18 addFilters:v23];
    }
    goto LABEL_28;
  }
LABEL_29:

  return v13;
}

- (id)dynamicLayerWithImages:(id)a3 withOptions:(id)a4
{
  id v7 = +[MPAuthoringUtilities effectListFromOptions:a4];
  unsigned int v8 = +[MPAuthoringUtilities layerHasImagesFromOptions:a4];
  if ([v7 count]
    && ((id v9 = objc_msgSend(objc_msgSend(v7, "lastObject"), "objectForKey:", @"presetID"),
         id v10 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfImagesForEffectPresetID:", v9), v11 = objc_msgSend(+[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a4), "isEqualToString:", @"Dateline"), v10 == (id)0x7FFFFFFFFFFFFFFFLL)? (v12 = v8): (v12 = 0), v12 == 1))
  {
    unsigned int v13 = v11;
    id v14 = [[MPLayerEffect alloc] initWithEffectID:+[MPUtilities idOfCombinedID:v9] andPaths:a3];
    if (v13) {
      -[MPLayerEffect setEffectAttribute:forKey:](v14, "setEffectAttribute:forKey:", [a4 objectForKey:kMPAuthoringJournalRepresentation], @"journal");
    }
    [(MPAuthoringController *)self configurePanoramaInformationToEffect:v14 inDocument:self->_authoredDocument startingIndex:0 count:-1 removeOldIndex:-1];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v15 = [(MPLayerEffect *)v14 slides];
    id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (id i = 0; i != v17; id i = (char *)i + 1)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (-[MPDocument isMovieAtPath:](self->_authoredDocument, "isMovieAtPath:", [v20 path])) {
            uint64_t v21 = 3;
          }
          else {
            uint64_t v21 = 2;
          }
          [v20 setMediaType:v21];
        }
        id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v17);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = [(MPLayerEffect *)v14 slides];
    id v23 = [(NSArray *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          int v27 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
          if ([v27 hasMovie])
          {
            -[MPDocument volumeForPath:](self->_authoredDocument, "volumeForPath:", [v27 path]);
            objc_msgSend(v27, "setAudioVolume:");
          }
        }
        id v24 = [(NSArray *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v24);
    }
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

- (id)titleEffectsForImages:(id)a3 withOptions:(id)a4
{
  id v27 = +[NSMutableArray array];
  id v6 = +[MPAuthoringUtilities styleFromOptions:a4];
  id v7 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "titleEffectLayoutsForStyleID:", v6);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = [v7 objectEnumerator];
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (id i = 0; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ((objc_msgSend(objc_msgSend(v14, "objectForKey:", @"imageOnlyTitleEffect"), "BOOLValue") & 1) == 0) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }
  id v15 = [(MPAuthoringController *)self findEffectIDInPresetArray:v8 forImages:a3 withOptions:a4];

  if (v15
    || (id v15 = +[MPAuthoringUtilities titleEffectFromOptions:a4]) != 0)
  {
    id v16 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfTitleEffectLayerForStyleID:", v6);
    if ((id)+[MPAuthoringUtilities layerIndexFromOptions:a4] == v16)
    {
      id v17 = (NSArray *)[v15 objectForKey:@"presetID"];
      id v18 = [v15 objectForKey:@"backgroundEffect"];
      id v19 = +[MPEffectManager sharedManager];
      id v20 = (char *)objc_msgSend(v19, "numberOfSlidesForEffectID:", +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v17));
      if (v18) {
        id v20 = &v20[(void)objc_msgSend(v19, "numberOfSlidesForEffectID:", +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v18))];
      }
      id v21 = +[MPAuthoringUtilities outroEffectIDFromOptions:a4];
      id v22 = [a3 count];
      int64_t v23 = v22 - (unsigned char *)[v19 numberOfSlidesForEffectID:v21];
      unsigned __int8 v24 = +[MPAuthoringUtilities layerHasImagesFromOptions:a4];
      if ((uint64_t)v20 <= v23 || (v24 & 1) == 0)
      {
        if (v18) {
          id v17 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, v17, 0);
        }
        [v27 addObject:v17];
      }
    }
  }
  return v27;
}

- (id)effectAuthoredLayerWithImages:(id)a3 withOptions:(id)a4
{
  unsigned int v7 = +[MPAuthoringUtilities shouldDuckMoviesFromOptions:a4];
  +[MPAuthoringUtilities movieVolumeFromOptions:a4];
  double v9 = v8;
  id v10 = objc_msgSend(objc_msgSend(+[MPAuthoringUtilities effectListFromOptions:](MPAuthoringUtilities, "effectListFromOptions:", a4), "lastObject"), "objectForKey:", @"presetID");
  id v83 = +[MPUtilities idOfCombinedID:v10];
  id v81 = +[MPUtilities presetIDOfCombinedID:v10];
  id v11 = +[MPAuthoringUtilities styleFromOptions:a4];
  int64_t v12 = +[MPAuthoringUtilities layerIndexFromOptions:a4];
  id v78 = a4;
  +[MPAuthoringUtilities aspectRatioFromOptions:a4];
  double v14 = v13;
  id v79 = +[MPLayer layer];
  objc_msgSend(v79, "setLayerID:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIDForLayerIndex:ofStyle:", v12, v11));
  id v85 = [a3 mutableCopy];
  id v91 = +[NSMutableArray array];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v15 = a3;
  id v16 = [a3 countByEnumeratingWithState:&v109 objects:v117 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v110;
    do
    {
      for (id i = 0; i != v17; id i = (char *)i + 1)
      {
        if (*(void *)v110 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v109 + 1) + 8 * i);
        id v21 = objc_alloc_init((Class)NSMutableDictionary);
        [(MPDocument *)self->_authoredDocument resolutionForPath:v20];
        double v24 = v22 / v23;
        *(float *)&double v24 = v24;
        objc_msgSend(v21, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v24), @"aspectRatio");
        if ([(MPDocument *)self->_authoredDocument isMovieAtPath:v20])
        {
          objc_msgSend(v21, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"isMovie");
          [(MPDocument *)self->_authoredDocument durationForPath:v20];
          objc_msgSend(v21, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"duration");
        }
        [v91 addObject:v21];
      }
      id v17 = [v15 countByEnumeratingWithState:&v109 objects:v117 count:16];
    }
    while (v17);
  }
  unsigned int v25 = objc_msgSend(objc_msgSend(v78, "objectForKey:", kMPAuthoringTellEffectsToSyncToMusic), "BOOLValue");
  unsigned int v26 = &off_1BBE88;
  if (!v25) {
    unsigned int v26 = 0;
  }
  unsigned int v80 = v26;
  id v27 = v85;
  id v28 = v91;
  while ([v85 count])
  {
    id v29 = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:", v83, v80, v28, 0, v14);
    id v30 = [v29 effectAuthoredSlideCount];
    id v31 = [v29 effectAuthoredAttributes];
    id v89 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v30);
    id v32 = objc_msgSend(v27, "objectsAtIndexes:");
    id v87 = +[MPEffectContainer effectContainer];
    long long v33 = +[MPEffect effectWithEffectID:v83 andPaths:v32];
    [(MPEffect *)v33 setPresetID:v81];
    [(MPEffect *)v33 setEffectAttributes:v31];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v34 = [(MPEffect *)v33 slides];
    id v35 = [(NSArray *)v34 countByEnumeratingWithState:&v105 objects:v116 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v106;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v106 != v37) {
            objc_enumerationMutation(v34);
          }
          id v39 = *(void **)(*((void *)&v105 + 1) + 8 * (void)j);
          unsigned int v40 = -[MPDocument isMovieAtPath:](self->_authoredDocument, "isMovieAtPath:", [v39 path]);
          if (v40) {
            uint64_t v41 = 3;
          }
          else {
            uint64_t v41 = 2;
          }
          [v39 setMediaType:v41];
          if (v40)
          {
            double v42 = v9;
            if (v9 == 1.0) {
              -[MPDocument volumeForPath:](self->_authoredDocument, "volumeForPath:", objc_msgSend(v39, "path", v9));
            }
            [v39 setAudioVolume:v42];
            if (v7)
            {
              [v39 setAudioDuckInDuration:1.0];
              [v39 setAudioDuckOutDuration:1.0];
              [v39 setAudioDuckLevel:0.25];
            }
          }
        }
        id v36 = [(NSArray *)v34 countByEnumeratingWithState:&v105 objects:v116 count:16];
      }
      while (v36);
    }
    [(MPAuthoringController *)self configurePanoramaInformationToEffect:v33 inDocument:self->_authoredDocument startingIndex:0 count:-1 removeOldIndex:-1];
    [v87 addEffect:v33];
    [v79 addEffectContainer:v87];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v43 = [(MPEffect *)v33 slides];
    id v44 = [(NSArray *)v43 countByEnumeratingWithState:&v101 objects:v115 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v102;
      do
      {
        for (id k = 0; k != v45; id k = (char *)k + 1)
        {
          if (*(void *)v102 != v46) {
            objc_enumerationMutation(v43);
          }
          long long v48 = *(void **)(*((void *)&v101 + 1) + 8 * (void)k);
          if (-[MPDocument isMovieAtPath:](self->_authoredDocument, "isMovieAtPath:", [v48 path])) {
            uint64_t v49 = 3;
          }
          else {
            uint64_t v49 = 2;
          }
          [v48 setMediaType:v49];
        }
        id v45 = [(NSArray *)v43 countByEnumeratingWithState:&v101 objects:v115 count:16];
      }
      while (v45);
    }
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v50 = [(MPEffect *)v33 slides];
    id v51 = [(NSArray *)v50 countByEnumeratingWithState:&v97 objects:v114 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v98;
      do
      {
        for (m = 0; m != v52; m = (char *)m + 1)
        {
          if (*(void *)v98 != v53) {
            objc_enumerationMutation(v50);
          }
          long long v55 = *(void **)(*((void *)&v97 + 1) + 8 * (void)m);
          if ([v55 hasMovie])
          {
            -[MPDocument volumeForPath:](self->_authoredDocument, "volumeForPath:", [v55 path]);
            objc_msgSend(v55, "setAudioVolume:");
          }
        }
        id v52 = [(NSArray *)v50 countByEnumeratingWithState:&v97 objects:v114 count:16];
      }
      while (v52);
    }
    id v28 = v91;
    [v91 removeObjectsAtIndexes:v89];
    id v27 = v85;
    [v85 removeObjectsAtIndexes:v89];
  }

  id v56 = [v79 effectContainers];
  long long v57 = (char *)[v56 count];
  unsigned int v58 = +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:v78];
  unsigned int v59 = +[MPAuthoringUtilities shouldComputeTransitionsFromOptions:v78];
  id v92 = [v78 mutableCopy];
  unsigned __int8 v84 = +[MPAuthoringUtilities repeatTransitionsFromOptions:v78];
  id v60 = objc_alloc_init((Class)NSAutoreleasePool);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v61 = [v56 countByEnumeratingWithState:&v93 objects:v113 count:16];
  if (!v61)
  {
    id v82 = 0;
    goto LABEL_86;
  }
  id v62 = v61;
  uint64_t v63 = 0;
  id v82 = 0;
  uint64_t v64 = *(void *)v94;
  unsigned int v88 = v58;
  int v65 = v59 | v58;
  id v86 = v56;
  do
  {
    long long v66 = 0;
    uint64_t v90 = 1 - (void)v57 + v63;
    do
    {
      if (*(void *)v94 != v64) {
        objc_enumerationMutation(v56);
      }
      if ((uint64_t)((char *)v66 + v63) < (uint64_t)v57) {
        int v67 = v65;
      }
      else {
        int v67 = 0;
      }
      if (v67 == 1)
      {
        long long v68 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v66);
        if (objc_msgSend(objc_msgSend(v68, "effects"), "count"))
        {
          unsigned int v69 = v88;
          if ((char *)v66 + v90) {
            unsigned int v69 = 0;
          }
          if (v69 == 1)
          {
            id v70 = [(MPAuthoringController *)self loopTransitionFromOptions:v92];
          }
          else
          {
            if ((char *)v66 + v90)
            {
              id v71 = [v56 objectAtIndex:(char *)v66 + v63 + 1];
            }
            else
            {
              if ([v92 objectForKey:kMPAuthoringUseLoopTransition]
                && ![v68 countOfEffects]
                && (objc_msgSend(objc_msgSend(v92, "objectForKey:", kMPAuthoringUseLoopTransition), "BOOLValue") & 1) == 0)
              {
                goto LABEL_77;
              }
              id v71 = 0;
            }
            id v70 = [(MPAuthoringController *)self transitionFromOptions:v92 firstEffectContainer:v68 nextEffectContainer:v71];
          }
          NSRange v72 = v70;
          if (!v70) {
            goto LABEL_76;
          }
          [v68 setTransition:v70];
          if ((v84 & 1) == 0)
          {
            id v75 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", objc_msgSend(v72, "transitionPresetID"), 0);
            [v92 setObject:v75 forKey:kMPAuthoringIgnoreTransitionList];

LABEL_76:
            id v56 = v86;
            goto LABEL_77;
          }
          id v73 = [v72 transitionPresetID];
          if (!v82)
          {
            id v82 = v73;
            goto LABEL_76;
          }
          if ([v82 isEqualToString:v73])
          {
            id v74 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", objc_msgSend(v72, "transitionPresetID"), 0);
            [v92 setObject:v74 forKey:kMPAuthoringIgnoreTransitionList];
          }
          else
          {
            [v92 removeObjectForKey:kMPAuthoringIgnoreTransitionList];

            id v82 = v73;
          }
          id v56 = v86;
        }
      }
LABEL_77:
      if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * ((void)v66 + v63) - 0x888888888888889, 1) <= 0x888888888888888uLL)
      {

        id v60 = objc_alloc_init((Class)NSAutoreleasePool);
      }
      long long v66 = (char *)v66 + 1;
    }
    while (v62 != v66);
    id v76 = [v56 countByEnumeratingWithState:&v93 objects:v113 count:16];
    id v62 = v76;
    v63 += (uint64_t)v66;
  }
  while (v76);
LABEL_86:

  [v60 drain];
  if (v82) {

  }
  return v79;
}

- (id)effectContainersWithImages:(id)a3 effects:(id)a4 andOptions:(id)a5
{
  CGAffineTransform *(__cdecl **v23)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  uint64_t v24;
  char *v25;
  double v26;
  double y;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  char *v38;
  char *v39;
  id v40;
  char *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  char *v46;
  id v47;
  char *v48;
  char *v49;
  id v50;
  unint64_t v51;
  id v52;
  MPEffect *v53;
  char v54;
  char v55;
  id v56;
  id v57;
  char v58;
  uint64_t v59;
  void *i;
  float v61;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  void *j;
  unint64_t v71;
  unint64_t v72;
  id v73;
  MPEffect *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  NSArray *v81;
  id v82;
  id v83;
  uint64_t v84;
  void *k;
  void *v86;
  uint64_t v87;
  NSArray *v88;
  id v89;
  id v90;
  uint64_t v91;
  void *m;
  void *v93;
  NSArray *v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  void *n;
  id v100;
  id v101;
  BOOL v102;
  double v103;
  double v104;
  double v105;
  NSArray *v106;
  id v107;
  id v108;
  uint64_t v109;
  void *ii;
  void *v111;
  id v112;
  NSArray *v113;
  id v114;
  id v115;
  uint64_t v116;
  void *jj;
  void *v118;
  unsigned int v119;
  id v120;
  id v121;
  int v122;
  NSArray *v123;
  id v124;
  id v125;
  uint64_t v126;
  void *kk;
  void *v128;
  NSArray *v129;
  id v130;
  id v131;
  uint64_t v132;
  void *mm;
  void *v134;
  uint64_t v135;
  char *v136;
  id v137;
  id v138;
  uint64_t v139;
  void *v140;
  void *v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  unsigned int v147;
  unsigned int v148;
  id v149;
  id v150;
  void *v151;
  id v152;
  id v153;
  void *v154;
  id v155;
  id v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  void *nn;
  void *v161;
  char *v162;
  double v163;
  double v164;
  id v165;
  char v167;
  int v168;
  unsigned __int8 v169;
  id v170;
  unsigned int v171;
  char v172;
  uint64_t v174;
  void *v175;
  id v176;
  id v177;
  id v178;
  uint64_t v179;
  id v180;
  id v181;
  char v182;
  unsigned int v183;
  id v184;
  id v185;
  unsigned int v186;
  char v187;
  unsigned int v188;
  unsigned int v189;
  unsigned int v190;
  int v191;
  int64_t v192;
  uint64_t v193;
  void *v194;
  id v195;
  id v196;
  unsigned __int8 v197;
  id v198;
  id v199;
  char *v200;
  uint64_t v201;
  char *v202;
  id v203;
  uint64_t v204;
  id v205;
  id v206;
  uint64_t v207;
  uint64_t v208;
  char *v209;
  id v210;
  id v211;
  id v212;
  long long v213;
  long long v214;
  long long v215;
  long long v216;
  long long v217;
  long long v218;
  long long v219;
  long long v220;
  long long v221;
  long long v222;
  long long v223;
  long long v224;
  long long v225;
  long long v226;
  long long v227;
  long long v228;
  long long v229;
  long long v230;
  long long v231;
  long long v232;
  long long v233;
  long long v234;
  long long v235;
  long long v236;
  long long v237;
  long long v238;
  long long v239;
  long long v240;
  long long v241;
  long long v242;
  long long v243;
  long long v244;
  long long v245;
  long long v246;
  long long v247;
  long long v248;
  long long v249;
  long long v250;
  long long v251;
  long long v252;
  long long v253;
  long long v254;
  long long v255;
  long long v256;
  long long v257;
  long long v258;
  long long v259;
  long long v260;
  long long v261;
  long long v262;
  long long v263;
  long long v264;
  unsigned char v265[128];
  unsigned char v266[128];
  unsigned char v267[128];
  unsigned char v268[128];
  unsigned char v269[128];
  unsigned char v270[128];
  unsigned char v271[128];
  unsigned char v272[128];
  unsigned char v273[128];
  unsigned char v274[128];
  unsigned char v275[128];
  unsigned char v276[128];
  unsigned char v277[128];

  long long v203 = +[MPEffectManager sharedManager];
  long long v195 = a3;
  long long v200 = (char *)[a3 count];
  long long v190 = +[MPAuthoringUtilities shouldComputeFramesFromOptions:a5];
  unsigned int v8 = +[MPAuthoringUtilities shouldComputeTransitionsFromOptions:a5];
  unsigned __int8 v9 = +[MPAuthoringUtilities shouldComputeSlideFiltersFromOptions:a5];
  long long v171 = +[MPAuthoringUtilities shouldComputeLoopTransitionFromOptions:a5];
  long long v197 = +[MPAuthoringUtilities useBestAspectRatioFromOptions:a5];
  long long v192 = +[MPAuthoringUtilities layerIndexFromOptions:a5];
  +[MPAuthoringUtilities movieVolumeFromOptions:a5];
  double v11 = v10;
  long long v169 = +[MPAuthoringUtilities repeatTransitionsFromOptions:a5];
  +[MPAuthoringUtilities effectPadding:a5];
  double v13 = v12;
  long long v189 = +[MPAuthoringUtilities padTextOnlyEffects:a5];
  id v14 = [(MPAuthoringController *)self filtersForEffectFromOptions:a5];
  long long v184 = +[MPAuthoringUtilities outroEffectIDFromOptions:a5];
  long long v177 = [(MPAuthoringController *)self createEffectToTransitionMapWithOptions:a5];
  uint64_t v188 = +[MPAuthoringUtilities shouldDuckMoviesFromOptions:a5];
  long long v183 = objc_msgSend(+[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a5), "isEqualToString:", @"Dateline");
  if (+[MPAuthoringUtilities fitMoviesWhenPossibleFromOptions:a5])
  {
    unsigned int v15 = !+[MPAuthoringUtilities needsFitMovieAttributeFromOptions:a5];
  }
  else
  {
    LOBYTE(v15) = 1;
  }
  long long v182 = v15;
  long long v186 = +[MPAuthoringUtilities effectNeedsPreviousAttributesFromOptions:a5];
  v212 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:a5];
  if (self->_delegate)
  {
    long long v172 = objc_opt_respondsToSelector();
    char v16 = objc_opt_respondsToSelector();
    int v17 = objc_opt_respondsToSelector();
    long long v191 = objc_opt_respondsToSelector();
    int v18 = v17 ^ 1;
  }
  else
  {
    long long v191 = 0;
    char v16 = 0;
    long long v172 = 0;
    int v18 = 1;
  }
  long long v168 = v18;
  if (objc_msgSend(+[MPAuthoringUtilities transitionListFromOptions:](MPAuthoringUtilities, "transitionListFromOptions:", a5), "count") == (char *)&dword_0 + 1)unsigned int v19 = v8; {
  else
  }
    unsigned int v19 = 0;
  long long v167 = v8;
  long long v175 = v14;
  if (v19 == 1)
  {
    long long v170 = [(MPAuthoringController *)self transitionFromOptions:a5];
  }
  else
  {
    if (v8)
    {
      BOOL v20 = +[MPAuthoringUtilities pickTransitionsEvenlyByIDWithOptions:a5];
      unsigned int v21 = +[MPAuthoringUtilities matchEffectsUsingTagsFromOptions:a5];
      id v22 = +[MPAuthoringUtilities transitionListFromOptions:a5];
      [v22 lastObject];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || v20 || v21)
      {
        [(MPAuthoringController *)self populateWeighter:self->_transitionWeighter withTransitions:v22 andOptions:a5];
        [(MPWeighter *)self->_transitionWeighter setEvenlyPickByID:v20];
      }
    }
    long long v170 = 0;
  }
  long long v180 = +[NSMutableArray array];
  if ((objc_msgSend(objc_msgSend(v212, "objectForKey:", kMPAuthoringLive), "BOOLValue") & v186) == 1
    && objc_msgSend(-[MPDocument layers](self->_authoredDocument, "layers"), "count"))
  {
    long long v185 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[MPDocument layers](self->_authoredDocument, "layers"), "objectAtIndex:", v192), "effectContainers"), "lastObject"), "effects"), "lastObject"), "effectAttributes"), "mutableCopy");
  }
  else
  {
    long long v185 = 0;
  }
  long long v178 = objc_alloc_init((Class)NSAutoreleasePool);
  v261 = 0u;
  v262 = 0u;
  v263 = 0u;
  v264 = 0u;
  double v23 = &CATransform3DGetAffineTransform_ptr;
  long long v198 = a5;
  long long v176 = [a4 countByEnumeratingWithState:&v261 objects:v277 count:16];
  if (v176)
  {
    double v24 = 0;
    unsigned int v25 = 0;
    long long v174 = *(void *)v262;
    long long v187 = v9 | v16;
    y = CGPointZero.y;
    do
    {
      id v28 = 0;
      do
      {
        if (*(void *)v262 != v174) {
          objc_enumerationMutation(a4);
        }
        long long v179 = v28;
        id v29 = *(void **)(*((void *)&v261 + 1) + 8 * v28);
        id v30 = +[MPEffectContainer effectContainer];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v31 = v29;
        }
        else {
          id v31 = objc_msgSend(objc_alloc((Class)v23[447]), "initWithObjects:", v29, 0);
        }
        v260 = 0u;
        v259 = 0u;
        v257 = 0u;
        v258 = 0u;
        long long v181 = v31;
        long long v196 = [v31 countByEnumeratingWithState:&v257 objects:v276 count:16];
        if (v196)
        {
          id v32 = 0;
          uint64_t v193 = *(void *)v258;
          long long v194 = v30;
          long long v207 = v24;
          do
          {
            long long v33 = 0;
            do
            {
              long long v209 = v32;
              if (*(void *)v258 != v193)
              {
                long long v34 = v33;
                objc_enumerationMutation(v181);
                long long v33 = v34;
              }
              long long v201 = v33;
              id v35 = *(void *)(*((void *)&v257 + 1) + 8 * v33);
              id v36 = +[MPUtilities idOfCombinedID:v35];
              uint64_t v37 = +[MPUtilities presetIDOfCombinedID:v35];
              uint64_t v38 = (char *)[v203 numberOfSlidesForEffectID:v36];
              long long v202 = v25;
              long long v204 = (uint64_t)v38;
              if ((uint64_t)v38 < 1)
              {
                uint64_t v53 = +[MPEffect effectWithEffectID:v36];
                [(MPEffect *)v53 setPresetID:v37];
                goto LABEL_129;
              }
              id v39 = v38;
              long long v199 = v37;
              long long v205 = v36;
              unsigned int v40 = objc_alloc((Class)NSIndexSet);
              if ((uint64_t)v200 >= (uint64_t)v39) {
                uint64_t v41 = v39;
              }
              else {
                uint64_t v41 = v200;
              }
              double v42 = objc_msgSend(v40, "initWithIndexesInRange:", v25, v41);
              long long v43 = [v195 objectsAtIndexes:v42];

              id v44 = [a5 objectForKey:kMPAuthoringCachedAbsolutePaths];
              if (v44)
              {
                id v45 = v44;
                uint64_t v46 = v25;
                long long v47 = objc_alloc((Class)NSIndexSet);
                long long v48 = (char *)[v45 count];
                if (v48 >= v39) {
                  uint64_t v49 = v39;
                }
                else {
                  uint64_t v49 = v48;
                }
                long long v50 = objc_msgSend(v47, "initWithIndexesInRange:", v46, v49);
                id v51 = (unint64_t)v39;
                id v52 = [v45 objectsAtIndexes:v50];
              }
              else
              {
                id v51 = (unint64_t)v39;
                id v52 = 0;
              }
              if (v51 < 2) {
                long long v54 = 1;
              }
              else {
                long long v54 = v197;
              }
              if (v54)
              {
                long long v55 = 0;
              }
              else
              {
                v255 = 0u;
                v256 = 0u;
                v253 = 0u;
                v254 = 0u;
                id v56 = [v43 countByEnumeratingWithState:&v253 objects:v275 count:16];
                if (v56)
                {
                  long long v57 = v56;
                  unsigned int v58 = 0;
                  unsigned int v59 = *(void *)v254;
                  do
                  {
                    for (id i = 0; i != v57; id i = (char *)i + 1)
                    {
                      if (*(void *)v254 != v59) {
                        objc_enumerationMutation(v43);
                      }
                      objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->_cachedROIInformation, "objectForKey:", *(void *)(*((void *)&v253 + 1) + 8 * i)), "objectForKey:", @"aspectRatio"), "floatValue");
                      if (v61 > 2.0 || v61 < 0.5) {
                        unsigned int v58 = 1;
                      }
                    }
                    long long v57 = [v43 countByEnumeratingWithState:&v253 objects:v275 count:16];
                  }
                  while (v57);
                }
                else
                {
                  unsigned int v58 = 0;
                }
                long long v55 = v58 & 1;
              }
              uint64_t v63 = v199;
              if (v197)
              {
                if ((unint64_t)v204 >= 2) {
                  goto LABEL_73;
                }
              }
              else
              {
                if ((unint64_t)v204 <= 1) {
                  long long v55 = 0;
                }
                if (v55)
                {
LABEL_73:
                  int v65 = [(MPAuthoringController *)self sortImagePaths:v43 toAspectRatiosInEffectPresetID:v35 withOptions:v212];
                  uint64_t v64 = +[NSMutableArray array];
                  long long v66 = +[NSMutableArray array];
                  v249 = 0u;
                  v250 = 0u;
                  v251 = 0u;
                  v252 = 0u;
                  int v67 = [v65 countByEnumeratingWithState:&v249 objects:v274 count:16];
                  if (v67)
                  {
                    long long v68 = v67;
                    unsigned int v69 = *(void *)v250;
                    do
                    {
                      for (j = 0; j != v68; j = (char *)j + 1)
                      {
                        if (*(void *)v250 != v69) {
                          objc_enumerationMutation(v65);
                        }
                        id v71 = (unint64_t)[*(id *)(*((void *)&v249 + 1) + 8 * (void)j) integerValue];
                        if ((v71 & 0x8000000000000000) == 0)
                        {
                          NSRange v72 = v71;
                          objc_msgSend(v64, "addObject:", objc_msgSend(v43, "objectAtIndex:", v71));
                          if (v52) {
                            objc_msgSend(v66, "addObject:", objc_msgSend(v52, "objectAtIndex:", v72));
                          }
                        }
                      }
                      long long v68 = [v65 countByEnumeratingWithState:&v249 objects:v274 count:16];
                    }
                    while (v68);
                  }
                  if (v52) {
                    id v52 = v66;
                  }
                  else {
                    id v52 = 0;
                  }
                  a5 = v198;
                  uint64_t v63 = v199;
                  goto LABEL_87;
                }
              }
              uint64_t v64 = v43;
LABEL_87:
              id v73 = v205;
              id v74 = +[MPEffect effectWithEffectID:v205 andPaths:v64];
              [(MPEffect *)v74 setSkipEffectTiming:1];
              [(MPEffect *)v74 setPresetID:v63];
              if (v186)
              {
                id v75 = objc_msgSend(-[MPEffect effectAttributes](v74, "effectAttributes"), "mutableCopy");
                if (v185)
                {
                  id v76 = [v185 mutableCopy];
                  [v76 removeObjectForKey:@"previousAttributes"];
                  [v75 setObject:v76 forKey:@"previousAttributes"];
                  [(MPEffect *)v74 setEffectAttributes:v75];
                }
                else
                {
                  [(MPEffect *)v74 setEffectAttributes:v75];
                }
                long long v185 = v75;
                id v73 = v205;
              }
              if (v183) {
                -[MPEffect setEffectAttribute:forKey:](v74, "setEffectAttribute:forKey:", [a5 objectForKey:kMPAuthoringJournalRepresentation], @"journal");
              }
              if ((v182 & 1) == 0) {
                [(MPEffect *)v74 setEffectAttribute:+[NSNumber numberWithBool:1] forKey:@"fitMovies"];
              }
              [(MPAuthoringController *)self configurePanoramaInformationToEffect:v74 inDocument:self->_authoredDocument startingIndex:0 count:-1 removeOldIndex:-1];
              double v77 = [v203 numberOfSecondarySlidesForEffectID:v73];
              if ((uint64_t)v77 >= 1)
              {
                id v78 = v77;
                id v79 = [a5 objectForKey:kMPAuthoringSecondaryPaths];
                if (v79) {
                  unsigned int v80 = v79;
                }
                else {
                  unsigned int v80 = v195;
                }
                [(MPEffect *)v74 createSecondarySlidesWithPaths:[(MPAuthoringController *)self pickRandomPathsInArray:v80 excludingPaths:v64 count:v78]];
              }
              v247 = 0u;
              v248 = 0u;
              v245 = 0u;
              v246 = 0u;
              uint64_t v53 = v74;
              id v81 = [(MPEffect *)v74 slides];
              id v82 = [(NSArray *)v81 countByEnumeratingWithState:&v245 objects:v273 count:16];
              if (v82)
              {
                id v83 = v82;
                unsigned __int8 v84 = *(void *)v246;
                do
                {
                  for (id k = 0; k != v83; id k = (char *)k + 1)
                  {
                    if (*(void *)v246 != v84) {
                      objc_enumerationMutation(v81);
                    }
                    id v86 = *(void **)(*((void *)&v245 + 1) + 8 * (void)k);
                    if (-[MPDocument isMovieAtPath:](self->_authoredDocument, "isMovieAtPath:", [v86 path]))
                    {
                      id v87 = 3;
                    }
                    else
                    {
                      id v87 = 2;
                    }
                    [v86 setMediaType:v87];
                  }
                  id v83 = [(NSArray *)v81 countByEnumeratingWithState:&v245 objects:v273 count:16];
                }
                while (v83);
              }
              v243 = 0u;
              v244 = 0u;
              v241 = 0u;
              v242 = 0u;
              unsigned int v88 = [(MPEffect *)v53 slides];
              id v89 = [(NSArray *)v88 countByEnumeratingWithState:&v241 objects:v272 count:16];
              if (v89)
              {
                uint64_t v90 = v89;
                id v91 = *(void *)v242;
                do
                {
                  for (m = 0; m != v90; m = (char *)m + 1)
                  {
                    if (*(void *)v242 != v91) {
                      objc_enumerationMutation(v88);
                    }
                    long long v93 = *(void **)(*((void *)&v241 + 1) + 8 * (void)m);
                    if ([v93 hasMovie])
                    {
                      -[MPDocument volumeForPath:](self->_authoredDocument, "volumeForPath:", [v93 path]);
                      objc_msgSend(v93, "setAudioVolume:");
                    }
                  }
                  uint64_t v90 = [(NSArray *)v88 countByEnumeratingWithState:&v241 objects:v272 count:16];
                }
                while (v90);
              }
              if (v52)
              {
                v239 = 0u;
                v240 = 0u;
                v237 = 0u;
                v238 = 0u;
                long long v94 = [(MPEffect *)v53 slides];
                long long v95 = [(NSArray *)v94 countByEnumeratingWithState:&v237 objects:v271 count:16];
                if (v95)
                {
                  long long v96 = v95;
                  long long v97 = 0;
                  long long v98 = *(void *)v238;
                  do
                  {
                    for (n = 0; n != v96; n = (char *)n + 1)
                    {
                      if (*(void *)v238 != v98) {
                        objc_enumerationMutation(v94);
                      }
                      objc_msgSend(*(id *)(*((void *)&v237 + 1) + 8 * (void)n), "setAbsolutePath:", objc_msgSend(v52, "objectAtIndex:", (char *)n + v97));
                    }
                    long long v96 = [(NSArray *)v94 countByEnumeratingWithState:&v237 objects:v271 count:16];
                    v97 += (uint64_t)n;
                  }
                  while (v96);
                }
              }
              [(MPEffect *)v53 setSkipEffectTiming:0];
              [(MPEffect *)v53 updateTiming];
              id v36 = v205;
LABEL_129:
              if ((uint64_t)[v203 numOfTextsForEffectID:v36] >= 1)
              {
                long long v100 = [a5 objectForKey:kMPAuthoringTitleStrings];
                long long v101 = [a5 objectForKey:kMPAuthoringOutroTitleStrings];
                if ([v184 hasPrefix:v36]) {
                  long long v102 = v101 == 0;
                }
                else {
                  long long v102 = 1;
                }
                if (v102 || ![v101 count])
                {
                  +[MPAuthoringUtilities multilineSizeFactorFromOptions:a5];
                  if (!v100) {
                    goto LABEL_140;
                  }
                  long long v104 = v105;
                  long long v101 = v100;
                }
                else
                {
                  +[MPAuthoringUtilities multilineSizeFactorFromOptions:a5];
                  long long v104 = v103;
                }
                if (![v101 count])
                {
LABEL_140:
                  [(MPEffect *)v53 createTextsWithDefaultStrings];
                  goto LABEL_141;
                }
                [(MPEffect *)v53 createTextsWithStrings:v101 secondLineFactor:v104];
              }
LABEL_141:
              if (v190)
              {
                v235 = 0u;
                v236 = 0u;
                v233 = 0u;
                v234 = 0u;
                long long v106 = [(MPEffect *)v53 slides];
                long long v107 = [(NSArray *)v106 countByEnumeratingWithState:&v233 objects:v270 count:16];
                if (v107)
                {
                  long long v108 = v107;
                  long long v109 = *(void *)v234;
                  do
                  {
                    for (id ii = 0; ii != v108; id ii = (char *)ii + 1)
                    {
                      if (*(void *)v234 != v109) {
                        objc_enumerationMutation(v106);
                      }
                      long long v111 = *(void **)(*((void *)&v233 + 1) + 8 * (void)ii);
                      long long v112 = [(MPAuthoringController *)self frameFromOptions:v212];
                      if (v112) {
                        [v111 setFrame:v112];
                      }
                    }
                    long long v108 = [(NSArray *)v106 countByEnumeratingWithState:&v233 objects:v270 count:16];
                  }
                  while (v108);
                }
              }
              if (v187)
              {
                v231 = 0u;
                v232 = 0u;
                v229 = 0u;
                v230 = 0u;
                id v113 = [(MPEffect *)v53 slides];
                long long v114 = [(NSArray *)v113 countByEnumeratingWithState:&v229 objects:v269 count:16];
                if (v114)
                {
                  long long v115 = v114;
                  long long v116 = *(void *)v230;
                  do
                  {
                    for (jj = 0; jj != v115; jj = (char *)jj + 1)
                    {
                      if (*(void *)v230 != v116) {
                        objc_enumerationMutation(v113);
                      }
                      long long v118 = *(void **)(*((void *)&v229 + 1) + 8 * (void)jj);
                      if (v191)
                      {
                        long long v119 = [self->_delegate document:self->_authoredDocument shouldUseDefaultFiltersForSlide:*(void *)(*((void *)&v229 + 1) + 8 * (void)jj) effectIndex:v209 containerIndex:v207 layerIndex:v192];
                        if (((v119 | v191 ^ 1) & 1) == 0)
                        {
                          long long v120 = [self->_delegate document:self->_authoredDocument needsFiltersForSlide:v118 effectIndex:v209 containerIndex:v207 layerIndex:v192];
                          goto LABEL_162;
                        }
                        if (!v119) {
                          continue;
                        }
                      }
                      long long v120 = [(MPAuthoringController *)self filtersForSlideFromOptions:v212];
LABEL_162:
                      long long v121 = v120;
                      if (v120 && [v120 count]) {
                        [v118 addFilters:v121];
                      }
                    }
                    long long v115 = [(NSArray *)v113 countByEnumeratingWithState:&v229 objects:v269 count:16];
                  }
                  while (v115);
                }
              }
              if (v204 > 0) {
                long long v122 = 1;
              }
              else {
                long long v122 = v189;
              }
              if (v13 > 0.0 && v122)
              {
                unsigned int v26 = v13 * -2.0 + 1.0 + v13 * -2.0 + 1.0;
                -[MPEffect setSize:](v53, "setSize:", v26, v26);
                -[MPEffect setPosition:](v53, "setPosition:", CGPointZero.x, y);
              }
              double v23 = &CATransform3DGetAffineTransform_ptr;
              id v30 = v194;
              if (v11 != 1.0)
              {
                v227 = 0u;
                v228 = 0u;
                v225 = 0u;
                v226 = 0u;
                long long v123 = [(MPEffect *)v53 slides];
                long long v124 = [(NSArray *)v123 countByEnumeratingWithState:&v225 objects:v268 count:16];
                if (v124)
                {
                  long long v125 = v124;
                  long long v126 = *(void *)v226;
                  do
                  {
                    for (kid k = 0; kk != v125; kid k = (char *)kk + 1)
                    {
                      if (*(void *)v226 != v126) {
                        objc_enumerationMutation(v123);
                      }
                      long long v128 = *(void **)(*((void *)&v225 + 1) + 8 * (void)kk);
                      if ([v128 hasMovie]) {
                        [v128 setAudioVolume:v11];
                      }
                    }
                    long long v125 = [(NSArray *)v123 countByEnumeratingWithState:&v225 objects:v268 count:16];
                  }
                  while (v125);
                }
              }
              a5 = v198;
              if (v188)
              {
                v223 = 0u;
                v224 = 0u;
                v221 = 0u;
                v222 = 0u;
                long long v129 = [(MPEffect *)v53 slides];
                long long v130 = [(NSArray *)v129 countByEnumeratingWithState:&v221 objects:v267 count:16];
                if (v130)
                {
                  long long v131 = v130;
                  long long v132 = *(void *)v222;
                  do
                  {
                    for (mm = 0; mm != v131; mm = (char *)mm + 1)
                    {
                      if (*(void *)v222 != v132) {
                        objc_enumerationMutation(v129);
                      }
                      long long v134 = *(void **)(*((void *)&v221 + 1) + 8 * (void)mm);
                      if ([v134 hasMovie])
                      {
                        [v134 setAudioDuckInDuration:1.0];
                        [v134 setAudioDuckOutDuration:1.0];
                        [v134 setAudioDuckLevel:0.25];
                      }
                    }
                    long long v131 = [(NSArray *)v129 countByEnumeratingWithState:&v221 objects:v267 count:16];
                  }
                  while (v131);
                }
              }
              [v194 addEffect:v53];
              long long v135 = (uint64_t)v200;
              if ((uint64_t)v200 >= v204) {
                long long v135 = v204;
              }
              unsigned int v25 = &v202[v135];
              double v24 = v207;
              id v32 = v209 + 1;
              long long v33 = v201 + 1;
            }
            while ((id)(v201 + 1) != v196);
            long long v196 = [v181 countByEnumeratingWithState:&v257 objects:v276 count:16];
          }
          while (v196);
        }
        if (v175 && [v175 count]) {
          [v30 addFilters:v175];
        }
        if (v30) {
          [v180 addObject:v30];
        }
        ++v24;

        if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * v24 + 0x888888888888888, 1) <= 0x888888888888888uLL)
        {

          long long v178 = objc_alloc_init((Class)NSAutoreleasePool);
        }
        id v28 = v179 + 1;
      }
      while ((id)(v179 + 1) != v176);
      long long v176 = [a4 countByEnumeratingWithState:&v261 objects:v277 count:16];
    }
    while (v176);
  }
  if (v185) {

  }
  long long v136 = (char *)[v180 count];
  v217 = 0u;
  v218 = 0u;
  v219 = 0u;
  v220 = 0u;
  long long v137 = [v180 countByEnumeratingWithState:&v217 objects:v266 count:16];
  if (!v137)
  {
    [v178 drain];
    goto LABEL_253;
  }
  uint64_t v138 = v137;
  id v139 = 0;
  v210 = *(id *)v218;
  long long v206 = 0;
  do
  {
    id v140 = 0;
    long long v208 = 1 - (void)v136 + v139;
    do
    {
      if (*(id *)v218 != v210) {
        objc_enumerationMutation(v180);
      }
      id v141 = *(void **)(*((void *)&v217 + 1) + 8 * (void)v140);
      unsigned int v142 = v212;
      if (v177)
      {
        long long v143 = [*(id *)(*((void *)&v217 + 1) + 8 * (void)v140) effects];
        unsigned int v142 = v212;
        if ([v143 count])
        {
          long long v144 = objc_msgSend(v177, "objectForKey:", objc_msgSend(objc_msgSend(v143, "objectAtIndex:", 0), "effectPresetID"));
          unsigned int v142 = v212;
          if (v144)
          {
            long long v145 = v144;
            unsigned int v142 = [v212 mutableCopy];
            long long v146 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v145, 0);
            [v142 setObject:v146 forKey:kMPAuthoringTransitionList];
          }
        }
      }
      if (((v167 | v172 | v171) ^ 1) & 1 | ((uint64_t)((char *)v140 + v139) >= (uint64_t)v136)
        || !v141
        || !objc_msgSend(objc_msgSend(v141, "effects"), "count"))
      {
        goto LABEL_243;
      }
      if ((v172 & 1) == 0) {
        goto LABEL_223;
      }
      long long v147 = [self->_delegate document:self->_authoredDocument shouldUseDefaultTransitionForEffectContainer:v141 containerIndex:(char *)v140 + v139 layerIndex:v192];
      if ((v147 | v168))
      {
        if (!v147) {
          goto LABEL_243;
        }
LABEL_223:
        long long v148 = v171;
        if ((char *)v140 + v208) {
          long long v148 = 0;
        }
        if (v148 == 1)
        {
          long long v149 = [(MPAuthoringController *)self loopTransitionFromOptions:v212];
        }
        else
        {
          if ((char *)v140 + v208)
          {
            long long v150 = [v180 objectAtIndex:(char *)v140 + v139 + 1];
          }
          else
          {
            if ([v198 objectForKey:kMPAuthoringUseLoopTransition]
              && ![v141 countOfEffects]
              && (objc_msgSend(objc_msgSend(v198, "objectForKey:", kMPAuthoringUseLoopTransition), "BOOLValue") & 1) == 0)
            {
              goto LABEL_243;
            }
            long long v150 = 0;
          }
          if (v170) {
            long long v149 = [v170 copy];
          }
          else {
            long long v149 = [(MPAuthoringController *)self transitionFromOptions:v142 firstEffectContainer:v141 nextEffectContainer:v150];
          }
        }
        goto LABEL_237;
      }
      long long v149 = [self->_delegate document:self->_authoredDocument needsTransitionForEffectContainer:v141 containerIndex:(char *)v140 + v139 layerIndex:v192];
LABEL_237:
      long long v151 = v149;
      if (!v149) {
        goto LABEL_243;
      }
      [v141 setTransition:v149];
      if ((v169 & 1) == 0)
      {
LABEL_242:
        long long v153 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", objc_msgSend(v151, "transitionPresetID"), 0);
        [v212 setObject:v153 forKey:kMPAuthoringIgnoreTransitionList];

        goto LABEL_243;
      }
      if (v170) {
        goto LABEL_243;
      }
      long long v152 = [v151 transitionPresetID];
      if (v206)
      {
        if ([v206 isEqualToString:v152]) {
          goto LABEL_242;
        }
        [v212 removeObjectForKey:kMPAuthoringIgnoreTransitionList];
      }
      long long v206 = v152;
LABEL_243:
      long long v154 = v180;
      if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * ((void)v140 + v139) - 0x888888888888889, 1) <= 0x888888888888888uLL)
      {

        long long v178 = objc_alloc_init((Class)NSAutoreleasePool);
        long long v154 = v180;
      }
      id v140 = (char *)v140 + 1;
    }
    while (v138 != v140);
    long long v155 = [v154 countByEnumeratingWithState:&v217 objects:v266 count:16];
    uint64_t v138 = v155;
    v139 += (uint64_t)v140;
  }
  while (v155);
  [v178 drain];
  if (v206) {

  }
LABEL_253:
  v211 = +[MPAuthoringUtilities gapInformationFromOptions:v198];
  if (v211)
  {
    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    long long v156 = [v211 countByEnumeratingWithState:&v213 objects:v265 count:16];
    if (v156)
    {
      long long v157 = v156;
      long long v158 = 0;
      long long v159 = *(void *)v214;
      do
      {
        for (nn = 0; nn != v157; nn = (char *)nn + 1)
        {
          if (*(void *)v214 != v159) {
            objc_enumerationMutation(v211);
          }
          long long v161 = *(void **)(*((void *)&v213 + 1) + 8 * (void)nn);
          long long v162 = (char *)objc_msgSend(objc_msgSend(v161, "objectForKey:", @"index"), "integerValue");
          objc_msgSend(objc_msgSend(v161, "objectForKey:", @"duration"), "doubleValue");
          long long v164 = v163;
          long long v165 = +[MPEffectContainer effectContainer];
          [v165 setDuration:v164];
          if ((uint64_t)&v162[(void)nn + v158] >= 1) {
            objc_msgSend(objc_msgSend(v180, "objectAtIndex:", &v162[v158 - 1 + (void)nn]), "setTransition:", 0);
          }
          objc_msgSend(objc_msgSend(v180, "objectAtIndex:", &v162[(void)nn + v158]), "setTransition:", 0);
          [v180 insertObject:v165 atIndex:&v162[(void)nn + v158]];
        }
        long long v157 = [v211 countByEnumeratingWithState:&v213 objects:v265 count:16];
        v158 += (uint64_t)nn;
      }
      while (v157);
    }
  }

  return v180;
}

- (id)createEffectToTransitionMapWithOptions:(id)a3
{
  id v4 = +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:");
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "titleEffectLayoutsForStyleID:", v4));
  objc_msgSend(v6, "addObjectsFromArray:", +[MPAuthoringUtilities effectListFromOptions:](MPAuthoringUtilities, "effectListFromOptions:", a3));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (id i = 0; i != v8; id i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 objectForKey:@"transitionID"];
        if (v12) {
          objc_msgSend(v5, "setObject:forKey:", v12, objc_msgSend(v11, "objectForKey:", @"presetID"));
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    return v5;
  }
  else {
    return 0;
  }
}

- (id)loopTransitionFromOptions:(id)a3
{
  id v5 = +[MPAuthoringUtilities loopTransitionIDFromOptions:](MPAuthoringUtilities, "loopTransitionIDFromOptions:");
  if ([v5 isEqualToString:@"Use Default"])
  {
    return [(MPAuthoringController *)self transitionFromOptions:a3];
  }
  else
  {
    id v7 = +[MPAuthoringUtilities idFromPresetID:v5];
    id v8 = +[MPAuthoringUtilities presetIDFromPresetID:v5];
    if (v7)
    {
      id v9 = v8;
      id v7 = +[MPTransition transitionWithTransitionID:v7];
      [(MPTransition *)v7 setPresetID:v9];
    }
    return v7;
  }
}

- (id)exportTransitionFromOptions:(id)a3
{
  id v3 = +[MPAuthoringUtilities exportTransitionIDFromOptions:a3];
  id v4 = +[MPAuthoringUtilities idFromPresetID:v3];
  id v5 = +[MPAuthoringUtilities presetIDFromPresetID:v3];
  id v6 = +[MPTransition transitionWithTransitionID:v4];
  [(MPTransition *)v6 setPresetID:v5];
  return v6;
}

- (id)sortImagePaths:(id)a3 toAspectRatiosInEffectPresetID:(id)a4 withOptions:(id)a5
{
  if ([a3 count] == (char *)&dword_0 + 1
    || objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numOfImagesForEffectPresetID:", a4) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = +[NSMutableArray array];
    if ([a3 count])
    {
      unint64_t v9 = 0;
      do
        objc_msgSend(v8, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9++));
      while (v9 < (unint64_t)[a3 count]);
    }
    return v8;
  }
  id v10 = +[MPUtilities idOfCombinedID:a4];
  id v11 = +[MPUtilities presetIDOfCombinedID:a4];
  +[MPAuthoringUtilities aspectRatioFromOptions:a5];
  id v13 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "mediaAspectRatioHintsForEffectID:usingPresetID:defaultAspectRatio:", v10, v11, v12);
  id obj = +[NSMutableArray array];
  id v14 = [v13 count];
  if ((uint64_t)v14 < 1)
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    uint64_t v16 = 0;
    uint64_t v120 = 0;
  }
  else
  {
    id v15 = v14;
    uint64_t v120 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    for (int64_t i = 0; (id)i != v15; ++i)
    {
      id v20 = [v13 objectForKey:ImageKey(i)];
      [v20 floatValue];
      if (v21 <= 0.95)
      {
        ++v120;
      }
      else if (v21 >= 3.0)
      {
        ++v18;
      }
      else if (v21 >= 1.075)
      {
        ++v16;
      }
      else
      {
        ++v17;
      }
      [obj addObject:v20];
    }
  }
  uint64_t v118 = v16;
  uint64_t v112 = v18;
  p_cache = MCConditionalAction.cache;
  id v23 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "imageInputInfoForEffectID:", v10);
  id v123 = +[NSMutableIndexSet indexSet];
  id v124 = +[NSMutableIndexSet indexSet];
  id v116 = +[NSMutableIndexSet indexSet];
  double v24 = (char *)[v23 count];
  if ((uint64_t)v24 >= 1)
  {
    unsigned int v25 = v24;
    unsigned int v26 = 0;
    uint64_t v27 = 0;
    while (1)
    {
      unint64_t v28 = (unint64_t)objc_msgSend(objc_msgSend(p_cache + 213, "sharedManager"), "panoTypeForSlideAtIndex:inEffect:forPresetID:", v26, v10, v11);
      if (v28 <= 6)
      {
        unint64_t v29 = v28;
        uint64_t v30 = 1 << v28;
        id v31 = v124;
        if ((v30 & 0x12) != 0) {
          goto LABEL_26;
        }
        id v31 = v123;
        if (((1 << v29) & 0x24) != 0) {
          goto LABEL_26;
        }
        if (((1 << v29) & 0x48) != 0) {
          break;
        }
      }
LABEL_28:
      ++v26;
      p_cache = (void **)(MCConditionalAction + 16);
      if (v25 == v26) {
        goto LABEL_31;
      }
    }
    id v31 = v116;
LABEL_26:
    [v31 addIndex:v26];
    if (v29 == 6) {
      ++v27;
    }
    goto LABEL_28;
  }
  uint64_t v27 = 0;
LABEL_31:
  id v32 = (char *)[v123 count];
  id v33 = [v124 count];
  unint64_t v34 = (unint64_t)[v116 count];
  id v35 = [obj count];
  if (v35 != [a3 count]
    || (id v36 = &v32[(void)v33 + v34], v120 >= 1) && !v118 && !v17 && !v18 && !v36
    || !v120 && v118 >= 1 && !v17 && !v18 && !v36
    || !v120 && !v118 && v17 >= 1 && !v18 && !v36
    || v27 == v17 + v18 + v118 + v120)
  {
    id v8 = +[NSMutableArray array];
    if ([a3 count])
    {
      unint64_t v37 = 0;
      do
        objc_msgSend(v8, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v37++));
      while (v37 < (unint64_t)[a3 count]);
    }
    return v8;
  }
  uint64_t v105 = (uint64_t)&v32[(void)v33 + v34];
  id v39 = +[NSMutableArray array];
  id v111 = +[NSMutableArray array];
  id v40 = +[NSMutableArray array];
  id v114 = +[NSMutableArray array];
  id v117 = +[NSMutableArray array];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v110 = v39;
  id v113 = v40;
  id v121 = [a3 countByEnumeratingWithState:&v139 objects:v146 count:16];
  if (!v121) {
    goto LABEL_92;
  }
  uint64_t v108 = 0;
  uint64_t v109 = 0;
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  uint64_t v115 = 0;
  uint64_t v41 = 0;
  char v42 = 0;
  uint64_t v119 = *(void *)v140;
  do
  {
    long long v43 = 0;
    do
    {
      if (*(void *)v140 != v119) {
        objc_enumerationMutation(a3);
      }
      id v44 = [(NSMutableDictionary *)self->_cachedROIInformation objectForKey:*(void *)(*((void *)&v139 + 1) + 8 * (void)v43)];
      objc_msgSend(objc_msgSend(v44, "objectForKey:", @"aspectRatio"), "floatValue");
      float v46 = v45;
      objc_msgSend(objc_msgSend(v44, "objectForKey:", @"imageAspectRatio"), "floatValue");
      float v48 = v47;
      unsigned int v49 = objc_msgSend(objc_msgSend(v44, "objectForKey:", @"fitsInExtraWide"), "BOOLValue");
      id v50 = objc_msgSend(objc_msgSend(v44, "objectForKey:", @"roiCount"), "integerValue");
      unsigned int v51 = objc_msgSend(objc_msgSend(v44, "objectForKey:", @"wasFlipped"), "BOOLValue");
      if (v46 < 0.5 && ([v123 count] || objc_msgSend(v116, "count")))
      {
        id v52 = +[NSNumber numberWithInteger:(char *)v43 + v41];
        uint64_t v53 = v117;
LABEL_65:
        [v53 addObject:v52];
        goto LABEL_66;
      }
      if (v46 > 2.0 && ([v124 count] || objc_msgSend(v116, "count")))
      {
        id v52 = +[NSNumber numberWithInteger:(char *)v43 + v41];
        uint64_t v53 = v114;
        goto LABEL_65;
      }
      if (v115 < v112 && v48 > 1.0 && ((v49 ^ 1) & 1) == 0)
      {
        objc_msgSend(v113, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)v43 + v41));
        ++v115;
        goto LABEL_66;
      }
      if (v46 <= 1.0) {
        unsigned int v54 = v51;
      }
      else {
        unsigned int v54 = 0;
      }
      if (v46 <= 1.0 && v54 == 0)
      {
        if ((uint64_t)v50 <= 1)
        {
          ++v108;
          id v52 = +[NSNumber numberWithInteger:(char *)v43 + v41];
          uint64_t v53 = v110;
          goto LABEL_65;
        }
        unsigned int v61 = objc_msgSend(objc_msgSend(v44, "objectForKey:", @"intersects"), "BOOLValue");
        long long v57 = +[NSNumber numberWithInteger:(char *)v43 + v41];
        if (v61)
        {
          unsigned int v58 = v110;
          unsigned int v59 = (char *)[v110 count];
          uint64_t v60 = v108;
          goto LABEL_87;
        }
        [v110 insertObject:v57 atIndex:v106++];
      }
      else
      {
        if ((uint64_t)v50 <= 1)
        {
          ++v109;
          id v52 = +[NSNumber numberWithInteger:(char *)v43 + v41];
          uint64_t v53 = v111;
          goto LABEL_65;
        }
        unsigned int v56 = objc_msgSend(objc_msgSend(v44, "objectForKey:", @"intersects"), "BOOLValue");
        long long v57 = +[NSNumber numberWithInteger:(char *)v43 + v41];
        if (v56)
        {
          unsigned int v58 = v111;
          unsigned int v59 = (char *)[v111 count];
          uint64_t v60 = v109;
LABEL_87:
          [v58 insertObject:v57 atIndex:&v59[-v60]];
          goto LABEL_66;
        }
        [v111 insertObject:v57 atIndex:v107++];
      }
LABEL_66:
      v42 |= (uint64_t)v50 > 0;
      long long v43 = (char *)v43 + 1;
    }
    while (v121 != v43);
    id v62 = [a3 countByEnumeratingWithState:&v139 objects:v146 count:16];
    v41 += (uint64_t)v43;
    id v121 = v62;
  }
  while (v62);
  id v39 = v110;
  id v40 = v113;
  if (v42) {
    goto LABEL_99;
  }
LABEL_92:
  if (([v39 count]
     || [v40 count]
     || ![v111 count]
     || [v114 count]
     || [v117 count])
    && (![v39 count]
     || [v40 count]
     || [v111 count]
     || [v114 count]
     || [v117 count]))
  {
LABEL_99:
    if (self->_logLevel > 1)
    {
      -[NSMutableDictionary setObject:forKey:](self->_stats, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_stats, "objectForKey:", @"numOfLandscapes"), "integerValue")+ (void)objc_msgSend(v111, "count")), @"numOfLandscapes");
      -[NSMutableDictionary setObject:forKey:](self->_stats, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_stats, "objectForKey:", @"numOfPortraits"), "integerValue")+ (void)objc_msgSend(v39, "count")), @"numOfPortraits");
    }
    id v8 = +[NSMutableArray array];
    uint64_t v63 = (char *)[a3 count];
    if ((uint64_t)v63 >= 1)
    {
      uint64_t v64 = v63;
      do
      {
        objc_msgSend(v8, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -1));
        --v64;
      }
      while (v64);
    }
    if (v105 >= 1)
    {
      int v65 = (char *)[obj count];
      if ((uint64_t)v65 >= 1)
      {
        long long v66 = v65;
        for (j = 0; j != v66; ++j)
        {
          if (![v123 containsIndex:j] || (long long v68 = v117, !objc_msgSend(v117, "count")))
          {
            if (![v124 containsIndex:j]) {
              continue;
            }
            long long v68 = v114;
            if (![v114 count]) {
              continue;
            }
          }
          objc_msgSend(v8, "replaceObjectAtIndex:withObject:", j, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(v68, "objectAtIndex:", 0), "integerValue")));
          [v68 removeObjectAtIndex:0];
        }
        for (id k = 0; k != v66; ++k)
        {
          if (((unint64_t)objc_msgSend(objc_msgSend(v8, "objectAtIndex:", k), "integerValue") & 0x8000000000000000) != 0)
          {
            if ([v116 containsIndex:k] && (id v70 = v117, objc_msgSend(v117, "count"))
              || [v116 containsIndex:k] && (id v70 = v114, objc_msgSend(v114, "count")))
            {
              objc_msgSend(v8, "replaceObjectAtIndex:withObject:", k, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(v70, "objectAtIndex:", 0), "integerValue")));
              [v70 removeObjectAtIndex:0];
            }
          }
        }
      }
    }
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v71 = [obj countByEnumeratingWithState:&v135 objects:v145 count:16];
    if (v71)
    {
      id v72 = v71;
      uint64_t v73 = 0;
      uint64_t v74 = *(void *)v136;
      do
      {
        id v75 = 0;
        do
        {
          if (*(void *)v136 != v74) {
            objc_enumerationMutation(obj);
          }
          id v76 = *(void **)(*((void *)&v135 + 1) + 8 * (void)v75);
          if (((unint64_t)objc_msgSend(objc_msgSend(v8, "objectAtIndex:", (char *)v75 + v73), "integerValue") & 0x8000000000000000) != 0)
          {
            [v76 floatValue];
            if (v77 >= 3.0 && [v113 count])
            {
              id v78 = v113;
LABEL_143:
              objc_msgSend(v8, "replaceObjectAtIndex:withObject:", (char *)v75 + v73, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(v78, "objectAtIndex:", 0), "integerValue")));
              [v78 removeObjectAtIndex:0];
              goto LABEL_144;
            }
            [v76 floatValue];
            if (v79 < 1.075)
            {
              [v76 floatValue];
              if (v80 > 0.95) {
                goto LABEL_144;
              }
              if (self->_logLevel >= 2) {
                -[NSMutableDictionary setObject:forKey:](self->_stats, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_stats, "objectForKey:", @"numOfDZPortraits"), "integerValue")+ 1), @"numOfDZPortraits");
              }
              id v78 = v110;
              if ([v110 count]) {
                goto LABEL_143;
              }
              if (![v111 count]) {
                goto LABEL_144;
              }
              if (self->_logLevel >= 2) {
                -[NSMutableDictionary setObject:forKey:](self->_stats, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_stats, "objectForKey:", @"misplacedLandscapes"), "integerValue")+ 1), @"misplacedLandscapes");
              }
              id v81 = v111;
              goto LABEL_150;
            }
            if (self->_logLevel >= 2) {
              -[NSMutableDictionary setObject:forKey:](self->_stats, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_stats, "objectForKey:", @"numOfDZLandscapes"), "integerValue")+ 1), @"numOfDZLandscapes");
            }
            id v78 = v111;
            if ([v111 count]) {
              goto LABEL_143;
            }
            id v78 = v113;
            if ([v113 count]) {
              goto LABEL_143;
            }
            if ([v110 count])
            {
              if (self->_logLevel >= 2) {
                -[NSMutableDictionary setObject:forKey:](self->_stats, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_stats, "objectForKey:", @"misplacedPortraits"), "integerValue")+ 1), @"misplacedPortraits");
              }
              id v81 = v110;
LABEL_150:
              objc_msgSend(v8, "replaceObjectAtIndex:withObject:", (char *)v75 + v73, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(v81, "lastObject"), "integerValue")));
              [v81 removeLastObject];
            }
          }
LABEL_144:
          id v75 = (char *)v75 + 1;
        }
        while (v72 != v75);
        id v82 = [obj countByEnumeratingWithState:&v135 objects:v145 count:16];
        id v72 = v82;
        v73 += (uint64_t)v75;
      }
      while (v82);
    }
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v83 = [obj countByEnumeratingWithState:&v131 objects:v144 count:16];
    unsigned __int8 v84 = v111;
    if (v83)
    {
      id v85 = v83;
      uint64_t v86 = 0;
      uint64_t v87 = *(void *)v132;
      do
      {
        for (m = 0; m != v85; m = (char *)m + 1)
        {
          if (*(void *)v132 != v87) {
            objc_enumerationMutation(obj);
          }
          id v89 = *(void **)(*((void *)&v131 + 1) + 8 * (void)m);
          if (((unint64_t)objc_msgSend(objc_msgSend(v8, "objectAtIndex:", (char *)m + v86), "integerValue") & 0x8000000000000000) != 0)
          {
            [v89 floatValue];
            if (v90 > 0.95)
            {
              [v89 floatValue];
              if (v91 < 1.075)
              {
                if (self->_logLevel >= 2)
                {
                  unsigned __int8 v84 = v111;
                  -[NSMutableDictionary setObject:forKey:](self->_stats, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_stats, "objectForKey:", @"numOfDZSquares"), "integerValue")+ 1), @"numOfDZSquares");
                }
                id v92 = v84;
                if ([v84 count]
                  || (id v92 = v110, [v110 count])
                  || (id v92 = v113, [v113 count]))
                {
                  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", (char *)m + v86, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(v92, "objectAtIndex:", 0), "integerValue")));
                  [v92 removeObjectAtIndex:0];
                }
              }
            }
          }
        }
        id v85 = [obj countByEnumeratingWithState:&v131 objects:v144 count:16];
        v86 += (uint64_t)m;
      }
      while (v85);
    }
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v93 = [obj countByEnumeratingWithState:&v127 objects:v143 count:16];
    if (v93)
    {
      id v94 = v93;
      uint64_t v95 = 0;
      uint64_t v96 = *(void *)v128;
      id v122 = v8;
      do
      {
        for (n = 0; n != v94; n = (char *)n + 1)
        {
          if (*(void *)v128 != v96) {
            objc_enumerationMutation(obj);
          }
          long long v98 = (char *)n + v95;
          long long v99 = *(void **)(*((void *)&v127 + 1) + 8 * (void)n);
          if (((unint64_t)objc_msgSend(objc_msgSend(v8, "objectAtIndex:", (char *)n + v95), "integerValue") & 0x8000000000000000) != 0)
          {
            if (self->_logLevel >= 2)
            {
              id v8 = v122;
              -[NSMutableDictionary setObject:forKey:](self->_stats, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->_stats, "objectForKey:", @"numOfDZFallbacks"), "integerValue")+ 1), @"numOfDZFallbacks");
            }
            [v99 floatValue];
            if (v100 < 1.0) {
              id v101 = v117;
            }
            else {
              id v101 = v114;
            }
            id v102 = [v101 count];
            if (v101 == v114) {
              id v103 = v117;
            }
            else {
              id v103 = v114;
            }
            if (!v102) {
              id v101 = v103;
            }
            if ([v101 count])
            {
              objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v98, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(objc_msgSend(v101, "objectAtIndex:", 0), "integerValue")));
              [v101 removeObjectAtIndex:0];
            }
            else
            {
              objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v98, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
            }
          }
        }
        id v94 = [obj countByEnumeratingWithState:&v127 objects:v143 count:16];
        v95 += (uint64_t)n;
      }
      while (v94);
    }
  }
  else
  {
    id v8 = +[NSMutableArray array];
    if ([a3 count])
    {
      unint64_t v104 = 0;
      do
        objc_msgSend(v8, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v104++));
      while (v104 < (unint64_t)[a3 count]);
    }
  }
  return v8;
}

- (id)filtersForLayerFromOptions:(id)a3
{
  id v4 = +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:");
  int64_t v5 = +[MPAuthoringUtilities layerIndexFromOptions:a3];
  id v6 = +[NSMutableArray array];
  id v7 = objc_msgSend(+[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:](MPAuthoringUtilities, "layerDescriptionForLayerWithZIndex:forStyle:", v5, v4), "objectForKey:", @"layerFilterPresets");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (int64_t i = 0; i != v9; int64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = +[MPFilter filterWithFilterID:](MPFilter, "filterWithFilterID:", [v12 stringByDeletingLastPathComponent]);
        -[MPFilter setPresetID:](v13, "setPresetID:", [v12 lastPathComponent]);
        [v6 addObject:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  return v6;
}

- (id)filtersForEffectFromOptions:(id)a3
{
  int64_t v4 = +[MPAuthoringUtilities layerIndexFromOptions:](MPAuthoringUtilities, "layerIndexFromOptions:");
  id v5 = +[MPAuthoringUtilities styleFromOptions:a3];
  id v6 = +[NSMutableArray array];
  objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "defaultFilterLikelihoodForZIndex:ofStyle:", v4, v5);
  double v8 = v7;
  uint64_t v9 = random();
  if (v8 == -1.0)
  {
    if (0xAAAAAAAAAAAAAAABLL * v9 + 0x2AAAAAAAAAAAAAAALL >= 0x5555555555555555) {
      return v6;
    }
  }
  else if ((double)(v9 % 100) + v8 * -100.0 >= 0.0)
  {
    return v6;
  }
  id v10 = objc_msgSend(+[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:](MPAuthoringUtilities, "layerDescriptionForLayerWithZIndex:forStyle:", v4, v5), "objectForKey:", @"filterPresets");
  if (![v10 count]) {
    return 0;
  }
  id v11 = objc_msgSend(v10, "objectAtIndex:", random() % (unint64_t)objc_msgSend(v10, "count"));
  if (v11)
  {
    double v12 = v11;
    id v13 = +[MPFilter filterWithFilterID:](MPFilter, "filterWithFilterID:", [v11 stringByDeletingLastPathComponent]);
    -[MPFilter setPresetID:](v13, "setPresetID:", [v12 lastPathComponent]);
    [v6 addObject:v13];
  }
  return v6;
}

- (id)filtersForSlideFromOptions:(id)a3
{
  id v4 = +[NSMutableArray array];
  id v5 = objc_msgSend(+[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:](MPAuthoringUtilities, "layerDescriptionForLayerWithZIndex:forStyle:", +[MPAuthoringUtilities layerIndexFromOptions:](MPAuthoringUtilities, "layerIndexFromOptions:", a3), +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a3)), "objectForKey:", @"filterPresets");
  if (v5)
  {
    id v6 = v5;
    if ([v5 count])
    {
      id v7 = objc_msgSend(v6, "objectAtIndex:", random() % (unint64_t)objc_msgSend(v6, "count"));
      if (v7)
      {
        double v8 = v7;
        uint64_t v9 = +[MPFilter filterWithFilterID:](MPFilter, "filterWithFilterID:", [v7 stringByDeletingLastPathComponent]);
        -[MPFilter setPresetID:](v9, "setPresetID:", [v8 lastPathComponent]);
        [v4 addObject:v9];
      }
    }
  }
  return v4;
}

- (id)frameFromOptions:(id)a3
{
  id v3 = objc_msgSend(+[MPAuthoringUtilities layerDescriptionForLayerWithZIndex:forStyle:](MPAuthoringUtilities, "layerDescriptionForLayerWithZIndex:forStyle:", +[MPAuthoringUtilities layerIndexFromOptions:](MPAuthoringUtilities, "layerIndexFromOptions:"), +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a3)), "objectForKey:", @"frames");
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  if (![v3 count]) {
    return 0;
  }
  id v5 = objc_msgSend(v4, "objectAtIndex:", random() % (unint64_t)objc_msgSend(v4, "count"));
  if (!v5) {
    return 0;
  }
  return +[MPFrame frameWithFrameID:v5];
}

- (id)createAudioPlayListFromAudioPaths:(id)a3 andOptions:(id)a4
{
  id v6 = +[MPAudioPlaylist audioPlaylist];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v7, "addObject:", +[MPSong songWithPath:](MPSong, "songWithPath:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11)));
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  [v6 addSongs:v7];
  if (+[MPAuthoringUtilities fadeOutAudioFromOptions:a4])
  {
    [v6 setFadeOutDuration:1.0];
  }

  return v6;
}

- (id)pickRandomPathsInArray:(id)a3 excludingPaths:(id)a4 count:(int64_t)a5
{
  id v8 = +[NSMutableArray array];
  for (id i = [a3 mutableCopy];
        (unint64_t)[v8 count] < a5 && objc_msgSend(i, "count");
        [i removeObjectAtIndex:v11])
  {
    unint64_t v10 = random();
    unint64_t v11 = v10 % (unint64_t)[i count];
    id v12 = [i objectAtIndex:v11];
    if (([a4 containsObject:v12] & 1) == 0) {
      [v8 addObject:v12];
    }
  }

  while ((unint64_t)[v8 count] < a5)
    objc_msgSend(v8, "addObject:", objc_msgSend(a3, "objectAtIndex:", random() % (unint64_t)objc_msgSend(a3, "count")));
  return v8;
}

- (id)transitionFromOptions:(id)a3 firstEffectContainer:(id)a4 nextEffectContainer:(id)a5
{
  CGAffineTransform *(__cdecl **v53)(CGAffineTransform *__return_ptr __struct_ptr, CATransform3D *__struct_ptr);
  void *v54;
  unsigned __int8 v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *m;
  void *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  void *n;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  void *ii;
  void *v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *jj;
  void *v80;
  unint64_t v81;
  id v82;
  MPTransition *v83;
  double v84;
  double v85;
  double v86;
  void *v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  id obj;
  long long v99;
  long long v100;
  long long v101;
  long long v102;
  long long v103;
  long long v104;
  long long v105;
  long long v106;
  long long v107;
  long long v108;
  long long v109;
  long long v110;
  long long v111;
  long long v112;
  long long v113;
  long long v114;
  long long v115;
  long long v116;
  long long v117;
  long long v118;
  long long v119;
  long long v120;
  long long v121;
  long long v122;
  long long v123;
  long long v124;
  long long v125;
  long long v126;
  unsigned char v127[128];
  unsigned char v128[128];
  unsigned char v129[128];
  unsigned char v130[128];
  unsigned char v131[128];
  unsigned char v132[128];
  unsigned char v133[128];

  id v9 = +[MPTransitionManager sharedManager];
  p_info = MRTiledSprite.info;
  id v11 = +[MPAuthoringUtilities transitionListFromOptions:a3];
  if (![v11 count]) {
    return 0;
  }
  if ([(MPWeighter *)self->_transitionWeighter count] >= 1)
  {
    if (+[MPAuthoringUtilities effectDecidesTransitionFromOptions:a3])
    {
      unint64_t v12 = -[MPWeighter getRandomIndexMeetingContraints:](self->_transitionWeighter, "getRandomIndexMeetingContraints:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(objc_msgSend(a4, "objectInEffectsAtIndex:", 0), "presetID"), @"presetID", 0));
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndex];
      }
LABEL_149:
      id v15 = [v11 objectAtIndex:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v15 = [v15 objectForKey:@"presetID"];
      }
      goto LABEL_151;
    }
    id v92 = a5;
    uint64_t v95 = v11;
    uint64_t v96 = a3;
    id v16 = +[MPAuthoringUtilities ignoreTransitionListFromOptions:a3];
    id v17 = +[NSMutableIndexSet indexSet];
    id v123 = 0u;
    id v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v18 = [v16 countByEnumeratingWithState:&v123 objects:v133 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v124;
      do
      {
        for (id i = 0; i != v19; id i = (char *)i + 1)
        {
          if (*(void *)v124 != v20) {
            objc_enumerationMutation(v16);
          }
          id v22 = objc_msgSend(-[MPWeighter allItems](self->_transitionWeighter, "allItems"), "indexOfObject:", *(void *)(*((void *)&v123 + 1) + 8 * i));
          if (v22 != (id)0x7FFFFFFFFFFFFFFFLL) {
            [v17 addIndex:v22];
          }
        }
        id v19 = [v16 countByEnumeratingWithState:&v123 objects:v133 count:16];
      }
      while (v19);
    }
    [(MPWeighter *)self->_transitionWeighter ignoreIndices:v17];
    p_info = MRTiledSprite.info;
    a3 = v96;
    if (!+[MPAuthoringUtilities useTransitionLayoutTagsWithOptions:v96])goto LABEL_61; {
    id v23 = [a4 objectInEffectsAtIndex:0];
    }
    id v24 = [v23 effectID];
    id v25 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", v24, objc_msgSend(v23, "presetID"));
    unsigned __int8 v26 = +[MPAuthoringUtilities aspectRatioMatchesDefault:withOptions:](MPAuthoringUtilities, "aspectRatioMatchesDefault:withOptions:", objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "aspectRatioForEffectID:", v24), v96);
    id v89 = v24;
    id v27 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "orientationForEffectID:", v24);
    unsigned int v28 = [v27 isEqualToString:@"landscape"];
    unsigned int v29 = [v27 isEqualToString:@"portrait"];
    long long v97 = objc_msgSend(objc_msgSend(v25, "objectForKey:", @"endLayoutTags"), "mutableCopy");
    float v91 = v9;
    if ((v26 & 1) == 0)
    {
      id v30 = [v97 copy];
      uint64_t v119 = 0u;
      uint64_t v120 = 0u;
      id v121 = 0u;
      id v122 = 0u;
      id v31 = [v30 countByEnumeratingWithState:&v119 objects:v132 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v120;
        do
        {
          for (j = 0; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v120 != v33) {
              objc_enumerationMutation(v30);
            }
            id v35 = *(void **)(*((void *)&v119 + 1) + 8 * (void)j);
            if (v28
              && ([*(id *)(*((void *)&v119 + 1) + 8 * (void)j) hasPrefix:@"X"] & 1) != 0|| v29 && objc_msgSend(v35, "hasPrefix:", @"Y"))
            {
              [v97 removeObject:v35];
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v119 objects:v132 count:16];
        }
        while (v32);
      }

      a3 = v96;
    }
    id v36 = +[NSMutableSet set];
    id obj = +[NSMutableSet set];
    if (v92)
    {
      unsigned int v88 = v36;
      id v37 = [v92 objectInEffectsAtIndex:0];
      id v38 = [v37 effectID];
      id v39 = objc_msgSend(objc_msgSend(objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", v38, objc_msgSend(v37, "presetID")), "objectForKey:", @"startLayoutTags"), "mutableCopy");
      p_info = MRTiledSprite.info;
      unsigned __int8 v40 = +[MPAuthoringUtilities aspectRatioMatchesDefault:withOptions:](MPAuthoringUtilities, "aspectRatioMatchesDefault:withOptions:", objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "aspectRatioForEffectID:", v38), a3);
      id v41 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "orientationForEffectID:", v38);
      unsigned int v42 = [v41 isEqualToString:@"landscape"];
      unsigned int v43 = [v41 isEqualToString:@"portrait"];
      if ((v40 & 1) == 0)
      {
        unsigned int v44 = v43;
        id v93 = v38;
        float v45 = v39;
        id v46 = [v39 copy];
        uint64_t v115 = 0u;
        id v116 = 0u;
        id v117 = 0u;
        uint64_t v118 = 0u;
        id v47 = [v46 countByEnumeratingWithState:&v115 objects:v131 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v116;
          do
          {
            for (id k = 0; k != v48; id k = (char *)k + 1)
            {
              if (*(void *)v116 != v49) {
                objc_enumerationMutation(v46);
              }
              unsigned int v51 = *(void **)(*((void *)&v115 + 1) + 8 * (void)k);
              if (v42
                && ([*(id *)(*((void *)&v115 + 1) + 8 * (void)k) hasPrefix:@"X"] & 1) != 0|| v44 && objc_msgSend(v51, "hasPrefix:", @"Y"))
              {
                [v45 removeObject:v51];
              }
            }
            id v48 = [v46 countByEnumeratingWithState:&v115 objects:v131 count:16];
          }
          while (v48);
        }

        id v9 = v91;
        id v38 = v93;
        a3 = v96;
        p_info = MRTiledSprite.info;
        id v39 = v45;
      }
      unsigned int v52 = [v38 isEqualToString:@"JustASlide"];
      uint64_t v53 = &CATransform3DGetAffineTransform_ptr;
      id v36 = v88;
      if (v52)
      {
        unsigned int v54 = v97;
        [v88 addObjectsFromArray:v97];
        goto LABEL_56;
      }
      long long v55 = [v89 isEqualToString:@"JustASlide"];
      [v88 addObjectsFromArray:v39];
      if ((v55 & 1) == 0)
      {
        unsigned int v54 = v97;
        [v88 addObjectsFromArray:v97];
        [obj addObjectsFromArray:v39];
        objc_msgSend(obj, "intersectSet:", +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v97));
LABEL_56:
        id v94 = [v54 count];
        if ([v36 count]) {
          unint64_t v12 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:](self->_transitionWeighter, "getRandomIndexMeetingContraints:oneMatch:", objc_msgSend(v53[457], "dictionaryWithObjectsAndKeys:", objc_msgSend(v36, "allObjects"), @"tags", 0), 0);
        }
        else {
          unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (([0 isEqualToString:@"JustASlide"] & 1) == 0)
        {
          float v90 = v39;
          unsigned int v56 = [v97 mutableCopy];
          id v111 = 0u;
          uint64_t v112 = 0u;
          id v113 = 0u;
          id v114 = 0u;
          long long v57 = [v97 countByEnumeratingWithState:&v111 objects:v130 count:16];
          if (v57)
          {
            unsigned int v58 = v57;
            unsigned int v59 = *(void *)v112;
            do
            {
              for (m = 0; m != v58; m = (char *)m + 1)
              {
                if (*(void *)v112 != v59) {
                  objc_enumerationMutation(v97);
                }
                unsigned int v61 = *(void **)(*((void *)&v111 + 1) + 8 * (void)m);
                if (([v61 hasPrefix:@"X"] & 1) == 0) {
                  [v56 removeObject:v61];
                }
              }
              unsigned int v58 = [v97 countByEnumeratingWithState:&v111 objects:v130 count:16];
            }
            while (v58);
          }
          id v62 = [v97 mutableCopy];
          uint64_t v107 = 0u;
          uint64_t v108 = 0u;
          uint64_t v109 = 0u;
          long long v110 = 0u;
          uint64_t v63 = [v97 countByEnumeratingWithState:&v107 objects:v129 count:16];
          if (v63)
          {
            uint64_t v64 = v63;
            int v65 = *(void *)v108;
            do
            {
              for (n = 0; n != v64; n = (char *)n + 1)
              {
                if (*(void *)v108 != v65) {
                  objc_enumerationMutation(v97);
                }
                int v67 = *(void **)(*((void *)&v107 + 1) + 8 * (void)n);
                if (([v67 hasPrefix:@"Y"] & 1) == 0) {
                  [v62 removeObject:v67];
                }
              }
              uint64_t v64 = [v97 countByEnumeratingWithState:&v107 objects:v129 count:16];
            }
            while (v64);
          }
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v68 = obj;
            if (v94)
            {
              if ([v56 count]) {
                unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndexMeetingContraints:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v56, @"tags", +[NSNumber numberWithBool:1], @"tagsOnSourceOnly", 0) oneMatch:0];
              }
              else {
                unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
          }
          else
          {
            long long v68 = obj;
          }
          unsigned int v69 = [v68 mutableCopy];
          id v103 = 0u;
          unint64_t v104 = 0u;
          uint64_t v105 = 0u;
          uint64_t v106 = 0u;
          id v70 = [v68 countByEnumeratingWithState:&v103 objects:v128 count:16];
          if (v70)
          {
            id v71 = v70;
            id v72 = *(void *)v104;
            do
            {
              for (id ii = 0; ii != v71; id ii = (char *)ii + 1)
              {
                if (*(void *)v104 != v72) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v74 = *(void **)(*((void *)&v103 + 1) + 8 * (void)ii);
                if (([v74 hasPrefix:@"X"] & 1) == 0) {
                  [v69 removeObject:v74];
                }
              }
              long long v68 = obj;
              id v71 = [obj countByEnumeratingWithState:&v103 objects:v128 count:16];
            }
            while (v71);
          }
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v69 count]) {
              unint64_t v12 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:](self->_transitionWeighter, "getRandomIndexMeetingContraints:oneMatch:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [v69 allObjects], @"tags", 0), 0);
            }
            else {
              unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v12 == 0x7FFFFFFFFFFFFFFFLL && v94)
            {
              if ([v56 count]) {
                unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndexMeetingContraints:+[NSDictionary dictionaryWithObjectsAndKeys:v56, @"tags", 0] oneMatch:0];
              }
              else {
                unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
            if (v12 == 0x7FFFFFFFFFFFFFFFLL && v94)
            {
              if ([v62 count]) {
                unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndexMeetingContraints:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v62, @"tags", +[NSNumber numberWithBool:1], @"tagsOnSourceOnly", 0) oneMatch:0];
              }
              else {
                unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
          }
          id v75 = [v68 mutableCopy];
          long long v99 = 0u;
          float v100 = 0u;
          id v101 = 0u;
          id v102 = 0u;
          id v76 = [v68 countByEnumeratingWithState:&v99 objects:v127 count:16];
          if (v76)
          {
            float v77 = v76;
            id v78 = *(void *)v100;
            do
            {
              for (jj = 0; jj != v77; jj = (char *)jj + 1)
              {
                if (*(void *)v100 != v78) {
                  objc_enumerationMutation(obj);
                }
                float v80 = *(void **)(*((void *)&v99 + 1) + 8 * (void)jj);
                if (([v80 hasPrefix:@"Y"] & 1) == 0) {
                  [v75 removeObject:v80];
                }
              }
              float v77 = [obj countByEnumeratingWithState:&v99 objects:v127 count:16];
            }
            while (v77);
          }
          a3 = v96;
          p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v75 count]) {
              unint64_t v12 = -[MPWeighter getRandomIndexMeetingContraints:oneMatch:](self->_transitionWeighter, "getRandomIndexMeetingContraints:oneMatch:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [v75 allObjects], @"tags", 0), 0);
            }
            else {
              unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v12 == 0x7FFFFFFFFFFFFFFFLL && v94)
            {
              if ([v62 count]) {
                unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndexMeetingContraints:+[NSDictionary dictionaryWithObjectsAndKeys:v62, @"tags", 0] oneMatch:0];
              }
              else {
                unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
            if (v12 == 0x7FFFFFFFFFFFFFFFLL && v94)
            {
              if ([v56 count]) {
                unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndexMeetingContraints:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v56, @"tags", +[NSNumber numberWithBool:1], @"tagsOnSourceOnly", 0)];
              }
              else {
                unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
            if (v12 == 0x7FFFFFFFFFFFFFFFLL && v94)
            {
              if ([v62 count]) {
                unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndexMeetingContraints:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v62, @"tags", +[NSNumber numberWithBool:1], @"tagsOnSourceOnly", 0)];
              }
              else {
                unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
          }
          if ([obj count]) {
            unint64_t v12 = -[MPWeighter getRandomIndexMeetingContraints:](self->_transitionWeighter, "getRandomIndexMeetingContraints:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [obj allObjects], @"tags", 0));
          }
          id v9 = v91;
          if (v12 == 0x7FFFFFFFFFFFFFFFLL && v94) {
            unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndexMeetingContraints:+[NSDictionary dictionaryWithObjectsAndKeys:v97, @"tags", 0]];
          }
          if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_147;
          }
          if (v94)
          {
            unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
            if (v90) {
              unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndexMeetingContraints:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v90, @"tags", +[NSNumber numberWithBool:0], @"tagsOnSourceOnly", 0)];
            }
          }
          if (v12 == 0x7FFFFFFFFFFFFFFFLL && v90) {
            unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndexMeetingContraints:+[NSDictionary dictionaryWithObjectsAndKeys:v90, @"tags", 0]];
          }
        }
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_147:
          id v11 = v95;
          if (v12 >= (unint64_t)[v95 count])
          {
            id v81 = random();
            unint64_t v12 = v81 % (unint64_t)[v95 count];
          }
          goto LABEL_149;
        }
LABEL_61:
        unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndex];
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [(MPWeighter *)self->_transitionWeighter clearIgnoreIndices];
          unint64_t v12 = [(MPWeighter *)self->_transitionWeighter getRandomIndex];
        }
        goto LABEL_147;
      }
    }
    else
    {
      id v39 = 0;
      p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
      uint64_t v53 = &CATransform3DGetAffineTransform_ptr;
    }
    unsigned int v54 = v97;
    goto LABEL_56;
  }
  id v13 = [v11 mutableCopy];
  id v14 = +[MPAuthoringUtilities ignoreTransitionListFromOptions:a3];
  if (([v13 isEqualToArray:v14] & 1) == 0) {
    [v13 removeObjectsInArray:v14];
  }
  id v15 = objc_msgSend(v13, "objectAtIndex:", random() % (unint64_t)objc_msgSend(v13, "count"));
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = [v15 objectForKey:@"presetID"];
  }

LABEL_151:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = [v15 objectForKey:@"presetID"];
  }
  if (!v15) {
    return 0;
  }
  id v82 = [p_info + 186 idFromPresetID:v15];
  id v83 = +[MPTransition transitionWithTransitionID:v82];
  [p_info + 186 transitionDurationFromOptions:a3];
  id v85 = v84;
  if (v84 == -1.0)
  {
    [v9 defaultDurationForTransitionID:v82];
    id v85 = v86;
  }
  if ((unint64_t)objc_msgSend(objc_msgSend(v15, "componentsSeparatedByString:", @"/"), "count") >= 2) {
    -[MPTransition setPresetID:](v83, "setPresetID:", [v15 lastPathComponent]);
  }
  [(MPTransition *)v83 setDuration:v85];
  return v83;
}

- (void)performInitialFaceDetectionInGroup:(id)a3 withOptions:(id)a4
{
  id v35 = [a3 layers];
  id v36 = +[MPAuthoringUtilities styleFromOptions:a4];
  if ((objc_msgSend(objc_msgSend(a4, "objectForKey:", kMPAuthoringSkipFaceDetectionAtStart), "BOOLValue") & 1) == 0)
  {
    unsigned int v7 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "needsFaceDetectionForStyleID:", v36);
    if ([a3 detectFacesInBackground])
    {
      if (v7)
      {
        id v34 = [v35 count];
        if ((uint64_t)v34 >= 1)
        {
          uint64_t v8 = 0;
          while (1)
          {
            uint64_t v38 = v8;
            id v9 = objc_msgSend(v35, "objectAtIndex:");
            unsigned int v10 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "hasImagesForLayerID:forStyleID:", objc_msgSend(v9, "layerID"), v36);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v11 = [v9 slides];
            id v12 = [v11 countByEnumeratingWithState:&v57 objects:v64 count:16];
            if (!v12) {
              goto LABEL_47;
            }
            id v13 = v12;
            uint64_t v14 = 0;
            uint64_t v15 = *(void *)v58;
            do
            {
              for (id i = 0; i != v13; id i = (char *)i + 1)
              {
                if (*(void *)v58 != v15) {
                  objc_enumerationMutation(v11);
                }
                if (v14 <= 4)
                {
                  id v17 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                  [v17 showTime];
                  if (v18 < 3.0)
                  {
                    -[MPDocument regionsOfInterestForPath:detect:](self->_authoredDocument, "regionsOfInterestForPath:detect:", [v17 path], 1);
                    ++v14;
                  }
                }
              }
              id v13 = [v11 countByEnumeratingWithState:&v57 objects:v64 count:16];
            }
            while (v13);
            uint64_t v19 = v38;
            if (v14 > 4) {
              return;
            }
LABEL_48:
            uint64_t v8 = v19 + 1;
            if (v8 >= (uint64_t)v34) {
              return;
            }
          }
          if (v10)
          {
            if ((uint64_t)[v9 countOfEffectContainers] >= 1)
            {
              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              id obj = [v9 effectContainers];
              id v40 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
              if (v40)
              {
                uint64_t v20 = 0;
                uint64_t v39 = *(void *)v54;
LABEL_23:
                uint64_t v21 = 0;
                while (1)
                {
                  if (*(void *)v54 != v39) {
                    objc_enumerationMutation(obj);
                  }
                  id v22 = *(void **)(*((void *)&v53 + 1) + 8 * v21);
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v51 = 0u;
                  long long v52 = 0u;
                  uint64_t v41 = v21;
                  unsigned int v42 = v22;
                  id v43 = [v22 effects];
                  id v23 = [v43 countByEnumeratingWithState:&v49 objects:v62 count:16];
                  if (v23)
                  {
                    id v24 = v23;
                    uint64_t v44 = *(void *)v50;
LABEL_28:
                    uint64_t v25 = 0;
                    while (1)
                    {
                      if (*(void *)v50 != v44) {
                        objc_enumerationMutation(v43);
                      }
                      unsigned __int8 v26 = *(void **)(*((void *)&v49 + 1) + 8 * v25);
                      long long v45 = 0u;
                      long long v46 = 0u;
                      long long v47 = 0u;
                      long long v48 = 0u;
                      id v27 = [v26 slides];
                      id v28 = [v27 countByEnumeratingWithState:&v45 objects:v61 count:16];
                      if (v28)
                      {
                        id v29 = v28;
                        uint64_t v30 = *(void *)v46;
                        do
                        {
                          for (j = 0; j != v29; j = (char *)j + 1)
                          {
                            if (*(void *)v46 != v30) {
                              objc_enumerationMutation(v27);
                            }
                            if (v20 <= 4)
                            {
                              id v32 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
                              [v32 showTime];
                              if (v33 < 3.0)
                              {
                                -[MPDocument regionsOfInterestForPath:detect:](self->_authoredDocument, "regionsOfInterestForPath:detect:", [v32 path], 1);
                                ++v20;
                              }
                            }
                          }
                          id v29 = [v27 countByEnumeratingWithState:&v45 objects:v61 count:16];
                        }
                        while (v29);
                      }
                      if (v20 > 4) {
                        break;
                      }
                      if ((id)++v25 == v24)
                      {
                        id v24 = [v43 countByEnumeratingWithState:&v49 objects:v62 count:16];
                        if (v24) {
                          goto LABEL_28;
                        }
                        break;
                      }
                    }
                  }
                  if ((uint64_t)[v42 countOfEffects] > 0) {
                    break;
                  }
                  uint64_t v21 = v41 + 1;
                  if ((id)(v41 + 1) == v40)
                  {
                    id v40 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
                    if (v40) {
                      goto LABEL_23;
                    }
                    break;
                  }
                }
              }
            }
          }
LABEL_47:
          uint64_t v19 = v38;
          goto LABEL_48;
        }
      }
    }
  }
}

- (void)configurePanoramaInformationToEffect:(id)a3 inDocument:(id)a4 startingIndex:(int64_t)a5 count:(int64_t)a6 removeOldIndex:(int64_t)a7
{
  if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectNeedsPanoInformation:", objc_msgSend(a3, "effectID")))
  {
    id v12 = [a3 slides];
    if (a6 <= 0) {
      a6 = (int64_t)[v12 count] - a5;
    }
    int64_t v51 = a7;
    id v13 = objc_msgSend(objc_msgSend(a3, "slides"), "objectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a5, a6));
    id v14 = [a3 effectAttributeForKey:@"breakInformation"];
    if (!v14) {
      id v14 = +[NSMutableDictionary dictionary];
    }
    long long v52 = v14;
    id v50 = a3;
    id v15 = [a3 liveIndex];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v16 = [v13 countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (v16)
    {
      id v17 = v16;
      int64_t v18 = (int64_t)v15 + a5;
      uint64_t v19 = *(void *)v70;
      uint64_t v53 = *(void *)v70;
      id v54 = v13;
      do
      {
        uint64_t v20 = 0;
        id v55 = v17;
        do
        {
          if (*(void *)v70 != v19) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v20);
          objc_msgSend(a4, "resolutionForPath:", objc_msgSend(v21, "path"));
          double v24 = v22 / v23;
          if (v22 / v23 < 0.5 || v24 > 2.0)
          {
            unsigned __int8 v26 = ImageKey(v18);
            id v27 = objc_msgSend(a4, "regionsOfInterestForPath:", objc_msgSend(v21, "path"));
            id v28 = v27;
            if (v24 >= 1.0)
            {
              long long v67 = 0uLL;
              long long v68 = 0uLL;
              long long v65 = 0uLL;
              long long v66 = 0uLL;
              id v35 = [v27 countByEnumeratingWithState:&v65 objects:v75 count:16];
              if (!v35) {
                goto LABEL_36;
              }
              id v36 = v35;
              long long v56 = v26;
              char v31 = 0;
              char v32 = 0;
              uint64_t v37 = *(void *)v66;
              do
              {
                for (id i = 0; i != v36; id i = (char *)i + 1)
                {
                  if (*(void *)v66 != v37) {
                    objc_enumerationMutation(v28);
                  }
                  double v39 = COERCE_DOUBLE(CGRectFromString((NSString *)[*(id *)(*((void *)&v65 + 1) + 8 * i) objectForKey:kMPMetaDataRegionOfInterestBounds]));
                  v31 |= v39 < 0.333000004;
                  v32 |= v39 > 0.666000009;
                }
                id v36 = [v28 countByEnumeratingWithState:&v65 objects:v75 count:16];
              }
              while (v36);
            }
            else
            {
              long long v63 = 0uLL;
              long long v64 = 0uLL;
              long long v61 = 0uLL;
              long long v62 = 0uLL;
              id v29 = [v27 countByEnumeratingWithState:&v61 objects:v74 count:16];
              if (!v29) {
                goto LABEL_36;
              }
              id v30 = v29;
              long long v56 = v26;
              char v31 = 0;
              char v32 = 0;
              uint64_t v33 = *(void *)v62;
              do
              {
                for (j = 0; j != v30; j = (char *)j + 1)
                {
                  if (*(void *)v62 != v33) {
                    objc_enumerationMutation(v28);
                  }
                  CGRect v77 = CGRectFromString((NSString *)[*(id *)(*((void *)&v61 + 1) + 8 * (void)j) objectForKey:kMPMetaDataRegionOfInterestBounds]);
                  v31 |= v77.origin.y < 0.333000004;
                  v32 |= v77.origin.y > 0.666000009;
                }
                id v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v74, 16, v77.origin.x);
              }
              while (v30);
            }
            if (v31 & 1 | ((v32 & 1) == 0))
            {
              char v40 = v32 | ~v31;
              uint64_t v19 = v53;
              id v13 = v54;
              id v17 = v55;
              uint64_t v41 = v56;
              if (v40) {
                goto LABEL_36;
              }
              uint64_t v42 = -1;
            }
            else
            {
              uint64_t v42 = 1;
              uint64_t v19 = v53;
              id v13 = v54;
              id v17 = v55;
              uint64_t v41 = v56;
            }
            id v43 = +[NSMutableDictionary dictionary];
            objc_msgSend(v43, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v42), @"panEndDirection");
            [v52 setObject:v43 forKey:v41];
          }
LABEL_36:
          ++v18;
          uint64_t v20 = (char *)v20 + 1;
        }
        while (v20 != v17);
        id v17 = [v13 countByEnumeratingWithState:&v69 objects:v76 count:16];
      }
      while (v17);
    }
    if ([v52 count]) {
      [v50 setEffectAttribute:v52 forKey:@"breakInformation"];
    }
    if (a7 >= 1)
    {
      id v44 = [v52 allKeys];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v45 = [v44 countByEnumeratingWithState:&v57 objects:v73 count:16];
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v58;
        do
        {
          for (id k = 0; k != v46; id k = (char *)k + 1)
          {
            if (*(void *)v58 != v47) {
              objc_enumerationMutation(v44);
            }
            long long v49 = *(void **)(*((void *)&v57 + 1) + 8 * (void)k);
            if ((uint64_t)objc_msgSend(objc_msgSend(v49, "substringFromIndex:", 5), "integerValue") < v51) {
              [v52 removeObjectForKey:v49];
            }
          }
          id v46 = [v44 countByEnumeratingWithState:&v57 objects:v73 count:16];
        }
        while (v46);
      }
    }
  }
}

- (void)startLogging
{
  self->_logTiming = MRGetCurrentTime();
  if (self->_logLevel >= 2)
  {
    [(NSMutableDictionary *)self->_stats setObject:+[NSNumber numberWithInteger:0] forKey:@"numOfLandscapes"];
    [(NSMutableDictionary *)self->_stats setObject:+[NSNumber numberWithInteger:0] forKey:@"numOfPortraits"];
    [(NSMutableDictionary *)self->_stats setObject:+[NSNumber numberWithInteger:0] forKey:@"movieCount"];
    [(NSMutableDictionary *)self->_stats setObject:+[NSNumber numberWithInteger:0] forKey:@"numOfDZPortraits"];
    [(NSMutableDictionary *)self->_stats setObject:+[NSNumber numberWithInteger:0] forKey:@"numOfDZLandscapes"];
    [(NSMutableDictionary *)self->_stats setObject:+[NSNumber numberWithInteger:0] forKey:@"numOfDZSquares"];
    [(NSMutableDictionary *)self->_stats setObject:+[NSNumber numberWithInteger:0] forKey:@"misplacedLandscapes"];
    stats = self->_stats;
    id v4 = +[NSNumber numberWithInteger:0];
    [(NSMutableDictionary *)stats setObject:v4 forKey:@"misplacedPortraits"];
  }
}

- (void)finishLogging
{
  if (self->_logLevel >= 1)
  {
    v2 = self;
    double v3 = MRGetCurrentTime();
    authoredDocument = v2->_authoredDocument;
    id v5 = authoredDocument ? [(MPDocument *)authoredDocument styleID] : @"None";
    NSLog(@"iLifeSlideshow Authoring: Seed #: %d, Style ID: %@, Time Taken: %.5f", v2->_seed, v5, v3 - v2->_logTiming);
    if (v2->_logLevel >= 2)
    {
      NSLog(@"Quick Stats:");
      id v6 = (char *)objc_msgSend(-[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfLandscapes"), "integerValue");
      id v7 = objc_msgSend(-[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfPortraits"), "integerValue");
      NSLog(@" - Images: %d Count, %d Landscapes, %d Portraits, Including %d Movies", &v6[(void)v7], v6, v7, objc_msgSend(-[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"movieCount"), "integerValue"));
      NSLog(@" - Drop Zones: %d Landscapes, %d Portraits, %d Squares", objc_msgSend(-[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfDZLandscapes"), "integerValue"), objc_msgSend(-[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfDZPortraits"), "integerValue"), objc_msgSend(-[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"numOfDZSquares"), "integerValue"));
      NSLog(@" - Wrong Aspect Ratio Placement: %d Landscapes, %d Portraits", objc_msgSend(-[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"misplacedLandscapes"), "integerValue"), objc_msgSend(-[NSMutableDictionary objectForKey:](v2->_stats, "objectForKey:", @"misplacedPortraits"), "integerValue"));
      if (v2->_logLevel >= 3)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v8 = [(MPWeighter *)v2->_weighter allConstraints];
        id v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v9)
        {
          id v10 = v9;
          double v23 = v2;
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          uint64_t v13 = 0;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (id i = 0; i != v10; id i = (char *)i + 1)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v8);
              }
              id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              v11 += v16[8];
              v12 += v16[9];
              v13 += v16[7];
            }
            id v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }
          while (v10);
          v2 = v23;
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          uint64_t v13 = 0;
        }
        NSLog(@" - Default %@ Dropzones: %d Landscapes, %d Portraits, %d Squares", v5, v11, v12, v13);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v17 = [(MPWeighter *)v2->_weighter allUsageCounts];
        id v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = 0;
          uint64_t v21 = *(void *)v25;
          do
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v25 != v21) {
                objc_enumerationMutation(v17);
              }
              NSLog(@" - %@ : %d", objc_msgSend(-[MPWeighter allItems](v2->_weighter, "allItems"), "objectAtIndex:", (char *)j + v20), objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)j), "integerValue"));
            }
            id v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
            v20 += (uint64_t)j;
          }
          while (v19);
        }
      }
    }
  }
}

- (void)moveSlidesFromIndicies:(id)a3 toIndex:(int64_t)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v6 = a6;
  if (!a6) {
    id v6 = [a5 documentAttributeForKey:kMPDocumentAuthoringOptions];
  }
  unint64_t v11 = +[MPAuthoringUtilities reorderModeFromOptions:v6];
  switch(v11)
  {
    case 1uLL:
      [(MPAuthoringController *)self setAuthoredDocument:a5];
      objc_msgSend(objc_msgSend(a5, "montage"), "lock");
      id v19 = [a5 mainLayers];
      if ([v19 count])
      {
        id v20 = [v19 lastObject];
        if ((uint64_t)[v20 countOfEffectContainers] >= 1)
        {
          unsigned int v21 = [a3 containsIndex:0];
          if (!a4 || (id v22 = 0, v21)) {
            id v22 = [(MPAuthoringController *)self _grabAndRemoveTitleEffectFromDocument:a5 withOptions:v6];
          }
          uint64_t v23 = 0;
          if (!objc_msgSend(objc_msgSend(v20, "objectInEffectContainersAtIndex:", 0), "countOfEffects"))
          {
            uint64_t v23 = 0;
            do
              ++v23;
            while (!objc_msgSend(objc_msgSend(v20, "objectInEffectContainersAtIndex:", v23), "countOfEffects"));
          }
          id v24 = [a3 indexSetWithOffset:v23];
          int64_t v25 = v23 + a4;
          if (v25 >= (uint64_t)[v20 countOfEffectContainers] - 1)
          {
            uint64_t v26 = (uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(v20, "effectContainers"), "lastObject"), "countOfEffects") < 1|| -[MPAuthoringController _numberOfSlidesForOutroInLayer:withOptions:](self, "_numberOfSlidesForOutroInLayer:withOptions:", v20, v6) == 0;
            if (v25 >= (uint64_t)[v20 countOfEffectContainers] - v26)
            {
              uint64_t v38 = [v20 countOfEffectContainers];
              int64_t v25 = v38 - (unsigned char *)[v24 count];
            }
            v25 -= v26;
          }
          [v20 moveEffectContainersFromIndices:v24 toIndex:v25];
          if (v22) {
            [(MPAuthoringController *)self _readdTitleEffect:v22 toDocument:a5 withOptions:v6];
          }
        }
      }
      id v39 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
      [a5 setVideoPaths:v39];

      objc_msgSend(objc_msgSend(a5, "montage"), "unlock");
      [(MPAuthoringController *)self cleanup];
      break;
    case 2uLL:
      id v40 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
      id v17 = [v40 objectsAtIndexes:a3];
      [(MPAuthoringController *)self removeSlidesAtIndicies:a3 inDocument:a5 withOptions:v6];
      [(MPAuthoringController *)self insertVideoPaths:v17 atIndex:a4 inDocument:a5 withOptions:v6];

      break;
    case 3uLL:
      id v12 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
      id v13 = [v12 objectsAtIndexes:a3];
      [v12 removeObjectsAtIndexes:a3];
      if ((unint64_t)[v12 count] < a4) {
        a4 = (int64_t)[v12 count];
      }
      objc_msgSend(v12, "insertObjects:atIndexes:", v13, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, objc_msgSend(v13, "count")));
      [a5 setVideoPaths:v12];

      id v14 = [v6 objectForKey:kMPAuthoringUseBestAspectRatio];
      if (v14)
      {
        unsigned __int8 v15 = [v14 BOOLValue];
        id v16 = +[NSNumber numberWithBool:0];
        [a5 setAuthoringOption:v16 forKey:kMPAuthoringUseBestAspectRatio];
        [(MPAuthoringController *)self authorDocument:a5 withOptions:v6];
        if ((v15 & 1) == 0) {
          return;
        }
      }
      else
      {
        id v35 = +[NSNumber numberWithBool:0];
        [a5 setAuthoringOption:v35 forKey:kMPAuthoringUseBestAspectRatio];
        [(MPAuthoringController *)self authorDocument:a5 withOptions:v6];
      }
      id v36 = +[NSNumber numberWithBool:1];
      uint64_t v37 = kMPAuthoringUseBestAspectRatio;
      [a5 setAuthoringOption:v36 forKey:v37];
      break;
    default:
      id v27 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
      id v28 = [v27 objectsAtIndexes:a3];
      [v27 removeObjectsAtIndexes:a3];
      if ((unint64_t)[v27 count] < a4) {
        a4 = (int64_t)[v27 count];
      }
      objc_msgSend(v27, "insertObjects:atIndexes:", v28, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, objc_msgSend(v28, "count")));
      [a5 setVideoPaths:v27];

      id v29 = +[MPAuthoringUtilities subtitlesFromOptions:v6];
      if (v29)
      {
        long long v30 = v29;
        if ([v29 count])
        {
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v31 = [v30 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v42;
            do
            {
              for (id i = 0; i != v32; id i = (char *)i + 1)
              {
                if (*(void *)v42 != v33) {
                  objc_enumerationMutation(v30);
                }
                [(MPAuthoringController *)self removeStyledCaptionFromSlide:+[MPUtilities slideForPath:*(void *)(*((void *)&v41 + 1) + 8 * i) inDocument:a5] inDocument:a5 withOptions:v6];
              }
              id v32 = [v30 countByEnumeratingWithState:&v41 objects:v45 count:16];
            }
            while (v32);
          }
        }
      }
      [(MPAuthoringController *)self _reorderImagesInDocument:a5 withOptions:v6];
      break;
  }
}

- (void)insertVideoPaths:(id)a3 atIndex:(int64_t)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v6 = a6;
  if (!a6) {
    id v6 = [a5 documentAttributeForKey:kMPDocumentAuthoringOptions];
  }
  id v101 = +[MPAuthoringUtilities reorderModeFromOptions:v6];
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v135 objects:v147 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v136;
    do
    {
      for (id i = 0; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v136 != v12) {
          objc_enumerationMutation(a3);
        }
        id v14 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        if (([v14 hasPrefix:@"iphoto://"] & 1) != 0
          || [v14 hasPrefix:@"aperture://"])
        {
          [a5 absolutePathForAssetAtPath:v14];
        }
      }
      id v11 = [a3 countByEnumeratingWithState:&v135 objects:v147 count:16];
    }
    while (v11);
  }
  unsigned __int8 v15 = +[NSMutableArray arrayWithArray:a3];
  uint64_t v16 = (uint64_t)v101;
  if (v101 == (unsigned char *)&dword_0 + 2)
  {
    id v17 = [a5 allSlides];
    if ((unint64_t)[v17 count] <= a4 || (id v18 = objc_msgSend(v17, "objectAtIndex:", a4)) == 0)
    {
      id v30 = [a5 mainLayers];
      id v29 = self;
      if ([v30 count]) {
        a4 = (int64_t)objc_msgSend(objc_msgSend(v30, "lastObject"), "countOfEffectContainers");
      }
      goto LABEL_31;
    }
    id v19 = v18;
    id v20 = [v18 parentEffect];
    id v21 = [v19 index];
    if (v21 >= objc_msgSend(objc_msgSend(v20, "slides"), "count")
      || (unint64_t)objc_msgSend(objc_msgSend(v20, "slides"), "count") < 2)
    {
      a4 = (int64_t)objc_msgSend(objc_msgSend(v20, "parentContainer"), "index");
      id v29 = self;
      goto LABEL_31;
    }
    long long v97 = v20;
    id v22 = objc_msgSend(objc_msgSend(v20, "slides"), "objectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", objc_msgSend(v19, "index"), (unsigned char *)objc_msgSend(objc_msgSend(v20, "slides"), "count") - (unsigned char *)objc_msgSend(v19, "index")));
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v23 = [v22 countByEnumeratingWithState:&v131 objects:v146 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v132;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v132 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(void **)(*((void *)&v131 + 1) + 8 * (void)j);
          id v28 = objc_msgSend(objc_msgSend(v27, "path"), "copy");
          objc_msgSend(v27, "setPath:", -[NSMutableArray objectAtIndex:](v15, "objectAtIndex:", 0));
          [(NSMutableArray *)v15 removeObjectAtIndex:0];
          [(NSMutableArray *)v15 addObject:v28];
        }
        id v24 = [v22 countByEnumeratingWithState:&v131 objects:v146 count:16];
      }
      while (v24);
    }
    a4 = (int64_t)objc_msgSend(objc_msgSend(v97, "parentContainer"), "index") + 1;
    uint64_t v16 = 2;
  }
  id v29 = self;
  if (v16 == 3)
  {
LABEL_42:
    id v36 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
    if (a4 >= (unint64_t)[v36 count]) {
      a4 = (int64_t)[v36 count];
    }
    objc_msgSend(v36, "insertObjects:atIndexes:", v15, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, -[NSMutableArray count](v15, "count")));
    [a5 setVideoPaths:v36];

    id v37 = [v6 objectForKey:kMPAuthoringUseBestAspectRatio];
    if (v37)
    {
      unsigned __int8 v38 = [v37 BOOLValue];
      id v39 = +[NSNumber numberWithBool:0];
      [a5 setAuthoringOption:v39 forKey:kMPAuthoringUseBestAspectRatio];
      [(MPAuthoringController *)v29 authorDocument:a5 withOptions:v6];
      if ((v38 & 1) == 0) {
        return;
      }
    }
    else
    {
      long long v41 = +[NSNumber numberWithBool:0];
      [a5 setAuthoringOption:v41 forKey:kMPAuthoringUseBestAspectRatio];
      [(MPAuthoringController *)v29 authorDocument:a5 withOptions:v6];
    }
    long long v42 = +[NSNumber numberWithBool:1];
    [a5 setAuthoringOption:v42 forKey:kMPAuthoringUseBestAspectRatio];
    return;
  }
LABEL_31:
  if (!objc_msgSend(objc_msgSend(a5, "allSlides"), "count")) {
    goto LABEL_42;
  }
  if ((unint64_t)(v16 - 1) > 1)
  {
    id v40 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
    if (a4 >= (unint64_t)[v40 count]) {
      a4 = (int64_t)[v40 count];
    }
    objc_msgSend(v40, "insertObjects:atIndexes:", v15, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, -[NSMutableArray count](v15, "count")));
    [a5 setVideoPaths:v40];

    [(MPAuthoringController *)v29 _reorderImagesInDocument:a5 withOptions:v6];
  }
  else
  {
    id v31 = (char *)a4;
    [(MPAuthoringController *)v29 setAuthoredDocument:a5];
    objc_msgSend(objc_msgSend(a5, "montage"), "lock");
    id v33 = [a5 mainLayers];
    if ([v33 count])
    {
      long long v98 = v32;
      id v34 = [v33 lastObject];
      if ((uint64_t)[v34 countOfEffectContainers] >= 1)
      {
        uint64_t v35 = 0;
        if (!objc_msgSend(objc_msgSend(v34, "objectInEffectContainersAtIndex:", 0), "countOfEffects"))
        {
          uint64_t v35 = 0;
          do
            ++v35;
          while (!objc_msgSend(objc_msgSend(v34, "objectInEffectContainersAtIndex:", v35), "countOfEffects"));
        }
        v31 += v35;
        if ((uint64_t)v31 >= (uint64_t)[v34 countOfEffectContainers])
        {
          if ((uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(v34, "effectContainers"), "lastObject"), "countOfEffects") < 1)
          {
            id v31 = (char *)[v34 countOfEffectContainers];
          }
          else if (![(MPAuthoringController *)v29 _numberOfSlidesForOutroInLayer:v34 withOptions:v6])
          {
            id v31 = (char *)[v34 countOfEffectContainers] - 1;
          }
        }
      }
      if (v31 || (uint64_t)[v34 countOfEffectContainers] < 1) {
        id v93 = 0;
      }
      else {
        id v93 = [(MPAuthoringController *)v29 _grabAndRemoveTitleEffectFromDocument:a5 withOptions:v6];
      }
      long long v43 = +[NSMutableDictionary dictionaryWithDictionary:v6];
      long long v44 = +[NSNumber numberWithBool:0];
      [(NSMutableDictionary *)v43 setObject:v44 forKey:kMPAuthoringUseTitleEffect];
      id v45 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIndexForLayerID:ofStyle:", objc_msgSend(v34, "layerID"), objc_msgSend(v6, "objectForKey:", kMPAuthoringStyleID)));
      [(NSMutableDictionary *)v43 setObject:v45 forKey:kMPAuthoringLayerIndex];
      id v46 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [a5 videoPaths]);
      [(NSMutableArray *)v46 addObjectsFromArray:v15];
      [(NSMutableDictionary *)v43 setObject:v46 forKey:kMPAuthoringSecondaryPaths];
      uint64_t v47 = +[NSNumber numberWithBool:1];
      [(NSMutableDictionary *)v43 setObject:v47 forKey:kMPAuthoringAlwaysIncludeLastTransition];
      if ((uint64_t)v31 >= (uint64_t)[v34 countOfEffectContainers])
      {
        [(MPAuthoringController *)v29 _addVideoPaths:v15 toEndOfLayer:v34 inDocument:a5 withOptions:v43];
      }
      else
      {
        [(NSMutableDictionary *)v43 setObject:&stru_1AC850 forKey:kMPAuthoringOutroEffectID];
        objc_msgSend(v34, "insertEffectContainers:atIndex:", -[MPAuthoringController effectContainersWithImages:effects:andOptions:](v29, "effectContainersWithImages:effects:andOptions:", v15, -[MPAuthoringController effectsForImages:withOptions:](v29, "effectsForImages:withOptions:", v15, v43), v43), v31);
      }
      uint64_t v95 = v43;
      if (v93) {
        [(MPAuthoringController *)v29 _readdTitleEffect:v93 toDocument:a5 withOptions:v6];
      }
      v29->_skipApplyingSettings = 1;
      id v48 = +[MPAuthoringUtilities subtitlesFromOptions:v6];
      if (v48)
      {
        long long v49 = v48;
        if ([v48 count])
        {
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          id v50 = [v49 countByEnumeratingWithState:&v127 objects:v145 count:16];
          if (v50)
          {
            id v51 = v50;
            uint64_t v52 = *(void *)v128;
            do
            {
              for (id k = 0; k != v51; id k = (char *)k + 1)
              {
                if (*(void *)v128 != v52) {
                  objc_enumerationMutation(v49);
                }
                uint64_t v54 = *(void *)(*((void *)&v127 + 1) + 8 * (void)k);
                if ([a3 containsObject:v54]) {
                  [(MPAuthoringController *)self addStyledCaptionToSlide:+[MPUtilities slideForPath:v54 inDocument:a5] inDocument:a5 withOptions:v6];
                }
              }
              id v51 = [v49 countByEnumeratingWithState:&v127 objects:v145 count:16];
            }
            while (v51);
          }
        }
      }
      id v29 = self;
      self->_skipApplyingSettings = 0;
      id v55 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v31, [(NSMutableArray *)v15 count]);
      [(NSMutableDictionary *)v95 setObject:v55 forKey:kMPAuthoringReconfigureIndices];
      if ((objc_msgSend(objc_msgSend(v6, "objectForKey:", @"fastInsert"), "BOOLValue") & 1) == 0)
      {
        [(MPAuthoringController *)self configureFiltersInDocument:a5 withOptions:v95];
        [(MPAuthoringController *)self reconfigureColorSchemeInDocument:a5 withOptions:v95];
      }
      [(MPAuthoringController *)self configureTransitionsInDocument:a5 withOptions:v95];
      [(MPAuthoringController *)self scaleDurationsInDocument:a5 withOptions:v95];
      objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "cropSlidesInDocument:withOptions:", a5, v95);
      id v32 = v98;
    }
    id v56 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
    [a5 setVideoPaths:v56];

    objc_msgSend(objc_msgSend(a5, "montage"), "unlock");
    [(MPAuthoringController *)v29 cleanup];
  }
  id v99 = objc_msgSend(objc_msgSend(a5, "orderedVideoPaths"), "mutableCopy");
  if ((uint64_t)[v99 count] >= 1)
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id obj = [a5 layers];
    id v89 = [obj countByEnumeratingWithState:&v123 objects:v144 count:16];
    if (v89)
    {
      uint64_t v88 = *(void *)v124;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v124 != v88) {
            objc_enumerationMutation(obj);
          }
          uint64_t v90 = v57;
          long long v58 = *(void **)(*((void *)&v123 + 1) + 8 * v57);
          if (([v58 isAudioLayer] & 1) == 0)
          {
            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            id v91 = [v58 effectContainers];
            id v94 = [v91 countByEnumeratingWithState:&v119 objects:v143 count:16];
            if (v94)
            {
              uint64_t v92 = *(void *)v120;
              do
              {
                uint64_t v59 = 0;
                do
                {
                  if (*(void *)v120 != v92) {
                    objc_enumerationMutation(v91);
                  }
                  uint64_t v96 = v59;
                  long long v60 = *(void **)(*((void *)&v119 + 1) + 8 * v59);
                  long long v115 = 0u;
                  long long v116 = 0u;
                  long long v117 = 0u;
                  long long v118 = 0u;
                  id v102 = [v60 effects];
                  id v61 = [v102 countByEnumeratingWithState:&v115 objects:v142 count:16];
                  if (v61)
                  {
                    id v62 = v61;
                    uint64_t v63 = *(void *)v116;
                    do
                    {
                      for (m = 0; m != v62; m = (char *)m + 1)
                      {
                        if (*(void *)v116 != v63) {
                          objc_enumerationMutation(v102);
                        }
                        long long v65 = *(void **)(*((void *)&v115 + 1) + 8 * (void)m);
                        id v66 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSecondarySlidesForEffectID:", objc_msgSend(v65, "effectID"));
                        if ((uint64_t)v66 >= 1)
                        {
                          unint64_t v67 = (unint64_t)v66;
                          id v68 = +[NSMutableSet set];
                          long long v111 = 0u;
                          long long v112 = 0u;
                          long long v113 = 0u;
                          long long v114 = 0u;
                          id v69 = [v65 secondarySlides];
                          id v70 = [v69 countByEnumeratingWithState:&v111 objects:v141 count:16];
                          if (v70)
                          {
                            id v71 = v70;
                            uint64_t v72 = *(void *)v112;
                            do
                            {
                              for (n = 0; n != v71; n = (char *)n + 1)
                              {
                                if (*(void *)v112 != v72) {
                                  objc_enumerationMutation(v69);
                                }
                                objc_msgSend(v68, "addObject:", objc_msgSend(*(id *)(*((void *)&v111 + 1) + 8 * (void)n), "path"));
                              }
                              id v71 = [v69 countByEnumeratingWithState:&v111 objects:v141 count:16];
                            }
                            while (v71);
                          }
                          if ((unint64_t)[v68 count] < v67)
                          {
                            id v74 = +[NSMutableArray array];
                            long long v107 = 0u;
                            long long v108 = 0u;
                            long long v109 = 0u;
                            long long v110 = 0u;
                            id v75 = [v65 slides];
                            id v76 = [v75 countByEnumeratingWithState:&v107 objects:v140 count:16];
                            if (v76)
                            {
                              id v77 = v76;
                              uint64_t v78 = *(void *)v108;
                              do
                              {
                                for (id ii = 0; ii != v77; id ii = (char *)ii + 1)
                                {
                                  if (*(void *)v108 != v78) {
                                    objc_enumerationMutation(v75);
                                  }
                                  objc_msgSend(v74, "addObject:", objc_msgSend(*(id *)(*((void *)&v107 + 1) + 8 * (void)ii), "path"));
                                }
                                id v77 = [v75 countByEnumeratingWithState:&v107 objects:v140 count:16];
                              }
                              while (v77);
                            }
                            id v80 = [(MPAuthoringController *)self pickRandomPathsInArray:v99 excludingPaths:v74 count:v67];
                            long long v103 = 0u;
                            long long v104 = 0u;
                            long long v105 = 0u;
                            long long v106 = 0u;
                            id v81 = [v65 secondarySlides];
                            id v82 = [v81 countByEnumeratingWithState:&v103 objects:v139 count:16];
                            if (v82)
                            {
                              id v83 = v82;
                              uint64_t v84 = 0;
                              uint64_t v85 = *(void *)v104;
                              do
                              {
                                for (jj = 0; jj != v83; jj = (char *)jj + 1)
                                {
                                  if (*(void *)v104 != v85) {
                                    objc_enumerationMutation(v81);
                                  }
                                  objc_msgSend(*(id *)(*((void *)&v103 + 1) + 8 * (void)jj), "setPath:", objc_msgSend(v80, "objectAtIndex:", (char *)jj + v84));
                                }
                                id v83 = [v81 countByEnumeratingWithState:&v103 objects:v139 count:16];
                                v84 += (uint64_t)jj;
                              }
                              while (v83);
                            }
                          }
                        }
                      }
                      id v62 = [v102 countByEnumeratingWithState:&v115 objects:v142 count:16];
                    }
                    while (v62);
                  }
                  uint64_t v59 = v96 + 1;
                }
                while ((id)(v96 + 1) != v94);
                id v94 = [v91 countByEnumeratingWithState:&v119 objects:v143 count:16];
              }
              while (v94);
            }
          }
          uint64_t v57 = v90 + 1;
        }
        while ((id)(v90 + 1) != v89);
        id v89 = [obj countByEnumeratingWithState:&v123 objects:v144 count:16];
      }
      while (v89);
    }
  }
}

- (void)removeSlidesAtIndicies:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v7 = a3;
  if (![a3 count]) {
    return;
  }
  if (!a5) {
    a5 = [a4 documentAttributeForKey:kMPDocumentAuthoringOptions];
  }
  id v161 = a5;
  id v140 = a4;
  long long v145 = self;
  switch(+[MPAuthoringUtilities reorderModeFromOptions:a5])
  {
    case 1uLL:
      [(MPAuthoringController *)self setAuthoredDocument:a4];
      objc_msgSend(objc_msgSend(a4, "montage"), "lock");
      id v10 = [a4 mainLayers];
      if ([v10 count])
      {
        id v11 = [v10 lastObject];
        if ((objc_msgSend(objc_msgSend(v161, "objectForKey:", @"skipEmptyContainerCheck"), "BOOLValue") & 1) == 0)
        {
          uint64_t v12 = 0;
          if (!objc_msgSend(objc_msgSend(v11, "objectInEffectContainersAtIndex:", 0), "countOfEffects"))
          {
            uint64_t v12 = 0;
            do
              ++v12;
            while (!objc_msgSend(objc_msgSend(v11, "objectInEffectContainersAtIndex:", v12), "countOfEffects"));
          }
          id v7 = objc_msgSend(objc_msgSend(v7, "indexSetWithOffset:", v12), "indexSetWithMaximum:", (char *)objc_msgSend(v11, "countOfEffectContainers") - 1);
        }
        if ([v7 containsIndex:0]
          && (uint64_t)[v11 countOfEffectContainers] > 0)
        {
          id v13 = v161;
          id v14 = [(MPAuthoringController *)self _grabAndRemoveTitleEffectFromDocument:a4 withOptions:v161];
          [v11 removeEffectContainersAtIndices:v7];
          if (v14) {
            [(MPAuthoringController *)self _readdTitleEffect:v14 toDocument:a4 withOptions:v161];
          }
        }
        else
        {
          [v11 removeEffectContainersAtIndices:v7];
          id v13 = v161;
        }
        [(MPAuthoringController *)self _checkForEmptyLayersInDocument:a4];
        [(MPAuthoringController *)self scaleDurationsInDocument:a4 withOptions:v13];
      }
      id v134 = objc_msgSend(objc_msgSend(a4, "orderedVideoPaths"), "mutableCopy");
      [a4 setVideoPaths:v134];

      objc_msgSend(objc_msgSend(a4, "montage"), "unlock");
      [(MPAuthoringController *)self cleanup];
      return;
    case 2uLL:
      [(MPAuthoringController *)self setAuthoredDocument:a4];
      objc_msgSend(objc_msgSend(a4, "montage"), "lock");
      id v174 = +[NSMutableArray array];
      id v15 = [a4 mainLayers];
      if ([v15 count])
      {
        id v170 = [v15 lastObject];
        id v16 = objc_msgSend(objc_msgSend(a4, "allSlides"), "objectsAtIndexes:", v7);
        long long v197 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        long long v200 = 0u;
        id v17 = [v16 countByEnumeratingWithState:&v197 objects:v246 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v198;
          do
          {
            for (id i = 0; i != v18; id i = (char *)i + 1)
            {
              if (*(void *)v198 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v197 + 1) + 8 * i);
              id v22 = [v21 parentEffect];
              if (objc_msgSend(objc_msgSend(v22, "slides"), "count") == (char *)&dword_0 + 1)
              {
                id v23 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(objc_msgSend(v22, "parentContainer"), "index"));
                id v24 = 0;
                if ([(NSIndexSet *)v23 containsIndex:0])
                {
                  if ((uint64_t)[v170 countOfEffectContainers] < 1) {
                    id v24 = 0;
                  }
                  else {
                    id v24 = [(MPAuthoringController *)self _grabAndRemoveTitleEffectFromDocument:v140 withOptions:v161];
                  }
                }
                objc_msgSend(objc_msgSend(objc_msgSend(v22, "parentContainer"), "parentLayer"), "removeEffectContainersAtIndices:", v23);
                if (v24) {
                  [(MPAuthoringController *)self _readdTitleEffect:v24 toDocument:v140 withOptions:v161];
                }
              }
              else
              {
                [v22 setReplaceSlides:0];
                objc_msgSend(v22, "removeSlidesAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v21, "index")));
                [v22 setReplaceSlides:1];
                id v25 = [v161 mutableCopy];
                uint64_t v26 = +[NSNumber numberWithBool:0];
                [v25 setObject:v26 forKey:kMPAuthoringUseTitleEffect];
                [v25 setObject:kMPFadeNone forKey:kMPAuthoringOutroEffectID];
                id v27 = -[MPAuthoringController effectsForImages:withOptions:](self, "effectsForImages:withOptions:", [v22 videoPaths], v25);

                if ([v27 count] == (char *)&dword_0 + 1)
                {
                  id v28 = [v27 lastObject];
                  objc_msgSend(v22, "setEffectID:", +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v28));
                  objc_msgSend(v22, "setPresetID:", +[MPUtilities presetIDOfCombinedID:](MPUtilities, "presetIDOfCombinedID:", v28));
                }
              }
              objc_msgSend(v174, "addObject:", objc_msgSend(v21, "path"));
            }
            id v18 = [v16 countByEnumeratingWithState:&v197 objects:v246 count:16];
          }
          while (v18);
        }
        a4 = v140;
        [(MPAuthoringController *)self _checkForEmptyLayersInDocument:v140];
        [(MPAuthoringController *)self scaleDurationsInDocument:v140 withOptions:v161];
      }
      id v29 = objc_msgSend(objc_msgSend(a4, "orderedVideoPaths"), "mutableCopy");
      [a4 setVideoPaths:v29];
      id v30 = [v29 count];
      if ((uint64_t)v30 >= 1)
      {
        unint64_t v31 = (unint64_t)v30;
        long long v195 = 0u;
        long long v196 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        id obj = [v140 layers];
        id v143 = [obj countByEnumeratingWithState:&v193 objects:v245 count:16];
        if (v143)
        {
          id v141 = *(id *)v194;
          do
          {
            uint64_t v32 = 0;
            do
            {
              if (*(id *)v194 != v141) {
                objc_enumerationMutation(obj);
              }
              uint64_t v147 = v32;
              id v33 = *(void **)(*((void *)&v193 + 1) + 8 * v32);
              if (([v33 isAudioLayer] & 1) == 0)
              {
                long long v191 = 0u;
                long long v192 = 0u;
                long long v189 = 0u;
                long long v190 = 0u;
                id v149 = [v33 effectContainers];
                id v155 = [v149 countByEnumeratingWithState:&v189 objects:v244 count:16];
                if (v155)
                {
                  uint64_t v152 = *(void *)v190;
                  do
                  {
                    uint64_t v34 = 0;
                    do
                    {
                      if (*(void *)v190 != v152) {
                        objc_enumerationMutation(v149);
                      }
                      uint64_t v158 = v34;
                      uint64_t v35 = *(void **)(*((void *)&v189 + 1) + 8 * v34);
                      long long v185 = 0u;
                      long long v186 = 0u;
                      long long v187 = 0u;
                      long long v188 = 0u;
                      id v162 = [v35 effects];
                      long long v167 = (char *)[v162 countByEnumeratingWithState:&v185 objects:v243 count:16];
                      if (v167)
                      {
                        uint64_t v164 = *(void *)v186;
                        do
                        {
                          id v36 = 0;
                          do
                          {
                            if (*(void *)v186 != v164) {
                              objc_enumerationMutation(v162);
                            }
                            long long v171 = v36;
                            id v37 = *(void **)(*((void *)&v185 + 1) + 8 * (void)v36);
                            id v38 = +[NSMutableArray array];
                            long long v181 = 0u;
                            long long v182 = 0u;
                            long long v183 = 0u;
                            long long v184 = 0u;
                            id v39 = [v37 secondarySlides];
                            id v40 = [v39 countByEnumeratingWithState:&v181 objects:v242 count:16];
                            if (v40)
                            {
                              id v41 = v40;
                              uint64_t v42 = *(void *)v182;
                              do
                              {
                                for (j = 0; j != v41; j = (char *)j + 1)
                                {
                                  if (*(void *)v182 != v42) {
                                    objc_enumerationMutation(v39);
                                  }
                                  objc_msgSend(v38, "addObject:", objc_msgSend(*(id *)(*((void *)&v181 + 1) + 8 * (void)j), "path"));
                                }
                                id v41 = [v39 countByEnumeratingWithState:&v181 objects:v242 count:16];
                              }
                              while (v41);
                            }
                            long long v179 = 0u;
                            long long v180 = 0u;
                            long long v177 = 0u;
                            long long v178 = 0u;
                            id v44 = [v37 secondarySlides];
                            id v45 = [v44 countByEnumeratingWithState:&v177 objects:v241 count:16];
                            if (v45)
                            {
                              id v46 = v45;
                              uint64_t v47 = *(void *)v178;
                              do
                              {
                                for (id k = 0; k != v46; id k = (char *)k + 1)
                                {
                                  if (*(void *)v178 != v47) {
                                    objc_enumerationMutation(v44);
                                  }
                                  long long v49 = *(void **)(*((void *)&v177 + 1) + 8 * (void)k);
                                  if (objc_msgSend(v174, "indexOfObject:", objc_msgSend(v49, "path")) != (id)0x7FFFFFFFFFFFFFFFLL)
                                  {
                                    do
                                      id v50 = [v29 objectAtIndex:random() % (uint64_t)v31];
                                    while ([v38 indexOfObject:v50] != (id)0x7FFFFFFFFFFFFFFFLL
                                         && v31 > (unint64_t)[v38 count]);
                                    [v49 setPath:v50];
                                  }
                                }
                                id v46 = [v44 countByEnumeratingWithState:&v177 objects:v241 count:16];
                              }
                              while (v46);
                            }
                            id v36 = v171 + 1;
                          }
                          while (v171 + 1 != v167);
                          long long v167 = (char *)[v162 countByEnumeratingWithState:&v185 objects:v243 count:16];
                        }
                        while (v167);
                      }
                      uint64_t v34 = v158 + 1;
                    }
                    while ((id)(v158 + 1) != v155);
                    id v155 = [v149 countByEnumeratingWithState:&v189 objects:v244 count:16];
                  }
                  while (v155);
                }
              }
              uint64_t v32 = v147 + 1;
            }
            while ((id)(v147 + 1) != v143);
            id v143 = [obj countByEnumeratingWithState:&v193 objects:v245 count:16];
          }
          while (v143);
        }
      }

      objc_msgSend(objc_msgSend(v140, "montage"), "unlock");
      [(MPAuthoringController *)v145 cleanup];
      return;
    case 3uLL:
      id v51 = objc_msgSend(objc_msgSend(a4, "orderedVideoPaths"), "mutableCopy");
      [v51 removeObjectsAtIndexes:v7];
      [a4 setVideoPaths:v51];

      id v52 = [v161 objectForKey:kMPAuthoringUseBestAspectRatio];
      if (v52) {
        unsigned int v53 = [v52 BOOLValue];
      }
      else {
        unsigned int v53 = 1;
      }
      long long v135 = +[NSNumber numberWithBool:0];
      [a4 setAuthoringOption:v135 forKey:kMPAuthoringUseBestAspectRatio];
      if (objc_msgSend(objc_msgSend(a4, "videoPaths"), "count"))
      {
        [(MPAuthoringController *)self authorDocument:a4 withOptions:v161];
        if (!v53) {
          return;
        }
      }
      else
      {
        [a4 removeAllLayers];
        if (!v53) {
          return;
        }
      }
      long long v136 = +[NSNumber numberWithBool:1];
      long long v137 = kMPAuthoringUseBestAspectRatio;
      [a4 setAuthoringOption:v136 forKey:v137];
      return;
    case 4uLL:
      id v54 = objc_msgSend(objc_msgSend(a4, "allSlides"), "objectsAtIndexes:", v7);
      id v172 = +[NSMutableDictionary dictionary];
      id v175 = +[NSMutableArray array];
      long long v237 = 0u;
      long long v238 = 0u;
      long long v239 = 0u;
      long long v240 = 0u;
      id v55 = [v54 countByEnumeratingWithState:&v237 objects:v256 count:16];
      if (v55)
      {
        id v56 = v55;
        uint64_t v57 = *(void *)v238;
        do
        {
          for (m = 0; m != v56; m = (char *)m + 1)
          {
            if (*(void *)v238 != v57) {
              objc_enumerationMutation(v54);
            }
            uint64_t v59 = *(void **)(*((void *)&v237 + 1) + 8 * (void)m);
            id v60 = objc_msgSend(objc_msgSend(v59, "parentEffect"), "parentContainer");
            id v61 = objc_msgSend(v172, "objectForKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v60, "index")));
            if (!v61)
            {
              id v61 = +[NSMutableArray array];
              objc_msgSend(v172, "setObject:forKey:", v61, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v60, "index")));
            }
            [v61 addObject:v59];
            objc_msgSend(v175, "addObject:", objc_msgSend(v59, "path"));
          }
          id v56 = [v54 countByEnumeratingWithState:&v237 objects:v256 count:16];
        }
        while (v56);
      }
      id v62 = [a4 mainLayers];
      uint64_t v63 = v145;
      id v64 = v161;
      if (![v62 count]) {
        return;
      }
      id v65 = [v62 lastObject];
      id v66 = +[NSMutableDictionary dictionaryWithDictionary:v161];
      id v67 = [v161 objectForKey:kMPAuthoringStyleID];
      id v68 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "reorderModeForStyleID:", v67);
      id v69 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIndexForLayerID:ofStyle:", objc_msgSend(v65, "layerID"), v67));
      [(NSMutableDictionary *)v66 setObject:v69 forKey:kMPAuthoringLayerIndex];
      id v70 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [a4 videoPaths]);
      [(NSMutableDictionary *)v66 setObject:v70 forKey:kMPAuthoringSecondaryPaths];
      long long v236 = 0u;
      long long v235 = 0u;
      long long v234 = 0u;
      long long v233 = 0u;
      id v165 = [v172 countByEnumeratingWithState:&v233 objects:v255 count:16];
      if (!v165) {
        goto LABEL_161;
      }
      unsigned __int8 v150 = 0;
      unint64_t v168 = (unint64_t)v68 - 1;
      uint64_t v71 = *(void *)v234;
      long long v156 = v65;
      long long v159 = v66;
      uint64_t v153 = *(void *)v234;
      break;
    default:
      id v176 = objc_msgSend(objc_msgSend(a4, "orderedVideoPaths"), "mutableCopy");
      [v176 removeObjectsAtIndexes:v7];
      [a4 setVideoPaths:v176];
      [(MPAuthoringController *)self _reorderImagesInDocument:a4 withOptions:a5];

      return;
  }
  do
  {
    for (n = 0; n != v165; n = (char *)n + 1)
    {
      if (*(void *)v234 != v71) {
        objc_enumerationMutation(v172);
      }
      id v73 = [v172 objectForKey:*(void *)(*((void *)&v233 + 1) + 8 * (void)n)];
      id v74 = objc_msgSend(objc_msgSend(v73, "lastObject"), "parentEffect");
      id v75 = objc_msgSend(objc_msgSend(v74, "parentContainer"), "index");
      id v76 = [v74 countOfSlides];
      id v77 = [v73 count];
      BOOL v79 = v168 < 2 || (uint64_t)v75 > 0;
      if (v76 == v77 && v79)
      {
        if (v75)
        {
          id v90 = 0;
        }
        else
        {
          id v90 = 0;
          if ((uint64_t)[v65 countOfEffectContainers] >= 1 && v168 <= 1) {
            id v90 = [(MPAuthoringController *)v63 _grabAndRemoveTitleEffectFromDocument:a4 withOptions:v161];
          }
        }
        objc_msgSend(v65, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v75));
        if (v90) {
          [(MPAuthoringController *)v63 _readdTitleEffect:v90 toDocument:a4 withOptions:v161];
        }
        continue;
      }
      id v81 = +[NSMutableArray array];
      long long v229 = 0u;
      long long v230 = 0u;
      long long v231 = 0u;
      long long v232 = 0u;
      id v82 = [v74 slides];
      id v83 = [v82 countByEnumeratingWithState:&v229 objects:v254 count:16];
      if (v83)
      {
        id v84 = v83;
        uint64_t v85 = *(void *)v230;
        do
        {
          for (id ii = 0; ii != v84; id ii = (char *)ii + 1)
          {
            if (*(void *)v230 != v85) {
              objc_enumerationMutation(v82);
            }
            uint64_t v87 = *(void **)(*((void *)&v229 + 1) + 8 * (void)ii);
            if (([v73 containsObject:v87] & 1) == 0) {
              objc_msgSend(v81, "addObject:", objc_msgSend(v87, "path"));
            }
          }
          id v84 = [v82 countByEnumeratingWithState:&v229 objects:v254 count:16];
        }
        while (v84);
      }
      id v65 = v156;
      if (!v75 && v168 >= 2)
      {
        id v88 = [v74 countOfSlides];
        a4 = v140;
        uint64_t v63 = v145;
        id v66 = v159;
        if (v88 == [v73 count])
        {
          id v89 = [v161 objectForKey:kMPAuthoringUseTitleEffect];
          if (v89) {
            unsigned __int8 v150 = [v89 BOOLValue];
          }
          else {
            unsigned __int8 v150 = 1;
          }
        }
        [v156 countOfEffectContainers];
LABEL_130:
        id v91 = 0;
        goto LABEL_131;
      }
      a4 = v140;
      uint64_t v63 = v145;
      id v66 = v159;
      if (v75) {
        goto LABEL_130;
      }
      id v91 = 0;
      if ((uint64_t)[v156 countOfEffectContainers] >= 1 && v168 <= 1) {
        id v91 = [(MPAuthoringController *)v145 _grabAndRemoveTitleEffectFromDocument:v140 withOptions:v161];
      }
LABEL_131:
      objc_msgSend(v156, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v75));
      [(NSMutableDictionary *)v66 removeObjectForKey:kMPAuthoringOutroEffectID];
      [(NSMutableDictionary *)v66 removeObjectForKey:kMPAuthoringReconfigureIndices];
      uint64_t v92 = +[NSNumber numberWithBool:0];
      [(NSMutableDictionary *)v66 setObject:v92 forKey:kMPAuthoringUseTitleEffect];
      if ((uint64_t)v75 >= (uint64_t)[v156 countOfEffectContainers])
      {
        id v93 = [(MPAuthoringController *)v63 _addVideoPaths:v81 toEndOfLayer:v156 inDocument:a4 withOptions:v66];
        if (!v91) {
          goto LABEL_136;
        }
LABEL_135:
        [(MPAuthoringController *)v63 _readdTitleEffect:v91 toDocument:a4 withOptions:v161];
        goto LABEL_136;
      }
      [(NSMutableDictionary *)v66 setObject:&stru_1AC850 forKey:kMPAuthoringOutroEffectID];
      id v93 = [(MPAuthoringController *)v63 effectContainersWithImages:v81 effects:[(MPAuthoringController *)v63 effectsForImages:v81 withOptions:v66] andOptions:v66];
      [v156 insertEffectContainers:v93 atIndex:v75];
      if (v91) {
        goto LABEL_135;
      }
LABEL_136:
      if ([v93 count])
      {
        objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "applyCropToSlidesInEffectContainers:inDocument:withOptions:", v93, a4, v66);
        id v94 = objc_msgSend(objc_msgSend(v93, "objectAtIndex:", 0), "allSlides");
        if ([v94 count])
        {
          uint64_t v95 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", objc_msgSend(objc_msgSend(a4, "allSlides"), "indexOfObject:", objc_msgSend(v94, "objectAtIndex:", 0)), objc_msgSend(v81, "count"));
          [(NSMutableDictionary *)v66 setObject:v95 forKey:kMPAuthoringReconfigureIndices];
          [(MPAuthoringController *)v63 configureFiltersInDocument:a4 withOptions:v66];
          [(MPAuthoringController *)v63 configureTransitionsInDocument:a4 withOptions:v66];
        }
      }
      uint64_t v71 = v153;
    }
    id v165 = [v172 countByEnumeratingWithState:&v233 objects:v255 count:16];
  }
  while (v165);
  id v64 = v161;
  if ((v150 & 1) != 0 && (uint64_t)[v65 countOfEffectContainers] >= 1)
  {
    [(NSMutableDictionary *)v66 removeObjectForKey:kMPAuthoringOutroEffectID];
    [(NSMutableDictionary *)v66 removeObjectForKey:kMPAuthoringReconfigureIndices];
    uint64_t v96 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)v66 setObject:v96 forKey:kMPAuthoringUseTitleEffect];
    [(NSMutableDictionary *)v66 setObject:&stru_1AC850 forKey:kMPAuthoringOutroEffectID];
    id v97 = +[NSMutableArray array];
    long long v225 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    long long v228 = 0u;
    id v98 = objc_msgSend(objc_msgSend(objc_msgSend(v65, "effectContainers"), "objectAtIndex:", 0), "effects");
    id v99 = [v98 countByEnumeratingWithState:&v225 objects:v253 count:16];
    if (v99)
    {
      id v100 = v99;
      uint64_t v101 = *(void *)v226;
      do
      {
        for (jj = 0; jj != v100; jj = (char *)jj + 1)
        {
          if (*(void *)v226 != v101) {
            objc_enumerationMutation(v98);
          }
          long long v103 = *(void **)(*((void *)&v225 + 1) + 8 * (void)jj);
          long long v221 = 0u;
          long long v222 = 0u;
          long long v223 = 0u;
          long long v224 = 0u;
          id v104 = [v103 slides];
          id v105 = [v104 countByEnumeratingWithState:&v221 objects:v252 count:16];
          if (v105)
          {
            id v106 = v105;
            uint64_t v107 = *(void *)v222;
            do
            {
              for (kid k = 0; kk != v106; kid k = (char *)kk + 1)
              {
                if (*(void *)v222 != v107) {
                  objc_enumerationMutation(v104);
                }
                objc_msgSend(v97, "addObject:", objc_msgSend(*(id *)(*((void *)&v221 + 1) + 8 * (void)kk), "path"));
              }
              id v106 = [v104 countByEnumeratingWithState:&v221 objects:v252 count:16];
            }
            while (v106);
          }
        }
        id v100 = [v98 countByEnumeratingWithState:&v225 objects:v253 count:16];
      }
      while (v100);
    }
    objc_msgSend(v156, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0));
    uint64_t v63 = v145;
    id v109 = [(MPAuthoringController *)v145 effectContainersWithImages:v97 effects:[(MPAuthoringController *)v145 effectsForImages:v97 withOptions:v159] andOptions:v159];
    [v156 insertEffectContainers:v109 atIndex:0];
    a4 = v140;
    id v64 = v161;
    if ([v109 count])
    {
      objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "applyCropToSlidesInEffectContainers:inDocument:withOptions:", v109, v140, v159);
      id v110 = objc_msgSend(objc_msgSend(v109, "objectAtIndex:", 0), "allSlides");
      if ([v110 count])
      {
        long long v111 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", objc_msgSend(objc_msgSend(v140, "allSlides"), "indexOfObject:", objc_msgSend(v110, "objectAtIndex:", 0)), objc_msgSend(v97, "count"));
        [(NSMutableDictionary *)v159 setObject:v111 forKey:kMPAuthoringReconfigureIndices];
        [(MPAuthoringController *)v145 configureFiltersInDocument:v140 withOptions:v159];
        [(MPAuthoringController *)v145 configureTransitionsInDocument:v140 withOptions:v159];
      }
    }
  }
LABEL_161:
  [(MPAuthoringController *)v63 scaleDurationsInDocument:a4 withOptions:v64];
  id v112 = objc_msgSend(objc_msgSend(a4, "orderedVideoPaths"), "mutableCopy");
  [a4 setVideoPaths:v112];
  id v113 = [v112 count];
  if ((uint64_t)v113 >= 1)
  {
    unint64_t v114 = (unint64_t)v113;
    long long v219 = 0u;
    long long v220 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    id v142 = [a4 layers];
    id v146 = [v142 countByEnumeratingWithState:&v217 objects:v251 count:16];
    if (v146)
    {
      uint64_t v144 = *(void *)v218;
      do
      {
        uint64_t v115 = 0;
        do
        {
          if (*(void *)v218 != v144) {
            objc_enumerationMutation(v142);
          }
          uint64_t v148 = v115;
          long long v116 = *(void **)(*((void *)&v217 + 1) + 8 * v115);
          if (([v116 isAudioLayer] & 1) == 0)
          {
            long long v215 = 0u;
            long long v216 = 0u;
            long long v213 = 0u;
            long long v214 = 0u;
            id v151 = [v116 effectContainers];
            id v157 = [v151 countByEnumeratingWithState:&v213 objects:v250 count:16];
            if (v157)
            {
              uint64_t v154 = *(void *)v214;
              do
              {
                uint64_t v117 = 0;
                do
                {
                  if (*(void *)v214 != v154) {
                    objc_enumerationMutation(v151);
                  }
                  uint64_t v160 = v117;
                  long long v118 = *(void **)(*((void *)&v213 + 1) + 8 * v117);
                  long long v209 = 0u;
                  long long v210 = 0u;
                  long long v211 = 0u;
                  long long v212 = 0u;
                  id v163 = [v118 effects];
                  long long v169 = (char *)[v163 countByEnumeratingWithState:&v209 objects:v249 count:16];
                  if (v169)
                  {
                    uint64_t v166 = *(void *)v210;
                    do
                    {
                      long long v119 = 0;
                      do
                      {
                        if (*(void *)v210 != v166) {
                          objc_enumerationMutation(v163);
                        }
                        long long v173 = v119;
                        long long v120 = *(void **)(*((void *)&v209 + 1) + 8 * (void)v119);
                        id v121 = +[NSMutableArray array];
                        long long v205 = 0u;
                        long long v206 = 0u;
                        long long v207 = 0u;
                        long long v208 = 0u;
                        id v122 = [v120 secondarySlides];
                        id v123 = [v122 countByEnumeratingWithState:&v205 objects:v248 count:16];
                        if (v123)
                        {
                          id v124 = v123;
                          uint64_t v125 = *(void *)v206;
                          do
                          {
                            for (mm = 0; mm != v124; mm = (char *)mm + 1)
                            {
                              if (*(void *)v206 != v125) {
                                objc_enumerationMutation(v122);
                              }
                              objc_msgSend(v121, "addObject:", objc_msgSend(*(id *)(*((void *)&v205 + 1) + 8 * (void)mm), "path"));
                            }
                            id v124 = [v122 countByEnumeratingWithState:&v205 objects:v248 count:16];
                          }
                          while (v124);
                        }
                        long long v203 = 0u;
                        long long v204 = 0u;
                        long long v201 = 0u;
                        long long v202 = 0u;
                        id v127 = [v120 secondarySlides];
                        id v128 = [v127 countByEnumeratingWithState:&v201 objects:v247 count:16];
                        if (v128)
                        {
                          id v129 = v128;
                          uint64_t v130 = *(void *)v202;
                          do
                          {
                            for (nn = 0; nn != v129; nn = (char *)nn + 1)
                            {
                              if (*(void *)v202 != v130) {
                                objc_enumerationMutation(v127);
                              }
                              long long v132 = *(void **)(*((void *)&v201 + 1) + 8 * (void)nn);
                              if (objc_msgSend(v175, "indexOfObject:", objc_msgSend(v132, "path")) != (id)0x7FFFFFFFFFFFFFFFLL)
                              {
                                do
                                  id v133 = [v112 objectAtIndex:random() % (uint64_t)v114];
                                while ([v121 indexOfObject:v133] != (id)0x7FFFFFFFFFFFFFFFLL
                                     && v114 > (unint64_t)[v121 count]);
                                [v132 setPath:v133];
                              }
                            }
                            id v129 = [v127 countByEnumeratingWithState:&v201 objects:v247 count:16];
                          }
                          while (v129);
                        }
                        long long v119 = v173 + 1;
                      }
                      while (v173 + 1 != v169);
                      long long v169 = (char *)[v163 countByEnumeratingWithState:&v209 objects:v249 count:16];
                    }
                    while (v169);
                  }
                  uint64_t v117 = v160 + 1;
                }
                while ((id)(v160 + 1) != v157);
                id v157 = [v151 countByEnumeratingWithState:&v213 objects:v250 count:16];
              }
              while (v157);
            }
          }
          uint64_t v115 = v148 + 1;
        }
        while ((id)(v148 + 1) != v146);
        id v146 = [v142 countByEnumeratingWithState:&v217 objects:v251 count:16];
      }
      while (v146);
    }
  }
}

- (void)addStyledCaptionToSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  if (objc_msgSend(objc_msgSend(a3, "userInfoAttributeForKey:", @"hasSubtitle"), "BOOLValue")) {
    return;
  }
  id v9 = a5 ? a5 : objc_msgSend(objc_msgSend(a4, "documentLayerGroup"), "authoringOptions");
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:v9];
  id v11 = [a4 videoPaths];
  [(NSMutableDictionary *)v10 setObject:v11 forKey:kMPAuthoringSecondaryPaths];
  uint64_t v12 = +[NSNumber numberWithBool:1];
  [(NSMutableDictionary *)v10 setObject:v12 forKey:kMPAuthoringAlwaysIncludeLastTransition];
  [(NSMutableDictionary *)v10 setObject:kMPFadeNone forKey:kMPAuthoringOutroEffectID];
  id v13 = +[NSNumber numberWithBool:0];
  [(NSMutableDictionary *)v10 setObject:v13 forKey:kMPAuthoringUseLoopTransition];
  id v14 = +[MPAuthoringUtilities styleFromOptions:v10];
  id v15 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "interstitialEffectLayoutsForStyleID:", v14);
  if (!v15) {
    return;
  }
  id v16 = v15;
  if (![v15 count]) {
    return;
  }
  id v80 = self;
  id v72 = objc_msgSend(objc_msgSend(a3, "path"), "copy");
  id v17 = [a3 parentEffect];
  id v18 = [v17 parentContainer];
  id v77 = (char *)[v18 index];
  id v76 = a3;
  id v73 = [v18 parentLayer];
  id v71 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIndexForLayerID:ofStyle:", objc_msgSend(v73, "layerID"), v14);
  uint64_t v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  BOOL v79 = v10;
  [(NSMutableDictionary *)v10 setObject:v19 forKey:kMPAuthoringLayerIndex];
  id v20 = (char *)objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "subtitleOrderForStyleID:", v14);
  id v21 = (char *)[a3 index];
  id v74 = (NSDictionary *)a5;
  id v75 = a4;
  if (v20 == (unsigned char *)&dword_0 + 1) {
    id v22 = (char *)[a3 index] + 1;
  }
  else {
    id v22 = v21;
  }
  id v23 = +[NSMutableArray array];
  id v24 = objc_msgSend(objc_msgSend(v17, "slides"), "objectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v22));
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v93 objects:v100 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v94;
    do
    {
      for (id i = 0; i != v26; id i = (char *)i + 1)
      {
        if (*(void *)v94 != v27) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * i), "path"));
      }
      id v26 = [v24 countByEnumeratingWithState:&v93 objects:v100 count:16];
    }
    while (v26);
  }
  id v29 = +[NSMutableArray array];
  id v30 = objc_msgSend(objc_msgSend(v17, "slides"), "objectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v22, (unsigned char *)objc_msgSend(v17, "countOfSlides") - v22));
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v31 = [v30 countByEnumeratingWithState:&v89 objects:v99 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v90;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v90 != v33) {
          objc_enumerationMutation(v30);
        }
        objc_msgSend(v29, "addObject:", objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * (void)j), "path"));
      }
      id v32 = [v30 countByEnumeratingWithState:&v89 objects:v99 count:16];
    }
    while (v32);
  }
  if (v80->_isAuthoring)
  {
    uint64_t v35 = +[NSNumber numberWithInteger:v71];
    id v36 = v79;
    [(NSMutableDictionary *)v79 setObject:v35 forKey:kMPAuthoringLayerIndex];
  }
  else
  {
    [(MPAuthoringController *)v80 setAuthoredDocument:v75];
    id v37 = +[NSMutableArray arrayWithArray:v23];
    [(NSMutableArray *)v37 addObjectsFromArray:v29];
    id v38 = v37;
    id v36 = v79;
    [(MPAuthoringController *)v80 cacheROIInformationForImages:v38 withOptions:v79];
  }
  id v39 = [(MPAuthoringController *)v80 findEffectIDInPresetArray:v16 forImages:v29 withOptions:v36];
  if (v39)
  {
    id v40 = v39;
    id v41 = +[NSMutableArray array];
  }
  else
  {
    id v40 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "interstitialEffectLayoutForStyleID:", v14);
    id v41 = +[NSMutableArray array];
    if (!v40) {
      goto LABEL_35;
    }
  }
  uint64_t v42 = (NSArray *)[v40 objectForKey:@"presetID"];
  id v43 = [v40 objectForKey:@"backgroundEffect"];
  id v44 = (char *)objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSlidesForEffectID:", +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v42));
  if (v43)
  {
    id v45 = &v44[(void)objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "numberOfSlidesForEffectID:", +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", v43))];
    if (v45 <= [v30 count])
    {
      uint64_t v42 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v43, v42, 0);
LABEL_34:
      [v41 addObject:v42];
    }
  }
  else if (v44 <= [v30 count])
  {
    goto LABEL_34;
  }
LABEL_35:
  id v46 = v80;
  if ([v41 count])
  {
    if ([v23 count])
    {
      if (+[MPAuthoringUtilities useTitleEffectFromOptions:a5])
      {
        id v47 = objc_msgSend(-[MPDocument titleEffect](v80->_authoredDocument, "titleEffect"), "countOfSlides");
        if (!v23
          || (id v48 = v47,
              !objc_msgSend(objc_msgSend(v23, "objectAtIndex:", 0), "isEqualToString:", objc_msgSend(objc_msgSend(v75, "orderedVideoPaths"), "objectAtIndex:", 0)))|| !v48)
        {
          long long v49 = +[NSNumber numberWithBool:0];
          [(NSMutableDictionary *)v79 setObject:v49 forKey:kMPAuthoringUseTitleEffect];
        }
      }
    }
    id v50 = v77;
    objc_msgSend(v73, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v77));
    if ([v23 count])
    {
      id v51 = [(MPAuthoringController *)v80 effectContainersWithImages:v23 effects:[(MPAuthoringController *)v80 effectsForImages:v23 withOptions:v79] andOptions:v79];
      [v73 insertEffectContainers:v51 atIndex:v77];
      id v50 = &v77[(void)[v51 count]];
    }
    id v52 = [v76 path];
    id v53 = [(NSMutableDictionary *)v79 objectForKey:kMPAuthoringSubtitles];
    if (!v53 || (CFStringRef v54 = (const __CFString *)[v53 objectForKey:v52]) == 0) {
      CFStringRef v54 = @"Subtitle Text Here";
    }
    id v55 = +[NSArray arrayWithObject:v54];
    [(NSMutableDictionary *)v79 setObject:v55 forKey:kMPAuthoringTitleStrings];
    id v56 = [(MPAuthoringController *)v80 effectContainersWithImages:v29 effects:v41 andOptions:v79];
    uint64_t v78 = v50;
    [v73 insertEffectContainers:v56 atIndex:v50];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v57 = [v56 countByEnumeratingWithState:&v85 objects:v98 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = 0;
      uint64_t v60 = *(void *)v86;
      do
      {
        for (id k = 0; k != v58; id k = (char *)k + 1)
        {
          if (*(void *)v86 != v60) {
            objc_enumerationMutation(v56);
          }
          id v62 = *(void **)(*((void *)&v85 + 1) + 8 * (void)k);
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v63 = [v62 effects];
          id v64 = [v63 countByEnumeratingWithState:&v81 objects:v97 count:16];
          if (v64)
          {
            id v65 = v64;
            uint64_t v66 = *(void *)v82;
            do
            {
              for (m = 0; m != v65; m = (char *)m + 1)
              {
                if (*(void *)v82 != v66) {
                  objc_enumerationMutation(v63);
                }
                v59 += (uint64_t)[*(id *)(*((void *)&v81 + 1) + 8 * (void)m) countOfSlides];
              }
              id v65 = [v63 countByEnumeratingWithState:&v81 objects:v97 count:16];
            }
            while (v65);
          }
        }
        id v58 = [v56 countByEnumeratingWithState:&v85 objects:v98 count:16];
      }
      while (v58);
    }
    else
    {
      uint64_t v59 = 0;
    }
    objc_msgSend(v29, "removeObjectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v59));
    id v68 = [v56 count];
    id v46 = v80;
    if ([v29 count])
    {
      id v69 = +[NSNumber numberWithBool:0];
      [(NSMutableDictionary *)v79 setObject:v69 forKey:kMPAuthoringUseTitleEffect];
      objc_msgSend(v73, "insertEffectContainers:atIndex:", -[MPAuthoringController effectContainersWithImages:effects:andOptions:](v80, "effectContainersWithImages:effects:andOptions:", v29, -[MPAuthoringController effectsForImages:withOptions:](v80, "effectsForImages:withOptions:", v29, v79), v79), &v78[(void)v68]);
    }
  }
  objc_msgSend(+[MPUtilities slideForPath:inDocument:](MPUtilities, "slideForPath:inDocument:", v72, v75), "setUserInfoAttribute:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"hasSubtitle");

  id v70 = v74;
  if (!v46->_isAuthoring && !v46->_skipApplyingSettings)
  {
    [(MPAuthoringController *)v46 cleanup];
    if (!v74) {
      id v70 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", objc_msgSend(objc_msgSend(v75, "documentLayerGroup"), "authoringOptions"));
    }
    [(MPAuthoringController *)v46 reconfigureColorSchemeInDocument:v75 withOptions:v70];
    [(MPAuthoringController *)v46 configureFiltersInDocument:v75 withOptions:v70];
    [(MPAuthoringController *)v46 configureTransitionsInDocument:v75 withOptions:v70];
    [(MPAuthoringController *)v46 scaleDurationsInDocument:v75 withOptions:v70];
    objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "cropSlidesInDocument:withOptions:", v75, v70);
  }
}

- (void)removeStyledCaptionFromSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  if (objc_msgSend(objc_msgSend(a3, "userInfoAttributeForKey:", @"hasSubtitle"), "BOOLValue"))
  {
    if (!a5) {
      a5 = objc_msgSend(objc_msgSend(a4, "documentLayerGroup"), "authoringOptions");
    }
    id v7 = +[MPAuthoringUtilities styleFromOptions:a5];
    id v8 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "interstitialEffectLayoutsForStyleID:", v7);
    if (v8)
    {
      id v9 = v8;
      if ([v8 count])
      {
        id v10 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
        id v59 = objc_msgSend(objc_msgSend(a3, "path"), "copy");
        id v11 = [a5 mutableCopy];
        uint64_t v12 = +[NSNumber numberWithBool:0];
        [v11 setObject:v12 forKey:kMPAuthoringUseTitleEffect];
        id v13 = +[NSNumber numberWithBool:1];
        [v11 setObject:v13 forKey:kMPAuthoringAlwaysIncludeLastTransition];
        id v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIndexForLayerID:ofStyle:", objc_msgSend(objc_msgSend(v10, "parentLayer"), "layerID"), v7));
        [v11 setObject:v14 forKey:kMPAuthoringLayerIndex];
        id v15 = [a4 videoPaths];
        uint64_t v60 = v11;
        [v11 setObject:v15 forKey:kMPAuthoringSecondaryPaths];
        id v16 = [v10 parentLayer];
        id v17 = objc_msgSend(objc_msgSend(v16, "effectContainers"), "lastObject");
        id v18 = (char *)[v16 countOfEffectContainers] - 2;
        if (v18 == [v10 index] && !objc_msgSend(v17, "countOfEffects"))
        {
          int v20 = 1;
        }
        else
        {
          [v60 setObject:kMPFadeNone forKey:kMPAuthoringOutroEffectID];
          uint64_t v19 = +[NSNumber numberWithBool:0];
          [v60 setObject:v19 forKey:kMPAuthoringUseLoopTransition];
          int v20 = 0;
        }
        if (!self->_isAuthoring) {
          [(MPAuthoringController *)self setAuthoredDocument:a4];
        }
        id v21 = (char *)objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "subtitleOrderForStyleID:", v7);
        if (v21 == (unsigned char *)&dword_0 + 2)
        {
          id v25 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
          id v23 = [v25 parentLayer];
          id v24 = (char *)[v25 index] - 1;
        }
        else
        {
          if (v21 != (unsigned char *)&dword_0 + 1)
          {
            int v69 = v20;
            long long v93 = 0u;
            long long v94 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            id v29 = [v10 effects];
            id v30 = [v29 countByEnumeratingWithState:&v91 objects:v100 count:16];
            if (v30)
            {
              id v31 = v30;
              id v67 = *(id *)v92;
              while (2)
              {
                for (id i = 0; i != v31; id i = (char *)i + 1)
                {
                  if (*(id *)v92 != v67) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@", [*(id *)(*((void *)&v91 + 1) + 8 * i) effectID], objc_msgSend(*(id *)(*((void *)&v91 + 1) + 8 * i), "presetID"));
                  long long v87 = 0u;
                  long long v88 = 0u;
                  long long v89 = 0u;
                  long long v90 = 0u;
                  id v34 = [v9 countByEnumeratingWithState:&v87 objects:v99 count:16];
                  if (v34)
                  {
                    id v35 = v34;
                    uint64_t v36 = *(void *)v88;
LABEL_23:
                    uint64_t v37 = 0;
                    while (1)
                    {
                      if (*(void *)v88 != v36) {
                        objc_enumerationMutation(v9);
                      }
                      if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v87 + 1) + 8 * v37), "objectForKey:", @"presetID"), "isEqualToString:", v33))goto LABEL_31; {
                      if (v35 == (id)++v37)
                      }
                      {
                        id v35 = [v9 countByEnumeratingWithState:&v87 objects:v99 count:16];
                        if (v35) {
                          goto LABEL_23;
                        }
                        break;
                      }
                    }
                  }
                }
                id v31 = [v29 countByEnumeratingWithState:&v91 objects:v100 count:16];
                if (v31) {
                  continue;
                }
                break;
              }
            }
LABEL_31:
            id v38 = +[NSMutableArray array];
            long long v83 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            id v39 = [v10 effects];
            id v40 = [v39 countByEnumeratingWithState:&v83 objects:v98 count:16];
            if (v40)
            {
              id v41 = v40;
              uint64_t v42 = *(void *)v84;
              do
              {
                for (j = 0; j != v41; j = (char *)j + 1)
                {
                  if (*(void *)v84 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  objc_msgSend(v38, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * (void)j), "videoPaths"));
                }
                id v41 = [v39 countByEnumeratingWithState:&v83 objects:v98 count:16];
              }
              while (v41);
            }
            id obj = [(MPAuthoringController *)self effectContainersWithImages:v38 effects:[(MPAuthoringController *)self effectsForImages:v38 withOptions:v60] andOptions:v60];
            id v44 = [v10 parentLayer];
            id v45 = (char *)[v10 index];
            if (v69) {
              objc_msgSend(v44, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v45 + 1));
            }
            objc_msgSend(v44, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v45));
            [v44 insertEffectContainers:obj atIndex:v45];
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            id v65 = [obj countByEnumeratingWithState:&v79 objects:v97 count:16];
            if (v65)
            {
              id v70 = 0;
              uint64_t v64 = *(void *)v80;
              do
              {
                uint64_t v46 = 0;
                do
                {
                  if (*(void *)v80 != v64) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v66 = v46;
                  id v47 = *(void **)(*((void *)&v79 + 1) + 8 * v46);
                  long long v75 = 0u;
                  long long v76 = 0u;
                  long long v77 = 0u;
                  long long v78 = 0u;
                  id v68 = [v47 effects];
                  id v48 = [v68 countByEnumeratingWithState:&v75 objects:v96 count:16];
                  if (v48)
                  {
                    id v49 = v48;
                    uint64_t v50 = *(void *)v76;
                    do
                    {
                      for (id k = 0; k != v49; id k = (char *)k + 1)
                      {
                        if (*(void *)v76 != v50) {
                          objc_enumerationMutation(v68);
                        }
                        id v52 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
                        long long v71 = 0u;
                        long long v72 = 0u;
                        long long v73 = 0u;
                        long long v74 = 0u;
                        id v53 = [v52 slides];
                        id v54 = [v53 countByEnumeratingWithState:&v71 objects:v95 count:16];
                        if (v54)
                        {
                          id v55 = v54;
                          uint64_t v56 = *(void *)v72;
                          while (2)
                          {
                            for (m = 0; m != v55; m = (char *)m + 1)
                            {
                              if (*(void *)v72 != v56) {
                                objc_enumerationMutation(v53);
                              }
                              id v58 = *(void **)(*((void *)&v71 + 1) + 8 * (void)m);
                              if (objc_msgSend(objc_msgSend(v58, "path"), "isEqualToString:", objc_msgSend(v38, "objectAtIndex:", 0)))
                              {
                                id v70 = v58;
                                goto LABEL_60;
                              }
                            }
                            id v55 = [v53 countByEnumeratingWithState:&v71 objects:v95 count:16];
                            if (v55) {
                              continue;
                            }
                            break;
                          }
                        }
LABEL_60:
                        ;
                      }
                      id v49 = [v68 countByEnumeratingWithState:&v75 objects:v96 count:16];
                    }
                    while (v49);
                  }
                  uint64_t v46 = v66 + 1;
                }
                while ((id)(v66 + 1) != v65);
                id v65 = [obj countByEnumeratingWithState:&v79 objects:v97 count:16];
              }
              while (v65);
            }
            else
            {
              id v70 = 0;
            }
            id v26 = self;
            [(MPAuthoringController *)self clearROICache];
            uint64_t v27 = self;
            id v28 = v70;
            goto LABEL_68;
          }
          id v22 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
          id v23 = [v22 parentLayer];
          id v24 = (char *)[v22 index] + 1;
        }
        objc_msgSend(v23, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v24));
        id v26 = self;
        uint64_t v27 = self;
        id v28 = a3;
LABEL_68:
        [(MPAuthoringController *)v27 combineEffectsNearSlide:v28 inDocument:a4 withOptions:v60];
        objc_msgSend(+[MPUtilities slideForPath:inDocument:](MPUtilities, "slideForPath:inDocument:", v59, a4), "setUserInfoAttribute:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), @"hasSubtitle");

        if (!v26->_isAuthoring)
        {
          [(MPAuthoringController *)v26 cleanup];
          [(MPAuthoringController *)v26 scaleDurationsInDocument:a4 withOptions:v60];
          objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "cropSlidesInDocument:withOptions:", a4, v60);
        }
      }
    }
  }
}

- (void)combineSlides:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v8 = +[NSMutableArray array];
  id v9 = +[NSMutableSet set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (id i = 0; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(a3);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v8, "addObject:", objc_msgSend(v14, "path"));
        objc_msgSend(v9, "addObject:", objc_msgSend(objc_msgSend(v14, "parentEffect"), "parentContainer"));
      }
      id v11 = [a3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }
  id v15 = objc_msgSend(objc_msgSend(v9, "anyObject"), "parentLayer");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v9);
        }
        id v21 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) index];
        if ((uint64_t)v21 < v19) {
          uint64_t v19 = (uint64_t)v21;
        }
        objc_msgSend(v15, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v21));
      }
      id v17 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }
  else
  {
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(v15, "insertEffectContainers:atIndex:", -[MPAuthoringController effectContainersWithPaths:forDocument:withOptions:](self, "effectContainersWithPaths:forDocument:withOptions:", v8, a4, a5), v19);
}

- (void)combineEffectsNearSlide:(id)a3 inDocument:(id)a4 withOptions:(id)a5
{
  id v8 = +[MPAuthoringUtilities effectListFromOptions:a5];
  id v9 = +[NSMutableArray array];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v75;
    do
    {
      for (id i = 0; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v75 != v12) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * i), "objectForKey:", @"presetID"));
      }
      id v11 = [v8 countByEnumeratingWithState:&v74 objects:v82 count:16];
    }
    while (v11);
  }
  if ((unint64_t)objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "maxNumOfImagesPerEffectInList:", v9) < 3)return; {
  id v14 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
  }
  id v15 = [v14 parentLayer];
  id v16 = 0;
  while (1)
  {
    id v17 = v14;
    if (v16) {
      break;
    }
LABEL_13:
    if ((uint64_t)[v17 index] >= 2)
    {
      id v18 = objc_msgSend(v15, "objectInEffectContainersAtIndex:", (char *)objc_msgSend(v17, "index") - 1);
      if (v18)
      {
        id v16 = v18;
        if (![v18 textCount] && (uint64_t)objc_msgSend(v16, "countOfEffects") > 0) {
          continue;
        }
      }
    }
    goto LABEL_19;
  }
  if ([v16 slideCount] == (char *)&dword_0 + 1)
  {
    id v17 = v16;
    if ((uint64_t)[v16 index] < 1) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  id v17 = v16;
LABEL_19:
  uint64_t v19 = 0;
  while (2)
  {
    int v20 = v14;
    if (!v19)
    {
LABEL_23:
      id v22 = (char *)[v20 index];
      if ((uint64_t)v22 >= (uint64_t)((char *)[v15 countOfEffectContainers] - 1)) {
        goto LABEL_28;
      }
      id v23 = objc_msgSend(v15, "objectInEffectContainersAtIndex:", (char *)objc_msgSend(v20, "index") + 1);
      if (!v23) {
        goto LABEL_28;
      }
      uint64_t v19 = v23;
      if ([v23 textCount]) {
        goto LABEL_28;
      }
      continue;
    }
    break;
  }
  if ([v19 slideCount] == (char *)&dword_0 + 1)
  {
    id v21 = [v19 index];
    int v20 = v19;
    if ((uint64_t)v21 >= (uint64_t)[v15 countOfEffectContainers]) {
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  int v20 = v19;
LABEL_28:
  if (v17 != v20)
  {
    id v24 = +[NSMutableArray array];
    uint64_t v50 = self;
    if ([v20 countOfEffects]
      || (long long v25 = (char *)[v15 countOfEffectContainers] - 1, v25 != objc_msgSend(v20, "index")))
    {
      uint64_t v27 = 0;
    }
    else
    {
      id v26 = [a5 objectForKey:kMPAuthoringOutroEffectID];
      uint64_t v27 = [v26 isEqualToString:kMPFadeNone] ^ 1;
    }
    id v49 = v15;
    id v48 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", [v17 index], (unsigned char *)objc_msgSend(v20, "index") + v27 - (unsigned char *)objc_msgSend(v17, "index"));
    id v28 = objc_msgSend(objc_msgSend(v15, "effectContainers"), "objectsAtIndexes:", v48);
    id v29 = +[NSMutableArray array];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v28;
    id v54 = [v28 countByEnumeratingWithState:&v70 objects:v81 count:16];
    if (v54)
    {
      uint64_t v53 = *(void *)v71;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v71 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v55 = v30;
          id v31 = *(void **)(*((void *)&v70 + 1) + 8 * v30);
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v56 = [v31 effects];
          id v32 = [v56 countByEnumeratingWithState:&v66 objects:v80 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v57 = *(void *)v67;
            do
            {
              for (j = 0; j != v33; j = (char *)j + 1)
              {
                if (*(void *)v67 != v57) {
                  objc_enumerationMutation(v56);
                }
                id v35 = *(void **)(*((void *)&v66 + 1) + 8 * (void)j);
                long long v62 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                long long v65 = 0u;
                id v36 = [v35 slides];
                id v37 = [v36 countByEnumeratingWithState:&v62 objects:v79 count:16];
                if (v37)
                {
                  id v38 = v37;
                  uint64_t v39 = *(void *)v63;
                  do
                  {
                    for (id k = 0; k != v38; id k = (char *)k + 1)
                    {
                      if (*(void *)v63 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      id v41 = *(void **)(*((void *)&v62 + 1) + 8 * (void)k);
                      if (objc_msgSend(objc_msgSend(v41, "userInfoAttributeForKey:", @"hasSubtitle"), "BOOLValue"))objc_msgSend(v29, "addObject:", objc_msgSend(v41, "path")); {
                      objc_msgSend(v24, "addObject:", objc_msgSend(v41, "path"));
                      }
                    }
                    id v38 = [v36 countByEnumeratingWithState:&v62 objects:v79 count:16];
                  }
                  while (v38);
                }
              }
              id v33 = [v56 countByEnumeratingWithState:&v66 objects:v80 count:16];
            }
            while (v33);
          }
          uint64_t v30 = v55 + 1;
        }
        while ((id)(v55 + 1) != v54);
        id v54 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
      }
      while (v54);
    }
    [v49 removeEffectContainersAtIndices:v48];
    id v42 = [a5 mutableCopy];
    id v43 = +[NSNumber numberWithBool:0];
    [v42 setObject:v43 forKey:kMPAuthoringUseTitleEffect];
    objc_msgSend(v49, "insertEffectContainers:atIndex:", -[MPAuthoringController effectContainersWithImages:effects:andOptions:](v50, "effectContainersWithImages:effects:andOptions:", v24, -[MPAuthoringController effectsForImages:withOptions:](v50, "effectsForImages:withOptions:", v24, v42), v42), -[NSIndexSet firstIndex](v48, "firstIndex"));
    if ([v29 count])
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v44 = [v29 countByEnumeratingWithState:&v58 objects:v78 count:16];
      if (v44)
      {
        id v45 = v44;
        uint64_t v46 = *(void *)v59;
        do
        {
          for (m = 0; m != v45; m = (char *)m + 1)
          {
            if (*(void *)v59 != v46) {
              objc_enumerationMutation(v29);
            }
            objc_msgSend(+[MPUtilities slideForPath:inDocument:](MPUtilities, "slideForPath:inDocument:", *(void *)(*((void *)&v58 + 1) + 8 * (void)m), a4), "setUserInfoAttribute:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"hasSubtitle");
          }
          id v45 = [v29 countByEnumeratingWithState:&v58 objects:v78 count:16];
        }
        while (v45);
      }
    }
  }
}

- (void)_reorderImagesInDocument:(id)a3 withOptions:(id)a4
{
  id v4 = a3;
  if (objc_msgSend(objc_msgSend(a3, "videoPaths"), "count"))
  {
    if ([v4 countOfLayers])
    {
      [(MPAuthoringController *)self setAuthoredDocument:v4];
      objc_msgSend(objc_msgSend(v4, "montage"), "lock");
      id v6 = [v4 mainLayers];
      id v84 = +[NSMutableSet set];
      id v7 = +[NSMutableDictionary dictionaryWithDictionary:a4];
      id v71 = +[NSMutableArray array];
      v86.location = (NSUInteger)+[MPAuthoringUtilities reconfigureRangeFromOptions:a4];
      v86.length = v8;
      id v70 = [a4 objectForKey:kMPAuthoringStyleID];
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id obj = v6;
      id v9 = [v6 countByEnumeratingWithState:&v115 objects:v126 count:16];
      long long v75 = self;
      long long v76 = v4;
      long long v72 = v7;
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v116;
        uint64_t v69 = *(void *)v116;
        do
        {
          uint64_t v12 = 0;
          id v73 = v10;
          do
          {
            if (*(void *)v116 != v11) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(void **)(*((void *)&v115 + 1) + 8 * (void)v12);
            if (([v13 isAudioLayer] & 1) == 0)
            {
              long long v79 = v13;
              id v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIndexForLayerID:ofStyle:", objc_msgSend(v13, "layerID"), v70));
              [(NSMutableDictionary *)v7 setObject:v14 forKey:kMPAuthoringLayerIndex];
              id v15 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[MPAuthoringController orderImages:withOptions:](self, "orderImages:withOptions:", [v4 videoPaths], v7));
              id v16 = +[MPAuthoringUtilities effectListFromOptions:v7];
              id v17 = +[NSMutableArray array];
              long long v111 = 0u;
              long long v112 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              id v18 = [v16 countByEnumeratingWithState:&v111 objects:v125 count:16];
              if (v18)
              {
                id v19 = v18;
                uint64_t v20 = *(void *)v112;
                do
                {
                  for (id i = 0; i != v19; id i = (char *)i + 1)
                  {
                    if (*(void *)v112 != v20) {
                      objc_enumerationMutation(v16);
                    }
                    objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((void *)&v111 + 1) + 8 * i), "objectForKey:", @"presetID"));
                  }
                  id v19 = [v16 countByEnumeratingWithState:&v111 objects:v125 count:16];
                }
                while (v19);
              }
              long long v78 = v12;
              long long v77 = (char *)objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "maxNumOfImagesPerEffectInList:", v17);
              id v22 = [v13 effectContainers];
              long long v107 = 0u;
              long long v108 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              id v80 = v22;
              id v82 = [v22 countByEnumeratingWithState:&v107 objects:v124 count:16];
              if (v82)
              {
                NSUInteger v23 = 0;
                uint64_t v81 = *(void *)v108;
                do
                {
                  uint64_t v24 = 0;
                  do
                  {
                    if (*(void *)v108 != v81) {
                      objc_enumerationMutation(v80);
                    }
                    uint64_t v83 = v24;
                    long long v25 = *(void **)(*((void *)&v107 + 1) + 8 * v24);
                    long long v103 = 0u;
                    long long v104 = 0u;
                    long long v105 = 0u;
                    long long v106 = 0u;
                    id v85 = [v25 effects];
                    id v26 = [v85 countByEnumeratingWithState:&v103 objects:v123 count:16];
                    if (v26)
                    {
                      id v27 = v26;
                      uint64_t v28 = *(void *)v104;
                      do
                      {
                        for (j = 0; j != v27; j = (char *)j + 1)
                        {
                          if (*(void *)v104 != v28) {
                            objc_enumerationMutation(v85);
                          }
                          uint64_t v30 = *(void **)(*((void *)&v103 + 1) + 8 * (void)j);
                          int64_t v31 = (int64_t)[v30 countOfSlides];
                          if (v86.length
                            && (v128.location = v23, v128.length = v31, !NSIntersectionRange(v86, v128).length)
                            && (unint64_t)[(NSMutableArray *)v15 count] >= v31)
                          {
                            if ([(NSMutableArray *)v15 count]) {
                              [(NSMutableArray *)v15 removeObjectsAtIndexes:+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v31)];
                            }
                          }
                          else if (v31 >= 1)
                          {
                            uint64_t v32 = 0;
                            while ([(NSMutableArray *)v15 count])
                            {
                              id v33 = objc_msgSend(objc_msgSend(v30, "slides"), "objectAtIndex:", v32);
                              id v34 = [(NSMutableArray *)v15 objectAtIndex:0];
                              if ((objc_msgSend(objc_msgSend(v33, "path"), "isEqualToString:", v34) & 1) == 0) {
                                objc_msgSend(v30, "replaceSlideAtIndex:withSlide:", v32, +[MPSlide slideWithPath:](MPSlide, "slideWithPath:", v34));
                              }
                              [(NSMutableArray *)v15 removeObjectAtIndex:0];
                              if (v31 == ++v32) {
                                goto LABEL_39;
                              }
                            }
                            [v30 setReplaceSlides:0];
                            objc_msgSend(v30, "removeSlidesAtIndices:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v32, v31 - v32));
                            [v30 setReplaceSlides:1];
                            [v84 addObject:v30];
                          }
LABEL_39:
                          v23 += v31;
                        }
                        id v27 = [v85 countByEnumeratingWithState:&v103 objects:v123 count:16];
                      }
                      while (v27);
                    }
                    uint64_t v24 = v83 + 1;
                  }
                  while ((id)(v83 + 1) != v82);
                  id v82 = [v80 countByEnumeratingWithState:&v107 objects:v124 count:16];
                }
                while (v82);
              }
              if (v77 != (unsigned char *)&dword_0 + 1)
              {
                id v35 = objc_msgSend(objc_msgSend(v79, "effectContainers"), "reverseObjectEnumerator");
                for (k = v35; ; id v35 = k)
                {
                  id v37 = [v35 nextObject];
                  if (!v37) {
                    break;
                  }
                  long long v101 = 0u;
                  long long v102 = 0u;
                  long long v99 = 0u;
                  long long v100 = 0u;
                  id v38 = [v37 effects];
                  id v39 = [v38 countByEnumeratingWithState:&v99 objects:v122 count:16];
                  if (v39)
                  {
                    id v40 = v39;
                    uint64_t v41 = *(void *)v100;
LABEL_51:
                    uint64_t v42 = 0;
                    while (1)
                    {
                      if (*(void *)v100 != v41) {
                        objc_enumerationMutation(v38);
                      }
                      id v43 = *(void **)(*((void *)&v99 + 1) + 8 * v42);
                      if ([v43 countOfSlides] != (char *)&dword_0 + 1
                        || (objc_msgSend(objc_msgSend(objc_msgSend(v43, "objectInSlidesAtIndex:", 0), "userInfoAttributeForKey:", @"hasSubtitle"), "BOOLValue") & 1) != 0)
                      {
                        goto LABEL_44;
                      }
                      [v84 addObject:v43];
                      if (v40 == (id)++v42)
                      {
                        id v40 = [v38 countByEnumeratingWithState:&v99 objects:v122 count:16];
                        if (v40) {
                          goto LABEL_51;
                        }
                        break;
                      }
                    }
                  }
                }
              }
LABEL_44:
              [v71 addObjectsFromArray:v15];
              self = v75;
              id v4 = v76;
              id v7 = v72;
              id v10 = v73;
              uint64_t v11 = v69;
              uint64_t v12 = v78;
            }
            uint64_t v12 = (char *)v12 + 1;
          }
          while (v12 != v10);
          id v44 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
          id v10 = v44;
        }
        while (v44);
      }
      id v45 = +[NSMutableArray array];
      if ([v84 count])
      {
        id v46 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"parentContainer.index" ascending:1];
        id v47 = objc_msgSend(objc_msgSend(v84, "allObjects"), "sortedArrayUsingDescriptors:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v46));

        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v48 = [v47 countByEnumeratingWithState:&v95 objects:v121 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = *(void *)v96;
          do
          {
            for (m = 0; m != v49; m = (char *)m + 1)
            {
              if (*(void *)v96 != v50) {
                objc_enumerationMutation(v47);
              }
              id v52 = *(void **)(*((void *)&v95 + 1) + 8 * (void)m);
              long long v91 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              long long v94 = 0u;
              id v53 = [v52 slides];
              id v54 = [v53 countByEnumeratingWithState:&v91 objects:v120 count:16];
              if (v54)
              {
                id v55 = v54;
                uint64_t v56 = *(void *)v92;
                do
                {
                  for (n = 0; n != v55; n = (char *)n + 1)
                  {
                    if (*(void *)v92 != v56) {
                      objc_enumerationMutation(v53);
                    }
                    objc_msgSend(v45, "addObject:", objc_msgSend(*(id *)(*((void *)&v91 + 1) + 8 * (void)n), "path"));
                  }
                  id v55 = [v53 countByEnumeratingWithState:&v91 objects:v120 count:16];
                }
                while (v55);
              }
              id v58 = [v52 parentContainer];
              objc_msgSend(v58, "removeEffectsAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v52, "zIndex")));
              if (![v58 slideCount]) {
                objc_msgSend(objc_msgSend(v58, "parentLayer"), "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v58, "index")));
              }
            }
            id v49 = [v47 countByEnumeratingWithState:&v95 objects:v121 count:16];
          }
          while (v49);
        }
      }
      id v59 = objc_msgSend(objc_msgSend(v76, "mainLayers"), "lastObject");
      long long v60 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIndexForLayerID:ofStyle:", objc_msgSend(v59, "layerID"), v70));
      [(NSMutableDictionary *)v72 setObject:v60 forKey:kMPAuthoringLayerIndex];
      [v45 addObjectsFromArray:v71];
      if ([v45 count]) {
        [(MPAuthoringController *)v75 _addVideoPaths:v45 toEndOfLayer:v59 inDocument:v76 withOptions:v72];
      }
      [(MPAuthoringController *)v75 _checkForEmptyLayersInDocument:v76];
      v75->_skipApplyingSettings = 1;
      id v61 = +[MPAuthoringUtilities subtitlesFromOptions:a4];
      if (v61)
      {
        long long v62 = v61;
        if ([v61 count])
        {
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          id v63 = [v62 countByEnumeratingWithState:&v87 objects:v119 count:16];
          if (v63)
          {
            id v64 = v63;
            uint64_t v65 = *(void *)v88;
            do
            {
              for (id ii = 0; ii != v64; id ii = (char *)ii + 1)
              {
                if (*(void *)v88 != v65) {
                  objc_enumerationMutation(v62);
                }
                [(MPAuthoringController *)v75 addStyledCaptionToSlide:+[MPUtilities slideForPath:*(void *)(*((void *)&v87 + 1) + 8 * (void)ii) inDocument:v76] inDocument:v76 withOptions:a4];
              }
              id v64 = [v62 countByEnumeratingWithState:&v87 objects:v119 count:16];
            }
            while (v64);
          }
        }
      }
      v75->_skipApplyingSettings = 0;
      [(MPAuthoringController *)v75 configureFiltersInDocument:v76 withOptions:v72];
      [(MPAuthoringController *)v75 configureTransitionsInDocument:v76 withOptions:v72];
      [(MPAuthoringController *)v75 reconfigureColorSchemeInDocument:v76 withOptions:v72];
      [(MPAuthoringController *)v75 scaleDurationsInDocument:v76 withOptions:v72];
      objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "cropSlidesInDocument:withOptions:", v76, v72);
      objc_msgSend(objc_msgSend(v76, "montage"), "unlock");
      [(MPAuthoringController *)v75 cleanup];
    }
    else
    {
      [(MPAuthoringController *)self authorDocument:v4 withOptions:a4];
    }
  }
  else
  {
    [v4 removeAllLayers];
  }
}

- (id)_addVideoPaths:(id)a3 toEndOfLayer:(id)a4 inDocument:(id)a5 withOptions:(id)a6
{
  id v10 = +[NSMutableDictionary dictionaryWithDictionary:a6];
  id v40 = [a4 zIndex];
  p_info = MRTiledSprite.info;
  id v12 = +[MPAuthoringUtilities outroEffectIDFromOptions:v10];
  id v39 = a6;
  if ((uint64_t)[a4 countOfEffectContainers] < 1) {
    goto LABEL_14;
  }
  id v13 = objc_msgSend(objc_msgSend(a4, "effectContainers"), "lastObject");
  if (!objc_msgSend(objc_msgSend(v13, "effects"), "count"))
  {
    if (![v12 isEqualToString:kMPFadeOutEffect]) {
      goto LABEL_15;
    }
    id v21 = (char *)[v13 index];
    objc_msgSend(a4, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v21));
    BOOL v16 = (uint64_t)v21 < 1;
    id v22 = v21 - 1;
    if (!v16 && (uint64_t)[a4 countOfEffectContainers] >= 1) {
      [a4 objectInEffectContainersAtIndex:v22];
    }
    goto LABEL_14;
  }
  unsigned int v14 = objc_msgSend(v12, "hasPrefix:", objc_msgSend(objc_msgSend(v13, "objectInEffectsAtIndex:", 0), "effectID"));
  if (!v14
    || (id v15 = (char *)[v13 index],
        objc_msgSend(a4, "removeEffectContainersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v15)), BOOL v16 = (uint64_t)v15 < 1, v17 = v15 - 1, v16))
  {
    id v18 = a3;
  }
  else
  {
    id v18 = a3;
    if ((uint64_t)[a4 countOfEffectContainers] >= 1) {
      id v13 = [a4 objectInEffectContainersAtIndex:v17];
    }
  }
  id v19 = objc_msgSend(objc_msgSend(v13, "effects"), "objectAtIndex:", 0);
  uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@", [v19 effectID], objc_msgSend(v19, "presetID"));
  [(NSMutableDictionary *)v10 setObject:v20 forKey:kMPAuthoringInitiallyIgnoreEffect];
  a3 = v18;
  p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
  if (v14) {
LABEL_14:
  }
    id v13 = 0;
LABEL_15:
  if ([a4 countOfEffectContainers]) {
    id v23 = 0;
  }
  else {
    id v23 = [p_info + 186 useTitleEffectFromOptions:v10];
  }
  uint64_t v24 = +[NSNumber numberWithBool:v23];
  [(NSMutableDictionary *)v10 setObject:v24 forKey:kMPAuthoringUseTitleEffect];
  id v25 = [(MPAuthoringController *)self orderImages:a3 withOptions:v10];
  id v26 = [(MPAuthoringController *)self effectContainersWithImages:v25 effects:[(MPAuthoringController *)self effectsForImages:v25 withOptions:v10] andOptions:v10];
  if (v13)
  {
    char v27 = objc_opt_respondsToSelector();
    int v28 = objc_opt_respondsToSelector();
    if (v27)
    {
      int v29 = v28;
      unsigned int v30 = objc_msgSend(self->_delegate, "document:shouldUseDefaultTransitionForEffectContainer:containerIndex:layerIndex:", a5, v13, objc_msgSend(v13, "index"), v40);
      if ((v30 & 1) == 0 && ((v29 ^ 1) & 1) == 0)
      {
        id v31 = objc_msgSend(self->_delegate, "document:needsTransitionForEffectContainer:containerIndex:layerIndex:", a5, v13, objc_msgSend(v13, "index"), v40);
LABEL_26:
        id v32 = v31;
LABEL_27:
        [a4 addEffectContainers:v26];
        [v13 setTransition:v32];
        goto LABEL_28;
      }
      if (!v30)
      {
        id v32 = 0;
        goto LABEL_27;
      }
    }
    id v31 = [(MPAuthoringController *)self transitionFromOptions:v39];
    goto LABEL_26;
  }
  [a4 addEffectContainers:v26];
LABEL_28:
  if ([v12 isEqualToString:kMPFadeOutEffect])
  {
    id v33 = (char *)[a4 countOfEffectContainers];
    if ((uint64_t)v33 >= 3)
    {
      id v34 = objc_msgSend(objc_msgSend(a4, "effectContainers"), "objectAtIndex:", v33 - 2);
      id v35 = [v34 transition];
      if (v35)
      {
        [v35 setTransitionID:@"Dissolve"];
      }
      else
      {
        id v36 = +[MPTransition transitionWithTransitionID:@"Dissolve"];
        objc_msgSend(-[MPAuthoringController transitionFromOptions:](self, "transitionFromOptions:", v10), "duration");
        if (v37 > 0.0) {
          -[MPTransition setDuration:](v36, "setDuration:");
        }
        [v34 setTransition:v36];
      }
    }
  }
  return v26;
}

- (id)_grabAndRemoveTitleEffectFromDocument:(id)a3 withOptions:(id)a4
{
  id v6 = +[MPAuthoringUtilities titleEffectFromOptions:a4];
  if (!v6) {
    goto LABEL_13;
  }
  id v7 = v6;
  id v8 = +[MPAuthoringUtilities styleFromOptions:a4];
  id v9 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfTitleEffectLayerForStyleID:", v8);
  if (v9 != objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfMainLayerForStyleID:", v8))goto LABEL_13; {
  id v10 = [a3 objectInLayersAtIndex:v9];
  }
  if ((uint64_t)[v10 countOfEffectContainers] < 1) {
    goto LABEL_13;
  }
  id v11 = +[MPUtilities idOfCombinedID:](MPUtilities, "idOfCombinedID:", [v7 objectForKey:@"presetID"]);
  id v12 = [v10 objectInEffectContainersAtIndex:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = objc_msgSend(v12, "effects", 0);
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (id i = 0; i != v15; id i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", objc_msgSend(v18, "effectID")))
        {
          id v21 = v18;
          id v19 = v21;
          if (v21) {
            objc_msgSend(v12, "removeEffectsAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v21, "zIndex")));
          }
          return v19;
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v19 = 0;
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_13:
    id v19 = 0;
  }
  return v19;
}

- (void)_readdTitleEffect:(id)a3 toDocument:(id)a4 withOptions:(id)a5
{
  id v6 = objc_msgSend(a4, "objectInLayersAtIndex:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfTitleEffectLayerForStyleID:", +[MPAuthoringUtilities styleFromOptions:](MPAuthoringUtilities, "styleFromOptions:", a5)));
  if ((uint64_t)[v6 countOfEffectContainers] >= 1)
  {
    id v7 = [v6 objectInEffectContainersAtIndex:0];
    [v7 addEffect:a3];
  }
}

- (void)_checkForEmptyLayersInDocument:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "allSlides"), "count"))
  {
    id v4 = (char *)[a3 countOfLayers];
    if ((uint64_t)v4 >= 1)
    {
      id v5 = v4;
      for (id i = 0; i != v5; ++i)
      {
        if (!objc_msgSend(objc_msgSend(a3, "objectInLayersAtIndex:", i), "countOfEffectContainers")) {
          objc_msgSend(a3, "removeLayersAtIndices:", +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", i));
        }
      }
    }
  }
  else
  {
    [a3 removeAllLayers];
  }
}

- (int64_t)_numberOfSlidesForOutroInLayer:(id)a3 withOptions:(id)a4
{
  id v6 = +[NSMutableDictionary dictionaryWithDictionary:a4];
  id v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "layerIndexForLayerID:ofStyle:", objc_msgSend(a3, "layerID"), objc_msgSend(a4, "objectForKey:", kMPAuthoringStyleID)));
  [(NSMutableDictionary *)v6 setObject:v7 forKey:kMPAuthoringLayerIndex];
  id v8 = +[MPAuthoringUtilities outroEffectIDFromOptions:v6];
  if (!v8) {
    return -1;
  }
  id v9 = v8;
  id v10 = objc_msgSend(objc_msgSend(a3, "effectContainers"), "lastObject");
  if ((uint64_t)[v10 countOfEffects] < 1) {
    return -1;
  }
  id v11 = objc_msgSend(objc_msgSend(v10, "effects"), "lastObject");
  if (!objc_msgSend(v9, "hasPrefix:", objc_msgSend(v11, "effectID"))) {
    return -1;
  }
  return (int64_t)[v11 countOfSlides];
}

- (int64_t)_countOfEmptyContainersInIntroOfLayer:(id)a3 withOptions:(id)a4
{
  int64_t v5 = 0;
  if (!objc_msgSend(objc_msgSend(a3, "objectInEffectContainersAtIndex:", 0, a4), "countOfEffects"))
  {
    int64_t v5 = 0;
    do
      ++v5;
    while (!objc_msgSend(objc_msgSend(a3, "objectInEffectContainersAtIndex:", v5), "countOfEffects"));
  }
  return v5;
}

- (void)setupClustersWithPaths:(id)a3 withOptions:(id)a4
{
  id v6 = +[MPClusterController sharedController];
  [v6 setAuthoredDocument:self->_authoredDocument];
  [v6 flush];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(a3);
        }
        [v6 addSlideForPath:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) withIndex:(char *)v11 + v9];
        id v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      v9 += (uint64_t)v11;
    }
    while (v8);
  }
}

- (void)cleanupClusters
{
}

- (void)findUsableClustersForUserDefinedSlideOrderPresentation:(id)a3 inClusters:(id)a4
{
  id v6 = +[MPClusterController sharedController];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = a4;
  id v22 = [a4 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v22)
  {
    uint64_t v25 = 0;
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v7;
        id v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v26 = v8;
        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v28;
          do
          {
            long long v12 = 0;
            id v24 = v10;
            do
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v26);
              }
              uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v12);
              id v14 = [v6 clusterSlidesSortedByUserDefinedSortOrder:v13 userDefinedSlideOrder:a3];
              if ([v14 count])
              {
                long long v15 = (char *)objc_msgSend(a3, "indexOfObject:", objc_msgSend(v14, "objectAtIndex:", 0));
                if (![v14 count]) {
                  goto LABEL_20;
                }
                id v16 = v6;
                unint64_t v17 = 0;
                do
                {
                  id v18 = [v14 objectAtIndex:v17];
                  BOOL v19 = &v15[v17] < [a3 count] && v18 == objc_msgSend(a3, "objectAtIndex:", &v15[v17]);
                  ++v17;
                }
                while (v17 < (unint64_t)[v14 count] && v19);
                id v6 = v16;
                id v10 = v24;
                if (v19) {
LABEL_20:
                }
                  objc_msgSend(objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v25), "usableSlideClusters"), "addObject:", v13);
              }
              long long v12 = (char *)v12 + 1;
            }
            while (v12 != v10);
            id v10 = [v26 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v10);
        }
        ++v25;
        uint64_t v7 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v22);
  }
}

@end