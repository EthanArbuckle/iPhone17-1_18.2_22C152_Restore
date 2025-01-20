@interface PTPersonWithReactions
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTwoHandReactionEndTime;
- (NSArray)reactions;
- (NSNumber)identifier;
- (PTPersonWithReactions)initWithIdentifier:(id)a3;
- (id)createReactionWithType:(unint64_t)a3;
- (int)numFramesInactive;
- (unint64_t)reactionTriggerID;
- (unsigned)lastTwoHandReactionType;
- (void)_stopActiveGestureOnSlot:(id)a3;
- (void)_updateReactionSlot:(id)a3 withOneHand:(id)a4 optionalOtherHand:(id)a5 timeStamp:(id *)a6;
- (void)setLastTwoHandReactionEndTime:(id *)a3;
- (void)setLastTwoHandReactionType:(unsigned int)a3;
- (void)setNumFramesInactive:(int)a3;
- (void)setReactionTriggerID:(unint64_t *)a3;
- (void)updateWithLeftHand:(id)a3 rightHand:(id)a4 timeStamp:(id *)a5;
@end

@implementation PTPersonWithReactions

- (PTPersonWithReactions)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PTPersonWithReactions;
  v6 = [(PTPersonWithReactions *)&v29 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_numFramesInactive = 0;
    uint64_t v8 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v7->_lastTwoHandReactionEndTime.value = *MEMORY[0x1E4F1F9F8];
    v7->_lastTwoHandReactionEndTime.epoch = *(void *)(v8 + 16);
    v9 = [PTPersonReactionSlot alloc];
    LODWORD(v10) = 1128136704;
    LODWORD(v11) = 1128136704;
    uint64_t v12 = [(PTPersonReactionSlot *)v9 initWithStartTime:v10 stopTime:v11];
    leftHandSlot = v7->_leftHandSlot;
    v7->_leftHandSlot = (PTPersonReactionSlot *)v12;

    v14 = [PTPersonReactionSlot alloc];
    LODWORD(v15) = 1128136704;
    LODWORD(v16) = 1128136704;
    uint64_t v17 = [(PTPersonReactionSlot *)v14 initWithStartTime:v15 stopTime:v16];
    rightHandSlot = v7->_rightHandSlot;
    v7->_rightHandSlot = (PTPersonReactionSlot *)v17;

    v19 = [PTPersonReactionSlot alloc];
    LODWORD(v20) = 1128136704;
    LODWORD(v21) = 1128136704;
    uint64_t v22 = [(PTPersonReactionSlot *)v19 initWithStartTime:v20 stopTime:v21];
    bothHandsSlot = v7->_bothHandsSlot;
    v7->_bothHandsSlot = (PTPersonReactionSlot *)v22;

    v7->_bothHandsDetected = 0;
    v24 = [PTHandGesture alloc];
    uint64_t v25 = -[PTHandGesture initWithType:chirality:boundingBox:confidence:personID:handID:](v24, "initWithType:chirality:boundingBox:confidence:personID:handID:", 0, 1, &unk_1F26C11A8, &unk_1F26C0760, &unk_1F26C0760, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    unknownGesture = v7->_unknownGesture;
    v7->_unknownGesture = (PTHandGesture *)v25;

    v27 = v7;
  }

  return v7;
}

- (NSArray)reactions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  double v10 = self->_leftHandSlot;
  double v11 = self->_rightHandSlot;
  uint64_t v4 = 0;
  uint64_t v12 = self->_bothHandsSlot;
  do
  {
    id v5 = *(PTPersonReactionSlot **)((char *)&v10 + v4);
    v6 = [(PTPersonReactionSlot *)v5 reaction];

    if (v6)
    {
      v7 = [(PTPersonReactionSlot *)v5 reaction];
      [v3 addObject:v7];
    }
    v4 += 8;
  }
  while (v4 != 24);
  for (uint64_t i = 16; i != -8; i -= 8)

  return (NSArray *)v3;
}

- (void)_stopActiveGestureOnSlot:(id)a3
{
  id v3 = a3;
  [v3 setActiveGestureType:0];
  long long v8 = *MEMORY[0x1E4F1F9F8];
  long long v5 = v8;
  uint64_t v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v4 = v9;
  [v3 setActiveGestureLastSeenTime:&v8];
  long long v6 = v5;
  uint64_t v7 = v4;
  [v3 setLatestGestureFirstSeenTime:&v6];
}

- (void)updateWithLeftHand:(id)a3 rightHand:(id)a4 timeStamp:(id *)a5
{
  unint64_t v8 = (unint64_t)a3;
  id v9 = a4;
  if (v8 | (unint64_t)v9)
  {
    double v10 = (PTHandGesture *)v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    BOOL v12 = !v11;
    self->_bothHandsDetected = v12;
    if (v8)
    {
      if (v9) {
        goto LABEL_10;
      }
    }
    else
    {
      unint64_t v8 = self->_unknownGesture;
      if (v10) {
        goto LABEL_10;
      }
    }
    double v10 = self->_unknownGesture;
LABEL_10:
    if (self->_bothHandsDetected)
    {
      BOOL v13 = [(id)v8 fpMitigation] == 8
         || [(PTHandGesture *)v10 fpMitigation] == 8;
      if ([(PTHandGesture *)v10 type] != 2
        && [(PTHandGesture *)v10 type] != 3
        && [(id)v8 type] != 2)
      {
        if ([(id)v8 type] != 3 || !v13) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      if (v13)
      {
LABEL_22:
        v14 = self->_unknownGesture;

        double v15 = self->_unknownGesture;
        double v10 = v15;
        unint64_t v8 = (unint64_t)v14;
      }
    }
LABEL_23:
    bothHandsSlot = self->_bothHandsSlot;
    long long v20 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    [(PTPersonWithReactions *)self _updateReactionSlot:bothHandsSlot withOneHand:v10 optionalOtherHand:v8 timeStamp:&v20];
    leftHandSlot = self->_leftHandSlot;
    long long v20 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    [(PTPersonWithReactions *)self _updateReactionSlot:leftHandSlot withOneHand:v8 optionalOtherHand:0 timeStamp:&v20];
    rightHandSlot = self->_rightHandSlot;
    long long v20 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    [(PTPersonWithReactions *)self _updateReactionSlot:rightHandSlot withOneHand:v10 optionalOtherHand:0 timeStamp:&v20];

    goto LABEL_24;
  }
  unint64_t v8 = _PTLogSystem();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    -[PTPersonWithReactions updateWithLeftHand:rightHand:timeStamp:]((os_log_t)v8);
  }
LABEL_24:
}

- (id)createReactionWithType:(unint64_t)a3
{
  long long v5 = objc_alloc_init(PTEffectReaction);
  [(PTEffectReaction *)v5 setEffectType:a3];
  [(PTEffectReaction *)v5 setTriggerID:(*self->_reactionTriggerID)++];

  return v5;
}

- (void)_updateReactionSlot:(id)a3 withOneHand:(id)a4 optionalOtherHand:(id)a5 timeStamp:(id *)a6
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  double v10 = (PTPersonReactionSlot *)a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v11 type];
  unsigned int v14 = [(PTPersonReactionSlot *)v10 latestGestureType];
  unsigned int v15 = [(PTPersonReactionSlot *)v10 activeGestureType];
  [v11 boundingBox];
  CGFloat MidX = CGRectGetMidX(v80);
  [v11 boundingBox];
  CGFloat MidY = CGRectGetMidY(v81);
  v17.f64[0] = MidX;
  v17.f64[1] = MidY;
  float32x2_t v18 = vcvt_f32_f64(v17);
  if (!v15)
  {
    if (v12)
    {
      if (CanTriggerTwoHandReaction(v11, v12, 0.7)) {
        uint64_t v13 = v13;
      }
      else {
        uint64_t v13 = 0;
      }
    }
    else
    {
      if ((v13 & 0xFFFFFFFE) == 2) {
        float v25 = flt_1D081FC00[!self->_bothHandsDetected];
      }
      else {
        float v25 = 0.7;
      }
      v36 = [v11 confidence];
      [v36 floatValue];
      float v38 = v37;

      if (v38 >= v25) {
        uint64_t v13 = v13;
      }
      else {
        uint64_t v13 = 0;
      }
    }
    [(PTPersonReactionSlot *)v10 setLatestGestureType:v13];
    if (v14 == v13 && (v14 - 1 < 4 || v14 == 6))
    {
      if (v10)
      {
        [(PTPersonReactionSlot *)v10 latestGestureFirstSeenTime];
        if ((v76 & 0x100000000) != 0)
        {
          [(PTPersonReactionSlot *)v10 latestGestureFirstSeenTime];
          *(_OWORD *)time = *(_OWORD *)&a6->var0;
          *(void *)&time[16] = a6->var3;
          float DurationMilliseconds = GetDurationMilliseconds(&v74, (CMTime *)time);
          [(PTPersonReactionSlot *)v10 milliSecondsToStart];
          float v41 = v40;
          if (!v12)
          {
            if (self->_bothHandsDetected && (v14 - 1 < 4 || v14 == 6)) {
              float v41 = v40 + v40;
            }
            if (v14 == self->_lastTwoHandReactionType)
            {
              if (self->_lastTwoHandReactionEndTime.flags)
              {
                *(_OWORD *)time = *(_OWORD *)&self->_lastTwoHandReactionEndTime.value;
                *(void *)&time[16] = self->_lastTwoHandReactionEndTime.epoch;
                $3CC8671D27C23BF42ADDB32F2B5E48AE v73 = *a6;
                float v42 = GetDurationMilliseconds((CMTime *)time, (CMTime *)&v73);
              }
              else
              {
                float v42 = 2000.0;
              }
              float v41 = v41 + fmaxf(2000.0 - v42, 0.0);
            }
          }
          float v43 = v41 + 400.0;
          if (v14 != 1) {
            float v43 = v41;
          }
          if (DurationMilliseconds <= v43) {
            goto LABEL_47;
          }
          [(PTPersonReactionSlot *)v10 setActiveGestureType:[(PTPersonReactionSlot *)v10 latestGestureType]];
          [(PTPersonReactionSlot *)v10 latestGestureFirstSeenTime];
          long long v69 = v71;
          uint64_t v70 = v72;
          [(PTPersonReactionSlot *)v10 setActiveGestureLastSeenTime:&v69];
          unsigned int v44 = [(PTPersonReactionSlot *)v10 activeGestureType] - 1;
          if (v12)
          {
            if (v44 > 5 || ((0x2Fu >> v44) & 1) == 0) {
              goto LABEL_47;
            }
            v45 = [(PTPersonWithReactions *)self createReactionWithType:qword_1D081FC10[v44]];
            [(PTPersonReactionSlot *)v10 setReaction:v45];

            [v12 boundingBox];
            CGFloat v63 = CGRectGetMidX(v84);
            [v12 boundingBox];
            CGFloat v46 = CGRectGetMidY(v85);
            v47.f64[0] = v63;
            v47.f64[1] = v46;
            double v48 = COERCE_DOUBLE(vmul_f32(vadd_f32(v18, vcvt_f32_f64(v47)), (float32x2_t)0x3F0000003F000000));
            v49 = [(PTPersonReactionSlot *)v10 reaction];
            [v49 setPosition:v48];

            [(PTPersonReactionSlot *)self->_leftHandSlot setReaction:0];
            [(PTPersonReactionSlot *)self->_rightHandSlot setReaction:0];
            v50 = _PTLogSystem();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
LABEL_61:
              v57 = [(PTPersonReactionSlot *)v10 reaction];
              v58 = [v57 emoji];
              int v59 = [(NSNumber *)self->_identifier intValue];
              *(_OWORD *)time = *(_OWORD *)&a6->var0;
              *(void *)&time[16] = a6->var3;
              Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
              *(_DWORD *)time = 138412802;
              *(void *)&time[4] = v58;
              *(_WORD *)&time[12] = 1024;
              *(_DWORD *)&time[14] = v59;
              *(_WORD *)&time[18] = 2048;
              *(Float64 *)&time[20] = Seconds;
              _os_log_impl(&dword_1D0778000, v50, OS_LOG_TYPE_DEFAULT, "ReactionProvider: Created Reaction with (type: %@) (personID: %i) (time: %.2f)", time, 0x1Cu);
            }
          }
          else
          {
            if (v44 > 2) {
              goto LABEL_47;
            }
            uint64_t v51 = qword_1D081FC40[v44];
            v52 = [(PTPersonReactionSlot *)self->_bothHandsSlot reaction];

            if (v52) {
              goto LABEL_47;
            }
            v53 = [(PTPersonWithReactions *)self createReactionWithType:v51];
            [(PTPersonReactionSlot *)v10 setReaction:v53];

            v54 = [(PTPersonReactionSlot *)v10 reaction];
            [v54 setPosition:*(double *)&v18];

            BOOL v55 = [v11 handChirality] != 1;
            v56 = [(PTPersonReactionSlot *)v10 reaction];
            [v56 setOrientation:v55];

            v50 = _PTLogSystem();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_61;
            }
          }

          goto LABEL_47;
        }
      }
      else
      {
        uint64_t v75 = 0;
        uint64_t v76 = 0;
        uint64_t v77 = 0;
      }
    }
    long long v67 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    [(PTPersonReactionSlot *)v10 setLatestGestureFirstSeenTime:&v67];
    goto LABEL_47;
  }
  if (v12)
  {
    if (CanTriggerTwoHandReaction(v11, v12, 0.5)) {
      uint64_t v19 = v13;
    }
    else {
      uint64_t v19 = 0;
    }
    [(PTPersonReactionSlot *)v10 setLatestGestureType:v19];
    if (v15 == v19)
    {
      [v12 boundingBox];
      CGFloat v62 = CGRectGetMidX(v82);
      [v12 boundingBox];
      CGFloat v20 = CGRectGetMidY(v83);
      v21.f64[0] = v62;
      v21.f64[1] = v20;
      float32x2_t v18 = vmul_f32(vadd_f32(v18, vcvt_f32_f64(v21)), (float32x2_t)0x3F0000003F000000);
LABEL_17:
      v26 = [(PTPersonReactionSlot *)v10 reaction];
      [v26 setPosition:*(double *)&v18];

      long long v65 = *(_OWORD *)&a6->var0;
      int64_t v66 = a6->var3;
      [(PTPersonReactionSlot *)v10 setActiveGestureLastSeenTime:&v65];
      goto LABEL_47;
    }
  }
  else
  {
    uint64_t v22 = [v11 confidence];
    [v22 floatValue];
    float v24 = v23;

    if (v24 >= 0.5)
    {
      [(PTPersonReactionSlot *)v10 setLatestGestureType:v13];
      if (v15 == v13) {
        goto LABEL_17;
      }
    }
    else
    {
      [(PTPersonReactionSlot *)v10 setLatestGestureType:0];
    }
  }
  if (v10) {
    [(PTPersonReactionSlot *)v10 activeGestureLastSeenTime];
  }
  else {
    memset(&v64, 0, sizeof(v64));
  }
  *(_OWORD *)time = *(_OWORD *)&a6->var0;
  *(void *)&time[16] = a6->var3;
  float v27 = GetDurationMilliseconds(&v64, (CMTime *)time);
  [(PTPersonReactionSlot *)v10 milliSecondsToStop];
  if (v27 > v28)
  {
    objc_super v29 = [(PTPersonReactionSlot *)v10 reaction];

    if (v29)
    {
      v30 = _PTLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [(PTPersonReactionSlot *)v10 reaction];
        v32 = [v31 emoji];
        int v33 = [(NSNumber *)self->_identifier intValue];
        *(_OWORD *)time = *(_OWORD *)&a6->var0;
        *(void *)&time[16] = a6->var3;
        Float64 v34 = CMTimeGetSeconds((CMTime *)time);
        *(_DWORD *)time = 138412802;
        *(void *)&time[4] = v32;
        *(_WORD *)&time[12] = 1024;
        *(_DWORD *)&time[14] = v33;
        *(_WORD *)&time[18] = 2048;
        *(Float64 *)&time[20] = v34;
        _os_log_impl(&dword_1D0778000, v30, OS_LOG_TYPE_DEFAULT, "ReactionProvider: Ended Reaction with (type: %@) (personID: %i) (time: %.2f)", time, 0x1Cu);
      }
      [(PTPersonReactionSlot *)v10 setReaction:0];
    }
    [(PTPersonWithReactions *)self _stopActiveGestureOnSlot:v10];
    if (self->_bothHandsSlot == v10)
    {
      long long v35 = *(_OWORD *)&a6->var0;
      self->_lastTwoHandReactionEndTime.epoch = a6->var3;
      *(_OWORD *)&self->_lastTwoHandReactionEndTime.value = v35;
      self->_lastTwoHandReactionType = [(PTPersonReactionSlot *)self->_leftHandSlot activeGestureType];
      [(PTPersonWithReactions *)self _stopActiveGestureOnSlot:self->_leftHandSlot];
      [(PTPersonWithReactions *)self _stopActiveGestureOnSlot:self->_rightHandSlot];
    }
  }
LABEL_47:
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (int)numFramesInactive
{
  return self->_numFramesInactive;
}

- (void)setNumFramesInactive:(int)a3
{
  self->_numFramesInactive = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTwoHandReactionEndTime
{
  objc_copyStruct(retstr, &self->_lastTwoHandReactionEndTime, 24, 1, 0);
  return result;
}

- (void)setLastTwoHandReactionEndTime:(id *)a3
{
}

- (unsigned)lastTwoHandReactionType
{
  return self->_lastTwoHandReactionType;
}

- (void)setLastTwoHandReactionType:(unsigned int)a3
{
  self->_lastTwoHandReactionType = a3;
}

- (unint64_t)reactionTriggerID
{
  return self->_reactionTriggerID;
}

- (void)setReactionTriggerID:(unint64_t *)a3
{
  self->_reactionTriggerID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownGesture, 0);
  objc_storeStrong((id *)&self->_bothHandsSlot, 0);
  objc_storeStrong((id *)&self->_rightHandSlot, 0);

  objc_storeStrong((id *)&self->_leftHandSlot, 0);
}

- (void)updateWithLeftHand:(os_log_t)log rightHand:timeStamp:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "At least one hand must be non-nil!", v1, 2u);
}

@end