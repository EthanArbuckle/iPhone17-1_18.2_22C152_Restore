@interface PXMomentShareStatusPresentation
+ (PXMomentShareStatusPresentation)new;
- (BOOL)isPaused;
- (BOOL)isReadyForUpdates;
- (NSString)actionConfirmationAlertButtonTitle;
- (NSString)actionConfirmationAlertSubtitle;
- (NSString)actionConfirmationAlertTitle;
- (NSString)actionTitle;
- (NSString)activityTitle;
- (NSString)assetsSaveStatusTitle;
- (NSString)assetsTitle;
- (NSString)byline;
- (NSString)description;
- (NSString)expirationTitle;
- (NSString)idleTitle;
- (NSString)pauseResolutionActionConfirmationAlertButtonTitle;
- (NSString)pauseResolutionActionConfirmationAlertSubtitle;
- (NSString)pauseResolutionActionConfirmationAlertTitle;
- (NSString)pauseResolutionActionTitle;
- (NSString)pauseStatusDescription;
- (NSString)pauseTitle;
- (PXCMMInvitation)invitation;
- (PXDisplayMomentShare)momentShare;
- (PXMomentShareStatus)momentShareStatus;
- (PXMomentShareStatusPresentation)init;
- (PXMomentShareStatusPresentation)initWithMomentShare:(id)a3 presentationStyle:(int64_t)a4;
- (PXMomentShareStatusPresentation)initWithMomentShareStatus:(id)a3 presentationStyle:(int64_t)a4;
- (float)activityProgress;
- (id)action;
- (id)pauseResolutionAction;
- (int64_t)numberOfAssetsCopied;
- (int64_t)numberOfAssetsNotCopied;
- (int64_t)pauseResolutionActionType;
- (int64_t)presentationStyle;
- (int64_t)state;
- (int64_t)type;
- (void)_updateCPLStatus;
- (void)_updateCountsAndStatus;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAction:(id)a3;
- (void)setActionConfirmationAlertButtonTitle:(id)a3;
- (void)setActionConfirmationAlertSubtitle:(id)a3;
- (void)setActionConfirmationAlertTitle:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setActivityProgress:(float)a3;
- (void)setActivityTitle:(id)a3;
- (void)setAssetsSaveStatusTitle:(id)a3;
- (void)setAssetsTitle:(id)a3;
- (void)setByline:(id)a3;
- (void)setExpirationTitle:(id)a3;
- (void)setIdleTitle:(id)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setIsReadyForUpdates:(BOOL)a3;
- (void)setNumberOfAssetsCopied:(int64_t)a3;
- (void)setNumberOfAssetsNotCopied:(int64_t)a3;
- (void)setPauseResolutionAction:(id)a3;
- (void)setPauseResolutionActionConfirmationAlertButtonTitle:(id)a3;
- (void)setPauseResolutionActionConfirmationAlertSubtitle:(id)a3;
- (void)setPauseResolutionActionConfirmationAlertTitle:(id)a3;
- (void)setPauseResolutionActionTitle:(id)a3;
- (void)setPauseResolutionActionType:(int64_t)a3;
- (void)setPauseStatusDescription:(id)a3;
- (void)setPauseTitle:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PXMomentShareStatusPresentation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pauseResolutionAction, 0);
  objc_storeStrong((id *)&self->_pauseResolutionActionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_pauseResolutionActionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_pauseResolutionActionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_pauseResolutionActionTitle, 0);
  objc_storeStrong((id *)&self->_pauseStatusDescription, 0);
  objc_storeStrong((id *)&self->_momentShareStatus, 0);
  objc_storeStrong((id *)&self->_byline, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_pauseTitle, 0);
  objc_storeStrong((id *)&self->_idleTitle, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_expirationTitle, 0);
  objc_storeStrong((id *)&self->_assetsSaveStatusTitle, 0);
  objc_storeStrong((id *)&self->_assetsTitle, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
}

- (void)setIsReadyForUpdates:(BOOL)a3
{
  self->_isReadyForUpdates = a3;
}

- (BOOL)isReadyForUpdates
{
  return self->_isReadyForUpdates;
}

- (void)setPauseResolutionActionType:(int64_t)a3
{
  self->_pauseResolutionActionType = a3;
}

- (int64_t)pauseResolutionActionType
{
  return self->_pauseResolutionActionType;
}

- (void)setPauseResolutionAction:(id)a3
{
}

- (id)pauseResolutionAction
{
  return self->_pauseResolutionAction;
}

- (void)setPauseResolutionActionConfirmationAlertButtonTitle:(id)a3
{
}

- (NSString)pauseResolutionActionConfirmationAlertButtonTitle
{
  return self->_pauseResolutionActionConfirmationAlertButtonTitle;
}

- (void)setPauseResolutionActionConfirmationAlertSubtitle:(id)a3
{
}

- (NSString)pauseResolutionActionConfirmationAlertSubtitle
{
  return self->_pauseResolutionActionConfirmationAlertSubtitle;
}

- (void)setPauseResolutionActionConfirmationAlertTitle:(id)a3
{
}

- (NSString)pauseResolutionActionConfirmationAlertTitle
{
  return self->_pauseResolutionActionConfirmationAlertTitle;
}

- (void)setPauseResolutionActionTitle:(id)a3
{
}

- (NSString)pauseResolutionActionTitle
{
  return self->_pauseResolutionActionTitle;
}

- (void)setPauseStatusDescription:(id)a3
{
}

- (NSString)pauseStatusDescription
{
  return self->_pauseStatusDescription;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (int64_t)numberOfAssetsCopied
{
  return self->_numberOfAssetsCopied;
}

- (int64_t)numberOfAssetsNotCopied
{
  return self->_numberOfAssetsNotCopied;
}

- (PXMomentShareStatus)momentShareStatus
{
  return self->_momentShareStatus;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (int64_t)state
{
  return self->_state;
}

- (float)activityProgress
{
  return self->_activityProgress;
}

- (NSString)byline
{
  return self->_byline;
}

- (id)action
{
  return self->_action;
}

- (NSString)actionConfirmationAlertButtonTitle
{
  return self->_actionConfirmationAlertButtonTitle;
}

- (NSString)actionConfirmationAlertSubtitle
{
  return self->_actionConfirmationAlertSubtitle;
}

- (NSString)actionConfirmationAlertTitle
{
  return self->_actionConfirmationAlertTitle;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (NSString)pauseTitle
{
  return self->_pauseTitle;
}

- (NSString)idleTitle
{
  return self->_idleTitle;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (NSString)expirationTitle
{
  return self->_expirationTitle;
}

- (NSString)assetsSaveStatusTitle
{
  return self->_assetsSaveStatusTitle;
}

- (NSString)assetsTitle
{
  return self->_assetsTitle;
}

- (int64_t)type
{
  return self->_type;
}

- (void)_updateCPLStatus
{
  v3 = [(PXCPLUIStatusProvider *)self->_statusProvider status];
  unsigned int IsPaused = _IsPaused(v3);
  BOOL v5 = [(PXMomentShareStatusPresentation *)self isPaused];
  unsigned int v37 = IsPaused;
  if (IsPaused)
  {
    id v6 = [v3 failureDescription];
    id v7 = [v3 actionTitle];
    id v8 = [v3 actionConfirmationAlertTitle];
    id v9 = [v3 actionConfirmationAlertSubtitle];
    id v36 = [v3 actionConfirmationAlertButtonTitle];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PXMomentShareStatusPresentation__updateCPLStatus__block_invoke;
    aBlock[3] = &unk_1E5DD36F8;
    id v10 = v3;
    id v40 = v10;
    v38 = _Block_copy(aBlock);

    uint64_t v35 = [v10 serviceAction];
  }
  else
  {
    v38 = 0;
    id v9 = 0;
    id v7 = 0;
    id v6 = 0;
    id v8 = 0;
    uint64_t v35 = 0;
    id v36 = 0;
  }
  id v11 = [(PXMomentShareStatusPresentation *)self pauseStatusDescription];
  if (v6 == v11)
  {
  }
  else
  {
    int v12 = [v6 isEqualToString:v11];

    if (!v12) {
      goto LABEL_11;
    }
  }
  id v13 = [(PXMomentShareStatusPresentation *)self pauseResolutionActionTitle];
  if (v7 == v13)
  {
  }
  else
  {
    char v14 = [v7 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {

LABEL_11:
      goto LABEL_29;
    }
  }
  char v15 = v37 ^ v5;
  id v16 = [(PXMomentShareStatusPresentation *)self pauseResolutionActionConfirmationAlertTitle];
  v34 = v9;
  char v33 = v15;
  if (v8 == v16)
  {
  }
  else
  {
    int v17 = [v8 isEqualToString:v16];

    if (!v17)
    {
      v18 = v8;
      BOOL v19 = 1;
      char v20 = v33;
      goto LABEL_28;
    }
  }
  id v21 = [(PXMomentShareStatusPresentation *)self pauseResolutionActionConfirmationAlertSubtitle];
  if (v9 == v21)
  {

LABEL_21:
    id v23 = [(PXMomentShareStatusPresentation *)self pauseResolutionActionConfirmationAlertButtonTitle];
    v18 = v8;
    if (v36 == v23)
    {
    }
    else
    {
      int v24 = [v36 isEqualToString:v23];

      if (!v24)
      {
        BOOL v19 = 1;
LABEL_26:

        goto LABEL_27;
      }
    }
    BOOL v19 = v35 != [(PXMomentShareStatusPresentation *)self pauseResolutionActionType];
    goto LABEL_26;
  }
  int v22 = [v9 isEqualToString:v21];

  if (v22) {
    goto LABEL_21;
  }
  v18 = v8;
  BOOL v19 = 1;
LABEL_27:
  char v20 = v33;

  id v7 = v32;
LABEL_28:

  char v25 = v19 | v20;
  id v8 = v18;
  id v9 = v34;
  if ((v25 & 1) == 0)
  {
    v26 = v8;
    int v28 = 0;
    v27 = v36;
    goto LABEL_31;
  }
LABEL_29:
  [(PXMomentShareStatusPresentation *)self setIsPaused:v37];
  [(PXMomentShareStatusPresentation *)self setPauseStatusDescription:v6];
  [(PXMomentShareStatusPresentation *)self setPauseResolutionActionTitle:v7];
  v26 = v8;
  [(PXMomentShareStatusPresentation *)self setPauseResolutionActionConfirmationAlertTitle:v8];
  [(PXMomentShareStatusPresentation *)self setPauseResolutionActionConfirmationAlertSubtitle:v9];
  v27 = v36;
  [(PXMomentShareStatusPresentation *)self setPauseResolutionActionConfirmationAlertButtonTitle:v36];
  [(PXMomentShareStatusPresentation *)self setPauseResolutionAction:v38];
  [(PXMomentShareStatusPresentation *)self setPauseResolutionActionType:v35];
  int v28 = 1;
LABEL_31:
  id v29 = v3;
  v30 = v29;
  if (!v29) {
    goto LABEL_36;
  }
  if (_IsPaused(v29))
  {
    BOOL v31 = 0;
    goto LABEL_37;
  }
  if ([v30 state]) {
    BOOL v31 = [v30 activity] != 2;
  }
  else {
LABEL_36:
  }
    BOOL v31 = 1;
LABEL_37:

  if (v31 != [(PXMomentShareStatusPresentation *)self isReadyForUpdates])
  {
    [(PXMomentShareStatusPresentation *)self setIsReadyForUpdates:v31];
LABEL_40:
    [(PXMomentShareStatusPresentation *)self _updateCountsAndStatus];
    goto LABEL_41;
  }
  if (v28) {
    goto LABEL_40;
  }
LABEL_41:
}

void __51__PXMomentShareStatusPresentation__updateCPLStatus__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) action];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, *(void *)(a1 + 32));
    v2 = (void (**)(void, void))v3;
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)MomentShareStatusObservationContext == a5)
  {
    [(PXMomentShareStatusPresentation *)self _updateCountsAndStatus];
  }
  else
  {
    if ((void *)PXCPLUIStatusProviderObservationContext_272471 != a5)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PXMomentShareStatusPresentation.m" lineNumber:637 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    [(PXMomentShareStatusPresentation *)self _updateCPLStatus];
  }
}

- (void)_updateCountsAndStatus
{
  id v3 = [(PXMomentShareStatusPresentation *)self momentShareStatus];
  v4 = [v3 momentShare];
  if (v4)
  {
    v101 = [v3 copyingAssetsFetchResult];
    uint64_t v105 = [v101 count];
    v100 = [v3 copiedAssetsFetchResult];
    uint64_t v107 = [v100 count];
    BOOL v5 = [v3 allAssetsFetchResult];
    uint64_t v102 = [v5 count];

    uint64_t v6 = [v4 uploadedPhotosCount];
    uint64_t v7 = [v4 uploadedVideosCount];
    uint64_t v8 = [v4 photosCount];
    uint64_t v9 = [v4 videosCount];
    id v10 = [v3 invitation];
    id v11 = [v10 owner];
    uint64_t v12 = [v11 localizedName];

    v111 = self;
    unint64_t presentationStyle = self->_presentationStyle;
    uint64_t v109 = objc_msgSend(v4, "px_momentShareType");
    v95 = PLLocalizedCountDescription();
    id v13 = [v4 expiryDate];
    if (v13)
    {
      char v14 = [v4 expiryDate];
      PXCMMStringForExpiryDate(v14, 1);
      v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v99 = @" ";
    }
    unint64_t v15 = v9 + v8;

    v96 = (void *)v12;
    if (v12)
    {
      id v16 = PXLocalizedStringFromTable(@"PXCMMFromSender", @"PhotosUICore");
      uint64_t v90 = v12;
      uint64_t v17 = PXStringWithValidatedFormat();
    }
    else
    {
      uint64_t v17 = 0;
    }
    unint64_t v18 = v7 + v6;
    BOOL v19 = [(PXMomentShareStatusPresentation *)v111 isPaused];
    uint64_t v20 = [v4 aggregateMediaType];
    float v21 = -1.0;
    uint64_t v22 = v109;
    v97 = v4;
    v98 = v3;
    v93 = (void *)v17;
    if (v109 != 1)
    {
      if (!v109)
      {
        BOOL v23 = v15 > v102 && v15 <= v18;
        if (v15 <= v18 || presentationStyle > 3)
        {
          if (presentationStyle != 2 || !v23)
          {
            if (presentationStyle == 1) {
              uint64_t v45 = 19;
            }
            else {
              uint64_t v45 = 0;
            }
            uint64_t v35 = PXLocalizedAssetCountForUsage(v15, v20, 0, v45);
            v34 = 0;
            char v25 = 0;
            v26 = 0;
            v32 = 0;
            int v28 = 0;
            BOOL v31 = 0;
            char v33 = 0;
            goto LABEL_41;
          }
          v34 = PXLocalizedAssetCountForUsage(v15 - v102, v20, 0, 4);
          uint64_t v35 = 0;
          char v25 = 0;
          v26 = 0;
          v32 = 0;
          int v28 = 0;
          BOOL v31 = 0;
          char v33 = 0;
          float v43 = (float)v102;
        }
        else
        {
          if (v19)
          {
            uint64_t v24 = PXLocalizedAssetCountForUsage(v15 - v18, v20, 0, 3);
            char v25 = [(PXMomentShareStatusPresentation *)v111 pauseStatusDescription];
            v26 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionTitle];
            uint64_t v27 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionConfirmationAlertTitle];
            int v28 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionConfirmationAlertSubtitle];
            uint64_t v29 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionConfirmationAlertButtonTitle];
            uint64_t v30 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionAction];
            BOOL v31 = (void *)v29;
            v32 = (void *)v27;
            char v33 = (void *)v30;
            v34 = (void *)v24;
            uint64_t v35 = 0;
LABEL_41:
            v38 = 0;
            uint64_t v40 = 2;
            if (!v23) {
              uint64_t v40 = 0;
            }
            if (v15 > v18) {
              uint64_t v40 = 1;
            }
            uint64_t v41 = v107;
            uint64_t v22 = 0;
            goto LABEL_67;
          }
          v34 = PXLocalizedAssetCountForUsage(v15, v20, 0, 2);
          uint64_t v35 = 0;
          char v25 = 0;
          v26 = 0;
          v32 = 0;
          int v28 = 0;
          BOOL v31 = 0;
          char v33 = 0;
          float v43 = (float)v18;
        }
        float v21 = v43 / (float)v15;
        goto LABEL_41;
      }
      v34 = 0;
      uint64_t v35 = 0;
      char v25 = 0;
      v26 = 0;
      v32 = 0;
      int v28 = 0;
      BOOL v31 = 0;
      char v33 = 0;
      uint64_t v40 = 0;
      v38 = 0;
      uint64_t v41 = v107;
LABEL_67:
      v104 = v38;
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __57__PXMomentShareStatusPresentation__updateCountsAndStatus__block_invoke;
      v112[3] = &unk_1E5DCEF90;
      id v113 = v95;
      id v114 = v38;
      v115 = v99;
      id v116 = v34;
      id v117 = v35;
      id v118 = v25;
      id v119 = v26;
      id v120 = v32;
      id v121 = v28;
      id v122 = v31;
      id v123 = v93;
      id v124 = v33;
      float v130 = v21;
      uint64_t v125 = v22;
      uint64_t v126 = v40;
      unint64_t v127 = v15;
      uint64_t v128 = v41;
      uint64_t v129 = v105;
      v63 = v34;
      v64 = v32;
      v65 = v31;
      v66 = v33;
      id v106 = v93;
      id v94 = v66;
      id v67 = v65;
      id v110 = v28;
      id v68 = v64;
      id v108 = v26;
      id v69 = v25;
      id v70 = v35;
      id v71 = v63;
      v72 = v99;
      id v73 = v104;
      id v74 = v95;
      [(PXMomentShareStatusPresentation *)v111 performChanges:v112];

      v4 = v97;
      id v3 = v98;
      goto LABEL_68;
    }
    BOOL v36 = [v4 status] == 3 && v15 > v102;
    int v37 = v36;
    if (v15 == v107)
    {
      uint64_t v131 = v8;
      uint64_t v132 = v9;
      uint64_t v133 = 0;
      v38 = PXLocalizedStringForDetailedCounts(&v131, @"PXCMMFooterPhotosSavedAllTitle", @"PXCMMFooterVideosSavedAllTitle", @"PXCMMFooterItemsSavedAllTitle");
      uint64_t v39 = v105;
      uint64_t v22 = 1;
      if ((v37 & 1) == 0) {
        goto LABEL_52;
      }
    }
    else
    {
      uint64_t v39 = v105;
      if (v105 <= 0)
      {
        uint64_t v91 = v20;
        if (v107 < 1)
        {
          v38 = 0;
        }
        else
        {
          uint64_t v131 = v8;
          uint64_t v132 = v9;
          uint64_t v133 = 0;
          v46 = PXLocalizedStringForDetailedCounts(&v131, @"PXCMMFooter_%ld_PhotosSavedTitleFormat", @"PXCMMFooter_%ld_VideosSavedTitleFormat", @"PXCMMFooter_%ld_ItemsSavedTitleFormat");
          uint64_t v47 = PXLocalizedStringWithValidatedFormat(v46, @"%ld");

          v38 = (void *)v47;
        }
        uint64_t v22 = 1;
        uint64_t v20 = v91;
        if ((v37 & 1) == 0)
        {
LABEL_52:
          if (v39 >= 1)
          {
LABEL_53:
            v103 = v38;
            uint64_t v41 = v107;
            unint64_t v52 = v107 + v39;
            uint64_t Result = PXCMMMediaTypeForFetchResult(v101);
            uint64_t v54 = v107 + v39;
            if (v19)
            {
              uint64_t v55 = PXLocalizedAssetCountForUsage(v54, Result, 0, 9);
              char v25 = [(PXMomentShareStatusPresentation *)v111 pauseStatusDescription];
              v26 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionTitle];
              uint64_t v56 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionConfirmationAlertTitle];
              int v28 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionConfirmationAlertSubtitle];
              uint64_t v57 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionConfirmationAlertButtonTitle];
              uint64_t v58 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionAction];
              BOOL v31 = (void *)v57;
              v32 = (void *)v56;
              char v33 = (void *)v58;
              v34 = (void *)v55;
            }
            else
            {
              v34 = PXLocalizedAssetCountForUsage(v54, Result, 0, 8);
              char v25 = 0;
              v26 = 0;
              v32 = 0;
              int v28 = 0;
              BOOL v31 = 0;
              char v33 = 0;
              float v21 = (float)v107 / (float)v52;
            }
            uint64_t v35 = 0;
            uint64_t v40 = 3;
            if (v15 == v52) {
              uint64_t v40 = 4;
            }
            uint64_t v22 = 1;
            v38 = v103;
            goto LABEL_67;
          }
          uint64_t v41 = v107;
          if (v107 >= 1)
          {
            v34 = 0;
            if (v15 == v107)
            {
              uint64_t v40 = 6;
              uint64_t v35 = 0;
              char v25 = 0;
              v26 = 0;
              v32 = 0;
              int v28 = 0;
              BOOL v31 = 0;
              char v33 = 0;
              switch(presentationStyle)
              {
                case 0uLL:
                  uint64_t v75 = PXCMMMediaTypeForFetchResult(v100);
                  uint64_t v35 = PXLocalizedAssetMessageForUsage(v75, 0, 0);

                  uint64_t v22 = 1;
                  v34 = 0;
                  char v25 = 0;
                  v26 = 0;
                  v32 = 0;
                  int v28 = 0;
                  BOOL v31 = 0;
                  char v33 = 0;
                  uint64_t v40 = 6;
                  v99 = @" ";
                  goto LABEL_67;
                case 1uLL:
                  uint64_t v85 = PXCMMMediaTypeForFetchResult(v100);
                  uint64_t v86 = PXLocalizedAssetMessageForUsage(v85, 1, 0);
                  goto LABEL_94;
                case 2uLL:
                  goto LABEL_67;
                case 3uLL:
                  uint64_t v35 = PXLocalizedAssetCountForUsage(v107, v20, 0, 0);
                  uint64_t v87 = PXCMMMediaTypeForFetchResult(v100);
                  uint64_t v88 = PXLocalizedAssetMessageForUsage(v87, 0, 0);

                  uint64_t v22 = 1;
                  v34 = 0;
                  char v25 = 0;
                  v26 = 0;
                  v32 = 0;
                  int v28 = 0;
                  BOOL v31 = 0;
                  char v33 = 0;
                  uint64_t v40 = 6;
                  v99 = (__CFString *)v88;
                  goto LABEL_67;
                case 4uLL:
                  uint64_t v86 = PXLocalizedAssetCountForUsage(v107, v20, 0, 0);
LABEL_94:
                  uint64_t v22 = 1;
                  uint64_t v35 = (void *)v86;
                  v34 = 0;
                  char v25 = 0;
                  v26 = 0;
                  v32 = 0;
                  int v28 = 0;
                  BOOL v31 = 0;
                  char v33 = 0;
                  uint64_t v40 = 6;
                  break;
                default:
                  goto LABEL_95;
              }
            }
            else
            {
              uint64_t v40 = 5;
              uint64_t v35 = 0;
              char v25 = 0;
              v26 = 0;
              v32 = 0;
              int v28 = 0;
              BOOL v31 = 0;
              char v33 = 0;
              switch(presentationStyle)
              {
                case 0uLL:
                case 3uLL:
                  uint64_t v81 = PXCMMMediaTypeForFetchResult(v100);
                  uint64_t v82 = v15 - v107;
                  uint64_t v83 = 20;
                  goto LABEL_98;
                case 1uLL:
                  uint64_t v81 = PXCMMMediaTypeForFetchResult(v100);
                  uint64_t v82 = v107;
                  uint64_t v83 = 18;
                  goto LABEL_98;
                case 2uLL:
                  goto LABEL_67;
                case 4uLL:
                  uint64_t v82 = v15;
                  uint64_t v81 = v20;
                  uint64_t v83 = 0;
LABEL_98:
                  uint64_t v89 = PXLocalizedAssetCountForUsage(v82, v81, 0, v83);
                  uint64_t v22 = 1;
                  uint64_t v35 = (void *)v89;
                  v34 = 0;
                  char v25 = 0;
                  v26 = 0;
                  v32 = 0;
                  int v28 = 0;
                  BOOL v31 = 0;
                  char v33 = 0;
                  uint64_t v40 = 5;
                  break;
                default:
LABEL_95:
                  uint64_t v35 = 0;
                  char v25 = 0;
                  v26 = 0;
                  v32 = 0;
                  int v28 = 0;
                  BOOL v31 = 0;
                  char v33 = 0;
                  break;
              }
            }
            goto LABEL_67;
          }
          if (presentationStyle - 3 >= 2 && presentationStyle)
          {
            if (presentationStyle == 2)
            {
              PXLocalizedAssetCountForUsage(v15, v20, 0, 4);
              v77 = uint64_t v76 = v20;
              char v25 = PXLocalizedStringFromTable(@"PXCMMWaitingForUploadSubtitle", @"PhotosUICore");
              uint64_t v78 = PXLocalizedAssetCountForUsage(v15, v76, 0, 0);
              uint64_t v22 = 1;
              uint64_t v35 = (void *)v78;
              v34 = (void *)v77;
LABEL_90:
              v26 = 0;
              v32 = 0;
              int v28 = 0;
              BOOL v31 = 0;
              char v33 = 0;
              uint64_t v40 = 0;
              goto LABEL_67;
            }
            v34 = 0;
            uint64_t v35 = 0;
          }
          else
          {
            uint64_t v84 = PXLocalizedAssetCountForUsage(v15, v20, 0, 0);
            uint64_t v22 = 1;
            uint64_t v35 = (void *)v84;
            v34 = 0;
          }
          char v25 = 0;
          goto LABEL_90;
        }
      }
      else
      {
        uint64_t v44 = PXCMMMediaTypeForFetchResult(v101);
        v38 = PXLocalizedAssetCountForUsage(v105, v44, 0, 8);
        if (!v37) {
          goto LABEL_53;
        }
      }
    }
    if (v19)
    {
      uint64_t v48 = PXLocalizedAssetCountForUsage(v15 - v102, v20, 0, 6);
      char v25 = [(PXMomentShareStatusPresentation *)v111 pauseStatusDescription];
      v26 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionTitle];
      uint64_t v49 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionConfirmationAlertTitle];
      int v28 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionConfirmationAlertSubtitle];
      uint64_t v50 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionActionConfirmationAlertButtonTitle];
      uint64_t v51 = [(PXMomentShareStatusPresentation *)v111 pauseResolutionAction];
      BOOL v31 = (void *)v50;
      v32 = (void *)v49;
      uint64_t v41 = v107;
      uint64_t v22 = 1;
      char v33 = (void *)v51;
      v34 = (void *)v48;
      uint64_t v35 = 0;
      uint64_t v40 = 2;
      goto LABEL_67;
    }
    if (presentationStyle > 4)
    {
      uint64_t v59 = 0;
    }
    else if (presentationStyle == 2)
    {
      uint64_t v59 = 4;
      if ([(PXMomentShareStatusPresentation *)v111 isReadyForUpdates])
      {
        BOOL v36 = v15 > v18;
        uint64_t v41 = v107;
        if (v36)
        {
          +[PXCompleteMyMomentSettings sharedInstance];
          v80 = v79 = v38;
          if ([v80 disableDescriptiveWaiting]) {
            uint64_t v59 = 4;
          }
          else {
            uint64_t v59 = 7;
          }

          v38 = v79;
        }
        goto LABEL_59;
      }
    }
    else
    {
      uint64_t v59 = 4;
    }
    uint64_t v41 = v107;
LABEL_59:
    uint64_t v60 = PXLocalizedAssetCountForUsage(v15 - v102, v20, 0, v59);
    v61 = +[PXCompleteMyMomentSettings sharedInstance];
    char v62 = [v61 disableDescriptiveWaiting];

    char v25 = 0;
    if ((v62 & 1) == 0 && !v102)
    {
      char v25 = PXLocalizedStringFromTable(@"PXCMMWaitingForUploadSubtitle", @"PhotosUICore");
    }
    uint64_t v35 = 0;
    v26 = 0;
    v32 = 0;
    int v28 = 0;
    BOOL v31 = 0;
    char v33 = 0;
    float v21 = (float)v102 / (float)v15;
    uint64_t v40 = 2;
    uint64_t v22 = 1;
    v34 = (void *)v60;
    goto LABEL_67;
  }
LABEL_68:
}

void __57__PXMomentShareStatusPresentation__updateCountsAndStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 128);
  id v5 = a2;
  [v5 setType:v3];
  [v5 setAssetsTitle:*(void *)(a1 + 32)];
  [v5 setAssetsSaveStatusTitle:*(void *)(a1 + 40)];
  [v5 setExpirationTitle:*(void *)(a1 + 48)];
  [v5 setActivityTitle:*(void *)(a1 + 56)];
  [v5 setIdleTitle:*(void *)(a1 + 64)];
  [v5 setPauseTitle:*(void *)(a1 + 72)];
  [v5 setActionTitle:*(void *)(a1 + 80)];
  [v5 setActionConfirmationAlertTitle:*(void *)(a1 + 88)];
  [v5 setActionConfirmationAlertSubtitle:*(void *)(a1 + 96)];
  [v5 setActionConfirmationAlertButtonTitle:*(void *)(a1 + 104)];
  [v5 setAction:*(void *)(a1 + 120)];
  [v5 setByline:*(void *)(a1 + 112)];
  LODWORD(v4) = *(_DWORD *)(a1 + 168);
  [v5 setActivityProgress:v4];
  [v5 setState:*(void *)(a1 + 136)];
  [v5 setNumberOfAssetsNotCopied:*(void *)(a1 + 144) - (*(void *)(a1 + 152) + *(void *)(a1 + 160))];
  [v5 setNumberOfAssetsCopied:*(void *)(a1 + 152)];
}

- (void)setNumberOfAssetsCopied:(int64_t)a3
{
  if (self->_numberOfAssetsCopied != a3)
  {
    self->_numberOfAssetsCopied = a3;
    [(PXMomentShareStatusPresentation *)self signalChange:0x10000];
  }
}

- (void)setNumberOfAssetsNotCopied:(int64_t)a3
{
  if (self->_numberOfAssetsNotCopied != a3)
  {
    self->_numberOfAssetsNotCopied = a3;
    [(PXMomentShareStatusPresentation *)self signalChange:0x4000];
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(PXMomentShareStatusPresentation *)self signalChange:0x2000];
  }
}

- (void)setActivityProgress:(float)a3
{
  if (self->_activityProgress != a3)
  {
    self->_activityProgress = a3;
    [(PXMomentShareStatusPresentation *)self signalChange:4096];
  }
}

- (void)setByline:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_byline;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      byline = self->_byline;
      self->_byline = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:2048];
    }
  }
}

- (void)setAction:(id)a3
{
  if (self->_action != a3)
  {
    double v4 = (void *)[a3 copy];
    id action = self->_action;
    self->_id action = v4;

    [(PXMomentShareStatusPresentation *)self signalChange:1024];
  }
}

- (void)setActionConfirmationAlertButtonTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_actionConfirmationAlertButtonTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      actionConfirmationAlertButtonTitle = self->_actionConfirmationAlertButtonTitle;
      self->_actionConfirmationAlertButtonTitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:512];
    }
  }
}

- (void)setActionConfirmationAlertSubtitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_actionConfirmationAlertSubtitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      actionConfirmationAlertSubtitle = self->_actionConfirmationAlertSubtitle;
      self->_actionConfirmationAlertSubtitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:256];
    }
  }
}

- (void)setActionConfirmationAlertTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_actionConfirmationAlertTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      actionConfirmationAlertTitle = self->_actionConfirmationAlertTitle;
      self->_actionConfirmationAlertTitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:128];
    }
  }
}

- (void)setActionTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_actionTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      actionTitle = self->_actionTitle;
      self->_actionTitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:64];
    }
  }
}

- (void)setPauseTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_pauseTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      pauseTitle = self->_pauseTitle;
      self->_pauseTitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:32];
    }
  }
}

- (void)setIdleTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_idleTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      idleTitle = self->_idleTitle;
      self->_idleTitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:16];
    }
  }
}

- (void)setActivityTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_activityTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      activityTitle = self->_activityTitle;
      self->_activityTitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:8];
    }
  }
}

- (void)setExpirationTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_expirationTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      expirationTitle = self->_expirationTitle;
      self->_expirationTitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:4];
    }
  }
}

- (void)setAssetsSaveStatusTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_assetsSaveStatusTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      assetsSaveStatusTitle = self->_assetsSaveStatusTitle;
      self->_assetsSaveStatusTitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:0x8000];
    }
  }
}

- (void)setAssetsTitle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  double v4 = self->_assetsTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      assetsTitle = self->_assetsTitle;
      self->_assetsTitle = v6;

      [(PXMomentShareStatusPresentation *)self signalChange:2];
    }
  }
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    [(PXMomentShareStatusPresentation *)self signalChange:1];
  }
}

- (void)didPerformChanges
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)PXMomentShareStatusPresentation;
  [(PXMomentShareStatusPresentation *)&v4 didPerformChanges];
  if ([(PXMomentShareStatusPresentation *)self currentChanges])
  {
    uint64_t v3 = PLSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = self;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[PXMomentShareStatusPresentation] Did transition to %@", buf, 0xCu);
    }
  }
}

- (PXCMMInvitation)invitation
{
  v2 = [(PXMomentShareStatusPresentation *)self momentShareStatus];
  uint64_t v3 = [v2 invitation];

  return (PXCMMInvitation *)v3;
}

- (PXDisplayMomentShare)momentShare
{
  v2 = [(PXMomentShareStatusPresentation *)self momentShareStatus];
  uint64_t v3 = [v2 momentShare];

  return (PXDisplayMomentShare *)v3;
}

- (NSString)description
{
  uint64_t v27 = NSString;
  uint64_t v26 = objc_opt_class();
  unint64_t presentationStyle = self->_presentationStyle;
  if (presentationStyle > 4) {
    char v25 = 0;
  }
  else {
    char v25 = off_1E5DCEFB0[presentationStyle];
  }
  int64_t type = self->_type;
  BOOL v5 = @"receiver";
  if (type != 1) {
    BOOL v5 = 0;
  }
  if (type) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = @"sender";
  }
  uint64_t v24 = v6;
  uint64_t v7 = 0;
  unint64_t state = self->_state;
  if (state <= 6) {
    uint64_t v7 = off_1E5DCEFD8[state];
  }
  BOOL v23 = v7;
  activityTitle = (__CFString *)self->_activityTitle;
  if (!activityTitle) {
    activityTitle = @"-";
  }
  uint64_t v22 = activityTitle;
  double activityProgress = self->_activityProgress;
  if (self->_pauseTitle) {
    pauseTitle = (__CFString *)self->_pauseTitle;
  }
  else {
    pauseTitle = @"-";
  }
  if (self->_actionTitle) {
    actionTitle = (__CFString *)self->_actionTitle;
  }
  else {
    actionTitle = @"-";
  }
  if (self->_actionConfirmationAlertTitle) {
    actionConfirmationAlertTitle = (__CFString *)self->_actionConfirmationAlertTitle;
  }
  else {
    actionConfirmationAlertTitle = @"-";
  }
  if (self->_actionConfirmationAlertSubtitle) {
    actionConfirmationAlertSubtitle = (__CFString *)self->_actionConfirmationAlertSubtitle;
  }
  else {
    actionConfirmationAlertSubtitle = @"-";
  }
  if (self->_actionConfirmationAlertButtonTitle) {
    actionConfirmationAlertButtonTitle = (__CFString *)self->_actionConfirmationAlertButtonTitle;
  }
  else {
    actionConfirmationAlertButtonTitle = @"-";
  }
  if (self->_assetsTitle) {
    assetsTitle = (__CFString *)self->_assetsTitle;
  }
  else {
    assetsTitle = @"-";
  }
  if (self->_expirationTitle) {
    expirationTitle = (__CFString *)self->_expirationTitle;
  }
  else {
    expirationTitle = @"-";
  }
  if (self->_idleTitle) {
    idleTitle = (__CFString *)self->_idleTitle;
  }
  else {
    idleTitle = @"-";
  }
  BOOL v19 = [(PXMomentShareStatus *)self->_momentShareStatus momentShare];
  uint64_t v20 = [v27 stringWithFormat:@"<%@:%p, style:\"%@\", type:\"%@\", state:\"%@\", activity:\"%@\", progress:%f, pause:\"%@\", action:\"%@\", alert:\"%@/%@/%@\", assets:\"%@\", expiration:\"%@\", idle:\"%@\", share:\"%@\">", v26, self, v25, v24, v23, v22, *(void *)&activityProgress, pauseTitle, actionTitle, actionConfirmationAlertTitle, actionConfirmationAlertSubtitle, actionConfirmationAlertButtonTitle, assetsTitle, expirationTitle, idleTitle, v19];

  return (NSString *)v20;
}

- (PXMomentShareStatusPresentation)initWithMomentShare:(id)a3 presentationStyle:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXMomentShareStatusPresentation.m", 150, @"Invalid parameter not satisfying: %@", @"momentShare" object file lineNumber description];
  }
  uint64_t v8 = [[PXPhotoKitMomentShareStatus alloc] initWithPhotoKitMomentShare:v7];
  uint64_t v9 = [(PXMomentShareStatusPresentation *)self initWithMomentShareStatus:v8 presentationStyle:a4];

  return v9;
}

- (PXMomentShareStatusPresentation)initWithMomentShareStatus:(id)a3 presentationStyle:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXMomentShareStatusPresentation.m", 131, @"Invalid parameter not satisfying: %@", @"momentShareStatus" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXMomentShareStatusPresentation;
  uint64_t v9 = [(PXMomentShareStatusPresentation *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    v9->_unint64_t presentationStyle = a4;
    objc_storeStrong((id *)&v9->_momentShareStatus, a3);
    [(PXMomentShareStatus *)v10->_momentShareStatus registerChangeObserver:v10 context:MomentShareStatusObservationContext];
    if ((v10->_presentationStyle & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      uint64_t v11 = [v8 statusProvider];
      statusProvider = v10->_statusProvider;
      v10->_statusProvider = (PXCPLUIStatusProvider *)v11;

      [(PXCPLUIStatusProvider *)v10->_statusProvider registerChangeObserver:v10 context:PXCPLUIStatusProviderObservationContext_272471];
      [(PXMomentShareStatusPresentation *)v10 _updateCPLStatus];
    }
    [(PXMomentShareStatusPresentation *)v10 _updateCountsAndStatus];
  }

  return v10;
}

- (PXMomentShareStatusPresentation)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMomentShareStatusPresentation.m", 123, @"%s is not available as initializer", "-[PXMomentShareStatusPresentation init]");

  abort();
}

+ (PXMomentShareStatusPresentation)new
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXMomentShareStatusPresentation.m", 127, @"%s is not available as initializer", "+[PXMomentShareStatusPresentation new]");

  abort();
}

@end