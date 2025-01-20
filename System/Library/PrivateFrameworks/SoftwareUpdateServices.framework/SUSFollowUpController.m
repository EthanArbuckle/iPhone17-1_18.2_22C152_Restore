@interface SUSFollowUpController
+ (id)sharedController;
+ (id)stringForSUSFollowUpType:(unint64_t)a3;
- (BOOL)_isCurrentlyPresentingFollowUpType:(unint64_t)a3 currentFollowUps:(id)a4;
- (BOOL)isBadgeOnlyFollowUpCurrentlyBeingPresented;
- (BOOL)isCurrentlyPresentingFollowUpType:(unint64_t)a3;
- (BOOL)isCurrentlyPresentingFollowUpTypes:(id)a3 presentationOption:(unint64_t)a4;
- (BOOL)isfollowUpSUSRelated:(id)a3;
- (FLFollowUpController)followUpController;
- (SUSFollowUpController)init;
- (id)getCurrentSUSFollowUpItems;
- (id)identifierForSUFollowUpType:(unint64_t)a3;
- (id)identifiersForSUFollowUpTypes:(id)a3;
- (void)SUSFollowUpControllerBadgeSettings:(id)a3;
- (void)SUSFollowUpControllerUnbadgeSettings;
- (void)dismissAllSUFollowUps;
- (void)dismissFollowUpType:(unint64_t)a3;
- (void)dismissFollowUpTypes:(id)a3;
- (void)dismissFollowUpWithIdentifiers:(id)a3;
- (void)dismissLegacyFollowUps;
- (void)postFollowUpItem:(id)a3;
- (void)postFollowUpOfType:(unint64_t)a3 withUpdate:(id)a4 userInfo:(id)a5;
- (void)setFollowUpController:(id)a3;
@end

@implementation SUSFollowUpController

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedController_sharedInstance;
  return v2;
}

- (BOOL)isCurrentlyPresentingFollowUpType:(unint64_t)a3
{
  v5 = [(SUSFollowUpController *)self getCurrentSUSFollowUpItems];
  LOBYTE(a3) = [(SUSFollowUpController *)self _isCurrentlyPresentingFollowUpType:a3 currentFollowUps:v5];

  return a3;
}

- (id)getCurrentSUSFollowUpItems
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  followUpController = self->_followUpController;
  id v18 = 0;
  v4 = [(FLFollowUpController *)followUpController pendingFollowUpItems:&v18];
  id v5 = v18;
  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (-[SUSFollowUpController isfollowUpSUSRelated:](self, "isfollowUpSUSRelated:", v12, (void)v14)) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_isCurrentlyPresentingFollowUpType:(unint64_t)a3 currentFollowUps:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    uint64_t v8 = [(SUSFollowUpController *)self identifierForSUFollowUpType:a3];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = v7;
    uint64_t v10 = (void *)[v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = [*(id *)(*((void *)&v30 + 1) + 8 * i) uniqueIdentifier];
          int v14 = [v13 isEqualToString:v8];

          if (v14)
          {
            uint64_t v10 = SULogFollowUp();
            SULogInfoForSubsystem(v10, @"FollowUp with identifier \"%@\" is currently presented", v22, v23, v24, v25, v26, v27, (uint64_t)v8);

            LOBYTE(v10) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v10 = (void *)[v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    long long v15 = SULogFollowUp();
    SULogInfoForSubsystem(v15, @"No SUS followup is currently presented", v16, v17, v18, v19, v20, v21, v29);

    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (BOOL)isBadgeOnlyFollowUpCurrentlyBeingPresented
{
  return [(SUSFollowUpController *)self isCurrentlyPresentingFollowUpType:0];
}

uint64_t __41__SUSFollowUpController_sharedController__block_invoke()
{
  sharedController_sharedInstance = objc_alloc_init(SUSFollowUpController);
  return MEMORY[0x270F9A758]();
}

- (SUSFollowUpController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUSFollowUpController;
  v2 = [(SUSFollowUpController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.SoftwareUpdateServices.followup"];
    followUpController = v2->_followUpController;
    v2->_followUpController = (FLFollowUpController *)v3;
  }
  return v2;
}

- (BOOL)isCurrentlyPresentingFollowUpTypes:(id)a3 presentationOption:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [(SUSFollowUpController *)self getCurrentSUSFollowUpItems];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v4 = -[SUSFollowUpController _isCurrentlyPresentingFollowUpType:currentFollowUps:](self, "_isCurrentlyPresentingFollowUpType:currentFollowUps:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15), v8);
        if (v4)
        {
          if (a4 == 1)
          {
            LOBYTE(a4) = 0;
            goto LABEL_13;
          }
        }
        else if (!a4)
        {
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  LOBYTE(a4) = 1;
LABEL_13:

  return (v4 | a4) & 1;
}

- (BOOL)isfollowUpSUSRelated:(id)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = +[SUSFollowUpBadgeOnly identifier];
  v11[0] = v4;
  id v5 = +[SUSFollowUpUpdateAvailable identifier];
  v11[1] = v5;
  objc_super v6 = +[SUSFollowUpAutoUpdate identifier];
  v11[2] = v6;
  id v7 = +[SUSFollowUpInsufficientDiskSpace identifier];
  v11[3] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
  id v9 = [v3 uniqueIdentifier];

  LOBYTE(v3) = [v8 containsObject:v9];
  return (char)v3;
}

- (void)dismissAllSUFollowUps
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = [(SUSFollowUpController *)self getCurrentSUSFollowUpItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) uniqueIdentifier];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(SUSFollowUpController *)self dismissFollowUpWithIdentifiers:v3];
}

- (void)dismissFollowUpType:(unint64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  BOOL v4 = [(SUSFollowUpController *)self identifierForSUFollowUpType:a3];
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [(SUSFollowUpController *)self dismissFollowUpWithIdentifiers:v5];
}

- (void)dismissFollowUpTypes:(id)a3
{
  id v4 = [(SUSFollowUpController *)self identifiersForSUFollowUpTypes:a3];
  [(SUSFollowUpController *)self dismissFollowUpWithIdentifiers:v4];
}

- (void)dismissFollowUpWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SULogFollowUp();
  SULogInfoForSubsystem(v5, @"Dismissing FollowUps with identifiers: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);

  long long v12 = [(SUSFollowUpController *)self followUpController];
  id v21 = 0;
  [v12 clearPendingFollowUpItemsWithUniqueIdentifiers:v4 error:&v21];

  id v13 = v21;
  if (v13)
  {
    int v14 = SULogFollowUp();
    SULogErrorForSubsystem(v14, @"error clearing pending followUp item: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v13);
  }
}

- (id)identifiersForSUFollowUpTypes:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[SUSFollowUpController identifierForSUFollowUpType:](self, "identifierForSUFollowUpType:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue", (void)v13));
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)identifierForSUFollowUpType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v4 = SUSFollowUpBadgeOnly;
      goto LABEL_7;
    case 1uLL:
      id v4 = SUSFollowUpUpdateAvailable;
      goto LABEL_7;
    case 2uLL:
      id v4 = SUSFollowUpAutoUpdate;
      goto LABEL_7;
    case 3uLL:
      id v4 = SUSFollowUpInsufficientDiskSpace;
LABEL_7:
      long long v12 = [(__objc2_class *)v4 identifier];
      break;
    default:
      id v5 = SULogFollowUp();
      SULogInfoForSubsystem(v5, @"Unknown SUSFollowUpType: %ld", v6, v7, v8, v9, v10, v11, a3);

      long long v12 = 0;
      break;
  }
  return v12;
}

- (void)postFollowUpOfType:(unint64_t)a3 withUpdate:(id)a4 userInfo:(id)a5
{
  id v53 = a4;
  id v8 = a5;
  uint64_t v9 = +[SUPreferences sharedInstance];
  int v10 = [v9 disableFollowUps];

  if (v10)
  {
    uint64_t v11 = SULogFollowUp();
    long long v12 = +[SUSFollowUpController stringForSUSFollowUpType:a3];
    SULogInfoForSubsystem(v11, @"Skipping post of %@ followup item because preference is set", v13, v14, v15, v16, v17, v18, (uint64_t)v12);

LABEL_11:
    goto LABEL_12;
  }
  switch(a3)
  {
    case 0uLL:
      uint64_t v19 = SULogFollowUp();
      SULogInfoForSubsystem(v19, @"Attempting to post SUSFollowUpBadgeOnly item", v20, v21, v22, v23, v24, v25, v52);
      uint64_t v26 = off_26447C208;
      break;
    case 1uLL:
      uint64_t v19 = SULogFollowUp();
      SULogInfoForSubsystem(v19, @"Attempting to post SUSFollowUpUpdateAvailable item", v33, v34, v35, v36, v37, v38, v52);
      uint64_t v26 = off_26447C220;
      break;
    case 2uLL:
      uint64_t v19 = SULogFollowUp();
      SULogInfoForSubsystem(v19, @"Attempting to post SUSFollowUpAutoUpdate item", v39, v40, v41, v42, v43, v44, v52);
      uint64_t v26 = off_26447C200;
      break;
    case 3uLL:
      uint64_t v19 = SULogFollowUp();
      SULogInfoForSubsystem(v19, @"Attempting to post SUSFollowUpTypeInsufficientDiskSpace item", v45, v46, v47, v48, v49, v50, v52);
      uint64_t v26 = off_26447C218;
      break;
    default:
      uint64_t v11 = SULogFollowUp();
      SULogInfoForSubsystem(v11, @"Unknown SUSFollowUpType (%ld). Unable to create FollowUp", v27, v28, v29, v30, v31, v32, a3);
      goto LABEL_11;
  }

  uint64_t v51 = [(__objc2_class *)*v26 generateFollowUpWithDescriptor:v53 userInfo:v8];
  if (v51)
  {
    uint64_t v11 = (void *)v51;
    [(SUSFollowUpController *)self postFollowUpItem:v51];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)postFollowUpItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(SUSFollowUpController *)self dismissAllSUFollowUps];
    followUpController = self->_followUpController;
    id v23 = 0;
    int v6 = [(FLFollowUpController *)followUpController postFollowUpItem:v4 error:&v23];
    id v7 = v23;
    id v8 = SULogFollowUp();
    uint64_t v15 = v8;
    if (v6) {
      SULogInfoForSubsystem(v8, @"Successfully posted FollowUp item: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v4);
    }
    else {
      SULogInfoForSubsystem(v8, @"Failed to post FollowUp item: %@ Error: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v4);
    }
  }
  else
  {
    SULogFollowUp();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v7, @"Unable to post null FollowUp item", v16, v17, v18, v19, v20, v21, v22);
  }
}

+ (id)stringForSUSFollowUpType:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Unknonw Type";
  }
  else {
    return off_26447C828[a3];
  }
}

- (void)SUSFollowUpControllerBadgeSettings:(id)a3
{
  id v12 = a3;
  id v4 = SULogFollowUp();
  SULogInfoForSubsystem(v4, @"Got request to badge settings via followUp", v5, v6, v7, v8, v9, v10, v11);

  [(SUSFollowUpController *)self dismissAllSUFollowUps];
  [(SUSFollowUpController *)self postFollowUpOfType:0 withUpdate:v12 userInfo:0];
}

- (void)SUSFollowUpControllerUnbadgeSettings
{
  id v3 = SULogFollowUp();
  SULogInfoForSubsystem(v3, @"Got request to unbadge settings via followUp", v4, v5, v6, v7, v8, v9, v10);

  [(SUSFollowUpController *)self dismissFollowUpType:0];
}

- (void)dismissLegacyFollowUps
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = SUSFollowUpUniqueIdentifierLegacy;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [(SUSFollowUpController *)self dismissFollowUpWithIdentifiers:v3];
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end