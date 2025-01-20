@interface MFDestructiveTriageInteraction
+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
+ (unint64_t)deleteOrArchive;
- (BOOL)isMessageListItemSelectionSourceTrash;
- (BOOL)supportsSelectAll;
- (id)triageAction;
- (id)updateReason;
- (int64_t)type;
- (void)setTriageAction:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MFDestructiveTriageInteraction

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v10 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___MFDestructiveTriageInteraction;
  v11 = [super interactionWithMessageListItemSelection:v10 undoManager:a4 origin:a5 actor:a6];
  if ([v10 isSelectAll]) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 0;
  }
  [v11 setType:v12];

  return v11;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MFDestructiveTriageInteraction;
  v6 = [super interactionWithMessageListItems:a3, a4, a5, a6];
  [v6 setType:0];

  return v6;
}

- (id)triageAction
{
  if (!self->_triageAction)
  {
    id v3 = [(id)objc_opt_class() deleteOrArchive];
    if (v3 == (id)1) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 2;
    }
    if (v3 == (id)1
      && [(MFDestructiveTriageInteraction *)self isMessageListItemSelectionSourceTrash])
    {
      id v5 = objc_alloc((Class)MSDeleteTriageAction);
      v6 = [(MFTriageInteraction *)self messageListItemSelection];
      v7 = [v5 initWithMessageListSelection:v6 origin:[self origin] actor:[self actor] delegate:self];
      triageAction = self->_triageAction;
      self->_triageAction = v7;
    }
    else
    {
      v6 = +[ECMessageFlagChange setRead];
      v9 = [(MFTriageInteraction *)self query];

      id v10 = objc_alloc((Class)MSMoveTriageAction);
      if (v9)
      {
        triageAction = [(MFTriageInteraction *)self query];
        LOBYTE(v15) = 0;
        v11 = [v10 initWithQuery:triageAction origin:[self origin] actor:[self actor] delegate:self destinationMailboxType:v4 flagChange:v6 copyMessages:v15];
      }
      else
      {
        triageAction = [(MFTriageInteraction *)self messageListItemSelection];
        LOBYTE(v15) = 0;
        v11 = [v10 initWithMessageListSelection:triageAction origin:[self origin] actor:[self actor] delegate:self destinationMailboxType:v4 flagChange:v6 copyMessages:v15];
      }
      uint64_t v12 = self->_triageAction;
      self->_triageAction = v11;
    }
  }
  v13 = self->_triageAction;

  return v13;
}

- (BOOL)supportsSelectAll
{
  return 1;
}

- (id)updateReason
{
  return @"destructiveChangeHappened";
}

- (BOOL)isMessageListItemSelectionSourceTrash
{
  id v3 = [(MFTriageInteraction *)self messageListItemSelection];
  unsigned int v4 = [v3 isSelectAll];

  id v5 = [(MFTriageInteraction *)self messageListItemSelection];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 mailboxes];
    LOBYTE(v8) = [v7 ef_all:&stru_10060B4E8];
  }
  else
  {
    v9 = [v5 messageListItems];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100192120;
    v11[3] = &unk_10060B510;
    uint64_t v12 = &stru_10060B4C8;
    int v8 = [v9 ef_all:v11];
  }
  return v8;
}

+ (unint64_t)deleteOrArchive
{
  return 0;
}

- (void)setTriageAction:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end