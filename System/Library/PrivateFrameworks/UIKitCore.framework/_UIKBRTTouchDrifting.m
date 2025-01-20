@interface _UIKBRTTouchDrifting
+ (BOOL)isEnabled;
- ($01BB1521EC52D44A8E7628F5261DCEC8)touchError;
- (BOOL)leftDriftRemovingItems;
- (BOOL)rightDriftRemovingItems;
- (BOOL)supportsDrifting;
- (CGPoint)_offsetForPoint:(CGPoint)a3 fromPoint:(CGPoint)a4;
- (CGPoint)_pinOffset:(CGPoint)a3;
- (CGPoint)_pointFromPoint:(CGPoint)a3 plusOffset:(CGPoint)a4;
- (CGPoint)leftHandDriftOffset;
- (CGPoint)rightHandDriftOffset;
- (NSArray)indexSearchOrder;
- (NSMapTable)touchHistoryViewMap;
- (NSMutableDictionary)touches;
- (NSMutableSet)leftDriftLockTouchIDs;
- (NSMutableSet)rightDriftLockTouchIDs;
- (NSTimer)feedbackTimer;
- (UIView)feedbackParentView;
- (UIView)leftDriftFeedbackView;
- (UIView)rightDriftFeedbackView;
- (UIView)touchHistoryFeedbackView;
- (_UIKBRTDecayingObject)enableLatchObj;
- (_UIKBRTDecayingOffset)leftHandDriftOffsetObj;
- (_UIKBRTDecayingOffset)leftHandFixedOffsetObj;
- (_UIKBRTDecayingOffset)rightHandDriftOffsetObj;
- (_UIKBRTDecayingOffset)rightHandFixedOffsetObj;
- (_UIKBRTTouchDrifting)init;
- (_UIKBRTTouchDrifting)initWithParentView:(id)a3;
- (_UIKBRTTouchDriftingDelegate)delegate;
- (_UIKBRTTouchHistory)fHistory;
- (_UIKBRTTouchHistory)jHistory;
- (_UIKBRTTouchHistory)otherHistory;
- (_UIKBRTTouchHistoryInfo)leftIndexFingerInfo;
- (_UIKBRTTouchHistoryInfo)rightIndexFingerInfo;
- (id)_touchDictWithFingerIds:(id)a3;
- (void)_resetFeedback;
- (void)_updateDriftForFingers:(id)a3 leftHand:(BOOL)a4 newestTouch:(id)a5;
- (void)_updateDriftView;
- (void)_updateDriftViewTimer:(id)a3;
- (void)_updateDriftWithTouchInfo:(id)a3;
- (void)_updateHistory;
- (void)addTouchLocation:(CGPoint)a3 withRadius:(double)a4 withTouchTime:(double)a5 withIdentifier:(id)a6;
- (void)dealloc;
- (void)ignoreTouchWithIdentifier:(id)a3 withTouchTime:(double)a4;
- (void)moveTouchWithIdentifier:(id)a3 toLocation:(CGPoint)a4 withRadius:(double)a5 atTouchTime:(double)a6;
- (void)removeTouchWithIdentifier:(id)a3 touchCancelled:(BOOL)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setEnableLatchObj:(id)a3;
- (void)setFHistory:(id)a3;
- (void)setFeedbackParentView:(id)a3;
- (void)setFeedbackTimer:(id)a3;
- (void)setIndexSearchOrder:(id)a3;
- (void)setJHistory:(id)a3;
- (void)setLeftDriftFeedbackView:(id)a3;
- (void)setLeftDriftLockTouchIDs:(id)a3;
- (void)setLeftDriftRemovingItems:(BOOL)a3;
- (void)setLeftHandDriftOffsetObj:(id)a3;
- (void)setLeftHandFixedOffsetObj:(id)a3;
- (void)setLeftIndexFingerInfo:(id)a3;
- (void)setOtherHistory:(id)a3;
- (void)setRightDriftFeedbackView:(id)a3;
- (void)setRightDriftLockTouchIDs:(id)a3;
- (void)setRightDriftRemovingItems:(BOOL)a3;
- (void)setRightHandDriftOffsetObj:(id)a3;
- (void)setRightHandFixedOffsetObj:(id)a3;
- (void)setRightIndexFingerInfo:(id)a3;
- (void)setSupportsDrifting:(BOOL)a3;
- (void)setTouchError:(id)a3;
- (void)setTouchHistoryFeedbackView:(id)a3;
- (void)setTouchHistoryViewMap:(id)a3;
- (void)setTouches:(id)a3;
- (void)updateTouchWithIdentifier:(id)a3 withTouchTime:(double)a4 resultingError:(CGPoint)a5 rowOffsetFromHomeRow:(int64_t)a6;
- (void)updateWithFCenter:(CGPoint)a3 jCenter:(CGPoint)a4 keySize:(CGSize)a5 rowOffsets:(id)a6 homeRowOffsetIndex:(int)a7;
@end

@implementation _UIKBRTTouchDrifting

+ (BOOL)isEnabled
{
  BOOL result = _UIInternalPreferenceUsesDefault(&_UIInternalPreference__UIKBRT_DriftSupport, @"_UIKBRT_DriftSupport", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1E8FD533C) {
    return 1;
  }
  return result;
}

- (_UIKBRTTouchDrifting)init
{
  v48.receiver = self;
  v48.super_class = (Class)_UIKBRTTouchDrifting;
  v2 = [(_UIKBRTTouchDrifting *)&v48 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    touches = v2->_touches;
    v2->_touches = v3;

    v5 = [[_UIKBRTTouchHistory alloc] initWithIsLeftHand:1];
    fHistory = v2->_fHistory;
    v2->_fHistory = v5;

    v7 = [[_UIKBRTTouchHistory alloc] initWithIsLeftHand:0];
    jHistory = v2->_jHistory;
    v2->_jHistory = v7;

    v9 = objc_alloc_init(_UIKBRTTouchHistory);
    otherHistory = v2->_otherHistory;
    v2->_otherHistory = v9;

    v11 = [_UIKBRTDecayingObject alloc];
    int v12 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v13 = *(double *)&qword_1E8FD5350;
    if (v12) {
      double v13 = 2.0;
    }
    uint64_t v14 = [(_UIKBRTDecayingObject *)v11 initWithTimeoutDuration:v13];
    enableLatchObj = v2->_enableLatchObj;
    v2->_enableLatchObj = (_UIKBRTDecayingObject *)v14;

    v16 = [_UIKBRTDecayingOffset alloc];
    int v17 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v18 = *(double *)&qword_1E8FD5350;
    if (v17) {
      double v18 = 2.0;
    }
    uint64_t v19 = [(_UIKBRTDecayingOffset *)v16 initWithTimeoutDuration:1 limitMovement:v18];
    leftHandDriftOffsetObj = v2->_leftHandDriftOffsetObj;
    v2->_leftHandDriftOffsetObj = (_UIKBRTDecayingOffset *)v19;

    v21 = [_UIKBRTDecayingOffset alloc];
    int v22 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v23 = *(double *)&qword_1E8FD5350;
    if (v22) {
      double v23 = 2.0;
    }
    uint64_t v24 = [(_UIKBRTDecayingOffset *)v21 initWithTimeoutDuration:0 limitMovement:v23];
    leftHandFixedOffsetObj = v2->_leftHandFixedOffsetObj;
    v2->_leftHandFixedOffsetObj = (_UIKBRTDecayingOffset *)v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    leftDriftLockTouchIDs = v2->_leftDriftLockTouchIDs;
    v2->_leftDriftLockTouchIDs = v26;

    objc_initWeak(&location, v2);
    v28 = v2->_leftHandFixedOffsetObj;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __28___UIKBRTTouchDrifting_init__block_invoke;
    v45[3] = &unk_1E52DC308;
    objc_copyWeak(&v46, &location);
    [(_UIKBRTDecayingObject *)v28 onResetDo:v45];
    v29 = [_UIKBRTDecayingOffset alloc];
    int v30 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v31 = *(double *)&qword_1E8FD5350;
    if (v30) {
      double v31 = 2.0;
    }
    uint64_t v32 = [(_UIKBRTDecayingOffset *)v29 initWithTimeoutDuration:1 limitMovement:v31];
    rightHandDriftOffsetObj = v2->_rightHandDriftOffsetObj;
    v2->_rightHandDriftOffsetObj = (_UIKBRTDecayingOffset *)v32;

    v34 = [_UIKBRTDecayingOffset alloc];
    int v35 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v36 = *(double *)&qword_1E8FD5350;
    if (v35) {
      double v36 = 2.0;
    }
    uint64_t v37 = [(_UIKBRTDecayingOffset *)v34 initWithTimeoutDuration:0 limitMovement:v36];
    rightHandFixedOffsetObj = v2->_rightHandFixedOffsetObj;
    v2->_rightHandFixedOffsetObj = (_UIKBRTDecayingOffset *)v37;

    v39 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    rightDriftLockTouchIDs = v2->_rightDriftLockTouchIDs;
    v2->_rightDriftLockTouchIDs = v39;

    v41 = v2->_rightHandFixedOffsetObj;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __28___UIKBRTTouchDrifting_init__block_invoke_2;
    v43[3] = &unk_1E52DC308;
    objc_copyWeak(&v44, &location);
    [(_UIKBRTDecayingObject *)v41 onResetDo:v43];
    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (_UIKBRTTouchDrifting)initWithParentView:(id)a3
{
  id v4 = a3;
  v5 = [(_UIKBRTTouchDrifting *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_feedbackParentView, v4);
  }

  return v6;
}

- (void)dealloc
{
  [(_UIKBRTTouchDrifting *)self _resetFeedback];
  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTTouchDrifting;
  [(_UIKBRTTouchDrifting *)&v3 dealloc];
}

- (void)_resetFeedback
{
  [(NSTimer *)self->_feedbackTimer invalidate];
  feedbackTimer = self->_feedbackTimer;
  self->_feedbackTimer = 0;

  [(UIView *)self->_leftDriftFeedbackView removeFromSuperview];
  leftDriftFeedbackView = self->_leftDriftFeedbackView;
  self->_leftDriftFeedbackView = 0;

  [(UIView *)self->_rightDriftFeedbackView removeFromSuperview];
  rightDriftFeedbackView = self->_rightDriftFeedbackView;
  self->_rightDriftFeedbackView = 0;

  [(UIView *)self->_touchHistoryFeedbackView removeFromSuperview];
  touchHistoryFeedbackView = self->_touchHistoryFeedbackView;
  self->_touchHistoryFeedbackView = 0;

  touchHistoryViewMap = self->_touchHistoryViewMap;
  self->_touchHistoryViewMap = 0;
}

- (void)reset
{
  v14.receiver = self;
  v14.super_class = (Class)_UIKBRTTouchDrifting;
  [(_UIKBRTKeyboardTouchObserver *)&v14 reset];
  [(_UIKBRTTouchDrifting *)self _resetFeedback];
  indexSearchOrder = self->_indexSearchOrder;
  self->_indexSearchOrder = 0;

  self->_supportsDrifting = 0;
  [(_UIKBRTTouchHistory *)self->_fHistory reset];
  [(_UIKBRTTouchHistory *)self->_jHistory reset];
  [(_UIKBRTDecayingObject *)self->_enableLatchObj reset];
  int v4 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v5 = *(double *)&qword_1E8FD5350;
  if (v4) {
    double v5 = 2.0;
  }
  [(_UIKBRTDecayingObject *)self->_enableLatchObj setTimeoutDuration:v5];
  [(_UIKBRTDecayingOffset *)self->_leftHandDriftOffsetObj reset];
  int v6 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v7 = *(double *)&qword_1E8FD5350;
  if (v6) {
    double v7 = 2.0;
  }
  [(_UIKBRTDecayingObject *)self->_leftHandDriftOffsetObj setTimeoutDuration:v7];
  [(_UIKBRTDecayingOffset *)self->_leftHandFixedOffsetObj reset];
  int v8 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v9 = *(double *)&qword_1E8FD5350;
  if (v8) {
    double v9 = 2.0;
  }
  [(_UIKBRTDecayingObject *)self->_leftHandFixedOffsetObj setTimeoutDuration:v9];
  [(_UIKBRTDecayingOffset *)self->_rightHandDriftOffsetObj reset];
  int v10 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v11 = *(double *)&qword_1E8FD5350;
  if (v10) {
    double v11 = 2.0;
  }
  [(_UIKBRTDecayingObject *)self->_rightHandDriftOffsetObj setTimeoutDuration:v11];
  [(_UIKBRTDecayingOffset *)self->_rightHandFixedOffsetObj reset];
  int v12 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference__UIKBRT_DriftReturnTime, @"_UIKBRT_DriftReturnTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v13 = *(double *)&qword_1E8FD5350;
  if (v12) {
    double v13 = 2.0;
  }
  [(_UIKBRTDecayingObject *)self->_rightHandFixedOffsetObj setTimeoutDuration:v13];
  [(NSMutableSet *)self->_leftDriftLockTouchIDs removeAllObjects];
  [(NSMutableSet *)self->_rightDriftLockTouchIDs removeAllObjects];
  [(NSMutableDictionary *)self->_touches removeAllObjects];
}

- (void)updateWithFCenter:(CGPoint)a3 jCenter:(CGPoint)a4 keySize:(CGSize)a5 rowOffsets:(id)a6 homeRowOffsetIndex:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  double v12 = a3.y;
  double v13 = a3.x;
  id v15 = a6;
  v28.receiver = self;
  v28.super_class = (Class)_UIKBRTTouchDrifting;
  -[_UIKBRTKeyboardTouchObserver updateWithFCenter:jCenter:keySize:rowOffsets:homeRowOffsetIndex:](&v28, sel_updateWithFCenter_jCenter_keySize_rowOffsets_homeRowOffsetIndex_, v15, v7, v13, v12, x, y, width, height);
  [(_UIKBRTTouchDrifting *)self _resetFeedback];
  indexSearchOrder = self->_indexSearchOrder;
  self->_indexSearchOrder = 0;

  if ((int)v7 < 1)
  {
    self->_supportsDrifting = 0;
  }
  else
  {
    uint64_t v17 = [v15 count];
    self->_supportsDrifting = v17 - 1 > (unint64_t)v7;
    if (v17 - 1 > (unint64_t)v7)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v19 = (v7 + 1);
      do
      {
        v20 = [NSNumber numberWithInt:v19];
        [v18 addObject:v20];

        if (v19 == 1) {
          break;
        }
        BOOL v21 = (int)v19 <= (int)v7;
        uint64_t v19 = (v19 - 1);
      }
      while (!v21);
      int v22 = [v15 count];
      int v23 = v7 + 3;
      if (v22 < (int)v7 + 3) {
        int v23 = v22;
      }
      if ((int)v7 + 2 <= v23)
      {
        int v24 = v23 - 1;
        do
        {
          v25 = [NSNumber numberWithInt:(v7 + 2)];
          [v18 addObject:v25];

          LODWORD(v7) = v7 + 1;
        }
        while (v24 != v7);
      }
      v26 = (NSArray *)[v18 copy];
      v27 = self->_indexSearchOrder;
      self->_indexSearchOrder = v26;

      self->_touchError.left = -(width * 0.75);
      self->_touchError.right = width * 0.75;
      self->_touchError.up = height / -3.0;
      self->_touchError.down = height * 0.5;
    }
  }
  [(_UIKBRTTouchDrifting *)self _updateDriftWithTouchInfo:0];
}

- (CGPoint)leftHandDriftOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(_UIKBRTDecayingOffset *)self->_leftHandFixedOffsetObj offset];
  double v5 = v2 + v4;
  double v7 = v3 + v6;
  result.double y = v7;
  result.double x = v5;
  return result;
}

- (CGPoint)rightHandDriftOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(_UIKBRTDecayingOffset *)self->_rightHandFixedOffsetObj offset];
  double v5 = v2 + v4;
  double v7 = v3 + v6;
  result.double y = v7;
  result.double x = v5;
  return result;
}

- (void)addTouchLocation:(CGPoint)a3 withRadius:(double)a4 withTouchTime:(double)a5 withIdentifier:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v20 = a6;
  double v11 = -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");

  if (v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"_UIKBRTTouchDrifting.m" lineNumber:262 description:@"Touch already in dictionary!"];
  }
  [(_UIKBRTTouchDrifting *)self _updateHistory];
  double v12 = objc_alloc_init(_UIKBRTTouchHistoryInfo);
  [(_UIKBRTTouchHistoryInfo *)v12 setTouchIdentifier:v20];
  [(_UIKBRTTouchHistoryInfo *)v12 setTouchTime:a5];
  -[_UIKBRTTouchHistoryInfo setActualLocation:](v12, "setActualLocation:", x, y);
  [(_UIKBRTTouchHistoryInfo *)v12 setIgnoreTouch:1];
  unint64_t v13 = [(_UIKBRTTouchDriftingDelegate *)self->_delegate _uikbrtTouchDrifting:self fingerIDFortouchIdentifier:v20];
  if (v13 <= 0xC)
  {
    if (((1 << v13) & 0xFA) != 0)
    {
      [(_UIKBRTTouchHistoryInfo *)v12 setIgnoreForDrift:0];
      objc_super v14 = v12;
      uint64_t v15 = 1;
      goto LABEL_8;
    }
    if (((1 << v13) & 0x1F04) != 0)
    {
      [(_UIKBRTTouchHistoryInfo *)v12 setIgnoreForDrift:0];
      objc_super v14 = v12;
      uint64_t v15 = 0;
LABEL_8:
      [(_UIKBRTTouchHistoryInfo *)v14 setIsLeftHand:v15];
      goto LABEL_9;
    }
    [(_UIKBRTTouchHistoryInfo *)v12 setIgnoreForDrift:1];
  }
LABEL_9:
  [(NSMutableDictionary *)self->_touches setObject:v12 forKey:v20];
  if ([(_UIKBRTTouchHistoryInfo *)v12 ignoreForDrift])
  {
    v16 = &OBJC_IVAR____UIKBRTTouchDrifting__otherHistory;
  }
  else
  {
    BOOL v17 = [(_UIKBRTTouchHistoryInfo *)v12 isLeftHand];
    uint64_t v18 = 2;
    if (v17) {
      uint64_t v18 = 1;
    }
    v16 = &OBJC_IVAR____UIKBRTTouchDrifting__touches[v18];
  }
  [*(id *)((char *)&self->super.super.isa + *v16) addInfo:v12];
  [(_UIKBRTTouchDrifting *)self _updateDriftWithTouchInfo:v12];
}

- (void)updateTouchWithIdentifier:(id)a3 withTouchTime:(double)a4 resultingError:(CGPoint)a5 rowOffsetFromHomeRow:(int64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  id v17 = a3;
  double v11 = -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  if (v11)
  {
    [(_UIKBRTTouchDrifting *)self _updateHistory];
    objc_msgSend(v11, "setErrorVector:", x, y);
    [v11 setTouchTime:a4];
    [v11 setIgnoreTouch:(unint64_t)(a6 - 2) < 0xFFFFFFFFFFFFFFFDLL];
    unint64_t v12 = [(_UIKBRTTouchDriftingDelegate *)self->_delegate _uikbrtTouchDrifting:self fingerIDFortouchIdentifier:v17];
    if (v12 <= 0xC)
    {
      if (((1 << v12) & 0xFA) != 0)
      {
        [v11 setIgnoreForDrift:0];
        unint64_t v13 = v11;
        uint64_t v14 = 1;
      }
      else
      {
        if (((1 << v12) & 0x1F04) == 0)
        {
          [v11 setIgnoreForDrift:1];
          goto LABEL_8;
        }
        [v11 setIgnoreForDrift:0];
        unint64_t v13 = v11;
        uint64_t v14 = 0;
      }
      [v13 setIsLeftHand:v14];
    }
LABEL_8:
    if ([v11 ignoreForDrift]
      && (p_jHistordouble y = &self->_otherHistory,
          ![(_UIKBRTTouchHistory *)self->_otherHistory containsInfo:v11]))
    {
      p_fHistordouble y = &self->_fHistory;
      if ([(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v11]) {
        goto LABEL_20;
      }
    }
    else
    {
      if ([(_UIKBRTTouchHistory *)self->_otherHistory containsInfo:v11]) {
        [(_UIKBRTTouchHistory *)self->_otherHistory removeInfo:v11];
      }
      if (![v11 isLeftHand]
        || (p_jHistordouble y = &self->_fHistory, [(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v11]))
      {
        if ([v11 isLeftHand]) {
          goto LABEL_22;
        }
        p_jHistordouble y = &self->_jHistory;
        if ([(_UIKBRTTouchHistory *)self->_jHistory containsInfo:v11]) {
          goto LABEL_22;
        }
        p_fHistordouble y = &self->_fHistory;
        if (![(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v11])
        {
LABEL_21:
          [(_UIKBRTTouchHistory *)*p_jHistory addInfo:v11];
LABEL_22:
          [(_UIKBRTTouchDrifting *)self _updateDriftWithTouchInfo:v11];
          goto LABEL_23;
        }
LABEL_20:
        [(_UIKBRTTouchHistory *)*p_fHistory removeInfo:v11];
        goto LABEL_21;
      }
    }
    p_fHistordouble y = &self->_jHistory;
    if (![(_UIKBRTTouchHistory *)self->_jHistory containsInfo:v11]) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_23:
}

- (void)ignoreTouchWithIdentifier:(id)a3 withTouchTime:(double)a4
{
  id v16 = a3;
  double v6 = -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  if (v6)
  {
    [(_UIKBRTTouchDrifting *)self _updateHistory];
    char v7 = [v6 ignoreTouch];
    [v6 setIgnoreTouch:1];
    [v6 setTouchTime:a4];
    if ((v7 & 1) == 0)
    {
      if (([v6 ignoreForDrift] & 1) != 0 || (objc_msgSend(v6, "ignoreTouch"))
        && (p_jHistordouble y = &self->_otherHistory,
            ![(_UIKBRTTouchHistory *)self->_otherHistory containsInfo:v6]))
      {
        double v9 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
        p_fHistordouble y = &self->_fHistory;
        if (![(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v6]) {
          goto LABEL_16;
        }
      }
      else
      {
        if ([(_UIKBRTTouchHistory *)self->_otherHistory containsInfo:v6]) {
          [(_UIKBRTTouchHistory *)self->_otherHistory removeInfo:v6];
        }
        if ([v6 isLeftHand])
        {
          p_jHistordouble y = &self->_fHistory;
          if (![(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v6])
          {
LABEL_16:
            double v9 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftLockTouchIDs;
            p_fHistordouble y = &self->_jHistory;
            if ([(_UIKBRTTouchHistory *)self->_jHistory containsInfo:v6])
            {
              double v11 = &OBJC_IVAR____UIKBRTTouchDrifting__rightHandDriftOffsetObj;
              unint64_t v12 = &OBJC_IVAR____UIKBRTTouchDrifting__rightHandFixedOffsetObj;
              goto LABEL_18;
            }
            goto LABEL_21;
          }
        }
        if ([v6 isLeftHand]) {
          goto LABEL_22;
        }
        p_jHistordouble y = &self->_jHistory;
        if ([(_UIKBRTTouchHistory *)self->_jHistory containsInfo:v6]) {
          goto LABEL_22;
        }
        double v9 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
        p_fHistordouble y = &self->_fHistory;
        if (![(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v6])
        {
LABEL_21:
          [(_UIKBRTTouchHistory *)*p_jHistory addInfo:v6];
LABEL_22:
          id v15 = 0;
          id v14 = 0;
          unint64_t v13 = 0;
          goto LABEL_23;
        }
      }
      double v11 = &OBJC_IVAR____UIKBRTTouchDrifting__leftHandDriftOffsetObj;
      unint64_t v12 = &OBJC_IVAR____UIKBRTTouchDrifting__leftHandFixedOffsetObj;
LABEL_18:
      unint64_t v13 = *p_fHistory;
      id v14 = *(id *)((char *)&self->super.super.isa + *v12);
      id v15 = *(id *)((char *)&self->super.super.isa + *v11);
      [(_UIKBRTTouchHistory *)*p_fHistory removeInfo:v6];
      [*(id *)((char *)&self->super.super.isa + *v9) removeObject:v16];
      [(_UIKBRTTouchHistory *)*p_jHistory addInfo:v6];
      if (v13 && ![(_UIKBRTTouchHistory *)v13 hasHistory])
      {
        [v14 reset];
        [v15 reset];
LABEL_24:
        [(_UIKBRTTouchDrifting *)self _updateDriftWithTouchInfo:v6];

        goto LABEL_25;
      }
LABEL_23:
      [(_UIKBRTTouchHistory *)v13 lastTime];
      objc_msgSend(v14, "resetDecayTo:");
      [(_UIKBRTTouchHistory *)v13 lastTime];
      objc_msgSend(v15, "resetDecayTo:");
      goto LABEL_24;
    }
  }
LABEL_25:
}

- (void)moveTouchWithIdentifier:(id)a3 toLocation:(CGPoint)a4 withRadius:(double)a5 atTouchTime:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  id v17 = a3;
  int v10 = -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  if (v10)
  {
    [v10 setTouchTime:CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff];
    objc_msgSend(v10, "setActualLocation:", x, y);
    [v10 setTouchTime:a6];
    unint64_t v11 = [(_UIKBRTTouchDriftingDelegate *)self->_delegate _uikbrtTouchDrifting:self fingerIDFortouchIdentifier:v17];
    if (v11 <= 0xC)
    {
      if (((1 << v11) & 0xFA) != 0)
      {
        [v10 setIgnoreForDrift:0];
        unint64_t v12 = v10;
        uint64_t v13 = 1;
      }
      else
      {
        if (((1 << v11) & 0x1F04) == 0)
        {
          [v10 setIgnoreForDrift:1];
          goto LABEL_8;
        }
        [v10 setIgnoreForDrift:0];
        unint64_t v12 = v10;
        uint64_t v13 = 0;
      }
      [v12 setIsLeftHand:v13];
    }
LABEL_8:
    if ([v10 ignoreForDrift]
      && (p_jHistordouble y = &self->_otherHistory,
          ![(_UIKBRTTouchHistory *)self->_otherHistory containsInfo:v10]))
    {
      id v15 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
      p_fHistordouble y = &self->_fHistory;
      if ([(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v10]) {
        goto LABEL_20;
      }
    }
    else
    {
      if ([(_UIKBRTTouchHistory *)self->_otherHistory containsInfo:v10]) {
        [(_UIKBRTTouchHistory *)self->_otherHistory removeInfo:v10];
      }
      if (![v10 isLeftHand]
        || (p_jHistordouble y = &self->_fHistory, [(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v10]))
      {
        if ([v10 isLeftHand]) {
          goto LABEL_22;
        }
        p_jHistordouble y = &self->_jHistory;
        if ([(_UIKBRTTouchHistory *)self->_jHistory containsInfo:v10]) {
          goto LABEL_22;
        }
        id v15 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
        p_fHistordouble y = &self->_fHistory;
        if (![(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v10])
        {
LABEL_21:
          [(_UIKBRTTouchHistory *)*p_jHistory addInfo:v10];
LABEL_22:
          [(_UIKBRTTouchDrifting *)self _updateDriftWithTouchInfo:v10];
          goto LABEL_23;
        }
LABEL_20:
        [(_UIKBRTTouchHistory *)*p_fHistory removeInfo:v10];
        [*(id *)((char *)&self->super.super.isa + *v15) removeObject:v17];
        goto LABEL_21;
      }
    }
    id v15 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftLockTouchIDs;
    p_fHistordouble y = &self->_jHistory;
    if (![(_UIKBRTTouchHistory *)self->_jHistory containsInfo:v10]) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_23:
}

- (void)removeTouchWithIdentifier:(id)a3 touchCancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v24 = a3;
  double v6 = -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  char v7 = v6;
  if (v6)
  {
    [v6 setIsActive:0];
    p_fHistordouble y = &self->_fHistory;
    BOOL v9 = [(_UIKBRTTouchHistory *)self->_fHistory containsInfo:v7];
    BOOL v10 = [(_UIKBRTTouchHistory *)self->_jHistory containsInfo:v7];
    if (v4)
    {
      if (v9)
      {
        unint64_t v11 = &OBJC_IVAR____UIKBRTTouchDrifting__leftHandDriftOffsetObj;
        unint64_t v12 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftRemovingItems;
        uint64_t v13 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
        id v14 = &OBJC_IVAR____UIKBRTTouchDrifting__leftHandFixedOffsetObj;
      }
      else
      {
        if (!v10)
        {
          [(_UIKBRTTouchHistory *)self->_otherHistory removeInfo:v7];
          id v21 = 0;
          id v20 = 0;
          uint64_t v19 = 0;
          goto LABEL_16;
        }
        unint64_t v11 = &OBJC_IVAR____UIKBRTTouchDrifting__rightHandDriftOffsetObj;
        unint64_t v12 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftRemovingItems;
        uint64_t v13 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftLockTouchIDs;
        id v14 = &OBJC_IVAR____UIKBRTTouchDrifting__rightHandFixedOffsetObj;
        p_fHistordouble y = &self->_jHistory;
      }
      uint64_t v19 = *p_fHistory;
      id v20 = *(id *)((char *)&self->super.super.isa + *v14);
      id v21 = *(id *)((char *)&self->super.super.isa + *v11);
      [(_UIKBRTTouchHistory *)*p_fHistory removeInfo:v7];
      uint64_t v22 = *v13;
      [*(id *)((char *)&self->super.super.isa + v22) removeObject:v24];
      *((unsigned char *)&self->super.super.isa + *v12) = [*(id *)((char *)&self->super.super.isa + v22) count] != 0;
      if (v19 && ![(_UIKBRTTouchHistory *)v19 hasHistory])
      {
        [v20 reset];
        [v21 reset];
LABEL_17:

        id v15 = v24;
        goto LABEL_18;
      }
LABEL_16:
      [(_UIKBRTTouchHistory *)v19 lastTime];
      objc_msgSend(v20, "resetDecayTo:");
      [(_UIKBRTTouchHistory *)v19 lastTime];
      objc_msgSend(v21, "resetDecayTo:");
      goto LABEL_17;
    }
    id v15 = v24;
    if (v9)
    {
      [(NSMutableSet *)self->_leftDriftLockTouchIDs removeObject:v24];
      uint64_t v16 = [(NSMutableSet *)self->_leftDriftLockTouchIDs count];
      id v15 = v24;
      BOOL v17 = v16 != 0;
      uint64_t v18 = 97;
    }
    else
    {
      if (!v10)
      {
LABEL_18:
        [(NSMutableDictionary *)self->_touches removeObjectForKey:v15];
        [(_UIKBRTTouchDrifting *)self _updateHistory];
        [(_UIKBRTTouchDrifting *)self _updateDriftWithTouchInfo:0];
        goto LABEL_19;
      }
      [(NSMutableSet *)self->_rightDriftLockTouchIDs removeObject:v24];
      uint64_t v23 = [(NSMutableSet *)self->_rightDriftLockTouchIDs count];
      id v15 = v24;
      BOOL v17 = v23 != 0;
      uint64_t v18 = 98;
    }
    *((unsigned char *)&self->super.super.isa + v18) = v17;
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_updateHistory
{
  [(_UIKBRTTouchHistory *)self->_fHistory decayHistory];
  jHistordouble y = self->_jHistory;
  [(_UIKBRTTouchHistory *)jHistory decayHistory];
}

- (id)_touchDictWithFingerIds:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v4;
  uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        char v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        int v8 = -[_UIKBRTTouchDriftingDelegate _uikbrtTouchDrifting:touchIdentifiersForFingerID:](self->_delegate, "_uikbrtTouchDrifting:touchIdentifiersForFingerID:", self, (int)[v7 intValue]);
        if ([v8 count])
        {
          uint64_t v22 = v8;
          uint64_t v23 = i;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v9 = v8;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v25 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = [(NSMutableDictionary *)self->_touches objectForKey:*(void *)(*((void *)&v24 + 1) + 8 * j)];
                if (v14)
                {
                  id v15 = [v5 objectForKey:v7];

                  if (!v15)
                  {
                    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    [v5 setObject:v16 forKey:v7];
                  }
                  BOOL v17 = [v5 objectForKey:v7];
                  [v17 addObject:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v11);
          }

          int v8 = v22;
          uint64_t i = v23;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v21);
  }

  return v5;
}

- (void)_updateDriftWithTouchInfo:(id)a3
{
  id v4 = a3;
  if (self->_supportsDrifting)
  {
    id v5 = [(_UIKBRTTouchDrifting *)self _touchDictWithFingerIds:&unk_1ED3F0910];
    double v6 = [(_UIKBRTTouchDrifting *)self _touchDictWithFingerIds:&unk_1ED3F0928];
    BOOL v7 = [(_UIKBRTDecayingObject *)self->_enableLatchObj isActive];
    [(_UIKBRTDecayingObject *)self->_enableLatchObj startOrUpdateDecay];
    if (v4)
    {
      if ([(_UIKBRTDecayingObject *)self->_enableLatchObj isActive])
      {
        int v8 = [v5 keysOfEntriesPassingTest:&__block_literal_global_378];
        id v9 = [v6 keysOfEntriesPassingTest:&__block_literal_global_48_0];
        uint64_t v10 = [v8 setByAddingObjectsFromSet:v9];

        if ([v10 count]) {
          [(_UIKBRTDecayingObject *)self->_enableLatchObj resetDecayTo:CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff];
        }
        else {
          [(_UIKBRTDecayingObject *)self->_enableLatchObj startOrUpdateDecay];
        }
      }
      else if ((unint64_t)[v5 count] >= 2 && (unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        uint64_t v11 = [v5 count];
        if ((unint64_t)([v6 count] + v11) >= 5)
        {
          uint64_t v28 = 0;
          long long v29 = (double *)&v28;
          uint64_t v30 = 0x2020000000;
          long long v31 = 0;
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke;
          v35[3] = &unk_1E52FDE68;
          v35[4] = &v28;
          [v5 enumerateKeysAndObjectsUsingBlock:v35];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_3;
          v34[3] = &unk_1E52FDE68;
          v34[4] = &v28;
          [v6 enumerateKeysAndObjectsUsingBlock:v34];
          [(_UIKBRTDecayingObject *)self->_enableLatchObj resetDecayTo:v29[3]];
          _Block_object_dispose(&v28, 8);
        }
      }
    }
    if ([(_UIKBRTDecayingObject *)self->_enableLatchObj isActive])
    {
      uint64_t v28 = 0;
      long long v29 = (double *)&v28;
      uint64_t v30 = 0x3032000000;
      long long v31 = __Block_byref_object_copy__139;
      uint64_t v32 = __Block_byref_object_dispose__139;
      id v33 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x3032000000;
      long long v25 = __Block_byref_object_copy__139;
      long long v26 = __Block_byref_object_dispose__139;
      id v27 = 0;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_51;
      v19[3] = &unk_1E52FDEF8;
      id v12 = v4;
      id v20 = v12;
      uint64_t v21 = &v28;
      [v5 enumerateKeysAndObjectsUsingBlock:v19];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_3_53;
      id v16 = &unk_1E52FDEF8;
      id v17 = v12;
      uint64_t v18 = &v22;
      [v6 enumerateKeysAndObjectsUsingBlock:&v13];
      -[_UIKBRTTouchDrifting _updateDriftForFingers:leftHand:newestTouch:](self, "_updateDriftForFingers:leftHand:newestTouch:", v5, 1, *((void *)v29 + 5), v13, v14, v15, v16);
      [(_UIKBRTTouchDrifting *)self _updateDriftForFingers:v6 leftHand:0 newestTouch:v23[5]];

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      [(_UIKBRTTouchHistory *)self->_fHistory reset];
      [(_UIKBRTTouchHistory *)self->_jHistory reset];
      if (v7)
      {
        [(_UIKBRTDecayingOffset *)self->_leftHandDriftOffsetObj reset];
        [(_UIKBRTDecayingOffset *)self->_leftHandFixedOffsetObj reset];
        [(_UIKBRTDecayingOffset *)self->_rightHandDriftOffsetObj reset];
        [(_UIKBRTDecayingOffset *)self->_rightHandFixedOffsetObj reset];
        [(_UIKBRTTouchDriftingDelegate *)self->_delegate _uikbrtTouchDriftingStateChanged:self];
      }
    }
  }
  [(_UIKBRTTouchDrifting *)self _updateDriftView];
}

- (void)_updateDriftForFingers:(id)a3 leftHand:(BOOL)a4 newestTouch:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = 2;
  if (v6) {
    uint64_t v10 = 1;
  }
  uint64_t v11 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIKBRTTouchDrifting__touches[v10]);
  if (v6) {
    uint64_t v12 = 5;
  }
  else {
    uint64_t v12 = 8;
  }
  if (v6) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  if (v6) {
    uint64_t v14 = 6;
  }
  else {
    uint64_t v14 = 9;
  }
  if (v6) {
    uint64_t v15 = 6;
  }
  else {
    uint64_t v15 = 9;
  }
  id v55 = v11;
  id v54 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR____UIKBRTTouchDrifting__touches[v12]);
  id v53 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR____UIKBRTTouchDrifting__touches[v15]);
  if (v6)
  {
    [(_UIKBRTKeyboardTouchObserver *)self fCenter];
    id v16 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftLockTouchIDs;
    id v17 = &OBJC_IVAR____UIKBRTTouchDrifting__leftDriftRemovingItems;
    uint64_t v18 = &OBJC_IVAR____UIKBRTTouchDrifting__leftIndexFingerInfo;
  }
  else
  {
    [(_UIKBRTKeyboardTouchObserver *)self jCenter];
    id v16 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftLockTouchIDs;
    id v17 = &OBJC_IVAR____UIKBRTTouchDrifting__rightDriftRemovingItems;
    uint64_t v18 = &OBJC_IVAR____UIKBRTTouchDrifting__rightIndexFingerInfo;
  }
  id v56 = *(id *)((char *)&self->super.super.isa + *v16);
  int v52 = *((unsigned __int8 *)&self->super.super.isa + *v17);
  uint64_t v19 = (id *)((char *)&self->super.super.isa + *v18);
  id v20 = (_UIKBRTTouchHistoryInfo *)*v19;
  id v21 = *v19;
  *uint64_t v19 = 0;

  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke;
  v62[3] = &unk_1E52FDF48;
  v62[4] = &v63;
  v62[5] = &v67;
  [v8 enumerateKeysAndObjectsUsingBlock:v62];
  if ((unint64_t)v68[3] >= 3)
  {
    id v51 = v9;
    uint64_t v22 = v8;
    uint64_t v23 = [NSNumber numberWithUnsignedInteger:v14];
    uint64_t v24 = [v22 objectForKey:v23];
    long long v25 = [v24 firstObject];

    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_3;
    v57[3] = &unk_1E52FDF70;
    char v61 = v52;
    uint64_t v60 = v13;
    id v58 = v56;
    v59 = &v63;
    [v22 enumerateKeysAndObjectsUsingBlock:v57];
    if (v25)
    {
      long long v26 = v25;

      id v20 = v26;
    }
    else if (!v20)
    {
      id v20 = objc_alloc_init(_UIKBRTTouchHistoryInfo);
      [(_UIKBRTTouchHistoryInfo *)v20 setIsLeftHand:v6];
    }
    id v27 = [(_UIKBRTTouchHistoryInfo *)v20 touchIdentifier];

    if (!v27)
    {
      [(_UIKBRTTouchDriftingDelegate *)self->_delegate _uikbrtTouchDrifting:self touchCenterForFingerID:v14];
      -[_UIKBRTTouchHistoryInfo setActualLocation:](v20, "setActualLocation:");
    }

    id v8 = v22;
    id v9 = v51;
  }
  uint64_t v28 = v64[3];
  uint64_t v30 = v54;
  long long v29 = v55;
  long long v31 = v53;
  if (v20)
  {
    if (v28)
    {
      objc_storeStrong(v19, v20);
      if (v64[3])
      {
        uint64_t v32 = [(_UIKBRTTouchHistoryInfo *)v20 touchIdentifier];
        if (v32)
        {
          long long v29 = [(_UIKBRTTouchHistoryInfo *)v20 touchIdentifier];
          if ([v56 containsObject:v29])
          {

            uint64_t v30 = v54;
            long long v29 = v55;
            long long v31 = v53;
LABEL_52:
            [(_UIKBRTTouchHistoryInfo *)v20 actualLocation];
            -[_UIKBRTTouchDrifting _offsetForPoint:fromPoint:](self, "_offsetForPoint:fromPoint:");
            -[_UIKBRTTouchDrifting _pinOffset:](self, "_pinOffset:");
            objc_msgSend(v31, "updateOffsetTo:");
            objc_msgSend(v30, "updateOffsetTo:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
            [v29 clearHistory];
            [(_UIKBRTTouchDriftingDelegate *)self->_delegate _uikbrtTouchDriftingStateChanged:self];
            goto LABEL_55;
          }
        }
        v47 = [(_UIKBRTTouchHistoryInfo *)v20 touchIdentifier];
        if (v52) {
          BOOL v48 = 0;
        }
        else {
          BOOL v48 = v47 == 0;
        }
        int v49 = v48;

        if (v32)
        {

          uint64_t v30 = v54;
          long long v29 = v55;
          long long v31 = v53;
          if (v49) {
            goto LABEL_52;
          }
        }
        else
        {
          uint64_t v30 = v54;
          long long v29 = v55;
          long long v31 = v53;
          if (v49) {
            goto LABEL_52;
          }
        }
        CFAbsoluteTime v50 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
        [v31 resetDecayTo:v50];
        [v30 resetDecayTo:v50];
        goto LABEL_55;
      }
    }
  }
  else if (v28)
  {
    [v55 historyOffset];
    double v34 = v33;
    double v36 = v35;
    if (v33 * v33 + v35 * v35 <= 0.0)
    {
      CFAbsoluteTime v46 = CFAbsoluteTimeGetCurrent() + *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
      [v53 resetDecayTo:v46];
      [v54 resetDecayTo:v46];
    }
    else
    {
      [v53 originalOffset];
      double v38 = v37;
      double v40 = v39;
      -[_UIKBRTTouchDrifting _pinOffset:](self, "_pinOffset:", v34 + v37, v36 + v39);
      double v42 = v41;
      double v44 = v43;
      objc_msgSend(v53, "updateOffsetTo:");
      objc_msgSend(v54, "updateOffsetTo:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      objc_msgSend(v55, "adjustHistoryOffset:", v42 - v38, v44 - v40);
    }
    goto LABEL_42;
  }
  if ([v53 isActive]) {
    int v45 = 1;
  }
  else {
    int v45 = [v54 isActive];
  }
  [v53 startOrUpdateDecay];
  [v54 startOrUpdateDecay];
  if ([v53 isActive])
  {
    if (v45) {
      goto LABEL_55;
    }
    goto LABEL_42;
  }
  if (v45 != [v54 isActive]) {
LABEL_42:
  }
    [(_UIKBRTTouchDriftingDelegate *)self->_delegate _uikbrtTouchDriftingStateChanged:self];
LABEL_55:
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
}

- (CGPoint)_offsetForPoint:(CGPoint)a3 fromPoint:(CGPoint)a4
{
  double v4 = a3.x - a4.x;
  double v5 = a3.y - a4.y;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)_pointFromPoint:(CGPoint)a3 plusOffset:(CGPoint)a4
{
  double v4 = a3.x + a4.x;
  double v5 = a3.y + a4.y;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)_pinOffset:(CGPoint)a3
{
  p_touchError = &self->_touchError;
  double left = self->_touchError.left;
  if (a3.x < left || (double right = self->_touchError.right, right < a3.x))
  {
    if (a3.y < p_touchError->up || self->_touchError.down < a3.y)
    {
      uint64_t v6 = 24;
      if (a3.x < 0.0) {
        uint64_t v6 = 16;
      }
      double v7 = *(double *)((char *)&p_touchError->up + v6) / a3.x;
      if (v7 >= *(&p_touchError->up + (a3.y >= 0.0)) / a3.y) {
        double v7 = *(&p_touchError->up + (a3.y >= 0.0)) / a3.y;
      }
      if (v7 > 1.0) {
        double v7 = 1.0;
      }
      goto LABEL_21;
    }
    if (a3.x < left) {
      goto LABEL_15;
    }
    double right = self->_touchError.right;
  }
  if (right < a3.x)
  {
LABEL_15:
    uint64_t v8 = 24;
    if (a3.x < 0.0) {
      uint64_t v8 = 16;
    }
    double v7 = *(double *)((char *)&p_touchError->up + v8) / a3.x;
    goto LABEL_21;
  }
  if (a3.y < p_touchError->up || (double v7 = 1.0, self->_touchError.down < a3.y)) {
    double v7 = *(&p_touchError->up + (a3.y >= 0.0)) / a3.y;
  }
LABEL_21:
  double v9 = a3.x * v7;
  double v10 = a3.y * v7;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_updateDriftView
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference__UIKBRT_DriftFeedback, @"_UIKBRT_DriftFeedback", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1E8FD5344&& self->_supportsDrifting)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackParentView);
    if (!WeakRetained)
    {
LABEL_83:

      return;
    }
    [(_UIKBRTKeyboardTouchObserver *)self keySize];
    double v5 = v4;
    double v7 = v6;
    uint64_t v8 = [(_UIKBRTKeyboardTouchObserver *)self rowOffsets];
    double v9 = objc_msgSend(v8, "objectAtIndex:", -[_UIKBRTKeyboardTouchObserver homeRowOffsetIndex](self, "homeRowOffsetIndex") - 1);
    [v9 doubleValue];
    double v11 = v10;

    if (!self->_leftDriftFeedbackView)
    {
      uint64_t v12 = [UIView alloc];
      uint64_t v13 = -[UIView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      leftDriftFeedbackView = self->_leftDriftFeedbackView;
      self->_leftDriftFeedbackView = v13;

      uint64_t v15 = +[UIColor clearColor];
      [(UIView *)self->_leftDriftFeedbackView setBackgroundColor:v15];

      [(UIView *)self->_leftDriftFeedbackView setUserInteractionEnabled:0];
      [WeakRetained addSubview:self->_leftDriftFeedbackView];
      id v16 = +[UIColor colorWithWhite:0.75 alpha:0.25];
      for (int i = -1; i != 2; ++i)
      {
        int v18 = [(_UIKBRTKeyboardTouchObserver *)self homeRowOffsetIndex];
        uint64_t v19 = (v18 + i);
        if (v18 + i >= 0)
        {
          id v20 = [(_UIKBRTKeyboardTouchObserver *)self rowOffsets];
          unint64_t v21 = [v20 count];

          if (v21 > v19)
          {
            uint64_t v22 = [(_UIKBRTKeyboardTouchObserver *)self rowOffsets];
            uint64_t v23 = [v22 objectAtIndex:v19];
            [v23 doubleValue];
            double v25 = v24;

            double v26 = 0.0;
            int v27 = 5;
            do
            {
              uint64_t v28 = -[_UIKBRTTouchDrifingFingerCircleView initWithFrame:]([_UIKBRTTouchDrifingFingerCircleView alloc], "initWithFrame:", v25 + v5 * v26 - v11, v7 * (double)(i + 1), v5, v7);
              [(UIView *)v28 setBackgroundColor:v16];
              [(UIView *)self->_leftDriftFeedbackView addSubview:v28];

              double v26 = v26 + 1.0;
              --v27;
            }
            while (v27);
          }
        }
      }
    }
    id v119 = WeakRetained;
    if ([(_UIKBRTDecayingObject *)self->_leftHandDriftOffsetObj isDecaying]
      || [(_UIKBRTDecayingObject *)self->_leftHandFixedOffsetObj isDecaying])
    {
      long long v29 = +[UIColor colorWithRed:0.5 green:1.0 blue:1.0 alpha:0.25];
      long long v133 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      uint64_t v30 = [(UIView *)self->_leftDriftFeedbackView subviews];
      uint64_t v31 = [v30 countByEnumeratingWithState:&v133 objects:v141 count:16];
      if (!v31) {
        goto LABEL_38;
      }
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v134;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v134 != v33) {
            objc_enumerationMutation(v30);
          }
          double v35 = *(void **)(*((void *)&v133 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v36 = v29;
            id v37 = v35;
            objc_msgSend(v37, "setBorderColor:", objc_msgSend(v36, "CGColor"));
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v133 objects:v141 count:16];
      }
      while (v32);
    }
    else
    {
      long long v29 = +[UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:0.25];
      long long v129 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      uint64_t v30 = [(UIView *)self->_leftDriftFeedbackView subviews];
      uint64_t v38 = [v30 countByEnumeratingWithState:&v129 objects:v140 count:16];
      if (!v38) {
        goto LABEL_38;
      }
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v130;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v130 != v40) {
            objc_enumerationMutation(v30);
          }
          double v42 = *(void **)(*((void *)&v129 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v43 = v29;
            id v44 = v42;
            objc_msgSend(v44, "setBorderColor:", objc_msgSend(v43, "CGColor"));
          }
        }
        uint64_t v39 = [v30 countByEnumeratingWithState:&v129 objects:v140 count:16];
      }
      while (v39);
    }
    id WeakRetained = v119;
LABEL_38:

    [(_UIKBRTDecayingOffset *)self->_leftHandDriftOffsetObj offset];
    double v46 = v45;
    double v48 = v47;
    [(_UIKBRTDecayingOffset *)self->_leftHandFixedOffsetObj offset];
    double v50 = v49;
    double v52 = v11 + v46 + v51;
    [(_UIKBRTKeyboardTouchObserver *)self fCenter];
    double v54 = v53 + v52 + v5 * -3.5;
    [(_UIKBRTKeyboardTouchObserver *)self fCenter];
    double v56 = v7 * 1.5;
    double v57 = v48 + v50 + v55 - v7 * 1.5;
    id v58 = [(_UIKBRTKeyboardTouchObserver *)self rowOffsets];
    v59 = objc_msgSend(v58, "objectAtIndex:", -[_UIKBRTKeyboardTouchObserver homeRowOffsetIndex](self, "homeRowOffsetIndex") + 1);
    [v59 doubleValue];
    double v61 = v5 * 5.0 + v60;
    double v62 = v7 * 3.0;

    -[UIView setFrame:](self->_leftDriftFeedbackView, "setFrame:", v54, v57, v61, v7 * 3.0);
    [WeakRetained bringSubviewToFront:self->_leftDriftFeedbackView];
    if (_updateDriftView_onceToken != -1) {
      dispatch_once(&_updateDriftView_onceToken, &__block_literal_global_59);
    }
    if (!self->_rightDriftFeedbackView)
    {
      double v118 = v7 * 3.0;
      uint64_t v63 = [UIView alloc];
      v64 = -[UIView initWithFrame:](v63, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      rightDriftFeedbackView = self->_rightDriftFeedbackView;
      self->_rightDriftFeedbackView = v64;

      uint64_t v66 = +[UIColor clearColor];
      [(UIView *)self->_rightDriftFeedbackView setBackgroundColor:v66];

      [(UIView *)self->_rightDriftFeedbackView setUserInteractionEnabled:0];
      [WeakRetained addSubview:self->_rightDriftFeedbackView];
      uint64_t v67 = +[UIColor colorWithWhite:0.75 alpha:0.25];
      for (uint64_t m = -1; m != 2; ++m)
      {
        int v69 = [(_UIKBRTKeyboardTouchObserver *)self homeRowOffsetIndex];
        uint64_t v70 = (v69 + m);
        if (v69 + (int)m >= 0)
        {
          v71 = [(_UIKBRTKeyboardTouchObserver *)self rowOffsets];
          unint64_t v72 = [v71 count];

          if (v72 > v70)
          {
            v73 = [(_UIKBRTKeyboardTouchObserver *)self rowOffsets];
            v74 = [v73 objectAtIndex:v70];
            [v74 doubleValue];
            double v76 = v75;

            int v77 = *((_DWORD *)&_MergedGlobals_11 + m + 3);
            if (v77 >= 1)
            {
              double v78 = 0.0;
              do
              {
                v79 = -[_UIKBRTTouchDrifingFingerCircleView initWithFrame:]([_UIKBRTTouchDrifingFingerCircleView alloc], "initWithFrame:", v76 + v5 * v78 - v11, v7 * (double)((int)m + 1), v5, v7);
                [(UIView *)v79 setBackgroundColor:v67];
                [(UIView *)self->_rightDriftFeedbackView addSubview:v79];

                double v78 = v78 + 1.0;
                --v77;
              }
              while (v77);
            }
          }
        }
      }

      id WeakRetained = v119;
      double v62 = v118;
      double v56 = v7 * 1.5;
    }
    if ([(_UIKBRTDecayingObject *)self->_rightHandDriftOffsetObj isDecaying]
      || [(_UIKBRTDecayingObject *)self->_rightHandFixedOffsetObj isDecaying])
    {
      v80 = +[UIColor colorWithRed:0.5 green:1.0 blue:1.0 alpha:0.25];
      long long v125 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      v81 = [(UIView *)self->_rightDriftFeedbackView subviews];
      uint64_t v82 = [v81 countByEnumeratingWithState:&v125 objects:v139 count:16];
      if (v82)
      {
        uint64_t v83 = v82;
        uint64_t v84 = *(void *)v126;
        do
        {
          for (uint64_t n = 0; n != v83; ++n)
          {
            if (*(void *)v126 != v84) {
              objc_enumerationMutation(v81);
            }
            v86 = *(void **)(*((void *)&v125 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v87 = v80;
              id v88 = v86;
              objc_msgSend(v88, "setBorderColor:", objc_msgSend(v87, "CGColor"));
            }
          }
          uint64_t v83 = [v81 countByEnumeratingWithState:&v125 objects:v139 count:16];
        }
        while (v83);
LABEL_70:
        id WeakRetained = v119;
      }
    }
    else
    {
      v80 = +[UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:0.25];
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      v81 = [(UIView *)self->_rightDriftFeedbackView subviews];
      uint64_t v89 = [v81 countByEnumeratingWithState:&v121 objects:v138 count:16];
      if (v89)
      {
        uint64_t v90 = v89;
        uint64_t v91 = *(void *)v122;
        do
        {
          for (iint i = 0; ii != v90; ++ii)
          {
            if (*(void *)v122 != v91) {
              objc_enumerationMutation(v81);
            }
            v93 = *(void **)(*((void *)&v121 + 1) + 8 * ii);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v94 = v80;
              id v95 = v93;
              objc_msgSend(v95, "setBorderColor:", objc_msgSend(v94, "CGColor"));
            }
          }
          uint64_t v90 = [v81 countByEnumeratingWithState:&v121 objects:v138 count:16];
        }
        while (v90);
        goto LABEL_70;
      }
    }

    [(_UIKBRTDecayingOffset *)self->_rightHandDriftOffsetObj offset];
    double v97 = v96;
    double v99 = v98;
    [(_UIKBRTDecayingOffset *)self->_rightHandFixedOffsetObj offset];
    double v101 = v100;
    double v103 = v11 + v97 + v102;
    [(_UIKBRTKeyboardTouchObserver *)self jCenter];
    double v105 = v104 + v103 + v5 * -1.5;
    [(_UIKBRTKeyboardTouchObserver *)self jCenter];
    -[UIView setFrame:](self->_rightDriftFeedbackView, "setFrame:", v105, v99 + v101 + v106 - v56, v5 * *(double *)&_MergedGlobals_11, v62);
    [WeakRetained bringSubviewToFront:self->_rightDriftFeedbackView];
    if (!self->_touchHistoryFeedbackView)
    {
      v107 = [UIView alloc];
      v108 = -[UIView initWithFrame:](v107, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      touchHistoryFeedbackView = self->_touchHistoryFeedbackView;
      self->_touchHistoryFeedbackView = v108;

      v110 = +[UIColor clearColor];
      [(UIView *)self->_touchHistoryFeedbackView setBackgroundColor:v110];

      [(UIView *)self->_touchHistoryFeedbackView setUserInteractionEnabled:0];
      [WeakRetained addSubview:self->_touchHistoryFeedbackView];
    }
    if (!self->_touchHistoryViewMap)
    {
      v111 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:5 capacity:0];
      touchHistoryViewMap = self->_touchHistoryViewMap;
      self->_touchHistoryViewMap = v111;
    }
    [WeakRetained bounds];
    -[UIView setFrame:](self->_touchHistoryFeedbackView, "setFrame:");
    jHistordouble y = self->_jHistory;
    v137[0] = self->_fHistory;
    v137[1] = jHistory;
    v114 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:2];
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __40___UIKBRTTouchDrifting__updateDriftView__block_invoke_2;
    v120[3] = &unk_1E52FDF98;
    v120[4] = self;
    [v114 enumerateObjectsUsingBlock:v120];

    if (([(_UIKBRTDecayingObject *)self->_leftHandDriftOffsetObj isActive]
       || [(_UIKBRTDecayingObject *)self->_leftHandFixedOffsetObj isActive]
       || [(_UIKBRTDecayingObject *)self->_rightHandDriftOffsetObj isActive]
       || [(_UIKBRTDecayingObject *)self->_rightHandFixedOffsetObj isActive]
       || [(_UIKBRTTouchHistory *)self->_fHistory hasHistory]
       || [(_UIKBRTTouchHistory *)self->_jHistory hasHistory])
      && !self->_feedbackTimer)
    {
      v115 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__updateDriftViewTimer_ selector:0 userInfo:1 repeats:0.1];
      feedbackTimer = self->_feedbackTimer;
      self->_feedbackTimer = v115;

      v117 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v117 addTimer:self->_feedbackTimer forMode:*MEMORY[0x1E4F1C4B0]];
    }
    goto LABEL_83;
  }
  [(_UIKBRTTouchDrifting *)self _resetFeedback];
}

- (void)_updateDriftViewTimer:(id)a3
{
  if (self->_feedbackTimer != a3) {
    return;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = *(double *)&sSystemUptimeFromAbsoluteTimeDiff;
  BOOL v6 = [(_UIKBRTDecayingObject *)self->_leftHandFixedOffsetObj isActive]
    || [(_UIKBRTDecayingObject *)self->_leftHandDriftOffsetObj isActive]
    || [(_UIKBRTDecayingObject *)self->_rightHandFixedOffsetObj isActive]
    || [(_UIKBRTDecayingObject *)self->_rightHandDriftOffsetObj isActive];
  double v7 = Current + v5;
  [(_UIKBRTTouchDrifting *)self _updateHistory];
  uint64_t v8 = [(_UIKBRTTouchDrifting *)self _touchDictWithFingerIds:&unk_1ED3F0940];
  uint64_t v9 = [v8 count];

  leftHandDriftOffsetObuint64_t j = self->_leftHandDriftOffsetObj;
  if (v9)
  {
    [(_UIKBRTDecayingObject *)leftHandDriftOffsetObj resetActiveDecayTo:v7];
    [(_UIKBRTDecayingObject *)self->_leftHandFixedOffsetObj resetActiveDecayTo:v7];
  }
  else
  {
    [(_UIKBRTDecayingObject *)leftHandDriftOffsetObj startOrUpdateDecay];
    [(_UIKBRTDecayingObject *)self->_leftHandFixedOffsetObj startOrUpdateDecay];
  }
  double v11 = [(_UIKBRTTouchDrifting *)self _touchDictWithFingerIds:&unk_1ED3F0958];
  uint64_t v12 = [v11 count];

  rightHandDriftOffsetObuint64_t j = self->_rightHandDriftOffsetObj;
  if (v12)
  {
    [(_UIKBRTDecayingObject *)rightHandDriftOffsetObj resetActiveDecayTo:v7];
    [(_UIKBRTDecayingObject *)self->_rightHandFixedOffsetObj resetActiveDecayTo:v7];
  }
  else
  {
    [(_UIKBRTDecayingObject *)rightHandDriftOffsetObj startOrUpdateDecay];
    [(_UIKBRTDecayingObject *)self->_rightHandFixedOffsetObj startOrUpdateDecay];
  }
  if (![(_UIKBRTDecayingObject *)self->_leftHandFixedOffsetObj isActive]
    && ![(_UIKBRTDecayingObject *)self->_leftHandDriftOffsetObj isActive]
    && ![(_UIKBRTDecayingObject *)self->_rightHandFixedOffsetObj isActive])
  {
    BOOL v14 = [(_UIKBRTDecayingObject *)self->_rightHandDriftOffsetObj isActive];
    if (v6) {
      goto LABEL_17;
    }
LABEL_24:
    [(_UIKBRTTouchDrifting *)self _updateDriftView];
    if (v14) {
      return;
    }
    goto LABEL_25;
  }
  BOOL v14 = 1;
  if (!v6) {
    goto LABEL_24;
  }
LABEL_17:
  enableLatchObuint64_t j = self->_enableLatchObj;
  if (v14)
  {
    [(_UIKBRTDecayingObject *)enableLatchObj resetActiveDecayTo:v7];
    [(_UIKBRTTouchDrifting *)self _updateDriftView];
    return;
  }
  [(_UIKBRTDecayingObject *)enableLatchObj reset];
  [(_UIKBRTTouchDriftingDelegate *)self->_delegate _uikbrtTouchDriftingStateChanged:self];
  [(_UIKBRTTouchDrifting *)self _updateDriftView];
LABEL_25:
  if (![(_UIKBRTTouchHistory *)self->_fHistory hasHistory]
    && ![(_UIKBRTTouchHistory *)self->_jHistory hasHistory])
  {
    [(NSTimer *)self->_feedbackTimer invalidate];
    feedbackTimer = self->_feedbackTimer;
    self->_feedbackTimer = 0;
  }
}

- (_UIKBRTTouchDriftingDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIKBRTTouchDriftingDelegate *)a3;
}

- (NSArray)indexSearchOrder
{
  return self->_indexSearchOrder;
}

- (void)setIndexSearchOrder:(id)a3
{
}

- (NSMutableDictionary)touches
{
  return self->_touches;
}

- (void)setTouches:(id)a3
{
}

- (_UIKBRTTouchHistory)fHistory
{
  return self->_fHistory;
}

- (void)setFHistory:(id)a3
{
}

- (_UIKBRTTouchHistory)jHistory
{
  return self->_jHistory;
}

- (void)setJHistory:(id)a3
{
}

- (_UIKBRTTouchHistory)otherHistory
{
  return self->_otherHistory;
}

- (void)setOtherHistory:(id)a3
{
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)touchError
{
  double up = self->_touchError.up;
  dowuint64_t n = self->_touchError.down;
  double left = self->_touchError.left;
  double right = self->_touchError.right;
  result.var3 = right;
  result.var2 = left;
  result.var1 = down;
  result.var0 = up;
  return result;
}

- (void)setTouchError:(id)a3
{
  self->_touchError = ($0DA52F09BD1218B914A54A682A019838)a3;
}

- (BOOL)supportsDrifting
{
  return self->_supportsDrifting;
}

- (void)setSupportsDrifting:(BOOL)a3
{
  self->_supportsDrifting = a3;
}

- (_UIKBRTDecayingObject)enableLatchObj
{
  return self->_enableLatchObj;
}

- (void)setEnableLatchObj:(id)a3
{
}

- (_UIKBRTDecayingOffset)leftHandDriftOffsetObj
{
  return self->_leftHandDriftOffsetObj;
}

- (void)setLeftHandDriftOffsetObj:(id)a3
{
}

- (_UIKBRTDecayingOffset)leftHandFixedOffsetObj
{
  return self->_leftHandFixedOffsetObj;
}

- (void)setLeftHandFixedOffsetObj:(id)a3
{
}

- (_UIKBRTDecayingOffset)rightHandDriftOffsetObj
{
  return self->_rightHandDriftOffsetObj;
}

- (void)setRightHandDriftOffsetObj:(id)a3
{
}

- (_UIKBRTDecayingOffset)rightHandFixedOffsetObj
{
  return self->_rightHandFixedOffsetObj;
}

- (void)setRightHandFixedOffsetObj:(id)a3
{
}

- (_UIKBRTTouchHistoryInfo)leftIndexFingerInfo
{
  return self->_leftIndexFingerInfo;
}

- (void)setLeftIndexFingerInfo:(id)a3
{
}

- (NSMutableSet)leftDriftLockTouchIDs
{
  return self->_leftDriftLockTouchIDs;
}

- (void)setLeftDriftLockTouchIDs:(id)a3
{
}

- (BOOL)leftDriftRemovingItems
{
  return self->_leftDriftRemovingItems;
}

- (void)setLeftDriftRemovingItems:(BOOL)a3
{
  self->_leftDriftRemovingItems = a3;
}

- (_UIKBRTTouchHistoryInfo)rightIndexFingerInfo
{
  return self->_rightIndexFingerInfo;
}

- (void)setRightIndexFingerInfo:(id)a3
{
}

- (NSMutableSet)rightDriftLockTouchIDs
{
  return self->_rightDriftLockTouchIDs;
}

- (void)setRightDriftLockTouchIDs:(id)a3
{
}

- (BOOL)rightDriftRemovingItems
{
  return self->_rightDriftRemovingItems;
}

- (void)setRightDriftRemovingItems:(BOOL)a3
{
  self->_rightDriftRemovingItems = a3;
}

- (UIView)feedbackParentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackParentView);
  return (UIView *)WeakRetained;
}

- (void)setFeedbackParentView:(id)a3
{
}

- (NSTimer)feedbackTimer
{
  return self->_feedbackTimer;
}

- (void)setFeedbackTimer:(id)a3
{
}

- (UIView)leftDriftFeedbackView
{
  return self->_leftDriftFeedbackView;
}

- (void)setLeftDriftFeedbackView:(id)a3
{
}

- (UIView)rightDriftFeedbackView
{
  return self->_rightDriftFeedbackView;
}

- (void)setRightDriftFeedbackView:(id)a3
{
}

- (UIView)touchHistoryFeedbackView
{
  return self->_touchHistoryFeedbackView;
}

- (void)setTouchHistoryFeedbackView:(id)a3
{
}

- (NSMapTable)touchHistoryViewMap
{
  return self->_touchHistoryViewMap;
}

- (void)setTouchHistoryViewMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchHistoryViewMap, 0);
  objc_storeStrong((id *)&self->_touchHistoryFeedbackView, 0);
  objc_storeStrong((id *)&self->_rightDriftFeedbackView, 0);
  objc_storeStrong((id *)&self->_leftDriftFeedbackView, 0);
  objc_storeStrong((id *)&self->_feedbackTimer, 0);
  objc_destroyWeak((id *)&self->_feedbackParentView);
  objc_storeStrong((id *)&self->_rightDriftLockTouchIDs, 0);
  objc_storeStrong((id *)&self->_rightIndexFingerInfo, 0);
  objc_storeStrong((id *)&self->_leftDriftLockTouchIDs, 0);
  objc_storeStrong((id *)&self->_leftIndexFingerInfo, 0);
  objc_storeStrong((id *)&self->_rightHandFixedOffsetObj, 0);
  objc_storeStrong((id *)&self->_rightHandDriftOffsetObj, 0);
  objc_storeStrong((id *)&self->_leftHandFixedOffsetObj, 0);
  objc_storeStrong((id *)&self->_leftHandDriftOffsetObj, 0);
  objc_storeStrong((id *)&self->_enableLatchObj, 0);
  objc_storeStrong((id *)&self->_otherHistory, 0);
  objc_storeStrong((id *)&self->_jHistory, 0);
  objc_storeStrong((id *)&self->_fHistory, 0);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_indexSearchOrder, 0);
}

@end