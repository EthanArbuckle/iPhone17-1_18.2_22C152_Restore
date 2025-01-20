@interface WFTopHitItemContextualAction
+ (WFContextualActionParameter)disambiguationParameter;
+ (WFTopHitItemContextualAction)disambiguationAction;
+ (id)actionForCallDescriptor:(id)a3 namedQueryInfo:(id)a4;
+ (id)availableCollectionIdentifiers;
+ (id)disambiguationEntriesForCollection:(id)a3 limit:(int64_t)a4 error:(id *)a5;
+ (id)disambiguationSummaryStringForCollection:(id)a3;
+ (id)disambiguationSummaryStringWithParameterDefined:(BOOL)a3;
+ (id)supportedBundleIdentifiers;
+ (void)disambiguationEntriesForCollection:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5;
+ (void)getTopHitContextualActionsForType:(unint64_t)a3 limit:(int64_t)a4 completion:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSSecureCoding)item;
- (WFAppShortcutNamedQueryInfo)namedQueryInfo;
- (WFTopHitItemContextualAction)initWithItem:(id)a3 identifier:(id)a4 wfActionIdentifier:(id)a5 associatedAppBundleIdentifier:(id)a6 parameters:(id)a7 displayFormatString:(id)a8 title:(id)a9 subtitleFormatString:(id)a10 primaryColor:(unint64_t)a11 icon:(id)a12 accessoryIcon:(id)a13 namedQueryInfo:(id)a14;
- (unint64_t)hash;
- (unint64_t)primaryColor;
@end

@implementation WFTopHitItemContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedQueryInfo, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (WFAppShortcutNamedQueryInfo)namedQueryInfo
{
  return self->_namedQueryInfo;
}

- (unint64_t)primaryColor
{
  return self->_primaryColor;
}

- (NSSecureCoding)item
{
  return self->_item;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFTopHitItemContextualAction *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (v5)
      {
        v6 = [(WFContextualAction *)self uniqueIdentifier];
        v7 = [(WFContextualAction *)v5 uniqueIdentifier];
        id v8 = v6;
        id v9 = v7;
        v10 = v9;
        if (v8 == v9)
        {
          char v11 = 1;
        }
        else
        {
          char v11 = 0;
          if (v8 && v9) {
            char v11 = [v8 isEqualToString:v9];
          }
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 combineContentsOfPropertyListObject:v5];

  v7 = [(WFContextualAction *)self uniqueIdentifier];
  id v8 = (id)[v3 combineContentsOfPropertyListObject:v7];

  unint64_t v9 = [v3 finalize];
  return v9;
}

- (WFTopHitItemContextualAction)initWithItem:(id)a3 identifier:(id)a4 wfActionIdentifier:(id)a5 associatedAppBundleIdentifier:(id)a6 parameters:(id)a7 displayFormatString:(id)a8 title:(id)a9 subtitleFormatString:(id)a10 primaryColor:(unint64_t)a11 icon:(id)a12 accessoryIcon:(id)a13 namedQueryInfo:(id)a14
{
  id v27 = a3;
  id v26 = a14;
  v28.receiver = self;
  v28.super_class = (Class)WFTopHitItemContextualAction;
  BYTE2(v23) = 0;
  LOWORD(v23) = 0;
  v19 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](&v28, sel_initWithIdentifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_icon_accessoryIcon_actionShowsUserInterface_actionHasResult_isReversible_, a4, a5, a6, a7, a8, a9, a10, a12, a13, v23);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_item, a3);
    v20->_primaryColor = a11;
    objc_storeStrong((id *)&v20->_namedQueryInfo, a14);
    v21 = v20;
  }

  return v20;
}

+ (id)disambiguationSummaryStringWithParameterDefined:(BOOL)a3
{
  return 0;
}

+ (id)disambiguationSummaryStringForCollection:(id)a3
{
  return 0;
}

+ (id)disambiguationEntriesForCollection:(id)a3 limit:(int64_t)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TopHitItemContextualActionError" code:0 userInfo:0];
  }
  return 0;
}

+ (void)disambiguationEntriesForCollection:(id)a3 limit:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F28C58];
  id v7 = a5;
  id v8 = [v6 errorWithDomain:@"TopHitItemContextualActionError" code:0 userInfo:0];
  (*((void (**)(id, void, id))a5 + 2))(v7, 0, v8);
}

+ (id)availableCollectionIdentifiers
{
  v2 = objc_opt_new();
  return v2;
}

+ (WFContextualActionParameter)disambiguationParameter
{
  return 0;
}

+ (WFTopHitItemContextualAction)disambiguationAction
{
  return 0;
}

+ (id)supportedBundleIdentifiers
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"com.apple.shortcuts";
  v5[1] = @"com.apple.mobilephone";
  v5[2] = @"com.apple.facetime";
  v5[3] = @"com.apple.Music";
  v5[4] = @"com.apple.podcasts";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v3 = objc_msgSend(v2, "if_objectsPassingTest:", &__block_literal_global_114);

  return v3;
}

BOOL __58__WFTopHitItemContextualAction_supportedBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F223C8];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];

  return v4 != 0;
}

+ (id)actionForCallDescriptor:(id)a3 namedQueryInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 callType])
  {
    if ([v5 callType] == 1)
    {
      id v7 = [WFStartPhoneCallContextualAction alloc];
      id v8 = [v5 person];
      unint64_t v9 = [v5 personSerializedRepresentation];
      v10 = [(WFStartPhoneCallContextualAction *)v7 initWithPerson:v8 serializedRepresentation:v9 namedQueryInfo:v6];
    }
    else
    {
      BOOL v11 = ([v5 callType] & 0xFFFFFFFFFFFFFFFDLL) != 0;
      v12 = [WFFaceTimeContextualAction alloc];
      id v8 = [v5 person];
      unint64_t v9 = [v5 callTypeSerializedRepresentation];
      v13 = [v5 personSerializedRepresentation];
      v10 = [(WFFaceTimeContextualAction *)v12 initWithPerson:v8 type:v11 callTypeSerializedRepresentation:v9 personSerializedRepresentation:v13 namedQueryInfo:v6];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)getTopHitContextualActionsForType:(unint64_t)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  unint64_t v9 = +[VCVoiceShortcutClient standardClient];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke;
  aBlock[3] = &unk_1E6079698;
  id v10 = v8;
  id v30 = v10;
  BOOL v11 = _Block_copy(aBlock);
  v12 = (void (**)(void, void, void))v11;
  switch(a3)
  {
    case 0uLL:
      v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TopHitItemContextualActionError" code:0 userInfo:0];
      ((void (**)(void, void, void *))v12)[2](v12, 0, v13);
      goto LABEL_9;
    case 1uLL:
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_2;
      v27[3] = &unk_1E6079698;
      id v28 = v11;
      [v9 getSuggestedShortcutsWithLimit:a4 completion:v27];
      v13 = v28;
      goto LABEL_9;
    case 2uLL:
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_4;
      v22[3] = &unk_1E6079060;
      id v25 = a1;
      int64_t v26 = a4;
      id v24 = v11;
      id v23 = v9;
      [v23 getFavoriteContactsWithLimit:a4 completion:v22];

      v13 = v24;
      goto LABEL_9;
    case 3uLL:
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_8;
      v20[3] = &unk_1E6079698;
      id v21 = v11;
      [v9 getRecentsCallWithTelephony:0 limit:a4 completion:v20];
      v13 = v21;
      goto LABEL_9;
    case 4uLL:
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_10;
      v18[3] = &unk_1E6079698;
      id v19 = v11;
      +[WFPlayMusicContextualAction disambiguationEntriesForCollection:@"Suggested" limit:a4 completionHandler:v18];
      v13 = v19;
      goto LABEL_9;
    case 5uLL:
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_11;
      v16[3] = &unk_1E6079698;
      id v17 = v11;
      +[WFPlayPodcastEpisodeContextualAction disambiguationEntriesForCollection:@"Suggested" limit:a4 completionHandler:v16];
      v13 = v17;
      goto LABEL_9;
    case 6uLL:
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_12;
      v14[3] = &unk_1E60790E0;
      id v15 = v11;
      [v9 getLinkActionWithAppBundleIdentifier:@"com.apple.springboard" appIntentIdentifier:@"OpenCamera" expandingParameterName:@"cameraMode" limit:a4 completion:v14];
      v13 = v15;
LABEL_9:

      break;
    default:
      break;
  }
}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAA0];
    id v6 = a3;
    id v7 = [v5 orderedSetWithArray:a2];
    id v10 = [v7 array];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    unint64_t v9 = *(void (**)(uint64_t, void))(v8 + 16);
    id v10 = a3;
    v9(v8, 0);
  }
}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [WFAppShortcutNamedQueryInfo alloc];
    id v5 = WFLocalizedString(@"My Shortcuts");
    id v6 = [(WFAppShortcutNamedQueryInfo *)v4 initWithName:v5 symbolName:@"app.2.stack.3d"];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_3;
    v9[3] = &unk_1E6078FE8;
    id v10 = v6;
    id v7 = v6;
    uint64_t v8 = objc_msgSend(v3, "if_map:", v9);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [WFAppShortcutNamedQueryInfo alloc];
  uint64_t v8 = WFLocalizedString(@"Favorites");
  unint64_t v9 = [(WFAppShortcutNamedQueryInfo *)v7 initWithName:v8 symbolName:@"star.fill"];

  id v10 = (void *)MEMORY[0x1E4F1CAA0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_5;
  v25[3] = &unk_1E6079010;
  uint64_t v27 = *(void *)(a1 + 48);
  BOOL v11 = v9;
  int64_t v26 = v11;
  v12 = objc_msgSend(v6, "if_compactMap:", v25);

  v13 = [v10 orderedSetWithArray:v12];
  v14 = [v13 array];

  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = v15 - [v14 count];
  if (v16)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_6;
    v20[3] = &unk_1E6079038;
    id v17 = *(void **)(a1 + 32);
    id v23 = *(id *)(a1 + 40);
    id v18 = v5;
    uint64_t v19 = *(void *)(a1 + 48);
    id v21 = v18;
    uint64_t v24 = v19;
    id v22 = v14;
    [v17 getRecentsCallWithTelephony:1 limit:v16 completion:v20];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_8(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "if_map:", &__block_literal_global_15552);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

uint64_t __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    if ([v8 count])
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_13;
      v18[3] = &unk_1E60790B8;
      id v19 = v7;
      id v10 = objc_msgSend(v8, "if_map:", v18);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      BOOL v11 = [[WFContextualActionIcon alloc] initWithSystemName:@"camera"];
      v12 = [WFAppIntentBasedTopHitContextualAction alloc];
      v13 = WFLocalizedString(@"Open Camera");
      v14 = WFLocalizedString(@"Open Camera");
      uint64_t v15 = [(WFAppIntentBasedTopHitContextualAction *)v12 initWithAction:v7 appBundleIdentifier:@"com.apple.springboard" extensionBundleIdentifier:0 authenticationPolicy:0 associatedAppBundleIdentifier:@"com.apple.camera" parameterValue:0 displayFormatString:@"%@" title:v13 subtitleFormatString:v14 primaryColor:12 icon:v11 accessoryIcon:0 namedQueryInfo:0];

      uint64_t v16 = *(void *)(a1 + 32);
      v20[0] = v15;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

WFAppIntentBasedTopHitContextualAction *__83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_13(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v24[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v23 = [v4 actionWithParameters:v5];

  id v22 = [WFAppIntentBasedTopHitContextualAction alloc];
  id v6 = WFLocalizedString(@"Open Camera");
  id v7 = [v3 value];
  id v8 = [v7 displayRepresentation];
  id v9 = [v8 title];
  id v10 = [v9 localizedStringWithPluralizationNumber:&unk_1F0CB1B50 forLocaleIdentifier:0];
  BOOL v11 = [v3 value];
  v12 = [v11 displayRepresentation];
  v13 = [v12 image];
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if (v4)
  {
    id v14 = [v11 displayRepresentation];
    uint64_t v15 = [v14 image];
    uint64_t v16 = [v15 systemName];
  }
  else
  {
    id v17 = [v11 value];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
    id v14 = v18;

    uint64_t v16 = @"camera";
    if (([v14 isEqualToString:@"rearPhoto"] & 1) == 0)
    {
      if ([v14 isEqualToString:@"frontPhoto"])
      {
        uint64_t v16 = @"iphone";
      }
      else if ([v14 isEqualToString:@"rearVideo"])
      {
        uint64_t v16 = @"video";
      }
      else if ([v14 isEqualToString:@"rearPortrait"])
      {
        uint64_t v16 = @"f.cursive";
      }
    }
  }

  id v19 = [[WFContextualActionIcon alloc] initWithSystemName:v16];
  v20 = [(WFAppIntentBasedTopHitContextualAction *)v22 initWithAction:v23 appBundleIdentifier:@"com.apple.springboard" extensionBundleIdentifier:0 authenticationPolicy:0 associatedAppBundleIdentifier:@"com.apple.camera" parameterValue:v3 displayFormatString:@"%@" title:v6 subtitleFormatString:v10 primaryColor:12 icon:v19 accessoryIcon:0 namedQueryInfo:0];

  return v20;
}

WFFaceTimeContextualAction *__83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 callType] & 0xFFFFFFFFFFFFFFFDLL) != 0;
  id v4 = [WFAppShortcutNamedQueryInfo alloc];
  id v5 = WFLocalizedString(@"Recents");
  id v6 = [(WFAppShortcutNamedQueryInfo *)v4 initWithName:v5 symbolName:@"clock.fill"];

  id v7 = [WFFaceTimeContextualAction alloc];
  id v8 = [v2 person];
  id v9 = [v2 callTypeSerializedRepresentation];
  id v10 = [v2 personSerializedRepresentation];

  BOOL v11 = [(WFFaceTimeContextualAction *)v7 initWithPerson:v8 type:v3 callTypeSerializedRepresentation:v9 personSerializedRepresentation:v10 namedQueryInfo:v6];
  return v11;
}

uint64_t __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) actionForCallDescriptor:a2 namedQueryInfo:*(void *)(a1 + 32)];
}

void __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_6(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [WFAppShortcutNamedQueryInfo alloc];
    id v7 = WFLocalizedString(@"Recents");
    id v8 = [(WFAppShortcutNamedQueryInfo *)v6 initWithName:v7 symbolName:@"clock.fill"];

    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_7;
    id v19 = &unk_1E6079010;
    uint64_t v9 = a1[7];
    v20 = v8;
    uint64_t v21 = v9;
    id v10 = v8;
    BOOL v11 = objc_msgSend(v5, "if_map:", &v16);
    v12 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithArray:", a1[5], v16, v17, v18, v19);
    v13 = objc_msgSend(v12, "if_orderedSetByAddingObjectsFromArray:", v11);
    id v14 = [v13 array];

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (a1[4]) {
      uint64_t v15 = a1[4];
    }
    else {
      uint64_t v15 = a3;
    }
    (*(void (**)(void, void, uint64_t))(a1[6] + 16))(a1[6], 0, v15);
  }
}

uint64_t __83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) actionForCallDescriptor:a2 namedQueryInfo:*(void *)(a1 + 32)];
}

WFRunShortcutContextualAction *__83__WFTopHitItemContextualAction_getTopHitContextualActionsForType_limit_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [WFRunShortcutContextualAction alloc];
  id v5 = [v3 descriptor];
  id v6 = [v3 serializedRepresentation];

  id v7 = [(WFRunShortcutContextualAction *)v4 initWithDescriptor:v5 serializedRepresentation:v6 namedQueryInfo:*(void *)(a1 + 32)];
  return v7;
}

@end