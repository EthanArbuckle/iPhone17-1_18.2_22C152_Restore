@interface UITextCursorAssertionController
- (BOOL)_isNonBlinking;
- (UITextCursorAssertionControllerSubject)subject;
- (id)_createAssertionWithReason:(id)a3 options:(unint64_t)a4 userInfo:(id)a5;
- (id)activeInputModeAssertionWithReason:(id)a3;
- (id)capslockAssertionWithReason:(id)a3;
- (id)debugDescription;
- (id)deleteIndicatorAssertionWithReason:(id)a3;
- (id)dictationIndicatorAssertionWithReason:(id)a3 userInfo:(id)a4;
- (id)inputModeSelectorAssertionWithReason:(id)a3 userInfo:(id)a4;
- (id)nonBlinkingAssertionWithReason:(id)a3;
- (id)nonBlinkingGhostAssertionWithReason:(id)a3;
- (id)nonVisibleAssertionWithReason:(id)a3;
- (void)_beginTrackingAssertion:(id)a3;
- (void)_endTrackingAssertion:(id)a3;
- (void)_updateSubjectWithAssertionState;
- (void)dealloc;
- (void)setSubject:(id)a3;
@end

@implementation UITextCursorAssertionController

- (void)setSubject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subject);
  objc_storeStrong((id *)&self->_assertions, 0);
}

- (void)dealloc
{
  p_subject = &self->_subject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subject);

  if (WeakRetained)
  {
    [(NSHashTable *)self->_assertions removeAllObjects];
    [(UITextCursorAssertionController *)self _updateSubjectWithAssertionState];
    objc_storeWeak((id *)p_subject, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)UITextCursorAssertionController;
  [(UITextCursorAssertionController *)&v5 dealloc];
}

- (id)nonBlinkingAssertionWithReason:(id)a3
{
  return [(UITextCursorAssertionController *)self _createAssertionWithReason:a3 options:1 userInfo:0];
}

- (id)nonBlinkingGhostAssertionWithReason:(id)a3
{
  return [(UITextCursorAssertionController *)self _createAssertionWithReason:a3 options:5 userInfo:0];
}

- (id)nonVisibleAssertionWithReason:(id)a3
{
  return [(UITextCursorAssertionController *)self _createAssertionWithReason:a3 options:2 userInfo:0];
}

- (id)capslockAssertionWithReason:(id)a3
{
  return [(UITextCursorAssertionController *)self _createAssertionWithReason:a3 options:8 userInfo:0];
}

- (id)activeInputModeAssertionWithReason:(id)a3
{
  return [(UITextCursorAssertionController *)self _createAssertionWithReason:a3 options:16 userInfo:0];
}

- (id)inputModeSelectorAssertionWithReason:(id)a3 userInfo:(id)a4
{
  return [(UITextCursorAssertionController *)self _createAssertionWithReason:a3 options:32 userInfo:a4];
}

- (id)dictationIndicatorAssertionWithReason:(id)a3 userInfo:(id)a4
{
  return [(UITextCursorAssertionController *)self _createAssertionWithReason:a3 options:64 userInfo:a4];
}

- (id)deleteIndicatorAssertionWithReason:(id)a3
{
  return [(UITextCursorAssertionController *)self _createAssertionWithReason:a3 options:128 userInfo:0];
}

- (id)_createAssertionWithReason:(id)a3 options:(unint64_t)a4 userInfo:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  if (![v10 length])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UITextCursorAssertion.m", 121, @"Invalid parameter not satisfying: %@", @"reason.length > 0" object file lineNumber description];
  }
  id v11 = [[_UITextCursorAssertion alloc] _initWithReason:v10 options:a4 controller:self userInfo:v9];

  [(UITextCursorAssertionController *)self _beginTrackingAssertion:v11];
  return v11;
}

- (BOOL)_isNonBlinking
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_assertions;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "options", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_beginTrackingAssertion:(id)a3
{
  id v4 = a3;
  assertions = self->_assertions;
  id v8 = v4;
  if (!assertions)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    long long v7 = self->_assertions;
    self->_assertions = v6;

    id v4 = v8;
    assertions = self->_assertions;
  }
  [(NSHashTable *)assertions addObject:v4];
  [(UITextCursorAssertionController *)self _updateSubjectWithAssertionState];
}

- (void)_endTrackingAssertion:(id)a3
{
  [(NSHashTable *)self->_assertions removeObject:a3];
  [(UITextCursorAssertionController *)self _updateSubjectWithAssertionState];
}

- (void)_updateSubjectWithAssertionState
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v42 = self;
  obj = self->_assertions;
  uint64_t v2 = [(NSHashTable *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    int v4 = 0;
    unint64_t v5 = 0;
    uint64_t v6 = 1;
    uint64_t v45 = *(void *)v50;
    LODWORD(v7) = 1;
    LODWORD(v8) = 1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v50 != v45) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "options", v42) & 1;
        char v12 = [v10 options];
        BOOL v47 = (v12 & 2 | (unint64_t)v11) == 0;
        BOOL v48 = (v12 & 2) == 0;
        unint64_t v46 = [v10 options];
        if (([v10 options] & 0x40) != 0)
        {
          unint64_t v14 = v5 | 8;
          v15 = [v10 userInfo];
          v16 = [v15 objectForKeyedSubscript:@"_UITextCursorAnimationStyleUserInfoKey"];
          uint64_t v6 = [v16 integerValue];
        }
        else
        {
          unint64_t v13 = [v10 options];
          unint64_t v14 = ((unint64_t)[v10 options] >> 3) & 2 | (v13 >> 3) & 1 | v5;
        }
        unint64_t v5 = ((unint64_t)[v10 options] >> 3) & 0x10 | v14;
        if (([v10 options] & 0x20) != 0)
        {
          v17 = [v10 userInfo];
          [v17 objectForKeyedSubscript:@"_UITextCursorKeyboardIndicatorUserInfoKey"];
          int v44 = v7;
          int v18 = v8;
          uint64_t v8 = v6;
          int v19 = v4;
          unint64_t v20 = v5;
          v22 = uint64_t v21 = v3;
          int v23 = [v22 BOOLValue];

          uint64_t v3 = v21;
          uint64_t v24 = 4;
          if (v23) {
            uint64_t v24 = 36;
          }
          unint64_t v25 = v24 | v20;
          int v4 = v19;
          uint64_t v6 = v8;
          LODWORD(v8) = v18;
          LODWORD(v7) = v44;
          v26 = [v10 userInfo];
          v27 = [v26 objectForKeyedSubscript:@"_UITextCursorInputModeSwitcherUserInfoKey"];
          int v28 = [v27 BOOLValue];

          if (v28) {
            unint64_t v5 = v25 | 0x40;
          }
          else {
            unint64_t v5 = v25;
          }
        }
        uint64_t v7 = v48 & v7;
        uint64_t v8 = v47 & v8;
        v4 |= (v46 >> 2) & 1;
        if (!v5) {
          uint64_t v6 = 0;
        }
      }
      uint64_t v3 = [(NSHashTable *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v3);
  }
  else
  {
    LOBYTE(v4) = 0;
    unint64_t v5 = 0;
    uint64_t v7 = 1;
    uint64_t v6 = 1;
    uint64_t v8 = 1;
  }

  p_subject = (id *)&v42->_subject;
  id WeakRetained = objc_loadWeakRetained((id *)&v42->_subject);
  int v31 = [WeakRetained cursorVisible];

  if (v7 != v31)
  {
    id v32 = objc_loadWeakRetained(p_subject);
    [v32 setCursorVisible:v7];
  }
  id v33 = objc_loadWeakRetained(p_subject);
  int v34 = [v33 cursorBlinks];

  if (v8 != v34)
  {
    id v35 = objc_loadWeakRetained(p_subject);
    [v35 setCursorBlinks:v8];
  }
  id v36 = objc_loadWeakRetained(p_subject);
  int v37 = [v36 ghostAppearance];

  if ((v4 & 1) != v37)
  {
    id v38 = objc_loadWeakRetained(p_subject);
    [v38 setGhostAppearance:v4 & 1];
  }
  id v39 = objc_loadWeakRetained(p_subject);
  char v40 = objc_opt_respondsToSelector();

  if (v40)
  {
    id v41 = objc_loadWeakRetained(p_subject);
    [v41 setActiveIndicators:v5 animationStyle:v6];
  }
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSHashTable *)self->_assertions allObjects];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v6];

  return v7;
}

- (UITextCursorAssertionControllerSubject)subject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subject);
  return (UITextCursorAssertionControllerSubject *)WeakRetained;
}

@end