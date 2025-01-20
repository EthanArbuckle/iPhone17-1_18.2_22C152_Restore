@interface TLTimeline
+ (BOOL)supportsSecureCoding;
+ (id)TLTimelineSegmentFromSortedEntries:(id)a3 withLowerBound:(id)a4 upperBound:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)paused;
- (BOOL)updatesNowNodeOnSignificantTimeChange;
- (NSDate)dateOfLastEntryInTimeline;
- (NSDate)endOfVisibilityForNowEntry;
- (TLTimeline)initWithCoder:(id)a3;
- (TLTimeline)initWithEntry:(id)a3;
- (TLTimeline)initWithWindow:(id)a3 paused:(BOOL)a4;
- (TLTimelineDelegate)delegate;
- (TLTimelineEntry)lastEntry;
- (TLTimelineEntry)nowEntry;
- (id)_nowEntry;
- (id)_nowNode;
- (id)_sortedEntries:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entriesWithinDateInterval:(id)a3;
- (id)nowWindow;
- (unint64_t)hash;
- (unint64_t)nodeCapacity;
- (void)_recycleAllNodes;
- (void)_setupWithEntry:(id)a3;
- (void)_timerFired;
- (void)_trimTimeline;
- (void)_updateNowWindow;
- (void)_updateTimer;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)extendRightFromDate:(id)a3 withEntries:(id)a4;
- (void)resetWithEntry:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setUpdatesNowNodeOnSignificantTimeChange:(BOOL)a3;
@end

@implementation TLTimeline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLTimeline)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nowWindow"];
  uint64_t v6 = [v4 decodeBoolForKey:@"paused"];

  v7 = [(TLTimeline *)self initWithWindow:v5 paused:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v5 encodeObject:v4->_nowWindow forKey:@"nowWindow"];
  [v5 encodeBool:v4->_paused forKey:@"paused"];
  objc_sync_exit(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithWindow:paused:", v4->_nowWindow, v4->_paused);
  objc_sync_exit(v4);

  return v5;
}

- (TLTimeline)initWithWindow:(id)a3 paused:(BOOL)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TLTimeline;
  v8 = [(TLTimeline *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nowWindow, a3);
    uint64_t v10 = [v7 leftmostNode];
    leftmostNode = v9->_leftmostNode;
    v9->_leftmostNode = (TLTimelineEntryNode *)v10;

    uint64_t v12 = [v7 rightmostNode];
    rightmostNode = v9->_rightmostNode;
    v9->_rightmostNode = (TLTimelineEntryNode *)v12;

    v9->_paused = a4;
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v9 selector:sel__timerFired name:*MEMORY[0x263EFF458] object:0];
  }
  return v9;
}

- (TLTimeline)initWithEntry:(id)a3
{
  id v4 = a3;
  id v5 = _DequeueRecycledEntryNode();
  [v5 setEntry:v4];

  uint64_t v6 = [[TLTimelineWindow alloc] initWithFocalNode:v5 maxNodes:[(TLTimeline *)self nodeCapacity]];
  id v7 = [(TLTimeline *)self initWithWindow:v6 paused:0];

  return v7;
}

- (void)dealloc
{
  [(TLTimeline *)self _recycleAllNodes];
  if (self->_updatesNowNodeOnSignificantTimeChange)
  {
    int notifyToken = self->_notifyToken;
    if (notifyToken) {
      notify_cancel(notifyToken);
    }
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)TLTimeline;
  [(TLTimeline *)&v5 dealloc];
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (!a3) {
      [(TLTimeline *)self _updateNowWindow];
    }
    [(TLTimeline *)self _updateTimer];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TLTimeline *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      BOOL v6 = 1;
      goto LABEL_7;
    }
    BOOL v5 = [(TLTimeline *)self paused];
    if (v5 == [(TLTimeline *)v4 paused])
    {
      id v7 = [(TLTimeline *)self nowWindow];
      v8 = [(TLTimeline *)v4 nowWindow];
      BOOL v6 = +[TLTimelineUtilities object:v7 isEqualToObject:v8];

      goto LABEL_7;
    }
  }
  BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = +[TLTimeline hash];
  id v4 = [(TLTimeline *)self nowWindow];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(TLTimeline *)self paused] ^ v3;

  return v6;
}

- (void)setUpdatesNowNodeOnSignificantTimeChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_updatesNowNodeOnSignificantTimeChange != v3)
  {
    v4->_updatesNowNodeOnSignificantTimeChange = v3;
    if (v3)
    {
      objc_initWeak(&location, v4);
      uint64_t v5 = MEMORY[0x263EF83A0];
      id v6 = MEMORY[0x263EF83A0];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __55__TLTimeline_setUpdatesNowNodeOnSignificantTimeChange___block_invoke;
      v7[3] = &unk_2644780C0;
      objc_copyWeak(&v8, &location);
      notify_register_dispatch("SignificantTimeChangeNotification", &v4->_notifyToken, v5, v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      notify_cancel(v4->_notifyToken);
      v4->_int notifyToken = 0;
    }
  }
  objc_sync_exit(v4);
}

void __55__TLTimeline_setUpdatesNowNodeOnSignificantTimeChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerFired];
}

- (BOOL)updatesNowNodeOnSignificantTimeChange
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL updatesNowNodeOnSignificantTimeChange = v2->_updatesNowNodeOnSignificantTimeChange;
  objc_sync_exit(v2);

  return updatesNowNodeOnSignificantTimeChange;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsToTimerFired = objc_opt_respondsToSelector() & 1;
  }
}

- (void)resetWithEntry:(id)a3
{
  nowWindow = self->_nowWindow;
  self->_nowWindow = 0;
  id v5 = a3;

  [(TLTimeline *)self _recycleAllNodes];
  [(TLTimeline *)self _setupWithEntry:v5];

  id v6 = [(TLTimeline *)self delegate];
  [v6 entriesDidChangeInTimeline:self];
}

- (id)entriesWithinDateInterval:(id)a3
{
  id v4 = a3;
  id v5 = [TLTimelineWindow alloc];
  id v6 = [(TLTimeline *)self _nowNode];
  id v7 = [(TLTimelineWindow *)v5 initWithFocalNode:v6 maxNodes:[(TLTimeline *)self nodeCapacity]];

  id v8 = [v4 startDate];
  [(TLTimelineWindow *)v7 updateFocalNodeWithDate:v8];

  v9 = objc_opt_new();
  uint64_t v10 = [(TLTimelineWindow *)v7 focalNode];
  do
  {
    v11 = [v10 entry];
    if (v11) {
      [v9 addObject:v11];
    }
    uint64_t v12 = [v10 rightEntryNode];

    if (!v12) {
      break;
    }
    uint64_t v13 = [v12 entry];
    if (!v13) {
      break;
    }
    v14 = (void *)v13;
    v15 = [v12 entry];
    objc_super v16 = objc_msgSend(v15, "tl_entryDate");
    char v17 = [v4 containsDate:v16];

    uint64_t v10 = v12;
  }
  while ((v17 & 1) != 0);
  v18 = (void *)[v9 copy];

  return v18;
}

- (void)extendRightFromDate:(id)a3 withEntries:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(TLTimeline *)self _sortedEntries:a4];
  id v8 = [(TLTimeline *)self dateOfLastEntryInTimeline];
  int v9 = [v6 isEqualToDate:v8];

  if (v9)
  {
    uint64_t v10 = [(TLTimeline *)self dateOfLastEntryInTimeline];
    v11 = +[TLTimeline TLTimelineSegmentFromSortedEntries:v7 withLowerBound:v10 upperBound:0];

    if (v11)
    {
      rightmostNode = self->_rightmostNode;
      uint64_t v13 = [v11 leftmostNode];
      _AttachNodes(rightmostNode, v13);

      v14 = [v11 rightmostNode];
      v15 = self->_rightmostNode;
      self->_rightmostNode = v14;
    }
  }
  else
  {
    v11 = TLLoggingObjectForDomain(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_21DC44000, v11, OS_LOG_TYPE_DEFAULT, "Boundary date is not equal to last date. Cannot extend timeline forward from date %@", (uint8_t *)&v17, 0xCu);
    }
  }

  [(TLTimeline *)self _updateNowWindow];
  [(TLTimeline *)self _trimTimeline];
  [(TLTimeline *)self _updateTimer];
  objc_super v16 = [(TLTimeline *)self delegate];
  [v16 entriesDidChangeInTimeline:self];
}

- (TLTimelineEntry)nowEntry
{
  if (!self->_timer)
  {
    nowWindow = self->_nowWindow;
    id v4 = [MEMORY[0x263EFF910] date];
    [(TLTimelineWindow *)nowWindow updateFocalNodeWithDate:v4];

    [(TLTimelineWindow *)self->_nowWindow rebalance];
  }
  return (TLTimelineEntry *)[(TLTimeline *)self _nowEntry];
}

- (id)nowWindow
{
  return self->_nowWindow;
}

- (unint64_t)nodeCapacity
{
  return 200;
}

- (NSDate)endOfVisibilityForNowEntry
{
  v2 = [(TLTimeline *)self _nowNode];
  BOOL v3 = [v2 rightEntryNode];
  id v4 = [v3 date];

  return (NSDate *)v4;
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(TLTimeline *)self _nowNode];
  id v5 = [v4 entry];
  id v6 = [(TLTimeline *)self _nowNode];
  id v7 = [v6 rightEntryNode];
  id v8 = [v7 entry];
  int v9 = [v3 stringWithFormat:@"<TLTimeline-%p: currentEntry: %@, nextEntry: %@>", self, v5, v8];

  return v9;
}

- (void)_updateTimer
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v2 = self;
  [(NSTimer *)v2->_timer invalidate];
  timer = v2->_timer;
  v2->_timer = 0;

  if (!v2->_paused)
  {
    id v4 = [(TLTimeline *)v2 _nowNode];
    id v5 = [v4 rightEntryNode];
    id v6 = [v5 date];

    if (v6)
    {
      id v7 = TLLoggingObjectForDomain(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [(TLTimeline *)v2 _nowNode];
        id v8 = [v23 entry];
        v22 = [(TLTimeline *)v2 _nowNode];
        int v9 = [v22 date];
        v21 = [(TLTimeline *)v2 _nowNode];
        v20 = [v21 rightEntryNode];
        uint64_t v10 = [v20 entry];
        v11 = [(TLTimeline *)v2 _nowNode];
        uint64_t v12 = [v11 rightEntryNode];
        uint64_t v13 = [v12 date];
        v14 = NSNumber;
        [v6 timeIntervalSinceNow];
        v15 = objc_msgSend(v14, "numberWithDouble:");
        *(_DWORD *)buf = 134219266;
        v25 = v2;
        __int16 v26 = 2112;
        v27 = v8;
        __int16 v28 = 2112;
        v29 = v9;
        __int16 v30 = 2112;
        v31 = v10;
        __int16 v32 = 2112;
        v33 = v13;
        __int16 v34 = 2112;
        v35 = v15;
        _os_log_impl(&dword_21DC44000, v7, OS_LOG_TYPE_DEFAULT, "<TLTimeline-%p> current entry %@ (%@) - next entry %@ (%@) - firing next event in: %@ seconds", buf, 0x3Eu);
      }
      objc_super v16 = (void *)MEMORY[0x263EFFA20];
      [v6 timeIntervalSinceNow];
      uint64_t v17 = objc_msgSend(v16, "timerWithTimeInterval:target:selector:userInfo:repeats:", v2, sel__timerFired, 0, 0);
      id v18 = v2->_timer;
      v2->_timer = (NSTimer *)v17;

      [(NSTimer *)v2->_timer setTolerance:2.0];
      uint64_t v19 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [v19 addTimer:v2->_timer forMode:*MEMORY[0x263EFF588]];
    }
  }
}

- (void)_timerFired
{
  [(TLTimeline *)self _updateNowWindow];
  if (self->_delegateRespondsToTimerFired)
  {
    BOOL v3 = [(TLTimeline *)self delegate];
    [v3 timelineTimerDidFire:self];
  }
  [(TLTimeline *)self _updateTimer];
}

- (id)_nowEntry
{
  v2 = [(TLTimeline *)self _nowNode];
  BOOL v3 = [v2 entry];

  return v3;
}

- (NSDate)dateOfLastEntryInTimeline
{
  return [(TLTimelineEntryNode *)self->_rightmostNode date];
}

- (TLTimelineEntry)lastEntry
{
  return [(TLTimelineEntryNode *)self->_rightmostNode entry];
}

- (void)_setupWithEntry:(id)a3
{
  id v4 = a3;
  _DequeueRecycledEntryNode();
  id v5 = (TLTimelineEntryNode *)objc_claimAutoreleasedReturnValue();
  [(TLTimelineEntryNode *)v5 setEntry:v4];

  objc_storeStrong((id *)&self->_rightmostNode, v5);
  leftmostNode = self->_leftmostNode;
  self->_leftmostNode = v5;
  int v9 = v5;

  id v7 = [[TLTimelineWindow alloc] initWithFocalNode:v9 maxNodes:[(TLTimeline *)self nodeCapacity]];
  nowWindow = self->_nowWindow;
  self->_nowWindow = v7;
}

+ (id)TLTimelineSegmentFromSortedEntries:(id)a3 withLowerBound:(id)a4 upperBound:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v30 = v9;
    id obj = v10;
    uint64_t v13 = 0;
    v14 = 0;
    v29 = 0;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (v8)
        {
          id v18 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "tl_entryDate");
          BOOL v19 = +[TLTimelineUtilities date:v8 isOrderedAscendingToDate:v18];

          if (!v19) {
            continue;
          }
        }
        if (v14)
        {
          v20 = [v14 date];
          v21 = objc_msgSend(v17, "tl_entryDate");
          BOOL v22 = +[TLTimelineUtilities date:v20 isOrderedAscendingToDate:v21];

          if (!v22) {
            continue;
          }
        }
        if (v30)
        {
          v23 = objc_msgSend(v17, "tl_entryDate");
          BOOL v24 = +[TLTimelineUtilities date:v23 isOrderedAscendingToDate:v30];

          if (!v24) {
            goto LABEL_18;
          }
        }
        v25 = _DequeueRecycledEntryNode();
        [v25 setEntry:v17];
        if (v14)
        {
          _AttachNodes(v14, v25);
        }
        else
        {
          id v26 = v25;

          v29 = v26;
        }
        uint64_t v13 = (TLTimelineSegment *)((char *)v13 + 1);

        v14 = v25;
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
LABEL_18:
    id v10 = obj;

    v27 = v29;
    if (v13) {
      uint64_t v13 = [[TLTimelineSegment alloc] initWithLeftmostNode:v29 rightmostNode:v14 count:v13];
    }
    id v9 = v30;
  }
  else
  {

    uint64_t v13 = 0;
    v14 = 0;
    v27 = 0;
  }

  return v13;
}

- (id)_sortedEntries:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_2];
}

uint64_t __29__TLTimeline__sortedEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(a2, "tl_entryDate");
  id v6 = objc_msgSend(v4, "tl_entryDate");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_nowNode
{
  return [(TLTimelineWindow *)self->_nowWindow focalNode];
}

- (void)_updateNowWindow
{
  id v12 = [(TLTimeline *)self _nowEntry];
  nowWindow = self->_nowWindow;
  id v4 = [MEMORY[0x263EFF910] date];
  [(TLTimelineWindow *)nowWindow updateFocalNodeWithDate:v4];

  [(TLTimelineWindow *)self->_nowWindow rebalance];
  id v5 = [(TLTimeline *)self _nowEntry];
  if (v12 != v5)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = v9;
    if (v8)
    {
      [v9 timeline:self didChangeNowEntryFrom:v12 to:v5];
    }
    else
    {
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        goto LABEL_7;
      }
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 nowEntryDidChangeFrom:v12 to:v5];
    }
  }
LABEL_7:
}

- (void)_trimTimeline
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  while (self->_leftmostNode && !-[TLTimelineWindow containsNode:](self->_nowWindow, "containsNode:"))
  {
    [v3 addObject:self->_leftmostNode];
    id v4 = [(TLTimelineEntryNode *)self->_leftmostNode rightEntryNode];
    leftmostNode = self->_leftmostNode;
    self->_leftmostNode = v4;
  }
  while (self->_rightmostNode && !-[TLTimelineWindow containsNode:](self->_nowWindow, "containsNode:"))
  {
    [v3 addObject:self->_rightmostNode];
    id v6 = [(TLTimelineEntryNode *)self->_rightmostNode leftEntryNode];
    rightmostNode = self->_rightmostNode;
    self->_rightmostNode = v6;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        _RecycleNode(*(void **)(*((void *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_recycleAllNodes
{
  BOOL v3 = self->_leftmostNode;
  if (v3)
  {
    id v4 = v3;
    do
    {
      uint64_t v5 = [v4 rightNode];
      _RecycleNode(v4);

      id v4 = (void *)v5;
    }
    while (v5);
  }
  leftmostNode = self->_leftmostNode;
  self->_leftmostNode = 0;

  rightmostNode = self->_rightmostNode;
  self->_rightmostNode = 0;
}

- (TLTimelineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TLTimelineDelegate *)WeakRetained;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_nowWindow, 0);
  objc_storeStrong((id *)&self->_rightmostNode, 0);
  objc_storeStrong((id *)&self->_leftmostNode, 0);
}

@end