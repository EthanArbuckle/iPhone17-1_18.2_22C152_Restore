@interface _UIKBRTFingerDetection
- (BOOL)_linkTouchesInArray:(id)a3 withIndexes:(id)a4 opposingHandIndexes:(id)a5 unassignedIndexes:(id)a6 thumb:(id)a7;
- (CGPoint)touchLocationForFingerId:(unint64_t)a3;
- (NSMapTable)fingerFeedbackViewMap;
- (NSMutableDictionary)touches;
- (UIView)feedbackParentView;
- (_UIKBRTFingerDetection)init;
- (_UIKBRTFingerDetection)initWithParentView:(id)a3;
- (_UIKBRTFingerDetectionView)feedbackView;
- (_UIKBRTFingerInfo)fakeLeftIndex;
- (_UIKBRTFingerInfo)fakeRightIndex;
- (id)fingerIdsRelatedToTouchWithIdentifier:(id)a3 sinceTimestamp:(double)a4 includeThumbs:(BOOL)a5;
- (id)touchIdentifiersForFingerId:(unint64_t)a3;
- (unint64_t)fingerIdForTouchWithIdentifier:(id)a3;
- (void)_updateFingerFeedback;
- (void)_updateFingerFeedback:(id)a3;
- (void)_updateTouchInfoForFingerID:(unint64_t)a3;
- (void)_updateTouchInfoFromOutsideInWithArray:(id)a3 indexes:(id)a4 newIdentityDict:(id)a5 fakeIndex:(id)a6;
- (void)addTouchLocation:(CGPoint)a3 withRadius:(double)a4 withTouchTime:(double)a5 withIdentifier:(id)a6;
- (void)dealloc;
- (void)moveTouchWithIdentifier:(id)a3 toLocation:(CGPoint)a4 withRadius:(double)a5 atTouchTime:(double)a6;
- (void)removeTouchWithIdentifier:(id)a3 touchCancelled:(BOOL)a4;
- (void)reset;
- (void)setFakeLeftIndex:(id)a3;
- (void)setFakeRightIndex:(id)a3;
- (void)setFeedbackParentView:(id)a3;
- (void)setFeedbackView:(id)a3;
- (void)setFingerFeedbackViewMap:(id)a3;
- (void)setTouches:(id)a3;
- (void)updateWithFCenter:(CGPoint)a3 jCenter:(CGPoint)a4 keySize:(CGSize)a5 rowOffsets:(id)a6 homeRowOffsetIndex:(int)a7;
@end

@implementation _UIKBRTFingerDetection

- (_UIKBRTFingerDetection)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKBRTFingerDetection;
  v2 = [(_UIKBRTFingerDetection *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    touches = v2->_touches;
    v2->_touches = v3;
  }
  return v2;
}

- (_UIKBRTFingerDetection)initWithParentView:(id)a3
{
  result = [(_UIKBRTFingerDetection *)self init];
  if (result) {
    result->_feedbackParentView = (UIView *)a3;
  }
  return result;
}

- (void)dealloc
{
  [(UIView *)self->_feedbackView removeFromSuperview];
  feedbackView = self->_feedbackView;
  self->_feedbackView = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIKBRTFingerDetection;
  [(_UIKBRTFingerDetection *)&v4 dealloc];
}

- (void)reset
{
  [(NSMutableDictionary *)self->_touches removeAllObjects];
  [(_UIKBRTFingerDetection *)self _updateTouchInfoForFingerID:0];
}

- (void)updateWithFCenter:(CGPoint)a3 jCenter:(CGPoint)a4 keySize:(CGSize)a5 rowOffsets:(id)a6 homeRowOffsetIndex:(int)a7
{
  v8.receiver = self;
  v8.super_class = (Class)_UIKBRTFingerDetection;
  -[_UIKBRTKeyboardTouchObserver updateWithFCenter:jCenter:keySize:rowOffsets:homeRowOffsetIndex:](&v8, sel_updateWithFCenter_jCenter_keySize_rowOffsets_homeRowOffsetIndex_, a6, *(void *)&a7, a3.x, a3.y, a4.x, a4.y, a5.width, a5.height);
  [(NSMutableDictionary *)self->_touches removeAllObjects];
  [(_UIKBRTFingerDetection *)self _updateTouchInfoForFingerID:0];
}

- (void)addTouchLocation:(CGPoint)a3 withRadius:(double)a4 withTouchTime:(double)a5 withIdentifier:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  touches = self->_touches;
  id v13 = a6;
  v14 = [(NSMutableDictionary *)touches objectForKey:v13];

  if (v14)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UIKBRTFingerDetection.m" lineNumber:224 description:@"Touch already in dictionary!"];
  }
  v16 = objc_alloc_init(_UIKBRTFingerInfo);
  -[_UIKBRTFingerInfo setLocation:](v16, "setLocation:", x, y);
  [(_UIKBRTFingerInfo *)v16 setRadius:a4];
  [(_UIKBRTFingerInfo *)v16 setLastSeenTimestamp:a5];
  [(NSMutableDictionary *)self->_touches setObject:v16 forKey:v13];

  [(_UIKBRTFingerDetection *)self _updateTouchInfoForFingerID:0];
}

- (void)moveTouchWithIdentifier:(id)a3 toLocation:(CGPoint)a4 withRadius:(double)a5 atTouchTime:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  v11 = [(NSMutableDictionary *)self->_touches objectForKey:a3];
  if (v11)
  {
    id v12 = v11;
    objc_msgSend(v11, "setLocation:", x, y);
    [v12 setRadius:a5];
    [v12 setLastSeenTimestamp:a6];
    -[_UIKBRTFingerDetection _updateTouchInfoForFingerID:](self, "_updateTouchInfoForFingerID:", [v12 identity]);
    v11 = v12;
  }
}

- (void)removeTouchWithIdentifier:(id)a3 touchCancelled:(BOOL)a4
{
  id v12 = a3;
  v5 = -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 identity];
    if ((unint64_t)[(NSMutableDictionary *)self->_touches count] < 4) {
      goto LABEL_14;
    }
    if (v7 != 9 && v7 != 6) {
      goto LABEL_14;
    }
    v9 = objc_alloc_init(_UIKBRTFakeFingerInfo);
    [(_UIKBRTFingerInfo *)v9 setIdentity:v7];
    [(_UIKBRTFingerInfo *)v9 setUnknownSeen:0];
    [v6 radius];
    -[_UIKBRTFingerInfo setRadius:](v9, "setRadius:");
    [v6 location];
    -[_UIKBRTFingerInfo setLocation:](v9, "setLocation:");
    uint64_t v10 = [v6 identity];
    if (v10 == 6)
    {
      v11 = &OBJC_IVAR____UIKBRTFingerDetection__fakeLeftIndex;
    }
    else
    {
      if (v10 != 9)
      {
LABEL_13:

LABEL_14:
        [(NSMutableDictionary *)self->_touches removeObjectForKey:v12];
        [(_UIKBRTFingerDetection *)self _updateTouchInfoForFingerID:v7];
        goto LABEL_15;
      }
      v11 = &OBJC_IVAR____UIKBRTFingerDetection__fakeRightIndex;
    }
    objc_storeStrong((id *)((char *)&self->super.super.isa + *v11), v9);
    goto LABEL_13;
  }
LABEL_15:
}

- (unint64_t)fingerIdForTouchWithIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_touches objectForKey:a3];
  objc_super v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 identity];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)touchIdentifiersForFingerId:(unint64_t)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__142;
  v22 = __Block_byref_object_dispose__142;
  id v23 = 0;
  if (a3 - 3 < 0xA)
  {
    touches = self->_touches;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54___UIKBRTFingerDetection_touchIdentifiersForFingerId___block_invoke;
    v17[3] = &unk_1E52FE308;
    v17[4] = &v18;
    v17[5] = a3;
    [(NSMutableDictionary *)touches enumerateKeysAndObjectsUsingBlock:v17];
LABEL_4:
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v7 = self->_touches;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54___UIKBRTFingerDetection_touchIdentifiersForFingerId___block_invoke_2;
    v14[3] = &unk_1E52FE330;
    unint64_t v16 = a3;
    id v8 = v6;
    id v15 = v8;
    [(NSMutableDictionary *)v7 enumerateKeysAndObjectsUsingBlock:v14];
    v9 = (void *)v19[5];
    v19[5] = (uint64_t)v8;
    id v10 = v8;

    v11 = (void *)v19[5];
    goto LABEL_5;
  }
  if (a3 < 3) {
    goto LABEL_4;
  }
  v11 = 0;
LABEL_5:
  id v12 = v11;
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (CGPoint)touchLocationForFingerId:(unint64_t)a3
{
  id v4 = 0;
  uint64_t v15 = 0;
  location = (id *)&v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__142;
  v19 = __Block_byref_object_dispose__142;
  id v20 = 0;
  if (a3 - 3 <= 9)
  {
    touches = self->_touches;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51___UIKBRTFingerDetection_touchLocationForFingerId___block_invoke;
    v14[3] = &unk_1E52FE308;
    void v14[4] = &v15;
    v14[5] = a3;
    [(NSMutableDictionary *)touches enumerateKeysAndObjectsUsingBlock:v14];
    id v4 = location[5];
    if (!v4)
    {
      if (a3 == 6)
      {
        uint64_t v7 = &OBJC_IVAR____UIKBRTFingerDetection__fakeLeftIndex;
      }
      else
      {
        if (a3 != 9)
        {
          id v4 = 0;
          goto LABEL_9;
        }
        uint64_t v7 = &OBJC_IVAR____UIKBRTFingerDetection__fakeRightIndex;
      }
      objc_storeStrong(location + 5, *(id *)((char *)&self->super.super.isa + *v7));
      id v4 = location[5];
    }
  }
LABEL_9:
  [v4 location];
  double v9 = v8;
  double v11 = v10;
  _Block_object_dispose(&v15, 8);

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)fingerIdsRelatedToTouchWithIdentifier:(id)a3 sinceTimestamp:(double)a4 includeThumbs:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = [(NSMutableDictionary *)self->_touches objectForKey:a3];
  double v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 identity];
    double v11 = 0;
    switch(v10)
    {
      case 0:
        break;
      case 1:
      case 3:
      case 4:
      case 5:
      case 6:
        if (v5) {
          goto LABEL_10;
        }
        double v11 = &unk_1ED3F0970;
        goto LABEL_12;
      case 2:
      case 9:
      case 10:
      case 11:
      case 12:
        if (v5) {
          goto LABEL_7;
        }
        double v11 = &unk_1ED3F0988;
        goto LABEL_12;
      case 7:
        if (!v5) {
          goto LABEL_17;
        }
LABEL_10:
        double v12 = &unk_1ED3F0970;
        double v13 = &unk_1ED3F56B8;
        goto LABEL_11;
      case 8:
        if (v5)
        {
LABEL_7:
          double v12 = &unk_1ED3F0988;
          double v13 = &unk_1ED3F5748;
LABEL_11:
          double v11 = [v12 arrayByAddingObject:v13];
        }
        else
        {
LABEL_17:
          double v11 = 0;
        }
LABEL_12:
        v14 = [(NSMutableDictionary *)self->_touches allValues];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __93___UIKBRTFingerDetection_fingerIdsRelatedToTouchWithIdentifier_sinceTimestamp_includeThumbs___block_invoke;
        v21[3] = &unk_1E52FE358;
        id v22 = v11;
        uint64_t v23 = v10;
        double v24 = a4;
        id v15 = v11;
        unint64_t v16 = [v14 indexesOfObjectsPassingTest:v21];
        uint64_t v17 = [v14 objectsAtIndexes:v16];

        uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
        v19 = [v17 valueForKey:@"identity"];
        double v11 = [v18 setWithArray:v19];

        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (BOOL)_linkTouchesInArray:(id)a3 withIndexes:(id)a4 opposingHandIndexes:(id)a5 unassignedIndexes:(id)a6 thumb:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  [(_UIKBRTKeyboardTouchObserver *)self keySize];
  double v18 = v17;
  if ((unint64_t)[v13 count] >= 2)
  {
    uint64_t v45 = 0;
    v46 = (double *)&v45;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0;
    v19 = [v13 indexSet];
    id v20 = [v12 objectsAtIndexes:v19];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __102___UIKBRTFingerDetection__linkTouchesInArray_withIndexes_opposingHandIndexes_unassignedIndexes_thumb___block_invoke;
    v43[3] = &unk_1E52FE380;
    v43[4] = &v45;
    v43[5] = v44;
    [v20 enumerateObjectsUsingBlock:v43];

    double v21 = v46[3];
    double v18 = v21 / (double)(unint64_t)([v13 count] - 1);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&v45, 8);
  }
  if ([v13 count])
  {
    id v22 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "beginningIndex"));
    [v22 location];
    double v24 = v23;
  }
  else if ([v15 reversed])
  {
    double v24 = 0.0;
  }
  else
  {
    double v24 = 1.79769313e308;
  }
  uint64_t v25 = [v15 count];
  if (v25 + [v14 count])
  {
    uint64_t v28 = [v15 count];
    if (v28 + [v14 count])
    {
      unint64_t v29 = 0;
      double v30 = v18 * 0.5;
      while ((unint64_t)[v13 count] <= 3)
      {
        if ([v15 count])
        {
          uint64_t v31 = [v13 count];
          uint64_t v32 = [v15 endingIndex];
          if (v31)
          {
            v33 = [v12 objectAtIndex:v32];
            [v33 location];
            double v35 = v34;
            double v36 = vabdd_f64(v24, v34);
            if ([v13 count] == 3) {
              double v37 = 2.0;
            }
            else {
              double v37 = 1.0;
            }
            if (vabdd_f64(v36, v18) > v30 * v37) {
              goto LABEL_34;
            }
            if ([v13 count] != 1)
            {
              double v38 = v36 + v18 * (double)(unint64_t)([v13 count] - 1);
              double v36 = v38 / (double)(unint64_t)[v13 count];
            }
            objc_msgSend(v13, "addIndex:", objc_msgSend(v15, "endingIndex"));
            objc_msgSend(v15, "removeIndex:", objc_msgSend(v15, "endingIndex"));
            if (v16)
            {
LABEL_34:

              break;
            }
            double v18 = v36;
          }
          else
          {
            [v13 addIndex:v32];
            objc_msgSend(v15, "removeIndex:", objc_msgSend(v15, "endingIndex"));
            v33 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "beginningIndex"));
            [v33 location];
            double v35 = v39;
          }

          double v24 = v35;
        }
        if ([v15 count] || !objc_msgSend(v14, "count"))
        {
          if (![v15 count]) {
            break;
          }
        }
        else
        {
          objc_msgSend(v15, "addIndex:", objc_msgSend(v14, "endingIndex"));
          objc_msgSend(v14, "removeIndex:", objc_msgSend(v14, "endingIndex"));
          ++v29;
          double v30 = v30 * 0.75;
        }
        uint64_t v40 = [v15 count];
        if (!(v40 + [v14 count])) {
          break;
        }
      }
    }
    else
    {
      unint64_t v29 = 0;
    }
    BOOL v26 = [v15 count] < v29;
    if ([v15 count] && v29)
    {
      unint64_t v41 = v29 - 1;
      do
      {
        unint64_t v42 = v41;
        objc_msgSend(v14, "addIndex:", objc_msgSend(v15, "beginningIndex"));
        objc_msgSend(v15, "removeIndex:", objc_msgSend(v15, "beginningIndex"));
        if (![v15 count]) {
          break;
        }
        unint64_t v41 = v42 - 1;
      }
      while (v42);
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (void)_updateTouchInfoFromOutsideInWithArray:(id)a3 indexes:(id)a4 newIdentityDict:(id)a5 fakeIndex:(id)a6
{
  v145[5] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v124 = a6;
  int v12 = [v10 reversed];
  if (v12) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  if (v12) {
    uint64_t v14 = 12;
  }
  else {
    uint64_t v14 = 3;
  }
  if (v12) {
    uint64_t v15 = 11;
  }
  else {
    uint64_t v15 = 4;
  }
  uint64_t v16 = 5;
  if (v12) {
    uint64_t v16 = 10;
  }
  uint64_t v121 = v16;
  uint64_t v122 = v15;
  if (v12) {
    uint64_t v17 = 9;
  }
  else {
    uint64_t v17 = 6;
  }
  uint64_t v18 = 7;
  if (v12) {
    uint64_t v18 = 8;
  }
  uint64_t v119 = v18;
  v19 = [v10 indexSet];
  id v20 = [v9 objectsAtIndexes:v19];

  if ([v10 reversed])
  {
    double v21 = [v20 reverseObjectEnumerator];
    uint64_t v22 = [v21 allObjects];

    id v20 = (void *)v22;
  }
  double v23 = [NSNumber numberWithUnsignedInteger:v13];
  double v24 = [v11 objectForKey:v23];

  uint64_t v25 = [v11 objectForKey:&unk_1ED3F5760];
  BOOL v26 = [v10 indexSet];
  [v25 removeIndexes:v26];

  v27 = [v10 indexSet];
  [v24 addIndexes:v27];

  if ((unint64_t)[v10 count] >= 4)
  {
    id v123 = v9;
    [NSNumber numberWithUnsignedInteger:v14];
    v118 = v20;
    id v28 = v11;
    v30 = unint64_t v29 = v24;
    v145[0] = v30;
    uint64_t v31 = [NSNumber numberWithUnsignedInteger:v122];
    v145[1] = v31;
    uint64_t v32 = [NSNumber numberWithUnsignedInteger:v121];
    uint64_t v33 = v17;
    double v34 = (void *)v32;
    v145[2] = v32;
    double v35 = [NSNumber numberWithUnsignedInteger:v33];
    v145[3] = v35;
    double v36 = [NSNumber numberWithUnsignedInteger:v119];
    v145[4] = v36;
    double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:5];

    double v38 = (void *)v30;
    double v24 = v29;
    id v11 = v28;
    id v20 = v118;
    goto LABEL_60;
  }
  if ([v10 count] == 3)
  {
    uint64_t v39 = v17;
    id v123 = v9;
    uint64_t v40 = [v20 objectAtIndex:0];
    uint64_t v31 = [v20 objectAtIndex:1];
    double v34 = [v20 objectAtIndex:2];
    v117 = v24;
    if (v124 && ([v124 unknownSeen] & 1) == 0)
    {
      v57 = v40;
      double v35 = [NSNumber numberWithUnsignedInteger:v14];
      v144[0] = v35;
      v59 = [NSNumber numberWithUnsignedInteger:v122];
      v144[1] = v59;
      v60 = [NSNumber numberWithUnsignedInteger:v121];
      v144[2] = v60;
      v61 = v144;
    }
    else
    {
      [v34 location];
      double v42 = v41;
      [v40 location];
      double v44 = vabdd_f64(v42, v43);
      [v31 radius];
      double v46 = v45;
      [v34 radius];
      double v48 = (v46 + v47) * 0.5;
      [v31 location];
      double v50 = v49;
      [v40 location];
      double v52 = v50 - v51;
      [v34 location];
      double v54 = v53;
      [v40 location];
      double v56 = v52 / (v54 - v55);
      if (v44 <= v48 * 12.0)
      {
        if (v56 >= 0.35)
        {
          if (v56 <= 0.65 || ([v34 location], double v90 = v89, objc_msgSend(v31, "location"), v90 <= v91))
          {
            [v34 location];
            double v93 = v92;
            [v31 location];
            double v95 = v93 - v94;
            [v31 radius];
            if (v95 <= v96 * 5.0
              || ([v34 location],
                  double v98 = v97,
                  [v31 location],
                  double v100 = v98 - v99,
                  [v31 location],
                  double v102 = v101,
                  [v40 location],
                  v100 <= (v102 - v103) * 1.5))
            {
              [v40 location];
              double v108 = v107;
              [v31 location];
              if (v108 <= v109
                || ([v40 location], double v111 = v110, objc_msgSend(v34, "location"), v111 <= v112))
              {
                v57 = v40;
                double v35 = [NSNumber numberWithUnsignedInteger:v122];
                v137[0] = v35;
                v59 = [NSNumber numberWithUnsignedInteger:v121];
                v137[1] = v59;
                v60 = [NSNumber numberWithUnsignedInteger:v39];
                v137[2] = v60;
                v61 = v137;
              }
              else
              {
                v57 = v40;
                double v35 = [NSNumber numberWithUnsignedInteger:v14];
                v138[0] = v35;
                v59 = [NSNumber numberWithUnsignedInteger:v122];
                v138[1] = v59;
                v60 = [NSNumber numberWithUnsignedInteger:v121];
                v138[2] = v60;
                v61 = v138;
              }
            }
            else
            {
              v57 = v40;
              double v35 = [NSNumber numberWithUnsignedInteger:v14];
              v139[0] = v35;
              v59 = [NSNumber numberWithUnsignedInteger:v122];
              v139[1] = v59;
              v60 = [NSNumber numberWithUnsignedInteger:v39];
              v139[2] = v60;
              v61 = v139;
            }
          }
          else
          {
            v57 = v40;
            double v35 = [NSNumber numberWithUnsignedInteger:v14];
            v140[0] = v35;
            v59 = [NSNumber numberWithUnsignedInteger:v121];
            v140[1] = v59;
            v60 = [NSNumber numberWithUnsignedInteger:v39];
            v140[2] = v60;
            v61 = v140;
          }
        }
        else
        {
          v57 = v40;
          double v35 = [NSNumber numberWithUnsignedInteger:v14];
          v141[0] = v35;
          v59 = [NSNumber numberWithUnsignedInteger:v122];
          v141[1] = v59;
          v60 = [NSNumber numberWithUnsignedInteger:v39];
          v141[2] = v60;
          v61 = v141;
        }
      }
      else
      {
        v57 = v40;
        uint64_t v58 = [NSNumber numberWithUnsignedInteger:v14];
        double v35 = (void *)v58;
        if (v56 <= 0.5)
        {
          v143[0] = v58;
          v59 = [NSNumber numberWithUnsignedInteger:v122];
          v143[1] = v59;
          v60 = [NSNumber numberWithUnsignedInteger:v39];
          v143[2] = v60;
          v61 = v143;
        }
        else
        {
          v142[0] = v58;
          v59 = [NSNumber numberWithUnsignedInteger:v121];
          v142[1] = v59;
          v60 = [NSNumber numberWithUnsignedInteger:v39];
          v142[2] = v60;
          v61 = v142;
        }
      }
    }
    double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];

    double v38 = v57;
    double v24 = v117;
    goto LABEL_60;
  }
  if ([v10 count] == 2)
  {
    uint64_t v120 = v17;
    double v38 = [v20 objectAtIndex:0];
    v62 = [v20 objectAtIndex:1];
    [v62 radius];
    double v64 = v63;
    [v38 radius];
    double v66 = v64 + v65;
    [v62 location];
    double v68 = v67;
    [v38 location];
    double v70 = vabdd_f64(v68, v69) - v66;
    [v38 location];
    double v72 = v71;
    [v62 location];
    id v123 = v9;
    if (v72 <= v73)
    {
      [v38 location];
      double v80 = v79;
      v81 = v62;
      [v62 location];
      double v82 = v66 * 1.5;
      id v83 = v11;
      if (v80 >= v84)
      {
        if (v70 >= v82)
        {
          uint64_t v85 = [NSNumber numberWithUnsignedInteger:v122];
          v131[0] = v85;
          uint64_t v86 = [NSNumber numberWithUnsignedInteger:v120];
          v131[1] = v86;
          v87 = (void *)MEMORY[0x1E4F1C978];
          v88 = v131;
        }
        else
        {
          uint64_t v85 = [NSNumber numberWithUnsignedInteger:v121];
          v130[0] = v85;
          uint64_t v86 = [NSNumber numberWithUnsignedInteger:v120];
          v130[1] = v86;
          v87 = (void *)MEMORY[0x1E4F1C978];
          v88 = v130;
        }
      }
      else if (v70 >= v82)
      {
        uint64_t v85 = [NSNumber numberWithUnsignedInteger:v122];
        v133[0] = v85;
        uint64_t v86 = [NSNumber numberWithUnsignedInteger:v120];
        v133[1] = v86;
        v87 = (void *)MEMORY[0x1E4F1C978];
        v88 = v133;
      }
      else
      {
        uint64_t v85 = [NSNumber numberWithUnsignedInteger:v121];
        v132[0] = v85;
        uint64_t v86 = [NSNumber numberWithUnsignedInteger:v120];
        v132[1] = v86;
        v87 = (void *)MEMORY[0x1E4F1C978];
        v88 = v132;
      }
      double v37 = [v87 arrayWithObjects:v88 count:2];
      uint64_t v31 = v81;
      double v34 = (void *)v85;
      id v11 = v83;
    }
    else
    {
      v74 = v62;
      if (v70 < v66 * 2.5)
      {
        uint64_t v75 = [NSNumber numberWithUnsignedInteger:v14];
        v76 = (void *)v75;
        uint64_t v31 = v62;
        if (v70 >= v66 * 1.5)
        {
          v135[0] = v75;
          double v35 = [NSNumber numberWithUnsignedInteger:v121];
          v135[1] = v35;
          v77 = (void *)MEMORY[0x1E4F1C978];
          v78 = v135;
        }
        else
        {
          v134[0] = v75;
          double v35 = [NSNumber numberWithUnsignedInteger:v122];
          v134[1] = v35;
          v77 = (void *)MEMORY[0x1E4F1C978];
          v78 = v134;
        }
        double v37 = [v77 arrayWithObjects:v78 count:2];
        double v34 = v76;
        goto LABEL_60;
      }
      [NSNumber numberWithUnsignedInteger:v14];
      v104 = v20;
      v106 = id v105 = v11;
      v136[0] = v106;
      uint64_t v86 = [NSNumber numberWithUnsignedInteger:v120];
      v136[1] = v86;
      double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:2];
      uint64_t v31 = v74;
      double v34 = (void *)v106;
      id v11 = v105;
      id v20 = v104;
    }
    double v35 = (void *)v86;
LABEL_60:

    id v9 = v123;
    goto LABEL_61;
  }
  double v37 = 0;
LABEL_61:
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __99___UIKBRTFingerDetection__updateTouchInfoFromOutsideInWithArray_indexes_newIdentityDict_fakeIndex___block_invoke;
  v125[3] = &unk_1E52FE3A8;
  id v126 = v37;
  id v127 = v9;
  id v128 = v11;
  id v129 = v24;
  id v113 = v24;
  id v114 = v11;
  id v115 = v9;
  id v116 = v37;
  [v20 enumerateObjectsUsingBlock:v125];
}

- (void)_updateTouchInfoForFingerID:(unint64_t)a3
{
  if ([(NSMutableDictionary *)self->_touches count])
  {
    *(void *)&v235.origin.CGFloat y = self;
    BOOL v5 = [(NSMutableDictionary *)self->_touches allValues];
    id v6 = (void *)[v5 mutableCopy];

    [v6 sortUsingComparator:&__block_literal_global_382];
    uint64_t v266 = 0;
    v267 = (double *)&v266;
    uint64_t v268 = 0x2020000000;
    uint64_t v269 = 0;
    v265[0] = MEMORY[0x1E4F143A8];
    v265[1] = 3221225472;
    v265[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_2;
    v265[3] = &unk_1E52FE3F0;
    v265[4] = &v266;
    [v6 enumerateObjectsUsingBlock:v265];
    double v7 = v267[3];
    double v8 = v7 / (double)(unint64_t)[v6 count];
    v267[3] = 0.0;
    v264[0] = MEMORY[0x1E4F143A8];
    v264[1] = 3221225472;
    v264[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_3;
    v264[3] = &unk_1E52FE418;
    *(double *)&v264[5] = v8;
    v264[4] = &v266;
    [v6 enumerateObjectsUsingBlock:v264];
    double v9 = v267[3];
    unint64_t v10 = [v6 count];
    _Block_object_dispose(&v266, 8);
    id v11 = objc_alloc_init(MEMORY[0x1E4F28D60]);
    CGFloat y = v235.origin.y;
    uint64_t v13 = [*(id *)&v235.origin.y rowOffsets];
    uint64_t v14 = [v13 count];
    unint64_t v15 = v14 - (int)[*(id *)&v235.origin.y homeRowOffsetIndex];

    if (v15 < 2)
    {
      if ((unint64_t)[v6 count] < 4) {
        goto LABEL_10;
      }
      v263[4] = MEMORY[0x1E4F143A8];
      v263[5] = 3221225472;
      v263[6] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_5;
      v263[7] = &__block_descriptor_48_e34_B32__0___UIKBRTFingerInfo_8Q16_B24l;
      *(double *)&v263[8] = v8;
      *(double *)&v263[9] = v9 / (double)v10;
    }
    else
    {
      [*(id *)&v235.origin.y fCenter];
      double v17 = v16;
      [*(id *)&v235.origin.y jCenter];
      double v19 = (v17 + v18) * 0.5;
      [*(id *)&v235.origin.y keySize];
      v263[10] = MEMORY[0x1E4F143A8];
      v263[11] = 3221225472;
      v263[12] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_4;
      v263[13] = &__block_descriptor_40_e34_B32__0___UIKBRTFingerInfo_8Q16_B24l;
      *(double *)&v263[14] = v19 + ((double)v15 + -0.5) * v20;
    }
    uint64_t v21 = objc_msgSend(v6, "indexesOfObjectsPassingTest:");

    id v11 = (id)v21;
LABEL_10:
    if ([v11 count])
    {
      if ([v11 count] == 1)
      {
        uint64_t v22 = [v11 firstIndex];
        double v23 = [v6 objectAtIndex:v22];
        [*(id *)&v23 location];
        double v25 = v24;
        if (v22)
        {
          BOOL v26 = [v6 objectAtIndex:v22 - 1];
          [v26 location];
          double v28 = v25 - v27;
        }
        else
        {
          double v28 = 1.79769313e308;
        }
        unint64_t v35 = v22 + 1;
        if (v35 >= [v6 count])
        {
          double v38 = 1.79769313e308;
        }
        else
        {
          double v36 = [v6 objectAtIndex:v35];
          [v36 location];
          double v38 = v37 - v25;
        }
        if (v28 == v38)
        {
          [*(id *)&v235.origin.y fCenter];
          double v28 = vabdd_f64(v25, v39);
          [*(id *)&v235.origin.y jCenter];
          double v38 = vabdd_f64(v25, v40);
        }
        if (v28 >= v38) {
          uint64_t v41 = 8;
        }
        else {
          uint64_t v41 = 7;
        }
        if (v28 >= v38) {
          CGFloat v29 = v23;
        }
        else {
          CGFloat v29 = 0.0;
        }
        if (v28 >= v38) {
          double v30 = 0.0;
        }
        else {
          double v30 = v23;
        }
        [*(id *)&v23 setIdentity:v41];
      }
      else
      {
        if ((unint64_t)[v11 count] >= 3)
        {
          uint64_t v266 = 0;
          v267 = (double *)&v266;
          uint64_t v268 = 0x2020000000;
          uint64_t v269 = 0x7FFFFFFFFFFFFFFFLL;
          v263[0] = 0;
          v263[1] = v263;
          v263[2] = 0x2020000000;
          v263[3] = 0x7FEFFFFFFFFFFFFFLL;
          v262[0] = 0;
          v262[1] = v262;
          v262[2] = 0x2020000000;
          v262[3] = 0x7FFFFFFFFFFFFFFFLL;
          v261[0] = 0;
          v261[1] = v261;
          v261[2] = 0x2020000000;
          v261[3] = 0x7FEFFFFFFFFFFFFFLL;
          [*(id *)&v235.origin.y fCenter];
          double v32 = v31;
          [*(id *)&v235.origin.y jCenter];
          v254[0] = MEMORY[0x1E4F143A8];
          v254[1] = 3221225472;
          v254[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_6;
          v254[3] = &unk_1E52FE480;
          double v260 = (v32 + v33) * 0.5;
          id v255 = v6;
          v256 = v263;
          v257 = v261;
          v258 = v262;
          v259 = &v266;
          [v11 enumerateRangesUsingBlock:v254];
          v253[0] = MEMORY[0x1E4F143A8];
          v253[1] = 3221225472;
          v253[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_7;
          v253[3] = &unk_1E52FE4A8;
          v253[4] = &v266;
          v253[5] = v262;
          uint64_t v34 = [v11 indexesPassingTest:v253];

          _Block_object_dispose(v261, 8);
          _Block_object_dispose(v262, 8);
          _Block_object_dispose(v263, 8);
          _Block_object_dispose(&v266, 8);
          id v11 = (id)v34;
          CGFloat y = v235.origin.y;
        }
        objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v11, "firstIndex"));
        double v30 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v11, "lastIndex"));
        CGFloat v29 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        [*(id *)&v30 setIdentity:7];
        [*(id *)&v29 setIdentity:8];
      }
      [v6 removeObjectsAtIndexes:v11];
    }
    else
    {
      CGFloat v29 = 0.0;
      double v30 = 0.0;
    }
    if ([v6 count] == 8)
    {
      v251[0] = MEMORY[0x1E4F143A8];
      v251[1] = 3221225472;
      v251[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_8;
      v251[3] = &unk_1E52FE4D0;
      v252 = (_UIKBRTMutableOrderIndexSet *)&unk_1ED3F09A0;
      [v6 enumerateObjectsUsingBlock:v251];
      double v42 = *(void **)(*(void *)&y + 128);
      *(void *)(*(void *)&y + 128) = 0;

      double v43 = *(void **)(*(void *)&y + 136);
      *(void *)(*(void *)&y + 136) = 0;

      double v44 = v252;
LABEL_127:

      goto LABEL_128;
    }
    if (![v6 count])
    {
LABEL_128:
      if (v30 == 0.0 || v29 != 0.0)
      {
        if (v30 != 0.0 || v29 == 0.0) {
          goto LABEL_141;
        }
        *(void *)&v235.size.width = MEMORY[0x1E4F143A8];
        *(void *)&v235.size.height = 3221225472;
        v236 = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_14;
        v237 = &unk_1E52FE570;
        v196 = &v238;
        id v202 = *(id *)&v29;
        id v238 = v202;
        uint64_t v203 = [v6 indexOfObjectWithOptions:2 passingTest:&v235.size];
        if (v203 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v199 = [v6 objectAtIndex:v203];
          if ((unint64_t)([v199 identity] - 3) <= 3)
          {
            v200 = v202;
            uint64_t v201 = 7;
            goto LABEL_138;
          }
LABEL_139:
        }
      }
      else
      {
        v239[0] = MEMORY[0x1E4F143A8];
        v239[1] = 3221225472;
        v239[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_13;
        v239[3] = &unk_1E52FE570;
        v196 = &v240;
        id v197 = *(id *)&v30;
        id v240 = v197;
        uint64_t v198 = [v6 indexOfObjectPassingTest:v239];
        if (v198 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v199 = [v6 objectAtIndex:v198];
          if ((unint64_t)([v199 identity] - 9) <= 3)
          {
            v200 = v197;
            uint64_t v201 = 8;
LABEL_138:
            [v200 setIdentity:v201];
            goto LABEL_139;
          }
          goto LABEL_139;
        }
      }

LABEL_141:
      [*(id *)&y _updateFingerFeedback];

      return;
    }
    unint64_t rect1_24 = a3;
    double v234 = v30;
    double v44 = objc_alloc_init(_UIKBRTMutableOrderIndexSet);
    double v45 = objc_alloc_init(_UIKBRTMutableOrderIndexSet);
    id v233 = v11;
    if ([v11 count])
    {
      v246[0] = MEMORY[0x1E4F143A8];
      v246[1] = 3221225472;
      v246[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_9;
      v246[3] = &unk_1E52FE3A8;
      double v46 = &v247;
      id v247 = *(id *)&v30;
      double v47 = (id *)&v248;
      v248 = v44;
      id v249 = *(id *)&v29;
      v250 = v45;
      [v6 enumerateObjectsUsingBlock:v246];
    }
    else
    {
      [*(id *)&y fCenter];
      double v49 = v48;
      [*(id *)&y keySize];
      double v51 = v49 + v50 * 0.5;
      [*(id *)&y jCenter];
      double v53 = v52;
      [*(id *)&y keySize];
      double v55 = v53 - v54 * 0.5;
      v243[0] = MEMORY[0x1E4F143A8];
      v243[1] = 3221225472;
      v243[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_10;
      v243[3] = &unk_1E52FE4F8;
      *(double *)&v245[1] = v51;
      double v46 = (id *)&v244;
      v244 = v44;
      *(double *)&v245[2] = v55;
      double v47 = (id *)v245;
      v245[0] = v45;
      [v6 enumerateObjectsUsingBlock:v243];
    }

    if ([(_UIKBRTMutableOrderIndexSet *)v44 count] >= 5)
    {
      do
        [(_UIKBRTMutableOrderIndexSet *)v44 removeIndex:[(_UIKBRTMutableOrderIndexSet *)v44 highestIndex]];
      while ([(_UIKBRTMutableOrderIndexSet *)v44 count] > 4);
    }
    v235.origin.CGFloat x = v29;
    if ([(_UIKBRTMutableOrderIndexSet *)v45 count] >= 5)
    {
      do
        [(_UIKBRTMutableOrderIndexSet *)v45 removeIndex:[(_UIKBRTMutableOrderIndexSet *)v45 lowestIndex]];
      while ([(_UIKBRTMutableOrderIndexSet *)v45 count] > 4);
    }
    double v56 = -[_UIKBRTMutableOrderIndexSet initWithIndexesInRange:]([_UIKBRTMutableOrderIndexSet alloc], "initWithIndexesInRange:", 0, [v6 count]);
    v57 = [(_UIKBRTMutableOrderIndexSet *)v44 indexSet];
    [(_UIKBRTMutableOrderIndexSet *)v56 removeIndexes:v57];

    uint64_t v58 = [(_UIKBRTMutableOrderIndexSet *)v45 indexSet];
    [(_UIKBRTMutableOrderIndexSet *)v56 removeIndexes:v58];

    if (![(_UIKBRTMutableOrderIndexSet *)v56 count]) {
      goto LABEL_83;
    }
    if ([(_UIKBRTMutableOrderIndexSet *)v44 count] && [(_UIKBRTMutableOrderIndexSet *)v45 count])
    {
      unint64_t v59 = [(_UIKBRTMutableOrderIndexSet *)v44 count];
      if (v59 <= [(_UIKBRTMutableOrderIndexSet *)v45 count])
      {
        uint64_t v60 = [(_UIKBRTMutableOrderIndexSet *)v44 count];
        v61 = v44;
        v62 = v45;
        if (v60 == [(_UIKBRTMutableOrderIndexSet *)v45 count])
        {
LABEL_50:
          [*(id *)&y fCenter];
          double v64 = v63;
          double v65 = objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v61, "lowestIndex"));
          [v65 location];
          double v67 = v64 - v66;

          double v68 = objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v62, "highestIndex"));
          [v68 location];
          double v70 = v69;
          [*(id *)&y jCenter];
          double v72 = v70 - v71;

          char v73 = v67 > v72;
LABEL_55:
          int v74 = 0;
          for (int i = -1; i <= v74; ++i)
          {
            if (v73)
            {
              [(_UIKBRTMutableOrderIndexSet *)v44 setReversed:1];
              [(_UIKBRTMutableOrderIndexSet *)v56 setReversed:1];
              [(_UIKBRTMutableOrderIndexSet *)v45 setReversed:1];
              CGFloat v76 = y;
              v77 = v6;
              v78 = v44;
              double v79 = v45;
              double v80 = v56;
              CGFloat x = v30;
            }
            else
            {
              [(_UIKBRTMutableOrderIndexSet *)v44 setReversed:0];
              [(_UIKBRTMutableOrderIndexSet *)v56 setReversed:0];
              [(_UIKBRTMutableOrderIndexSet *)v45 setReversed:0];
              CGFloat v76 = y;
              v77 = v6;
              v78 = v45;
              double v79 = v44;
              double v80 = v56;
              CGFloat x = v235.origin.x;
            }
            int v82 = [*(id *)&v76 _linkTouchesInArray:v77 withIndexes:v78 opposingHandIndexes:v79 unassignedIndexes:v80 thumb:*(void *)&x];
            if (![(_UIKBRTMutableOrderIndexSet *)v56 count]) {
              break;
            }
            if (v82) {
              int v74 = 1;
            }
            v73 ^= 1u;
          }
          [(_UIKBRTMutableOrderIndexSet *)v44 setReversed:0];
          [(_UIKBRTMutableOrderIndexSet *)v45 setReversed:0];
          [(_UIKBRTMutableOrderIndexSet *)v56 setReversed:0];
          if ([(_UIKBRTMutableOrderIndexSet *)v56 count] >= 2)
          {
            do
            {
              if ([(_UIKBRTMutableOrderIndexSet *)v44 count] >= 4
                && [(_UIKBRTMutableOrderIndexSet *)v45 count] > 3)
              {
                break;
              }
              if ([(_UIKBRTMutableOrderIndexSet *)v44 count] <= 3)
              {
                [(_UIKBRTMutableOrderIndexSet *)v44 addIndex:[(_UIKBRTMutableOrderIndexSet *)v56 lowestIndex]];
                [(_UIKBRTMutableOrderIndexSet *)v56 removeIndex:[(_UIKBRTMutableOrderIndexSet *)v56 lowestIndex]];
              }
              if ([(_UIKBRTMutableOrderIndexSet *)v45 count] <= 3)
              {
                [(_UIKBRTMutableOrderIndexSet *)v45 addIndex:[(_UIKBRTMutableOrderIndexSet *)v56 highestIndex]];
                [(_UIKBRTMutableOrderIndexSet *)v56 removeIndex:[(_UIKBRTMutableOrderIndexSet *)v56 highestIndex]];
              }
            }
            while ([(_UIKBRTMutableOrderIndexSet *)v56 count] > 1);
          }
          if ([(_UIKBRTMutableOrderIndexSet *)v56 count]
            && ([(_UIKBRTMutableOrderIndexSet *)v44 count] < 4
             || [(_UIKBRTMutableOrderIndexSet *)v45 count] <= 3))
          {
            unint64_t v83 = [(_UIKBRTMutableOrderIndexSet *)v44 count];
            if (v83 > [(_UIKBRTMutableOrderIndexSet *)v45 count]
              && [(_UIKBRTMutableOrderIndexSet *)v44 count] < 4
              || [(_UIKBRTMutableOrderIndexSet *)v45 count] == 4)
            {
              goto LABEL_77;
            }
            unint64_t v85 = [(_UIKBRTMutableOrderIndexSet *)v45 count];
            if (v85 > [(_UIKBRTMutableOrderIndexSet *)v44 count]
              && [(_UIKBRTMutableOrderIndexSet *)v45 count] < 4
              || [(_UIKBRTMutableOrderIndexSet *)v44 count] == 4)
            {
              goto LABEL_81;
            }
            if ([(_UIKBRTMutableOrderIndexSet *)v44 count]
              && [(_UIKBRTMutableOrderIndexSet *)v45 count])
            {
              v204 = objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v56, "lowestIndex"));
              [v204 location];
              double v206 = v205;
              v207 = objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v44, "highestIndex"));
              [v207 location];
              double v209 = v206 - v208;

              v210 = objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v45, "lowestIndex"));
              [v210 location];
              double v212 = v211;
              v213 = objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v56, "highestIndex"));
              [v213 location];
              double v215 = v212 - v214;

              if (v209 > v215)
              {
LABEL_77:
                [(_UIKBRTMutableOrderIndexSet *)v44 addIndex:[(_UIKBRTMutableOrderIndexSet *)v56 lowestIndex]];
                uint64_t v84 = [(_UIKBRTMutableOrderIndexSet *)v56 lowestIndex];
LABEL_82:
                [(_UIKBRTMutableOrderIndexSet *)v56 removeIndex:v84];
                goto LABEL_83;
              }
              if (v209 >= v215) {
                goto LABEL_83;
              }
LABEL_81:
              [(_UIKBRTMutableOrderIndexSet *)v45 addIndex:[(_UIKBRTMutableOrderIndexSet *)v56 highestIndex]];
              uint64_t v84 = [(_UIKBRTMutableOrderIndexSet *)v56 highestIndex];
              goto LABEL_82;
            }
          }
LABEL_83:
          id v86 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          for (uint64_t j = 0; j != 13; ++j)
          {
            id v88 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            double v89 = [NSNumber numberWithUnsignedInteger:j];
            [v86 setObject:v88 forKey:v89];
          }
          double v90 = [v86 objectForKey:&unk_1ED3F5760];
          objc_msgSend(v90, "addIndexesInRange:", 0, objc_msgSend(v6, "count"));

          [(_UIKBRTMutableOrderIndexSet *)v44 setReversed:0];
          CGFloat y = v235.origin.y;
          [*(id *)&v235.origin.y _updateTouchInfoFromOutsideInWithArray:v6 indexes:v44 newIdentityDict:v86 fakeIndex:*(void *)(*(void *)&v235.origin.y + 128)];
          [(_UIKBRTMutableOrderIndexSet *)v45 setReversed:1];
          [*(id *)&y _updateTouchInfoFromOutsideInWithArray:v6 indexes:v45 newIdentityDict:v86 fakeIndex:*(void *)(*(void *)&y + 136)];
          double v91 = [v86 objectForKey:&unk_1ED3F5658];
          uint64_t rect1_16 = [v91 count];

          double v92 = [v86 objectForKey:&unk_1ED3F56E8];
          uint64_t v93 = [v92 count];

          if (rect1_24 == 6)
          {
            double v30 = v234;
            CGFloat v29 = v235.origin.x;
            if ([(_UIKBRTMutableOrderIndexSet *)v44 count] >= 3)
            {
              [v86 removeObjectForKey:&unk_1ED3F5658];
              [v86 removeObjectForKey:&unk_1ED3F5670];
              [v86 removeObjectForKey:&unk_1ED3F5688];
              [v86 removeObjectForKey:&unk_1ED3F56A0];
              double v94 = &unk_1ED3F5640;
              goto LABEL_91;
            }
LABEL_126:
            v241[0] = MEMORY[0x1E4F143A8];
            v241[1] = 3221225472;
            v241[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_11;
            v241[3] = &unk_1E52FE548;
            id v242 = v6;
            [v86 enumerateKeysAndObjectsUsingBlock:v241];

            id v11 = v233;
            goto LABEL_127;
          }
          uint64_t rect1_8 = v93;
          double v30 = v234;
          CGFloat v29 = v235.origin.x;
          if (rect1_24 == 9)
          {
            if ([(_UIKBRTMutableOrderIndexSet *)v45 count] >= 3)
            {
              [v86 removeObjectForKey:&unk_1ED3F56E8];
              [v86 removeObjectForKey:&unk_1ED3F5700];
              [v86 removeObjectForKey:&unk_1ED3F5718];
              [v86 removeObjectForKey:&unk_1ED3F5730];
              double v94 = &unk_1ED3F56D0;
LABEL_91:
              [v86 removeObjectForKey:v94];
              goto LABEL_126;
            }
            goto LABEL_126;
          }
          if ([(_UIKBRTMutableOrderIndexSet *)v44 count] != 3 || rect1_16)
          {
            double v96 = *(void **)(*(void *)&v235.origin.y + 128);
            if (!v96)
            {
LABEL_102:
              if ([(_UIKBRTMutableOrderIndexSet *)v45 count] != 3 || rect1_8)
              {
                uint64_t v120 = *(void **)(*(void *)&v235.origin.y + 136);
                if (!v120) {
                  goto LABEL_112;
                }
                *(void *)(*(void *)&v235.origin.y + 136) = 0;
              }
              else
              {
                uint64_t v119 = [(_UIKBRTMutableOrderIndexSet *)v45 indexSet];
                uint64_t v120 = [v6 objectsAtIndexes:v119];

                rect1a = [v120 objectAtIndex:0];
                v224 = [v120 objectAtIndex:1];
                v221 = [v120 objectAtIndex:2];
                uint64_t v121 = *(void **)(*(void *)&v235.origin.y + 136);
                if (!v121)
                {
                  uint64_t v122 = objc_alloc_init(_UIKBRTFakeFingerInfo);
                  id v123 = *(void **)(*(void *)&v235.origin.y + 136);
                  *(void *)(*(void *)&v235.origin.y + 136) = v122;

                  [*(id *)(*(void *)&v235.origin.y + 136) setIdentity:9];
                  [*(id *)(*(void *)&v235.origin.y + 136) setUnknownSeen:1];
                  uint64_t v121 = *(void **)(*(void *)&v235.origin.y + 136);
                }
                if ([v121 unknownSeen])
                {
                  [rect1a radius];
                  double v125 = v124;
                  [v224 radius];
                  [*(id *)(*(void *)&v235.origin.y + 136) setRadius:(v125 + v126) * 0.5];
                  [rect1a location];
                  double v128 = v127;
                  [rect1a location];
                  double v130 = v129;
                  [v224 location];
                  double v132 = (v130 - v131) * 4.0;
                  [v224 location];
                  double v134 = v133;
                  [v221 location];
                  double v136 = v128 + (v132 + v134 - v135) / 5.0;
                  [v221 location];
                  double v138 = v137 * 4.0;
                  [v224 location];
                  double v140 = v138 + v139;
                  [rect1a location];
                  objc_msgSend(*(id *)(*(void *)&v235.origin.y + 136), "setLocation:", v136, (v140 + v141) / 6.0);
                }
              }
LABEL_112:
              v142 = *(void **)(*(void *)&v235.origin.y + 128);
              if (v142)
              {
                double v143 = *MEMORY[0x1E4F1DB28];
                double v144 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
                double v145 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
                double v146 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
                [v142 location];
                double v148 = v147;
                [*(id *)(*(void *)&v235.origin.y + 128) radius];
                double v150 = v148 - v149;
                [*(id *)(*(void *)&v235.origin.y + 128) location];
                double v152 = v151;
                [*(id *)(*(void *)&v235.origin.y + 128) radius];
                double v218 = v152 - v153;
                [*(id *)(*(void *)&v235.origin.y + 128) radius];
                double v155 = v154 + v154;
                [*(id *)(*(void *)&v235.origin.y + 128) radius];
                v156 = *(void **)(*(void *)&v235.origin.y + 136);
                double v158 = v157 + v157;
                double v219 = v146;
                double rect2 = v145;
                double v222 = v144;
                double v225 = v143;
                double rect1b = v143;
                CGFloat v29 = v235.origin.x;
                if (!v156) {
                  goto LABEL_118;
                }
              }
              else
              {
                v156 = *(void **)(*(void *)&v235.origin.y + 136);
                CGFloat v29 = v235.origin.x;
                if (!v156) {
                  goto LABEL_126;
                }
                double v144 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
                double v145 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
                double v158 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
                double v150 = *MEMORY[0x1E4F1DB28];
                double rect1b = *MEMORY[0x1E4F1DB28];
                double v218 = v144;
                double v155 = v145;
                double v146 = v158;
              }
              double v159 = v158;
              [v156 location];
              double v161 = v160;
              [*(id *)(*(void *)&v235.origin.y + 136) radius];
              double v225 = v161 - v162;
              [*(id *)(*(void *)&v235.origin.y + 136) location];
              double v164 = v163;
              [*(id *)(*(void *)&v235.origin.y + 136) radius];
              double v222 = v164 - v165;
              [*(id *)(*(void *)&v235.origin.y + 136) radius];
              double rect2 = v166 + v166;
              [*(id *)(*(void *)&v235.origin.y + 136) radius];
              double v158 = v159;
              double v219 = v167 + v167;
LABEL_118:
              v235.origin.CGFloat x = rect1b;
              double v168 = v144;
              double v216 = v146;
              double v217 = v145;
              if (rect1_16)
              {
                double v169 = v158;
                v170 = [v86 objectForKey:&unk_1ED3F5658];
                v171 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v170, "firstIndex"));

                [v171 location];
                double v173 = v172;
                [v171 radius];
                v235.origin.CGFloat x = v173 - v174;
                [v171 location];
                double v176 = v175;
                [v171 radius];
                double v168 = v176 - v177;
                [v171 radius];
                double v217 = v178 + v178;
                [v171 radius];
                double v216 = v179 + v179;

                double v158 = v169;
              }
              CGFloat rect1_16a = v168;
              if (rect1_8)
              {
                double v180 = v158;
                v181 = [v86 objectForKey:&unk_1ED3F56E8];
                v182 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v181, "firstIndex"));

                [v182 location];
                double v184 = v183;
                [v182 radius];
                double rect1b = v184 - v185;
                [v182 location];
                double v187 = v186;
                [v182 radius];
                double v144 = v187 - v188;
                [v182 radius];
                double v145 = v189 + v189;
                [v182 radius];
                double v146 = v190 + v190;

                double v158 = v180;
              }
              double v191 = v150;
              v273.size.height = v219;
              double v192 = v218;
              double v193 = v155;
              CGFloat v194 = v158;
              v273.origin.CGFloat y = v222;
              v273.origin.CGFloat x = v225;
              v273.size.width = rect2;
              if (CGRectIntersectsRect(*(CGRect *)(&v158 - 3), v273)) {
                goto LABEL_124;
              }
              v271.origin.CGFloat x = v150;
              v271.origin.CGFloat y = v218;
              v271.size.width = v155;
              v271.size.height = v194;
              v274.origin.CGFloat x = rect1b;
              v274.origin.CGFloat y = v144;
              v274.size.width = v145;
              v274.size.height = v146;
              if (CGRectIntersectsRect(v271, v274))
              {
LABEL_124:
                v195 = *(void **)(*(void *)&v235.origin.y + 128);
                *(void *)(*(void *)&v235.origin.y + 128) = 0;
              }
              else
              {
                v272.origin.CGFloat x = v235.origin.x;
                v272.origin.CGFloat y = rect1_16a;
                v272.size.height = v216;
                v272.size.width = v217;
                v275.origin.CGFloat y = v222;
                v275.origin.CGFloat x = v225;
                v275.size.height = v219;
                v275.size.width = rect2;
                if (!CGRectIntersectsRect(v272, v275)) {
                  goto LABEL_126;
                }
                v195 = *(void **)(*(void *)&v235.origin.y + 136);
                *(void *)(*(void *)&v235.origin.y + 136) = 0;
              }

              goto LABEL_126;
            }
            *(void *)(*(void *)&v235.origin.y + 128) = 0;
          }
          else
          {
            double v95 = [(_UIKBRTMutableOrderIndexSet *)v44 indexSet];
            double v96 = [v6 objectsAtIndexes:v95];

            double v97 = [v96 objectAtIndex:0];
            rect1 = [v96 objectAtIndex:1];
            v223 = [v96 objectAtIndex:2];
            double v98 = *(void **)(*(void *)&v235.origin.y + 128);
            if (!v98)
            {
              double v99 = objc_alloc_init(_UIKBRTFakeFingerInfo);
              double v100 = *(void **)(*(void *)&v235.origin.y + 128);
              *(void *)(*(void *)&v235.origin.y + 128) = v99;

              [*(id *)(*(void *)&v235.origin.y + 128) setIdentity:6];
              [*(id *)(*(void *)&v235.origin.y + 128) setUnknownSeen:1];
              double v98 = *(void **)(*(void *)&v235.origin.y + 128);
            }
            if ([v98 unknownSeen])
            {
              [rect1 radius];
              double v102 = v101;
              [v223 radius];
              [*(id *)(*(void *)&v235.origin.y + 128) setRadius:(v102 + v103) * 0.5];
              [v223 location];
              double v105 = v104;
              [v223 location];
              double v107 = v106;
              [rect1 location];
              double v109 = (v107 - v108) * 4.0;
              [rect1 location];
              double v111 = v110;
              [v97 location];
              double v113 = v105 + (v109 + v111 - v112) / 5.0;
              [v97 location];
              double v115 = v114 * 4.0;
              [rect1 location];
              double v117 = v115 + v116;
              [v223 location];
              objc_msgSend(*(id *)(*(void *)&v235.origin.y + 128), "setLocation:", v113, (v117 + v118) / 6.0);
            }
          }
          goto LABEL_102;
        }
LABEL_54:
        char v73 = 0;
        goto LABEL_55;
      }
    }
    else if (![(_UIKBRTMutableOrderIndexSet *)v44 count])
    {
      v61 = v56;
      v62 = v56;
      if (![(_UIKBRTMutableOrderIndexSet *)v45 count]) {
        goto LABEL_50;
      }
      goto LABEL_54;
    }
    char v73 = 1;
    goto LABEL_55;
  }
  [(_UIKBRTFingerDetection *)self _updateFingerFeedback];
}

- (void)_updateFingerFeedback
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v3 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1) {
    goto LABEL_4;
  }
  int v15 = _UIInternalPreference__UIKBRT_FingerDetectionFeedback;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference__UIKBRT_FingerDetectionFeedback) {
    goto LABEL_4;
  }
  while (v3 >= v15)
  {
    _UIInternalPreferenceSync(v3, &_UIInternalPreference__UIKBRT_FingerDetectionFeedback, @"_UIKBRT_FingerDetectionFeedback", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    int v15 = _UIInternalPreference__UIKBRT_FingerDetectionFeedback;
    if (v3 == _UIInternalPreference__UIKBRT_FingerDetectionFeedback) {
      goto LABEL_4;
    }
  }
  if (!byte_1E8FD531C)
  {
LABEL_4:
    if (self->_feedbackView)
    {
      id v4 = [(NSMapTable *)self->_fingerFeedbackViewMap objectForKey:self->_fakeLeftIndex];
      [(NSMapTable *)self->_fingerFeedbackViewMap removeObjectForKey:self->_fakeLeftIndex];
      [v4 removeFromSuperview];
      BOOL v5 = [(NSMapTable *)self->_fingerFeedbackViewMap objectForKey:self->_fakeRightIndex];

      [(NSMapTable *)self->_fingerFeedbackViewMap removeObjectForKey:self->_fakeRightIndex];
      [v5 removeFromSuperview];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v6 = [(NSMutableDictionary *)self->_touches allValues];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          uint64_t v10 = 0;
          id v11 = v5;
          do
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
            BOOL v5 = [(NSMapTable *)self->_fingerFeedbackViewMap objectForKey:v12];

            [(NSMapTable *)self->_fingerFeedbackViewMap removeObjectForKey:v12];
            [v5 removeFromSuperview];
            ++v10;
            id v11 = v5;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v8);
      }

      [(UIView *)self->_feedbackView removeFromSuperview];
      feedbackView = self->_feedbackView;
      self->_feedbackView = 0;

      fingerFeedbackViewMap = self->_fingerFeedbackViewMap;
      self->_fingerFeedbackViewMap = 0;
    }
  }
  else
  {
    if (!self->_feedbackView)
    {
      double v16 = [_UIKBRTFingerDetectionView alloc];
      double v17 = -[_UIKBRTFingerDetectionView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v18 = self->_feedbackView;
      self->_feedbackView = v17;

      [(UIView *)self->_feedbackParentView addSubview:self->_feedbackView];
      double v19 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:5 capacity:0];
      double v20 = self->_fingerFeedbackViewMap;
      self->_fingerFeedbackViewMap = v19;
    }
    [(UIView *)self->_feedbackParentView bounds];
    -[UIView setFrame:](self->_feedbackView, "setFrame:");
    [(UIView *)self->_feedbackParentView bringSubviewToFront:self->_feedbackView];
    uint64_t v21 = [(NSMutableDictionary *)self->_touches allValues];
    id v22 = (id)[v21 mutableCopy];

    if (self->_fakeLeftIndex) {
      objc_msgSend(v22, "addObject:");
    }
    if (self->_fakeRightIndex) {
      objc_msgSend(v22, "addObject:");
    }
    [(_UIKBRTFingerDetection *)self _updateFingerFeedback:v22];
  }
}

- (void)_updateFingerFeedback:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(UIView *)self->_feedbackView subviews];
  id v6 = (void *)[v5 mutableCopy];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        double v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v17 = [(NSMapTable *)self->_fingerFeedbackViewMap objectForKey:v16];
        if (v17)
        {
          double v18 = (_UIKBRTFingerDetectionFingerFeedbackView *)v17;
          [v6 removeObject:v17];
        }
        else
        {
          double v18 = -[_UIKBRTFingerDetectionFingerFeedbackView initWithFrame:]([_UIKBRTFingerDetectionFingerFeedbackView alloc], "initWithFrame:", v11, v12, v13, v14);
          [(UIView *)self->_feedbackView addSubview:v18];
          [(NSMapTable *)self->_fingerFeedbackViewMap setObject:v18 forKey:v16];
        }
        -[_UIKBRTFingerDetectionFingerFeedbackView setUnknownSeen:](v18, "setUnknownSeen:", [v16 unknownSeen]);
        [v16 feedbackAlpha];
        -[UIView setAlpha:](v18, "setAlpha:");
        [v16 location];
        double v20 = v19;
        double v22 = v21;
        [v16 radius];
        -[_UIKBRTFingerDetectionFingerFeedbackView centerOn:withRadius:andIdentifier:](v18, "centerOn:withRadius:andIdentifier:", [v16 identity], v20, v22, v23);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = v6;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * j) removeFromSuperview];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v26);
  }
}

- (UIView)feedbackParentView
{
  return self->_feedbackParentView;
}

- (void)setFeedbackParentView:(id)a3
{
  self->_feedbackParentView = (UIView *)a3;
}

- (_UIKBRTFingerDetectionView)feedbackView
{
  return self->_feedbackView;
}

- (void)setFeedbackView:(id)a3
{
}

- (NSMapTable)fingerFeedbackViewMap
{
  return self->_fingerFeedbackViewMap;
}

- (void)setFingerFeedbackViewMap:(id)a3
{
}

- (NSMutableDictionary)touches
{
  return self->_touches;
}

- (void)setTouches:(id)a3
{
}

- (_UIKBRTFingerInfo)fakeLeftIndex
{
  return self->_fakeLeftIndex;
}

- (void)setFakeLeftIndex:(id)a3
{
}

- (_UIKBRTFingerInfo)fakeRightIndex
{
  return self->_fakeRightIndex;
}

- (void)setFakeRightIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeRightIndex, 0);
  objc_storeStrong((id *)&self->_fakeLeftIndex, 0);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_fingerFeedbackViewMap, 0);
  objc_storeStrong((id *)&self->_feedbackView, 0);
}

@end