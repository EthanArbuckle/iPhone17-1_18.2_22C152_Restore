@interface SBSwitcherModifierEventSnapshot
- (NSString)eventDescription;
- (NSString)eventName;
- (SBSwitcherModifierEventSnapshot)initWithEvent:(id)a3;
@end

@implementation SBSwitcherModifierEventSnapshot

- (SBSwitcherModifierEventSnapshot)initWithEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"SBSwitcherModifierTimelineEntry.m", 58, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)SBSwitcherModifierEventSnapshot;
  v6 = [(SBSwitcherModifierEventSnapshot *)&v38 init];
  if (v6)
  {
    if ([v5 isTransitionEvent])
    {
      v7 = NSString;
      uint64_t v8 = SBStringFromTransitionPhase([v5 phase]);
    }
    else
    {
      if (![v5 isGestureEvent])
      {
        if ([v5 type] == 15)
        {
          v28 = NSString;
          eventName = [v5 reason];
          [v28 stringWithFormat:@"Timer: %@", eventName];
        }
        else
        {
          if ([v5 type] != 24)
          {
            uint64_t v35 = NSStringFromSBSwitcherModifierEventType([v5 type]);
            eventName = v6->_eventName;
            v6->_eventName = (NSString *)v35;
            goto LABEL_9;
          }
          v29 = [v5 appLayout];
          v30 = [v29 itemForLayoutRole:1];
          eventName = [v30 uniqueIdentifier];

          if ([eventName hasPrefix:@"sceneID:"])
          {
            uint64_t v31 = [eventName substringFromIndex:8];

            eventName = (void *)v31;
          }
          if ([eventName hasPrefix:@"com.apple."])
          {
            uint64_t v32 = [eventName substringFromIndex:10];

            eventName = (void *)v32;
          }
          [NSString stringWithFormat:@"SceneReady: %@", eventName];
        uint64_t v33 = };
        v34 = v6->_eventName;
        v6->_eventName = (NSString *)v33;

LABEL_9:
        uint64_t v13 = [v5 description];
        eventDescription = v6->_eventDescription;
        v6->_eventDescription = (NSString *)v13;

        uint64_t v15 = objc_opt_class();
        v16 = SBSafeCast(v15, v5);
        v17 = v16;
        if (v16)
        {
          v37 = v6->_eventDescription;
          v18 = [v16 fromAppLayout];
          v19 = [v17 toAppLayout];
          v20 = [v17 fromFloatingAppLayout];
          v21 = [v17 toFloatingAppLayout];
          v22 = [v17 fromShelf];
          v23 = [v17 toShelf];
          v24 = [v17 debugPredicateSummary];
          uint64_t v25 = [(NSString *)v37 stringByAppendingFormat:@"\n\nfromAppLayout:\n%@\n\ntoAppLayout:\n%@\n\nfromFloatingAppLayout:\n%@\n\ntoFloatingAppLayout:\n%@\n\nfromShelf:\n%@\n\ntoShelf:\n%@\n\nPredicate Summary:\n%@", v18, v19, v20, v21, v22, v23, v24];
          v26 = v6->_eventDescription;
          v6->_eventDescription = (NSString *)v25;
        }
        goto LABEL_12;
      }
      v7 = NSString;
      uint64_t v8 = SBStringFromGesturePhase([v5 phase]);
    }
    eventName = (void *)v8;
    v10 = NSStringFromSBSwitcherModifierEventType([v5 type]);
    uint64_t v11 = [v7 stringWithFormat:@"%@ %@", eventName, v10];
    v12 = v6->_eventName;
    v6->_eventName = (NSString *)v11;

    goto LABEL_9;
  }
LABEL_12:

  return v6;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end