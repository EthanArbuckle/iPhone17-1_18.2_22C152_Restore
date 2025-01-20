@interface _UIEstimatedTouchRecord
- (BOOL)hasRemainingUpdates;
- (NSArray)touchables;
- (NSNumber)contextID;
- (UITouch)frozenTouch;
- (UITouch)liveTouch;
- (_UIEstimatedTouchRecord)initWithLiveTouch:(id)a3 freezeTouch:(id)a4 contextID:(id)a5;
- (void)_dispatchWithCurrentUpdates;
- (void)addTouchable:(id)a3;
- (void)dispatchUpdateWithPressure:(double)a3 stillEstimated:(BOOL)a4;
- (void)dispatchUpdateWithRollAngle:(double)a3 stillEstimated:(BOOL)a4;
- (void)removeTouchable:(id)a3;
@end

@implementation _UIEstimatedTouchRecord

- (_UIEstimatedTouchRecord)initWithLiveTouch:(id)a3 freezeTouch:(id)a4 contextID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIEstimatedTouchRecord;
  v12 = [(_UIEstimatedTouchRecord *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_liveTouch, a3);
    objc_storeStrong((id *)&v13->_frozenTouch, a4);
    objc_storeStrong((id *)&v13->_contextID, a5);
    *(unsigned char *)&v13->_stateFlags = *(unsigned char *)&v13->_stateFlags & 0xFE | [v10 estimatedPropertiesExpectingUpdates] & 1;
    *(unsigned char *)&v13->_stateFlags = ([v10 estimatedPropertiesExpectingUpdates] >> 1) & 8 | *(unsigned char *)&v13->_stateFlags & 0xF7;
  }

  return v13;
}

- (void)addTouchable:(id)a3
{
  id v4 = a3;
  touchables = self->_touchables;
  id v8 = v4;
  if (!touchables)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_touchables;
    self->_touchables = v6;

    id v4 = v8;
    touchables = self->_touchables;
  }
  [(NSMutableArray *)touchables addObject:v4];
}

- (void)removeTouchable:(id)a3
{
}

- (BOOL)hasRemainingUpdates
{
  char stateFlags = (char)self->_stateFlags;
  int v3 = stateFlags & 3;
  BOOL v4 = (stateFlags & 8) != 0 && (stateFlags & 0x10) == 0;
  return v3 == 1 || v4;
}

- (void)_dispatchWithCurrentUpdates
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v3 = [(UITouch *)self->_liveTouch _clone];
  [(UITouch *)self->_frozenTouch _clonePropertiesToTouch:self->_liveTouch];
  char stateFlags = (char)self->_stateFlags;
  liveTouch = self->_liveTouch;
  if ((stateFlags & 2) != 0)
  {
    if (liveTouch)
    {
      double updatedPressure = self->_updatedPressure;
      double maxObservedPressure = liveTouch->_maxObservedPressure;
      if (maxObservedPressure < updatedPressure) {
        double maxObservedPressure = self->_updatedPressure;
      }
      liveTouch->_previousPressure = liveTouch->_pressure;
      liveTouch->_pressure = updatedPressure;
      liveTouch->_double maxObservedPressure = maxObservedPressure;
      id v8 = self->_liveTouch;
      if (v8 && (v8->_hasForceUpdate = 1, (id v9 = self->_liveTouch) != 0))
      {
        v9->_needsForceUpdate = ((*(unsigned char *)&self->_stateFlags >> 2) & 1) == 0;
        liveTouch = self->_liveTouch;
      }
      else
      {
        liveTouch = 0;
      }
    }
    char stateFlags = (char)self->_stateFlags;
  }
  if ((stateFlags & 0x10) != 0)
  {
    -[UITouch _setRollAngle:resetPrevious:]((uint64_t)liveTouch, 0, self->_updatedRollAngle);
    id v10 = self->_liveTouch;
    if (v10 && (v10->_hasRollUpdate = 1, (id v11 = self->_liveTouch) != 0))
    {
      v11->_needsRollUpdate = ((*(unsigned char *)&self->_stateFlags >> 5) & 1) == 0;
      liveTouch = self->_liveTouch;
    }
    else
    {
      liveTouch = 0;
    }
  }
  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:liveTouch];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = self->_touchables;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "touchesEstimatedPropertiesUpdated:", v12, (void)v18);
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  [v3 _clonePropertiesToTouch:self->_liveTouch];
}

- (void)dispatchUpdateWithPressure:(double)a3 stillEstimated:(BOOL)a4
{
  char stateFlags = (char)self->_stateFlags;
  self->_double updatedPressure = a3;
  char v6 = stateFlags & 0xF9;
  if (a4) {
    char v7 = 6;
  }
  else {
    char v7 = 2;
  }
  *(unsigned char *)&self->_char stateFlags = v7 | v6;
  if (![(_UIEstimatedTouchRecord *)self hasRemainingUpdates])
  {
    [(_UIEstimatedTouchRecord *)self _dispatchWithCurrentUpdates];
  }
}

- (void)dispatchUpdateWithRollAngle:(double)a3 stillEstimated:(BOOL)a4
{
  char stateFlags = (char)self->_stateFlags;
  self->_updatedRollAngle = a3;
  char v6 = stateFlags & 0xCF;
  if (a4) {
    char v7 = 48;
  }
  else {
    char v7 = 16;
  }
  *(unsigned char *)&self->_char stateFlags = v7 | v6;
  if (![(_UIEstimatedTouchRecord *)self hasRemainingUpdates])
  {
    [(_UIEstimatedTouchRecord *)self _dispatchWithCurrentUpdates];
  }
}

- (UITouch)liveTouch
{
  return self->_liveTouch;
}

- (UITouch)frozenTouch
{
  return self->_frozenTouch;
}

- (NSArray)touchables
{
  return &self->_touchables->super;
}

- (NSNumber)contextID
{
  return self->_contextID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_frozenTouch, 0);
  objc_storeStrong((id *)&self->_liveTouch, 0);
  objc_storeStrong((id *)&self->_touchables, 0);
}

@end