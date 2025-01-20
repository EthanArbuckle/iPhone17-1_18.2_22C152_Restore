@interface SBIconStateFolderPath
- (SBIconStateFolderPath)init;
- (id)folderDefaultNameAtIndex:(unint64_t)a3;
- (id)folderIndexPathAtIndex:(unint64_t)a3;
- (id)folderNameAtIndex:(unint64_t)a3;
- (id)folderUniqueIdentifierAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addFolderWithName:(id)a3 defaultName:(id)a4 uniqueIdentifier:(id)a5 indexPath:(id)a6;
- (void)enumerateFoldersUsingBlock:(id)a3;
@end

@implementation SBIconStateFolderPath

- (SBIconStateFolderPath)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBIconStateFolderPath;
  v2 = [(SBIconStateFolderPath *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    folderNames = v2->_folderNames;
    v2->_folderNames = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    folderDefaultNames = v2->_folderDefaultNames;
    v2->_folderDefaultNames = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    folderUniqueIdentifiers = v2->_folderUniqueIdentifiers;
    v2->_folderUniqueIdentifiers = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    folderPaths = v2->_folderPaths;
    v2->_folderPaths = v9;
  }
  return v2;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_folderNames count];
}

- (id)folderNameAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_folderNames objectAtIndex:a3];
}

- (id)folderDefaultNameAtIndex:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_folderDefaultNames objectAtIndex:a3];
  v4 = self;
  if (objc_opt_isKindOfClass()) {
    v5 = 0;
  }
  else {
    v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (id)folderUniqueIdentifierAtIndex:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_folderUniqueIdentifiers objectAtIndex:a3];
  v4 = self;
  if (objc_opt_isKindOfClass()) {
    v5 = 0;
  }
  else {
    v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (id)folderIndexPathAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_folderPaths objectAtIndex:a3];
}

- (void)addFolderWithName:(id)a3 defaultName:(id)a4 uniqueIdentifier:(id)a5 indexPath:(id)a6
{
  id v17 = a4;
  id v10 = a5;
  folderNames = self->_folderNames;
  id v12 = a6;
  [(NSMutableArray *)folderNames addObject:a3];
  folderDefaultNames = self->_folderDefaultNames;
  if (v17)
  {
    -[NSMutableArray addObject:](self->_folderDefaultNames, "addObject:");
  }
  else
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableArray *)folderDefaultNames addObject:v14];
  }
  folderUniqueIdentifiers = self->_folderUniqueIdentifiers;
  if (v10)
  {
    [(NSMutableArray *)self->_folderUniqueIdentifiers addObject:v10];
  }
  else
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableArray *)folderUniqueIdentifiers addObject:v16];
  }
  [(NSMutableArray *)self->_folderPaths addObject:v12];
}

- (void)enumerateFoldersUsingBlock:(id)a3
{
  id v4 = a3;
  folderNames = self->_folderNames;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SBIconStateFolderPath_enumerateFoldersUsingBlock___block_invoke;
  v7[3] = &unk_1E6AAE4E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)folderNames enumerateObjectsUsingBlock:v7];
}

void __52__SBIconStateFolderPath_enumerateFoldersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v9 = [v5 folderDefaultNameAtIndex:a3];
  v7 = [*(id *)(a1 + 32) folderUniqueIdentifierAtIndex:a3];
  id v8 = [*(id *)(a1 + 32) folderIndexPathAtIndex:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderPaths, 0);
  objc_storeStrong((id *)&self->_folderUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_folderDefaultNames, 0);
  objc_storeStrong((id *)&self->_folderNames, 0);
}

@end