@interface SBSUISystemNotesWindowSceneBSActionsHandler
- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation SBSUISystemNotesWindowSceneBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v27 = (id)[v7 mutableCopy];
  v9 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v25 = v8;
    id v11 = v8;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      uint64_t v26 = *MEMORY[0x1E4F4F600];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v18 = self;
          char v19 = objc_opt_isKindOfClass();

          if (v19)
          {
            [v27 removeObject:v17];
            v20 = [v11 delegate];
            if ([v20 conformsToProtocol:&unk_1EFD5B260]
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              [v20 notesSceneDidReceiveCreateNewNoteRequest:v11];
              v21 = [MEMORY[0x1E4F4F678] response];
              [v17 sendResponse:v21];
            }
            else
            {
              v22 = (void *)MEMORY[0x1E4F4F678];
              v21 = [MEMORY[0x1E4F28C58] errorWithDomain:v26 code:1 userInfo:0];
              v23 = [v22 responseForError:v21];
              [v17 sendResponse:v23];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    id v8 = v25;
  }

  return v27;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  long long v29 = self;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = v9;
  uint64_t v15 = (void *)[v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v15)
  {
    v18 = 0;
    v24 = v14;
    goto LABEL_14;
  }
  id v30 = v12;
  id v16 = v11;
  id v17 = v10;
  v18 = 0;
  uint64_t v19 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v32 != v19) {
        objc_enumerationMutation(v14);
      }
      v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v21;

        v18 = v22;
      }
      else
      {
        objc_msgSend(v13, "addObject:", v21, v29);
      }
    }
    uint64_t v15 = (void *)[v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v15);

  if (v18)
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "connectionSource"));
    id v25 = [v23 setWithObject:v24];
    [v15 setValue:v25 forKey:@"_SBSUISystemNotesWindowSceneConnectionOptionsSceneConnectionSourceKey"];

    id v10 = v17;
    id v11 = v16;
    id v12 = v30;
LABEL_14:

    goto LABEL_16;
  }
  uint64_t v15 = 0;
  id v10 = v17;
  id v11 = v16;
  id v12 = v30;
LABEL_16:
  uint64_t v26 = SBLogSystemNotes();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[SBSUISystemNotesWindowSceneBSActionsHandler _launchOptionsFromActions:forFBSScene:uiSceneSession:transitionContext:]((uint64_t)v29, (uint64_t)v15, v26);
  }

  id v27 = objc_alloc_init(MEMORY[0x1E4F432D8]);
  [v27 setLaunchOptionsDictionary:v15];
  [v27 setUnprocessedActions:v13];

  return v27;
}

- (void)_launchOptionsFromActions:(NSObject *)a3 forFBSScene:uiSceneSession:transitionContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_debug_impl(&dword_1A7607000, a3, OS_LOG_TYPE_DEBUG, "[%@] passing launchOptions: %@", (uint8_t *)&v6, 0x16u);
}

@end