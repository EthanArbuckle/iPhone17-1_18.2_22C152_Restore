@interface WBSScribbleElement
+ (BOOL)supportsSecureCoding;
- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets;
- (BOOL)isBackedByGlobalAction;
- (BOOL)isOutOfFlow;
- (BOOL)isTargetingSameElement:(id)a3;
- (CGPoint)hitTestLocationInWebView:(id)a3;
- (CGRect)geometry;
- (NSArray)allSelectorsIncludingShadowHosts;
- (NSArray)targetedElements;
- (NSSet)mediaAndLinkURLs;
- (NSString)iframeTitle;
- (NSString)imageAnalysisText;
- (NSString)renderTreeText;
- (NSString)screenReaderText;
- (NSString)searchableText;
- (NSString)selector;
- (WBSScribbleElement)initWithContentBlockerAction:(id)a3;
- (WBSScribbleElement)initWithTargetedElements:(id)a3 webView:(id)a4;
- (WBSUserDefinedContentBlockerAction)backingAction;
- (double)webViewZoomScale;
- (id)description;
- (id)makeContentBlockerAction:(int64_t)a3;
- (int64_t)positionType;
- (int64_t)scribbleStrategy;
- (unint64_t)anchor;
- (unint64_t)requestID;
- (void)_setUpWithTargetedElements:(id)a3 webView:(id)a4;
- (void)_updateEdgeInsetsAndScaleWithWebView:(id)a3;
- (void)setAllSelectorsIncludingShadowHosts:(id)a3;
- (void)setAnchor:(unint64_t)a3;
- (void)setIframeTitle:(id)a3;
- (void)setImageAnalysisText:(id)a3;
- (void)setMediaAndLinkURLs:(id)a3;
- (void)setPositionType:(int64_t)a3;
- (void)setRenderTreeText:(id)a3;
- (void)setScreenReaderText:(id)a3;
- (void)setScribbleStrategy:(int64_t)a3;
- (void)setSearchableText:(id)a3;
- (void)setTargetedElements:(id)a3;
@end

@implementation WBSScribbleElement

- (WBSScribbleElement)initWithTargetedElements:(id)a3 webView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSScribbleElement;
  v8 = [(WBSScribbleElement *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(WBSScribbleElement *)v8 _setUpWithTargetedElements:v6 webView:v7];
    [(WBSScribbleElement *)v9 _updateEdgeInsetsAndScaleWithWebView:v7];
    v10 = v9;
  }

  return v9;
}

- (void)_setUpWithTargetedElements:(id)a3 webView:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v87;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v87 != v15) {
        objc_enumerationMutation(v10);
      }
      v17 = *(void **)(*((void *)&v86 + 1) + 8 * v16);
      if (!objc_msgSend(v17, "safari_isOutOfFlow", (void)v86)) {
        break;
      }
      unsigned int v18 = [v17 isNearbyTarget];
      v13 += v18;
      v14 += v18 ^ 1;
      if (v12 == ++v16)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v86 objects:v90 count:16];
        if (v12) {
          goto LABEL_3;
        }

        if (v14 < v13)
        {
          v19 = [v10 firstObject];
          v90[0] = MEMORY[0x1E4F143A8];
          v90[1] = 3221225472;
          v90[2] = __collectElementsToHide_block_invoke;
          v90[3] = &unk_1E5E45270;
          id v91 = v19;
          id v92 = v9;
          id v20 = v19;
          v21 = objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v90);

          goto LABEL_21;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  v22 = objc_msgSend(v10, "firstObject", (void)v86);
  [v22 bounds];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  v21 = objc_opt_new();
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v20 = v10;
  uint64_t v31 = [v20 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v87;
LABEL_14:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v87 != v33) {
        objc_enumerationMutation(v20);
      }
      v35 = *(void **)(*((void *)&v86 + 1) + 8 * v34);
      [v35 bounds];
      if (!targetedElementRectsAreSimilar(v24, v26, v28, v30, v36, v37, v38, v39)
        && !objc_msgSend(v35, "safari_isProbablyFullPageModalOverlay:", v9))
      {
        break;
      }
      [v21 addObject:v35];
      if (v32 == ++v34)
      {
        uint64_t v32 = [v20 countByEnumeratingWithState:&v86 objects:v90 count:16];
        if (v32) {
          goto LABEL_14;
        }
        break;
      }
    }
  }
LABEL_21:

  v40 = [v21 firstObject];
  id v41 = v21;
  id v42 = v9;
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v47 = [v41 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v87;
    char v50 = 1;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v87 != v49) {
          objc_enumerationMutation(v41);
        }
        v52 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        if ((v50 & 1) != 0
          || (objc_msgSend(*(id *)(*((void *)&v86 + 1) + 8 * i), "safari_isProbablyFullPageModalOverlay:", v42) & 1) == 0)
        {
          [v52 bounds];
          v96.origin.CGFloat x = v53;
          v96.origin.CGFloat y = v54;
          v96.size.CGFloat width = v55;
          v96.size.CGFloat height = v56;
          v94.origin.CGFloat x = x;
          v94.origin.CGFloat y = y;
          v94.size.CGFloat width = width;
          v94.size.CGFloat height = height;
          CGRect v95 = CGRectUnion(v94, v96);
          CGFloat x = v95.origin.x;
          CGFloat y = v95.origin.y;
          CGFloat width = v95.size.width;
          CGFloat height = v95.size.height;
        }
        char v50 = 0;
      }
      uint64_t v48 = [v41 countByEnumeratingWithState:&v86 objects:v90 count:16];
      char v50 = 0;
    }
    while (v48);
  }

  self->_geometry.origin.CGFloat x = x;
  self->_geometry.origin.CGFloat y = y;
  self->_geometry.size.CGFloat width = width;
  self->_geometry.size.CGFloat height = height;
  v57 = [v40 selectors];
  uint64_t v58 = [v57 firstObject];
  v59 = (void *)v58;
  if (v58) {
    v60 = (__CFString *)v58;
  }
  else {
    v60 = &stru_1F031A860;
  }
  objc_storeStrong((id *)&self->_selector, v60);

  v61 = [v40 renderedText];
  renderTreeText = self->_renderTreeText;
  self->_renderTreeText = v61;

  v63 = [v40 searchableText];
  searchableText = self->_searchableText;
  self->_searchableText = v63;

  v65 = [v40 screenReaderText];
  screenReaderText = self->_screenReaderText;
  self->_screenReaderText = v65;

  self->_anchor = [v40 offsetEdges];
  self->_positionType = [v40 positionType];
  id v67 = v41;
  v68 = (NSArray *)objc_opt_new();
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v69 = v67;
  uint64_t v70 = [v69 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v71; ++j)
      {
        if (*(void *)v87 != v72) {
          objc_enumerationMutation(v69);
        }
        v74 = objc_msgSend(*(id *)(*((void *)&v86 + 1) + 8 * j), "safari_uniqueSelectorsIncludingShadowHosts");
        if ([v74 count]) {
          [(NSArray *)v68 addObject:v74];
        }
      }
      uint64_t v71 = [v69 countByEnumeratingWithState:&v86 objects:v90 count:16];
    }
    while (v71);
  }

  allSelectorsIncludingShadowHosts = self->_allSelectorsIncludingShadowHosts;
  self->_allSelectorsIncludingShadowHosts = v68;

  id v76 = v69;
  v77 = (NSSet *)objc_opt_new();
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v78 = (NSArray *)v76;
  uint64_t v79 = [(NSArray *)v78 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v87;
    do
    {
      for (uint64_t k = 0; k != v80; ++k)
      {
        if (*(void *)v87 != v81) {
          objc_enumerationMutation(v78);
        }
        v83 = [*(id *)(*((void *)&v86 + 1) + 8 * k) mediaAndLinkURLs];
        if ([v83 count]) {
          [(NSSet *)v77 unionSet:v83];
        }
      }
      uint64_t v80 = [(NSArray *)v78 countByEnumeratingWithState:&v86 objects:v90 count:16];
    }
    while (v80);
  }

  mediaAndLinkURLs = self->_mediaAndLinkURLs;
  self->_mediaAndLinkURLs = v77;

  targetedElements = self->_targetedElements;
  self->_targetedElements = v78;
}

- (void)_updateEdgeInsetsAndScaleWithWebView:(id)a3
{
  id v16 = a3;
  [v16 bounds];
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  CGFloat v11 = v7;
  unint64_t anchor = self->_anchor;
  if (anchor)
  {
    self->_edgeInsets.left = self->_geometry.origin.x;
    if ((anchor & 2) == 0)
    {
LABEL_3:
      if ((anchor & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((anchor & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_edgeInsets.top = self->_geometry.origin.y;
  if ((anchor & 4) == 0)
  {
LABEL_4:
    if ((anchor & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  double MaxX = CGRectGetMaxX(*(CGRect *)&v4);
  self->_edgeInsets.right = MaxX - CGRectGetMaxX(self->_geometry);
  if ((self->_anchor & 8) != 0)
  {
LABEL_5:
    v18.origin.CGFloat x = v8;
    v18.origin.CGFloat y = v9;
    v18.size.CGFloat width = v10;
    v18.size.CGFloat height = v11;
    double MaxY = CGRectGetMaxY(v18);
    self->_edgeInsets.bottom = MaxY - CGRectGetMaxY(self->_geometry);
  }
LABEL_6:
  objc_msgSend(v16, "safari_zoomScale");
  self->_webViewZoomScale = v14;
}

- (WBSScribbleElement)initWithContentBlockerAction:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)WBSScribbleElement;
  double v6 = [(WBSScribbleElement *)&v33 init];
  if (v6)
  {
    uint64_t v7 = [v5 selector];
    selector = v6->_selector;
    v6->_selector = (NSString *)v7;

    uint64_t v9 = [v5 renderTreeText];
    renderTreeText = v6->_renderTreeText;
    v6->_renderTreeText = (NSString *)v9;

    uint64_t v11 = [v5 searchableText];
    searchableText = v6->_searchableText;
    v6->_searchableText = (NSString *)v11;

    uint64_t v13 = [v5 screenReaderText];
    screenReaderText = v6->_screenReaderText;
    v6->_screenReaderText = (NSString *)v13;

    uint64_t v15 = [v5 imageAnalysisText];
    imageAnalysisText = v6->_imageAnalysisText;
    v6->_imageAnalysisText = (NSString *)v15;

    v6->_unint64_t anchor = [v5 edgeAnchors];
    uint64_t v17 = [v5 allSelectorsIncludingShadowHosts];
    allSelectorsIncludingShadowHosts = v6->_allSelectorsIncludingShadowHosts;
    v6->_allSelectorsIncludingShadowHosts = (NSArray *)v17;

    uint64_t v19 = [v5 mediaAndLinkURLs];
    mediaAndLinkURLs = v6->_mediaAndLinkURLs;
    v6->_mediaAndLinkURLs = (NSSet *)v19;

    v6->_positionType = [v5 positionType];
    [v5 bounds];
    v6->_geometry.origin.CGFloat x = v21;
    v6->_geometry.origin.CGFloat y = v22;
    v6->_geometry.size.CGFloat width = v23;
    v6->_geometry.size.CGFloat height = v24;
    double v25 = [v5 typeString];
    v6->_scribbleStrategCGFloat y = [v25 isEqualToString:*MEMORY[0x1E4F988F8]] ^ 1;

    [v5 edgeInsets];
    v6->_edgeInsets.left = v26;
    v6->_edgeInsets.top = v27;
    v6->_edgeInsets.right = v28;
    v6->_edgeInsets.bottom = v29;
    [v5 viewZoomScale];
    v6->_webViewZoomScale = v30;
    objc_storeStrong((id *)&v6->_backingAction, a3);
    uint64_t v31 = v6;
  }

  return v6;
}

- (BOOL)isBackedByGlobalAction
{
  return [(WBSUserDefinedContentBlockerAction *)self->_backingAction isGlobal];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(WBSScribbleElement *)self selector];
  double v6 = [v3 stringWithFormat:@"<%@ %p sel=%@>", v4, self, v5];

  return v6;
}

- (id)makeContentBlockerAction:(int64_t)a3
{
  id v5 = (id *)MEMORY[0x1E4F988F8];
  if (self->_scribbleStrategy) {
    id v5 = (id *)MEMORY[0x1E4F98900];
  }
  double v6 = (objc_class *)MEMORY[0x1E4F98428];
  id v7 = *v5;
  CGFloat v8 = (void *)[[v6 alloc] initWithSelector:self->_selector type:v7 isGlobal:a3 == 1];
  [v8 setRenderTreeText:self->_renderTreeText];
  [v8 setSearchableText:self->_searchableText];
  [v8 setScreenReaderText:self->_screenReaderText];
  [v8 setImageAnalysisText:self->_imageAnalysisText];
  [v8 setEdgeAnchors:self->_anchor];
  [v8 setAllSelectorsIncludingShadowHosts:self->_allSelectorsIncludingShadowHosts];
  [v8 setMediaAndLinkURLs:self->_mediaAndLinkURLs];

  [v8 setPositionType:self->_positionType];
  objc_msgSend(v8, "setBounds:", self->_geometry.origin.x, self->_geometry.origin.y, self->_geometry.size.width, self->_geometry.size.height);
  [v8 setViewZoomScale:self->_webViewZoomScale];
  objc_msgSend(v8, "setEdgeInsets:", self->_edgeInsets.left, self->_edgeInsets.top, self->_edgeInsets.right, self->_edgeInsets.bottom);
  return v8;
}

- (BOOL)isOutOfFlow
{
  unint64_t v2 = [(WBSScribbleElement *)self positionType];
  return positionTypeIsOutOfFlow(v2);
}

- (CGPoint)hitTestLocationInWebView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  CGFloat v41 = v5;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGFloat x = self->_geometry.origin.x;
  CGFloat y = self->_geometry.origin.y;
  CGFloat width = self->_geometry.size.width;
  CGFloat height = self->_geometry.size.height;
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v46);
  objc_msgSend(v4, "safari_zoomScale");
  double v17 = v16;

  if (![(WBSScribbleElement *)self isOutOfFlow] || (v40 = v11, (unint64_t anchor = self->_anchor) == 0))
  {
    double v26 = MidX;
LABEL_12:
    double v35 = MidY;
    goto LABEL_13;
  }
  double top = self->_edgeInsets.top;
  double right = self->_edgeInsets.right;
  double bottom = self->_edgeInsets.bottom;
  CGFloat v19 = x;
  CGFloat v20 = y;
  CGFloat v21 = width;
  CGFloat v22 = height;
  if (anchor)
  {
    double left = self->_edgeInsets.left;
    v47.origin.CGFloat x = v19;
    v47.origin.CGFloat y = v20;
    v47.size.CGFloat width = v21;
    v47.size.CGFloat height = v22;
    double MidX = v17 * (left + CGRectGetWidth(v47) * 0.5);
    unint64_t anchor = self->_anchor;
  }
  CGFloat v24 = v7;
  if ((anchor & 2) != 0)
  {
    v48.origin.CGFloat x = v19;
    v48.origin.CGFloat y = v20;
    v48.size.CGFloat width = v21;
    v48.size.CGFloat height = v22;
    double MidY = v17 * (top + CGRectGetHeight(v48) * 0.5);
    unint64_t anchor = self->_anchor;
  }
  CGFloat v25 = v9;
  double v26 = MidX;
  if ((anchor & 4) != 0)
  {
    v49.size.CGFloat height = v40;
    v49.origin.CGFloat x = v41;
    v49.origin.CGFloat y = v24;
    v49.size.CGFloat width = v25;
    double MaxX = CGRectGetMaxX(v49);
    v50.origin.CGFloat x = v19;
    v50.origin.CGFloat y = v20;
    v50.size.CGFloat width = v21;
    v50.size.CGFloat height = v22;
    double v26 = MaxX - v17 * (right + CGRectGetWidth(v50) * 0.5);
    unint64_t anchor = self->_anchor;
  }
  CGFloat v29 = v40;
  CGFloat v28 = v41;
  if ((anchor & 8) == 0) {
    goto LABEL_12;
  }
  CGFloat v30 = v24;
  CGFloat v31 = v25;
  CGFloat MaxY = CGRectGetMaxY(*(CGRect *)&v28);
  CGFloat v33 = v19;
  double v34 = MaxY;
  v51.origin.CGFloat x = v33;
  v51.origin.CGFloat y = v20;
  v51.size.CGFloat width = v21;
  v51.size.CGFloat height = v22;
  double v35 = v34 - v17 * (bottom + CGRectGetHeight(v51) * 0.5);
LABEL_13:
  double v36 = v26;
  result.CGFloat y = v35;
  result.CGFloat x = v36;
  return result;
}

- (BOOL)isTargetingSameElement:(id)a3
{
  id v4 = [a3 targetedElements];
  double v5 = [v4 firstObject];

  if (v5)
  {
    double v6 = [(WBSScribbleElement *)self targetedElements];
    double v7 = [v6 firstObject];
    char v8 = [v7 isSameElement:v5];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (WBSUserDefinedContentBlockerAction)backingAction
{
  return self->_backingAction;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSString)selector
{
  return self->_selector;
}

- (CGRect)geometry
{
  double x = self->_geometry.origin.x;
  double y = self->_geometry.origin.y;
  double width = self->_geometry.size.width;
  double height = self->_geometry.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)iframeTitle
{
  return self->_iframeTitle;
}

- (void)setIframeTitle:(id)a3
{
}

- (NSString)renderTreeText
{
  return self->_renderTreeText;
}

- (void)setRenderTreeText:(id)a3
{
}

- (NSString)imageAnalysisText
{
  return self->_imageAnalysisText;
}

- (void)setImageAnalysisText:(id)a3
{
}

- (NSString)searchableText
{
  return self->_searchableText;
}

- (void)setSearchableText:(id)a3
{
}

- (NSString)screenReaderText
{
  return self->_screenReaderText;
}

- (void)setScreenReaderText:(id)a3
{
}

- (unint64_t)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(unint64_t)a3
{
  self->_unint64_t anchor = a3;
}

- (int64_t)positionType
{
  return self->_positionType;
}

- (void)setPositionType:(int64_t)a3
{
  self->_positionType = a3;
}

- (NSArray)allSelectorsIncludingShadowHosts
{
  return self->_allSelectorsIncludingShadowHosts;
}

- (void)setAllSelectorsIncludingShadowHosts:(id)a3
{
}

- (NSSet)mediaAndLinkURLs
{
  return self->_mediaAndLinkURLs;
}

- (void)setMediaAndLinkURLs:(id)a3
{
}

- (int64_t)scribbleStrategy
{
  return self->_scribbleStrategy;
}

- (void)setScribbleStrategy:(int64_t)a3
{
  self->_scribbleStrategdouble y = a3;
}

- (NSArray)targetedElements
{
  return self->_targetedElements;
}

- (void)setTargetedElements:(id)a3
{
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets
{
  double left = self->_edgeInsets.left;
  double top = self->_edgeInsets.top;
  double right = self->_edgeInsets.right;
  double bottom = self->_edgeInsets.bottom;
  result.var3 = bottom;
  result.var2 = right;
  result.var1 = top;
  result.var0 = left;
  return result;
}

- (double)webViewZoomScale
{
  return self->_webViewZoomScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedElements, 0);
  objc_storeStrong((id *)&self->_mediaAndLinkURLs, 0);
  objc_storeStrong((id *)&self->_allSelectorsIncludingShadowHosts, 0);
  objc_storeStrong((id *)&self->_screenReaderText, 0);
  objc_storeStrong((id *)&self->_searchableText, 0);
  objc_storeStrong((id *)&self->_imageAnalysisText, 0);
  objc_storeStrong((id *)&self->_renderTreeText, 0);
  objc_storeStrong((id *)&self->_iframeTitle, 0);
  objc_storeStrong((id *)&self->_selector, 0);
  objc_storeStrong((id *)&self->_backingAction, 0);
}

@end