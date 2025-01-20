@interface ICTextSearchingFindSession
- (ICTextSearchingFindSession)initWithTextView:(id)a3;
- (ICTextView)textView;
- (id)divergentResponder;
- (void)setTextView:(id)a3;
@end

@implementation ICTextSearchingFindSession

- (ICTextSearchingFindSession)initWithTextView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTextSearchingFindSession;
  v5 = [(UITextSearchingFindSession *)&v8 initWithSearchableObject:v4];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_textView, v4);
  }

  return v6;
}

- (id)divergentResponder
{
  v2 = [(ICTextSearchingFindSession *)self textView];
  v3 = [v2 editorController];

  return v3;
}

- (ICTextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);

  return (ICTextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end