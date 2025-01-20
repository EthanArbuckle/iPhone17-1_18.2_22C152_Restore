@interface NSLayoutManager(WFSizing)
- (double)wf_calculateIntrinsicHeightForWidth:()WFSizing textContainer:;
- (id)wf_controlView;
- (void)wf_setControlView:()WFSizing;
@end

@implementation NSLayoutManager(WFSizing)

- (void)wf_setControlView:()WFSizing
{
}

- (id)wf_controlView
{
  return objc_getAssociatedObject(a1, sel_wf_controlView);
}

- (double)wf_calculateIntrinsicHeightForWidth:()WFSizing textContainer:
{
  id v6 = a4;
  uint64_t v7 = [v6 widthTracksTextView];
  uint64_t v8 = [v6 heightTracksTextView];
  [v6 size];
  double v10 = v9;
  double v12 = v11;
  [v6 setWidthTracksTextView:0];
  [v6 setHeightTracksTextView:0];
  objc_msgSend(v6, "setSize:", a2, 1.79769313e308);
  [a1 ensureLayoutForTextContainer:v6];
  [a1 usedRectForTextContainer:v6];
  CGFloat v14 = v13;
  uint64_t v15 = [a1 glyphRangeForTextContainer:v6];
  objc_msgSend(a1, "boundingRectForGlyphRange:inTextContainer:", v15, v16, v6);
  v21.size.double height = v18 - v17;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v21.size.width = v14;
  v24.size.width = a2;
  v24.size.double height = 1.79769313e308;
  CGRect v22 = CGRectIntersection(v21, v24);
  CGRect v23 = CGRectIntegral(v22);
  double height = v23.size.height;
  objc_msgSend(v6, "setWidthTracksTextView:", v7, v23.origin.x, v23.origin.y, v23.size.width);
  [v6 setHeightTracksTextView:v8];
  objc_msgSend(v6, "setSize:", v10, v12);

  return height;
}

@end