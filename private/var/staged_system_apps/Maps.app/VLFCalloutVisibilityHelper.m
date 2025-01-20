@interface VLFCalloutVisibilityHelper
+ (void)updateVLFBannerVisibilityWithChromeViewController:(id)a3 floatingControlsViewController:(id)a4;
@end

@implementation VLFCalloutVisibilityHelper

+ (void)updateVLFBannerVisibilityWithChromeViewController:(id)a3 floatingControlsViewController:(id)a4
{
  id v93 = a3;
  id v5 = a4;
  unsigned int v6 = +[VLFSessionTask isVLFModeSupported];
  if (v5 && v93 && v6)
  {
    v7 = [v93 userLocationView];
    v8 = [v7 vlfPuckModeCircleView];
    v9 = [v93 userLocationView];
    v10 = [v9 vlfPuckModeCircleView];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [v93 view];
    [v8 convertRect:v19 toView:v12];
    CGFloat v91 = v21;
    CGFloat v92 = v20;
    CGFloat v89 = v23;
    CGFloat v90 = v22;

    v24 = [v93 userLocationView];
    v25 = [v24 _calloutView];
    v26 = [v93 userLocationView];
    v27 = [v26 _calloutView];
    [v27 bounds];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    v36 = [v93 view];
    [v25 convertRect:v36 toView:v29];
    CGFloat v87 = v38;
    CGFloat v88 = v37;
    CGFloat v85 = v40;
    CGFloat v86 = v39;

    v41 = [v5 view];
    [v5 floatingButtonsFrame];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    v50 = [v93 view];
    [v41 convertRect:v50 toView:v43];
    CGFloat v52 = v51;
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    CGFloat v58 = v57;

    v59 = [v93 _currentContainerViewController];
    v60 = [v59 currentViewController];
    v61 = v60;
    if (v60)
    {
      v62 = [v60 view];
      v63 = [v61 view];
      [v63 bounds];
      double v65 = v64;
      double v67 = v66;
      double v69 = v68;
      double v71 = v70;
      v72 = [v93 view];
      [v62 convertRect:v72 toView:v65];
      CGFloat x = v73;
      CGFloat y = v75;
      CGFloat width = v77;
      CGFloat height = v79;
    }
    else
    {
      CGFloat x = CGRectNull.origin.x;
      CGFloat y = CGRectNull.origin.y;
      CGFloat width = CGRectNull.size.width;
      CGFloat height = CGRectNull.size.height;
    }
    v95.origin.CGFloat y = v91;
    v95.origin.CGFloat x = v92;
    v95.size.CGFloat height = v89;
    v95.size.CGFloat width = v90;
    v101.origin.CGFloat x = v52;
    v101.origin.CGFloat y = v54;
    v101.size.CGFloat width = v56;
    v101.size.CGFloat height = v58;
    if (CGRectIntersectsRect(v95, v101))
    {
      BOOL v81 = 1;
    }
    else
    {
      v96.origin.CGFloat x = x;
      v96.origin.CGFloat y = y;
      v96.size.CGFloat width = width;
      v96.size.CGFloat height = height;
      if (CGRectIsNull(v96))
      {
        BOOL v81 = 0;
      }
      else
      {
        v97.origin.CGFloat y = v91;
        v97.origin.CGFloat x = v92;
        v97.size.CGFloat height = v89;
        v97.size.CGFloat width = v90;
        v102.origin.CGFloat x = x;
        v102.origin.CGFloat y = y;
        v102.size.CGFloat width = width;
        v102.size.CGFloat height = height;
        BOOL v81 = CGRectIntersectsRect(v97, v102);
      }
    }
    v98.origin.CGFloat y = v87;
    v98.origin.CGFloat x = v88;
    v98.size.CGFloat height = v85;
    v98.size.CGFloat width = v86;
    v103.origin.CGFloat x = v52;
    v103.origin.CGFloat y = v54;
    v103.size.CGFloat width = v56;
    v103.size.CGFloat height = v58;
    if (CGRectIntersectsRect(v98, v103))
    {
      BOOL v82 = 1;
    }
    else
    {
      v99.origin.CGFloat x = x;
      v99.origin.CGFloat y = y;
      v99.size.CGFloat width = width;
      v99.size.CGFloat height = height;
      if (CGRectIsNull(v99))
      {
        BOOL v82 = 0;
      }
      else
      {
        v100.origin.CGFloat y = v87;
        v100.origin.CGFloat x = v88;
        v100.size.CGFloat height = v85;
        v100.size.CGFloat width = v86;
        v104.origin.CGFloat x = x;
        v104.origin.CGFloat y = y;
        v104.size.CGFloat width = width;
        v104.size.CGFloat height = height;
        BOOL v82 = CGRectIntersectsRect(v100, v104);
      }
    }
    uint64_t v83 = v81 | v82;
    v84 = [v93 userLocationView];
    [v84 setVlfOverlappingFloatingControls:v83];
  }
}

@end