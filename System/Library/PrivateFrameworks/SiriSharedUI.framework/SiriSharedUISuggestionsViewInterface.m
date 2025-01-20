@interface SiriSharedUISuggestionsViewInterface
- (SiriSharedUISuggestionsViewInterface)initWithPressDownHandler:(id)a3 pressUpHandler:(id)a4;
- (SiriSharedUISuggestionsViewInterface)initWithTapHandler:(id)a3;
- (id)getInitialSuggestionViews;
- (void)fetchAutoCompletionSuggestionsViewsWithQuery:(id)a3 deviceLocked:(BOOL)a4 completion:(id)a5;
- (void)fetchAutoCompletionSuggestionsViewsWithQuery:(id)a3 deviceLocked:(BOOL)a4 turnId:(id)a5 completion:(id)a6;
- (void)setDialogPhase:(id)a3;
- (void)startNewTypingSession;
- (void)suggestionsWereShownForCallback;
@end

@implementation SiriSharedUISuggestionsViewInterface

- (SiriSharedUISuggestionsViewInterface)initWithTapHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUISuggestionsViewInterface;
  v5 = [(SiriSharedUISuggestionsViewInterface *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider alloc] initWithTapHandler:v4];
    suggestionsViewProvider = v5->suggestionsViewProvider;
    v5->suggestionsViewProvider = v6;
  }
  return v5;
}

- (SiriSharedUISuggestionsViewInterface)initWithPressDownHandler:(id)a3 pressUpHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUISuggestionsViewInterface;
  v8 = [(SiriSharedUISuggestionsViewInterface *)&v12 init];
  if (v8)
  {
    objc_super v9 = [[_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider alloc] initWithPressDownHandler:v6 pressUpHandler:v7];
    suggestionsViewProvider = v8->suggestionsViewProvider;
    v8->suggestionsViewProvider = v9;
  }
  return v8;
}

- (void)suggestionsWereShownForCallback
{
}

- (void)setDialogPhase:(id)a3
{
}

- (void)fetchAutoCompletionSuggestionsViewsWithQuery:(id)a3 deviceLocked:(BOOL)a4 completion:(id)a5
{
}

- (void)fetchAutoCompletionSuggestionsViewsWithQuery:(id)a3 deviceLocked:(BOOL)a4 turnId:(id)a5 completion:(id)a6
{
}

- (id)getInitialSuggestionViews
{
  return [(SiriSharedUIAssistantSuggestionsViewProvider *)self->suggestionsViewProvider getInitialSuggestionViews];
}

- (void)startNewTypingSession
{
}

- (void).cxx_destruct
{
}

@end