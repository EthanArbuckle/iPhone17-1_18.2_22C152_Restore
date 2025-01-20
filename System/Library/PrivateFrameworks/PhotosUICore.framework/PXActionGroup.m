@interface PXActionGroup
- (NSArray)actions;
- (NSString)actionNameLocalizationKey;
- (NSString)localizedActionName;
- (PXActionGroup)init;
- (PXActionGroup)initWithActions:(id)a3;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
- (void)setActionNameLocalizationKey:(id)a3;
- (void)setActions:(id)a3;
- (void)setLocalizedActionName:(id)a3;
@end

@implementation PXActionGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->localizedActionName, 0);
  objc_storeStrong((id *)&self->actionNameLocalizationKey, 0);
}

- (void)setActions:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setLocalizedActionName:(id)a3
{
}

- (NSString)localizedActionName
{
  return self->localizedActionName;
}

- (void)setActionNameLocalizationKey:(id)a3
{
}

- (NSString)actionNameLocalizationKey
{
  return self->actionNameLocalizationKey;
}

- (void)performRedo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5841;
  v19 = __Block_byref_object_dispose__5842;
  id v20 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(PXActionGroup *)self actions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v5);
      }
      v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __29__PXActionGroup_performRedo___block_invoke;
      v10[3] = &unk_1E5DD1A60;
      v10[4] = &v21;
      v10[5] = &v15;
      [v9 performRedo:v10];
      if (v16[5]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v25 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v4[2](v4, *((unsigned __int8 *)v22 + 24), v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __29__PXActionGroup_performRedo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (v6)
  {
    id v9 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v9;
  }
}

- (void)performUndo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5841;
  v19 = __Block_byref_object_dispose__5842;
  id v20 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(PXActionGroup *)self actions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __29__PXActionGroup_performUndo___block_invoke;
      v10[3] = &unk_1E5DD1A60;
      v10[4] = &v21;
      v10[5] = &v15;
      [v9 performUndo:v10];
      if (v16[5]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v25 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v4[2](v4, *((unsigned __int8 *)v22 + 24), v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __29__PXActionGroup_performUndo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (v6)
  {
    id v9 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v9;
  }
}

- (void)performAction:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, uint64_t))a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5841;
  v19 = __Block_byref_object_dispose__5842;
  id v20 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(PXActionGroup *)self actions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __31__PXActionGroup_performAction___block_invoke;
      v10[3] = &unk_1E5DD1A60;
      v10[4] = &v21;
      v10[5] = &v15;
      [v9 performAction:v10];
      if (v16[5]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v25 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v4[2](v4, *((unsigned __int8 *)v22 + 24), v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

void __31__PXActionGroup_performAction___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (v6)
  {
    id v9 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v9;
  }
}

- (PXActionGroup)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXActionGroup.m", 36, @"%s is not available as initializer", "-[PXActionGroup init]");

  abort();
}

- (PXActionGroup)initWithActions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXActionGroup;
  v5 = [(PXActionGroup *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v6;

    char v8 = v5;
  }

  return v5;
}

@end