@interface PXStoryMomentRecipeProvider
- ($7F31FC32F9D1B293069C8DA058A10F41)_nextEmptySpaceBreakTransitionForMotion:(SEL)a3;
- (BOOL)_isSongEnergetic;
- (PXStoryMomentRecipeProvider)init;
- (PXStoryMomentRecipeProvider)initWithConfiguration:(id)a3 colorGradeCategory:(id)a4 songPace:(int64_t)a5 randomNumberGenerator:(id)a6;
- (_NSRange)_rangeOfLength:(int64_t)a3 centeredOnIndex:(int64_t)a4 withinRange:(_NSRange)a5;
- (id)_nextBaseMomentRecipeWithPreviousClip:(id)a3;
- (id)_nextModuleRecipeWithModuleClipRange:(_NSRange)a3 clipCatalog:(id)a4;
- (id)_nextNUpRevealRecipeWithPreviousClip:(id)a3;
- (id)_nextSingleAssetRecipeWithPreviousClip:(id)a3;
- (id)_recipeFromRecipeType:(unint64_t)a3 previousClip:(id)a4;
- (int64_t)_incomingTransitionKindForRecipe:(unint64_t)a3;
- (int64_t)_innerTransitionKindForRecipe:(unint64_t)a3;
- (int64_t)_motionStyleForRecipe:(unint64_t)a3;
- (void)provideDebugInfoForClip:(unint64_t)a3 usingBlock:(id)a4;
- (void)provideRecipeForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 usingBlock:(id)a5;
@end

@implementation PXStoryMomentRecipeProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipDebugInfos, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
}

- (void)provideDebugInfoForClip:(unint64_t)a3 usingBlock:(id)a4
{
  v12 = (void (**)(id, void *))a4;
  clipDebugInfos = self->_clipDebugInfos;
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [(NSMutableDictionary *)clipDebugInfos objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = self->_clipDebugInfos;
    v10 = [NSNumber numberWithUnsignedInteger:a3];
    v11 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v10];
    v12[2](v12, v11);
  }
}

- (void)provideRecipeForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 usingBlock:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v155[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v123 = a5;
  if (!length)
  {
    v117 = [MEMORY[0x1E4F28B00] currentHandler];
    [v117 handleFailureInMethod:a2, self, @"PXStoryMomentRecipeProvider.m", 460, @"Invalid parameter not satisfying: %@", @"momentClipRange.length > 0" object file lineNumber description];
  }
  v10 = [v9 clipAtIndex:location];
  if (location)
  {
    v120 = [v9 clipAtIndex:location - 1];
  }
  else
  {
    v120 = 0;
  }
  NSUInteger v144 = location - 1 + length;
  id v124 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v121 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v11 = objc_opt_new();
  v125 = v9;
  NSUInteger v134 = location;
  if (length == 1
    && ([v10 displayAssets],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 count],
        v12,
        v13 == 1))
  {
    v14 = [NSNumber numberWithUnsignedInteger:1];
    addToPapertrail(v11, (uint64_t)"@(momentClipRange.length)", v14, 476);

    v15 = NSNumber;
    v16 = [v10 displayAssets];
    v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    addToPapertrail(v11, (uint64_t)"@(firstClip.displayAssets.count)", v17, 476);

    v18 = [(PXStoryMomentRecipeProvider *)self _nextSingleAssetRecipeWithPreviousClip:v120];
    BOOL v133 = 0;
  }
  else
  {
    if (location)
    {
      v19 = [v9 clipAtIndex:location - 1];
      v20 = [v19 displayAssets];
      BOOL v21 = [v20 count] == 2;
    }
    else
    {
      BOOL v21 = 0;
    }
    v22 = [v10 displayAssets];
    uint64_t v23 = [v22 count];

    BOOL v133 = 0;
    if (v21 && v23 == 1)
    {
      v24 = [v10 displayAssets];
      [v24 objectAtIndexedSubscript:0];
      v26 = v25 = v10;
      BOOL v133 = +[PXStoryRecipeClipUtilities assetHasHighCurationScore:v26];

      v10 = v25;
      NSUInteger location = v134;
    }
    v27 = [NSNumber numberWithBool:location != 0];
    addToPapertrail(v11, (uint64_t)"@(previousIsValid)", v27, 484);

    v28 = [NSNumber numberWithBool:v21];
    addToPapertrail(v11, (uint64_t)"@(previousIs2Up)", v28, 484);

    v29 = [NSNumber numberWithBool:v23 == 1];
    addToPapertrail(v11, (uint64_t)"@(firstIs1Up)", v29, 484);

    v30 = NSNumber;
    v31 = [v10 displayAssets];
    v32 = [v31 objectAtIndexedSubscript:0];
    v33 = objc_msgSend(v30, "numberWithBool:", +[PXStoryRecipeClipUtilities assetHasHighCurationScore:](PXStoryRecipeClipUtilities, "assetHasHighCurationScore:", v32));
    addToPapertrail(v11, (uint64_t)"@([PXStoryRecipeClipUtilities assetHasHighCurationScore:firstClip.displayAssets[0]])", v33, 484);

    if (v133) {
      [(PXStoryMomentRecipeProvider *)self _nextNUpRevealRecipeWithPreviousClip:v120];
    }
    else {
    v18 = [(PXStoryMomentRecipeProvider *)self _nextBaseMomentRecipeWithPreviousClip:v120];
    }
    NSUInteger location = v134;
    if (v134 <= v144)
    {
      NSUInteger v34 = v134;
      do
      {
        v35 = [v9 clipAtIndex:v34];
        [v35 moduleInfo];
        if ((v36 & 0x100) != 0)
        {
          int64_t v37 = [(PXStoryMomentRecipeState *)self->_state nextEmptySpaceStrategy];
          switch(v37)
          {
            case 1:
              [v121 addIndex:v34];
              break;
            case 2:
              uint64_t v38 = -[PXStoryMomentRecipeProvider _rangeOfLength:centeredOnIndex:withinRange:](self, "_rangeOfLength:centeredOnIndex:withinRange:", length / 3 + 1, v34, v134, length);
              objc_msgSend(v124, "addIndexesInRange:", v38, v39);
              break;
            case 0:
              v118 = [MEMORY[0x1E4F28B00] currentHandler];
              [v118 handleFailureInMethod:a2 object:self file:@"PXStoryMomentRecipeProvider.m" lineNumber:510 description:@"Undefined empty space strategy"];

              abort();
          }
        }

        ++v34;
      }
      while (v34 <= v144);
    }
  }
  addToPapertrail(v11, (uint64_t)"baseMomentRecipe", v18, 516);
  v122 = (void *)[v11 copy];
  if (location <= v144)
  {
    v119 = v10;
    v140 = 0;
    v126 = v18;
    v127 = 0;
    NSUInteger v40 = location;
    while (1)
    {
      v41 = v11;
      v11 = (void *)[v122 mutableCopy];

      v42 = (void *)MEMORY[0x1E4F28E78];
      unint64_t v43 = [(__CFString *)v18 recipeType];
      v44 = @"??";
      if (v43 <= 8) {
        v44 = off_1E5DB4FB0[v43];
      }
      v45 = v44;
      uint64_t v46 = [v42 stringWithFormat:@"Base recipe: %@\n", v45];

      unint64_t v47 = [v9 numberOfClips];
      v129 = (void *)v46;
      if (v40)
      {
        v48 = [v9 clipAtIndex:v40 - 1];
      }
      else
      {
        v48 = 0;
      }
      unint64_t v49 = v40 + 1;
      v50 = [v9 clipAtIndex:v40];
      if (v40 + 1 >= v47)
      {
        v51 = 0;
      }
      else
      {
        v51 = [v9 clipAtIndex:v40 + 1];
      }
      NSUInteger v143 = v40;
      if (v40)
      {
        v52 = [v48 displayAssets];
        BOOL v139 = (unint64_t)[v52 count] > 1;
      }
      else
      {
        BOOL v139 = 0;
      }
      v53 = [v50 displayAssets];
      unint64_t v54 = [v53 count];

      v142 = v48;
      if (v49 >= v47)
      {
        BOOL v56 = 0;
      }
      else
      {
        v55 = [v51 displayAssets];
        BOOL v56 = (unint64_t)[v55 count] > 1;
      }
      unint64_t v131 = v54;
      BOOL v141 = v54 > 1;
      unint64_t v137 = v49;
      BOOL v57 = v49 < v47;
      unint64_t v58 = [v50 moduleInfo];
      [v50 moduleInfo];
      char v138 = v59;
      BOOL v61 = (v59 & 1) == 0 && v58 != 0;
      BOOL v128 = v61;
      v62 = [NSNumber numberWithUnsignedInteger:v134];
      addToPapertrail(v11, (uint64_t)"@(firstIndex)", v62, 544);

      v63 = [NSNumber numberWithUnsignedInteger:v143];
      addToPapertrail(v11, (uint64_t)"@(idx)", v63, 544);

      v64 = [NSNumber numberWithUnsignedInteger:v144];
      addToPapertrail(v11, (uint64_t)"@(lastIndex)", v64, 544);

      v65 = [NSNumber numberWithBool:v143 != 0];
      addToPapertrail(v11, (uint64_t)"@(previousIsValid)", v65, 545);

      unint64_t v66 = v58;
      v67 = [NSNumber numberWithBool:v57];
      addToPapertrail(v11, (uint64_t)"@(nextIsValid)", v67, 545);

      addToPapertrail(v11, (uint64_t)"previousClip", v142, 546);
      v136 = v50;
      addToPapertrail(v11, (uint64_t)"currentClip", v50, 546);
      addToPapertrail(v11, (uint64_t)"nextClip", v51, 546);
      v68 = [NSNumber numberWithBool:v139];
      addToPapertrail(v11, (uint64_t)"@(previousIsNUp)", v68, 547);

      v69 = [NSNumber numberWithBool:v141];
      addToPapertrail(v11, (uint64_t)"@(currentIsNUp)", v69, 547);

      v70 = [NSNumber numberWithBool:v56];
      addToPapertrail(v11, (uint64_t)"@(nextIsNUp)", v70, 547);

      v71 = [NSNumber numberWithBool:v133];
      addToPapertrail(v11, (uint64_t)"@(useRevealRecipe)", v71, 547);

      v72 = @"??";
      if (v58 <= 3) {
        v72 = off_1E5DB4F20[v58];
      }
      v140 = v129;
      v73 = v72;
      addToPapertrail(v11, (uint64_t)"PXStoryAutoEditModuleTypeName(moduleType)", v73, 548);

      BOOL v74 = v143 == v134 && v133;
      v75 = [NSNumber numberWithBool:v143 == v134];
      addToPapertrail(v11, (uint64_t)"@(isFirstClipOfMoment)", v75, 548);

      v76 = [NSNumber numberWithBool:v138 & 1];
      addToPapertrail(v11, (uint64_t)"@(isStartOfModule)", v76, 548);

      v77 = [NSNumber numberWithBool:v128];
      addToPapertrail(v11, (uint64_t)"@(isMidModule)", v77, 548);

      long long v152 = 0u;
      long long v153 = 0u;
      BOOL v130 = v74;
      v132 = v51;
      if (v74)
      {
        v78 = v126;

        if (v126)
        {
          [(__CFString *)v78 incomingTransition];
          long long v152 = *(_OWORD *)buf;
          long long v153 = v151;
          [(__CFString *)v78 motion];
          uint64_t v80 = *(void *)buf;
          uint64_t v79 = *(void *)&buf[8];
          uint64_t v81 = v151;
        }
        else
        {
          uint64_t v81 = 0;
          uint64_t v79 = 0;
          uint64_t v80 = 0;
          long long v152 = 0u;
          long long v153 = 0u;
        }
        v85 = v140;
        v86 = v78;
      }
      else
      {
        if (v138)
        {
          NSUInteger v82 = v137;
          if (v137 <= v144)
          {
            NSUInteger v82 = v137;
            while (1)
            {
              v83 = [v125 clipAtIndex:v82];
              [v83 moduleInfo];
              if ((v84 & 1) != 0 || [v83 moduleInfo] != v58) {
                break;
              }
              ++v82;

              if (v82 > v144) {
                goto LABEL_77;
              }
            }
          }
LABEL_77:
          NSUInteger v90 = v82 - v143;
          v91 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v143, v90);
          addToPapertrail(v11, (uint64_t)"[NSValue valueWithRange:moduleClipRange]", v91, 570);

          -[PXStoryMomentRecipeProvider _nextModuleRecipeWithModuleClipRange:clipCatalog:](self, "_nextModuleRecipeWithModuleClipRange:clipCatalog:", v143, v90, v125);
          v78 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v78)
          {
            [(__CFString *)v78 incomingTransition];
            long long v152 = *(_OWORD *)buf;
            long long v153 = v151;
            [(__CFString *)v78 motion];
            uint64_t v80 = *(void *)buf;
            uint64_t v79 = *(void *)&buf[8];
            uint64_t v81 = v151;
          }
          else
          {
            uint64_t v81 = 0;
            uint64_t v79 = 0;
            uint64_t v80 = 0;
            long long v152 = 0u;
            long long v153 = 0u;
          }
          v85 = v140;
          unint64_t v92 = [(__CFString *)v78 recipeType];
          v93 = @"??";
          if (v92 <= 8) {
            v93 = off_1E5DB4FB0[v92];
          }
          v89 = v93;
          [v140 appendFormat:@"Starting module %@\n", v89];
          goto LABEL_83;
        }
        if (v58)
        {
          v85 = v140;
          if (v127)
          {
            [(__CFString *)v127 innerTransition];
            long long v152 = *(_OWORD *)buf;
            long long v153 = v151;
            [(__CFString *)v127 motion];
            uint64_t v80 = *(void *)buf;
            uint64_t v79 = *(void *)&buf[8];
            uint64_t v81 = v151;
          }
          else
          {
            uint64_t v81 = 0;
            uint64_t v79 = 0;
            uint64_t v80 = 0;
            long long v152 = 0uLL;
            long long v153 = 0uLL;
          }
          unint64_t v95 = [(__CFString *)v127 recipeType];
          v96 = @"??";
          if (v95 <= 8) {
            v96 = off_1E5DB4FB0[v95];
          }
          v78 = v96;
          [v140 appendFormat:@"Mid-module %@\n", v78];
          BOOL v94 = v139;
          goto LABEL_91;
        }
        v85 = v140;
        if (v143 != v134)
        {
          if (v126)
          {
            [(__CFString *)v126 motion];
            uint64_t v80 = *(void *)buf;
            uint64_t v79 = *(void *)&buf[8];
            uint64_t v81 = v151;
            if (![v121 containsIndex:v143])
            {
              [(__CFString *)v126 innerTransition];
              goto LABEL_128;
            }
LABEL_126:
            v78 = v127;
            BOOL v94 = v139;
            *(void *)buf = v80;
            *(void *)&buf[8] = v79;
            *(void *)&long long v151 = v81;
            [(PXStoryMomentRecipeProvider *)self _nextEmptySpaceBreakTransitionForMotion:buf];
            v115 = v140;
            v116 = @"Transition to break up empty space, motion from base\n";
          }
          else
          {
            if ([v121 containsIndex:v143])
            {
              uint64_t v80 = 0;
              uint64_t v79 = 0;
              uint64_t v81 = 0;
              goto LABEL_126;
            }
            uint64_t v81 = 0;
            uint64_t v79 = 0;
            uint64_t v80 = 0;
            *(_OWORD *)buf = 0u;
            long long v151 = 0u;
LABEL_128:
            v78 = v127;
            BOOL v94 = v139;
            long long v152 = *(_OWORD *)buf;
            long long v153 = v151;
            v115 = v140;
            v116 = @"Transition and motion from base\n";
          }
          [v115 appendString:v116];
          goto LABEL_84;
        }
        if (v126)
        {
          [(__CFString *)v126 incomingTransition];
          long long v152 = *(_OWORD *)buf;
          long long v153 = v151;
          [(__CFString *)v126 motion];
          uint64_t v80 = *(void *)buf;
          uint64_t v79 = *(void *)&buf[8];
          v86 = v126;
          uint64_t v81 = v151;
        }
        else
        {
          uint64_t v81 = 0;
          v86 = 0;
          uint64_t v79 = 0;
          uint64_t v80 = 0;
          long long v152 = 0uLL;
          long long v153 = 0uLL;
        }
        v78 = v127;
      }
      unint64_t v87 = [(__CFString *)v86 recipeType];
      v88 = @"??";
      if (v87 <= 8) {
        v88 = off_1E5DB4FB0[v87];
      }
      v89 = v88;
      [v85 appendFormat:@"Transition and motion from base, first %@\n", v89];
LABEL_83:

      BOOL v94 = v139;
LABEL_84:
      if (v138 & 1 | v66)
      {
        v127 = v78;
        goto LABEL_92;
      }
      v127 = 0;
LABEL_91:

LABEL_92:
      uint64_t v97 = v94;
      if (v131 > 1) {
        uint64_t v97 = v94 + 1;
      }
      uint64_t v98 = v97 + v56;
      v99 = [NSNumber numberWithInteger:v98];
      addToPapertrail(v11, (uint64_t)"@(numNUps)", v99, 603);

      id v9 = v125;
      if (v131 < 2)
      {
        if (v94 && !v130)
        {
          if (v80 == 1)
          {
            uint64_t v102 = v79;
            if (!v79) {
              goto LABEL_110;
            }
LABEL_100:
            if (v102 != 4 && v102 != 1)
            {
              __int16 v103 = 514;
LABEL_116:
              *((void *)&v153 + 1) = 0;
              *(void *)((char *)&v153 + 2) = 0;
              long long v152 = 8uLL;
              LOWORD(v153) = v103;
              [v85 appendString:@"Overriding transition with wipe because of nearby N-up\n"];
              goto LABEL_117;
            }
          }
          else
          {
            if (!v142)
            {
              uint64_t v147 = 0;
              uint64_t v148 = 0;
              __int16 v103 = 258;
              uint64_t v149 = 0;
              goto LABEL_116;
            }
            [v142 motionInfo];
            if (v147 == 1)
            {
              [v142 motionInfo];
              uint64_t v102 = v146;
              if (!v146) {
LABEL_110:
              }
                PXAssertGetLog();
              goto LABEL_100;
            }
          }
          __int16 v103 = 258;
          goto LABEL_116;
        }
      }
      else
      {
        if (v98 == 1)
        {
          state = self->_state;
          v101 = [v136 displayAssets];
          uint64_t v81 = -[PXStoryMomentRecipeState nextNUpPanRelativeMotionWithN:](state, "nextNUpPanRelativeMotionWithN:", [v101 count]);
        }
        else
        {
          uint64_t v81 = 2;
        }
        [v85 appendString:@"Overriding motion for this N-up\n"];
        if (!v130)
        {
          __int16 v103 = 514;
          uint64_t v79 = 2;
          uint64_t v80 = 1;
          goto LABEL_116;
        }
        uint64_t v79 = 2;
        uint64_t v80 = 1;
      }
LABEL_117:
      if ([v124 containsIndex:v143]) {
        uint64_t v104 = 2;
      }
      else {
        uint64_t v104 = 0;
      }
      *(void *)buf = v80;
      *(void *)&buf[8] = v79;
      *(void *)&long long v151 = v81;
      v105 = PXStoryAutoEditClipMotionInfoDescription((long long *)buf);
      addToPapertrail(v11, (uint64_t)"PXStoryAutoEditClipMotionInfoDescription(motionInfo)", v105, 651);

      *(_OWORD *)buf = v152;
      long long v151 = v153;
      v106 = PXStoryAutoEditClipTransitionInfoDescription((uint64_t)buf);
      addToPapertrail(v11, (uint64_t)"PXStoryAutoEditClipTransitionInfoDescription(transitionInfo)", v106, 651);

      *(_OWORD *)buf = v152;
      long long v151 = v153;
      v107 = PXStoryAutoEditClipTransitionInfoDescription((uint64_t)buf);
      *(void *)buf = v80;
      *(void *)&buf[8] = v79;
      *(void *)&long long v151 = v81;
      v108 = PXStoryAutoEditClipMotionInfoDescription((long long *)buf);
      [v85 appendFormat:@"Requested Incoming Transition: %@\nRequested Motion: %@\n", v107, v108];

      addToPapertrail(v11, (uint64_t)"momentRecipeChoices", v85, 653);
      v154[0] = @"Moment Recipe Choices";
      v109 = (void *)[v85 copy];
      v154[1] = @"Papertrail";
      v155[0] = v109;
      v110 = (void *)[v11 copy];
      v155[1] = v110;
      v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v155 forKeys:v154 count:2];

      clipDebugInfos = self->_clipDebugInfos;
      v113 = [NSNumber numberWithUnsignedInteger:v143];
      [(NSMutableDictionary *)clipDebugInfos setObject:v111 forKeyedSubscript:v113];

      v114 = (void (*)(void *, void *, uint8_t *, uint64_t, NSUInteger))v123[2];
      v145[0] = v80;
      v145[1] = v79;
      v145[2] = v81;
      *(_OWORD *)buf = v152;
      long long v151 = v153;
      v114(v123, v145, buf, v104, v143);

      NSUInteger v40 = v137;
      v18 = v126;
      if (v137 > v144)
      {

        v10 = v119;
        break;
      }
    }
  }
}

- (_NSRange)_rangeOfLength:(int64_t)a3 centeredOnIndex:(int64_t)a4 withinRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  int64_t location = a5.location;
  if (a4 < a5.location || a4 - a5.location >= a5.length)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXStoryMomentRecipeProvider.m", 412, @"Invalid parameter not satisfying: %@", @"NSLocationInRange(centerIdx, range)" object file lineNumber description];
  }
  int64_t v11 = location + length;
  if (a3 >= 0) {
    int64_t v12 = a3;
  }
  else {
    int64_t v12 = a3 + 1;
  }
  int64_t v13 = a4 - (v12 >> 1);
  if (v13 <= location) {
    NSUInteger v14 = location;
  }
  else {
    NSUInteger v14 = v13;
  }
  if (v13 + a3 < v11) {
    int64_t v11 = v13 + a3;
  }
  NSUInteger v15 = v11 - v14;
  result.NSUInteger length = v15;
  result.int64_t location = v14;
  return result;
}

- ($7F31FC32F9D1B293069C8DA058A10F41)_nextEmptySpaceBreakTransitionForMotion:(SEL)a3
{
  _NSRange result = ($7F31FC32F9D1B293069C8DA058A10F41 *)[(PXStoryMomentRecipeProvider *)self _isSongEnergetic];
  if (result)
  {
    switch(a4->var0)
    {
      case 0:
      case 1:
        $84AEFE31E1BF12A743E9A5C7022F1118 var1 = a4->var1;
        *(_OWORD *)&retstr->unint64_t var0 = xmmword_1AB338B30;
        retstr->var2 = ($3913CBCB8C27C6162DFA06D9B9422DBB)var1;
        return result;
      case 2:
        unint64_t var0 = a4->var1.var0.var0;
        int64_t v12 = 6;
        goto LABEL_9;
      case 3:
        unint64_t var0 = a4->var1.var0.var0;
        int64_t v12 = 7;
LABEL_9:
        retstr->unint64_t var0 = v12;
        retstr->$84AEFE31E1BF12A743E9A5C7022F1118 var1 = 0.0;
        retstr->var2.var0.unint64_t var0 = var0;
        retstr->var2.var0.$84AEFE31E1BF12A743E9A5C7022F1118 var1 = 0;
        return result;
      case 4:
        int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a3 object:self file:@"PXStoryMomentRecipeProvider.m" lineNumber:399 description:@"Invalid motion style"];

        abort();
      default:
        int64_t v10 = 0;
        goto LABEL_5;
    }
  }
  int64_t v10 = 2;
LABEL_5:
  retstr->unint64_t var0 = v10;
  retstr->$84AEFE31E1BF12A743E9A5C7022F1118 var1 = 0.0;
  retstr->var2.var0.unint64_t var0 = 0;
  retstr->var2.var0.$84AEFE31E1BF12A743E9A5C7022F1118 var1 = 0;
  return result;
}

- (id)_nextSingleAssetRecipeWithPreviousClip:(id)a3
{
  state = self->_state;
  id v5 = a3;
  v6 = [(PXStoryMomentRecipeProvider *)self _recipeFromRecipeType:[(PXStoryMomentRecipeState *)state nextSingleAssetMomentRecipe] previousClip:v5];

  return v6;
}

- (id)_nextModuleRecipeWithModuleClipRange:(_NSRange)a3 clipCatalog:(id)a4
{
  NSUInteger length = a3.length;
  int64_t location = (char *)a3.location;
  id v7 = a4;
  unint64_t v8 = -[PXStoryMomentRecipeState _nextModuleRecipeWithModuleClipRange:clipCatalog:](self->_state, "_nextModuleRecipeWithModuleClipRange:clipCatalog:", location, length, v7);
  if (location)
  {
    int64_t location = [v7 clipAtIndex:location - 1];
  }
  id v9 = [(PXStoryMomentRecipeProvider *)self _recipeFromRecipeType:v8 previousClip:location];

  return v9;
}

- (id)_nextNUpRevealRecipeWithPreviousClip:(id)a3
{
  return [(PXStoryMomentRecipeProvider *)self _recipeFromRecipeType:5 previousClip:a3];
}

- (id)_nextBaseMomentRecipeWithPreviousClip:(id)a3
{
  state = self->_state;
  id v5 = a3;
  v6 = [(PXStoryMomentRecipeProvider *)self _recipeFromRecipeType:[(PXStoryMomentRecipeState *)state nextBaseMomentRecipe] previousClip:v5];

  return v6;
}

- (id)_recipeFromRecipeType:(unint64_t)a3 previousClip:(id)a4
{
  id v7 = a4;
  int64_t v8 = [(PXStoryMomentRecipeProvider *)self _incomingTransitionKindForRecipe:a3];
  int64_t v9 = [(PXStoryMomentRecipeProvider *)self _innerTransitionKindForRecipe:a3];
  int64_t v10 = [(PXStoryMomentRecipeProvider *)self _motionStyleForRecipe:a3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PXStoryMomentRecipeProvider__recipeFromRecipeType_previousClip___block_invoke;
  aBlock[3] = &unk_1E5DB3760;
  id v11 = v7;
  id v29 = v11;
  v30 = self;
  int64_t v12 = _Block_copy(aBlock);
  v24 = v12;
  switch(a3)
  {
    case 0uLL:
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v12);
      [v23 handleFailureInMethod:a2 object:self file:@"PXStoryMomentRecipeProvider.m" lineNumber:319 description:@"Undefined moment recipe type"];

      abort();
    case 1uLL:
    case 6uLL:
    case 7uLL:
      uint64_t v13 = (*((uint64_t (**)(void *))v12 + 2))(v12);
      goto LABEL_8;
    case 2uLL:
      unint64_t v16 = [(PXStoryMomentRecipeState *)self->_state nextRotateDirection];
      unsigned __int16 v15 = 0;
      goto LABEL_6;
    case 3uLL:
    case 8uLL:
      unint64_t v14 = [(PXStoryMomentRecipeState *)self->_state nextPanDirection];
      unsigned __int16 v15 = 0;
      unint64_t v16 = 0;
      uint64_t v17 = 0;
      goto LABEL_10;
    case 4uLL:
      uint64_t v13 = [(PXStoryMomentRecipeState *)self->_state nextScaleDirection];
LABEL_8:
      uint64_t v17 = v13;
      unsigned __int16 v15 = 0;
      unint64_t v16 = 0;
      goto LABEL_9;
    case 5uLL:
      unint64_t v16 = 0;
      unint64_t v14 = 0;
      uint64_t v17 = 1;
      unsigned __int16 v15 = 1;
      goto LABEL_10;
    default:
      unsigned __int16 v15 = 0;
      unint64_t v16 = 0;
LABEL_6:
      uint64_t v17 = 0;
LABEL_9:
      unint64_t v14 = 0;
LABEL_10:
      switch(v8)
      {
        case 5:
          unint64_t v18 = v14 & 0xFFFFFFFFFFFF0000;
          unsigned __int16 v19 = v14;
          break;
        case 6:
          unint64_t v18 = v17 & 0xFFFFFFFFFFFF0000;
          unsigned __int16 v19 = v17;
          break;
        case 7:
          unint64_t v18 = v16 & 0xFFFFFFFFFFFF0000;
          unsigned __int16 v19 = v16;
          break;
        case 8:
          unint64_t v18 = 0;
          unsigned __int16 v19 = v15;
          break;
        default:
          unsigned __int16 v19 = 0;
          unint64_t v18 = 0;
          break;
      }
      switch(v9)
      {
        case 5:
          unint64_t v20 = v14 & 0xFFFFFFFFFFFF0000;
          unsigned __int16 v15 = v14;
          break;
        case 6:
          unint64_t v20 = v17 & 0xFFFFFFFFFFFF0000;
          unsigned __int16 v15 = v17;
          break;
        case 7:
          unint64_t v20 = v16 & 0xFFFFFFFFFFFF0000;
          unsigned __int16 v15 = v16;
          break;
        case 8:
          goto LABEL_19;
        default:
          unsigned __int16 v15 = 0;
LABEL_19:
          unint64_t v20 = 0;
          break;
      }
      if (v10 == 3)
      {
        uint64_t v17 = v16;
      }
      else if (v10 != 2)
      {
        if (v10 == 1) {
          uint64_t v17 = v14;
        }
        else {
          uint64_t v17 = 0;
        }
      }
      v27[0] = v8;
      v27[1] = 0;
      v27[2] = v18 | v19;
      v27[3] = 0;
      v26[0] = v9;
      v26[1] = 0;
      v26[2] = v20 | v15;
      v26[3] = 0;
      v25[0] = v10;
      v25[1] = v17;
      v25[2] = 0;
      BOOL v21 = [[PXStoryAutoEditMomentRecipe alloc] initWithRecipeType:a3 incomingTransition:v27 innerTransition:v26 motion:v25];

      return v21;
  }
}

void *__66__PXStoryMomentRecipeProvider__recipeFromRecipeType_previousClip___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2) {
    return (void *)[*(id *)(*(void *)(a1 + 40) + 32) nextScaleDirection];
  }
  [v2 motionInfo];
  if (v5 != 2) {
    return (void *)[*(id *)(*(void *)(a1 + 40) + 32) nextScaleDirection];
  }
  _NSRange result = *(void **)(a1 + 32);
  if (result)
  {
    [result motionInfo];
    return (void *)v4;
  }
  return result;
}

- (int64_t)_motionStyleForRecipe:(unint64_t)a3
{
  if (a3 >= 9)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXStoryMomentRecipeProvider.m" lineNumber:292 description:@"Unhandled case"];

    abort();
  }
  return qword_1AB35AA20[a3];
}

- (int64_t)_innerTransitionKindForRecipe:(unint64_t)a3
{
  if (a3 == 6) {
    return 6;
  }
  else {
    return 1;
  }
}

- (int64_t)_incomingTransitionKindForRecipe:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      return a3;
    case 1uLL:
    case 6uLL:
      a3 = 6;
      break;
    case 2uLL:
      a3 = 7;
      break;
    case 3uLL:
      a3 = 5;
      break;
    case 4uLL:
    case 7uLL:
    case 8uLL:
      if ([(PXStoryMomentRecipeProvider *)self _isSongEnergetic]) {
        a3 = 4;
      }
      else {
        a3 = 3;
      }
      break;
    case 5uLL:
      a3 = 8;
      break;
    default:
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"PXStoryMomentRecipeProvider.m" lineNumber:259 description:@"Unhandled case"];

      abort();
  }
  return a3;
}

- (BOOL)_isSongEnergetic
{
  int64_t songPace = self->_songPace;
  if (songPace == 3)
  {
    LOBYTE(colorGradeCategory) = 1;
  }
  else if (songPace == 1)
  {
    LOBYTE(colorGradeCategory) = 0;
  }
  else
  {
    colorGradeCategory = self->_colorGradeCategory;
    if (colorGradeCategory)
    {
      PFStoryColorGradeCategoryGetArousal();
      LOBYTE(colorGradeCategory) = v4 > 0.5;
    }
  }
  return (char)colorGradeCategory;
}

- (PXStoryMomentRecipeProvider)initWithConfiguration:(id)a3 colorGradeCategory:(id)a4 songPace:(int64_t)a5 randomNumberGenerator:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryMomentRecipeProvider;
  unint64_t v14 = [(PXStoryMomentRecipeProvider *)&v21 init];
  unsigned __int16 v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_configuration, a3);
    v15->_int64_t songPace = a5;
    objc_storeStrong((id *)&v15->_colorGradeCategory, a4);
    unint64_t v16 = [[PXStoryMomentRecipeState alloc] initWithRandomNumberGenerator:v13];
    state = v15->_state;
    v15->_state = v16;

    uint64_t v18 = objc_opt_new();
    clipDebugInfos = v15->_clipDebugInfos;
    v15->_clipDebugInfos = (NSMutableDictionary *)v18;
  }
  return v15;
}

- (PXStoryMomentRecipeProvider)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMomentRecipeProvider.m", 193, @"%s is not available as initializer", "-[PXStoryMomentRecipeProvider init]");

  abort();
}

@end