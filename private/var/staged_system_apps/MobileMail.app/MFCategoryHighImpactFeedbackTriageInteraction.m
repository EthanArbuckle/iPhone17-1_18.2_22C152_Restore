@interface MFCategoryHighImpactFeedbackTriageInteraction
+ (id)interactionWithMessageListItemSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5;
- (BOOL)isHighImpact;
- (BOOL)isRecategorizationAction;
- (BOOL)shouldFileRadar;
- (id)_previewImageName;
- (id)cardActionWithCompletion:(id)a3;
- (id)extraLogging;
- (id)radarContent;
- (id)title;
- (id)triageAction;
- (void)setIsHighImpact:(BOOL)a3;
- (void)setTriageAction:(id)a3;
@end

@implementation MFCategoryHighImpactFeedbackTriageInteraction

- (BOOL)shouldFileRadar
{
  return 1;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v8 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___MFCategoryHighImpactFeedbackTriageInteraction;
  [super interactionWithMessageListItemSelection:v8 undoManager:0 origin:a4 actor:a5];
  v10 = [v8 messageListItems];
  [v9 setIsHighImpact:[v10 ef_all:&stru_10060AE88]];

  [v9 setChangeOptions:0];

  return v9;
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
    id v8 = [v4 initWithMessageListSelection:v5 origin:v6 actor:v7 delegate:0 categoryType:EMCategoryTypeForBucket() changeOptions:[self changeOptions]];
    v9 = self->_triageAction;
    self->_triageAction = v8;

    triageAction = self->_triageAction;
  }

  return triageAction;
}

- (id)title
{
  [(MFCategoryHighImpactFeedbackTriageInteraction *)self isHighImpact];
  v2 = _EFLocalizedStringFromTable();

  return v2;
}

- (id)_previewImageName
{
  return MFImageGlyphTapToRadar;
}

- (id)cardActionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MFTriageInteraction *)self cardTitle];
  int64_t v6 = [(MFCategoryHighImpactFeedbackTriageInteraction *)self _previewImageName];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10017F128;
  v10[3] = &unk_10060AEB0;
  id v7 = v4;
  v10[4] = self;
  id v11 = v7;
  id v8 = +[MFCardAction cardActionWithTitle:v5 shortTitle:0 imageName:v6 tintColor:0 handler:v10];

  return v8;
}

- (BOOL)isRecategorizationAction
{
  return 0;
}

- (id)radarContent
{
  if ([(MFCategoryHighImpactFeedbackTriageInteraction *)self isHighImpact]) {
    CFStringRef v2 = @"This message should not be high impact";
  }
  else {
    CFStringRef v2 = @"This message should have been high impact";
  }
  v3 = +[EFPair pairWithFirst:@"[BlackPearl] High impact feedback" second:v2];

  return v3;
}

- (id)extraLogging
{
  return +[NSString stringWithFormat:@" High_Impact_Feedback: %d", [(MFCategoryHighImpactFeedbackTriageInteraction *)self isHighImpact] ^ 1];
}

- (void)setTriageAction:(id)a3
{
}

- (BOOL)isHighImpact
{
  return self->_isHighImpact;
}

- (void)setIsHighImpact:(BOOL)a3
{
  self->_isHighImpact = a3;
}

- (void).cxx_destruct
{
}

@end