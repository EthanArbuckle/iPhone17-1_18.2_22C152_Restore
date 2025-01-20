@interface SBAmbientChoiceRow
- (void)setPossibleChoicesFromDictionary:(id)a3 order:(id)a4;
@end

@implementation SBAmbientChoiceRow

- (void)setPossibleChoicesFromDictionary:(id)a3 order:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 allKeys];
  }
  v10 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__SBAmbientChoiceRow_setPossibleChoicesFromDictionary_order___block_invoke;
  v13[3] = &unk_1E6B00850;
  id v14 = v6;
  id v11 = v6;
  v12 = objc_msgSend(v10, "bs_compactMap:", v13);
  [(SBAmbientChoiceRow *)self setPossibleValues:v10];
  [(SBAmbientChoiceRow *)self setPossibleTitles:v12];
}

uint64_t __61__SBAmbientChoiceRow_setPossibleChoicesFromDictionary_order___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

@end