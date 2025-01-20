@interface RTIInputSystemSession
- (NSHashTable)extraSessionDelegates;
- (NSUUID)uuid;
- (RTIDocumentState)documentState;
- (RTIDocumentTraits)documentTraits;
- (RTIInputSystemSessionDelegate)sessionDelegate;
- (RTISessionOptions)beginOptions;
- (RTITextOperations)_textOperations;
- (RTITextOperations)textOperations;
- (void)_applyLocalTextOperations:(id)a3 toDocumentState:(id)a4;
- (void)_createTextOperationsIfNecessary;
- (void)addSessionDelegate:(id)a3;
- (void)beginOptionsSafeAccess:(id)a3;
- (void)documentStateSafeAccess:(id)a3;
- (void)documentTraitsSafeAccess:(id)a3;
- (void)enumerateSessionDelegatesUsingBlock:(id)a3;
- (void)removeSessionDelegate:(id)a3;
- (void)setBeginOptions:(id)a3;
- (void)setDocumentState:(id)a3;
- (void)setDocumentTraits:(id)a3;
- (void)setExtraSessionDelegates:(id)a3;
- (void)setSessionDelegate:(id)a3;
- (void)setTextOperations:(id)a3;
- (void)setUuid:(id)a3;
- (void)textOperationsSafeAccess:(id)a3;
- (void)uuidSafeAccess:(id)a3;
@end

@implementation RTIInputSystemSession

- (void)uuidSafeAccess:(id)a3
{
  id v5 = a3;
  id v6 = [(RTIInputSystemSession *)self uuid];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)beginOptionsSafeAccess:(id)a3
{
  id v5 = a3;
  id v6 = [(RTIInputSystemSession *)self beginOptions];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)documentTraitsSafeAccess:(id)a3
{
  id v5 = a3;
  id v6 = [(RTIInputSystemSession *)self documentTraits];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)documentStateSafeAccess:(id)a3
{
  id v5 = a3;
  id v6 = [(RTIInputSystemSession *)self documentState];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)textOperationsSafeAccess:(id)a3
{
  id v5 = a3;
  id v6 = [(RTIInputSystemSession *)self textOperations];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)_createTextOperationsIfNecessary
{
  if (!self->_textOperations)
  {
    v3 = [RTITextOperations alloc];
    id v6 = [(RTIInputSystemSession *)self uuid];
    v4 = [(RTITextOperations *)v3 initWithTargetSessionUUID:v6];
    textOperations = self->_textOperations;
    self->_textOperations = v4;
  }
}

- (RTITextOperations)textOperations
{
  [(RTIInputSystemSession *)self _createTextOperationsIfNecessary];
  textOperations = self->_textOperations;
  return textOperations;
}

- (RTITextOperations)_textOperations
{
  return self->_textOperations;
}

- (void)_applyLocalTextOperations:(id)a3 toDocumentState:(id)a4
{
  id v48 = a3;
  id v5 = a4;
  id v6 = [v48 textToAssert];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FAE2A8]);
    v8 = [v48 textToAssert];
    v9 = objc_msgSend(v7, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v8, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    [v5 setDocumentState:v9];
  }
  if ([v48 selectionRangeToAssert] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [v48 selectionRangeToAssert];
    objc_msgSend(v5, "setSelectedTextRange:", v10, v11);
  }
  v12 = [v48 keyboardOutput];
  int v13 = [v12 unmarkIfNecessary];
  v14 = [v12 textToCommit];
  v15 = [v12 acceptedCandidate];
  v16 = [v15 input];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    v18 = [v5 documentState];
    v19 = [v15 input];
    v20 = [v15 candidate];
    v21 = [v18 documentStateAfterReplacingText:v19 withText:v20];
    [v5 setDocumentState:v21];
  }
  else
  {
    if (!v15) {
      goto LABEL_10;
    }
    v18 = [v5 documentState];
    v19 = [v15 candidate];
    v20 = [v18 documentStateAfterInsertingText:v19];
    [v5 setDocumentState:v20];
  }

LABEL_10:
  if (v14)
  {
    v22 = [v5 documentState];
    v23 = objc_msgSend(v22, "documentStateAfterSettingMarkedText:selectedRange:", v14, objc_msgSend(v14, "length"), 0);
    [v5 setDocumentState:v23];

LABEL_13:
    v24 = [v5 documentState];
    v25 = [v24 documentStateAfterUnmarkingText];
    [v5 setDocumentState:v25];

    goto LABEL_14;
  }
  if (v13) {
    goto LABEL_13;
  }
LABEL_14:
  if ([v12 forwardDeletionCount] && objc_msgSend(v12, "forwardDeletionCount"))
  {
    unint64_t v26 = 0;
    do
    {
      v27 = [v5 documentState];
      v28 = [v27 documentStateAfterDeletingForward];
      [v5 setDocumentState:v28];

      ++v26;
    }
    while (v26 < [v12 forwardDeletionCount]);
  }
  v29 = [v12 insertionTextAfterSelection];

  if (v29)
  {
    v30 = [v5 documentState];
    v31 = [v12 insertionTextAfterSelection];
    v32 = [v30 documentStateAfterInsertingTextAfterSelection:v31];
    [v5 setDocumentState:v32];
  }
  if ([v12 deletionCount] && objc_msgSend(v12, "deletionCount"))
  {
    unint64_t v33 = 0;
    do
    {
      v34 = [v5 documentState];
      v35 = [v34 documentStateAfterDeletingBackward];
      [v5 setDocumentState:v35];

      ++v33;
    }
    while (v33 < [v12 deletionCount]);
  }
  v36 = [v12 insertionText];
  uint64_t v37 = [v36 length];

  if (v37)
  {
    v38 = [v5 documentState];
    v39 = [v12 insertionText];
    v40 = [v38 documentStateAfterInsertingText:v39];
    [v5 setDocumentState:v40];
  }
  v41 = [v48 intermediateText];

  if (v41)
  {
    v42 = [v48 intermediateText];
    v43 = [v5 documentState];
    v44 = [v42 displayString];
    uint64_t v45 = [v42 selectedRange];
    v47 = objc_msgSend(v43, "documentStateAfterSettingMarkedText:selectedRange:", v44, v45, v46);
    [v5 setDocumentState:v47];
  }
}

- (void)addSessionDelegate:(id)a3
{
  id v4 = a3;
  extraSessionDelegates = self->_extraSessionDelegates;
  id v8 = v4;
  if (!extraSessionDelegates)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_extraSessionDelegates;
    self->_extraSessionDelegates = v6;

    id v4 = v8;
    extraSessionDelegates = self->_extraSessionDelegates;
  }
  [(NSHashTable *)extraSessionDelegates addObject:v4];
}

- (void)removeSessionDelegate:(id)a3
{
}

- (void)enumerateSessionDelegatesUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    id v5 = [(RTIInputSystemSession *)self sessionDelegate];

    if (v5)
    {
      id v6 = [(RTIInputSystemSession *)self sessionDelegate];
      v4[2](v4, v6);
    }
    id v7 = (void *)[(NSHashTable *)self->_extraSessionDelegates copy];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          v4[2](v4, *(void **)(*((void *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
}

- (RTISessionOptions)beginOptions
{
  return self->_beginOptions;
}

- (void)setBeginOptions:(id)a3
{
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)setDocumentTraits:(id)a3
{
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
}

- (void)setTextOperations:(id)a3
{
}

- (NSHashTable)extraSessionDelegates
{
  return self->_extraSessionDelegates;
}

- (void)setExtraSessionDelegates:(id)a3
{
}

- (RTIInputSystemSessionDelegate)sessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  return (RTIInputSystemSessionDelegate *)WeakRetained;
}

- (void)setSessionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_extraSessionDelegates, 0);
  objc_storeStrong((id *)&self->_textOperations, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_storeStrong((id *)&self->_beginOptions, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end