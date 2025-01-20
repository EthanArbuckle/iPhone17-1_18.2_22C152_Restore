@interface _TUIHBoxDynamicArrayLayout
- (_TUIHBoxDynamicArrayLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (_TUIHBoxItemLayoutSummary)summaryForRange:(_NSRange)a3;
- (id).cxx_construct;
- (void)_updateIndex:(unint64_t)a3 width:(double)a4 height:(double)a5 heightAbovePivot:(double)a6;
- (void)enumerateChildren:(id)a3;
- (void)layoutDeleteAtIndex:(unint64_t)a3;
- (void)layoutInsertAtIndex:(unint64_t)a3;
- (void)layoutMoveFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)layoutUpdateWindowRange:(_NSRange)a3;
- (void)updateSummariesFromChildren;
@end

@implementation _TUIHBoxDynamicArrayLayout

- (_TUIHBoxDynamicArrayLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_TUIHBoxDynamicArrayLayout;
  id v11 = [(TUILayoutContainer *)&v24 initWithModel:v8 parent:v9 controller:v10];
  if (v11)
  {
    [v8 estimatedWidth];
    v23[0] = v12;
    [v8 estimatedHeight];
    v23[1] = v13;
    [v8 estimatedHeightAbovePivot];
    v23[2] = v14;
    for (i = (char *)[v8 windowCount]; i; --i)
      sub_16D2F4((uint64_t)v11 + 48, *((char **)v11 + 7), (unint64_t)v23);
    v16 = [(TUILayout *)[_TUIHBoxDynamicSpacerLayout alloc] initWithModel:0 parent:v11 controller:v10];
    v17 = (void *)*((void *)v11 + 11);
    *((void *)v11 + 11) = v16;

    v18 = [(TUILayout *)[_TUIHBoxDynamicSpacerLayout alloc] initWithModel:0 parent:v11 controller:v10];
    v19 = (void *)*((void *)v11 + 12);
    *((void *)v11 + 12) = v18;

    id v20 = [v8 windowRange];
    [v11 layoutUpdateWindowRange:v20, v21];
  }

  return (_TUIHBoxDynamicArrayLayout *)v11;
}

- (void)enumerateChildren:(id)a3
{
  v4 = (void (**)(id, _TUIHBoxDynamicSpacerLayout *))a3;
  v4[2](v4, self->_preRangeSpacer);
  v5.receiver = self;
  v5.super_class = (Class)_TUIHBoxDynamicArrayLayout;
  [(TUILayoutContainer *)&v5 enumerateChildren:v4];
  v4[2](v4, self->_postRangeSpacer);
}

- (void)_updateIndex:(unint64_t)a3 width:(double)a4 height:(double)a5 heightAbovePivot:(double)a6
{
  v6 = &self->_summaries.__begin_[a3];
  v6->width = a4;
  v6->height = a5;
  v6->heightAbovePivot = a6;
}

- (void)layoutUpdateWindowRange:(_NSRange)a3
{
  self->_windowRange = a3;
  -[_TUIHBoxDynamicSpacerLayout setRange:](self->_preRangeSpacer, "setRange:", 0, a3.location);
  postRangeSpacer = self->_postRangeSpacer;

  -[_TUIHBoxDynamicSpacerLayout setRange:](postRangeSpacer, "setRange:");
}

- (void)layoutDeleteAtIndex:(unint64_t)a3
{
  p_summaries = &self->_summaries;
  end = self->_summaries.__end_;
  objc_super v5 = &self->_summaries.__begin_[a3];
  int64_t v6 = (char *)end - (char *)&v5[1];
  if (end != &v5[1]) {
    memmove(&self->_summaries.__begin_[a3], &v5[1], (char *)end - (char *)&v5[1]);
  }
  p_summaries->__end_ = (_TUIHBoxItemLayoutSummary *)((char *)v5 + v6);
}

- (void)layoutInsertAtIndex:(unint64_t)a3
{
  objc_super v5 = [(TUILayoutContainer *)self model];
  [v5 estimatedWidth];
  v11[0] = v6;

  v7 = [(TUILayoutContainer *)self model];
  [v7 estimatedHeight];
  v11[1] = v8;

  id v9 = [(TUILayoutContainer *)self model];
  [v9 estimatedHeightAbovePivot];
  v11[2] = v10;

  sub_16D2F4((uint64_t)&self->_summaries, (char *)&self->_summaries.__begin_[a3], (unint64_t)v11);
}

- (void)layoutMoveFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  p_summaries = &self->_summaries;
  begin = self->_summaries.__begin_;
  end = self->_summaries.__end_;
  uint64_t v8 = &begin[a3];
  long long v9 = *(_OWORD *)&v8->width;
  double heightAbovePivot = v8->heightAbovePivot;
  long long v11 = v9;
  uint64_t v10 = (char *)((char *)end - (char *)&v8[1]);
  if (end != &v8[1])
  {
    memmove(&begin[a3], &v8[1], (char *)end - (char *)&v8[1]);
    begin = p_summaries->__begin_;
  }
  p_summaries->__end_ = (_TUIHBoxItemLayoutSummary *)&v10[(void)v8];
  sub_16D2F4((uint64_t)p_summaries, (char *)&begin[a4], (unint64_t)&v11);
}

- (void)updateSummariesFromChildren
{
  begin = self->_summaries.__begin_;
  NSUInteger location = self->_windowRange.location;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(TUILayoutContainer *)self containers];
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    p_width = (void *)&begin[location].width;
    uint64_t v6 = *(void *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v7);
        uint64_t v19 = 0;
        id v20 = &v19;
        uint64_t v21 = 0x2020000000;
        uint64_t v22 = 0;
        uint64_t v15 = 0;
        v16 = &v15;
        uint64_t v17 = 0x2020000000;
        uint64_t v18 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = &v11;
        uint64_t v13 = 0x2020000000;
        uint64_t v14 = 0;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_16DB08;
        v10[3] = &unk_257020;
        v10[4] = &v19;
        v10[5] = &v15;
        v10[6] = &v11;
        [v8 enumerateChildren:v10];
        void *p_width = v20[3];
        p_width[1] = v16[3];
        p_width[2] = v12[3];
        p_width += 3;
        _Block_object_dispose(&v11, 8);
        _Block_object_dispose(&v15, 8);
        _Block_object_dispose(&v19, 8);
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }
}

- (_TUIHBoxItemLayoutSummary)summaryForRange:(_NSRange)a3
{
  if (a3.length)
  {
    v3 = &self->_summaries.__begin_[a3.location];
    id v4 = &v3[a3.length];
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    do
    {
      double v5 = v5 + v3->width;
      double v6 = fmax(v6, v3->height);
      double v7 = fmax(v7, v3->heightAbovePivot);
      ++v3;
    }
    while (v3 != v4);
  }
  else
  {
    double v7 = 0.0;
    double v6 = 0.0;
    double v5 = 0.0;
  }
  result.double heightAbovePivot = v7;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postRangeSpacer, 0);
  objc_storeStrong((id *)&self->_preRangeSpacer, 0);
  begin = self->_summaries.__begin_;
  if (begin)
  {
    self->_summaries.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end