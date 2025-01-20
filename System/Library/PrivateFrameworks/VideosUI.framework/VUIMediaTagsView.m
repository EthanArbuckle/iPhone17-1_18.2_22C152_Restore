@interface VUIMediaTagsView
+ (id)tagsViewWithMetadata:(id)a3 layout:(id)a4 existingView:(id)a5;
- (BOOL)_shouldApplyTintColor:(id)a3 forImage:(id)a4;
- (BOOL)elementsArePlacedOnIndividualLines;
- (BOOL)isSelected;
- (CGSize)_layoutSubviewsForSize:(CGSize)a3 computationOnly:(BOOL)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSArray)groupedSubviews;
- (NSDictionary)viewsMap;
- (UIImage)commonSenseDarkImage;
- (UIImage)commonSenseLightImage;
- (VUIMediaTagsView)initWithFrame:(CGRect)a3 layout:(id)a4;
- (VUIMediaTagsViewLayout)tagsViewLayout;
- (double)_totalSubviewsWidth;
- (double)bottomMarginToLabel:(id)a3 withBaselineMargin:(double)a4;
- (double)bottomMarginWithBaselineMargin:(double)a3;
- (double)firstBaselineOffsetFromTop;
- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4;
- (double)topMarginWithBaselineMargin:(double)a3;
- (double)totalSubviewsWidth;
- (double)vuiBaselineHeight;
- (double)vui_baselineOffsetFromBottom;
- (id)_firstLabelSubview;
- (id)_newImageViewAsSubview:(BOOL)a3;
- (id)_newLabelAsSubview:(id)a3 textLayout:(id)a4;
- (id)_newLabelAsSubview:(id)a3 withAttributedString:(id)a4 textLayout:(id)a5;
- (id)_newRentalExpirationlabel:(id)a3 exisitingLabel:(id)a4;
- (id)_newTextBadgeViewAsSubview:(id)a3 layout:(id)a4 withString:(id)a5;
- (id)_textLayoutForKey:(id)a3;
- (void)_addGenreLabelAndSeparator;
- (void)_adjustViewsPositionFor:(id)a3 preferredSize:(CGSize)a4;
- (void)_adjustViewsPositionFor:(id)a3 topPadding:(double)a4;
- (void)_adjustViewsPositionVerticallyCenteredFor:(id)a3 preferredSize:(CGSize)a4;
- (void)_removeGenreLabelAndSeparator;
- (void)_removeSeparatorsFromGroupsIfNeeded:(BOOL)a3;
- (void)_updateAppearanceWithUserInterfaceStyle:(unint64_t)a3;
- (void)_updateImageAppearanceWithUserInterfaceStyle:(unint64_t)a3;
- (void)contrastSettingsDidChange;
- (void)dealloc;
- (void)setCommonSenseDarkImage:(id)a3;
- (void)setCommonSenseLightImage:(id)a3;
- (void)setGroupedSubviews:(id)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setTotalSubviewsWidth:(double)a3;
- (void)setViewsMap:(id)a3;
- (void)transparencySettingsDidChange;
- (void)updateWithMetadata:(id)a3;
- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
@end

@implementation VUIMediaTagsView

+ (id)tagsViewWithMetadata:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (VUIMediaTagsView *)v8;
  }
  else
  {
    v11 = [VUIMediaTagsView alloc];
    v10 = -[VUIMediaTagsView initWithFrame:layout:](v11, "initWithFrame:layout:", v7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v12 = v10;
  v13 = [[VUIMediaTagsViewHelper alloc] initWithContentMetadata:v9 additionalMetadata:0];

  v14 = [(VUIMediaTagsViewHelper *)v13 tagsViewDictionary];
  [(VUIMediaTagsView *)v12 updateWithMetadata:v14];

  return v12;
}

- (VUIMediaTagsView)initWithFrame:(CGRect)a3 layout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v35.receiver = self;
  v35.super_class = (Class)VUIMediaTagsView;
  v11 = -[VUIMediaTagsView initWithFrame:](&v35, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_tagsViewLayout = (id *)&v11->_tagsViewLayout;
    objc_storeStrong((id *)&v11->_tagsViewLayout, a4);
    viewsMap = v12->_viewsMap;
    v12->_viewsMap = (NSDictionary *)MEMORY[0x1E4F1CC08];

    groupedSubviews = v12->_groupedSubviews;
    v12->_groupedSubviews = (NSArray *)MEMORY[0x1E4F1CBF0];

    v12->_isSelected = 0;
    [(VUIMediaTagsView *)v12 setVuiClipsToBounds:1];
    v16 = [*p_tagsViewLayout compositingFilter];

    if (v16)
    {
      v17 = [*p_tagsViewLayout compositingFilter];
      v18 = [(VUIMediaTagsView *)v12 layer];
      [v18 setCompositingFilter:v17];
    }
    [(VUIMediaTagsView *)v12 setAccessibilityTraits:*MEMORY[0x1E4FB25A0] | *MEMORY[0x1E4FB2558]];
    objc_initWeak(&location, v12);
    v38[0] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __41__VUIMediaTagsView_initWithFrame_layout___block_invoke;
    v32[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v33, &location);
    [(VUIMediaTagsView *)v12 vui_registerForTraitChanges:v19 withHandler:v32];

    uint64_t v37 = objc_opt_class();
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __41__VUIMediaTagsView_initWithFrame_layout___block_invoke_2;
    v30[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v31, &location);
    [(VUIMediaTagsView *)v12 vui_registerForTraitChanges:v20 withHandler:v30];

    uint64_t v36 = objc_opt_class();
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __41__VUIMediaTagsView_initWithFrame_layout___block_invoke_3;
    v28 = &unk_1E6DF4CB0;
    objc_copyWeak(&v29, &location);
    [(VUIMediaTagsView *)v12 vui_registerForTraitChanges:v21 withHandler:&v25];

    v22 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v25, v26, v27, v28);
    [v22 addObserver:v12 selector:sel_contrastSettingsDidChange name:*MEMORY[0x1E4FB2438] object:0];

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v12 selector:sel_transparencySettingsDidChange name:*MEMORY[0x1E4FB24A8] object:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __41__VUIMediaTagsView_initWithFrame_layout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained vuiTraitCollection];
  uint64_t v2 = [v1 vuiUserInterfaceStyle];

  [WeakRetained _updateAppearanceWithUserInterfaceStyle:v2];
}

void __41__VUIMediaTagsView_initWithFrame_layout___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained vuiTraitCollection];
  uint64_t v2 = [v1 vuiUserInterfaceStyle];

  [WeakRetained _updateAppearanceWithUserInterfaceStyle:v2];
  v3 = [WeakRetained tagsViewLayout];
  [v3 updateHighMotionFontSize];

  objc_msgSend(WeakRetained, "vui_setNeedsLayout");
  [WeakRetained invalidateIntrinsicContentSize];
}

void __41__VUIMediaTagsView_initWithFrame_layout___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vui_setNeedsLayout");
  [WeakRetained invalidateIntrinsicContentSize];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2438] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];

  v5.receiver = self;
  v5.super_class = (Class)VUIMediaTagsView;
  [(VUIMediaTagsView *)&v5 dealloc];
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  id v8 = [(VUIMediaTagsView *)self tagsViewLayout];
  [v8 maxWidth];
  double v10 = v9;

  if (v10 > 0.0)
  {
    v11 = [(VUIMediaTagsView *)self tagsViewLayout];
    [v11 maxWidth];
    double v13 = v12;

    if (width >= v13) {
      double width = v13;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)VUIMediaTagsView;
  -[VUIMediaTagsView vui_layoutSubviews:computationOnly:](&v16, sel_vui_layoutSubviews_computationOnly_, v4, width, height);
  -[VUIMediaTagsView _layoutSubviewsForSize:computationOnly:](self, "_layoutSubviewsForSize:computationOnly:", v4, width, height);
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)_layoutSubviewsForSize:(CGSize)a3 computationOnly:(BOOL)a4
{
  BOOL v212 = a4;
  CGFloat height = a3.height;
  double width = a3.width;
  uint64_t v295 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(VUIMediaTagsView *)self tagsViewLayout];
  v209 = [v5 textLayout];

  BOOL rect1 = [(VUIMediaTagsView *)self elementsArePlacedOnIndividualLines];
  v6 = [(VUIMediaTagsView *)self tagsViewLayout];
  int v207 = [v6 orphanAvoidance];

  uint64_t v288 = 0;
  v289 = (double *)&v288;
  uint64_t v290 = 0x2020000000;
  uint64_t v291 = 0;
  uint64_t v284 = 0;
  v285 = (double *)&v284;
  uint64_t v286 = 0x2020000000;
  uint64_t v287 = 0;
  v282[0] = 0;
  v282[1] = v282;
  v282[2] = 0x3032000000;
  v282[3] = __Block_byref_object_copy__16;
  v282[4] = __Block_byref_object_dispose__16;
  id v283 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v280[0] = 0;
  v280[1] = v280;
  v280[2] = 0x3032000000;
  v280[3] = __Block_byref_object_copy__16;
  v280[4] = __Block_byref_object_dispose__16;
  id v281 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v278[0] = 0;
  v278[1] = v278;
  v278[2] = 0x3032000000;
  v278[3] = __Block_byref_object_copy__16;
  v278[4] = __Block_byref_object_dispose__16;
  id v279 = 0;
  uint64_t v272 = 0;
  v273 = &v272;
  uint64_t v274 = 0x4010000000;
  v275 = &unk_1E3ADDC25;
  id v7 = (CGFloat *)MEMORY[0x1E4F1DB28];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v221 = *MEMORY[0x1E4F1DB28];
  long long v276 = *MEMORY[0x1E4F1DB28];
  long long v277 = v8;
  long long v217 = v8;
  v271[0] = 0;
  v271[1] = v271;
  v271[2] = 0x2020000000;
  v271[3] = 0;
  v270[0] = 0;
  v270[1] = v270;
  v270[2] = 0x2020000000;
  v270[3] = 0;
  double v9 = [(VUIMediaTagsView *)self tagsViewLayout];
  char v10 = [v9 isWrappingAllowed];

  if ((v10 & 1) == 0)
  {
    [(VUIMediaTagsView *)self totalSubviewsWidth];
    if (v11 <= width) {
      [(VUIMediaTagsView *)self _addGenreLabelAndSeparator];
    }
    else {
      [(VUIMediaTagsView *)self _removeGenreLabelAndSeparator];
    }
  }
  v268[0] = 0;
  v268[1] = v268;
  v268[2] = 0x3032000000;
  v268[3] = __Block_byref_object_copy__16;
  v268[4] = __Block_byref_object_dispose__16;
  id v269 = 0;
  v265[0] = 0;
  v265[1] = v265;
  v265[2] = 0x4010000000;
  v265[3] = &unk_1E3ADDC25;
  long long v266 = v221;
  long long v267 = v217;
  uint64_t v260 = 0;
  v261 = (double *)&v260;
  uint64_t v262 = 0x3010000000;
  v263 = &unk_1E3ADDC25;
  long long v264 = *MEMORY[0x1E4F1DB30];
  uint64_t v254 = 0;
  v255 = &v254;
  uint64_t v256 = 0x3032000000;
  v257 = __Block_byref_object_copy__16;
  v258 = __Block_byref_object_dispose__16;
  id v259 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x3032000000;
  v251 = __Block_byref_object_copy__16;
  v252 = __Block_byref_object_dispose__16;
  id v253 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(id)v255[5] addObject:v249[5]];
  uint64_t v242 = 0;
  v243 = &v242;
  uint64_t v244 = 0x3032000000;
  v245 = __Block_byref_object_copy__16;
  v246 = __Block_byref_object_dispose__16;
  id v247 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIMediaTagsView__layoutSubviewsForSize_computationOnly___block_invoke;
  aBlock[3] = &unk_1E6DF9038;
  objc_copyWeak(v238, &location);
  v238[1] = *(id *)&width;
  v238[2] = *(id *)&height;
  BOOL v239 = rect1;
  aBlock[6] = v278;
  aBlock[7] = &v272;
  BOOL v240 = v212;
  aBlock[8] = &v284;
  aBlock[9] = v268;
  aBlock[5] = &v288;
  aBlock[4] = self;
  aBlock[10] = v270;
  aBlock[11] = v271;
  aBlock[12] = v282;
  aBlock[13] = v280;
  aBlock[14] = &v260;
  aBlock[15] = v265;
  aBlock[16] = &v248;
  aBlock[17] = &v254;
  v211 = (double (**)(void *, void *, void, BOOL, uint64_t, double, double, double, double, double, double, double))_Block_copy(aBlock);
  unint64_t v12 = 0;
  CGFloat v215 = v7[1];
  CGFloat v218 = *v7;
  CGFloat v213 = v7[2];
  CGFloat v214 = v7[3];
  double v13 = 0.0;
  while (1)
  {
    double v14 = [(VUIMediaTagsView *)self groupedSubviews];
    unint64_t v205 = v12;
    BOOL v15 = v12 < [v14 count];

    if (!v15) {
      break;
    }
    objc_super v16 = [(VUIMediaTagsView *)self groupedSubviews];
    v17 = [v16 objectAtIndexedSubscript:v205];

    long long v235 = 0u;
    long long v236 = 0u;
    long long v233 = 0u;
    long long v234 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v233 objects:v294 count:16];
    if (v19)
    {
      int v20 = 0;
      uint64_t v222 = *(void *)v234;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v234 != v222) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v233 + 1) + 8 * v21);
          v23 = [v18 firstObject];

          double v24 = 0.0;
          if ([v22 isHidden])
          {
LABEL_13:
            double v25 = v213;
            double v26 = v214;
            double v28 = v215;
            double v27 = v218;
            goto LABEL_49;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v209 margin];
            double v24 = v29;
            uint64_t v30 = [v22 tag];
            if ((unint64_t)(v30 - 101) < 0xA) {
              v20 |= 0x327u >> (v30 - 101);
            }
            [(VUIMediaTagsView *)self bounds];
            double v35 = v211[2](v211, v22, v20 & 1, v23 == v22, [(VUIMediaTagsView *)self vuiIsRTL], v24, 0.0, 0.0, v31, v32, v33, v34);
            double v27 = v35;
            double v28 = v36;
            double v25 = v37;
            double v26 = v38;
            if (v212)
            {
              if (!v207) {
                goto LABEL_49;
              }
              v39 = (void *)v243[5];
              v40 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v35, v36, v37, v38);
              [v39 setObject:v40 forKey:v22];
              goto LABEL_48;
            }
            double MaxX = CGRectGetMaxX(*(CGRect *)&v35);
            [(VUIMediaTagsView *)self bounds];
            double v25 = v25 - fmax(MaxX - CGRectGetMaxX(v297), 0.0);
            if ([(VUIMediaTagsView *)self vuiIsRTL])
            {
LABEL_33:
              [(VUIMediaTagsView *)self bounds];
              VUIRectWithFlippedOriginRelativeToBoundingRect();
            }
            else
            {
              double v58 = v27;
              double v57 = v28;
              double v55 = v26;
              double v56 = v25;
            }
            goto LABEL_68;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v41 = [(VUIMediaTagsView *)self tagsViewLayout];
            [v41 badgeMargin];
            double v24 = v42;

            switch([v22 tag])
            {
              case 'e':
                v43 = [(VUIMediaTagsView *)self tagsViewLayout];
                [v43 commonSenseMargin];
                double v24 = v44;

                goto LABEL_38;
              case 'f':
                v71 = [(VUIMediaTagsView *)self tagsViewLayout];
                [v71 tomatoMeterMargin];
                double v24 = v72;

                goto LABEL_38;
              case 'g':
                goto LABEL_38;
              case 'm':
                v73 = [(VUIMediaTagsView *)self tagsViewLayout];
                [v73 immersiveMargin];
                double v24 = v74;

                goto LABEL_38;
              case 'n':
                v75 = [(VUIMediaTagsView *)self tagsViewLayout];
                [v75 highMotionMargin];
                double v24 = v76;

LABEL_38:
                int v20 = 1;
                break;
              default:
                break;
            }
            v77 = (void *)MEMORY[0x1E4FB3C70];
            v78 = [(VUIMediaTagsView *)self tagsViewLayout];
            [v78 badgeMaxHeight];
            double v80 = v79;
            v81 = [(VUIMediaTagsView *)self vuiTraitCollection];
            v82 = [(VUIMediaTagsView *)self tagsViewLayout];
            objc_msgSend(v77, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v81, objc_msgSend(v82, "badgeMaxContentSizeCategory"), v80);
            double v84 = v83;

            v40 = [v22 image];
            [v40 size];
            double v85 = 0.0;
            if (v86 > 0.0)
            {
              [v40 size];
              if (v87 > 0.0)
              {
                [v40 size];
                double v89 = v88;
                [v40 size];
                double v85 = v89 / v90;
              }
            }
            [(VUIMediaTagsView *)self bounds];
            double v95 = v211[2](v211, v22, v20 & 1, v23 == v22, [(VUIMediaTagsView *)self vuiIsRTL], v24, v84, v85, v91, v92, v93, v94);
            double v27 = v95;
            double v28 = v96;
            double v25 = v97;
            double v26 = v98;
            if (v212)
            {
              if (v207)
              {
                v99 = (void *)v243[5];
                v100 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v95, v96, v97, v98);
                [v99 setObject:v100 forKey:v22];
              }
            }
            else
            {
              int v101 = [(VUIMediaTagsView *)self vuiIsRTL];
              double v102 = v26;
              double v103 = v25;
              double v104 = v28;
              double v105 = v27;
              if (v101)
              {
                [(VUIMediaTagsView *)self bounds];
                VUIRectWithFlippedOriginRelativeToBoundingRect();
              }
              objc_msgSend(v22, "setFrame:", v105, v104, v103, v102);
            }
LABEL_48:

            goto LABEL_49;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v45 = [(VUIMediaTagsView *)self tagsViewLayout];
            [v45 textBadgeMargin];
            double v24 = v46;

            [(VUIMediaTagsView *)self bounds];
            double v27 = v211[2](v211, v22, v20 & 1, v23 == v22, [(VUIMediaTagsView *)self vuiIsRTL], v24, 0.0, 0.0, v47, v48, v49, v50);
            double v28 = v51;
            double v25 = v52;
            double v26 = v53;
            if (v212) {
              goto LABEL_49;
            }
            int v54 = [(VUIMediaTagsView *)self vuiIsRTL];
            double v55 = v26;
            double v56 = v25;
            double v57 = v28;
            double v58 = v27;
            if (v54)
            {
              [(VUIMediaTagsView *)self bounds];
              VUIRectWithFlippedOriginRelativeToBoundingRect();
            }
            goto LABEL_68;
          }
          if ([v22 tag] != 108) {
            goto LABEL_13;
          }
          v60 = [(VUIMediaTagsView *)self tagsViewLayout];
          [v60 badgeMargin];
          double v24 = v61;

          [(VUIMediaTagsView *)self bounds];
          double v66 = v211[2](v211, v22, v20 & 1, v23 == v22, [(VUIMediaTagsView *)self vuiIsRTL], v24, 0.0, 0.0, v62, v63, v64, v65);
          double v27 = v66;
          double v28 = v67;
          double v25 = v68;
          double v26 = v69;
          if (!v212)
          {
            double v70 = CGRectGetMaxX(*(CGRect *)&v66);
            [(VUIMediaTagsView *)self bounds];
            double v25 = v25 - fmax(v70 - CGRectGetMaxX(v298), 0.0);
            if ([(VUIMediaTagsView *)self vuiIsRTL]) {
              goto LABEL_33;
            }
            double v58 = v27;
            double v57 = v28;
            double v55 = v26;
            double v56 = v25;
LABEL_68:
            objc_msgSend(v22, "setFrame:", v58, v57, v56, v55);
          }
LABEL_49:
          v106 = [(VUIMediaTagsView *)self tagsViewLayout];
          int v107 = [v106 alignBadgeVertically];
          if (v28 < 0.0) {
            int v108 = v107;
          }
          else {
            int v108 = 0;
          }

          if (v13 >= v28) {
            double v109 = v28;
          }
          else {
            double v109 = v13;
          }
          if (v108) {
            double v13 = v109;
          }
          v110 = v261;
          double v111 = v24 + v25 + v27;
          if (v261[4] >= v111) {
            double v111 = v261[4];
          }
          if (width < v111) {
            double v111 = width;
          }
          double v112 = ceil(v111);
          double v113 = 0.0;
          if (v28 >= 0.0) {
            double v113 = v28;
          }
          double v114 = v26 + v113;
          if (v261[5] >= v114) {
            double v114 = v261[5];
          }
          v261[4] = v112;
          v110[5] = v114;
          ++v21;
        }
        while (v19 != v21);
        uint64_t v115 = [v18 countByEnumeratingWithState:&v233 objects:v294 count:16];
        uint64_t v19 = v115;
      }
      while (v115);
    }

    v116 = [(VUIMediaTagsView *)self tagsViewLayout];
    [v116 groupMargin];
    if (rect1)
    {
      v285[3] = v117 + v285[3];

      v289[3] = 0.0;
    }
    else
    {
      v289[3] = v118 + v289[3];
    }
    unint64_t v12 = v205 + 1;
  }
  v232[0] = MEMORY[0x1E4F143A8];
  v232[1] = 3221225472;
  v232[2] = __59__VUIMediaTagsView__layoutSubviewsForSize_computationOnly___block_invoke_2;
  v232[3] = &unk_1E6DF9060;
  v232[4] = &v242;
  v119 = (double (**)(void *, id))_Block_copy(v232);
  if ((v207 & 1) == 0
    || (unint64_t)[(id)v255[5] count] < 2
    || [(VUIMediaTagsView *)self elementsArePlacedOnIndividualLines]
    || !v212)
  {
    goto LABEL_77;
  }
  v137 = [(id)v255[5] lastObject];
  if ((unint64_t)[v137 count] > 1 || !objc_msgSend(v137, "count"))
  {
    long long v221 = *((_OWORD *)v261 + 2);

    goto LABEL_114;
  }
  v138 = [v137 firstObject];
  v139 = objc_msgSend((id)v255[5], "objectAtIndexedSubscript:", objc_msgSend((id)v255[5], "count") - 2);
  v140 = (void *)[v139 mutableCopy];
  v141 = (void *)[v137 mutableCopy];
  v142 = 0;
  uint64_t v143 = [v139 count] - 1;
  if (v143 < 0)
  {
    id v210 = 0;
  }
  else
  {
    while (1)
    {
      v144 = [v139 objectAtIndexedSubscript:v143];
      if ([v144 tag] != 100) {
        break;
      }
      [v140 removeLastObject];

      --v143;
      v142 = v144;
      if (v143 == -1)
      {
        id v210 = 0;
        v142 = v144;
        goto LABEL_121;
      }
    }
    id v210 = v144;
    [v140 removeLastObject];
    if (v143 - 1 >= 0)
    {
      v148 = [v139 objectAtIndexedSubscript:v143];
      BOOL v149 = [v148 tag] == 100;

      if (v149) {
        [v140 removeLastObject];
      }
    }
  }
LABEL_121:
  if ((unint64_t)[v140 count] <= 1) {
    goto LABEL_122;
  }
  CGFloat v151 = v119[2](v119, v210);
  CGFloat v153 = v152;
  double v155 = v154;
  CGFloat v157 = v156;
  CGFloat v158 = v119[2](v119, v142);
  double v201 = v159;
  double v198 = v160;
  CGFloat v199 = v161;
  CGFloat v200 = v158;
  v162 = [v140 lastObject];
  *(void *)&long long v221 = v119[2](v119, v162);
  CGFloat v206 = v164;
  CGFloat v208 = v163;
  CGFloat rect1a = v165;

  CGFloat v166 = v119[2](v119, v138);
  CGFloat rect = v167;
  CGFloat v168 = v166;
  CGFloat v170 = v169;
  CGFloat v172 = v171;
  v299.origin.double x = v151;
  v299.origin.double y = v153;
  v299.size.double width = v155;
  v299.size.CGFloat height = v157;
  v310.origin.double y = v215;
  v310.origin.double x = v218;
  v310.size.double width = v213;
  v310.size.CGFloat height = v214;
  if (CGRectEqualToRect(v299, v310)) {
    goto LABEL_153;
  }
  *(void *)&v300.origin.double x = v221;
  v300.size.double width = v206;
  v300.origin.double y = v208;
  v300.size.CGFloat height = rect1a;
  v311.origin.double y = v215;
  v311.origin.double x = v218;
  v311.size.double width = v213;
  v311.size.CGFloat height = v214;
  if (CGRectEqualToRect(v300, v311)) {
    goto LABEL_153;
  }
  v301.origin.double x = v168;
  v301.origin.double y = v170;
  v301.size.double width = v172;
  v301.size.CGFloat height = rect;
  v312.origin.double y = v215;
  v312.origin.double x = v218;
  v312.size.double width = v213;
  v312.size.CGFloat height = v214;
  BOOL v173 = CGRectEqualToRect(v301, v312);
  if (!v210 || v173) {
    goto LABEL_153;
  }
  v302.origin.double x = v168;
  CGFloat v216 = v172;
  CGFloat v219 = v170;
  v302.origin.double y = v170;
  v302.size.double width = v172;
  v302.size.CGFloat height = rect;
  double MinY = CGRectGetMinY(v302);
  [v141 insertObject:v210 atIndex:0];
  objc_opt_class();
  double v176 = v155 + 0.0;
  double v177 = MinY + 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v209 margin];
    double v176 = v176 + v178;
LABEL_140:
    double v187 = v177;
    goto LABEL_141;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_140;
  }
  v179 = [(VUIMediaTagsView *)self tagsViewLayout];
  [v179 badgeMargin];
  double v181 = v180;

  switch([v210 tag])
  {
    case 'e':
      v182 = [(VUIMediaTagsView *)self tagsViewLayout];
      [v182 commonSenseMargin];
      goto LABEL_137;
    case 'f':
      v182 = [(VUIMediaTagsView *)self tagsViewLayout];
      [v182 tomatoMeterMargin];
      goto LABEL_137;
    case 'm':
      v182 = [(VUIMediaTagsView *)self tagsViewLayout];
      [v182 immersiveMargin];
      goto LABEL_137;
    case 'n':
      v182 = [(VUIMediaTagsView *)self tagsViewLayout];
      [v182 highMotionMargin];
LABEL_137:
      double v181 = v183;

      break;
    default:
      break;
  }
  v184 = [(VUIMediaTagsView *)self tagsViewLayout];
  int v185 = [v184 alignBadgeVertically];

  double v176 = v176 + v181;
  if (!v185) {
    goto LABEL_140;
  }
  v303.origin.double x = v168;
  v303.size.double width = v216;
  v303.origin.double y = v219;
  v303.size.CGFloat height = rect;
  double MidY = CGRectGetMidY(v303);
  *(void *)&v304.size.double width = v273[6];
  *(void *)&v304.size.CGFloat height = v273[7];
  v304.origin.double x = v176;
  v304.origin.double y = v177;
  double v187 = v177 + MidY - CGRectGetMidY(v304);
LABEL_141:
  if (v142)
  {
    [v209 margin];
    double v189 = v188;
    [v141 insertObject:v210 atIndex:1];
    CGFloat v200 = v176;
    double v176 = v176 + v201 + v189;
  }
  else
  {
    double v177 = v198;
  }
  v305.origin.double x = v176;
  v305.size.double width = v216;
  v305.origin.double y = v219;
  v305.size.CGFloat height = rect;
  double v190 = CGRectGetMaxX(v305);
  *(void *)&v306.origin.double x = v221;
  v306.size.double width = v206;
  v306.origin.double y = v208;
  v306.size.CGFloat height = rect1a;
  double v191 = CGRectGetMaxX(v306);
  if (v190 > v191)
  {
LABEL_122:
    int v150 = 0;
    long long v221 = *((_OWORD *)v261 + 2);
    goto LABEL_154;
  }
  v307.origin.double x = 0.0;
  v307.origin.double y = v187;
  v307.size.double width = v155;
  v307.size.CGFloat height = v157;
  double MaxY = CGRectGetMaxY(v307);
  v308.origin.double x = v200;
  v308.size.double width = v201;
  v308.origin.double y = v177;
  v308.size.CGFloat height = v199;
  double v193 = CGRectGetMaxY(v308);
  v309.origin.double x = v176;
  v309.size.double width = v216;
  v309.origin.double y = v219;
  v309.size.CGFloat height = rect;
  double v194 = CGRectGetMaxY(v309);
  if (MaxY >= v193) {
    double v195 = MaxY;
  }
  else {
    double v195 = v193;
  }
  if (v195 >= v194) {
    double v194 = v195;
  }
  double v196 = width;
  v197 = v261;
  if (width >= v191) {
    double v196 = v191;
  }
  v261[4] = v196;
  v197[5] = v194;
LABEL_153:
  int v150 = 1;
LABEL_154:

  if (!v150) {
    goto LABEL_114;
  }
LABEL_77:
  v120 = [(VUIMediaTagsView *)self tagsViewLayout];
  int v121 = [v120 alignBadgeVertically];

  if (v121 && !v212 && v13 < 0.0)
  {
    long long v230 = 0u;
    long long v231 = 0u;
    long long v228 = 0u;
    long long v229 = 0u;
    id v122 = (id)v255[5];
    uint64_t v123 = [v122 countByEnumeratingWithState:&v228 objects:v293 count:16];
    if (v123)
    {
      uint64_t v124 = *(void *)v229;
      do
      {
        for (uint64_t i = 0; i != v123; ++i)
        {
          if (*(void *)v229 != v124) {
            objc_enumerationMutation(v122);
          }
          v126 = *(void **)(*((void *)&v228 + 1) + 8 * i);
          long long v224 = 0u;
          long long v225 = 0u;
          long long v226 = 0u;
          long long v227 = 0u;
          id v127 = v126;
          uint64_t v128 = [v127 countByEnumeratingWithState:&v224 objects:v292 count:16];
          if (v128)
          {
            uint64_t v129 = *(void *)v225;
            do
            {
              for (uint64_t j = 0; j != v128; ++j)
              {
                if (*(void *)v225 != v129) {
                  objc_enumerationMutation(v127);
                }
                v131 = *(void **)(*((void *)&v224 + 1) + 8 * j);
                [v131 frame];
                objc_msgSend(v131, "setFrame:");
              }
              uint64_t v128 = [v127 countByEnumeratingWithState:&v224 objects:v292 count:16];
            }
            while (v128);
          }
        }
        uint64_t v123 = [v122 countByEnumeratingWithState:&v228 objects:v293 count:16];
      }
      while (v123);
    }
  }
  [(VUIMediaTagsViewLayout *)self->_tagsViewLayout padding];
  double v133 = v132;
  if (!v212)
  {
    -[VUIMediaTagsView _adjustViewsPositionFor:preferredSize:](self, "_adjustViewsPositionFor:preferredSize:", v255[5], v261[4], v261[5]);
    if ([(id)v255[5] count])
    {
      v134 = [(id)v255[5] lastObject];
      if ((unint64_t)[v134 count] < 2)
      {
      }
      else
      {
        v135 = [v134 lastObject];
        BOOL v136 = [v135 tag] == 108;

        if (v136) {
          -[VUIMediaTagsView _adjustViewsPositionVerticallyCenteredFor:preferredSize:](self, "_adjustViewsPositionVerticallyCenteredFor:preferredSize:", v255[5], v261[4], v261[5]);
        }
      }
    }
    if (v133 <= 0.0) {
      goto LABEL_113;
    }
    [(VUIMediaTagsView *)self _adjustViewsPositionFor:v255[5] topPadding:v133];
    goto LABEL_111;
  }
  if (v132 > 0.0)
  {
LABEL_111:
    double v145 = v261[5];
    if (v145 > 0.0) {
      v261[5] = v133 + v145;
    }
  }
LABEL_113:
  long long v221 = *((_OWORD *)v261 + 2);
LABEL_114:

  objc_destroyWeak(v238);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v242, 8);

  _Block_object_dispose(&v248, 8);
  _Block_object_dispose(&v254, 8);

  _Block_object_dispose(&v260, 8);
  _Block_object_dispose(v265, 8);
  _Block_object_dispose(v268, 8);

  _Block_object_dispose(v270, 8);
  _Block_object_dispose(v271, 8);
  _Block_object_dispose(&v272, 8);
  _Block_object_dispose(v278, 8);

  _Block_object_dispose(v280, 8);
  _Block_object_dispose(v282, 8);

  _Block_object_dispose(&v284, 8);
  _Block_object_dispose(&v288, 8);

  double v147 = *((double *)&v221 + 1);
  double v146 = *(double *)&v221;
  result.CGFloat height = v147;
  result.double width = v146;
  return result;
}

double __59__VUIMediaTagsView__layoutSubviewsForSize_computationOnly___block_invoke(uint64_t a1, void *a2, char a3, int a4, int a5, double a6, double a7, double a8)
{
  double v14 = a2;
  id v16 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
  double v19 = *(double *)(a1 + 152);
  double v18 = *(double *)(a1 + 160);
  if ([v16 tag] == 110)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v20 = [WeakRetained tagsViewLayout];
      [v20 badgeMaxHeight];
      double v18 = v21;

      double v19 = 0.0;
    }
  }
  objc_msgSend(v16, "vui_sizeThatFits:", v19, v18);
  double v24 = *MEMORY[0x1E4F1DB30];
  double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v22 != *MEMORY[0x1E4F1DB30] || v23 != v25)
  {
    double v27 = v22;
    double v28 = v23;
    int v180 = a5;
    double v183 = a6;
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    int v30 = isKindOfClass;
    if (a7 <= 0.0) {
      double v31 = v28;
    }
    else {
      double v31 = a7;
    }
    if (a8 > 0.0) {
      double v27 = v31 * a8;
    }
    if (*(unsigned char *)(a1 + 168))
    {
      if (isKindOfClass)
      {
        if ((a3 & 1) == 0
          || !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          char v97 = 0;
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          int v96 = 1;
          goto LABEL_64;
        }
        double v32 = v31;
        id v33 = v16;
        [v33 baselineHeight];
        double v34 = v27;
        double v36 = v35;
        VUIRoundValue();
        double v38 = v37;
        v39 = [v33 vuiFont];
        [v39 capHeight];
        double v41 = v40;

        double v42 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        double MidY = CGRectGetMidY(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
        double v44 = [WeakRetained tagsViewLayout];
        int v45 = [v44 alignBadgeVertically];

        if ([v33 requiresMoreThanOneLineForTextWidth:v34])
        {
          double v31 = v32;
          if (CGRectGetHeight(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32)) < v32)
          {
            *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v32 * 0.5
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 64)
                                                                                                + 8)
                                                                                    + 24)
                                                                        - *(double *)(*(void *)(*(void *)(a1 + 56)
                                                                                                + 8)
                                                                                    + 56)
                                                                        * 0.5;
            goto LABEL_118;
          }
          *(CGFloat *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CGRectGetMidY(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                                 + 32))
                                                                       + v32 * -0.5;
LABEL_127:
          double v27 = v34;
LABEL_133:

          int v96 = 0;
          char v97 = 1;
LABEL_64:
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v14);
          if (v97)
          {
LABEL_98:
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v14);
            uint64_t v154 = *(void *)(*(void *)(a1 + 40) + 8);
            double v46 = *(double *)(v154 + 24);
            double v155 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
            *(double *)(v154 + 24) = v27 + v183 + v46;
            double v156 = *(double **)(*(void *)(a1 + 56) + 8);
            v156[4] = v46;
            v156[5] = v155;
            v156[6] = v27;
            v156[7] = v31;
            if ((v30 & 1) == 0)
            {
              [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) addObject:v16];
              CGFloat v157 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
              CGFloat v158 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v46, v155, v27, v31);
              [v157 addObject:v158];
            }
            v188.origin.double x = v46;
            v188.origin.double y = v155;
            v188.size.double width = v27;
            v188.size.CGFloat height = v31;
            double MinY = CGRectGetMinY(v188);
            uint64_t v160 = *(void *)(*(void *)(a1 + 80) + 8);
            if (v96)
            {
              *(double *)(v160 + 24) = MinY;
              uint64_t v161 = *(void *)(*(void *)(a1 + 88) + 8);
              double v162 = v31;
            }
            else
            {
              if (MinY >= *(double *)(v160 + 24)) {
                double MinY = *(double *)(v160 + 24);
              }
              *(double *)(v160 + 24) = MinY;
              uint64_t v161 = *(void *)(*(void *)(a1 + 88) + 8);
              double v162 = *(double *)(v161 + 24);
              if (v162 < v31) {
                double v162 = v31;
              }
            }
            *(double *)(v161 + 24) = v162;
            if (*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) == v16)
            {
              double v163 = *(double **)(*(void *)(a1 + 120) + 8);
              v163[4] = v46;
              v163[5] = v155;
              v163[6] = v27;
              v163[7] = v31;
              if (!v96)
              {
LABEL_112:
                objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40), "addObject:", v16, v174);
                goto LABEL_113;
              }
            }
            else if (!v96)
            {
              goto LABEL_112;
            }
            if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40), "count", v174))
            {
              id v164 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v165 = *(void *)(*(void *)(a1 + 128) + 8);
              CGFloat v166 = *(void **)(v165 + 40);
              *(void *)(v165 + 40) = v164;

              [*(id *)(*(void *)(*(void *)(a1 + 136) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40)];
            }
            goto LABEL_112;
          }
          goto LABEL_68;
        }
        if (v45)
        {
          double v142 = v41 * 0.5 + v36 - v41 + v42;
          if (v142 > MidY)
          {
            uint64_t v143 = *(void *)(*(void *)(a1 + 56) + 8);
            double v144 = v142 - MidY + *(double *)(v143 + 40);
LABEL_117:
            *(double *)(v143 + 40) = v144;
            double v31 = v32;
LABEL_118:
            double v27 = v34;
            if (!*(unsigned char *)(a1 + 169))
            {
              if (a5) {
                VUIRectWithFlippedOriginRelativeToBoundingRect();
              }
              objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setFrame:");
            }
            goto LABEL_133;
          }
          uint64_t v169 = *(void *)(*(void *)(a1 + 64) + 8);
          double v170 = MidY - v142 + *(double *)(v169 + 24);
        }
        else
        {
          if (v36 > *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56))
          {
            [v33 frame];
            double v144 = fabs(v38) + v168;
            uint64_t v143 = *(void *)(*(void *)(a1 + 56) + 8);
            goto LABEL_117;
          }
          double v170 = fabs(v38);
          uint64_t v169 = *(void *)(*(void *)(a1 + 64) + 8);
        }
        *(double *)(v169 + 24) = v170;
        double v31 = v32;
        goto LABEL_127;
      }
      if ([v16 tag] == 108) {
        goto LABEL_29;
      }
      uint64_t v98 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (a4)
      {
        if (v98) {
          goto LABEL_68;
        }
      }
      else if (v98)
      {
        if ([v16 tag] == 109)
        {
          int v121 = [*(id *)(a1 + 32) tagsViewLayout];
          uint64_t v122 = [v121 type];

          if (v122 == 3)
          {
LABEL_29:
            v59 = (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
LABEL_30:
            void *v59 = 0;
LABEL_68:
            *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 80)
                                                                                                + 8)
                                                                                    + 24);
            v99 = [WeakRetained tagsViewLayout];
            [v99 badgeMargin];
            double v101 = v100;

            double v102 = [WeakRetained tagsViewLayout];
            double v103 = [v102 textLayout];
            [v103 margin];
            double v104 = v27;
            double v106 = v105;

            if (v101 >= v106) {
              double v107 = v101;
            }
            else {
              double v107 = v106;
            }
            double v108 = fmax(v107, 2.0);
            double v109 = [WeakRetained tagsViewLayout];
            v110 = [v109 textLayout];
            [v110 margin];
            double v112 = v111;

            double v113 = [WeakRetained tagsViewLayout];
            [v113 badgeMargin];
            double v115 = v114;

            if (v112 >= v115) {
              double v116 = v112;
            }
            else {
              double v116 = v115;
            }
            double v27 = v104;
            *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v108
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 88)
                                                                                                + 8)
                                                                                    + 24)
                                                                        + fmax(v116, 2.0)
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 64)
                                                                                                + 8)
                                                                                    + 24);
LABEL_75:
            int v96 = 1;
            goto LABEL_98;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v123 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          id v124 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          [v124 baselineHeight];
          VUIRoundValue();
          *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v123 + fabs(v125);
        }
        else
        {
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 40);
          uint64_t v152 = *(void *)(*(void *)(a1 + 40) + 8);
          double v153 = *(double *)(v152 + 24);
          v59 = (void *)(v152 + 24);
          if (v27 + v153 > *(double *)(a1 + 152)) {
            goto LABEL_30;
          }
        }
      }
LABEL_97:
      int v96 = 0;
      goto LABEL_98;
    }
    double v47 = [WeakRetained tagsViewLayout];
    int v48 = [v47 isWrappingAllowed];

    if (v48 && v27 + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > *(double *)(a1 + 152))
    {
      uint64_t v49 = *(void *)(*(void *)(a1 + 72) + 8);
      double v50 = *(void **)(v49 + 40);
      *(void *)(v49 + 40) = 0;

      [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) removeAllObjects];
      [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) removeAllObjects];
      if ((v30 & 1) == 0)
      {
        if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) tag] == 103)
        {
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "vui_sizeThatFits:", *(double *)(a1 + 152), *(double *)(a1 + 160));
          uint64_t v127 = v126;
          double v129 = v128;
          double v130 = fmax(v128, v31);
          v131 = [WeakRetained tagsViewLayout];
          double v132 = [v131 textLayout];
          [v132 margin];
          double v134 = v130 + v133;
          v135 = [WeakRetained tagsViewLayout];
          [v135 badgeMargin];
          *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v134
                                                                      + v136
                                                                      + *(double *)(*(void *)(*(void *)(a1 + 64)
                                                                                              + 8)
                                                                                  + 24);

          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = *(void *)(*(void *)(*(void *)(a1 + 64)
                                                                                              + 8)
                                                                                  + 24);
          uint64_t v137 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)(v137 + 48) = v127;
          *(double *)(v137 + 56) = v129;
          double v138 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32)
               + *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
          v139 = [WeakRetained tagsViewLayout];
          v140 = [v139 textLayout];
          [v140 margin];
          *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v138 + v141;

          if (!*(unsigned char *)(a1 + 169))
          {
            if (v180) {
              VUIRectWithFlippedOriginRelativeToBoundingRect();
            }
            objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setFrame:");
          }
          uint64_t v171 = *(void *)(*(void *)(a1 + 112) + 8);
          double v172 = *(double *)(v171 + 40);
          uint64_t v173 = *(void *)(*(void *)(a1 + 64) + 8);
          if (v172 < v129 + *(double *)(v173 + 24)) {
            double v172 = v129 + *(double *)(v173 + 24);
          }
          *(double *)(v171 + 40) = v172;
        }
        else
        {
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          double v145 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56);
          double v146 = [WeakRetained tagsViewLayout];
          double v147 = [v146 textLayout];
          [v147 margin];
          double v149 = v145 + v148;
          int v150 = [WeakRetained tagsViewLayout];
          [v150 badgeMargin];
          *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v149
                                                                      + v151
                                                                      + *(double *)(*(void *)(*(void *)(a1 + 64)
                                                                                              + 8)
                                                                                  + 24);
        }
        goto LABEL_75;
      }
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      double v51 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      double v52 = [WeakRetained tagsViewLayout];
      double v53 = [v52 textLayout];
      [v53 margin];
      double v55 = v51 + v54;
      double v56 = [WeakRetained tagsViewLayout];
      [v56 badgeMargin];
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v55
                                                                  + v57
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24);

      HIDWORD(v174) = v30;
      if ([v16 tag] == 100)
      {
        double v181 = 0.0;
        double v58 = WeakRetained;
        if (!*(unsigned char *)(a1 + 169)) {
          [v16 removeFromSuperview];
        }
        LODWORD(v174) = 1;
        double v27 = 0.0;
      }
      else
      {
        double v181 = v31;
        double v58 = WeakRetained;
        if (!*(unsigned char *)(a1 + 169)
          && [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) tag] == 100)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeFromSuperview];
        }
        LODWORD(v174) = 1;
      }
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                              + 24);
      if ((v30 & 1) == 0)
      {
        double v117 = [WeakRetained tagsViewLayout];
        int v118 = [v117 alignBadgeVertically];

        if (v118 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
        {
          double v119 = *(double *)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
          VUIRoundValue();
          int v96 = 0;
          *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v119 + v120 * 0.5;
          goto LABEL_98;
        }
        goto LABEL_97;
      }
      double v181 = v31;
      HIDWORD(v174) = v30;
      if (*(unsigned char *)(a1 + 169)
        || [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) tag] != 100
        || ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) superview],
            v60 = objc_claimAutoreleasedReturnValue(),
            v60,
            v60))
      {
        double v58 = WeakRetained;
      }
      else
      {
        double v58 = WeakRetained;
        [WeakRetained addSubview:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      }
      LODWORD(v174) = 0;
    }
    id v61 = v16;
    obuint64_t j = v14;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v14);
    double v176 = v27;
    int v62 = [v61 requiresMoreThanOneLineForTextWidth:v27];
    [v61 baselineHeight];
    double v184 = v63;
    double v64 = [v61 vuiFont];
    [v64 capHeight];
    double v66 = v65;

    if (![*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count])
    {
LABEL_62:

      id WeakRetained = v58;
      double v31 = v181;
      double v27 = v176;
      double v14 = obj;
      int v96 = v174;
      LOBYTE(v30) = BYTE4(v174);
      goto LABEL_98;
    }
    uint64_t v67 = 0;
    double v177 = v66 * 0.5;
    double v178 = v184 - v66;
    double v179 = v181 * 0.5;
    double v182 = v25;
    while (1)
    {
      double v68 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "objectAtIndexedSubscript:", v67, v174);
      double v69 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) objectAtIndexedSubscript:v67];
      [v69 CGRectValue];
      double v71 = v70;
      double v73 = v72;
      double v75 = v74;
      double v77 = v76;

      id v78 = v61;
      if (v75 == v24 && v77 == v25) {
        goto LABEL_61;
      }
      double v80 = v24;
      double v81 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      VUIRoundValue();
      double v83 = v82;
      v185.origin.double x = v71;
      v185.origin.double y = v73;
      v185.size.double width = v75;
      v185.size.CGFloat height = v77;
      double v84 = CGRectGetMidY(v185);
      double v85 = [v58 tagsViewLayout];
      int v86 = [v85 alignBadgeVertically];

      if (v62)
      {
        v186.origin.double x = v71;
        v186.origin.double y = v73;
        v186.size.double width = v75;
        v186.size.CGFloat height = v77;
        if (CGRectGetHeight(v186) < v181)
        {
          double v87 = v179 + *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          double v88 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56) * -0.5;
          goto LABEL_52;
        }
        v187.origin.double x = v71;
        v187.origin.double y = v73;
        v187.size.double width = v75;
        v187.size.CGFloat height = v77;
        double v91 = CGRectGetMidY(v187) - v179;
      }
      else
      {
        if (v86)
        {
          double v89 = v177 + v178 + v81;
          if (v89 > v84)
          {
            double v90 = v73 + v89 - v84;
            goto LABEL_53;
          }
          uint64_t v95 = *(void *)(*(void *)(a1 + 64) + 8);
          double v91 = v84 - v89 + *(double *)(v95 + 24);
          goto LABEL_60;
        }
        if (v184 > v77)
        {
          objc_msgSend(v78, "frame", v184);
          double v87 = fabs(v83);
LABEL_52:
          double v90 = v87 + v88;
LABEL_53:
          double v24 = v80;
          double v25 = v182;
          if (!*(unsigned char *)(a1 + 169))
          {
            if (v180)
            {
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              double v71 = v92;
              double v75 = v93;
              double v77 = v94;
            }
            objc_msgSend(v68, "setFrame:", v71, v90, v75, v77);
          }
          goto LABEL_61;
        }
        double v91 = fabs(v83);
      }
      uint64_t v95 = *(void *)(*(void *)(a1 + 64) + 8);
LABEL_60:
      *(double *)(v95 + 24) = v91;
      double v24 = v80;
      double v25 = v182;
LABEL_61:

      if (++v67 >= (unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count]) {
        goto LABEL_62;
      }
    }
  }
  double v46 = *MEMORY[0x1E4F1DB28];
LABEL_113:
  VUIRoundValue();
  VUICeilValue();

  return v46;
}

double __59__VUIMediaTagsView__layoutSubviewsForSize_computationOnly___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3
    && ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v3],
        (BOOL v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v5 = v4;
    [v4 CGRectValue];
    double v7 = v6;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB28];
  }

  return v7;
}

- (void)_adjustViewsPositionFor:(id)a3 preferredSize:(CGSize)a4
{
  double width = a4.width;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(VUIMediaTagsView *)self tagsViewLayout];
  if ([v7 centerAlign])
  {
    uint64_t v8 = [v6 count];

    if (v8)
    {
      int v9 = [(VUIMediaTagsView *)self vuiIsRTL];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v37 = v6;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v43;
        double v14 = *MEMORY[0x1E4F1DB28];
        double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v43 != v13) {
              objc_enumerationMutation(v10);
            }
            v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            double v18 = v15;
            double v19 = v14;
            if ([v17 count])
            {
              uint64_t v20 = [v17 count];
              double v18 = v15;
              double v19 = v14;
              if (v20 - 1 >= 0)
              {
                uint64_t v21 = v20;
                while (1)
                {
                  double v22 = [v17 objectAtIndexedSubscript:--v21];
                  if (([v22 isHidden] & 1) == 0)
                  {
                    double v23 = [v22 superview];

                    if (v23) {
                      break;
                    }
                  }

                  if (v21 <= 0)
                  {
                    double v18 = v15;
                    double v19 = v14;
                    goto LABEL_16;
                  }
                }
                [v22 frame];
                double v19 = v24;
                double v18 = v25;
              }
            }
LABEL_16:
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v26 = v17;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              double v29 = width - (v18 + v19);
              if (v9) {
                double v29 = v19;
              }
              double v30 = v29 * 0.5;
              uint64_t v31 = *(void *)v39;
              double v32 = -(v29 * 0.5);
              if (v9) {
                double v33 = v32;
              }
              else {
                double v33 = v30;
              }
              do
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v39 != v31) {
                    objc_enumerationMutation(v26);
                  }
                  double v35 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                  [v35 frame];
                  [v35 setFrame:v33 + v36];
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
              }
              while (v28);
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v12);
      }

      id v6 = v37;
    }
  }
  else
  {
  }
}

- (void)_adjustViewsPositionVerticallyCenteredFor:(id)a3 preferredSize:(CGSize)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v18 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(*((void *)&v17 + 1) + 8 * j);
                [v16 frame];
                objc_msgSend(v16, "setFrame:");
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
  }
}

- (void)_adjustViewsPositionFor:(id)a3 topPadding:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (a4 > 0.0 && v6 != 0)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v21 != v17) {
                  objc_enumerationMutation(v14);
                }
                long long v19 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                [v19 frame];
                objc_msgSend(v19, "setFrame:");
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v16);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }
  }
}

- (double)topMarginWithBaselineMargin:(double)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = [(VUIMediaTagsView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 topMarginWithBaselineMargin:a3];
          goto LABEL_19;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  id v5 = [(VUIMediaTagsView *)self subviews];
  uint64_t v11 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v18 = [(VUIMediaTagsView *)self tagsViewLayout];
          [v18 badgeMaxHeight];
          double v20 = v19;

          long long v21 = (void *)MEMORY[0x1E4FB3C70];
          long long v22 = [(VUIMediaTagsView *)self vuiTraitCollection];
          long long v23 = [(VUIMediaTagsView *)self tagsViewLayout];
          objc_msgSend(v21, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v22, objc_msgSend(v23, "badgeMaxContentSizeCategory"), v20);
          double v25 = v24;

          double v17 = a3 - v25;
          goto LABEL_21;
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = (void *)MEMORY[0x1E4FB3C70];
  id v5 = [(VUIMediaTagsView *)self vuiTraitCollection];
  [v15 scaleContentSizeValue:v5 forTraitCollection:a3];
LABEL_19:
  double v17 = v16;
LABEL_21:

  return v17;
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(VUIMediaTagsView *)self _firstLabelSubview];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 topMarginToLabel:v6 withBaselineMargin:a4];
    double v10 = v9;
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    uint64_t v11 = [(VUIMediaTagsView *)self subviews];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v19 = [(VUIMediaTagsView *)self tagsViewLayout];
            [v19 badgeMaxHeight];
            double v21 = v20;

            long long v22 = (void *)MEMORY[0x1E4FB3C70];
            long long v23 = [(VUIMediaTagsView *)self vuiTraitCollection];
            double v24 = [(VUIMediaTagsView *)self tagsViewLayout];
            objc_msgSend(v22, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v23, objc_msgSend(v24, "badgeMaxContentSizeCategory"), v21);
            double v26 = v25;

            [v6 bottomMarginWithBaselineMargin:a4];
            double v10 = v27 - v26;

            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    double v16 = (void *)MEMORY[0x1E4FB3C70];
    double v17 = [(VUIMediaTagsView *)self vuiTraitCollection];
    [v16 scaleContentSizeValue:v17 forTraitCollection:a4];
    double v10 = v18;
  }
LABEL_13:

  return v10;
}

- (double)firstBaselineOffsetFromTop
{
  uint64_t v2 = [(VUIMediaTagsView *)self _firstLabelSubview];
  id v3 = v2;
  if (v2)
  {
    [v2 vuiBaselineHeight];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)vui_baselineOffsetFromBottom
{
  uint64_t v2 = [(VUIMediaTagsView *)self _firstLabelSubview];
  id v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "vui_baselineOffsetFromBottom");
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)bottomMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(VUIMediaTagsView *)self _firstLabelSubview];
  [v6 topMarginToLabel:v7 withBaselineMargin:a4];
  double v9 = v8;

  return v9;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  double v5 = [(VUIMediaTagsView *)self _firstLabelSubview];
  id v6 = v5;
  if (v5)
  {
    [v5 bottomMarginWithBaselineMargin:a3];
    double v8 = v7;
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4FB3C70];
    double v10 = [(VUIMediaTagsView *)self vuiTraitCollection];
    [v9 scaleContentSizeValue:v10 forTraitCollection:a3];
    double v8 = v11;
  }
  return v8;
}

- (void)updateWithMetadata:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  val = self;
  double v66 = v4;
  if (![v4 count])
  {
    long long v39 = [(VUIMediaTagsView *)self viewsMap];
    long long v40 = [v39 allValues];
    [v40 makeObjectsPerformSelector:sel_removeFromSuperview];

    [(VUIMediaTagsView *)self setViewsMap:MEMORY[0x1E4F1CC08]];
    [(VUIMediaTagsView *)self setGroupedSubviews:MEMORY[0x1E4F1CBF0]];
    long long v41 = [(VUIMediaTagsView *)self vuiTraitCollection];
    uint64_t v42 = [v41 userInterfaceStyle];

    [(VUIMediaTagsView *)self _updateImageAppearanceWithUserInterfaceStyle:v42];
    goto LABEL_113;
  }
  double v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  double v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  double v5 = [(VUIMediaTagsView *)self viewsMap];
  id v6 = [v5 allKeys];
  int v62 = (void *)[v6 mutableCopy];

  double v7 = [(VUIMediaTagsView *)self viewsMap];
  double v8 = (void *)[v7 mutableCopy];

  double v65 = v8;
  [v8 removeObjectForKey:VUIMediaTagKeySeparator];
  [(VUIMediaTagsView *)self _removeSeparatorsFromGroupsIfNeeded:1];
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = __Block_byref_object_copy__16;
  v92[4] = __Block_byref_object_dispose__16;
  id v93 = 0;
  uint64_t v86 = 0;
  double v87 = (id *)&v86;
  uint64_t v88 = 0x3032000000;
  double v89 = __Block_byref_object_copy__16;
  double v90 = __Block_byref_object_dispose__16;
  id v91 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  double v9 = [(VUIMediaTagsView *)self tagsViewLayout];
  obuint64_t j = [v9 groupedKeys];

  uint64_t v56 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
  if (!v56)
  {
    char v58 = 0;
    goto LABEL_104;
  }
  char v58 = 0;
  uint64_t v55 = *(void *)v83;
  do
  {
    for (uint64_t i = 0; i != v56; ++i)
    {
      if (*(void *)v83 != v55) {
        objc_enumerationMutation(obj);
      }
      double v69 = *(void **)(*((void *)&v82 + 1) + 8 * i);
      id v61 = (id)objc_opt_new();
      for (uint64_t j = 0; (unint64_t)j < [v69 count]; ++j)
      {
        double v11 = [v69 objectAtIndexedSubscript:j];
        id v12 = [v65 objectForKeyedSubscript:v11];
        uint64_t v13 = [v66 objectForKeyedSubscript:v11];
        if (v13)
        {
          [v62 removeObject:v11];
          objc_initWeak(&location, val);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __39__VUIMediaTagsView_updateWithMetadata___block_invoke;
          aBlock[3] = &unk_1E6DF9088;
          objc_copyWeak(v80, &location);
          id v14 = v11;
          id v75 = v14;
          id v15 = v66;
          v80[1] = j;
          id v64 = v15;
          id v76 = v15;
          double v77 = v69;
          id v78 = &v86;
          double v79 = v92;
          uint64_t v67 = (unsigned int (**)(void))_Block_copy(aBlock);
          if ([v14 isEqualToString:VUIMediaTagKeySeparator])
          {
            double v16 = [(VUIMediaTagsView *)val tagsViewLayout];
            double v17 = [v16 textLayout];

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v67[2]())
            {
              uint64_t v18 = [(VUIMediaTagsView *)val _newLabelAsSubview:0 textLayout:v17];
              goto LABEL_33;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v67[2]())
            {
              uint64_t v18 = [(VUIMediaTagsView *)val _newLabelAsSubview:0 withAttributedString:v13 textLayout:v17];
              goto LABEL_33;
            }
            id v20 = v12;
LABEL_34:

            goto LABEL_35;
          }
          if (([v14 isEqualToString:VUIMediaTagKeyTimeTextBadge] & 1) != 0
            || [v14 isEqualToString:VUIMediaTagKeyLiveTextBadge])
          {
            if (v67[2]())
            {
              if ([v14 isEqualToString:VUIMediaTagKeyLiveTextBadge])
              {
                double v19 = [(VUIMediaTagsView *)val tagsViewLayout];
                [v19 liveTextBadgeLayout];
              }
              else
              {
                double v19 = [(VUIMediaTagsView *)val tagsViewLayout];
                [v19 timeTextBadgeLayout];
              double v17 = };

              uint64_t v18 = [(VUIMediaTagsView *)val _newTextBadgeViewAsSubview:v12 layout:v17 withString:v13];
LABEL_33:
              id v20 = (id)v18;

              goto LABEL_34;
            }
            id v20 = v12;
LABEL_35:
            id v12 = v20;
            if (v20)
            {
LABEL_36:
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v22 = v12;
                id v23 = v13;
                double v24 = [v22 expirationDate];
                char v25 = [v23 isEqual:v24];

                if ((v25 & 1) == 0)
                {
                  [v22 setExpirationDate:v23];
                  [v22 setHidden:0];
                  goto LABEL_39;
                }
                goto LABEL_50;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v60 = v12;
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                id v59 = v13;
                if (isKindOfClass)
                {
                  double v27 = [v60 vuiAttributedText];
                  long long v28 = [v27 string];

                  long long v29 = [(VUIMediaTagsView *)val _textLayoutForKey:v14];
                  long long v30 = [v29 attributedStringWithAttributedString:v59 view:val updateTextColor:0];
                  id v31 = [v59 string];
                }
                else
                {
                  long long v28 = [v60 vuiText];
                  long long v29 = [(VUIMediaTagsView *)val _textLayoutForKey:v14];
                  long long v30 = [v29 attributedStringWithString:v59 view:val];
                  id v31 = v59;
                }
                id v23 = v31;

                if (([v23 isEqual:v28] & 1) == 0)
                {
                  [v60 setVuiAttributedText:v30];
                  char v58 = 1;
                }
                [v60 setLabelName:v14];

                goto LABEL_50;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v32 = v12;
                id v23 = v13;
                long long v33 = [v32 image];
                char v34 = [v23 isEqual:v33];

                if ((v34 & 1) == 0)
                {
                  [v32 setImage:v23];
                  [v32 setHidden:0];
LABEL_39:
                  char v58 = 1;
                }
LABEL_50:
              }
              if (([v14 isEqualToString:VUIMediaTagKeyCommonSenseRating] & 1) == 0
                && ![v14 isEqualToString:VUIMediaTagKeyCommonSenseImage])
              {
                if (([v14 isEqualToString:VUIMediaTagKeyTomatoFreshnessImage] & 1) != 0
                  || ([v14 isEqualToString:VUIMediaTagKeyTomatoPercentage] & 1) != 0)
                {
                  uint64_t v37 = 102;
                }
                else if (([v14 isEqualToString:VUIMediaTagKeyImmersiveImage] & 1) != 0 {
                       || ([v14 isEqualToString:VUIMediaTagKeyImmersiveText] & 1) != 0)
                }
                {
                  uint64_t v37 = 109;
                }
                else if (([v14 isEqualToString:VUIMediaTagKeyHighMotionImage] & 1) != 0 {
                       || ([v14 isEqualToString:VUIMediaTagKeyHighMotionText] & 1) != 0)
                }
                {
                  uint64_t v37 = 110;
                }
                else if ([v14 isEqualToString:VUIMediaTagKeyComingSoonText])
                {
                  uint64_t v37 = 105;
                }
                else if ([v14 isEqualToString:VUIMediaTagKeyContentUnavailabilityText])
                {
                  uint64_t v37 = 107;
                }
                else if ([v14 isEqualToString:VUIMediaTagKeyBrandLinkButton])
                {
                  uint64_t v37 = 108;
                }
                else if (([v14 isEqualToString:VUIMediaTagKeyAvailabilityText] & 1) != 0 {
                       || ([v14 isEqualToString:VUIMediaTagKeyAvailabilityImage] & 1) != 0)
                }
                {
                  uint64_t v37 = 103;
                }
                else if ([v14 isEqualToString:VUIMediaTagKeyEpisodeNumberTitle])
                {
                  uint64_t v37 = 104;
                }
                else if ([v14 isEqualToString:VUIMediaTagKeySeparator])
                {
                  uint64_t v37 = 100;
                }
                else
                {
                  if (![v14 isEqualToString:VUIMediaTagKeyGroupActivityImage]) {
                    goto LABEL_59;
                  }
                  uint64_t v37 = 106;
                }
                [v12 setTag:v37];
                goto LABEL_59;
              }
              [v12 setTag:101];
              if ([v14 isEqualToString:VUIMediaTagKeyCommonSenseImage])
              {
                double v35 = [v64 objectForKeyedSubscript:VUIMediaTagKeyCommonSenseImage];
                [(VUIMediaTagsView *)val setCommonSenseLightImage:v35];

                double v36 = [v64 objectForKeyedSubscript:VUIMediaTagKeyCommonSenseDarkImage];
                [(VUIMediaTagsView *)val setCommonSenseDarkImage:v36];
              }
LABEL_59:
              [v63 setObject:v12 forKeyedSubscript:v14];
              [v61 addObject:v12];
            }
LABEL_60:

            objc_destroyWeak(v80);
            objc_destroyWeak(&location);
            goto LABEL_61;
          }
          if (v12) {
            goto LABEL_36;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v67[2]())
          {
            double v17 = [(VUIMediaTagsView *)val _textLayoutForKey:v14];
            uint64_t v21 = [(VUIMediaTagsView *)val _newLabelAsSubview:0 textLayout:v17];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !v67[2]())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && v67[2]())
              {
                uint64_t v38 = [(VUIMediaTagsView *)val _newImageViewAsSubview:[(VUIMediaTagsView *)val _shouldApplyTintColor:v14 forImage:v13]];
              }
              else
              {
                if (![v14 isEqualToString:VUIMediaTagKeyRentalExpiration]
                  || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  if ([v14 isEqualToString:VUIMediaTagKeyBrandLinkButton])
                  {
                    id v12 = v13;
                    [(VUIMediaTagsView *)val vui_addSubview:v12 oldView:0];
                    goto LABEL_36;
                  }
                  id v12 = 0;
                  goto LABEL_60;
                }
                uint64_t v38 = [(VUIMediaTagsView *)val _newRentalExpirationlabel:v13 exisitingLabel:0];
              }
              id v20 = (id)v38;
              goto LABEL_35;
            }
            double v17 = [(VUIMediaTagsView *)val _textLayoutForKey:v14];
            uint64_t v21 = [(VUIMediaTagsView *)val _newLabelAsSubview:0 withAttributedString:v13 textLayout:v17];
          }
          id v20 = (id)v21;
          goto LABEL_34;
        }
        if (v12) {
          [v12 removeFromSuperview];
        }
        [v63 setObject:0 forKeyedSubscript:v11];
LABEL_61:
      }
      if ([v61 count])
      {
        [v54 addObject:v61];
        objc_storeStrong(v87 + 5, v61);
      }
    }
    uint64_t v56 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
  }
  while (v56);
LABEL_104:

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v43 = v62;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v70 objects:v94 count:16];
  if (v44)
  {
    uint64_t v45 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v71 != v45) {
          objc_enumerationMutation(v43);
        }
        uint64_t v47 = *(void *)(*((void *)&v70 + 1) + 8 * k);
        uint64_t v48 = [(VUIMediaTagsView *)val viewsMap];
        uint64_t v49 = [v48 objectForKeyedSubscript:v47];
        [v49 removeFromSuperview];
      }
      uint64_t v44 = [v43 countByEnumeratingWithState:&v70 objects:v94 count:16];
    }
    while (v44);
  }

  double v50 = (void *)[v63 copy];
  [(VUIMediaTagsView *)val setViewsMap:v50];

  [(VUIMediaTagsView *)val setGroupedSubviews:v54];
  _Block_object_dispose(&v86, 8);

  _Block_object_dispose(v92, 8);
  double v51 = [(VUIMediaTagsView *)val vuiTraitCollection];
  uint64_t v52 = [v51 userInterfaceStyle];

  [(VUIMediaTagsView *)val _updateImageAppearanceWithUserInterfaceStyle:v52];
  if (v58)
  {
    [(VUIMediaTagsView *)val invalidateIntrinsicContentSize];
    [(VUIMediaTagsView *)val vui_setNeedsLayout];
  }
LABEL_113:
}

uint64_t __39__VUIMediaTagsView_updateWithMetadata___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = &VUIMediaTagKeyCommonSenseRating;
  if (![*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyCommonSenseRating])
  {
    if ([*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyCommonSenseImage]) {
      goto LABEL_14;
    }
    id v3 = &VUIMediaTagKeyTomatoPercentage;
    if ([*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyTomatoPercentage])
    {
      id v4 = *(void **)(a1 + 40);
      double v5 = &VUIMediaTagKeyTomatoFreshnessImage;
      goto LABEL_6;
    }
    if ([*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyTomatoFreshnessImage]
      || (id v3 = &VUIMediaTagKeyImmersiveImage,
          [*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyImmersiveImage])
      || (id v3 = &VUIMediaTagKeyImmersiveText,
          [*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyImmersiveText])
      || (id v3 = &VUIMediaTagKeyHighMotionImage,
          [*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyHighMotionImage])
      || (id v3 = &VUIMediaTagKeyHighMotionText,
          [*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyHighMotionText])
      || (id v3 = &VUIMediaTagKeyLiveTextBadge,
          [*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyLiveTextBadge])
      || (id v3 = &VUIMediaTagKeyTimeTextBadge,
          [*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeyTimeTextBadge]))
    {
LABEL_14:
      id v4 = *(void **)(a1 + 40);
      id v6 = *v3;
      goto LABEL_15;
    }
    if (![*(id *)(a1 + 32) isEqualToString:VUIMediaTagKeySeparator])
    {
      uint64_t v8 = 1;
      goto LABEL_17;
    }
    uint64_t v10 = *(void *)(a1 + 80);
    if (v10)
    {
      double v11 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v10 - 1];
      double v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v11];
    }
    else
    {
      id v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (!v12) {
        goto LABEL_26;
      }
      double v7 = [v12 lastObject];
    }
    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v7);
      goto LABEL_27;
    }
LABEL_26:
    double v7 = 0;
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v8 = 0;
      goto LABEL_16;
    }
LABEL_27:
    if (v10 + 1 >= (unint64_t)[*(id *)(a1 + 48) count]
      || ([*(id *)(a1 + 48) objectAtIndexedSubscript:v10 + 1],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          [*(id *)(a1 + 40) objectForKeyedSubscript:v13],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          (id)v8,
          v13,
          v8))
    {
      uint64_t v8 = [WeakRetained elementsArePlacedOnIndividualLines] ^ 1;
    }
    goto LABEL_16;
  }
  id v4 = *(void **)(a1 + 40);
  double v5 = &VUIMediaTagKeyCommonSenseImage;
LABEL_6:
  id v6 = *v5;
LABEL_15:
  double v7 = [v4 objectForKeyedSubscript:v6];
  uint64_t v8 = v7 != 0;
LABEL_16:

LABEL_17:
  return v8;
}

- (CGSize)intrinsicContentSize
{
  id v3 = objc_msgSend(MEMORY[0x1E4FB1BA8], "vui_main");
  objc_msgSend(v3, "vui_bounds");
  double v5 = v4;

  id v6 = [(VUIMediaTagsView *)self tagsViewLayout];
  [v6 maxWidth];
  double v8 = v7;

  double v9 = [(VUIMediaTagsView *)self tagsViewLayout];
  if ([v9 isWrappingAllowed] && v8 > 0.0)
  {

    if (v5 > v8) {
      double v5 = v8;
    }
  }
  else
  {
  }
  -[UIView vui_sizeThatFits:](self, "vui_sizeThatFits:", v5, 0.0);
  result.CGFloat height = v11;
  result.double width = v10;
  return result;
}

- (id)_firstLabelSubview
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__16;
  double v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  uint64_t v2 = [(VUIMediaTagsView *)self subviews];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__VUIMediaTagsView__firstLabelSubview__block_invoke;
  v5[3] = &unk_1E6DF8378;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__VUIMediaTagsView__firstLabelSubview__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_textLayoutForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(VUIMediaTagsView *)self tagsViewLayout];
  uint64_t v6 = [v5 textLayout];
  if ([v4 isEqualToString:VUIMediaTagKeyImmersiveText])
  {
    uint64_t v7 = [v5 immersiveTextLayout];
  }
  else
  {
    if (![v4 isEqualToString:VUIMediaTagKeyHighMotionText]) {
      goto LABEL_6;
    }
    uint64_t v7 = [v5 highMotionTextLayout];
  }
  uint64_t v8 = (void *)v7;

  uint64_t v6 = v8;
LABEL_6:

  return v6;
}

- (id)_newLabelAsSubview:(id)a3 textLayout:(id)a4
{
  double v5 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:a4 existingLabel:a3];
  [(VUIMediaTagsView *)self vui_addSubview:v5 oldView:0];
  return v5;
}

- (id)_newLabelAsSubview:(id)a3 withAttributedString:(id)a4 textLayout:(id)a5
{
  uint64_t v6 = +[VUILabel labelWithAttributedString:a4 textLayout:a5 existingLabel:a3];
  [(VUIMediaTagsView *)self vui_addSubview:v6 oldView:0];
  return v6;
}

- (BOOL)_shouldApplyTintColor:(id)a3 forImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:VUIMediaTagKeyRatingImage])
  {
    LOBYTE(v7) = [v6 renderingMode] == 2;
  }
  else if (([v5 isEqualToString:VUIMediaTagKeyCommonSenseImage] & 1) != 0 {
         || ([v5 isEqualToString:VUIMediaTagKeyCommonSenseDarkImage] & 1) != 0
  }
         || ([v5 isEqualToString:VUIMediaTagKeyTomatoFreshnessImage] & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    int v7 = [v5 isEqualToString:VUIMediaTagKeyItunesExtras] ^ 1;
  }

  return v7;
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  self->_isSelected = a3;
  id v6 = [(VUIMediaTagsView *)self vuiTraitCollection];
  -[VUIMediaTagsView _updateImageAppearanceWithUserInterfaceStyle:](self, "_updateImageAppearanceWithUserInterfaceStyle:", [v6 vuiUserInterfaceStyle]);
}

- (id)_newImageViewAsSubview:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_new();
  if (v3)
  {
    id v6 = [(VUIMediaTagsView *)self tagsViewLayout];
    int v7 = [v6 badgeTintColor];
    [v5 _setTintColor:v7];
  }
  [v5 setVuiContentMode:1];
  [(VUIMediaTagsView *)self vui_addSubview:v5 oldView:0];
  return v5;
}

- (id)_newTextBadgeViewAsSubview:(id)a3 layout:(id)a4 withString:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = +[VUITextBadgeView badgeWithLayout:v8 existing:a3];
  id v11 = [v8 textLayout];

  if (v11)
  {
    id v12 = [v8 textLayout];
    uint64_t v13 = [v12 attributedStringWithString:v9];

    [v10 setAttributedTitle:v13];
  }
  [(VUIMediaTagsView *)self vui_addSubview:v10 oldView:0];

  return v10;
}

- (id)_newRentalExpirationlabel:(id)a3 exisitingLabel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && [v7 conformsToProtocol:&unk_1F3F867A0]) {
    [v8 setDelegate:0];
  }
  if (v6)
  {
    id v9 = [(VUIMediaTagsView *)self tagsViewLayout];
    double v10 = [v9 rentalExpirationTextLayout];
    id v11 = +[VUIRentalExpirationLabel labelWithExpirationDate:v6 textLayout:v10 existingLabel:v8 locStringPrefix:@"EXPIRATION_IN"];

    [v11 setDelegate:self];
    [(VUIMediaTagsView *)self vui_addSubview:v11 oldView:0];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)elementsArePlacedOnIndividualLines
{
  uint64_t v2 = [(VUIMediaTagsView *)self traitCollection];
  char v3 = [v2 isAXEnabled];

  return v3;
}

- (void)_updateImageAppearanceWithUserInterfaceStyle:(unint64_t)a3
{
  id v4 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = [(VUIMediaTagsViewLayout *)self->_tagsViewLayout badgeTintColor];
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    id v6 = [(VUIMediaTagsViewLayout *)v4->_tagsViewLayout highContrastBadgeTintColor];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(VUIMediaTagsView *)v4 _accessibilityHigherContrastTintColorForColor:v5];
    }
    id v9 = v8;

    id v5 = v9;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v10 = [v5 colorByRemovingTransparency];

    id v5 = (void *)v10;
  }
  if (v4->_isSelected)
  {
    uint64_t v11 = [(VUIMediaTagsViewLayout *)v4->_tagsViewLayout highlightColor];

    double v24 = (void *)v11;
  }
  else
  {
    double v24 = v5;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = [(VUIMediaTagsView *)v4 subviews];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    char v25 = v4;
    unint64_t v26 = a3;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v17;
          if ([v18 tag] == 101)
          {
            if (a3 == 2) {
              [(VUIMediaTagsView *)v4 commonSenseLightImage];
            }
            else {
            id v20 = [(VUIMediaTagsView *)v4 commonSenseDarkImage];
            }
            [v18 setImage:v20];
            goto LABEL_28;
          }
          if ([v18 tag] != 102)
          {
            double v19 = [(VUIMediaTagsView *)v4 viewsMap];
            id v20 = [v19 allKeysForObject:v18];

            if (v20 && [v20 count])
            {
              uint64_t v21 = [v20 firstObject];
              id v22 = [v18 image];
              BOOL v23 = [(VUIMediaTagsView *)v4 _shouldApplyTintColor:v21 forImage:v22];

              if (v23) {
                [v18 _setTintColor:v24];
              }

              id v4 = v25;
              a3 = v26;
            }
LABEL_28:
          }
          continue;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }
}

- (void)_updateAppearanceWithUserInterfaceStyle:(unint64_t)a3
{
  [(VUIMediaTagsView *)self _updateImageAppearanceWithUserInterfaceStyle:a3];
  [(VUIMediaTagsView *)self _removeSeparatorsFromGroupsIfNeeded:0];
}

- (void)_removeSeparatorsFromGroupsIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VUIMediaTagsView *)self elementsArePlacedOnIndividualLines] || v3)
  {
    id v5 = [(VUIMediaTagsView *)self viewsMap];
    id v31 = (id)[v5 mutableCopy];

    long long v30 = [v31 objectForKeyedSubscript:VUIMediaTagKeySeparator];
    [v30 removeFromSuperview];
    [v31 setObject:0 forKeyedSubscript:VUIMediaTagKeySeparator];
    id v6 = (void *)[v31 copy];
    [(VUIMediaTagsView *)self setViewsMap:v6];

    id v7 = [(VUIMediaTagsView *)self groupedSubviews];
    id v8 = (void *)[v7 mutableCopy];

    id v9 = [(VUIMediaTagsView *)self groupedSubviews];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        id v12 = [(VUIMediaTagsView *)self groupedSubviews];
        uint64_t v13 = [v12 objectAtIndexedSubscript:v11];
        uint64_t v14 = (void *)[v13 mutableCopy];

        uint64_t v15 = objc_opt_new();
        double v16 = [(VUIMediaTagsView *)self groupedSubviews];
        double v17 = [v16 objectAtIndexedSubscript:v11];
        uint64_t v18 = [v17 count];

        if (v18)
        {
          unint64_t v19 = 0;
          do
          {
            id v20 = [(VUIMediaTagsView *)self groupedSubviews];
            uint64_t v21 = [v20 objectAtIndexedSubscript:v11];
            id v22 = [v21 objectAtIndexedSubscript:v19];

            if ([v22 tag] == 100)
            {
              [v22 removeFromSuperview];
              [v15 addIndex:v19];
            }

            ++v19;
            BOOL v23 = [(VUIMediaTagsView *)self groupedSubviews];
            double v24 = [v23 objectAtIndexedSubscript:v11];
            unint64_t v25 = [v24 count];
          }
          while (v19 < v25);
        }
        unint64_t v26 = [v15 count];
        if (v26 <= [v14 count]) {
          [v14 removeObjectsAtIndexes:v15];
        }
        [v8 setObject:v14 atIndexedSubscript:v11];

        ++v11;
        long long v27 = [(VUIMediaTagsView *)self groupedSubviews];
        unint64_t v28 = [v27 count];
      }
      while (v11 < v28);
    }
    long long v29 = (void *)[v8 copy];
    [(VUIMediaTagsView *)self setGroupedSubviews:v29];

    [(VUIMediaTagsView *)self vui_setNeedsLayout];
  }
}

- (double)_totalSubviewsWidth
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VUIMediaTagsView *)self tagsViewLayout];
  id v60 = [v3 textLayout];

  uint64_t v67 = 0;
  double v68 = (double *)&v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__VUIMediaTagsView__totalSubviewsWidth__block_invoke;
  aBlock[3] = &unk_1E6DF90B0;
  void aBlock[4] = self;
  aBlock[5] = &v67;
  id v4 = (double (**)(void *, void *, double, double))_Block_copy(aBlock);
  unint64_t v5 = 0;
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v59 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v9 = 0.0;
  while (1)
  {
    uint64_t v10 = [(VUIMediaTagsView *)self groupedSubviews];
    unint64_t v58 = v5;
    BOOL v11 = v5 < [v10 count];

    if (!v11) {
      break;
    }
    id v12 = [(VUIMediaTagsView *)self groupedSubviews];
    uint64_t v13 = [v12 objectAtIndexedSubscript:v58];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    obuint64_t j = v13;
    uint64_t v14 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v63 != v15) {
            objc_enumerationMutation(obj);
          }
          double v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v60 margin];
            double v19 = v18;
            CGFloat v20 = v4[2](v4, v17, 0.0, 0.0);
            CGFloat v22 = v21;
            double v24 = v23;
            CGFloat v26 = v25;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v27 = [(VUIMediaTagsView *)self tagsViewLayout];
              [v27 badgeMargin];
              double v19 = v28;

              switch([v17 tag])
              {
                case 'e':
                  long long v29 = [(VUIMediaTagsView *)self tagsViewLayout];
                  [v29 commonSenseMargin];
                  goto LABEL_18;
                case 'f':
                  long long v29 = [(VUIMediaTagsView *)self tagsViewLayout];
                  [v29 tomatoMeterMargin];
                  goto LABEL_18;
                case 'm':
                  long long v29 = [(VUIMediaTagsView *)self tagsViewLayout];
                  [v29 immersiveMargin];
                  goto LABEL_18;
                case 'n':
                  long long v29 = [(VUIMediaTagsView *)self tagsViewLayout];
                  [v29 highMotionMargin];
LABEL_18:
                  double v19 = v30;

                  break;
                default:
                  break;
              }
              double v36 = (void *)MEMORY[0x1E4FB3C70];
              uint64_t v37 = [(VUIMediaTagsView *)self tagsViewLayout];
              [v37 badgeMaxHeight];
              double v39 = v38;
              long long v40 = [(VUIMediaTagsView *)self vuiTraitCollection];
              long long v41 = [(VUIMediaTagsView *)self tagsViewLayout];
              objc_msgSend(v36, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v40, objc_msgSend(v41, "badgeMaxContentSizeCategory"), v39);
              double v43 = v42;

              uint64_t v44 = [v17 image];
              [v44 size];
              double v45 = 0.0;
              if (v46 > 0.0)
              {
                [v44 size];
                if (v47 > 0.0)
                {
                  [v44 size];
                  double v49 = v48;
                  [v44 size];
                  double v45 = v49 / v50;
                }
              }
              CGFloat v20 = v4[2](v4, v17, v43, v45);
              CGFloat v22 = v51;
              double v24 = v52;
              CGFloat v26 = v53;
            }
            else
            {
              objc_opt_class();
              double v19 = 0.0;
              CGFloat v26 = v7;
              double v24 = v8;
              CGFloat v22 = v6;
              CGFloat v20 = v59;
              if (objc_opt_isKindOfClass())
              {
                CGFloat v20 = v4[2](v4, v17, 0.0, 0.0);
                CGFloat v22 = v31;
                double v24 = v32;
                CGFloat v26 = v33;
                char v34 = [(VUIMediaTagsView *)self tagsViewLayout];
                [v34 textBadgeMargin];
                double v19 = v35;
              }
            }
          }
          v73.origin.double x = v20;
          v73.origin.double y = v22;
          v73.size.double width = v24;
          v73.size.CGFloat height = v26;
          double MaxX = CGRectGetMaxX(v73);
          v68[3] = v19 + v24 + v68[3];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
      }
      while (v14);
      double v9 = v19 + MaxX;
    }

    uint64_t v55 = [(VUIMediaTagsView *)self tagsViewLayout];
    [v55 groupMargin];
    v68[3] = v56 + v68[3];

    unint64_t v5 = v58 + 1;
  }

  _Block_object_dispose(&v67, 8);
  return v9;
}

double __39__VUIMediaTagsView__totalSubviewsWidth__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) bounds];
  double v5 = v4;
  double v7 = v6;
  if ([v3 tag] == 110)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = [*(id *)(a1 + 32) tagsViewLayout];
      [v8 badgeMaxHeight];
      double v7 = v9;
      double v5 = 0.0;
    }
  }
  objc_msgSend(v3, "vui_sizeThatFits:", v5, v7);
  if (v11 == *MEMORY[0x1E4F1DB30] && v10 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    uint64_t v13 = (double *)MEMORY[0x1E4F1DB28];
  }
  else {
    uint64_t v13 = (double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  double v14 = *v13;

  return v14;
}

- (void)_removeGenreLabelAndSeparator
{
  id v3 = [(VUIMediaTagsView *)self subviews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      double v6 = [(VUIMediaTagsView *)self subviews];
      id v15 = [v6 objectAtIndexedSubscript:v5];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v7 = [v15 labelName];
        int v8 = [v7 isEqualToString:VUIMediaTagKeyGenre];

        if (v8) {
          break;
        }
      }

      if (v4 == ++v5) {
        return;
      }
    }
    [(VUIMediaTagsView *)self totalSubviewsWidth];
    double v10 = v9;
    [(VUIMediaTagsView *)self bounds];
    objc_msgSend(v15, "vui_sizeThatFits:", v11, v12);
    double v14 = v10 - v13;
    [v15 setHidden:1];
    [(VUIMediaTagsView *)self setTotalSubviewsWidth:v14];
  }
}

- (void)_addGenreLabelAndSeparator
{
  id v3 = [(VUIMediaTagsView *)self subviews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      double v6 = [(VUIMediaTagsView *)self subviews];
      id v9 = [v6 objectAtIndexedSubscript:v5];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v7 = [v9 labelName];
        int v8 = [v7 isEqualToString:VUIMediaTagKeyGenre];

        if (v8) {
          break;
        }
      }

      if (v4 == ++v5) {
        return;
      }
    }
    [v9 setHidden:0];
    [(VUIMediaTagsView *)self _totalSubviewsWidth];
    -[VUIMediaTagsView setTotalSubviewsWidth:](self, "setTotalSubviewsWidth:");
  }
}

- (void)contrastSettingsDidChange
{
  id v3 = [(VUIMediaTagsView *)self vuiTraitCollection];
  -[VUIMediaTagsView _updateImageAppearanceWithUserInterfaceStyle:](self, "_updateImageAppearanceWithUserInterfaceStyle:", [v3 vuiUserInterfaceStyle]);
}

- (void)transparencySettingsDidChange
{
  id v3 = [(VUIMediaTagsView *)self vuiTraitCollection];
  -[VUIMediaTagsView _updateImageAppearanceWithUserInterfaceStyle:](self, "_updateImageAppearanceWithUserInterfaceStyle:", [v3 vuiUserInterfaceStyle]);
}

- (double)vuiBaselineHeight
{
  return self->vuiBaselineHeight;
}

- (VUIMediaTagsViewLayout)tagsViewLayout
{
  return self->_tagsViewLayout;
}

- (NSDictionary)viewsMap
{
  return self->_viewsMap;
}

- (void)setViewsMap:(id)a3
{
}

- (NSArray)groupedSubviews
{
  return self->_groupedSubviews;
}

- (void)setGroupedSubviews:(id)a3
{
}

- (double)totalSubviewsWidth
{
  return self->_totalSubviewsWidth;
}

- (void)setTotalSubviewsWidth:(double)a3
{
  self->_totalSubviewsWidth = a3;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (UIImage)commonSenseLightImage
{
  return self->_commonSenseLightImage;
}

- (void)setCommonSenseLightImage:(id)a3
{
}

- (UIImage)commonSenseDarkImage
{
  return self->_commonSenseDarkImage;
}

- (void)setCommonSenseDarkImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonSenseDarkImage, 0);
  objc_storeStrong((id *)&self->_commonSenseLightImage, 0);
  objc_storeStrong((id *)&self->_groupedSubviews, 0);
  objc_storeStrong((id *)&self->_viewsMap, 0);
  objc_storeStrong((id *)&self->_tagsViewLayout, 0);
}

@end