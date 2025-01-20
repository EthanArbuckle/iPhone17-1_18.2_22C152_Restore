@interface _TUISearchBarViewState
- (NSString)text;
- (_TUISearchBarViewState)initWithText:(id)a3;
@end

@implementation _TUISearchBarViewState

- (_TUISearchBarViewState)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUISearchBarViewState;
  v6 = [(_TUISearchBarViewState *)&v9 init];
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