@interface _UIKeyboardHandwritingLink
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasCandidates;
- (BOOL)isDeleteCandidate:(id)a3;
- (BOOL)isExtendedList;
- (BOOL)isFloatingList;
- (BOOL)resignFirstResponder;
- (BOOL)shouldRestoreResponder;
- (BOOL)showCandidate:(id)a3;
- (TIKeyboardCandidateResultSet)candidateSet;
- (_UIKeyboardHandwritingLink)init;
- (id)currentCandidate;
- (id)keyboardBehaviors;
- (id)nextResponder;
- (id)statisticsIdentifier;
- (unint64_t)currentIndex;
- (unint64_t)selectedSortIndex;
- (void)dealloc;
- (void)reloadInputViews;
- (void)sendStrokes:(id)a3;
- (void)setCandidateSet:(id)a3;
- (void)setCandidates:(id)a3 inlineText:(id)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7;
- (void)setUIKeyboardCandidateListDelegate:(id)a3;
@end

@implementation _UIKeyboardHandwritingLink

- (_UIKeyboardHandwritingLink)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardHandwritingLink;
  v2 = [(_UIKeyboardHandwritingLink *)&v9 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34___UIKeyboardHandwritingLink_init__block_invoke;
    v6[3] = &unk_1E52DA728;
    objc_copyWeak(&v7, &location);
    id v4 = (id)[v3 addObserverForName:@"UIApplicationWillEnterForegroundNotification" object:0 queue:0 usingBlock:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 candidateList];

  if (v4 == self)
  {
    v5 = +[UIKeyboardImpl activeInstance];
    [v5 setCandidateList:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardHandwritingLink;
  [(UIResponder *)&v6 dealloc];
}

- (void)reloadInputViews
{
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardHandwritingLink;
  [(UIResponder *)&v5 reloadInputViews];
  if ([(UIResponder *)self isFirstResponder])
  {
    v3 = +[UIKeyboardImpl activeInstance];
    [v3 setInputMode:@"intl_HWR" userInitiated:0];

    id v4 = +[UIKeyboardImpl activeInstance];
    [v4 setCandidateList:self];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  if ([(UIResponder *)self isFirstResponder]) {
    return 1;
  }
  v3 = [(id)UIApp keyWindow];
  objc_storeWeak((id *)&self->_fallbackResponder, v3);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackResponder);
  objc_super v5 = [WeakRetained firstResponder];
  objc_storeWeak((id *)&self->_previousResponder, v5);

  v7.receiver = self;
  v7.super_class = (Class)_UIKeyboardHandwritingLink;
  if ([(UIResponder *)&v7 becomeFirstResponder]) {
    return 1;
  }
  objc_storeWeak((id *)&self->_previousResponder, 0);
  objc_storeWeak((id *)&self->_fallbackResponder, 0);
  return 0;
}

- (BOOL)shouldRestoreResponder
{
  p_previousResponder = &self->_previousResponder;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousResponder);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_previousResponder);
    objc_super v5 = [v4 inputView];
    if (v5)
    {
      BOOL v6 = 1;
    }
    else
    {
      id v7 = objc_loadWeakRetained((id *)p_previousResponder);
      v8 = [v7 inputAccessoryView];
      BOOL v6 = v8 != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)resignFirstResponder
{
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardHandwritingLink;
  BOOL v3 = [(UIResponder *)&v9 resignFirstResponder];
  if (v3)
  {
    if ([(_UIKeyboardHandwritingLink *)self shouldRestoreResponder])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_previousResponder);
      [WeakRetained becomeFirstResponder];
    }
    objc_super v5 = +[UIKeyboardImpl activeInstance];
    BOOL v6 = [v5 candidateList];

    if (v6 == self)
    {
      id v7 = +[UIKeyboardImpl activeInstance];
      [v7 setCandidateList:0];
    }
    objc_storeWeak((id *)&self->_previousResponder, 0);
    objc_storeWeak((id *)&self->_fallbackResponder, 0);
  }
  return v3;
}

- (id)nextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousResponder);
  id v4 = WeakRetained;
  if (WeakRetained) {
    id v5 = WeakRetained;
  }
  else {
    id v5 = objc_loadWeakRetained((id *)&self->_fallbackResponder);
  }
  BOOL v6 = v5;

  return v6;
}

- (void)sendStrokes:(id)a3
{
  id v5 = a3;
  if (![(UIResponder *)self isFirstResponder]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Not first responder, can't handle %@", v5 format];
  }
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 addInputObject:v5];
}

- (BOOL)isDeleteCandidate:(id)a3
{
  BOOL v3 = [a3 candidate];
  char v4 = [v3 isEqualToString:@"DELETE"];

  return v4;
}

- (void)setCandidates:(id)a3 inlineText:(id)a4 inlineRect:(CGRect)a5 maxX:(double)a6 layout:(BOOL)a7
{
  id v8 = a3;
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  objc_super v9 = [v8 candidates];
  v10 = [v9 firstObject];
  BOOL v11 = [(_UIKeyboardHandwritingLink *)self isDeleteCandidate:v10];

  if (v11)
  {
    if (self->_justDeleted)
    {
      [(_UIKeyboardHandwritingLink *)self setCandidateSet:0];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA48] array];
      v13 = [(_UIKeyboardHandwritingLink *)self candidateSet];
      v14 = [v13 candidates];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __78___UIKeyboardHandwritingLink_setCandidates_inlineText_inlineRect_maxX_layout___block_invoke;
      v16[3] = &unk_1E52FD570;
      id v17 = v12;
      id v15 = v12;
      [v14 enumerateObjectsUsingBlock:v16];

      self->_justDeleted = 1;
    }
  }
  else
  {
    [(_UIKeyboardHandwritingLink *)self setCandidateSet:v8];
    self->_justDeleted = 0;
  }
  [(_UIKeyboardHandwritingLink *)self candidatesUpdated];
}

- (void)setUIKeyboardCandidateListDelegate:(id)a3
{
}

- (BOOL)hasCandidates
{
  return self->_candidateSet != 0;
}

- (BOOL)isExtendedList
{
  return 0;
}

- (BOOL)isFloatingList
{
  return 0;
}

- (BOOL)showCandidate:(id)a3
{
  return 0;
}

- (id)currentCandidate
{
  if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = 0;
  }
  else
  {
    char v4 = [(_UIKeyboardHandwritingLink *)self candidateSet];
    id v5 = [v4 candidates];
    BOOL v6 = [v5 objectAtIndex:self->_selectedIndex];

    if ([(_UIKeyboardHandwritingLink *)self isDeleteCandidate:v6]) {
      id v2 = 0;
    }
    else {
      id v2 = v6;
    }
  }
  return v2;
}

- (unint64_t)currentIndex
{
  return self->_selectedIndex;
}

- (id)keyboardBehaviors
{
  return 0;
}

- (id)statisticsIdentifier
{
  return 0;
}

- (unint64_t)selectedSortIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (TIKeyboardCandidateResultSet)candidateSet
{
  return self->_candidateSet;
}

- (void)setCandidateSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateSet, 0);
  objc_destroyWeak((id *)&self->_candidateListDelegate);
  objc_destroyWeak((id *)&self->_fallbackResponder);
  objc_destroyWeak((id *)&self->_previousResponder);
}

@end