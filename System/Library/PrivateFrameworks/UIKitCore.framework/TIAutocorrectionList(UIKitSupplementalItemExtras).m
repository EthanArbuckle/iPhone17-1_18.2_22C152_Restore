@interface TIAutocorrectionList(UIKitSupplementalItemExtras)
- (id)ui_allSupplementalCandidates;
@end

@implementation TIAutocorrectionList(UIKitSupplementalItemExtras)

- (id)ui_allSupplementalCandidates
{
  char v2 = objc_opt_respondsToSelector();
  v3 = (void *)MEMORY[0x1E4F1CBF0];
  v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2)
  {
    v4 = [a1 predictionsIfSupplemental];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([a1 autocorrectionIfSupplemental], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count") + 1);
    [v7 addObject:v6];
    if (v4) {
      v8 = v4;
    }
    else {
      v8 = v3;
    }
    [v7 addObjectsFromArray:v8];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

@end