@interface NoteObject
- (void)undoablyMoveToTrashWithActionName:(id)a3;
- (void)undoablyUndeleteTo:(id)a3 actionName:(id)a4;
@end

@implementation NoteObject

- (void)undoablyMoveToTrashWithActionName:(id)a3
{
  id v8 = a3;
  v4 = +[ICAppDelegate sharedInstance];
  v5 = [v4 undoManager];

  if (([(NoteObject *)self isMarkedForDeletion] & 1) == 0)
  {
    [(NoteObject *)self markForDeletion];
    v6 = [v5 prepareWithInvocationTarget:self];
    v7 = [(NoteObject *)self store];
    [v6 undoablyUndeleteTo:v7 actionName:v8];
  }
}

- (void)undoablyUndeleteTo:(id)a3 actionName:(id)a4
{
  id v11 = a4;
  v5 = +[ICAppDelegate sharedInstance];
  v6 = [v5 undoManager];

  uint64_t v7 = [(NoteObject *)self managedObjectContext];
  if (v7)
  {
    id v8 = (void *)v7;
    unsigned int v9 = [(NoteObject *)self isMarkedForDeletion];

    if (v9)
    {
      v10 = [v6 prepareWithInvocationTarget:self];
      [v10 undoablyMoveToTrashWithActionName:v11];
    }
  }
}

@end