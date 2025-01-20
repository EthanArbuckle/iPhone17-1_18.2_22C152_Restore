@interface SHSheetViewModel
- (BOOL)isCollaborative;
- (BOOL)isLoadingMetadata;
- (BOOL)isModeSwitchDisabled;
- (BOOL)isSharingExpanded;
- (BOOL)reloadData;
- (BOOL)showCustomHeaderButton;
- (BOOL)showHeaderSpecialization;
- (BOOL)showOptions;
- (BOOL)supportsCollaboration;
- (BOOL)supportsSendCopy;
- (BOOL)updateProxiesWithAnimation;
- (NSArray)actionProxies;
- (NSArray)activities;
- (NSArray)applicationActivityTypes;
- (NSArray)metadataValues;
- (NSArray)peopleSuggestionProxies;
- (NSArray)peopleSuggestions;
- (NSArray)restrictedActivityTypes;
- (NSArray)shareProxies;
- (NSArray)urlRequests;
- (NSArray)urlSandboxExtensions;
- (NSAttributedString)customHeaderButtonTitle;
- (NSDictionary)activitiesByUUID;
- (NSNumber)customViewControllerSectionHeightWrapper;
- (NSNumber)customViewControllerVerticalInsetWrapper;
- (NSNumber)nearbyCountSlotID;
- (NSString)collaborationModeTitle;
- (NSString)customOptionsTitle;
- (NSString)description;
- (SHSheetSession)session;
- (SHSheetViewModel)initWithSession:(id)a3;
- (SLCollaborationFooterViewModel)collaborationFooterViewModel;
- (UIColor)customHeaderButtonColor;
- (UIViewController)customViewController;
- (void)setActionProxies:(id)a3;
- (void)setActivities:(id)a3;
- (void)setActivitiesByUUID:(id)a3;
- (void)setApplicationActivityTypes:(id)a3;
- (void)setCollaborationFooterViewModel:(id)a3;
- (void)setCollaborationModeTitle:(id)a3;
- (void)setCustomHeaderButtonColor:(id)a3;
- (void)setCustomHeaderButtonTitle:(id)a3;
- (void)setCustomOptionsTitle:(id)a3;
- (void)setCustomViewController:(id)a3;
- (void)setCustomViewControllerSectionHeightWrapper:(id)a3;
- (void)setCustomViewControllerVerticalInsetWrapper:(id)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setIsLoadingMetadata:(BOOL)a3;
- (void)setIsModeSwitchDisabled:(BOOL)a3;
- (void)setIsSharingExpanded:(BOOL)a3;
- (void)setMetadataValues:(id)a3;
- (void)setNearbyCountSlotID:(id)a3;
- (void)setPeopleSuggestionProxies:(id)a3;
- (void)setPeopleSuggestions:(id)a3;
- (void)setReloadData:(BOOL)a3;
- (void)setRestrictedActivityTypes:(id)a3;
- (void)setShareProxies:(id)a3;
- (void)setShowCustomHeaderButton:(BOOL)a3;
- (void)setShowHeaderSpecialization:(BOOL)a3;
- (void)setShowOptions:(BOOL)a3;
- (void)setSupportsCollaboration:(BOOL)a3;
- (void)setSupportsSendCopy:(BOOL)a3;
- (void)setUpdateProxiesWithAnimation:(BOOL)a3;
- (void)setUrlRequests:(id)a3;
- (void)setUrlSandboxExtensions:(id)a3;
@end

@implementation SHSheetViewModel

- (SHSheetViewModel)initWithSession:(id)a3
{
  id v5 = a3;
  v77.receiver = self;
  v77.super_class = (Class)SHSheetViewModel;
  v6 = [(SHSheetViewModel *)&v77 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = [v5 configuration];
    uint64_t v9 = [v8 peopleSuggestions];
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (v9) {
      v12 = (void *)v9;
    }
    else {
      v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v13 = v12;

    v14 = [v5 activitiesManager];
    uint64_t v15 = [v14 orderedActivities];
    v16 = (void *)v15;
    if (v15) {
      v17 = (void *)v15;
    }
    else {
      v17 = v11;
    }
    id v18 = v17;

    uint64_t v19 = [v13 copy];
    peopleSuggestions = v7->_peopleSuggestions;
    v7->_peopleSuggestions = (NSArray *)v19;

    uint64_t v21 = [v18 copy];
    activities = v7->_activities;
    v7->_activities = (NSArray *)v21;

    v23 = [v5 metadataCollection];
    uint64_t v24 = [v23 metadatas];
    metadataValues = v7->_metadataValues;
    v7->_metadataValues = (NSArray *)v24;

    v26 = [v5 activityItemsManager];
    uint64_t v27 = [v26 urlRequests];
    urlRequests = v7->_urlRequests;
    v7->_urlRequests = (NSArray *)v27;

    urlSandboxExtensions = v7->_urlSandboxExtensions;
    v7->_urlSandboxExtensions = 0;

    v7->_showOptions = [v5 showOptions];
    uint64_t v30 = [v5 customOptionsTitle];
    customOptionsTitle = v7->_customOptionsTitle;
    v7->_customOptionsTitle = (NSString *)v30;

    v7->_showCustomHeaderButton = [v5 showSharePlayProminently];
    v7->_showHeaderSpecialization = [v5 showHeaderSpecialization];
    uint64_t v32 = SHSheetCustomHeaderButtonTitle([v5 showSharePlayProminently]);
    customHeaderButtonTitle = v7->_customHeaderButtonTitle;
    v7->_customHeaderButtonTitle = (NSAttributedString *)v32;

    uint64_t v34 = SHSheetCustomHeaderButtonColor([v5 showSharePlayProminently]);
    customHeaderButtonColor = v7->_customHeaderButtonColor;
    v7->_customHeaderButtonColor = (UIColor *)v34;

    v36 = [v5 activityViewController];
    uint64_t v37 = [v36 customViewController];
    customViewController = v7->_customViewController;
    v7->_customViewController = (UIViewController *)v37;

    v39 = [v5 activityViewController];
    uint64_t v40 = [v39 customViewControllerVerticalInsetWrapper];
    customViewControllerVerticalInsetWrapper = v7->_customViewControllerVerticalInsetWrapper;
    v7->_customViewControllerVerticalInsetWrapper = (NSNumber *)v40;

    v42 = [v5 activityViewController];
    uint64_t v43 = [v42 customViewControllerSectionHeightWrapper];
    customViewControllerSectionHeightWrapper = v7->_customViewControllerSectionHeightWrapper;
    v7->_customViewControllerSectionHeightWrapper = (NSNumber *)v43;

    v7->_isModeSwitchDisabled = [v5 isModeSwitchDisabled];
    v45 = [v5 configuration];
    uint64_t v46 = [v45 peopleProxies];
    peopleSuggestionProxies = v7->_peopleSuggestionProxies;
    v7->_peopleSuggestionProxies = (NSArray *)v46;

    v48 = [v5 configuration];
    uint64_t v49 = [v48 shareProxies];
    shareProxies = v7->_shareProxies;
    v7->_shareProxies = (NSArray *)v49;

    v51 = [v5 configuration];
    uint64_t v52 = [v51 actionProxies];
    actionProxies = v7->_actionProxies;
    v7->_actionProxies = (NSArray *)v52;

    v54 = [v5 activitiesManager];
    uint64_t v55 = [v54 activitiesByUUID];
    activitiesByUUID = v7->_activitiesByUUID;
    v7->_activitiesByUUID = (NSDictionary *)v55;

    v57 = [v5 activitiesManager];
    uint64_t v58 = [v57 applicationActivityTypes];
    applicationActivityTypes = v7->_applicationActivityTypes;
    v7->_applicationActivityTypes = (NSArray *)v58;

    v60 = [v5 configuration];
    uint64_t v61 = [v60 nearbyCountSlotID];
    nearbyCountSlotID = v7->_nearbyCountSlotID;
    v7->_nearbyCountSlotID = (NSNumber *)v61;

    v63 = [v5 configuration];
    v7->_reloadData = [v63 reloadData];

    v64 = [v5 configuration];
    v7->_updateProxiesWithAnimation = [v64 wantsAnimation];

    v7->_isSharingExpanded = [v5 isExpanded];
    v65 = [v5 configuration];
    uint64_t v66 = [v65 restrictedActivityTypes];
    v67 = (void *)v66;
    if (v66) {
      v68 = (void *)v66;
    }
    else {
      v68 = v11;
    }
    objc_storeStrong((id *)&v7->_restrictedActivityTypes, v68);

    v7->_supportsCollaboration = [v5 supportsCollaboration];
    v7->_supportsSendCopy = [v5 supportsSendCopy];
    v7->_isCollaborative = [v5 isCollaborative];
    v69 = [v5 collaborationItem];
    v70 = [v69 canAddPeople];
    uint64_t v71 = SHSheetCollaborationModeTitle(v70);
    collaborationModeTitle = v7->_collaborationModeTitle;
    v7->_collaborationModeTitle = (NSString *)v71;

    v73 = [v5 collaborationItem];
    uint64_t v74 = [v73 createCollaborationFooterViewModel];
    collaborationFooterViewModel = v7->_collaborationFooterViewModel;
    v7->_collaborationFooterViewModel = (SLCollaborationFooterViewModel *)v74;
  }
  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SHSheetViewModel *)self peopleSuggestions];
  v6 = [(SHSheetViewModel *)self peopleSuggestionProxies];
  v7 = [(SHSheetViewModel *)self activities];
  v8 = [(SHSheetViewModel *)self shareProxies];
  uint64_t v9 = [(SHSheetViewModel *)self actionProxies];
  v10 = [(SHSheetViewModel *)self metadataValues];
  [(SHSheetViewModel *)self showOptions];
  v11 = NSStringFromBOOL();
  v12 = [(SHSheetViewModel *)self restrictedActivityTypes];
  id v13 = [v3 stringWithFormat:@"<%@ peopleSuggestions:%@ peopleSuggestionProxies:%@ activities:%@ shareProxies:%@ actionProxies:%@ metadataValues:%@ showOptions:%@ restrictedActivityTypes:%@>", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (SHSheetSession)session
{
  return self->_session;
}

- (UIViewController)customViewController
{
  return self->_customViewController;
}

- (void)setCustomViewController:(id)a3
{
}

- (BOOL)isSharingExpanded
{
  return self->_isSharingExpanded;
}

- (void)setIsSharingExpanded:(BOOL)a3
{
  self->_isSharingExpanded = a3;
}

- (NSArray)metadataValues
{
  return self->_metadataValues;
}

- (void)setMetadataValues:(id)a3
{
}

- (BOOL)isLoadingMetadata
{
  return self->_isLoadingMetadata;
}

- (void)setIsLoadingMetadata:(BOOL)a3
{
  self->_isLoadingMetadata = a3;
}

- (NSArray)urlRequests
{
  return self->_urlRequests;
}

- (void)setUrlRequests:(id)a3
{
}

- (NSArray)urlSandboxExtensions
{
  return self->_urlSandboxExtensions;
}

- (void)setUrlSandboxExtensions:(id)a3
{
}

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (void)setShowOptions:(BOOL)a3
{
  self->_showOptions = a3;
}

- (NSString)customOptionsTitle
{
  return self->_customOptionsTitle;
}

- (void)setCustomOptionsTitle:(id)a3
{
}

- (BOOL)showCustomHeaderButton
{
  return self->_showCustomHeaderButton;
}

- (void)setShowCustomHeaderButton:(BOOL)a3
{
  self->_showCustomHeaderButton = a3;
}

- (BOOL)showHeaderSpecialization
{
  return self->_showHeaderSpecialization;
}

- (void)setShowHeaderSpecialization:(BOOL)a3
{
  self->_showHeaderSpecialization = a3;
}

- (NSAttributedString)customHeaderButtonTitle
{
  return self->_customHeaderButtonTitle;
}

- (void)setCustomHeaderButtonTitle:(id)a3
{
}

- (UIColor)customHeaderButtonColor
{
  return self->_customHeaderButtonColor;
}

- (void)setCustomHeaderButtonColor:(id)a3
{
}

- (BOOL)isModeSwitchDisabled
{
  return self->_isModeSwitchDisabled;
}

- (void)setIsModeSwitchDisabled:(BOOL)a3
{
  self->_isModeSwitchDisabled = a3;
}

- (NSNumber)customViewControllerVerticalInsetWrapper
{
  return self->_customViewControllerVerticalInsetWrapper;
}

- (void)setCustomViewControllerVerticalInsetWrapper:(id)a3
{
}

- (NSNumber)customViewControllerSectionHeightWrapper
{
  return self->_customViewControllerSectionHeightWrapper;
}

- (void)setCustomViewControllerSectionHeightWrapper:(id)a3
{
}

- (NSArray)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (void)setPeopleSuggestions:(id)a3
{
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (NSArray)peopleSuggestionProxies
{
  return self->_peopleSuggestionProxies;
}

- (void)setPeopleSuggestionProxies:(id)a3
{
}

- (NSArray)shareProxies
{
  return self->_shareProxies;
}

- (void)setShareProxies:(id)a3
{
}

- (NSArray)actionProxies
{
  return self->_actionProxies;
}

- (void)setActionProxies:(id)a3
{
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (void)setActivitiesByUUID:(id)a3
{
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (void)setApplicationActivityTypes:(id)a3
{
}

- (NSNumber)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (void)setNearbyCountSlotID:(id)a3
{
}

- (BOOL)reloadData
{
  return self->_reloadData;
}

- (void)setReloadData:(BOOL)a3
{
  self->_reloadData = a3;
}

- (BOOL)updateProxiesWithAnimation
{
  return self->_updateProxiesWithAnimation;
}

- (void)setUpdateProxiesWithAnimation:(BOOL)a3
{
  self->_updateProxiesWithAnimation = a3;
}

- (NSArray)restrictedActivityTypes
{
  return self->_restrictedActivityTypes;
}

- (void)setRestrictedActivityTypes:(id)a3
{
}

- (BOOL)supportsCollaboration
{
  return self->_supportsCollaboration;
}

- (void)setSupportsCollaboration:(BOOL)a3
{
  self->_supportsCollaboration = a3;
}

- (BOOL)supportsSendCopy
{
  return self->_supportsSendCopy;
}

- (void)setSupportsSendCopy:(BOOL)a3
{
  self->_supportsSendCopy = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (NSString)collaborationModeTitle
{
  return self->_collaborationModeTitle;
}

- (void)setCollaborationModeTitle:(id)a3
{
}

- (SLCollaborationFooterViewModel)collaborationFooterViewModel
{
  return self->_collaborationFooterViewModel;
}

- (void)setCollaborationFooterViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationFooterViewModel, 0);
  objc_storeStrong((id *)&self->_collaborationModeTitle, 0);
  objc_storeStrong((id *)&self->_restrictedActivityTypes, 0);
  objc_storeStrong((id *)&self->_nearbyCountSlotID, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionProxies, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_storeStrong((id *)&self->_customViewControllerSectionHeightWrapper, 0);
  objc_storeStrong((id *)&self->_customViewControllerVerticalInsetWrapper, 0);
  objc_storeStrong((id *)&self->_customHeaderButtonColor, 0);
  objc_storeStrong((id *)&self->_customHeaderButtonTitle, 0);
  objc_storeStrong((id *)&self->_customOptionsTitle, 0);
  objc_storeStrong((id *)&self->_urlSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_urlRequests, 0);
  objc_storeStrong((id *)&self->_metadataValues, 0);
  objc_storeStrong((id *)&self->_customViewController, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end