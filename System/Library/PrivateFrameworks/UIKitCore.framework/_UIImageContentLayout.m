@interface _UIImageContentLayout
+ (id)layoutForSource:(id)a3 inTarget:(id)a4 withSize:(CGSize)a5;
- (BOOL)hasContents;
- (BOOL)symbolLayerNeedsHorizontalFlip;
- (CGAffineTransform)contentsTransform;
- (CGAffineTransform)symbolLayerPositionTransform;
- (CGSize)contentsSize;
- (CGSize)renderSize;
- (NSArray)contentEffects;
- (UIColor)contentsMultiplyColor;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)contentInsets;
- (_UIImageContentRBSymbolConfiguration)rbSymbolConfiguration;
- (double)baselineOffsetFromBottom;
- (double)contentsScaleFactor;
- (id)contents;
- (id)description;
- (unsigned)contentDrawMode;
- (void)_materializeRenditionContents;
- (void)drawInContext:(CGContext *)a3 withSize:(CGSize)a4;
@end

@implementation _UIImageContentLayout

+ (id)layoutForSource:(id)a3 inTarget:(id)a4 withSize:(CGSize)a5
{
  void (**v114)(void *__return_ptr);
  double v115;
  double v116;
  uint64_t v117;
  double v118;
  char *v119;
  CGAffineTransform v120;
  void aBlock[4];
  id v122;
  char *v123;
  uint64_t *v124;
  double v125;
  double v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  double v131;
  double v132;
  double v133;
  char v134;
  uint64_t v135;
  float64x2_t *v136;
  uint64_t v137;
  void *v138;
  double v139;
  double v140;
  id v141;
  id v142;
  uint64_t v143;
  objc_super v144;
  CGAffineTransform v145;
  double v146;
  double v147;
  double v148;
  CGFloat v149;
  uint64_t vars8;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;

  v5 = 0;
  if (a3 && a4)
  {
    double height = a5.height;
    double width = a5.width;
    id v10 = a4;
    id v11 = a3;
    v5 = (char *)objc_alloc((Class)a1);
    id v12 = v11;
    id v13 = v10;
    if (v5)
    {
      v144.receiver = v5;
      v144.super_class = (Class)_UIImageContentLayout;
      v5 = objc_msgSendSuper2(&v144, sel_init);
      if (v5)
      {
        v14 = [v12 content];
        v142 = 0;
        v143 = 0;
        v141 = 0;
        __copy_assignment_8_8_s0_s8_t16w8((uint64_t)(v5 + 24), (uint64_t)&v141);
        [v14 size];
        *((void *)v5 + 11) = v15;
        *((void *)v5 + 12) = v16;
        uint64_t v17 = MEMORY[0x1E4F1DAB8];
        long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)(v5 + 184) = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)(v5 + 200) = v18;
        *(_OWORD *)(v5 + 216) = *(_OWORD *)(v17 + 32);
        [v13 preferredContentScaleFactor];
        *((void *)v5 + 8) = v19;
        [v14 vectorScale];
        *(_OWORD *)(v5 + 120) = 0u;
        *((void *)v5 + 6) = v20;
        *(_OWORD *)(v5 + 136) = 0u;
        *(_OWORD *)(v5 + 152) = 0u;
        *(_OWORD *)(v5 + 168) = 0u;
        *(_OWORD *)(v5 + 104) = *MEMORY[0x1E4F1DB30];
        *((void *)v5 + 9) = 0;
        *((void *)v5 + 10) = 0;
        v5[8] &= ~1u;
        unint64_t v21 = [v13 contentMode];
        [v12 _fullSize];
        v115 = v23;
        v116 = v22;
        [v14 size];
        v118 = v24;
        double v113 = v25;
        [v12 _contentInsets];
        double v26 = UISizeRoundToScale(width, height, *((double *)v5 + 8));
        double v28 = v27;
        UIUserInterfaceLayoutDirection v29 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v13 semanticContentAttribute]);
        uint64_t v30 = [v12 _imageOrientationConsideringRTLForUserInterfaceLayoutDirection:v29];
        uint64_t v31 = [v12 _imageOrientationForSymbolLayerConsideringRTLForUserInterfaceLayoutDirection:v29];
        [v12 alignmentRectInsets];
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        [v13 _additionalAlignmentRectInsetsForRenderingSource:v12];
        double v41 = v33 + v40;
        double v43 = v35 + v42;
        double v45 = v37 + v44;
        *((double *)v5 + 19) = v33 + v40;
        *((double *)v5 + 20) = v35 + v42;
        double v47 = v39 + v46;
        *((double *)v5 + 21) = v37 + v44;
        *((double *)v5 + 22) = v39 + v46;
        double v48 = v41;
        double v49 = v35 + v42;
        double v50 = v37 + v44;
        switch(v30)
        {
          case 0:
            goto LABEL_17;
          case 1:
          case 5:
            double v48 = v45;
            double v49 = v47;
            double v50 = v41;
            double v47 = v43;
            goto LABEL_10;
          case 2:
          case 6:
            double v48 = v47;
            double v49 = v41;
            double v50 = v43;
            double v47 = v45;
            goto LABEL_10;
          case 3:
          case 7:
            double v48 = v43;
            double v49 = v45;
            double v50 = v47;
            double v47 = v41;
            goto LABEL_10;
          case 4:
            goto LABEL_10;
          default:
            double v48 = v41;
            double v49 = v43;
            double v50 = v45;
LABEL_10:
            if ((unint64_t)(v30 - 6) < 2)
            {
              double v51 = v50;
              double v52 = v49;
              double v50 = v48;
            }
            else
            {
              double v51 = v48;
              if ((unint64_t)(v30 - 4) <= 1)
              {
                double v52 = v47;
                goto LABEL_16;
              }
              double v52 = v49;
            }
            double v49 = v47;
LABEL_16:
            *((double *)v5 + 19) = v51;
            *((double *)v5 + 20) = v52;
            *((double *)v5 + 21) = v50;
            *((double *)v5 + 22) = v49;
LABEL_17:
            BOOL v53 = v28 <= 0.0 || v26 <= 0.0;
            if ((!v53 || v21 >= 4) && v118 > 0.0 && v113 > 0.0)
            {
              if (objc_msgSend(v14, "canScaleImageToTargetResolution", v113, v49, v50, v48)
                && ![v12 _isResizable])
              {
                char v56 = 1;
              }
              else
              {
                [v14 scale];
                *((double *)v5 + 8) = v54;
                double v26 = UISizeRoundToScale(width, height, v54);
                double v28 = v55;
                char v56 = 0;
              }
              unint64_t v112 = v21;
              if ([v13 _layoutShouldFlipHorizontalOrientations])
              {
                uint64_t v57 = v30 - 2;
                if (unint64_t)(v30 - 2) <= 5 && ((0x33u >> v57)) {
                  uint64_t v30 = qword_186B99200[v57];
                }
              }
              v135 = 0;
              v136 = (float64x2_t *)&v135;
              v137 = 0x3010000000;
              v138 = &unk_186D7DBA7;
              v139 = v118;
              v140 = v113;
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __56___UIImageContentLayout_initWithSource_target_withSize___block_invoke;
              aBlock[3] = &unk_1E52F3140;
              v125 = v118;
              v126 = v113;
              id v58 = v12;
              v122 = v58;
              v127 = v112;
              v128 = 0;
              v129 = 0;
              v130 = v26;
              v131 = v28;
              v132 = v116;
              v133 = v115;
              v134 = v56;
              v119 = v5;
              v123 = v119;
              v124 = &v135;
              v114 = (void (**)(void *__return_ptr))_Block_copy(aBlock);
              ((void (**)(CGAffineTransform *__return_ptr))v114)[2](&v145);
              long long v59 = *(_OWORD *)&v145.c;
              *(_OWORD *)(v5 + 184) = *(_OWORD *)&v145.a;
              *(_OWORD *)(v5 + 200) = v59;
              *(_OWORD *)(v5 + 216) = *(_OWORD *)&v145.tx;
              if (v30 == v31)
              {
                long long v60 = *(_OWORD *)(v5 + 184);
                long long v61 = *(_OWORD *)(v5 + 200);
                *(_OWORD *)(v119 + 264) = *(_OWORD *)(v5 + 216);
                *(_OWORD *)(v119 + 248) = v61;
                *(_OWORD *)(v119 + 232) = v60;
              }
              else
              {
                ((void (**)(CGAffineTransform *__return_ptr))v114)[2](&v145);
                long long v62 = *(_OWORD *)&v145.c;
                *(_OWORD *)(v119 + 232) = *(_OWORD *)&v145.a;
                *(_OWORD *)(v119 + 248) = v62;
                *(_OWORD *)(v119 + 264) = *(_OWORD *)&v145.tx;
                v119[56] = 1;
              }
              v63 = v136;
              v136[2] = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v136[2]), (int8x16_t)vnegq_f64(v136[2]), (int8x16_t)v136[2]);
              *(float64x2_t *)(v5 + 104) = v63[2];
              objc_msgSend(v58, "baselineOffsetFromBottom", v31);
              double v65 = v64;
              if (v64 == 0.0)
              {
                double v66 = *((double *)v5 + 10);
              }
              else
              {
                memset(&v145, 0, sizeof(v145));
                LayerContentModeTransform(v112, (uint64_t)&v145, 0.0, 0.0, v26, v28, v116, v115);
                UIRoundToScale(v145.ty + v145.b * 0.0 + v65 * v145.d, *((double *)v5 + 8));
                *((double *)v5 + 10) = v66;
              }
              UIRoundToScale(v28 - v66, *((double *)v5 + 8));
              *((void *)v5 + 9) = v67;
              [v58 _contentInsets];
              CGFloat v69 = *MEMORY[0x1E4F1DAD8] + v68;
              CGFloat v71 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) + v70;
              CGFloat v73 = v116 - (v68 + v72);
              CGFloat v75 = v115 - (v70 + v74);
              memset(&v145, 0, sizeof(v145));
              LayerContentModeTransform(v112, (uint64_t)&v145, 0.0, 0.0, v26, v28, v116, v115);
              v120 = v145;
              v151.origin.CGFloat x = v69;
              v151.origin.CGFloat y = v71;
              v151.size.double width = v73;
              v151.size.double height = v75;
              v152 = CGRectApplyAffineTransform(v151, &v120);
              CGFloat x = v152.origin.x;
              CGFloat y = v152.origin.y;
              CGFloat v78 = v152.size.width;
              CGFloat v79 = v152.size.height;
              double MinY = CGRectGetMinY(v152);
              v153.origin.CGFloat x = 0.0;
              v153.origin.CGFloat y = 0.0;
              v153.size.double width = v26;
              v153.size.double height = v28;
              CGFloat v81 = CGRectGetMinY(v153);
              UIRoundToScale(MinY - v81, *((double *)v5 + 8));
              v117 = v82;
              v154.origin.CGFloat x = x;
              v154.origin.CGFloat y = y;
              v154.size.double width = v78;
              v154.size.double height = v79;
              double MinX = CGRectGetMinX(v154);
              v155.origin.CGFloat x = 0.0;
              v155.origin.CGFloat y = 0.0;
              v155.size.double width = v26;
              v155.size.double height = v28;
              CGFloat v84 = CGRectGetMinX(v155);
              UIRoundToScale(MinX - v84, *((double *)v5 + 8));
              uint64_t v86 = v85;
              v156.origin.CGFloat x = 0.0;
              v156.origin.CGFloat y = 0.0;
              v156.size.double width = v26;
              v156.size.double height = v28;
              double MaxY = CGRectGetMaxY(v156);
              v157.origin.CGFloat x = x;
              v157.origin.CGFloat y = y;
              v157.size.double width = v78;
              v157.size.double height = v79;
              CGFloat v88 = CGRectGetMaxY(v157);
              UIRoundToScale(MaxY - v88, *((double *)v5 + 8));
              uint64_t v90 = v89;
              v158.origin.CGFloat x = 0.0;
              v158.origin.CGFloat y = 0.0;
              v158.size.double width = v26;
              v158.size.double height = v28;
              double MaxX = CGRectGetMaxX(v158);
              v159.origin.CGFloat x = x;
              v159.origin.CGFloat y = y;
              v159.size.double width = v78;
              v159.size.double height = v79;
              CGFloat v92 = CGRectGetMaxX(v159);
              UIRoundToScale(MaxX - v92, *((double *)v5 + 8));
              *((void *)v5 + 15) = v117;
              *((void *)v119 + 16) = v86;
              *((void *)v119 + 17) = v90;
              *((void *)v119 + 18) = v93;
              double v94 = v136[2].f64[0];
              double v95 = v136[2].f64[1];
              id v96 = v58;
              id v97 = v13;
              v98 = [v96 content];
              double v99 = *((double *)v5 + 8);
              [v97 preferredContentScaleFactor];
              CGFloat v101 = v100;
              if ((unint64_t)[v97 contentMode] > 3 || v94 != 0.0 && v95 != 0.0)
              {
                v102 = [v97 _effectForRenderingSource:v96];
                if (v102)
                {
                  v103 = +[_UIImageContentContextualEffect contextualEffectWithEffect:source:]((uint64_t)_UIImageContentContextualEffect, v102, v96);
                }
                else
                {
                  v103 = 0;
                }

                [v98 size];
                if (vabdd_f64(v95, v105) < 0.00000011920929
                  && vabdd_f64(v94, v104) < 0.00000011920929
                  && ([v98 scale], v99 == v106)
                  && [v97 _supportsContents]
                  && [v98 prefersProvidingNonCGImageContentsDirectlyForRendering])
                {
                  *(void *)&v145.a = MEMORY[0x1E4F143A8];
                  *(void *)&v145.b = 3221225472;
                  *(void *)&v145.c = __61___UIImageContentLayout__prepareContentOfSize_source_target___block_invoke;
                  *(void *)&v145.d = &unk_1E52F3168;
                  *(void *)&v145.tCGFloat x = v98;
                  v145.tCGFloat y = v101;
                  v107 = _Block_copy(&v145);
                  v108 = (void *)*((void *)v119 + 2);
                  *((void *)v119 + 2) = v107;

                  v5[8] &= ~1u;
                }
                else
                {
                  *(void *)&v145.a = MEMORY[0x1E4F143A8];
                  *(void *)&v145.b = 3221225472;
                  *(void *)&v145.c = __61___UIImageContentLayout__prepareContentOfSize_source_target___block_invoke_2;
                  *(void *)&v145.d = &unk_1E52F3190;
                  *(void *)&v145.tCGFloat x = v98;
                  v146 = v94;
                  v147 = v95;
                  v148 = v99;
                  *(void *)&v145.tCGFloat y = v103;
                  v149 = v101;
                  v109 = _Block_copy(&v145);
                  v110 = (void *)*((void *)v119 + 2);
                  *((void *)v119 + 2) = v109;

                  v5[8] |= 1u;
                }
              }
              _Block_object_dispose(&v135, 8);
            }

            break;
        }
      }
    }
  }
  return v5;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSArray)contentEffects
{
  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  rendition = self->_contentInfo.rendition;
  if (rendition) {
    return rendition->_effects;
  }
  else {
    return 0;
  }
}

- (unsigned)contentDrawMode
{
  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  rendition = self->_contentInfo.rendition;
  if (rendition) {
    return rendition->_drawMode;
  }
  else {
    return 0;
  }
}

- (CGAffineTransform)contentsTransform
{
  long long v3 = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[4].d;
  return self;
}

- (double)contentsScaleFactor
{
  return self->_contentsScaleFactor;
}

- (id)contents
{
  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  contents = self->_contentInfo.contents;
  return contents;
}

- (UIColor)contentsMultiplyColor
{
  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  rendition = self->_contentInfo.rendition;
  if (rendition) {
    return rendition->_multiplyColor;
  }
  else {
    return 0;
  }
}

- (void)_materializeRenditionContents
{
  void (**v2)(void *__return_ptr, void *);
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1)
  {
    v2 = (void (**)(void *__return_ptr, void *))_Block_copy(*(const void **)(a1 + 16));
    if (v2)
    {
      long long v3 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;

      v2[2](&v8, v2);
      v4 = v8;
      v8 = 0;
      v5 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v4;

      v6 = v9;
      v9 = 0;
      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      *(void *)(a1 + 40) = v10;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contentInfoGenerator, 0);
}

- (double)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (BOOL)hasContents
{
  return self->_contentInfo.contents || self->_contentInfoGenerator != 0;
}

- (_UIImageContentRBSymbolConfiguration)rbSymbolConfiguration
{
  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  rendition = self->_contentInfo.rendition;
  return (_UIImageContentRBSymbolConfiguration *)-[_UIImageContentRendition rbSymbolConfiguration](rendition);
}

- (void)drawInContext:(CGContext *)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)self);
  CGContextSaveGState(a3);
  CGContextScaleCTM(a3, width / self->_renderSize.width, height / self->_renderSize.height);
  double contentsScaleFactor = self->_contentsScaleFactor;
  if (contentsScaleFactor <= 0.0)
  {
    v9 = +[UIScreen mainScreen];
    [v9 scale];
    double contentsScaleFactor = v10;
  }
  CGContextScaleCTM(a3, contentsScaleFactor / self->_contentsVectorScale, contentsScaleFactor / self->_contentsVectorScale);
  CGContextTranslateCTM(a3, -self->_contentInsets.left, -self->_contentInsets.top);
  CGContextScaleCTM(a3, 1.0 / self->_contentsScaleFactor, 1.0 / self->_contentsScaleFactor);
  memset(&v16, 0, sizeof(v16));
  CGContextGetCTM(&v16, a3);
  double var0 = self->_contentInfo.var0;
  CGFloat v12 = self->_contentInsets.left * var0;
  CGFloat v13 = var0 * self->_contentInsets.top;
  CGAffineTransform v14 = v16;
  CGAffineTransformTranslate(&v15, &v14, v12, v13);
  CGAffineTransform v16 = v15;
  CGContextSetCTM();
  -[_UIImageContentRendition drawInContext:]((uint64_t)self->_contentInfo.rendition);
  CGContextRestoreGState(a3);
}

- (id)description
{
  long long v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CGFloat a = self->_contentsTransform.a;
  CGFloat b = self->_contentsTransform.b;
  CGFloat c = self->_contentsTransform.c;
  CGFloat d = self->_contentsTransform.d;
  tCGFloat x = self->_contentsTransform.tx;
  tCGFloat y = self->_contentsTransform.ty;
  if (*(unsigned char *)&self->_flags) {
    id v11 = @"(CGImage)";
  }
  else {
    id v11 = &stru_1ED0E84C0;
  }
  if (self->_contentInfoGenerator)
  {
    int v12 = 0;
    CGFloat v13 = @"pending";
  }
  else if (self->_contentInfo.contents)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%p", self->_contentInfo.contents);
    CGFloat v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
    CGFloat v13 = @"none";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p transform=(%g,%g,%g,%g;%g,%g) contents=%@%@ scale=%g insets=(%g,%g,%g,%g)>",
    v4,
    self,
    *(void *)&a,
    *(void *)&b,
    *(void *)&c,
    *(void *)&d,
    *(void *)&tx,
    *(void *)&ty,
    v11,
    v13,
    *(void *)&self->_contentsScaleFactor,
    *(void *)&self->_contentInsets.top,
    *(void *)&self->_contentInsets.left,
    *(void *)&self->_contentInsets.bottom,
  CGAffineTransform v14 = *(void *)&self->_contentInsets.right);
  if (v12) {

  }
  return v14;
}

- (CGAffineTransform)symbolLayerPositionTransform
{
  long long v3 = *(_OWORD *)&self[5].b;
  *(_OWORD *)&retstr->CGFloat a = *(_OWORD *)&self[4].ty;
  *(_OWORD *)&retstr->CGFloat c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[5].d;
  return self;
}

- (BOOL)symbolLayerNeedsHorizontalFlip
{
  return self->_symbolLayerNeedsHorizontalFlip;
}

- (CGSize)contentsSize
{
  double width = self->_contentsSize.width;
  double height = self->_contentsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)renderSize
{
  double width = self->_renderSize.width;
  double height = self->_renderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end