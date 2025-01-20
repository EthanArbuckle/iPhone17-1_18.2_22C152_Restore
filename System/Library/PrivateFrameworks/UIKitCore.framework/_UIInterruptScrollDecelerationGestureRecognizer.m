@interface _UIInterruptScrollDecelerationGestureRecognizer
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_shouldReceivePress:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (_UIInterruptScrollDecelerationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_hoverCancelled:(id)a3 withEvent:(id)a4;
- (void)_hoverEntered:(id)a3 withEvent:(id)a4;
- (void)_hoverExited:(id)a3 withEvent:(id)a4;
- (void)_hoverMoved:(id)a3 withEvent:(id)a4;
- (void)_scrollingChangedWithEvent:(id)a3;
- (void)reset;
@end

@implementation _UIInterruptScrollDecelerationGestureRecognizer

- (_UIInterruptScrollDecelerationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIInterruptScrollDecelerationGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4) {
    [(UIGestureRecognizer *)v4 _setAcceptsFailureRequiments:0];
  }
  return v5;
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)_UIInterruptScrollDecelerationGestureRecognizer;
  [(UIGestureRecognizer *)&v4 reset];
  currentHoverEvent = self->_currentHoverEvent;
  self->_currentHoverEvent = 0;

  self->_previousTrackpadFingerDownCount = 0;
  self->_trackpadFingerDownCount = 0;
}

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  uint64_t v9 = [a4 type];
  if (v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIInterruptScrollDecelerationGestureRecognizer;
    LOBYTE(v9) = [(UIGestureRecognizer *)&v11 _shouldReceiveTouch:a3 forEvent:a4 recognizerView:a5];
  }
  return v9;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  return 0;
}

- (void)_hoverEntered:(id)a3 withEvent:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &_MergedGlobals_1_15);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v10 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      int64_t v14 = (int64_t)a3;
      __int16 v15 = 2112;
      id v16 = a4;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "_hoverEntered: %@ withEvent: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  if (!self->_currentHoverEvent)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&self->_currentHoverEvent, a4);
      int64_t v8 = [(UIEvent *)self->_currentHoverEvent _trackpadFingerDownCount];
      self->_int64_t trackpadFingerDownCount = v8;
      self->_previousTrackpadFingerDownCount = v8;
      unint64_t v9 = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BDD8);
      if (*(unsigned char *)v9)
      {
        objc_super v11 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int64_t trackpadFingerDownCount = self->_trackpadFingerDownCount;
          int v13 = 134217984;
          int64_t v14 = trackpadFingerDownCount;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "trackpadFingerDownCount (and previous) changed to %ld", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
}

- (void)_hoverMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BDE0);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    objc_super v11 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      int64_t v17 = (int64_t)a3;
      __int16 v18 = 2112;
      int64_t v19 = (int64_t)a4;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "_hoverMoved: %@ withEvent: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  if (self->_currentHoverEvent == a4)
  {
    self->_int64_t previousTrackpadFingerDownCount = self->_trackpadFingerDownCount;
    int64_t v8 = [a4 _trackpadFingerDownCount];
    self->_int64_t trackpadFingerDownCount = v8;
    if (self->_previousTrackpadFingerDownCount != v8)
    {
      unint64_t v9 = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BDE8);
      if (*(unsigned char *)v9)
      {
        v12 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int64_t previousTrackpadFingerDownCount = self->_previousTrackpadFingerDownCount;
          int64_t trackpadFingerDownCount = self->_trackpadFingerDownCount;
          int v16 = 134218240;
          int64_t v17 = previousTrackpadFingerDownCount;
          __int16 v18 = 2048;
          int64_t v19 = trackpadFingerDownCount;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "trackpadFingerDownCount changed from %ld to %ld", (uint8_t *)&v16, 0x16u);
        }
      }
      if (!self->_previousTrackpadFingerDownCount && self->_trackpadFingerDownCount == 1)
      {
        unint64_t v10 = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BDF0);
        if (*(unsigned char *)v10)
        {
          __int16 v15 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v16 = 138412290;
            int64_t v17 = (int64_t)self;
            _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Trackpad finger down count went from 0 to 1, so recognizing: %@", (uint8_t *)&v16, 0xCu);
          }
        }
        [(UIGestureRecognizer *)self setState:3];
      }
    }
  }
}

- (void)_hoverExited:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BDF8);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    unint64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412546;
      v12 = a3;
      __int16 v13 = 2112;
      id v14 = a4;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "_hoverExited: %@ withEvent: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  if (self->_currentHoverEvent == a4)
  {
    [(UIGestureRecognizer *)self setState:5];
    unint64_t v8 = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BE00);
    if (*(unsigned char *)v8)
    {
      unint64_t v10 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        v12 = self;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Failed: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_hoverCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BE08);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    unint64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412546;
      v12 = a3;
      __int16 v13 = 2112;
      id v14 = a4;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "_hoverCancelled: %@ withEvent: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  if (self->_currentHoverEvent == a4)
  {
    [(UIGestureRecognizer *)self setState:5];
    unint64_t v8 = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BE10);
    if (*(unsigned char *)v8)
    {
      unint64_t v10 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        v12 = self;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Failed: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BE18);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    objc_super v7 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      unint64_t v10 = a3;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "_scrollingChangedWithEvent: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if ([a3 phase] == 1)
  {
    unint64_t v6 = __UILogGetCategoryCachedImpl("InterruptScrollGesture", &qword_1EB25BE20);
    if (*(unsigned char *)v6)
    {
      unint64_t v8 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        unint64_t v10 = self;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Scroll event phase is MayBegin, so recognizing: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end