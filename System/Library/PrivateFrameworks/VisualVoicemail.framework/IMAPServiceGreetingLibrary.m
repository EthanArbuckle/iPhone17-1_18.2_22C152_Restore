@interface IMAPServiceGreetingLibrary
- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6 remoteIDs:(id)a7 setFlags:(unint64_t)a8 clearFlags:(unint64_t)a9 messageFlagsForMessages:(id)a10 copyFiles:(BOOL)a11 addPOPUIDs:(BOOL)a12 dataSectionsByMessage:(id)a13;
- (id)messages;
- (void)dealloc;
- (void)resetMessages;
@end

@implementation IMAPServiceGreetingLibrary

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IMAPServiceGreetingLibrary;
  [(IMAPServiceGreetingLibrary *)&v2 dealloc];
}

- (id)addMessages:(id)a3 withMailbox:(id)a4 fetchBodies:(BOOL)a5 newMessagesByOldMessage:(id)a6 remoteIDs:(id)a7 setFlags:(unint64_t)a8 clearFlags:(unint64_t)a9 messageFlagsForMessages:(id)a10 copyFiles:(BOOL)a11 addPOPUIDs:(BOOL)a12 dataSectionsByMessage:(id)a13
{
  id v14 = a3;
  [(IMAPServiceGreetingLibrary *)self mf_lock];
  messages = self->_messages;
  if (messages)
  {
    [(NSMutableArray *)messages addObjectsFromArray:v14];
  }
  else
  {
    v16 = (NSMutableArray *)[v14 mutableCopy];
    v17 = self->_messages;
    self->_messages = v16;
  }
  [(IMAPServiceGreetingLibrary *)self mf_unlock];
  return v14;
}

- (void)resetMessages
{
  [(IMAPServiceGreetingLibrary *)self mf_lock];
  messages = self->_messages;
  self->_messages = 0;

  [(IMAPServiceGreetingLibrary *)self mf_unlock];
}

- (id)messages
{
  [(IMAPServiceGreetingLibrary *)self mf_lock];
  id v3 = [(NSMutableArray *)self->_messages copy];
  [(IMAPServiceGreetingLibrary *)self mf_unlock];
  return v3;
}

- (void).cxx_destruct
{
}

@end