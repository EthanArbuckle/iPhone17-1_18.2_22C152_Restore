@interface PXSharedLibraryParticipantActionCoordinator
- (PXSharedLibraryParticipant)participant;
- (PXSharedLibraryParticipantActionCoordinator)initWithParticipant:(id)a3 sharedLibrary:(id)a4;
- (UIViewController)actionViewController;
- (void)_removeParticipant:(id)a3;
- (void)_resendInvitation:(id)a3;
@end

@implementation PXSharedLibraryParticipantActionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_actionViewController, 0);
  objc_storeStrong((id *)&self->_sharedLibrary, 0);
}

- (PXSharedLibraryParticipant)participant
{
  return self->_participant;
}

- (UIViewController)actionViewController
{
  v60[1] = *MEMORY[0x1E4F143B8];
  actionViewController = self->_actionViewController;
  if (!actionViewController)
  {
    v4 = [(PXSharedLibraryParticipantActionCoordinator *)self participant];
    v5 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
    v60[0] = v5;
    unint64_t v6 = 0x1E4F1C000uLL;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
    v8 = PXSharedLibraryContactForParticipantAndKeys(v4, v7);

    if (v8)
    {
      v9 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:v8];
      v10 = (void *)*MEMORY[0x1E4F1ADC8];
      v11 = (void *)*MEMORY[0x1E4F1AEE0];
      v59[0] = *MEMORY[0x1E4F1ADC8];
      v59[1] = v11;
      v59[2] = *MEMORY[0x1E4F1AED0];
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
      [(UIViewController *)v9 setDisplayedPropertyKeys:v12];

      v13 = [v4 emailAddress];
      v14 = [v4 phoneNumber];
      if ([v13 length])
      {
        v44 = v9;
        v46 = v14;
        v15 = v4;
        id v42 = v10;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v47 = v8;
        v16 = [v8 emailAddresses];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v58 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v53;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v53 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              v22 = [v21 value];
              int v23 = [v22 isEqualToString:v13];

              if (v23)
              {
                v24 = [v21 identifier];
                v4 = v15;
                id v25 = v42;
                v9 = v44;
                goto LABEL_28;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v58 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        v24 = 0;
        v4 = v15;
        v14 = v46;
        v8 = v47;
        id v25 = v42;
        v9 = v44;
        unint64_t v6 = 0x1E4F1C000;
      }
      else if ([v14 length])
      {
        id v25 = v11;
        v46 = v14;
        v16 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v14];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v47 = v8;
        v27 = [v8 phoneNumbers];
        v24 = (void *)[v27 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v24)
        {
          id v43 = v25;
          v45 = v9;
          v41 = v4;
          uint64_t v28 = *(void *)v49;
          while (2)
          {
            for (j = 0; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v49 != v28) {
                objc_enumerationMutation(v27);
              }
              v30 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
              v31 = [v30 value];
              int v32 = [v31 isLikePhoneNumber:v16];

              if (v32)
              {
                v24 = [v30 identifier];
                goto LABEL_26;
              }
            }
            v24 = (void *)[v27 countByEnumeratingWithState:&v48 objects:v57 count:16];
            if (v24) {
              continue;
            }
            break;
          }
LABEL_26:
          v4 = v41;
          id v25 = v43;
          v9 = v45;
        }

LABEL_28:
        v8 = v47;
        unint64_t v6 = 0x1E4F1C000;
        if (v25)
        {
          v14 = v46;
          if (v24) {
            [(UIViewController *)v9 highlightPropertyWithKey:v25 identifier:v24 important:1];
          }
        }
        else
        {
          v14 = v46;
        }
      }
      else
      {
        id v25 = 0;
        v24 = 0;
      }
    }
    else
    {
      v26 = [(PXSharedLibraryParticipantActionCoordinator *)self participant];
      v8 = PXSharedLibraryMakeContactForParticipant(v26);

      v9 = [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v8];
      id v25 = [(UIViewController *)v9 contentViewController];
      [v25 setAllowsAddingToAddressBook:1];
    }

    if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 1) <= 1) {
      [(UIViewController *)v9 setDisplayMode:1];
    }
    [(UIViewController *)v9 setAllowsEditing:0];
    [(UIViewController *)v9 setAllowsActions:0];
    sharedLibrary = self->_sharedLibrary;
    v56 = v4;
    v34 = [*(id *)(v6 + 2424) arrayWithObjects:&v56 count:1];
    LODWORD(sharedLibrary) = [(PXSharedLibrary *)sharedLibrary canDeleteParticipants:v34];

    if (sharedLibrary)
    {
      v35 = [(UIViewController *)v9 contentViewController];
      v36 = [v35 cardFooterGroup];
      if ((unint64_t)([v4 status] - 5) <= 0xFFFFFFFFFFFFFFFCLL)
      {
        v37 = PXLocalizedSharedLibraryString(@"PXSharedLibraryParticipant_ResendInvitationMenuTitle");
        [v35 addActionWithTitle:v37 target:self selector:sel__resendInvitation_ inGroup:v36 destructive:0];
      }
      v38 = PXLocalizedSharedLibraryString(@"PXSharedLibraryPreferences_RemoveParticipantActionButtonTitle");
      [v35 addActionWithTitle:v38 target:self selector:sel__removeParticipant_ inGroup:v36 destructive:1];
    }
    v39 = self->_actionViewController;
    self->_actionViewController = v9;

    actionViewController = self->_actionViewController;
  }
  return actionViewController;
}

- (void)_removeParticipant:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  v4 = [(PXSharedLibraryParticipantActionCoordinator *)self participant];
  v5 = PXSharedLibraryShortNameForParticipant(v4);
  unint64_t v6 = PXLocalizedSharedLibraryString(@"PXSharedLibraryPreferences_RemoveParticipantAlertTitle");
  uint64_t v7 = PXStringWithValidatedFormat();

  if (objc_msgSend(v4, "status", v5) == 2)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = PXSharedLibrarySettingsMessageForRemovingPendingParticipant(v4);
  }
  v9 = PXLocalizedSharedLibraryString(@"PXSharedLibraryPreferences_RemoveParticipantAlertRemoveButtonTitle");
  v10 = PXStringWithValidatedFormat();

  v11 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v12 = [(PXSharedLibraryParticipantActionCoordinator *)self actionViewController];
  v35 = (void *)v7;
  v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:0 preferredStyle:0];
  v34 = (void *)v8;
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v8];
  uint64_t v40 = *MEMORY[0x1E4FB06F8];
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v41[0] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  objc_msgSend(v14, "addAttributes:range:", v16, 0, objc_msgSend(v14, "length"));

  [v13 _setAttributedMessage:v14];
  uint64_t v17 = (void *)MEMORY[0x1E4FB1410];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __66__PXSharedLibraryParticipantActionCoordinator__removeParticipant___block_invoke;
  v36[3] = &unk_1E5DC28F8;
  id v18 = v12;
  id v37 = v18;
  v38 = self;
  id v19 = v4;
  id v39 = v19;
  v20 = [v17 actionWithTitle:v10 style:2 handler:v36];
  [v13 addAction:v20];

  v21 = [MEMORY[0x1E4FB1410] actionWithTitle:v11 style:1 handler:0];
  [v13 addAction:v21];

  id v22 = v32;
  if (!v22)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    id v25 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v25);
    [v24 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantActionCoordinator.m", 72, @"%@ should be an instance inheriting from %@, but it is nil", @"sender", v33 object file lineNumber description];
LABEL_9:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = (objc_class *)objc_opt_class();
    uint64_t v27 = NSStringFromClass(v26);
    v29 = objc_msgSend(v22, "px_descriptionForAssertionMessage");
    v33 = (void *)v27;
    uint64_t v28 = v27;
    v24 = v30;
    [v30 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantActionCoordinator.m", 72, @"%@ should be an instance inheriting from %@, but it is %@", @"sender", v28, v29 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_6:
  int v23 = [v13 popoverPresentationController];
  [v23 setSourceView:v22];

  [v18 presentViewController:v13 animated:1 completion:0];
}

void __66__PXSharedLibraryParticipantActionCoordinator__removeParticipant___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PXViewControllerPresenter defaultPresenterWithViewController:*(void *)(a1 + 32)];
  v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v9[0] = *(void *)(a1 + 48);
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PXSharedLibraryParticipantActionCoordinator__removeParticipant___block_invoke_2;
  v6[3] = &unk_1E5DD2570;
  id v7 = *(id *)(a1 + 32);
  id v8 = v2;
  id v5 = v2;
  [v3 deleteParticipants:v4 presentationEnvironment:v5 withCompletion:v6];
}

void __66__PXSharedLibraryParticipantActionCoordinator__removeParticipant___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) navigationController];
    id v3 = (id)[v5 popViewControllerAnimated:1];
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    PXHandleErrorDeletingParticipants(a3, v4, 0);
  }
}

- (void)_resendInvitation:(id)a3
{
  id v13 = a3;
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantActionCoordinator.m", 38, @"%@ should be an instance inheriting from %@, but it is %@", @"sender", v10, v12 object file lineNumber description];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantActionCoordinator.m", 38, @"%@ should be an instance inheriting from %@, but it is nil", @"sender", v10 object file lineNumber description];
  }

LABEL_3:
  id v5 = [(PXSharedLibrary *)self->_sharedLibrary shareURL];
  unint64_t v6 = [(PXSharedLibraryParticipantActionCoordinator *)self actionViewController];
  id v7 = +[PXViewControllerPresenter popoverPresenterWithViewController:v6 sourceItem:v13];

  PXSharedLibraryShareInvitation(v5, v7, @"Preferences", 0);
}

- (PXSharedLibraryParticipantActionCoordinator)initWithParticipant:(id)a3 sharedLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryParticipantActionCoordinator;
  v9 = [(PXSharedLibraryParticipantActionCoordinator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participant, a3);
    objc_storeStrong((id *)&v10->_sharedLibrary, a4);
  }

  return v10;
}

@end