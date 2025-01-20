@interface PXGDecorationTextureProvider
- (PXGDecorationBadgeDrawingHelper)badgeDrawingHelper;
- (PXGDecorationTextureProvider)init;
- (PXGDecorationTextureProvider)initWithBadgeDrawingHelper:(id)a3;
- (PXGViewSource)overlayViewSource;
- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7;
- (void)_requestTextureForDecorationInfo:(PXGDecorationBadgeInfo *)a3 drawingHelper:(id)a4 solidColorOverlay:(id)a5 debugDecoration:(id)a6 targetSize:(CGSize)a7 cornerRadius:(id)a8 screenScale:(double)a9 requestID:(int)a10 viewEnvironment:(id)a11 userInterfaceDirection:(unint64_t)a12;
- (void)_requestViewTextureForDecorationInfo:(PXGDecorationBadgeInfo *)a3 customViewClass:(Class)a4 userData:(id)a5 decorationOptions:(unint64_t)a6 requestID:(int)a7;
- (void)setOverlayViewSource:(id)a3;
@end

@implementation PXGDecorationTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  v181.receiver = self;
  v181.super_class = (Class)PXGDecorationTextureProvider;
  v82 = a6;
  id v65 = [(PXGTextureProvider *)&v181 requestTexturesForSpritesInRange:a3 geometries:a4 styles:a5 infos:a6 inLayout:v12];
  NSUInteger v63 = v13;
  id v14 = v12;
  unsigned int v87 = [v14 numberOfDecoratingSpritesPerDecoratedSprite];
  if (!v87) {
    PXAssertGetLog();
  }
  v15 = [v14 decoratedLayout];
  v16 = [v15 displayAssetSource];
  unint64_t v90 = HIDWORD(*(unint64_t *)&a3);
  v91 = [v16 displayAssetFetchResultForSpritesInRange:(a3.location / v87) | ((unint64_t)((a3.location + a3.length - 1) / v87 - a3.location / v87 + 1) << 32) inLayout:v15];

  v17 = [v14 assetBadgeDecorationSource];
  v85 = [v14 assetProgressDecorationSource];
  v18 = [v14 selectionDecorationSource];
  v68 = [v14 highlightDecorationSource];
  v66 = [v14 solidColorOverlayDecorationSource];
  v67 = [v14 dragDecorationSource];
  dispatch_queue_t queuea = [v14 debugDecorationSource];
  v77 = [v14 viewDecorationSource];
  v64 = [(PXGDecorationTextureProvider *)self overlayViewSource];
  v80 = [v18 selectedSpriteIndexesInLayout:v15];
  v79 = [v68 highlightedSpriteIndexesInLayout:v15];
  v78 = [v67 draggingSpriteIndexesInLayout:v15];
  v75 = [v66 solidColorOverlayForLayout:v15];
  int v74 = [v14 debugDecorationIndex];
  char v70 = objc_opt_respondsToSelector();
  uint64_t v177 = 0;
  v178 = &v177;
  uint64_t v179 = 0x2020000000;
  int v180 = -1;
  *(void *)buf = 0;
  v183 = buf;
  uint64_t v184 = 0x4010000000;
  v185 = &unk_1AB5D584F;
  long long v186 = 0u;
  long long v187 = 0u;
  uint64_t v171 = 0;
  v172 = &v171;
  uint64_t v173 = 0x3032000000;
  v174 = __Block_byref_object_copy__61326;
  v175 = __Block_byref_object_dispose__61327;
  id v176 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
  aBlock[3] = &unk_1E5DB4AF0;
  aBlock[4] = &v171;
  v19 = _Block_copy(aBlock);
  uint64_t v166 = 0;
  v167 = &v166;
  uint64_t v168 = 0x2020000000;
  uint64_t v169 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v162 = 0;
  v163 = &v162;
  uint64_t v164 = 0x2020000000;
  char v165 = 0;
  uint64_t v158 = 0;
  v159 = &v158;
  uint64_t v160 = 0x2020000000;
  char v161 = 0;
  uint64_t v154 = 0;
  v155 = &v154;
  uint64_t v156 = 0x2020000000;
  char v157 = 0;
  id v71 = v14;
  v152[0] = 0;
  v152[1] = v152;
  v152[2] = 0x3032000000;
  v152[3] = __Block_byref_object_copy__61326;
  v152[4] = __Block_byref_object_dispose__61327;
  id v153 = 0;
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2;
  v134[3] = &unk_1E5DB4B18;
  v145 = &v177;
  id v69 = v91;
  id v135 = v69;
  id v88 = v17;
  id v136 = v88;
  v146 = buf;
  id v89 = v15;
  id v137 = v89;
  id v56 = v85;
  id v138 = v56;
  id v62 = v19;
  id v144 = v62;
  v147 = v152;
  v58 = queuea;
  v139 = v58;
  v148 = &v166;
  id v57 = v18;
  id v140 = v57;
  v149 = &v162;
  id v59 = v80;
  id v141 = v59;
  v150 = &v158;
  id v60 = v79;
  id v142 = v60;
  v151 = &v154;
  v61 = v78;
  v143 = v61;
  v86 = (void (**)(void *, void))_Block_copy(v134);
  objc_initWeak(&location, self);
  queue = [(PXGTextureProvider *)self requestQueue];
  [v14 displayScale];
  double v21 = v20;
  [v14 textureScale];
  double v23 = v22;
  v76 = [v14 viewEnvironment];
  uint64_t v73 = [v14 userInterfaceDirection];
  uint64_t v81 = [v14 decorationSizeClass];
  v92 = [(PXGDecorationTextureProvider *)self badgeDrawingHelper];
  if (a3.length)
  {
    double v24 = v21 * v23;
    v25 = v77;
    if (v64) {
      v25 = v64;
    }
    v72 = v25;
    int v26 = (int)v65;
    do
    {
      v27 = (float32x2_t *)((char *)v82 + 40 * a3.location);
      float32x2_t v28 = v27[1];
      v29 = (void *)[v14 decoratingTypeForSpriteIndex:a3];
      v86[2](v86, a3.location / v87);
      long long v131 = 0u;
      long long v132 = 0u;
      long long v130 = 0u;
      if (v92)
      {
        char v30 = *((unsigned char *)v155 + 24);
        char v31 = *((unsigned char *)v159 + 24);
        uint64_t v32 = *((unsigned __int8 *)v163 + 24);
        uint64_t v33 = v167[3];
        uint64_t v34 = *((unsigned int *)v178 + 6);
        long long v35 = *((_OWORD *)v183 + 3);
        v129[0] = *((_OWORD *)v183 + 2);
        v129[1] = v35;
        BYTE1(v55) = v30;
        LOBYTE(v55) = v31;
        objc_msgSend(v92, "decorationSpriteInfoForDecoratedSpriteIndex:decorationType:decoratingLayout:assetDecorationInfo:overallSelectionOrder:isItemSelected:isItemHighlighted:isItemDragged:", v34, v29, v14, v129, v33, v32, v55);
      }
      id v36 = [v89 spriteDataStore];
      uint64_t v37 = [v36 styles];
      v129[0] = *(_OWORD *)(v37 + 160 * *((unsigned int *)v178 + 6) + 36);

      *((void *)&v130 + 1) = v81;
      if (v27->i8[0] == 1)
      {
        v38 = v77;
        if (v29 == (void *)3) {
          v38 = v72;
        }
        id v39 = v38;
        uint64_t v40 = [v39 viewClassForSpriteAtIndex:a3 inLayout:v14];
        if (v40)
        {
          v41 = [v14 captionDecorationSource];
          unsigned int v42 = [v41 wantsCaptionDecorationsInLayout:v89];
          int v43 = [v88 wantsInteractiveFavoriteBadgesInLayout:v89];
          int v44 = [v88 wantsFileSizeBadgesInLayout:v89];
          int v45 = *((unsigned __int8 *)v163 + 24);
          int v46 = [v88 hidesTopLeadingBadgesInLayout:v89];
          uint64_t v47 = v42;
          if (v43) {
            uint64_t v47 = v42 | 2;
          }
          if (v44) {
            v47 |= 8uLL;
          }
          if (v45) {
            v47 |= 4uLL;
          }
          if (v46) {
            uint64_t v48 = v47 | 0x20;
          }
          else {
            uint64_t v48 = v47;
          }
          id v14 = v71;
          if (v70)
          {
            v49 = [v69 objectAtIndex:*((unsigned int *)v178 + 6)];
            if ([v88 shouldShowSavedToLibraryBadgeForAsset:v49 inLayout:v71]) {
              v48 |= 0x10uLL;
            }
          }
          v50 = [v39 viewUserDataForSpriteAtIndex:a3 inLayout:v71];
          v51 = (void *)[v50 copyWithZone:0];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3;
          block[3] = &unk_1E5DB4B40;
          id v121 = v51;
          id v52 = v51;
          objc_copyWeak(&v122, &location);
          long long v123 = v130;
          long long v124 = v131;
          long long v125 = v132;
          uint64_t v126 = v40;
          uint64_t v127 = v48;
          int v128 = v26;
          dispatch_async(queue, block);
          objc_destroyWeak(&v122);
        }
        else if (+[PXGAssetDecorationView wantsDecorationViewForConfiguration:v172[5]])
        {
          v114[0] = MEMORY[0x1E4F143A8];
          v114[1] = 3221225472;
          v114[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_4;
          v114[3] = &unk_1E5DB4B68;
          objc_copyWeak(&v115, &location);
          long long v116 = v130;
          long long v117 = v131;
          long long v118 = v132;
          v114[4] = &v171;
          int v119 = v26;
          dispatch_async(queue, v114);
          objc_destroyWeak(&v115);
        }
        else
        {
          *(void *)&long long v130 = 0;
          v108[0] = MEMORY[0x1E4F143A8];
          v108[1] = 3221225472;
          v108[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_5;
          v108[3] = &unk_1E5DB4B90;
          objc_copyWeak(&v109, &location);
          long long v110 = v130;
          long long v111 = v131;
          long long v112 = v132;
          int v113 = v26;
          dispatch_async(queue, v108);
          objc_destroyWeak(&v109);
        }
      }
      else
      {
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_6;
        v93[3] = &unk_1E5DB4BB8;
        v97 = v152;
        v98[1] = v29;
        int v105 = v74;
        objc_copyWeak(v98, &location);
        long long v99 = v130;
        long long v100 = v131;
        long long v101 = v132;
        id v94 = v92;
        id v95 = v75;
        float64x2_t v102 = vcvtq_f64_f32(v28);
        long long v106 = v129[0];
        double v103 = v24;
        int v107 = v26;
        id v96 = v76;
        uint64_t v104 = v73;
        dispatch_async(queue, v93);

        objc_destroyWeak(v98);
      }
      ++v26;
      a3 = (_PXGSpriteIndexRange)(a3.location + 1);
      --v90;
    }
    while (v90);
  }

  objc_destroyWeak(&location);
  _Block_object_dispose(v152, 8);

  _Block_object_dispose(&v154, 8);
  _Block_object_dispose(&v158, 8);
  _Block_object_dispose(&v162, 8);
  _Block_object_dispose(&v166, 8);

  _Block_object_dispose(&v171, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v177, 8);

  NSUInteger v53 = (NSUInteger)v65;
  NSUInteger v54 = v63;
  result.length = v54;
  result.id location = v53;
  return result;
}

- (void)_requestTextureForDecorationInfo:(PXGDecorationBadgeInfo *)a3 drawingHelper:(id)a4 solidColorOverlay:(id)a5 debugDecoration:(id)a6 targetSize:(CGSize)a7 cornerRadius:(id)a8 screenScale:(double)a9 requestID:(int)a10 viewEnvironment:(id)a11 userInterfaceDirection:(unint64_t)a12
{
  v16 = *(void **)&a8.var0.var1[2];
  uint64_t v17 = *(void *)&a8.var0.var0.var0;
  double v18 = v15;
  int v19 = v14;
  int v20 = v13;
  int v21 = v12;
  int v22 = LODWORD(a9);
  double height = a7.height;
  double width = a7.width;
  id v29 = a4;
  id v30 = a5;
  id v31 = a6;
  id v32 = v16;
  if ([(PXGTextureProvider *)self isRequestActive:v17])
  {
    if (a3->var0) {
      PXPixelSizeAreaIsZero();
    }
    if (v31)
    {
      long long v37 = *(_OWORD *)&a3->var2;
      v59[0] = *(_OWORD *)&a3->var0;
      v59[1] = v37;
      v59[2] = *(_OWORD *)&a3->var4;
      LODWORD(v33) = v22;
      LODWORD(v34) = v21;
      LODWORD(v35) = v20;
      LODWORD(v36) = v19;
      v38 = objc_msgSend(v29, "cacheKeyForDecorationInfo:solidColorOverlay:debugDecoration:targetSize:cornerRadius:screenScale:viewEnvironment:userInterfaceDirection:", v59, v30, v31, v32, *(void *)&a10, width, height, v33, v34, v35, v36, v18);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke;
      v43[3] = &unk_1E5DB4C08;
      double v48 = width;
      double v49 = height;
      id v44 = v29;
      long long v39 = *(_OWORD *)&a3->var2;
      long long v50 = *(_OWORD *)&a3->var0;
      long long v51 = v39;
      long long v52 = *(_OWORD *)&a3->var4;
      id v45 = v30;
      id v46 = v31;
      int v55 = v22;
      int v56 = v21;
      int v57 = v20;
      int v58 = v19;
      double v53 = v18;
      id v47 = v32;
      uint64_t v54 = *(void *)&a10;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke_3;
      v40[3] = &unk_1E5DCD728;
      char v42 = 0;
      v40[4] = self;
      int v41 = v17;
      [(PXGCGImageTextureProvider *)self requestCGImageWithCacheKey:v38 imageProvider:v43 resultHandler:v40];
    }
    else
    {
      [(PXGTextureProvider *)self provideNothingForRequestID:v17];
    }
  }
}

uint64_t __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 112) + 8);
  if (*(_DWORD *)(v2 + 24) != a2)
  {
    uint64_t v3 = result;
    *(_DWORD *)(v2 + 24) = a2;
    uint64_t v4 = *(unsigned int *)(*(void *)(*(void *)(result + 112) + 8) + 24);
    if ([*(id *)(result + 32) count] > v4)
    {
      v5 = [*(id *)(v3 + 32) objectAtIndex:*(unsigned int *)(*(void *)(*(void *)(v3 + 112) + 8) + 24)];
      v6 = *(void **)(v3 + 40);
      if (v6)
      {
        [v6 assetDecorationInfoForAsset:v5 atSpriteIndex:*(unsigned int *)(*(void *)(*(void *)(v3 + 112) + 8) + 24) inLayout:*(void *)(v3 + 48)];
        uint64_t v7 = *(void *)(*(void *)(v3 + 120) + 8);
        *(_OWORD *)(v7 + 32) = v17;
        *(_OWORD *)(v7 + 48) = v18;
      }
      v8 = *(void **)(v3 + 56);
      if (v8)
      {
        v9 = [v8 loadStatusForAsset:v5 atSpriteIndex:*(unsigned int *)(*(void *)(*(void *)(v3 + 112) + 8) + 24) inLayout:*(void *)(v3 + 48)];
        v10 = (*(void (**)(void))(*(void *)(v3 + 104) + 16))();
        [v10 setLoadStatus:v9];
      }
      v11 = [*(id *)(v3 + 64) debugDecorationAtSpriteIndex:*(unsigned int *)(*(void *)(*(void *)(v3 + 112) + 8) + 24) asset:v5 inLayout:*(void *)(v3 + 48)];
      uint64_t v12 = [v11 copy];
      uint64_t v13 = *(void *)(*(void *)(v3 + 128) + 8);
      int v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    double v15 = *(void **)(v3 + 72);
    if (v15) {
      uint64_t v16 = [v15 overallSelectionOrderAtSpriteIndex:*(unsigned int *)(*(void *)(*(void *)(v3 + 112) + 8) + 24) inLayout:*(void *)(v3 + 48)];
    }
    else {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    *(void *)(*(void *)(*(void *)(v3 + 136) + 8) + 24) = v16;
    *(unsigned char *)(*(void *)(*(void *)(v3 + 144) + 8) + 24) = [*(id *)(v3 + 80) containsIndex:*(unsigned int *)(*(void *)(*(void *)(v3 + 112)+ 8)+ 24)];
    *(unsigned char *)(*(void *)(*(void *)(v3 + 152) + 8) + 24) = [*(id *)(v3 + 88) containsIndex:*(unsigned int *)(*(void *)(*(void *)(v3 + 112)+ 8)+ 24)];
    _NSRange result = [*(id *)(v3 + 96) containsIndex:*(unsigned int *)(*(void *)(*(void *)(v3 + 112) + 8) + 24)];
    *(unsigned char *)(*(void *)(*(void *)(v3 + 160) + 8) + 24) = result;
  }
  return result;
}

id __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(PXGAssetDecorationViewConfiguration);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  return v2;
}

- (PXGViewSource)overlayViewSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayViewSource);
  return (PXGViewSource *)WeakRetained;
}

- (PXGDecorationBadgeDrawingHelper)badgeDrawingHelper
{
  return self->_badgeDrawingHelper;
}

void __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v2 && *(void *)(a1 + 72) == *(_DWORD *)(a1 + 160)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(unsigned int *)(a1 + 180);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 152);
  long long v10 = *(_OWORD *)(a1 + 96);
  v15[0] = *(_OWORD *)(a1 + 80);
  v15[1] = v10;
  v15[2] = *(_OWORD *)(a1 + 112);
  LODWORD(v11) = *(_DWORD *)(a1 + 164);
  LODWORD(v12) = *(_DWORD *)(a1 + 168);
  LODWORD(v13) = *(_DWORD *)(a1 + 172);
  LODWORD(v14) = *(_DWORD *)(a1 + 176);
  objc_msgSend(WeakRetained, "_requestTextureForDecorationInfo:drawingHelper:solidColorOverlay:debugDecoration:targetSize:cornerRadius:screenScale:requestID:viewEnvironment:userInterfaceDirection:", v15, v5, v6, v3, v7, v8, *(double *)(a1 + 128), *(double *)(a1 + 136), v11, v12, v13, v14, *(double *)(a1 + 144), v9);
}

void __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = *(unsigned int *)(a1 + 88);
  long long v4 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v4;
  v5[2] = *(_OWORD *)(a1 + 72);
  [WeakRetained _requestViewTextureForDecorationInfo:v5 customViewClass:0 userData:0 decorationOptions:0 requestID:v3];
}

- (void)_requestViewTextureForDecorationInfo:(PXGDecorationBadgeInfo *)a3 customViewClass:(Class)a4 userData:(id)a5 decorationOptions:(unint64_t)a6 requestID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v13 = a5;
  if ([(PXGTextureProvider *)self isRequestActive:v7])
  {
    if (a3->var0)
    {
      double v12 = [[PXGDecorationViewPayload alloc] initWithDecorationOptions:a6 viewClass:a4 userData:v13];
      [(PXGTextureProvider *)self providePayload:v12 forRequestID:v7];
    }
    else
    {
      [(PXGTextureProvider *)self provideNothingForRequestID:v7];
    }
  }
}

- (PXGDecorationTextureProvider)init
{
  return [(PXGDecorationTextureProvider *)self initWithBadgeDrawingHelper:0];
}

- (PXGDecorationTextureProvider)initWithBadgeDrawingHelper:(id)a3
{
  long long v4 = (PXGDecorationDefaultBadgeDrawingHelper *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGDecorationTextureProvider;
  uint64_t v5 = [(PXGCGImageTextureProvider *)&v8 init];
  if (v5)
  {
    uint64_t v6 = v4;
    if (!v4) {
      uint64_t v6 = objc_alloc_init(PXGDecorationDefaultBadgeDrawingHelper);
    }
    objc_storeStrong((id *)&v5->_badgeDrawingHelper, v6);
    if (!v4) {
  }
    }
  return v5;
}

uint64_t __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  char v9 = 0;
  __int16 v8 = 0;
  memset(v12, 0, sizeof(v12));
  char v2 = *(unsigned char *)(a1 + 44);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(a1 + 40);
  long long v6 = *(_OWORD *)off_1E5DAAFA0;
  char v7 = v2;
  int v10 = 1065353216;
  char v11 = 0;
  return [v3 provideCGImage:a2 options:&v6 forRequestID:v4];
}

uint64_t __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke_2;
  v7[3] = &unk_1E5DB4BE0;
  id v8 = *(id *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 96);
  long long v12 = *(_OWORD *)(a1 + 80);
  long long v13 = v2;
  long long v14 = *(_OWORD *)(a1 + 112);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 144);
  uint64_t v15 = *(void *)(a1 + 128);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 136);
  id v11 = v3;
  uint64_t v16 = v4;
  uint64_t v5 = MEMORY[0x1AD10B1D0](0, 0, v7, *(double *)(a1 + 64), *(double *)(a1 + 72));

  return v5;
}

uint64_t __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double v6 = a6;
  double v7 = a5;
  id v11 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 112);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 120);
  long long v16 = *(_OWORD *)(a1 + 80);
  v19[0] = *(_OWORD *)(a1 + 64);
  v19[1] = v16;
  long long v20 = *(_OWORD *)(a1 + 96);
  HIDWORD(v17) = DWORD1(v20);
  LODWORD(v17) = *(_DWORD *)(a1 + 128);
  LODWORD(v16) = *(_DWORD *)(a1 + 132);
  LODWORD(a5) = *(_DWORD *)(a1 + 136);
  LODWORD(a6) = *(_DWORD *)(a1 + 140);
  return objc_msgSend(v11, "drawWithDecorationInfo:solidColorOverlay:debugDecoration:cornerRadius:context:viewport:screenScale:viewEnvironment:userInterfaceDirection:", v19, v10, v13, a2, v14, v15, v17, *(double *)&v16, a5, a6, a3, a4, v7, v6, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeDrawingHelper, 0);
  objc_destroyWeak((id *)&self->_overlayViewSource);
}

- (void)setOverlayViewSource:(id)a3
{
}

void __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) prepareForRender];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = *(unsigned int *)(a1 + 112);
  long long v7 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v7;
  v8[2] = *(_OWORD *)(a1 + 80);
  [WeakRetained _requestViewTextureForDecorationInfo:v8 customViewClass:v4 userData:v3 decorationOptions:v5 requestID:v6];
}

void __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = *(unsigned int *)(a1 + 96);
  long long v6 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v6;
  v7[2] = *(_OWORD *)(a1 + 80);
  [WeakRetained _requestViewTextureForDecorationInfo:v7 customViewClass:v3 userData:v4 decorationOptions:0 requestID:v5];
}

@end