@interface TUIHostedLayout
- (BOOL)collectHostingPropertiesWithCollector:(id)a3;
- (CGSize)hostingRequestedSize;
- (CGSize)requestedSize;
- (TUIHostedLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (TUIHostingGeometry)hostingGeometry;
- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)computeLayout;
- (void)onInvalidate;
@end

@implementation TUIHostedLayout

- (TUIHostedLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TUIHostedLayout;
  v9 = [(TUILayout *)&v14 initWithModel:a3 parent:a4 controller:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(TUILayout *)v9 box];
    v12 = [v11 hostingIdentifier];
    [v8 registerHostingLayout:v10 forIdentifier:v12];
  }
  return v10;
}

- (CGSize)hostingRequestedSize
{
  double width = self->_requestedSize.width;
  double height = self->_requestedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  [(TUILayout *)self computeHeight];
  double v6 = v5;
  self->_requestedSize.double width = v4;
  self->_requestedSize.double height = v5;
  v7 = [(TUILayout *)self controller];
  id v8 = [(TUILayout *)self box];
  v9 = [v8 hostingIdentifier];
  v10 = [v7 hostingGeometryForIdentifier:v9 requestedSize:self->_requestedSize.width, self->_requestedSize.height];

  hostingGeometry = self->_hostingGeometry;
  self->_hostingGeometry = 0;

  if (v10)
  {
    [v10 requestedSize];
    if (self->_requestedSize.width == v13 && self->_requestedSize.height == v12)
    {
      [v10 layoutSize];
      double v4 = v15;
      double v6 = v16;
      objc_storeStrong((id *)&self->_hostingGeometry, v10);
    }
  }
  v17 = TUIHostingLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = [(TUILayout *)self controller];
    id v19 = [v18 feedId];
    v20 = [(TUILayout *)self box];
    v21 = [v20 hostingIdentifier];
    v34.double width = v4;
    v34.double height = v6;
    v22 = NSStringFromCGSize(v34);
    v23 = self->_hostingGeometry;
    int v24 = 134219010;
    id v25 = v19;
    __int16 v26 = 2112;
    v27 = v21;
    __int16 v28 = 2112;
    v29 = v10;
    __int16 v30 = 2112;
    v31 = v22;
    __int16 v32 = 2112;
    v33 = v23;
    _os_log_debug_impl(&def_141F14, v17, OS_LOG_TYPE_DEBUG, "[fid:%lu] computeLayout identifier=%@ geomtry=%@ layoutSize=%@ hostingGeomeetry=%@", (uint8_t *)&v24, 0x34u);
  }
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v6);
}

- (void)onInvalidate
{
  v4.receiver = self;
  v4.super_class = (Class)TUIHostedLayout;
  [(TUILayout *)&v4 onInvalidate];
  hostingGeometry = self->_hostingGeometry;
  self->_hostingGeometry = 0;
}

- (BOOL)collectHostingPropertiesWithCollector:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(TUILayout *)self box];
  double v6 = [v5 hostingIdentifier];

  if (v6)
  {
    v7 = [v5 hostingProperties];
    id v8 = [v5 hostingIdentifier];
    [v4 hostingCollectorAddProperties:v7 forIdentifier:v8];
  }
  return 0;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  v7 = [(TUILayout *)self box];
  id v8 = [v7 hostingIdentifier];

  v9 = 0;
  if (a3 >= 4 && v8)
  {
    v10 = [v7 anchorRefId];
    id v11 = [v10 length];

    if (v11)
    {
      double v12 = [v7 anchorRefId];
      double v13 = sub_5351C(self, 0, 1, v12);

      if (v13)
      {
        objc_super v14 = self;
        v67 = v13;
        id v15 = v13;
        long long v134 = 0u;
        long long v133 = 0u;
        long long v132 = 0u;
        long long v131 = 0u;
        long long v130 = 0u;
        long long v129 = 0u;
        long long v128 = 0u;
        long long v127 = 0u;
        long long v126 = 0u;
        long long v125 = 0u;
        long long v124 = 0u;
        long long v123 = 0u;
        long long v122 = 0u;
        long long v121 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        memset(buf, 0, sizeof(buf));
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v77 = 0u;
        memset(&v76, 0, sizeof(v76));
        v66 = v14;
        unint64_t v16 = 0;
        if (v14)
        {
          do
          {
            v17 = v14;
            unint64_t v18 = v16++;
            *(void *)&buf[8 * v18] = v14;
            objc_super v14 = [(TUILayout *)v14 layoutAncestor];

            BOOL v19 = v14 != 0;
          }
          while (v18 <= 0x3E && v14);
        }
        else
        {
          BOOL v19 = 0;
        }
        unint64_t v21 = 0;
        p_ty = &v75.ty;
        v65 = v15;
        do
        {
          v23 = v15;
          *((void *)p_ty++ + 1) = v15;
          id v15 = [v15 layoutAncestor];

          if (v21 > 0x3E) {
            break;
          }
          ++v21;
        }
        while (v15);
        id v24 = 0;
        if (v15) {
          char v25 = 1;
        }
        else {
          char v25 = v19;
        }
        if (v25)
        {
          double v13 = v67;
        }
        else
        {
          double v13 = v67;
          if (v16)
          {
            unint64_t v26 = v16;
            do
            {
              unint64_t v27 = v26 - 1;
              uint64_t v28 = *(void *)&buf[8 * v26 - 8];
              uint64_t v29 = *(void *)p_ty--;
              --v26;
            }
            while (v28 == v29);
            if (v27 >= v16) {
              __int16 v30 = 0;
            }
            else {
              __int16 v30 = *(void **)&buf[8 * v27 + 8];
            }
            id v24 = v30;
          }
        }

        if (v24)
        {
          memset(buf, 0, 48);
          [v65 computedTransformInAncestorLayout:v24];
          memset(&v76, 0, sizeof(v76));
          [(TUILayout *)v66 computedTransformInAncestorLayout:v24];
          CGAffineTransformInvert(&v76, &v75);
          CGAffineTransform t1 = *(CGAffineTransform *)buf;
          memset(&v74, 0, sizeof(v74));
          CGAffineTransform t2 = v76;
          CGAffineTransformConcat(&v74, &t1, &t2);
          [v65 computedNaturalSize];
          double v69 = v31 * 0.5;
          [v65 computedNaturalSize];
          float64x2_t v70 = vaddq_f64(*(float64x2_t *)&v74.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v74.c, v32 * 0.5), *(float64x2_t *)&v74.a, v69));
          [(TUILayout *)v66 computedNaturalSize];
          v34.f64[1] = v33;
          __asm { FMOV            V1.2D, #1.0 }
          float64x2_t v40 = vmaxnmq_f64(vminnmq_f64(vdivq_f64(v70, (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q1, v34), (int8x16_t)_Q1, (int8x16_t)v34)), _Q1), (float64x2_t)0);
        }
        else
        {
          float64x2_t v40 = (float64x2_t)vdupq_n_s64(0x7FF8000000000000uLL);
        }
        int64x2_t v68 = (int64x2_t)v40;
      }
      else
      {
        int64x2_t v68 = vdupq_n_s64(0x7FF8000000000000uLL);
      }

      uint64_t v20 = v68.i64[1];
    }
    else
    {
      uint64_t v20 = 0x7FF8000000000000;
      v68.i64[0] = 0x7FF8000000000000;
    }
    v41 = [v7 identifier];
    [(TUILayout *)self renderModelSizeWithContext:v6];
    double v43 = v42;
    double v45 = v44;
    p_requestedSize = &self->_requestedSize;
    BOOL v47 = self->_hostingGeometry != 0;
    [v7 insets];
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    v56 = [v7 hostingIdentifier];
    v57 = [v7 hostingProperties];
    v9 = +[TUIHostingView renderModelIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:](TUIHostingView, "renderModelIdentifier:size:requestedSize:usingGeometry:insets:hostingIdentifier:hostingProperties:anchorPoint:", v41, v47, v56, v57, v43, v45, self->_requestedSize.width, self->_requestedSize.height, v49, v51, v53, v55, v68.i64[0], v20);

    v58 = TUIHostingLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      v71 = [(TUILayout *)self controller];
      id v60 = [v71 feedId];
      v61 = [(TUILayout *)self box];
      v62 = [v61 hostingIdentifier];
      [v9 size];
      v63 = NSStringFromCGSize(v135);
      v64 = NSStringFromCGSize(*p_requestedSize);
      *(_DWORD *)buf = 134219010;
      *(void *)&buf[4] = v60;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v62;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v63;
      *(_WORD *)&buf[32] = 2112;
      *(void *)&buf[34] = v64;
      *(_WORD *)&buf[42] = 2112;
      *(void *)&buf[44] = v9;
      _os_log_debug_impl(&def_141F14, v58, OS_LOG_TYPE_DEBUG, "[fid:%lu] newRenderModel identifier=%@ size=%@ requestedSize=%@ renderModel=%@", buf, 0x34u);
    }
  }

  return v9;
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)TUIHostedLayout;
  id v6 = -[TUILayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](&v8, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", a3, a4, a6, a5.x, a5.y);
  [v6 setShouldVendControlView:1];

  return v6;
}

- (TUIHostingGeometry)hostingGeometry
{
  return self->_hostingGeometry;
}

- (CGSize)requestedSize
{
  double width = self->_requestedSize.width;
  double height = self->_requestedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end