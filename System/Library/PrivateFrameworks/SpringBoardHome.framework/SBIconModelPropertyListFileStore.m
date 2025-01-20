@interface SBIconModelPropertyListFileStore
- (BOOL)_delete:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)_save:(id)a3 url:(id)a4 error:(id *)a5;
- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4;
- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4;
- (NSString)description;
- (NSURL)currentIconStateURL;
- (NSURL)desiredIconStateURL;
- (SBIconModelPropertyListFileStore)init;
- (SBIconModelPropertyListFileStore)initWithIconStateURL:(id)a3 desiredIconStateURL:(id)a4;
- (id)_load:(id)a3 error:(id *)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)loadCurrentIconState:(id *)a3;
- (id)loadDesiredIconState:(id *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation SBIconModelPropertyListFileStore

- (SBIconModelPropertyListFileStore)initWithIconStateURL:(id)a3 desiredIconStateURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBIconModelPropertyListFileStore;
  v8 = [(SBIconModelPropertyListFileStore *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    currentIconStateURL = v8->_currentIconStateURL;
    v8->_currentIconStateURL = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    desiredIconStateURL = v8->_desiredIconStateURL;
    v8->_desiredIconStateURL = (NSURL *)v11;
  }
  return v8;
}

- (SBIconModelPropertyListFileStore)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v4 = [v3 URLForDirectory:9 inDomain:1 appropriateForURL:0 create:1 error:0];
  v5 = [v4 URLByAppendingPathComponent:@"IconState.plist"];
  id v6 = [v4 URLByAppendingPathComponent:@"DesiredIconState.plist"];
  id v7 = [(SBIconModelPropertyListFileStore *)self initWithIconStateURL:v5 desiredIconStateURL:v6];

  return v7;
}

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  return [(SBIconModelPropertyListFileStore *)self _save:a3 url:self->_currentIconStateURL error:a4];
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  return [(SBIconModelPropertyListFileStore *)self _save:a3 url:self->_desiredIconStateURL error:a4];
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return [(SBIconModelPropertyListFileStore *)self _delete:self->_currentIconStateURL options:a3 error:a4];
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return [(SBIconModelPropertyListFileStore *)self _delete:self->_desiredIconStateURL options:a3 error:a4];
}

- (id)loadCurrentIconState:(id *)a3
{
  return [(SBIconModelPropertyListFileStore *)self _load:self->_currentIconStateURL error:a3];
}

- (id)loadDesiredIconState:(id *)a3
{
  return [(SBIconModelPropertyListFileStore *)self _load:self->_desiredIconStateURL error:a3];
}

- (id)_load:(id)a3 error:(id *)a4
{
  v4 = a4;
  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:0 error:a4];
  if (!v5)
  {
    if (!v4) {
      goto LABEL_21;
    }
    id v9 = *v4;
    if (v9)
    {
      v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E4F28A50], 0);
    }
    else
    {
      v10 = 0;
    }
    uint64_t v11 = [v9 domain];
    if ([v11 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v12 = [v9 code];

      if (v12 == 260)
      {
        uint64_t v13 = 2;
LABEL_20:
        id *v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBIconModelStoreDomain" code:v13 userInfo:v10];

        v4 = 0;
        goto LABEL_21;
      }
    }
    else
    {
    }
    uint64_t v13 = 1;
    goto LABEL_20;
  }
  id v15 = 0;
  id v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v15];
  id v7 = v15;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v6;
  }
  else if (v4)
  {
    if (v7)
    {
      v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E4F28A50], 0);
    }
    else
    {
      v8 = 0;
    }
    id *v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBIconModelStoreDomain" code:1 userInfo:v8];

    v4 = 0;
  }

LABEL_21:
  return v4;
}

- (BOOL)_delete:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v7 = a3;
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v6)
  {
    id v22 = 0;
    if ([v7 getResourceValue:&v22 forKey:*MEMORY[0x1E4F1C5F8] error:0])
    {
      unint64_t v9 = [v22 unsignedLongLongValue];
      size_t v10 = v9 >= 0x10000 ? 0x10000 : v9;
      uint64_t v11 = malloc_type_calloc(1uLL, v10, 0xB15FE3D8uLL);
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v11 length:v10 freeWhenDone:0];
        if (v13)
        {
          objc_super v14 = [MEMORY[0x1E4F28CB0] fileHandleForUpdatingURL:v7 error:0];
          [v14 writeData:v13];
          [v14 closeFile];
        }
        free(v12);
      }
    }
  }
  id v21 = 0;
  char v15 = [v8 removeItemAtURL:v7 error:&v21];
  id v16 = v21;
  v17 = v16;
  if (v15)
  {
    BOOL v18 = 1;
  }
  else
  {
    v19 = [v16 domain];
    if ([v19 isEqualToString:*MEMORY[0x1E4F281F8]]) {
      BOOL v18 = [v17 code] == 4;
    }
    else {
      BOOL v18 = 0;
    }

    if (a5 && !v18)
    {
      BOOL v18 = 0;
      *a5 = v17;
    }
  }

  return v18;
}

- (BOOL)_save:(id)a3 url:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v8 URLByDeletingLastPathComponent];
  size_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v11 = [v8 path];
  char v12 = [v10 fileExistsAtPath:v11];

  if ((v12 & 1) != 0
    || [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:a5])
  {
    uint64_t v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:a5];
    objc_super v14 = v13;
    if (v13) {
      char v15 = [v13 writeToURL:v8 options:268435457 error:a5];
    }
    else {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (NSString)description
{
  return (NSString *)[(SBIconModelPropertyListFileStore *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBIconModelPropertyListFileStore *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v5 = [(SBIconModelPropertyListFileStore *)self currentIconStateURL];
  id v6 = (id)[v4 appendObject:v5 withName:@"currentIconStateURL"];

  id v7 = [(SBIconModelPropertyListFileStore *)self desiredIconStateURL];
  id v8 = (id)[v4 appendObject:v7 withName:@"desiredIconStateURL"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBIconModelPropertyListFileStore *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (NSURL)currentIconStateURL
{
  return self->_currentIconStateURL;
}

- (NSURL)desiredIconStateURL
{
  return self->_desiredIconStateURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredIconStateURL, 0);
  objc_storeStrong((id *)&self->_currentIconStateURL, 0);
}

@end