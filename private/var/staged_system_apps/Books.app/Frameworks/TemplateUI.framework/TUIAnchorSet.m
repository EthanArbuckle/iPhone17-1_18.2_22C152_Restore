@interface TUIAnchorSet
- (CGPoint)proposeAnchorOffsetWithScrollView:(id)a3 velocity:(CGPoint)a4 target:(CGPoint)a5;
- (NSSet)currentTriggers;
- (TUIAnchorSet)initWithAnchorSet:(id)a3;
- (TUIAnchorSet)initWithAxis:(unint64_t)a3;
- (double)offset;
- (double)offsetForTriggerWithName:(id)a3 inScrollView:(id)a4;
- (id).cxx_construct;
- (id)computeTriggerStatesInScrollView:(id)a3 axis:(unint64_t)a4;
- (id)feedNotVisibleTriggerStatesForAxis:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)plainHorizontalTriggerAnchors;
- (id)plainScrollAnchors;
- (id)plainVerticalTriggerAnchors;
- (id)scrollAnchorWithScrollView:(id)a3 offset:(CGPoint)a4;
- (unint64_t)axis;
- (void)appendTriggerAnchorsToSet:(id)a3 forAxis:(unint64_t)a4;
- (void)setAxis:(unint64_t)a3;
- (void)setCurrentTriggers:(id)a3;
- (void)setOffset:(double)a3;
@end

@implementation TUIAnchorSet

- (TUIAnchorSet)initWithAxis:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIAnchorSet;
  result = [(TUIAnchorSet *)&v5 init];
  if (result) {
    result->_axis = a3;
  }
  return result;
}

- (TUIAnchorSet)initWithAnchorSet:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIAnchorSet;
  id v5 = [(TUIAnchorSet *)&v8 init];
  v6 = (TUIAnchorSet *)v5;
  if (v5)
  {
    *((void *)v5 + 13) = 0;
    if (v4)
    {
      *((void *)v5 + 13) = *((void *)v4 + 13);
      if (v5 != v4)
      {
        sub_9702C((char *)v5 + 8, *((char **)v4 + 1), *((void *)v4 + 2), (uint64_t)(*((void *)v4 + 2) - *((void *)v4 + 1)) >> 3);
        sub_14186C(&v6->_logicalScrollAnchors.__begin_, *((void *)v4 + 10), *((void *)v4 + 11), (uint64_t)(*((void *)v4 + 11) - *((void *)v4 + 10)) >> 4);
        sub_14186C(&v6->_verticalTriggerAnchors.__begin_, *((void *)v4 + 4), *((void *)v4 + 5), (uint64_t)(*((void *)v4 + 5) - *((void *)v4 + 4)) >> 4);
        sub_14186C(&v6->_horizontalTriggerAnchors.__begin_, *((void *)v4 + 7), *((void *)v4 + 8), (uint64_t)(*((void *)v4 + 8) - *((void *)v4 + 7)) >> 4);
      }
    }
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [TUIMutableAnchorSet alloc];

  return [(TUIAnchorSet *)v4 initWithAnchorSet:self];
}

- (CGPoint)proposeAnchorOffsetWithScrollView:(id)a3 velocity:(CGPoint)a4 target:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a3;
  [v8 contentInset];
  double v12 = v11;
  double v14 = v13;
  double v62 = v10;
  double v63 = v9;
  double v15 = x + v9;
  double v16 = y + v10;
  if (self->_axis == 1) {
    double v17 = x + v9;
  }
  else {
    double v17 = y + v10;
  }
  [v8 contentSize];
  double v64 = v18;
  double v20 = v19;
  [v8 bounds];
  double v23 = v22;
  unint64_t axis = self->_axis;
  if (axis == 1)
  {
    double v25 = v21;
    v26 = (char *)[v8 effectiveUserInterfaceLayoutDirection];
    double v27 = v25 - (v63 + v62);
    unint64_t axis = self->_axis;
    BOOL v28 = axis == 1;
    BOOL v29 = v26 == (unsigned char *)&def_141F14 + 1;
    if (v26 == (unsigned char *)&def_141F14 + 1)
    {
      double v17 = v64 - v17;
    }
    else if (axis == 1)
    {
      double v30 = v64 - v27;
      if (v17 == 0.0 || v17 == v30) {
        goto LABEL_76;
      }
      BOOL v29 = 0;
      goto LABEL_28;
    }
    if (v26 == (unsigned char *)&def_141F14 + 1 && axis == 1)
    {
      if (v17 == v27 || v17 == v64) {
        goto LABEL_75;
      }
      BOOL v28 = 1;
      BOOL v29 = 1;
      goto LABEL_28;
    }
  }
  else
  {
    BOOL v29 = 0;
    BOOL v28 = 0;
  }
  if (axis == 2 && (v17 == 0.0 || v17 == v20 - (v23 - (v12 + v14)))) {
    goto LABEL_74;
  }
LABEL_28:
  begin = self->_scrollAnchors.__begin_;
  end = self->_scrollAnchors.__end_;
  unint64_t v36 = end - begin;
  if (!v36) {
    goto LABEL_74;
  }
  if (v36 == 1) {
    goto LABEL_30;
  }
  if (v28) {
    double v37 = v15;
  }
  else {
    double v37 = v16;
  }
  double v38 = a4.y;
  if (v28) {
    double v38 = a4.x;
  }
  if (v29) {
    double v39 = v64 - v37;
  }
  else {
    double v39 = v37;
  }
  if (v29) {
    double v40 = -v38;
  }
  else {
    double v40 = v38;
  }
  if (end != begin)
  {
    v41 = self->_scrollAnchors.__begin_;
    do
    {
      unint64_t v42 = v36 >> 1;
      v43 = &v41[v36 >> 1];
      double v45 = *v43;
      v44 = v43 + 1;
      double v46 = v45;
      v36 += ~(v36 >> 1);
      if (v45 < v39) {
        v41 = v44;
      }
      else {
        unint64_t v36 = v42;
      }
    }
    while (v36);
    if (v41 != end)
    {
      if (v41 == begin)
      {
LABEL_30:
        double v17 = *begin;
        if (!v29) {
          goto LABEL_76;
        }
LABEL_75:
        double v17 = v64 - v17;
        goto LABEL_76;
      }
      double v47 = *(v41 - 1);
      double v17 = *v41;
      if (v28)
      {
        [v8 contentSize:v46];
        double v49 = v48;
      }
      else
      {
        [v8 contentSize:v46];
        double v49 = v50;
      }
      if (self->_axis == 1)
      {
        [v8 contentOffset];
      }
      else
      {
        [v8 contentOffset];
        double v51 = v52;
      }
      if (v40 <= 0.0 && v51 + v40 * 1000.0 <= v49)
      {
        if (v40 >= 0.0 && (v17 > v49 ? (BOOL v53 = v39 == v49) : (BOOL v53 = 0), v53))
        {
          double v17 = v39;
        }
        else
        {
          if (v40 == 0.0)
          {
            if (v39 <= (v47 + v17) * 0.5) {
              double v17 = v47;
            }
            if (v29) {
              goto LABEL_75;
            }
            goto LABEL_76;
          }
          double v17 = v47;
        }
      }
LABEL_74:
      if (!v29) {
        goto LABEL_76;
      }
      goto LABEL_75;
    }
  }
  double v17 = *(end - 1);
  if (v29) {
    goto LABEL_75;
  }
LABEL_76:
  unint64_t v54 = self->_axis;
  if (v54 == 1) {
    double v55 = v17;
  }
  else {
    double v55 = v15;
  }
  if (v54 == 1) {
    double v56 = v16;
  }
  else {
    double v56 = v17;
  }
  double v57 = v55 - v63;
  double v58 = v56 - v62;

  double v59 = v57;
  double v60 = v58;
  result.double y = v60;
  result.double x = v59;
  return result;
}

- (id)scrollAnchorWithScrollView:(id)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = v7;
  if (self->_axis == 1) {
    double v9 = x;
  }
  else {
    double v9 = y;
  }
  [v7 contentSize];
  double v11 = v10;
  double v13 = v12;
  [v8 contentScaleFactor];
  double v15 = TUISizeRoundedForScale(v11, v13, v14);
  double v17 = v16;
  [v8 bounds];
  unint64_t axis = self->_axis;
  if (axis == 1)
  {
    double v17 = v15;
    double v21 = v18;
  }
  else
  {
    double v21 = v19;
  }
  if (axis == 1 && [v8 effectiveUserInterfaceLayoutDirection] == (char *)&def_141F14 + 1) {
    double v9 = v15 - v9;
  }
  begin = (id *)self->_logicalScrollAnchors.__begin_;
  if (begin == self->_logicalScrollAnchors.__end_) {
    goto LABEL_35;
  }
  double v23 = 0;
  double v24 = v21 + v9;
  double v25 = v9 + v21 * 0.5;
  double v36 = 0.0;
  double v26 = 1.79769313e308;
  while (1)
  {
    double v27 = (char *)[begin[1] position];
    if (v9 <= 0.0 && v27 == 0)
    {
      if (v9 <= *(double *)begin) {
        goto LABEL_32;
      }
      goto LABEL_27;
    }
    if (v24 >= v17 && v27 == (unsigned char *)&def_141F14 + 1) {
      break;
    }
    if (v27 == (unsigned char *)&def_141F14 + 2)
    {
      double v30 = *(double *)begin;
      double v31 = vabdd_f64(*(double *)begin, v25);
      if (v31 < v26)
      {
        id v32 = begin[1];

        if (v21 <= 0.0) {
          double v33 = 0.0;
        }
        else {
          double v33 = (v30 - v25 + v30 - v25) / v21;
        }
        double v36 = v33;
        goto LABEL_28;
      }
    }
LABEL_27:
    id v32 = v23;
    double v31 = v26;
LABEL_28:
    begin += 2;
    double v26 = v31;
    double v23 = v32;
    if (begin == self->_logicalScrollAnchors.__end_) {
      goto LABEL_33;
    }
  }
  if (v24 < *(double *)begin) {
    goto LABEL_27;
  }
LABEL_32:
  id v32 = begin[1];

  double v36 = 0.0;
LABEL_33:
  if (v32)
  {
    v34 = [[TUIScrollAnchor alloc] initWithAnchor:v32 relativeDistance:v36];

    goto LABEL_36;
  }
LABEL_35:
  v34 = 0;
LABEL_36:

  return v34;
}

- (id)feedNotVisibleTriggerStatesForAxis:(unint64_t)a3
{
  id v5 = objc_alloc_init(TUIMutableTriggerStateUpdate);
  uint64_t v6 = 32;
  if (a3 == 1) {
    uint64_t v6 = 56;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  sub_141B00(&v11, *(uint64_t *)((char *)&self->super.isa + v6), *(uint64_t *)((char *)&self->_scrollAnchors.__begin_ + v6), (*(char **)((char *)&self->_scrollAnchors.__begin_ + v6) - *(char **)((char *)&self->super.isa + v6)) >> 4);
  for (uint64_t i = v11; i != v12; i += 16)
  {
    id v8 = *(id *)(i + 8);
    [(TUIMutableTriggerStateUpdate *)v5 addUpdateForTrigger:v8 state:4];
  }
  double v9 = [[TUITriggerStateUpdate alloc] initWithTriggerStateUpdate:v5];
  double v14 = (void **)&v11;
  sub_141B78(&v14);

  return v9;
}

- (id)computeTriggerStatesInScrollView:(id)a3 axis:(unint64_t)a4
{
  id v6 = a3;
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  if ([v6 effectiveUserInterfaceLayoutDirection] == (char *)&def_141F14 + 1)
  {
    [v6 contentSize];
    double v16 = v15;
    v31.origin.double x = v8;
    v31.origin.double y = v10;
    v31.size.width = v12;
    v31.size.height = v14;
    double v8 = v16 - CGRectGetMinX(v31) - v12;
  }
  if (a4 == 1) {
    double v10 = v8;
  }
  else {
    double v12 = v14;
  }
  double v17 = objc_alloc_init(TUIMutableTriggerStateUpdate);
  uint64_t v18 = 32;
  if (a4 == 1) {
    uint64_t v18 = 56;
  }
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  sub_141B00(&v26, *(uint64_t *)((char *)&self->super.isa + v18), *(uint64_t *)((char *)&self->_scrollAnchors.__begin_ + v18), (*(char **)((char *)&self->_scrollAnchors.__begin_ + v18) - *(char **)((char *)&self->super.isa + v18)) >> 4);
  for (uint64_t i = v26; i != v27; i += 16)
  {
    double v20 = *(double *)i;
    id v21 = *(id *)(i + 8);
    if (v20 - v10 >= v12) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = 2;
    }
    if (v20 - v10 >= 0.0) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 3;
    }
    [(TUIMutableTriggerStateUpdate *)v17 addUpdateForTrigger:v21 state:v23];
  }
  double v24 = [[TUITriggerStateUpdate alloc] initWithTriggerStateUpdate:v17];
  BOOL v29 = (void **)&v26;
  sub_141B78(&v29);

  return v24;
}

- (double)offsetForTriggerWithName:(id)a3 inScrollView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  begin = (id *)self->_verticalTriggerAnchors.__begin_;
  end = (id *)self->_verticalTriggerAnchors.__end_;
  while (begin != end)
  {
    double v10 = *(double *)begin;
    id v11 = begin[1];
    double v12 = [v11 name];
    unsigned __int8 v13 = [v12 isEqualToString:v6];

    if (v13) {
      goto LABEL_6;
    }
    end = (id *)self->_verticalTriggerAnchors.__end_;
    begin += 2;
  }
  double v10 = NAN;
LABEL_6:

  return v10;
}

- (void)appendTriggerAnchorsToSet:(id)a3 forAxis:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = 32;
  if (a4 == 1) {
    uint64_t v7 = 56;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  sub_141B00(&v12, *(uint64_t *)((char *)&self->super.isa + v7), *(uint64_t *)((char *)&self->_scrollAnchors.__begin_ + v7), (*(char **)((char *)&self->_scrollAnchors.__begin_ + v7) - *(char **)((char *)&self->super.isa + v7)) >> 4);
  uint64_t v9 = v12;
  uint64_t v8 = v13;
  while (v9 != v8)
  {
    double v10 = *(double *)v9;
    id v11 = *(id *)(v9 + 8);
    [v6 appendTriggerAnchorWithOffset:v11 trigger:a4 axis:v10];

    uint64_t v8 = v13;
    v9 += 16;
  }
  double v15 = (void **)&v12;
  sub_141B78(&v15);
}

- (id)plainScrollAnchors
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  for (uint64_t i = self->_scrollAnchors.__begin_; i != self->_scrollAnchors.__end_; ++i)
  {
    id v5 = +[NSNumber numberWithDouble:*i];
    [v3 addObject:v5];
  }
  id v6 = [v3 copy];

  return v6;
}

- (id)plainVerticalTriggerAnchors
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  for (uint64_t i = (double *)self->_verticalTriggerAnchors.__begin_; i != self->_verticalTriggerAnchors.__end_; i += 2)
  {
    id v5 = +[NSNumber numberWithDouble:*i];
    [v3 addObject:v5];
  }
  id v6 = [v3 copy];

  return v6;
}

- (id)plainHorizontalTriggerAnchors
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  for (uint64_t i = (double *)self->_horizontalTriggerAnchors.__begin_; i != self->_horizontalTriggerAnchors.__end_; i += 2)
  {
    id v5 = +[NSNumber numberWithDouble:*i];
    [v3 addObject:v5];
  }
  id v6 = [v3 copy];

  return v6;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_unint64_t axis = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (NSSet)currentTriggers
{
  return self->_currentTriggers;
}

- (void)setCurrentTriggers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTriggers, 0);
  p_begin = &self->_logicalScrollAnchors.__begin_;
  sub_141B78(&p_begin);
  p_begin = &self->_horizontalTriggerAnchors.__begin_;
  sub_141B78(&p_begin);
  p_begin = &self->_verticalTriggerAnchors.__begin_;
  sub_141B78(&p_begin);
  begin = self->_scrollAnchors.__begin_;
  if (begin)
  {
    self->_scrollAnchors.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end