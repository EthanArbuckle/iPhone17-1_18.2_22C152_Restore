@interface TSDMagicMoveTextureZOrderer
- (NSArray)flattenableAnimationMatches;
- (TSDMagicMoveTextureZOrderer)init;
- (TSDMagicMoveTextureZOrderer)initWithAnimationMatches:(id)a3;
- (id)p_debugDescription;
- (id)p_newArrayBySortingMatches:(id)a3 withInterpolatedPercent:(double)a4;
- (id)texturedRectanglesAtPercent:(double)a3;
- (unint64_t)p_bestZIndexForUnassignedMatch:(id)a3 inMatchArray:(id)a4;
- (unint64_t)p_zIntersectionsBetweenZOrdererMatches:(id)a3;
- (unint64_t)zOrderIntersectionsCount;
- (void)dealloc;
- (void)p_addFlattenableAnimationMatches:(id)a3 toArray:(id)a4;
- (void)p_addVisibleTexturesFromMatches:(id)a3 toArray:(id)a4 interpolatedPercent:(double)a5;
- (void)p_adjustZOrdererMatchesZIndexByTextureType:(id)a3;
- (void)p_calculateTextureArraysFromIntersections;
- (void)p_setupZOrderMatchesWithAnimationMatches:(id)a3;
@end

@implementation TSDMagicMoveTextureZOrderer

- (TSDMagicMoveTextureZOrderer)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrderer init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1113, @"Do not call method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[TSDMagicMoveTextureZOrderer init]"), 0 reason userInfo]);
}

- (TSDMagicMoveTextureZOrderer)initWithAnimationMatches:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSDMagicMoveTextureZOrderer;
  v4 = [(TSDMagicMoveTextureZOrderer *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(TSDMagicMoveTextureZOrderer *)v4 p_setupZOrderMatchesWithAnimationMatches:a3];
    [(TSDMagicMoveTextureZOrderer *)v5 p_calculateTextureArraysFromIntersections];
  }
  return v5;
}

- (void)dealloc
{
  free(self->_percentTexturesTimes);
  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveTextureZOrderer;
  [(TSDMagicMoveTextureZOrderer *)&v3 dealloc];
}

- (id)texturedRectanglesAtPercent:(double)a3
{
  if (a3 == 0.0) {
    return self->_outgoingTexturesInZOrder;
  }
  if (a3 == 1.0) {
    return self->_incomingTexturesInZOrder;
  }
  NSUInteger v6 = [(NSArray *)self->_percentTextures count];
  if (v6 && (percentTexturesTimes = self->_percentTexturesTimes, *percentTexturesTimes <= a3))
  {
    uint64_t v8 = v6 - 1;
    uint64_t v10 = 1;
    while (v6 != v10)
    {
      double v11 = percentTexturesTimes[v10++];
      if (v11 > a3)
      {
        uint64_t v8 = v10 - 2;
        break;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  percentTextures = self->_percentTextures;

  return [(NSArray *)percentTextures objectAtIndexedSubscript:v8];
}

- (void)p_addVisibleTexturesFromMatches:(id)a3 toArray:(id)a4 interpolatedPercent:(double)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:a3];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__TSDMagicMoveTextureZOrderer_p_addVisibleTexturesFromMatches_toArray_interpolatedPercent___block_invoke;
  v20[3] = &__block_descriptor_40_e79_q24__0__TSDMagicMoveTextureZOrdererMatch_8__TSDMagicMoveTextureZOrdererMatch_16l;
  *(double *)&v20[4] = a5;
  [v7 sortUsingComparator:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = 0;
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        do
        {
          v14 = objc_msgSend((id)objc_msgSend(v13, "outgoingTexture"), "firstVisibleTextureForTextureType:", v12);
          if (v14
            || (v14 = objc_msgSend((id)objc_msgSend(v13, "incomingTexture"), "firstVisibleTextureForTextureType:", v12)) != 0)
          {
            [a4 addObject:v14];
          }
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "layer"), "valueForKey:", @"kTSDTextureLayerKeyIsPaired"), "BOOLValue"))
          {
            uint64_t v15 = objc_msgSend((id)objc_msgSend(v13, "incomingTexture"), "firstVisibleTextureForTextureType:", v12);
            if (v15)
            {
              if ((void *)v15 != v14) {
                [a4 addObject:v15];
              }
            }
          }
          uint64_t v12 = (v12 + 1);
        }
        while (v12 != 10);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }
}

uint64_t __91__TSDMagicMoveTextureZOrderer_p_addVisibleTexturesFromMatches_toArray_interpolatedPercent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(double *)(a1 + 32) >= 0.5)
  {
    uint64_t v8 = [a2 incomingZIndex];
    if (v8 != [a3 incomingZIndex]) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = [a2 outgoingZIndex];
    if (v5 == [a3 outgoingZIndex])
    {
LABEL_3:
      uint64_t v6 = [a2 incomingZIndex];
      uint64_t v7 = [a3 incomingZIndex];
      goto LABEL_6;
    }
  }
  uint64_t v6 = [a2 outgoingZIndex];
  uint64_t v7 = [a3 outgoingZIndex];
LABEL_6:
  if (v6 < v7) {
    return -1;
  }
  else {
    return v6 > v7;
  }
}

- (id)p_newArrayBySortingMatches:(id)a3 withInterpolatedPercent:(double)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:a3];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __82__TSDMagicMoveTextureZOrderer_p_newArrayBySortingMatches_withInterpolatedPercent___block_invoke;
  v22[3] = &__block_descriptor_40_e79_q24__0__TSDMagicMoveTextureZOrdererMatch_8__TSDMagicMoveTextureZOrdererMatch_16l;
  *(double *)&v22[4] = a4;
  [v6 sortUsingComparator:v22];
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        if ([v8 count])
        {
          objc_msgSend((id)objc_msgSend(v8, "lastObject"), "interpolatedZIndexAtPercent:", a4);
          double v15 = v14;
          [v13 interpolatedZIndexAtPercent:a4];
          if (vabdd_f64(v15, v16) >= 0.00999999978)
          {
            [(TSDMagicMoveTextureZOrderer *)self p_addVisibleTexturesFromMatches:v8 toArray:v7 interpolatedPercent:a4];
            [v8 removeAllObjects];
          }
        }
        [v8 addObject:v13];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }
  [(TSDMagicMoveTextureZOrderer *)self p_addVisibleTexturesFromMatches:v8 toArray:v7 interpolatedPercent:a4];

  return v7;
}

uint64_t __82__TSDMagicMoveTextureZOrderer_p_newArrayBySortingMatches_withInterpolatedPercent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 interpolatedZIndexAtPercent:*(double *)(a1 + 32)];
  double v6 = v5;
  [a3 interpolatedZIndexAtPercent:*(double *)(a1 + 32)];
  if (v6 < v7) {
    return -1;
  }
  else {
    return v6 > v7;
  }
}

- (void)p_adjustZOrdererMatchesZIndexByTextureType:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  v43 = objc_opt_new();
  uint64_t v3 = 1;
  unint64_t v4 = 0x263F08000uLL;
  do
  {
    uint64_t v5 = v3;
    [v43 removeAllObjects];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v60 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          if (v5) {
            uint64_t v11 = [v10 outgoingZIndex];
          }
          else {
            uint64_t v11 = [v10 incomingZIndex];
          }
          uint64_t v12 = v11;
          if (v11 != -1)
          {
            v13 = objc_msgSend(v43, "objectForKey:", objc_msgSend(*(id *)(v4 + 2584), "numberWithInteger:", v11));
            if (!v13)
            {
              v13 = objc_opt_new();
              objc_msgSend(v43, "setObject:forKey:", v13, objc_msgSend(*(id *)(v4 + 2584), "numberWithInteger:", v12));
            }
            [v13 addObject:v10];
          }
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v59 objects:v66 count:16];
      }
      while (v7);
    }
    double v14 = (void *)[MEMORY[0x263EFF9B0] orderedSet];
    double v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithArray:", objc_msgSend(v43, "allKeys"));
    [v15 sortUsingSelector:sel_compare_];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v40 = v15;
    uint64_t v42 = [v15 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v42)
    {
      uint64_t v46 = 0;
      uint64_t v41 = *(void *)v56;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v56 != v41) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = v16;
          long long v17 = (void *)[v43 objectForKey:*(void *)(*((void *)&v55 + 1) + 8 * v16)];
          [v14 removeAllObjects];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:v64 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v52;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v52 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                if ((v5 & 1) == 0)
                {
                  v23 = (void *)[v22 incomingTexture];
                  if (!v23) {
                    continue;
                  }
LABEL_30:
                  objc_msgSend(v14, "addObject:", objc_msgSend(*(id *)(v4 + 2584), "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "visibleTextures"), "firstObject"), "textureType")));
                  continue;
                }
                v23 = (void *)[v22 outgoingTexture];
                if (v23) {
                  goto LABEL_30;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v51 objects:v64 count:16];
            }
            while (v19);
          }
          [v14 sortUsingComparator:&__block_literal_global_433];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          uint64_t v24 = [v17 countByEnumeratingWithState:&v47 objects:v63 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v48;
            uint64_t v45 = *(void *)v48;
            do
            {
              for (uint64_t k = 0; k != v25; ++k)
              {
                if (*(void *)v48 != v26) {
                  objc_enumerationMutation(v17);
                }
                v28 = *(void **)(*((void *)&v47 + 1) + 8 * k);
                if (v5) {
                  v29 = (void *)[v28 outgoingTexture];
                }
                else {
                  v29 = (void *)[v28 incomingTexture];
                }
                uint64_t v30 = objc_msgSend(v14, "indexOfObject:", objc_msgSend(*(id *)(v4 + 2584), "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "visibleTextures"), "firstObject"), "textureType")));
                if (v30 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v31 = v17;
                  uint64_t v32 = v5;
                  v33 = v14;
                  unint64_t v34 = v4;
                  uint64_t v35 = [MEMORY[0x263F7C7F0] currentHandler];
                  uint64_t v36 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrderer p_adjustZOrdererMatchesZIndexByTextureType:]"];
                  uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"];
                  v38 = (void *)v35;
                  unint64_t v4 = v34;
                  double v14 = v33;
                  uint64_t v5 = v32;
                  long long v17 = v31;
                  uint64_t v26 = v45;
                  [v38 handleFailureInFunction:v36 file:v37 lineNumber:1274 description:@"Couldn't find texture type!"];
                }
                if (v5)
                {
                  if (([v28 isOutgoingZIndexUnmatched] & 1) == 0) {
                    objc_msgSend(v28, "setOutgoingZIndex:", v30 + v46 + objc_msgSend(v28, "outgoingZIndex"));
                  }
                }
                else if (([v28 isIncomingZIndexUnmatched] & 1) == 0)
                {
                  objc_msgSend(v28, "setIncomingZIndex:", v30 + v46 + objc_msgSend(v28, "incomingZIndex"));
                }
              }
              uint64_t v25 = [v17 countByEnumeratingWithState:&v47 objects:v63 count:16];
            }
            while (v25);
          }
          uint64_t v46 = v46 + [v14 count] - 1;
          uint64_t v16 = v44 + 1;
        }
        while (v44 + 1 != v42);
        uint64_t v42 = [v40 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v42);
    }

    uint64_t v3 = 0;
  }
  while ((v5 & 1) != 0);
}

uint64_t __74__TSDMagicMoveTextureZOrderer_p_adjustZOrdererMatchesZIndexByTextureType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)p_setupZOrderMatchesWithAnimationMatches:(id)a3
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  unint64_t v4 = (NSArray *)objc_opt_new();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v90 objects:v101 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v91 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = [[TSDMagicMoveTextureZOrdererMatch alloc] initWithAnimationMatch:*(void *)(*((void *)&v90 + 1) + 8 * i)];
        [(NSArray *)v4 addObject:v9];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v90 objects:v101 count:16];
    }
    while (v6);
  }
  [(TSDMagicMoveTextureZOrderer *)self p_adjustZOrdererMatchesZIndexByTextureType:v4];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v10 = [(NSArray *)v4 countByEnumeratingWithState:&v86 objects:v100 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v87 != v14) {
          objc_enumerationMutation(v4);
        }
        uint64_t v16 = *(void **)(*((void *)&v86 + 1) + 8 * j);
        if (v12 <= [v16 outgoingZIndex]) {
          uint64_t v12 = [v16 outgoingZIndex];
        }
        if (v13 <= [v16 incomingZIndex]) {
          uint64_t v13 = [v16 incomingZIndex];
        }
      }
      uint64_t v11 = [(NSArray *)v4 countByEnumeratingWithState:&v86 objects:v100 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  long long v55 = objc_opt_new();
  long long v54 = objc_opt_new();
  if ((v12 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = objc_opt_new();
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      uint64_t v19 = [(NSArray *)v4 countByEnumeratingWithState:&v82 objects:v99 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v83;
        do
        {
          for (uint64_t k = 0; k != v20; ++k)
          {
            if (*(void *)v83 != v21) {
              objc_enumerationMutation(v4);
            }
            v23 = *(void **)(*((void *)&v82 + 1) + 8 * k);
            if (objc_msgSend(v23, "outgoingZIndex", v54) == v17 && objc_msgSend(v23, "incomingZIndex") == -1) {
              [v18 addObject:v23];
            }
          }
          uint64_t v20 = [(NSArray *)v4 countByEnumeratingWithState:&v82 objects:v99 count:16];
        }
        while (v20);
      }
      if ((unint64_t)objc_msgSend(v18, "count", v54) >= 2) {
        [v55 addObject:v18];
      }

      BOOL v24 = v17++ == v12;
    }
    while (!v24);
  }
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v25 = 0;
    do
    {
      uint64_t v26 = objc_opt_new();
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      uint64_t v27 = [(NSArray *)v4 countByEnumeratingWithState:&v78 objects:v98 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v79;
        do
        {
          for (uint64_t m = 0; m != v28; ++m)
          {
            if (*(void *)v79 != v29) {
              objc_enumerationMutation(v4);
            }
            v31 = *(void **)(*((void *)&v78 + 1) + 8 * m);
            if (objc_msgSend(v31, "incomingZIndex", v54) == v25 && objc_msgSend(v31, "outgoingZIndex") == -1) {
              [v26 addObject:v31];
            }
          }
          uint64_t v28 = [(NSArray *)v4 countByEnumeratingWithState:&v78 objects:v98 count:16];
        }
        while (v28);
      }
      if ((unint64_t)objc_msgSend(v26, "count", v54) >= 2) {
        [v54 addObject:v26];
      }

      BOOL v24 = v25++ == v13;
    }
    while (!v24);
  }
  char v32 = 1;
  long long v59 = v4;
  do
  {
    char v33 = v32;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v58 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v74, v97, 16, v54);
    if (v58)
    {
      uint64_t v57 = *(void *)v75;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v75 != v57) {
            objc_enumerationMutation(v4);
          }
          uint64_t v35 = *(void **)(*((void *)&v74 + 1) + 8 * v34);
          uint64_t v60 = v34;
          if (v33) {
            uint64_t v36 = [v35 outgoingZIndex];
          }
          else {
            uint64_t v36 = [v35 incomingZIndex];
          }
          if (v36 == -1)
          {
            long long v61 = v35;
            uint64_t v37 = [(TSDMagicMoveTextureZOrderer *)self p_bestZIndexForUnassignedMatch:v35 inMatchArray:v59];
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            uint64_t v38 = [(NSArray *)v59 countByEnumeratingWithState:&v70 objects:v96 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v71;
              do
              {
                for (uint64_t n = 0; n != v39; ++n)
                {
                  if (*(void *)v71 != v40) {
                    objc_enumerationMutation(v59);
                  }
                  uint64_t v42 = *(void **)(*((void *)&v70 + 1) + 8 * n);
                  if (v33)
                  {
                    if ([v42 outgoingZIndex] >= v37) {
                      objc_msgSend(v42, "setOutgoingZIndex:", objc_msgSend(v42, "outgoingZIndex") + 1);
                    }
                  }
                  else if ([v42 incomingZIndex] >= v37)
                  {
                    objc_msgSend(v42, "setIncomingZIndex:", objc_msgSend(v42, "incomingZIndex") + 1);
                  }
                }
                uint64_t v39 = [(NSArray *)v59 countByEnumeratingWithState:&v70 objects:v96 count:16];
              }
              while (v39);
            }
            if (v33)
            {
              [v35 setOutgoingZIndex:v37];
              v43 = v54;
            }
            else
            {
              [v35 setIncomingZIndex:v37];
              v43 = v55;
            }
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            uint64_t v44 = [v43 countByEnumeratingWithState:&v66 objects:v95 count:16];
            if (v44)
            {
              uint64_t v45 = v44;
              uint64_t v46 = *(void *)v67;
              do
              {
                for (iuint64_t i = 0; ii != v45; ++ii)
                {
                  if (*(void *)v67 != v46) {
                    objc_enumerationMutation(v43);
                  }
                  long long v48 = *(void **)(*((void *)&v66 + 1) + 8 * ii);
                  if ([v48 containsObject:v35])
                  {
                    long long v64 = 0u;
                    long long v65 = 0u;
                    long long v62 = 0u;
                    long long v63 = 0u;
                    uint64_t v49 = [v48 countByEnumeratingWithState:&v62 objects:v94 count:16];
                    if (v49)
                    {
                      uint64_t v50 = v49;
                      uint64_t v51 = *(void *)v63;
                      do
                      {
                        for (juint64_t j = 0; jj != v50; ++jj)
                        {
                          if (*(void *)v63 != v51) {
                            objc_enumerationMutation(v48);
                          }
                          long long v53 = *(void **)(*((void *)&v62 + 1) + 8 * jj);
                          if (v33) {
                            [v53 setOutgoingZIndex:v37];
                          }
                          else {
                            [v53 setIncomingZIndex:v37];
                          }
                        }
                        uint64_t v50 = [v48 countByEnumeratingWithState:&v62 objects:v94 count:16];
                      }
                      while (v50);
                    }
                  }
                  uint64_t v35 = v61;
                }
                uint64_t v45 = [v43 countByEnumeratingWithState:&v66 objects:v95 count:16];
              }
              while (v45);
            }
          }
          unint64_t v4 = v59;
          uint64_t v34 = v60 + 1;
        }
        while (v60 + 1 != v58);
        uint64_t v58 = [(NSArray *)v59 countByEnumeratingWithState:&v74 objects:v97 count:16];
      }
      while (v58);
    }
    char v32 = 0;
  }
  while ((v33 & 1) != 0);

  self->_zOrderMatches = v4;
  self->_outgoingTexturesInZOrder = (NSArray *)[(TSDMagicMoveTextureZOrderer *)self p_newArrayBySortingMatches:v4 withInterpolatedPercent:0.0];
  self->_incomingTexturesInZOrder = (NSArray *)[(TSDMagicMoveTextureZOrderer *)self p_newArrayBySortingMatches:v4 withInterpolatedPercent:1.0];
}

- (unint64_t)p_zIntersectionsBetweenZOrdererMatches:(id)a3
{
  uint64_t v4 = [a3 count];
  if (!v4) {
    return 0;
  }
  unint64_t v5 = v4;
  unint64_t v6 = 0;
  unint64_t v7 = 0;
  do
  {
    uint64_t v8 = [a3 objectAtIndexedSubscript:v6++];
    if (v6 < v5)
    {
      uint64_t v9 = (void *)v8;
      unint64_t v10 = v6;
      do
        v7 += objc_msgSend(v9, "intersectsZOrdererMatch:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10++));
      while (v5 != v10);
    }
  }
  while (v6 != v5);
  return v7;
}

- (id)p_debugDescription
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v3 = [(NSArray *)self->_percentTextures objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v64 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        uint64_t v10 = -[__CFString length](TSDStringFromTextureType([v9 textureType]), "length");
        int v11 = [v9 textureType];
        uint64_t v12 = v10 + 5;
        if (v11 != 6) {
          uint64_t v12 = v10;
        }
        if (v6 <= v12) {
          uint64_t v6 = v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v13 = (void *)[MEMORY[0x263F089D8] stringWithString:@"Texture Z Orders:"];
  if (objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "count") >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v41 = v13;
    uint64_t v42 = v6;
    do
    {
      [v13 appendString:@"\n"];
      double v15 = TSDStringFromTextureType(objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v14), "textureType"));
      uint64_t v16 = objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v14), "text");
      if (v16)
      {
        uint64_t v17 = v16;
        if ((unint64_t)[v16 length] <= 3) {
          uint64_t v18 = [v17 length];
        }
        else {
          uint64_t v18 = 3;
        }
        double v15 = (__CFString *)-[__CFString stringByAppendingFormat:](v15, "stringByAppendingFormat:", @"\"%@\", objc_msgSend(v17, "substringWithRange:"", 0, v18));
      }
      if ([(__CFString *)v15 length] < v6)
      {
        uint64_t v19 = 0;
        do
        {
          [v13 appendString:@" "];
          ++v19;
        }
        while (v19 < v6 - [(__CFString *)v15 length]);
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      obuint64_t j = self->_zOrderMatches;
      uint64_t v46 = [(NSArray *)obj countByEnumeratingWithState:&v59 objects:v69 count:16];
      v43 = v15;
      uint64_t v20 = 0;
      if (v46)
      {
        uint64_t v45 = *(void *)v60;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v60 != v45) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void **)(*((void *)&v59 + 1) + 8 * v21);
            v23 = objc_opt_new();
            if ([v22 outgoingTexture]) {
              objc_msgSend(v23, "addObject:", objc_msgSend(v22, "outgoingTexture"));
            }
            uint64_t v47 = v21;
            if ([v22 incomingTexture]) {
              objc_msgSend(v23, "addObject:", objc_msgSend(v22, "incomingTexture"));
            }
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v48 = v23;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v55 objects:v68 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v49 = v22;
              uint64_t v50 = *(void *)v56;
LABEL_35:
              uint64_t v26 = 0;
              while (1)
              {
                if (*(void *)v56 != v50) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v27 = *(void **)(*((void *)&v55 + 1) + 8 * v26);
                long long v51 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                uint64_t v28 = (void *)[v27 visibleTextures];
                uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v67 count:16];
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = *(void *)v52;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v30; ++j)
                    {
                      if (*(void *)v52 != v31) {
                        objc_enumerationMutation(v28);
                      }
                      uint64_t v33 = *(void *)(*((void *)&v51 + 1) + 8 * j);
                      if (v33 == objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v14))
                      {
                        uint64_t v20 = v49;
                        goto LABEL_48;
                      }
                    }
                    uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v67 count:16];
                    if (v30) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_48:
                if (v20) {
                  break;
                }
                if (++v26 == v25)
                {
                  uint64_t v25 = [v48 countByEnumeratingWithState:&v55 objects:v68 count:16];
                  uint64_t v20 = 0;
                  if (v25) {
                    goto LABEL_35;
                  }
                  break;
                }
              }
            }

            uint64_t v21 = v47 + 1;
          }
          while (v47 + 1 != v46);
          uint64_t v46 = [(NSArray *)obj countByEnumeratingWithState:&v59 objects:v69 count:16];
        }
        while (v46);
      }
      uint64_t v34 = [v20 outgoingZIndex];
      if ([v20 isOutgoingZIndexUnmatched]) {
        uint64_t v35 = @"*";
      }
      else {
        uint64_t v35 = @" ";
      }
      uint64_t v36 = [v20 incomingZIndex];
      if ([v20 isIncomingZIndexUnmatched]) {
        uint64_t v37 = @"*";
      }
      else {
        uint64_t v37 = @" ";
      }
      uint64_t v40 = v35;
      uint64_t v13 = v41;
      [v41 appendFormat:@"%@ %2d(z:%2d%@->%2d%@):", v43, v14, v34, v40, v36, v37];
      if ((int64_t)[(NSArray *)self->_percentTextures count] >= 1)
      {
        int64_t v38 = 0;
        do
          objc_msgSend(v41, "appendFormat:", @"  %2d", objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "indexOfObject:", objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", v38++), "objectAtIndexedSubscript:", v14)));
        while (v38 < (int64_t)[(NSArray *)self->_percentTextures count]);
      }
      ++v14;
      uint64_t v6 = v42;
    }
    while (v14 < objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_percentTextures, "objectAtIndexedSubscript:", 0), "count"));
  }
  return v13;
}

- (unint64_t)p_bestZIndexForUnassignedMatch:(id)a3 inMatchArray:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if ([a3 outgoingZIndex] != -1 && objc_msgSend(a3, "incomingZIndex") != -1)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrderer p_bestZIndexForUnassignedMatch:inMatchArray:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1507, @"This match is already assigned!");
  }
  uint64_t v8 = [a3 outgoingZIndex];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v9 = [a4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (!v9)
  {
    uint64_t v11 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v33 != v12) {
        objc_enumerationMutation(a4);
      }
      uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      if (v8 == -1)
      {
        if (v11 > [v14 outgoingZIndex]) {
          continue;
        }
        uint64_t v15 = [v14 outgoingZIndex];
      }
      else
      {
        if (v11 > [v14 incomingZIndex]) {
          continue;
        }
        uint64_t v15 = [v14 incomingZIndex];
      }
      uint64_t v11 = v15;
    }
    uint64_t v10 = [a4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  }
  while (v10);
LABEL_19:
  unint64_t v16 = [a4 count];
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "outgoingTexture"), "firstVisibleTextureForTextureType:", 1);
  int64_t v18 = v17 == 0;
  int64_t v19 = v11 + 1;
  if ((__int128)__PAIR128__(v19, v17) >= 1)
  {
    unint64_t v20 = -1;
    do
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v21 = [a4 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        unint64_t v23 = 0;
        uint64_t v24 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v29 != v24) {
              objc_enumerationMutation(a4);
            }
            v23 += [a3 intersectsZOrdererMatch:*(void *)(*((void *)&v28 + 1) + 8 * j) withAttemptedZIndex:v19];
          }
          uint64_t v22 = [a4 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v22);
      }
      else
      {
        unint64_t v23 = 0;
      }
      if (v23 < v20)
      {
        unint64_t v20 = v23;
        unint64_t v16 = v19;
      }
    }
    while (v19-- > v18);
  }
  return v16;
}

- (void)p_calculateTextureArraysFromIntersections
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v4 = [(NSArray *)self->_zOrderMatches count];
  uint64_t v5 = v4 - 2;
  if (v4 >= 2)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v7;
      id v9 = [(NSArray *)self->_zOrderMatches objectAtIndexedSubscript:v7++];
      if (v7 < v6)
      {
        uint64_t v10 = v9;
        uint64_t v11 = v7;
        do
        {
          id v12 = [(NSArray *)self->_zOrderMatches objectAtIndexedSubscript:v11];
          if ([v10 intersectsZOrdererMatch:v12])
          {
            [v10 intersectionPercentWithZOrdererMatch:v12];
            objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", floor(v13 * 1000.0) / 1000.0));
          }
          ++v11;
        }
        while (v6 != v11);
      }
    }
    while (v8 != v5);
  }
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithArray:", objc_msgSend(v3, "allObjects"));
  [v14 sortUsingSelector:sel_compare_];
  if (![v14 count] || objc_msgSend((id)objc_msgSend(v14, "firstObject"), "intValue")) {
    [v14 insertObject:&unk_26D739D98 atIndex:0];
  }
  if (objc_msgSend((id)objc_msgSend(v14, "lastObject"), "intValue") != 1) {
    [v14 addObject:&unk_26D739DB0];
  }
  unint64_t v15 = [v14 count];
  unint64_t v16 = (NSArray *)objc_opt_new();
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_zOrderMatches];
  uint64_t v17 = objc_opt_new();
  if (v15)
  {
    unint64_t v18 = 0;
    double v19 = 0.0;
    do
    {
      double v20 = 1.0;
      if (v18 < [v14 count])
      {
        objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", v18), "doubleValue");
        double v20 = v21;
      }
      if (v20 == 1.0) {
        double v22 = 1.0;
      }
      else {
        double v22 = (v19 + v20) * 0.5;
      }
      objc_msgSend(v17, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v19));
      id v23 = [(TSDMagicMoveTextureZOrderer *)self p_newArrayBySortingMatches:self->_zOrderMatches withInterpolatedPercent:v22];
      [(NSArray *)v16 addObject:v23];

      ++v18;
      double v19 = v20;
    }
    while (v15 != v18);
  }
  if ([v17 count] != v15)
  {
    uint64_t v24 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrderer p_calculateTextureArraysFromIntersections]"];
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1593, @"percentTexturesTimes.count(%d) != percentTextureCount(%d)!", objc_msgSend(v17, "count"), v15);
  }
  if ([(NSArray *)v16 count] != v15)
  {
    uint64_t v26 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v27 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrderer p_calculateTextureArraysFromIntersections]"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1594, @"percentTextures.count(%d) != percentTextureCount(%d)!", -[NSArray count](v16, "count"), v15);
  }
  free(self->_percentTexturesTimes);
  if (v15 <= 1) {
    size_t v28 = 1;
  }
  else {
    size_t v28 = v15;
  }
  self->_percentTexturesTimes = (double *)malloc_type_calloc(8uLL, v28, 0x1E7A0198uLL);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v29 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = 0;
    uint64_t v32 = *(void *)v38;
    do
    {
      uint64_t v33 = 0;
      uint64_t v34 = v31;
      do
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * v33) doubleValue];
        uint64_t v31 = v34 + 1;
        self->_percentTexturesTimes[v34] = v35;
        ++v33;
        ++v34;
      }
      while (v30 != v33);
      uint64_t v30 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v30);
  }
  self->_percentTextures = v16;
  self->_zOrderIntersectionsCount = [v14 count];
}

- (void)p_addFlattenableAnimationMatches:(id)a3 toArray:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  if ((unint64_t)[a3 count] >= 2)
  {
    uint64_t v42 = self;
    uint64_t v7 = objc_opt_new();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v61 != v10) {
            objc_enumerationMutation(a3);
          }
          id v12 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          double v13 = objc_msgSend((id)objc_msgSend(v12, "outgoingTexture"), "visibleTextures");
          uint64_t v14 = [v13 countByEnumeratingWithState:&v56 objects:v66 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v57;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v57 != v16) {
                  objc_enumerationMutation(v13);
                }
                [v7 addObject:*(void *)(*((void *)&v56 + 1) + 8 * j)];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v56 objects:v66 count:16];
            }
            while (v15);
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }
      while (v9);
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v18 = [v7 countByEnumeratingWithState:&v52 objects:v65 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v53;
      id v41 = a4;
      while (2)
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v53 != v20) {
            objc_enumerationMutation(v7);
          }
          double v22 = *(void **)(*((void *)&v52 + 1) + 8 * k);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          uint64_t v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v64, 16, v41);
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v49;
LABEL_23:
            uint64_t v26 = 0;
            while (1)
            {
              if (*(void *)v49 != v25) {
                objc_enumerationMutation(v7);
              }
              uint64_t v27 = *(void **)(*((void *)&v48 + 1) + 8 * v26);
              if (v22 != v27)
              {
                [v22 frameOnCanvas];
                CGFloat v29 = v28;
                CGFloat v31 = v30;
                CGFloat v33 = v32;
                CGFloat v35 = v34;
                [v27 frameOnCanvas];
                v70.origin.x = v36;
                v70.origin.y = v37;
                v70.size.width = v38;
                v70.size.height = v39;
                v69.origin.x = v29;
                v69.origin.y = v31;
                v69.size.width = v33;
                v69.size.height = v35;
                if (CGRectIntersectsRect(v69, v70)) {
                  break;
                }
              }
              if (v24 == ++v26)
              {
                uint64_t v24 = [v7 countByEnumeratingWithState:&v48 objects:v64 count:16];
                if (v24) {
                  goto LABEL_23;
                }
                goto LABEL_30;
              }
            }
            v47[0] = MEMORY[0x263EF8330];
            v47[1] = 3221225472;
            v47[2] = __72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke;
            v47[3] = &unk_2646B2128;
            v47[4] = v42;
            [v7 sortUsingComparator:v47];
            v43[0] = MEMORY[0x263EF8330];
            v43[1] = 3221225472;
            uint64_t v44 = __72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke_2;
            uint64_t v45 = &unk_2646B2150;
            uint64_t v46 = v7;
            if ((__72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke_2((uint64_t)v43, v42->_outgoingTexturesInZOrder) & 1) == 0)goto LABEL_36; {
            int v40 = v44((uint64_t)v43, v42->_incomingTexturesInZOrder);
            }

            if (v40) {
              objc_msgSend(v41, "addObject:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", objc_msgSend(a3, "array")));
            }
            return;
          }
LABEL_30:
          ;
        }
        uint64_t v19 = [v7 countByEnumeratingWithState:&v52 objects:v65 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_36:
  }
}

uint64_t __72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) indexOfObject:a2];
  unint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) indexOfObject:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrderer p_addFlattenableAnimationMatches:toArray:]_block_invoke"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1654, @"expected inequality between %s and %s", "obj1Index", "NSNotFound");
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrderer p_addFlattenableAnimationMatches:toArray:]_block_invoke"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1655, @"expected inequality between %s and %s", "obj2Index", "NSNotFound");
  }
  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

uint64_t __72__TSDMagicMoveTextureZOrderer_p_addFlattenableAnimationMatches_toArray___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(a2, "indexOfObject:", objc_msgSend(*(id *)(a1 + 32), "firstObject"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = [*(id *)(a1 + 32) indexOfObject:v10];
        if (v11 != [a2 indexOfObject:v10] - v4) {
          return 0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (NSArray)flattenableAnimationMatches
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v32 = (id)objc_opt_new();
  id v3 = (void *)[MEMORY[0x263EFF9B0] orderedSet];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = self->_outgoingTexturesInZOrder;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v30 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        zOrderMatches = self->_zOrderMatches;
        uint64_t v9 = [(NSArray *)zOrderMatches countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v42;
LABEL_8:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v42 != v11) {
              objc_enumerationMutation(zOrderMatches);
            }
            long long v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "outgoingTexture"), "visibleTextures"), "containsObject:", v7) & 1) != 0|| (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "incomingTexture"), "visibleTextures"), "containsObject:", v7))
            {
              break;
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [(NSArray *)zOrderMatches countByEnumeratingWithState:&v41 objects:v51 count:16];
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_17;
            }
          }
          if (v13) {
            goto LABEL_18;
          }
        }
LABEL_17:
        long long v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v15 = [NSString stringWithUTF8String:"-[TSDMagicMoveTextureZOrderer flattenableAnimationMatches]"];
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 1702, @"invalid nil value for '%s'", "zOrdererMatch");
        long long v13 = 0;
LABEL_18:
        if (objc_msgSend((id)objc_msgSend(v13, "animationMatch"), "isMatched"))
        {
          [(TSDMagicMoveTextureZOrderer *)self p_addFlattenableAnimationMatches:v3 toArray:v32];
          [v3 removeAllObjects];
        }
        else
        {
          if ([v3 count]
            && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "firstObject"), "animationMatch"), "outgoingTexture")
             || objc_msgSend((id)objc_msgSend(v13, "animationMatch"), "outgoingTexture"))
            && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "firstObject"), "animationMatch"), "incomingTexture")
             || objc_msgSend((id)objc_msgSend(v13, "animationMatch"), "incomingTexture")))
          {
            [(TSDMagicMoveTextureZOrderer *)self p_addFlattenableAnimationMatches:v3 toArray:v32];
            [v3 removeAllObjects];
          }
          [v3 addObject:v13];
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v5);
  }
  [(TSDMagicMoveTextureZOrderer *)self p_addFlattenableAnimationMatches:v3 toArray:v32];
  CGFloat v31 = (NSArray *)[MEMORY[0x263EFF980] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v16 = [v32 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v32);
        }
        uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        uint64_t v21 = [MEMORY[0x263EFF980] array];
        [(TSDMagicMoveTextureZOrderer *)self p_addVisibleTexturesFromMatches:v20 toArray:v21 interpolatedPercent:0.0];
        double v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v23 = [v20 countByEnumeratingWithState:&v33 objects:v49 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v34;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(v20);
              }
              objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * k), "animationMatch"));
            }
            uint64_t v24 = [v20 countByEnumeratingWithState:&v33 objects:v49 count:16];
          }
          while (v24);
        }
        id v27 = (id)objc_opt_new();
        [v27 setAnimationMatches:v22];
        [v27 setTexturesInZOrder:v21];
        [(NSArray *)v31 addObject:v27];
      }
      uint64_t v17 = [v32 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v17);
  }

  return v31;
}

- (unint64_t)zOrderIntersectionsCount
{
  return self->_zOrderIntersectionsCount;
}

@end