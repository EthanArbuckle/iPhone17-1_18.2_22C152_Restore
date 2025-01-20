@interface _UIScrollViewVFD
- (_OWORD)initWithScrollView:(void *)a1;
- (uint64_t)_activateActiveSubreasons:(uint64_t)result;
- (uint64_t)_deactivateActiveSubreasons:(uint64_t)result;
- (uint64_t)activateSubreason:(uint64_t)result;
- (uint64_t)deactivateSubreason:(uint64_t)result;
- (uint64_t)setUpdateRequestRecord:(uint64_t)result;
- (uint64_t)updateDisplayLink:(uint64_t)result;
- (void)_updateCompleted;
- (void)dealloc;
- (void)reset;
- (void)updateBounds:(CGFloat)a3 scale:(CGFloat)a4;
@end

@implementation _UIScrollViewVFD

- (void)updateBounds:(CGFloat)a3 scale:(CGFloat)a4
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 24))
    {
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7 == a1 + 32)
      {
        uint64_t v12 = *(void *)(a1 + 104);
        if (v12
          && off_1EB256BF8
          && *((_DWORD *)off_1EB256BF8 + 160) == 1
          && (double v14 = _UIMediaDurationForMachDuration(*((void *)off_1EB256BF8 + 84) - v12), v14 > 0.0)
          && v14 < 0.064)
        {
          double v15 = hypot(*(double *)(a1 + 112) - a2, *(double *)(a1 + 120) - a3) * a6 / v14;
          uint64_t v16 = (1.0 / v14 + 0.5);
          if (qword_1EB259710 != -1) {
            dispatch_once(&qword_1EB259710, &__block_literal_global_532);
          }
          float v17 = v15;
          *(void *)&v30[0] = 0;
          uint64_t v31 = 0;
          uint64_t v18 = _UIScrollViewVFDTableLookup(*(_DWORD *)qword_1EB259708, *(void *)(qword_1EB259708 + 8), v16, (uint64_t *)v30, &v31, v17);
          float v19 = v15;
          uint64_t v20 = _UIScrollViewVFDTableLookup(*(_DWORD *)qword_1EB259700, *(void *)(qword_1EB259700 + 8), v16, (uint64_t *)v30, &v31, v19);
          *(void *)(a1 + 88) = v20;
          if (*(void *)(a1 + 80) == v20)
          {
            unsigned int v26 = *(unsigned __int16 *)(a1 + 96);
            unsigned int v22 = _MergedGlobals_34;
            if (_MergedGlobals_34 <= v26)
            {
              unsigned __int16 v21 = *(_WORD *)(a1 + 98);
            }
            else
            {
              unsigned __int16 v21 = v26 + 1;
              *(_WORD *)(a1 + 98) = v21;
            }
          }
          else
          {
            unsigned __int16 v21 = 0;
            *(_WORD *)(a1 + 98) = 0;
            unsigned int v22 = _MergedGlobals_34;
          }
          if (v22 <= v21) {
            v27 = (float *)v20;
          }
          else {
            v27 = (float *)v18;
          }
          unsigned int v23 = v27[1];
          unsigned int v25 = v27[2];
          unsigned int v24 = *v27;
          kdebug_trace();
          uint64_t v28 = *(void *)(a1 + 16);
          long long v29 = *(_OWORD *)(v7 + 16);
          v30[0] = *(_OWORD *)v7;
          v30[1] = v29;
          -[_UIScrollViewFPSHUD displayUpdateRequest:reportedRateForPreviousFrame:](v28, (uint64_t)v30, v16);
        }
        else
        {
          kdebug_trace();
          unsigned int v23 = 120;
          unsigned int v24 = 80;
          unsigned int v25 = 120;
        }
        _UIUpdateCompletionObservationAddObserver((float **)&mainCompletionObservation, a1, 0);
        *(_DWORD *)(a1 + 36) = v24;
        *(_DWORD *)(a1 + 40) = v25;
        *(_DWORD *)(a1 + 44) = v23;
        _UIUpdateRequestRegistryMutableRequestChanged((uint64_t)&mainRegistry, (unsigned char *)v7);
        -[_UIScrollViewFPSHUD updateDebugOverlayBounds:withScrollView:](*(void **)(a1 + 16), *(void **)(a1 + 8), a2, a3, a4, a5);
      }
    }
  }
}

- (_OWORD)initWithScrollView:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_UIScrollViewVFD;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = xmmword_186B9D500;
    *((void *)v3 + 1) = a2;
    *((void *)v3 + 11) = 0;
    *((void *)v3 + 12) = 0;
    *((void *)v3 + 10) = 0;
    *((void *)v3 + 8) = v3 + 2;
    *((_DWORD *)v3 + 18) = 1048577;
    uint64_t v5 = +[_UIScrollViewFPSHUD createFPSHUD]();
    v6 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v5;
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  -[_UIScrollViewVFD reset]((unint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewVFD;
  [(_UIScrollViewVFD *)&v3 dealloc];
}

- (void)reset
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 24))
    {
      -[_UIScrollViewVFD _deactivateActiveSubreasons:](a1, a1 + 64);
      *(_DWORD *)(a1 + 24) = 0;
    }
    _UIUpdateCompletionObservationRemoveObserver((uint64_t)&mainCompletionObservation, a1, 0);
  }
}

- (uint64_t)setUpdateRequestRecord:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    objc_super v3 = (_OWORD *)(result + 64);
    long long v4 = *(_OWORD *)(result + 64);
    if (a2)
    {
      _OWORD *v3 = *a2;
    }
    else
    {
      *(void *)(result + 64) = result + 32;
      *(_DWORD *)(result + 72) = 1048577;
    }
    if (*(_DWORD *)(result + 24) && (void)v4 != *(void *)v3 && DWORD2(v4) != *(_DWORD *)(result + 72))
    {
      -[_UIScrollViewVFD _deactivateActiveSubreasons:](result, (uint64_t)&v4);
      return -[_UIScrollViewVFD _activateActiveSubreasons:](v2, (uint64_t)v3);
    }
  }
  return result;
}

- (uint64_t)_deactivateActiveSubreasons:(uint64_t)result
{
  if (result)
  {
    objc_super v3 = *(_DWORD **)a2;
    if (*(void *)a2 == result + 32)
    {
      unsigned int v4 = *(_DWORD *)(result + 24);
      if (v4)
      {
        unsigned int v5 = 1048577;
        do
        {
          if (v4) {
            _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, v3, v5);
          }
          ++v5;
          BOOL v6 = v4 > 1;
          v4 >>= 1;
        }
        while (v6);
        objc_super v3 = *(_DWORD **)a2;
      }
    }
    unsigned int v7 = *(_DWORD *)(a2 + 8);
    return _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, v3, v7);
  }
  return result;
}

- (uint64_t)_activateActiveSubreasons:(uint64_t)result
{
  if (result)
  {
    objc_super v3 = *(int **)a2;
    if (*(void *)a2 == result + 32)
    {
      unsigned int v4 = *(_DWORD *)(result + 24);
      if (v4)
      {
        unsigned int v5 = 1048577;
        do
        {
          if (v4) {
            _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, v3, v5);
          }
          ++v5;
          BOOL v6 = v4 > 1;
          v4 >>= 1;
        }
        while (v6);
        objc_super v3 = *(int **)a2;
      }
    }
    unsigned int v7 = *(_DWORD *)(a2 + 8);
    return _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, v3, v7);
  }
  return result;
}

- (uint64_t)activateSubreason:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = 1 << a2;
    int v5 = *(_DWORD *)(result + 24);
    if ((v5 & (1 << a2)) == 0)
    {
      if (!v5) {
        result = _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, *(int **)(result + 64), *(_DWORD *)(result + 72));
      }
      BOOL v6 = *(int **)(v3 + 64);
      if (v6 == (int *)(v3 + 32)) {
        result = _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, v6, a2 + 1048577);
      }
      *(_DWORD *)(v3 + 24) |= v4;
    }
  }
  return result;
}

- (uint64_t)deactivateSubreason:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = *(_DWORD *)(result + 24);
    if ((v4 & (1 << a2)) != 0)
    {
      int v5 = v4 & ~(1 << a2);
      *(_DWORD *)(result + 24) = v5;
      if (!v5)
      {
        result = _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, *(_DWORD **)(result + 64), *(_DWORD *)(result + 72));
        *(void *)(v3 + 36) = 0x7800000050;
        *(_DWORD *)(v3 + 44) = 120;
      }
      BOOL v6 = *(_DWORD **)(v3 + 64);
      if (v6 == (_DWORD *)(v3 + 32))
      {
        return _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, v6, a2 + 1048577);
      }
    }
  }
  return result;
}

- (uint64_t)updateDisplayLink:(uint64_t)result
{
  if (result && a2)
  {
    CAFrameRateRange v4 = CAFrameRateRangeMake((float)*(unsigned int *)(*(void *)(result + 64) + 4), (float)*(unsigned int *)(*(void *)(result + 64) + 12), (float)*(unsigned int *)(*(void *)(result + 64) + 8));
    return objc_msgSend(a2, "setPreferredFrameRateRange:", *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  }
  return result;
}

- (void)_updateCompleted
{
  self->_lookupState.staticRateRangePrevious = self->_lookupState.staticRateRangeCurrent;
  self->_lookupState.staticRateRangeFramesPrevious = self->_lookupState.staticRateRangeFramesCurrent;
  uint64_t v3 = (char *)off_1EB256BF8 + 648;
  if (*((_DWORD *)off_1EB256BF8 + 160) != 1) {
    uint64_t v3 = 0;
  }
  self->_displayedPresentationTime = *((void *)v3 + 3);
  [(UIView *)self->_scrollView bounds];
  self->_displayedOrigin.x = v4;
  self->_displayedOrigin.y = v5;
  scrollView = self->_scrollView;
  if (scrollView)
  {
    uint64_t vfd = (uint64_t)scrollView->_vfd;
    scrollHeartbeat = scrollView->_scrollHeartbeat;
    -[_UIScrollViewVFD updateDisplayLink:](vfd, scrollHeartbeat);
  }
}

@end