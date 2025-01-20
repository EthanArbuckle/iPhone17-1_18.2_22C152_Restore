@interface _TUITextViewState
- (NSString)text;
- (_TUITextViewState)initWithText:(id)a3;
@end

@implementation _TUITextViewState

- (_TUITextViewState)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUITextViewState;
  v6 = [(_TUITextViewState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_text, a3);
  }

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

@end