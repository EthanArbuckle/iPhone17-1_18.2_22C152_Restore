@interface CRLImmutableBrushStrokeStorage
+ (unint64_t)p_totalSectionCountWithPaths:(id)a3;
- (CRLImage)image;
- (CRLImmutableBrushStrokeStorage)initWithImage:(id)a3 paths:(id)a4 bounds:(id)a5 textureIndices:(id)a6 options:(id)a7 lineEnds:(id)a8;
- (NSDictionary)bounds;
- (NSDictionary)lineEnds;
- (NSDictionary)options;
- (NSDictionary)paths;
- (NSDictionary)textureIndices;
- (id)deepCopy;
- (unint64_t)totalSectionCount;
@end

@implementation CRLImmutableBrushStrokeStorage

- (CRLImmutableBrushStrokeStorage)initWithImage:(id)a3 paths:(id)a4 bounds:(id)a5 textureIndices:(id)a6 options:(id)a7 lineEnds:(id)a8
{
  id v23 = a3;
  id v15 = a4;
  id v22 = a5;
  id v21 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CRLImmutableBrushStrokeStorage;
  v18 = [(CRLImmutableBrushStrokeStorage *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_image, a3);
    objc_storeStrong((id *)&v19->_paths, a4);
    objc_storeStrong((id *)&v19->_bounds, a5);
    objc_storeStrong((id *)&v19->_textureIndices, a6);
    objc_storeStrong((id *)&v19->_options, a7);
    objc_storeStrong((id *)&v19->_lineEnds, a8);
    v19->_totalSectionCount = +[CRLImmutableBrushStrokeStorage p_totalSectionCountWithPaths:v15];
  }

  return v19;
}

+ (unint64_t)p_totalSectionCountWithPaths:(id)a3
{
  id v3 = a3;
  v4 = [v3 allKeys];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        v7 += (unint64_t)[v10 count];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)deepCopy
{
  id v3 = [(CRLImmutableBrushStrokeStorage *)self image];
  id v84 = [v3 copy];

  v90 = +[NSMutableDictionary dictionary];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  v99 = self;
  v4 = [(CRLImmutableBrushStrokeStorage *)self paths];
  id v5 = [v4 allKeys];

  id obj = v5;
  v91 = (char *)[v5 countByEnumeratingWithState:&v128 objects:v139 count:16];
  if (v91)
  {
    uint64_t v88 = *(void *)v129;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v129 != v88) {
          objc_enumerationMutation(obj);
        }
        v95 = v6;
        uint64_t v7 = *(void *)(*((void *)&v128 + 1) + 8 * (void)v6);
        uint64_t v8 = +[NSMutableArray array];
        long long v124 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        v9 = [(CRLImmutableBrushStrokeStorage *)v99 paths];
        uint64_t v93 = v7;
        v10 = [v9 objectForKeyedSubscript:v7];

        id v11 = [v10 countByEnumeratingWithState:&v124 objects:v138 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v125;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v125 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v124 + 1) + 8 * i);
              id v16 = [CRLBrushStrokeStorageBezierPathContainer alloc];
              id v17 = [v15 originalPath];
              id v18 = [v17 copy];
              v19 = [v15 pathWithPossibleSmoothing];
              id v20 = [v19 copy];
              id v21 = [(CRLBrushStrokeStorageBezierPathContainer *)v16 initWithOriginalPath:v18 pathWithPossibleSmoothing:v20];
              [v8 addObject:v21];
            }
            id v12 = [v10 countByEnumeratingWithState:&v124 objects:v138 count:16];
          }
          while (v12);
        }

        [v90 setObject:v8 forKeyedSubscript:v93];
        id v6 = v95 + 1;
      }
      while (v95 + 1 != v91);
      v91 = (char *)[obj countByEnumeratingWithState:&v128 objects:v139 count:16];
    }
    while (v91);
  }

  v94 = +[NSMutableDictionary dictionary];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v22 = [(CRLImmutableBrushStrokeStorage *)v99 bounds];
  id v23 = [v22 allKeys];

  id v96 = v23;
  id v24 = [v23 countByEnumeratingWithState:&v120 objects:v137 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v121;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v121 != v26) {
          objc_enumerationMutation(v96);
        }
        uint64_t v28 = *(void *)(*((void *)&v120 + 1) + 8 * (void)j);
        v29 = +[NSMutableArray array];
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        v30 = [(CRLImmutableBrushStrokeStorage *)v99 bounds];
        v31 = [v30 objectForKeyedSubscript:v28];

        id v32 = [v31 countByEnumeratingWithState:&v116 objects:v136 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v117;
          do
          {
            for (k = 0; k != v33; k = (char *)k + 1)
            {
              if (*(void *)v117 != v34) {
                objc_enumerationMutation(v31);
              }
              id v36 = [*(id *)(*((void *)&v116 + 1) + 8 * (void)k) copy];
              [v29 addObject:v36];
            }
            id v33 = [v31 countByEnumeratingWithState:&v116 objects:v136 count:16];
          }
          while (v33);
        }

        [v94 setObject:v29 forKeyedSubscript:v28];
      }
      id v25 = [v96 countByEnumeratingWithState:&v120 objects:v137 count:16];
    }
    while (v25);
  }

  v92 = +[NSMutableDictionary dictionary];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v37 = [(CRLImmutableBrushStrokeStorage *)v99 textureIndices];
  v38 = [v37 allKeys];

  id v97 = v38;
  id v39 = [v38 countByEnumeratingWithState:&v112 objects:v135 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v113;
    do
    {
      for (m = 0; m != v40; m = (char *)m + 1)
      {
        if (*(void *)v113 != v41) {
          objc_enumerationMutation(v97);
        }
        uint64_t v43 = *(void *)(*((void *)&v112 + 1) + 8 * (void)m);
        v44 = +[NSMutableArray array];
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        v45 = [(CRLImmutableBrushStrokeStorage *)v99 textureIndices];
        v46 = [v45 objectForKeyedSubscript:v43];

        id v47 = [v46 countByEnumeratingWithState:&v108 objects:v134 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v109;
          do
          {
            for (n = 0; n != v48; n = (char *)n + 1)
            {
              if (*(void *)v109 != v49) {
                objc_enumerationMutation(v46);
              }
              id v51 = [*(id *)(*((void *)&v108 + 1) + 8 * (void)n) copy];
              [v44 addObject:v51];
            }
            id v48 = [v46 countByEnumeratingWithState:&v108 objects:v134 count:16];
          }
          while (v48);
        }

        [v92 setObject:v44 forKeyedSubscript:v43];
      }
      id v40 = [v97 countByEnumeratingWithState:&v112 objects:v135 count:16];
    }
    while (v40);
  }

  v52 = +[NSMutableDictionary dictionary];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v53 = [(CRLImmutableBrushStrokeStorage *)v99 options];
  v54 = [v53 allKeys];

  id v55 = [v54 countByEnumeratingWithState:&v104 objects:v133 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v105;
    do
    {
      for (ii = 0; ii != v56; ii = (char *)ii + 1)
      {
        if (*(void *)v105 != v57) {
          objc_enumerationMutation(v54);
        }
        uint64_t v59 = *(void *)(*((void *)&v104 + 1) + 8 * (void)ii);
        v60 = [(CRLImmutableBrushStrokeStorage *)v99 options];
        v61 = [v60 objectForKeyedSubscript:v59];

        id v62 = [v61 copy];
        [v52 setObject:v62 forKeyedSubscript:v59];
      }
      id v56 = [v54 countByEnumeratingWithState:&v104 objects:v133 count:16];
    }
    while (v56);
  }
  v83 = v52;

  v89 = +[NSMutableDictionary dictionary];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v63 = [(CRLImmutableBrushStrokeStorage *)v99 lineEnds];
  v64 = [v63 allKeys];

  id v85 = v64;
  id v98 = [v64 countByEnumeratingWithState:&v100 objects:v132 count:16];
  if (v98)
  {
    id obja = *(id *)v101;
    do
    {
      for (jj = 0; jj != v98; jj = (char *)jj + 1)
      {
        if (*(id *)v101 != obja) {
          objc_enumerationMutation(v85);
        }
        uint64_t v66 = *(void *)(*((void *)&v100 + 1) + 8 * (void)jj);
        v67 = [(CRLImmutableBrushStrokeStorage *)v99 lineEnds];
        v68 = [v67 objectForKeyedSubscript:v66];

        v69 = [CRLLineEnd alloc];
        v70 = [v68 path];
        id v71 = [v70 copy];
        v72 = [v68 wrapPath];
        id v73 = [v72 copy];
        [v68 endPoint];
        double v75 = v74;
        double v77 = v76;
        id v78 = [v68 isFilled];
        v79 = [v68 identifier];
        v80 = -[CRLLineEnd initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:](v69, "initWithBezierPath:wrapPath:endPoint:isFilled:identifier:lineJoin:", v71, v73, v78, v79, [v68 lineJoin], v75, v77);
        [v89 setObject:v80 forKeyedSubscript:v66];
      }
      id v98 = [v85 countByEnumeratingWithState:&v100 objects:v132 count:16];
    }
    while (v98);
  }

  v81 = [[CRLImmutableBrushStrokeStorage alloc] initWithImage:v84 paths:v90 bounds:v94 textureIndices:v92 options:v83 lineEnds:v89];

  return v81;
}

- (CRLImage)image
{
  return self->_image;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (NSDictionary)bounds
{
  return self->_bounds;
}

- (NSDictionary)textureIndices
{
  return self->_textureIndices;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSDictionary)lineEnds
{
  return self->_lineEnds;
}

- (unint64_t)totalSectionCount
{
  return self->_totalSectionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineEnds, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_textureIndices, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_paths, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end