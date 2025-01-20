@interface SBLogoutProgressView
- (BOOL)isProgressVisible;
- (CNContact)userContact;
- (NSArray)pendingApplications;
- (SBLogoutProgressView)initWithFrame:(CGRect)a3;
- (_UILegibilitySettings)legibilitySettings;
- (double)_goodbyeLabelBaselineOffset;
- (double)_moreDocumentsLabelBaselineOffset;
- (double)_userAvatarVerticalOffsetFromCenter;
- (void)_updateBlame;
- (void)_updateGoodbye;
- (void)_updateLegibility;
- (void)_updateUserAvatar;
- (void)_updateViewData;
- (void)setLegibilitySettings:(id)a3;
- (void)setPendingApplications:(id)a3;
- (void)setProgressVisible:(BOOL)a3;
- (void)setUserContact:(id)a3;
- (void)updateConstraints;
@end

@implementation SBLogoutProgressView

- (SBLogoutProgressView)initWithFrame:(CGRect)a3
{
  v112[25] = *MEMORY[0x1E4F143B8];
  v111.receiver = self;
  v111.super_class = (Class)SBLogoutProgressView;
  v3 = -[SBLogoutProgressView initWithFrame:](&v111, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    goodbyeLabel = v3->_goodbyeLabel;
    v3->_goodbyeLabel = (UILabel *)v9;

    v11 = v3->_goodbyeLabel;
    v12 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:48.0];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)v3->_goodbyeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_goodbyeLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3->_goodbyeLabel setMinimumScaleFactor:0.8];
    [(UILabel *)v3->_goodbyeLabel setTextAlignment:1];
    [(SBLogoutProgressView *)v3 addSubview:v3->_goodbyeLabel];
    v13 = [(UILabel *)v3->_goodbyeLabel firstBaselineAnchor];
    v14 = [(SBLogoutProgressView *)v3 topAnchor];
    [(SBLogoutProgressView *)v3 _goodbyeLabelBaselineOffset];
    uint64_t v15 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14);
    goodbyeLabelConstraint = v3->_goodbyeLabelConstraint;
    v3->_goodbyeLabelConstraint = (NSLayoutConstraint *)v15;

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v5, v6, v7, v8);
    userAvatarView = v3->_userAvatarView;
    v3->_userAvatarView = (UIImageView *)v17;

    [(UIImageView *)v3->_userAvatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBLogoutProgressView *)v3 addSubview:v3->_userAvatarView];
    v19 = [(UIImageView *)v3->_userAvatarView centerYAnchor];
    v20 = [(SBLogoutProgressView *)v3 centerYAnchor];
    [(SBLogoutProgressView *)v3 _userAvatarVerticalOffsetFromCenter];
    uint64_t v21 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20);
    userAvatarVerticalConstraint = v3->_userAvatarVerticalConstraint;
    v3->_userAvatarVerticalConstraint = (NSLayoutConstraint *)v21;

    uint64_t v23 = [MEMORY[0x1E4F42A30] systemFontOfSize:20.0 weight:*MEMORY[0x1E4F43928]];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v6, v7, v8);
    savingDocumentsActivityAndLabelContainerView = v3->_savingDocumentsActivityAndLabelContainerView;
    v3->_savingDocumentsActivityAndLabelContainerView = (UIView *)v24;

    [(UIView *)v3->_savingDocumentsActivityAndLabelContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBLogoutProgressView *)v3 addSubview:v3->_savingDocumentsActivityAndLabelContainerView];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    savingDocumentsLabel = v3->_savingDocumentsLabel;
    v3->_savingDocumentsLabel = (UILabel *)v26;

    [(UILabel *)v3->_savingDocumentsLabel setFont:v23];
    [(UILabel *)v3->_savingDocumentsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_savingDocumentsActivityAndLabelContainerView addSubview:v3->_savingDocumentsLabel];
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:1];
    savingDocumentsActivityIndicator = v3->_savingDocumentsActivityIndicator;
    v3->_savingDocumentsActivityIndicator = (UIActivityIndicatorView *)v28;

    [(UIActivityIndicatorView *)v3->_savingDocumentsActivityIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v3->_savingDocumentsActivityIndicator startAnimating];
    [(UIView *)v3->_savingDocumentsActivityAndLabelContainerView addSubview:v3->_savingDocumentsActivityIndicator];
    uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    savingDocumentsMoreLabel = v3->_savingDocumentsMoreLabel;
    v3->_savingDocumentsMoreLabel = (UILabel *)v30;

    v110 = (void *)v23;
    [(UILabel *)v3->_savingDocumentsMoreLabel setFont:v23];
    [(UILabel *)v3->_savingDocumentsMoreLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBLogoutProgressView *)v3 addSubview:v3->_savingDocumentsMoreLabel];
    v32 = [(UILabel *)v3->_savingDocumentsMoreLabel firstBaselineAnchor];
    v33 = [(SBLogoutProgressView *)v3 bottomAnchor];
    [(SBLogoutProgressView *)v3 _moreDocumentsLabelBaselineOffset];
    uint64_t v34 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33);
    savingDocumentsMoreLabelConstraint = v3->_savingDocumentsMoreLabelConstraint;
    v3->_savingDocumentsMoreLabelConstraint = (NSLayoutConstraint *)v34;

    uint64_t v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v6, v7, v8);
    blameContainerView = v3->_blameContainerView;
    v3->_blameContainerView = (UIView *)v36;

    [(UIView *)v3->_blameContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBLogoutProgressView *)v3 addSubview:v3->_blameContainerView];
    uint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v5, v6, v7, v8);
    blameAppIconView = v3->_blameAppIconView;
    v3->_blameAppIconView = (UIImageView *)v38;

    [(UIImageView *)v3->_blameAppIconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_blameContainerView addSubview:v3->_blameAppIconView];
    uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    blameAppNameLabel = v3->_blameAppNameLabel;
    v3->_blameAppNameLabel = (UILabel *)v40;

    [(UILabel *)v3->_blameAppNameLabel setFont:v23];
    [(UILabel *)v3->_blameAppNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_blameContainerView addSubview:v3->_blameAppNameLabel];
    v84 = (void *)MEMORY[0x1E4F28DC8];
    v109 = [(UILabel *)v3->_goodbyeLabel centerXAnchor];
    v108 = [(SBLogoutProgressView *)v3 centerXAnchor];
    v107 = [v109 constraintEqualToAnchor:v108];
    v112[0] = v107;
    v106 = [(UILabel *)v3->_goodbyeLabel widthAnchor];
    v105 = [(SBLogoutProgressView *)v3 widthAnchor];
    v104 = [v106 constraintLessThanOrEqualToAnchor:v105 constant:-72.0];
    v112[1] = v104;
    v112[2] = v3->_goodbyeLabelConstraint;
    v103 = [(UIImageView *)v3->_userAvatarView centerXAnchor];
    v102 = [(SBLogoutProgressView *)v3 centerXAnchor];
    v101 = [v103 constraintEqualToAnchor:v102];
    v112[3] = v101;
    v112[4] = v3->_userAvatarVerticalConstraint;
    v100 = [(UIImageView *)v3->_userAvatarView widthAnchor];
    v99 = [v100 constraintEqualToConstant:256.0];
    v112[5] = v99;
    v98 = [(UIImageView *)v3->_userAvatarView heightAnchor];
    v97 = [(UIImageView *)v3->_userAvatarView widthAnchor];
    v96 = [v98 constraintEqualToAnchor:v97];
    v112[6] = v96;
    v95 = [(UILabel *)v3->_savingDocumentsLabel centerYAnchor];
    v94 = [(UIActivityIndicatorView *)v3->_savingDocumentsActivityIndicator centerYAnchor];
    v93 = [v95 constraintEqualToAnchor:v94];
    v112[7] = v93;
    v92 = [(UIActivityIndicatorView *)v3->_savingDocumentsActivityIndicator leadingAnchor];
    v91 = [(UIView *)v3->_savingDocumentsActivityAndLabelContainerView leadingAnchor];
    v90 = [v92 constraintEqualToAnchor:v91];
    v112[8] = v90;
    v89 = [(UILabel *)v3->_savingDocumentsLabel leadingAnchor];
    v88 = [(UIActivityIndicatorView *)v3->_savingDocumentsActivityIndicator trailingAnchor];
    v87 = [v89 constraintEqualToAnchor:v88 constant:8.0];
    v112[9] = v87;
    v86 = [(UILabel *)v3->_savingDocumentsLabel trailingAnchor];
    v85 = [(UIView *)v3->_savingDocumentsActivityAndLabelContainerView trailingAnchor];
    v83 = [v86 constraintEqualToAnchor:v85];
    v112[10] = v83;
    v82 = [(UILabel *)v3->_savingDocumentsLabel topAnchor];
    v81 = [(UIView *)v3->_savingDocumentsActivityAndLabelContainerView topAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    v112[11] = v80;
    v79 = [(UILabel *)v3->_savingDocumentsLabel bottomAnchor];
    v78 = [(UIView *)v3->_savingDocumentsActivityAndLabelContainerView bottomAnchor];
    v77 = [v79 constraintEqualToAnchor:v78];
    v112[12] = v77;
    v76 = [(UILabel *)v3->_blameAppNameLabel centerYAnchor];
    v75 = [(UIImageView *)v3->_blameAppIconView centerYAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v112[13] = v74;
    v73 = [(UIImageView *)v3->_blameAppIconView leadingAnchor];
    v72 = [(UIView *)v3->_blameContainerView leadingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v112[14] = v71;
    v70 = [(UILabel *)v3->_blameAppNameLabel leadingAnchor];
    v69 = [(UIImageView *)v3->_blameAppIconView trailingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69 constant:8.0];
    v112[15] = v68;
    v67 = [(UILabel *)v3->_blameAppNameLabel trailingAnchor];
    v66 = [(UIView *)v3->_blameContainerView trailingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v112[16] = v65;
    v64 = [(UIImageView *)v3->_blameAppIconView topAnchor];
    v63 = [(UIView *)v3->_blameContainerView topAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v112[17] = v62;
    v61 = [(UIImageView *)v3->_blameAppIconView bottomAnchor];
    v60 = [(UIView *)v3->_blameContainerView bottomAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v112[18] = v59;
    v58 = [(UIView *)v3->_savingDocumentsActivityAndLabelContainerView centerXAnchor];
    v57 = [(SBLogoutProgressView *)v3 centerXAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v112[19] = v56;
    v55 = [(UIView *)v3->_blameContainerView centerXAnchor];
    v54 = [(SBLogoutProgressView *)v3 centerXAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v112[20] = v53;
    v52 = [(UILabel *)v3->_savingDocumentsMoreLabel centerXAnchor];
    v42 = [(SBLogoutProgressView *)v3 centerXAnchor];
    v43 = [v52 constraintEqualToAnchor:v42];
    v112[21] = v43;
    v112[22] = v3->_savingDocumentsMoreLabelConstraint;
    v44 = [(UILabel *)v3->_blameAppNameLabel firstBaselineAnchor];
    v45 = [(UILabel *)v3->_savingDocumentsMoreLabel firstBaselineAnchor];
    v46 = [v44 constraintEqualToAnchor:v45 constant:-36.0];
    v112[23] = v46;
    v47 = [(UILabel *)v3->_savingDocumentsLabel firstBaselineAnchor];
    v48 = [(UILabel *)v3->_blameAppNameLabel firstBaselineAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:-36.0];
    v112[24] = v49;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:25];
    [v84 activateConstraints:v50];
  }
  return v3;
}

- (BOOL)isProgressVisible
{
  return [(UIView *)self->_savingDocumentsActivityAndLabelContainerView isHidden];
}

- (void)setProgressVisible:(BOOL)a3
{
}

- (void)setUserContact:(id)a3
{
  double v5 = (CNContact *)a3;
  if (self->_userContact != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_userContact, a3);
    [(SBLogoutProgressView *)self _updateViewData];
    double v5 = v6;
  }
}

- (void)setPendingApplications:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  pendingApplications = self->_pendingApplications;
  self->_pendingApplications = v4;

  [(SBLogoutProgressView *)self _updateViewData];
}

- (void)setLegibilitySettings:(id)a3
{
  double v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBLogoutProgressView *)self _updateLegibility];
    double v5 = v6;
  }
}

- (void)updateConstraints
{
  goodbyeLabelConstraint = self->_goodbyeLabelConstraint;
  [(SBLogoutProgressView *)self _goodbyeLabelBaselineOffset];
  -[NSLayoutConstraint setConstant:](goodbyeLabelConstraint, "setConstant:");
  savingDocumentsMoreLabelConstraint = self->_savingDocumentsMoreLabelConstraint;
  [(SBLogoutProgressView *)self _moreDocumentsLabelBaselineOffset];
  -[NSLayoutConstraint setConstant:](savingDocumentsMoreLabelConstraint, "setConstant:");
  userAvatarVerticalConstraint = self->_userAvatarVerticalConstraint;
  [(SBLogoutProgressView *)self _userAvatarVerticalOffsetFromCenter];
  -[NSLayoutConstraint setConstant:](userAvatarVerticalConstraint, "setConstant:");
  v6.receiver = self;
  v6.super_class = (Class)SBLogoutProgressView;
  [(SBLogoutProgressView *)&v6 updateConstraints];
}

- (double)_goodbyeLabelBaselineOffset
{
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_15;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {

      goto LABEL_15;
    }
  }
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v9 = v8;
  double v10 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v7 & 1) == 0) {

  }
  if ((v5 & 1) == 0) {
  if (v9 >= v10)
  }
  {
    BOOL v11 = (unint64_t)([(id)SBApp activeInterfaceOrientation] - 3) >= 2;
    double result = 315.0;
    double v13 = 184.0;
    goto LABEL_16;
  }
LABEL_15:
  BOOL v11 = (unint64_t)([(id)SBApp activeInterfaceOrientation] - 3) >= 2;
  double result = 184.0;
  double v13 = 138.0;
LABEL_16:
  if (!v11) {
    return v13;
  }
  return result;
}

- (double)_moreDocumentsLabelBaselineOffset
{
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_15;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {

      goto LABEL_15;
    }
  }
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v9 = v8;
  double v10 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v7 & 1) == 0) {

  }
  if ((v5 & 1) == 0) {
  if (v9 >= v10)
  }
    return dbl_1D8FD19F0[(unint64_t)([(id)SBApp activeInterfaceOrientation] - 3) < 2];
LABEL_15:
  uint64_t v12 = [(id)SBApp activeInterfaceOrientation];
  double result = -128.0;
  if ((unint64_t)(v12 - 3) < 2) {
    return -78.5;
  }
  return result;
}

- (double)_userAvatarVerticalOffsetFromCenter
{
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_14:
      uint64_t v12 = [(id)SBApp activeInterfaceOrientation];
      double result = -20.0;
      if ((unint64_t)(v12 - 3) < 2) {
        return 0.0;
      }
      return result;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {

      goto LABEL_14;
    }
  }
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v9 = v8;
  double v10 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v7 & 1) == 0) {

  }
  if ((v5 & 1) == 0) {
  double result = -20.0;
  }
  if (v9 < v10) {
    goto LABEL_14;
  }
  return result;
}

- (void)_updateLegibility
{
  [(SBLogoutProgressView *)self _updateUserAvatarLegibility];
  goodbyeLabel = self->_goodbyeLabel;
  int v4 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)goodbyeLabel setTextColor:v4];

  savingDocumentsLabel = self->_savingDocumentsLabel;
  int v6 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)savingDocumentsLabel setTextColor:v6];

  savingDocumentsMoreLabel = self->_savingDocumentsMoreLabel;
  double v8 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)savingDocumentsMoreLabel setTextColor:v8];

  blameAppNameLabel = self->_blameAppNameLabel;
  id v10 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UILabel *)blameAppNameLabel setTextColor:v10];
}

- (void)_updateViewData
{
  [(SBLogoutProgressView *)self _updateGoodbye];
  [(SBLogoutProgressView *)self _updateUserAvatar];
  [(SBLogoutProgressView *)self _updateBlame];
}

- (void)_updateGoodbye
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  int v4 = [v3 localizedStringForKey:@"LOGOUT_GOODBYE_USER_NAME_FORMAT" value:&stru_1F3084718 table:@"SpringBoard"];

  uint64_t v5 = [v4 rangeOfString:@"<[a-z]+>" options:1024];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    double v8 = objc_msgSend(v4, "substringWithRange:", v5, v6);
    char v7 = v8;
    if (!v8) {
      goto LABEL_13;
    }
    if ([v8 isEqualToString:@"<firstname>"])
    {
      if (![(CNContact *)self->_userContact isKeyAvailable:@"givenName"]) {
        goto LABEL_3;
      }
      uint64_t v11 = [(CNContact *)self->_userContact givenName];
    }
    else
    {
      if (![v7 isEqualToString:@"<surname>"])
      {
        if (![v7 isEqualToString:@"<fullname>"]
          || ![(CNContact *)self->_userContact isKeyAvailable:@"givenName"]
          || ![(CNContact *)self->_userContact isKeyAvailable:@"familyName"])
        {
          goto LABEL_3;
        }
        id v12 = objc_alloc_init(MEMORY[0x1E4F1B910]);
        v19 = [v12 stringFromContact:self->_userContact];
        objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v9, v10, v19);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
        double v8 = v20;
        goto LABEL_13;
      }
      if (![(CNContact *)self->_userContact isKeyAvailable:@"familyName"]) {
        goto LABEL_3;
      }
      uint64_t v11 = [(CNContact *)self->_userContact familyName];
    }
    id v12 = (id)v11;
    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v9, v10, v11);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  char v7 = 0;
LABEL_3:
  double v8 = 0;
LABEL_13:
  id v21 = v8;
  if ([v8 length]
    && (double v13 = objc_opt_new(),
        char v14 = [v13 isCurrentUserAnonymous],
        v13,
        (v14 & 1) == 0))
  {
    uint64_t v17 = NSString;
    uint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
    v18 = [v15 localizedStringForKey:@"LOGOUT_GOODBYE_USER" value:&stru_1F3084718 table:@"SpringBoard"];
    v16 = objc_msgSend(v17, "stringWithFormat:", v18, v21);
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
    v16 = [v15 localizedStringForKey:@"LOGOUT_GOODBYE_USER_NO_NAME" value:&stru_1F3084718 table:@"SpringBoard"];
  }

  [(UILabel *)self->_goodbyeLabel setText:v16];
}

- (void)_updateUserAvatar
{
  if ((unint64_t)[(_UILegibilitySettings *)self->_legibilitySettings style] >= 2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1BBE8]) initWithStyle:v3 diameter:256.0];
  int v4 = [v5 monogramForContact:self->_userContact];
  [(UIImageView *)self->_userAvatarView setImage:v4];
}

- (void)_updateBlame
{
  uint64_t v3 = objc_opt_new();
  char v4 = [v3 isCurrentUserAnonymous];

  if ((v4 & 1) == 0)
  {
    NSUInteger v5 = [(NSArray *)self->_pendingApplications count];
    savingDocumentsLabel = self->_savingDocumentsLabel;
    char v7 = [MEMORY[0x1E4F28B50] mainBundle];
    double v8 = v7;
    if (v5)
    {
      uint64_t v9 = [v7 localizedStringForKey:@"LOGOUT_SAVING_DOCUMENTS_FROM" value:&stru_1F3084718 table:@"SpringBoard"];
      [(UILabel *)savingDocumentsLabel setText:v9];

      id v27 = [(NSArray *)self->_pendingApplications firstObject];
      blameAppNameLabel = self->_blameAppNameLabel;
      uint64_t v11 = [v27 displayName];
      [(UILabel *)blameAppNameLabel setText:v11];

      id v12 = +[SBIconController sharedInstance];
      double v13 = [v12 model];
      char v14 = [v27 bundleIdentifier];
      uint64_t v15 = [v13 applicationIconForBundleIdentifier:v14];

      v16 = [(SBLogoutProgressView *)self traitCollection];
      uint64_t v17 = [v12 tableUIIconImageCache];
      v18 = [v17 imageForIcon:v15 compatibleWithTraitCollection:v16 options:0];

      [(UIImageView *)self->_blameAppIconView setImage:v18];
      [(UIView *)self->_blameContainerView setHidden:0];
      NSUInteger v19 = [(NSArray *)self->_pendingApplications count];
      NSUInteger v20 = v19 - 1;
      if (v19 == 1)
      {
        [(UILabel *)self->_savingDocumentsMoreLabel setHidden:1];
      }
      else
      {
        id v21 = NSString;
        v22 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v23 = [v22 localizedStringForKey:@"LOGOUT_SAVING_DOCUMENTS_MORE_COUNT" value:&stru_1F3084718 table:@"SpringBoardPlurals"];
        uint64_t v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v20);

        [(UILabel *)self->_savingDocumentsMoreLabel setText:v24];
        [(UILabel *)self->_savingDocumentsMoreLabel setHidden:0];
      }
    }
    else
    {
      v25 = [v7 localizedStringForKey:@"LOGOUT_SAVING_DOCUMENTS" value:&stru_1F3084718 table:@"SpringBoard"];
      [(UILabel *)savingDocumentsLabel setText:v25];

      [(UILabel *)self->_savingDocumentsMoreLabel setHidden:1];
      blameContainerView = self->_blameContainerView;
      [(UIView *)blameContainerView setHidden:1];
    }
  }
}

- (CNContact)userContact
{
  return self->_userContact;
}

- (NSArray)pendingApplications
{
  return self->_pendingApplications;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_blameAppNameLabel, 0);
  objc_storeStrong((id *)&self->_blameAppIconView, 0);
  objc_storeStrong((id *)&self->_blameContainerView, 0);
  objc_storeStrong((id *)&self->_savingDocumentsMoreLabelConstraint, 0);
  objc_storeStrong((id *)&self->_savingDocumentsMoreLabel, 0);
  objc_storeStrong((id *)&self->_savingDocumentsLabel, 0);
  objc_storeStrong((id *)&self->_savingDocumentsActivityIndicator, 0);
  objc_storeStrong((id *)&self->_savingDocumentsActivityAndLabelContainerView, 0);
  objc_storeStrong((id *)&self->_goodbyeLabelConstraint, 0);
  objc_storeStrong((id *)&self->_goodbyeLabel, 0);
  objc_storeStrong((id *)&self->_userAvatarVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_userAvatarView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_pendingApplications, 0);
  objc_storeStrong((id *)&self->_userContact, 0);
}

@end