@interface UIKeyboardKeySwipeTransition
- (BOOL)disableMeshOptimization;
- (CGRect)keyRectForFrame:(CGRect)a3 normalizedSubRect:(CGRect)a4;
- (NSArray)endKeysOrdered;
- (NSArray)keyInfos;
- (NSArray)startGeometries;
- (NSArray)startKeysOrdered;
- (NSArray)transitionKeys;
- (double)nonInteractiveDuration;
- (double)previousProgress;
- (id)meshTransformForKeyplane:(id)a3 forward:(BOOL)a4 initial:(BOOL)a5;
- (void)_runOpacityAnimation;
- (void)_runTransformAnimation;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)commitTransitionRebuild;
- (void)gatherTransitionKeys;
- (void)rebuildWithStartKeyplane:(id)a3 startView:(id)a4 endKeyplane:(id)a5 endView:(id)a6;
- (void)removeAllAnimations;
- (void)runNonInteractivelyWithCompletion:(id)a3;
- (void)setDisableMeshOptimization:(BOOL)a3;
- (void)setEndKeysOrdered:(id)a3;
- (void)setKeyInfos:(id)a3;
- (void)setPreviousProgress:(double)a3;
- (void)setStartGeometries:(id)a3;
- (void)setStartKeysOrdered:(id)a3;
- (void)setTransitionKeys:(id)a3;
- (void)updateWithProgress:(double)a3;
@end

@implementation UIKeyboardKeySwipeTransition

- (void)rebuildWithStartKeyplane:(id)a3 startView:(id)a4 endKeyplane:(id)a5 endView:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)UIKeyboardKeySwipeTransition;
  [(UIKeyboardKeyplaneTransition *)&v31 rebuildWithStartKeyplane:v10 startView:a4 endKeyplane:v11 endView:a6];
  if (v10)
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v13 = objc_msgSend(v10, "keys", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v19 = [v18 shape];

          if (v19)
          {
            v20 = [v18 shape];
            [v12 addObject:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v15);
    }

    [(UIKeyboardKeySwipeTransition *)self setStartGeometries:v12];
    v21 = [v10 keysOrderedByPosition];
    [(UIKeyboardKeySwipeTransition *)self setStartKeysOrdered:v21];
  }
  if (v11)
  {
    v22 = [v11 keysOrderedByPosition];
    [(UIKeyboardKeySwipeTransition *)self setEndKeysOrdered:v22];
  }
  start = self->super._start;
  if (start && self->super._end)
  {
    v24 = [(UIKBTree *)start gestureKeyplaneName];

    if (v24)
    {
      v25 = [(UIKBTree *)self->super._end name];
      v26 = [(UIKBTree *)self->super._start gestureKeyplaneName];
      -[UIKeyboardKeyplaneTransition setInitiallyAtEnd:](self, "setInitiallyAtEnd:", [v25 rangeOfString:v26 options:1] == 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      [(UIKeyboardKeyplaneTransition *)self setInitiallyAtEnd:1];
    }
  }
}

- (void)commitTransitionRebuild
{
  [(UIKeyboardKeySwipeTransition *)self gatherTransitionKeys];
  BOOL v3 = [(UIKeyboardKeyplaneTransition *)self initiallyAtEnd];
  double v4 = 0.0;
  if (v3) {
    double v4 = 1.0;
  }
  [(UIKeyboardKeySwipeTransition *)self setPreviousProgress:v4];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  v5 = [a3 keyPath];
  int v6 = [v5 isEqualToString:@"meshTransform"];

  if (v6)
  {
    v7 = [(UIKeyboardKeyplaneTransition *)self completionBlock];

    if (v7)
    {
      v8 = [(UIKeyboardKeyplaneTransition *)self completionBlock];
      v8[2]();

      [(UIKeyboardKeyplaneTransition *)self setCompletionBlock:0];
    }
    [(UIKeyboardKeySwipeTransition *)self removeAllAnimations];
  }
}

- (double)nonInteractiveDuration
{
  return 0.25;
}

- (void)runNonInteractivelyWithCompletion:(id)a3
{
  [(UIKeyboardKeyplaneTransition *)self setCompletionBlock:a3];
  [(UIKeyboardKeySwipeTransition *)self _runTransformAnimation];
  [(UIKeyboardKeySwipeTransition *)self _runOpacityAnimation];
}

- (void)_runTransformAnimation
{
  v15[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKeyboardKeyplaneTransition *)self initiallyAtEnd];
  if (v3) {
    uint64_t v4 = 72;
  }
  else {
    uint64_t v4 = 64;
  }
  BOOL v5 = !v3;
  int v6 = [(UIKeyboardKeySwipeTransition *)self meshTransformForKeyplane:*(Class *)((char *)&self->super.super.isa + v4) forward:v5 initial:1];
  v7 = [(UIKeyboardKeySwipeTransition *)self meshTransformForKeyplane:*(Class *)((char *)&self->super.super.isa + v4) forward:v5 initial:0];
  v8 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"meshTransform"];
  [(UIKeyboardKeySwipeTransition *)self nonInteractiveDuration];
  objc_msgSend(v8, "setDuration:");
  [v8 setFillMode:*MEMORY[0x1E4F39FA0]];
  v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v8 setTimingFunction:v9];

  [v8 setRemovedOnCompletion:0];
  [v8 setDelegate:self];
  v15[0] = v6;
  v15[1] = v7;
  v15[2] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  [v8 setValues:v10];

  [v8 setKeyTimes:&unk_1ED3F09E8];
  id v11 = [(UIView *)self->super._startView layer];
  [v11 addAnimation:v8 forKey:@"transform interpolation"];

  [(UIView *)self->super._startView contentScaleFactor];
  double v13 = v12;
  uint64_t v14 = [(UIView *)self->super._startView layer];
  [v14 setRasterizationScale:v13];
}

- (void)_runOpacityAnimation
{
  id v5 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [(UIKeyboardKeySwipeTransition *)self nonInteractiveDuration];
  objc_msgSend(v5, "setDuration:");
  [v5 setFillMode:*MEMORY[0x1E4F39FA0]];
  BOOL v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v5 setTimingFunction:v3];

  [v5 setRemovedOnCompletion:0];
  [v5 setValues:&unk_1ED3F0A00];
  [v5 setKeyTimes:&unk_1ED3F0A18];
  uint64_t v4 = [(UIView *)self->super._startView layer];
  [v4 addAnimation:v5 forKey:@"opacity interpolation"];
}

- (void)removeAllAnimations
{
  BOOL v3 = [(UIView *)self->super._startView layer];
  [v3 removeAnimationForKey:@"transform interpolation"];

  uint64_t v4 = [(UIView *)self->super._endView layer];
  [v4 removeAnimationForKey:@"transform interpolation"];

  id v5 = [(UIView *)self->super._startView layer];
  [v5 removeAnimationForKey:@"opacity interpolation"];

  int v6 = [(UIView *)self->super._endView layer];
  [v6 removeAnimationForKey:@"opacity interpolation"];

  v7 = [(UIView *)self->super._startView layer];
  [v7 setMeshTransform:0];

  v8 = [(UIView *)self->super._endView layer];
  [v8 setMeshTransform:0];

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardKeySwipeTransition;
  [(UIKeyboardKeyplaneTransition *)&v9 removeAllAnimations];
}

- (void)updateWithProgress:(double)a3
{
  [(UIView *)self->super._startView setHidden:0];
  [(UIView *)self->super._endView setHidden:0];
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardKeySwipeTransition;
  [(UIKeyboardKeyplaneTransition *)&v5 updateWithProgress:a3];
  [(UIKeyboardKeySwipeTransition *)self setPreviousProgress:a3];
}

- (void)gatherTransitionKeys
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  objc_super v5 = [(UIKBTree *)self->super._end keys];
  int v6 = [(UIKeyboardKeyplaneTransition *)self keyboard];

  if (v6)
  {
    int v6 = [(UIKBTree *)self->super._end gestureKeyplaneName];

    if (v6)
    {
      v7 = [(UIKeyboardKeyplaneTransition *)self keyboard];
      v8 = [(UIKBTree *)self->super._end gestureKeyplaneName];
      objc_super v9 = [v7 subtreeWithName:v8];

      int v6 = [v9 keys];
    }
  }
  id v10 = [(UIKeyboardKeySwipeTransition *)self startKeysOrdered];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__UIKeyboardKeySwipeTransition_gatherTransitionKeys__block_invoke;
  v15[3] = &unk_1E52FE808;
  id v16 = v6;
  v17 = self;
  id v18 = v5;
  id v19 = v4;
  id v20 = v3;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  [v10 enumerateObjectsUsingBlock:v15];

  [(UIKeyboardKeySwipeTransition *)self setTransitionKeys:v11];
  [(UIKeyboardKeySwipeTransition *)self setKeyInfos:v12];
}

void __52__UIKeyboardKeySwipeTransition_gatherTransitionKeys__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v26 = a2;
  int v5 = [v26 visible];
  int v6 = v26;
  if (v5)
  {
    if (*(void *)(a1 + 32)
      && ([*(id *)(a1 + 40) endKeysOrdered],
          v7 = objc_claimAutoreleasedReturnValue(),
          unint64_t v8 = [v7 count],
          v7,
          v8 > a3))
    {
      objc_super v9 = [*(id *)(a1 + 40) endKeysOrdered];
      id v10 = [v9 objectAtIndex:a3];

      unint64_t v11 = [*(id *)(a1 + 48) indexOfObject:v10];
      if (v11 >= [*(id *)(a1 + 32) count])
      {
        id v12 = 0;
      }
      else
      {
        id v12 = [*(id *)(a1 + 32) objectAtIndex:v11];
      }
      int v16 = [v10 displayType];
      BOOL v14 = v16 == 2;
      if (v16 == 2)
      {
        int v13 = 0;
        int v15 = 0;
      }
      else
      {
        if (v10) {
          BOOL v17 = v12 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        int v15 = !v17 && v10 != v12;
        int v13 = [v10 displayType] == 23;
      }
    }
    else
    {
      int v13 = 0;
      BOOL v14 = 0;
      int v15 = 0;
    }
    int v19 = [v26 displayTypeHint];
    int v20 = [v26 displayType];
    if (v19 == 10)
    {
      BOOL v21 = v20 != 7;
      v22 = *(void **)(a1 + 56);
      if (v21 & ~v13)
      {
        if (v14)
        {
          v23 = &unk_1ED3F57D8;
        }
        else if (v15)
        {
          v23 = &unk_1ED3F57F0;
        }
        else
        {
          v23 = &unk_1ED3F5808;
        }
      }
      else
      {
        v23 = &unk_1ED3F57C0;
      }
LABEL_41:
      [v22 addObject:v23];
      [*(id *)(a1 + 64) addObject:v26];
      int v6 = v26;
      goto LABEL_42;
    }
    if (v20 && [v26 displayType] != 8)
    {
      int v24 = [v26 displayType];
      int v6 = v26;
      if (v24 == 2) {
        char v25 = v15;
      }
      else {
        char v25 = 0;
      }
      if ((v25 & 1) == 0) {
        goto LABEL_42;
      }
    }
    else
    {
      int v6 = v26;
      if (!v15) {
        goto LABEL_42;
      }
    }
    if ([v6 displayType] == 2) {
      v23 = &unk_1ED3F57D8;
    }
    else {
      v23 = &unk_1ED3F5808;
    }
    v22 = *(void **)(a1 + 56);
    goto LABEL_41;
  }
LABEL_42:
}

- (CGRect)keyRectForFrame:(CGRect)a3 normalizedSubRect:(CGRect)a4
{
  double v4 = a3.origin.x + a3.size.width * a4.origin.x;
  double v5 = a3.origin.y + a3.size.height * a4.origin.y;
  double v6 = a3.size.width * a4.size.width;
  double v7 = a3.size.height * a4.size.height;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)meshTransformForKeyplane:(id)a3 forward:(BOOL)a4 initial:(BOOL)a5
{
  BOOL v407 = a5;
  BOOL v406 = a4;
  uint64_t v463 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(UIKeyboardKeySwipeTransition *)self transitionKeys];
  [v7 count];
  uint64_t v8 = [v7 count];
  v398[1] = v398;
  MEMORY[0x1F4188790](v8);
  id v10 = (char *)v398 - v9;
  MEMORY[0x1F4188790](v11);
  v451 = (char *)v398 - v12;
  double v14 = *MEMORY[0x1E4F1DB20];
  double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v432 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v399 = v6;
  [v6 frame];
  double v17 = v16;
  double v18 = 1.0 / v16;
  double v456 = 1.0 / v19;
  id v416 = [(UIKeyboardKeySwipeTransition *)self startGeometries];
  id v415 = [(UIKeyboardKeySwipeTransition *)self keyInfos];
  v421 = self;
  int v20 = [(UIKBTree *)self->super._start keys];
  long long v458 = 0u;
  long long v459 = 0u;
  long long v460 = 0u;
  long long v461 = 0u;
  id v21 = v7;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v458 objects:v462 count:16];
  v414 = v20;
  v429 = v10;
  double v457 = v18;
  if (!v22)
  {
    uint64_t v448 = 0;
    uint64_t v24 = 0;
    uint64_t v440 = -1;
    uint64_t v439 = -1;
    goto LABEL_34;
  }
  uint64_t v23 = v22;
  uint64_t v448 = 0;
  uint64_t v24 = 0;
  uint64_t v428 = *(void *)v459;
  double v400 = v17 * v18;
  double v404 = v18 * 0.0;
  uint64_t v440 = -1;
  double v419 = 0.115;
  uint64_t v412 = 0x3FD1EB851EB851ECLL;
  double v418 = 0.77;
  *(double *)&uint64_t v411 = 0.44;
  double v410 = 0.45;
  double v409 = 0.13;
  double v408 = 0.286;
  uint64_t v439 = -1;
  id v420 = v21;
  double v413 = v17;
  do
  {
    uint64_t v25 = 0;
    uint64_t v417 = v23;
    do
    {
      if (*(void *)v459 != v428) {
        objc_enumerationMutation(v21);
      }
      uint64_t v447 = v25;
      uint64_t v26 = *(void *)(*((void *)&v458 + 1) + 8 * v25);
      uint64_t v27 = [v20 indexOfObject:v26];
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v28 = [v416 objectAtIndex:v27];
        uint64_t v29 = [v21 indexOfObject:v26];
        long long v30 = [v415 objectAtIndex:v29];
        uint64_t v426 = [v30 integerValue];

        id v427 = v28;
        [v28 frame];
        CGFloat v442 = v13;
        CGFloat v431 = v15;
        CGFloat v430 = v14;
        objc_super v31 = v421;
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        double v40 = v419;
        double v41 = v418;
        double v42 = *(double *)&v411;
        -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v421, "keyRectForFrame:normalizedSubRect:");
        CGFloat v444 = v43;
        CGFloat v435 = v44;
        CGFloat v433 = v45;
        CGFloat v436 = v46;
        double v47 = v35;
        -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v31, "keyRectForFrame:normalizedSubRect:", v33, v35, v37, v39, v40, v410, v41, v42);
        CGFloat v49 = v48;
        CGFloat v51 = v50;
        CGFloat v53 = v52;
        CGFloat v450 = v52;
        CGFloat v55 = v54;
        CGFloat v449 = v54;
        CGFloat v454 = v39;
        -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v31, "keyRectForFrame:normalizedSubRect:", v33, v47, v37, v39, 0.25, v409, 0.5, v408);
        CGFloat v434 = v56;
        CGFloat v437 = v57;
        CGFloat v441 = v58;
        CGFloat v445 = v59;
        v465.origin.x = v430;
        v465.origin.y = v442;
        v465.size.width = v431;
        v465.size.height = v432;
        BOOL IsNull = CGRectIsNull(v465);
        uint64_t v61 = v24 + 1;
        v62 = &v451[40 * v24];
        v466.origin.x = v49;
        CGFloat v453 = v49;
        v466.origin.y = v51;
        CGFloat v452 = v51;
        v466.size.width = v53;
        v466.size.height = v55;
        *(double *)v438.i64 = v457 * CGRectGetMinX(v466);
        v467.origin.x = v33;
        CGFloat v455 = v33;
        v467.origin.y = v47;
        v467.size.width = v37;
        CGFloat v446 = v37;
        v467.size.height = v39;
        CGFloat MinY = CGRectGetMinY(v467);
        double v64 = v456;
        CGFloat MaxY = v456 * MinY;
        v468.origin.x = v49;
        v468.origin.y = v51;
        v468.size.width = v53;
        v468.size.height = v55;
        double v65 = v457 * CGRectGetMinX(v468);
        v469.origin.x = v33;
        v469.origin.y = v47;
        double v66 = v47;
        v469.size.width = v37;
        CGFloat v67 = v454;
        v469.size.height = v454;
        CGFloat v68 = CGRectGetMinY(v469);
        *(void *)v62 = v438.i64[0];
        *((CGFloat *)v62 + 1) = MaxY;
        *((double *)v62 + 2) = v65;
        *((double *)v62 + 3) = v64 * v68;
        *((void *)v62 + 4) = 0x3FE0000000000000;
        CGFloat v69 = v453;
        v470.origin.x = v453;
        CGFloat v70 = v452;
        v470.origin.y = v452;
        CGFloat v71 = v450;
        v470.size.width = v450;
        CGFloat v72 = v449;
        v470.size.height = v449;
        *(double *)v438.i64 = v457 * CGRectGetMinX(v470);
        CGFloat v73 = v455;
        v471.origin.x = v455;
        v471.origin.y = v66;
        CGFloat v74 = v446;
        v471.size.width = v446;
        v471.size.height = v67;
        CGFloat MaxY = CGRectGetMaxY(v471);
        v472.origin.x = v69;
        v472.origin.y = v70;
        v472.size.width = v71;
        v472.size.height = v72;
        double MinX = CGRectGetMinX(v472);
        v473.origin.x = v73;
        v473.origin.y = v66;
        v473.size.width = v74;
        v473.size.height = v67;
        CGFloat v76 = CGRectGetMaxY(v473);
        *((void *)v62 + 5) = v438.i64[0];
        v77 = v62 + 40;
        double v78 = v456;
        double v79 = v457;
        double v80 = v457 * MinX;
        double v81 = v442;
        *((double *)v62 + 6) = v456 * MaxY;
        *((double *)v62 + 7) = v80;
        *((double *)v62 + 8) = v78 * v76;
        *((void *)v62 + 9) = 0x3FE0000000000000;
        int32x4_t v82 = vdupq_n_s32(0x7F7FFFFFu);
        int32x4_t v438 = v82;
        CGFloat v443 = v66;
        if (IsNull || v81 != v66)
        {
          if (IsNull)
          {
            v90 = v429;
            uint64_t v83 = v448;
          }
          else
          {
            long long v91 = *((_OWORD *)v62 + 1);
            v92 = &v451[40 * v24];
            *((_OWORD *)v92 + 5) = *(_OWORD *)v62;
            *((_OWORD *)v92 + 6) = v91;
            long long v93 = *(_OWORD *)(v62 + 56);
            *(_OWORD *)(v92 + 120) = *v77;
            *((void *)v92 + 14) = *((void *)v62 + 4);
            *(_OWORD *)(v92 + 136) = v93;
            *((void *)v92 + 19) = *((void *)v62 + 9);
            CGFloat v94 = v430;
            CGFloat v95 = v430;
            CGFloat v96 = v81;
            CGFloat v97 = v431;
            *(CGFloat *)&long long v93 = v431;
            CGFloat v98 = v432;
            CGFloat v99 = v432;
            CGFloat v100 = CGRectGetMinY(*(CGRect *)(&v81 - 1));
            double v101 = v456;
            double v102 = v456 * v100;
            v474.origin.x = v94;
            v474.origin.y = v96;
            v474.size.width = v97;
            v474.size.height = v98;
            CGFloat v103 = CGRectGetMinY(v474);
            double v104 = v400;
            *(double *)v62 = v400;
            *((double *)v62 + 1) = v102;
            *((double *)v62 + 2) = v104;
            *((double *)v62 + 3) = v101 * v103;
            *((void *)v62 + 4) = 0x3FE0000000000000;
            v475.origin.x = v94;
            v475.origin.y = v96;
            v475.size.width = v97;
            v475.size.height = v98;
            double v105 = v101 * CGRectGetMaxY(v475);
            v476.origin.x = v94;
            v476.origin.y = v96;
            v476.size.width = v97;
            v476.size.height = v98;
            CGFloat v106 = CGRectGetMaxY(v476);
            *(double *)v77 = v104;
            *((double *)v62 + 6) = v105;
            *((double *)v62 + 7) = v104;
            *((double *)v62 + 8) = v101 * v106;
            *((void *)v62 + 9) = 0x3FE0000000000000;
            v90 = v429;
            uint64_t v107 = v448;
            v108 = (int32x4_t *)&v429[32 * v448];
            __int32 v109 = v440;
            v108->i32[0] = v439;
            v108->i32[1] = v109;
            v108->i32[2] = v61;
            v108->i32[3] = v24;
            v108[1] = v438;
            uint64_t v83 = v107 + 1;
            uint64_t v61 = v24 + 3;
            v24 += 2;
          }
          v86 = v451;
          v110 = &v451[40 * v24];
          long long v111 = *((_OWORD *)v110 + 1);
          *((_OWORD *)v110 + 5) = *(_OWORD *)v110;
          *((_OWORD *)v110 + 6) = v111;
          *((void *)v110 + 14) = *((void *)v110 + 4);
          LODWORD(v448) = v61 + 2;
          v112 = &v86[40 * v61];
          long long v113 = *((_OWORD *)v112 + 1);
          *((_OWORD *)v112 + 5) = *(_OWORD *)v112;
          *((_OWORD *)v112 + 6) = v113;
          *((void *)v112 + 14) = *((void *)v112 + 4);
          CGFloat v114 = v455;
          CGFloat v115 = v455;
          CGFloat v88 = v443;
          *(CGFloat *)&long long v113 = v443;
          CGFloat v116 = v446;
          CGFloat v117 = v446;
          CGFloat v118 = v454;
          CGFloat v119 = v454;
          CGFloat v120 = CGRectGetMinY(*(CGRect *)((char *)&v113 - 8));
          double v121 = v456;
          double v122 = v456 * v120;
          v477.origin.x = v114;
          v477.origin.y = v88;
          v477.size.width = v116;
          v477.size.height = v118;
          CGFloat v123 = CGRectGetMinY(v477);
          double v124 = v404;
          *(double *)v110 = v404;
          *((double *)v110 + 1) = v122;
          *((double *)v110 + 2) = v124;
          *((double *)v110 + 3) = v121 * v123;
          *((void *)v110 + 4) = 0x3FE0000000000000;
          v478.origin.x = v114;
          v478.origin.y = v88;
          v478.size.width = v116;
          v478.size.height = v118;
          double v125 = v121 * CGRectGetMaxY(v478);
          v479.origin.x = v114;
          v479.origin.y = v88;
          double v89 = v116;
          v479.size.width = v116;
          v479.size.height = v118;
          CGFloat v126 = CGRectGetMaxY(v479);
          *(double *)v112 = v124;
          *((double *)v112 + 1) = v125;
          *((double *)v112 + 2) = v124;
          *((double *)v112 + 3) = v121 * v126;
          *((void *)v112 + 4) = 0x3FE0000000000000;
          v127 = (int32x4_t *)&v90[32 * v83];
          v127->i32[0] = v24;
          v127->i32[1] = v61;
          v127->i32[2] = v448;
          v127->i32[3] = v24 + 2;
          v127[1] = v438;
          *(void *)&CGFloat v432 = v24 + 3;
          uint64_t v87 = v24 + 2;
          id v21 = v420;
        }
        else
        {
          uint64_t v83 = v448;
          v84 = (int32x4_t *)&v429[32 * v448];
          __int32 v85 = v440;
          v84->i32[0] = v439;
          v84->i32[1] = v85;
          *(void *)&CGFloat v432 = v24 + 1;
          v84->i32[2] = v61;
          v84->i32[3] = v24;
          v84[1] = v82;
          v86 = v451;
          uint64_t v87 = v24;
          CGFloat v88 = v66;
          double v89 = v446;
        }
        uint64_t v448 = v83;
        *(void *)&CGFloat v431 = v83 + 1;
        uint64_t v439 = v87 + 2;
        uint64_t v440 = v87 + 3;
        uint64_t v128 = v87 + 4;
        CGFloat v129 = v453;
        v480.origin.x = v453;
        CGFloat v130 = v452;
        v480.origin.y = v452;
        CGFloat v131 = v450;
        v480.size.width = v450;
        CGFloat v132 = v449;
        v480.size.height = v449;
        CGFloat v442 = v79 * CGRectGetMaxX(v480);
        v481.origin.x = v455;
        v481.origin.y = v88;
        v481.size.width = v89;
        v481.size.height = v454;
        CGFloat v133 = CGRectGetMinY(v481);
        CGFloat v134 = v88;
        double v135 = v456;
        CGFloat v430 = v456 * v133;
        v482.origin.x = v129;
        v482.origin.y = v130;
        v482.size.width = v131;
        v482.size.height = v132;
        CGFloat MaxY = v79 * CGRectGetMaxX(v482);
        CGFloat v136 = v455;
        v483.origin.x = v455;
        v483.origin.y = v134;
        v483.size.width = v89;
        CGFloat v137 = v454;
        v483.size.height = v454;
        CGFloat v138 = CGRectGetMinY(v483);
        v139 = &v86[40 * v87];
        CGFloat v140 = v430;
        *((CGFloat *)v139 + 10) = v442;
        *((CGFloat *)v139 + 11) = v140;
        *((CGFloat *)v139 + 12) = MaxY;
        *((double *)v139 + 13) = v135 * v138;
        *((void *)v139 + 14) = 0x3FE0000000000000;
        v484.origin.x = v129;
        CGFloat v141 = v452;
        v484.origin.y = v452;
        v484.size.width = v131;
        v484.size.height = v132;
        CGFloat v442 = v79 * CGRectGetMaxX(v484);
        v485.origin.x = v136;
        CGFloat v142 = v443;
        v485.origin.y = v443;
        v485.size.width = v89;
        v485.size.height = v137;
        CGFloat v430 = v135 * CGRectGetMaxY(v485);
        v486.origin.x = v453;
        v486.origin.y = v141;
        v486.size.width = v131;
        v486.size.height = v132;
        double v143 = v79 * CGRectGetMaxX(v486);
        v487.origin.x = v455;
        v487.origin.y = v142;
        v487.size.width = v89;
        v487.size.height = v137;
        CGFloat v144 = CGRectGetMaxY(v487);
        CGFloat v145 = v430;
        *((CGFloat *)v139 + 15) = v442;
        *((CGFloat *)v139 + 16) = v145;
        *((double *)v139 + 17) = v143;
        *((double *)v139 + 18) = v135 * v144;
        *((void *)v139 + 19) = 0x3FE0000000000000;
        double v13 = v142;
        if (v426 == 3)
        {
          v152 = v421;
          double v153 = v455;
          double v154 = v142;
          double v155 = v454;
          double v156 = v419;
          double v157 = v418;
          -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v421, "keyRectForFrame:normalizedSubRect:", v455, v154, v89, v454, v419, 0.325, v418, 0.35);
          CGFloat v444 = v158;
          CGFloat v435 = v159;
          CGFloat v433 = v160;
          CGFloat v436 = v161;
          -[UIKeyboardKeySwipeTransition keyRectForFrame:normalizedSubRect:](v152, "keyRectForFrame:normalizedSubRect:", v153, v13, v89, v155, v156, 0.1, v157, 0.35);
          CGFloat v434 = v162;
          CGFloat v437 = v163;
          CGFloat v441 = v164;
          CGFloat v445 = v165;
          double v146 = v457;
        }
        else
        {
          double v146 = v457;
          if (v426 != 2)
          {
            CGFloat v147 = v454;
            if (!v426)
            {
              v148 = (int32x4_t *)&v429[32 * *(void *)&v431];
              __int32 v149 = v439;
              v148->i32[0] = v87;
              v148->i32[1] = v149;
              __int32 v150 = LODWORD(v432);
              v148->i32[2] = v440;
              v148->i32[3] = v150;
              v148[1] = v438;
              v448 += 2;
              CGFloat v151 = v455;
LABEL_29:

              uint64_t v24 = v128;
              CGFloat v432 = v147;
              CGFloat v15 = v89;
              double v14 = v151;
              double v17 = v413;
              uint64_t v23 = v417;
              int v20 = v414;
              goto LABEL_30;
            }
            CGFloat v436 = v449;
            CGFloat v433 = v131;
            CGFloat v435 = v452;
            CGFloat v444 = v453;
          }
        }
        uint64_t v166 = v87 + 5;
        uint64_t v167 = v87 + 6;
        *(void *)&double v168 = v87 + 7;
        *(void *)&CGFloat v430 = v87 + 8;
        *(void *)&CGFloat v442 = v87 + 9;
        uint64_t v169 = v87 + 10;
        uint64_t v422 = v87;
        *(void *)&double v170 = v87 + 11;
        v171 = v451;
        v172 = &v451[40 * v128];
        CGFloat v173 = v434;
        v488.origin.x = v434;
        CGFloat v174 = v437;
        v488.origin.y = v437;
        CGFloat v175 = v441;
        v488.size.width = v441;
        double v176 = v445;
        v488.size.height = v445;
        double v177 = v146 * CGRectGetMinX(v488);
        v489.origin.x = v173;
        v489.origin.y = v174;
        v489.size.width = v175;
        v489.size.height = v176;
        CGFloat v178 = CGRectGetMinY(v489);
        double v179 = v456;
        double v180 = v456 * v178;
        v490.origin.x = v173;
        v490.origin.y = v174;
        v490.size.width = v175;
        v490.size.height = v176;
        double v181 = v457 * CGRectGetMinX(v490);
        v491.origin.x = v173;
        v491.origin.y = v174;
        v491.size.width = v175;
        v491.size.height = v176;
        CGFloat v182 = CGRectGetMinY(v491);
        *(double *)v172 = v177;
        *((double *)v172 + 1) = v180;
        *((double *)v172 + 2) = v181;
        *((double *)v172 + 3) = v179 * v182;
        *((void *)v172 + 4) = 0x3FE0000000000000;
        uint64_t v423 = v166;
        v183 = &v171[40 * v166];
        v492.origin.x = v173;
        v492.origin.y = v174;
        v492.size.width = v175;
        v492.size.height = v176;
        double v184 = v457 * CGRectGetMaxX(v492);
        v493.origin.x = v173;
        v493.origin.y = v174;
        v493.size.width = v175;
        v493.size.height = v176;
        double v185 = v179 * CGRectGetMinY(v493);
        v494.origin.x = v173;
        v494.origin.y = v174;
        v494.size.width = v175;
        v494.size.height = v176;
        double v186 = v457 * CGRectGetMaxX(v494);
        v495.origin.x = v173;
        v495.origin.y = v174;
        v495.size.width = v175;
        v495.size.height = v176;
        CGFloat v187 = CGRectGetMinY(v495);
        *(double *)v183 = v184;
        *((double *)v183 + 1) = v185;
        *((double *)v183 + 2) = v186;
        *((double *)v183 + 3) = v179 * v187;
        double v188 = v457;
        *((void *)v183 + 4) = 0x3FE0000000000000;
        uint64_t v426 = v167;
        v189 = &v171[40 * v167];
        v496.origin.x = v173;
        v496.origin.y = v174;
        v496.size.width = v175;
        v496.size.height = v176;
        double v190 = v188 * CGRectGetMinX(v496);
        uint64_t v424 = v128;
        CGFloat MaxY = v168;
        if (v406)
        {
          CGFloat v191 = v430;
          v497.origin.x = v173;
          v497.origin.y = v174;
          v497.size.width = v175;
          v497.size.height = v176;
          double v192 = v456 * CGRectGetMinY(v497);
          if (v407)
          {
            v498.origin.x = v173;
            v498.origin.y = v174;
            v498.size.width = v175;
            v498.size.height = v176;
            double v193 = v457 * CGRectGetMinX(v498);
            v499.origin.x = v173;
            v499.origin.y = v174;
            v499.size.width = v175;
            v499.size.height = v176;
            CGFloat v194 = CGRectGetMinY(v499);
            CGFloat v195 = v174;
            CGFloat v196 = v173;
            double v197 = v456;
            *(double *)v189 = v190;
            *((double *)v189 + 1) = v192;
            *((double *)v189 + 2) = v193;
            *((double *)v189 + 3) = v197 * v194;
            *((void *)v189 + 4) = 0x3FE0000000000000;
            v198 = v451;
            v199 = &v451[40 * *(void *)&v168];
            v500.origin.x = v196;
            v500.origin.y = v195;
            v500.size.width = v175;
            v500.size.height = v176;
            double v200 = v457 * CGRectGetMaxX(v500);
            v501.origin.x = v196;
            v501.origin.y = v195;
            v501.size.width = v175;
            v501.size.height = v176;
            double v201 = v197 * CGRectGetMinY(v501);
            v502.origin.x = v196;
            v502.origin.y = v195;
            v502.size.width = v175;
            v502.size.height = v176;
            double v202 = v457 * CGRectGetMaxX(v502);
            v503.origin.x = v196;
            v503.origin.y = v195;
            v503.size.width = v175;
            v503.size.height = v176;
            CGFloat v203 = CGRectGetMinY(v503);
            *(double *)v199 = v200;
            *((double *)v199 + 1) = v201;
            *((double *)v199 + 2) = v202;
            *((double *)v199 + 3) = v197 * v203;
            *((void *)v199 + 4) = 0x3FE0000000000000;
            v204 = &v198[40 * *(void *)&v191];
            v504.origin.x = v196;
            v504.origin.y = v195;
            v504.size.width = v175;
            v504.size.height = v176;
            double v205 = v457 * CGRectGetMinX(v504);
            v505.origin.x = v196;
            v505.origin.y = v195;
            v505.size.width = v175;
            v505.size.height = v176;
            double v206 = v197 * CGRectGetMaxY(v505);
            v506.origin.x = v196;
            v506.origin.y = v195;
            v506.size.width = v175;
            v506.size.height = v176;
            double v207 = v457 * CGRectGetMinX(v506);
            v507.origin.x = v196;
            v507.origin.y = v195;
            v507.size.width = v175;
            v507.size.height = v176;
            CGFloat v208 = CGRectGetMaxY(v507);
            *(double *)v204 = v205;
            *((double *)v204 + 1) = v206;
            *((double *)v204 + 2) = v207;
            *((double *)v204 + 3) = v197 * v208;
            *((void *)v204 + 4) = 0x3FE0000000000000;
            v209 = &v198[40 * *(void *)&v442];
            v508.origin.x = v196;
            v508.origin.y = v195;
            v508.size.width = v175;
            v508.size.height = v176;
            double v210 = v457 * CGRectGetMaxX(v508);
            v509.origin.x = v196;
            v509.origin.y = v195;
            v509.size.width = v175;
            v509.size.height = v176;
            double v211 = v197 * CGRectGetMaxY(v509);
            v510.origin.x = v196;
            v510.origin.y = v195;
            v510.size.width = v175;
            v510.size.height = v176;
            double v212 = v457 * CGRectGetMaxX(v510);
            v511.origin.x = v196;
            v511.origin.y = v195;
            v511.size.width = v175;
            v511.size.height = v176;
            CGFloat v213 = CGRectGetMaxY(v511);
            *(double *)v209 = v210;
            *((double *)v209 + 1) = v211;
            *((double *)v209 + 2) = v212;
            *((double *)v209 + 3) = v197 * v213;
            double v214 = v457;
            *((void *)v209 + 4) = 0x3FE0000000000000;
            int v215 = v169;
            v216 = &v198[40 * v169];
            CGFloat v217 = v453;
            v512.origin.x = v453;
            CGFloat v218 = v452;
            v512.origin.y = v452;
            CGFloat v219 = v450;
            v512.size.width = v450;
            CGFloat v220 = v449;
            v512.size.height = v449;
            double v221 = v214 * CGRectGetMinX(v512);
            v513.origin.x = v217;
            v513.origin.y = v218;
            v513.size.width = v219;
            v513.size.height = v220;
            double v222 = v197 * CGRectGetMinY(v513);
            v514.origin.x = v217;
            v514.origin.y = v218;
            v514.size.width = v219;
            v514.size.height = v220;
            double v223 = v214 * CGRectGetMinX(v514);
            v515.origin.x = v217;
            v515.origin.y = v218;
            v515.size.width = v450;
            v515.size.height = v220;
            CGFloat v224 = CGRectGetMinY(v515);
            *(double *)v216 = v221;
            *((double *)v216 + 1) = v222;
            *((double *)v216 + 2) = v223;
            *((double *)v216 + 3) = v197 * v224;
            CGFloat v225 = v450;
            *((void *)v216 + 4) = 0x3FE0000000000000;
            uint64_t v226 = 40 * *(void *)&v170;
            v516.origin.x = v217;
            v516.origin.y = v218;
            v516.size.width = v225;
            v516.size.height = v220;
            double v227 = v214 * CGRectGetMaxX(v516);
            v517.origin.x = v217;
            v517.origin.y = v218;
            v517.size.width = v225;
            v517.size.height = v220;
            CGFloat v228 = CGRectGetMinY(v517);
            v518.origin.x = v217;
            v518.origin.y = v218;
            v518.size.width = v225;
            v518.size.height = v220;
            double MaxX = CGRectGetMaxX(v518);
            v519.origin.x = v217;
            v519.origin.y = v218;
            v519.size.width = v225;
            v519.size.height = v220;
            double v230 = v228;
            double v231 = CGRectGetMinY(v519);
          }
          else
          {
            CGFloat v437 = v174;
            CGFloat v434 = v173;
            CGFloat v269 = v444;
            v542.origin.x = v444;
            CGFloat v270 = v435;
            v542.origin.y = v435;
            CGFloat v271 = v175;
            CGFloat v441 = v175;
            CGFloat v272 = v433;
            v542.size.width = v433;
            CGFloat v445 = v176;
            CGFloat v273 = v436;
            v542.size.height = v436;
            double v274 = v457 * CGRectGetMinX(v542);
            v543.origin.x = v269;
            v543.origin.y = v270;
            v543.size.width = v272;
            v543.size.height = v273;
            double v275 = v456 * CGRectGetMinY(v543);
            *(double *)v189 = v190;
            *((double *)v189 + 1) = v192;
            *((double *)v189 + 2) = v274;
            *((double *)v189 + 3) = v275;
            *((void *)v189 + 4) = 0x3FE0000000000000;
            v198 = v451;
            v276 = &v451[40 * *(void *)&v168];
            CGFloat v277 = v434;
            v544.origin.x = v434;
            CGFloat v278 = v437;
            v544.origin.y = v437;
            v544.size.width = v271;
            CGFloat v279 = v445;
            v544.size.height = v445;
            double v405 = v457 * CGRectGetMaxX(v544);
            v545.origin.x = v277;
            v545.origin.y = v278;
            v545.size.width = v271;
            v545.size.height = v279;
            CGFloat v280 = CGRectGetMinY(v545);
            double v281 = v456;
            double v282 = v456 * v280;
            CGFloat v444 = v269;
            v546.origin.x = v269;
            CGFloat v435 = v270;
            v546.origin.y = v270;
            v546.size.width = v272;
            v546.size.height = v273;
            double v283 = v457 * CGRectGetMaxX(v546);
            v547.origin.x = v269;
            v547.origin.y = v270;
            v547.size.width = v272;
            v547.size.height = v273;
            CGFloat v284 = CGRectGetMinY(v547);
            *(double *)v276 = v405;
            *((double *)v276 + 1) = v282;
            *((double *)v276 + 2) = v283;
            *((double *)v276 + 3) = v281 * v284;
            *((void *)v276 + 4) = 0x3FE0000000000000;
            v285 = &v198[40 * *(void *)&v191];
            CGFloat v286 = v434;
            v548.origin.x = v434;
            CGFloat v287 = v437;
            v548.origin.y = v437;
            CGFloat v288 = v441;
            v548.size.width = v441;
            CGFloat v289 = v445;
            v548.size.height = v445;
            double v405 = v457 * CGRectGetMinX(v548);
            v549.origin.x = v286;
            v549.origin.y = v287;
            v549.size.width = v288;
            CGFloat v290 = v288;
            v549.size.height = v289;
            double v403 = v281 * CGRectGetMaxY(v549);
            CGFloat v291 = v444;
            v550.origin.x = v444;
            CGFloat v292 = v435;
            v550.origin.y = v435;
            v550.size.width = v272;
            v550.size.height = v273;
            double v293 = v457 * CGRectGetMinX(v550);
            v551.origin.x = v291;
            v551.origin.y = v292;
            v551.size.width = v272;
            v551.size.height = v273;
            CGFloat v294 = CGRectGetMaxY(v551);
            double v295 = v403;
            *(double *)v285 = v405;
            *((double *)v285 + 1) = v295;
            *((double *)v285 + 2) = v293;
            *((double *)v285 + 3) = v281 * v294;
            double v296 = v457;
            *((void *)v285 + 4) = 0x3FE0000000000000;
            v297 = &v198[40 * *(void *)&v442];
            v552.origin.x = v286;
            CGFloat v298 = v437;
            v552.origin.y = v437;
            v552.size.width = v290;
            CGFloat v299 = v445;
            v552.size.height = v445;
            double v405 = v296 * CGRectGetMaxX(v552);
            v553.origin.x = v286;
            v553.origin.y = v298;
            v553.size.width = v290;
            v553.size.height = v299;
            double v300 = v281 * CGRectGetMaxY(v553);
            CGFloat v301 = v444;
            v554.origin.x = v444;
            CGFloat v302 = v435;
            v554.origin.y = v435;
            v554.size.width = v272;
            v554.size.height = v273;
            double v303 = v296 * CGRectGetMaxX(v554);
            v555.origin.x = v301;
            v555.origin.y = v302;
            v555.size.width = v272;
            CGFloat v304 = v449;
            v555.size.height = v273;
            CGFloat v305 = CGRectGetMaxY(v555);
            *(double *)v297 = v405;
            *((double *)v297 + 1) = v300;
            *((double *)v297 + 2) = v303;
            *((double *)v297 + 3) = v281 * v305;
            *((void *)v297 + 4) = 0x3FE0000000000000;
            int v215 = v169;
            v306 = &v198[40 * v169];
            CGFloat v217 = v453;
            v556.origin.x = v453;
            CGFloat v218 = v452;
            v556.origin.y = v452;
            v556.size.width = v450;
            v556.size.height = v304;
            CGFloat v307 = CGRectGetMinX(v556);
            double v214 = v457;
            double v308 = v457 * v307;
            v557.origin.x = v217;
            v557.origin.y = v218;
            v557.size.width = v450;
            v557.size.height = v304;
            double v309 = v281 * CGRectGetMinY(v557);
            v558.origin.x = v217;
            v558.origin.y = v218;
            v558.size.width = v450;
            v558.size.height = v304;
            double v310 = v214 * CGRectGetMinX(v558);
            v559.origin.x = v217;
            v559.origin.y = v218;
            v559.size.width = v450;
            v559.size.height = v304;
            CGFloat v311 = CGRectGetMaxY(v559);
            *(double *)v306 = v308;
            *((double *)v306 + 1) = v309;
            *((double *)v306 + 2) = v310;
            *((double *)v306 + 3) = v281 * v311;
            CGFloat v225 = v450;
            *((void *)v306 + 4) = 0x3FE0000000000000;
            uint64_t v226 = 40 * *(void *)&v170;
            v560.origin.x = v217;
            v560.origin.y = v218;
            v560.size.width = v225;
            v560.size.height = v304;
            double v227 = v214 * CGRectGetMaxX(v560);
            v561.origin.x = v217;
            v561.origin.y = v218;
            v561.size.width = v225;
            v561.size.height = v304;
            double v230 = CGRectGetMinY(v561);
            v562.origin.x = v217;
            v562.origin.y = v218;
            v562.size.width = v225;
            v562.size.height = v304;
            double MaxX = CGRectGetMaxX(v562);
            v563.origin.x = v217;
            v563.origin.y = v218;
            v563.size.width = v225;
            v563.size.height = v304;
            double v231 = CGRectGetMaxY(v563);
          }
          *(double *)&v198[v226] = v227;
          int v268 = LODWORD(v191);
          double v266 = v170;
        }
        else
        {
          double v405 = v170;
          int v215 = v169;
          v520.origin.x = v173;
          v520.origin.y = v174;
          v520.size.width = v175;
          v520.size.height = v176;
          CGFloat v232 = CGRectGetMaxY(v520);
          double v233 = v456;
          double v234 = v456 * v232;
          v521.origin.x = v173;
          v521.origin.y = v174;
          v521.size.width = v175;
          v521.size.height = v176;
          double v235 = v188 * CGRectGetMinX(v521);
          v236 = &v451[40 * *(void *)&v168];
          v237 = &v451[40 * *(void *)&v430];
          CGFloat v238 = v173;
          CGFloat v239 = v174;
          CGFloat v240 = v175;
          double v241 = v176;
          if (v407)
          {
            CGFloat v242 = CGRectGetMaxY(*(CGRect *)&v238);
            *(double *)v189 = v190;
            *((double *)v189 + 1) = v234;
            *((double *)v189 + 2) = v235;
            *((double *)v189 + 3) = v233 * v242;
            *((void *)v189 + 4) = 0x3FE0000000000000;
            v522.origin.x = v173;
            v522.origin.y = v174;
            v522.size.width = v175;
            v522.size.height = v176;
            CGFloat v243 = CGRectGetMaxX(v522);
            double v244 = v457;
            double v403 = v457 * v243;
            v523.origin.x = v173;
            v523.origin.y = v174;
            v523.size.width = v175;
            v523.size.height = v176;
            double v245 = v233 * CGRectGetMaxY(v523);
            v524.origin.x = v173;
            v524.origin.y = v174;
            v524.size.width = v175;
            v524.size.height = v176;
            double v246 = v244 * CGRectGetMaxX(v524);
            v525.origin.x = v173;
            v525.origin.y = v174;
            v525.size.width = v175;
            v525.size.height = v176;
            CGFloat v247 = CGRectGetMaxY(v525);
            *(double *)v236 = v403;
            *((double *)v236 + 1) = v245;
            *((double *)v236 + 2) = v246;
            *((double *)v236 + 3) = v233 * v247;
            *((void *)v236 + 4) = 0x3FE0000000000000;
            double v248 = v233;
            CGFloat v249 = v444;
            v526.origin.x = v444;
            CGFloat v250 = v435;
            v526.origin.y = v435;
            CGFloat v251 = v433;
            v526.size.width = v433;
            CGFloat v252 = v436;
            v526.size.height = v436;
            double v253 = v244;
            CGFloat v445 = v244 * CGRectGetMinX(v526);
            v527.origin.x = v249;
            v527.origin.y = v250;
            v527.size.width = v251;
            v527.size.height = v252;
            double v254 = v248 * CGRectGetMinY(v527);
            v528.origin.x = v249;
            v528.origin.y = v250;
            v528.size.width = v251;
            v528.size.height = v252;
            double v255 = v253 * CGRectGetMinX(v528);
            v529.origin.x = v249;
            v529.origin.y = v250;
            v529.size.width = v251;
            v529.size.height = v252;
            CGFloat v256 = CGRectGetMinY(v529);
            *(CGFloat *)v237 = v445;
            *((double *)v237 + 1) = v254;
            *((double *)v237 + 2) = v255;
            *((double *)v237 + 3) = v248 * v256;
            *((void *)v237 + 4) = 0x3FE0000000000000;
            v257 = v451;
            v258 = &v451[40 * *(void *)&v442];
            v530.origin.x = v249;
            v530.origin.y = v250;
            v530.size.width = v251;
            v530.size.height = v252;
            CGFloat v445 = v253 * CGRectGetMaxX(v530);
            v531.origin.x = v249;
            v531.origin.y = v250;
            v531.size.width = v251;
            v531.size.height = v252;
            double v259 = v248 * CGRectGetMinY(v531);
            v532.origin.x = v249;
            v532.origin.y = v250;
            v532.size.width = v251;
            v532.size.height = v252;
            double v260 = v253 * CGRectGetMaxX(v532);
            v533.origin.x = v249;
            v533.origin.y = v250;
            v533.size.width = v251;
            v533.size.height = v252;
            CGFloat v261 = CGRectGetMinY(v533);
            *(CGFloat *)v258 = v445;
            *((double *)v258 + 1) = v259;
            *((double *)v258 + 2) = v260;
            *((double *)v258 + 3) = v248 * v261;
            *((void *)v258 + 4) = 0x3FE0000000000000;
            v262 = &v257[40 * v169];
            v534.origin.x = v249;
            v534.origin.y = v250;
            v534.size.width = v251;
            v534.size.height = v252;
            CGFloat v445 = v253 * CGRectGetMinX(v534);
            v535.origin.x = v249;
            v535.origin.y = v250;
            v535.size.width = v251;
            v535.size.height = v252;
            double v263 = v248 * CGRectGetMaxY(v535);
            v536.origin.x = v249;
            v536.origin.y = v250;
            v536.size.width = v251;
            v536.size.height = v252;
            double v264 = v253 * CGRectGetMinX(v536);
            v537.origin.x = v249;
            v537.origin.y = v250;
            v537.size.width = v251;
            v537.size.height = v252;
            CGFloat v265 = CGRectGetMaxY(v537);
            *(CGFloat *)v262 = v445;
            *((double *)v262 + 1) = v263;
            *((double *)v262 + 2) = v264;
            *((double *)v262 + 3) = v248 * v265;
            CGFloat v225 = v450;
            *((void *)v262 + 4) = 0x3FE0000000000000;
            double v266 = v405;
            v538.origin.x = v249;
            v538.origin.y = v250;
            v538.size.width = v251;
            v538.size.height = v252;
            CGFloat v445 = v253 * CGRectGetMaxX(v538);
            v539.origin.x = v249;
            v539.origin.y = v250;
            v539.size.width = v251;
            v539.size.height = v252;
            CGFloat v267 = CGRectGetMaxY(v539);
            v540.origin.x = v249;
            v540.origin.y = v250;
            v540.size.width = v251;
            v540.size.height = v252;
            double MaxX = CGRectGetMaxX(v540);
            v541.origin.x = v249;
            v541.origin.y = v250;
            v541.size.width = v251;
            v541.size.height = v252;
            double v231 = CGRectGetMaxY(v541);
            *(CGFloat *)&v257[40 * *(void *)&v266] = v445;
            double v214 = v253;
            double v230 = v267;
            CGFloat v217 = v453;
            CGFloat v218 = v452;
            int v268 = LODWORD(v430);
          }
          else
          {
            CGFloat v312 = CGRectGetMinY(*(CGRect *)&v238);
            *(double *)v189 = v190;
            *((double *)v189 + 1) = v234;
            *((double *)v189 + 2) = v235;
            *((double *)v189 + 3) = v233 * v312;
            *((void *)v189 + 4) = 0x3FE0000000000000;
            v564.origin.x = v173;
            v564.origin.y = v174;
            v564.size.width = v175;
            v564.size.height = v176;
            CGFloat v313 = CGRectGetMaxX(v564);
            double v314 = v457;
            double v403 = v457 * v313;
            v565.origin.x = v173;
            v565.origin.y = v174;
            v565.size.width = v175;
            v565.size.height = v176;
            double v315 = v233 * CGRectGetMaxY(v565);
            v566.origin.x = v173;
            v566.origin.y = v174;
            v566.size.width = v175;
            v566.size.height = v176;
            double v316 = v314 * CGRectGetMaxX(v566);
            v567.origin.x = v173;
            v567.origin.y = v174;
            v567.size.width = v175;
            v567.size.height = v176;
            CGFloat v317 = CGRectGetMinY(v567);
            *(double *)v236 = v403;
            *((double *)v236 + 1) = v315;
            *((double *)v236 + 2) = v316;
            *((double *)v236 + 3) = v233 * v317;
            *((void *)v236 + 4) = 0x3FE0000000000000;
            CGFloat v318 = v444;
            v568.origin.x = v444;
            CGFloat v445 = v176;
            CGFloat v319 = v435;
            v568.origin.y = v435;
            CGFloat v320 = v175;
            CGFloat v321 = v433;
            v568.size.width = v433;
            CGFloat v322 = v436;
            v568.size.height = v436;
            CGFloat v323 = CGRectGetMinX(v568);
            double v324 = v457;
            double v403 = v457 * v323;
            v569.origin.x = v318;
            v569.origin.y = v319;
            v569.size.width = v321;
            v569.size.height = v322;
            CGFloat v436 = v322;
            CGFloat v325 = CGRectGetMinY(v569);
            double v326 = v456;
            double v402 = v456 * v325;
            v570.origin.x = v173;
            v570.origin.y = v174;
            CGFloat v441 = v320;
            v570.size.width = v320;
            CGFloat v327 = v445;
            v570.size.height = v445;
            double v401 = v324 * CGRectGetMinX(v570);
            v571.origin.x = v173;
            v571.origin.y = v174;
            v571.size.width = v320;
            CGFloat v328 = v327;
            v571.size.height = v327;
            CGFloat v329 = CGRectGetMinY(v571);
            double v330 = v402;
            *(double *)v237 = v403;
            *((double *)v237 + 1) = v330;
            *((double *)v237 + 2) = v401;
            *((double *)v237 + 3) = v326 * v329;
            *((void *)v237 + 4) = 0x3FE0000000000000;
            v331 = v451;
            v332 = &v451[40 * *(void *)&v442];
            CGFloat v333 = v444;
            v572.origin.x = v444;
            v572.origin.y = v319;
            CGFloat v334 = v433;
            v572.size.width = v433;
            v572.size.height = v322;
            CGFloat v335 = CGRectGetMaxX(v572);
            double v336 = v457;
            double v403 = v457 * v335;
            v573.origin.x = v333;
            v573.origin.y = v319;
            v573.size.width = v334;
            v573.size.height = v322;
            CGFloat v337 = CGRectGetMinY(v573);
            double v338 = v456;
            double v402 = v456 * v337;
            v574.origin.x = v173;
            v574.origin.y = v174;
            CGFloat v339 = v441;
            v574.size.width = v441;
            v574.size.height = v328;
            double v401 = v336 * CGRectGetMaxX(v574);
            v575.origin.x = v173;
            v575.origin.y = v174;
            v575.size.width = v339;
            v575.size.height = v328;
            CGFloat v340 = CGRectGetMinY(v575);
            double v341 = v338;
            double v342 = v402;
            *(double *)v332 = v403;
            *((double *)v332 + 1) = v342;
            *((double *)v332 + 2) = v401;
            *((double *)v332 + 3) = v338 * v340;
            *((void *)v332 + 4) = 0x3FE0000000000000;
            v343 = &v331[40 * v169];
            CGFloat v344 = v444;
            v576.origin.x = v444;
            v576.origin.y = v319;
            v576.size.width = v334;
            CGFloat v345 = v436;
            v576.size.height = v436;
            double v403 = v336 * CGRectGetMinX(v576);
            v577.origin.x = v344;
            v577.origin.y = v319;
            v577.size.width = v334;
            v577.size.height = v345;
            double v402 = v341 * CGRectGetMaxY(v577);
            v578.origin.x = v173;
            v578.origin.y = v174;
            CGFloat v346 = v441;
            v578.size.width = v441;
            CGFloat v347 = v445;
            v578.size.height = v445;
            double v401 = v336 * CGRectGetMinX(v578);
            double v348 = v336;
            v579.origin.x = v173;
            v579.origin.y = v174;
            v579.size.width = v346;
            v579.size.height = v347;
            double v349 = v456 * CGRectGetMaxY(v579);
            double v350 = v402;
            *(double *)v343 = v403;
            *((double *)v343 + 1) = v350;
            *((double *)v343 + 2) = v401;
            *((double *)v343 + 3) = v349;
            *((void *)v343 + 4) = 0x3FE0000000000000;
            double v266 = v405;
            CGFloat v351 = v444;
            v580.origin.x = v444;
            v580.origin.y = v319;
            v580.size.width = v334;
            CGFloat v352 = v436;
            v580.size.height = v436;
            double v403 = v348 * CGRectGetMaxX(v580);
            v581.origin.x = v351;
            v581.origin.y = v319;
            v581.size.width = v334;
            v581.size.height = v352;
            double v230 = CGRectGetMaxY(v581);
            v582.origin.x = v173;
            v582.origin.y = v174;
            v582.size.width = v346;
            CGFloat v353 = v445;
            v582.size.height = v445;
            double MaxX = CGRectGetMaxX(v582);
            v583.origin.x = v173;
            v583.origin.y = v174;
            v583.size.width = v346;
            v583.size.height = v353;
            double v231 = CGRectGetMaxY(v583);
            *(double *)&v331[40 * *(void *)&v266] = v403;
            double v214 = v457;
            CGFloat v217 = v453;
            CGFloat v218 = v452;
            int v268 = LODWORD(v430);
            CGFloat v225 = v450;
          }
        }
        uint64_t v354 = v422;
        int v355 = v422 + 12;
        uint64_t v356 = v422 + 13;
        double v357 = v456;
        v358 = v451;
        v359 = &v451[40 * *(void *)&v266];
        *((double *)v359 + 1) = v456 * v230;
        *((double *)v359 + 2) = v214 * MaxX;
        *((double *)v359 + 3) = v357 * v231;
        *((void *)v359 + 4) = 0x3FE0000000000000;
        v360 = &v358[40 * v354 + 480];
        v584.origin.x = v217;
        v584.origin.y = v218;
        v584.size.width = v225;
        CGFloat v361 = v449;
        v584.size.height = v449;
        CGFloat v445 = v214 * CGRectGetMinX(v584);
        v585.origin.x = v217;
        v585.origin.y = v218;
        v585.size.width = v225;
        v585.size.height = v361;
        double v362 = v357 * CGRectGetMaxY(v585);
        v586.origin.x = v217;
        v586.origin.y = v218;
        v586.size.width = v225;
        v586.size.height = v361;
        double v363 = v214 * CGRectGetMinX(v586);
        v587.origin.x = v217;
        v587.origin.y = v218;
        v587.size.width = v225;
        v587.size.height = v361;
        CGFloat v364 = CGRectGetMaxY(v587);
        *(CGFloat *)v360 = v445;
        *((double *)v360 + 1) = v362;
        *((double *)v360 + 2) = v363;
        *((double *)v360 + 3) = v357 * v364;
        *((void *)v360 + 4) = 0x3FE0000000000000;
        v365 = &v358[40 * v356];
        v588.origin.x = v217;
        v588.origin.y = v218;
        v588.size.width = v225;
        v588.size.height = v361;
        double v366 = v214 * CGRectGetMaxX(v588);
        v589.origin.x = v217;
        v589.origin.y = v218;
        v589.size.width = v225;
        v589.size.height = v361;
        double v367 = v357 * CGRectGetMaxY(v589);
        v590.origin.x = v217;
        v590.origin.y = v218;
        v590.size.width = v225;
        v590.size.height = v361;
        double v368 = v214 * CGRectGetMaxX(v590);
        v591.origin.x = v217;
        v591.origin.y = v218;
        v591.size.width = v225;
        v591.size.height = v361;
        CGFloat v369 = CGRectGetMaxY(v591);
        *(double *)v365 = v366;
        *((double *)v365 + 1) = v367;
        *((double *)v365 + 2) = v368;
        *((double *)v365 + 3) = v357 * v369;
        *((void *)v365 + 4) = 0x3FE0000000000000;
        v370 = v429;
        v371 = (int32x4_t *)&v429[32 * *(void *)&v431];
        __int32 v372 = v439;
        v371->i32[0] = v354;
        v371->i32[1] = v372;
        int v373 = v423;
        __int32 v374 = v424;
        v371->i32[2] = v423;
        v371->i32[3] = v374;
        int32x4_t v375 = v438;
        v371[1] = v438;
        uint64_t v376 = v448;
        v377 = (int32x4_t *)&v370[32 * v448];
        v377[4].i32[0] = v374;
        v377[4].i32[1] = v373;
        int v378 = LODWORD(MaxY);
        int v379 = v426;
        v377[4].i32[2] = LODWORD(MaxY);
        v377[4].i32[3] = v379;
        v377[5] = v375;
        v377[6].i32[0] = v379;
        v377[6].i32[1] = v378;
        int v380 = LODWORD(v442);
        v377[6].i32[2] = LODWORD(v442);
        v377[6].i32[3] = v268;
        v377[7] = v375;
        v377[8].i32[0] = v268;
        v377[8].i32[1] = v380;
        v377[8].i32[2] = LODWORD(v266);
        v377[8].i32[3] = v215;
        v377[9] = v375;
        v377[10].i32[0] = v215;
        v377[10].i32[1] = LODWORD(v266);
        v377[10].i32[2] = v356;
        v377[10].i32[3] = v355;
        v377[11] = v375;
        v377[12].i32[0] = LODWORD(v432);
        v377[12].i32[1] = v355;
        int v381 = v440;
        v377[12].i32[2] = v356;
        v377[12].i32[3] = v381;
        uint64_t v448 = v376 + 7;
        uint64_t v128 = v354 + 14;
        v377[13] = v375;
        CGFloat v151 = v455;
        CGFloat v147 = v454;
        double v13 = v443;
        double v89 = v446;
        id v21 = v420;
        goto LABEL_29;
      }
LABEL_30:
      uint64_t v25 = v447 + 1;
    }
    while (v23 != v447 + 1);
    uint64_t v23 = [v21 countByEnumeratingWithState:&v458 objects:v462 count:16];
  }
  while (v23);
LABEL_34:

  v592.origin.x = v14;
  v592.origin.y = v13;
  v592.size.width = v15;
  v592.size.height = v432;
  if (CGRectIsNull(v592))
  {
    uint64_t v382 = v448;
    v383 = v429;
  }
  else
  {
    v384 = &v451[40 * v24];
    double v385 = v17 * v457;
    v593.origin.x = v14;
    v593.origin.y = v13;
    v593.size.width = v15;
    CGFloat v386 = v432;
    v593.size.height = v432;
    CGFloat v387 = CGRectGetMinY(v593);
    double v388 = v456;
    double v389 = v456 * v387;
    v594.origin.x = v14;
    v594.origin.y = v13;
    v594.size.width = v15;
    v594.size.height = v386;
    CGFloat v390 = CGRectGetMinY(v594);
    *(double *)v384 = v385;
    *((double *)v384 + 1) = v389;
    *((double *)v384 + 2) = v385;
    *((double *)v384 + 3) = v388 * v390;
    *((void *)v384 + 4) = 0x3FE0000000000000;
    v595.origin.x = v14;
    v595.origin.y = v13;
    v595.size.width = v15;
    v595.size.height = v386;
    double v391 = v388 * CGRectGetMaxY(v595);
    v596.origin.x = v14;
    v596.origin.y = v13;
    v596.size.width = v15;
    v596.size.height = v386;
    CGFloat v392 = CGRectGetMaxY(v596);
    *((double *)v384 + 5) = v385;
    *((double *)v384 + 6) = v391;
    *((double *)v384 + 7) = v385;
    *((double *)v384 + 8) = v388 * v392;
    *((void *)v384 + 9) = 0x3FE0000000000000;
    int v20 = v414;
    uint64_t v393 = v448;
    v383 = v429;
    v394 = (int32x4_t *)&v429[32 * v448];
    __int32 v395 = v440;
    v394->i32[0] = v439;
    v394->i32[1] = v395;
    v394->i32[2] = v24 + 1;
    v394->i32[3] = v24;
    v394[1] = vdupq_n_s32(0x7F7FFFFFu);
    uint64_t v382 = v393 + 1;
    v24 += 2;
  }
  v396 = [MEMORY[0x1E4F39C18] meshTransformWithVertexCount:v24 vertices:v451 faceCount:v382 faces:v383 depthNormalization:*MEMORY[0x1E4F39ED8]];

  return v396;
}

- (BOOL)disableMeshOptimization
{
  return *(&self->_disableMeshOptimization + 1);
}

- (void)setDisableMeshOptimization:(BOOL)a3
{
  *(&self->_disableMeshOptimization + 1) = a3;
}

- (NSArray)startKeysOrdered
{
  return self->_startKeysOrdered;
}

- (void)setStartKeysOrdered:(id)a3
{
}

- (NSArray)endKeysOrdered
{
  return self->_endKeysOrdered;
}

- (void)setEndKeysOrdered:(id)a3
{
}

- (NSArray)startGeometries
{
  return self->_startGeometries;
}

- (void)setStartGeometries:(id)a3
{
}

- (NSArray)transitionKeys
{
  return self->_transitionKeys;
}

- (void)setTransitionKeys:(id)a3
{
}

- (NSArray)keyInfos
{
  return self->_keyInfos;
}

- (void)setKeyInfos:(id)a3
{
}

- (double)previousProgress
{
  return self->_previousProgress;
}

- (void)setPreviousProgress:(double)a3
{
  self->_previousProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyInfos, 0);
  objc_storeStrong((id *)&self->_transitionKeys, 0);
  objc_storeStrong((id *)&self->_startGeometries, 0);
  objc_storeStrong((id *)&self->_endKeysOrdered, 0);
  objc_storeStrong((id *)&self->_startKeysOrdered, 0);
}

@end