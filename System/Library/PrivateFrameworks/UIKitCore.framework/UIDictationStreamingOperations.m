@interface UIDictationStreamingOperations
- (BOOL)hasOperations;
- (BOOL)isEmpty;
- (BOOL)isNotEmpty;
- (NSMutableArray)operations;
- (UIDictationStreamingOperations)init;
- (double)delayAfterSelector:(SEL)a3;
- (id)pop;
- (unint64_t)selectionChangeDelta;
- (void)_performReplaceSelectedText:(id)a3;
- (void)clearOperations;
- (void)performSelectRangeForSpeech:(_NSRange)a3;
- (void)popAndInvoke;
- (void)pushInsertTextForSpeech:(id)a3;
- (void)pushReplaceSelectionWithText:(id)a3;
- (void)pushSelectRangeForSpeech:(_NSRange)a3;
- (void)pushSpeechOperation:(id)a3;
- (void)pushSpeechOperationWithSelectionChangeDelta:(int64_t)a3 block:(id)a4;
- (void)setDocument:(id)a3;
- (void)setOperations:(id)a3;
- (void)willEndEditingInInputDelegate:(id)a3;
@end

@implementation UIDictationStreamingOperations

- (UIDictationStreamingOperations)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIDictationStreamingOperations;
  v2 = [(UIDictationStreamingOperations *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    [v2 setOperations:v3];

    *(_OWORD *)(v2 + 8) = xmmword_186B9A070;
    v4 = v2;
  }

  return (UIDictationStreamingOperations *)v2;
}

- (void)clearOperations
{
  v3 = [(UIDictationStreamingOperations *)self operations];
  [v3 removeAllObjects];

  v4 = (void *)MEMORY[0x1E4FBA8A8];
  [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel_popAndInvoke object:0];
}

- (BOOL)hasOperations
{
  v2 = [(UIDictationStreamingOperations *)self operations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)pop
{
  BOOL v3 = [(UIDictationStreamingOperations *)self operations];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(UIDictationStreamingOperations *)self operations];
    objc_super v6 = [v5 objectAtIndex:0];

    v7 = [(UIDictationStreamingOperations *)self operations];
    [v7 removeObjectAtIndex:0];
  }
  else
  {
    objc_super v6 = 0;
  }
  return v6;
}

- (double)delayAfterSelector:(SEL)a3
{
  uint64_t v4 = [(UIDictationStreamingOperations *)self operations];
  double v5 = 1.0;
  if ((unint64_t)[v4 count] >= 3)
  {
    objc_super v6 = [(UIDictationStreamingOperations *)self operations];
    double v5 = (double)(unint64_t)[v6 count] * 0.5;
  }
  return 1.0 / v5 * self->_timeAfterInsertion;
}

- (void)popAndInvoke
{
  if ([(UIDictationStreamingOperations *)self hasOperations])
  {
    if ([(UIDictationStreamingOperations *)self hasOperations])
    {
      do
      {
        BOOL v3 = [(UIDictationStreamingOperations *)self pop];
        [v3 start];
      }
      while ([(UIDictationStreamingOperations *)self hasOperations]);
    }
    +[UIDictationController poppedLastStreamingOperation];
  }
}

- (void)pushSpeechOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDictationStreamingOperations *)self operations];
  [v5 addObject:v4];
}

- (void)pushSpeechOperationWithSelectionChangeDelta:(int64_t)a3 block:(id)a4
{
  v8 = (void (**)(void))a4;
  if ([(UIDictationStreamingOperations *)self isEmpty])
  {
    v8[2]();
    objc_super v6 = v8;
  }
  else
  {
    v7 = +[NSBlockOperation blockOperationWithBlock:v8];

    [v7 setSelectionChangeDelta:a3];
    [(UIDictationStreamingOperations *)self pushSpeechOperation:v7];
    objc_super v6 = (void (**)(void))v7;
  }
}

- (void)performSelectRangeForSpeech:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  objc_super v6 = self->_document;
  v7 = [(UITextInput *)v6 beginningOfDocument];
  v8 = [(UITextInput *)v6 positionFromPosition:v7 inDirection:2 offset:location];

  v9 = [(UITextInput *)v6 positionFromPosition:v8 inDirection:2 offset:length];
  id v10 = [(UITextInput *)v6 textRangeFromPosition:v8 toPosition:v9];

  [(UITextInput *)self->_document setSelectedTextRange:v10];
}

- (void)setDocument:(id)a3
{
  id v5 = (UITextInput *)a3;
  if (self->_document != v5)
  {
    objc_super v6 = v5;
    [(UIDictationStreamingOperations *)self clearOperations];
    objc_storeStrong((id *)&self->_document, a3);
    id v5 = v6;
  }
}

- (void)pushSelectRangeForSpeech:(_NSRange)a3
{
  if (self->_document)
  {
    NSUInteger length = a3.length;
    id v4 = (void *)a3.location;
    objc_initWeak(location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__UIDictationStreamingOperations_pushSelectRangeForSpeech___block_invoke;
    v8[3] = &unk_1E52E6A08;
    objc_copyWeak(v9, location);
    v9[1] = v4;
    v9[2] = (id)length;
    [(UIDictationStreamingOperations *)self pushSpeechOperationWithSelectionChangeDelta:-(uint64_t)length block:v8];
    objc_destroyWeak(v9);
    objc_destroyWeak(location);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v7 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Shouldn't be pushing more editing operations if dictation is stopped.", (uint8_t *)location, 2u);
    }
  }
  else
  {
    objc_super v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &pushSelectRangeForSpeech____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Shouldn't be pushing more editing operations if dictation is stopped.", (uint8_t *)location, 2u);
    }
  }
}

void __59__UIDictationStreamingOperations_pushSelectRangeForSpeech___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performSelectRangeForSpeech:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)pushInsertTextForSpeech:(id)a3
{
  id v4 = a3;
  document = self->_document;
  if (document)
  {
    objc_initWeak(location, document);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__UIDictationStreamingOperations_pushInsertTextForSpeech___block_invoke;
    v8[3] = &unk_1E52D9960;
    objc_copyWeak(&v10, location);
    id v9 = v4;
    [(UIDictationStreamingOperations *)self pushSpeechOperationWithSelectionChangeDelta:1 block:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
  else if (os_variant_has_internal_diagnostics())
  {
    v7 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Shouldn't be pushing more editing operations if dictation is stopped.", (uint8_t *)location, 2u);
    }
  }
  else
  {
    objc_super v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &pushInsertTextForSpeech____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Shouldn't be pushing more editing operations if dictation is stopped.", (uint8_t *)location, 2u);
    }
  }
}

void __58__UIDictationStreamingOperations_pushInsertTextForSpeech___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained insertText:*(void *)(a1 + 32)];
}

- (void)_performReplaceSelectedText:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  document = self->_document;
  if (has_internal_diagnostics)
  {
    if (!document)
    {
      id v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Shouldn't be pushing more edit notifications if dictation is stopped.", buf, 2u);
      }
    }
  }
  else if (!document)
  {
    id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_performReplaceSelectedText____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Shouldn't be pushing more edit notifications if dictation is stopped.", v11, 2u);
    }
  }
  v7 = self->_document;
  v8 = [(UITextInput *)v7 selectedTextRange];
  [(UITextInput *)v7 replaceRange:v8 withText:v4];
}

- (void)pushReplaceSelectionWithText:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  document = self->_document;
  if (has_internal_diagnostics)
  {
    if (!document)
    {
      v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Shouldn't be pushing more edit notifications if dictation is stopped.", (uint8_t *)location, 2u);
      }
    }
  }
  else if (!document)
  {
    id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &pushReplaceSelectionWithText____s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Shouldn't be pushing more edit notifications if dictation is stopped.", (uint8_t *)location, 2u);
    }
  }
  objc_initWeak(location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__UIDictationStreamingOperations_pushReplaceSelectionWithText___block_invoke;
  v10[3] = &unk_1E52D9960;
  objc_copyWeak(&v12, location);
  id v7 = v4;
  id v11 = v7;
  [(UIDictationStreamingOperations *)self pushSpeechOperationWithSelectionChangeDelta:1 block:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(location);
}

void __63__UIDictationStreamingOperations_pushReplaceSelectionWithText___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performReplaceSelectedText:*(void *)(a1 + 32)];
}

- (void)willEndEditingInInputDelegate:(id)a3
{
  id v4 = (UITextInput *)a3;
  if (self->_document == v4)
  {
    [(UIDictationStreamingOperations *)self setDocument:0];
    [(UIDictationStreamingOperations *)self clearOperations];
  }
  else if (os_variant_has_internal_diagnostics())
  {
    objc_super v6 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "We were never set up properly to stream in this document.", buf, 2u);
    }
  }
  else
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &willEndEditingInInputDelegate____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "We were never set up properly to stream in this document.", v7, 2u);
    }
  }
}

- (BOOL)isEmpty
{
  v2 = [(UIDictationStreamingOperations *)self operations];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isNotEmpty
{
  v2 = [(UIDictationStreamingOperations *)self operations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (unint64_t)selectionChangeDelta
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(UIDictationStreamingOperations *)self operations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) selectionChangeDelta];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSMutableArray)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end