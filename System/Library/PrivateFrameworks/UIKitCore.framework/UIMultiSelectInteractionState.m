@interface UIMultiSelectInteractionState
- (BOOL)ignoringSelectionChangedNotifications;
- (BOOL)isInMultiselectInteraction;
- (BOOL)isSelecting;
- (BOOL)stillValidForSelectedIndexPaths:(id)a3;
- (CGPoint)startPoint;
- (NSArray)allSelectedIndexPaths;
- (NSArray)originallySelectedIndexPaths;
- (NSIndexPath)endIndexPath;
- (NSIndexPath)startIndexPath;
- (UIMultiSelectInteractionState)initWithCurrentSelection:(id)a3;
- (id)pathsToDeselectForInterpolatedIndexPaths:(id)a3 currentlySelectedIndexPaths:(id)a4;
- (id)pathsToSelectForInterpolatedIndexPaths:(id)a3;
- (void)beginMultiselectInteraction;
- (void)beginSelectingWithStartingIndexPath:(id)a3 otherSelectedIndexPaths:(id)a4 keepCurrentSelection:(BOOL)a5;
- (void)endMultiselectInteraction;
- (void)ignoreSelectionChangedNotificationsWithBlock:(id)a3;
- (void)setAllSelectedIndexPaths:(id)a3;
- (void)setEndIndexPath:(id)a3;
- (void)setOriginallySelectedIndexPaths:(id)a3;
- (void)setSelecting:(BOOL)a3;
- (void)setStartIndexPath:(id)a3;
- (void)setStartPoint:(CGPoint)a3;
- (void)updateStateWithDifferenceFromCurrentSelection:(id)a3;
- (void)updateStateWithStartingIndexPath:(id)a3 otherSelectedIndexPaths:(id)a4;
@end

@implementation UIMultiSelectInteractionState

- (UIMultiSelectInteractionState)initWithCurrentSelection:(id)a3
{
  id v4 = a3;
  v5 = [(UIMultiSelectInteractionState *)self init];
  v6 = v5;
  if (v5)
  {
    [(UIMultiSelectInteractionState *)v5 setOriginallySelectedIndexPaths:v4];
    v7 = [v4 lastObject];
    [(UIMultiSelectInteractionState *)v6 setStartIndexPath:v7];

    [(UIMultiSelectInteractionState *)v6 setSelecting:1];
  }

  return v6;
}

- (void)setOriginallySelectedIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_originallySelectedIndexPaths, a3);
  id v5 = a3;
  [(UIMultiSelectInteractionState *)self setAllSelectedIndexPaths:v5];
}

- (void)ignoreSelectionChangedNotificationsWithBlock:(id)a3
{
}

- (BOOL)ignoringSelectionChangedNotifications
{
  return self->_ignoringSelectionChangedNotificationsCounter != 0;
}

- (BOOL)stillValidForSelectedIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(UIMultiSelectInteractionState *)self allSelectedIndexPaths];
  char v6 = [v5 isEqualToArray:v4];

  return v6;
}

- (void)updateStateWithDifferenceFromCurrentSelection:(id)a3
{
  id v20 = a3;
  if (![(UIMultiSelectInteractionState *)self ignoringSelectionChangedNotifications])
  {
    id v4 = [(UIMultiSelectInteractionState *)self allSelectedIndexPaths];

    if (!v4)
    {
      [(UIMultiSelectInteractionState *)self setSelecting:1];
      v8 = [v20 lastObject];
      [(UIMultiSelectInteractionState *)self setStartIndexPath:v8];

      [(UIMultiSelectInteractionState *)self setEndIndexPath:0];
      [(UIMultiSelectInteractionState *)self setAllSelectedIndexPaths:v20];
LABEL_14:
      [(UIMultiSelectInteractionState *)self setOriginallySelectedIndexPaths:0];
      goto LABEL_15;
    }
    id v5 = [(UIMultiSelectInteractionState *)self allSelectedIndexPaths];
    char v6 = [v20 differenceFromArray:v5];

    v7 = [v6 insertions];
    if ([v7 count])
    {
    }
    else
    {
      v9 = [v6 removals];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
        [(UIMultiSelectInteractionState *)self setSelecting:1];
        v19 = [v20 lastObject];
        [(UIMultiSelectInteractionState *)self setStartIndexPath:v19];
        goto LABEL_12;
      }
    }
    v11 = [v6 insertions];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      [(UIMultiSelectInteractionState *)self setSelecting:1];
      v13 = [v6 insertions];
    }
    else
    {
      v14 = [v6 removals];
      uint64_t v15 = [v14 count];

      if (!v15)
      {
LABEL_13:

        goto LABEL_14;
      }
      [(UIMultiSelectInteractionState *)self setSelecting:0];
      v13 = [v6 removals];
    }
    v16 = v13;
    v17 = [v13 lastObject];
    v18 = [v17 object];
    [(UIMultiSelectInteractionState *)self setStartIndexPath:v18];

    v19 = [(UIMultiSelectInteractionState *)self startIndexPath];
    [(UIMultiSelectInteractionState *)self setEndIndexPath:v19];
LABEL_12:

    goto LABEL_13;
  }
LABEL_15:
}

- (void)updateStateWithStartingIndexPath:(id)a3 otherSelectedIndexPaths:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    [(UIMultiSelectInteractionState *)self setAllSelectedIndexPaths:0];
    [(UIMultiSelectInteractionState *)self setOriginallySelectedIndexPaths:0];
    -[UIMultiSelectInteractionState setSelecting:](self, "setSelecting:", [v6 containsObject:v9] ^ 1);
    [(UIMultiSelectInteractionState *)self setOriginallySelectedIndexPaths:v6];
    [(UIMultiSelectInteractionState *)self setStartIndexPath:v9];
  }
  else
  {
    v7 = [(UIMultiSelectInteractionState *)self startIndexPath];
    -[UIMultiSelectInteractionState setSelecting:](self, "setSelecting:", [v6 containsObject:v7]);
  }
  v8 = [(UIMultiSelectInteractionState *)self originallySelectedIndexPaths];

  if (!v8) {
    [(UIMultiSelectInteractionState *)self setOriginallySelectedIndexPaths:v6];
  }
}

- (void)beginSelectingWithStartingIndexPath:(id)a3 otherSelectedIndexPaths:(id)a4 keepCurrentSelection:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = self;
  if (v5)
  {
    id v10 = v8;
  }
  else
  {
    [(UIMultiSelectInteractionState *)self setAllSelectedIndexPaths:0];
    id v10 = (id)MEMORY[0x1E4F1CBF0];
    id v9 = self;
  }
  [(UIMultiSelectInteractionState *)v9 setOriginallySelectedIndexPaths:v10];
  if (v11) {
    [(UIMultiSelectInteractionState *)self setStartIndexPath:v11];
  }
  [(UIMultiSelectInteractionState *)self setSelecting:1];
}

- (id)pathsToSelectForInterpolatedIndexPaths:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = [(UIMultiSelectInteractionState *)self originallySelectedIndexPaths];
  v7 = [v4 setWithArray:v6];

  if ([(UIMultiSelectInteractionState *)self isSelecting]) {
    [v7 unionSet:v5];
  }
  else {
    [v7 minusSet:v5];
  }

  return v7;
}

- (id)pathsToDeselectForInterpolatedIndexPaths:(id)a3 currentlySelectedIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIMultiSelectInteractionState *)self pathsToSelectForInterpolatedIndexPaths:v6];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = (void *)[v7 mutableCopy];
  [v10 minusSet:v9];
  if (![(UIMultiSelectInteractionState *)self isSelecting]) {
    [v10 unionSet:v6];
  }

  return v10;
}

- (BOOL)isInMultiselectInteraction
{
  return self->_multiselectInteractionCounter != 0;
}

- (void)beginMultiselectInteraction
{
}

- (void)endMultiselectInteraction
{
  unint64_t multiselectInteractionCounter = self->_multiselectInteractionCounter;
  if (!multiselectInteractionCounter)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIMultiSelectInteractionState.m" lineNumber:172 description:@"Unable to end multiselect interaction. No interaction ongoing."];

    unint64_t multiselectInteractionCounter = self->_multiselectInteractionCounter;
  }
  self->_unint64_t multiselectInteractionCounter = multiselectInteractionCounter - 1;
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
}

- (NSIndexPath)startIndexPath
{
  return self->_startIndexPath;
}

- (void)setStartIndexPath:(id)a3
{
}

- (NSIndexPath)endIndexPath
{
  return self->_endIndexPath;
}

- (void)setEndIndexPath:(id)a3
{
}

- (BOOL)isSelecting
{
  return self->_selecting;
}

- (void)setSelecting:(BOOL)a3
{
  self->_selecting = a3;
}

- (NSArray)originallySelectedIndexPaths
{
  return self->_originallySelectedIndexPaths;
}

- (NSArray)allSelectedIndexPaths
{
  return self->_allSelectedIndexPaths;
}

- (void)setAllSelectedIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSelectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_originallySelectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_endIndexPath, 0);
  objc_storeStrong((id *)&self->_startIndexPath, 0);
}

@end