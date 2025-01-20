@interface VFXWorld
+ (BOOL)canImportFileExtension:(id)a3;
+ (BOOL)canImportFileUTI:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (SEL)jsConstructor;
+ (VFXWorld)worldWithData:(id)a3 options:(id)a4 error:(id *)a5;
+ (VFXWorld)worldWithMDLAsset:(id)a3;
+ (VFXWorld)worldWithMDLAsset:(id)a3 options:(id)a4;
+ (VFXWorld)worldWithSCNURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (VFXWorld)worldWithSceneKitScene:(id)a3 options:(id)a4;
+ (VFXWorld)worldWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (VFXWorld)worldWithURL:(id)a3 options:(id)a4 transferringConfigurationFrom:(id)a5 error:(id *)a6;
+ (VFXWorld)worldWithWorldRef:(__CFXWorld *)a3;
+ (id)_indexPathForNode:(id)a3;
+ (id)supportedFileUTIsForExport;
+ (id)supportedFileUTIsForImport;
+ (id)world;
+ (id)worldNamed:(id)a3;
+ (id)worldNamed:(id)a3 inDirectory:(id)a4 options:(id)a5;
+ (id)worldNamed:(id)a3 options:(id)a4;
- (BOOL)_allowsDefaultLightingEnvironmentFallback;
- (BOOL)allowRemoteEdition;
- (BOOL)initializeCoreEntityManagerWithInfo:(id)a3 error:(id *)a4;
- (BOOL)load:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)loadCoreEntityManagerFromURL:(id)a3 options:(id)a4 infoOut:(id)a5 error:(id *)a6;
- (BOOL)migrateCoreEntityManagerWithInfo:(id)a3 error:(id *)a4;
- (BOOL)reloadFromURL:(id)a3 error:(id *)a4;
- (BOOL)wantsScreenSpaceReflection;
- (BOOL)writeToURL:(id)a3 options:(id)a4 progressHandler:(id)a5;
- (BOOL)writeToURLWithUSDKit:(id)a3;
- (NSArray)bridgedComponentNames;
- (VFXBehaviorGraph)behaviorGraph;
- (VFXClock)clock;
- (VFXMaterialProperty)background;
- (VFXMaterialProperty)lightingEnvironment;
- (VFXNode)rootNode;
- (VFXPhysicsWorld)physicsWorld;
- (VFXWorld)init;
- (VFXWorld)initWithCoder:(id)a3;
- (VFXWorld)initWithOptions:(id)a3;
- (VFXWorld)initWithWorldRef:(__CFXWorld *)a3;
- (__CFXWorld)worldRef;
- (_opaque_pthread_mutex_t)mutex;
- (double)endTime;
- (double)fogColor_linearExtendedSRGB;
- (double)frameRate;
- (double)startTime;
- (double)upAxis;
- (float)fogDensityExponent;
- (float)fogEndDistance;
- (float)fogStartDistance;
- (float)playbackSpeed;
- (float)screenSpaceReflectionDepthThreshold;
- (float)screenSpaceReflectionMaximumDistance;
- (float)screenSpaceReflectionStride;
- (id)_exportAsMovieOperationWithDestinationURL:(id)a3 size:(CGSize)a4 attributes:(id)a5 delegate:(id)a6 didEndSelector:(SEL)a7 userInfo:(void *)a8;
- (id)_nodeWithIndexPath:(id)a3;
- (id)_physicsWorldCreateIfNeeded:(BOOL)a3;
- (id)_subnodeFromIndexPath:(id)a3;
- (id)_worlds;
- (id)assetPathResolver;
- (id)assetRegistry;
- (id)authoringEnvironment2;
- (id)buildIdentifierRemapTable;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentationWithOptions:(id)a3;
- (id)debugQuickLookObject;
- (id)debugQuickLookObjectWithPointOfView:(id)a3;
- (id)defaultRenderGraph;
- (id)exportAsMovieOperationWithDestinationURL:(id)a3 size:(CGSize)a4 attributes:(id)a5 delegate:(id)a6 didEndSelector:(SEL)a7 userInfo:(void *)a8;
- (id)fogColor;
- (id)identifier;
- (id)initForJavascript:(id)a3;
- (id)presentationScene;
- (id)remapTable;
- (id)remotePreviewDelegate;
- (id)root;
- (id)rootNodeForLayer:(int)a3;
- (id)scene;
- (id)snapshotWithSize:(CGSize)a3 pointOfView:(id)a4;
- (id)stateManager;
- (id)triggerManager;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)presentationEntityFromModel:(int64_t)a3;
- (int64_t)screenSpaceReflectionSampleCount;
- (void)__CFObject;
- (void)_clearWorldRef;
- (void)_dumpToDisk;
- (void)_scaleWorldBy:(float)a3;
- (void)_setRootNode:(id)a3 immediate:(BOOL)a4;
- (void)_syncObjCModel;
- (void)cloneModelToPresentationAndStartReplicationStream;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadMDLAsset:(id)a3 options:(id)a4 context:(id)a5;
- (void)loadSCN:(id)a3 options:(id)a4 error:(id *)a5;
- (void)lock;
- (void)prepareForRenderer:(id)a3 progressHandler:(id)a4;
- (void)replicateToRuntimeAndStartReplicationWithOptions:(id)a3;
- (void)resolveVFXCoreAndTagReferences;
- (void)setAssetPathResolver:(id)a3;
- (void)setAuthoringEnvironment2:(id)a3;
- (void)setBehaviorGraph:(id)a3;
- (void)setDefaultRenderGraph:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setFogColor:(id)a3;
- (void)setFogColor_linearExtendedSRGB:(VFXWorld *)self;
- (void)setFogDensityExponent:(float)a3;
- (void)setFogEndDistance:(float)a3;
- (void)setFogStartDistance:(float)a3;
- (void)setFrameRate:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setPlaybackSpeed:(float)a3;
- (void)setRemotePreviewDelegate:(id)a3;
- (void)setReplicationDelegate:(id)a3;
- (void)setRootNode:(id)a3;
- (void)setRootNode:(id)a3 forLayer:(int)a4;
- (void)setScreenSpaceReflectionMaximumDistance:(float)a3;
- (void)setScreenSpaceReflectionSampleCount:(int64_t)a3;
- (void)setScreenSpaceReflectionStride:(float)a3;
- (void)setStartTime:(double)a3;
- (void)setUpAxis:(VFXWorld *)self;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWantsScreenSpaceReflection:(BOOL)a3;
- (void)set_allowsDefaultLightingEnvironmentFallback:(BOOL)a3;
- (void)startRuntimeThread;
- (void)stopReplication;
- (void)unlock;
@end

@implementation VFXWorld

+ (VFXWorld)worldWithMDLAsset:(id)a3
{
  return (VFXWorld *)MEMORY[0x1F4181798](a1, sel_worldWithMDLAsset_options_, a3, 0);
}

- (void)loadMDLAsset:(id)a3 options:(id)a4 context:(id)a5
{
  uint64_t v458 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v421 = (char *)objc_opt_new();
  obuint64_t j = (id)objc_opt_new();
  v446[0] = 0;
  v446[1] = 0;
  v445 = (uint64_t *)v446;
  long long v441 = 0u;
  long long v442 = 0u;
  long long v443 = 0u;
  long long v444 = 0u;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v441, (uint64_t)v456, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v442;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v442 != v12) {
          objc_enumerationMutation(a3);
        }
        uint64_t v14 = objc_msgSend_nodeWithMDLObject_masterObjects_worldNodes_skinnedMeshes_skelNodesMap_asset_options_context_(VFXNode, v10, *(void *)(*((void *)&v441 + 1) + 8 * i), (uint64_t)v8, v421, obj, &v445, a3, a4, a5);
        v18 = objc_msgSend_rootNode(self, v15, v16, v17);
        objc_msgSend_addChildNode_(v18, v19, v14, v20);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v10, (uint64_t)&v441, (uint64_t)v456, 16);
    }
    while (v11);
  }

  long long v439 = 0u;
  long long v440 = 0u;
  long long v437 = 0u;
  long long v438 = 0u;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v437, (uint64_t)v455, 16);
  v26 = v421;
  if (v25)
  {
    uint64_t v27 = *(void *)v438;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v438 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v437 + 1) + 8 * j);
        uint64_t v30 = objc_msgSend_path(v29, v22, v23, v24);
        v33 = objc_msgSend_objectForKeyedSubscript_(v421, v31, v30, v32);
        if (v33) {
          objc_msgSend__addSkinnerWithMDLMesh_worldNodes_(v33, v22, (uint64_t)v29, (uint64_t)v421);
        }
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v437, (uint64_t)v455, 16);
    }
    while (v25);
  }
  v34 = objc_msgSend_animations(a3, v22, v23, v24);
  if (objc_msgSend_count(v34, v35, v36, v37))
  {
    v42 = objc_opt_new();
    unint64_t v43 = 0;
    v418 = self;
    v416 = v42;
    uint64_t v427 = *MEMORY[0x1E4F39FA0];
    id v417 = a3;
    while (1)
    {
      v44 = objc_msgSend_animations(a3, v39, v40, v41);
      if (v43 >= objc_msgSend_count(v44, v45, v46, v47)) {
        break;
      }
      v50 = objc_msgSend_animations(a3, v38, v48, v49);
      v53 = objc_msgSend_objectAtIndexedSubscript_(v50, v51, v43, v52);
      if (v53)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v432 = v53;
          v54 = objc_msgSend_jointPaths(v53, v39, v40, v41);
          int v426 = objc_msgSend_count(v54, v55, v56, v57);
          if (v426)
          {
            v58 = objc_msgSend_valueForKey_(a4, v39, @"kSceneSourceAnimationLoadingMode", v41);
            v62 = v58;
            if (v58)
            {
              if (objc_msgSend_isEqualToString_(v58, v59, @"playOnce", v61))
              {
                unsigned int v419 = 1;
                float v63 = 0.0;
              }
              else
              {
                unsigned int v419 = 0;
                if (objc_msgSend_isEqualToString_(v62, v59, @"keepSeparate", v61)) {
                  float v63 = 0.0;
                }
                else {
                  float v63 = INFINITY;
                }
              }
            }
            else
            {
              unsigned int v419 = 0;
              float v63 = INFINITY;
            }
            v452 = 0;
            memptr = 0;
            v451 = 0;
            v64 = objc_msgSend_translations(v432, v59, v60, v61);
            v429 = objc_msgSend_keyTimes(v64, v65, v66, v67);
            v71 = objc_msgSend_rotations(v432, v68, v69, v70);
            v431 = objc_msgSend_keyTimes(v71, v72, v73, v74);
            v78 = objc_msgSend_scales(v432, v75, v76, v77);
            v430 = objc_msgSend_keyTimes(v78, v79, v80, v81);
            uint64_t v85 = v431 != 0;
            if (v429) {
              ++v85;
            }
            if (v430) {
              uint64_t v86 = v85 + 1;
            }
            else {
              uint64_t v86 = v85;
            }
            int v87 = objc_msgSend_count(v429, v82, v83, v84);
            int v91 = objc_msgSend_count(v431, v88, v89, v90);
            int v98 = objc_msgSend_count(v430, v92, v93, v94);
            int v99 = v87 * v426;
            if (v429) {
              malloc_type_posix_memalign(&memptr, 0x10uLL, 16 * v99, 0x1000040451B5BE8uLL);
            }
            int v100 = v91 * v426;
            if (v431) {
              malloc_type_posix_memalign(&v452, 0x10uLL, 16 * v100, 0x1000040451B5BE8uLL);
            }
            int v101 = v98 * v426;
            if (v430) {
              malloc_type_posix_memalign(&v451, 0x10uLL, 16 * v101, 0x1000040451B5BE8uLL);
            }
            if (memptr)
            {
              v102 = objc_msgSend_translations(v432, v95, v96, v97);
              objc_msgSend_getFloat3Array_maxCount_(v102, v103, (uint64_t)memptr, v99);
            }
            if (v452)
            {
              v104 = objc_msgSend_rotations(v432, v95, v96, v97);
              objc_msgSend_getFloatQuaternionArray_maxCount_(v104, v105, (uint64_t)v452, v100);
            }
            if (v451)
            {
              v106 = objc_msgSend_scales(v432, v95, v96, v97);
              objc_msgSend_getFloat3Array_maxCount_(v106, v107, (uint64_t)v451, v101);
            }
            v108 = objc_msgSend_translations(v432, v95, v96, v97);
            objc_msgSend_maximumTime(v108, v109, v110, v111);
            double v113 = v112;
            v117 = objc_msgSend_translations(v432, v114, v115, v116);
            objc_msgSend_minimumTime(v117, v118, v119, v120);
            double v122 = v121;
            v126 = objc_msgSend_rotations(v432, v123, v124, v125);
            objc_msgSend_maximumTime(v126, v127, v128, v129);
            double v131 = v130;
            v135 = objc_msgSend_rotations(v432, v132, v133, v134);
            objc_msgSend_minimumTime(v135, v136, v137, v138);
            double v140 = v139;
            v144 = objc_msgSend_scales(v432, v141, v142, v143);
            objc_msgSend_maximumTime(v144, v145, v146, v147);
            double v149 = v148;
            v153 = objc_msgSend_scales(v432, v150, v151, v152);
            objc_msgSend_minimumTime(v153, v154, v155, v156);
            double v158 = v157;
            v159 = (void *)MEMORY[0x1E4F1CA48];
            v163 = objc_msgSend_jointPaths(v432, v160, v161, v162);
            uint64_t v167 = objc_msgSend_count(v163, v164, v165, v166);
            v428 = objc_msgSend_arrayWithCapacity_(v159, v168, v167 * v86, v169);
            long long v449 = 0u;
            long long v450 = 0u;
            long long v447 = 0u;
            long long v448 = 0u;
            v173 = objc_msgSend_jointPaths(v432, v170, v171, v172);
            uint64_t v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v174, (uint64_t)&v447, (uint64_t)v457, 16);
            double v177 = v113 - v122;
            double v178 = v131 - v140;
            if (v175)
            {
              LODWORD(v179) = 0;
              id v423 = v173;
              uint64_t v424 = *(void *)v448;
              do
              {
                uint64_t v180 = 0;
                uint64_t v179 = (int)v179;
                uint64_t v181 = 16 * (int)v179;
                uint64_t v425 = v175;
                do
                {
                  if (*(void *)v448 != v424) {
                    objc_enumerationMutation(v423);
                  }
                  v182 = *(void **)(*((void *)&v447 + 1) + 8 * v180);
                  if (v429)
                  {
                    v183 = NSString;
                    uint64_t v186 = objc_msgSend_rangeOfString_options_(*(void **)(*((void *)&v447 + 1) + 8 * v180), v176, @"/", 4);
                    uint64_t v187 = (uint64_t)v182;
                    if (v186 != 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v187 = objc_msgSend_substringFromIndex_(v182, v184, v186 + 1, v185);
                    }
                    uint64_t v188 = objc_msgSend_stringWithFormat_(v183, v184, @"/%@.position", v185, v187);
                    v191 = objc_msgSend_animationWithKeyPath_(MEMORY[0x1E4F39BD8], v189, v188, v190);
                    objc_msgSend_setDuration_(v191, v192, v193, v194, v177);
                    v198 = objc_msgSend_translations(v432, v195, v196, v197);
                    objc_msgSend_minimumTime(v198, v199, v200, v201);
                    double v203 = v202;
                    v207 = objc_msgSend_translations(v432, v204, v205, v206);
                    objc_msgSend_minimumTime(v207, v208, v209, v210);
                    objc_msgSend_setBeginTime_(v191, v212, v213, v214, v203 - v211);
                    v218 = objc_msgSend_translations(v432, v215, v216, v217);
                    objc_msgSend_minimumTime(v218, v219, v220, v221);
                    v226 = sub_1B6470024(v429, v222, v223, v224, v225, v177);
                    objc_msgSend_setKeyTimes_(v191, v227, (uint64_t)v226, v228);
                    v229 = memptr;
                    v233 = (const char *)objc_msgSend_count(v429, v230, v231, v232);
                    v234 = sub_1B6470194((uint64_t)v229, v233, v426, v179);
                    objc_msgSend_setValues_(v191, v235, (uint64_t)v234, v236);
                    objc_msgSend_setFillMode_(v191, v237, v427, v238);
                    objc_msgSend_setRemovedOnCompletion_(v191, v239, 0, v240);
                    objc_msgSend_addObject_(v428, v241, (uint64_t)v191, v242);
                  }
                  if (v431)
                  {
                    v243 = (void *)MEMORY[0x1E4F39BD8];
                    v244 = NSString;
                    uint64_t v247 = objc_msgSend_rangeOfString_options_(v182, v176, @"/", 4);
                    uint64_t v248 = (uint64_t)v182;
                    if (v247 != 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v248 = objc_msgSend_substringFromIndex_(v182, v245, v247 + 1, v246);
                    }
                    uint64_t v249 = objc_msgSend_stringWithFormat_(v244, v245, @"/%@.orientation", v246, v248);
                    v252 = objc_msgSend_animationWithKeyPath_(v243, v250, v249, v251);
                    objc_msgSend_setDuration_(v252, v253, v254, v255, v178);
                    v259 = objc_msgSend_rotations(v432, v256, v257, v258);
                    objc_msgSend_minimumTime(v259, v260, v261, v262);
                    double v264 = v263;
                    v268 = objc_msgSend_rotations(v432, v265, v266, v267);
                    objc_msgSend_minimumTime(v268, v269, v270, v271);
                    objc_msgSend_setBeginTime_(v252, v273, v274, v275, v264 - v272);
                    v279 = objc_msgSend_rotations(v432, v276, v277, v278);
                    objc_msgSend_minimumTime(v279, v280, v281, v282);
                    v287 = sub_1B6470024(v431, v283, v284, v285, v286, v178);
                    objc_msgSend_setKeyTimes_(v252, v288, (uint64_t)v287, v289);
                    v290 = (char *)v452;
                    int v294 = objc_msgSend_count(v431, v291, v292, v293);
                    v300 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v295, v294, v296);
                    if (v294 >= 1)
                    {
                      v301 = (double *)&v290[v181];
                      do
                      {
                        uint64_t v302 = objc_msgSend_valueWithVFXFloat4_(MEMORY[0x1E4F29238], v297, v298, v299, *v301);
                        objc_msgSend_addObject_(v300, v303, v302, v304);
                        v301 += 2 * v426;
                        --v294;
                      }
                      while (v294);
                    }
                    objc_msgSend_setValues_(v252, v297, (uint64_t)v300, v299);
                    objc_msgSend_setFillMode_(v252, v305, v427, v306);
                    objc_msgSend_setRemovedOnCompletion_(v252, v307, 0, v308);
                    objc_msgSend_addObject_(v428, v309, (uint64_t)v252, v310);
                  }
                  if (v430)
                  {
                    v311 = (void *)MEMORY[0x1E4F39BD8];
                    v312 = NSString;
                    uint64_t v313 = objc_msgSend_rangeOfString_options_(v182, v176, @"/", 4);
                    if (v313 != 0x7FFFFFFFFFFFFFFFLL) {
                      v182 = objc_msgSend_substringFromIndex_(v182, v314, v313 + 1, v315);
                    }
                    uint64_t v316 = objc_msgSend_stringWithFormat_(v312, v314, @"/%@.scale", v315, v182);
                    v319 = objc_msgSend_animationWithKeyPath_(v311, v317, v316, v318);
                    objc_msgSend_setDuration_(v319, v320, v321, v322, v149 - v158);
                    v326 = objc_msgSend_scales(v432, v323, v324, v325);
                    objc_msgSend_minimumTime(v326, v327, v328, v329);
                    double v331 = v330;
                    v335 = objc_msgSend_scales(v432, v332, v333, v334);
                    objc_msgSend_minimumTime(v335, v336, v337, v338);
                    objc_msgSend_setBeginTime_(v319, v340, v341, v342, v331 - v339);
                    v346 = objc_msgSend_scales(v432, v343, v344, v345);
                    objc_msgSend_minimumTime(v346, v347, v348, v349);
                    v354 = sub_1B6470024(v430, v350, v351, v352, v353, v149 - v158);
                    objc_msgSend_setKeyTimes_(v319, v355, (uint64_t)v354, v356);
                    v357 = v451;
                    v361 = (const char *)objc_msgSend_count(v430, v358, v359, v360);
                    v362 = sub_1B6470194((uint64_t)v357, v361, v426, v179);
                    objc_msgSend_setValues_(v319, v363, (uint64_t)v362, v364);
                    objc_msgSend_setFillMode_(v319, v365, v427, v366);
                    objc_msgSend_setRemovedOnCompletion_(v319, v367, 0, v368);
                    objc_msgSend_addObject_(v428, v369, (uint64_t)v319, v370);
                  }
                  ++v179;
                  ++v180;
                  v181 += 16;
                }
                while (v180 != v425);
                uint64_t v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(v423, v176, (uint64_t)&v447, (uint64_t)v457, 16);
              }
              while (v175);
            }
            free(memptr);
            free(v452);
            free(v451);
            a3 = v417;
            self = v418;
            v26 = v421;
            v42 = v416;
            v374 = objc_msgSend_animation(MEMORY[0x1E4F39B38], v371, v372, v373);
            objc_msgSend_setAnimations_(v374, v375, (uint64_t)v428, v376);
            objc_msgSend_setFillMode_(v374, v377, v427, v378);
            *(float *)&double v379 = v63;
            objc_msgSend_setRepeatCount_(v374, v380, v381, v382, v379);
            objc_msgSend_setRemovedOnCompletion_(v374, v383, v419, v384);
            if (v177 >= v178) {
              double v388 = v177;
            }
            else {
              double v388 = v178;
            }
            if (v388 < v149 - v158) {
              double v388 = v149 - v158;
            }
            objc_msgSend_setDuration_(v374, v385, v386, v387, v388);
            if (v374)
            {
              uint64_t v389 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v39, (uint64_t)v374, v41);
              uint64_t v393 = objc_msgSend_name(v432, v390, v391, v392);
              objc_msgSend_setObject_forKeyedSubscript_(v416, v394, v389, v393);
            }
          }
        }
      }
      ++v43;
    }
  }
  else
  {
    v42 = 0;
  }
  long long v435 = 0u;
  long long v436 = 0u;
  long long v433 = 0u;
  long long v434 = 0u;
  uint64_t v395 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v38, (uint64_t)&v433, (uint64_t)v454, 16);
  if (v395)
  {
    uint64_t v396 = *(void *)v434;
    do
    {
      for (uint64_t k = 0; k != v395; ++k)
      {
        if (*(void *)v434 != v396) {
          objc_enumerationMutation(a3);
        }
        sub_1B6466C1C(*(void **)(*((void *)&v433 + 1) + 8 * k), v26, (uint64_t)a3, v42, &v445);
      }
      uint64_t v395 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v398, (uint64_t)&v433, (uint64_t)v454, 16);
    }
    while (v395);
  }
  v399 = v445;
  if (v445 != (uint64_t *)v446)
  {
    do
    {
      v400 = (void *)v399[5];
      if (v400) {

      }
      v401 = (uint64_t *)v399[1];
      if (v401)
      {
        do
        {
          v402 = v401;
          v401 = (uint64_t *)*v401;
        }
        while (v401);
      }
      else
      {
        do
        {
          v402 = (uint64_t *)v399[2];
          BOOL v403 = *v402 == (void)v399;
          v399 = v402;
        }
        while (!v403);
      }
      v399 = v402;
    }
    while (v402 != (uint64_t *)v446);
  }
  if (v42) {

  }
  objc_msgSend_startTime(a3, v404, v405, v406);
  objc_msgSend_setStartTime_(self, v407, v408, v409);
  objc_msgSend_endTime(a3, v410, v411, v412);
  objc_msgSend_setEndTime_(self, v413, v414, v415);
  sub_1B647093C(v446[0]);
}

+ (VFXWorld)worldWithMDLAsset:(id)a3 options:(id)a4
{
  v6 = (VFXWorld *)objc_alloc_init((Class)a1);
  uint64_t v10 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
  objc_msgSend_loadMDLAsset_options_context_(v6, v11, (uint64_t)a3, (uint64_t)a4, v10);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v318[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_lock(self, a2, (uint64_t)a3, v3);
  BOOL v11 = sub_1B64B2718((uint64_t)self->_world, 2, v5, v6, v7, v8, v9, v10);
  id v12 = objc_alloc((Class)objc_opt_class());
  v317 = @"kWorldInitOptionForAuthoring";
  v318[0] = objc_msgSend_numberWithBool_(NSNumber, v13, v11, v14);
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v318, (uint64_t)&v317, 1);
  v19 = objc_msgSend_initWithOptions_(v12, v17, v16, v18);
  objc_msgSend_lock(v19, v20, v21, v22);
  uint64_t v26 = objc_msgSend_assetPathResolver(self, v23, v24, v25);
  objc_msgSend_setAssetPathResolver_(v19, v27, v26, v28);
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  uint64_t v30 = objc_alloc_init(VFXBidirectionalRemapTable);
  v34 = objc_msgSend_assetRegistry(self, v31, v32, v33);
  v38 = objc_msgSend_rootNode(v34, v35, v36, v37);
  v42 = objc_msgSend_childNodes(v38, v39, v40, v41);
  uint64_t v46 = objc_msgSend_assetRegistry(v19, v43, v44, v45);
  v50 = (char *)objc_msgSend_rootNode(v46, v47, v48, v49);
  long long v310 = 0u;
  long long v311 = 0u;
  long long v312 = 0u;
  long long v313 = 0u;
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v51, (uint64_t)&v310, (uint64_t)v316, 16);
  if (v52)
  {
    uint64_t v56 = v52;
    uint64_t v57 = *(void *)v311;
    do
    {
      uint64_t v58 = 0;
      do
      {
        if (*(void *)v311 != v57) {
          objc_enumerationMutation(v42);
        }
        sub_1B64D9EA8(*(void **)(*((void *)&v310 + 1) + 8 * v58++), v50, Mutable, v30);
      }
      while (v56 != v58);
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v59, (uint64_t)&v310, (uint64_t)v316, 16);
    }
    while (v56);
  }
  uint64_t v60 = objc_msgSend_rootNode(self, v53, v54, v55);
  uint64_t v63 = objc_msgSend__deepCloneWithRemapTableOut_(v60, v61, (uint64_t)Mutable, v62);
  objc_msgSend_setRootNode_(v19, v64, v63, v65);
  uint64_t v69 = objc_msgSend_physicsWorld(self, v66, v67, v68);
  uint64_t v73 = objc_msgSend_physicsJoints(v69, v70, v71, v72);
  long long v306 = 0u;
  long long v307 = 0u;
  long long v308 = 0u;
  long long v309 = 0u;
  uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v306, (uint64_t)v315, 16);
  if (v75)
  {
    uint64_t v79 = v75;
    uint64_t v80 = *(void *)v307;
    do
    {
      uint64_t v81 = 0;
      do
      {
        if (*(void *)v307 != v80) {
          objc_enumerationMutation(v73);
        }
        v82 = objc_msgSend_copy(*(void **)(*((void *)&v306 + 1) + 8 * v81), v76, v77, v78);
        objc_msgSend_retargetWithRemapTable_(v82, v83, (uint64_t)Mutable, v84);
        v88 = objc_msgSend_physicsWorld(v19, v85, v86, v87);
        objc_msgSend_addPhysicsJoint_(v88, v89, (uint64_t)v82, v90);

        ++v81;
      }
      while (v79 != v81);
      uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v76, (uint64_t)&v306, (uint64_t)v315, 16);
    }
    while (v79);
  }
  int v91 = objc_msgSend_background(v19, v76, v77, v78);
  uint64_t v95 = objc_msgSend_background(self, v92, v93, v94);
  objc_msgSend_copyPropertiesFrom_(v91, v96, v95, v97);
  int v101 = objc_msgSend_lightingEnvironment(v19, v98, v99, v100);
  uint64_t v105 = objc_msgSend_lightingEnvironment(self, v102, v103, v104);
  objc_msgSend_copyPropertiesFrom_(v101, v106, v105, v107);
  uint64_t v111 = objc_msgSend_rootNode(v19, v108, v109, v110);
  v305[0] = MEMORY[0x1E4F143A8];
  v305[1] = 3221225472;
  v305[2] = sub_1B64DA04C;
  v305[3] = &unk_1E6142FB8;
  v305[4] = Mutable;
  objc_msgSend_enumerateHierarchyUsingBlock_(v111, v112, (uint64_t)v305, v113);
  CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)sub_1B64DA230, v30);
  v117 = objc_msgSend_scene(v19, v114, v115, v116);
  objc_msgSend_remapEntityReferences_(v117, v118, (uint64_t)v30, v119);
  v123 = objc_msgSend_background(v19, v120, v121, v122);
  v127 = (const void *)objc_msgSend_contents(v123, v124, v125, v126);
  Value = CFDictionaryGetValue(Mutable, v127);
  if (Value)
  {
    uint64_t v132 = (uint64_t)Value;
    uint64_t v133 = objc_msgSend_background(v19, v129, v130, v131);
    objc_msgSend_setContents_(v133, v134, v132, v135);
  }
  v136 = objc_msgSend_lightingEnvironment(v19, v129, v130, v131);
  double v140 = (const void *)objc_msgSend_contents(v136, v137, v138, v139);
  v141 = CFDictionaryGetValue(Mutable, v140);
  if (v141)
  {
    uint64_t v145 = (uint64_t)v141;
    uint64_t v146 = objc_msgSend_lightingEnvironment(v19, v142, v143, v144);
    objc_msgSend_setContents_(v146, v147, v145, v148);
  }
  double v149 = objc_msgSend_physicsWorld(self, v142, v143, v144);
  objc_msgSend_gravity(v149, v150, v151, v152);
  double v300 = v153;
  double v157 = objc_msgSend_physicsWorld(v19, v154, v155, v156);
  objc_msgSend_setGravity_(v157, v158, v159, v160, v300);
  v164 = objc_msgSend_physicsWorld(self, v161, v162, v163);
  objc_msgSend_speed(v164, v165, v166, v167);
  int v169 = v168;
  v173 = objc_msgSend_physicsWorld(v19, v170, v171, v172);
  LODWORD(v174) = v169;
  objc_msgSend_setSpeed_(v173, v175, v176, v177, v174);
  uint64_t v181 = objc_msgSend_physicsWorld(self, v178, v179, v180);
  objc_msgSend_timeStep(v181, v182, v183, v184);
  double v186 = v185;
  uint64_t v190 = objc_msgSend_physicsWorld(v19, v187, v188, v189);
  objc_msgSend_setTimeStep_(v190, v191, v192, v193, v186);
  objc_msgSend_endTime(self, v194, v195, v196);
  objc_msgSend_setEndTime_(v19, v197, v198, v199);
  objc_msgSend_startTime(self, v200, v201, v202);
  objc_msgSend_setStartTime_(v19, v203, v204, v205);
  objc_msgSend_fogStartDistance(self, v206, v207, v208);
  objc_msgSend_setFogStartDistance_(v19, v209, v210, v211);
  objc_msgSend_fogEndDistance(self, v212, v213, v214);
  objc_msgSend_setFogEndDistance_(v19, v215, v216, v217);
  objc_msgSend_fogDensityExponent(self, v218, v219, v220);
  objc_msgSend_setFogDensityExponent_(v19, v221, v222, v223);
  uint64_t v227 = objc_msgSend_fogColor(self, v224, v225, v226);
  objc_msgSend_setFogColor_(v19, v228, v227, v229);
  uint64_t v233 = objc_msgSend_wantsScreenSpaceReflection(self, v230, v231, v232);
  objc_msgSend_setWantsScreenSpaceReflection_(v19, v234, v233, v235);
  uint64_t v239 = objc_msgSend_screenSpaceReflectionSampleCount(self, v236, v237, v238);
  objc_msgSend_setScreenSpaceReflectionSampleCount_(v19, v240, v239, v241);
  objc_msgSend_screenSpaceReflectionMaximumDistance(self, v242, v243, v244);
  objc_msgSend_setScreenSpaceReflectionMaximumDistance_(v19, v245, v246, v247);
  objc_msgSend_screenSpaceReflectionStride(self, v248, v249, v250);
  objc_msgSend_setScreenSpaceReflectionStride_(v19, v251, v252, v253);
  long long v303 = 0u;
  long long v304 = 0u;
  long long v301 = 0u;
  long long v302 = 0u;
  uint64_t v257 = objc_msgSend_stateManager(self, v254, v255, v256);
  uint64_t v261 = objc_msgSend_states(v257, v258, v259, v260);
  uint64_t v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v262, (uint64_t)&v301, (uint64_t)v314, 16);
  if (v263)
  {
    uint64_t v267 = v263;
    uint64_t v268 = *(void *)v302;
    do
    {
      uint64_t v269 = 0;
      do
      {
        if (*(void *)v302 != v268) {
          objc_enumerationMutation(v261);
        }
        uint64_t v270 = *(void *)(*((void *)&v301 + 1) + 8 * v269);
        uint64_t v271 = objc_msgSend_stateManager(v19, v264, v265, v266);
        objc_msgSend_addState_(v271, v272, v270, v273);
        ++v269;
      }
      while (v267 != v269);
      uint64_t v267 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v264, (uint64_t)&v301, (uint64_t)v314, 16);
    }
    while (v267);
  }
  uint64_t v274 = objc_msgSend_defaultRenderGraph(self, v264, v265, v266);
  objc_msgSend_setDefaultRenderGraph_(v19, v275, v274, v276);
  uint64_t v280 = objc_msgSend_behaviorGraph(self, v277, v278, v279);
  objc_msgSend_setBehaviorGraph_(v19, v281, v280, v282);
  objc_msgSend_unlock(v19, v283, v284, v285);
  objc_msgSend_unlock(self, v286, v287, v288);
  objc_msgSend_flush(VFXTransaction, v289, v290, v291);
  v295 = objc_msgSend_presentationScene(v19, v292, v293, v294);
  objc_msgSend_prepare(v295, v296, v297, v298);
  CFRelease(Mutable);

  return v19;
}

- (void)setBehaviorGraph:(id)a3
{
  id v6 = (id)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    objc_msgSend_willBeRemovedFromWorld_(v6, v7, (uint64_t)self, v8);

    self->_behaviorGraph = (VFXBehaviorGraph *)a3;
    objc_msgSend_wasAddedToWorld_(a3, v9, (uint64_t)self, v10);
    uint64_t v14 = objc_msgSend_worldRef(self, v11, v12, v13);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1B64DA394;
    v16[3] = &unk_1E6141230;
    v16[4] = self;
    v16[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
}

- (VFXBehaviorGraph)behaviorGraph
{
  return self->_behaviorGraph;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v5 = objc_msgSend___CFObject(self, a2, (uint64_t)a3, v3);

  sub_1B65835F8(v5, a3, v6, v7, v8, v9, v10, v11);
}

- (id)identifier
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return sub_1B6583590(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)stopReplication
{
  if (!sub_1B64B2718((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled", v10, v11, v12, v13, v14, v15, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  }
  uint64_t v16 = objc_msgSend_scene(self, v9, v10, v11);
  uint64_t v20 = objc_msgSend_presentationScene(self, v17, v18, v19);
  objc_msgSend_stopReplicationWithModel_runtime_(_TtC3VFX8VFXScene, v21, v16, v20);
  uint64_t v25 = objc_msgSend_worldRef(self, v22, v23, v24);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1B64DA53C;
  v27[3] = &unk_1E61411E0;
  v27[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v26, v25, (uint64_t)self, v27);

  self->_modelToPresentationRemapTable = 0;
}

- (void)cloneModelToPresentationAndStartReplicationStream
{
  if (!sub_1B64B2718((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled", v9, v10, v11, v12, v13, v14, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  }
  prof_beginFlame((uint64_t)"-[VFXWorld cloneModelToPresentationAndStartReplicationStream]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/VFX/sources/vfx/ObjC/VFXWorld.m", 332);
  uint64_t v18 = objc_msgSend_worldRef(self, v15, v16, v17);
  if (v18)
  {
    uint64_t v26 = v18;
    sub_1B64B0C28(v18, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
    self->_modelToPresentationRemapTable = (VFXBidirectionalRemapTable *)(id)objc_msgSend_cloneAndSetupReplicationWithModelWorld_(_TtC3VFX8VFXScene, v27, (uint64_t)self, v28);
    uint64_t v32 = objc_msgSend_worldRef(self, v29, v30, v31);
    sub_1B64B3988(v32, self->_modelToPresentationRemapTable, v33, v34, v35, v36, v37, v38);
    sub_1B64B0CB4(v26, v39, v40, v41, v42, v43, v44, v45);
  }
  else
  {
    self->_modelToPresentationRemapTable = (VFXBidirectionalRemapTable *)(id)objc_msgSend_cloneAndSetupReplicationWithModelWorld_(_TtC3VFX8VFXScene, v19, (uint64_t)self, v21);
    uint64_t v49 = objc_msgSend_worldRef(self, v46, v47, v48);
    sub_1B64B3988(v49, self->_modelToPresentationRemapTable, v50, v51, v52, v53, v54, v55);
  }

  prof_endFlame();
}

- (void)startRuntimeThread
{
  uint64_t v4 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v12 = (void *)sub_1B64B2054(v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend_startRuntimeThread(v12, v13, v14, v15);
}

- (id)remapTable
{
  if (!sub_1B64B2718((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled", v9, v10, v11, v12, v13, v14, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  }
  return self->_modelToPresentationRemapTable;
}

- (VFXWorld)initWithOptions:(id)a3
{
  v81.receiver = self;
  v81.super_class = (Class)VFXWorld;
  id v6 = [(VFXWorld *)&v81 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(a3, v4, @"VFXWorldLoaderDisableVFXCoreSupport", v5);
    if (v7)
    {
      char v11 = objc_msgSend_BOOLValue(v7, v8, v9, v10);
      char v12 = v11 ^ 1;
    }
    else
    {
      char v11 = 0;
      char v12 = 1;
    }
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(a3, v8, @"kWorldInitOptionForAuthoring", v10);
    if (objc_msgSend_BOOLValue(v13, v14, v15, v16)) {
      v12 |= 2u;
    }
    uint64_t v19 = (const void *)objc_msgSend_objectForKeyedSubscript_(a3, v17, @"VFXWorldLoaderOptionMetalLibraryURL", v18);
    *((void *)v6 + 1) = sub_1B64B1BF4(v12, v19);
    uint64_t v20 = objc_alloc_init(VFXClock);
    *((void *)v6 + 22) = v20;
    objc_msgSend_setWorld_(v20, v21, *((void *)v6 + 1), v22);
    uint64_t v30 = *((void *)v6 + 1);
    if (v11)
    {
      if (v30) {
        sub_1B6583684(v30, v6, v24, v25, v26, v27, v28, v29);
      }
      objc_msgSend__syncObjCModel(v6, v23, v24, v25);
    }
    else
    {
      *((void *)v6 + 26) = sub_1B65117D0(v30, (uint64_t)v23, v24, v25, v26, v27, v28, v29);
      uint64_t v38 = *((void *)v6 + 1);
      if (v38) {
        sub_1B6583684(v38, v6, v32, v33, v34, v35, v36, v37);
      }
      objc_msgSend__syncObjCModel(v6, v31, v32, v33);
      objc_msgSend_cloneModelToPresentationAndStartReplicationStream(v6, v39, v40, v41);
    }
    uint64_t v42 = objc_alloc_init(VFXTriggerManager);
    *((void *)v6 + 30) = v42;
    objc_msgSend_setWorld_(v42, v43, (uint64_t)v6, v44);
    if (!*((void *)v6 + 8))
    {
      uint64_t v48 = objc_msgSend_worldRef(v6, v45, v46, v47);
      uint64_t v56 = v48;
      if (v48) {
        sub_1B64B0C28(v48, v49, v50, v51, v52, v53, v54, v55);
      }
      if (!*((void *)v6 + 8))
      {
        uint64_t v57 = *((void *)v6 + 1);
        if (v57)
        {
          sub_1B64B0C28(v57, v49, v50, v51, v52, v53, v54, v55);
          uint64_t v66 = sub_1B64B1FBC(*((void *)v6 + 1), v58, v59, v60, v61, v62, v63, v64);
          if (v66)
          {
            id v68 = (id)objc_msgSend_nodeWithNodeRef_(VFXNode, v65, v66, v67);
            *((void *)v6 + 8) = v68;
            objc_msgSend_setWorld_(v68, v69, (uint64_t)v6, v70);
          }
          else
          {
            uint64_t v78 = objc_msgSend_node(VFXNode, v65, 0, v67);
            objc_msgSend__setRootNode_immediate_(v6, v79, v78, 1);
          }
          sub_1B64B0CB4(*((void *)v6 + 1), v71, v72, v73, v74, v75, v76, v77);
        }
      }
      if (v56) {
        sub_1B64B0CB4(v56, v49, v50, v51, v52, v53, v54, v55);
      }
    }
  }
  return (VFXWorld *)v6;
}

- (VFXWorld)init
{
  return (VFXWorld *)objc_msgSend_initWithOptions_(self, a2, 0, v2);
}

- (VFXWorld)initWithWorldRef:(__CFXWorld *)a3
{
  v44.receiver = self;
  v44.super_class = (Class)VFXWorld;
  id v4 = [(VFXWorld *)&v44 init];
  if (v4)
  {
    CFTypeRef v5 = CFRetain(a3);
    *((void *)v4 + 1) = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    if (!*((void *)v4 + 8))
    {
      uint64_t v20 = *((void *)v4 + 1);
      if (v20)
      {
        sub_1B64B0C28(v20, v13, v14, v15, v16, v17, v18, v19);
        uint64_t v29 = sub_1B64B1FBC(*((void *)v4 + 1), v21, v22, v23, v24, v25, v26, v27);
        if (v29)
        {
          id v31 = (id)objc_msgSend_nodeWithNodeRef_(VFXNode, v28, v29, v30);
          *((void *)v4 + 8) = v31;
          objc_msgSend_setWorld_(v31, v32, (uint64_t)v4, v33);
        }
        else
        {
          uint64_t v41 = objc_msgSend_node(VFXNode, v28, 0, v30);
          objc_msgSend__setRootNode_immediate_(v4, v42, v41, 1);
        }
        sub_1B64B0CB4(*((void *)v4 + 1), v34, v35, v36, v37, v38, v39, v40);
      }
    }
  }
  return (VFXWorld *)v4;
}

- (void)_syncObjCModel
{
  if (sub_1B64B2718((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7))
  {
    uint64_t v16 = (void *)sub_1B6355ECC((uint64_t)self->_coreEntityManager);
    self->_assetPathResolver = (VFXAssetPathResolver *)(id)objc_msgSend_assetManager(v16, v17, v18, v19);
  }
  self->_fogStartDistance = sub_1B64B2B74((uint64_t)self->_world, v9, v10, v11, v12, v13, v14, v15);
  self->_fogEndDistance = sub_1B64B2AD0((uint64_t)self->_world, v20, v21, v22, v23, v24, v25, v26);
  self->_fogDensityExponent = sub_1B64B2A2C((uint64_t)self->_world, v27, v28, v29, v30, v31, v32, v33);
  self->_wantsScreenSpaceReflection = sub_1B64B2D5C((uint64_t)self->_world, v34, v35, v36, v37, v38, v39, v40);
  self->_screenSpaceReflectionSampleCount = sub_1B64B2E3C((uint64_t)self->_world, v41, v42, v43, v44, v45, v46, v47);
  self->_screenSpaceReflectionMaxRayDistance = sub_1B64B2ED8((uint64_t)self->_world, v48, v49, v50, v51, v52, v53, v54);
  self->_screenSpaceReflectionStride = sub_1B64B2F7C((uint64_t)self->_world, v55, v56, v57, v58, v59, v60, v61);
  uint64_t v69 = sub_1B64B2C6C((uint64_t)self->_world, v62, v63, v64, v65, v66, v67, v68);

  self->_fogColor = (id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E4FB1618], v70, v69, v71);
}

+ (id)world
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)worldNamed:(id)a3
{
  return (id)MEMORY[0x1F4181798](a1, sel_worldNamed_inDirectory_options_, a3, 0);
}

+ (id)worldNamed:(id)a3 inDirectory:(id)a4 options:(id)a5
{
  uint64_t v9 = (__CFString *)objc_msgSend_pathExtension(a3, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12);
  if (!v13) {
    uint64_t v9 = @"vfx";
  }
  uint64_t v17 = (void *)VFXGetResourceBundle(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_stringByDeletingPathExtension(a3, v18, v19, v20);
  id result = (id)objc_msgSend_URLForResource_withExtension_subdirectory_(v17, v22, v21, (uint64_t)v9, a4);
  if (result)
  {
    return (id)objc_msgSend_worldWithURL_options_error_(a1, v24, (uint64_t)result, (uint64_t)a5, 0);
  }
  return result;
}

+ (id)worldNamed:(id)a3 options:(id)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel_worldNamed_inDirectory_options_, a3, 0);
}

- (BOOL)load:(id)a3 options:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_URLByResolvingSymlinksInPath(a3, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v18 = @"url";
  v19[0] = v8;
  uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v19, (uint64_t)&v18, 1);
  objc_msgSend_setValue_forKey_(VFXTransaction, v11, v10, @"VFXWorldLoadingContextKey");
  uint64_t v15 = objc_msgSend_loader(VFXWorldLoader, v12, v13, v14);
  return objc_msgSend_loadURL_into_options_statusHandler_error_(v15, v16, v8, (uint64_t)self, a4, 0, a5);
}

- (BOOL)reloadFromURL:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  if (self->_remotePreviewDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_reloadWorld_withUpdatedWorldAtURL_(self->_remotePreviewDelegate, a2, (uint64_t)self, (uint64_t)a3);
    return 1;
  }
  else
  {
    uint64_t v8 = objc_msgSend_rootNode(self, a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_removeAllChilds(v8, v9, v10, v11);
    uint64_t v15 = objc_msgSend_loader(VFXWorldLoader, v12, v13, v14);
    return objc_msgSend_loadURL_into_options_statusHandler_error_(v15, v16, (uint64_t)a3, (uint64_t)self, 0, 0, a4);
  }
}

+ (VFXWorld)worldWithURL:(id)a3 options:(id)a4 transferringConfigurationFrom:(id)a5 error:(id *)a6
{
  uint64_t v7 = (VFXWorld *)objc_msgSend_worldWithURL_options_error_(VFXWorld, a2, (uint64_t)a3, (uint64_t)a4, a6);
  uint64_t v11 = objc_msgSend_remoteEditionEndpoint(a5, v8, v9, v10);
  objc_msgSend_setRemoteEditionEndpoint_(v7, v12, v11, v13);
  uint64_t v17 = objc_msgSend_allowRemoteEdition(a5, v14, v15, v16);
  objc_msgSend_setAllowRemoteEdition_(v7, v18, v17, v19);
  return v7;
}

+ (VFXWorld)worldWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v8 = [VFXWorld alloc];
  uint64_t v11 = (VFXWorld *)(id)objc_msgSend_initWithOptions_(v8, v9, (uint64_t)a4, v10);
  uint64_t v13 = v11;
  if (a3 && !objc_msgSend_load_options_error_(v11, v12, (uint64_t)a3, (uint64_t)a4, a5)) {
    return 0;
  }
  return v13;
}

+ (VFXWorld)worldWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v8 = [VFXWorld alloc];
  uint64_t v11 = (VFXWorld *)(id)objc_msgSend_initWithOptions_(v8, v9, (uint64_t)a4, v10);
  uint64_t v15 = objc_msgSend_loader(VFXWorldLoader, v12, v13, v14);
  objc_msgSend_loadData_into_options_statusHandler_error_(v15, v16, (uint64_t)a3, (uint64_t)v11, a4, 0, a5);
  return v11;
}

+ (VFXWorld)worldWithWorldRef:(__CFXWorld *)a3
{
  id result = (VFXWorld *)sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithWorldRef_(v6, v7, (uint64_t)a3, v8);
    return (VFXWorld *)v9;
  }
  return result;
}

- (void)_clearWorldRef
{
  world = self->_world;
  if (world)
  {
    sub_1B6583684((uint64_t)world, 0, v2, v3, v4, v5, v6, v7);
    uint64_t v10 = self->_world;
    if (v10) {
      CFRelease(v10);
    }
    self->_world = 0;
  }
}

- (double)upAxis
{
  return 0.0078125;
}

- (void)setUpAxis:(VFXWorld *)self
{
}

- (void)dealloc
{
  objc_msgSend_setWorld_(self->_rootNode, a2, 0, v2);
  objc_msgSend_worldWillDie(self->_physicsWorld, v4, v5, v6);
  world = self->_world;
  if (world)
  {
    sub_1B6583684((uint64_t)world, 0, v8, v9, v10, v11, v12, v13);
    uint64_t v15 = self->_world;
    uint64_t v23 = (void *)sub_1B64B2054((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
    objc_msgSend_stopRuntimeThread(v23, v24, v25, v26);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_1B64DB098;
    v41[3] = &unk_1E6140A18;
    v41[4] = v15;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v27, 0, 0, v41);
  }
  objc_msgSend_setWorld_(self->_assetRegistry, v7, 0, v9);

  self->_assetRegistry = 0;
  for (uint64_t i = 72; i != 104; i += 8)
  {
    objc_msgSend_setWorld_(*(void **)((char *)&self->super.isa + i), v28, 0, v29);
  }
  objc_msgSend_parentWillDie_(self->_background, v31, (uint64_t)self, v32);

  objc_msgSend_parentWillDie_(self->_environment, v33, (uint64_t)self, v34);
  objc_msgSend_setWorld_(self->_clock, v35, 0, v36);

  objc_msgSend_setWorld_(self->_stateManager, v37, 0, v38);
  coreEntityManager = self->_coreEntityManager;
  if (coreEntityManager)
  {
    CFRelease(coreEntityManager);
    self->_coreEntityManager = 0;
  }

  v40.receiver = self;
  v40.super_class = (Class)VFXWorld;
  [(VFXWorld *)&v40 dealloc];
}

- (id)assetPathResolver
{
  return self->_assetPathResolver;
}

- (void)setAssetPathResolver:(id)a3
{
  assetPathResolver = self->_assetPathResolver;
  if (assetPathResolver != a3)
  {

    self->_assetPathResolver = (VFXAssetPathResolver *)a3;
    uint64_t v6 = (void *)sub_1B6355ECC((uint64_t)self->_coreEntityManager);
    objc_msgSend_setAssetManager_(v6, v7, (uint64_t)a3, v8);
    uint64_t v16 = sub_1B64B20C4((uint64_t)self->_world, v9, v10, v11, v12, v13, v14, v15);
    uint64_t v17 = (void *)sub_1B6355ECC(v16);
    objc_msgSend_setAssetManager_(v17, v18, (uint64_t)a3, v19);
  }
}

- (id)_worlds
{
  return (id)objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], a2, (uint64_t)self, v2);
}

- (__CFXWorld)worldRef
{
  return self->_world;
}

- (id)root
{
  if ((byte_1E9DDAFC8 & 1) == 0)
  {
    byte_1E9DDAFC8 = 1;
    sub_1B63F2F54(16, @"Error: [VFXWorld root] is deprecated, use rootNode instead", v2, v3, v4, v5, v6, v7, v10);
  }

  return (id)objc_msgSend_rootNode(self, a2, v2, v3);
}

- (VFXNode)rootNode
{
  if (!self->_rootNode)
  {
    uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v13 = v5;
    if (v5) {
      sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    if (!self->_rootNode)
    {
      world = self->_world;
      if (world)
      {
        sub_1B64B0C28((uint64_t)world, v6, v7, v8, v9, v10, v11, v12);
        uint64_t v23 = sub_1B64B1FBC((uint64_t)self->_world, v15, v16, v17, v18, v19, v20, v21);
        if (v23)
        {
          uint64_t v25 = (VFXNode *)(id)objc_msgSend_nodeWithNodeRef_(VFXNode, v22, v23, v24);
          self->_rootNode = v25;
          objc_msgSend_setWorld_(v25, v26, (uint64_t)self, v27);
        }
        else
        {
          uint64_t v35 = objc_msgSend_node(VFXNode, v22, 0, v24);
          objc_msgSend__setRootNode_immediate_(self, v36, v35, 1);
        }
        sub_1B64B0CB4((uint64_t)self->_world, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    if (v13) {
      sub_1B64B0CB4(v13, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v37 = self->_rootNode;

  return v37;
}

- (void)_setRootNode:(id)a3 immediate:(BOOL)a4
{
  rootNode = self->_rootNode;
  if (rootNode != a3)
  {
    BOOL v6 = a4;
    objc_msgSend_setWorld_(rootNode, a2, 0, a4);

    uint64_t v8 = (VFXNode *)a3;
    self->_rootNode = v8;
    objc_msgSend_setWorld_(v8, v9, (uint64_t)self, v10);

    self->_layerRootNode[0] = (VFXNode *)a3;
    if (v6)
    {
      uint64_t v14 = objc_msgSend_worldRef(self, v11, v12, v13);
      if (v14)
      {
        uint64_t v22 = v14;
        sub_1B64B0C28(v14, (uint64_t)v15, v16, v17, v18, v19, v20, v21);
        world = self->_world;
        uint64_t v27 = (uint64_t *)objc_msgSend_nodeRef(a3, v24, v25, v26);
        sub_1B64B1DE0((uint64_t)world, v27, v28, v29, v30, v31, v32, v33);
        sub_1B64B0CB4(v22, v34, v35, v36, v37, v38, v39, v40);
      }
      else
      {
        uint64_t v43 = self->_world;
        uint64_t v44 = (uint64_t *)objc_msgSend_nodeRef(a3, v15, v16, v17);
        sub_1B64B1DE0((uint64_t)v43, v44, v45, v46, v47, v48, v49, v50);
      }
    }
    else
    {
      uint64_t v41 = objc_msgSend_worldRef(self, v11, v12, v13);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = sub_1B64DB3CC;
      v51[3] = &unk_1E6141230;
      v51[4] = self;
      v51[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v42, v41, 0, v51);
    }
  }
}

- (void)setRootNode:(id)a3
{
}

- (void)setRootNode:(id)a3 forLayer:(int)a4
{
  layerRootNode = self->_layerRootNode;
  BOOL v6 = self->_layerRootNode[a4];
  if (v6 != a3)
  {
    if (a4)
    {
      objc_msgSend_setWorld_(v6, a2, 0, *(uint64_t *)&a4);

      uint64_t v9 = (VFXNode *)a3;
      layerRootNode[a4] = v9;
      objc_msgSend_setWorld_(v9, v10, (uint64_t)self, v11);
      uint64_t v15 = objc_msgSend_worldRef(self, v12, v13, v14);
      if (v15)
      {
        uint64_t v23 = v15;
        sub_1B64B0C28(v15, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
        world = self->_world;
        uint64_t v28 = objc_msgSend_nodeRef(a3, v25, v26, v27);
        sub_1B64B3604((uint64_t)world, a4, v28, v29, v30, v31, v32, v33);
        sub_1B64B0CB4(v23, v34, v35, v36, v37, v38, v39, v40);
      }
      else
      {
        uint64_t v41 = self->_world;
        uint64_t v42 = objc_msgSend_nodeRef(a3, v16, v17, v18);
        sub_1B64B3604((uint64_t)v41, a4, v42, v43, v44, v45, v46, v47);
      }
    }
    else
    {
      objc_msgSend__setRootNode_immediate_(self, a2, (uint64_t)a3, 0);
    }
  }
}

- (id)rootNodeForLayer:(int)a3
{
  return self->_layerRootNode[a3];
}

- (id)assetRegistry
{
  id result = self->_assetRegistry;
  if (!result)
  {
    uint64_t v4 = objc_alloc_init(VFXAssetRegistry);
    self->_assetRegistry = v4;
    objc_msgSend_setWorld_(v4, v5, (uint64_t)self, v6);
    return self->_assetRegistry;
  }
  return result;
}

- (_opaque_pthread_mutex_t)mutex
{
  return (_opaque_pthread_mutex_t *)sub_1B64B248C((uint64_t)self->_world);
}

- (id)defaultRenderGraph
{
  return self->_defaultRenderGraph;
}

- (void)setDefaultRenderGraph:(id)a3
{
  defaultRenderGraph = self->_defaultRenderGraph;
  if (defaultRenderGraph != a3)
  {

    self->_defaultRenderGraph = (VFXRenderGraph *)a3;
  }
}

- (void)_scaleWorldBy:(float)a3
{
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B64DB684;
  v9[3] = &unk_1E6141208;
  v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, 0, v9);
}

+ (BOOL)canImportFileUTI:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"org.khronos.collada.digital-asset-exchange", v3)) {
    return 1;
  }

  return objc_msgSend_hasPrefix_(a3, v5, @"com.apple.vfx", v6);
}

+ (BOOL)canImportFileExtension:(id)a3
{
  uint64_t v4 = objc_msgSend_lowercaseString(a3, a2, (uint64_t)a3, v3);
  if ((objc_msgSend_isEqualToString_(v4, v5, @"dae", v6) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v7, @"vfx-world", v8) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v9, @"vfxz-world", v10) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v11, @"scn", v12) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v13, @"scnz", v14) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v15, @"c3d", v16) & 1) != 0)
  {
    return 1;
  }
  uint64_t v20 = (void *)MEMORY[0x1E4F35BB0];

  return objc_msgSend_canImportFileExtension_(v20, v17, (uint64_t)v4, v18);
}

+ (id)supportedFileUTIsForImport
{
  uint64_t v4 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  objc_msgSend_addObjectsFromArray_(v4, v5, (uint64_t)&unk_1F103BFA8, v6);
  return v4;
}

+ (id)supportedFileUTIsForExport
{
  uint64_t v4 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  objc_msgSend_addObjectsFromArray_(v4, v5, (uint64_t)&unk_1F103BFC0, v6);
  return v4;
}

- (VFXPhysicsWorld)physicsWorld
{
  return (VFXPhysicsWorld *)objc_msgSend__physicsWorldCreateIfNeeded_(self, a2, 1, v2);
}

- (id)_physicsWorldCreateIfNeeded:(BOOL)a3
{
  id result = self->_physicsWorld;
  if (result) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    uint64_t v6 = [VFXPhysicsWorld alloc];
    id result = (id)objc_msgSend_initWithWorld_(v6, v7, (uint64_t)self, v8);
    self->_physicsWorld = (VFXPhysicsWorld *)result;
  }
  return result;
}

- (double)startTime
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    double v21 = sub_1B64B215C((uint64_t)self->_world, v14, v15, v16, v17, v18, v19, v20);
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
    return v21;
  }
  else
  {
    world = self->_world;
    return sub_1B64B215C((uint64_t)world, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)setStartTime:(double)a3
{
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  if (v7)
  {
    uint64_t v15 = v7;
    sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
    sub_1B64B21F4((uint64_t)self->_world, a3, v16, v17, v18, v19, v20, v21, v22);
    sub_1B64B0CB4(v15, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    world = self->_world;
    sub_1B64B21F4((uint64_t)world, a3, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (double)endTime
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    double v21 = sub_1B64B21A8((uint64_t)self->_world, v14, v15, v16, v17, v18, v19, v20);
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
    return v21;
  }
  else
  {
    world = self->_world;
    return sub_1B64B21A8((uint64_t)world, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)setEndTime:(double)a3
{
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  if (v7)
  {
    uint64_t v15 = v7;
    sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
    sub_1B64B224C((uint64_t)self->_world, a3, v16, v17, v18, v19, v20, v21, v22);
    sub_1B64B0CB4(v15, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    world = self->_world;
    sub_1B64B224C((uint64_t)world, a3, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (double)frameRate
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    float v21 = sub_1B64B22A4((uint64_t)self->_world, v14, v15, v16, v17, v18, v19, v20);
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
  }
  else
  {
    return sub_1B64B22A4((uint64_t)self->_world, v6, v7, v8, v9, v10, v11, v12);
  }
  return v21;
}

- (void)setFrameRate:(double)a3
{
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  if (v7)
  {
    uint64_t v15 = v7;
    sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
    float v16 = a3;
    sub_1B64B22F0((uint64_t)self->_world, v16, v17, v18, v19, v20, v21, v22, v23);
    sub_1B64B0CB4(v15, v24, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    world = self->_world;
    float v32 = a3;
    sub_1B64B22F0((uint64_t)world, v32, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (float)playbackSpeed
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    float v21 = sub_1B64B2348((uint64_t)self->_world, v14, v15, v16, v17, v18, v19, v20);
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
    return v21;
  }
  else
  {
    world = self->_world;
    return sub_1B64B2348((uint64_t)world, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)setPlaybackSpeed:(float)a3
{
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  if (v7)
  {
    uint64_t v15 = v7;
    sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
    sub_1B64B2394((uint64_t)self->_world, a3, v16, v17, v18, v19, v20, v21, v22);
    sub_1B64B0CB4(v15, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    world = self->_world;
    sub_1B64B2394((uint64_t)world, a3, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (VFXMaterialProperty)background
{
  id result = self->_background;
  if (!result)
  {
    uint64_t v4 = [VFXMaterialProperty alloc];
    id result = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v4, v5, (uint64_t)self, 23);
    self->_background = result;
  }
  return result;
}

- (VFXMaterialProperty)lightingEnvironment
{
  id result = self->_environment;
  if (!result)
  {
    uint64_t v4 = [VFXMaterialProperty alloc];
    id result = (VFXMaterialProperty *)objc_msgSend_initWithParent_propertyType_(v4, v5, (uint64_t)self, 24);
    self->_environment = result;
  }
  return result;
}

- (BOOL)_allowsDefaultLightingEnvironmentFallback
{
  return self->_allowsDefaultLightingEnvironmentFallback;
}

- (void)set_allowsDefaultLightingEnvironmentFallback:(BOOL)a3
{
  if (self->_allowsDefaultLightingEnvironmentFallback != a3)
  {
    self->_allowsDefaultLightingEnvironmentFallbacuint64_t k = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64DBDBC;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, 0, v8);
  }
}

- (id)authoringEnvironment2
{
  return self->_authoringEnvironment2;
}

- (void)setAuthoringEnvironment2:(id)a3
{
  authoringEnvironment2 = self->_authoringEnvironment2;
  if (authoringEnvironment2 != a3)
  {

    self->_authoringEnvironment2 = (VFXAuthoringEnvironment2 *)a3;
  }
}

- (id)fogColor
{
  return self->_fogColor;
}

- (void)setFogColor:(id)a3
{
  id fogColor = self->_fogColor;
  if (fogColor != a3 && (objc_msgSend_isEqual_(a3, a2, (uint64_t)fogColor, v3) & 1) == 0)
  {

    self->_id fogColor = a3;
    uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1B64DBEEC;
    v12[3] = &unk_1E6141230;
    v12[4] = a3;
    v12[5] = self;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, @"fogColor", v12);
  }
}

- (double)fogColor_linearExtendedSRGB
{
  uint64_t v4 = (const void *)objc_msgSend_fogColor(a1, a2, a3, a4);

  return sub_1B64FA040(v4);
}

- (void)setFogColor_linearExtendedSRGB:(VFXWorld *)self
{
  CGColorRef v4 = sub_1B63C9830(v2);
  uint64_t v7 = objc_msgSend_colorWithCGColor_(MEMORY[0x1E4FB1618], v5, (uint64_t)v4, v6);
  objc_msgSend_setFogColor_(self, v8, v7, v9);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (float)fogEndDistance
{
  return self->_fogEndDistance;
}

- (void)setFogEndDistance:(float)a3
{
  if (a3 >= 1.0e-35) {
    float v5 = a3;
  }
  else {
    float v5 = 0.0;
  }
  if (v5 != self->_fogEndDistance)
  {
    self->_fogEndDistance = v5;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64DC098;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"fogEndDistance", v9);
  }
}

- (float)fogDensityExponent
{
  return self->_fogDensityExponent;
}

- (void)setFogDensityExponent:(float)a3
{
  if (self->_fogDensityExponent != a3)
  {
    self->_fogDensityExponent = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64DC16C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"fogDensityExponent", v9);
  }
}

- (float)fogStartDistance
{
  return self->_fogStartDistance;
}

- (void)setFogStartDistance:(float)a3
{
  if (self->_fogStartDistance != a3)
  {
    self->_fogStartDistance = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64DC240;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"fogStartDistance", v9);
  }
}

- (BOOL)wantsScreenSpaceReflection
{
  return self->_wantsScreenSpaceReflection;
}

- (void)setWantsScreenSpaceReflection:(BOOL)a3
{
  if (self->_wantsScreenSpaceReflection != a3)
  {
    self->_wantsScreenSpaceReflection = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64DC30C;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)screenSpaceReflectionSampleCount
{
  return self->_screenSpaceReflectionSampleCount;
}

- (void)setScreenSpaceReflectionSampleCount:(int64_t)a3
{
  if (self->_screenSpaceReflectionSampleCount != a3)
  {
    self->_screenSpaceReflectionSampleCount = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B64DC3D4;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)screenSpaceReflectionDepthThreshold
{
  return 0.0;
}

- (float)screenSpaceReflectionMaximumDistance
{
  return self->_screenSpaceReflectionMaxRayDistance;
}

- (void)setScreenSpaceReflectionMaximumDistance:(float)a3
{
  if (self->_screenSpaceReflectionMaxRayDistance != a3)
  {
    self->_screenSpaceReflectionMaxRayDistance = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64DC4AC;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (float)screenSpaceReflectionStride
{
  return self->_screenSpaceReflectionStride;
}

- (void)setScreenSpaceReflectionStride:(float)a3
{
  if (self->_screenSpaceReflectionStride != a3)
  {
    self->_screenSpaceReflectionStride = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B64DC578;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (id)dataRepresentationWithOptions:(id)a3
{
  uint64_t v6 = objc_msgSend_stateManager(self, a2, (uint64_t)a3, v3);
  uint64_t active = objc_msgSend_activeState(v6, v7, v8, v9);
  if (active)
  {
    uint64_t v14 = objc_msgSend_stateManager(self, v10, v11, v12);
    objc_msgSend_setActiveState_(v14, v15, 0, v16);
  }
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(a3, v10, @"VFXWorldExportPresentationTree", v12);
  int v21 = objc_msgSend_BOOLValue(v17, v18, v19, v20);
  uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(a3, v22, @"kWorldSourceFormat", v23);
  int isEqualToString = objc_msgSend_isEqualToString_(v24, v25, @"vfxz-world", v26);
  if (v21)
  {
    uint64_t v31 = objc_msgSend_worldRef(self, v27, v28, v29);
    uint64_t v38 = v31;
    if (v31) {
      sub_1B64B0C28(v31, (uint64_t)v27, v32, v33, v34, v35, v36, v37);
    }
  }
  else
  {
    uint64_t v38 = 0;
  }
  uint64_t v46 = objc_msgSend_archivedDataWithRootObject_options_(VFXKeyedArchiver, v27, (uint64_t)self, (uint64_t)a3);
  char v47 = v21 ^ 1;
  if (!v38) {
    char v47 = 1;
  }
  if ((v47 & 1) == 0) {
    sub_1B64B0CB4(v38, (uint64_t)v39, v40, v41, v42, v43, v44, v45);
  }
  if (active)
  {
    uint64_t v48 = objc_msgSend_stateManager(self, v39, v40, v41);
    objc_msgSend_setActiveState_(v48, v49, active, v50);
  }
  id result = v46;
  if (isEqualToString)
  {
    return (id)objc_msgSend_vfx_compressedDataUsingCompressionAlgorithm_(v46, v39, 517, v41);
  }
  return result;
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 progressHandler:(id)a5
{
  if (a4) {
    id v8 = (id)objc_msgSend_mutableCopy(a4, a2, (uint64_t)a3, (uint64_t)a4);
  }
  else {
    id v8 = (id)objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, (uint64_t)a3, 0);
  }
  uint64_t v11 = v8;
  uint64_t v15 = objc_msgSend_valueForKey_(v8, v9, @"kWorldSourceFormat", v10);
  if (!v15)
  {
    uint64_t v16 = objc_msgSend_pathExtension(a3, v12, v13, v14);
    uint64_t v20 = objc_msgSend_lowercaseString(v16, v17, v18, v19);
    if ((objc_msgSend_isEqualToString_(v20, v21, @"plist", v22) & 1) != 0
      || (objc_msgSend_isEqualToString_(v20, v12, @"vfx-world", v14) & 1) != 0)
    {
      uint64_t v23 = VFXWorldLoaderFormatVFX;
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v20, v12, @"vfxz-world", v14))
      {
        uint64_t v15 = 0;
        goto LABEL_10;
      }
      uint64_t v23 = VFXWorldLoaderFormatVFXZ;
    }
    uint64_t v15 = *v23;
    if (*v23) {
      objc_msgSend_setValue_forKey_(v11, v12, (uint64_t)*v23, @"kWorldSourceFormat");
    }
  }
LABEL_10:
  char v59 = 0;
  if ((objc_msgSend_isEqualToString_(v15, v12, @"vfx-world", v14) & 1) != 0
    || objc_msgSend_isEqualToString_(v15, v24, @"vfxz-world", v25))
  {
    uint64_t v27 = objc_msgSend_dataRepresentationWithOptions_(self, v24, (uint64_t)v11, v25);
    uint64_t v58 = 0;
    char v29 = objc_msgSend_writeToURL_options_error_(v27, v28, (uint64_t)a3, 1, &v58);
    goto LABEL_26;
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  uint64_t v54 = sub_1B64DCA04;
  uint64_t v55 = &unk_1E6143160;
  uint64_t v56 = v15;
  id v57 = a3;
  if (!v15)
  {
    uint64_t v36 = objc_msgSend_pathExtension(a3, v24, v26, v25);
    uint64_t v40 = objc_msgSend_lowercaseString(v36, v37, v38, v39);
    if ((objc_msgSend_isEqualToString_(v40, v41, @"usd", v42) & 1) == 0
      && (objc_msgSend_isEqualToString_(v40, v43, @"usda", v44) & 1) == 0
      && (objc_msgSend_isEqualToString_(v40, v45, @"usdc", v46) & 1) == 0
      && !objc_msgSend_isEqualToString_(v40, v47, @"usdz", v48))
    {
      goto LABEL_30;
    }
LABEL_25:
    uint64_t v58 = 0;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = sub_1B64DCB4C;
    v52[3] = &unk_1E6143188;
    v52[4] = self;
    char v29 = ((uint64_t (*)(void *, uint64_t *, void *))v54)(v53, &v58, v52);
    goto LABEL_26;
  }
  if ((objc_msgSend_isEqualToString_(v15, v24, @"usd", v25) & 1) != 0
    || (objc_msgSend_isEqualToString_(v15, v30, @"usda", v31) & 1) != 0
    || (objc_msgSend_isEqualToString_(v15, v32, @"usdc", v33) & 1) != 0
    || (objc_msgSend_isEqualToString_(v15, v34, @"usdz", v35) & 1) != 0)
  {
    goto LABEL_25;
  }
LABEL_30:
  if (!NSClassFromString(&cfstr_Mdlasset.isa)) {
    return 0;
  }
  uint64_t v58 = 0;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_1B64DCB58;
  v51[3] = &unk_1E6143188;
  v51[4] = self;
  char v29 = ((uint64_t (*)(void *, uint64_t *, void *))v54)(v53, &v58, v51);
LABEL_26:
  BOOL v49 = v29;
  if (a5) {
    (*((void (**)(id, uint64_t, char *, float))a5 + 2))(a5, v58, &v59, 1.0);
  }
  return v49;
}

- (void)_dumpToDisk
{
  float v5 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], a2, v2, v3);
  uint64_t v9 = objc_msgSend_temporaryDirectory(v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_path(v9, v10, v11, v12);
  uint64_t v16 = 0;
  do
  {
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v13, @"worldDump%d.vfx", v14, v16);
    uint64_t v20 = objc_msgSend_stringByAppendingPathComponent_(v15, v18, v17, v19);
    uint64_t v16 = (v16 + 1);
    uint64_t v24 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v21, v22, v23);
  }
  while ((objc_msgSend_fileExistsAtPath_(v24, v25, v20, v26) & 1) != 0);
  NSLog(&cfstr_DumpingWorldTo.isa, v20);
  uint64_t v29 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v27, v20, v28);

  MEMORY[0x1F4181798](self, sel_writeToURL_options_progressHandler_, v29, 0);
}

- (void)lock
{
  uint64_t v4 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v4)
  {
    sub_1B64B0C28(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)unlock
{
  uint64_t v4 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v4)
  {
    sub_1B64B0CB4(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  uint64_t v80 = 0;
  objc_super v81 = 0;
  sub_1B64F9EE8(a3, (char *)&v81, &v80, (uint64_t)a4);
  if (objc_msgSend_isEqual_(v81, v7, @"root", v8))
  {
    if (!self->_rootNode)
    {
      uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
      uint64_t v19 = v12;
      if (v12) {
        sub_1B64B0C28(v12, (uint64_t)v9, v13, v14, v15, v16, v17, v18);
      }
      if (!self->_rootNode)
      {
        world = self->_world;
        if (world)
        {
          sub_1B64B0C28((uint64_t)world, (uint64_t)v9, v13, v14, v15, v16, v17, v18);
          uint64_t v29 = sub_1B64B1FBC((uint64_t)self->_world, v21, v22, v23, v24, v25, v26, v27);
          if (v29)
          {
            uint64_t v31 = (VFXNode *)(id)objc_msgSend_nodeWithNodeRef_(VFXNode, v28, v29, v30);
            self->_rootNode = v31;
            objc_msgSend_setWorld_(v31, v32, (uint64_t)self, v33);
          }
          else
          {
            uint64_t v76 = objc_msgSend_node(VFXNode, v28, 0, v30);
            objc_msgSend__setRootNode_immediate_(self, v77, v76, 1);
          }
          sub_1B64B0CB4((uint64_t)self->_world, v34, v35, v36, v37, v38, v39, v40);
        }
      }
      if (v19) {
        sub_1B64B0CB4(v19, (uint64_t)v9, v13, v14, v15, v16, v17, v18);
      }
    }
    id result = self->_rootNode;
    return (id)objc_msgSend_copyAnimationChannelForKeyPath_animation_(result, v9, v80, (uint64_t)a4);
  }
  if (objc_msgSend_hasPrefix_(a3, v9, @"/", v11))
  {
    if (!self->_rootNode) {
      goto LABEL_14;
    }
    return (id)objc_msgSend_copyAnimationChannelForKeyPath_animation_(self->_rootNode, v41, (uint64_t)a3, (uint64_t)a4);
  }
  int hasPrefix = objc_msgSend_hasPrefix_(a3, v41, @"children[", v43);
  rootNode = self->_rootNode;
  if (hasPrefix)
  {
    if (!rootNode)
    {
LABEL_14:
      uint64_t v46 = objc_msgSend_worldRef(self, v41, v42, v43);
      uint64_t v53 = v46;
      if (v46) {
        sub_1B64B0C28(v46, (uint64_t)v41, v47, v48, v49, v50, v51, v52);
      }
      if (!self->_rootNode)
      {
        uint64_t v54 = self->_world;
        if (v54)
        {
          sub_1B64B0C28((uint64_t)v54, (uint64_t)v41, v47, v48, v49, v50, v51, v52);
          uint64_t v63 = sub_1B64B1FBC((uint64_t)self->_world, v55, v56, v57, v58, v59, v60, v61);
          if (v63)
          {
            uint64_t v65 = (VFXNode *)(id)objc_msgSend_nodeWithNodeRef_(VFXNode, v62, v63, v64);
            self->_rootNode = v65;
            objc_msgSend_setWorld_(v65, v66, (uint64_t)self, v67);
          }
          else
          {
            uint64_t v78 = objc_msgSend_node(VFXNode, v62, 0, v64);
            objc_msgSend__setRootNode_immediate_(self, v79, v78, 1);
          }
          sub_1B64B0CB4((uint64_t)self->_world, v68, v69, v70, v71, v72, v73, v74);
        }
      }
      if (v53) {
        sub_1B64B0CB4(v53, (uint64_t)v41, v47, v48, v49, v50, v51, v52);
      }
    }
    return (id)objc_msgSend_copyAnimationChannelForKeyPath_animation_(self->_rootNode, v41, (uint64_t)a3, (uint64_t)a4);
  }
  id result = (id)objc_msgSend_childNodeWithName_recursively_(rootNode, v41, (uint64_t)v81, 1);
  if (result) {
    return (id)objc_msgSend_copyAnimationChannelForKeyPath_animation_(result, v9, v80, (uint64_t)a4);
  }
  return result;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  if (self->_background == a4)
  {
    uint64_t v6 = off_1E6141C90;
  }
  else
  {
    if (self->_environment != a4) {
      return 0;
    }
    uint64_t v6 = off_1E6141C98;
  }
  uint64_t v7 = (__CFString *)objc_msgSend_stringWithFormat_(NSString, a2, @"%@.%@", (uint64_t)a4, *v6, a3);

  return sub_1B6500480(self, v7, v8, v9);
}

- (id)valueForUndefinedKey:(id)a3
{
  int hasPrefix = objc_msgSend_hasPrefix_(a3, a2, @"/", v3);
  p_rootNode = (void **)&self->_rootNode;
  rootNode = self->_rootNode;
  if (hasPrefix)
  {
    if (!rootNode)
    {
      uint64_t v12 = objc_msgSend_worldRef(self, v6, v7, v8);
      uint64_t v18 = v12;
      if (v12) {
        sub_1B64B0C28(v12, (uint64_t)v6, v13, v8, v14, v15, v16, v17);
      }
      if (!*p_rootNode)
      {
        world = self->_world;
        if (world)
        {
          sub_1B64B0C28((uint64_t)world, (uint64_t)v6, v13, v8, v14, v15, v16, v17);
          uint64_t v28 = sub_1B64B1FBC((uint64_t)self->_world, v20, v21, v22, v23, v24, v25, v26);
          if (v28)
          {
            uint64_t v30 = (VFXNode *)(id)objc_msgSend_nodeWithNodeRef_(VFXNode, v27, v28, v29);
            self->_rootNode = v30;
            objc_msgSend_setWorld_(v30, v31, (uint64_t)self, v32);
          }
          else
          {
            uint64_t v41 = objc_msgSend_node(VFXNode, v27, 0, v29);
            objc_msgSend__setRootNode_immediate_(self, v42, v41, 1);
          }
          sub_1B64B0CB4((uint64_t)self->_world, v33, v34, v35, v36, v37, v38, v39);
        }
      }
      if (v18) {
        sub_1B64B0CB4(v18, (uint64_t)v6, v13, v8, v14, v15, v16, v17);
      }
    }
  }
  else
  {
    id result = (id)objc_msgSend_childNodeWithName_recursively_(rootNode, v6, (uint64_t)a3, 1);
    if (result) {
      return result;
    }
    p_rootNode = (void **)&self->_userAttributes;
  }
  uint64_t v43 = *p_rootNode;

  return (id)objc_msgSend_valueForKey_(v43, v6, (uint64_t)a3, v8);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
}

- (void)__CFObject
{
  return self->_world;
}

- (VFXClock)clock
{
  return self->_clock;
}

- (id)_nodeWithIndexPath:(id)a3
{
  uint64_t v5 = objc_msgSend_rootNode(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_length(a3, v6, v7, v8);
  if (v9 >= 1)
  {
    uint64_t v12 = v9;
    uint64_t v13 = 0;
    while (1)
    {
      unint64_t v14 = objc_msgSend_indexAtPosition_(a3, v10, v13, v11);
      uint64_t v18 = objc_msgSend_childNodes(v5, v15, v16, v17);
      if (objc_msgSend_count(v18, v19, v20, v21) <= v14) {
        break;
      }
      ++v13;
      uint64_t v29 = objc_msgSend_childNodes(v5, v22, v23, v24);
      uint64_t v5 = objc_msgSend_objectAtIndexedSubscript_(v29, v30, v14, v31);
      if (v12 == v13) {
        return v5;
      }
    }
    sub_1B63F2F54(16, @"Error: _subnodeFromIndexPath - invalid keypath", v23, v24, v25, v26, v27, v28, v33);
    return 0;
  }
  return v5;
}

+ (id)_indexPathForNode:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = -1;
  size_t v6 = -8;
  uint64_t v7 = a3;
  do
  {
    uint64_t v7 = objc_msgSend_parentNode(v7, a2, (uint64_t)a3, v3);
    ++v5;
    v6 += 8;
  }
  while (v7);
  if (!v5)
  {
    sub_1B63F2F54(16, @"Error: %@ is not in a world yet", (uint64_t)a3, v3, v8, v9, v10, v11, (uint64_t)v4);
    return 0;
  }
  uint64_t v12 = malloc_type_malloc(v6, 0x100004000313F17uLL);
  uint64_t v16 = objc_msgSend_parentNode(v4, v13, v14, v15);
  if (!v16) {
    goto LABEL_9;
  }
  uint64_t v24 = v5 + 1;
  do
  {
    uint64_t v25 = v16;
    v12[v24 - 2] = objc_msgSend_indexOfChildNode_(v16, v17, (uint64_t)v4, v19);
    uint64_t v16 = objc_msgSend_parentNode(v25, v26, v27, v28);
    --v24;
    id v4 = v25;
  }
  while (v16);
  if (v24 != 1) {
LABEL_9:
  }
    sub_1B63F2F54(17, @"Assertion '%s' failed. _subnodeIndexPath - unexpected count (hierachy was mutated?)", v18, v19, v20, v21, v22, v23, (uint64_t)"wr == 0");
  id v29 = objc_alloc(MEMORY[0x1E4F28D58]);
  uint64_t v31 = objc_msgSend_initWithIndexes_length_(v29, v30, (uint64_t)v12, v5);
  free(v12);

  return v31;
}

- (id)_subnodeFromIndexPath:(id)a3
{
  if (a3) {
    return (id)((uint64_t (*)(id, char *, id))MEMORY[0x1F4181798])(self, sel__nodeWithIndexPath_, a3);
  }
  return self;
}

- (void)prepareForRenderer:(id)a3 progressHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  char v15 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_7:
      if (!a4) {
        return;
      }
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F281F8];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = @"unknown renderer type";
      uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v17, (uint64_t)&v16, 1);
      uint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_(v11, v14, v12, 3328, v13);
      goto LABEL_9;
    }
    a3 = (id)objc_msgSend_renderer(a3, v7, v8, v9);
  }
  if (!a3) {
    goto LABEL_7;
  }
  objc_msgSend_prepareObject_shouldAbortBlock_(a3, v7, (uint64_t)self, 0);
  uint64_t v10 = 0;
  if (a4) {
LABEL_9:
  }
    (*((void (**)(id, uint64_t, char *, float))a4 + 2))(a4, v10, &v15, 1.0);
}

- (id)initForJavascript:(id)a3
{
  v57.receiver = self;
  v57.super_class = (Class)VFXWorld;
  id v4 = [(VFXWorld *)&v57 init];
  if (v4)
  {
    if (a3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v5, (uint64_t)a3, v6);
        if (!objc_msgSend_scheme(v7, v8, v9, v10)) {
          uint64_t v7 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v11, (uint64_t)a3, v12);
        }
      }
      else
      {
        uint64_t v7 = a3;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = objc_msgSend_loader(VFXWorldLoader, v13, v14, v15);
        objc_msgSend_loadURL_into_options_statusHandler_error_(v16, v17, (uint64_t)v7, (uint64_t)v4, 0, 0, 0);
      }
    }
    uint64_t v18 = sub_1B64B1BE8();
    *((void *)v4 + 1) = v18;
    if (v18) {
      sub_1B6583684(v18, v4, v20, v21, v22, v23, v24, v25);
    }
    objc_msgSend__syncObjCModel(v4, v19, v20, v21);
    if (!*((void *)v4 + 8))
    {
      uint64_t v33 = *((void *)v4 + 1);
      if (v33)
      {
        sub_1B64B0C28(v33, v26, v27, v28, v29, v30, v31, v32);
        uint64_t v42 = sub_1B64B1FBC(*((void *)v4 + 1), v34, v35, v36, v37, v38, v39, v40);
        if (v42)
        {
          id v44 = (id)objc_msgSend_nodeWithNodeRef_(VFXNode, v41, v42, v43);
          *((void *)v4 + 8) = v44;
          objc_msgSend_setWorld_(v44, v45, (uint64_t)v4, v46);
        }
        else
        {
          uint64_t v54 = objc_msgSend_node(VFXNode, v41, 0, v43);
          objc_msgSend__setRootNode_immediate_(v4, v55, v54, 1);
        }
        sub_1B64B0CB4(*((void *)v4 + 1), v47, v48, v49, v50, v51, v52, v53);
      }
    }
  }
  return v4;
}

+ (SEL)jsConstructor
{
  return sel_initForJavascript_;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, 1, @"version");
  objc_msgSend_endTime(self, v5, v6, v7);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"endTime", v9);
  objc_msgSend_startTime(self, v10, v11, v12);
  objc_msgSend_encodeDouble_forKey_(a3, v13, @"startTime", v14);
  objc_msgSend_frameRate(self, v15, v16, v17);
  objc_msgSend_encodeDouble_forKey_(a3, v18, @"frameRate", v19);
  defaultRenderGraph = self->_defaultRenderGraph;
  if (defaultRenderGraph) {
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)defaultRenderGraph, @"defaultRenderGraph");
  }
  behaviorGraph = self->_behaviorGraph;
  if (behaviorGraph) {
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)behaviorGraph, @"behaviorGraph");
  }
  assetRegistry = self->_assetRegistry;
  if (assetRegistry) {
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)assetRegistry, @"assetRegistry");
  }
  physicsWorld = self->_physicsWorld;
  if (physicsWorld && (objc_msgSend__isDefault(physicsWorld, v20, (uint64_t)assetRegistry, v21) & 1) == 0) {
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->_physicsWorld, @"physicsWorld");
  }
  rootNode = self->_rootNode;
  if (rootNode) {
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)rootNode, @"rootNode");
  }
  background = self->_background;
  if (background) {
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)background, @"background");
  }
  environment = self->_environment;
  if (environment) {
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)environment, @"environment");
  }
  userAttributes = self->_userAttributes;
  if (userAttributes) {
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)userAttributes, @"userAttributes");
  }
  stateManager = self->_stateManager;
  if (stateManager) {
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)stateManager, @"stateManager");
  }
  objc_msgSend_encodeDouble_forKey_(a3, v20, @"fogStartDistance", v21, self->_fogStartDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v31, @"fogEndDistance", v32, self->_fogEndDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v33, @"fogDensityExponent", v34, self->_fogDensityExponent);
  id fogColor = (const char *)self->_fogColor;
  if (fogColor) {
    sub_1B64FAC90(a3, fogColor, @"fogColor");
  }
  objc_msgSend_encodeBool_forKey_(a3, fogColor, self->_wantsScreenSpaceReflection, @"wantsScreenSpaceReflection");
  objc_msgSend_encodeInt_forKey_(a3, v36, LODWORD(self->_screenSpaceReflectionSampleCount), @"screenSpaceReflectionSampleCount");
  *(float *)&double v37 = self->_screenSpaceReflectionMaxRayDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v38, @"screenSpaceReflectionMaximumDistance", v39, v37);
  *(float *)&double v40 = self->_screenSpaceReflectionStride;
  objc_msgSend_encodeFloat_forKey_(a3, v41, @"screenSpaceReflectionStride", v42, v40);
  triggerManager = self->_triggerManager;
  if (triggerManager) {
    objc_msgSend_encodeObject_forKey_(a3, v43, (uint64_t)triggerManager, @"triggerManager");
  }

  sub_1B64FAB54(a3, self, (uint64_t)triggerManager, v44);
}

- (VFXWorld)initWithCoder:(id)a3
{
  v225.receiver = self;
  v225.super_class = (Class)VFXWorld;
  id v4 = [(VFXWorld *)&v225 init];
  if (!v4) {
    return (VFXWorld *)v4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
    objc_msgSend__allowDecodingCyclesInSecureMode(a3, v5, v6, v7);
  }
  uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
  uint64_t v11 = sub_1B64B1BE8();
  *((void *)v4 + 1) = v11;
  *((void *)v4 + 26) = sub_1B65117D0(v11, v12, v13, v14, v15, v16, v17, v18);
  uint64_t v26 = *((void *)v4 + 1);
  if (v26) {
    sub_1B6583684(v26, v4, v20, v21, v22, v23, v24, v25);
  }
  objc_msgSend__syncObjCModel(v4, v19, v20, v21);
  uint64_t v29 = objc_msgSend_valueForKey_(VFXTransaction, v27, @"VFXWorldLoadingContextKey", v28);
  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v29, v30, @"url", v31);
  if (v32)
  {
    uint64_t v36 = v32;
    double v37 = objc_msgSend_pathExtension(v32, v33, v34, v35);
    uint64_t v41 = objc_msgSend_lowercaseString(v37, v38, v39, v40);
    if (objc_msgSend_isEqualToString_(v41, v42, @"vfx-world", v43))
    {
      uint64_t v50 = objc_msgSend_mutableCopy(v29, v44, v45, v46);
    }
    else
    {
      int isEqualToString = objc_msgSend_isEqualToString_(v41, v44, @"vfxz-world", v46);
      uint64_t v50 = objc_msgSend_mutableCopy(v29, v52, v53, v54);
      if (!isEqualToString)
      {
        uint64_t v60 = (void *)sub_1B6355ECC(*((void *)v4 + 26));
        uint64_t PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v36, v61, v62, v63);
        objc_msgSend_initializeAssetManagerWithBundleURL_(v60, v65, PathComponent, v66);
        uint64_t v58 = objc_msgSend_assetPathResolver(v4, v67, v68, v69);
        goto LABEL_13;
      }
    }
    uint64_t v55 = objc_msgSend_URLByDeletingLastPathComponent(v36, v47, v48, v49);
    uint64_t v58 = objc_msgSend_resolverWithFolderURL_(VFXSimplePathResolver, v56, v55, v57);
LABEL_13:
    objc_msgSend_setObject_forKeyedSubscript_(v50, v59, v58, @"VFXWorldLoaderAssetPathResolver");
    objc_msgSend_setValue_forKey_(VFXTransaction, v70, (uint64_t)v50, @"VFXWorldLoadingContextKey");
  }
  if (objc_msgSend_containsValueForKey_(a3, v33, @"behaviorGraph", v35))
  {
    uint64_t v73 = objc_opt_class();
    uint64_t v75 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v74, v73, @"behaviorGraph");
    objc_msgSend_setBehaviorGraph_(v4, v76, v75, v77);
  }
  if (objc_msgSend_containsValueForKey_(a3, v71, @"stateManager", v72))
  {
    uint64_t v80 = objc_opt_class();
    id v82 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v81, v80, @"stateManager");
    *((void *)v4 + 25) = v82;
    objc_msgSend_setWorld_(v82, v83, (uint64_t)v4, v84);
  }
  if (objc_msgSend_containsValueForKey_(a3, v78, @"triggerManager", v79))
  {
    uint64_t v85 = objc_opt_class();
    uint64_t v87 = (VFXTriggerManager *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v86, v85, @"triggerManager");
  }
  else
  {
    uint64_t v87 = objc_alloc_init(VFXTriggerManager);
  }
  *((void *)v4 + 30) = v87;
  objc_msgSend_setWorld_(v87, v88, (uint64_t)v4, v89);
  objc_msgSend_decodeDoubleForKey_(a3, v90, @"endTime", v91);
  objc_msgSend_setEndTime_(v4, v92, v93, v94);
  objc_msgSend_decodeDoubleForKey_(a3, v95, @"startTime", v96);
  objc_msgSend_setStartTime_(v4, v97, v98, v99);
  objc_msgSend_decodeDoubleForKey_(a3, v100, @"frameRate", v101);
  objc_msgSend_setFrameRate_(v4, v102, v103, v104);
  uint64_t v105 = objc_opt_class();
  uint64_t v107 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v106, v105, @"defaultRenderGraph");
  objc_msgSend_setDefaultRenderGraph_(v4, v108, v107, v109);
  uint64_t v112 = objc_msgSend_decodeIntegerForKey_(a3, v110, @"version", v111);
  uint64_t v113 = objc_opt_class();
  *((void *)v4 + 7) = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v114, v113, @"physicsWorld");
  uint64_t v115 = objc_opt_class();
  uint64_t v117 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v116, v115, @"rootNode");
  if (v117)
  {
    objc_msgSend_setRootNode_(v4, v118, v117, v120);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: failed to unarchive VFXWorld - (secureCoding compliance issue?)", v119, v120, v121, v122, v123, v124, (uint64_t)v225.receiver);
    if (!*((void *)v4 + 8))
    {
      uint64_t v132 = *((void *)v4 + 1);
      if (v132)
      {
        sub_1B64B0C28(v132, (uint64_t)v125, v126, v127, v128, v129, v130, v131);
        uint64_t v141 = sub_1B64B1FBC(*((void *)v4 + 1), v133, v134, v135, v136, v137, v138, v139);
        if (v141)
        {
          id v143 = (id)objc_msgSend_nodeWithNodeRef_(VFXNode, v140, v141, v142);
          *((void *)v4 + 8) = v143;
          objc_msgSend_setWorld_(v143, v144, (uint64_t)v4, v145);
        }
        else
        {
          uint64_t v153 = objc_msgSend_node(VFXNode, v140, 0, v142);
          objc_msgSend__setRootNode_immediate_(v4, v154, v153, 1);
        }
        sub_1B64B0CB4(*((void *)v4 + 1), v146, v147, v148, v149, v150, v151, v152);
      }
    }
  }
  objc_msgSend__registerPhysicsJoints(*((void **)v4 + 7), v125, v126, v127);
  uint64_t v155 = objc_opt_class();
  id v157 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v156, v155, @"background");
  *((void *)v4 + 13) = v157;
  if (!v112)
  {
    objc_msgSend_contents(v157, v158, v159, v160);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_setContents_(*((void **)v4 + 13), v161, 0, v162);
    }
  }
  uint64_t v163 = sub_1B64FAE78();
  *((void *)v4 + 14) = (id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v164, v163, @"environment");
  uint64_t v165 = sub_1B64FAE78();
  *((void *)v4 + 15) = (id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v166, v165, @"userAttributes");
  objc_msgSend_decodeDoubleForKey_(a3, v167, @"fogStartDistance", v168);
  *(float *)&double v169 = v169;
  objc_msgSend_setFogStartDistance_(v4, v170, v171, v172, v169);
  objc_msgSend_decodeDoubleForKey_(a3, v173, @"fogEndDistance", v174);
  *(float *)&double v175 = v175;
  objc_msgSend_setFogEndDistance_(v4, v176, v177, v178, v175);
  objc_msgSend_decodeDoubleForKey_(a3, v179, @"fogDensityExponent", v180);
  *(float *)&double v181 = v181;
  objc_msgSend_setFogDensityExponent_(v4, v182, v183, v184, v181);
  if (objc_msgSend_containsValueForKey_(a3, v185, @"wantsScreenSpaceReflection", v186))
  {
    uint64_t v189 = objc_msgSend_decodeBoolForKey_(a3, v187, @"wantsScreenSpaceReflection", v188);
    objc_msgSend_setWantsScreenSpaceReflection_(v4, v190, v189, v191);
  }
  if (objc_msgSend_containsValueForKey_(a3, v187, @"screenSpaceReflectionSampleCount", v188))
  {
    int v194 = objc_msgSend_decodeIntForKey_(a3, v192, @"screenSpaceReflectionSampleCount", v193);
    objc_msgSend_setScreenSpaceReflectionSampleCount_(v4, v195, v194, v196);
  }
  if (objc_msgSend_containsValueForKey_(a3, v192, @"screenSpaceReflectionMaximumDistance", v193))
  {
    objc_msgSend_decodeFloatForKey_(a3, v197, @"screenSpaceReflectionMaximumDistance", v198);
    objc_msgSend_setScreenSpaceReflectionMaximumDistance_(v4, v199, v200, v201);
  }
  if (objc_msgSend_containsValueForKey_(a3, v197, @"screenSpaceReflectionStride", v198))
  {
    objc_msgSend_decodeFloatForKey_(a3, v202, @"screenSpaceReflectionStride", v203);
    objc_msgSend_setScreenSpaceReflectionStride_(v4, v204, v205, v206);
  }
  uint64_t v207 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v208 = objc_opt_class();
  uint64_t v211 = objc_msgSend_setWithObject_(v207, v209, v208, v210);
  uint64_t v212 = sub_1B64FAD0C(a3, @"fogColor", v211);
  objc_msgSend_setFogColor_(v4, v213, v212, v214);
  if (objc_msgSend_containsValueForKey_(a3, v215, @"assetRegistry", v216))
  {
    uint64_t v217 = objc_opt_class();
    id v219 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v218, v217, @"assetRegistry");
    *((void *)v4 + 23) = v219;
    objc_msgSend_setWorld_(v219, v220, (uint64_t)v4, v221);
  }
  sub_1B64FABB0(a3, v4);
  objc_msgSend_setImmediateMode_(VFXTransaction, v222, v8, v223);
  return (VFXWorld *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setReplicationDelegate:(id)a3
{
  if (!sub_1B64B2718((uint64_t)self->_world, 1, (uint64_t)a3, v3, v4, v5, v6, v7)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled", v11, v12, v13, v14, v15, v16, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  }
  uint64_t v17 = objc_msgSend_worldRef(self, v10, v11, v12);
  if (v17)
  {
    uint64_t v25 = v17;
    sub_1B64B0C28(v17, v18, v19, v20, v21, v22, v23, v24);
    sub_1B65118DC((uint64_t)self->_coreEntityManager, (uint64_t)a3, v26, v27);
    uint64_t v35 = sub_1B64B20C4((uint64_t)self->_world, v28, v29, v30, v31, v32, v33, v34);
    sub_1B65118E8(v35, (uint64_t)a3, v36, v37);
    sub_1B64B0CB4(v25, v38, v39, v40, v41, v42, v43, v44);
  }
  else
  {
    sub_1B65118DC((uint64_t)self->_coreEntityManager, (uint64_t)a3, v19, v20);
    uint64_t v52 = sub_1B64B20C4((uint64_t)self->_world, v45, v46, v47, v48, v49, v50, v51);
    sub_1B65118E8(v52, (uint64_t)a3, v53, v54);
  }
}

- (id)presentationScene
{
  uint64_t v8 = sub_1B64B20C4((uint64_t)self->_world, (uint64_t)a2, v2, v3, v4, v5, v6, v7);

  return (id)sub_1B6355ECC(v8);
}

- (void)resolveVFXCoreAndTagReferences
{
  if (!sub_1B64B2718((uint64_t)self->_world, 1, v2, v3, v4, v5, v6, v7)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled", v10, v11, v12, v13, v14, v15, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  }
  uint64_t v16 = objc_msgSend_scene(self, v9, v10, v11);
  uint64_t v20 = objc_msgSend_buildIdentifierRemapTable(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_rootNode(self, v21, v22, v23);
  objc_msgSend_enumerateHierarchyUsingBlock_(v24, v25, (uint64_t)&unk_1F0FB5A28, v26);
  objc_msgSend_resolveObjectReferencesWithRemapTableWithWorld_objectsByIdentifier_(v16, v27, (uint64_t)self, v20);
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v32 = objc_msgSend_assetRegistry(self, v29, v30, v31);
  uint64_t v36 = objc_msgSend_rootNode(v32, v33, v34, v35);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = sub_1B64DE0B0;
  v55[3] = &unk_1E61431B0;
  v55[4] = v16;
  v55[5] = v28;
  objc_msgSend_enumerateHierarchyUsingBlock_(v36, v37, (uint64_t)v55, v38);
  uint64_t v42 = objc_msgSend_rootNode(self, v39, v40, v41);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = sub_1B64DE160;
  v54[3] = &unk_1E61431D8;
  v54[4] = v16;
  v54[5] = v28;
  objc_msgSend_enumerateHierarchyUsingBlock_(v42, v43, (uint64_t)v54, v44);
  uint64_t v48 = objc_msgSend_behaviorGraph(self, v45, v46, v47);
  uint64_t v52 = objc_msgSend_coreEntityHandle(v48, v49, v50, v51);
  objc_msgSend_resolveTag_remap_(v52, v53, (uint64_t)v16, (uint64_t)v28);
}

- (BOOL)loadCoreEntityManagerFromURL:(id)a3 options:(id)a4 infoOut:(id)a5 error:(id *)a6
{
  if (!sub_1B64B2718((uint64_t)self->_world, 1, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled", v12, v13, v14, v15, v16, v17, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  }
  uint64_t v18 = objc_msgSend_scene(self, v11, v12, v13);
  objc_msgSend_stopReplication(self, v19, v20, v21);
  uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(a4, v22, @"VFXWorldLoaderLoadForAuthoring", v23);
  uint64_t v28 = objc_msgSend_BOOLValue(v24, v25, v26, v27);
  objc_msgSend_presentationScene(self, v29, v30, v31);

  return MEMORY[0x1F4181798](v18, sel_loadWithUrl_loadingForAuthoring_infoOut_presentationScene_error_, a3, v28);
}

- (void)replicateToRuntimeAndStartReplicationWithOptions:(id)a3
{
  objc_msgSend_cloneModelToPresentationAndStartReplicationStream(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(a3, v6, @"VFXWorldLoaderReplicationDelegate", v7);
  if (v8)
  {
    MEMORY[0x1F4181798](self, sel_setReplicationDelegate_, v8, v9);
  }
}

- (id)scene
{
  return (id)sub_1B6355ECC((uint64_t)self->_coreEntityManager);
}

- (id)stateManager
{
  id result = self->_stateManager;
  if (!result)
  {
    uint64_t v4 = objc_alloc_init(VFXStateManager);
    self->_stateManager = v4;
    objc_msgSend_setWorld_(v4, v5, (uint64_t)self, v6);
    return self->_stateManager;
  }
  return result;
}

- (id)triggerManager
{
  id result = self->_triggerManager;
  if (!result)
  {
    uint64_t v4 = objc_alloc_init(VFXTriggerManager);
    self->_triggerManager = v4;
    objc_msgSend_setWorld_(v4, v5, (uint64_t)self, v6);
    return self->_triggerManager;
  }
  return result;
}

- (id)buildIdentifierRemapTable
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = objc_msgSend_rootNode(self, v4, v5, v6);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1B64DE664;
  v39[3] = &unk_1E6143200;
  v39[4] = v3;
  objc_msgSend_enumerateHierarchyUsingBlock_(v7, v8, (uint64_t)v39, v9);
  uint64_t v13 = objc_msgSend_identifier(self, v10, v11, v12);
  objc_msgSend_setValue_forKey_(v3, v14, (uint64_t)self, v13);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v18 = objc_msgSend_stateManager(self, v15, v16, v17, 0);
  uint64_t v22 = objc_msgSend_states(v18, v19, v20, v21);
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v35, (uint64_t)v40, 16);
  if (v24)
  {
    uint64_t v28 = v24;
    uint64_t v29 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v22);
        }
        uint64_t v31 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v32 = objc_msgSend_identifier(v31, v25, v26, v27);
        objc_msgSend_setValue_forKey_(v3, v33, (uint64_t)v31, v32);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v35, (uint64_t)v40, 16);
    }
    while (v28);
  }
  return v3;
}

- (int64_t)presentationEntityFromModel:(int64_t)a3
{
  if (!sub_1B64B2718((uint64_t)self->_world, 1, a3, v3, v4, v5, v6, v7)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Method should not be called when VFXCore features aren't enabled", v10, v11, v12, v13, v14, v15, (uint64_t)"CFXWorldHasOptions(_world, CFXWorldCreationOptionEnableVFXCoreFeatures)");
  }
  modelToPresentationRemapTable = self->_modelToPresentationRemapTable;

  return MEMORY[0x1F4181798](modelToPresentationRemapTable, sel_presentationEntityFromModel_, a3, v11);
}

- (BOOL)allowRemoteEdition
{
  return self->_remoteEditionEndpoint != 0;
}

- (void)setRemotePreviewDelegate:(id)a3
{
  self->_remotePreviewDelegate = (VFXWorldRemotePreviewDelegate *)a3;
}

- (id)remotePreviewDelegate
{
  return self->_remotePreviewDelegate;
}

- (id)snapshotWithSize:(CGSize)a3 pointOfView:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  if (+[VFXView _isMetalSupported]_0())
  {
    uint64_t v10 = objc_msgSend_rendererWithDevice_options_(VFXRenderer, v8, 0, 0);
    objc_msgSend_setWorld_(v10, v11, (uint64_t)self, v12);
  }
  else
  {
    uint64_t v10 = 0;
    objc_msgSend_setWorld_(0, v8, (uint64_t)self, v9);
  }
  objc_msgSend_setJitteringEnabled_(v10, v13, 0, v14);
  objc_msgSend_setAutoenablesDefaultLighting_(v10, v15, 1, v16);
  objc_msgSend_setAutoAdjustCamera_(v10, v17, 1, v18);
  if (a4) {
    objc_msgSend_setPointOfView_(v10, v19, (uint64_t)a4, v21);
  }
  objc_msgSend_flush(VFXTransaction, v19, v20, v21);

  return (id)objc_msgSend_snapshotWithSize_(v10, v22, v23, v24, width, height);
}

- (id)debugQuickLookObject
{
  return (id)objc_msgSend_debugQuickLookObjectWithPointOfView_(self, a2, 0, v2);
}

- (id)debugQuickLookObjectWithPointOfView:(id)a3
{
  return (id)((uint64_t (*)(VFXWorld *, char *, id))MEMORY[0x1F4181798])(self, sel_snapshotWithSize_pointOfView_, a3);
}

- (BOOL)writeToURLWithUSDKit:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_pathExtension(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_lowercaseString(v6, v7, v8, v9);
  if ((objc_msgSend_isEqualToString_(v10, v11, @"usd", v12) & 1) == 0
    && (objc_msgSend_isEqualToString_(v10, v13, @"usda", v15) & 1) == 0
    && (objc_msgSend_isEqualToString_(v10, v13, @"usdc", v15) & 1) == 0
    && !objc_msgSend_isEqualToString_(v10, v13, @"usdz", v15))
  {
    goto LABEL_16;
  }
  if (qword_1E9DDBB10 != -1) {
    dispatch_once(&qword_1E9DDBB10, &unk_1F0FB5F08);
  }
  if (byte_1E9DDBB18 == 1)
  {
    uint64_t v16 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v13, v14, v15);
    error = objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(v16, v17, 99, 1, a3, 1, 0);
    uint64_t PathComponent = objc_msgSend_lastPathComponent(a3, v19, v20, v21);
    uint64_t v25 = objc_msgSend_URLByAppendingPathComponent_(error, v23, PathComponent, v24);
    if (objc_msgSend_isEqualToString_(v10, v26, @"usdz", v27))
    {
      uint64_t v31 = objc_msgSend_URLByDeletingPathExtension(v25, v28, v29, v30);
      uint64_t v25 = objc_msgSend_URLByAppendingPathExtension_(v31, v32, @"usdc", v33);
    }
    objc_msgSend_flush(VFXTransaction, v28, v29, v30);
    long long v37 = objc_msgSend_URLByDeletingPathExtension(a3, v34, v35, v36);
    uint64_t v41 = (__CFString *)objc_msgSend_lastPathComponent(v37, v38, v39, v40);
    if (!v41 || (uint64_t v45 = v41, objc_msgSend_isEqualToString_(v41, v42, (uint64_t)&stru_1F0FCDBB0, v44))) {
      uint64_t v45 = @"root_node";
    }
    uint64_t v46 = objc_msgSend_path(error, v42, v43, v44);
    sub_1B65B4E5C((uint64_t)v110, (const char *)self, v45, (uint64_t)v25, v46);
    uint64_t v105 = (void *)sub_1B65B42A4((uint64_t)v110, (const char *)v25, v47, v48);
    uint64_t v52 = objc_msgSend_URLByDeletingLastPathComponent(a3, v49, v50, v51);
    uint64_t v56 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v53, v54, v55);
    int DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v56, v57, v52, 1, 0, 0);
    if (DirectoryAtURL_withIntermediateDirectories_attributes_error)
    {
      if (objc_msgSend_isEqualToString_(v10, v58, @"usdz", v59))
      {
        objc_msgSend_saveAndCreateUSDZPackageWithURL_(v105, v61, (uint64_t)a3, v63);
      }
      else
      {
        objc_msgSend_save(v105, v61, v62, v63);
        uint64_t v67 = objc_msgSend_path(a3, v64, v65, v66);
        if (objc_msgSend_fileExistsAtPath_(v56, v68, v67, v69)) {
          objc_msgSend_removeItemAtURL_error_(v56, v70, (uint64_t)a3, 0);
        }
        uint64_t v73 = objc_msgSend_URLByDeletingLastPathComponent(a3, v70, v71, v72);
        uint64_t v77 = objc_msgSend_path(v73, v74, v75, v76);
        uint64_t v81 = objc_msgSend_path(error, v78, v79, v80);
        uint64_t v84 = objc_msgSend_enumeratorAtPath_(v56, v82, v81, v83);
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v106, (uint64_t)v111, 16);
        if (v89)
        {
          uint64_t v90 = *(void *)v107;
          do
          {
            for (uint64_t i = 0; i != v89; ++i)
            {
              if (*(void *)v107 != v90) {
                objc_enumerationMutation(v84);
              }
              uint64_t v92 = *(void *)(*((void *)&v106 + 1) + 8 * i);
              uint64_t v93 = objc_msgSend_path(error, v86, v87, v88);
              uint64_t v96 = objc_msgSend_stringByAppendingPathComponent_(v93, v94, v92, v95);
              uint64_t v99 = objc_msgSend_stringByAppendingPathComponent_(v77, v97, v92, v98);
              if (objc_msgSend_fileExistsAtPath_(v56, v100, v99, v101)) {
                objc_msgSend_removeItemAtPath_error_(v56, v102, v99, 0);
              }
              objc_msgSend_moveItemAtPath_toPath_error_(v56, v102, v96, v99, 0);
            }
            uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v86, (uint64_t)&v106, (uint64_t)v111, 16);
          }
          while (v89);
        }
      }
    }

    objc_msgSend_removeItemAtURL_error_(v56, v103, (uint64_t)error, 0);
    sub_1B65C21B0((uint64_t)v110);
  }
  else
  {
LABEL_16:
    LOBYTE(DirectoryAtURL_withIntermediateDirectories_attributes_error) = 0;
  }
  return DirectoryAtURL_withIntermediateDirectories_attributes_error;
}

- (void)loadSCN:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v8 = objc_msgSend_sceneWithURL_options_error_(MEMORY[0x1E4F3B268], a2, (uint64_t)a3, (uint64_t)a4, a5);
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  objc_msgSend_begin(VFXTransaction, v10, v11, v12);
  objc_msgSend_setImmediateMode_(VFXTransaction, v13, 1, v14);
  uint64_t PathComponent = objc_msgSend_URLByDeletingLastPathComponent(a3, v15, v16, v17);
  objc_msgSend_setValue_forKey_(VFXTransaction, v19, PathComponent, @"VFXWorldDecodingCurrentEnclosingFolder");
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(a4, v20, @"VFXSceneKitBridgeOptionSkipLightIntensityRemapping", v21);
  unsigned int v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25);
  sub_1B65CF8A8(self, v8, Mutable, v26);
  objc_msgSend_commit(VFXTransaction, v27, v28, v29);

  CFRelease(Mutable);
}

+ (VFXWorld)worldWithSceneKitScene:(id)a3 options:(id)a4
{
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  objc_msgSend_begin(VFXTransaction, v8, v9, v10);
  objc_msgSend_setImmediateMode_(VFXTransaction, v11, 1, v12);
  id v13 = objc_alloc_init((Class)a1);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(a4, v14, @"VFXSceneKitBridgeOptionOriginalURL", v15);
  uint64_t PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v16, v17, v18, v19);
  objc_msgSend_setValue_forKey_(VFXTransaction, v21, PathComponent, @"VFXWorldDecodingCurrentEnclosingFolder");
  uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(a4, v22, @"VFXSceneKitBridgeOptionSkipLightIntensityRemapping", v23);
  unsigned int v28 = objc_msgSend_BOOLValue(v24, v25, v26, v27);
  sub_1B65CF8A8(v13, a3, Mutable, v28);
  objc_msgSend_commit(VFXTransaction, v29, v30, v31);
  CFRelease(Mutable);

  return (VFXWorld *)v13;
}

+ (VFXWorld)worldWithSCNURL:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v8 = (VFXWorld *)objc_msgSend_world(VFXWorld, a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_loadSCN_options_error_(v8, v9, (uint64_t)a3, (uint64_t)a4, a5);
  return v8;
}

- (id)_exportAsMovieOperationWithDestinationURL:(id)a3 size:(CGSize)a4 attributes:(id)a5 delegate:(id)a6 didEndSelector:(SEL)a7 userInfo:(void *)a8
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v16 = objc_msgSend_rendererWithDevice_options_(VFXRenderer, a2, 0, 0);
  objc_msgSend_setWorld_(v16, v17, (uint64_t)self, v18);
  uint64_t v19 = [VFXMovieExportOperation alloc];
  id v21 = (id)objc_msgSend_initWithRenderer_size_attributes_outputURL_(v19, v20, (uint64_t)v16, (uint64_t)a5, a3, width, height);
  objc_msgSend_setDelegate_(v21, v22, (uint64_t)a6, v23);
  objc_msgSend_setUserInfo_(v21, v24, (uint64_t)a8, v25);
  objc_msgSend_setDidEndSelector_(v21, v26, (uint64_t)a7, v27);
  return v21;
}

- (id)exportAsMovieOperationWithDestinationURL:(id)a3 size:(CGSize)a4 attributes:(id)a5 delegate:(id)a6 didEndSelector:(SEL)a7 userInfo:(void *)a8
{
  return (id)MEMORY[0x1F4181798](self, sel__exportAsMovieOperationWithDestinationURL_size_attributes_delegate_didEndSelector_userInfo_, a3, a5);
}

- (BOOL)migrateCoreEntityManagerWithInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  VFXWorld.migrateCoreEntityManager(info:)((NSMutableDictionary)v6);

  if (v8)
  {
    if (a4)
    {
      uint64_t v9 = (void *)sub_1B6E30D68();

      id v10 = v9;
      *a4 = v9;
    }
    else
    {
    }
  }
  return v8 == 0;
}

- (BOOL)initializeCoreEntityManagerWithInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = self;
  VFXWorld.initializeCoreEntityManager(info:)((NSMutableDictionary)v5);

  return 1;
}

- (NSArray)bridgedComponentNames
{
  uint64_t v2 = (void *)sub_1B6E31C18();

  return (NSArray *)v2;
}

@end