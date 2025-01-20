@interface NSWritingToolsProofreadingController
- (BOOL)acceptOpenSuggestionsInFinish;
- (BOOL)finished;
- (BOOL)replaceCharactersInRange:(_NSRange)a3 attributedString:(id)a4 state:(int64_t)a5 identifier:(id)a6 completion:(id)a7;
- (NSArray)suggestions;
- (NSAttributedString)contextString;
- (NSMutableArray)suggestionsByRange;
- (NSMutableDictionary)suggestionsByUUID;
- (NSWritingToolsEditTracker)editTracker;
- (NSWritingToolsProofreadingController)init;
- (NSWritingToolsProofreadingController)initWithContextString:(id)a3 contextRange:(_NSRange)a4 delegate:(id)a5;
- (NSWritingToolsProofreadingControllerDelegate)delegate;
- (id)replacementTextForSuggestion:(id)a3 state:(int64_t)a4;
- (id)suggestionWithUUID:(id)a3;
- (void)_addSuggestion:(id)a3;
- (void)_finalizeNextSuggestion:(id)a3 enumerator:(id)a4 state:(int64_t)a5 completion:(id)a6;
- (void)addSuggestionWithUUID:(id)a3 originalRange:(_NSRange)a4 replacementString:(id)a5;
- (void)addSuggestionWithUUID:(id)a3 originalRange:(_NSRange)a4 replacementString:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)finish;
- (void)finish:(BOOL)a3;
- (void)finish:(BOOL)a3 completion:(id)a4;
- (void)setAcceptOpenSuggestionsInFinish:(BOOL)a3;
- (void)setContextString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditTracker:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setSuggestionsByRange:(id)a3;
- (void)setSuggestionsByUUID:(id)a3;
- (void)updateSuggestionWithUUID:(id)a3 state:(int64_t)a4;
- (void)updateSuggestionWithUUID:(id)a3 state:(int64_t)a4 completion:(id)a5;
@end

@implementation NSWritingToolsProofreadingController

- (NSWritingToolsProofreadingController)init
{
  return 0;
}

- (NSWritingToolsProofreadingController)initWithContextString:(id)a3 contextRange:(_NSRange)a4 delegate:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v14.receiver = self;
  v14.super_class = (Class)NSWritingToolsProofreadingController;
  v9 = [(NSWritingToolsProofreadingController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    [(NSWritingToolsProofreadingController *)v9 setContextString:a3];
    [(NSWritingToolsProofreadingController *)v10 setDelegate:a5];
    [(NSWritingToolsProofreadingController *)v10 setFinished:1];
    -[NSWritingToolsProofreadingController setEditTracker:](v10, "setEditTracker:", -[NSWritingToolsEditTracker initWithContextRange:]([NSWritingToolsEditTracker alloc], "initWithContextRange:", location, length));
    [(NSWritingToolsProofreadingController *)v10 setSuggestionsByUUID:objc_alloc_init(MEMORY[0x1E4F1CA60])];
    [(NSWritingToolsProofreadingController *)v10 setSuggestionsByRange:objc_alloc_init(MEMORY[0x1E4F1CA48])];
    v10->_acceptOpenSuggestionsInFinish = 1;
    objc_loadWeak((id *)&v10->_delegate);
    if (objc_opt_respondsToSelector())
    {
      BOOL v11 = v10->_delegateVersion != -1;
    }
    else
    {
      objc_loadWeak((id *)&v10->_delegate);
      if (objc_opt_respondsToSelector())
      {
        v10->_delegateVersion = 2;
        BOOL v11 = 1;
      }
      else
      {
        objc_loadWeak((id *)&v10->_delegate);
        if (objc_opt_respondsToSelector())
        {
          BOOL v11 = 1;
          v10->_delegateVersion = 1;
        }
        else
        {
          BOOL v11 = 0;
          v10->_delegateVersion = -1;
        }
      }
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__NSWritingToolsProofreadingController_initWithContextString_contextRange_delegate___block_invoke;
    v13[3] = &unk_1E55C68B0;
    v13[4] = v10;
    _UIFoundationAssert(v10, @"NSWritingTools", v11, v13);
  }
  return v10;
}

uint64_t __84__NSWritingToolsProofreadingController_initWithContextString_contextRange_delegate___block_invoke(uint64_t a1)
{
  return [NSString stringWithFormat:@"%@ is not implementing any of the replacement methods in NSWritingToolsProofreadingControllerDelegate.", objc_loadWeak((id *)(*(void *)(a1 + 32) + 32))];
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  _UIFoundationAssert(self, v4, self->_finished, &__block_literal_global_10);

  v5.receiver = self;
  v5.super_class = (Class)NSWritingToolsProofreadingController;
  [(NSWritingToolsProofreadingController *)&v5 dealloc];
}

__CFString *__47__NSWritingToolsProofreadingController_dealloc__block_invoke()
{
  return @"proofreading controller was deallocated without calling finish.";
}

- (NSArray)suggestions
{
  v2 = (void *)[(NSMutableArray *)[(NSWritingToolsProofreadingController *)self suggestionsByRange] copy];

  return (NSArray *)v2;
}

- (BOOL)replaceCharactersInRange:(_NSRange)a3 attributedString:(id)a4 state:(int64_t)a5 identifier:(id)a6 completion:(id)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  int64_t delegateVersion = self->_delegateVersion;
  if (delegateVersion == 2)
  {
    id v18 = a4;
    uint64_t v16 = objc_msgSend(objc_loadWeak((id *)&self->_delegate), "proofreadingController:replaceCharactersInRange:state:replacementAttributedString:", self, a3.location, a3.length, a5, &v18);
    (*((void (**)(id, id, id, uint64_t))a7 + 2))(a7, a6, v18, v16);
    return 1;
  }
  if (!delegateVersion)
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __110__NSWritingToolsProofreadingController_replaceCharactersInRange_attributedString_state_identifier_completion___block_invoke;
    v19[3] = &unk_1E55C68D8;
    v19[4] = a7;
    objc_msgSend(Weak, "proofreadingController:replaceCharactersInRange:attributedString:state:identifier:completion:", self, location, length, a4, a5, a6, v19);
    return 1;
  }
  return 0;
}

uint64_t __110__NSWritingToolsProofreadingController_replaceCharactersInRange_attributedString_state_identifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addSuggestion:(id)a3
{
  editTracker = self->_editTracker;
  uint64_t v6 = [a3 originalRange];
  -[NSWritingToolsEditTracker addEditForSuggestionWithRange:lengthDelta:UUID:](editTracker, "addEditForSuggestionWithRange:lengthDelta:UUID:", v6, v7, [a3 lengthDelta], objc_msgSend(a3, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_suggestionsByUUID, "setObject:forKeyedSubscript:", a3, [a3 uuid]);
  suggestionsByRange = self->_suggestionsByRange;

  [(NSMutableArray *)suggestionsByRange addObject:a3];
}

- (void)addSuggestionWithUUID:(id)a3 originalRange:(_NSRange)a4 replacementString:(id)a5 completion:(id)a6
{
  NSUInteger length = (void *)a4.length;
  v9 = (void *)a4.location;
  if ([(NSMutableArray *)self->_suggestionsByRange lastObject])
  {
    uint64_t v12 = objc_msgSend((id)-[NSMutableArray lastObject](self->_suggestionsByRange, "lastObject"), "originalRange");
    BOOL v14 = v12 + v13 <= (unint64_t)v9;
  }
  else
  {
    BOOL v14 = 1;
  }
  uint64_t v15 = [(NSMutableDictionary *)self->_suggestionsByUUID objectForKeyedSubscript:a3];
  uint64_t v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  if (v15) {
    int v18 = 0;
  }
  else {
    int v18 = v14;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __105__NSWritingToolsProofreadingController_addSuggestionWithUUID_originalRange_replacementString_completion___block_invoke;
  v34[3] = &__block_descriptor_33_e18___NSString_16__0_8l;
  BOOL v35 = v14;
  _UIFoundationAssert(self, v17, v18, v34);
  if (v18 == 1)
  {
    uint64_t v19 = -[NSWritingToolsEditTracker rangeOfSuggestionWithRange:UUID:applyDelta:](self->_editTracker, "rangeOfSuggestionWithRange:UUID:applyDelta:", v9, length, a3, 0);
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = (void *)v19;
      v22 = v20;
      id v23 = a5;
      BOOL v24 = self->_delegateVersion == 1;
      objc_initWeak(&location, self);
      v25[1] = 3221225472;
      v25[0] = MEMORY[0x1E4F143A8];
      v26 = __105__NSWritingToolsProofreadingController_addSuggestionWithUUID_originalRange_replacementString_completion___block_invoke_2;
      v27 = &unk_1E55C6920;
      objc_copyWeak(v31, &location);
      v31[2] = length;
      v31[3] = 0;
      BOOL v32 = v24;
      id v28 = a3;
      v29 = self;
      v31[4] = v21;
      v31[5] = v22;
      v31[1] = v9;
      id v30 = a6;
      if (!-[NSWritingToolsProofreadingController replaceCharactersInRange:attributedString:state:identifier:completion:](self, "replaceCharactersInRange:attributedString:state:identifier:completion:", v21, v22, v23, 0, a3, v25))v26((uint64_t)v25, (uint64_t)a3, (uint64_t)v23, 1); {
      objc_destroyWeak(v31);
      }
      objc_destroyWeak(&location);
    }
  }
}

__CFString *__105__NSWritingToolsProofreadingController_addSuggestionWithUUID_originalRange_replacementString_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32)) {
    return @"suggestion with uuid already exists.";
  }
  else {
    return @"suggestion received out of sequential order.";
  }
}

uint64_t __105__NSWritingToolsProofreadingController_addSuggestionWithUUID_originalRange_replacementString_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4 && objc_loadWeak((id *)(a1 + 56)))
  {
    uint64_t v6 = -[NSWritingToolsProofreadingSuggestion initWithUUID:originalRange:replacementString:state:]([NSWritingToolsProofreadingSuggestion alloc], "initWithUUID:originalRange:replacementString:state:", *(void *)(a1 + 32), *(void *)(a1 + 64), *(void *)(a1 + 72), a3, *(void *)(a1 + 80));
    if (*(unsigned char *)(a1 + 104)) {
      objc_msgSend(objc_loadWeak((id *)(*(void *)(a1 + 40) + 32)), "proofreadingController:replaceCharactersInRange:withSuggestion:state:", *(void *)(a1 + 40), *(void *)(a1 + 88), *(void *)(a1 + 96), v6, 0);
    }
    [objc_loadWeak((id *)(a1 + 56)) _addSuggestion:v6];
    [*(id *)(a1 + 40) setFinished:0];
  }
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v7();
}

- (id)replacementTextForSuggestion:(id)a3 state:(int64_t)a4
{
  if (a4 == 3)
  {
    contextString = self->_contextString;
    uint64_t v7 = [a3 originalRange];
    return -[NSAttributedString attributedSubstringFromRange:](contextString, "attributedSubstringFromRange:", v7, v6);
  }
  else
  {
    return (id)[a3 replacementString];
  }
}

- (void)updateSuggestionWithUUID:(id)a3 state:(int64_t)a4 completion:(id)a5
{
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsByUUID, "objectForKeyedSubscript:");
  v10 = (objc_class *)objc_opt_class();
  BOOL v11 = NSStringFromClass(v10);
  _UIFoundationAssert(self, v11, v9 != 0, &__block_literal_global_61);
  if (!v9)
  {
    uint64_t v13 = (void (*)(id, id, void *))*((void *)a5 + 2);
    id v14 = a5;
    id v15 = a3;
    uint64_t v16 = 0;
LABEL_9:
    v13(v14, v15, v16);
    return;
  }
  BOOL v12 = ![v9 state] || objc_msgSend(v9, "state") == 1 || objc_msgSend(v9, "state") == 2;
  editTracker = self->_editTracker;
  uint64_t v18 = [v9 originalRange];
  uint64_t v20 = -[NSWritingToolsEditTracker rangeOfSuggestionWithRange:UUID:applyDelta:](editTracker, "rangeOfSuggestionWithRange:UUID:applyDelta:", v18, v19, [v9 uuid], v12);
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v9 setState:4];
    uint64_t v13 = (void (*)(id, id, void *))*((void *)a5 + 2);
    id v14 = a5;
    id v15 = a3;
    uint64_t v16 = v9;
    goto LABEL_9;
  }
  uint64_t v22 = v20;
  uint64_t v23 = v21;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v27 = __82__NSWritingToolsProofreadingController_updateSuggestionWithUUID_state_completion___block_invoke_2;
  id v28 = &unk_1E55C6948;
  objc_copyWeak(v31, &location);
  v31[1] = (id)a4;
  v29 = v9;
  id v30 = a5;
  id v24 = [(NSWritingToolsProofreadingController *)self replacementTextForSuggestion:v9 state:a4];
  if (!-[NSWritingToolsProofreadingController replaceCharactersInRange:attributedString:state:identifier:completion:](self, "replaceCharactersInRange:attributedString:state:identifier:completion:", v22, v23, v24, a4, a3, v26))
  {
    uint64_t v25 = objc_msgSend(objc_loadWeak((id *)&self->_delegate), "proofreadingController:replaceCharactersInRange:withSuggestion:state:", self, v22, v23, v9, a4);
    v27((uint64_t)v26, (uint64_t)a3, (uint64_t)v24, v25);
  }
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

__CFString *__82__NSWritingToolsProofreadingController_updateSuggestionWithUUID_state_completion___block_invoke()
{
  return @"suggestion updated before being added.";
}

uint64_t __82__NSWritingToolsProofreadingController_updateSuggestionWithUUID_state_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    if (objc_loadWeak((id *)(a1 + 48)))
    {
      objc_super v5 = (void *)[objc_loadWeak((id *)(a1 + 48)) editTracker];
      objc_msgSend(v5, "removeEditForSuggestionWithUUID:", objc_msgSend(*(id *)(a1 + 32), "uuid"));
      if (*(void *)(a1 + 56) != 3)
      {
        uint64_t v6 = [*(id *)(a1 + 32) originalRange];
        objc_msgSend(v5, "addEditForSuggestionWithRange:lengthDelta:UUID:", v6, v7, objc_msgSend(*(id *)(a1 + 32), "lengthDelta"), objc_msgSend(*(id *)(a1 + 32), "uuid"));
      }
    }
  }
  [*(id *)(a1 + 32) setState:*(void *)(a1 + 56)];
  v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v8();
}

- (void)_finalizeNextSuggestion:(id)a3 enumerator:(id)a4 state:(int64_t)a5 completion:(id)a6
{
  if (a3)
  {
    id v9 = a3;
    while (1)
    {
      if (![v9 state] || objc_msgSend(v9, "state") == 1)
      {
        editTracker = self->_editTracker;
        uint64_t v11 = [v9 originalRange];
        uint64_t v13 = -[NSWritingToolsEditTracker rangeOfSuggestionWithRange:UUID:applyDelta:](editTracker, "rangeOfSuggestionWithRange:UUID:applyDelta:", v11, v12, [v9 uuid], 1);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
      }
      id v9 = (id)[a4 nextObject];
      if (!v9) {
        goto LABEL_7;
      }
    }
    uint64_t v16 = v13;
    uint64_t v17 = v14;
    id v18 = [(NSWritingToolsProofreadingController *)self replacementTextForSuggestion:v9 state:a5];
    uint64_t v19 = [v9 uuid];
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    uint64_t v23 = __92__NSWritingToolsProofreadingController__finalizeNextSuggestion_enumerator_state_completion___block_invoke;
    id v24 = &unk_1E55C6948;
    v27[1] = (id)a5;
    objc_copyWeak(v27, &location);
    id v25 = a4;
    id v26 = a6;
    if (!-[NSWritingToolsProofreadingController replaceCharactersInRange:attributedString:state:identifier:completion:](self, "replaceCharactersInRange:attributedString:state:identifier:completion:", v16, v17, v18, a5, v19, v22))
    {
      uint64_t v20 = objc_msgSend(objc_loadWeak((id *)&self->_delegate), "proofreadingController:replaceCharactersInRange:withSuggestion:state:", self, v16, v17, v9, a5);
      ((void (*)(void *, uint64_t, id, uint64_t))v23)(v22, v19, v18, v20);
    }
    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_7:
    [(NSMutableArray *)self->_suggestionsByRange removeAllObjects];
    [(NSMutableDictionary *)self->_suggestionsByUUID removeAllObjects];
    [(NSWritingToolsProofreadingController *)self setFinished:1];
    id v15 = (void (*)(id))*((void *)a6 + 2);
    v15(a6);
  }
}

uint64_t __92__NSWritingToolsProofreadingController__finalizeNextSuggestion_enumerator_state_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 56) == 3) {
    objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(a1 + 48)), "editTracker"), "removeEditForSuggestionWithUUID:", a2);
  }
  id Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v4 = [*(id *)(a1 + 32) nextObject];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);

  return [Weak _finalizeNextSuggestion:v4 enumerator:v6 state:v5 completion:v7];
}

- (void)finish:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  if ([(NSWritingToolsProofreadingController *)self finished])
  {
    uint64_t v7 = (void (*)(id))*((void *)a4 + 2);
    v7(a4);
  }
  else
  {
    v8 = (void *)[(NSMutableArray *)self->_suggestionsByRange objectEnumerator];
    id v9 = v8;
    if (v5) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 3;
    }
    uint64_t v11 = [v8 nextObject];
    [(NSWritingToolsProofreadingController *)self _finalizeNextSuggestion:v11 enumerator:v9 state:v10 completion:a4];
  }
}

- (void)addSuggestionWithUUID:(id)a3 originalRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  int64_t delegateVersion = self->_delegateVersion;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __94__NSWritingToolsProofreadingController_addSuggestionWithUUID_originalRange_replacementString___block_invoke;
  uint64_t v14 = &unk_1E55C5DB8;
  id v15 = self;
  SEL v16 = a2;
  _UIFoundationAssert(self, @"NSWritingTools", delegateVersion != 0, &v11);
  -[NSWritingToolsProofreadingController addSuggestionWithUUID:originalRange:replacementString:completion:](self, "addSuggestionWithUUID:originalRange:replacementString:completion:", a3, location, length, a5, &__block_literal_global_70, v11, v12, v13, v14);
}

uint64_t __94__NSWritingToolsProofreadingController_addSuggestionWithUUID_originalRange_replacementString___block_invoke(uint64_t a1)
{
  v2 = NSString;
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  return [v2 stringWithFormat:@"Synchronous %@ invoked with aynchronous %@", v3, objc_loadWeak((id *)(*(void *)(a1 + 32) + 32))];
}

- (void)updateSuggestionWithUUID:(id)a3 state:(int64_t)a4
{
  int64_t delegateVersion = self->_delegateVersion;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __71__NSWritingToolsProofreadingController_updateSuggestionWithUUID_state___block_invoke;
  uint64_t v11 = &unk_1E55C5DB8;
  uint64_t v12 = self;
  SEL v13 = a2;
  _UIFoundationAssert(self, @"NSWritingTools", delegateVersion != 0, &v8);
  -[NSWritingToolsProofreadingController updateSuggestionWithUUID:state:completion:](self, "updateSuggestionWithUUID:state:completion:", a3, a4, &__block_literal_global_72, v8, v9, v10, v11);
}

uint64_t __71__NSWritingToolsProofreadingController_updateSuggestionWithUUID_state___block_invoke(uint64_t a1)
{
  v2 = NSString;
  v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  return [v2 stringWithFormat:@"Synchronous %@ invoked with aynchronous %@", v3, objc_loadWeak((id *)(*(void *)(a1 + 32) + 32))];
}

- (void)finish:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t delegateVersion = self->_delegateVersion;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __47__NSWritingToolsProofreadingController_finish___block_invoke;
  uint64_t v9 = &unk_1E55C5DB8;
  uint64_t v10 = self;
  SEL v11 = a2;
  _UIFoundationAssert(self, @"NSWritingTools", delegateVersion != 0, &v6);
  -[NSWritingToolsProofreadingController finish:completion:](self, "finish:completion:", v3, &__block_literal_global_75, v6, v7, v8, v9);
}

uint64_t __47__NSWritingToolsProofreadingController_finish___block_invoke(uint64_t a1)
{
  v2 = NSString;
  BOOL v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  return [v2 stringWithFormat:@"Synchronous %@ invoked with aynchronous %@", v3, objc_loadWeak((id *)(*(void *)(a1 + 32) + 32))];
}

- (void)finish
{
  BOOL v3 = [(NSWritingToolsProofreadingController *)self acceptOpenSuggestionsInFinish];

  [(NSWritingToolsProofreadingController *)self finish:v3];
}

- (id)suggestionWithUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_suggestionsByUUID objectForKeyedSubscript:a3];
}

- (NSAttributedString)contextString
{
  return self->_contextString;
}

- (void)setContextString:(id)a3
{
}

- (NSWritingToolsProofreadingControllerDelegate)delegate
{
  return (NSWritingToolsProofreadingControllerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSWritingToolsEditTracker)editTracker
{
  return self->_editTracker;
}

- (void)setEditTracker:(id)a3
{
}

- (BOOL)acceptOpenSuggestionsInFinish
{
  return self->_acceptOpenSuggestionsInFinish;
}

- (void)setAcceptOpenSuggestionsInFinish:(BOOL)a3
{
  self->_acceptOpenSuggestionsInFinish = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableDictionary)suggestionsByUUID
{
  return self->_suggestionsByUUID;
}

- (void)setSuggestionsByUUID:(id)a3
{
}

- (NSMutableArray)suggestionsByRange
{
  return self->_suggestionsByRange;
}

- (void)setSuggestionsByRange:(id)a3
{
}

- (void).cxx_destruct
{
}

@end