@interface BKEndOfBookCardTransitionAnimationController
- (BCSheetTransitionCoverController)coverController;
- (BCSheetTransitioningArtworkSource)cardArtworkSource;
- (BCSheetTransitioningArtworkSource)compactArtworkSource;
- (BCSheetTransitioningCardContent)cardContent;
- (BKEndOfBookCardTransitionAnimationController)initWithCompactViewController:(id)a3 cardViewController:(id)a4;
- (BKEndOfBookCardViewController)cardViewController;
- (BKEndOfBookCompactViewController)compactViewController;
- (BOOL)isCompositeCompactArtwork;
- (BOOL)isCoverTransition;
- (TUIAssertion)suspendLayoutAssertion;
- (UIView)dropShadowView;
- (_BKEndOfBookCardTransitionSnapshotView)snapshotView;
- (double)_cardInitialTopOffset;
- (id)cardUnhideBlock;
- (id)compactUnhideBlock;
- (id)createCardArtworkSource;
- (id)createCompactArtworkSource;
- (void)_animateContentCrossfade:(BOOL)a3;
- (void)_finalizePresentation:(BOOL)a3;
- (void)_prepareForPresentation:(id)a3;
- (void)_removeTransitioningViews;
- (void)_setupCardDropShadowForPresented:(BOOL)a3;
- (void)dealloc;
- (void)finalizeAnimationsForDismissal:(BOOL)a3;
- (void)finalizeAnimationsForPresentation:(BOOL)a3;
- (void)hideCovers;
- (void)prepareForDismissal;
- (void)prepareForPresentation:(id)a3;
- (void)setCardArtworkSource:(id)a3;
- (void)setCardContent:(id)a3;
- (void)setCardUnhideBlock:(id)a3;
- (void)setCardViewController:(id)a3;
- (void)setCompactArtworkSource:(id)a3;
- (void)setCompactUnhideBlock:(id)a3;
- (void)setCompactViewController:(id)a3;
- (void)setCoverController:(id)a3;
- (void)setDropShadowView:(id)a3;
- (void)setSnapshotView:(id)a3;
- (void)setSuspendLayoutAssertion:(id)a3;
- (void)setupAnimationsForDismissal;
- (void)setupAnimationsForPresentation;
- (void)unhideCovers;
@end

@implementation BKEndOfBookCardTransitionAnimationController

- (BKEndOfBookCardTransitionAnimationController)initWithCompactViewController:(id)a3 cardViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKEndOfBookCardTransitionAnimationController;
  v8 = [(BKEndOfBookCardTransitionAnimationController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_compactViewController, v6);
    objc_storeWeak((id *)&v9->_cardViewController, v7);
  }

  return v9;
}

- (BOOL)isCoverTransition
{
  uint64_t v3 = [(BKEndOfBookCardTransitionAnimationController *)self cardContent];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = [(BKEndOfBookCardTransitionAnimationController *)self compactArtworkSource];
    if (!v5)
    {
      unsigned __int8 v15 = 0;
LABEL_8:

      return v15;
    }
    id v6 = (void *)v5;
    id v7 = [(BKEndOfBookCardTransitionAnimationController *)self cardArtworkSource];

    if (v7)
    {
      v8 = [(BKEndOfBookCardTransitionAnimationController *)self compactArtworkSource];
      unsigned int v9 = [v8 isCover];

      if (!v9) {
        return 1;
      }
      v4 = [(BKEndOfBookCardTransitionAnimationController *)self compactArtworkSource];
      v10 = [v4 identifier];
      objc_super v11 = [v10 refInstance];
      v12 = [(BKEndOfBookCardTransitionAnimationController *)self cardArtworkSource];
      v13 = [v12 identifier];
      v14 = [v13 refInstance];
      unsigned __int8 v15 = [v11 isEqualToString:v14];

      goto LABEL_8;
    }
  }
  return 0;
}

- (BOOL)isCompositeCompactArtwork
{
  v2 = [(BKEndOfBookCardTransitionAnimationController *)self compactArtworkSource];
  char v3 = [v2 isCover] ^ 1;

  return v3;
}

- (void)setDropShadowView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  dropShadowView = self->_dropShadowView;
  p_dropShadowView = &self->_dropShadowView;
  id v6 = dropShadowView;
  if (dropShadowView != v5)
  {
    unsigned int v9 = v5;
    [(UIView *)v6 removeFromSuperview];
    objc_storeStrong((id *)p_dropShadowView, a3);
    uint64_t v5 = v9;
  }
}

- (void)setSnapshotView:(id)a3
{
  uint64_t v5 = (_BKEndOfBookCardTransitionSnapshotView *)a3;
  snapshotView = self->_snapshotView;
  p_snapshotView = &self->_snapshotView;
  id v6 = snapshotView;
  if (snapshotView != v5)
  {
    unsigned int v9 = v5;
    [(_BKEndOfBookCardTransitionSnapshotView *)v6 removeFromSuperview];
    objc_storeStrong((id *)p_snapshotView, a3);
    uint64_t v5 = v9;
  }
}

- (void)setCoverController:(id)a3
{
  uint64_t v5 = (BCSheetTransitionCoverController *)a3;
  coverController = self->_coverController;
  p_coverController = &self->_coverController;
  id v6 = coverController;
  if (coverController != v5)
  {
    v10 = v5;
    unsigned int v9 = [(BCSheetTransitionCoverController *)v6 coverView];
    [v9 removeFromSuperview];

    objc_storeStrong((id *)p_coverController, a3);
    uint64_t v5 = v10;
  }
}

- (id)createCompactArtworkSource
{
  char v3 = [(BKEndOfBookCardTransitionAnimationController *)self compactViewController];
  v4 = [v3 feedViewController];
  uint64_t v5 = [v4 artworkSourceInEntryWithIndex:0 refId:@"featured-cover" refInstance:0 isCover:1];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(BKEndOfBookCardTransitionAnimationController *)self compactViewController];
    unsigned int v9 = [v8 feedViewController];
    id v7 = [v9 artworkSourceInEntryWithIndex:0 refId:@"featured-artwork" refInstance:0 isCover:0];
  }

  return v7;
}

- (id)createCardArtworkSource
{
  objc_opt_class();
  char v3 = [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
  v4 = [v3 cardNavigationController];
  uint64_t v5 = [v4 topViewController];
  id v6 = BUDynamicCast();

  id v7 = [v6 sheetTransitioningCardContentArtworkSourceInEntryWithIndex:1];

  return v7;
}

- (void)hideCovers
{
  char v3 = [(BKEndOfBookCardTransitionAnimationController *)self compactUnhideBlock];
  if (!v3)
  {
    v4 = [(BKEndOfBookCardTransitionAnimationController *)self compactArtworkSource];
    unsigned int v5 = [v4 isCover];

    if (!v5) {
      goto LABEL_5;
    }
    char v3 = [(BKEndOfBookCardTransitionAnimationController *)self compactArtworkSource];
    id v6 = [v3 hide];
    [(BKEndOfBookCardTransitionAnimationController *)self setCompactUnhideBlock:v6];
  }
LABEL_5:
  id v7 = [(BKEndOfBookCardTransitionAnimationController *)self cardUnhideBlock];
  if (!v7)
  {
    v8 = [(BKEndOfBookCardTransitionAnimationController *)self cardArtworkSource];
    unsigned int v9 = [v8 isCover];

    if (!v9) {
      return;
    }
    id v11 = [(BKEndOfBookCardTransitionAnimationController *)self cardArtworkSource];
    v10 = [v11 hide];
    [(BKEndOfBookCardTransitionAnimationController *)self setCardUnhideBlock:v10];

    id v7 = v11;
  }
}

- (void)unhideCovers
{
  uint64_t v3 = [(BKEndOfBookCardTransitionAnimationController *)self compactUnhideBlock];
  v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  [(BKEndOfBookCardTransitionAnimationController *)self setCompactUnhideBlock:0];

  unsigned int v5 = [(BKEndOfBookCardTransitionAnimationController *)self cardUnhideBlock];
  if (v5) {
    v5[2]();
  }
  [(BKEndOfBookCardTransitionAnimationController *)self setCardUnhideBlock:0];
}

- (void)_setupCardDropShadowForPresented:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(BKEndOfBookCardTransitionAnimationController *)self dropShadowView];

  if (!v5)
  {
    id v6 = [(BKEndOfBookCardTransitionAnimationController *)self compactViewController];
    id v7 = [v6 dropShadowView];

    v8 = [v7 layer];
    id v9 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v10 = [v9 layer];
    id v11 = [v8 cornerCurve];
    [v10 setCornerCurve:v11];

    [v8 cornerRadius];
    [v10 setCornerRadius:];
    [v8 shadowOffset];
    [v10 setShadowOffset:];
    [v8 shadowRadius];
    [v10 setShadowRadius:];
    [v10 setShadowColor:[v8 shadowColor]];
    [v8 shadowOpacity];
    [v10 setShadowOpacity:];
    [v10 setShadowPathIsBounds:1];
    v12 = [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
    v13 = [v12 presentationController];
    v14 = [v13 containerView];

    unsigned __int8 v15 = [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
    v16 = [v15 presentationController];
    v17 = [v16 presentedView];

    v18 = [v17 superview];

    if (v18 == v14) {
      [v14 insertSubview:v9 belowSubview:v17];
    }
    else {
      [v14 insertSubview:v9 atIndex:0];
    }
    [(BKEndOfBookCardTransitionAnimationController *)self setDropShadowView:v9];
  }
  if (v3)
  {
    v19 = [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
    v20 = [v19 view];

    v21 = [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
    v22 = [v21 presentationController];
    [v22 containerView];
  }
  else
  {
    v23 = [(BKEndOfBookCardTransitionAnimationController *)self compactViewController];
    v20 = [v23 dropShadowView];

    v21 = [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
    v22 = [v21 bc_ancestorFullScreenPresentingViewController];
    [v22 view];
  v24 = };

  [v20 bounds];
  [v24 convertRect:v20 fromView:];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  id v33 = [(BKEndOfBookCardTransitionAnimationController *)self dropShadowView];
  [v33 setFrame:v26, v28, v30, v32];
  [v33 setAlpha:(double)!v3];
}

- (void)prepareForPresentation:(id)a3
{
  id v8 = a3;
  v4 = [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
  unsigned int v5 = [v4 transitioningCardContent];

  if (v5)
  {
    [(BKEndOfBookCardTransitionAnimationController *)self setCardContent:v5];
    [(BKEndOfBookCardTransitionAnimationController *)self _prepareForPresentation:v8];
  }
  else
  {
    id v6 = objc_retainBlock(v8);
    id v7 = v6;
    if (v6) {
      (*((void (**)(id))v6 + 2))(v6);
    }
  }
}

- (void)_prepareForPresentation:(id)a3
{
  id v53 = a3;
  v4 = [(BKEndOfBookCardTransitionAnimationController *)self compactViewController];
  unsigned int v5 = [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
  id v6 = [(BKEndOfBookCardTransitionAnimationController *)self createCompactArtworkSource];
  [(BKEndOfBookCardTransitionAnimationController *)self setCompactArtworkSource:v6];

  id v7 = [v4 bc_windowForViewController];
  [v5 preferredContentSize];
  _UISheetFormSize();
  double v9 = v8;
  double v11 = v10;
  CGRectMakeWithSize();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [v5 view];
  [v20 setBounds:v13, v15, v17, v19];

  objc_opt_class();
  v21 = [v5 cardNavigationController];
  v22 = [v21 topViewController];
  v23 = BUDynamicCast();

  v24 = [v23 scrollView];
  [v24 setContentOffset:0.0, 0.0];

  double v25 = [(BKEndOfBookCardTransitionAnimationController *)self compactViewController];
  double v26 = [v25 tui_effectiveSyncLayoutController];
  v54 = v23;
  [v23 configureWithSyncLayoutController:v26];

  double v27 = v4;
  v52 = [v4 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCardStackTransitioningCoverHost includePresented:0];
  if (v52)
  {
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1001EE724;
    v72[3] = &unk_100A43D60;
    id v73 = v5;
    +[UIView performWithoutAnimation:v72];
  }
  v55 = v5;
  double v28 = dispatch_group_create();
  double v29 = [(BKEndOfBookCardTransitionAnimationController *)self cardContent];
  dispatch_group_enter(v28);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1001EE768;
  v70[3] = &unk_100A43D60;
  double v30 = v28;
  v71 = v30;
  double v31 = [v29 cardStackTransitionSuspendUpdatesAssertionUntilContentExceedsHeightWithCompletion:v70];
  double v32 = [v29 cardStackTransitionSuspendLayoutAssertion];
  [(BKEndOfBookCardTransitionAnimationController *)self setSuspendLayoutAssertion:v32];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EE770;
  block[3] = &unk_100A43D60;
  id v69 = v31;
  id v51 = v31;
  dispatch_group_notify(v30, (dispatch_queue_t)&_dispatch_main_q, block);
  id v33 = BCAugmentedExperienceSignpost();
  os_signpost_id_t v34 = os_signpost_id_generate(v33);

  v35 = BCAugmentedExperienceSignpost();
  v36 = v35;
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "EOB.CardAnimation.prepareForOpen", "", buf, 2u);
  }

  v37 = BCAugmentedExperienceSignpost();
  os_signpost_id_t v38 = os_signpost_id_generate(v37);

  v39 = BCAugmentedExperienceSignpost();
  v40 = v39;
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_BEGIN, v38, "EOB.CardAnimation.prepareForOpen.wait", "", buf, 2u);
  }

  kdebug_trace();
  v41 = dispatch_group_create();
  dispatch_group_enter(v41);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_1001EE84C;
  v65[3] = &unk_100A4B328;
  id v66 = v7;
  id v42 = v7;
  v43 = objc_retainBlock(v65);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1001EE8C0;
  v62[3] = &unk_100A43DD8;
  id v63 = v29;
  v44 = v41;
  v64 = v44;
  id v45 = v29;
  [v45 sheetTransitioningCardContentPrepareForOpenWithViewController:v4 viewSize:v43 overrideTraitsBlock:3 numEntries:v62 completion:v9];
  v46 = +[UIApplication sharedApplication];
  unsigned __int8 v47 = [v46 isRunningTest];

  v48 = dispatch_get_global_queue(25, 0);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1001EE9A0;
  v57[3] = &unk_100A4A128;
  unsigned __int8 v61 = v47;
  v58 = v44;
  id v59 = v53;
  os_signpost_id_t v60 = v38;
  id v49 = v53;
  v50 = v44;
  dispatch_async(v48, v57);

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1001EEB98;
  v56[3] = &unk_100A43EF8;
  v56[4] = v34;
  dispatch_group_notify(v50, (dispatch_queue_t)&_dispatch_main_q, v56);
}

- (void)prepareForDismissal
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001EEC98;
  v2[3] = &unk_100A43D60;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)setupAnimationsForPresentation
{
  BOOL v3 = [(BKEndOfBookCardTransitionAnimationController *)self compactViewController];
  [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x3010000000;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  v41 = &unk_10092E1A3;
  uint64_t v31 = 0;
  double v32 = &v31;
  uint64_t v33 = 0x5010000000;
  os_signpost_id_t v34 = &unk_10092E1A3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v27 = 0;
  double v28 = (double *)&v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001EEF90;
  v21[3] = &unk_100A4B350;
  v21[4] = self;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v4;
  v24 = &v27;
  id v5 = v3;
  id v23 = v5;
  double v25 = &v38;
  double v26 = &v31;
  +[UIView performWithoutAnimation:v21];
  [(BKEndOfBookCardTransitionAnimationController *)self _setupCardDropShadowForPresented:1];
  [v4 updateCardSize];
  id v6 = [(BKEndOfBookCardTransitionAnimationController *)self snapshotView];
  [v6 setupConstraintsToSuperview];

  double v7 = v28[3];
  double v8 = [(BKEndOfBookCardTransitionAnimationController *)self snapshotView];
  [v8 setSnapshotTopOffset:v7];

  if ([(BKEndOfBookCardTransitionAnimationController *)self isCoverTransition])
  {
    double v9 = v39[4];
    double v10 = v39[5];
    double v11 = [(BKEndOfBookCardTransitionAnimationController *)self coverController];
    double v12 = [v11 coverView];
    [v12 setCenter:v9, v10];

    long long v13 = *((_OWORD *)v32 + 3);
    long long v18 = *((_OWORD *)v32 + 2);
    long long v19 = v13;
    long long v20 = *((_OWORD *)v32 + 4);
    double v14 = [(BKEndOfBookCardTransitionAnimationController *)self coverController];
    double v15 = [v14 coverView];
    v17[0] = v18;
    v17[1] = v19;
    v17[2] = v20;
    [v15 setTransform:v17];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EF500;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)setupAnimationsForDismissal
{
  BOOL v3 = [(BKEndOfBookCardTransitionAnimationController *)self compactViewController];
  [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
  uint64_t v50 = 0;
  id v51 = (double *)&v50;
  uint64_t v52 = 0x3010000000;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  id v53 = &unk_10092E1A3;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x5010000000;
  v46 = &unk_10092E1A3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1001EF870;
  v38[3] = &unk_100A4B378;
  v38[4] = self;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v39 = v4;
  id v5 = v3;
  id v40 = v5;
  v41 = &v50;
  uint64_t v42 = &v43;
  +[UIView performWithoutAnimation:v38];
  [(BKEndOfBookCardTransitionAnimationController *)self _setupCardDropShadowForPresented:0];
  id v6 = [(BKEndOfBookCardTransitionAnimationController *)self snapshotView];
  [v6 setupConstraintsToSuperview];

  double v7 = [(BKEndOfBookCardTransitionAnimationController *)self snapshotView];
  [v7 snapshotTopOffset];
  double v9 = v8;

  if (v9 != 0.0)
  {
    double v10 = [v4 cardNavigationController];
    double v11 = [v10 view];
    [v11 frame];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    long long v20 = [(BKEndOfBookCardTransitionAnimationController *)self snapshotView];
    [v20 snapshotTopOffset];
    double v22 = v21;

    id v23 = [v4 cardNavigationController];
    v24 = [v23 view];
    [v24 setFrame:v13, v15 - v22, v17, v19];

    double v25 = [(BKEndOfBookCardTransitionAnimationController *)self snapshotView];
    [v25 setSnapshotTopOffset:0.0];
  }
  if ([(BKEndOfBookCardTransitionAnimationController *)self isCoverTransition])
  {
    double v26 = v51[4];
    double v27 = v51[5];
    double v28 = [(BKEndOfBookCardTransitionAnimationController *)self coverController];
    uint64_t v29 = [v28 coverView];
    [v29 setCenter:v26, v27];

    long long v30 = *((_OWORD *)v44 + 3);
    long long v35 = *((_OWORD *)v44 + 2);
    long long v36 = v30;
    long long v37 = *((_OWORD *)v44 + 4);
    uint64_t v31 = [(BKEndOfBookCardTransitionAnimationController *)self coverController];
    double v32 = [v31 coverView];
    v34[0] = v35;
    v34[1] = v36;
    v34[2] = v37;
    [v32 setTransform:v34];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EFC90;
  block[3] = &unk_100A43D60;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v50, 8);
}

- (void)finalizeAnimationsForPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKEndOfBookCardTransitionAnimationController *)self setSuspendLayoutAssertion:0];
  id v5 = [(BKEndOfBookCardTransitionAnimationController *)self cardContent];
  [v5 cardStackTransitioningCardContentFinalizeForOpen];

  [(BKEndOfBookCardTransitionAnimationController *)self setCardContent:0];

  [(BKEndOfBookCardTransitionAnimationController *)self _finalizePresentation:v3];
}

- (void)finalizeAnimationsForDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKEndOfBookCardTransitionAnimationController *)self cardContent];
  [v5 cardStackTransitioningCardContentFinalizeForDismiss];

  [(BKEndOfBookCardTransitionAnimationController *)self setCardContent:0];

  [(BKEndOfBookCardTransitionAnimationController *)self _finalizePresentation:!v3];
}

- (double)_cardInitialTopOffset
{
  objc_opt_class();
  BOOL v3 = [(BKEndOfBookCardTransitionAnimationController *)self cardViewController];
  id v4 = [v3 cardNavigationController];
  id v5 = [v4 topViewController];
  id v6 = BUDynamicCast();

  double v7 = [(BKEndOfBookCardTransitionAnimationController *)self cardContent];

  double v8 = 0.0;
  if (v7 && v6)
  {
    double v9 = [v6 content];
    double v10 = [v9 entries];
    double v11 = [v10 firstObject];

    double v12 = [v11 uuid];
    double v13 = +[TUIRenderReferenceQuery queryWithUUID:v12 uid:0 refId:@"root-box" refInstance:0];

    double v14 = [v6 renderReferencesMatchingQuery:v13];
    double v15 = [v14 allKeys];
    double v16 = [v15 firstObject];

    if (v16)
    {
      double v17 = [v14 objectForKeyedSubscript:v16];
      double v18 = [v17 firstObject];

      if (v18)
      {
        [v18 size];
        double v8 = v19;
      }
    }
  }
  return v8;
}

- (void)_animateContentCrossfade:(BOOL)a3
{
  BOOL v6 = a3;
  LODWORD(v3) = 1051260355;
  LODWORD(v4) = 1059816735;
  LODWORD(v5) = 1.0;
  double v8 = +[CAMediaTimingFunction functionWithControlPoints:v3 :0.0 :v4 :v5];
  id v9 = [objc_alloc((Class)UICubicTimingParameters) initWithCustomCurve:v8];
  id v10 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v9 timingParameters:0.12];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001F0100;
  v20[3] = &unk_100A44E60;
  v20[4] = self;
  BOOL v21 = v6;
  [v10 addAnimations:v20];
  id v11 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v9 timingParameters:0.17];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001F01C8;
  v18[3] = &unk_100A44E60;
  v18[4] = self;
  BOOL v19 = v6;
  [v11 addAnimations:v18];
  if (v6)
  {
    [v10 startAnimation];
    double v12 = 0.1;
    double v13 = v11;
  }
  else
  {
    +[UITransitionView defaultDurationForTransition:8];
    double v15 = v14;
    [v11 duration];
    [v11 startAnimationAfterDelay:v15 - v16 + -0.2];
    [v10 duration];
    double v12 = v15 - v17 + -0.1;
    double v13 = v10;
  }
  [v13 startAnimationAfterDelay:v12];
}

- (void)_removeTransitioningViews
{
  [(BKEndOfBookCardTransitionAnimationController *)self setDropShadowView:0];
  [(BKEndOfBookCardTransitionAnimationController *)self setSnapshotView:0];
  [(BKEndOfBookCardTransitionAnimationController *)self setCoverController:0];
  [(BKEndOfBookCardTransitionAnimationController *)self setCompactArtworkSource:0];

  [(BKEndOfBookCardTransitionAnimationController *)self setCardArtworkSource:0];
}

- (void)_finalizePresentation:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BKEndOfBookCardTransitionAnimationController *)self compactViewController];
  BOOL v6 = [v5 view];
  [v6 setHidden:v3];

  [(BKEndOfBookCardTransitionAnimationController *)self unhideCovers];

  [(BKEndOfBookCardTransitionAnimationController *)self _removeTransitioningViews];
}

- (void)dealloc
{
  [(BKEndOfBookCardTransitionAnimationController *)self unhideCovers];
  [(BKEndOfBookCardTransitionAnimationController *)self _removeTransitioningViews];
  v3.receiver = self;
  v3.super_class = (Class)BKEndOfBookCardTransitionAnimationController;
  [(BKEndOfBookCardTransitionAnimationController *)&v3 dealloc];
}

- (UIView)dropShadowView
{
  return self->_dropShadowView;
}

- (_BKEndOfBookCardTransitionSnapshotView)snapshotView
{
  return self->_snapshotView;
}

- (BCSheetTransitionCoverController)coverController
{
  return self->_coverController;
}

- (BKEndOfBookCompactViewController)compactViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewController);

  return (BKEndOfBookCompactViewController *)WeakRetained;
}

- (void)setCompactViewController:(id)a3
{
}

- (BKEndOfBookCardViewController)cardViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardViewController);

  return (BKEndOfBookCardViewController *)WeakRetained;
}

- (void)setCardViewController:(id)a3
{
}

- (BCSheetTransitioningCardContent)cardContent
{
  return self->_cardContent;
}

- (void)setCardContent:(id)a3
{
}

- (BCSheetTransitioningArtworkSource)compactArtworkSource
{
  return self->_compactArtworkSource;
}

- (void)setCompactArtworkSource:(id)a3
{
}

- (BCSheetTransitioningArtworkSource)cardArtworkSource
{
  return self->_cardArtworkSource;
}

- (void)setCardArtworkSource:(id)a3
{
}

- (TUIAssertion)suspendLayoutAssertion
{
  return self->_suspendLayoutAssertion;
}

- (void)setSuspendLayoutAssertion:(id)a3
{
}

- (id)compactUnhideBlock
{
  return self->_compactUnhideBlock;
}

- (void)setCompactUnhideBlock:(id)a3
{
}

- (id)cardUnhideBlock
{
  return self->_cardUnhideBlock;
}

- (void)setCardUnhideBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cardUnhideBlock, 0);
  objc_storeStrong(&self->_compactUnhideBlock, 0);
  objc_storeStrong((id *)&self->_suspendLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_cardArtworkSource, 0);
  objc_storeStrong((id *)&self->_compactArtworkSource, 0);
  objc_storeStrong((id *)&self->_cardContent, 0);
  objc_destroyWeak((id *)&self->_cardViewController);
  objc_destroyWeak((id *)&self->_compactViewController);
  objc_storeStrong((id *)&self->_coverController, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);

  objc_storeStrong((id *)&self->_dropShadowView, 0);
}

@end