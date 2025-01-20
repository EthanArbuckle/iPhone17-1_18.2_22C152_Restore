@interface SHSheetUIServiceClientContext
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)_deserializeMetadatas:(id)a3;
- (BOOL)configureForCloudSharing;
- (BOOL)configureForPhotosEdit;
- (BOOL)hideHeaderView;
- (BOOL)hideNavigationBar;
- (BOOL)isCollaborative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoadingMetadata;
- (BOOL)isModeSwitchDisabled;
- (BOOL)isSharingExpanded;
- (BOOL)showCustomHeaderButton;
- (BOOL)showHeaderSpecialization;
- (BOOL)showHeroActionsHorizontally;
- (BOOL)showOptions;
- (BOOL)supportsCollaboration;
- (BOOL)supportsSendCopy;
- (BOOL)wantsCustomScene;
- (NSArray)activityConfigurations;
- (NSArray)applicationActivityTypes;
- (NSArray)excludedActivityTypes;
- (NSArray)heroActionActivityTypes;
- (NSArray)metadataValues;
- (NSArray)serializedMetadataValues;
- (NSArray)urlRequests;
- (NSArray)urlSandboxExtensions;
- (NSAttributedString)customHeaderButtonTitle;
- (NSDictionary)activitiesByUUID;
- (NSNumber)customViewControllerSectionHeightWrapper;
- (NSNumber)customViewControllerVerticalInsetWrapper;
- (NSString)collaborationModeTitle;
- (NSString)customOptionsTitle;
- (NSString)sessionIdentifier;
- (NSString)topContentSectionText;
- (RBSProcessIdentity)processIdentity;
- (SHSheetUIServiceClientContext)initWithBSXPCCoder:(id)a3;
- (SHSheetUIServiceClientContext)initWithSession:(id)a3;
- (SLCollaborationFooterViewModel)collaborationFooterViewModel;
- (UIColor)customHeaderButtonColor;
- (UIColor)tintColor;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setHideNavigationBar:(BOOL)a3;
@end

@implementation SHSheetUIServiceClientContext

- (SHSheetUIServiceClientContext)initWithSession:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)SHSheetUIServiceClientContext;
  v5 = [(SHSheetUIServiceClientContext *)&v63 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    v8 = [v4 activitiesManager];
    uint64_t v9 = [v8 orderedActivities];
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    if (v9) {
      v11 = (void *)v9;
    }
    id v12 = v11;

    uint64_t v13 = [v4 activityConfigurationsForActivities:v12 forRemoteUIService:1];

    activityConfigurations = v5->_activityConfigurations;
    v5->_activityConfigurations = (NSArray *)v13;

    v15 = [v4 metadataCollection];
    uint64_t v16 = [v15 loadedSerializedMetadatas];
    serializedMetadataValues = v5->_serializedMetadataValues;
    v5->_serializedMetadataValues = (NSArray *)v16;

    uint64_t v18 = +[SHSheetUIServiceClientContext _deserializeMetadatas:v5->_serializedMetadataValues];
    metadataValues = v5->_metadataValues;
    v5->_metadataValues = (NSArray *)v18;

    v20 = [v4 metadataCollection];
    v21 = [v20 metadatas];
    if ([v21 count])
    {
      v22 = [v4 metadataCollection];
      v23 = [v22 loadedMetadatas];
      v5->_isLoadingMetadata = v23 == 0;
    }
    else
    {
      v5->_isLoadingMetadata = 0;
    }

    v24 = [v4 activityItemsManager];
    uint64_t v25 = [v24 urlRequests];
    urlRequests = v5->_urlRequests;
    v5->_urlRequests = (NSArray *)v25;

    v27 = [v4 activityItemsManager];
    uint64_t v28 = [v27 urlSandboxExtensions];
    urlSandboxExtensions = v5->_urlSandboxExtensions;
    v5->_urlSandboxExtensions = (NSArray *)v28;

    v5->_showOptions = [v4 showOptions];
    uint64_t v30 = [v4 customOptionsTitle];
    customOptionsTitle = v5->_customOptionsTitle;
    v5->_customOptionsTitle = (NSString *)v30;

    v5->_showCustomHeaderButton = [v4 showSharePlayProminently];
    v5->_showHeaderSpecialization = [v4 showHeaderSpecialization];
    uint64_t v32 = SHSheetCustomHeaderButtonTitle([v4 showSharePlayProminently]);
    customHeaderButtonTitle = v5->_customHeaderButtonTitle;
    v5->_customHeaderButtonTitle = (NSAttributedString *)v32;

    uint64_t v34 = SHSheetCustomHeaderButtonColor([v4 showSharePlayProminently]);
    customHeaderButtonColor = v5->_customHeaderButtonColor;
    v5->_customHeaderButtonColor = (UIColor *)v34;

    v5->_isModeSwitchDisabled = [v4 isModeSwitchDisabled];
    v5->_isSharingExpanded = [v4 isExpanded];
    v5->_configureForCloudSharing = [v4 configureForCloudSharing];
    v5->_configureForPhotosEdit = [v4 configureForPhotosEdit];
    v5->_hideHeaderView = [v4 hideHeaderView];
    v5->_hideNavigationBar = [v4 hideNavigationBar];
    uint64_t v36 = [v4 topContentSectionText];
    topContentSectionText = v5->_topContentSectionText;
    v5->_topContentSectionText = (NSString *)v36;

    uint64_t v38 = [v4 heroActionActivityTypes];
    heroActionActivityTypes = v5->_heroActionActivityTypes;
    v5->_heroActionActivityTypes = (NSArray *)v38;

    uint64_t v40 = [v4 excludedActivityTypes];
    excludedActivityTypes = v5->_excludedActivityTypes;
    v5->_excludedActivityTypes = (NSArray *)v40;

    v42 = [v4 activitiesManager];
    uint64_t v43 = [v42 applicationActivityTypes];
    applicationActivityTypes = v5->_applicationActivityTypes;
    v5->_applicationActivityTypes = (NSArray *)v43;

    v5->_showHeroActionsHorizontally = [v4 showHeroActionsHorizontally];
    uint64_t v45 = SHSheetTintColor();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v45;

    v5->_supportsCollaboration = [v4 supportsCollaboration];
    v5->_supportsSendCopy = [v4 supportsSendCopy];
    v5->_isCollaborative = [v4 isCollaborative];
    v47 = [v4 collaborationItem];
    v48 = v47;
    if (v47)
    {
      v49 = [v47 canAddPeople];
      uint64_t v50 = SHSheetCollaborationModeTitle(v49);
      collaborationModeTitle = v5->_collaborationModeTitle;
      v5->_collaborationModeTitle = (NSString *)v50;

      uint64_t v52 = [v48 createCollaborationFooterViewModel];
      collaborationFooterViewModel = v5->_collaborationFooterViewModel;
      v5->_collaborationFooterViewModel = (SLCollaborationFooterViewModel *)v52;
    }
    uint64_t v54 = [MEMORY[0x1E4F96408] identityOfCurrentProcess];
    processIdentity = v5->_processIdentity;
    v5->_processIdentity = (RBSProcessIdentity *)v54;

    v5->_wantsCustomScene = [v4 showCustomScene];
    v56 = [v4 activityViewController];
    uint64_t v57 = [v56 customViewControllerVerticalInsetWrapper];
    customViewControllerVerticalInsetWrapper = v5->_customViewControllerVerticalInsetWrapper;
    v5->_customViewControllerVerticalInsetWrapper = (NSNumber *)v57;

    v59 = [v4 activityViewController];
    uint64_t v60 = [v59 customViewControllerSectionHeightWrapper];
    customViewControllerSectionHeightWrapper = v5->_customViewControllerSectionHeightWrapper;
    v5->_customViewControllerSectionHeightWrapper = (NSNumber *)v60;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHSheetUIServiceClientContext *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(SHSheetUIServiceClientContext *)self sessionIdentifier];
      v7 = [(SHSheetUIServiceClientContext *)v5 sessionIdentifier];
      id v8 = v6;
      id v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          char v12 = 0;
          v17 = v9;
          id v15 = v8;
          goto LABEL_79;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11)
        {
          char v12 = 0;
LABEL_80:

          goto LABEL_81;
        }
      }
      uint64_t v13 = [(SHSheetUIServiceClientContext *)self activityConfigurations];
      v14 = [(SHSheetUIServiceClientContext *)v5 activityConfigurations];
      id v15 = v13;
      id v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {
      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          char v12 = 0;
          v23 = v16;
          id v21 = v15;
LABEL_78:

          goto LABEL_79;
        }
        int v18 = [v15 isEqual:v16];

        if (!v18)
        {
          char v12 = 0;
LABEL_79:

          goto LABEL_80;
        }
      }
      v19 = [(SHSheetUIServiceClientContext *)self metadataValues];
      v20 = [(SHSheetUIServiceClientContext *)v5 metadataValues];
      id v21 = v19;
      id v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {
      }
      else
      {
        if ((v21 == 0) == (v22 != 0))
        {
          v130 = v17;
          char v12 = 0;
          v26 = v22;
          id v27 = v21;
LABEL_77:

          v17 = v130;
          goto LABEL_78;
        }
        int v24 = [v21 isEqual:v22];

        if (!v24) {
          goto LABEL_23;
        }
      }
      BOOL v25 = [(SHSheetUIServiceClientContext *)self isLoadingMetadata];
      if (v25 != [(SHSheetUIServiceClientContext *)v5 isLoadingMetadata])
      {
LABEL_23:
        char v12 = 0;
        goto LABEL_78;
      }
      v130 = v17;
      v128 = v23;
      uint64_t v28 = [(SHSheetUIServiceClientContext *)self urlRequests];
      v29 = [(SHSheetUIServiceClientContext *)v5 urlRequests];
      id v27 = v28;
      id v30 = v29;
      id v129 = v30;
      if (v27 == v30)
      {
      }
      else
      {
        v31 = v30;
        if ((v27 == 0) == (v30 != 0))
        {
          char v12 = 0;
          v42 = v27;
          v23 = v128;
LABEL_75:

          goto LABEL_76;
        }
        id v32 = v21;
        v33 = v30;
        int v34 = [v27 isEqual:v30];

        id v21 = v32;
        if (!v34)
        {
          char v12 = 0;
          v23 = v128;
LABEL_76:
          v26 = v129;
          goto LABEL_77;
        }
      }
      id v127 = v27;
      v35 = [(SHSheetUIServiceClientContext *)self urlSandboxExtensions];
      uint64_t v36 = [(SHSheetUIServiceClientContext *)v5 urlSandboxExtensions];
      id v37 = v35;
      id v38 = v36;
      id v125 = v38;
      id v126 = v37;
      if (v37 == v38)
      {
      }
      else
      {
        v39 = v38;
        if ((v37 == 0) == (v38 != 0))
        {
          char v12 = 0;
          v44 = v38;
          uint64_t v45 = v37;
          v23 = v128;
LABEL_73:

          goto LABEL_74;
        }
        uint64_t v40 = v37;
        int v41 = [v37 isEqual:v38];

        id v27 = v127;
        if (!v41) {
          goto LABEL_37;
        }
      }
      BOOL v43 = [(SHSheetUIServiceClientContext *)self showOptions];
      if (v43 != [(SHSheetUIServiceClientContext *)v5 showOptions])
      {
LABEL_37:
        char v12 = 0;
        v23 = v128;
LABEL_74:
        v31 = v125;
        v42 = v126;
        goto LABEL_75;
      }
      v46 = [(SHSheetUIServiceClientContext *)self customOptionsTitle];
      v47 = [(SHSheetUIServiceClientContext *)v5 customOptionsTitle];
      id v48 = v46;
      id v49 = v47;
      uint64_t v45 = v48;
      id v124 = v49;
      if (v48 == v49)
      {

        id v27 = v127;
      }
      else
      {
        uint64_t v50 = v49;
        if ((v45 == 0) == (v49 != 0))
        {
          char v12 = 0;
          uint64_t v54 = v49;
          v123 = v45;
          id v27 = v127;
          v23 = v128;
LABEL_71:

          goto LABEL_72;
        }
        int v51 = [v45 isEqual:v49];

        id v27 = v127;
        if (!v51)
        {
LABEL_46:
          char v12 = 0;
          v23 = v128;
LABEL_72:
          v44 = v124;
          goto LABEL_73;
        }
      }
      BOOL v52 = [(SHSheetUIServiceClientContext *)self showCustomHeaderButton];
      if (v52 != [(SHSheetUIServiceClientContext *)v5 showCustomHeaderButton]) {
        goto LABEL_46;
      }
      BOOL v53 = [(SHSheetUIServiceClientContext *)self showHeaderSpecialization];
      if (v53 != [(SHSheetUIServiceClientContext *)v5 showHeaderSpecialization]) {
        goto LABEL_46;
      }
      v121 = v45;
      v55 = [(SHSheetUIServiceClientContext *)self customHeaderButtonTitle];
      v56 = [(SHSheetUIServiceClientContext *)v5 customHeaderButtonTitle];
      id v57 = v55;
      id v58 = v56;
      id v122 = v58;
      v123 = v57;
      if (v57 == v58)
      {
      }
      else
      {
        v59 = v58;
        if ((v57 == 0) == (v58 != 0))
        {
          char v12 = 0;
          v66 = v58;
          v120 = v57;
          id v27 = v127;
          v23 = v128;
          uint64_t v45 = v121;
LABEL_69:

          goto LABEL_70;
        }
        int v60 = [v57 isEqual:v58];

        if (!v60)
        {
          char v12 = 0;
          id v27 = v127;
          v23 = v128;
          uint64_t v45 = v121;
LABEL_70:
          uint64_t v54 = v122;
          goto LABEL_71;
        }
      }
      v61 = [(SHSheetUIServiceClientContext *)self customHeaderButtonColor];
      v62 = [(SHSheetUIServiceClientContext *)v5 customHeaderButtonColor];
      id v63 = v61;
      id v64 = v62;
      id v119 = v64;
      v120 = v63;
      if (v63 == v64)
      {
      }
      else
      {
        v65 = v64;
        if ((v63 == 0) == (v64 != 0))
        {
          char v12 = 0;
          id v73 = v63;
LABEL_67:

          goto LABEL_68;
        }
        int v117 = [v63 isEqual:v64];

        if (!v117)
        {
LABEL_65:
          char v12 = 0;
LABEL_68:
          id v27 = v127;
          v23 = v128;
          uint64_t v45 = v121;
          v66 = v119;
          goto LABEL_69;
        }
      }
      BOOL v67 = [(SHSheetUIServiceClientContext *)self isModeSwitchDisabled];
      if (v67 != [(SHSheetUIServiceClientContext *)v5 isModeSwitchDisabled]) {
        goto LABEL_65;
      }
      BOOL v68 = [(SHSheetUIServiceClientContext *)self isSharingExpanded];
      if (v68 != [(SHSheetUIServiceClientContext *)v5 isSharingExpanded]) {
        goto LABEL_65;
      }
      BOOL v69 = [(SHSheetUIServiceClientContext *)self configureForCloudSharing];
      if (v69 != [(SHSheetUIServiceClientContext *)v5 configureForCloudSharing]) {
        goto LABEL_65;
      }
      BOOL v70 = [(SHSheetUIServiceClientContext *)self configureForPhotosEdit];
      if (v70 != [(SHSheetUIServiceClientContext *)v5 configureForPhotosEdit]) {
        goto LABEL_65;
      }
      BOOL v71 = [(SHSheetUIServiceClientContext *)self hideHeaderView];
      if (v71 != [(SHSheetUIServiceClientContext *)v5 hideHeaderView]) {
        goto LABEL_65;
      }
      BOOL v72 = [(SHSheetUIServiceClientContext *)self hideNavigationBar];
      if (v72 != [(SHSheetUIServiceClientContext *)v5 hideNavigationBar]) {
        goto LABEL_65;
      }
      v75 = [(SHSheetUIServiceClientContext *)self topContentSectionText];
      v76 = [(SHSheetUIServiceClientContext *)v5 topContentSectionText];
      id v73 = v75;
      id v118 = v76;
      if (v73 == v118)
      {
      }
      else
      {
        if ((v73 == 0) == (v118 != 0))
        {
          char v12 = 0;
          v116 = v73;

LABEL_126:
          goto LABEL_127;
        }
        int v77 = [v73 isEqual:v118];

        if (!v77)
        {
          char v12 = 0;
LABEL_127:
          v65 = v118;
          goto LABEL_67;
        }
      }
      v78 = [(SHSheetUIServiceClientContext *)self heroActionActivityTypes];
      v79 = [(SHSheetUIServiceClientContext *)v5 heroActionActivityTypes];
      id v80 = v78;
      id v115 = v79;
      v116 = v80;
      if (v80 == v115)
      {
      }
      else
      {
        if ((v80 == 0) == (v115 != 0))
        {
          char v12 = 0;
          v114 = v80;

LABEL_124:
          goto LABEL_125;
        }
        int v113 = [v80 isEqual:v115];

        if (!v113)
        {
          char v12 = 0;
LABEL_125:

          goto LABEL_126;
        }
      }
      v81 = [(SHSheetUIServiceClientContext *)self excludedActivityTypes];
      v82 = [(SHSheetUIServiceClientContext *)v5 excludedActivityTypes];
      id v83 = v81;
      id v112 = v82;
      v114 = v83;
      if (v83 == v112)
      {
      }
      else
      {
        if ((v83 == 0) == (v112 != 0))
        {
          char v12 = 0;
          v111 = v83;

LABEL_122:
          goto LABEL_123;
        }
        int v110 = [v83 isEqual:v112];

        if (!v110)
        {
          char v12 = 0;
LABEL_123:

          goto LABEL_124;
        }
      }
      v84 = [(SHSheetUIServiceClientContext *)self applicationActivityTypes];
      v85 = [(SHSheetUIServiceClientContext *)v5 applicationActivityTypes];
      id v86 = v84;
      id v109 = v85;
      v111 = v86;
      if (v86 == v109)
      {
      }
      else
      {
        if ((v86 == 0) == (v109 != 0))
        {
          char v12 = 0;
          v108 = v86;

LABEL_120:
          goto LABEL_121;
        }
        int v107 = [v86 isEqual:v109];

        if (!v107) {
          goto LABEL_106;
        }
      }
      BOOL v87 = [(SHSheetUIServiceClientContext *)self showHeroActionsHorizontally];
      if (v87 != [(SHSheetUIServiceClientContext *)v5 showHeroActionsHorizontally])
      {
LABEL_106:
        char v12 = 0;
LABEL_121:

        goto LABEL_122;
      }
      v88 = [(SHSheetUIServiceClientContext *)self tintColor];
      v89 = [(SHSheetUIServiceClientContext *)v5 tintColor];
      id v90 = v88;
      id v106 = v89;
      v108 = v90;
      if (v90 == v106)
      {
      }
      else
      {
        if ((v90 == 0) == (v106 != 0))
        {
          char v12 = 0;
          v94 = v90;
          v105 = v106;
LABEL_118:

          goto LABEL_119;
        }
        int v104 = [v90 isEqual:v106];

        if (!v104)
        {
LABEL_116:
          char v12 = 0;
LABEL_119:

          goto LABEL_120;
        }
      }
      BOOL v91 = [(SHSheetUIServiceClientContext *)self supportsCollaboration];
      if (v91 != [(SHSheetUIServiceClientContext *)v5 supportsCollaboration]) {
        goto LABEL_116;
      }
      BOOL v92 = [(SHSheetUIServiceClientContext *)self supportsSendCopy];
      if (v92 != [(SHSheetUIServiceClientContext *)v5 supportsSendCopy]) {
        goto LABEL_116;
      }
      BOOL v93 = [(SHSheetUIServiceClientContext *)self isCollaborative];
      if (v93 != [(SHSheetUIServiceClientContext *)v5 isCollaborative]) {
        goto LABEL_116;
      }
      v95 = [(SHSheetUIServiceClientContext *)self collaborationModeTitle];
      v96 = [(SHSheetUIServiceClientContext *)v5 collaborationModeTitle];
      id v97 = v95;
      id v98 = v96;
      v94 = v97;
      v105 = v98;
      if (v97 == v98)
      {
      }
      else
      {
        if ((v97 == 0) == (v98 != 0))
        {
          char v12 = 0;

          goto LABEL_142;
        }
        int v102 = [v97 isEqual:v98];

        if (!v102) {
          goto LABEL_134;
        }
      }
      BOOL v99 = [(SHSheetUIServiceClientContext *)self wantsCustomScene];
      if (v99 != [(SHSheetUIServiceClientContext *)v5 wantsCustomScene])
      {
LABEL_134:
        char v12 = 0;
        goto LABEL_118;
      }
      v100 = [(SHSheetUIServiceClientContext *)self collaborationFooterViewModel];
      v101 = [(SHSheetUIServiceClientContext *)v5 collaborationFooterViewModel];
      id v97 = v100;
      id v103 = v101;
      if (v97 == v103)
      {
        char v12 = 1;
      }
      else if ((v97 == 0) == (v103 != 0))
      {
        char v12 = 0;
      }
      else
      {
        char v12 = [v97 isEqual:v103];
      }

LABEL_142:
      goto LABEL_118;
    }
    char v12 = 0;
  }
LABEL_81:

  return v12;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v23 = a3;
  id v4 = [(SHSheetUIServiceClientContext *)self sessionIdentifier];
  [v23 encodeObject:v4 forKey:@"sessionIdentifier"];

  v5 = [(SHSheetUIServiceClientContext *)self activityConfigurations];
  [v23 encodeCollection:v5 forKey:@"activityConfigurations"];

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext isSharingExpanded](self, "isSharingExpanded"), @"isSharingExpanded");
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext configureForCloudSharing](self, "configureForCloudSharing"), @"configureForCloudSharing");
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext configureForPhotosEdit](self, "configureForPhotosEdit"), @"configureForPhotosEdit");
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext hideHeaderView](self, "hideHeaderView"), @"hideHeaderView");
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext hideNavigationBar](self, "hideNavigationBar"), @"hideNavigationBar");
  uint64_t v6 = [(SHSheetUIServiceClientContext *)self topContentSectionText];
  [v23 encodeObject:v6 forKey:@"topContentSectionText"];

  v7 = [(SHSheetUIServiceClientContext *)self heroActionActivityTypes];
  [v23 encodeObject:v7 forKey:@"heroActionActivityTypes"];

  id v8 = [(SHSheetUIServiceClientContext *)self excludedActivityTypes];
  [v23 encodeObject:v8 forKey:@"excludedActivityTypes"];

  id v9 = [(SHSheetUIServiceClientContext *)self applicationActivityTypes];
  [v23 encodeObject:v9 forKey:@"applicationActivityTypes"];

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext showHeroActionsHorizontally](self, "showHeroActionsHorizontally"), @"showHeroActionsHorizontally");
  v10 = [(SHSheetUIServiceClientContext *)self tintColor];
  [v23 encodeObject:v10 forKey:@"tintColor"];

  int v11 = [(SHSheetUIServiceClientContext *)self serializedMetadataValues];
  [v23 encodeObject:v11 forKey:@"serializedMetadataValues"];

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext isLoadingMetadata](self, "isLoadingMetadata"), @"isLoadingMetadata");
  char v12 = [(SHSheetUIServiceClientContext *)self urlRequests];
  [v23 encodeObject:v12 forKey:@"urlRequests"];

  uint64_t v13 = [(SHSheetUIServiceClientContext *)self urlSandboxExtensions];
  [v23 encodeObject:v13 forKey:@"urlSandboxExtensions"];

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext showOptions](self, "showOptions"), @"showOptions");
  v14 = [(SHSheetUIServiceClientContext *)self customOptionsTitle];
  [v23 encodeObject:v14 forKey:@"customOptionsTitle"];

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext showCustomHeaderButton](self, "showCustomHeaderButton"), @"showCustomHeaderButton");
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext showHeaderSpecialization](self, "showHeaderSpecialization"), @"showHeaderSpecialization");
  id v15 = [(SHSheetUIServiceClientContext *)self customHeaderButtonTitle];
  [v23 encodeObject:v15 forKey:@"customHeaderButtonTitle"];

  id v16 = [(SHSheetUIServiceClientContext *)self customHeaderButtonColor];
  [v23 encodeObject:v16 forKey:@"customHeaderButtonColor"];

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext isModeSwitchDisabled](self, "isModeSwitchDisabled"), @"isModeSwitchDisabled");
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext supportsCollaboration](self, "supportsCollaboration"), @"supportsCollaboration");
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext supportsSendCopy](self, "supportsSendCopy"), @"supportsSendCopy");
  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext isCollaborative](self, "isCollaborative"), @"isCollaborative");
  v17 = [(SHSheetUIServiceClientContext *)self collaborationModeTitle];
  [v23 encodeObject:v17 forKey:@"collaborationModeTitle"];

  int v18 = [(SHSheetUIServiceClientContext *)self collaborationFooterViewModel];

  if (v18)
  {
    v19 = [(SHSheetUIServiceClientContext *)self collaborationFooterViewModel];
    [v23 encodeObject:v19 forKey:@"collaborationFooterViewModel"];
  }
  v20 = [(SHSheetUIServiceClientContext *)self processIdentity];
  [v23 encodeObject:v20 forKey:@"processIdentity"];

  objc_msgSend(v23, "encodeBool:forKey:", -[SHSheetUIServiceClientContext wantsCustomScene](self, "wantsCustomScene"), @"wantsCustomScene");
  id v21 = [(SHSheetUIServiceClientContext *)self customViewControllerVerticalInsetWrapper];
  [v23 encodeObject:v21 forKey:@"customViewControllerVerticalInsetWrapper"];

  id v22 = [(SHSheetUIServiceClientContext *)self customViewControllerSectionHeightWrapper];
  [v23 encodeObject:v22 forKey:@"customViewControllerSectionHeightWrapper"];
}

- (SHSheetUIServiceClientContext)initWithBSXPCCoder:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)SHSheetUIServiceClientContext;
  v5 = [(SHSheetUIServiceClientContext *)&v68 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 decodeCollectionOfClass:v8 containingClass:objc_opt_class() forKey:@"activityConfigurations"];
    activityConfigurations = v5->_activityConfigurations;
    v5->_activityConfigurations = (NSArray *)v9;

    int v11 = +[SUIHostActivityProxy activitiesForConfigurations:v5->_activityConfigurations];
    char v12 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          int v18 = objc_msgSend(v17, "activityUUID", (void)v64);
          [v12 setObject:v17 forKeyedSubscript:v18];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v14);
    }

    uint64_t v19 = [v12 copy];
    activitiesByUUID = v5->_activitiesByUUID;
    v5->_activitiesByUUID = (NSDictionary *)v19;

    v5->_isSharingExpanded = [v4 decodeBoolForKey:@"isSharingExpanded"];
    v5->_configureForCloudSharing = [v4 decodeBoolForKey:@"configureForCloudSharing"];
    v5->_configureForPhotosEdit = [v4 decodeBoolForKey:@"configureForPhotosEdit"];
    v5->_hideHeaderView = [v4 decodeBoolForKey:@"hideHeaderView"];
    v5->_hideNavigationBar = [v4 decodeBoolForKey:@"hideNavigationBar"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topContentSectionText"];
    topContentSectionText = v5->_topContentSectionText;
    v5->_topContentSectionText = (NSString *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v24 = [v4 decodeCollectionOfClass:v23 containingClass:objc_opt_class() forKey:@"heroActionActivityTypes"];
    heroActionActivityTypes = v5->_heroActionActivityTypes;
    v5->_heroActionActivityTypes = (NSArray *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v27 = [v4 decodeCollectionOfClass:v26 containingClass:objc_opt_class() forKey:@"excludedActivityTypes"];
    excludedActivityTypes = v5->_excludedActivityTypes;
    v5->_excludedActivityTypes = (NSArray *)v27;

    uint64_t v29 = objc_opt_class();
    uint64_t v30 = [v4 decodeCollectionOfClass:v29 containingClass:objc_opt_class() forKey:@"applicationActivityTypes"];
    applicationActivityTypes = v5->_applicationActivityTypes;
    v5->_applicationActivityTypes = (NSArray *)v30;

    v5->_showHeroActionsHorizontally = [v4 decodeBoolForKey:@"showHeroActionsHorizontally"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v32;

    uint64_t v34 = objc_opt_class();
    uint64_t v35 = [v4 decodeCollectionOfClass:v34 containingClass:objc_opt_class() forKey:@"serializedMetadataValues"];
    serializedMetadataValues = v5->_serializedMetadataValues;
    v5->_serializedMetadataValues = (NSArray *)v35;

    uint64_t v37 = +[SHSheetUIServiceClientContext _deserializeMetadatas:v5->_serializedMetadataValues];
    metadataValues = v5->_metadataValues;
    v5->_metadataValues = (NSArray *)v37;

    v5->_isLoadingMetadata = [v4 decodeBoolForKey:@"isLoadingMetadata"];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = [v4 decodeCollectionOfClass:v39 containingClass:objc_opt_class() forKey:@"urlRequests"];
    urlRequests = v5->_urlRequests;
    v5->_urlRequests = (NSArray *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v43 = [v4 decodeCollectionOfClass:v42 containingClass:objc_opt_class() forKey:@"urlSandboxExtensions"];
    urlSandboxExtensions = v5->_urlSandboxExtensions;
    v5->_urlSandboxExtensions = (NSArray *)v43;

    v5->_showOptions = [v4 decodeBoolForKey:@"showOptions"];
    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customOptionsTitle"];
    customOptionsTitle = v5->_customOptionsTitle;
    v5->_customOptionsTitle = (NSString *)v45;

    v5->_showCustomHeaderButton = [v4 decodeBoolForKey:@"showCustomHeaderButton"];
    v5->_showHeaderSpecialization = [v4 decodeBoolForKey:@"showHeaderSpecialization"];
    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customHeaderButtonTitle"];
    customHeaderButtonTitle = v5->_customHeaderButtonTitle;
    v5->_customHeaderButtonTitle = (NSAttributedString *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customHeaderButtonColor"];
    customHeaderButtonColor = v5->_customHeaderButtonColor;
    v5->_customHeaderButtonColor = (UIColor *)v49;

    v5->_isModeSwitchDisabled = [v4 decodeBoolForKey:@"isModeSwitchDisabled"];
    v5->_supportsCollaboration = [v4 decodeBoolForKey:@"supportsCollaboration"];
    v5->_supportsSendCopy = [v4 decodeBoolForKey:@"supportsSendCopy"];
    v5->_isCollaborative = [v4 decodeBoolForKey:@"isCollaborative"];
    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collaborationModeTitle"];
    collaborationModeTitle = v5->_collaborationModeTitle;
    v5->_collaborationModeTitle = (NSString *)v51;

    if (v5->_supportsCollaboration)
    {
      uint64_t v70 = 0;
      BOOL v71 = &v70;
      uint64_t v72 = 0x2050000000;
      BOOL v53 = (void *)getSLCollaborationFooterViewModelClass_softClass;
      uint64_t v73 = getSLCollaborationFooterViewModelClass_softClass;
      if (!getSLCollaborationFooterViewModelClass_softClass)
      {
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __getSLCollaborationFooterViewModelClass_block_invoke;
        v69[3] = &unk_1E5A216E8;
        v69[4] = &v70;
        __getSLCollaborationFooterViewModelClass_block_invoke((uint64_t)v69);
        BOOL v53 = (void *)v71[3];
      }
      id v54 = v53;
      _Block_object_dispose(&v70, 8);
      uint64_t v55 = [v4 decodeObjectOfClass:v54 forKey:@"collaborationFooterViewModel"];
      collaborationFooterViewModel = v5->_collaborationFooterViewModel;
      v5->_collaborationFooterViewModel = (SLCollaborationFooterViewModel *)v55;
    }
    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processIdentity"];
    processIdentity = v5->_processIdentity;
    v5->_processIdentity = (RBSProcessIdentity *)v57;

    v5->_wantsCustomScene = [v4 decodeBoolForKey:@"wantsCustomScene"];
    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customViewControllerVerticalInsetWrapper"];
    customViewControllerVerticalInsetWrapper = v5->_customViewControllerVerticalInsetWrapper;
    v5->_customViewControllerVerticalInsetWrapper = (NSNumber *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customViewControllerSectionHeightWrapper"];
    customViewControllerSectionHeightWrapper = v5->_customViewControllerSectionHeightWrapper;
    v5->_customViewControllerSectionHeightWrapper = (NSNumber *)v61;
  }
  return v5;
}

+ (id)_deserializeMetadatas:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        uint64_t v20 = 0;
        uint64_t v21 = &v20;
        uint64_t v22 = 0x2050000000;
        v10 = (void *)getLPLinkMetadataClass_softClass;
        uint64_t v23 = getLPLinkMetadataClass_softClass;
        if (!getLPLinkMetadataClass_softClass)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          uint64_t v26 = __getLPLinkMetadataClass_block_invoke;
          uint64_t v27 = &unk_1E5A216E8;
          uint64_t v28 = &v20;
          __getLPLinkMetadataClass_block_invoke((uint64_t)&buf);
          v10 = (void *)v21[3];
        }
        id v11 = v10;
        _Block_object_dispose(&v20, 8);
        char v12 = [v11 metadataWithDataRepresentationForLocalUseOnly:v9];
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          id v13 = share_sheet_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_ERROR, "Failed to de-serialize metadata from data: %@", (uint8_t *)&buf, 0xCu);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }

  uint64_t v14 = (void *)[v4 copy];
  return v14;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (BOOL)hideHeaderView
{
  return self->_hideHeaderView;
}

- (BOOL)hideNavigationBar
{
  return self->_hideNavigationBar;
}

- (void)setHideNavigationBar:(BOOL)a3
{
  self->_hideNavigationBar = a3;
}

- (BOOL)isSharingExpanded
{
  return self->_isSharingExpanded;
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (NSString)topContentSectionText
{
  return self->_topContentSectionText;
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (NSArray)activityConfigurations
{
  return self->_activityConfigurations;
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (NSArray)metadataValues
{
  return self->_metadataValues;
}

- (BOOL)isLoadingMetadata
{
  return self->_isLoadingMetadata;
}

- (NSArray)urlRequests
{
  return self->_urlRequests;
}

- (NSArray)urlSandboxExtensions
{
  return self->_urlSandboxExtensions;
}

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (NSString)customOptionsTitle
{
  return self->_customOptionsTitle;
}

- (BOOL)showCustomHeaderButton
{
  return self->_showCustomHeaderButton;
}

- (BOOL)showHeaderSpecialization
{
  return self->_showHeaderSpecialization;
}

- (NSAttributedString)customHeaderButtonTitle
{
  return self->_customHeaderButtonTitle;
}

- (UIColor)customHeaderButtonColor
{
  return self->_customHeaderButtonColor;
}

- (BOOL)isModeSwitchDisabled
{
  return self->_isModeSwitchDisabled;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)supportsCollaboration
{
  return self->_supportsCollaboration;
}

- (BOOL)supportsSendCopy
{
  return self->_supportsSendCopy;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (NSString)collaborationModeTitle
{
  return self->_collaborationModeTitle;
}

- (SLCollaborationFooterViewModel)collaborationFooterViewModel
{
  return self->_collaborationFooterViewModel;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (BOOL)wantsCustomScene
{
  return self->_wantsCustomScene;
}

- (NSNumber)customViewControllerVerticalInsetWrapper
{
  return self->_customViewControllerVerticalInsetWrapper;
}

- (NSNumber)customViewControllerSectionHeightWrapper
{
  return self->_customViewControllerSectionHeightWrapper;
}

- (NSArray)serializedMetadataValues
{
  return self->_serializedMetadataValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedMetadataValues, 0);
  objc_storeStrong((id *)&self->_customViewControllerSectionHeightWrapper, 0);
  objc_storeStrong((id *)&self->_customViewControllerVerticalInsetWrapper, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_collaborationFooterViewModel, 0);
  objc_storeStrong((id *)&self->_collaborationModeTitle, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_customHeaderButtonColor, 0);
  objc_storeStrong((id *)&self->_customHeaderButtonTitle, 0);
  objc_storeStrong((id *)&self->_customOptionsTitle, 0);
  objc_storeStrong((id *)&self->_urlSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_urlRequests, 0);
  objc_storeStrong((id *)&self->_metadataValues, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_activityConfigurations, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end