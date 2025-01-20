@interface SBSwitcherModifierTimelineEntry
- (SBSwitcherModifierEventResponseSnapshot)responseSnapshot;
- (SBSwitcherModifierEventSnapshot)eventSnapshot;
- (SBSwitcherModifierStackSnapshot)stackSnapshotAfterEvent;
- (SBSwitcherModifierTimelineEntry)initWithEventSnapshot:(id)a3 responseSnapshot:(id)a4 stackSnapshotAfterEvent:(id)a5;
@end

@implementation SBSwitcherModifierTimelineEntry

- (SBSwitcherModifierTimelineEntry)initWithEventSnapshot:(id)a3 responseSnapshot:(id)a4 stackSnapshotAfterEvent:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSwitcherModifierTimelineEntry.m", 40, @"Invalid parameter not satisfying: %@", @"eventSnapshot" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SBSwitcherModifierTimelineEntry.m", 41, @"Invalid parameter not satisfying: %@", @"stackSnapshotAfterEvent" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SBSwitcherModifierTimelineEntry;
  v14 = [(SBSwitcherModifierTimelineEntry *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventSnapshot, a3);
    objc_storeStrong((id *)&v15->_responseSnapshot, a4);
    objc_storeStrong((id *)&v15->_stackSnapshotAfterEvent, a5);
  }

  return v15;
}

- (SBSwitcherModifierEventSnapshot)eventSnapshot
{
  return self->_eventSnapshot;
}

- (SBSwitcherModifierStackSnapshot)stackSnapshotAfterEvent
{
  return self->_stackSnapshotAfterEvent;
}

- (SBSwitcherModifierEventResponseSnapshot)responseSnapshot
{
  return self->_responseSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseSnapshot, 0);
  objc_storeStrong((id *)&self->_stackSnapshotAfterEvent, 0);
  objc_storeStrong((id *)&self->_eventSnapshot, 0);
}

@end