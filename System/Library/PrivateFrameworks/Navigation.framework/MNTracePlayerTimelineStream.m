@interface MNTracePlayerTimelineStream
- (MNTracePlayerTimelineStream)initWithData:(id)a3;
- (double)nextUpdatePosition;
- (id)handler;
- (unint64_t)nextIndex;
- (void)jumpToPosition:(double)a3;
- (void)setHandler:(id)a3;
- (void)triggerNextUpdate;
@end

@implementation MNTracePlayerTimelineStream

- (MNTracePlayerTimelineStream)initWithData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNTracePlayerTimelineStream;
  v6 = [(MNTracePlayerTimelineStream *)&v10 init];
  if (v6)
  {
    if (![v5 count])
    {
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v12 = "-[MNTracePlayerTimelineStream initWithData:]";
        __int16 v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTracePlayerTimelineStream.m";
        __int16 v15 = 1024;
        int v16 = 44;
        __int16 v17 = 2080;
        v18 = "data.count > 0";
        _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
      }
    }
    objc_storeStrong((id *)&v6->_data, a3);
    v6->_nextIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6->_nextUpdatePosition = 978307200.0;
    v7 = v6;
  }

  return v6;
}

- (void)triggerNextUpdate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t nextIndex = self->_nextIndex;
  if (nextIndex >= [(NSArray *)self->_data count])
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v15 = "-[MNTracePlayerTimelineStream triggerNextUpdate]";
      __int16 v16 = 2080;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTracePlayerTimelineStream.m";
      __int16 v18 = 1024;
      int v19 = 57;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
    }
  }
  else
  {
    if (self->_handler)
    {
      v4 = [(NSArray *)self->_data objectAtIndex:nextIndex];
      [v4 position];
      double v6 = v5;

      handler = (void (**)(id, unint64_t, void *, double))self->_handler;
      v8 = [MEMORY[0x1E4F1C9C8] date];
      handler[2](handler, nextIndex, v8, v6);
    }
    data = self->_data;
    unint64_t v10 = self->_nextIndex + 1;
    self->_unint64_t nextIndex = v10;
    if (v10 >= [(NSArray *)data count])
    {
      self->_unint64_t nextIndex = 0x7FFFFFFFFFFFFFFFLL;
      self->_nextUpdatePosition = 978307200.0;
    }
    else
    {
      id v13 = [(NSArray *)self->_data objectAtIndex:self->_nextIndex];
      [v13 position];
      self->_nextUpdatePosition = v11;
    }
  }
}

- (void)jumpToPosition:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = [[_MNTracePlayerTimelineStreamSearchObject alloc] initWithPosition:a3];
  unint64_t v5 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](self->_data, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, [(NSArray *)self->_data count], 1024, &__block_literal_global_38);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315906;
      v12 = "-[MNTracePlayerTimelineStream jumpToPosition:]";
      __int16 v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Traces/MNTracePlayerTimelineStream.m";
      __int16 v15 = 1024;
      int v16 = 88;
      __int16 v17 = 2080;
      __int16 v18 = "nextIndex != NSNotFound";
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v11, 0x26u);
    }
  }
  NSUInteger v6 = [(NSArray *)self->_data count];
  if (v5 >= v6 - 1) {
    unint64_t v7 = v6 - 1;
  }
  else {
    unint64_t v7 = v5;
  }
  self->_unint64_t nextIndex = v7;
  v8 = -[NSArray objectAtIndex:](self->_data, "objectAtIndex:");
  [v8 position];
  self->_nextUpdatePosition = v9;
}

uint64_t __46__MNTracePlayerTimelineStream_jumpToPosition___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 position];
  NSUInteger v6 = objc_msgSend(v4, "numberWithDouble:");
  unint64_t v7 = NSNumber;
  [v5 position];
  double v9 = v8;

  unint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (unint64_t)nextIndex
{
  return self->_nextIndex;
}

- (double)nextUpdatePosition
{
  return self->_nextUpdatePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end