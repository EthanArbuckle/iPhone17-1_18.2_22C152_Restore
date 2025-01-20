@interface _UISheetPresentationControllerConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (_UISheetPresentationControllerConfiguration)_fullScreenConfiguration;
- (BOOL)_insetsPresentedViewForGrabber;
- (BOOL)_isEqual:(id)a3 onlyCheckPropertiesRequiringFencing:(BOOL)a4;
- (BOOL)_peeksWhenFloating;
- (BOOL)_prefersGrabberVisible;
- (BOOL)_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge;
- (BOOL)_prefersScrollingResizesWhenDetentDirectionIsDown;
- (BOOL)_shouldFenceChangeToConfiguration:(id)a3;
- (BOOL)_shouldScaleDownBehindDescendantSheets;
- (BOOL)_wantsBottomAttached;
- (BOOL)_wantsEdgeAttachedInCompactHeight;
- (BOOL)_wantsFullScreen;
- (BOOL)_widthFollowsPreferredContentSizeWhenEdgeAttached;
- (BOOL)isEqual:(id)a3;
- (CGRect)_hostParentFullHeightUntransformedFrameForDepthLevel;
- (CGRect)_hostParentStackAlignmentFrame;
- (NSArray)_detents;
- (NSString)_selectedDetentIdentifier;
- (NSString)description;
- (_UISheetPresentationControllerAppearance)_edgeAttachedCompactHeightAppearance;
- (_UISheetPresentationControllerAppearance)_floatingAppearance;
- (_UISheetPresentationControllerAppearance)_standardAppearance;
- (_UISheetPresentationControllerConfiguration)init;
- (_UISheetPresentationControllerConfiguration)initWithBSXPCCoder:(id)a3;
- (_UISheetPresentationControllerConfiguration)initWithCoder:(id)a3;
- (double)_additionalMinimumTopInset;
- (double)_cornerRadiusForPresentationAndDismissal;
- (double)_grabberTopSpacing;
- (double)_hostParentDepthLevel;
- (double)_preferredCornerRadius;
- (double)_preferredShadowOpacity;
- (double)_shadowRadius;
- (int64_t)_detentDirectionWhenFloating;
- (int64_t)_mode;
- (void)_prefersGrabberVisible:(BOOL)a3;
- (void)_setAdditionalMinimumTopInset:(double)a3;
- (void)_setCornerRadiusForPresentationAndDismissal:(double)a3;
- (void)_setDetentDirectionWhenFloating:(int64_t)a3;
- (void)_setDetents:(id)a3;
- (void)_setEdgeAttachedCompactHeightAppearance:(id)a3;
- (void)_setFloatingAppearance:(id)a3;
- (void)_setGrabberTopSpacing:(double)a3;
- (void)_setHostParentDepthLevel:(double)a3;
- (void)_setHostParentFullHeightUntransformedFrameForDepthLevel:(CGRect)a3;
- (void)_setHostParentStackAlignmentFrame:(CGRect)a3;
- (void)_setInsetsPresentedViewForGrabber:(BOOL)a3;
- (void)_setMode:(int64_t)a3;
- (void)_setPeeksWhenFloating:(BOOL)a3;
- (void)_setPreferredCornerRadius:(double)a3;
- (void)_setPreferredShadowOpacity:(double)a3;
- (void)_setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:(BOOL)a3;
- (void)_setPrefersScrollingResizesWhenDetentDirectionIsDown:(BOOL)a3;
- (void)_setSelectedDetentIdentifier:(id)a3;
- (void)_setShadowRadius:(double)a3;
- (void)_setShouldScaleDownBehindDescendantSheets:(BOOL)a3;
- (void)_setStandardAppearance:(id)a3;
- (void)_setWantsBottomAttached:(BOOL)a3;
- (void)_setWantsEdgeAttachedInCompactHeight:(BOOL)a3;
- (void)_setWantsFullScreen:(BOOL)a3;
- (void)_setWidthFollowsPreferredContentSizeWhenEdgeAttached:(BOOL)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UISheetPresentationControllerConfiguration

- (_UISheetPresentationControllerConfiguration)init
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_UISheetPresentationControllerConfiguration;
  v2 = [(_UISheetPresentationControllerConfiguration *)&v17 init];
  v3 = v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 257;
    *(_OWORD *)(v2 + 24) = xmmword_186B9B590;
    v4 = _UIFallbackSheetMetrics();
    *((void *)v3 + 5) = [v4 defaultMode];

    *((int64x2_t *)v3 + 3) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v5 = _UIFallbackSheetMetrics();
    [v5 preferredShadowOpacity];
    *((void *)v3 + 8) = v6;

    v7 = _UIFallbackSheetMetrics();
    [v7 shadowRadius];
    *((void *)v3 + 9) = v8;

    v9 = +[UISheetPresentationControllerDetent largeDetent];
    v18[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v11 = (void *)*((void *)v3 + 10);
    *((void *)v3 + 10) = v10;

    uint64_t v12 = +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:1];
    v13 = (void *)*((void *)v3 + 12);
    *((void *)v3 + 12) = v12;

    *((_WORD *)v3 + 8) = 257;
    long long v14 = *MEMORY[0x1E4F1DB20];
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v3 + 136) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v3 + 152) = v15;
    *(_OWORD *)(v3 + 168) = v14;
    *(_OWORD *)(v3 + 184) = v15;
  }
  return (_UISheetPresentationControllerConfiguration *)v3;
}

- (void)_setWidthFollowsPreferredContentSizeWhenEdgeAttached:(BOOL)a3
{
  self->__widthFollowsPreferredContentSizeWhenEdgeAttached = a3;
}

- (void)_setWantsFullScreen:(BOOL)a3
{
  self->__wantsFullScreen = a3;
}

- (void)_setWantsEdgeAttachedInCompactHeight:(BOOL)a3
{
  self->__wantsEdgeAttachedInCompactHeight = a3;
}

- (void)_setWantsBottomAttached:(BOOL)a3
{
  self->__wantsBottomAttached = a3;
}

- (void)_setStandardAppearance:(id)a3
{
}

- (void)_setShouldScaleDownBehindDescendantSheets:(BOOL)a3
{
  self->__shouldScaleDownBehindDescendantSheets = a3;
}

- (void)_setShadowRadius:(double)a3
{
  self->__shadowRadius = a3;
}

- (void)_setSelectedDetentIdentifier:(id)a3
{
}

- (void)_setPrefersScrollingResizesWhenDetentDirectionIsDown:(BOOL)a3
{
  self->__prefersScrollingResizesWhenDetentDirectionIsDown = a3;
}

- (void)_setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:(BOOL)a3
{
  self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge = a3;
}

- (void)_setPreferredShadowOpacity:(double)a3
{
  self->__preferredShadowOpacity = a3;
}

- (void)_setPreferredCornerRadius:(double)a3
{
  self->__preferredCornerRadius = a3;
}

- (void)_setPeeksWhenFloating:(BOOL)a3
{
  self->__peeksWhenFloating = a3;
}

- (void)_setMode:(int64_t)a3
{
  self->__mode = a3;
}

- (void)_setInsetsPresentedViewForGrabber:(BOOL)a3
{
  self->__insetsPresentedViewForGrabber = a3;
}

- (void)_setGrabberTopSpacing:(double)a3
{
  self->__grabberTopSpacing = a3;
}

- (void)_setFloatingAppearance:(id)a3
{
}

- (void)_setEdgeAttachedCompactHeightAppearance:(id)a3
{
}

- (void)_setDetents:(id)a3
{
}

- (void)_setDetentDirectionWhenFloating:(int64_t)a3
{
  self->__detentDirectionWhenFloating = a3;
}

- (void)_setCornerRadiusForPresentationAndDismissal:(double)a3
{
  self->__cornerRadiusForPresentationAndDismissal = a3;
}

- (void)_setAdditionalMinimumTopInset:(double)a3
{
  self->__additionalMinimumTopInset = a3;
}

- (void)_prefersGrabberVisible:(BOOL)a3
{
  self->__prefersGrabberVisible = a3;
}

- (void)_setHostParentStackAlignmentFrame:(CGRect)a3
{
  self->__hostParentStackAlignmentFrame = a3;
}

- (void)_setHostParentFullHeightUntransformedFrameForDepthLevel:(CGRect)a3
{
  self->__hostParentFullHeightUntransformedFrameForDepthLevel = a3;
}

- (void)_setHostParentDepthLevel:(double)a3
{
  self->__hostParentDepthLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__floatingAppearance, 0);
  objc_storeStrong((id *)&self->__edgeAttachedCompactHeightAppearance, 0);
  objc_storeStrong((id *)&self->__standardAppearance, 0);
  objc_storeStrong((id *)&self->__selectedDetentIdentifier, 0);
  objc_storeStrong((id *)&self->__detents, 0);
}

+ (_UISheetPresentationControllerConfiguration)_fullScreenConfiguration
{
  v2 = objc_alloc_init(_UISheetPresentationControllerConfiguration);
  [(_UISheetPresentationControllerConfiguration *)v2 _setWantsFullScreen:1];
  return v2;
}

- (BOOL)_isEqual:(id)a3 onlyCheckPropertiesRequiringFencing:(BOOL)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    int v8 = [(_UISheetPresentationControllerConfiguration *)self _shouldScaleDownBehindDescendantSheets];
    if (v8 != [v7 _shouldScaleDownBehindDescendantSheets]) {
      goto LABEL_28;
    }
    int v9 = [(_UISheetPresentationControllerConfiguration *)self _peeksWhenFloating];
    if (v9 != [v7 _peeksWhenFloating]) {
      goto LABEL_28;
    }
    int v10 = [(_UISheetPresentationControllerConfiguration *)self _wantsFullScreen];
    if (v10 != [v7 _wantsFullScreen]) {
      goto LABEL_28;
    }
    int v11 = [(_UISheetPresentationControllerConfiguration *)self _wantsBottomAttached];
    if (v11 != [v7 _wantsBottomAttached]) {
      goto LABEL_28;
    }
    int v12 = [(_UISheetPresentationControllerConfiguration *)self _wantsEdgeAttachedInCompactHeight];
    if (v12 != [v7 _wantsEdgeAttachedInCompactHeight]) {
      goto LABEL_28;
    }
    int v13 = [(_UISheetPresentationControllerConfiguration *)self _widthFollowsPreferredContentSizeWhenEdgeAttached];
    if (v13 != [v7 _widthFollowsPreferredContentSizeWhenEdgeAttached]) {
      goto LABEL_28;
    }
    int v14 = [(_UISheetPresentationControllerConfiguration *)self _prefersGrabberVisible];
    if (v14 != [v7 _prefersGrabberVisible]) {
      goto LABEL_28;
    }
    [(_UISheetPresentationControllerConfiguration *)self _grabberTopSpacing];
    double v16 = v15;
    [v7 _grabberTopSpacing];
    if (v16 != v17) {
      goto LABEL_28;
    }
    [(_UISheetPresentationControllerConfiguration *)self _additionalMinimumTopInset];
    double v19 = v18;
    [v7 _additionalMinimumTopInset];
    if (v19 != v20) {
      goto LABEL_28;
    }
    int v21 = [(_UISheetPresentationControllerConfiguration *)self _insetsPresentedViewForGrabber];
    if (v21 != [v7 _insetsPresentedViewForGrabber]) {
      goto LABEL_28;
    }
    int64_t v22 = [(_UISheetPresentationControllerConfiguration *)self _mode];
    if (v22 != [v7 _mode]) {
      goto LABEL_28;
    }
    [(_UISheetPresentationControllerConfiguration *)self _cornerRadiusForPresentationAndDismissal];
    double v24 = v23;
    [v7 _cornerRadiusForPresentationAndDismissal];
    if (v24 != v25) {
      goto LABEL_28;
    }
    [(_UISheetPresentationControllerConfiguration *)self _preferredCornerRadius];
    double v27 = v26;
    [v7 _preferredCornerRadius];
    if (v27 != v28) {
      goto LABEL_28;
    }
    [(_UISheetPresentationControllerConfiguration *)self _preferredShadowOpacity];
    double v30 = v29;
    [v7 _preferredShadowOpacity];
    if (v30 == v31
      && ([(_UISheetPresentationControllerConfiguration *)self _shadowRadius],
          double v33 = v32,
          [v7 _shadowRadius],
          v33 == v34))
    {
      v35 = [(_UISheetPresentationControllerConfiguration *)self _detents];
      v36 = [v7 _detents];
      if ([v35 isEqual:v36])
      {
        v37 = [(_UISheetPresentationControllerConfiguration *)self _selectedDetentIdentifier];
        v38 = [v7 _selectedDetentIdentifier];
        if (UIEqual(v37, v38))
        {
          v39 = [(_UISheetPresentationControllerConfiguration *)self _standardAppearance];
          v40 = [v7 _standardAppearance];
          v79 = v39;
          if (UIEqual(v39, v40))
          {
            v41 = [(_UISheetPresentationControllerConfiguration *)self _edgeAttachedCompactHeightAppearance];
            v77 = [v7 _edgeAttachedCompactHeightAppearance];
            v78 = v41;
            if (UIEqual(v41, v77))
            {
              v42 = [(_UISheetPresentationControllerConfiguration *)self _floatingAppearance];
              v75 = [v7 _floatingAppearance];
              v76 = v42;
              if (!UIEqual(v42, v75)) {
                goto LABEL_37;
              }
              int64_t v43 = [(_UISheetPresentationControllerConfiguration *)self _detentDirectionWhenFloating];
              if (v43 != [v7 _detentDirectionWhenFloating]) {
                goto LABEL_37;
              }
              int v44 = [(_UISheetPresentationControllerConfiguration *)self _prefersScrollingResizesWhenDetentDirectionIsDown];
              if (v44 != [v7 _prefersScrollingResizesWhenDetentDirectionIsDown]) {
                goto LABEL_37;
              }
              int v45 = [(_UISheetPresentationControllerConfiguration *)self _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge];
              if (v45 != [v7 _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge]) {
                goto LABEL_37;
              }
              [(_UISheetPresentationControllerConfiguration *)self _hostParentStackAlignmentFrame];
              CGFloat v47 = v46;
              CGFloat v49 = v48;
              CGFloat v51 = v50;
              CGFloat v53 = v52;
              [v7 _hostParentStackAlignmentFrame];
              v82.origin.x = v54;
              v82.origin.y = v55;
              v82.size.width = v56;
              v82.size.height = v57;
              v80.origin.x = v47;
              v80.origin.y = v49;
              v80.size.width = v51;
              v80.size.height = v53;
              if (CGRectEqualToRect(v80, v82))
              {
                [(_UISheetPresentationControllerConfiguration *)self _hostParentFullHeightUntransformedFrameForDepthLevel];
                CGFloat v59 = v58;
                CGFloat v61 = v60;
                CGFloat v63 = v62;
                CGFloat v65 = v64;
                [v7 _hostParentFullHeightUntransformedFrameForDepthLevel];
                v83.origin.x = v66;
                v83.origin.y = v67;
                v83.size.width = v68;
                v83.size.height = v69;
                v81.origin.x = v59;
                v81.origin.y = v61;
                v81.size.width = v63;
                v81.size.height = v65;
                BOOL v70 = CGRectEqualToRect(v81, v83);
              }
              else
              {
LABEL_37:
                BOOL v70 = 0;
              }
            }
            else
            {
              BOOL v70 = 0;
            }
          }
          else
          {
            BOOL v70 = 0;
          }
        }
        else
        {
          BOOL v70 = 0;
        }
      }
      else
      {
        BOOL v70 = 0;
      }

      if (a4) {
        goto LABEL_31;
      }
    }
    else
    {
LABEL_28:
      BOOL v70 = 0;
      if (a4)
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    [(_UISheetPresentationControllerConfiguration *)self _hostParentDepthLevel];
    double v72 = v71;
    [v7 _hostParentDepthLevel];
    if (v72 != v73) {
      BOOL v70 = 0;
    }
    goto LABEL_31;
  }
  BOOL v70 = 0;
LABEL_32:

  return v70;
}

- (BOOL)_shouldFenceChangeToConfiguration:(id)a3
{
  return ![(_UISheetPresentationControllerConfiguration *)self _isEqual:a3 onlyCheckPropertiesRequiringFencing:1];
}

- (BOOL)isEqual:(id)a3
{
  return [(_UISheetPresentationControllerConfiguration *)self _isEqual:a3 onlyCheckPropertiesRequiringFencing:0];
}

- (NSString)description
{
  v33[26] = *MEMORY[0x1E4F143B8];
  double v32 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  double v31 = NSStringFromSelector(sel__shouldScaleDownBehindDescendantSheets);
  v33[0] = v31;
  double v30 = NSStringFromSelector(sel__peeksWhenFloating);
  v33[1] = v30;
  double v29 = NSStringFromSelector(sel__wantsFullScreen);
  v33[2] = v29;
  double v28 = NSStringFromSelector(sel__wantsBottomAttached);
  v33[3] = v28;
  double v27 = NSStringFromSelector(sel__wantsEdgeAttachedInCompactHeight);
  v33[4] = v27;
  double v26 = NSStringFromSelector(sel__widthFollowsPreferredContentSizeWhenEdgeAttached);
  v33[5] = v26;
  double v25 = NSStringFromSelector(sel__prefersGrabberVisible);
  v33[6] = v25;
  double v24 = NSStringFromSelector(sel__grabberTopSpacing);
  v33[7] = v24;
  double v23 = NSStringFromSelector(sel__additionalMinimumTopInset);
  v33[8] = v23;
  double v20 = NSStringFromSelector(sel__insetsPresentedViewForGrabber);
  v33[9] = v20;
  double v19 = NSStringFromSelector(sel__mode);
  v33[10] = v19;
  double v18 = NSStringFromSelector(sel__cornerRadiusForPresentationAndDismissal);
  v33[11] = v18;
  double v17 = NSStringFromSelector(sel__preferredCornerRadius);
  v33[12] = v17;
  double v16 = NSStringFromSelector(sel__preferredShadowOpacity);
  v33[13] = v16;
  double v15 = NSStringFromSelector(sel__shadowRadius);
  v33[14] = v15;
  int v14 = NSStringFromSelector(sel__detents);
  v33[15] = v14;
  int v13 = NSStringFromSelector(sel__selectedDetentIdentifier);
  v33[16] = v13;
  v2 = NSStringFromSelector(sel__standardAppearance);
  v33[17] = v2;
  v3 = NSStringFromSelector(sel__edgeAttachedCompactHeightAppearance);
  v33[18] = v3;
  v4 = NSStringFromSelector(sel__floatingAppearance);
  v33[19] = v4;
  v5 = NSStringFromSelector(sel__detentDirectionWhenFloating);
  v33[20] = v5;
  id v6 = NSStringFromSelector(sel__prefersScrollingResizesWhenDetentDirectionIsDown);
  v33[21] = v6;
  id v7 = NSStringFromSelector(sel__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge);
  v33[22] = v7;
  int v8 = NSStringFromSelector(sel__hostParentDepthLevel);
  v33[23] = v8;
  int v9 = NSStringFromSelector(sel__hostParentStackAlignmentFrame);
  v33[24] = v9;
  int v10 = NSStringFromSelector(sel__hostParentFullHeightUntransformedFrameForDepthLevel);
  v33[25] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:26];
  id v22 = +[UIDescriptionBuilder descriptionForObject:self keys:v11];

  return (NSString *)v22;
}

- (_UISheetPresentationControllerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_UISheetPresentationControllerConfiguration;
  v5 = [(_UISheetPresentationControllerConfiguration *)&v35 init];
  if (v5)
  {
    v5->__shouldScaleDownBehindDescendantSheets = [v4 decodeBoolForKey:@"_shouldScaleDownBehindDescendantSheets"];
    v5->__peeksWhenFloating = [v4 decodeBoolForKey:@"_peeksWhenFloating"];
    v5->__wantsFullScreen = [v4 decodeBoolForKey:@"_wantsFullScreen"];
    v5->__wantsBottomAttached = [v4 decodeBoolForKey:@"_wantsBottomAttached"];
    v5->__wantsEdgeAttachedInCompactHeight = [v4 decodeBoolForKey:@"_wantsEdgeAttachedInCompactHeight"];
    v5->__widthFollowsPreferredContentSizeWhenEdgeAttached = [v4 decodeBoolForKey:@"_widthFollowsPreferredContentSizeWhenEdgeAttached"];
    v5->__prefersGrabberVisible = [v4 decodeBoolForKey:@"_prefersGrabberVisible"];
    [v4 decodeDoubleForKey:@"_grabberTopSpacing"];
    v5->__grabberTopSpacing = v6;
    [v4 decodeDoubleForKey:@"_additionalMinimumTopInset"];
    v5->__additionalMinimumTopInset = v7;
    v5->__insetsPresentedViewForGrabber = [v4 decodeBoolForKey:@"_insetsPresentedViewForGrabber"];
    v5->__mode = [v4 decodeIntegerForKey:@"_mode"];
    [v4 decodeDoubleForKey:@"_cornerRadiusForPresentationAndDismissal"];
    v5->__cornerRadiusForPresentationAndDismissal = v8;
    [v4 decodeDoubleForKey:@"_preferredCornerRadius"];
    v5->__preferredCornerRadius = v9;
    [v4 decodeDoubleForKey:@"_preferredShadowOpacity"];
    v5->__preferredShadowOpacity = v10;
    [v4 decodeDoubleForKey:@"_shadowRadius"];
    v5->__shadowRadius = v11;
    int v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    int v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_detents"];
    detents = v5->__detents;
    v5->__detents = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_selectedDetentIdentifier"];
    selectedDetentIdentifier = v5->__selectedDetentIdentifier;
    v5->__selectedDetentIdentifier = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_standardAppearance"];
    standardAppearance = v5->__standardAppearance;
    v5->__standardAppearance = (_UISheetPresentationControllerAppearance *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_edgeAttachedCompactHeightAppearance"];
    edgeAttachedCompactHeightAppearance = v5->__edgeAttachedCompactHeightAppearance;
    v5->__edgeAttachedCompactHeightAppearance = (_UISheetPresentationControllerAppearance *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_floatingAppearance"];
    floatingAppearance = v5->__floatingAppearance;
    v5->__floatingAppearance = (_UISheetPresentationControllerAppearance *)v23;

    v5->__detentDirectionWhenFloating = [v4 decodeIntegerForKey:@"_detentDirectionWhenFloating"];
    v5->__prefersScrollingResizesWhenDetentDirectionIsDown = [v4 decodeBoolForKey:@"_prefersScrollingResizesWhenDetentDirectionIsDown"];
    v5->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge = [v4 decodeBoolForKey:@"_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"];
    [v4 decodeDoubleForKey:@"_hostParentDepthLevel"];
    v5->__hostParentDepthLevel = v25;
    [v4 decodeCGRectForKey:@"_hostParentStackAlignmentFrame"];
    v5->__hostParentStackAlignmentFrame.origin.x = v26;
    v5->__hostParentStackAlignmentFrame.origin.y = v27;
    v5->__hostParentStackAlignmentFrame.size.width = v28;
    v5->__hostParentStackAlignmentFrame.size.height = v29;
    [v4 decodeCGRectForKey:@"_hostParentFullHeightUntransformedFrameForDepthLevel"];
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.x = v30;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.y = v31;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.size.width = v32;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.size.height = v33;
  }

  return v5;
}

- (_UISheetPresentationControllerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_UISheetPresentationControllerConfiguration;
  v5 = [(_UISheetPresentationControllerConfiguration *)&v33 init];
  if (v5)
  {
    v5->__shouldScaleDownBehindDescendantSheets = [v4 decodeBoolForKey:@"_shouldScaleDownBehindDescendantSheets"];
    v5->__peeksWhenFloating = [v4 decodeBoolForKey:@"_peeksWhenFloating"];
    v5->__wantsFullScreen = [v4 decodeBoolForKey:@"_wantsFullScreen"];
    v5->__wantsBottomAttached = [v4 decodeBoolForKey:@"_wantsBottomAttached"];
    v5->__wantsEdgeAttachedInCompactHeight = [v4 decodeBoolForKey:@"_wantsEdgeAttachedInCompactHeight"];
    v5->__widthFollowsPreferredContentSizeWhenEdgeAttached = [v4 decodeBoolForKey:@"_widthFollowsPreferredContentSizeWhenEdgeAttached"];
    v5->__prefersGrabberVisible = [v4 decodeBoolForKey:@"_prefersGrabberVisible"];
    [v4 decodeDoubleForKey:@"_grabberTopSpacing"];
    v5->__grabberTopSpacing = v6;
    [v4 decodeDoubleForKey:@"_additionalMinimumTopInset"];
    v5->__additionalMinimumTopInset = v7;
    v5->__insetsPresentedViewForGrabber = [v4 decodeBoolForKey:@"_insetsPresentedViewForGrabber"];
    v5->__mode = [v4 decodeInt64ForKey:@"_mode"];
    [v4 decodeDoubleForKey:@"_cornerRadiusForPresentationAndDismissal"];
    v5->__cornerRadiusForPresentationAndDismissal = v8;
    [v4 decodeDoubleForKey:@"_preferredCornerRadius"];
    v5->__preferredCornerRadius = v9;
    [v4 decodeDoubleForKey:@"_preferredShadowOpacity"];
    v5->__preferredShadowOpacity = v10;
    [v4 decodeDoubleForKey:@"_shadowRadius"];
    v5->__shadowRadius = v11;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v4 decodeCollectionOfClass:v12 containingClass:objc_opt_class() forKey:@"_detents"];
    detents = v5->__detents;
    v5->__detents = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_selectedDetentIdentifier"];
    selectedDetentIdentifier = v5->__selectedDetentIdentifier;
    v5->__selectedDetentIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_standardAppearance"];
    standardAppearance = v5->__standardAppearance;
    v5->__standardAppearance = (_UISheetPresentationControllerAppearance *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_edgeAttachedCompactHeightAppearance"];
    edgeAttachedCompactHeightAppearance = v5->__edgeAttachedCompactHeightAppearance;
    v5->__edgeAttachedCompactHeightAppearance = (_UISheetPresentationControllerAppearance *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_floatingAppearance"];
    floatingAppearance = v5->__floatingAppearance;
    v5->__floatingAppearance = (_UISheetPresentationControllerAppearance *)v21;

    v5->__detentDirectionWhenFloating = [v4 decodeInt64ForKey:@"_detentDirectionWhenFloating"];
    v5->__prefersScrollingResizesWhenDetentDirectionIsDown = [v4 decodeBoolForKey:@"_prefersScrollingResizesWhenDetentDirectionIsDown"];
    v5->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge = [v4 decodeBoolForKey:@"_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"];
    [v4 decodeDoubleForKey:@"_hostParentDepthLevel"];
    v5->__hostParentDepthLevel = v23;
    [v4 decodeCGRectForKey:@"_hostParentStackAlignmentFrame"];
    v5->__hostParentStackAlignmentFrame.origin.x = v24;
    v5->__hostParentStackAlignmentFrame.origin.y = v25;
    v5->__hostParentStackAlignmentFrame.size.width = v26;
    v5->__hostParentStackAlignmentFrame.size.height = v27;
    [v4 decodeCGRectForKey:@"_hostParentFullHeightUntransformedFrameForDepthLevel"];
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.x = v28;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.y = v29;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.size.width = v30;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.size.height = v31;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _shouldScaleDownBehindDescendantSheets](self, "_shouldScaleDownBehindDescendantSheets"), @"_shouldScaleDownBehindDescendantSheets");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _peeksWhenFloating](self, "_peeksWhenFloating"), @"_peeksWhenFloating");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsFullScreen](self, "_wantsFullScreen"), @"_wantsFullScreen");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsBottomAttached](self, "_wantsBottomAttached"), @"_wantsBottomAttached");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsEdgeAttachedInCompactHeight](self, "_wantsEdgeAttachedInCompactHeight"), @"_wantsEdgeAttachedInCompactHeight");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _widthFollowsPreferredContentSizeWhenEdgeAttached](self, "_widthFollowsPreferredContentSizeWhenEdgeAttached"), @"_widthFollowsPreferredContentSizeWhenEdgeAttached");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersGrabberVisible](self, "_prefersGrabberVisible"), @"_prefersGrabberVisible");
  [(_UISheetPresentationControllerConfiguration *)self _grabberTopSpacing];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_grabberTopSpacing");
  [(_UISheetPresentationControllerConfiguration *)self _additionalMinimumTopInset];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_additionalMinimumTopInset");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _insetsPresentedViewForGrabber](self, "_insetsPresentedViewForGrabber"), @"_insetsPresentedViewForGrabber");
  objc_msgSend(v9, "encodeInteger:forKey:", -[_UISheetPresentationControllerConfiguration _mode](self, "_mode"), @"_mode");
  [(_UISheetPresentationControllerConfiguration *)self _cornerRadiusForPresentationAndDismissal];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_cornerRadiusForPresentationAndDismissal");
  [(_UISheetPresentationControllerConfiguration *)self _preferredCornerRadius];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_preferredCornerRadius");
  [(_UISheetPresentationControllerConfiguration *)self _preferredShadowOpacity];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_preferredShadowOpacity");
  [(_UISheetPresentationControllerConfiguration *)self _shadowRadius];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_shadowRadius");
  id v4 = [(_UISheetPresentationControllerConfiguration *)self _detents];
  [v9 encodeObject:v4 forKey:@"_detents"];

  v5 = [(_UISheetPresentationControllerConfiguration *)self _selectedDetentIdentifier];
  [v9 encodeObject:v5 forKey:@"_selectedDetentIdentifier"];

  double v6 = [(_UISheetPresentationControllerConfiguration *)self _standardAppearance];
  [v9 encodeObject:v6 forKey:@"_standardAppearance"];

  double v7 = [(_UISheetPresentationControllerConfiguration *)self _edgeAttachedCompactHeightAppearance];
  [v9 encodeObject:v7 forKey:@"_edgeAttachedCompactHeightAppearance"];

  double v8 = [(_UISheetPresentationControllerConfiguration *)self _floatingAppearance];
  [v9 encodeObject:v8 forKey:@"_floatingAppearance"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[_UISheetPresentationControllerConfiguration _detentDirectionWhenFloating](self, "_detentDirectionWhenFloating"), @"_detentDirectionWhenFloating");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersScrollingResizesWhenDetentDirectionIsDown](self, "_prefersScrollingResizesWhenDetentDirectionIsDown"), @"_prefersScrollingResizesWhenDetentDirectionIsDown");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge](self, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"), @"_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge");
  [(_UISheetPresentationControllerConfiguration *)self _hostParentDepthLevel];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_hostParentDepthLevel");
  [(_UISheetPresentationControllerConfiguration *)self _hostParentStackAlignmentFrame];
  objc_msgSend(v9, "encodeCGRect:forKey:", @"_hostParentStackAlignmentFrame");
  [(_UISheetPresentationControllerConfiguration *)self _hostParentFullHeightUntransformedFrameForDepthLevel];
  objc_msgSend(v9, "encodeCGRect:forKey:", @"_hostParentFullHeightUntransformedFrameForDepthLevel");
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _shouldScaleDownBehindDescendantSheets](self, "_shouldScaleDownBehindDescendantSheets"), @"_shouldScaleDownBehindDescendantSheets");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _peeksWhenFloating](self, "_peeksWhenFloating"), @"_peeksWhenFloating");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsFullScreen](self, "_wantsFullScreen"), @"_wantsFullScreen");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsBottomAttached](self, "_wantsBottomAttached"), @"_wantsBottomAttached");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsEdgeAttachedInCompactHeight](self, "_wantsEdgeAttachedInCompactHeight"), @"_wantsEdgeAttachedInCompactHeight");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _widthFollowsPreferredContentSizeWhenEdgeAttached](self, "_widthFollowsPreferredContentSizeWhenEdgeAttached"), @"_widthFollowsPreferredContentSizeWhenEdgeAttached");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersGrabberVisible](self, "_prefersGrabberVisible"), @"_prefersGrabberVisible");
  [(_UISheetPresentationControllerConfiguration *)self _grabberTopSpacing];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_grabberTopSpacing");
  [(_UISheetPresentationControllerConfiguration *)self _additionalMinimumTopInset];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_additionalMinimumTopInset");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _insetsPresentedViewForGrabber](self, "_insetsPresentedViewForGrabber"), @"_insetsPresentedViewForGrabber");
  objc_msgSend(v9, "encodeInt64:forKey:", -[_UISheetPresentationControllerConfiguration _mode](self, "_mode"), @"_mode");
  [(_UISheetPresentationControllerConfiguration *)self _cornerRadiusForPresentationAndDismissal];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_cornerRadiusForPresentationAndDismissal");
  [(_UISheetPresentationControllerConfiguration *)self _preferredCornerRadius];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_preferredCornerRadius");
  [(_UISheetPresentationControllerConfiguration *)self _preferredShadowOpacity];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_preferredShadowOpacity");
  [(_UISheetPresentationControllerConfiguration *)self _shadowRadius];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_shadowRadius");
  id v4 = [(_UISheetPresentationControllerConfiguration *)self _detents];
  [v9 encodeCollection:v4 forKey:@"_detents"];

  v5 = [(_UISheetPresentationControllerConfiguration *)self _selectedDetentIdentifier];
  [v9 encodeObject:v5 forKey:@"_selectedDetentIdentifier"];

  double v6 = [(_UISheetPresentationControllerConfiguration *)self _standardAppearance];
  [v9 encodeObject:v6 forKey:@"_standardAppearance"];

  double v7 = [(_UISheetPresentationControllerConfiguration *)self _edgeAttachedCompactHeightAppearance];
  [v9 encodeObject:v7 forKey:@"_edgeAttachedCompactHeightAppearance"];

  double v8 = [(_UISheetPresentationControllerConfiguration *)self _floatingAppearance];
  [v9 encodeObject:v8 forKey:@"_floatingAppearance"];

  objc_msgSend(v9, "encodeInt64:forKey:", -[_UISheetPresentationControllerConfiguration _detentDirectionWhenFloating](self, "_detentDirectionWhenFloating"), @"_detentDirectionWhenFloating");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersScrollingResizesWhenDetentDirectionIsDown](self, "_prefersScrollingResizesWhenDetentDirectionIsDown"), @"_prefersScrollingResizesWhenDetentDirectionIsDown");
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge](self, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"), @"_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge");
  [(_UISheetPresentationControllerConfiguration *)self _hostParentDepthLevel];
  objc_msgSend(v9, "encodeDouble:forKey:", @"_hostParentDepthLevel");
  [(_UISheetPresentationControllerConfiguration *)self _hostParentStackAlignmentFrame];
  objc_msgSend(v9, "encodeCGRect:forKey:", @"_hostParentStackAlignmentFrame");
  [(_UISheetPresentationControllerConfiguration *)self _hostParentFullHeightUntransformedFrameForDepthLevel];
  objc_msgSend(v9, "encodeCGRect:forKey:", @"_hostParentFullHeightUntransformedFrameForDepthLevel");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)_shouldScaleDownBehindDescendantSheets
{
  return self->__shouldScaleDownBehindDescendantSheets;
}

- (BOOL)_peeksWhenFloating
{
  return self->__peeksWhenFloating;
}

- (BOOL)_wantsFullScreen
{
  return self->__wantsFullScreen;
}

- (BOOL)_wantsBottomAttached
{
  return self->__wantsBottomAttached;
}

- (BOOL)_wantsEdgeAttachedInCompactHeight
{
  return self->__wantsEdgeAttachedInCompactHeight;
}

- (BOOL)_widthFollowsPreferredContentSizeWhenEdgeAttached
{
  return self->__widthFollowsPreferredContentSizeWhenEdgeAttached;
}

- (BOOL)_prefersGrabberVisible
{
  return self->__prefersGrabberVisible;
}

- (double)_grabberTopSpacing
{
  return self->__grabberTopSpacing;
}

- (double)_additionalMinimumTopInset
{
  return self->__additionalMinimumTopInset;
}

- (BOOL)_insetsPresentedViewForGrabber
{
  return self->__insetsPresentedViewForGrabber;
}

- (int64_t)_mode
{
  return self->__mode;
}

- (double)_cornerRadiusForPresentationAndDismissal
{
  return self->__cornerRadiusForPresentationAndDismissal;
}

- (double)_preferredCornerRadius
{
  return self->__preferredCornerRadius;
}

- (double)_preferredShadowOpacity
{
  return self->__preferredShadowOpacity;
}

- (double)_shadowRadius
{
  return self->__shadowRadius;
}

- (NSArray)_detents
{
  return self->__detents;
}

- (NSString)_selectedDetentIdentifier
{
  return self->__selectedDetentIdentifier;
}

- (_UISheetPresentationControllerAppearance)_standardAppearance
{
  return self->__standardAppearance;
}

- (_UISheetPresentationControllerAppearance)_edgeAttachedCompactHeightAppearance
{
  return self->__edgeAttachedCompactHeightAppearance;
}

- (_UISheetPresentationControllerAppearance)_floatingAppearance
{
  return self->__floatingAppearance;
}

- (int64_t)_detentDirectionWhenFloating
{
  return self->__detentDirectionWhenFloating;
}

- (BOOL)_prefersScrollingResizesWhenDetentDirectionIsDown
{
  return self->__prefersScrollingResizesWhenDetentDirectionIsDown;
}

- (BOOL)_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge
{
  return self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge;
}

- (double)_hostParentDepthLevel
{
  return self->__hostParentDepthLevel;
}

- (CGRect)_hostParentStackAlignmentFrame
{
  double x = self->__hostParentStackAlignmentFrame.origin.x;
  double y = self->__hostParentStackAlignmentFrame.origin.y;
  double width = self->__hostParentStackAlignmentFrame.size.width;
  double height = self->__hostParentStackAlignmentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_hostParentFullHeightUntransformedFrameForDepthLevel
{
  double x = self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.x;
  double y = self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.y;
  double width = self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.width;
  double height = self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end