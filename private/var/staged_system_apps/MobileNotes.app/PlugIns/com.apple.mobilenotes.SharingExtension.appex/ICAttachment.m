@interface ICAttachment
- (void)undoablySetTitle:(id)a3 isUserDefined:(BOOL)a4;
@end

@implementation ICAttachment

- (void)undoablySetTitle:(id)a3 isUserDefined:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  v6 = +[NSUndoManager shared];
  v7 = [v6 prepareWithInvocationTarget:self];
  v8 = [(ICAttachment *)self title];
  [v7 undoablySetTitle:v8 isUserDefined:v4];

  v9 = +[NSUndoManager shared];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Set Attachment Name" value:&stru_1000F2510 table:0];
  [v9 setActionName:v11];

  [(ICAttachment *)self setTitle:v17];
  if (v4) {
    [(ICAttachment *)self setUserTitle:v17];
  }
  [(ICAttachment *)self updateChangeCountWithReason:@"Set attachment title"];
  [(ICAttachment *)self attachmentDidChange];
  v12 = [(ICAttachment *)self note];
  unsigned int v13 = [v12 regenerateTitle:1 snippet:0];

  if (v13)
  {
    v14 = [(ICAttachment *)self note];
    [v14 markShareDirtyIfNeededWithReason:@"Set attachment title"];

    v15 = [(ICAttachment *)self note];
    [v15 updateChangeCountWithReason:@"Set attachment title"];
  }
  v16 = [(ICAttachment *)self managedObjectContext];
  [v16 ic_saveWithLogDescription:@"Set attachment title"];
}

@end