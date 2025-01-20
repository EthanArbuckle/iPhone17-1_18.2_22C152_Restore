@interface UIDictationCursorPositionRestorer
- (unint64_t)_selectionEndOffsetFromEndPriorToOperation;
- (unint64_t)_selectionLengthPriorToOperation;
- (unint64_t)_selectionStartOffsetFromBeginningPriorToOperation;
- (void)_restoreCursorLocationWithCompletion:(id)a3;
- (void)_withCurrentSelectionOffsets:(id)a3;
- (void)saveCursorLocationAndRestoreAfterPerforming:(id)a3 completion:(id)a4;
- (void)set_selectionEndOffsetFromEndPriorToOperation:(unint64_t)a3;
- (void)set_selectionLengthPriorToOperation:(unint64_t)a3;
- (void)set_selectionStartOffsetFromBeginningPriorToOperation:(unint64_t)a3;
@end

@implementation UIDictationCursorPositionRestorer

- (void)saveCursorLocationAndRestoreAfterPerforming:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__UIDictationCursorPositionRestorer_saveCursorLocationAndRestoreAfterPerforming_completion___block_invoke;
  v10[3] = &unk_1E52FD598;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(UIDictationCursorPositionRestorer *)self _withCurrentSelectionOffsets:v10];
}

uint64_t __92__UIDictationCursorPositionRestorer_saveCursorLocationAndRestoreAfterPerforming_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "set_selectionStartOffsetFromBeginningPriorToOperation:", a2);
  objc_msgSend(*(id *)(a1 + 32), "set_selectionEndOffsetFromEndPriorToOperation:", a3);
  objc_msgSend(*(id *)(a1 + 32), "set_selectionLengthPriorToOperation:", a4);
  id v7 = _UIDictationControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 32) _selectionStartOffsetFromBeginningPriorToOperation];
    uint64_t v9 = [*(id *)(a1 + 32) _selectionEndOffsetFromEndPriorToOperation];
    uint64_t v10 = [*(id *)(a1 + 32) _selectionLengthPriorToOperation];
    int v12 = 136315906;
    v13 = "-[UIDictationCursorPositionRestorer saveCursorLocationAndRestoreAfterPerforming:completion:]_block_invoke";
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s Saving selection offsets prior to operation: selection start offset from beginning: %ld selection end offset from end: %ld selection length: %ld", (uint8_t *)&v12, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return [*(id *)(a1 + 32) _restoreCursorLocationWithCompletion:*(void *)(a1 + 48)];
}

- (void)_withCurrentSelectionOffsets:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F95EA0]);
  [v4 setFlags:9];
  [v4 setTextGranularity:3];
  [v4 setSurroundingGranularityCount:3];
  v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 remoteTextInputPartnerPrivate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__UIDictationCursorPositionRestorer__withCurrentSelectionOffsets___block_invoke;
  v8[3] = &unk_1E52FAC78;
  id v9 = v3;
  id v7 = v3;
  [v6 _performDocumentRequest:v4 completion:v8];
}

void __66__UIDictationCursorPositionRestorer__withCurrentSelectionOffsets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v26 = a1;
    v5 = [v3 documentState];
    uint64_t v6 = [v4 selectedTextRange];
    id v7 = NSString;
    uint64_t v8 = [v5 contextBeforeInput];
    id v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (__CFString *)v8;
    }
    else {
      uint64_t v10 = &stru_1ED0E84C0;
    }
    uint64_t v11 = [v5 selectedText];
    int v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_1ED0E84C0;
    }
    uint64_t v14 = [v5 contextAfterInput];
    uint64_t v15 = (void *)v14;
    if (v14) {
      __int16 v16 = (__CFString *)v14;
    }
    else {
      __int16 v16 = &stru_1ED0E84C0;
    }
    uint64_t v17 = [v7 stringWithFormat:@"%@%@%@", v10, v13, v16];

    uint64_t v18 = [v17 length];
    uint64_t v19 = [v4 selectedTextRange];
    uint64_t v21 = v18 - (v19 + v20);
    [v4 selectedTextRange];
    uint64_t v23 = v22;
    v24 = _UIDictationControllerLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v28 = "-[UIDictationCursorPositionRestorer _withCurrentSelectionOffsets:]_block_invoke";
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      __int16 v31 = 2048;
      uint64_t v32 = v6;
      __int16 v33 = 2048;
      uint64_t v34 = v21;
      __int16 v35 = 2048;
      uint64_t v36 = v23;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "%s Got document of length %ld, selectionStartOffsetFromBeginning: %ld, selectionEndOffsetFromEnd: %ld,  selectionLength: %ld", buf, 0x34u);
    }

    uint64_t v25 = *(void *)(v26 + 32);
    if (v25) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 16))(v25, v6, v21, v23, v18);
    }
  }
  else
  {
    v5 = _UIDictationControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[UIDictationCursorPositionRestorer _withCurrentSelectionOffsets:]_block_invoke";
      _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "%s Received nil RTIDocumentState", buf, 0xCu);
    }
  }
}

- (void)_restoreCursorLocationWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke;
  v6[3] = &unk_1E52FD5E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIDictationCursorPositionRestorer *)self _withCurrentSelectionOffsets:v6];
}

void __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = _UIDictationControllerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
    __int16 v49 = 2048;
    unint64_t v50 = a2;
    __int16 v51 = 2048;
    unint64_t v52 = a3;
    __int16 v53 = 2048;
    uint64_t v54 = a4;
    _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "%s Cursor offsets after operation: selection start offset from beginning: %ld selection end offset from end: %ld selection length: %ld", buf, 0x2Au);
  }

  if (a4)
  {
    uint64_t v11 = [*(id *)(a1 + 32) _selectionStartOffsetFromBeginningPriorToOperation];
    uint64_t v12 = [*(id *)(a1 + 32) _selectionLengthPriorToOperation];
    unint64_t v13 = [*(id *)(a1 + 32) _selectionEndOffsetFromEndPriorToOperation];
    unint64_t v14 = a4 + a2;
    if (v13 | a3)
    {
      unint64_t v15 = v12 + v11;
      if (v15 < a2)
      {
        __int16 v16 = _UIDictationControllerLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "%s Prior cursor position is before the new selection start, so maintaining prior cursor offset from beginning", buf, 0xCu);
        }
        unint64_t v14 = v15;
        goto LABEL_21;
      }
      if (v13 >= a3)
      {
        __int16 v16 = _UIDictationControllerLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
          uint64_t v19 = "%s Prior cursor position is within new selection, so using new selection end as target";
          goto LABEL_20;
        }
      }
      else
      {
        unint64_t v14 = a5 - v13;
        __int16 v16 = _UIDictationControllerLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
          uint64_t v19 = "%s Prior cursor position is after the new selection end, so maintaining prior cursor offset from end";
          goto LABEL_20;
        }
      }
    }
    else
    {
      __int16 v16 = _UIDictationControllerLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
        uint64_t v19 = "%s Prior cursor position was end of text and so was new selection end, so maintaining cursor at end";
LABEL_20:
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
      }
    }
LABEL_21:

    uint64_t v20 = +[UIKeyboardImpl activeInstance];
    uint64_t v21 = [v20 inputDelegateManager];

    if ([v21 hasAsyncCapableInputDelegate])
    {
      uint64_t v22 = objc_alloc_init(UIWKDocumentRequest);
      [(UIWKDocumentRequest *)v22 setFlags:1];
      [(UIWKDocumentRequest *)v22 setSurroundingGranularity:3];
      [(UIWKDocumentRequest *)v22 setGranularityCount:3];
      uint64_t v23 = [v21 textInputView];
      [v23 visibleBounds];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      uint64_t v32 = [v21 textInteractionAssistant];
      __int16 v33 = [v32 view];
      int v34 = [v33 isEditing];

      if (v34)
      {
        __int16 v35 = +[UIKeyboardImpl activeInstance];
        objc_msgSend(v35, "subtractKeyboardFrameFromRect:inView:", v23, v25, v27, v29, v31);
        double v25 = v36;
        double v27 = v37;
        double v29 = v38;
        double v31 = v39;
      }
      -[UIWKDocumentRequest setDocumentRect:](v22, "setDocumentRect:", v25, v27, v29, v31);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke_9;
      v43[3] = &unk_1E52FD5C0;
      unint64_t v46 = v14;
      id v44 = v21;
      id v45 = *(id *)(a1 + 40);
      [v44 requestDocumentContext:v22 completionHandler:v43];
    }
    else
    {
      v40 = [v21 beginningOfDocument];
      uint64_t v22 = [v21 positionFromPosition:v40 offset:v14];

      uint64_t v23 = [v21 textRangeFromPosition:v22 toPosition:v22];
      v41 = _UIDictationControllerLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
        __int16 v49 = 2048;
        unint64_t v50 = v14;
        _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_DEFAULT, "%s Moving selection to index %ld", buf, 0x16u);
      }

      [v21 setSelectedTextRange:v23];
      uint64_t v42 = *(void *)(a1 + 40);
      if (v42) {
        (*(void (**)(void))(v42 + 16))();
      }
    }

    return;
  }
  uint64_t v17 = _UIDictationControllerLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "%s New selection is empty, so skipping attempt to restore cursor location", buf, 0xCu);
  }

  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

void __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a2, "directionalRangeForSelectionRange:", *(void *)(a1 + 48), 0);
  uint64_t v5 = v4;
  uint64_t v6 = _UIDictationControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v3;
    __int16 v17 = 2048;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%s WebKit moving selection to index %ld using directional range (offset: %ld, length: %ld)", buf, 0x2Au);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke_10;
  v9[3] = &unk_1E52DA040;
  uint64_t v8 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "adjustSelection:completionHandler:", v3, v5, v9);
}

uint64_t __74__UIDictationCursorPositionRestorer__restoreCursorLocationWithCompletion___block_invoke_10(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _UIDictationControllerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[UIDictationCursorPositionRestorer _restoreCursorLocationWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "%s WebKit completed adjusting of selection", (uint8_t *)&v4, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)_selectionStartOffsetFromBeginningPriorToOperation
{
  return self->__selectionStartOffsetFromBeginningPriorToOperation;
}

- (void)set_selectionStartOffsetFromBeginningPriorToOperation:(unint64_t)a3
{
  self->__selectionStartOffsetFromBeginningPriorToOperation = a3;
}

- (unint64_t)_selectionEndOffsetFromEndPriorToOperation
{
  return self->__selectionEndOffsetFromEndPriorToOperation;
}

- (void)set_selectionEndOffsetFromEndPriorToOperation:(unint64_t)a3
{
  self->__selectionEndOffsetFromEndPriorToOperation = a3;
}

- (unint64_t)_selectionLengthPriorToOperation
{
  return self->__selectionLengthPriorToOperation;
}

- (void)set_selectionLengthPriorToOperation:(unint64_t)a3
{
  self->__selectionLengthPriorToOperation = a3;
}

@end