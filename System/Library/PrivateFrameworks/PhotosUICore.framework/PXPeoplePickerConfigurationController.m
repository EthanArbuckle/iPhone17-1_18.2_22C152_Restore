@interface PXPeoplePickerConfigurationController
+ (id)lemonadePeopleConfigurationFromPersonIdentifiers:(id)a3 preselectedLocalIdentifiers:(id)a4 disabledLocalIdentifiers:(id)a5 selectionLimit:(int64_t)a6 compactMode:(BOOL)a7 transparentBackground:(BOOL)a8 prompt:(id)a9 wantsPets:(BOOL)a10;
+ (id)new;
- (BOOL)compactMode;
- (BOOL)hasContent;
- (BOOL)shouldActLikeSingleSelectPicker;
- (BOOL)transparentBackground;
- (BOOL)wantsPets;
- (NSArray)identifiers;
- (NSArray)peopleConfigurations;
- (NSArray)preselectedIdentifiers;
- (NSMutableArray)mutableAddedLocalIdentifiers;
- (NSMutableOrderedSet)mutableAddedObjectIDs;
- (NSOrderedSet)addedObjectIDs;
- (PHPhotoLibrary)photoLibrary;
- (PXPeopleBootstrapContext)context;
- (PXPeoplePickerConfigurationController)init;
- (PXPeoplePickerConfigurationController)initWithPeopleConfigurations:(id)a3 selectionLimit:(int64_t)a4 wantsPets:(BOOL)a5 configControllerHandler:(id)a6 photoLibrary:(id)a7;
- (PXPeoplePickerConfigurationControllerHandler)configControllerHandler;
- (PXSelectionCoordinator)selectionCoordinator;
- (UIViewController)currentViewController;
- (UIViewController)viewController;
- (id)_createPickerViewController;
- (id)_pickerViewController:(id)a3 pickerConfiguration:(id)a4;
- (int64_t)buttonType;
- (int64_t)selectionLimit;
- (void)didAdvanceWithSender:(id)a3;
- (void)peoplePicker:(id)a3 didTapItem:(id)a4;
- (void)setButtonType:(int64_t)a3;
- (void)setCompactMode:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setPreselectedIdentifiers:(id)a3;
- (void)setSelectionCoordinator:(id)a3;
- (void)setShouldActLikeSingleSelectPicker:(BOOL)a3;
- (void)setTransparentBackground:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)viewControllerWillBePopped:(id)a3;
@end

@implementation PXPeoplePickerConfigurationController

- (id)_pickerViewController:(id)a3 pickerConfiguration:(id)a4
{
  type metadata accessor for LemonadePickerViewControllerFactory();
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)static LemonadePickerViewControllerFactory.pickerViewController(_:pickerConfiguration:delegate:)((uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)&protocol witness table for PXPeoplePickerConfigurationController);

  return v10;
}

+ (id)lemonadePeopleConfigurationFromPersonIdentifiers:(id)a3 preselectedLocalIdentifiers:(id)a4 disabledLocalIdentifiers:(id)a5 selectionLimit:(int64_t)a6 compactMode:(BOOL)a7 transparentBackground:(BOOL)a8 prompt:(id)a9 wantsPets:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  uint64_t v13 = sub_1AB23AADC();
  uint64_t v14 = sub_1AB23AADC();
  uint64_t v15 = sub_1AB23AADC();
  uint64_t v16 = sub_1AB23A76C();
  sub_1A9EA24C0(v13, v14, v15, a6, v11, v10, v16, v17, a10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mutableAddedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableAddedObjectIDs, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_destroyWeak((id *)&self->_configControllerHandler);
  objc_storeStrong((id *)&self->_peopleConfigurations, 0);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_storeStrong((id *)&self->_preselectedIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setContext:(id)a3
{
}

- (PXPeopleBootstrapContext)context
{
  return self->_context;
}

- (NSMutableArray)mutableAddedLocalIdentifiers
{
  return self->_mutableAddedLocalIdentifiers;
}

- (NSMutableOrderedSet)mutableAddedObjectIDs
{
  return self->_mutableAddedObjectIDs;
}

- (void)setViewController:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (int64_t)selectionLimit
{
  return self->_selectionLimit;
}

- (BOOL)wantsPets
{
  return self->_wantsPets;
}

- (PXPeoplePickerConfigurationControllerHandler)configControllerHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configControllerHandler);
  return (PXPeoplePickerConfigurationControllerHandler *)WeakRetained;
}

- (NSArray)peopleConfigurations
{
  return self->_peopleConfigurations;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setShouldActLikeSingleSelectPicker:(BOOL)a3
{
  self->_shouldActLikeSingleSelectPicker = a3;
}

- (BOOL)shouldActLikeSingleSelectPicker
{
  return self->_shouldActLikeSingleSelectPicker;
}

- (void)setSelectionCoordinator:(id)a3
{
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (void)setPreselectedIdentifiers:(id)a3
{
}

- (NSArray)preselectedIdentifiers
{
  return self->_preselectedIdentifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setTransparentBackground:(BOOL)a3
{
  self->_transparentBackground = a3;
}

- (BOOL)transparentBackground
{
  return self->_transparentBackground;
}

- (void)setCompactMode:(BOOL)a3
{
  self->_compactMode = a3;
}

- (BOOL)compactMode
{
  return self->_compactMode;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXPeoplePickerConfigurationController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerConfigurationController.m", 154, @"%s is not available as initializer", "-[PXPeoplePickerConfigurationController init]");

  abort();
}

- (void)peoplePicker:(id)a3 didTapItem:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  if ([(PXPeoplePickerConfigurationController *)self shouldActLikeSingleSelectPicker])
  {
    if (v15)
    {
      if (v7)
      {
LABEL_4:
        id v8 = [(PXPeoplePickerConfigurationController *)self mutableAddedLocalIdentifiers];
        v9 = [v7 localIdentifier];
        [v8 addObject:v9];

        BOOL v10 = [(PXPeoplePickerConfigurationController *)self mutableAddedObjectIDs];
        BOOL v11 = [v7 objectID];
        [v10 addObject:v11];

        v12 = [(PXPeoplePickerConfigurationController *)self configControllerHandler];
        [v12 peopleConfigurationController:self didFinishWithCurrentViewController:v15 selectedPerson:v7];

        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PXPeoplePickerConfigurationController.m", 142, @"Invalid parameter not satisfying: %@", @"peoplePicker" object file lineNumber description];

      if (v7) {
        goto LABEL_4;
      }
    }
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPeoplePickerConfigurationController.m", 143, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:
}

- (void)viewControllerWillBePopped:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPeoplePickerConfigurationController *)self configControllerHandler];
  [v5 peopleConfigurationController:self didPopViewController:v4];
}

- (void)didAdvanceWithSender:(id)a3
{
  id v14 = [(PXPeoplePickerConfigurationController *)self currentViewController];
  if (objc_opt_respondsToSelector()) {
    [v14 performSelector:sel_willTransitionToNextInFlow];
  }
  id v5 = [(PXPeoplePickerConfigurationController *)self context];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 sourcePerson];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_6:
        +[PXPeopleBootstrap performBootstrapWithSourcePerson:v7 context:v6 synchronous:0 completion:0];

        goto LABEL_7;
      }
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = (objc_class *)objc_opt_class();
      BOOL v11 = NSStringFromClass(v12);
      uint64_t v13 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      [v9 handleFailureInMethod:a2, self, @"PXPeoplePickerConfigurationController.m", 123, @"%@ should be an instance inheriting from %@, but it is %@", @"context.sourcePerson", v11, v13 object file lineNumber description];
    }
    else
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v10 = (objc_class *)objc_opt_class();
      BOOL v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, self, @"PXPeoplePickerConfigurationController.m", 123, @"%@ should be an instance inheriting from %@, but it is nil", @"context.sourcePerson", v11 object file lineNumber description];
    }

    goto LABEL_6;
  }
LABEL_7:
  id v8 = [(PXPeoplePickerConfigurationController *)self configControllerHandler];
  [v8 peopleConfigurationController:self didFinishWithCurrentViewController:v14 selectedPerson:0];
}

- (id)_createPickerViewController
{
  v3 = [(PXPeoplePickerConfigurationController *)self peopleConfigurations];
  id v4 = [v3 objectAtIndexedSubscript:0];

  id v5 = [(PXPeoplePickerConfigurationController *)self preselectedIdentifiers];
  if ([v5 count])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v4 suggestedIdentifiers];
  }
  id v7 = v6;
  id v8 = [v4 disabledIdentifiers];
  v9 = (void *)[v8 mutableCopy];
  BOOL v10 = v9;
  v30 = v5;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v12 = v11;

  uint64_t v13 = [(PXPeoplePickerConfigurationController *)self mutableAddedLocalIdentifiers];
  [v12 addObjectsFromArray:v13];

  uint64_t v14 = [(PXPeoplePickerConfigurationController *)self identifiers];
  id v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = MEMORY[0x1E4F1CBF0];
  }
  v29 = v7;
  if (v7) {
    id v17 = v7;
  }
  else {
    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }
  int64_t v18 = [(PXPeoplePickerConfigurationController *)self selectionLimit];
  BOOL v19 = [(PXPeoplePickerConfigurationController *)self compactMode];
  BOOL v20 = [(PXPeoplePickerConfigurationController *)self transparentBackground];
  v31 = v4;
  v21 = [v4 purpose];
  LOBYTE(v28) = [(PXPeoplePickerConfigurationController *)self wantsPets];
  v22 = +[PXPeoplePickerConfigurationController lemonadePeopleConfigurationFromPersonIdentifiers:v16 preselectedLocalIdentifiers:v17 disabledLocalIdentifiers:v12 selectionLimit:v18 compactMode:v19 transparentBackground:v20 prompt:v21 wantsPets:v28];

  v23 = [(PXPeoplePickerConfigurationController *)self photoLibrary];
  v24 = [(PXPeoplePickerConfigurationController *)self _pickerViewController:v23 pickerConfiguration:v22];
  if (self->_wantsPets)
  {
    v25 = +[PXPeopleUtilities locKeyForPersonOrPet:withVisibility:key:](PXPeopleUtilities, "locKeyForPersonOrPet:withVisibility:key:", 0, objc_msgSend(v23, "px_peoplePetsHomeVisibility"), @"PICKER_PEOPLE_TITLE");
    v26 = PXLocalizedStringFromTable(v25, @"PhotosUICore");
  }
  else
  {
    v26 = PXLocalizedStringFromTable(@"PICKER_PEOPLE_TITLE__People", @"PhotosUICore");
  }
  [v24 setTitle:v26];
  [(PXPeoplePickerConfigurationController *)self setButtonType:0];
  [(PXPeoplePickerConfigurationController *)self setViewController:v24];

  return v24;
}

- (UIViewController)currentViewController
{
  v3 = [(PXPeoplePickerConfigurationController *)self viewController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PXPeoplePickerConfigurationController *)self _createPickerViewController];
  }
  id v6 = v5;

  return (UIViewController *)v6;
}

- (BOOL)hasContent
{
  v2 = [(PXPeoplePickerConfigurationController *)self peopleConfigurations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSOrderedSet)addedObjectIDs
{
  v2 = [(PXPeoplePickerConfigurationController *)self mutableAddedObjectIDs];
  BOOL v3 = (void *)[v2 copy];

  return (NSOrderedSet *)v3;
}

- (PXPeoplePickerConfigurationController)initWithPeopleConfigurations:(id)a3 selectionLimit:(int64_t)a4 wantsPets:(BOOL)a5 configControllerHandler:(id)a6 photoLibrary:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if ([v13 count])
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXPeoplePickerConfigurationController.m", 47, @"Invalid parameter not satisfying: %@", @"configControllerHandler" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PXPeoplePickerConfigurationController.m", 46, @"Invalid parameter not satisfying: %@", @"peopleConfigurations.count > 0" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"PXPeoplePickerConfigurationController.m", 48, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)PXPeoplePickerConfigurationController;
  uint64_t v16 = [(PXPeoplePickerConfigurationController *)&v27 init];
  if (v16)
  {
    uint64_t v17 = [v13 copy];
    peopleConfigurations = v16->_peopleConfigurations;
    v16->_peopleConfigurations = (NSArray *)v17;

    objc_storeWeak((id *)&v16->_configControllerHandler, v14);
    v16->_selectionLimit = a4;
    v16->_wantsPets = a5;
    objc_storeStrong((id *)&v16->_photoLibrary, a7);
    BOOL v19 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    mutableAddedObjectIDs = v16->_mutableAddedObjectIDs;
    v16->_mutableAddedObjectIDs = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableAddedLocalIdentifiers = v16->_mutableAddedLocalIdentifiers;
    v16->_mutableAddedLocalIdentifiers = v21;
  }
  return v16;
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXPeoplePickerConfigurationController.m", 158, @"%s is not available as initializer", "+[PXPeoplePickerConfigurationController new]");

  abort();
}

@end