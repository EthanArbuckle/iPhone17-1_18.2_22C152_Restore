@interface NTKCFaceDetailViewController
- (BOOL)_cellIsHiddenBehindHeader:(id)a3;
- (BOOL)_hasRemovedSystemApp;
- (BOOL)_isEditOptionFullyVisible:(id)a3;
- (BOOL)_isEditable;
- (BOOL)_isShareButtonEnabled;
- (BOOL)_shouldDisplayShowDebugItem;
- (BOOL)faceHasBeenEdited;
- (BOOL)inGallery;
- (BOOL)shared;
- (CGSize)headerFaceSize;
- (NSArray)externalAssets;
- (NSMutableArray)currentSections;
- (NSMutableArray)dynamicEditOptionSections;
- (NSMutableArray)editOptionSections;
- (NSString)reasonFaceCanNotBeAddedToLibrary;
- (NTKCFaceContainerView)faceContainer;
- (NTKCFaceDetailDescriptionSectionController)descriptionSection;
- (NTKCFaceDetailKaleidoscopeContentSectionController)kaleidoscopeContentSection;
- (NTKCFaceDetailKaleidoscopeStyleSectionController)kaleidoscopeStyleSection;
- (NTKCFaceDetailOtherSectionController)otherSection;
- (NTKCFaceDetailPhotosSectionController)photosSection;
- (NTKCFaceDetailPigmentSectionController)pigmentSection;
- (NTKCFaceDetailViewController)initWithCandidateFace:(id)a3 externalAssets:(id)a4;
- (NTKCFaceDetailViewController)initWithFace:(id)a3 inGallery:(BOOL)a4 externalAssets:(id)a5;
- (NTKCFaceDetailViewController)initWithLibraryFace:(id)a3;
- (NTKCFaceDetailViewControllerDelegate)delegate;
- (NTKCompanionFaceViewController)faceVC;
- (NTKFace)face;
- (NTKFaceCollection)library;
- (NTKGreenfieldCompanionShareController)shareController;
- (UIActivityIndicatorView)addSpinner;
- (UIBarButtonItem)debugNavButton;
- (UIBarButtonItem)shareNavButton;
- (UIButton)addButton;
- (UILabel)faceName;
- (UITableView)tableView;
- (UITableViewCell)editOptionToMakeFullyVisible;
- (UIView)headerSeparator;
- (UIViewController)modalViewControllerPresentedByThisViewController;
- (_NTKCDetailHeaderView)headerView;
- (double)intrinsicHeaderHeight;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_errorMessageForErrorCode:(int64_t)a3;
- (id)_faceBundleForFace:(id)a3;
- (id)_pruneComplicationsNotAvailableOnGizmo:(id)a3;
- (id)_pruneRemovedOrRestrictedComplications:(id)a3;
- (id)_sectionForEditOptionCollection:(id)a3;
- (id)complicationSection:(id)a3 allowedComplicationsForSlot:(id)a4;
- (id)selectionFinishedHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addFace;
- (void)_addFaceEndedForFace:(id)a3;
- (void)_addOrRemoveDynamicSectionsWithCollection:(id)a3;
- (void)_addTapped;
- (void)_applySectionIndexKeysToCurrentSectionsFromIndex:(unint64_t)a3;
- (void)_didTapShareButton;
- (void)_didTapShowDebug;
- (void)_dismissModalViewControllerPresentedByThisViewControllerAnimated:(BOOL)a3;
- (void)_ensureOtherSection;
- (void)_faceChangedOptionsForEditMode:(int64_t)a3;
- (void)_faceDidChange;
- (void)_faceDidChangeResourceDirectory;
- (void)_loadLibrary;
- (void)_reloadEditOptionSectionsDependentOnNTKEditModeComplications;
- (void)_setComplication:(id)a3 forSlot:(id)a4;
- (void)_setEditOption:(id)a3 forMode:(int64_t)a4 slot:(id)a5;
- (void)_setEditOption:(id)a3 forMode:(int64_t)a4 slot:(id)a5 transiently:(BOOL)a6;
- (void)_setFaceHasBeenEdited;
- (void)_updateAddButton;
- (void)_updateShareButton;
- (void)actionSectionDidDelete:(id)a3;
- (void)actionSectionDidSelect:(id)a3;
- (void)complicationSection:(id)a3 didChangeToComplication:(id)a4 forSlot:(id)a5;
- (void)complicationSection:(id)a3 wantsToPresentPickerForSlot:(id)a4 selectedComplication:(id)a5;
- (void)dealloc;
- (void)descriptionSection:(id)a3 didExpand:(BOOL)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)editOptionSection:(id)a3 didModifyEditOption:(id)a4 transiently:(BOOL)a5 canceled:(BOOL)a6;
- (void)editOptionSection:(id)a3 didSelectOptionAtIndex:(int64_t)a4;
- (void)face:(id)a3 didChangeOptionsForEditMode:(int64_t)a4;
- (void)faceDetailComplicationPickerViewController:(id)a3 didSelectComplication:(id)a4;
- (void)otherSection:(id)a3 didChangeShowSeconds:(id)a4 forMode:(int64_t)a5;
- (void)otherSection:(id)a3 didToggleMonogram:(id)a4 forSlot:(id)a5;
- (void)otherSectionDidSelectMonogramEdit:(id)a3;
- (void)photoSectionDidUpdate:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAddButton:(id)a3;
- (void)setAddSpinner:(id)a3;
- (void)setCurrentSections:(id)a3;
- (void)setDebugNavButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionSection:(id)a3;
- (void)setDynamicEditOptionSections:(id)a3;
- (void)setEditOptionSections:(id)a3;
- (void)setEditOptionToMakeFullyVisible:(id)a3;
- (void)setExternalAssets:(id)a3;
- (void)setFace:(id)a3;
- (void)setFaceContainer:(id)a3;
- (void)setFaceName:(id)a3;
- (void)setFaceVC:(id)a3;
- (void)setHeaderFaceSize:(CGSize)a3;
- (void)setHeaderSeparator:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setInGallery:(BOOL)a3;
- (void)setIntrinsicHeaderHeight:(double)a3;
- (void)setKaleidoscopeContentSection:(id)a3;
- (void)setKaleidoscopeStyleSection:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setModalViewControllerPresentedByThisViewController:(id)a3;
- (void)setOtherSection:(id)a3;
- (void)setPhotosSection:(id)a3;
- (void)setPigmentSection:(id)a3;
- (void)setSelectionFinishedHandler:(id)a3;
- (void)setShareController:(id)a3;
- (void)setShareNavButton:(id)a3;
- (void)setShared:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NTKCFaceDetailViewController

- (NTKCFaceDetailViewController)initWithLibraryFace:(id)a3
{
  return [(NTKCFaceDetailViewController *)self initWithFace:a3 inGallery:0 externalAssets:0];
}

- (NTKCFaceDetailViewController)initWithCandidateFace:(id)a3 externalAssets:(id)a4
{
  return [(NTKCFaceDetailViewController *)self initWithFace:a3 inGallery:1 externalAssets:a4];
}

- (NTKCFaceDetailViewController)initWithFace:(id)a3 inGallery:(BOOL)a4 externalAssets:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)NTKCFaceDetailViewController;
  v10 = [(NTKCFaceDetailViewController *)&v28 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    [(NTKCFaceDetailViewController *)v10 setInGallery:v6];
    if (v11->_inGallery)
    {
      v12 = (void *)[v8 copyFromGalleryFace];
      [(NTKCFaceDetailViewController *)v11 setFace:v12];
    }
    else
    {
      [(NTKCFaceDetailViewController *)v11 setFace:v8];
    }
    v13 = [[NTKCompanionFaceViewController alloc] initWithFace:v11->_face forEditing:1];
    [(NTKCFaceDetailViewController *)v11 setFaceVC:v13];

    [(NTKCFaceDetailViewController *)v11 setExternalAssets:v9];
    [(NTKCFaceDetailViewController *)v11 _loadLibrary];
    if (v11->_inGallery)
    {
      if (NTKCScreenStyle() == -1)
      {
        _LayoutConstants_15((uint64_t)v25);
        double v14 = v26;
        v15 = (double *)&v27;
      }
      else
      {
        _LayoutConstants_15((uint64_t)&v23);
        double v14 = v23;
        v15 = (double *)&v24;
      }
    }
    else
    {
      _LayoutConstants_15((uint64_t)v20);
      double v14 = v21;
      v15 = (double *)&v22;
    }
    -[NTKCFaceDetailViewController setHeaderFaceSize:](v11, "setHeaderFaceSize:", v14, *v15);
    v16 = [(NTKFaceViewController *)v11->_faceVC faceView];
    v17 = [(NTKFace *)v11->_face selectedOptionsForCustomEditModes];
    [v16 prepareSwatchImagesForSelectedOptions:v17];

    v18 = [(NTKCFaceDetailViewController *)v11 navigationItem];
    [v18 setLargeTitleDisplayMode:2];
  }
  return v11;
}

- (void)dealloc
{
  [(NTKCFaceDetailViewController *)self setFace:0];
  [(NTKCFaceDetailViewController *)self setLibrary:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailViewController;
  [(NTKCFaceDetailViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v65[1] = *MEMORY[0x1E4F143B8];
  v63.receiver = self;
  v63.super_class = (Class)NTKCFaceDetailViewController;
  [(NTKCFaceDetailViewController *)&v63 viewDidLoad];
  v3 = BPSBackgroundColor();
  objc_super v4 = [(NTKCFaceDetailViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  BOOL v6 = objc_msgSend(v5, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NTKCFaceDetailViewController *)self setTableView:v6];

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  v7 = BPSBackgroundColor();
  [(UITableView *)self->_tableView setBackgroundColor:v7];

  [(UITableView *)self->_tableView setIndicatorStyle:2];
  [(UITableView *)self->_tableView setSeparatorStyle:0];
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, NTKCScreenEdgeMargin(), 0.0, 0.0);
  [(UITableView *)self->_tableView setSectionHeaderTopPadding:0.0];
  +[NTKCFaceDetailSectionController registerForTableView:self->_tableView];
  id v8 = [(NTKCFaceDetailViewController *)self view];
  [v8 addSubview:self->_tableView];

  id v9 = objc_opt_new();
  [(NTKCFaceDetailViewController *)self setHeaderView:v9];

  v10 = BPSBackgroundColor();
  [(_NTKCDetailHeaderView *)self->_headerView setBackgroundColor:v10];

  v11 = [(NTKCFaceDetailViewController *)self view];
  [v11 addSubview:self->_headerView];

  v12 = -[NTKCFaceContainerView initWithFaceSize:style:]([NTKCFaceContainerView alloc], "initWithFaceSize:style:", 2, self->_headerFaceSize.width, self->_headerFaceSize.height);
  [(NTKCFaceDetailViewController *)self setFaceContainer:v12];

  v13 = [(NTKCompanionFaceViewController *)self->_faceVC view];
  [(NTKCFaceContainerView *)self->_faceContainer setFaceView:v13];

  [(_NTKCDetailHeaderView *)self->_headerView addSubview:self->_faceContainer];
  double v14 = objc_opt_new();
  [(NTKCFaceDetailViewController *)self setFaceName:v14];

  v15 = BPSTextColor();
  [(UILabel *)self->_faceName setTextColor:v15];

  faceName = self->_faceName;
  if (self->_inGallery)
  {
    [(UILabel *)faceName setNumberOfLines:3];
    uint64_t v17 = NTKCScreenStyle();
    double v18 = 24.0;
    if (v17 == -1) {
      double v18 = 20.0;
    }
    v19 = (double *)MEMORY[0x1E4FB09B8];
  }
  else
  {
    [(UILabel *)faceName setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_faceName setMinimumScaleFactor:0.5];
    double v18 = 17.0;
    v19 = (double *)MEMORY[0x1E4FB09E0];
  }
  v48 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v18 weight:*v19];
  [(UILabel *)self->_faceName setFont:v48];
  if (self->_inGallery)
  {
    [(_NTKCDetailHeaderView *)self->_headerView addSubview:self->_faceName];
    v20 = objc_opt_new();
    [(NTKCFaceDetailViewController *)self setAddButton:v20];

    [(UIButton *)self->_addButton addTarget:self action:sel__addTapped forControlEvents:64];
    [(UIButton *)self->_addButton sizeToFit];
    [(_NTKCDetailHeaderView *)self->_headerView addSubview:self->_addButton];
    double v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [(NTKCFaceDetailViewController *)self setAddSpinner:v21];

    [(_NTKCDetailHeaderView *)self->_headerView addSubview:self->_addSpinner];
    [(NTKCFaceDetailViewController *)self _updateAddButton];
  }
  else
  {
    uint64_t v22 = self->_faceName;
    double v23 = [(NTKCFaceDetailViewController *)self navigationItem];
    [v23 setTitleView:v22];
  }
  uint64_t v24 = objc_opt_new();
  [(NTKCFaceDetailViewController *)self setHeaderSeparator:v24];

  [(UIView *)self->_headerSeparator setHidden:1];
  [(_NTKCDetailHeaderView *)self->_headerView addSubview:self->_headerSeparator];
  if (self->_inGallery)
  {
    v65[0] = self->_addButton;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
    [(_NTKCDetailHeaderView *)self->_headerView setInteractableSubviews:v25];
  }
  double v26 = objc_opt_new();
  [(NTKCFaceDetailViewController *)self setCurrentSections:v26];

  if (+[NTKCFaceDetailDescriptionSectionController hasDescriptionSectionForFace:self->_face inGallery:self->_inGallery orExternal:self->_externalAssets != 0])
  {
    uint64_t v27 = [[NTKCFaceDetailDescriptionSectionController alloc] initWithTableViewController:self face:self->_face inGallery:self->_inGallery external:self->_externalAssets != 0];
    [(NTKCFaceDetailViewController *)self setDescriptionSection:v27];

    [(NTKCFaceDetailDescriptionSectionController *)self->_descriptionSection setDelegate:self];
    [(NTKCFaceDetailSectionController *)self->_descriptionSection setSection:[(NSMutableArray *)self->_currentSections count]];
    [(NSMutableArray *)self->_currentSections addObject:self->_descriptionSection];
  }
  objc_super v28 = objc_opt_new();
  [(NTKCFaceDetailViewController *)self setEditOptionSections:v28];

  if ([(NTKFace *)self->_face isEditable])
  {
    v29 = [(NTKFace *)self->_face editOptionsForCustomEditModes];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v60 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          v34 = [(NTKCFaceDetailViewController *)self _sectionForEditOptionCollection:v33];
          if (v34)
          {
            [(NSMutableArray *)self->_editOptionSections addObject:v34];
            uint64_t v35 = [v33 mode];
            if (v35 == [(NTKFace *)self->_face dynamicEditMode])
            {
              dynamicEditOptionSections = self->_dynamicEditOptionSections;
              if (!dynamicEditOptionSections)
              {
                v37 = [MEMORY[0x1E4F1CA48] array];
                v38 = self->_dynamicEditOptionSections;
                self->_dynamicEditOptionSections = v37;

                dynamicEditOptionSections = self->_dynamicEditOptionSections;
              }
              [(NSMutableArray *)dynamicEditOptionSections addObject:v34];
            }
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v30);
    }
  }
  if ([(NTKFace *)self->_face shouldColorEditModeBeAtTop])
  {
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__16;
    v57 = __Block_byref_object_dispose__16;
    id v58 = 0;
    editOptionSections = self->_editOptionSections;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke;
    v52[3] = &unk_1E62C37B0;
    v52[4] = &v53;
    [(NSMutableArray *)editOptionSections enumerateObjectsUsingBlock:v52];
    if (v54[5])
    {
      -[NSMutableArray removeObject:](self->_editOptionSections, "removeObject:");
      [(NSMutableArray *)self->_editOptionSections insertObject:v54[5] atIndex:0];
    }
    _Block_object_dispose(&v53, 8);
  }
  v40 = self->_editOptionSections;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_2;
  v51[3] = &unk_1E62C37D8;
  v51[4] = self;
  [(NSMutableArray *)v40 enumerateObjectsUsingBlock:v51];
  if (+[NTKCFaceDetailComplicationSectionController hasComplicationsForFace:self->_face])
  {
    v41 = [NTKCFaceDetailComplicationSectionController alloc];
    face = self->_face;
    v43 = [(NTKFaceViewController *)self->_faceVC faceView];
    v44 = [(NTKCFaceDetailComplicationSectionController *)v41 initWithTableViewController:self face:face faceView:v43 inGallery:self->_inGallery];

    [(NTKCFaceDetailComplicationSectionController *)v44 setDelegate:self];
    [(NTKCFaceDetailSectionController *)v44 setSection:[(NSMutableArray *)self->_currentSections count]];
    [(NSMutableArray *)self->_currentSections addObject:v44];
  }
  v45 = self->_face;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_3;
  v50[3] = &unk_1E62C3800;
  v50[4] = self;
  [(NTKFace *)v45 enumerateComplicationSlotsWithBlock:v50];
  if (self->_otherSection)
  {
    [(NTKCFaceDetailSectionController *)self->_otherSection setSection:[(NSMutableArray *)self->_currentSections count]];
    [(NSMutableArray *)self->_currentSections addObject:self->_otherSection];
  }
  if (!self->_inGallery)
  {
    v46 = [(NTKCFaceDetailSectionController *)[NTKCFaceDetailActionSectionController alloc] initWithTableViewController:self face:self->_face inGallery:self->_inGallery];
    [(NTKCFaceDetailActionSectionController *)v46 setDelegate:self];
    [(NTKCFaceDetailSectionController *)v46 setSection:[(NSMutableArray *)self->_currentSections count]];
    [(NSMutableArray *)self->_currentSections addObject:v46];
  }
  currentSections = self->_currentSections;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_4;
  v49[3] = &unk_1E62C3828;
  v49[4] = self;
  [(NSMutableArray *)currentSections enumerateObjectsUsingBlock:v49];
  if (self->_descriptionSection && [(NSMutableArray *)self->_currentSections count] == 1) {
    [(NTKCFaceDetailDescriptionSectionController *)self->_descriptionSection setExpanded:1];
  }
  [(NTKCFaceDetailViewController *)self _updateShareButton];
  [(NTKCFaceDetailViewController *)self _faceDidChange];
}

void __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  v7 = [v9 collection];
  uint64_t v8 = [v7 collectionType];

  if (v8 == 1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 1048);
  id v4 = a2;
  objc_msgSend(v4, "setSection:", objc_msgSend(v3, "count"));
  [*(id *)(*(void *)(a1 + 32) + 1048) addObject:v4];
}

void __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = objc_opt_class();
  id v4 = [*(id *)(*(void *)(a1 + 32) + 984) device];
  id v5 = [v3 monogramSlotForDevice:v4];
  int v6 = [v7 isEqualToString:v5];

  if (v6)
  {
    [*(id *)(a1 + 32) _ensureOtherSection];
    [*(id *)(*(void *)(a1 + 32) + 1096) addMonogramRowForSlot:v7];
  }
}

void __43__NTKCFaceDetailViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "setHasSpacerRow:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "count") - 1 > a3);
  }
}

- (void)_faceDidChange
{
  if ([(NTKCFaceDetailViewController *)self isViewLoaded]
    && !self->_isSuppressingFaceDidChange)
  {
    v3 = (void *)MEMORY[0x1E4F28B18];
    id v4 = [(NTKFace *)self->_face name];
    id v5 = [v3 NTKHyphenatableString:v4];
    [(UILabel *)self->_faceName setAttributedText:v5];

    [(UILabel *)self->_faceName sizeToFit];
    int v6 = [(NTKFace *)self->_face name];
    id v7 = [(NTKCFaceDetailViewController *)self navigationItem];
    [v7 setBackButtonTitle:v6];

    editOptionSections = self->_editOptionSections;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __46__NTKCFaceDetailViewController__faceDidChange__block_invoke;
    v43[3] = &unk_1E62C37D8;
    v43[4] = self;
    [(NSMutableArray *)editOptionSections enumerateObjectsUsingBlock:v43];
    [(NSMutableArray *)self->_currentSections enumerateObjectsUsingBlock:&__block_literal_global_48];
    if (self->_editOptionToMakeFullyVisible)
    {
      id v9 = -[UITableView indexPathForCell:](self->_tableView, "indexPathForCell:");
      [(UITableView *)self->_tableView rectForRowAtIndexPath:v9];
      CGFloat v11 = v10;
      double v13 = v12;
      CGFloat v15 = v14;
      double v17 = v16;
      -[UITableView rectForHeaderInSection:](self->_tableView, "rectForHeaderInSection:", [v9 section]);
      CGFloat x = v44.origin.x;
      CGFloat y = v44.origin.y;
      CGFloat width = v44.size.width;
      CGFloat height = v44.size.height;
      double v22 = v13 - CGRectGetHeight(v44);
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = y;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      double v23 = v17 + CGRectGetHeight(v45);
      [(UITableView *)self->_tableView bounds];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      [(UITableView *)self->_tableView contentInset];
      double v33 = v25 + v32;
      double v35 = v27 + v34;
      double v37 = v29 - (v32 + v36);
      double v39 = v31 - (v34 + v38);
      v46.origin.CGFloat x = v33;
      v46.origin.CGFloat y = v35;
      v46.size.CGFloat width = v37;
      v46.size.CGFloat height = v39;
      v49.origin.CGFloat x = v11;
      v49.origin.CGFloat y = v22;
      v49.size.CGFloat width = v15;
      v49.size.CGFloat height = v23;
      if (!CGRectContainsRect(v46, v49))
      {
        v47.origin.CGFloat x = v11;
        v47.origin.CGFloat y = v22;
        v47.size.CGFloat width = v15;
        v47.size.CGFloat height = v23;
        double MaxY = CGRectGetMaxY(v47);
        v48.origin.CGFloat x = v33;
        v48.origin.CGFloat y = v35;
        v48.size.CGFloat width = v37;
        v48.size.CGFloat height = v39;
        if (MaxY <= CGRectGetMaxY(v48)) {
          uint64_t v41 = 1;
        }
        else {
          uint64_t v41 = 3;
        }
        [(UITableView *)self->_tableView scrollToRowAtIndexPath:v9 atScrollPosition:v41 animated:1];
      }
      [(NTKCFaceDetailViewController *)self setEditOptionToMakeFullyVisible:0];
    }
    v42 = [(NTKCFaceDetailViewController *)self view];
    [v42 setNeedsLayout];
  }
}

void __46__NTKCFaceDetailViewController__faceDidChange__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 collection];
  if ([v6 collectionType] == 5)
  {
    [*(id *)(a1 + 32) _addOrRemoveDynamicSectionsWithCollection:v6];
    *a4 = 1;
  }
}

uint64_t __46__NTKCFaceDetailViewController__faceDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 faceDidChange];
}

- (void)_faceChangedOptionsForEditMode:(int64_t)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  [(NTKFace *)self->_face editOptionsForCustomEditModes];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v45;
    uint64_t v34 = *(void *)v45;
    int64_t v35 = a3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v36 = v5;
      do
      {
        if (*(void *)v45 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v44 + 1) + 8 * v7);
        if ([v8 mode] == a3)
        {
          uint64_t v38 = v7;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v9 = self;
          double v10 = self->_editOptionSections;
          uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v41 != v13) {
                  objc_enumerationMutation(v10);
                }
                CGFloat v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                double v16 = [v15 collection];
                uint64_t v17 = [v16 mode];
                uint64_t v18 = [v8 mode];

                if (v17 == v18)
                {
                  v19 = [v15 collection];
                  v20 = [v19 slot];
                  double v21 = [v8 slot];

                  if (v20 == v21)
                  {
                    double v22 = [(NTKFace *)v9->_face selectedOptionsForCustomEditModes];
                    double v23 = (void *)[v22 mutableCopy];

                    double v24 = [v8 slot];

                    if (v24)
                    {
                      face = v9->_face;
                      uint64_t v26 = [v8 mode];
                      double v27 = [v8 slot];
                      double v28 = [(NTKFace *)face selectedOptionForCustomEditMode:v26 slot:v27];

                      double v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "mode"));
                      [v23 setObject:v28 forKeyedSubscript:v29];

                      id v9 = self;
                    }
                    if ([v15 collectionChanged:v8 withSelectedOptions:v23])
                    {
                      uint64_t v30 = [(NSMutableArray *)v9->_currentSections indexOfObject:v15];
                      tableView = self->_tableView;
                      double v32 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v30];
                      double v33 = tableView;
                      id v9 = self;
                      [(UITableView *)v33 reloadSections:v32 withRowAnimation:5];
                    }
                  }
                }
              }
              uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v12);
          }

          uint64_t v6 = v34;
          a3 = v35;
          uint64_t v5 = v36;
          uint64_t v7 = v38;
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v5);
  }
}

- (void)_faceDidChangeResourceDirectory
{
  if ([(NTKCFaceDetailViewController *)self isViewLoaded])
  {
    currentSections = self->_currentSections;
    [(NSMutableArray *)currentSections enumerateObjectsUsingBlock:&__block_literal_global_30];
  }
}

uint64_t __63__NTKCFaceDetailViewController__faceDidChangeResourceDirectory__block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceDidChangeResourceDirectory];
}

- (id)_sectionForEditOptionCollection:(id)a3
{
  id v4 = a3;
  if ([v4 collectionType] == 3)
  {
    [(NTKCFaceDetailViewController *)self _ensureOtherSection];
    [(NTKCFaceDetailOtherSectionController *)self->_otherSection addShowSecondsRow:v4];
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  if (+[NTKCFaceDetailPigmentSectionController hasSectionForFace:forEditMode:](NTKCFaceDetailPigmentSectionController, "hasSectionForFace:forEditMode:", self->_face, [v4 mode]))
  {
    uint64_t v6 = [NTKCFaceDetailPigmentSectionController alloc];
    face = self->_face;
    inGallerCGFloat y = self->_inGallery;
    id v9 = [(NTKFaceViewController *)self->_faceVC faceView];
    double v10 = [(NTKCFaceDetailPigmentSectionController *)v6 initWithTableViewController:self face:face inGallery:inGallery editOptionCollection:v4 faceView:v9];
    [(NTKCFaceDetailViewController *)self setPigmentSection:v10];

    uint64_t v11 = 1104;
    [(NTKCFaceDetailEditOptionSectionController *)self->_pigmentSection setDelegate:self];
    [(NTKCFaceDetailPigmentSectionController *)self->_pigmentSection setParentViewController:self];
LABEL_8:
    uint64_t v17 = *(NTKCFaceDetailKaleidoscopeContentSectionController **)((char *)&self->super.super.super.isa + v11);
LABEL_9:
    uint64_t v5 = v17;
    goto LABEL_10;
  }
  if (+[NTKCFaceDetailPhotosSectionController hasPhotosSectionForFace:forEditMode:](NTKCFaceDetailPhotosSectionController, "hasPhotosSectionForFace:forEditMode:", self->_face, [v4 mode]))
  {
    uint64_t v12 = [NTKCFaceDetailPhotosSectionController alloc];
    uint64_t v13 = self->_face;
    BOOL v14 = self->_inGallery;
    CGFloat v15 = [(NTKFaceViewController *)self->_faceVC faceView];
    double v16 = [(NTKCFaceDetailPhotosSectionController *)v12 initWithTableViewController:self face:v13 inGallery:v14 editOptionCollection:v4 faceView:v15 externalAssets:self->_externalAssets];
    [(NTKCFaceDetailViewController *)self setPhotosSection:v16];

    uint64_t v11 = 1072;
    [(NTKCFaceDetailPhotosSectionController *)self->_photosSection setParentViewController:self];
LABEL_7:
    [*(id *)((char *)&self->super.super.super.isa + v11) setDelegate:self];
    goto LABEL_8;
  }
  if (+[NTKCFaceDetailKaleidoscopeContentSectionController hasSectionForFace:forEditMode:](NTKCFaceDetailKaleidoscopeContentSectionController, "hasSectionForFace:forEditMode:", self->_face, [v4 mode]))
  {
    if (!+[NTKCFaceDetailKaleidoscopeContentSectionController supressesSectionForExternalAssets:self->_externalAssets])
    {
      double v24 = [NTKCFaceDetailKaleidoscopeContentSectionController alloc];
      double v25 = self->_face;
      BOOL v26 = self->_inGallery;
      double v27 = [(NTKFaceViewController *)self->_faceVC faceView];
      double v28 = [(NTKCFaceDetailKaleidoscopeContentSectionController *)v24 initWithTableViewController:self face:v25 inGallery:v26 editOptionCollection:v4 faceView:v27];
      [(NTKCFaceDetailViewController *)self setKaleidoscopeContentSection:v28];

      [(NTKCFaceDetailKaleidoscopeContentSectionController *)self->_kaleidoscopeContentSection setParentViewController:self];
      [(NTKCFaceDetailKaleidoscopeContentSectionController *)self->_kaleidoscopeContentSection setDelegate:self];
      externalAssets = self->_externalAssets;
      if (externalAssets)
      {
        kaleidoscopeContentSection = self->_kaleidoscopeContentSection;
        double v31 = [(NSArray *)externalAssets firstObject];
        [(NTKCFaceDetailKaleidoscopeContentSectionController *)kaleidoscopeContentSection setExternalAsset:v31];
      }
    }
    uint64_t v17 = self->_kaleidoscopeContentSection;
    goto LABEL_9;
  }
  if (+[NTKCFaceDetailKaleidoscopeStyleSectionController hasSectionForFace:forEditMode:](NTKCFaceDetailKaleidoscopeStyleSectionController, "hasSectionForFace:forEditMode:", self->_face, [v4 mode]))
  {
    v19 = [NTKCFaceDetailKaleidoscopeStyleSectionController alloc];
    v20 = self->_face;
    BOOL v21 = self->_inGallery;
    double v22 = [(NTKFaceViewController *)self->_faceVC faceView];
    double v23 = [(NTKCFaceDetailEditOptionHorizontalSectionController *)v19 initWithTableViewController:self face:v20 inGallery:v21 editOptionCollection:v4 faceView:v22];
    [(NTKCFaceDetailViewController *)self setKaleidoscopeStyleSection:v23];

    uint64_t v11 = 1088;
    goto LABEL_7;
  }
  double v32 = [NTKCFaceDetailEditOptionSectionController alloc];
  double v33 = self->_face;
  BOOL v34 = self->_inGallery;
  int64_t v35 = [(NTKFaceViewController *)self->_faceVC faceView];
  uint64_t v5 = [(NTKCFaceDetailEditOptionSectionController *)v32 initWithTableViewController:self face:v33 inGallery:v34 editOptionCollection:v4 faceView:v35];

  [(NTKCFaceDetailKaleidoscopeContentSectionController *)v5 setDelegate:self];
LABEL_10:

  return v5;
}

- (void)_ensureOtherSection
{
  if (!self->_otherSection)
  {
    v3 = [(NTKCFaceDetailSectionController *)[NTKCFaceDetailOtherSectionController alloc] initWithTableViewController:self face:self->_face inGallery:self->_inGallery];
    [(NTKCFaceDetailViewController *)self setOtherSection:v3];

    otherSection = self->_otherSection;
    [(NTKCFaceDetailOtherSectionController *)otherSection setDelegate:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v118.receiver = self;
  v118.super_class = (Class)NTKCFaceDetailViewController;
  [(NTKCFaceDetailViewController *)&v118 viewDidLayoutSubviews];
  v3 = [(NTKCFaceDetailViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat rect = v8;
  CGFloat v10 = v9;

  int IsRTL = CLKLayoutIsRTL();
  double v117 = 0.0;
  long long v115 = 0u;
  long long v116 = 0u;
  memset(v114, 0, sizeof(v114));
  [(_NTKCDetailHeaderView *)self->_headerView frame];
  [(UITableView *)self->_tableView contentInset];
  double v13 = v12;
  [(UITableView *)self->_tableView contentOffset];
  double v15 = v13 + v14;
  [(UITableView *)self->_tableView _systemContentInset];
  double v17 = v15 + v16;
  BOOL v18 = v15 + v16 < 0.0 && self->_intrinsicHeaderHeight != 0.0;
  [(NTKCFaceContainerView *)self->_faceContainer frame];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  double v27 = [(NTKCFaceDetailViewController *)self view];
  [v27 safeAreaInsets];
  double v110 = v28;

  double v108 = v10;
  double v109 = v5;
  v119.origin.CGFloat x = v5;
  CGFloat v29 = v7;
  v119.origin.CGFloat y = v7;
  v119.size.CGFloat width = rect;
  v119.size.CGFloat height = v10;
  double Width = CGRectGetWidth(v119);
  CGFloat v106 = v24;
  if (v18)
  {
    double v30 = self->_intrinsicHeaderHeight - v17;
  }
  else
  {
    double v31 = *(double *)&v115;
    v120.origin.CGFloat x = v20;
    v120.origin.CGFloat y = v22;
    v120.size.CGFloat width = v24;
    v120.size.CGFloat height = v26;
    double v30 = v31 + v31 + CGRectGetHeight(v120);
  }
  CGFloat v32 = v110;
  CGFloat v33 = v20;
  double v34 = v29;
  -[_NTKCDetailHeaderView setFrame:](self->_headerView, "setFrame:", 0.0, v110, Width, v30);
  if (self->_intrinsicHeaderHeight == 0.0)
  {
    v121.origin.CGFloat x = 0.0;
    v121.origin.CGFloat y = v110;
    v121.size.CGFloat width = Width;
    v121.size.CGFloat height = v30;
    self->_intrinsicHeaderdouble Height = CGRectGetHeight(v121);
  }
  CGFloat v111 = v30;
  if (v18)
  {
    [(NTKCFaceContainerView *)self->_faceContainer center];
    double v36 = v35;
    MEMORY[0x1C1874A70]([(_NTKCDetailHeaderView *)self->_headerView bounds]);
    [(NTKCFaceContainerView *)self->_faceContainer setCenter:v36];
    [(NTKCFaceContainerView *)self->_faceContainer frame];
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    double v45 = rect;
  }
  else
  {
    if (self->_inGallery)
    {
      double v45 = rect;
      if (IsRTL)
      {
        v122.size.CGFloat height = v108;
        v122.origin.CGFloat x = v109;
        v122.origin.CGFloat y = v29;
        v122.size.CGFloat width = rect;
        CGRectGetWidth(v122);
        v123.origin.CGFloat x = v33;
        v123.origin.CGFloat y = v22;
        v123.size.CGFloat width = v106;
        v123.size.CGFloat height = v26;
        CGRectGetWidth(v123);
      }
      double v46 = NTKCScreenEdgeMargin();
    }
    else
    {
      [(_NTKCDetailHeaderView *)self->_headerView bounds];
      uint64_t v101 = 0;
      UIRectCenteredXInRectScale();
      double v45 = rect;
    }
    [(_NTKCDetailHeaderView *)self->_headerView bounds];
    UIRectCenteredYInRectScale();
    CGFloat v38 = v47;
    CGFloat v40 = v48;
    CGFloat v42 = v49;
    CGFloat v44 = v50;
    [(NTKCFaceContainerView *)self->_faceContainer setFrame:0];
  }
  if (self->_inGallery)
  {
    uint64_t v51 = NTKCScreenStyle();
    v52 = (double *)&v115 + 1;
    if (v51 == -1) {
      v52 = (double *)&v116;
    }
    double v53 = *v52;
    double v105 = v34;
    if (IsRTL)
    {
      v124.origin.CGFloat x = v38;
      v124.origin.CGFloat y = v40;
      v124.size.CGFloat width = v42;
      v124.size.CGFloat height = v44;
      double MinX = CGRectGetMinX(v124);
    }
    else
    {
      v125.size.CGFloat height = v108;
      v125.origin.CGFloat x = v109;
      v125.origin.CGFloat y = v34;
      v125.size.CGFloat width = v45;
      double v55 = CGRectGetWidth(v125);
      v126.origin.CGFloat x = v38;
      v126.origin.CGFloat y = v40;
      v126.size.CGFloat width = v42;
      v126.size.CGFloat height = v44;
      double MinX = v55 - CGRectGetMaxX(v126);
    }
    double v56 = MinX - v53 - NTKCScreenEdgeMargin();
    -[UILabel sizeThatFits:](self->_faceName, "sizeThatFits:", v56, 1.79769313e308);
    double v104 = v57;
    [(UILabel *)self->_faceName frame];
    if (IsRTL)
    {
      CGFloat v61 = v58;
      CGFloat v62 = v59;
      v127.origin.CGFloat x = v38;
      v127.origin.CGFloat y = v40;
      v127.size.CGFloat width = v42;
      CGFloat v102 = v60;
      v127.size.CGFloat height = v44;
      double v103 = v38;
      CGFloat v63 = CGRectGetMinX(v127) - v53;
      v128.origin.CGFloat x = v61;
      v128.origin.CGFloat y = v62;
      v128.size.CGFloat width = v56;
      v128.size.CGFloat height = v102;
      double v64 = v63 - CGRectGetWidth(v128);
      CGFloat v38 = v103;
    }
    else
    {
      v129.origin.CGFloat x = v38;
      v129.origin.CGFloat y = v40;
      v129.size.CGFloat width = v42;
      v129.size.CGFloat height = v44;
      double v64 = v53 + CGRectGetMaxX(v129);
    }
    v130.origin.CGFloat x = v38;
    v130.origin.CGFloat y = v40;
    v130.size.CGFloat width = v42;
    v130.size.CGFloat height = v44;
    CGFloat v65 = CGRectGetMinY(v130) + *((double *)&v116 + 1);
    [(UILabel *)self->_faceName _firstLineBaselineOffsetFromBoundsTop];
    double v67 = v65 - v66;
    -[UILabel setFrame:](self->_faceName, "setFrame:", v64, v67, v56, v104);
    [(UIButton *)self->_addButton frame];
    double v107 = v70;
    double v72 = v71;
    if (IsRTL)
    {
      CGFloat v73 = v68;
      CGFloat v74 = v69;
      v131.origin.CGFloat x = v64;
      v131.origin.CGFloat y = v67;
      v131.size.CGFloat width = v56;
      v131.size.CGFloat height = v104;
      double MaxX = CGRectGetMaxX(v131);
      v132.origin.CGFloat x = v73;
      v132.origin.CGFloat y = v74;
      v132.size.CGFloat width = v107;
      v132.size.CGFloat height = v72;
      double v76 = MaxX - CGRectGetWidth(v132);
    }
    else
    {
      v133.origin.CGFloat x = v64;
      v133.origin.CGFloat y = v67;
      v133.size.CGFloat width = v56;
      v133.size.CGFloat height = v104;
      double v76 = CGRectGetMinX(v133);
    }
    double v45 = rect;
    v134.origin.CGFloat x = v64;
    v134.origin.CGFloat y = v67;
    v134.size.CGFloat width = v56;
    v134.size.CGFloat height = v104;
    double MinY = CGRectGetMinY(v134);
    [(UILabel *)self->_faceName _lastLineBaseline];
    double v79 = MinY + v78 + v117;
    -[UIButton setFrame:](self->_addButton, "setFrame:", v76, v79, v107, v72);
    [(UIActivityIndicatorView *)self->_addSpinner frame];
    -[UIActivityIndicatorView setFrame:](self->_addSpinner, "setFrame:", v76, v79);
    double v34 = v105;
    CGFloat v32 = v110;
  }
  [(UIView *)self->_headerSeparator frame];
  CGFloat v81 = v80;
  CGFloat v83 = v82;
  double v85 = v84;
  v135.origin.CGFloat x = 0.0;
  v135.origin.CGFloat y = v32;
  v135.size.CGFloat height = v111;
  v135.size.CGFloat width = Width;
  double Height = CGRectGetHeight(v135);
  v136.origin.CGFloat x = 0.0;
  v136.origin.CGFloat y = v81;
  v136.size.CGFloat width = v83;
  v136.size.CGFloat height = v85;
  double v87 = Height - CGRectGetHeight(v136);
  v137.origin.CGFloat x = v109;
  v137.origin.CGFloat y = v34;
  v137.size.CGFloat width = v45;
  v137.size.CGFloat height = v108;
  -[UIView setFrame:](self->_headerSeparator, "setFrame:", 0.0, v87, CGRectGetWidth(v137), v85);
  -[UITableView setFrame:](self->_tableView, "setFrame:", v109, v34, v45, v108);
  [(UITableView *)self->_tableView contentOffset];
  double v89 = v88;
  double v91 = v90;
  intrinsicHeaderdouble Height = self->_intrinsicHeaderHeight;
  [(UITableView *)self->_tableView contentInset];
  if (v93 != intrinsicHeaderHeight)
  {
    double v94 = intrinsicHeaderHeight - v93;
    [(UITableView *)self->_tableView setContentInset:intrinsicHeaderHeight];
    -[UITableView setContentOffset:](self->_tableView, "setContentOffset:", v89, v91 - v94);
  }
  [(UITableView *)self->_tableView verticalScrollIndicatorInsets];
  double v96 = v95;
  double v98 = v97;
  double v100 = v99;
  v138.origin.CGFloat x = 0.0;
  v138.origin.CGFloat y = v32;
  v138.size.CGFloat width = Width;
  v138.size.CGFloat height = v111;
  -[UITableView setVerticalScrollIndicatorInsets:](self->_tableView, "setVerticalScrollIndicatorInsets:", CGRectGetHeight(v138), v96, v98, v100);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCFaceDetailViewController;
  [(NTKCFaceDetailViewController *)&v5 viewWillAppear:a3];
  selectionFinishedHandler = (void (**)(void))self->_selectionFinishedHandler;
  if (selectionFinishedHandler) {
    selectionFinishedHandler[2]();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCFaceDetailViewController;
  [(NTKCFaceDetailViewController *)&v5 viewDidAppear:a3];
  if (self->_inGallery) {
    double v4 = kNTKCCAnalyticsFaceDetailsGallery;
  }
  else {
    double v4 = kNTKCCAnalyticsFaceDetailsLibrary;
  }
  NTKCCAnalyticsIncrement(*v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailViewController;
  [(NTKCFaceDetailViewController *)&v4 viewWillDisappear:a3];
  [(NTKCFaceDetailViewController *)self _dismissModalViewControllerPresentedByThisViewControllerAnimated:0];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [(NTKCFaceDetailViewController *)self setModalViewControllerPresentedByThisViewController:v9];
  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailViewController;
  [(NTKCFaceDetailViewController *)&v10 presentViewController:v9 animated:v5 completion:v8];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(NTKCFaceDetailViewController *)self setModalViewControllerPresentedByThisViewController:0];
  v7.receiver = self;
  v7.super_class = (Class)NTKCFaceDetailViewController;
  [(NTKCFaceDetailViewController *)&v7 dismissViewControllerAnimated:v4 completion:v6];
}

- (void)_dismissModalViewControllerPresentedByThisViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NTKCFaceDetailViewController *)self presentedViewController];
  if (v5)
  {
    id v6 = (void *)v5;
    objc_super v7 = [(NTKCFaceDetailViewController *)self presentedViewController];
    id v8 = [(NTKCFaceDetailViewController *)self modalViewControllerPresentedByThisViewController];

    if (v7 == v8)
    {
      [(NTKCFaceDetailViewController *)self dismissViewControllerAnimated:v3 completion:0];
    }
  }
}

- (void)setFace:(id)a3
{
  uint64_t v5 = (NTKFace *)a3;
  face = self->_face;
  if (face != v5)
  {
    objc_super v7 = v5;
    [(NTKFace *)face removeObserver:self];
    objc_storeStrong((id *)&self->_face, a3);
    [(NTKFace *)self->_face addObserver:self];
    uint64_t v5 = v7;
  }
}

- (void)setLibrary:(id)a3
{
  uint64_t v5 = (NTKFaceCollection *)a3;
  librarCGFloat y = self->_library;
  if (library != v5)
  {
    objc_super v7 = v5;
    [(NTKFaceCollection *)library removeObserver:self];
    objc_storeStrong((id *)&self->_library, a3);
    [(NTKFaceCollection *)self->_library addObserver:self];
    [(NTKCFaceDetailViewController *)self _updateAddButton];
    uint64_t v5 = v7;
  }
}

- (void)_loadLibrary
{
  id v5 = +[NTKCompanionFaceCollectionsManager sharedInstance];
  BOOL v3 = [(NTKFace *)self->_face device];
  BOOL v4 = [v5 sharedFaceCollectionForDevice:v3 forCollectionIdentifier:@"LibraryFaces"];
  [(NTKCFaceDetailViewController *)self setLibrary:v4];
}

- (void)_setComplication:(id)a3 forSlot:(id)a4
{
  face = self->_face;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(NTKFace *)face complicationForSlot:v7];
  [(NTKFace *)self->_face setComplication:v8 forSlot:v7];
  id v9 = [(NTKFaceViewController *)self->_faceVC faceView];
  [v9 applyTransitionFraction:v10 fromComplication:v8 toComplication:v7 slot:1.0];

  [v9 cleanupAfterEditing];
  [(NTKCFaceDetailViewController *)self _setFaceHasBeenEdited];
  [(NTKCFaceDetailViewController *)self _updateAddButton];
}

- (void)_reloadEditOptionSectionsDependentOnNTKEditModeComplications
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  BOOL v3 = [(NTKCFaceDetailViewController *)self editOptionSections];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v9 = [v8 collection];
        uint64_t v10 = [v9 mode];

        uint64_t v11 = [(NTKFaceViewController *)self->_faceVC faceView];
        double v12 = objc_opt_class();
        double v13 = [(NTKFace *)self->_face device];
        double v14 = [v12 swatchForEditModeDependsOnOptions:v10 forDevice:v13];

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
        double v17 = v15;
        if (v16)
        {
          uint64_t v18 = v16;
          uint64_t v19 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v22 != v19) {
                objc_enumerationMutation(v15);
              }
              if ([*(id *)(*((void *)&v21 + 1) + 8 * j) integerValue] == 1)
              {

                double v17 = [v8 cell];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v17 reloadVisibleCells];
                }
                goto LABEL_17;
              }
            }
            uint64_t v18 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v18) {
              continue;
            }
            break;
          }
          double v17 = v15;
        }
LABEL_17:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
}

- (void)_setEditOption:(id)a3 forMode:(int64_t)a4 slot:(id)a5
{
}

- (void)_setEditOption:(id)a3 forMode:(int64_t)a4 slot:(id)a5 transiently:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v10 = a5;
  uint64_t v11 = [(NTKFace *)self->_face selectedOptionForCustomEditMode:a4 slot:v10];
  if (a4 == 10 && !v6 || ([v13 isEqual:v11] & 1) == 0)
  {
    if (v6)
    {
      double v12 = [(NTKFaceViewController *)self->_faceVC faceView];
      [v12 setOption:v13 forCustomEditMode:a4 slot:v10];
    }
    else
    {
      [(NTKFace *)self->_face selectOption:v13 forCustomEditMode:a4 slot:v10];
      [(NTKCFaceDetailViewController *)self _setFaceHasBeenEdited];
    }
  }
}

- (BOOL)_isEditOptionFullyVisible:(id)a3
{
  BOOL v3 = self;
  uint64_t v4 = [(UITableView *)self->_tableView indexPathForCell:a3];
  [(UITableView *)v3->_tableView rectForRowAtIndexPath:v4];
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  -[UITableView rectForHeaderInSection:](v3->_tableView, "rectForHeaderInSection:", [v4 section]);
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  CGFloat v17 = v8 - CGRectGetHeight(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGFloat v18 = v12 + CGRectGetHeight(v35);
  [(UITableView *)v3->_tableView bounds];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [(UITableView *)v3->_tableView contentInset];
  CGFloat v28 = v22 + v27;
  CGFloat v31 = v24 - (v29 + v30);
  v36.size.CGFloat height = v26 - (v27 + v32);
  v36.origin.CGFloat x = v20 + v29;
  v36.origin.CGFloat y = v28;
  v36.size.CGFloat width = v31;
  v37.origin.CGFloat x = v6;
  v37.origin.CGFloat y = v17;
  v37.size.CGFloat width = v10;
  v37.size.CGFloat height = v18;
  LOBYTE(v3) = CGRectContainsRect(v36, v37);

  return (char)v3;
}

- (void)_setFaceHasBeenEdited
{
  if (!self->_faceHasBeenEdited)
  {
    self->_faceHasBeenEdited = 1;
    if (self->_inGallery) {
      BOOL v3 = kNTKCCAnalyticsEditFaceGallery;
    }
    else {
      BOOL v3 = kNTKCCAnalyticsEditFaceLibrary;
    }
    CGFloat v6 = *v3;
    NTKCCAnalyticsIncrement(v6);
    face = self->_face;
    double v5 = [MEMORY[0x1E4F1C9C8] date];
    [(NTKFace *)face setLastEditedDate:v5];

    [(NTKFace *)self->_face incrementNumberOfCompanionEdits];
    [(NTKFace *)self->_face setEditedState:2];
  }
}

- (void)_updateAddButton
{
  if (self->_face && self->_addButton)
  {
    id v3 = [(NTKCFaceDetailViewController *)self reasonFaceCanNotBeAddedToLibrary];
    -[UIButton setDisabled:forReason:](self->_addButton, "setDisabled:forReason:", [v3 length] != 0, v3);
  }
}

- (NSString)reasonFaceCanNotBeAddedToLibrary
{
  face = self->_face;
  librarCGFloat y = self->_library;
  id v11 = 0;
  char v5 = NTKCanAddWatchFace(face, library, &v11);
  id v6 = v11;
  double v7 = v6;
  double v8 = 0;
  if ((v5 & 1) == 0)
  {
    double v8 = -[NTKCFaceDetailViewController _errorMessageForErrorCode:](self, "_errorMessageForErrorCode:", [v6 code]);
  }
  if ([(NTKFace *)self->_face faceStyle] == 22
    && ![(NTKCFaceDetailPhotosSectionController *)self->_photosSection canAddFace])
  {
    uint64_t v9 = NTKClockFaceLocalizedString(@"ACTION_ADD_DISABLED_NO_CUSTOM_PHOTOS", @"You must choose photos.");

    double v8 = (void *)v9;
  }

  return (NSString *)v8;
}

- (id)_errorMessageForErrorCode:(int64_t)a3
{
  switch(a3)
  {
    case 1:
    case 11:
      uint64_t v4 = @"ACTION_ADD_DISABLED_NOT_SUPPORTED_DEVICE";
      char v5 = @"wrong device";
      goto LABEL_15;
    case 2:
      uint64_t v31 = 0;
      double v32 = &v31;
      uint64_t v33 = 0x2020000000;
      uint64_t v34 = 0;
      id v6 = objc_opt_new();
      double v7 = [(NTKFace *)self->_face device];
      unsigned int v8 = [v7 nrDeviceVersion];

      if (HIWORD(v8) <= 4u)
      {
        uint64_t v9 = NTKNewToGloryComplicationTypes();
        [v6 addIndexes:v9];
      }
      CGFloat v10 = [(NTKFace *)self->_face device];
      unsigned int v11 = [v10 nrDeviceVersion];

      if (!(v11 >> 18))
      {
        double v12 = NTKNewToFortuneComplicationTypes();
        [v6 addIndexes:v12];
      }
      face = self->_face;
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      double v26 = __58__NTKCFaceDetailViewController__errorMessageForErrorCode___block_invoke;
      double v27 = &unk_1E62C2F60;
      CGFloat v28 = self;
      id v14 = v6;
      id v29 = v14;
      double v30 = &v31;
      [(NTKFace *)face enumerateComplicationSlotsWithBlock:&v24];
      if (v32[3])
      {
        id v15 = NTKClockFaceLocalizedString(@"ACTION_ADD_DISABLED_GIZMO_VERSION_NOT_SUPPORTED_FOR_COMPLICATION", @"gizmo version not supported for complication");
        uint64_t v16 = NSString;
        CGFloat v17 = NTKComplicationTypeLocalizedLabelText(v32[3]);
        CGFloat v18 = objc_msgSend(v16, "localizedStringWithFormat:", v15, v17, v24, v25, v26, v27, v28);
      }
      else
      {
        CGFloat v18 = 0;
      }

      _Block_object_dispose(&v31, 8);
      goto LABEL_16;
    case 3:
      uint64_t v4 = @"ACTION_ADD_DISABLED_NO_DEVICE";
      char v5 = @"no device";
      goto LABEL_15;
    case 5:
      double v19 = NSString;
      double v20 = NTKClockFaceLocalizedFormat(@"ACTION_ADD_DISABLED_FACE_LIMIT", @"too many faces");
      double v21 = [(NTKFace *)self->_face device];
      uint64_t v22 = NTKFaceLibraryMaxFaceCountForDevice(v21);
      goto LABEL_13;
    case 6:
      double v20 = NTKClockFaceLocalizedString(@"ACTION_ADD_DISABLED_SINGULAR_FACE", @"singular");
      double v19 = NSString;
      uint64_t v22 = [(NTKFace *)self->_face name];
      double v21 = (void *)v22;
LABEL_13:
      CGFloat v18 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v22);

      goto LABEL_16;
    case 8:
      uint64_t v4 = @"ACTION_ADD_DISABLED_NOT_SUPPORTED";
      char v5 = @"not supported";
      goto LABEL_15;
    default:
      uint64_t v4 = @"ACTION_ADD_DISABLED_CANNOT_ADD_FACE_ON_DEVICE";
      char v5 = @"Sorry, this watch face is not available on this device.";
LABEL_15:
      CGFloat v18 = NTKClockFaceLocalizedString(v4, v5);
LABEL_16:
      return v18;
  }
}

uint64_t __58__NTKCFaceDetailViewController__errorMessageForErrorCode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 face];
  unsigned int v8 = [v7 complicationForSlot:v6];

  uint64_t v9 = [v8 complicationType];
  uint64_t result = [*(id *)(a1 + 40) containsIndex:v9];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
    *a3 = 1;
  }
  return result;
}

- (BOOL)_hasRemovedSystemApp
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  face = self->_face;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__NTKCFaceDetailViewController__hasRemovedSystemApp__block_invoke;
  v5[3] = &unk_1E62C1F28;
  v5[4] = self;
  v5[5] = &v6;
  [(NTKFace *)face enumerateComplicationSlotsWithBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__NTKCFaceDetailViewController__hasRemovedSystemApp__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 face];
  id v12 = [v7 complicationForSlot:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v12 appBundleIdentifier];
    int v9 = [v8 isEqualToString:@"com.apple.stocks.watchapp"];

    if (v9) {
      uint64_t v10 = 9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = [v12 complicationType];
  }
  unsigned int v11 = [*(id *)(*(void *)(a1 + 32) + 984) device];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[NTKCompanion1stPartyApp complicationType:v10 mapsToRemovedSystemAppOnDevice:v11];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
}

- (void)_addTapped
{
  if ([(UIButton *)self->_addButton disabled])
  {
    id v9 = [(UIButton *)self->_addButton disabledReason];
    if ([v9 length])
    {
      char v3 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v4 = NTKClockFaceLocalizedString(@"ACTION_ADD_DISABLED_TITLE", @"title");
      char v5 = [v3 alertControllerWithTitle:v4 message:v9 preferredStyle:1];

      id v6 = (void *)MEMORY[0x1E4FB1410];
      double v7 = NTKClockFaceLocalizedString(@"ACTION_ADD_DISABLED_OK", @"OK");
      uint64_t v8 = [v6 actionWithTitle:v7 style:0 handler:0];
      [v5 addAction:v8];

      [(NTKCFaceDetailViewController *)self presentViewController:v5 animated:1 completion:0];
    }
  }
  else if (![(NTKCFaceDetailViewController *)self _hasRemovedSystemApp])
  {
    [(NTKCFaceDetailViewController *)self _addFace];
  }
}

- (void)_addFace
{
  v87[3] = *MEMORY[0x1E4F143B8];
  if ([(NTKCFaceDetailPhotosSectionController *)self->_photosSection hasChanges])
  {
    [(UIActivityIndicatorView *)self->_addSpinner startAnimating];
    [(UIButton *)self->_addButton setHidden:1];
    photosSection = self->_photosSection;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __40__NTKCFaceDetailViewController__addFace__block_invoke;
    v84[3] = &unk_1E62BFF20;
    v84[4] = self;
    [(NTKCFaceDetailPhotosSectionController *)photosSection saveChangesWithCompletion:v84];
  }
  else
  {
    if ([(UIButton *)self->_addButton isHidden])
    {
      [(UIActivityIndicatorView *)self->_addSpinner stopAnimating];
      [(UIButton *)self->_addButton setHidden:0];
    }
    uint64_t v4 = (void *)[(NTKFace *)self->_face copy];
    char v5 = v4;
    if (self->_externalAssets) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 6;
    }
    [v4 setOrigin:v6];
    if ([v5 editedState] == 2)
    {
      double v7 = [v5 lastEditedDate];
      [v5 setCreationDate:v7];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
      [v5 setCreationDate:v8];

      [v5 setEditedState:1];
    }
    [(NTKFaceCollection *)self->_library appendFace:v5 suppressingCallbackToObserver:0];
    [(NTKFaceCollection *)self->_library setSelectedFace:v5 suppressingCallbackToObserver:0];
    NTKCCAnalyticsIncrement(kNTKCCAnalyticsAddFace[0]);
    [(UIButton *)self->_addButton setUserInteractionEnabled:0];
    [(UIButton *)self->_addButton setSelected:1];
    id v9 = [(NTKCFaceDetailViewController *)self tabBarController];

    if (v9)
    {
      uint64_t v10 = [(NTKCFaceDetailViewController *)self tabBarController];
      unsigned int v11 = [v10 tabBar];

      [v11 bounds];
      objc_msgSend(v11, "convertRect:toView:", 0);
      CGFloat x = v88.origin.x;
      CGFloat y = v88.origin.y;
      CGFloat width = v88.size.width;
      CGFloat height = v88.size.height;
      CGRectGetWidth(v88);
      uint64_t v16 = [v11 items];
      [v16 count];
      UICeilToViewScale();
      double v18 = v17;

      if (CLKLayoutIsRTL())
      {
        v89.origin.CGFloat x = x;
        v89.origin.CGFloat y = y;
        v89.size.CGFloat width = width;
        v89.size.CGFloat height = height;
        double v18 = CGRectGetWidth(v89) - v18;
      }
      v90.origin.CGFloat x = x;
      v90.origin.CGFloat y = y;
      v90.size.CGFloat width = width;
      v90.size.CGFloat height = height;
      CGRectGetHeight(v90);
      UIFloorToViewScale();
      double v20 = v19;
      v91.origin.CGFloat x = x;
      v91.origin.CGFloat y = y;
      v91.size.CGFloat width = width;
      v91.size.CGFloat height = height;
      double v78 = v18 + CGRectGetMinX(v91);
      v92.origin.CGFloat x = x;
      v92.origin.CGFloat y = y;
      v92.size.CGFloat width = width;
      v92.size.CGFloat height = height;
      double v77 = v20 + CGRectGetMinY(v92);
      double v79 = v11;
      double v21 = [(NTKCFaceContainerView *)self->_faceContainer snapshotViewAfterScreenUpdates:0];
      uint64_t v22 = [(NTKCFaceDetailViewController *)self view];
      double v23 = [v22 window];
      [v23 addSubview:v21];

      faceContainer = self->_faceContainer;
      [(NTKCFaceContainerView *)faceContainer bounds];
      -[NTKCFaceContainerView convertRect:toView:](faceContainer, "convertRect:toView:", 0);
      objc_msgSend(v21, "setFrame:");
      [MEMORY[0x1E4F39CF8] begin];
      uint64_t v25 = (void *)MEMORY[0x1E4F39CF8];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __40__NTKCFaceDetailViewController__addFace__block_invoke_2;
      v80[3] = &unk_1E62C04F0;
      id v81 = v21;
      double v82 = self;
      id v83 = v5;
      id v26 = v21;
      [v25 setCompletionBlock:v80];
      double v27 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position"];
      [v27 setDuration:1.08];
      [v27 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v27 setRemovedOnCompletion:0];
      [v27 setKeyTimes:&unk_1F16E9B50];
      [v26 bounds];
      CGFloat v28 = v93.origin.x;
      CGFloat v29 = v93.origin.y;
      CGFloat v30 = v93.size.width;
      CGFloat v31 = v93.size.height;
      CGFloat v32 = CGRectGetWidth(v93) * 0.1 * 0.5;
      v94.origin.CGFloat x = v28;
      v94.origin.CGFloat y = v29;
      v94.size.CGFloat width = v30;
      v94.size.CGFloat height = v31;
      CGFloat v33 = CGRectGetHeight(v94) * 0.1 * 0.5;
      uint64_t v34 = (void *)MEMORY[0x1E4F29238];
      CGRect v35 = [v26 layer];
      [v35 position];
      CGRect v36 = objc_msgSend(v34, "valueWithCGPoint:");
      v87[0] = v36;
      CGRect v37 = (void *)MEMORY[0x1E4F29238];
      [v26 center];
      CGFloat v39 = v32 + v38;
      [v26 center];
      double v41 = objc_msgSend(v37, "valueWithCGPoint:", v39, v40 - v33);
      v87[1] = v41;
      CGFloat v42 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v78, v77);
      v87[2] = v42;
      double v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
      [v27 setValues:v43];

      LODWORD(v44) = 1053944709;
      LODWORD(v45) = 0.75;
      LODWORD(v46) = 1.0;
      double v47 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v44 :0.0 :v45 :v46];
      v86[0] = v47;
      LODWORD(v48) = 1058474557;
      LODWORD(v49) = 0.25;
      LODWORD(v50) = 1.0;
      uint64_t v51 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v49 :0.0 :v48 :v50];
      v86[1] = v51;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
      [v27 setTimingFunctions:v52];

      double v53 = [v26 layer];
      [v53 addAnimation:v27 forKey:0];

      v54 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.scale.xy"];
      [v54 setDuration:1.08];
      double v55 = [v27 fillMode];
      [v54 setFillMode:v55];

      [v54 setRemovedOnCompletion:0];
      double v56 = [v27 keyTimes];
      [v54 setKeyTimes:v56];

      [v54 setValues:&unk_1F16E9B68];
      double v57 = [v27 timingFunctions];
      [v54 setTimingFunctions:v57];

      double v58 = [v26 layer];
      [v58 addAnimation:v54 forKey:0];

      double v59 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.rotation"];
      [v59 setDuration:1.08];
      double v60 = [v27 fillMode];
      [v59 setFillMode:v60];

      [v59 setRemovedOnCompletion:0];
      [v59 setKeyTimes:&unk_1F16E9B80];
      [v59 setValues:&unk_1F16E9B98];
      uint64_t v61 = *MEMORY[0x1E4F3A4A0];
      CGFloat v62 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      v85[0] = v62;
      LODWORD(v63) = 1063004406;
      LODWORD(v64) = 1059648963;
      LODWORD(v65) = 1.0;
      double v66 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v63 :0.0 :v64 :v65];
      v85[1] = v66;
      LODWORD(v67) = 1049247089;
      LODWORD(v68) = 1062501089;
      LODWORD(v69) = 1.0;
      double v70 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v67 :0.0 :v68 :v69];
      v85[2] = v70;
      double v71 = [MEMORY[0x1E4F39C10] functionWithName:v61];
      v85[3] = v71;
      double v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:4];
      [v59 setTimingFunctions:v72];

      CGFloat v73 = [v26 layer];
      [v73 addAnimation:v59 forKey:0];

      CGFloat v74 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      [v74 setDuration:1.08];
      v75 = [v27 fillMode];
      [v74 setFillMode:v75];

      [v74 setRemovedOnCompletion:0];
      [v74 setKeyTimes:&unk_1F16E9BB0];
      [v74 setValues:&unk_1F16E9BC8];
      double v76 = [v26 layer];
      [v76 addAnimation:v74 forKey:0];

      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      [(NTKCFaceDetailViewController *)self _addFaceEndedForFace:v5];
    }
  }
}

uint64_t __40__NTKCFaceDetailViewController__addFace__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addFace];
}

uint64_t __40__NTKCFaceDetailViewController__addFace__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _addFaceEndedForFace:v3];
}

- (void)_addFaceEndedForFace:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 postNotificationName:@"NTKCFaceDetailViewControllerDidAddFace" object:v4];
}

- (_NTKCDetailHeaderView)headerView
{
  return self->_headerView;
}

- (BOOL)_isEditable
{
  BOOL v3 = [(NTKFace *)self->_face isEditable];
  if (v3) {
    LOBYTE(v3) = !self->_shared;
  }
  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_currentSections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_currentSections objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 numberOfRows];

  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  currentSections = self->_currentSections;
  id v5 = a4;
  uint64_t v6 = -[NSMutableArray objectAtIndexedSubscript:](currentSections, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [v5 row];

  [v6 heightForRow:v7];
  double v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_currentSections objectAtIndexedSubscript:a4];
  [v4 heightForHeaderView];
  double v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  currentSections = self->_currentSections;
  id v5 = a4;
  double v6 = -[NSMutableArray objectAtIndexedSubscript:](currentSections, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [v5 row];

  double v8 = [v6 cellForRow:v7];

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_currentSections objectAtIndexedSubscript:a4];
  id v5 = [v4 headerView];

  return v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 cellForRowAtIndexPath:v6];
  BOOL v8 = [(NTKCFaceDetailViewController *)self _cellIsHiddenBehindHeader:v7];

  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_currentSections, "objectAtIndexedSubscript:", [v6 section]);
    if (objc_msgSend(v10, "canSelectRow:", objc_msgSend(v6, "row"))) {
      unsigned int v11 = v6;
    }
    else {
      unsigned int v11 = 0;
    }
    id v9 = v11;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  -[NSMutableArray objectAtIndexedSubscript:](self->_currentSections, "objectAtIndexedSubscript:", [v6 section]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 row];

  [v8 didSelectRow:v7];
}

- (BOOL)_cellIsHiddenBehindHeader:(id)a3
{
  tableView = self->_tableView;
  [a3 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(NTKCFaceDetailViewController *)self view];
  -[UITableView convertRect:toView:](tableView, "convertRect:toView:", v13, v6, v8, v10, v12);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v24.origin.CGFloat x = v15;
  v24.origin.CGFloat y = v17;
  v24.size.CGFloat width = v19;
  v24.size.CGFloat height = v21;
  double MaxY = CGRectGetMaxY(v24);
  [(_NTKCDetailHeaderView *)self->_headerView frame];
  return MaxY <= CGRectGetMaxY(v25);
}

- (id)_pruneRemovedOrRestrictedComplications:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(NTKFace *)self->_face device];
  double v6 = +[NTKComplicationProvider providerForDevice:v5];
  double v7 = [v6 disabledComplicationTypes];

  if ([v7 count])
  {
    id v8 = (id)[v4 mutableCopy];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v14 complicationType])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              double v16 = [v15 appBundleIdentifier];

              if (v16 == @"com.apple.stocks.watchapp" && [v7 containsIndex:9]) {
                [v8 removeObject:v15];
              }
            }
            else if (objc_msgSend(v7, "containsIndex:", objc_msgSend(v14, "complicationType")))
            {
              [v8 removeObject:v14];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    id v4 = v18;
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (id)_pruneComplicationsNotAvailableOnGizmo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(NTKFace *)self->_face device];
  unsigned int v6 = [v5 nrDeviceVersion];

  id v22 = (id)[v4 mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    unsigned int v11 = HIWORD(v6);
    unsigned int v12 = v6 >> 18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        double v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = [v14 complicationType];
        if (v11 <= 4)
        {
          uint64_t v16 = v15;
          CGFloat v17 = NTKNewToGloryComplicationTypes();
          int v18 = [v17 containsIndex:v16];

          if (v18) {
            [v22 removeObject:v14];
          }
          if (!v12)
          {
            long long v19 = NTKNewToFortuneComplicationTypes();
            int v20 = [v19 containsIndex:v16];

            if (v20) {
              [v22 removeObject:v14];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  return v22;
}

- (void)scrollViewDidScroll:(id)a3
{
  [(UITableView *)self->_tableView contentInset];
  double v5 = v4;
  [(UITableView *)self->_tableView contentOffset];
  double v7 = v5 + v6;
  [(UITableView *)self->_tableView _systemContentInset];
  double v9 = v7 + v8;
  if (self->_intrinsicHeaderHeight != 0.0 && v9 < 0.0
    || ([(_NTKCDetailHeaderView *)self->_headerView bounds], CGRectGetHeight(v13) > self->_intrinsicHeaderHeight))
  {
    uint64_t v10 = [(NTKCFaceDetailViewController *)self view];
    [v10 setNeedsLayout];
  }
  headerSeparator = self->_headerSeparator;

  [(UIView *)headerSeparator setHidden:v9 <= 0.0];
}

- (void)face:(id)a3 didChangeOptionsForEditMode:(int64_t)a4
{
}

- (void)descriptionSection:(id)a3 didExpand:(BOOL)a4
{
  [(UITableView *)self->_tableView beginUpdates];
  tableView = self->_tableView;

  [(UITableView *)tableView endUpdates];
}

- (void)editOptionSection:(id)a3 didModifyEditOption:(id)a4 transiently:(BOOL)a5 canceled:(BOOL)a6
{
  self->_isSuppressingFaceDidChange = a5;
  id v8 = a4;
  id v11 = [a3 collection];
  uint64_t v9 = [v11 mode];
  uint64_t v10 = [v11 slot];
  [(NTKCFaceDetailViewController *)self _setEditOption:v8 forMode:v9 slot:v10 transiently:self->_isSuppressingFaceDidChange];
}

- (void)editOptionSection:(id)a3 didSelectOptionAtIndex:(int64_t)a4
{
  id v11 = a3;
  double v6 = [v11 cellForRow:0];
  if (![(NTKCFaceDetailViewController *)self _isEditOptionFullyVisible:v6]) {
    [(NTKCFaceDetailViewController *)self setEditOptionToMakeFullyVisible:v6];
  }
  double v7 = [v11 collection];
  if ([v7 collectionType] == 5) {
    [(NTKCFaceDetailViewController *)self _addOrRemoveDynamicSectionsWithCollection:v7];
  }
  id v8 = [v11 optionAtIndex:a4];
  uint64_t v9 = [v7 mode];
  uint64_t v10 = [v7 slot];
  [(NTKCFaceDetailViewController *)self _setEditOption:v8 forMode:v9 slot:v10];
}

- (void)_addOrRemoveDynamicSectionsWithCollection:(id)a3
{
  unint64_t v4 = [(NTKFace *)self->_face numberOfDynamicSections];
  unint64_t v5 = [(NSMutableArray *)self->_dynamicEditOptionSections count];
  unint64_t v6 = v5;
  if (v4 <= v5)
  {
    if (v4 >= v5) {
      goto LABEL_13;
    }
    do
    {
      currentSections = self->_currentSections;
      CGRect v13 = [(NSMutableArray *)self->_dynamicEditOptionSections objectAtIndexedSubscript:--v6];
      uint64_t v14 = [(NSMutableArray *)currentSections indexOfObject:v13];

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(NSMutableArray *)self->_dynamicEditOptionSections removeLastObject];
        [(NSMutableArray *)self->_currentSections removeObjectAtIndex:v14];
      }
    }
    while (v6 > v4);
  }
  else
  {
    do
    {
      id v7 = [(NTKFace *)self->_face newDynamicEditOptionCollectionForSection:v6];
      id v8 = [(NTKCFaceDetailViewController *)self _sectionForEditOptionCollection:v7];
      if (v8)
      {
        uint64_t v9 = self->_currentSections;
        uint64_t v10 = [(NSMutableArray *)self->_dynamicEditOptionSections objectAtIndexedSubscript:v6 - 1];
        uint64_t v11 = [(NSMutableArray *)v9 indexOfObject:v10];

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [(NSMutableArray *)self->_dynamicEditOptionSections addObject:v8];
          [(NSMutableArray *)self->_currentSections insertObject:v8 atIndex:v11 + 1];
        }
      }

      ++v6;
    }
    while (v4 != v6);
  }
  uint64_t v15 = self->_currentSections;
  uint64_t v16 = [(NSMutableArray *)self->_dynamicEditOptionSections lastObject];
  uint64_t v17 = [(NSMutableArray *)v15 indexOfObject:v16];

  if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NTKCFaceDetailViewController *)self _applySectionIndexKeysToCurrentSectionsFromIndex:v17 + 1];
  }
LABEL_13:
  tableView = self->_tableView;

  [(UITableView *)tableView reloadData];
}

- (void)_applySectionIndexKeysToCurrentSectionsFromIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_currentSections count];
  objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3, v5 - a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_currentSections enumerateObjectsAtIndexes:v6 options:0 usingBlock:&__block_literal_global_170];
}

uint64_t __81__NTKCFaceDetailViewController__applySectionIndexKeysToCurrentSectionsFromIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSection:");
}

- (void)photoSectionDidUpdate:(id)a3
{
  [(NTKCFaceDetailViewController *)self _updateAddButton];

  [(NTKCFaceDetailViewController *)self _updateShareButton];
}

- (id)complicationSection:(id)a3 allowedComplicationsForSlot:(id)a4
{
  uint64_t v5 = [(NTKFace *)self->_face allowedComplicationsForSlot:a4];
  if (!self->_inGallery)
  {
    id v6 = [(NTKCFaceDetailViewController *)self _pruneRemovedOrRestrictedComplications:v5];

    uint64_t v5 = [(NTKCFaceDetailViewController *)self _pruneComplicationsNotAvailableOnGizmo:v6];
  }

  return v5;
}

- (void)complicationSection:(id)a3 didChangeToComplication:(id)a4 forSlot:(id)a5
{
}

- (void)complicationSection:(id)a3 wantsToPresentPickerForSlot:(id)a4 selectedComplication:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [NTKCFaceDetailComplicationPickerViewController alloc];
  uint64_t v10 = [(NTKCFaceDetailViewController *)self face];
  CGRect v13 = [(NTKCFaceDetailComplicationPickerViewController *)v9 initWithFace:v10 slot:v8 selectedComplication:v7];

  [(NTKCFaceDetailComplicationPickerViewController *)v13 setDelegate:self];
  uint64_t v11 = [(NTKCFaceDetailViewController *)self navigationController];

  if (v11)
  {
    unsigned int v12 = [(NTKCFaceDetailViewController *)self navigationController];
    [v12 pushViewController:v13 animated:1];
  }
  else
  {
    [(NTKCFaceDetailViewController *)self presentViewController:v13 animated:1 completion:0];
  }
}

- (void)faceDetailComplicationPickerViewController:(id)a3 didSelectComplication:(id)a4
{
  id v6 = a4;
  id v7 = [a3 slot];
  [(NTKCFaceDetailViewController *)self _setComplication:v6 forSlot:v7];

  id v8 = [(NTKCFaceDetailViewController *)self navigationController];

  if (v8)
  {
    id v10 = [(NTKCFaceDetailViewController *)self navigationController];
    id v9 = (id)[v10 popToViewController:self animated:1];
  }
  else
  {
    [(NTKCFaceDetailViewController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_173];
  }
}

- (void)otherSection:(id)a3 didToggleMonogram:(id)a4 forSlot:(id)a5
{
}

- (void)otherSectionDidSelectMonogramEdit:(id)a3
{
  id v5 = (id)objc_opt_new();
  [v5 setShowsDoneButton:1];
  unint64_t v4 = [[NTKCNavigationController alloc] initWithRootViewController:v5];
  [(NTKCFaceDetailViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)otherSection:(id)a3 didChangeShowSeconds:(id)a4 forMode:(int64_t)a5
{
}

- (void)actionSectionDidSelect:(id)a3
{
  unint64_t v4 = [(NTKCFaceDetailViewController *)self delegate];
  [v4 libraryDetail:self didSelectFace:self->_face];

  id v5 = kNTKCCAnalyticsSelectFace[0];

  NTKCCAnalyticsIncrement(v5);
}

- (void)actionSectionDidDelete:(id)a3
{
  unint64_t v4 = [(NTKCFaceDetailViewController *)self delegate];
  int v5 = [v4 libraryDetail:self canRemoveFace:self->_face];

  if (v5)
  {
    id v7 = (void *)MEMORY[0x1E4FB1418];
    id v8 = NTKCCustomizationLocalizedString(@"REMOVE_FACE_TITLE", @"title", v6);
    id v10 = NTKCCustomizationLocalizedString(@"REMOVE_FACE_MESSAGE", @"message", v9);
    uint64_t v11 = [v7 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

    unsigned int v12 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v14 = NTKCCustomizationLocalizedString(@"REMOVE_FACE_CANCEL", @"Cancel", v13);
    uint64_t v15 = [v12 actionWithTitle:v14 style:1 handler:0];
    [v11 addAction:v15];

    uint64_t v16 = (void *)MEMORY[0x1E4FB1410];
    int v18 = NTKCCustomizationLocalizedString(@"REMOVE_FACE_OK", @"OK", v17);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__NTKCFaceDetailViewController_actionSectionDidDelete___block_invoke;
    v20[3] = &unk_1E62C0AA8;
    v20[4] = self;
    long long v19 = [v16 actionWithTitle:v18 style:0 handler:v20];
    [v11 addAction:v19];

    [(NTKCFaceDetailViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

void __55__NTKCFaceDetailViewController_actionSectionDidDelete___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 libraryDetail:*(void *)(a1 + 32) didRemoveFace:*(void *)(*(void *)(a1 + 32) + 984)];

  BOOL v3 = kNTKCCAnalyticsRemoveFace[0];

  NTKCCAnalyticsIncrement(v3);
}

- (void)_updateShareButton
{
  if (!self->_externalAssets)
  {
    id v12 = (id)objc_opt_new();
    if (!self->_shareNavButton)
    {
      id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
      unint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
      int v5 = (void *)[v3 initWithImage:v4 style:0 target:self action:sel__didTapShareButton];
      [(NTKCFaceDetailViewController *)self setShareNavButton:v5];
    }
    uint64_t v6 = [(NTKCFaceDetailViewController *)self shareNavButton];
    [v12 addObject:v6];

    [(UIBarButtonItem *)self->_shareNavButton setEnabled:[(NTKCFaceDetailViewController *)self _isShareButtonEnabled]];
    if ([(NTKCFaceDetailViewController *)self _shouldDisplayShowDebugItem])
    {
      if (!self->_debugNavButton)
      {
        id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
        id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant"];
        uint64_t v9 = (void *)[v7 initWithImage:v8 style:0 target:self action:sel__didTapShowDebug];
        [(NTKCFaceDetailViewController *)self setDebugNavButton:v9];
      }
      id v10 = [(NTKCFaceDetailViewController *)self debugNavButton];
      [v12 addObject:v10];
    }
    uint64_t v11 = [(NTKCFaceDetailViewController *)self navigationItem];
    [v11 setRightBarButtonItems:v12];
  }
}

- (BOOL)_shouldDisplayShowDebugItem
{
  if (!CLKInternalBuild()) {
    return 0;
  }
  id v3 = [(NTKCFaceDetailViewController *)self _faceBundleForFace:self->_face];
  unint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 companionShouldDisplayDebugMenuForFace:self->_face];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_faceBundleForFace:(id)a3
{
  unint64_t v4 = [a3 bundleIdentifier];
  if (v4)
  {
    char v5 = +[NTKFaceBundleManager sharedManager];
    uint64_t v6 = [(NTKFace *)self->_face device];
    id v7 = [v5 faceBundleForBundleIdentifier:v4 onDevice:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_isShareButtonEnabled
{
  if ([(NTKFace *)self->_face faceStyle] != 22) {
    return 1;
  }
  face = self->_face;

  return NTKPhotosFaceHasPhotos(face);
}

- (void)_didTapShareButton
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__NTKCFaceDetailViewController__didTapShareButton__block_invoke;
  aBlock[3] = &unk_1E62BFF20;
  aBlock[4] = self;
  id v3 = (void (**)(void))_Block_copy(aBlock);
  if ([(NTKCFaceDetailPhotosSectionController *)self->_photosSection hasChanges])
  {
    unint64_t v4 = [(NTKCFaceDetailViewController *)self view];
    [v4 setUserInteractionEnabled:0];

    char v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v5 startAnimating];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v5];
    id v7 = [(NTKCFaceDetailViewController *)self navigationItem];
    [v7 setRightBarButtonItem:v6];

    [(UIButton *)self->_addButton setDisabled:1 forReason:0];
    photosSection = self->_photosSection;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__NTKCFaceDetailViewController__didTapShareButton__block_invoke_2;
    v9[3] = &unk_1E62C2290;
    v9[4] = self;
    id v10 = v3;
    [(NTKCFaceDetailPhotosSectionController *)photosSection saveChangesWithCompletion:v9];
  }
  else
  {
    v3[2](v3);
  }
}

void __50__NTKCFaceDetailViewController__didTapShareButton__block_invoke(uint64_t a1)
{
  id v3 = +[NTKGreenfieldCompanionShareController sharedController];
  v2 = [*(id *)(a1 + 32) face];
  [v3 shareWatchFace:v2 fromViewController:*(void *)(a1 + 32)];
}

void __50__NTKCFaceDetailViewController__didTapShareButton__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[141];
  unint64_t v4 = [v2 navigationItem];
  [v4 setRightBarButtonItem:v3];

  [*(id *)(a1 + 32) _updateAddButton];
  char v5 = [*(id *)(a1 + 32) view];
  [v5 setUserInteractionEnabled:1];

  uint64_t v6 = [*(id *)(a1 + 32) view];
  id v7 = [v6 window];

  if (v7)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
}

- (void)_didTapShowDebug
{
  uint64_t v3 = [(NTKCFaceDetailViewController *)self _faceBundleForFace:self->_face];
  if (v3)
  {
    id v5 = v3;
    unint64_t v4 = [v3 viewControllerForCompanionDebugMenuWithFace:self->_face];
    if (v4) {
      [(NTKCFaceDetailViewController *)self presentViewController:v4 animated:1 completion:0];
    }

    uint64_t v3 = v5;
  }
}

- (NTKFace)face
{
  return self->_face;
}

- (NTKCFaceDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKCFaceDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (NTKCFaceContainerView)faceContainer
{
  return self->_faceContainer;
}

- (void)setFaceContainer:(id)a3
{
}

- (NTKFaceCollection)library
{
  return self->_library;
}

- (CGSize)headerFaceSize
{
  double width = self->_headerFaceSize.width;
  double height = self->_headerFaceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHeaderFaceSize:(CGSize)a3
{
  self->_headerFaceSize = a3;
}

- (double)intrinsicHeaderHeight
{
  return self->_intrinsicHeaderHeight;
}

- (void)setIntrinsicHeaderHeight:(double)a3
{
  self->_intrinsicHeaderdouble Height = a3;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)headerSeparator
{
  return self->_headerSeparator;
}

- (void)setHeaderSeparator:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSMutableArray)currentSections
{
  return self->_currentSections;
}

- (void)setCurrentSections:(id)a3
{
}

- (NTKCFaceDetailDescriptionSectionController)descriptionSection
{
  return self->_descriptionSection;
}

- (void)setDescriptionSection:(id)a3
{
}

- (NSMutableArray)dynamicEditOptionSections
{
  return self->_dynamicEditOptionSections;
}

- (void)setDynamicEditOptionSections:(id)a3
{
}

- (NTKCFaceDetailPhotosSectionController)photosSection
{
  return self->_photosSection;
}

- (void)setPhotosSection:(id)a3
{
}

- (NTKCFaceDetailKaleidoscopeContentSectionController)kaleidoscopeContentSection
{
  return self->_kaleidoscopeContentSection;
}

- (void)setKaleidoscopeContentSection:(id)a3
{
}

- (NTKCFaceDetailKaleidoscopeStyleSectionController)kaleidoscopeStyleSection
{
  return self->_kaleidoscopeStyleSection;
}

- (void)setKaleidoscopeStyleSection:(id)a3
{
}

- (NTKCFaceDetailOtherSectionController)otherSection
{
  return self->_otherSection;
}

- (void)setOtherSection:(id)a3
{
}

- (NTKCFaceDetailPigmentSectionController)pigmentSection
{
  return self->_pigmentSection;
}

- (void)setPigmentSection:(id)a3
{
}

- (id)selectionFinishedHandler
{
  return self->_selectionFinishedHandler;
}

- (void)setSelectionFinishedHandler:(id)a3
{
}

- (UITableViewCell)editOptionToMakeFullyVisible
{
  return self->_editOptionToMakeFullyVisible;
}

- (void)setEditOptionToMakeFullyVisible:(id)a3
{
}

- (BOOL)faceHasBeenEdited
{
  return self->_faceHasBeenEdited;
}

- (UIBarButtonItem)shareNavButton
{
  return self->_shareNavButton;
}

- (void)setShareNavButton:(id)a3
{
}

- (UIBarButtonItem)debugNavButton
{
  return self->_debugNavButton;
}

- (void)setDebugNavButton:(id)a3
{
}

- (NTKGreenfieldCompanionShareController)shareController
{
  return self->_shareController;
}

- (void)setShareController:(id)a3
{
}

- (UIViewController)modalViewControllerPresentedByThisViewController
{
  return self->_modalViewControllerPresentedByThisViewController;
}

- (void)setModalViewControllerPresentedByThisViewController:(id)a3
{
}

- (NTKCompanionFaceViewController)faceVC
{
  return self->_faceVC;
}

- (void)setFaceVC:(id)a3
{
}

- (BOOL)inGallery
{
  return self->_inGallery;
}

- (void)setInGallery:(BOOL)a3
{
  self->_inGallerCGFloat y = a3;
}

- (NSArray)externalAssets
{
  return self->_externalAssets;
}

- (void)setExternalAssets:(id)a3
{
}

- (UIButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
}

- (UIActivityIndicatorView)addSpinner
{
  return self->_addSpinner;
}

- (void)setAddSpinner:(id)a3
{
}

- (UILabel)faceName
{
  return self->_faceName;
}

- (void)setFaceName:(id)a3
{
}

- (NSMutableArray)editOptionSections
{
  return self->_editOptionSections;
}

- (void)setEditOptionSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editOptionSections, 0);
  objc_storeStrong((id *)&self->_faceName, 0);
  objc_storeStrong((id *)&self->_addSpinner, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_externalAssets, 0);
  objc_storeStrong((id *)&self->_faceVC, 0);
  objc_storeStrong((id *)&self->_modalViewControllerPresentedByThisViewController, 0);
  objc_storeStrong((id *)&self->_shareController, 0);
  objc_storeStrong((id *)&self->_debugNavButton, 0);
  objc_storeStrong((id *)&self->_shareNavButton, 0);
  objc_storeStrong((id *)&self->_editOptionToMakeFullyVisible, 0);
  objc_storeStrong(&self->_selectionFinishedHandler, 0);
  objc_storeStrong((id *)&self->_pigmentSection, 0);
  objc_storeStrong((id *)&self->_otherSection, 0);
  objc_storeStrong((id *)&self->_kaleidoscopeStyleSection, 0);
  objc_storeStrong((id *)&self->_kaleidoscopeContentSection, 0);
  objc_storeStrong((id *)&self->_photosSection, 0);
  objc_storeStrong((id *)&self->_dynamicEditOptionSections, 0);
  objc_storeStrong((id *)&self->_descriptionSection, 0);
  objc_storeStrong((id *)&self->_currentSections, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerSeparator, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_faceContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_face, 0);
}

@end