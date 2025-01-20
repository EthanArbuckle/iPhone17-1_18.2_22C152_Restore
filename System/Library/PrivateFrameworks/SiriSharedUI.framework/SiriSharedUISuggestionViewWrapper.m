@interface SiriSharedUISuggestionViewWrapper
- (NSString)suggestionText;
- (SiriSharedUISuggestionViewWrapper)initWithSuggestionText:(id)a3 view:(id)a4;
- (UIView)view;
@end

@implementation SiriSharedUISuggestionViewWrapper

- (SiriSharedUISuggestionViewWrapper)initWithSuggestionText:(id)a3 view:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUISuggestionViewWrapper;
  v9 = [(SiriSharedUISuggestionViewWrapper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestionText, a3);
    objc_storeStrong((id *)&v10->_view, a4);
  }

  return v10;
}

- (NSString)suggestionText
{
  return self->_suggestionText;
}

- (UIView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_suggestionText, 0);
}

@end