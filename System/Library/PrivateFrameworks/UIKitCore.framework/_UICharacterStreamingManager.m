@interface _UICharacterStreamingManager
- (BOOL)discardNextHypothesis;
- (NSMutableArray)pendingEdits;
- (NSString)lastHypothesis;
- (NSString)previousHypothesis;
- (NSString)targetHypothesis;
- (_UICharacterStreamingManager)initWithTextView:(id)a3;
- (double)minDurationBetweenHypotheses;
- (double)streamingCharacterInsertionRate;
- (void)_displayLinkFired:(id)a3;
- (void)_startStreamingAnimations;
- (void)_stopStreamingAnimation;
- (void)commitFinalResults;
- (void)setDiscardNextHypothesis:(BOOL)a3;
- (void)setLastHypothesis:(id)a3;
- (void)setMinDurationBetweenHypotheses:(double)a3;
- (void)setPendingEdits:(id)a3;
- (void)setPreviousHypothesis:(id)a3;
- (void)setStreamingCharacterInsertionRate:(double)a3;
- (void)setTargetHypothesis:(id)a3;
- (void)setWords:(id)a3;
- (void)setupToInsertResultForNewHypothesis:(id)a3;
@end

@implementation _UICharacterStreamingManager

- (_UICharacterStreamingManager)initWithTextView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UICharacterStreamingManager;
  v5 = [(_UICharacterStreamingManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textView, v4);
    *(_OWORD *)&v6->_streamingCharacterInsertionRate = xmmword_186B9D9D0;
  }

  return v6;
}

- (void)commitFinalResults
{
  self->_committingFinalResults = 1;
  if (!self->_streamingAnimationActive)
  {
    [(_UICharacterStreamingManager *)self setTargetHypothesis:0];
    [(_UICharacterStreamingManager *)self setLastHypothesis:0];
    [(_UICharacterStreamingManager *)self setPendingEdits:0];
  }
}

- (void)setWords:(id)a3
{
  self->_committingFinalResults = 0;
  id v8 = [a3 componentsJoinedByString:&stru_1ED0E84C0];
  uint64_t v4 = [(_UICharacterStreamingManager *)self previousHypothesis];
  if (!v4
    || (v5 = (void *)v4,
        [(_UICharacterStreamingManager *)self previousHypothesis],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v8 isEqualToString:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    [(_UICharacterStreamingManager *)self setupToInsertResultForNewHypothesis:v8];
    [(_UICharacterStreamingManager *)self setPreviousHypothesis:v8];
  }
}

- (void)_stopStreamingAnimation
{
  [(CADisplayLink *)self->_streamingAnimationDisplayLink invalidate];
  streamingAnimationDisplayLink = self->_streamingAnimationDisplayLink;
  self->_streamingAnimationDisplayLink = 0;

  self->_streamingAnimationActive = 0;
  if (self->_committingFinalResults)
  {
    [(_UICharacterStreamingManager *)self setTargetHypothesis:0];
    [(_UICharacterStreamingManager *)self setLastHypothesis:0];
    [(_UICharacterStreamingManager *)self setPendingEdits:0];
  }
}

- (void)_startStreamingAnimations
{
  if (!self->_streamingAnimationActive)
  {
    self->_streamingAnimationActive = 1;
    v3 = +[UIScreen mainScreen];
    uint64_t v4 = [v3 displayLinkWithTarget:self selector:sel__displayLinkFired_];
    streamingAnimationDisplayLink = self->_streamingAnimationDisplayLink;
    self->_streamingAnimationDisplayLink = v4;

    v6 = self->_streamingAnimationDisplayLink;
    char v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

    id v8 = self->_streamingAnimationDisplayLink;
    v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:@"UITrackingRunLoopMode"];

    self->_lastAnimationUpdateTimeStamp = CACurrentMediaTime();
  }
}

- (void)_displayLinkFired:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!self->_streamingAnimationActive) {
    goto LABEL_37;
  }
  [v5 timestamp];
  double v8 = v7 - self->_lastAnimationUpdateTimeStamp;
  v9 = [(_UICharacterStreamingManager *)self pendingEdits];
  if (![v9 count])
  {
    v47 = [(_UICharacterStreamingManager *)self lastHypothesis];
    if ([v47 length])
    {
      double minDurationBetweenHypotheses = self->_minDurationBetweenHypotheses;

      if (v8 < minDurationBetweenHypotheses) {
        goto LABEL_37;
      }
      goto LABEL_4;
    }
  }
LABEL_4:
  v10 = [(_UICharacterStreamingManager *)self targetHypothesis];
  v11 = [(_UICharacterStreamingManager *)self lastHypothesis];
  if ([v10 isEqualToString:v11])
  {
    v12 = [(_UICharacterStreamingManager *)self pendingEdits];
    uint64_t v13 = [v12 count];

    if (!v13)
    {
      [(_UICharacterStreamingManager *)self _stopStreamingAnimation];
      goto LABEL_37;
    }
  }
  else
  {
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  v15 = [WeakRetained selectedTextRange];
  v16 = [v15 start];
  v17 = [(_UICharacterStreamingManager *)self lastHypothesis];
  v18 = objc_msgSend(WeakRetained, "positionFromPosition:offset:", v16, -objc_msgSend(v17, "length"));

  if (!v18)
  {
    v18 = [WeakRetained beginningOfDocument];
  }
  if (v18 && v16)
  {
    v19 = [WeakRetained textRangeFromPosition:v18 toPosition:v16];
    if ([v15 isEmpty])
    {
      v60 = v19;
      v20 = [(_UICharacterStreamingManager *)self pendingEdits];
      uint64_t v21 = [v20 count];

      if (!v21)
      {
        v22 = [(_UICharacterStreamingManager *)self lastHypothesis];
        [(_UICharacterStreamingManager *)self targetHypothesis];
        v24 = v23 = v18;
        v25 = +[_EditScriptRanged editScriptFromString:v22 toString:v24 chunkSize:0 orderAtomsAscending:1 operationPrecedence:-1 options:0];

        v26 = [v25 script];
        v27 = (void *)[v26 mutableCopy];

        [(_UICharacterStreamingManager *)self setPendingEdits:v27];
        v18 = v23;
      }
      v28 = [(_UICharacterStreamingManager *)self pendingEdits];
      uint64_t v29 = [v28 count];

      if (!v29)
      {
        v51 = [MEMORY[0x1E4F28B00] currentHandler];
        v52 = [(_UICharacterStreamingManager *)self lastHypothesis];
        [(_UICharacterStreamingManager *)self targetHypothesis];
        v54 = v53 = v18;
        [v51 handleFailureInMethod:a2, self, @"UITextView.m", 355, @"Ran out of edits but we're still not done yet\n%@\n%@", v52, v54 object file lineNumber description];

        v18 = v53;
      }
      unint64_t v30 = (unint64_t)(v8 * self->_streamingCharacterInsertionRate);
      v19 = v60;
      if (v30)
      {
        v58 = v18;
        v59 = v6;
        [v6 timestamp];
        self->_lastAnimationUpdateTimeStamp = v31;
        v32 = [(_UICharacterStreamingManager *)self lastHypothesis];
        v33 = (void *)[v32 mutableCopy];

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id obj = [(_UICharacterStreamingManager *)self pendingEdits];
        uint64_t v34 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          v55 = v16;
          v56 = v15;
          id v57 = WeakRetained;
          uint64_t v36 = 0;
          uint64_t v37 = *(void *)v63;
LABEL_20:
          uint64_t v38 = 0;
          uint64_t v39 = v36;
          while (1)
          {
            uint64_t v40 = v38;
            if (*(void *)v63 != v37) {
              objc_enumerationMutation(obj);
            }
            v41 = *(void **)(*((void *)&v62 + 1) + 8 * v38);
            uint64_t v42 = [v41 editRange];
            uint64_t v44 = v43;
            v45 = [v41 replacementText];
            objc_msgSend(v33, "replaceCharactersInRange:withString:", v42, v44, v45);

            unint64_t v46 = v39 + v40 + 1;
            if (v46 >= v30) {
              break;
            }
            uint64_t v38 = v40 + 1;
            if (v35 == v40 + 1)
            {
              uint64_t v35 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
              uint64_t v36 = v39 + v38;
              if (v35) {
                goto LABEL_20;
              }
              unint64_t v46 = v39 + v40 + 1;
              break;
            }
          }
          v15 = v56;
          id WeakRetained = v57;
          v16 = v55;
          v19 = v60;
        }
        else
        {
          unint64_t v46 = 0;
        }

        v50 = [(_UICharacterStreamingManager *)self pendingEdits];
        objc_msgSend(v50, "removeObjectsInRange:", 0, v46);

        [WeakRetained replaceRange:v19 withText:v33];
        [(_UICharacterStreamingManager *)self setLastHypothesis:v33];

        v18 = v58;
        v6 = v59;
      }
    }
    else
    {
      [WeakRetained replaceRange:v15 withText:&stru_1ED0E84C0];
      v49 = [WeakRetained textRangeFromPosition:v16 toPosition:v16];
      [WeakRetained setSelectedTextRange:v49];
    }
  }

LABEL_37:
}

- (void)setupToInsertResultForNewHypothesis:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_streamingAnimationActive)
  {
    [(_UICharacterStreamingManager *)self setTargetHypothesis:v4];
  }
  else
  {
    id v5 = [(_UICharacterStreamingManager *)self lastHypothesis];

    if (!v5) {
      [(_UICharacterStreamingManager *)self setLastHypothesis:&stru_1ED0E84C0];
    }
    [(_UICharacterStreamingManager *)self setTargetHypothesis:v6];
    [(_UICharacterStreamingManager *)self _startStreamingAnimations];
  }
}

- (NSString)previousHypothesis
{
  return self->_previousHypothesis;
}

- (void)setPreviousHypothesis:(id)a3
{
}

- (NSString)lastHypothesis
{
  return self->_lastHypothesis;
}

- (void)setLastHypothesis:(id)a3
{
}

- (NSString)targetHypothesis
{
  return self->_targetHypothesis;
}

- (void)setTargetHypothesis:(id)a3
{
}

- (NSMutableArray)pendingEdits
{
  return self->_pendingEdits;
}

- (void)setPendingEdits:(id)a3
{
}

- (double)streamingCharacterInsertionRate
{
  return self->_streamingCharacterInsertionRate;
}

- (void)setStreamingCharacterInsertionRate:(double)a3
{
  self->_streamingCharacterInsertionRate = a3;
}

- (double)minDurationBetweenHypotheses
{
  return self->_minDurationBetweenHypotheses;
}

- (void)setMinDurationBetweenHypotheses:(double)a3
{
  self->_double minDurationBetweenHypotheses = a3;
}

- (BOOL)discardNextHypothesis
{
  return self->_discardNextHypothesis;
}

- (void)setDiscardNextHypothesis:(BOOL)a3
{
  self->_discardNextHypothesis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEdits, 0);
  objc_storeStrong((id *)&self->_targetHypothesis, 0);
  objc_storeStrong((id *)&self->_lastHypothesis, 0);
  objc_storeStrong((id *)&self->_previousHypothesis, 0);
  objc_storeStrong((id *)&self->_streamingAnimationDisplayLink, 0);
  objc_destroyWeak((id *)&self->_textView);
}

@end