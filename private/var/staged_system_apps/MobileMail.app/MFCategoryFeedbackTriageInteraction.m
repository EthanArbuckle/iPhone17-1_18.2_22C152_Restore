@interface MFCategoryFeedbackTriageInteraction
+ (id)interactionWithMessageListItemSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 bucket:(int64_t)a6;
- (BOOL)isRecategorizationAction;
- (BOOL)shouldFileRadar;
- (id)_previewImageName;
- (id)cardActionWithCompletion:(id)a3;
- (id)radarContent;
- (id)title;
- (id)triageAction;
- (void)setTriageAction:(id)a3;
@end

@implementation MFCategoryFeedbackTriageInteraction

+ (id)interactionWithMessageListItemSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 bucket:(int64_t)a6
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___MFCategoryFeedbackTriageInteraction;
  v7 = [super interactionWithMessageListItemSelection:a3 undoManager:0 origin:a4 actor:a5];
  [v7 setBucket:a6];
  [v7 setChangeOptions:0];

  return v7;
}

- (id)title
{
  return (id)_EFLocalizedStringFromTable();
}

- (id)cardActionWithCompletion:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MFCategoryFeedbackTriageInteraction;
  v4 = [(MFCategoryTriageInteraction *)&v14 cardActionWithCompletion:a3];
  v5 = [(MFTriageInteraction *)self messageListItemSelection];
  v6 = [v5 messageListItems];
  v7 = [v6 firstObject];
  v8 = [v7 category];
  [v8 type];
  uint64_t v9 = MUIBucketFromEMCategoryType();

  v10 = [v4 children];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10017EB34;
  v13[3] = &unk_10060AE68;
  v13[4] = v9;
  v11 = [v10 ef_filter:v13];
  [v4 setChildren:v11];

  return v4;
}

- (id)_previewImageName
{
  return MFImageGlyphTapToRadar;
}

- (BOOL)shouldFileRadar
{
  return 1;
}

- (id)radarContent
{
  [(MFCategoryTriageInteraction *)self bucket];
  v2 = MUIStringFromBucket();
  v3 = +[NSString stringWithFormat:@"Moved one message to %@.", v2];

  v4 = +[EFPair pairWithFirst:@"[BlackPearl] Category feedback for one message" second:v3];

  return v4;
}

- (BOOL)isRecategorizationAction
{
  return 0;
}

- (id)triageAction
{
  triageAction = self->_triageAction;
  if (!triageAction)
  {
    id v4 = objc_alloc((Class)MSCategoryFeedbackTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    int64_t v6 = [(MFTriageInteraction *)self origin];
    int64_t v7 = [(MFTriageInteraction *)self actor];
    [(MFCategoryTriageInteraction *)self bucket];
    v8 = [v4 initWithMessageListSelection:v5 origin:v6 actor:v7 delegate:0 categoryType:EMCategoryTypeForBucket() changeOptions:[self changeOptions]];
    uint64_t v9 = self->_triageAction;
    self->_triageAction = v8;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (void)setTriageAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end