@interface TIAutoshiftController
- (BOOL)isEnabled;
- (BOOL)isSelectionAtSentenceAutoshiftBoundaryWithDocumentState:(id)a3 inputManagerState:(id)a4;
- (TIAutoshiftController)initWithTextInputTraits:(id)a3;
- (TITextInputTraits)textInputTraits;
- (unint64_t)actionForDocumentState:(id)a3 inputMangerState:(id)a4;
- (void)setEnabled:(BOOL)a3;
@end

@implementation TIAutoshiftController

- (void).cxx_destruct
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (BOOL)isSelectionAtSentenceAutoshiftBoundaryWithDocumentState:(id)a3 inputManagerState:(id)a4
{
  if (!a4)
  {
    uint64_t v22 = v4;
    uint64_t v23 = v5;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    v7 = [a3 contextBeforeInput];
    uint64_t v8 = [v7 length];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __99__TIAutoshiftController_isSelectionAtSentenceAutoshiftBoundaryWithDocumentState_inputManagerState___block_invoke;
    v13[3] = &unk_1E555A310;
    v13[4] = &v14;
    v13[5] = &v18;
    objc_msgSend(v7, "_reverseEnumerateLongCharactersInRange:usingBlock:", 0, v8, v13);
    unint64_t v9 = v19[3];
    if (v9 > 2)
    {
      BOOL v10 = 1;
LABEL_17:

      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(&v18, 8);
      return v10;
    }
    unsigned int v11 = *((_DWORD *)v15 + 6);
    BOOL v10 = 1;
    if (v11 <= 0x3F)
    {
      if (((1 << v11) & 0x100000401) != 0) {
        goto LABEL_17;
      }
      if (((1 << v11) & 0x8000400200000000) != 0)
      {
        BOOL v10 = v9 != 0;
        goto LABEL_17;
      }
    }
    BOOL v10 = v11 - 160 <= 0x1F && ((1 << (v11 + 96)) & 0x80000003) != 0;
    goto LABEL_17;
  }
  return objc_msgSend(a4, "nextInputWouldStartSentence", a3);
}

uint64_t __99__TIAutoshiftController_isSelectionAtSentenceAutoshiftBoundaryWithDocumentState_inputManagerState___block_invoke(uint64_t result, int a2, unsigned char *a3)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if ((a2 & 0xFFFFFF7F) == 0x20
    && (v3 = *(void *)(*(void *)(result + 40) + 8), unint64_t v4 = *(void *)(v3 + 24), v4 <= 2))
  {
    *(void *)(v3 + 24) = v4 + 1;
  }
  else
  {
    *a3 = 1;
  }
  return result;
}

- (unint64_t)actionForDocumentState:(id)a3 inputMangerState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TIAutoshiftController *)self textInputTraits];
  unsigned int v9 = [v8 keyboardType];

  if (v9 <= 0xD && ((0x2930u >> v9) & 1) != 0) {
    goto LABEL_3;
  }
  if (![(TIAutoshiftController *)self isEnabled])
  {
LABEL_7:
    unint64_t v10 = 1;
    goto LABEL_8;
  }
  unsigned int v11 = [(TIAutoshiftController *)self textInputTraits];
  if ([v11 autocapitalizationType] == 1)
  {
    v12 = [v6 markedText];
    uint64_t v13 = [v12 length];

    if (v13) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  if (!v6)
  {
LABEL_3:
    unint64_t v10 = 0;
    goto LABEL_8;
  }
  v15 = [(TIAutoshiftController *)self textInputTraits];
  uint64_t v16 = [v15 autocapitalizationType];

  if (v16 == 1)
  {
    int v17 = [v6 contextBeforeInput];
    unsigned int v18 = [v17 _lastLongCharacter];

    if ((v18 > 0x20 || ((1 << v18) & 0x100000401) == 0) && v18 != 160) {
      goto LABEL_21;
    }
LABEL_20:
    unint64_t v10 = 3;
    goto LABEL_8;
  }
  if (v16 == 3) {
    goto LABEL_20;
  }
  if (v16 != 2)
  {
LABEL_21:
    unint64_t v10 = 4;
    goto LABEL_8;
  }
  if ([(TIAutoshiftController *)self isSelectionAtSentenceAutoshiftBoundaryWithDocumentState:v6 inputManagerState:v7])
  {
    unint64_t v10 = 3;
  }
  else
  {
    unint64_t v10 = 4;
  }
LABEL_8:

  return v10;
}

- (TIAutoshiftController)initWithTextInputTraits:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIAutoshiftController;
  id v6 = [(TIAutoshiftController *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textInputTraits, a3);
  }

  return v7;
}

@end