@interface PXCuratedLibraryLayoutSnapshotGeometryDescriptor
- (CGPoint)offset;
- (CGRect)visibleRect;
- (NSIndexSet)sections;
- (PXCuratedLibraryLayoutSnapshotGeometryDescriptor)init;
- (PXCuratedLibraryLayoutSnapshotGeometryDescriptor)initWithLayout:(id)a3;
- (id)description;
- (id)geometryDescriptorForSectionAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)dataSourceIdentifier;
- (int64_t)skimmingDataSourceIdentifier;
- (int64_t)zoomLevel;
- (void)compactifySectionsBeyondVisibleRectWithAnchorSection:(int64_t)a3;
- (void)extrapolateSectionsBetween:(int64_t)a3 and:(int64_t)a4 withAnchorSection:(int64_t)a5;
- (void)setOffset:(CGPoint)a3;
@end

@implementation PXCuratedLibraryLayoutSnapshotGeometryDescriptor

- (void).cxx_destruct
{
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (int64_t)skimmingDataSourceIdentifier
{
  return self->_skimmingDataSourceIdentifier;
}

- (int64_t)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p\n", v5, self];

  objc_msgSend(v6, "appendFormat:", @"\tdataSourceIdentifier=%li\n", -[PXCuratedLibraryLayoutSnapshotGeometryDescriptor dataSourceIdentifier](self, "dataSourceIdentifier"));
  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self offset];
  v7 = NSStringFromCGPoint(v19);
  [v6 appendFormat:@"\toffset=%@\n", v7];

  v8 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self sections];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_description__block_invoke;
  v17[3] = &unk_1E5DD1558;
  v17[4] = self;
  id v9 = v6;
  id v18 = v9;
  [v8 enumerateIndexesUsingBlock:v17];

  sectionGeometryDescriptorsByIndexPath = self->_sectionGeometryDescriptorsByIndexPath;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_description__block_invoke_2;
  v15[3] = &unk_1E5DC68D0;
  id v11 = v9;
  id v16 = v11;
  [(NSDictionary *)sectionGeometryDescriptorsByIndexPath enumerateKeysAndObjectsUsingBlock:v15];
  [v11 appendString:@">"];
  v12 = v16;
  id v13 = v11;

  return v13;
}

void __63__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  v5 = (void *)v4[1];
  v6 = (void *)MEMORY[0x1E4F29238];
  v11[0] = [v4 dataSourceIdentifier];
  v11[1] = a2;
  int64x2_t v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v7 = objc_msgSend(v6, "px_valueWithSimpleIndexPath:", v11);
  v8 = [v5 objectForKeyedSubscript:v7];

  id v9 = *(void **)(a1 + 40);
  [v8 sectionRect];
  v10 = NSStringFromCGRect(v13);
  [v9 appendFormat:@"\t%lu: %@\n", a2, v10];
}

void __63__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (a2) {
    objc_msgSend(a2, "px_simpleIndexPathValue");
  }
  PXSimpleIndexPathDescription();
}

- (void)compactifySectionsBeyondVisibleRectWithAnchorSection:(int64_t)a3
{
  v5 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self sections];
  if ([(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self zoomLevel] == 3
    && [v5 containsIndex:a3])
  {
    CGFloat x = self->_visibleRect.origin.x;
    CGFloat y = self->_visibleRect.origin.y;
    CGFloat width = self->_visibleRect.size.width;
    CGFloat height = self->_visibleRect.size.height;
    int64_t v10 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self dataSourceIdentifier];
    v113 = self;
    id v11 = (void *)[(NSDictionary *)self->_sectionGeometryDescriptorsByIndexPath mutableCopy];
    int64x2_t v12 = +[PXCuratedLibrarySettings sharedInstance];
    [v12 interitemSpacingForDays];
    double v115 = v13;

    double v135 = *MEMORY[0x1E4F1DAD8];
    double v136 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGFloat v111 = y;
    CGFloat v112 = x;
    v149.origin.CGFloat x = x;
    v149.origin.CGFloat y = y;
    CGFloat v109 = height;
    CGFloat v110 = width;
    v149.size.CGFloat width = width;
    v149.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v149);
    v114 = v5;
    int64_t v15 = [v5 firstIndex];
    if (v15 <= a3)
    {
      int64_t v16 = v15;
      uint64_t v17 = 0;
      double v116 = MinY - v115;
      double v117 = -1.79769313e308;
      int64x2_t v119 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      double v18 = v136;
      int64_t v19 = a3;
      double v121 = MinY;
      do
      {
        v147[0] = v10;
        v147[1] = v19;
        int64x2_t v148 = v119;
        v20 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithSimpleIndexPath:", v147);
        v21 = [v11 objectForKeyedSubscript:v20];
        v22 = objc_msgSend(v21, "sectionGeometryDescriptorOffsetBy:", v135, v18);

        [v22 sectionRect];
        double v24 = v23;
        double v26 = v25;
        CGFloat v28 = v27;
        double v30 = v29;
        [v22 keyAssetRect];
        CGFloat v143 = v31;
        double v137 = v32;
        CGFloat v139 = v33;
        CGFloat rect = v34;
        [v22 headerRect];
        double v36 = v35;
        double v38 = v37;
        double v129 = v40;
        double v131 = v39;
        v150.origin.CGFloat x = v24;
        v150.origin.CGFloat y = v26;
        v150.size.CGFloat width = v28;
        v150.size.CGFloat height = v30;
        double v133 = v36;
        double v127 = v28;
        if (CGRectGetMaxY(v150) >= MinY)
        {
          v155.origin.CGFloat x = v143;
          v155.origin.CGFloat y = v137;
          v155.size.CGFloat height = v139;
          v155.size.CGFloat width = rect;
          if (CGRectGetMaxY(v155) >= MinY)
          {
            double v123 = v30;
            double v125 = v18;
            double v44 = v38;
            double v45 = v137;
          }
          else
          {
            v156.origin.CGFloat x = v143;
            v156.size.CGFloat height = v139;
            v156.origin.CGFloat y = v137;
            v156.size.CGFloat width = rect;
            double v46 = v116 - CGRectGetMaxY(v156);
            double v26 = v26 + v46;
            double v123 = v30 - v46;
            double v125 = v18 + v46;
            CGFloat v143 = v24;
            CGFloat rect = v28;
            double v44 = v38;
            double v45 = v137 + v46;
          }
        }
        else
        {
          v151.origin.CGFloat x = v143;
          v151.origin.CGFloat y = v137;
          v151.size.CGFloat height = v139;
          v151.size.CGFloat width = rect;
          double v41 = CGRectGetHeight(v151);
          v152.origin.CGFloat x = v24;
          v152.origin.CGFloat y = v26;
          v152.size.CGFloat width = v28;
          v152.size.CGFloat height = v30;
          double MaxY = CGRectGetMaxY(v152);
          if (MaxY < v117) {
            double MaxY = v117;
          }
          double v43 = MaxY - v41;
          v153.origin.CGFloat x = v24;
          v153.origin.CGFloat y = v26;
          v153.size.CGFloat width = v28;
          v153.size.CGFloat height = v30;
          double v44 = v43;
          double v125 = v18 + v43 - CGRectGetMinY(v153);
          ++v17;
          CGFloat v139 = v41;
          if (v17 == 3)
          {
            v154.origin.CGFloat x = v24;
            v154.origin.CGFloat y = v44;
            v154.size.CGFloat width = v28;
            v154.size.CGFloat height = v41;
            double v117 = CGRectGetMaxY(v154);
          }
          CGFloat v143 = v24;
          CGFloat rect = v28;
          double v45 = v44;
          double v123 = v41;
          double v26 = v44;
        }
        v47 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
        [v22 headerCornerRadius];
        unsigned int v49 = v48;
        unsigned int v51 = v50;
        unsigned int v53 = v52;
        unsigned int v55 = v54;
        v56 = [v22 headerAsset];
        v57 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:](v47, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v56, [v22 visualPosition], v24, v26, v127, v123, v133, v44, v131, v129, *(void *)&v143, *(void *)&v45, *(void *)&rect, *(void *)&v139, __PAIR64__(v51, v49), __PAIR64__(v55, v53));
        [v11 setObject:v57 forKeyedSubscript:v20];

        BOOL v58 = v19-- <= v16;
        double MinY = v121;
        double v18 = v125;
      }
      while (!v58);
    }
    v157.origin.CGFloat y = v111;
    v157.origin.CGFloat x = v112;
    v157.size.CGFloat height = v109;
    v157.size.CGFloat width = v110;
    double v122 = CGRectGetMaxY(v157);
    v5 = v114;
    int64_t v59 = [v114 lastIndex];
    if (v59 >= a3)
    {
      uint64_t v60 = 0;
      int64_t v61 = v59 + 1;
      double v118 = 1.79769313e308;
      int64x2_t v120 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        v145[0] = v10;
        v145[1] = a3;
        int64x2_t v146 = v120;
        v62 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithSimpleIndexPath:", v145);
        v63 = [v11 objectForKeyedSubscript:v62];
        v64 = objc_msgSend(v63, "sectionGeometryDescriptorOffsetBy:", v135, v136);

        [v64 sectionRect];
        CGFloat v66 = v65;
        CGFloat v68 = v67;
        CGFloat v70 = v69;
        CGFloat v72 = v71;
        [v64 keyAssetRect];
        CGFloat v74 = v73;
        CGFloat v126 = v76;
        CGFloat v128 = v75;
        CGFloat v78 = v77;
        [v64 headerRect];
        double v80 = v79;
        double v82 = v81;
        double v130 = v84;
        double v132 = v83;
        v158.origin.CGFloat x = v66;
        v158.origin.CGFloat y = v68;
        v158.size.CGFloat width = v70;
        v158.size.CGFloat height = v72;
        double v138 = v80;
        double v134 = v82;
        if (CGRectGetMinY(v158) <= v122)
        {
          CGFloat v144 = v78;
          double v140 = v66;
          double recta = v68;
          v164.origin.CGFloat x = v66;
          v164.origin.CGFloat y = v68;
          v164.size.CGFloat width = v70;
          v164.size.CGFloat height = v72;
          double v92 = v72;
          if (CGRectGetMaxY(v164) <= v122)
          {
            double v124 = v72;
            CGFloat v91 = v128;
            CGFloat v66 = v74;
            CGFloat v89 = v126;
          }
          else
          {
            v165.origin.CGFloat x = v74;
            v165.origin.CGFloat y = v128;
            v165.size.CGFloat width = v126;
            v165.size.CGFloat height = v78;
            if (CGRectGetMinY(v165) >= v122)
            {
              double v124 = v72;
              CGFloat v89 = v126;
              CGFloat v91 = v128;
              CGFloat v66 = v74;
            }
            else
            {
              v166.origin.CGFloat x = v74;
              v166.origin.CGFloat y = v128;
              v166.size.CGFloat width = v126;
              v166.size.CGFloat height = v78;
              double v93 = v115 + CGRectGetMaxY(v166);
              double v94 = v122;
              if (v122 < v93) {
                double v94 = v93;
              }
              v167.origin.CGFloat x = v66;
              v167.origin.CGFloat y = recta;
              v167.size.CGFloat width = v70;
              v167.size.CGFloat height = v92;
              double v95 = v94 - CGRectGetMaxY(v167);
              double v136 = v136 + v95;
              double v124 = v92 + v95;
              CGFloat v89 = v126;
              CGFloat v91 = v128;
              CGFloat v66 = v74;
            }
          }
          double v90 = v70;
        }
        else
        {
          v159.origin.CGFloat x = v74;
          v159.size.CGFloat width = v126;
          v159.origin.CGFloat y = v128;
          v159.size.CGFloat height = v78;
          double v85 = CGRectGetHeight(v159);
          v160.origin.CGFloat x = v66;
          v160.origin.CGFloat y = v68;
          v160.size.CGFloat width = v70;
          v160.size.CGFloat height = v72;
          double v86 = v136 + v85 - CGRectGetHeight(v160);
          v161.origin.CGFloat x = v66;
          v161.origin.CGFloat y = v68;
          v161.size.CGFloat width = v70;
          v161.size.CGFloat height = v72;
          double v87 = CGRectGetMinY(v161);
          if (v87 >= v118) {
            double v88 = v118;
          }
          else {
            double v88 = v87;
          }
          v162.origin.CGFloat x = v66;
          v162.origin.CGFloat y = v68;
          v162.size.CGFloat width = v70;
          v162.size.CGFloat height = v72;
          double v136 = v86 + v88 - CGRectGetMinY(v162);
          ++v60;
          CGFloat v89 = v70;
          double v124 = v85;
          if (v60 == 3)
          {
            v163.origin.CGFloat x = v66;
            v163.origin.CGFloat y = v88;
            v163.size.CGFloat width = v70;
            v163.size.CGFloat height = v85;
            double v118 = CGRectGetMinY(v163);
          }
          double v140 = v66;
          double recta = v88;
          double v90 = v70;
          CGFloat v144 = v85;
          CGFloat v91 = v88;
        }
        v96 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
        [v64 headerCornerRadius];
        unsigned int v98 = v97;
        unsigned int v100 = v99;
        unsigned int v102 = v101;
        unsigned int v104 = v103;
        v105 = [v64 headerAsset];
        v106 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:](v96, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", v105, [v64 visualPosition], v140, recta, v90, v124, v138, v134, v132, v130, *(void *)&v66, *(void *)&v91, *(void *)&v89, *(void *)&v144, __PAIR64__(v100, v98), __PAIR64__(v104, v102));
        [v11 setObject:v106 forKeyedSubscript:v62];

        ++a3;
      }
      while (v61 != a3);
    }
    uint64_t v107 = [v11 copy];
    sectionGeometryDescriptorsByIndexPath = v113->_sectionGeometryDescriptorsByIndexPath;
    v113->_sectionGeometryDescriptorsByIndexPath = (NSDictionary *)v107;
  }
}

- (void)extrapolateSectionsBetween:(int64_t)a3 and:(int64_t)a4 withAnchorSection:(int64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v7 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self sections];
  if ([v7 count])
  {
    v8 = (void *)[(NSDictionary *)self->_sectionGeometryDescriptorsByIndexPath mutableCopy];
    int64_t v9 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self dataSourceIdentifier];
    int64_t v10 = [v7 firstIndex];
    if (v10 >= a5)
    {
      int64x2_t v12 = 0;
    }
    else
    {
      int64_t v11 = v10;
      int64x2_t v12 = 0;
      int64x2_t v24 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        int v13 = [v7 containsIndex:v11];
        *(void *)&long long buf = v9;
        *((void *)&buf + 1) = v11;
        int64x2_t v27 = v24;
        if (v13)
        {
          v14 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithSimpleIndexPath:", &buf);
          uint64_t v15 = [v8 objectForKeyedSubscript:v14];

          int64x2_t v12 = (void *)v15;
        }
        else
        {
          v14 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithSimpleIndexPath:", &buf);
          [v8 setObject:v12 forKeyedSubscript:v14];
        }

        ++v11;
      }
      while (a5 != v11);
    }
    int64_t v17 = [v7 lastIndex];
    if (v17 > a5)
    {
      int64_t v18 = v17;
      int64x2_t v25 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        int v19 = [v7 containsIndex:v18];
        *(void *)&long long buf = v9;
        *((void *)&buf + 1) = v18;
        int64x2_t v27 = v25;
        if (v19)
        {
          v20 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithSimpleIndexPath:", &buf);
          uint64_t v21 = [v8 objectForKeyedSubscript:v20];

          int64x2_t v12 = (void *)v21;
        }
        else
        {
          v20 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithSimpleIndexPath:", &buf);
          [v8 setObject:v12 forKeyedSubscript:v20];
        }

        --v18;
      }
      while (v18 > a5);
    }
    uint64_t v22 = objc_msgSend(v7, "firstIndex", self);
    *(void *)&long long buf = v9;
    *((void *)&buf + 1) = v22;
    int64x2_t v27 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithSimpleIndexPath:", &buf);
    double v23 = [v8 objectForKeyedSubscript:objc_claimAutoreleasedReturnValue()];
    __101__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_extrapolateSectionsBetween_and_withAnchorSection___block_invoke(v23);
  }
  int64_t v16 = PLCuratedLibraryGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "cannot extrapolate sections in %@", (uint8_t *)&buf, 0xCu);
  }
}

void __101__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_extrapolateSectionsBetween_and_withAnchorSection___block_invoke(void *a1)
{
}

- (NSIndexSet)sections
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  int64_t v4 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self dataSourceIdentifier];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NSDictionary *)self->_sectionGeometryDescriptorsByIndexPath keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        int64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v10) {
          objc_msgSend(v10, "px_simpleIndexPathValue");
        }
        if (!v4) {
          [v3 addIndex:0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  int64_t v11 = (void *)[v3 copy];
  return (NSIndexSet *)v11;
}

- (id)geometryDescriptorForSectionAtIndexPath:(PXSimpleIndexPath *)a3
{
  sectionGeometryDescriptorsByIndexPath = self->_sectionGeometryDescriptorsByIndexPath;
  long long v5 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v5;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithSimpleIndexPath:", v10);
  uint64_t v7 = [(NSDictionary *)sectionGeometryDescriptorsByIndexPath objectForKeyedSubscript:v6];

  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self offset];
  uint64_t v8 = objc_msgSend(v7, "sectionGeometryDescriptorOffsetBy:");

  return v8;
}

- (CGRect)visibleRect
{
  [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)self offset];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat x = self->_visibleRect.origin.x;
  CGFloat y = self->_visibleRect.origin.y;
  CGFloat width = self->_visibleRect.size.width;
  CGFloat height = self->_visibleRect.size.height;
  return CGRectOffset(*(CGRect *)&x, v4, v6);
}

- (PXCuratedLibraryLayoutSnapshotGeometryDescriptor)initWithLayout:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PXCuratedLibraryLayoutSnapshotGeometryDescriptor;
  double v5 = [(PXCuratedLibraryLayoutSnapshotGeometryDescriptor *)&v35 init];
  if (v5)
  {
    CGFloat v6 = [v4 libraryBodyLayout];
    uint64_t v7 = [v6 presentedDataSource];
    v5->_dataSourceIdentifier = [v7 identifier];

    v5->_zoomLevel = [v4 presentedZoomLevel];
    [v4 presentedVisibleRect];
    v5->_visibleRect.origin.CGFloat x = v8;
    v5->_visibleRect.origin.CGFloat y = v9;
    v5->_visibleRect.size.CGFloat width = v10;
    v5->_visibleRect.size.CGFloat height = v11;
    v5->_offset = (CGPoint)*MEMORY[0x1E4F1DAD8];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v6)
    {
      [v6 orientedContentTransform];
    }
    else
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v31 = 0u;
    }
    long long v28 = v31;
    long long v29 = v32;
    long long v30 = v33;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __67__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_initWithLayout___block_invoke;
    double v23 = &unk_1E5DC68A8;
    id v24 = v4;
    long long v13 = v5;
    int64x2_t v25 = v13;
    id v26 = v6;
    id v27 = v12;
    id v14 = v12;
    id v15 = v6;
    [v15 enumerateAssetsSectionSublayoutsUsingBlock:&v20];
    uint64_t v16 = objc_msgSend(v14, "copy", v20, v21, v22, v23);
    sectionGeometryDescriptorsByIndexPath = v13->_sectionGeometryDescriptorsByIndexPath;
    v13->_sectionGeometryDescriptorsByIndexPath = (NSDictionary *)v16;

    [v15 defaultInterlayoutSpacing];
    v13->_intersectionSpacing = v18;
  }
  return v5;
}

void __67__PXCuratedLibraryLayoutSnapshotGeometryDescriptor_initWithLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CGFloat v6 = [v5 bodyContentLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 presentedGeometryDescriptor];
    CGFloat v8 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
    [v7 sectionRect];
    [v5 padding];
    PXEdgeInsetsInsetRect();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v9 = [v6 presentedGeometryDescriptor];
  }
  else
  {
    CGFloat v9 = 0;
  }
  CGFloat v10 = [v5 headerLayout];
  CGFloat v11 = v10;
  if (v6 && v10)
  {
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v10 contentSize];
    objc_msgSend(v6, "convertRect:fromLayout:", v11, v12, v13, v14, v15);
    double v17 = v16;
    double v19 = v18;
    [(PXCuratedLibrarySectionGeometryDescriptor *)v9 sectionRect];
    double v21 = v20;
    double v23 = v22;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 alpha];
      if (v24 <= 0.0)
      {
        [(PXCuratedLibrarySectionGeometryDescriptor *)v9 sectionRect];
        double MaxY = CGRectGetMaxY(v55);
        v56.origin.CGFloat x = v21;
        v56.origin.CGFloat y = v17;
        v56.size.CGFloat width = v23;
        v56.size.CGFloat height = v19;
        double v26 = MaxY - CGRectGetHeight(v56);
        if (v17 >= v26) {
          double v17 = v26;
        }
      }
    }
    uint64_t v27 = -[PXCuratedLibrarySectionGeometryDescriptor sectionGeometryDescriptorWithHeaderRect:](v9, "sectionGeometryDescriptorWithHeaderRect:", v21, v17, v23, v19);

    CGFloat v9 = (PXCuratedLibrarySectionGeometryDescriptor *)v27;
  }
  if (v9)
  {
    uint64_t v28 = *(void *)off_1E5DAB028;
    uint64_t v29 = *((void *)off_1E5DAB028 + 1);
    uint64_t v30 = *((void *)off_1E5DAB028 + 2);
    uint64_t v31 = *((void *)off_1E5DAB028 + 3);
    objc_msgSend(*(id *)(a1 + 32), "convertRect:fromLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (!CGRectIsNull(v57)) {
      PXPointIsNull();
    }
  }
  else
  {
    double v32 = *MEMORY[0x1E4F1DAD8];
    double v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v5 contentSize];
    objc_msgSend(*(id *)(a1 + 48), "convertRect:fromDescendantLayout:", v5, v32, v33, v34, v35);
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v44 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
    HIDWORD(v50) = *((_DWORD *)off_1E5DAAF50 + 3);
    *(void *)((char *)&v50 + 4) = *(void *)((char *)off_1E5DAAF50 + 4);
    LODWORD(v50) = *(_DWORD *)off_1E5DAAF50;
    CGFloat v9 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:](v44, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:visualPosition:", 0, a2, v37, v39, v41, v43, *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), v50);
    double v45 = [*(id *)(a1 + 48) presentedDataSource];
    uint64_t v28 = [v45 identifier];

    if (!v9) {
      goto LABEL_20;
    }
    uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v29 = a2;
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v28 != *(void *)off_1E5DAAED8)
  {
    long long v46 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)long long buf = *(_OWORD *)(a1 + 64);
    long long v52 = v46;
    long long v53 = *(_OWORD *)(a1 + 96);
    uint64_t v47 = [(PXCuratedLibrarySectionGeometryDescriptor *)v9 sectionGeometryDescriptorTransformedBy:buf];

    unsigned int v48 = *(void **)(a1 + 56);
    *(void *)long long buf = v28;
    *(void *)&buf[8] = v29;
    *(void *)&long long v52 = v30;
    *((void *)&v52 + 1) = v31;
    unsigned int v49 = objc_msgSend(MEMORY[0x1E4F29238], "px_valueWithSimpleIndexPath:", buf);
    [v48 setObject:v47 forKeyedSubscript:v49];

    CGFloat v9 = (PXCuratedLibrarySectionGeometryDescriptor *)v47;
  }
LABEL_20:
}

- (PXCuratedLibraryLayoutSnapshotGeometryDescriptor)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryLayoutSnapshotGeometryDescriptor.m", 33, @"%s is not available as initializer", "-[PXCuratedLibraryLayoutSnapshotGeometryDescriptor init]");

  abort();
}

@end