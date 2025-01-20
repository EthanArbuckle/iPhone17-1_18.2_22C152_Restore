@interface PXZoomablePhotosLayoutSpec
- (BOOL)useSaliency;
- (NSArray)legacyMacSupportedColumns;
- (NSArray)minimumAssetsRequiredByColumn;
- (NSArray)supportedColumns;
- (PXZoomableInlineHeadersLayoutSpec)inlineHeadersSpec;
- (PXZoomablePhotosLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXZoomablePhotosLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 availableThumbnailSizes:(id)a5 gridStyle:(int64_t)a6 itemAspectRatio:(double)a7 userDefaults:(id)a8 forceSaliency:(BOOL)a9 preferredUserInterfaceStyle:(int64_t)a10 additionalAspectFitEdgeMargins:(UIEdgeInsets)a11 overrideDefaultNumberOfColumns:(int64_t)a12;
- (UIEdgeInsets)aspectFitEdgeMargins;
- (UIEdgeInsets)miniModeEdgeMargins;
- (UIEdgeInsets)squareEdgeMargins;
- (double)aspectFitInteritemSpacing;
- (double)aspectFitItemCornerRadius;
- (double)captionSpacing;
- (double)interitemSpacing;
- (double)itemAspectRatio;
- (double)itemCornerRadius;
- (double)miniModeInteritemSpacing;
- (double)miniModeItemCornerRadius;
- (double)panoramaInteritemSpacing;
- (double)panoramaItemAspectRatio;
- (id)defaultBackgroundColor;
- (int64_t)bestColumnIndexForPreferredNumberOfColumns:(int64_t)a3 allowedColumns:(id)a4;
- (int64_t)defaultNumberOfColumns;
- (int64_t)initialNumberOfColumns;
- (int64_t)maxColumnsForBadges;
- (int64_t)maxColumnsForIndividualItems;
- (int64_t)maxColumnsForSaliency;
- (int64_t)maxColumnsForStickyHeaderDisplay;
- (int64_t)minColumnsForMiniBadges;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)staticNumberOfColumns;
@end

@implementation PXZoomablePhotosLayoutSpec

- (id)defaultBackgroundColor
{
  explicitBackgroundColor = self->_explicitBackgroundColor;
  if (explicitBackgroundColor)
  {
    v3 = explicitBackgroundColor;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXZoomablePhotosLayoutSpec;
    v3 = [(PXFeatureSpec *)&v5 defaultBackgroundColor];
  }
  return v3;
}

- (int64_t)maxColumnsForStickyHeaderDisplay
{
  return self->_maxColumnsForStickyHeaderDisplay;
}

- (int64_t)maxColumnsForIndividualItems
{
  return self->_maxColumnsForIndividualItems;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (UIEdgeInsets)squareEdgeMargins
{
  double top = self->_squareEdgeMargins.top;
  double left = self->_squareEdgeMargins.left;
  double bottom = self->_squareEdgeMargins.bottom;
  double right = self->_squareEdgeMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (int64_t)maxColumnsForBadges
{
  return self->_maxColumnsForBadges;
}

- (int64_t)minColumnsForMiniBadges
{
  return self->_minColumnsForMiniBadges;
}

- (int64_t)bestColumnIndexForPreferredNumberOfColumns:(int64_t)a3 allowedColumns:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(PXZoomablePhotosLayoutSpec *)self maxColumnsForIndividualItems];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v8 = [NSNumber numberWithInteger:a3];
  uint64_t v9 = [v6 indexOfObject:v8];

  uint64_t v16 = v9;
  int64_t v10 = v14[3];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14[3] = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__PXZoomablePhotosLayoutSpec_bestColumnIndexForPreferredNumberOfColumns_allowedColumns___block_invoke;
    v12[3] = &unk_1E5DBBDF0;
    v12[4] = &v13;
    v12[5] = v7;
    v12[6] = a3;
    [v6 enumerateObjectsUsingBlock:v12];
    int64_t v10 = v14[3];
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (PXZoomablePhotosLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 availableThumbnailSizes:(id)a5 gridStyle:(int64_t)a6 itemAspectRatio:(double)a7 userDefaults:(id)a8 forceSaliency:(BOOL)a9 preferredUserInterfaceStyle:(int64_t)a10 additionalAspectFitEdgeMargins:(UIEdgeInsets)a11 overrideDefaultNumberOfColumns:(int64_t)a12
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a5;
  id v21 = a8;
  v135.receiver = self;
  v135.super_class = (Class)PXZoomablePhotosLayoutSpec;
  v22 = [(PXFeatureSpec *)&v135 initWithExtendedTraitCollection:v19 options:a4];

  if (v22)
  {
    SEL v116 = a2;
    v118 = v21;
    v119 = v20;
    v23 = +[PXZoomablePhotosSettings sharedInstance];
    uint64_t v125 = [v19 userInterfaceIdiom];
    uint64_t v117 = [v19 userInterfaceIdiom];
    BOOL v24 = a6 == 3;
    v25 = +[PXLemonadeSettings sharedInstance];
    int v120 = [v25 enableCubeMode];

    v126 = v22;
    unint64_t v26 = a6;
    if ([v19 userInterfaceStyle] == 2)
    {
      int v27 = 1;
    }
    else
    {
      v28 = +[PXLemonadeSettings sharedInstance];
      int v27 = [v28 forceDarkDetailsView];
    }
    if ((unint64_t)a6 > 6)
    {
LABEL_17:
      v22->_preferredUserInterfaceStyle = a10;
      id v30 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke;
      aBlock[3] = &unk_1E5DBBD78;
      id v31 = v30;
      aBlock[4] = v31;
      id v32 = v23;
      aBlock[5] = v32;
      aBlock[6] = v26;
      BOOL v134 = a7 != 1.0;
      v33 = (void (**)(void))_Block_copy(aBlock);
      v33[2]();
      [v19 layoutReferenceSize];
      double v35 = v34;
      double v37 = v36;
      v123 = v19;
      if ([v19 layoutSizeClass] == 1)
      {
        BOOL v38 = 1;
      }
      else
      {
        v39 = [v19 rootExtendedTraitCollection];

        if (v39)
        {
          v40 = [v19 rootExtendedTraitCollection];
          [v40 layoutReferenceSize];
          BOOL v38 = v41 <= 528.0;
        }
        else
        {
          BOOL v38 = 0;
        }
      }
      int64_t v42 = a12;
      v122 = v31;
      if (v125 == 4)
      {
        int v43 = v27;
        uint64_t v44 = 5;
        [v31 addIndex:5];
        [v31 addIndex:7];
        if (v35 >= 400.0)
        {
          uint64_t v44 = 9;
          [v31 addIndex:9];
          uint64_t v45 = 5;
        }
        else
        {
          uint64_t v45 = 3;
        }
        v47 = off_1E5DA7000;
        if (a12) {
          int64_t v48 = a12;
        }
        else {
          int64_t v48 = v45;
        }
        uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
        double v49 = 17.0;
        double v50 = 5.45;
        double interitemSpacing = 17.0;
        int64_t v42 = v48;
LABEL_69:
        unint64_t v124 = v26;
        if (v26 > 6) {
          goto LABEL_78;
        }
        if (((1 << v26) & 0x4D) != 0)
        {
          v62 = [(__objc2_class *)v47[5] sharedInstance];
          char v63 = [v62 enableCubeMode];

          double v64 = 2.5;
          if ((v63 & 1) == 0) {
            objc_msgSend(v32, "cornerRadius", 2.5);
          }
        }
        else
        {
          if (((1 << v26) & 0x30) != 0)
          {
            if (v117 == 5)
            {
              v22->_itemCornerRadius = 9.0;
              uint64_t v65 = [MEMORY[0x1E4FB1618] blackColor];
              explicitBackgroundColor = v22->_explicitBackgroundColor;
              v22->_explicitBackgroundColor = (UIColor *)v65;
            }
            else if (v125 == 4)
            {
              [v32 cornerRadius];
              v22->_itemCornerRadius = v76;
              v22->_aspectFitItemCornerRadius = 6.0;
            }
            else
            {
              if (v43) {
                [v32 darkModeCornerRadius];
              }
              else {
                [v32 cornerRadius];
              }
              v22->_itemCornerRadius = v112;
              v22->_aspectFitItemCornerRadius = 6.0;
              uint64_t v113 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
              v114 = v22->_explicitBackgroundColor;
              v22->_explicitBackgroundColor = (UIColor *)v113;

              double interitemSpacing = 6.0;
            }
LABEL_78:
            v22->_maxColumnsForStickyHeaderDisplay = v44;
            v22->_defaultNumberOfColumns = v42;
            v22->_staticNumberOfColumns = v48;
            v22->_aspectFitInteritemSpacing = interitemSpacing;
            v22->_maxColumnsForIndividualItems = v44;
            v22->_maxColumnsForBadges = v44;
            v22->_minColumnsForMiniBadges = v46;
            v22->_initialNumberOfColumns = v42;
            v67 = [v118 preferredIndividualItemsColumnsNumber];
            uint64_t v68 = [v67 integerValue];

            if (v68) {
              v22->_initialNumberOfColumns = v68;
            }
            v22->_panoramaItemAspectRatio = v50;
            v22->_panoramaInteritemSpacing = v49;
            if (v26 == 1)
            {
              [v32 cardsAspectRatio];
              a7 = v69;
              if (v35 > v37) {
                a7 = 1.0 / v69;
              }
            }
            else if (a7 == 0.0)
            {
              [v123 fullScreenReferenceRect];
              double v72 = v70;
              double v73 = v71;
              if (v70 == 0.0
                || v71 == 0.0
                || v70 == *MEMORY[0x1E4F8A250] && v71 == *(double *)(MEMORY[0x1E4F8A250] + 8))
              {
                v74 = MEMORY[0x1E4F14500];
                id v75 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 134218496;
                  double v138 = v72;
                  __int16 v139 = 2048;
                  double v140 = v73;
                  __int16 v141 = 2048;
                  uint64_t v142 = 0x3FF0000000000000;
                  _os_log_fault_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
                }

                a7 = 1.0;
              }
              else
              {
                a7 = fabs(v70 / v71);
              }
            }
            v22->_itemAspectRatio = a7;
            if (v120)
            {
              uint64_t v77 = [MEMORY[0x1E4FB1618] blackColor];
              v78 = v22->_explicitBackgroundColor;
              v22->_explicitBackgroundColor = (UIColor *)v77;
            }
            if ([v123 userInterfaceIdiom] == 4)
            {
              double v79 = ceil(v35 / 200.0) * 200.0;
            }
            else
            {
              v80 = [v123 rootExtendedTraitCollection];
              [v80 layoutReferenceSize];
              double v79 = v81;
            }
            v82 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v122, "count"));
            v129[0] = MEMORY[0x1E4F143A8];
            v129[1] = 3221225472;
            v129[2] = __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_2;
            v129[3] = &unk_1E5DD3010;
            id v83 = v82;
            v129[4] = v83;
            [v122 enumerateIndexesUsingBlock:v129];
            v128[0] = MEMORY[0x1E4F143A8];
            v128[1] = 3221225472;
            v128[2] = __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_3;
            v128[3] = &unk_1E5DBBDC8;
            v128[6] = v26;
            *(double *)&v128[7] = v35;
            *(double *)&v128[8] = v37;
            *(double *)&v128[9] = v79;
            id v121 = v123;
            v128[4] = v121;
            id v84 = v83;
            v128[5] = v84;
            v85 = (void (**)(void *, double, double))_Block_copy(v128);
            if ([v119 count])
            {
              v86 = [v119 firstObject];
              [v86 CGSizeValue];
              double v88 = v87;
              double v90 = v89;
            }
            else
            {
              double v88 = *(double *)off_1E5DAB030;
              double v90 = *((double *)off_1E5DAB030 + 1);
            }
            if ((unint64_t)[v119 count] < 2)
            {
              double v91 = *(double *)off_1E5DAB030;
              double v92 = *((double *)off_1E5DAB030 + 1);
            }
            else
            {
              if (v125 == 4) {
                [v119 lastObject];
              }
              else {
              v93 = [v119 objectAtIndexedSubscript:1];
              }
              [v93 CGSizeValue];
              double v91 = v94;
              double v92 = v95;
            }
            v85[2](v85, v91, v92);
            v85[2](v85, v88, v90);
            if ([v32 enableDecadesDensity]) {
              PXSizeIsEmpty();
            }
            uint64_t v96 = [v84 copy];
            supportedColumns = v22->_supportedColumns;
            v22->_supportedColumns = (NSArray *)v96;

            id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            for (uint64_t i = 3; i != 10; ++i)
            {
              v100 = [NSNumber numberWithInteger:i];
              [v98 addObject:v100];
            }
            uint64_t v101 = [v98 copy];
            legacyMacSupportedColumns = v22->_legacyMacSupportedColumns;
            v22->_legacyMacSupportedColumns = (NSArray *)v101;

            if ([(NSArray *)v22->_supportedColumns count] >= 0xB) {
              PXAssertGetLog();
            }
            id v103 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            memset(v127, 0, sizeof(v127));
            v104 = v22->_supportedColumns;
            if ([(NSArray *)v104 countByEnumeratingWithState:v127 objects:v136 count:16])
            {
              PXSizeIsEmpty();
            }

            uint64_t v105 = [v103 copy];
            minimumAssetsRequiredByColumn = v126->_minimumAssetsRequiredByColumn;
            v126->_minimumAssetsRequiredByColumn = (NSArray *)v105;

            uint64_t v107 = [(NSArray *)v126->_supportedColumns count];
            if (v107 != [(NSArray *)v126->_minimumAssetsRequiredByColumn count])
            {
              v115 = [MEMORY[0x1E4F28B00] currentHandler];
              objc_msgSend(v115, "handleFailureInMethod:object:file:lineNumber:description:", v116, v126, @"PXZoomablePhotosLayoutSpec.m", 404, @"Count mismatch: %lu != %lu", -[NSArray count](v126->_supportedColumns, "count"), -[NSArray count](v126->_minimumAssetsRequiredByColumn, "count"));
            }
            if (v125 == 4)
            {
              [v121 layoutMargins];
              PXEdgeInsetsForEdges();
            }
            if (v117 == 5)
            {
              [v121 layoutMargins];
              PXEdgeInsetsForEdges();
            }
            if ([v121 layoutSizeClass] == 1)
            {
              long long v108 = *((_OWORD *)off_1E5DAAF10 + 1);
              *(_OWORD *)&v126->_aspectFitEdgeMargins.double top = *(_OWORD *)off_1E5DAAF10;
              *(_OWORD *)&v126->_aspectFitEdgeMargins.double bottom = v108;
              if (v124 == 1)
              {
                [v121 safeAreaInsets];
                PXEdgeInsetsForEdges();
              }
              long long v109 = *((_OWORD *)off_1E5DAAF10 + 1);
              *(_OWORD *)&v126->_squareEdgeMargins.double top = *(_OWORD *)off_1E5DAAF10;
              *(_OWORD *)&v126->_squareEdgeMargins.double bottom = v109;
              PXEdgeInsetsAdd();
            }
            [v121 layoutMargins];
            PXEdgeInsetsForEdges();
          }
          [v32 cardsCornerRadius];
        }
        v22->_itemCornerRadius = v64;
        v22->_aspectFitItemCornerRadius = v64;
        goto LABEL_78;
      }
      if (v117 == 5)
      {
        [v31 addIndex:1];
        [v31 addIndex:3];
        [v31 addIndex:5];
        [v31 addIndex:7];
        if ((PLIsPhotoPicker() & 1) != 0 || PLIsPhotosMessagesApp())
        {
          int v43 = v27;
          [v31 removeIndex:7];
          uint64_t v46 = 5;
        }
        else
        {
          int v43 = v27;
          uint64_t v46 = 7;
        }
        uint64_t v44 = [v31 lastIndex];
        double interitemSpacing = 10.0;
        int64_t v48 = 5;
        double v50 = 5.45;
        double v49 = 0.0;
        int64_t v42 = 5;
        goto LABEL_68;
      }
      if (v38)
      {
        [v31 addIndex:5];
        if (v26 != 3 && v35 > v37)
        {
          double v52 = v35 / 5.0;
          BOOL v24 = v35 / 5.0 >= 100.0;
        }
        if (a12)
        {
          int v43 = v27;
          uint64_t v44 = 5;
        }
        else if (v26 == 4 && v35 > v37)
        {
          int v43 = v27;
          uint64_t v44 = 7;
          objc_msgSend(v31, "addIndex:", 7, v52);
          int64_t v42 = 7;
        }
        else
        {
          BOOL v60 = v24;
          int v43 = v27;
          uint64_t v44 = 5;
          if (v60) {
            int64_t v42 = 5;
          }
          else {
            int64_t v42 = 3;
          }
        }
        int64_t v48 = +[PXLayoutMetricInterpolator photosGridLayoutColumnsForWidth:v35];
        if (v35 > v37) {
          uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v46 = v44;
        }
        double interitemSpacing = v22->_interitemSpacing;
        [v32 panoramaCompactInteritemSpacing];
        double v49 = v61;
        double v50 = 5.25;
        goto LABEL_68;
      }
      [v123 layoutReferenceSize];
      v130[0] = MEMORY[0x1E4F143A8];
      v130[1] = 3221225472;
      v130[2] = __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_25;
      v130[3] = &unk_1E5DBBDA0;
      id v131 = &unk_1F02D4468;
      uint64_t v132 = v53;
      v54 = (uint64_t (**)(void, double))_Block_copy(v130);
      v55 = v54;
      v56.n128_u64[0] = 0x4066000000000000;
      if (v26 == 3) {
        v56.n128_f64[0] = 90.0;
      }
      uint64_t v57 = ((uint64_t (*)(__n128))v54[2])(v56);
      [v31 addIndex:v57];
      if (v26 == 3)
      {
        objc_msgSend(v31, "addIndex:", v55[2](v55, 130.0));
        objc_msgSend(v31, "addIndex:", v55[2](v55, 165.0));
      }
      else if (v26 == 1)
      {
        goto LABEL_48;
      }
      if ([v123 userInterfaceIdiom] != 3)
      {
        int v43 = v27;
        uint64_t v58 = 7;
        if (v26 != 4) {
          uint64_t v58 = v57;
        }
        goto LABEL_54;
      }
LABEL_48:
      int v43 = v27;
      uint64_t v58 = 5;
LABEL_54:
      if (a12) {
        int64_t v48 = a12;
      }
      else {
        int64_t v48 = v58;
      }
      if ((unint64_t)[v122 lastIndex] <= 5) {
        double interitemSpacing = 10.0;
      }
      else {
        double interitemSpacing = 17.0;
      }
      uint64_t v44 = [v122 lastIndex];
      [v32 panoramaRegularInteritemSpacing];
      double v49 = v59;

      uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
      double v50 = 5.45;
      int64_t v42 = v48;
      v22 = v126;
LABEL_68:
      v47 = off_1E5DA7000;
      goto LABEL_69;
    }
    if (((1 << a6) & 0x4D) != 0)
    {
      double v29 = 2.5;
      if (v120) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
    if (((1 << a6) & 0x30) == 0)
    {
      [v23 cardsInteritemSpacing];
      goto LABEL_16;
    }
    double v29 = 4.0;
    if (v117 != 5)
    {
      if (v125 == 4 || !v27)
      {
LABEL_14:
        objc_msgSend(v23, "interitemSpacing", v29);
        goto LABEL_16;
      }
      objc_msgSend(v23, "darkModeInteritemSpacing", 4.0);
    }
LABEL_16:
    v22->_double interitemSpacing = v29;
    goto LABEL_17;
  }
  v110 = (PXZoomablePhotosLayoutSpec *)0;

  return v110;
}

uint64_t __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_3(uint64_t result)
{
  if (*(void *)(result + 48) != 1) {
    PXSizeIsNull();
  }
  return result;
}

uint64_t __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeAllIndexes];
  if ([*(id *)(a1 + 40) enableOneColumn]
    && *(void *)(a1 + 48) != 1
    && !*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) addIndex:1];
  }
  v2 = *(void **)(a1 + 32);
  return [v2 addIndex:3];
}

void __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

- (NSArray)supportedColumns
{
  return self->_supportedColumns;
}

- (NSArray)minimumAssetsRequiredByColumn
{
  return self->_minimumAssetsRequiredByColumn;
}

- (PXZoomableInlineHeadersLayoutSpec)inlineHeadersSpec
{
  return self->_inlineHeadersSpec;
}

- (int64_t)initialNumberOfColumns
{
  return self->_initialNumberOfColumns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineHeadersSpec, 0);
  objc_storeStrong((id *)&self->_legacyMacSupportedColumns, 0);
  objc_storeStrong((id *)&self->_minimumAssetsRequiredByColumn, 0);
  objc_storeStrong((id *)&self->_supportedColumns, 0);
  objc_storeStrong((id *)&self->_explicitBackgroundColor, 0);
}

- (UIEdgeInsets)miniModeEdgeMargins
{
  double top = self->_miniModeEdgeMargins.top;
  double left = self->_miniModeEdgeMargins.left;
  double bottom = self->_miniModeEdgeMargins.bottom;
  double right = self->_miniModeEdgeMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)miniModeItemCornerRadius
{
  return self->_miniModeItemCornerRadius;
}

- (double)miniModeInteritemSpacing
{
  return self->_miniModeInteritemSpacing;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (double)captionSpacing
{
  return self->_captionSpacing;
}

- (NSArray)legacyMacSupportedColumns
{
  return self->_legacyMacSupportedColumns;
}

- (int64_t)maxColumnsForSaliency
{
  return self->_maxColumnsForSaliency;
}

- (double)aspectFitItemCornerRadius
{
  return self->_aspectFitItemCornerRadius;
}

- (double)panoramaInteritemSpacing
{
  return self->_panoramaInteritemSpacing;
}

- (double)panoramaItemAspectRatio
{
  return self->_panoramaItemAspectRatio;
}

- (double)aspectFitInteritemSpacing
{
  return self->_aspectFitInteritemSpacing;
}

- (UIEdgeInsets)aspectFitEdgeMargins
{
  double top = self->_aspectFitEdgeMargins.top;
  double left = self->_aspectFitEdgeMargins.left;
  double bottom = self->_aspectFitEdgeMargins.bottom;
  double right = self->_aspectFitEdgeMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)staticNumberOfColumns
{
  return self->_staticNumberOfColumns;
}

- (int64_t)defaultNumberOfColumns
{
  return self->_defaultNumberOfColumns;
}

void __88__PXZoomablePhotosLayoutSpec_bestColumnIndexForPreferredNumberOfColumns_allowedColumns___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 integerValue] > a1[5]
    || (*(void *)(*(void *)(a1[4] + 8) + 24) = a3, [v7 integerValue] >= a1[6]))
  {
    *a4 = 1;
  }
}

uint64_t __237__PXZoomablePhotosLayoutSpec_initWithExtendedTraitCollection_options_availableThumbnailSizes_gridStyle_itemAspectRatio_userDefaults_forceSaliency_preferredUserInterfaceStyle_additionalAspectFitEdgeMargins_overrideDefaultNumberOfColumns___block_invoke_25(uint64_t a1, double a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "integerValue", (void)v12);
      if (*(double *)(a1 + 40) / (double)v9 >= a2) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    id v4 = [*(id *)(a1 + 32) lastObject];
    uint64_t v9 = [v4 integerValue];
  }
  uint64_t v10 = v9;

  return v10;
}

- (PXZoomablePhotosLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXZoomablePhotosLayoutSpec.m", 39, @"%s is not available as initializer", "-[PXZoomablePhotosLayoutSpec initWithExtendedTraitCollection:options:]");

  abort();
}

@end