@interface ICConvertToSmartFolderDecision
+ (BOOL)canShowConvertToSmartFolder:(id)a3;
- (ICConvertToSmartFolderDecision)initWithSourceFolder:(id)a3;
- (ICFolder)sourceFolder;
- (unint64_t)additionalStep;
- (unint64_t)type;
- (void)makeDecision;
- (void)setAdditionalStep:(unint64_t)a3;
- (void)setSourceFolder:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation ICConvertToSmartFolderDecision

- (ICConvertToSmartFolderDecision)initWithSourceFolder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICConvertToSmartFolderDecision;
  v6 = [(ICConvertToSmartFolderDecision *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceFolder, a3);
    [(ICConvertToSmartFolderDecision *)v7 makeDecision];
  }

  return v7;
}

- (void)makeDecision
{
  v3 = [(ICConvertToSmartFolderDecision *)self sourceFolder];
  unsigned int v4 = [v3 isSystemFolder];

  id v5 = self;
  if (v4
    || ([(ICConvertToSmartFolderDecision *)self sourceFolder],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isSmartFolder],
        v6,
        id v5 = self,
        v7))
  {
    [(ICConvertToSmartFolderDecision *)v5 setType:1];
    v8 = self;
    uint64_t v9 = 0;
LABEL_4:
    [(ICConvertToSmartFolderDecision *)v8 setAdditionalStep:v9];
    return;
  }
  v10 = [(ICConvertToSmartFolderDecision *)self sourceFolder];
  unsigned int v11 = [v10 isSharedViaICloud];

  if (v11)
  {
    [(ICConvertToSmartFolderDecision *)self setType:2];
    v8 = self;
    uint64_t v9 = 3;
    goto LABEL_4;
  }
  v12 = [(ICConvertToSmartFolderDecision *)self sourceFolder];
  v13 = [v12 visibleSubFolders];
  id v14 = [v13 count];

  if (v14)
  {
    [(ICConvertToSmartFolderDecision *)self setType:2];
    v8 = self;
    uint64_t v9 = 4;
    goto LABEL_4;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v15 = [(ICConvertToSmartFolderDecision *)self sourceFolder];
  v16 = [v15 visibleNotesIncludingChildFolders];

  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    uint64_t v20 = 6;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v22 isPasswordProtected]) {
          goto LABEL_23;
        }
        if ([v22 isSharedViaICloud])
        {
          uint64_t v20 = 5;
LABEL_23:
          [(ICConvertToSmartFolderDecision *)self setType:2];
          [(ICConvertToSmartFolderDecision *)self setAdditionalStep:v20];

          return;
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  v23 = [(ICConvertToSmartFolderDecision *)self sourceFolder];
  v24 = [v23 parent];

  [(ICConvertToSmartFolderDecision *)self setType:0];
  if (v24) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 1;
  }
  [(ICConvertToSmartFolderDecision *)self setAdditionalStep:v25];
}

+ (BOOL)canShowConvertToSmartFolder:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [[ICConvertToSmartFolderDecision alloc] initWithSourceFolder:v3];

  LOBYTE(v3) = (id)[(ICConvertToSmartFolderDecision *)v4 type] != (id)1;
  return (char)v3;
}

- (ICFolder)sourceFolder
{
  return self->_sourceFolder;
}

- (void)setSourceFolder:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)additionalStep
{
  return self->_additionalStep;
}

- (void)setAdditionalStep:(unint64_t)a3
{
  self->_additionalStep = a3;
}

- (void).cxx_destruct
{
}

@end