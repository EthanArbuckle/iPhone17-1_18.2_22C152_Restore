@interface _UIKBRTTouchHistory
- (BOOL)containsInfo:(id)a3;
- (BOOL)hasHistory;
- (BOOL)isLeftHand;
- (CGPoint)historyOffset;
- (_UIKBRTTouchHistory)initWithIsLeftHand:(BOOL)a3;
- (double)lastTime;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_decayHistoryToSize:(unint64_t)a3;
- (void)_sortHistory;
- (void)_updateOffset;
- (void)addInfo:(id)a3;
- (void)adjustHistoryOffset:(CGPoint)a3;
- (void)clearHistory;
- (void)dealloc;
- (void)decayHistory;
- (void)removeInfo:(id)a3;
- (void)reset;
- (void)setIsLeftHand:(BOOL)a3;
@end

@implementation _UIKBRTTouchHistory

- (_UIKBRTTouchHistory)initWithIsLeftHand:(BOOL)a3
{
  v4 = [(_UIKBRTTouchHistory *)self init];
  v5 = v4;
  if (v4)
  {
    v4->_isLeftHand = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    history = v5->_history;
    v5->_history = v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSMutableArray *)self->_history mutableCopy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  *((_OWORD *)v4 + 1) = self->_historyOffset;
  return v4;
}

- (void)dealloc
{
  [(_UIKBRTTouchHistory *)self reset];
  history = self->_history;
  self->_history = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIKBRTTouchHistory;
  [(_UIKBRTTouchHistory *)&v4 dealloc];
}

- (BOOL)hasHistory
{
  [(_UIKBRTTouchHistory *)self decayHistory];
  if ([(NSMutableArray *)self->_history count])
  {
    v3 = [(NSMutableArray *)self->_history lastObject];
    if ([v3 isActive])
    {
      LOBYTE(v4) = 1;
    }
    else if ([v3 ignoreTouch])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      int v4 = [v3 ignoreForDrift] ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (double)lastTime
{
  uint64_t v3 = [(NSMutableArray *)self->_history indexOfObjectWithOptions:2 passingTest:&__block_literal_global_370_1];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = [(NSMutableArray *)self->_history objectAtIndex:v3];
  }
  [v4 touchTime];
  double v6 = v5;

  return v6;
}

- (CGPoint)historyOffset
{
  double x = self->_historyOffset.x;
  double y = self->_historyOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)containsInfo:(id)a3
{
  return [(NSMutableArray *)self->_history containsObject:a3];
}

- (void)addInfo:(id)a3
{
  [(NSMutableArray *)self->_history addObject:a3];
  [(_UIKBRTTouchHistory *)self _updateOffset];
}

- (void)removeInfo:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_history, "containsObject:"))
  {
    [(NSMutableArray *)self->_history removeObject:v4];
    [(_UIKBRTTouchHistory *)self _updateOffset];
  }
}

- (void)adjustHistoryOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  histordouble y = self->_history;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43___UIKBRTTouchHistory_adjustHistoryOffset___block_invoke;
  v8[3] = &__block_descriptor_48_e40_v32__0___UIKBRTTouchHistoryInfo_8Q16_B24l;
  CGPoint v9 = a3;
  [(NSMutableArray *)history enumerateObjectsWithOptions:2 usingBlock:v8];
  CGFloat v7 = self->_historyOffset.y - y;
  self->_historyOffset.double x = self->_historyOffset.x - x;
  self->_historyOffset.double y = v7;
}

- (void)clearHistory
{
  histordouble y = self->_history;
  id v4 = [(NSMutableArray *)history indexesOfObjectsPassingTest:&__block_literal_global_373_2];
  [(NSMutableArray *)history removeObjectsAtIndexes:v4];

  [(_UIKBRTTouchHistory *)self _updateOffset];
}

- (void)decayHistory
{
}

- (void)_sortHistory
{
  id v3 = [(NSMutableArray *)self->_history indexesOfObjectsPassingTest:&__block_literal_global_375_1];
  if ([v3 count]) {
    [(NSMutableArray *)self->_history removeObjectsAtIndexes:v3];
  }
  [(NSMutableArray *)self->_history sortUsingComparator:&__block_literal_global_378];
}

- (void)_decayHistoryToSize:(unint64_t)a3
{
  [(_UIKBRTTouchHistory *)self _sortHistory];
  CFAbsoluteTime v5 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  if (v5 - self->_lastDecayTime >= 0.05)
  {
    self->_lastDecayTime = v5;
    if ([(NSMutableArray *)self->_history count] <= a3)
    {
      if ([(NSMutableArray *)self->_history count])
      {
        int v9 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
        double v10 = *(double *)&qword_1E8FD5350 + *(double *)&qword_1E8FD5350;
        BOOL v11 = v9 == 0;
        histordouble y = self->_history;
        v14[1] = 3221225472;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[2] = __43___UIKBRTTouchHistory__decayHistoryToSize___block_invoke_2;
        v14[3] = &__block_descriptor_48_e40_B32__0___UIKBRTTouchHistoryInfo_8Q16_B24l;
        if (!v11) {
          double v10 = 4.0;
        }
        *(CFAbsoluteTime *)&v14[4] = v5;
        *(double *)&v14[5] = v10;
        v13 = [(NSMutableArray *)history indexesOfObjectsPassingTest:v14];
        if ([v13 count])
        {
          [(NSMutableArray *)self->_history removeObjectsAtIndexes:v13];
          [(_UIKBRTTouchHistory *)self _updateOffset];
        }
      }
    }
    else
    {
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v6 = 2.0; {
      else
      }
        double v6 = *(double *)&qword_1E8FD5350;
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x2020000000;
      unint64_t v17 = 0;
      unint64_t v17 = [(NSMutableArray *)self->_history count] - a3;
      CGFloat v7 = self->_history;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __43___UIKBRTTouchHistory__decayHistoryToSize___block_invoke;
      v15[3] = &unk_1E52FE020;
      *(CFAbsoluteTime *)&v15[5] = v5;
      *(double *)&v15[6] = v6;
      v15[4] = v16;
      v8 = [(NSMutableArray *)v7 indexesOfObjectsPassingTest:v15];
      if ([v8 count])
      {
        [(NSMutableArray *)self->_history removeObjectsAtIndexes:v8];
        [(_UIKBRTTouchHistory *)self _updateOffset];
      }

      _Block_object_dispose(v16, 8);
    }
  }
}

- (void)reset
{
  self->_historyOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
}

- (void)_updateOffset
{
  [(_UIKBRTTouchHistory *)self _sortHistory];
  uint64_t v20 = 0;
  v21 = (float64x2_t *)&v20;
  uint64_t v22 = 0x3010000000;
  v23 = &unk_186D7DBA7;
  long long v24 = *MEMORY[0x1E4F1DAD8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36___UIKBRTTouchHistory__updateOffset__block_invoke;
  aBlock[3] = &unk_1E52FE068;
  aBlock[4] = &v20;
  id v3 = _Block_copy(aBlock);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  int v18 = 0;
  histordouble y = self->_history;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __36___UIKBRTTouchHistory__updateOffset__block_invoke_2;
  v14[3] = &unk_1E52FE090;
  id v5 = v3;
  id v15 = v5;
  v16 = v17;
  [(NSMutableArray *)history enumerateObjectsWithOptions:2 usingBlock:v14];
  double v6 = (CGPoint *)v21;
  __asm { FMOV            V1.2D, #10.0 }
  float64x2_t v12 = vdivq_f64(v21[2], _Q1);
  __asm { FMOV            V1.2D, #0.5 }
  v21[2] = vrndq_f64(vaddq_f64(v12, _Q1));
  self->_historyOffset = v6[2];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v20, 8);
}

- (BOOL)isLeftHand
{
  return self->_isLeftHand;
}

- (void)setIsLeftHand:(BOOL)a3
{
  self->_isLeftHand = a3;
}

- (void).cxx_destruct
{
}

@end