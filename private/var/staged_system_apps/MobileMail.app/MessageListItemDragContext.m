@interface MessageListItemDragContext
+ (BOOL)dragItemsAreAllMessageListItems:(id)a3;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)withItem:(id)a3 messageList:(id)a4;
- (EMMessageList)messageList;
- (EMMessageListItem)messageListItem;
- (MessageListItemDragContext)initWithItem:(id)a3 messageList:(id)a4;
- (NSItemProvider)itemProvider;
- (NSString)visibleSubjectString;
- (UIDragItem)dragItem;
- (id)_loadDisplayMessageContentWithCompletion:(id)a3;
- (id)_loadDisplayMessageDataWithCompletion:(id)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (void)setVisibleSubjectString:(id)a3;
@end

@implementation MessageListItemDragContext

+ (id)withItem:(id)a3 messageList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[MessageListItemDragContext alloc] initWithItem:v5 messageList:v6];

  return v7;
}

+ (BOOL)dragItemsAreAllMessageListItems:(id)a3
{
  return [a3 ef_all:&stru_1006093D8];
}

- (MessageListItemDragContext)initWithItem:(id)a3 messageList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MessageListItemDragContext;
  v9 = [(MessageListItemDragContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageListItem, a3);
    objc_storeStrong((id *)&v10->_messageList, a4);
  }

  return v10;
}

- (UIDragItem)dragItem
{
  id v3 = objc_alloc((Class)UIDragItem);
  v4 = [(MessageListItemDragContext *)self itemProvider];
  id v5 = [v3 initWithItemProvider:v4];

  return (UIDragItem *)v5;
}

- (NSItemProvider)itemProvider
{
  id v3 = [objc_alloc((Class)NSItemProvider) initWithObject:self];
  v4 = [(MessageListItemDragContext *)self visibleSubjectString];
  [v3 setSuggestedName:v4];

  id v5 = [(MessageListItemDragContext *)self messageListItem];
  id v6 = [v5 flags];
  unsigned int v7 = [v6 draft];

  if (v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10013B0DC;
    v15[3] = &unk_100609428;
    v15[4] = self;
    [v3 registerObjectOfClass:objc_opt_class() visibility:1 loadHandler:v15];
  }
  else
  {
    id v8 = [(MessageListItemDragContext *)self messageList];

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10013B344;
      v14[3] = &unk_100605CC0;
      v14[4] = self;
      v9 = +[ConversationViewRestorationState stateWithBuilder:v14];
      if (v9)
      {
        uint64_t v10 = objc_opt_class();
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10013B424;
        v12[3] = &unk_100609450;
        v12[4] = self;
        id v13 = v9;
        [v3 registerObjectOfClass:v10 visibility:1 loadHandler:v12];
      }
    }
  }

  return (NSItemProvider *)v3;
}

- (NSString)visibleSubjectString
{
  visibleSubjectString = self->_visibleSubjectString;
  if (!visibleSubjectString)
  {
    v4 = [(MessageListItemDragContext *)self messageListItem];
    id v5 = [v4 subject];

    if ([v5 length])
    {
      id v6 = [v5 subjectString];
      unsigned int v7 = self->_visibleSubjectString;
      self->_visibleSubjectString = v6;
    }
    else
    {
      unsigned int v7 = +[NSBundle mainBundle];
      id v8 = [v7 localizedStringForKey:@"NO_SUBJECT" value:&stru_100619928 table:@"Main"];
      v9 = self->_visibleSubjectString;
      self->_visibleSubjectString = v8;
    }
    visibleSubjectString = self->_visibleSubjectString;
  }

  return visibleSubjectString;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v2 = +[NSMutableArray array];
  [v2 addObject:@"com.apple.mobilemail.internalEMMessageListItemTransfer"];
  id v3 = +[EMMessage externalDataTypeIdentifiers];
  [v2 addObjectsFromArray:v3];

  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[UTType typeWithIdentifier:v6];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10013BA94;
  v24[3] = &unk_100609478;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v25 = v8;
  v9 = objc_retainBlock(v24);
  if ([v8 conformsToType:UTTypeEmailMessage])
  {
    uint64_t v10 = [(MessageListItemDragContext *)self _loadDisplayMessageDataWithCompletion:v7];
  }
  else
  {
    if ([v8 conformsToType:UTTypeURL])
    {
      v11 = [(MessageListItemDragContext *)self messageListItem];
      objc_super v12 = [v11 subject];

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10013BBB0;
      v20[3] = &unk_1006094A0;
      id v23 = v7;
      id v21 = v12;
      id v22 = v6;
      id v13 = v12;
      uint64_t v10 = [(MessageListItemDragContext *)self _loadDisplayMessageContentWithCompletion:v20];
    }
    else
    {
      v14 = objc_opt_new();
      int v15 = ((uint64_t (*)(void *, void *))v9[2])(v9, v14);

      if (v15)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10013BCB4;
        v17[3] = &unk_1006094A0;
        id v19 = v7;
        v17[4] = self;
        id v18 = v6;
        uint64_t v10 = [(MessageListItemDragContext *)self _loadDisplayMessageContentWithCompletion:v17];

        id v13 = v19;
      }
      else
      {
        id v13 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        uint64_t v10 = 0;
        (*((void (**)(id, void, id))v7 + 2))(v7, 0, v13);
      }
    }
  }

  return v10;
}

- (id)_loadDisplayMessageContentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[EMContentRequestOptions optionsWithRequestedRepresentationType:EMContentRepresentationTypeRaw networkUsage:2];
  id v6 = [(MessageListItemDragContext *)self messageListItem];
  id v7 = [v6 displayMessage];
  id v8 = [v7 result];
  v9 = [v8 requestRepresentationWithOptions:v5 completionHandler:v4];

  return v9;
}

- (id)_loadDisplayMessageDataWithCompletion:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10013C054;
  v7[3] = &unk_1006094C8;
  id v8 = a3;
  id v4 = v8;
  id v5 = [(MessageListItemDragContext *)self _loadDisplayMessageContentWithCompletion:v7];

  return v5;
}

- (EMMessageListItem)messageListItem
{
  return self->_messageListItem;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setVisibleSubjectString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleSubjectString, 0);
  objc_storeStrong((id *)&self->_messageList, 0);

  objc_storeStrong((id *)&self->_messageListItem, 0);
}

@end