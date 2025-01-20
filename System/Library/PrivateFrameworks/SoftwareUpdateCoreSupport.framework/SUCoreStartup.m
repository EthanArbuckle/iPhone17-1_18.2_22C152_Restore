@interface SUCoreStartup
+ (id)initializeSharedStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5;
- (id)_initAtStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5;
@end

@implementation SUCoreStartup

+ (id)initializeSharedStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SUCoreStartup_initializeSharedStartup_usingDomain_usingFilesystemDir___block_invoke;
  block[3] = &unk_1E60B74B0;
  id v16 = v8;
  int64_t v17 = a3;
  id v15 = v7;
  uint64_t v9 = initializeSharedStartup_usingDomain_usingFilesystemDir__startupOnce;
  id v10 = v8;
  id v11 = v7;
  if (v9 != -1) {
    dispatch_once(&initializeSharedStartup_usingDomain_usingFilesystemDir__startupOnce, block);
  }
  id v12 = (id)initializeSharedStartup_usingDomain_usingFilesystemDir__startup;

  return v12;
}

uint64_t __72__SUCoreStartup_initializeSharedStartup_usingDomain_usingFilesystemDir___block_invoke(void *a1)
{
  initializeSharedStartup_usingDomain_usingFilesystemDir__startup = [[SUCoreStartup alloc] _initAtStartup:a1[6] usingDomain:a1[4] usingFilesystemDir:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (id)_initAtStartup:(int64_t)a3 usingDomain:(id)a4 usingFilesystemDir:(id)a5
{
  char v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SUCoreStartup;
  id v10 = [(SUCoreStartup *)&v17 init];
  if (!v10) {
    goto LABEL_7;
  }
  if (v6)
  {
    v13 = +[SUCore sharedCore];
    v14 = v13;
    if (v8) {
      [v13 useDomain:v8];
    }
    if (v9) {
      [v14 useFilesystemBaseDir:v9];
    }

    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
LABEL_14:
      id v16 = +[SUCoreEventReporter sharedReporter];
      if ((v6 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }
  id v15 = +[SUCoreLog sharedLogger];
  if ((v6 & 4) != 0) {
    goto LABEL_14;
  }
LABEL_5:
  if ((v6 & 8) != 0) {
LABEL_6:
  }
    id v11 = +[SUCoreDiag sharedDiag];
LABEL_7:

  return v10;
}

@end