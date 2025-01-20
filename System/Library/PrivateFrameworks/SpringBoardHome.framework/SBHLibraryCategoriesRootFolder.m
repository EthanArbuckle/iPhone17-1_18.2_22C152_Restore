@interface SBHLibraryCategoriesRootFolder
- (BOOL)supportsBadging;
- (void)enumerateAllIconsWithBaseIndexPath:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)setSupportsBadging:(BOOL)a3;
@end

@implementation SBHLibraryCategoriesRootFolder

- (BOOL)supportsBadging
{
  return self->_supportsBadging;
}

- (void)setSupportsBadging:(BOOL)a3
{
  if (self->_supportsBadging != a3)
  {
    self->_supportsBadging = a3;
    id v3 = [(SBRootFolder *)self model];
    [v3 enumerateLeafIconsUsingBlock:&__block_literal_global_77];
  }
}

uint64_t __53__SBHLibraryCategoriesRootFolder_setSupportsBadging___block_invoke(uint64_t a1, void *a2)
{
  return [a2 noteBadgeDidChange];
}

- (void)enumerateAllIconsWithBaseIndexPath:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__SBHLibraryCategoriesRootFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke;
  v12[3] = &unk_1E6AAF500;
  BOOL v16 = (a4 & 2) != 0;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  [(SBFolder *)self enumerateListsUsingBlock:v12];
}

void __88__SBHLibraryCategoriesRootFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = v7;
  if (!*(unsigned char *)(a1 + 56) || ([v7 isHidden] & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__SBHLibraryCategoriesRootFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke_2;
    v10[3] = &unk_1E6AAF4D8;
    uint64_t v13 = a3;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v14 = a4;
    uint64_t v15 = v9;
    [v8 enumerateIconsUsingBlock:v10];
  }
}

void __88__SBHLibraryCategoriesRootFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [MEMORY[0x1E4F28D58] indexPathWithIconIndex:a3 listIndex:a1[6]];
  id v7 = objc_msgSend(v6, "bs_indexPathByAddingPrefix:", a1[4]);
  (*(void (**)(void))(a1[5] + 16))();
  if [v5 isFolderIcon] && (a1[8])
  {
    id v8 = [v5 folder];
    [v8 enumerateAllIconsWithBaseIndexPath:v7 options:a1[8] usingBlock:a1[5]];
    goto LABEL_7;
  }
  if [v5 isCategoryIcon] && (a1[8])
  {
    id v8 = [v5 category];
    uint64_t v9 = [v8 expandedPodFolder];
    [v9 enumerateAllIconsWithBaseIndexPath:v7 options:a1[8] usingBlock:a1[5]];

LABEL_7:
  }
}

@end