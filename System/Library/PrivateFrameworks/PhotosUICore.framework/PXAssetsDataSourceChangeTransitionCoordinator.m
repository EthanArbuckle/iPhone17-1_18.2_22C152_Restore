@interface PXAssetsDataSourceChangeTransitionCoordinator
- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7;
- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (PXAssetsDataSourceChangeTransitionCoordinator)initWithTilingChange:(id)a3 changeHistory:(id)a4;
- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8;
- (void)_updateAnimationDelay;
- (void)setDelayInsertions:(BOOL)a3;
- (void)setTreatRemovalsAsDeletes:(BOOL)a3;
@end

@implementation PXAssetsDataSourceChangeTransitionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFinalGeometryByTileIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideInitialGeometryByTileIdentifier, 0);
  objc_storeStrong((id *)&self->_insertAnimationOptions, 0);
  objc_storeStrong((id *)&self->_deleteAnimationOptions, 0);
}

- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  v95.receiver = self;
  v95.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  CGSize v14 = *(CGSize *)&a3->index[5];
  CGPoint v63 = *(CGPoint *)&a3->index[3];
  CGSize v64 = v14;
  long long v65 = *(_OWORD *)&a3->index[7];
  *(void *)&long long v66 = a3->index[9];
  CGSize v15 = *(CGSize *)&a3->index[1];
  CGPoint origin = *(CGPoint *)&a3->length;
  CGSize v62 = v15;
  long long v16 = *(_OWORD *)&a4->contentSize.height;
  long long v91 = *(_OWORD *)&a4->hidden;
  long long v92 = v16;
  long long v17 = *(_OWORD *)&a4->contentsRect.size.height;
  long long v93 = *(_OWORD *)&a4->contentsRect.origin.y;
  long long v94 = v17;
  long long v18 = *(_OWORD *)&a4->transform.c;
  long long v87 = *(_OWORD *)&a4->transform.a;
  long long v88 = v18;
  long long v19 = *(_OWORD *)&a4->alpha;
  long long v89 = *(_OWORD *)&a4->transform.tx;
  long long v90 = v19;
  CGSize size = a4->frame.size;
  v84.CGPoint origin = a4->frame.origin;
  v84.CGSize size = size;
  CGSize v21 = a4->size;
  unsigned long long center = (unsigned __int128)a4->center;
  CGSize v86 = v21;
  long long v22 = *(_OWORD *)&a6->contentSize.height;
  long long v80 = *(_OWORD *)&a6->hidden;
  long long v81 = v22;
  long long v23 = *(_OWORD *)&a6->contentsRect.size.height;
  long long v82 = *(_OWORD *)&a6->contentsRect.origin.y;
  long long v83 = v23;
  long long v24 = *(_OWORD *)&a6->transform.c;
  long long v76 = *(_OWORD *)&a6->transform.a;
  long long v77 = v24;
  long long v25 = *(_OWORD *)&a6->alpha;
  long long v78 = *(_OWORD *)&a6->transform.tx;
  long long v79 = v25;
  CGSize v26 = a6->frame.size;
  v73.CGPoint origin = a6->frame.origin;
  v73.CGSize size = v26;
  CGSize v27 = a6->size;
  unsigned long long v74 = (unsigned __int128)a6->center;
  CGSize v75 = v27;
  unsigned __int8 v28 = [(PXAssetsTileTransitionCoordinator *)&v95 useDoubleSidedAnimationForUpdatedTileWithIdentifier:&origin fromGeometry:&v84 fromUserData:v12 toGeometry:&v73 toUserData:v13];
  if (a3->length - 3 <= 2 && a3->index[1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v29 = a3->index[0];
    if (v29 == 6332437)
    {
      unsigned __int8 v28 = a4->size.height != a6->size.height || a4->size.width != a6->size.width;
    }
    else if (v29 == 6332435)
    {
      id v30 = v13;
      if (v28)
      {
        unsigned __int8 v28 = 1;
      }
      else
      {
        uint64_t v31 = [v12 badgeOptions];
        unsigned __int8 v28 = v31 != [v30 badgeOptions];
      }
    }
  }
  v32 = [(PXAssetsTileTransitionCoordinator *)self _toLayout];
  [v32 visibleRect];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  v41 = +[PXTilingCoordinateSpaceConverter defaultConverter];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  unsigned long long center = 0u;
  CGSize v86 = (CGSize)0;
  memset(&v84, 0, sizeof(v84));
  uint64_t v42 = [v32 coordinateSpaceIdentifier];
  if (v41)
  {
    long long v43 = *(_OWORD *)&a4->contentSize.height;
    long long v80 = *(_OWORD *)&a4->hidden;
    long long v81 = v43;
    long long v44 = *(_OWORD *)&a4->contentsRect.size.height;
    long long v82 = *(_OWORD *)&a4->contentsRect.origin.y;
    long long v83 = v44;
    long long v45 = *(_OWORD *)&a4->transform.c;
    long long v76 = *(_OWORD *)&a4->transform.a;
    long long v77 = v45;
    long long v46 = *(_OWORD *)&a4->alpha;
    long long v78 = *(_OWORD *)&a4->transform.tx;
    long long v79 = v46;
    CGSize v47 = a4->frame.size;
    v73.CGPoint origin = a4->frame.origin;
    v73.CGSize size = v47;
    CGSize v48 = a4->size;
    unsigned long long v74 = (unsigned __int128)a4->center;
    CGSize v75 = v48;
    [v41 convertTileGeometry:&v73 toCoordinateSpaceIdentifier:v42];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    unsigned long long v74 = 0u;
    CGSize v75 = (CGSize)0;
    memset(&v73, 0, sizeof(v73));
    uint64_t v49 = [v32 coordinateSpaceIdentifier];
    long long v50 = *(_OWORD *)&a6->contentSize.height;
    long long v69 = *(_OWORD *)&a6->hidden;
    long long v70 = v50;
    long long v51 = *(_OWORD *)&a6->contentsRect.size.height;
    long long v71 = *(_OWORD *)&a6->contentsRect.origin.y;
    long long v72 = v51;
    long long v52 = *(_OWORD *)&a6->transform.c;
    long long v65 = *(_OWORD *)&a6->transform.a;
    long long v66 = v52;
    long long v53 = *(_OWORD *)&a6->alpha;
    long long v67 = *(_OWORD *)&a6->transform.tx;
    long long v68 = v53;
    CGSize v54 = a6->frame.size;
    CGPoint origin = a6->frame.origin;
    CGSize v62 = v54;
    CGSize v55 = a6->size;
    CGPoint v63 = a6->center;
    CGSize v64 = v55;
    [v41 convertTileGeometry:&origin toCoordinateSpaceIdentifier:v49];
    CGFloat y = v73.origin.y;
    CGFloat x = v73.origin.x;
    CGFloat height = v73.size.height;
    CGFloat width = v73.size.width;
  }
  else
  {
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    unsigned long long center = 0u;
    CGSize v86 = (CGSize)0;
    memset(&v84, 0, sizeof(v84));
    [v32 coordinateSpaceIdentifier];
    memset(&v73, 0, sizeof(v73));
    unsigned long long v74 = 0u;
    CGSize v75 = (CGSize)0;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    CGFloat height = 0.0;
    CGFloat width = 0.0;
    CGFloat y = 0.0;
    long long v82 = 0u;
    long long v83 = 0u;
    CGFloat x = 0.0;
  }
  v96.origin.CGFloat x = v34;
  v96.origin.CGFloat y = v36;
  v96.size.CGFloat width = v38;
  v96.size.CGFloat height = v40;
  if (CGRectIntersectsRect(v96, *(CGRect *)&x)
    && (v97.origin.CGFloat x = v34,
        v97.origin.CGFloat y = v36,
        v97.size.CGFloat width = v38,
        v97.size.CGFloat height = v40,
        !CGRectIntersectsRect(v97, v84)))
  {
    v102.origin.CGFloat x = v34;
    v102.origin.CGFloat y = v36;
    v102.size.CGFloat width = v38;
    v102.size.CGFloat height = v40;
    CGRect v103 = CGRectInset(v102, -(v84.size.width * 0.5 + 500.0), -(v84.size.height * 0.5 + 500.0));
    if (!CGRectContainsPoint(v103, (CGPoint)center)) {
      PXRectClampPoint();
    }
  }
  else
  {
    v98.origin.CGFloat x = v34;
    v98.origin.CGFloat y = v36;
    v98.size.CGFloat width = v38;
    v98.size.CGFloat height = v40;
    if (CGRectIntersectsRect(v98, v84))
    {
      v99.origin.CGFloat x = v34;
      v99.origin.CGFloat y = v36;
      v99.size.CGFloat width = v38;
      v99.size.CGFloat height = v40;
      if (!CGRectIntersectsRect(v99, v73))
      {
        v100.origin.CGFloat x = v34;
        v100.origin.CGFloat y = v36;
        v100.size.CGFloat width = v38;
        v100.size.CGFloat height = v40;
        CGRect v101 = CGRectInset(v100, -(v73.size.width * 0.5 + 500.0), -(v73.size.height * 0.5 + 500.0));
        if (!CGRectContainsPoint(v101, (CGPoint)v74)) {
          PXRectClampPoint();
        }
      }
    }
  }

  return v28;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  id v65 = a7;
  if ([(NSMutableDictionary *)self->_overrideFinalGeometryByTileIdentifier count])
  {
    overrideFinalGeometryByTileIdentifier = self->_overrideFinalGeometryByTileIdentifier;
    CGSize v12 = *(CGSize *)&a5->index[5];
    CGPoint center = *(CGPoint *)&a5->index[3];
    CGSize v76 = v12;
    long long v77 = *(_OWORD *)&a5->index[7];
    *(void *)&long long v78 = a5->index[9];
    CGSize v13 = *(CGSize *)&a5->index[1];
    CGPoint origin = *(CGPoint *)&a5->length;
    CGSize v74 = v13;
    CGSize v14 = [MEMORY[0x1E4F29238] valueWithPXTileIdentifier:&origin];
    CGSize v15 = [(NSMutableDictionary *)overrideFinalGeometryByTileIdentifier objectForKeyedSubscript:v14];

    BOOL v16 = v15 != 0;
    if (v15)
    {
      [v15 PXTileGeometryValue];
      long long v17 = v82;
      *(_OWORD *)&a3->hidden = v81;
      *(_OWORD *)&a3->contentSize.CGFloat height = v17;
      long long v18 = v84;
      *(_OWORD *)&a3->contentsRect.origin.CGFloat y = v83;
      *(_OWORD *)&a3->contentsRect.size.CGFloat height = v18;
      long long v19 = v78;
      *(_OWORD *)&a3->transform.a = v77;
      *(_OWORD *)&a3->transform.c = v19;
      long long v20 = v80;
      *(_OWORD *)&a3->transform.tCGFloat x = v79;
      *(_OWORD *)&a3->alpha = v20;
      CGSize v21 = v74;
      a3->frame.CGPoint origin = origin;
      a3->frame.CGSize size = v21;
      CGSize v22 = v76;
      a3->CGPoint center = center;
      a3->CGSize size = v22;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
  unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5->length - 3 <= 2 && a5->index[1] != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v23 = a5->index[0];
  }
  long long v24 = [(PXAssetsTileTransitionCoordinator *)self _kindsCoveringContentTiles];
  char v25 = [v24 containsIndex:v23];

  CGSize v26 = [(PXAssetsTileTransitionCoordinator *)self _kindsCenteredOnContentTiles];
  int v27 = [v26 containsIndex:v23];

  if ((v25 & 1) == 0 && !v27) {
    goto LABEL_17;
  }
  unint64_t v28 = a5->index[1];
  unint64_t v29 = [(PXAssetsTileTransitionCoordinator *)self _toLayout];
  id v30 = [v29 dataSource];
  BOOL v63 = v16;
  uint64_t v31 = [v30 identifier];

  BOOL v32 = v28 == v31;
  BOOL v16 = v63;
  if (!v32)
  {
LABEL_17:
    if (v16)
    {
LABEL_18:
      BOOL v50 = 1;
      uint64_t v49 = v65;
      goto LABEL_21;
    }
LABEL_20:
    v66.receiver = self;
    v66.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
    long long v51 = *(_OWORD *)&a5->index[5];
    long long v69 = *(_OWORD *)&a5->index[3];
    long long v70 = v51;
    long long v71 = *(_OWORD *)&a5->index[7];
    unint64_t v72 = a5->index[9];
    long long v52 = *(_OWORD *)&a5->index[1];
    long long v67 = *(_OWORD *)&a5->length;
    long long v68 = v52;
    long long v53 = *(_OWORD *)&a6->contentSize.height;
    long long v81 = *(_OWORD *)&a6->hidden;
    long long v82 = v53;
    long long v54 = *(_OWORD *)&a6->contentsRect.size.height;
    long long v83 = *(_OWORD *)&a6->contentsRect.origin.y;
    long long v84 = v54;
    long long v55 = *(_OWORD *)&a6->transform.c;
    long long v77 = *(_OWORD *)&a6->transform.a;
    long long v78 = v55;
    long long v56 = *(_OWORD *)&a6->alpha;
    long long v79 = *(_OWORD *)&a6->transform.tx;
    long long v80 = v56;
    CGSize size = a6->frame.size;
    CGPoint origin = a6->frame.origin;
    CGSize v74 = size;
    CGSize v58 = a6->size;
    CGPoint center = a6->center;
    CGSize v76 = v58;
    uint64_t v49 = v65;
    BOOL v50 = [(PXAssetsTileTransitionCoordinator *)&v66 getFinalGeometry:a3 finalUserData:a4 forDisappearingTileWithIdentifier:&v67 fromGeometry:&origin fromUserData:v65];
    goto LABEL_21;
  }
  long long v33 = *((_OWORD *)off_1E5DAB048 + 9);
  long long v81 = *((_OWORD *)off_1E5DAB048 + 8);
  long long v82 = v33;
  long long v34 = *((_OWORD *)off_1E5DAB048 + 11);
  long long v83 = *((_OWORD *)off_1E5DAB048 + 10);
  long long v84 = v34;
  long long v35 = *((_OWORD *)off_1E5DAB048 + 5);
  long long v77 = *((_OWORD *)off_1E5DAB048 + 4);
  long long v78 = v35;
  long long v36 = *((_OWORD *)off_1E5DAB048 + 7);
  long long v79 = *((_OWORD *)off_1E5DAB048 + 6);
  long long v80 = v36;
  CGSize v37 = (CGSize)*((_OWORD *)off_1E5DAB048 + 1);
  CGPoint origin = *(CGPoint *)off_1E5DAB048;
  CGSize v74 = v37;
  CGSize v38 = (CGSize)*((_OWORD *)off_1E5DAB048 + 3);
  CGPoint center = (CGPoint)*((_OWORD *)off_1E5DAB048 + 2);
  CGSize v76 = v38;
  double v39 = [(PXAssetsTileTransitionCoordinator *)self _toLayout];
  long long v67 = xmmword_1AB359AB0;
  *(void *)&long long v68 = v28;
  *((void *)&v68 + 1) = v62;
  *(void *)&long long v69 = v61;
  *((void *)&v69 + 1) = v60;
  long long v70 = 0u;
  long long v71 = 0u;
  unint64_t v72 = 0;
  int v40 = [v39 getGeometry:&origin group:0 userData:0 forTileWithIdentifier:&v67];

  if (!v40)
  {
    if (v63) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  *(void *)&long long v80 = 0;
  v41 = [(PXAssetsTileTransitionCoordinator *)self _toLayout];
  [v41 zPositionOffsetForKind:v23];
  *((double *)&v80 + 1) = v42 + *((double *)&v80 + 1);

  if (v27)
  {
    CGSize v76 = a6->size;
    PXRectWithCenterAndSize();
  }
  long long v43 = v82;
  *(_OWORD *)&a3->hidden = v81;
  *(_OWORD *)&a3->contentSize.CGFloat height = v43;
  long long v44 = v84;
  *(_OWORD *)&a3->contentsRect.origin.CGFloat y = v83;
  *(_OWORD *)&a3->contentsRect.size.CGFloat height = v44;
  long long v45 = v78;
  *(_OWORD *)&a3->transform.a = v77;
  *(_OWORD *)&a3->transform.c = v45;
  long long v46 = v80;
  *(_OWORD *)&a3->transform.tCGFloat x = v79;
  *(_OWORD *)&a3->alpha = v46;
  CGSize v47 = v74;
  a3->frame.CGPoint origin = origin;
  a3->frame.CGSize size = v47;
  CGSize v48 = v76;
  a3->CGPoint center = center;
  a3->CGSize size = v48;
  uint64_t v49 = v65;
  *a4 = v65;
  BOOL v50 = 1;
LABEL_21:

  return v50;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  id v12 = a7;
  if ([(NSMutableDictionary *)self->_overrideInitialGeometryByTileIdentifier count])
  {
    overrideInitialGeometryByTileIdentifier = self->_overrideInitialGeometryByTileIdentifier;
    CGSize v14 = *(CGSize *)&a5->index[5];
    CGPoint center = *(CGPoint *)&a5->index[3];
    CGSize size = v14;
    long long v74 = *(_OWORD *)&a5->index[7];
    *(void *)&long long v75 = a5->index[9];
    CGSize v15 = *(CGSize *)&a5->index[1];
    CGPoint origin = *(CGPoint *)&a5->length;
    CGSize v71 = v15;
    BOOL v16 = [MEMORY[0x1E4F29238] valueWithPXTileIdentifier:&origin];
    long long v17 = [(NSMutableDictionary *)overrideInitialGeometryByTileIdentifier objectForKeyedSubscript:v16];

    BOOL v18 = v17 != 0;
    if (v17)
    {
      [v17 PXTileGeometryValue];
      long long v19 = v79;
      *(_OWORD *)&a3->hidden = v78;
      *(_OWORD *)&a3->contentSize.CGFloat height = v19;
      long long v20 = v81;
      *(_OWORD *)&a3->contentsRect.origin.CGFloat y = v80;
      *(_OWORD *)&a3->contentsRect.size.CGFloat height = v20;
      long long v21 = v75;
      *(_OWORD *)&a3->transform.a = v74;
      *(_OWORD *)&a3->transform.c = v21;
      long long v22 = v77;
      *(_OWORD *)&a3->transform.tCGFloat x = v76;
      *(_OWORD *)&a3->alpha = v22;
      CGSize v23 = v71;
      a3->frame.CGPoint origin = origin;
      a3->frame.CGSize size = v23;
      CGSize v24 = size;
      a3->CGPoint center = center;
      a3->CGSize size = v24;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
  unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5->length - 3 <= 2 && a5->index[1] != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v25 = a5->index[0];
  }
  CGSize v26 = [(PXAssetsTileTransitionCoordinator *)self _kindsCoveringContentTiles];
  char v27 = [v26 containsIndex:v25];

  unint64_t v28 = [(PXAssetsTileTransitionCoordinator *)self _kindsCenteredOnContentTiles];
  int v29 = [v28 containsIndex:v25];

  if ((v27 & 1) != 0 || v29)
  {
    CGSize v58 = a4;
    id v60 = v12;
    CGPoint v61 = *(CGPoint *)&a5->index[1];
    unint64_t v31 = a5->index[3];
    unint64_t v30 = a5->index[4];
    memset(v69, 0, sizeof(v69));
    BOOL v32 = [(PXAssetsTileTransitionCoordinator *)self _changeDetails];
    CGPoint origin = v61;
    *(void *)&v71.CGFloat width = v31;
    *(void *)&v71.CGFloat height = v30;
    [off_1E5DA8488 indexPathAfterRevertingChanges:v32 fromIndexPath:&origin hasIncrementalChanges:0 objectChanged:0];

    if (!*(void *)off_1E5DAAED8) {
      goto LABEL_18;
    }
    long long v62 = *(_OWORD *)((char *)v69 + 8);
    uint64_t v33 = *((void *)&v69[1] + 1);
    long long v34 = *((_OWORD *)off_1E5DAB048 + 9);
    long long v78 = *((_OWORD *)off_1E5DAB048 + 8);
    long long v79 = v34;
    long long v35 = *((_OWORD *)off_1E5DAB048 + 11);
    long long v80 = *((_OWORD *)off_1E5DAB048 + 10);
    long long v81 = v35;
    long long v36 = *((_OWORD *)off_1E5DAB048 + 5);
    long long v74 = *((_OWORD *)off_1E5DAB048 + 4);
    long long v75 = v36;
    long long v37 = *((_OWORD *)off_1E5DAB048 + 7);
    long long v76 = *((_OWORD *)off_1E5DAB048 + 6);
    long long v77 = v37;
    CGSize v38 = (CGSize)*((_OWORD *)off_1E5DAB048 + 1);
    CGPoint origin = *(CGPoint *)off_1E5DAB048;
    CGSize v71 = v38;
    CGSize v39 = (CGSize)*((_OWORD *)off_1E5DAB048 + 3);
    CGPoint center = (CGPoint)*((_OWORD *)off_1E5DAB048 + 2);
    CGSize size = v39;
    int v40 = [(PXAssetsTileTransitionCoordinator *)self _fromLayout];
    long long v64 = xmmword_1AB359AB0;
    *(void *)id v65 = 0;
    *(_OWORD *)&v65[8] = v62;
    *(void *)&v65[24] = v33;
    long long v66 = 0u;
    long long v67 = 0u;
    unint64_t v68 = 0;
    int v41 = [v40 getGeometry:&origin group:0 userData:0 forTileWithIdentifier:&v64];

    if (v41)
    {
      *(void *)&long long v77 = 0;
      *((void *)&v77 + 1) = *(void *)&a6->zPosition;
      if (v29)
      {
        CGSize size = a6->size;
        PXRectWithCenterAndSize();
      }
      long long v42 = v79;
      *(_OWORD *)&a3->hidden = v78;
      *(_OWORD *)&a3->contentSize.CGFloat height = v42;
      long long v43 = v81;
      *(_OWORD *)&a3->contentsRect.origin.CGFloat y = v80;
      *(_OWORD *)&a3->contentsRect.size.CGFloat height = v43;
      long long v44 = v75;
      *(_OWORD *)&a3->transform.a = v74;
      *(_OWORD *)&a3->transform.c = v44;
      long long v45 = v77;
      *(_OWORD *)&a3->transform.tCGFloat x = v76;
      *(_OWORD *)&a3->alpha = v45;
      CGSize v46 = v71;
      a3->frame.CGPoint origin = origin;
      a3->frame.CGSize size = v46;
      CGSize v47 = size;
      a3->CGPoint center = center;
      a3->CGSize size = v47;
      id v12 = v60;
      id *v59 = v60;
    }
    else
    {
LABEL_18:
      a4 = v59;
      id v12 = v60;
      if (!v18)
      {
LABEL_20:
        v63.receiver = self;
        v63.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
        long long v49 = *(_OWORD *)&a5->index[5];
        *(_OWORD *)&v65[16] = *(_OWORD *)&a5->index[3];
        long long v66 = v49;
        long long v67 = *(_OWORD *)&a5->index[7];
        unint64_t v68 = a5->index[9];
        long long v50 = *(_OWORD *)&a5->index[1];
        long long v64 = *(_OWORD *)&a5->length;
        *(_OWORD *)id v65 = v50;
        long long v51 = *(_OWORD *)&a6->contentSize.height;
        long long v78 = *(_OWORD *)&a6->hidden;
        long long v79 = v51;
        long long v52 = *(_OWORD *)&a6->contentsRect.size.height;
        long long v80 = *(_OWORD *)&a6->contentsRect.origin.y;
        long long v81 = v52;
        long long v53 = *(_OWORD *)&a6->transform.c;
        long long v74 = *(_OWORD *)&a6->transform.a;
        long long v75 = v53;
        long long v54 = *(_OWORD *)&a6->alpha;
        long long v76 = *(_OWORD *)&a6->transform.tx;
        long long v77 = v54;
        CGSize v55 = a6->frame.size;
        CGPoint origin = a6->frame.origin;
        CGSize v71 = v55;
        CGSize v56 = a6->size;
        CGPoint center = a6->center;
        CGSize size = v56;
        BOOL v48 = [(PXAssetsTileTransitionCoordinator *)&v63 getInitialGeometry:a3 initialUserData:a4 forAppearingTileWithIdentifier:&v64 toGeometry:&origin toUserData:v12];
        goto LABEL_21;
      }
    }
  }
  else if (!v18)
  {
    goto LABEL_20;
  }
  BOOL v48 = 1;
LABEL_21:

  return v48;
}

- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8
{
  v53.receiver = self;
  v53.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  long long v11 = *(_OWORD *)&a3->index[5];
  v51[2] = *(_OWORD *)&a3->index[3];
  v51[3] = v11;
  v51[4] = *(_OWORD *)&a3->index[7];
  unint64_t v52 = a3->index[9];
  long long v12 = *(_OWORD *)&a3->index[1];
  v51[0] = *(_OWORD *)&a3->length;
  v51[1] = v12;
  long long v13 = *(_OWORD *)&a5->contentSize.height;
  v50[8] = *(_OWORD *)&a5->hidden;
  v50[9] = v13;
  long long v14 = *(_OWORD *)&a5->contentsRect.size.height;
  v50[10] = *(_OWORD *)&a5->contentsRect.origin.y;
  v50[11] = v14;
  long long v15 = *(_OWORD *)&a5->transform.c;
  v50[4] = *(_OWORD *)&a5->transform.a;
  v50[5] = v15;
  long long v16 = *(_OWORD *)&a5->alpha;
  v50[6] = *(_OWORD *)&a5->transform.tx;
  v50[7] = v16;
  CGSize size = a5->frame.size;
  v50[0] = a5->frame.origin;
  v50[1] = size;
  CGSize v18 = a5->size;
  v50[2] = a5->center;
  v50[3] = v18;
  long long v19 = *(_OWORD *)&a7->contentSize.height;
  long long v46 = *(_OWORD *)&a7->hidden;
  long long v47 = v19;
  long long v20 = *(_OWORD *)&a7->contentsRect.size.height;
  long long v48 = *(_OWORD *)&a7->contentsRect.origin.y;
  long long v49 = v20;
  long long v21 = *(_OWORD *)&a7->transform.c;
  long long v42 = *(_OWORD *)&a7->transform.a;
  long long v43 = v21;
  long long v22 = *(_OWORD *)&a7->alpha;
  long long v44 = *(_OWORD *)&a7->transform.tx;
  long long v45 = v22;
  CGSize v23 = a7->frame.size;
  CGPoint origin = a7->frame.origin;
  CGSize v39 = v23;
  CGSize v24 = a7->size;
  CGPoint center = a7->center;
  CGSize v41 = v24;
  unint64_t v25 = [(PXAssetsTileTransitionCoordinator *)&v53 optionsForAnimatingTileWithIdentifier:v51 animationType:a4 fromGeometry:v50 fromUserData:a6 toGeometry:&origin toUserData:a8];
  if (a3->length - 3 <= 2)
  {
    unint64_t v26 = a3->index[1];
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v28 = a3->index[2];
      unint64_t v27 = a3->index[3];
      unint64_t v29 = a3->index[4];
      LOBYTE(v51[0]) = 0;
      if (a4 == 1)
      {
        uint64_t v33 = [(PXAssetsTileTransitionCoordinator *)self _changeDetails];
        *(void *)&origin.CGFloat x = v26;
        *(void *)&origin.CGFloat y = v28;
        *(void *)&v39.CGFloat width = v27;
        *(void *)&v39.CGFloat height = v29;
        [off_1E5DA8488 indexPathAfterRevertingChanges:v33 fromIndexPath:&origin hasIncrementalChanges:v51 objectChanged:0];

        if (LOBYTE(v51[0]))
        {
          long long v34 = &OBJC_IVAR___PXAssetsDataSourceChangeTransitionCoordinator__insertAnimationOptions;
LABEL_9:
          id v35 = *(id *)((char *)&self->super.super.isa + *v34);
LABEL_16:

          unint64_t v25 = v35;
          goto LABEL_17;
        }
      }
      else
      {
        if (a4 != 3) {
          goto LABEL_17;
        }
        unint64_t v30 = [(PXAssetsTileTransitionCoordinator *)self _toLayout];
        unint64_t v31 = [v30 dataSource];
        uint64_t v32 = [v31 identifier];

        if (v26 == v32)
        {
          LOBYTE(v51[0]) = 1;
        }
        else
        {
          long long v36 = [(PXAssetsTileTransitionCoordinator *)self _changeDetails];
          *(void *)&origin.CGFloat x = v26;
          *(void *)&origin.CGFloat y = v28;
          *(void *)&v39.CGFloat width = v27;
          *(void *)&v39.CGFloat height = v29;
          [off_1E5DA8488 indexPathAfterApplyingChanges:v36 toIndexPath:&origin hasIncrementalChanges:v51 objectChanged:0];

          if (!LOBYTE(v51[0])) {
            goto LABEL_15;
          }
        }
        if (![(PXAssetsTileTransitionCoordinator *)self treatRemovalsAsDeletes]) {
          goto LABEL_17;
        }
        if (a3->length == 5 && a3->index[0] == 6432423)
        {
          long long v34 = &OBJC_IVAR___PXAssetsDataSourceChangeTransitionCoordinator__deleteAnimationOptions;
          goto LABEL_9;
        }
      }
LABEL_15:
      id v35 = 0;
      goto LABEL_16;
    }
  }
LABEL_17:
  return v25;
}

- (void)setDelayInsertions:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PXAssetsTileTransitionCoordinator *)self delayInsertions];
  v6.receiver = self;
  v6.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  [(PXAssetsTileTransitionCoordinator *)&v6 setDelayInsertions:v3];
  if (v5 != v3) {
    [(PXAssetsDataSourceChangeTransitionCoordinator *)self _updateAnimationDelay];
  }
}

- (void)setTreatRemovalsAsDeletes:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PXAssetsTileTransitionCoordinator *)self treatRemovalsAsDeletes];
  v6.receiver = self;
  v6.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  [(PXAssetsTileTransitionCoordinator *)&v6 setTreatRemovalsAsDeletes:v3];
  if (v5 != v3) {
    [(PXAssetsDataSourceChangeTransitionCoordinator *)self _updateAnimationDelay];
  }
}

- (void)_updateAnimationDelay
{
  BOOL v3 = [(PXAssetsTileTransitionCoordinator *)self treatRemovalsAsDeletes];
  v4 = [(PXAssetsTileTransitionCoordinator *)self _basicAnimationOptions];
  BOOL v5 = v4;
  if (v3)
  {
    objc_super v6 = [(PXAssetsTileTransitionCoordinator *)self _basicAnimationOptions];
    [v6 duration];
    [v5 setDelay:v7 * 0.5];
  }
  else
  {
    [v4 setDelay:0.0];
  }

  v8 = [(PXAssetsTileTransitionCoordinator *)self _basicAnimationOptions];
  v9 = (PXBasicTileAnimationOptions *)[v8 copy];
  insertAnimationOptions = self->_insertAnimationOptions;
  self->_insertAnimationOptions = v9;

  if ([(PXAssetsTileTransitionCoordinator *)self delayInsertions])
  {
    long long v11 = self->_insertAnimationOptions;
    id v13 = [(PXAssetsTileTransitionCoordinator *)self _basicAnimationOptions];
    [v13 duration];
    [(PXBasicTileAnimationOptions *)v11 setDelay:v12 * 0.5];
  }
}

- (PXAssetsDataSourceChangeTransitionCoordinator)initWithTilingChange:(id)a3 changeHistory:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PXAssetsDataSourceChangeTransitionCoordinator;
  v4 = [(PXAssetsTileTransitionCoordinator *)&v13 initWithTilingChange:a3 changeHistory:a4];
  if (v4)
  {
    BOOL v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    overrideInitialGeometryByTileIdentifier = v4->_overrideInitialGeometryByTileIdentifier;
    v4->_overrideInitialGeometryByTileIdentifier = v5;

    double v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    overrideFinalGeometryByTileIdentifier = v4->_overrideFinalGeometryByTileIdentifier;
    v4->_overrideFinalGeometryByTileIdentifier = v7;

    v9 = [(PXAssetsTileTransitionCoordinator *)v4 _basicAnimationOptions];
    uint64_t v10 = [v9 copy];
    deleteAnimationOptions = v4->_deleteAnimationOptions;
    v4->_deleteAnimationOptions = (PXBasicTileAnimationOptions *)v10;

    [(PXBasicTileAnimationOptions *)v4->_deleteAnimationOptions setStyle:1];
    [(PXAssetsDataSourceChangeTransitionCoordinator *)v4 _updateAnimationDelay];
  }
  return v4;
}

@end