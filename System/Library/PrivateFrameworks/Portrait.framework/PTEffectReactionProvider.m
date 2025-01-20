@interface PTEffectReactionProvider
- (BOOL)runGestureDetectionForTimeStamp:(id *)a3;
- (NSArray)latestGestures;
- (NSArray)latestReactions;
- (PTEffectReactionProvider)initWithFrameSize:(CGSize)a3 sharedResources:(id)a4 asyncInitQueue:(id)a5 externalHandDetectionsEnabled:(BOOL)a6;
- (float)gestureDetectionFPS;
- (void)gesturesAvailable:(id)a3 forTimeStamp:(id *)a4;
- (void)setGestureDetectionFPS:(float)a3;
- (void)setLatestGestures:(id)a3;
- (void)setLatestReactions:(id)a3;
- (void)updateWithFrame:(__CVBuffer *)a3 withTimeStamp:(id *)a4 withRotationDegrees:(int)a5 withDetectedHands:(id)a6 withDetectedFaces:(id)a7 asyncWork:(id)a8;
@end

@implementation PTEffectReactionProvider

- (void)updateWithFrame:(__CVBuffer *)a3 withTimeStamp:(id *)a4 withRotationDegrees:(int)a5 withDetectedHands:(id)a6 withDetectedFaces:(id)a7 asyncWork:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = *a4;
  if ([(PTEffectReactionProvider *)self runGestureDetectionForTimeStamp:&v19])
  {
    gestureDetector = self->_gestureDetector;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = *a4;
    if ([(PTHandGestureDetector *)gestureDetector detectGesturesFromBuffer:a3 timeStamp:&v19 withRotationDegrees:v10 withDetectedHands:v14 withDetectedFaces:v15 asyncWork:v16])
    {
      long long v18 = *(_OWORD *)&a4->var0;
      self->_lastFrameTimeStamp.epoch = a4->var3;
      *(_OWORD *)&self->_lastFrameTimeStamp.value = v18;
    }
  }
}

- (BOOL)runGestureDetectionForTimeStamp:(id *)a3
{
  if ((a3->var2 & 1) == 0)
  {
    v3 = _PTLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[PTEffectReactionProvider runGestureDetectionForTimeStamp:](v3);
    }

    return 1;
  }
  if ((self->_lastFrameTimeStamp.flags & 1) == 0) {
    return 1;
  }
  CMTime lhs = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 lastFrameTimeStamp = self->_lastFrameTimeStamp;
  CMTimeSubtract(&time, &lhs, (CMTime *)&lastFrameTimeStamp);
  float v5 = CMTimeGetSeconds(&time) * 1000.0;
  float gestureDetectionFPS = self->_gestureDetectionFPS;
  if (gestureDetectionFPS < 0.01) {
    float gestureDetectionFPS = 0.01;
  }
  float v7 = 1000.0 / gestureDetectionFPS;
  BOOL v8 = gestureDetectionFPS < 30.0;
  float v9 = 33.333;
  if (v8) {
    float v9 = v7;
  }
  return v9 <= v5;
}

- (NSArray)latestReactions
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)latestGestures
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (PTEffectReactionProvider)initWithFrameSize:(CGSize)a3 sharedResources:(id)a4 asyncInitQueue:(id)a5 externalHandDetectionsEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.height;
  double width = a3.width;
  id v11 = a4;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PTEffectReactionProvider;
  v13 = [(PTEffectReactionProvider *)&v31 init];
  id v14 = v13;
  if (v13)
  {
    v13->_float gestureDetectionFPS = 5.0;
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    personIdentifierToPerson = v14->_personIdentifierToPerson;
    v14->_personIdentifierToPerson = (NSMutableDictionary *)v15;

    v14->_globalTriggerID = 0;
    uint64_t v17 = [v11 handGestureDetector];
    if (v17)
    {
      long long v18 = (void *)v17;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = [v11 handGestureDetector];
      [v19 frameSize];
      if (v20 == width)
      {
        v21 = [v11 handGestureDetector];
        [v21 frameSize];
        double v23 = v22;

        if (v23 == height)
        {
          uint64_t v24 = [v11 handGestureDetector];
          gestureDetector = v14->_gestureDetector;
          v14->_gestureDetector = (PTHandGestureDetector *)v24;

LABEL_8:
          [(PTHandGestureDetector *)v14->_gestureDetector setDelegate:v14];
          uint64_t v28 = MEMORY[0x1E4F1F9F8];
          *(_OWORD *)&v14->_lastFrameTimeStamp.value = *MEMORY[0x1E4F1F9F8];
          v14->_lastFrameTimeStamp.epoch = *(void *)(v28 + 16);
          v29 = v14;
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    v26 = -[PTHandGestureDetector initWithFrameSize:asyncInitQueue:externalHandDetectionsEnabled:]([PTHandGestureDetector alloc], "initWithFrameSize:asyncInitQueue:externalHandDetectionsEnabled:", v12, v6, width, height);
    v27 = v14->_gestureDetector;
    v14->_gestureDetector = v26;

    [v11 setHandGestureDetector:v14->_gestureDetector];
    goto LABEL_8;
  }
LABEL_9:

  return v14;
}

- (void)gesturesAvailable:(id)a3 forTimeStamp:(id *)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(PTEffectReactionProvider *)self setLatestGestures:v5];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v67 = self;
  BOOL v6 = [(NSMutableDictionary *)self->_personIdentifierToPerson allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v79 objects:v87 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v80 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v79 + 1) + 8 * i), "setNumFramesInactive:", objc_msgSend(*(id *)(*((void *)&v79 + 1) + 8 * i), "numFramesInactive") + 1);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v79 objects:v87 count:16];
    }
    while (v8);
  }

  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if ([v5 count])
  {
    unint64_t v12 = 0;
    uint64_t v13 = MEMORY[0x1E4F1CC28];
    do
    {
      [v11 addObject:v13];
      ++v12;
    }
    while ([v5 count] > v12);
  }
  id v14 = v67;
  v68 = v11;
  if ([v5 count])
  {
    unint64_t v15 = 0;
    uint64_t v16 = 1;
    do
    {
      uint64_t v17 = [v11 objectAtIndexedSubscript:v15];
      int v18 = [v17 intValue];

      if (v18)
      {
        ++v15;
      }
      else
      {
        personIdentifierToPerson = v14->_personIdentifierToPerson;
        double v20 = [v5 objectAtIndexedSubscript:v15];
        v21 = [v20 personID];
        double v22 = [(NSMutableDictionary *)personIdentifierToPerson objectForKeyedSubscript:v21];

        if (v22)
        {
          [(PTPersonWithReactions *)v22 setNumFramesInactive:0];
        }
        else
        {
          double v23 = [PTPersonWithReactions alloc];
          uint64_t v24 = [v5 objectAtIndexedSubscript:v15];
          v25 = [v24 personID];
          double v22 = [(PTPersonWithReactions *)v23 initWithIdentifier:v25];

          [(PTPersonWithReactions *)v22 setReactionTriggerID:&v67->_globalTriggerID];
          v26 = v14->_personIdentifierToPerson;
          v27 = [(PTPersonWithReactions *)v22 identifier];
          [(NSMutableDictionary *)v26 setObject:v22 forKey:v27];

          uint64_t v28 = _PTLogSystem();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = [(PTPersonWithReactions *)v22 identifier];
            int v30 = [v29 intValue];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v30;
            _os_log_impl(&dword_1D0778000, v28, OS_LOG_TYPE_INFO, "ReactionProvider: Created person %i", buf, 8u);
          }
        }
        objc_super v31 = 0;
        if ([v5 count] > v15 + 1)
        {
          unint64_t v32 = v16;
          do
          {
            v33 = [v5 objectAtIndexedSubscript:v32];
            v34 = [v33 personID];
            v35 = [v5 objectAtIndexedSubscript:v15];
            v36 = [v35 personID];

            if (v34 == v36)
            {
              v37 = [v5 objectAtIndexedSubscript:v32];

              int v38 = [v37 handChirality];
              v39 = [v5 objectAtIndexedSubscript:v15];
              int v40 = [v39 handChirality];

              if (v38 == v40)
              {
                v41 = _PTLogSystem();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                  -[PTEffectReactionProvider gesturesAvailable:forTimeStamp:](&v77, v78, v41);
                }
              }
              [v68 setObject:MEMORY[0x1E4F1CC38] atIndexedSubscript:v32];
              objc_super v31 = v37;
            }
            ++v32;
          }
          while ([v5 count] > v32);
        }
        v42 = [v5 objectAtIndexedSubscript:v15];
        int v43 = [v42 handChirality];

        if (v43 == 1)
        {
          id v44 = [v5 objectAtIndexedSubscript:v15];
          id v45 = v31;
        }
        else
        {
          id v44 = v31;
          id v45 = [v5 objectAtIndexedSubscript:v15];
        }
        v46 = v45;
        ++v15;
        *(_OWORD *)buf = *(_OWORD *)&a4->var0;
        int64_t var3 = a4->var3;
        [(PTPersonWithReactions *)v22 updateWithLeftHand:v44 rightHand:v45 timeStamp:buf];

        id v14 = v67;
        id v11 = v68;
      }
      ++v16;
    }
    while ([v5 count] > v15);
  }
  v47 = [MEMORY[0x1E4F1CA48] array];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v48 = [(NSMutableDictionary *)v14->_personIdentifierToPerson allValues];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v73 objects:v84 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v74 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        if ((int)[v53 numFramesInactive] >= 3)
        {
          v54 = [v53 identifier];
          [v47 addObject:v54];

          v55 = _PTLogSystem();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v56 = [v53 identifier];
            int v57 = [v56 intValue];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v57;
            _os_log_impl(&dword_1D0778000, v55, OS_LOG_TYPE_INFO, "ReactionProvider: Removed person %i", buf, 8u);
          }
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v73 objects:v84 count:16];
    }
    while (v50);
  }

  if ([v47 count]) {
    [(NSMutableDictionary *)v67->_personIdentifierToPerson removeObjectsForKeys:v47];
  }
  uint64_t v58 = [(NSMutableDictionary *)v67->_personIdentifierToPerson count];
  v59 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3 * v58];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v60 = [(NSMutableDictionary *)v67->_personIdentifierToPerson allValues];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v69 objects:v83 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v70 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = [*(id *)(*((void *)&v69 + 1) + 8 * k) reactions];
        [v59 addObjectsFromArray:v65];
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v69 objects:v83 count:16];
    }
    while (v62);
  }

  [(PTEffectReactionProvider *)v67 setLatestReactions:v59];
}

- (float)gestureDetectionFPS
{
  return self->_gestureDetectionFPS;
}

- (void)setGestureDetectionFPS:(float)a3
{
  self->_float gestureDetectionFPS = a3;
}

- (void)setLatestGestures:(id)a3
{
}

- (void)setLatestReactions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestReactions, 0);
  objc_storeStrong((id *)&self->_latestGestures, 0);
  objc_storeStrong((id *)&self->_gestureDetector, 0);

  objc_storeStrong((id *)&self->_personIdentifierToPerson, 0);
}

- (void)runGestureDetectionForTimeStamp:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Invalid timestamp", v1, 2u);
}

- (void)gesturesAvailable:(os_log_t)log forTimeStamp:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Both hands of current person have the same chirality!", buf, 2u);
}

@end