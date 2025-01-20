@interface MFOpenWindowTriageInteraction
+ (id)interactionWithMessageListItem:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 messageList:(id)a6;
- (EMMessageList)messageList;
- (id)menuActionWithPreparation:(id)a3 completion:(id)a4;
- (void)setMessageList:(id)a3;
@end

@implementation MFOpenWindowTriageInteraction

+ (id)interactionWithMessageListItem:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 messageList:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (+[UIDevice mf_isPad])
  {
    id v16 = v10;
    v12 = +[NSArray arrayWithObjects:&v16 count:1];
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___MFOpenWindowTriageInteraction;
    v13 = [super interactionWithMessageListItems:v12 undoManager:0 origin:a4 actor:a5];

    [v13 setMessageList:v11];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)menuActionWithPreparation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MFTriageInteraction *)self messageListItemSelection];
  v9 = [v8 messageListItems];
  id v10 = [v9 firstObject];
  id v11 = [(MFOpenWindowTriageInteraction *)self messageList];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001D485C;
  v18[3] = &unk_1006051E0;
  id v12 = v6;
  v18[4] = self;
  id v19 = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001D4880;
  v16[3] = &unk_1006051E0;
  id v13 = v7;
  v16[4] = self;
  id v17 = v13;
  v14 = +[MFBayAdoption openMessageInNewWindowActionWithMessage:v10 messageList:v11 preparation:v18 completion:v16];

  return v14;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end