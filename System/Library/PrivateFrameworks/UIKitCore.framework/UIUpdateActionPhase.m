@interface UIUpdateActionPhase
+ (UIUpdateActionPhase)afterCADisplayLinkDispatch;
+ (UIUpdateActionPhase)afterCATransactionCommit;
+ (UIUpdateActionPhase)afterEventDispatch;
+ (UIUpdateActionPhase)afterLowLatencyCATransactionCommit;
+ (UIUpdateActionPhase)afterLowLatencyEventDispatch;
+ (UIUpdateActionPhase)afterUpdateComplete;
+ (UIUpdateActionPhase)afterUpdateScheduled;
+ (UIUpdateActionPhase)beforeCADisplayLinkDispatch;
+ (UIUpdateActionPhase)beforeCATransactionCommit;
+ (UIUpdateActionPhase)beforeEventDispatch;
+ (UIUpdateActionPhase)beforeLowLatencyCATransactionCommit;
+ (UIUpdateActionPhase)beforeLowLatencyEventDispatch;
@end

@implementation UIUpdateActionPhase

+ (UIUpdateActionPhase)afterUpdateScheduled
{
  if (_MergedGlobals_1261 != -1) {
    dispatch_once(&_MergedGlobals_1261, &__block_literal_global_549);
  }
  v2 = (void *)qword_1EB2646D8;
  return (UIUpdateActionPhase *)v2;
}

void __43__UIUpdateActionPhase_afterUpdateScheduled__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceScheduledItemInternal;
    }
  }
  v1 = (void *)qword_1EB2646D8;
  qword_1EB2646D8 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)beforeEventDispatch
{
  if (qword_1EB2646E0 != -1) {
    dispatch_once(&qword_1EB2646E0, &__block_literal_global_2_18);
  }
  objc_super v2 = (void *)qword_1EB2646E8;
  return (UIUpdateActionPhase *)v2;
}

void __42__UIUpdateActionPhase_beforeEventDispatch__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceBeginItemInternal;
    }
  }
  v1 = (void *)qword_1EB2646E8;
  qword_1EB2646E8 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)afterEventDispatch
{
  if (qword_1EB2646F0 != -1) {
    dispatch_once(&qword_1EB2646F0, &__block_literal_global_4_19);
  }
  objc_super v2 = (void *)qword_1EB2646F8;
  return (UIUpdateActionPhase *)v2;
}

void __41__UIUpdateActionPhase_afterEventDispatch__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceBeginItemInternal;
    }
  }
  v1 = (void *)qword_1EB2646F8;
  qword_1EB2646F8 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)beforeCADisplayLinkDispatch
{
  if (qword_1EB264700 != -1) {
    dispatch_once(&qword_1EB264700, &__block_literal_global_6_18);
  }
  objc_super v2 = (void *)qword_1EB264708;
  return (UIUpdateActionPhase *)v2;
}

void __50__UIUpdateActionPhase_beforeCADisplayLinkDispatch__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceCADisplayLinksItemInternal;
    }
  }
  v1 = (void *)qword_1EB264708;
  qword_1EB264708 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)afterCADisplayLinkDispatch
{
  if (qword_1EB264710 != -1) {
    dispatch_once(&qword_1EB264710, &__block_literal_global_8_13);
  }
  objc_super v2 = (void *)qword_1EB264718;
  return (UIUpdateActionPhase *)v2;
}

void __49__UIUpdateActionPhase_afterCADisplayLinkDispatch__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceCADisplayLinksItemInternal;
    }
  }
  v1 = (void *)qword_1EB264718;
  qword_1EB264718 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)beforeCATransactionCommit
{
  if (qword_1EB264720 != -1) {
    dispatch_once(&qword_1EB264720, &__block_literal_global_10_10);
  }
  objc_super v2 = (void *)qword_1EB264728;
  return (UIUpdateActionPhase *)v2;
}

void __48__UIUpdateActionPhase_beforeCATransactionCommit__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceCATransactionCommitItemInternal;
    }
  }
  v1 = (void *)qword_1EB264728;
  qword_1EB264728 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)afterCATransactionCommit
{
  if (qword_1EB264730 != -1) {
    dispatch_once(&qword_1EB264730, &__block_literal_global_12_8);
  }
  objc_super v2 = (void *)qword_1EB264738;
  return (UIUpdateActionPhase *)v2;
}

void __47__UIUpdateActionPhase_afterCATransactionCommit__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceCATransactionCommitItemInternal;
    }
  }
  v1 = (void *)qword_1EB264738;
  qword_1EB264738 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)beforeLowLatencyEventDispatch
{
  if (qword_1EB264740 != -1) {
    dispatch_once(&qword_1EB264740, &__block_literal_global_14_7);
  }
  objc_super v2 = (void *)qword_1EB264748;
  return (UIUpdateActionPhase *)v2;
}

void __52__UIUpdateActionPhase_beforeLowLatencyEventDispatch__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceLowLatencyHIDEventsItemInternal;
    }
  }
  v1 = (void *)qword_1EB264748;
  qword_1EB264748 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)afterLowLatencyEventDispatch
{
  if (qword_1EB264750 != -1) {
    dispatch_once(&qword_1EB264750, &__block_literal_global_16_5);
  }
  objc_super v2 = (void *)qword_1EB264758;
  return (UIUpdateActionPhase *)v2;
}

void __51__UIUpdateActionPhase_afterLowLatencyEventDispatch__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceLowLatencyHIDEventsItemInternal;
    }
  }
  v1 = (void *)qword_1EB264758;
  qword_1EB264758 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)beforeLowLatencyCATransactionCommit
{
  if (qword_1EB264760 != -1) {
    dispatch_once(&qword_1EB264760, &__block_literal_global_18_4);
  }
  objc_super v2 = (void *)qword_1EB264768;
  return (UIUpdateActionPhase *)v2;
}

void __58__UIUpdateActionPhase_beforeLowLatencyCATransactionCommit__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceLowLatencyCATransactionCommitItemInternal;
    }
  }
  v1 = (void *)qword_1EB264768;
  qword_1EB264768 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)afterLowLatencyCATransactionCommit
{
  if (qword_1EB264770 != -1) {
    dispatch_once(&qword_1EB264770, &__block_literal_global_20_6);
  }
  objc_super v2 = (void *)qword_1EB264778;
  return (UIUpdateActionPhase *)v2;
}

void __57__UIUpdateActionPhase_afterLowLatencyCATransactionCommit__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceLowLatencyCATransactionCommitItemInternal;
    }
  }
  v1 = (void *)qword_1EB264778;
  qword_1EB264778 = (uint64_t)v0;
}

+ (UIUpdateActionPhase)afterUpdateComplete
{
  if (qword_1EB264780 != -1) {
    dispatch_once(&qword_1EB264780, &__block_literal_global_22_2);
  }
  objc_super v2 = (void *)qword_1EB264788;
  return (UIUpdateActionPhase *)v2;
}

void __42__UIUpdateActionPhase_afterUpdateComplete__block_invoke()
{
  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceDoneItemInternal;
    }
  }
  v1 = (void *)qword_1EB264788;
  qword_1EB264788 = (uint64_t)v0;
}

@end