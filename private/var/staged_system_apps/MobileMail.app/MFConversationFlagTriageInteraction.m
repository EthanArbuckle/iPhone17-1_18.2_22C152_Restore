@interface MFConversationFlagTriageInteraction
+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
+ (id)interactionWithReferenceMessage:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
- (EFFuture)displayMessage;
- (EMMessage)referenceMessage;
- (void)setDisplayMessage:(id)a3;
@end

@implementation MFConversationFlagTriageInteraction

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v10 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___MFConversationFlagTriageInteraction;
  v11 = [super interactionWithMessageListItemSelection:v10 undoManager:a4 origin:a5 actor:a6 reason:4];
  if (([v10 isSelectAll] & 1) == 0)
  {
    v12 = [v10 messageListItems];
    v13 = [v12 firstObject];
    v14 = [v13 displayMessage];
    [v11 setDisplayMessage:v14];
  }

  return v11;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [objc_alloc((Class)MSMessageListItemSelection) initWithMessageListItems:v10];
  v13 = [a1 interactionWithMessageListItemSelection:v12 undoManager:v11 origin:a5 actor:a6];

  return v13;
}

+ (id)interactionWithReferenceMessage:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v15 = v10;
  id v12 = +[NSArray arrayWithObjects:&v15 count:1];
  v13 = [a1 interactionWithMessageListItems:v12 undoManager:v11 origin:a5 actor:a6];

  return v13;
}

- (EMMessage)referenceMessage
{
  v2 = [(MFConversationFlagTriageInteraction *)self displayMessage];
  v3 = [v2 result];

  return (EMMessage *)v3;
}

- (EFFuture)displayMessage
{
  return self->_displayMessage;
}

- (void)setDisplayMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end