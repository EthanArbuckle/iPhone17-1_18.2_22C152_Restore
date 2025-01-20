@interface MFTriageInteractionTarget
- (BOOL)preferQuickCompositionalActions;
- (EMMessage)primaryMessage;
- (EMMessageListItem)messageListItem;
- (MFTriageInteractionTarget)initWithMessageListItem:(id)a3 primaryMessage:(id)a4 selectedMessageContent:(id)a5 primaryMessageContentRequest:(id)a6 targetPreference:(int64_t)a7 preferQuickCompositionalActions:(BOOL)a8;
- (MessageContentRepresentationRequest)primaryMessageContentRequest;
- (NSArray)selectedMessageContent;
- (NSArray)targetedMessages;
- (int64_t)targetPreference;
- (void)setMessageListItem:(id)a3;
- (void)setPreferQuickCompositionalActions:(BOOL)a3;
- (void)setPrimaryMessage:(id)a3;
- (void)setPrimaryMessageContentRequest:(id)a3;
- (void)setSelectedMessageContent:(id)a3;
- (void)setTargetPreference:(int64_t)a3;
@end

@implementation MFTriageInteractionTarget

- (MFTriageInteractionTarget)initWithMessageListItem:(id)a3 primaryMessage:(id)a4 selectedMessageContent:(id)a5 primaryMessageContentRequest:(id)a6 targetPreference:(int64_t)a7 preferQuickCompositionalActions:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"MFTriageInteractionTarget.m", 25, @"Invalid parameter not satisfying: %@", @"messageListItem" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v25 = +[NSAssertionHandler currentHandler];
  [v25 handleFailureInMethod:a2, self, @"MFTriageInteractionTarget.m", 26, @"Invalid parameter not satisfying: %@", @"primaryMessage" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)MFTriageInteractionTarget;
  v19 = [(MFTriageInteractionTarget *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_messageListItem, a3);
    objc_storeStrong((id *)&v20->_primaryMessage, a4);
    v21 = (NSArray *)[v17 copy];
    selectedMessageContent = v20->_selectedMessageContent;
    v20->_selectedMessageContent = v21;

    objc_storeStrong((id *)&v20->_primaryMessageContentRequest, a6);
    v20->_targetPreference = a7;
    v20->_preferQuickCompositionalActions = a8;
  }

  return v20;
}

- (NSArray)targetedMessages
{
  if ((id)[(MFTriageInteractionTarget *)self targetPreference] == (id)1)
  {
    v3 = [(MFTriageInteractionTarget *)self messageListItem];
    v11 = v3;
    uint64_t v4 = +[NSArray arrayWithObjects:&v11 count:1];
LABEL_5:
    v6 = (void *)v4;
    goto LABEL_6;
  }
  uint64_t v5 = [(MFTriageInteractionTarget *)self primaryMessage];
  v3 = (void *)v5;
  if (v5)
  {
    uint64_t v10 = v5;
    uint64_t v4 = +[NSArray arrayWithObjects:&v10 count:1];
    goto LABEL_5;
  }
  v8 = [(MFTriageInteractionTarget *)self messageListItem];
  v9 = v8;
  v6 = +[NSArray arrayWithObjects:&v9 count:1];

LABEL_6:

  return (NSArray *)v6;
}

- (EMMessageListItem)messageListItem
{
  return self->_messageListItem;
}

- (void)setMessageListItem:(id)a3
{
}

- (EMMessage)primaryMessage
{
  return self->_primaryMessage;
}

- (void)setPrimaryMessage:(id)a3
{
}

- (NSArray)selectedMessageContent
{
  return self->_selectedMessageContent;
}

- (void)setSelectedMessageContent:(id)a3
{
}

- (MessageContentRepresentationRequest)primaryMessageContentRequest
{
  return self->_primaryMessageContentRequest;
}

- (void)setPrimaryMessageContentRequest:(id)a3
{
}

- (int64_t)targetPreference
{
  return self->_targetPreference;
}

- (void)setTargetPreference:(int64_t)a3
{
  self->_targetPreference = a3;
}

- (BOOL)preferQuickCompositionalActions
{
  return self->_preferQuickCompositionalActions;
}

- (void)setPreferQuickCompositionalActions:(BOOL)a3
{
  self->_preferQuickCompositionalActions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryMessageContentRequest, 0);
  objc_storeStrong((id *)&self->_selectedMessageContent, 0);
  objc_storeStrong((id *)&self->_primaryMessage, 0);

  objc_storeStrong((id *)&self->_messageListItem, 0);
}

@end