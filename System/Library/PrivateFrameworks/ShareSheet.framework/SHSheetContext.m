@interface SHSheetContext
- (BOOL)allowsEmbedding;
- (BOOL)allowsProminentActivity;
- (BOOL)configureForCloudSharing;
- (BOOL)configureForPhotosEdit;
- (BOOL)hideHeaderView;
- (BOOL)hideNavigationBar;
- (BOOL)hideSuggestions;
- (BOOL)instantShareSheet;
- (BOOL)isContentManaged;
- (BOOL)shouldSuggestFamilyMembers;
- (BOOL)showCustomScene;
- (BOOL)showHeroActionsHorizontally;
- (BOOL)showKeyboardAutomatically;
- (BOOL)useRemoteUIService;
- (BOOL)whitelistActionActivitiesOnly;
- (LPLinkMetadata)photosHeaderMetadata;
- (NSArray)activityItems;
- (NSArray)activityTypeOrder;
- (NSArray)activityTypesToCreateInShareService;
- (NSArray)applicationActivities;
- (NSArray)excludedActivityTypes;
- (NSArray)heroActionActivityTypes;
- (NSArray)includedActivityTypes;
- (NSArray)peopleSuggestionBundleIds;
- (NSArray)selectedAssetIdentifiers;
- (NSString)topContentSectionText;
- (NSURL)managedFileURL;
- (SHSheetContext)initWithActivityViewController:(id)a3 activityItems:(id)a4;
- (UIActivityCollaborationModeRestriction)collaborationModeRestriction;
- (UIActivityViewController)activityViewController;
- (UIActivityViewControllerObjectManipulationDelegate)objectManipulationDelegate;
- (id)description;
- (int64_t)excludedActivityCategories;
- (int64_t)sharingStyle;
- (unint64_t)xrRenderingMode;
- (void)setActivityTypeOrder:(id)a3;
- (void)setAllowsEmbedding:(BOOL)a3;
- (void)setAllowsProminentActivity:(BOOL)a3;
- (void)setApplicationActivities:(id)a3;
- (void)setCollaborationModeRestriction:(id)a3;
- (void)setConfigureForCloudSharing:(BOOL)a3;
- (void)setConfigureForPhotosEdit:(BOOL)a3;
- (void)setExcludedActivityCategories:(int64_t)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setHeroActionActivityTypes:(id)a3;
- (void)setHideHeaderView:(BOOL)a3;
- (void)setHideNavigationBar:(BOOL)a3;
- (void)setHideSuggestions:(BOOL)a3;
- (void)setIncludedActivityTypes:(id)a3;
- (void)setInstantShareSheet:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setManagedFileURL:(id)a3;
- (void)setObjectManipulationDelegate:(id)a3;
- (void)setPeopleSuggestionBundleIds:(id)a3;
- (void)setPhotosHeaderMetadata:(id)a3;
- (void)setSelectedAssetIdentifiers:(id)a3;
- (void)setSharingStyle:(int64_t)a3;
- (void)setShouldSuggestFamilyMembers:(BOOL)a3;
- (void)setShowCustomScene:(BOOL)a3;
- (void)setShowHeroActionsHorizontally:(BOOL)a3;
- (void)setShowKeyboardAutomatically:(BOOL)a3;
- (void)setTopContentSectionText:(id)a3;
- (void)setUseRemoteUIService:(BOOL)a3;
- (void)setWhitelistActionActivitiesOnly:(BOOL)a3;
- (void)setXrRenderingMode:(unint64_t)a3;
@end

@implementation SHSheetContext

- (SHSheetContext)initWithActivityViewController:(id)a3 activityItems:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SHSheetContext;
  v8 = [(SHSheetContext *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_activityViewController, v6);
    uint64_t v10 = [v7 copy];
    activityItems = v9->_activityItems;
    v9->_activityItems = (NSArray *)v10;

    v19[0] = @"com.apple.UIKit.activity.RemoteExtension";
    v19[1] = @"com.apple.UIKit.activity.RemoteOpenInApplication";
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    activityTypesToCreateInShareService = v9->_activityTypesToCreateInShareService;
    v9->_activityTypesToCreateInShareService = (NSArray *)v12;

    int v14 = _os_feature_enabled_impl();
    BOOL v15 = v14;
    if (v14 && _ShareSheetHostCanRenderInProcess())
    {
      int IsAppleApp = _ShareSheetIsAppleApp();
      if (IsAppleApp) {
        LOBYTE(IsAppleApp) = _ShareSheetCanAccessContactsInCurrentProcess();
      }
      v9->_instantShareSheet = IsAppleApp;
    }
    else
    {
      v9->_useRemoteUIService = v15;
    }
  }

  return v9;
}

- (id)description
{
  v20 = NSString;
  v33.receiver = self;
  v33.super_class = (Class)SHSheetContext;
  v32 = [(SHSheetContext *)&v33 description];
  v29 = [(SHSheetContext *)self activityViewController];
  v31 = [(SHSheetContext *)self activityItems];
  v28 = [(SHSheetContext *)self applicationActivities];
  v30 = [(SHSheetContext *)self activityTypesToCreateInShareService];
  int64_t v19 = [(SHSheetContext *)self sharingStyle];
  objc_super v18 = [(SHSheetContext *)self activityTypeOrder];
  v27 = [(SHSheetContext *)self excludedActivityTypes];
  v17 = [(SHSheetContext *)self includedActivityTypes];
  int64_t v16 = [(SHSheetContext *)self excludedActivityCategories];
  [(SHSheetContext *)self allowsEmbedding];
  v26 = NSStringFromBOOL();
  [(SHSheetContext *)self configureForCloudSharing];
  BOOL v15 = NSStringFromBOOL();
  [(SHSheetContext *)self configureForPhotosEdit];
  v25 = NSStringFromBOOL();
  [(SHSheetContext *)self hideHeaderView];
  int v14 = NSStringFromBOOL();
  [(SHSheetContext *)self hideSuggestions];
  v24 = NSStringFromBOOL();
  [(SHSheetContext *)self isContentManaged];
  v23 = NSStringFromBOOL();
  [(SHSheetContext *)self shouldSuggestFamilyMembers];
  v22 = NSStringFromBOOL();
  [(SHSheetContext *)self showKeyboardAutomatically];
  v13 = NSStringFromBOOL();
  [(SHSheetContext *)self whitelistActionActivitiesOnly];
  v11 = NSStringFromBOOL();
  uint64_t v10 = [(SHSheetContext *)self photosHeaderMetadata];
  uint64_t v12 = [(SHSheetContext *)self objectManipulationDelegate];
  [(SHSheetContext *)self instantShareSheet];
  v9 = NSStringFromBOOL();
  [(SHSheetContext *)self useRemoteUIService];
  v3 = NSStringFromBOOL();
  v4 = [(SHSheetContext *)self peopleSuggestionBundleIds];
  v5 = [(SHSheetContext *)self collaborationModeRestriction];
  id v6 = [(SHSheetContext *)self managedFileURL];
  [(SHSheetContext *)self showCustomScene];
  id v7 = NSStringFromBOOL();
  objc_msgSend(v20, "stringWithFormat:", @"<%@ activityViewController:%@ activityItems:%@ applicationActivities:%@ activityTypesToCreateInShareService:%@ sharingStyle:%ld activityTypeOrder:%@ excludedActivityTypes:%@ includedActivityTypes:%@ excludedActivityCategories:%ld allowsEmbedding:%@ configureForCloudSharing:%@ configureForPhotosEdit:%@ hideHeaderView:%@ hideSuggestions:%@ isContentManaged:%@ shouldSuggestFamilyMembers:%@ showKeyboardAutomatically:%@ whitelistActionActivitiesOnly:%@ photosHeaderMetadata:%@ objectManipulationDelegate:%@ instantShareSheet:%@ useRemoteUIService:%@ peopleSuggestionBundleIds:%@ collaborationModeRestriction:%@ managedFileURL:%@ showCustomScene:%@ xrRenderingMode:%lu>", v32, v29, v31, v28, v30, v19, v18, v27, v17, v16, v26, v15, v25, v14, v24, v23,
    v22,
    v13,
    v11,
    v10,
    v12,
    v9,
    v3,
    v4,
    v5,
    v6,
    v7,
  v21 = [(SHSheetContext *)self xrRenderingMode]);

  return v21;
}

- (UIActivityViewController)activityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityViewController);
  return (UIActivityViewController *)WeakRetained;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (NSArray)activityTypesToCreateInShareService
{
  return self->_activityTypesToCreateInShareService;
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (void)setHeroActionActivityTypes:(id)a3
{
}

- (int64_t)excludedActivityCategories
{
  return self->_excludedActivityCategories;
}

- (void)setExcludedActivityCategories:(int64_t)a3
{
  self->_excludedActivityCategories = a3;
}

- (BOOL)allowsEmbedding
{
  return self->_allowsEmbedding;
}

- (void)setAllowsEmbedding:(BOOL)a3
{
  self->_allowsEmbedding = a3;
}

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (void)setConfigureForCloudSharing:(BOOL)a3
{
  self->_configureForCloudSharing = a3;
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (void)setConfigureForPhotosEdit:(BOOL)a3
{
  self->_configureForPhotosEdit = a3;
}

- (BOOL)hideHeaderView
{
  return self->_hideHeaderView;
}

- (void)setHideHeaderView:(BOOL)a3
{
  self->_hideHeaderView = a3;
}

- (BOOL)hideNavigationBar
{
  return self->_hideNavigationBar;
}

- (void)setHideNavigationBar:(BOOL)a3
{
  self->_hideNavigationBar = a3;
}

- (BOOL)hideSuggestions
{
  return self->_hideSuggestions;
}

- (void)setHideSuggestions:(BOOL)a3
{
  self->_hideSuggestions = a3;
}

- (NSString)topContentSectionText
{
  return self->_topContentSectionText;
}

- (void)setTopContentSectionText:(id)a3
{
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (BOOL)allowsProminentActivity
{
  return self->_allowsProminentActivity;
}

- (void)setAllowsProminentActivity:(BOOL)a3
{
  self->_allowsProminentActivity = a3;
}

- (BOOL)showKeyboardAutomatically
{
  return self->_showKeyboardAutomatically;
}

- (void)setShowKeyboardAutomatically:(BOOL)a3
{
  self->_showKeyboardAutomatically = a3;
}

- (BOOL)whitelistActionActivitiesOnly
{
  return self->_whitelistActionActivitiesOnly;
}

- (void)setWhitelistActionActivitiesOnly:(BOOL)a3
{
  self->_whitelistActionActivitiesOnly = a3;
}

- (BOOL)instantShareSheet
{
  return self->_instantShareSheet;
}

- (void)setInstantShareSheet:(BOOL)a3
{
  self->_instantShareSheet = a3;
}

- (BOOL)useRemoteUIService
{
  return self->_useRemoteUIService;
}

- (void)setUseRemoteUIService:(BOOL)a3
{
  self->_useRemoteUIService = a3;
}

- (BOOL)showCustomScene
{
  return self->_showCustomScene;
}

- (void)setShowCustomScene:(BOOL)a3
{
  self->_showCustomScene = a3;
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (void)setShowHeroActionsHorizontally:(BOOL)a3
{
  self->_showHeroActionsHorizontally = a3;
}

- (LPLinkMetadata)photosHeaderMetadata
{
  return self->_photosHeaderMetadata;
}

- (void)setPhotosHeaderMetadata:(id)a3
{
}

- (NSArray)selectedAssetIdentifiers
{
  return self->_selectedAssetIdentifiers;
}

- (void)setSelectedAssetIdentifiers:(id)a3
{
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
}

- (UIActivityCollaborationModeRestriction)collaborationModeRestriction
{
  return self->_collaborationModeRestriction;
}

- (void)setCollaborationModeRestriction:(id)a3
{
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (void)setManagedFileURL:(id)a3
{
}

- (unint64_t)xrRenderingMode
{
  return self->_xrRenderingMode;
}

- (void)setXrRenderingMode:(unint64_t)a3
{
  self->_xrRenderingMode = a3;
}

- (UIActivityViewControllerObjectManipulationDelegate)objectManipulationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectManipulationDelegate);
  return (UIActivityViewControllerObjectManipulationDelegate *)WeakRetained;
}

- (void)setObjectManipulationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_objectManipulationDelegate);
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_storeStrong((id *)&self->_collaborationModeRestriction, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_photosHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_activityTypesToCreateInShareService, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
}

@end