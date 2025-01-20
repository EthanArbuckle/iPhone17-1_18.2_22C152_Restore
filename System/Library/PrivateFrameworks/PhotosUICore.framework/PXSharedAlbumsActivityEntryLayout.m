@interface PXSharedAlbumsActivityEntryLayout
- (PXSharedAlbumsActivityEntryLayout)initWithItem:(id)a3;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (unsigned)decorationOverlayAnchorSpriteIndex;
- (void)displayScaleDidChange;
- (void)referenceSizeDidChange;
- (void)update;
@end

@implementation PXSharedAlbumsActivityEntryLayout

- (void).cxx_destruct
{
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
}

- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 33;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 1;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"PXSharedAlbumsActivityEntryViewController.m" lineNumber:458 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_countsSpriteIndex == a3)
  {
    v8 = NSString;
    v9 = [(PXSharedAlbumsActivityEntryItem *)self->_item assets];
    v10 = objc_msgSend(v8, "localizedStringWithFormat:", @"%lu", objc_msgSend(v9, "count"));

    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (_TextAttributesForCounts_predicate != -1) {
      dispatch_once(&_TextAttributesForCounts_predicate, &__block_literal_global_387_125779);
    }
    uint64_t v12 = _TextAttributesForCounts__textAttributes;
LABEL_13:
    v16 = (void *)[v11 initWithString:v10 attributes:v12];
    goto LABEL_14;
  }
  if (self->_contributorSpriteIndex != a3)
  {
    if (self->_messageSpriteIndex != a3)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"PXSharedAlbumsActivityEntryViewController.m" lineNumber:453 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v10 = [(PXSharedAlbumsActivityEntryItem *)self->_item message];
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (_TextAttributesForMessage_predicate != -1) {
      dispatch_once(&_TextAttributesForMessage_predicate, &__block_literal_global_394_125781);
    }
    uint64_t v12 = _TextAttributesForMessage__textAttributes;
    goto LABEL_13;
  }
  v10 = [(PXSharedAlbumsActivityEntryItem *)self->_item contributorDisplayName];
  v13 = [(PXSharedAlbumsActivityEntryItem *)self->_item albumName];
  v14 = [NSString stringWithFormat:@"%@ / %@", v10, v13];
  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (_TextAttributesForContributor_predicate != -1) {
    dispatch_once(&_TextAttributesForContributor_predicate, &__block_literal_global_392);
  }
  v16 = (void *)[v15 initWithString:v14 attributes:_TextAttributesForContributor__textAttributes];

LABEL_14:
  return v16;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"PXSharedAlbumsActivityEntryViewController.m" lineNumber:437 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (colorAtIndex_inLayout__predicate != -1) {
    dispatch_once(&colorAtIndex_inLayout__predicate, &__block_literal_global_263_125792);
  }
  if (self->_backgroundSpriteIndex == a3)
  {
    v8 = &colorAtIndex_inLayout___backgroundColor;
  }
  else if (self->_assetSpriteIndex == a3)
  {
    v8 = &colorAtIndex_inLayout___assetBackgroundColor;
  }
  else
  {
    if (self->_countsBackgroundSpriteIndex != a3)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXSharedAlbumsActivityEntryViewController.m" lineNumber:430 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v8 = &colorAtIndex_inLayout___countsBackgroundColor;
  }
  id v9 = (id)*v8;

  return v9;
}

void __59__PXSharedAlbumsActivityEntryLayout_colorAtIndex_inLayout___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithWhite:0.95 alpha:1.0];
  v1 = (void *)colorAtIndex_inLayout___backgroundColor;
  colorAtIndex_inLayout___backgroundColor = v0;

  uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
  v3 = (void *)colorAtIndex_inLayout___assetBackgroundColor;
  colorAtIndex_inLayout___assetBackgroundColor = v2;

  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.85 alpha:1.0];
  v5 = (void *)colorAtIndex_inLayout___countsBackgroundColor;
  colorAtIndex_inLayout___countsBackgroundColor = v4;
}

- (void)update
{
}

void __43__PXSharedAlbumsActivityEntryLayout_update__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 860));
  CGFloat v6 = *(double *)(a1 + 40);
  CGFloat v7 = *(double *)(a1 + 48);
  CGFloat v8 = *(double *)(a1 + 56);
  CGFloat v9 = *(double *)(a1 + 64);
  v133.origin.x = v6;
  v133.origin.y = v7;
  v133.size.width = v8;
  v133.size.height = v9;
  CGFloat MidX = CGRectGetMidX(v133);
  v134.origin.x = v6;
  v134.origin.y = v7;
  v134.size.width = v8;
  v134.size.height = v9;
  CGFloat MidY = CGRectGetMidY(v134);
  v135.origin.x = v6;
  v135.origin.y = v7;
  v135.size.width = v8;
  v135.size.height = v9;
  CGFloat Width = CGRectGetWidth(v135);
  v136.origin.x = v6;
  v136.origin.y = v7;
  v136.size.width = v8;
  v136.size.height = v9;
  CGFloat Height = CGRectGetHeight(v136);
  v13.f64[0] = Width;
  v13.f64[1] = Height;
  *(CGFloat *)v5 = MidX;
  *(CGFloat *)&v5[1] = MidY;
  v5[2] = (float32x2_t)0xBFB99999A0000000;
  v5[3] = vcvt_f32_f64(v13);
  v14 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 860));
  long long v15 = *((_OWORD *)off_1E5DAAF90 + 1);
  long long v132 = *(_OWORD *)off_1E5DAAF90;
  _OWORD *v14 = *(_OWORD *)off_1E5DAAF90;
  v14[1] = v15;
  long long v129 = *((_OWORD *)off_1E5DAAF90 + 5);
  long long v130 = v15;
  long long v16 = *((_OWORD *)off_1E5DAAF90 + 4);
  v14[4] = v16;
  v14[5] = v129;
  long long v127 = *((_OWORD *)off_1E5DAAF90 + 3);
  long long v128 = v16;
  long long v17 = *((_OWORD *)off_1E5DAAF90 + 2);
  v14[2] = v17;
  v14[3] = v127;
  long long v125 = *((_OWORD *)off_1E5DAAF90 + 9);
  long long v126 = v17;
  long long v18 = *((_OWORD *)off_1E5DAAF90 + 8);
  v14[8] = v18;
  v14[9] = v125;
  long long v123 = *((_OWORD *)off_1E5DAAF90 + 7);
  long long v124 = v18;
  long long v122 = *((_OWORD *)off_1E5DAAF90 + 6);
  v14[6] = v122;
  v14[7] = v123;
  __asm { FMOV            V0.4S, #20.0 }
  *(_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 860) + 36) = _Q0;
  uint64_t v24 = a3[4];
  uint64_t v25 = v24 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 860);
  ++*(_WORD *)(v25 + 32);
  *(unsigned char *)(v24 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 860) + 1) = 5;
  __asm { FMOV            V14.2S, #1.0 }
  *(void *)(v24 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 860) + 8) = _D14;
  v27 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 856));
  CGFloat v28 = *(double *)(a1 + 72);
  CGFloat v29 = *(double *)(a1 + 80);
  CGFloat v30 = *(double *)(a1 + 88);
  CGFloat v31 = *(double *)(a1 + 96);
  *(CGFloat *)&_Q0 = v28;
  *(CGFloat *)&long long v18 = v29;
  CGFloat v32 = v30;
  CGFloat v33 = v31;
  CGFloat v34 = CGRectGetMidX(*(CGRect *)((char *)&v18 - 8));
  v137.origin.x = v28;
  v137.origin.y = v29;
  v137.size.width = v30;
  v137.size.height = v31;
  CGFloat v35 = CGRectGetMidY(v137);
  v138.origin.x = v28;
  v138.origin.y = v29;
  v138.size.width = v30;
  v138.size.height = v31;
  CGFloat v117 = CGRectGetWidth(v138);
  v139.origin.x = v28;
  v139.origin.y = v29;
  v139.size.width = v30;
  v139.size.height = v31;
  CGFloat v36 = CGRectGetHeight(v139);
  v37.f64[0] = v117;
  v37.f64[1] = v36;
  *(CGFloat *)v27 = v34;
  *(CGFloat *)&v27[1] = v35;
  v27[2] = (float32x2_t)0xBFC99999A0000000;
  v27[3] = vcvt_f32_f64(v37);
  v38 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 856));
  _OWORD *v38 = v132;
  v38[1] = v130;
  v38[4] = v128;
  v38[5] = v129;
  v38[2] = v126;
  v38[3] = v127;
  v38[8] = v124;
  v38[9] = v125;
  v38[6] = v122;
  v38[7] = v123;
  uint64_t v39 = a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 856);
  unint64_t v40 = 10;
  if (!*(unsigned char *)(a1 + 272)) {
    unint64_t v40 = 5;
  }
  float v41 = 20.0;
  if (*(unsigned char *)(a1 + 272)) {
    float v42 = 20.0;
  }
  else {
    float v42 = 0.0;
  }
  if ((v40 & 4) == 0) {
    float v41 = 0.0;
  }
  __asm { FMOV            V3.2S, #20.0 }
  *(int8x8_t *)(v39 + 36) = vbic_s8(_D3, (int8x8_t)vmovn_s64(vceqzq_s64((int64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(v40), (int8x16_t)xmmword_1AB2ED380))));
  *(float *)(v39 + 44) = v41;
  *(float *)(v39 + 48) = v42;
  uint64_t v44 = a3[4];
  uint64_t v45 = v44 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 856);
  ++*(_WORD *)(v45 + 32);
  if (*(unsigned char *)(a1 + 273))
  {
    *(float32x4_t *)(a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 856) + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 104)), *(float64x2_t *)(a1 + 120));
    *(unsigned char *)(a3[4] + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 856) + 1) = 2;
    PXSizeScale();
  }
  *(unsigned char *)(v44 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 856) + 1) = 5;
  *(void *)(v44 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 856) + 8) = _D14;
  uint64_t v46 = *(unsigned int *)(*(void *)(a1 + 32) + 864);
  uint64_t v47 = a3[2];
  if (*(unsigned char *)(a1 + 274))
  {
    v48 = (float32x2_t *)(v47 + 32 * v46);
    CGFloat v49 = *(double *)(a1 + 144);
    CGFloat v50 = *(double *)(a1 + 152);
    CGFloat v51 = *(double *)(a1 + 160);
    CGFloat v52 = *(double *)(a1 + 168);
    v140.origin.x = v49;
    v140.origin.y = v50;
    v140.size.width = v51;
    v140.size.height = v52;
    CGFloat v53 = CGRectGetMidX(v140);
    v141.origin.x = v49;
    v141.origin.y = v50;
    v141.size.width = v51;
    v141.size.height = v52;
    CGFloat v54 = CGRectGetMidY(v141);
    v142.origin.x = v49;
    v142.origin.y = v50;
    v142.size.width = v51;
    v142.size.height = v52;
    CGFloat v118 = CGRectGetWidth(v142);
    v143.origin.x = v49;
    v143.origin.y = v50;
    v143.size.width = v51;
    v143.size.height = v52;
    CGFloat v55 = CGRectGetHeight(v143);
    v56.f64[0] = v118;
    v56.f64[1] = v55;
    *(CGFloat *)v48 = v53;
    *(CGFloat *)&v48[1] = v54;
    v48[2] = (float32x2_t)0xBFD3333340000000;
    v48[3] = vcvt_f32_f64(v56);
    v57 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 864));
    _OWORD *v57 = v132;
    v57[1] = v130;
    v57[4] = v128;
    v57[5] = v129;
    v57[2] = v126;
    v57[3] = v127;
    v57[8] = v124;
    v57[9] = v125;
    v57[6] = v122;
    v57[7] = v123;
    __asm { FMOV            V0.4S, #5.0 }
    *(_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 864) + 36) = _Q0;
    uint64_t v59 = a3[4];
    uint64_t v60 = v59 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 864);
    ++*(_WORD *)(v60 + 32);
    *(unsigned char *)(v59 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 864) + 1) = 5;
    *(void *)(v59 + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 864) + 8) = _D14;
    v61 = (float32x2_t *)(a3[2] + 32 * *(unsigned int *)(*(void *)(a1 + 32) + 868));
    CGFloat v62 = *(double *)(a1 + 176);
    CGFloat v63 = *(double *)(a1 + 184);
    CGFloat v64 = *(double *)(a1 + 192);
    CGFloat v65 = *(double *)(a1 + 200);
    *(CGFloat *)&_Q0 = v62;
    v56.f64[0] = v63;
    CGFloat v66 = v64;
    CGFloat v67 = v65;
    CGFloat v68 = CGRectGetMidX(*(CGRect *)((char *)&v56 - 8));
    v144.origin.x = v62;
    v144.origin.y = v63;
    v144.size.width = v64;
    v144.size.height = v65;
    CGFloat v69 = CGRectGetMidY(v144);
    v145.origin.x = v62;
    v145.origin.y = v63;
    v145.size.width = v64;
    v145.size.height = v65;
    CGFloat v119 = CGRectGetWidth(v145);
    v146.origin.x = v62;
    v146.origin.y = v63;
    v146.size.width = v64;
    v146.size.height = v65;
    CGFloat v70 = CGRectGetHeight(v146);
    v71.f64[0] = v119;
    v71.f64[1] = v70;
    *(CGFloat *)v61 = v68;
    *(CGFloat *)&v61[1] = v69;
    v61[2] = (float32x2_t)0xBFD99999A0000000;
    v61[3] = vcvt_f32_f64(v71);
    v72 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 868));
    _OWORD *v72 = v132;
    v72[1] = v130;
    v72[4] = v128;
    v72[5] = v129;
    v72[2] = v126;
    v72[3] = v127;
    v72[8] = v124;
    v72[9] = v125;
    v72[6] = v122;
    v72[7] = v123;
    *(unsigned char *)(a3[4] + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 868) + 1) = 3;
    PXSizeScale();
  }
  uint64_t v73 = a3[3];
  uint64_t v74 = a3[4];
  float32x2_t v75 = vcvt_f32_f64(*MEMORY[0x1E4F1DB30]);
  v76 = (void *)(v47 + 32 * v46);
  v76[3] = v75;
  uint64_t v77 = *MEMORY[0x1E4F1DAD8];
  uint64_t v78 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  void *v76 = *MEMORY[0x1E4F1DAD8];
  v76[1] = v78;
  v76[2] = 0;
  v79 = (_OWORD *)(v73 + 160 * v46);
  v79[4] = v128;
  v79[5] = v129;
  v79[2] = v126;
  v79[3] = v127;
  v79[8] = v124;
  v79[9] = v125;
  v79[6] = v122;
  v79[7] = v123;
  _OWORD *v79 = v132;
  v79[1] = v130;
  *(_DWORD *)v79 = 0;
  *(unsigned char *)(v74 + 40 * v46 + 1) = 0;
  uint64_t v80 = *(unsigned int *)(*(void *)(a1 + 32) + 868);
  uint64_t v81 = a3[3];
  uint64_t v82 = a3[4];
  v83 = (void *)(a3[2] + 32 * v80);
  v83[3] = v75;
  void *v83 = v77;
  v83[1] = v78;
  v83[2] = 0;
  v84 = (_OWORD *)(v81 + 160 * v80);
  _OWORD *v84 = v132;
  v84[1] = v130;
  v84[4] = v128;
  v84[5] = v129;
  v84[2] = v126;
  v84[3] = v127;
  v84[8] = v124;
  v84[9] = v125;
  v84[6] = v122;
  v84[7] = v123;
  *(_DWORD *)v84 = 0;
  *(unsigned char *)(v82 + 40 * v80 + 1) = 0;
  uint64_t v85 = *(unsigned int *)(*(void *)(a1 + 32) + 872);
  uint64_t v86 = a3[2];
  if (*(unsigned char *)(a1 + 275))
  {
    v87 = (float32x2_t *)(v86 + 32 * v85);
    CGFloat v88 = *(double *)(a1 + 208);
    CGFloat v89 = *(double *)(a1 + 216);
    CGFloat v90 = *(double *)(a1 + 224);
    CGFloat v91 = *(double *)(a1 + 232);
    v147.origin.x = v88;
    v147.origin.y = v89;
    v147.size.width = v90;
    v147.size.height = v91;
    CGFloat v92 = CGRectGetMidX(v147);
    v148.origin.x = v88;
    v148.origin.y = v89;
    v148.size.width = v90;
    v148.size.height = v91;
    CGFloat v93 = CGRectGetMidY(v148);
    v149.origin.x = v88;
    v149.origin.y = v89;
    v149.size.width = v90;
    v149.size.height = v91;
    CGFloat v120 = CGRectGetWidth(v149);
    v150.origin.x = v88;
    v150.origin.y = v89;
    v150.size.width = v90;
    v150.size.height = v91;
    CGFloat v94 = CGRectGetHeight(v150);
    v95.f64[0] = v120;
    v95.f64[1] = v94;
    *(CGFloat *)v87 = v92;
    *(CGFloat *)&v87[1] = v93;
    v87[2] = (float32x2_t)0xBFD3333340000000;
    v87[3] = vcvt_f32_f64(v95);
    v96 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 872));
    _OWORD *v96 = v132;
    v96[1] = v130;
    v96[4] = v128;
    v96[5] = v129;
    v96[2] = v126;
    v96[3] = v127;
    v96[8] = v124;
    v96[9] = v125;
    v96[6] = v122;
    v96[7] = v123;
    *(unsigned char *)(a3[4] + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 872) + 1) = 3;
    PXSizeScale();
  }
  uint64_t v97 = a3[3];
  uint64_t v98 = a3[4];
  uint64_t v99 = v86 + 32 * v85;
  *(float32x2_t *)(v99 + 24) = vcvt_f32_f64(*MEMORY[0x1E4F1DB30]);
  *(_OWORD *)uint64_t v99 = *MEMORY[0x1E4F1DAD8];
  *(void *)(v99 + 16) = 0;
  v100 = (_OWORD *)(v97 + 160 * v85);
  v100[4] = v128;
  v100[5] = v129;
  v100[2] = v126;
  v100[3] = v127;
  v100[8] = v124;
  v100[9] = v125;
  v100[6] = v122;
  v100[7] = v123;
  _OWORD *v100 = v132;
  v100[1] = v130;
  *(_DWORD *)v100 = 0;
  *(unsigned char *)(v98 + 40 * v85 + 1) = 0;
  uint64_t v101 = *(unsigned int *)(*(void *)(a1 + 32) + 876);
  uint64_t v102 = a3[2];
  if (*(unsigned char *)(a1 + 276))
  {
    v103 = (float32x2_t *)(v102 + 32 * v101);
    CGFloat v104 = *(double *)(a1 + 240);
    CGFloat v105 = *(double *)(a1 + 248);
    CGFloat v106 = *(double *)(a1 + 256);
    CGFloat v107 = *(double *)(a1 + 264);
    v151.origin.x = v104;
    v151.origin.y = v105;
    v151.size.width = v106;
    v151.size.height = v107;
    CGFloat v108 = CGRectGetMidX(v151);
    v152.origin.x = v104;
    v152.origin.y = v105;
    v152.size.width = v106;
    v152.size.height = v107;
    CGFloat v109 = CGRectGetMidY(v152);
    v153.origin.x = v104;
    v153.origin.y = v105;
    v153.size.width = v106;
    v153.size.height = v107;
    CGFloat v121 = CGRectGetWidth(v153);
    v154.origin.x = v104;
    v154.origin.y = v105;
    v154.size.width = v106;
    v154.size.height = v107;
    CGFloat v110 = CGRectGetHeight(v154);
    v111.f64[0] = v121;
    v111.f64[1] = v110;
    *(CGFloat *)v103 = v108;
    *(CGFloat *)&v103[1] = v109;
    v103[2] = (float32x2_t)0xBFD3333340000000;
    v103[3] = vcvt_f32_f64(v111);
    v112 = (_OWORD *)(a3[3] + 160 * *(unsigned int *)(*(void *)(a1 + 32) + 876));
    _OWORD *v112 = v132;
    v112[1] = v130;
    v112[4] = v128;
    v112[5] = v129;
    v112[2] = v126;
    v112[3] = v127;
    v112[8] = v124;
    v112[9] = v125;
    v112[6] = v122;
    v112[7] = v123;
    *(unsigned char *)(a3[4] + 40 * *(unsigned int *)(*(void *)(a1 + 32) + 876) + 1) = 3;
    PXSizeScale();
  }
  uint64_t v113 = a3[3];
  uint64_t v114 = a3[4];
  uint64_t v115 = v102 + 32 * v101;
  *(float32x2_t *)(v115 + 24) = vcvt_f32_f64(*MEMORY[0x1E4F1DB30]);
  *(_OWORD *)uint64_t v115 = *MEMORY[0x1E4F1DAD8];
  *(void *)(v115 + 16) = 0;
  v116 = (_OWORD *)(v113 + 160 * v101);
  v116[4] = v128;
  v116[5] = v129;
  v116[2] = v126;
  v116[3] = v127;
  v116[8] = v124;
  v116[9] = v125;
  v116[6] = v122;
  v116[7] = v123;
  _OWORD *v116 = v132;
  v116[1] = v130;
  *(_DWORD *)v116 = 0;
  *(unsigned char *)(v114 + 40 * v101 + 1) = 0;
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (unsigned)decorationOverlayAnchorSpriteIndex
{
  return self->_assetSpriteIndex;
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedAlbumsActivityEntryLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXGLayout *)self setNeedsUpdate];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedAlbumsActivityEntryLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXGLayout *)self setNeedsUpdate];
}

- (PXSharedAlbumsActivityEntryLayout)initWithItem:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedAlbumsActivityEntryViewController.m", 139, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedAlbumsActivityEntryLayout;
  CGFloat v7 = [(PXGLayout *)&v11 init];
  CGFloat v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_item, a3);
    v8->_assetSpriteIndex = [(PXGLayout *)v8 addSpriteWithInitialState:0];
    v8->_backgroundSpriteIndex = [(PXGLayout *)v8 addSpriteWithInitialState:0];
    v8->_countsBackgroundSpriteIndex = [(PXGLayout *)v8 addSpriteWithInitialState:0];
    v8->_countsSpriteIndex = [(PXGLayout *)v8 addSpriteWithInitialState:0];
    v8->_contributorSpriteIndex = [(PXGLayout *)v8 addSpriteWithInitialState:0];
    v8->_messageSpriteIndex = [(PXGLayout *)v8 addSpriteWithInitialState:0];
    [(PXGLayout *)v8 setContentSource:v8];
    [(PXGLayout *)v8 setNeedsUpdate];
  }

  return v8;
}

@end