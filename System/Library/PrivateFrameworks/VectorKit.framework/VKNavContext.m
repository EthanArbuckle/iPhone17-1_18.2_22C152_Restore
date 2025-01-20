@interface VKNavContext
- (GEOComposedRoute)route;
- (GEORouteMatch)routeMatch;
- (NSArray)groupedManeuverCounts;
- (VKNavContext)init;
- (id).cxx_construct;
- (unint64_t)currentStepIndex;
- (unint64_t)groupedManeuverCount;
- (unint64_t)navigationCameraHeadingOverride;
- (void)_notifyObserversStateChanged;
- (void)addObserver:(id)a3;
- (void)addPointToFrame:(id)a3 ofType:(unint64_t)a4;
- (void)addRouteToFrame:(id)a3 divergenceCoord:(PolylineCoordinate)a4 convergenceCoord:(PolylineCoordinate)a5;
- (void)clearAdditionalRoutesToFrame;
- (void)clearPointsToFrame;
- (void)clearPointsToFrameOfType:(unint64_t)a3;
- (void)enumerateAdditionalRoutesToFrameUsingBlock:(id)a3;
- (void)enumeratePointsToFrameOfType:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumeratePointsToFrameUsingBlock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCurrentStepIndex:(unint64_t)a3;
- (void)setGroupedManeuverCounts:(id)a3;
- (void)setNavigationCameraHeadingOverride:(unint64_t)a3;
- (void)setRouteMatch:(id)a3;
- (void)updateWithNewRoute:(id)a3 currentStepIndex:(unint64_t)a4;
@end

@implementation VKNavContext

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_additionalRoutesToFrame.__begin_;
  if (begin)
  {
    end = self->_additionalRoutesToFrame.__end_;
    v5 = self->_additionalRoutesToFrame.__begin_;
    if (end != begin)
    {
      v6 = (char *)end - 40;
      do
      {
        *((void *)end - 5) = &unk_1EF559678;
        end = (AdditionalRouteInfo *)((char *)end - 40);

        v6 -= 40;
      }
      while (end != begin);
      v5 = self->_additionalRoutesToFrame.__begin_;
    }
    self->_additionalRoutesToFrame.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_groupedManeuverCounts, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  v7 = self->_pointsToFrame.__begin_;
  if (v7)
  {
    self->_pointsToFrame.__end_ = v7;
    operator delete(v7);
  }
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (void)setGroupedManeuverCounts:(id)a3
{
}

- (NSArray)groupedManeuverCounts
{
  return self->_groupedManeuverCounts;
}

- (unint64_t)currentStepIndex
{
  return self->_currentStepIndex;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)enumerateAdditionalRoutesToFrameUsingBlock:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    begin = self->_additionalRoutesToFrame.__begin_;
    for (i = self->_additionalRoutesToFrame.__end_; begin != i; begin = (AdditionalRouteInfo *)((char *)begin + 40))
    {
      id v6 = *((id *)begin + 1);
      (*((void (**)(id, id, void, void))v7 + 2))(v7, v6, *((void *)begin + 3), *((void *)begin + 4));
    }
  }
}

- (void)addRouteToFrame:(id)a3 divergenceCoord:(PolylineCoordinate)a4 convergenceCoord:(PolylineCoordinate)a5
{
  id v8 = a3;
  v9 = v8;
  if (v8) {
    id v10 = v8;
  }

  *(PolylineCoordinate *)&long long v33 = a4;
  *((PolylineCoordinate *)&v33 + 1) = a5;
  end = self->_additionalRoutesToFrame.__end_;
  value = self->_additionalRoutesToFrame.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->_additionalRoutesToFrame.__begin_;
    unint64_t v17 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3);
    if (v17 + 1 > 0x666666666666666) {
      abort();
    }
    unint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 3);
    uint64_t v19 = 2 * v18;
    if (2 * v18 <= v17 + 1) {
      uint64_t v19 = v17 + 1;
    }
    if (v18 >= 0x333333333333333) {
      unint64_t v20 = 0x666666666666666;
    }
    else {
      unint64_t v20 = v19;
    }
    if (v20)
    {
      if (v20 > 0x666666666666666) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      v21 = (char *)operator new(40 * v20);
    }
    else
    {
      v21 = 0;
    }
    v22 = &v21[40 * v17];
    v23 = (AdditionalRouteInfo *)&v21[40 * v20];
    *(void *)v22 = &unk_1EF559678;
    *((void *)v22 + 1) = 0;
    id v24 = v9;
    v25 = (void *)*((void *)v22 + 1);
    *((void *)v22 + 1) = v24;

    *(_OWORD *)(v22 + 24) = v33;
    v15 = (AdditionalRouteInfo *)(v22 + 40);
    v27 = self->_additionalRoutesToFrame.__begin_;
    v26 = self->_additionalRoutesToFrame.__end_;
    if (v26 == v27)
    {
      self->_additionalRoutesToFrame.__begin_ = (AdditionalRouteInfo *)v22;
      self->_additionalRoutesToFrame.__end_ = v15;
      self->_additionalRoutesToFrame.__end_cap_.__value_ = v23;
    }
    else
    {
      v32 = v23;
      uint64_t v28 = 0;
      do
      {
        *(void *)&v22[v28 - 32] = 0;
        *(void *)&v22[v28 - 40] = &unk_1EF559678;
        objc_storeStrong((id *)&v22[v28 - 32], *(id *)((char *)v26 + v28 - 32));
        v29 = *(void **)((char *)v26 + v28 - 32);
        *(void *)((char *)v26 + v28 - 32) = 0;

        *(_OWORD *)&v22[v28 - 16] = *(_OWORD *)((char *)v26 + v28 - 16);
        v28 -= 40;
      }
      while ((AdditionalRouteInfo *)((char *)v26 + v28) != v27);
      v26 = self->_additionalRoutesToFrame.__begin_;
      v30 = self->_additionalRoutesToFrame.__end_;
      self->_additionalRoutesToFrame.__begin_ = (AdditionalRouteInfo *)&v22[v28];
      self->_additionalRoutesToFrame.__end_ = v15;
      self->_additionalRoutesToFrame.__end_cap_.__value_ = v32;
      if (v30 == v26)
      {
        if (!v26) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      v31 = (char *)v30 - 40;
      do
      {
        *((void *)v30 - 5) = &unk_1EF559678;
        v30 = (AdditionalRouteInfo *)((char *)v30 - 40);

        v31 -= 40;
      }
      while (v30 != v26);
    }
    if (!v26) {
      goto LABEL_25;
    }
LABEL_24:
    operator delete(v26);
    goto LABEL_25;
  }
  *(void *)end = &unk_1EF559678;
  *((void *)end + 1) = 0;
  id v13 = v9;
  v14 = (void *)*((void *)end + 1);
  *((void *)end + 1) = v13;

  *(_OWORD *)((char *)end + 24) = v33;
  v15 = (AdditionalRouteInfo *)((char *)end + 40);
LABEL_25:
  self->_additionalRoutesToFrame.__end_ = v15;
}

- (void)clearAdditionalRoutesToFrame
{
  begin = self->_additionalRoutesToFrame.__begin_;
  end = self->_additionalRoutesToFrame.__end_;
  if (end != begin)
  {
    v5 = (char *)end - 40;
    do
    {
      *((void *)end - 5) = &unk_1EF559678;
      end = (AdditionalRouteInfo *)((char *)end - 40);

      v5 -= 40;
    }
    while (end != begin);
  }
  self->_additionalRoutesToFrame.__end_ = begin;
}

- (unint64_t)navigationCameraHeadingOverride
{
  return self->_navigationCameraHeadingOverride;
}

- (void)setNavigationCameraHeadingOverride:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_navigationCameraHeadingOverride != a3)
  {
    self->_navigationCameraHeadingOverride = a3;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = self->_observers;
    uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "navContextCameraHeadingOverrideDidChange:", self, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)addObserver:(id)a3
{
}

- (void)_notifyObserversStateChanged
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "navContextStateDidChange:", self, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)enumeratePointsToFrameUsingBlock:(id)a3
{
  uint64_t v6 = (void (**)(id, void, double, double, double))a3;
  if (v6)
  {
    begin = self->_pointsToFrame.__begin_;
    for (i = self->_pointsToFrame.__end_; begin != i; begin = (AdditionalPointInfo *)((char *)begin + 32))
      v6[2](v6, *((void *)begin + 3), *(double *)begin, *((double *)begin + 1), *((double *)begin + 2));
  }
}

- (void)enumeratePointsToFrameOfType:(unint64_t)a3 usingBlock:(id)a4
{
  long long v8 = (void (**)(double, double, double))a4;
  if (v8)
  {
    begin = self->_pointsToFrame.__begin_;
    for (i = self->_pointsToFrame.__end_; begin != i; begin = (AdditionalPointInfo *)((char *)begin + 32))
    {
      if (*((void *)begin + 3) == a3) {
        v8[2](*(double *)begin, *((double *)begin + 1), *((double *)begin + 2));
      }
    }
  }
}

- (void)addPointToFrame:(id)a3 ofType:(unint64_t)a4
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  end = self->_pointsToFrame.__end_;
  value = self->_pointsToFrame.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->_pointsToFrame.__begin_;
    uint64_t v13 = (end - begin) >> 5;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 59) {
      abort();
    }
    uint64_t v15 = value - begin;
    if (v15 >> 4 > v14) {
      unint64_t v14 = v15 >> 4;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v16 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      if (v16 >> 59) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      unint64_t v17 = (char *)operator new(32 * v16);
    }
    else
    {
      unint64_t v17 = 0;
    }
    unint64_t v18 = &v17[32 * v13];
    *(double *)unint64_t v18 = var0;
    *((double *)v18 + 1) = var1;
    *((double *)v18 + 2) = var2;
    *((void *)v18 + 3) = a4;
    long long v11 = (AdditionalPointInfo *)(v18 + 32);
    if (end != begin)
    {
      do
      {
        long long v19 = *((_OWORD *)end - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)end - 2);
        *((_OWORD *)v18 - 1) = v19;
        v18 -= 32;
        end = (AdditionalPointInfo *)((char *)end - 32);
      }
      while (end != begin);
      end = self->_pointsToFrame.__begin_;
    }
    self->_pointsToFrame.__begin_ = (AdditionalPointInfo *)v18;
    self->_pointsToFrame.__end_ = v11;
    self->_pointsToFrame.__end_cap_.__value_ = (AdditionalPointInfo *)&v17[32 * v16];
    if (end) {
      operator delete(end);
    }
  }
  else
  {
    *($1AB5FA073B851C12C2339EC22442E995 *)end = a3;
    long long v11 = (AdditionalPointInfo *)((char *)end + 32);
    *((void *)end + 3) = a4;
  }
  self->_pointsToFrame.__end_ = v11;
}

- (void)clearPointsToFrameOfType:(unint64_t)a3
{
  begin = self->_pointsToFrame.__begin_;
  end = self->_pointsToFrame.__end_;
  if (begin != end)
  {
    while (*((void *)begin + 3) != a3)
    {
      begin = (AdditionalPointInfo *)((char *)begin + 32);
      if (begin == end) {
        return;
      }
    }
    if (begin != end)
    {
      uint64_t v5 = (AdditionalPointInfo *)((char *)begin + 32);
      if ((AdditionalPointInfo *)((char *)begin + 32) != end)
      {
        do
        {
          if (*((void *)v5 + 3) != a3)
          {
            long long v6 = *((_OWORD *)v5 + 1);
            *(_OWORD *)begin = *(_OWORD *)v5;
            *((_OWORD *)begin + 1) = v6;
            begin = (AdditionalPointInfo *)((char *)begin + 32);
          }
          uint64_t v5 = (AdditionalPointInfo *)((char *)v5 + 32);
        }
        while (v5 != end);
        end = self->_pointsToFrame.__end_;
      }
    }
    if (begin != end) {
      self->_pointsToFrame.__end_ = begin;
    }
  }
}

- (void)clearPointsToFrame
{
  self->_pointsToFrame.__end_ = self->_pointsToFrame.__begin_;
}

- (unint64_t)groupedManeuverCount
{
  groupedManeuverCounts = self->_groupedManeuverCounts;
  if (!groupedManeuverCounts) {
    return 0;
  }
  unint64_t currentStepIndex = self->_currentStepIndex;
  if (currentStepIndex >= [(NSArray *)groupedManeuverCounts count]) {
    return 0;
  }
  uint64_t v5 = [(NSArray *)self->_groupedManeuverCounts objectAtIndexedSubscript:self->_currentStepIndex];
  unint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

- (void)setCurrentStepIndex:(unint64_t)a3
{
  if (self->_currentStepIndex != a3)
  {
    self->_unint64_t currentStepIndex = a3;
    [(VKNavContext *)self _notifyObserversStateChanged];
  }
}

- (void)setRouteMatch:(id)a3
{
  uint64_t v5 = (GEORouteMatch *)a3;
  if (self->_routeMatch != v5)
  {
    objc_storeStrong((id *)&self->_routeMatch, a3);
    [(VKNavContext *)self _notifyObserversStateChanged];
  }
}

- (void)updateWithNewRoute:(id)a3 currentStepIndex:(unint64_t)a4
{
  long long v9 = (GEOComposedRoute *)a3;
  if (self->_route != v9)
  {
    [(VKNavContext *)self clearAdditionalRoutesToFrame];
    routeMatch = self->_routeMatch;
    self->_routeMatch = 0;

    objc_storeStrong((id *)&self->_route, a3);
    self->_unint64_t currentStepIndex = a4;
    groupedManeuverCounts = self->_groupedManeuverCounts;
    self->_groupedManeuverCounts = 0;

    [(VKNavContext *)self _notifyObserversStateChanged];
  }
}

- (VKNavContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)VKNavContext;
  v2 = [(VKNavContext *)&v8 init];
  v3 = v2;
  if (v2)
  {
    route = v2->_route;
    v2->_route = 0;

    v3->_unint64_t currentStepIndex = 0;
    v3->_navigationCameraHeadingOverride = 0;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v5;
  }
  return v3;
}

@end