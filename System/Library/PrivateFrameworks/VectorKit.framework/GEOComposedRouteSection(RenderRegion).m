@interface GEOComposedRouteSection(RenderRegion)
- (id)pathsForRenderRegion:()RenderRegion inOverlay:elevationSource:elevationSourceContext:;
- (id)pathsForRenderRegion:()RenderRegion inOverlay:excludedSegments:elevationSource:elevationSourceContext:;
- (id)pathsForRenderRegion:()RenderRegion inOverlay:shouldSnapToTransit:verifySnapping:elevationSource:elevationSourceContext:;
@end

@implementation GEOComposedRouteSection(RenderRegion)

- (id)pathsForRenderRegion:()RenderRegion inOverlay:excludedSegments:elevationSource:elevationSourceContext:
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v93 = a4;
  v88 = v10;
  [v10 visibleRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [a1 vkBounds];
  double v23 = v22;
  if (v16 <= v22
    || ((double v24 = v19, v25 = v20, v26 = v21, v12 < v20) ? (v27 = v18 <= v19) : (v27 = 1),
        !v27 ? (BOOL v28 = v14 < v21) : (BOOL v28 = 0),
        !v28))
  {
    id v29 = 0;
    goto LABEL_90;
  }
  v89 = [MEMORY[0x1E4F1CA48] array];
  *(_OWORD *)v98 = 0u;
  *(_OWORD *)__p = 0u;
  int v100 = 1065353216;
  v30 = [v93 composedRoute];
  int v31 = [v30 transportType];

  v92 = a5;
  if (v31 == 2)
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v32 = [v93 composedRoute];
    v33 = [v32 visualInfos];

    uint64_t v34 = [v33 countByEnumeratingWithState:&v94 objects:v101 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v95 != v35) {
            objc_enumerationMutation(v33);
          }
          v37 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          if ([v37 type] == 191)
          {
            if ([v37 routeCoordinateRange])
            {
              int v38 = [v37 routeCoordinateRange];
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int>((float *)v98, v38, v38);
            }
            [v37 routeCoordinateRange];
            if (v39)
            {
              [v37 routeCoordinateRange];
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int>((float *)v98, v40, v40);
            }
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v94 objects:v101 count:16];
      }
      while (v34);
    }
  }
  uint64_t v41 = [a1 endPointIndex];
  unsigned int v42 = v41;
  uint64_t v43 = 0;
  signed int v44 = 0;
  float v45 = (v12 - v23) / (v25 - v23);
  float v46 = (v14 - v24) / (v26 - v24);
  float v47 = (v16 - v23) / (v25 - v23);
  float v48 = (v18 - v24) / (v26 - v24);
  uint64_t v49 = v41;
  while (v44 < [a1 pointCount] - 1)
  {
    uint64_t v51 = *(void *)&a1[*MEMORY[0x1E4F64C70]] + 12 * v44;
    float v52 = *(float *)(v51 + 12);
    if (fmaxf(fmaxf(*(float *)v51, -3.4028e38), v52) <= v45)
    {
      BOOL v58 = 0;
    }
    else
    {
      float v53 = *(float *)(v51 + 4);
      float v54 = *(float *)(v51 + 16);
      float v55 = fmaxf(fmaxf(v53, -3.4028e38), v54);
      float v56 = fminf(v54, fminf(v53, 3.4028e38));
      BOOL v57 = fminf(v52, fminf(*(float *)v51, 3.4028e38)) < v47;
      if (v55 <= v46) {
        BOOL v57 = 0;
      }
      BOOL v58 = v56 < v48 && v57;
    }
    uint64_t v59 = (int)*MEMORY[0x1E4F64C78];
    int v60 = *(_DWORD *)&a1[v59];
    if (v49 == v42)
    {
      BOOL v61 = 0;
      uint64_t v62 = (v60 + v44);
    }
    else
    {
      if (v98[1])
      {
        uint8x8_t v63 = (uint8x8_t)vcnt_s8((int8x8_t)v98[1]);
        v63.i16[0] = vaddlv_u8(v63);
        if (v63.u32[0] > 1uLL)
        {
          unint64_t v64 = v44;
          if (v98[1] <= (void *)v44) {
            unint64_t v64 = v44 % (unint64_t)v98[1];
          }
        }
        else
        {
          unint64_t v64 = ((unint64_t)v98[1] - 1) & v44;
        }
        v65 = (uint64_t *)*((void *)v98[0] + v64);
        if (v65)
        {
          v65 = (uint64_t *)*v65;
          if (v65)
          {
            if (v63.u32[0] < 2uLL)
            {
              while (1)
              {
                uint64_t v67 = v65[1];
                if (v67 == v44)
                {
                  if (*((_DWORD *)v65 + 4) == v44) {
                    goto LABEL_58;
                  }
                }
                else if ((v67 & ((uint64_t)v98[1] - 1)) != v64)
                {
                  goto LABEL_57;
                }
                v65 = (uint64_t *)*v65;
                if (!v65) {
                  goto LABEL_58;
                }
              }
            }
            do
            {
              unint64_t v66 = v65[1];
              if (v66 == v44)
              {
                if (*((_DWORD *)v65 + 4) == v44) {
                  break;
                }
              }
              else
              {
                if ((void *)v66 >= v98[1]) {
                  v66 %= (unint64_t)v98[1];
                }
                if (v66 != v64) {
                  goto LABEL_57;
                }
              }
              v65 = (uint64_t *)*v65;
            }
            while (v65);
          }
        }
      }
      else
      {
LABEL_57:
        v65 = 0;
      }
LABEL_58:
      BOOL v61 = v65 != 0;
      uint64_t v62 = (v60 + v44);
      if (v65)
      {
LABEL_74:
        if (v49 < v42)
        {
          int v78 = [a1 transportType];
          v79 = off_1E5A8B120;
          if (v78) {
            v79 = off_1E5A8B1F8;
          }
          v80 = (void *)[objc_alloc(*v79) initWithOverlay:v93 section:a1 routeStartIndex:v49 routeEndIndex:v62 matchedPathSegments:0 elevationSource:a6 elevationSourceContext:a7];
          [v89 addObject:v80];
          if (v61) {
            uint64_t v49 = v62;
          }
          else {
            uint64_t v49 = v42;
          }
        }
LABEL_25:
        uint64_t v50 = v43;
        goto LABEL_26;
      }
    }
    if (!v58) {
      goto LABEL_74;
    }
    if (v49 >= v42) {
      uint64_t v49 = v62;
    }
    else {
      uint64_t v49 = v49;
    }
    if (!v92) {
      goto LABEL_25;
    }
    uint64_t v68 = *v92;
    unint64_t v69 = (v92[1] - *v92) >> 3;
    unint64_t v70 = v43;
    if (v69 <= v43) {
      goto LABEL_25;
    }
    uint64_t v50 = (v43 + 1);
    while (1)
    {
      if (v62 >= *(_DWORD *)(v68 + 8 * v70))
      {
        uint64_t v71 = v68 + 8 * v70;
        unsigned int v74 = *(_DWORD *)(v71 + 4);
        v73 = (unsigned int *)(v71 + 4);
        unsigned int v72 = v74;
        uint64_t v43 = v50;
        if (v62 <= v74) {
          break;
        }
      }
      unint64_t v70 = v50;
      uint64_t v50 = (v50 + 1);
      if (v69 <= v70) {
        goto LABEL_25;
      }
    }
    if (v49 < v62)
    {
      int v75 = [a1 transportType];
      v76 = off_1E5A8B120;
      if (v75) {
        v76 = off_1E5A8B1F8;
      }
      v77 = (void *)[objc_alloc(*v76) initWithOverlay:v93 section:a1 routeStartIndex:v49 routeEndIndex:v62 matchedPathSegments:0 elevationSource:a6 elevationSourceContext:a7];
      [v89 addObject:v77];

      unsigned int v72 = *v73;
      int v60 = *(_DWORD *)&a1[v59];
    }
    v44 += v72 - v62;
    uint64_t v49 = (v44 + v60);
LABEL_26:
    ++v44;
    uint64_t v43 = v50;
  }
  if (v49 < v42)
  {
    int v81 = [a1 transportType];
    v82 = off_1E5A8B120;
    if (v81) {
      v82 = off_1E5A8B1F8;
    }
    v83 = objc_msgSend(objc_alloc(*v82), "initWithOverlay:section:routeStartIndex:routeEndIndex:matchedPathSegments:elevationSource:elevationSourceContext:", v93, a1, v49, objc_msgSend(a1, "endPointIndex"), 0, a6, a7);
    [v89 addObject:v83];
  }
  id v29 = v89;
  v84 = __p[0];
  if (__p[0])
  {
    do
    {
      v85 = (void *)*v84;
      operator delete(v84);
      v84 = v85;
    }
    while (v85);
  }
  v86 = v98[0];
  v98[0] = 0;
  if (v86) {
    operator delete(v86);
  }

LABEL_90:
  return v29;
}

- (id)pathsForRenderRegion:()RenderRegion inOverlay:elevationSource:elevationSourceContext:
{
  v6 = &a1[*MEMORY[0x1E4F64C58]];
  v7 = &a1[*MEMORY[0x1E4F64C60]];
  long long v8 = *(_OWORD *)(v6 + 24);
  *(_OWORD *)v7 = *(_OWORD *)v6;
  *((_OWORD *)v7 + 1) = v8;
  v9 = [a1 pathsForRenderRegion:a3 inOverlay:a4 excludedSegments:0 elevationSource:a5 elevationSourceContext:a6];
  return v9;
}

- (id)pathsForRenderRegion:()RenderRegion inOverlay:shouldSnapToTransit:verifySnapping:elevationSource:elevationSourceContext:
{
  long long v8 = [a1 pathsForRenderRegion:a3 inOverlay:a4 elevationSource:a7 elevationSourceContext:a8];
  return v8;
}

@end