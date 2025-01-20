@interface _TUIVBoxDynamicArrayLayout
- (_TUIVBoxDynamicArrayLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (_TUIVBoxItemLayoutSummary)summaryForRange:(_NSRange)a3;
- (id).cxx_construct;
- (void)_updateIndex:(unint64_t)a3 width:(double)a4 height:(double)a5;
- (void)enumerateChildren:(id)a3;
- (void)layoutDeleteAtIndex:(unint64_t)a3;
- (void)layoutInsertAtIndex:(unint64_t)a3;
- (void)layoutMoveFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)layoutUpdateWindowRange:(_NSRange)a3;
- (void)updateSummariesFromChildren;
@end

@implementation _TUIVBoxDynamicArrayLayout

- (_TUIVBoxDynamicArrayLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_TUIVBoxDynamicArrayLayout;
  id v11 = [(TUILayoutContainer *)&v23 initWithModel:v8 parent:v9 controller:v10];
  if (v11)
  {
    [v8 estimatedWidth];
    [v8 estimatedHeight];
    v22[1] = v13;
    for (i = (char *)[v8 windowCount]; i; --i)
      sub_579B8((uint64_t)v11 + 48, *((char **)v11 + 7), (char *)v22);
    v15 = [(TUILayout *)[_TUIVBoxDynamicSpacerLayout alloc] initWithModel:0 parent:v11 controller:v10];
    v16 = (void *)*((void *)v11 + 11);
    *((void *)v11 + 11) = v15;

    v17 = [(TUILayout *)[_TUIVBoxDynamicSpacerLayout alloc] initWithModel:0 parent:v11 controller:v10];
    v18 = (void *)*((void *)v11 + 12);
    *((void *)v11 + 12) = v17;

    id v19 = [v8 windowRange];
    [v11 layoutUpdateWindowRange:v19, v20];
  }

  return (_TUIVBoxDynamicArrayLayout *)v11;
}

- (void)enumerateChildren:(id)a3
{
  v4 = (void (**)(id, _TUIVBoxDynamicSpacerLayout *))a3;
  v4[2](v4, self->_preRangeSpacer);
  v5.receiver = self;
  v5.super_class = (Class)_TUIVBoxDynamicArrayLayout;
  [(TUILayoutContainer *)&v5 enumerateChildren:v4];
  v4[2](v4, self->_postRangeSpacer);
}

- (void)_updateIndex:(unint64_t)a3 width:(double)a4 height:(double)a5
{
  objc_super v5 = &self->_summaries.__begin_[a3];
  v5->width = a4;
  v5->height = a5;
}

- (void)layoutUpdateWindowRange:(_NSRange)a3
{
  self->_windowRange = a3;
  -[_TUIVBoxDynamicSpacerLayout setRange:](self->_preRangeSpacer, "setRange:", 0, a3.location);
  postRangeSpacer = self->_postRangeSpacer;

  -[_TUIVBoxDynamicSpacerLayout setRange:](postRangeSpacer, "setRange:");
}

- (void)layoutDeleteAtIndex:(unint64_t)a3
{
  p_summaries = &self->_summaries;
  begin = self->_summaries.__begin_;
  end = self->_summaries.__end_;
  v6 = &begin[a3];
  v7 = (char *)((char *)end - (char *)&v6[1]);
  if (end != &v6[1]) {
    memmove(&begin[a3], &v6[1], (char *)end - (char *)&v6[1]);
  }
  p_summaries->__end_ = (_TUIVBoxItemLayoutSummary *)&v7[(void)v6];
}

- (void)layoutInsertAtIndex:(unint64_t)a3
{
  objc_super v5 = [(TUILayoutContainer *)self model];
  [v5 estimatedWidth];
  v9[0] = v6;

  v7 = [(TUILayoutContainer *)self model];
  [v7 estimatedHeight];
  v9[1] = v8;

  sub_579B8((uint64_t)&self->_summaries, (char *)&self->_summaries.__begin_[a3], (char *)v9);
}

- (void)layoutMoveFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  p_summaries = &self->_summaries;
  begin = self->_summaries.__begin_;
  end = self->_summaries.__end_;
  p_width = (_OWORD *)&begin[a3].width;
  long long v10 = *p_width;
  int64_t v9 = (char *)end - (char *)(p_width + 1);
  if (end != (_TUIVBoxItemLayoutSummary *)(p_width + 1))
  {
    memmove(&begin[a3], p_width + 1, (char *)end - (char *)(p_width + 1));
    begin = p_summaries->__begin_;
  }
  p_summaries->__end_ = (_TUIVBoxItemLayoutSummary *)((char *)p_width + v9);
  sub_579B8((uint64_t)p_summaries, (char *)&begin[a4], (char *)&v10);
}

- (void)updateSummariesFromChildren
{
  begin = self->_summaries.__begin_;
  NSUInteger location = self->_windowRange.location;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(TUILayoutContainer *)self containers];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    p_width = (void *)&begin[location].width;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v8);
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
        v10[2] = sub_580BC;
        v10[3] = &unk_253038;
        v10[4] = &v15;
        v10[5] = &v11;
        [v9 enumerateChildren:v10];
        void *p_width = v16[3];
        p_width[1] = v12[3];
        p_width += 2;
        _Block_object_dispose(&v11, 8);
        _Block_object_dispose(&v15, 8);
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

- (_TUIVBoxItemLayoutSummary)summaryForRange:(_NSRange)a3
{
  if (a3.length)
  {
    p_height = &self->_summaries.__begin_[a3.location].height;
    NSUInteger v4 = 16 * a3.length;
    double v5 = 0.0;
    double v6 = 0.0;
    do
    {
      double v6 = v6 + *p_height;
      double v5 = fmax(v5, *(p_height - 1));
      p_height += 2;
      v4 -= 16;
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
    double v5 = 0.0;
  }
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