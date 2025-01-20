@interface MFMoreTriageInteraction
+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6;
+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 interactionStyle:(unint64_t)a7;
+ (id)log;
- (BOOL)shouldDelayContextualActionHandlerCompletion;
- (BOOL)supportsSelectAll;
- (EFFuture)displayMessage;
- (id)_iconImageName;
- (id)color;
- (id)title;
- (unint64_t)style;
- (void)_dispatchInteractionWithCompletion:(id)a3;
- (void)setDisplayMessage:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation MFMoreTriageInteraction

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C9240;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699BD0 != -1) {
    dispatch_once(&qword_100699BD0, block);
  }
  v2 = (void *)qword_100699BC8;

  return v2;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  v6 = +[MFMoreTriageInteraction interactionWithMessageListItems:a3 undoManager:a4 origin:a5 actor:a6 interactionStyle:0];

  return v6;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6 interactionStyle:(unint64_t)a7
{
  id v11 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___MFMoreTriageInteraction;
  v12 = [super interactionWithMessageListItems:v11 undoManager:0 origin:a5 actor:a6];
  v13 = [v11 firstObject];
  v14 = [v13 displayMessage];
  [v12 setDisplayMessage:v14];

  [v12 setStyle:a7];

  return v12;
}

- (void)_dispatchInteractionWithCompletion:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(MFMoreTriageInteraction *)self displayMessage];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_1001C9538;
  v10 = &unk_10060C808;
  objc_copyWeak(&v13, &location);
  id v11 = self;
  id v6 = v4;
  id v12 = v6;
  [v5 addSuccessBlock:&v7];
  [v5 addFailureBlock:&stru_10060C828 v7, v8, v9, v10, v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)title
{
  unint64_t v2 = [(MFMoreTriageInteraction *)self style];
  if (v2 == 1)
  {
    v3 = +[NSBundle mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"REPLY" value:&stru_100619928 table:@"Main"];
    goto LABEL_5;
  }
  if (!v2)
  {
    v3 = +[NSBundle mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"SWIPE_MORE" value:&stru_100619928 table:@"Main"];
LABEL_5:
    v5 = (void *)v4;

    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (id)_iconImageName
{
  unint64_t v2 = [(MFMoreTriageInteraction *)self style];
  if (!v2)
  {
    v3 = (id *)&MFImageGlyphMessageListMore;
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    v3 = (id *)&MFImageGlyphReplyFill;
LABEL_5:
    id v4 = *v3;
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (id)color
{
  unint64_t v3 = [(MFMoreTriageInteraction *)self style];
  if (v3 == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFMoreTriageInteraction;
    id v4 = [(MFTriageInteraction *)&v6 color];
  }
  else if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = +[UIColor mailMoreButtonGrayColor];
  }

  return v4;
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (BOOL)shouldDelayContextualActionHandlerCompletion
{
  return 1;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
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