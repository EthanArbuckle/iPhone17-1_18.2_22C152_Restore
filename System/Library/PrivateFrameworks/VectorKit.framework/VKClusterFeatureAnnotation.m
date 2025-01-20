@interface VKClusterFeatureAnnotation
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (VKClusterFeatureAnnotation)initWithClusterNode:(void *)a3 clusterTree:(const void *)a4 baseStyle:(const void *)a5 imageText:(id)a6 annotationText:(id)a7 annotationLocale:(id)a8;
- (id)feature;
- (void)setCoordinate:(id)a3;
@end

@implementation VKClusterFeatureAnnotation

- (void).cxx_destruct
{
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (id)feature
{
  return self->_customFeature;
}

- (VKClusterFeatureAnnotation)initWithClusterNode:(void *)a3 clusterTree:(const void *)a4 baseStyle:(const void *)a5 imageText:(id)a6 annotationText:(id)a7 annotationLocale:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v206 = a8;
  v217.receiver = self;
  v217.super_class = (Class)VKClusterFeatureAnnotation;
  v16 = [(VKClusterFeatureAnnotation *)&v217 init];

  if (!v16) {
    goto LABEL_309;
  }
  md::LabelPoint::coordinate((md::LabelPoint *)v216, (uint64_t)a3 + 16);
  double v17 = *(double *)v216;
  double v18 = *(double *)&v216[1];
  *(void *)&v16->_coordinate.double latitude = v216[0];
  v16->_coordinate.double longitude = v18;
  v204 = v16;
  id v205 = v14;
  id v202 = v15;
  v19 = -[VKCustomFeature _initInternalFeatureWithCoordinate:]([VKCustomFeature alloc], "_initInternalFeatureWithCoordinate:", v17, v18, *(double *)&v216[2]);
  customFeature = v16->_customFeature;
  v16->_customFeature = v19;

  uint64_t v21 = [(VKCustomFeature *)v16->_customFeature pointFeature];
  v22 = (int64x2_t *)v21;
  uint64_t v23 = *(void *)a4;
  v24 = (std::__shared_weak_count *)*((void *)a4 + 1);
  if (v24)
  {
    atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v24->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(void *)(v21 + 288) = a3;
    atomic_fetch_add_explicit(&v24->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    *(void *)(v21 + 288) = a3;
  }
  v25 = *(std::__shared_weak_count **)(v21 + 304);
  v22[18].i64[1] = v23;
  v22[19].i64[0] = (uint64_t)v24;
  if (v25) {
    std::__shared_weak_count::__release_weak(v25);
  }
  if (v24)
  {
    std::__shared_weak_count::__release_weak(v24);
    if (!atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  if (*((unsigned char *)a3 + 68))
  {
    v22[13].i32[2] = *((_DWORD *)a3 + 16);
    v22[13].i8[12] = 1;
  }
  v26 = (unsigned int *)*((void *)a3 + 20);
  v27 = (atomic_ullong *)*((void *)a5 + 1);
  uint64_t v207 = *(void *)a5;
  v208[0] = v27;
  if (v27) {
    atomic_fetch_add_explicit(v27 + 1, 1uLL, memory_order_relaxed);
  }
  geo::codec::copyFeatureStyleAttributes(&v207, &v214);
  v203 = v22;
  v28 = (std::__shared_weak_count *)v208[0];
  if (v208[0] && !atomic_fetch_add((atomic_ullong *volatile)v208[0] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  {
    operator new();
  }
  uint64_t v29 = mdm::Allocator::instance(void)::alloc;
  v30 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc
                                                                        + 16))(mdm::Allocator::instance(void)::alloc, 8, 4);
  v31 = v30;
  unint64_t v32 = (unint64_t)(v30 + 1);
  if (v30) {
    uint64_t *v30 = 0x300000005;
  }
  if (!v26)
  {
    v35 = v30;
    v36 = v30 + 1;
    goto LABEL_127;
  }
  uint64_t v33 = v26[21];
  if (v33 == -1)
  {
    v35 = v30;
  }
  else
  {
    v34 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 16))(v29, 16, 4);
    v35 = v34;
    unint64_t v32 = (unint64_t)(v34 + 2);
    if (v34) {
      v34[1] = (v33 << 32) | 6;
    }
    uint64_t *v34 = *v31;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)v29 + 40))(v29, v31, 8);
  }
  uint64_t v37 = v26[23];
  if (v37 == -1)
  {
    unint64_t v41 = v32;
    v44 = (uint64_t *)v32;
    goto LABEL_53;
  }
  uint64_t v38 = v32 - (void)v35;
  uint64_t v39 = (uint64_t)(v32 - (void)v35) >> 3;
  unint64_t v40 = v39 + 1;
  if ((unint64_t)(v39 + 1) >> 61) {
    abort();
  }
  if (v38 >> 2 > v40) {
    unint64_t v40 = v38 >> 2;
  }
  if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v41 = v40;
  }
  if (v41)
  {
    uint64_t v42 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)v29 + 16))(v29, 8 * v41, 4);
    v43 = (uint64_t *)(v42 + 8 * v39);
    unint64_t v41 = v42 + 8 * v41;
    if (v42) {
      uint64_t *v43 = (v37 << 32) | 0x52;
    }
  }
  else
  {
    v43 = (uint64_t *)(8 * v39);
  }
  v44 = v43 + 1;
  if ((uint64_t *)v32 == v35)
  {
    uint64_t v38 = 0;
    v35 = (uint64_t *)v32;
LABEL_51:
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)v29 + 40))(v29, v35, v38);
    goto LABEL_52;
  }
  unint64_t v45 = v32 - (void)v35 - 8;
  if (v45 < 0x38)
  {
    unint64_t v47 = v32;
    do
    {
LABEL_49:
      uint64_t v52 = *(void *)(v47 - 8);
      v47 -= 8;
      *--v43 = v52;
    }
    while ((uint64_t *)v47 != v35);
    goto LABEL_50;
  }
  if (v32 - (unint64_t)v43 < 0x20)
  {
    unint64_t v47 = v32;
    goto LABEL_49;
  }
  uint64_t v46 = (v45 >> 3) + 1;
  unint64_t v47 = v32 - 8 * (v46 & 0x3FFFFFFFFFFFFFFCLL);
  v48 = v43 - 2;
  v49 = (long long *)(v32 - 16);
  uint64_t v50 = v46 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v51 = *v49;
    *((_OWORD *)v48 - 1) = *(v49 - 1);
    *(_OWORD *)v48 = v51;
    v48 -= 4;
    v49 -= 2;
    v50 -= 4;
  }
  while (v50);
  v43 -= v46 & 0x3FFFFFFFFFFFFFFCLL;
  if (v46 != (v46 & 0x3FFFFFFFFFFFFFFCLL)) {
    goto LABEL_49;
  }
LABEL_50:
  if (v35) {
    goto LABEL_51;
  }
LABEL_52:
  v35 = v43;
LABEL_53:
  uint64_t v53 = v26[22];
  if (v53 == -1) {
    goto LABEL_56;
  }
  if ((unint64_t)v44 < v41)
  {
    *v44++ = (v53 << 32) | 4;
LABEL_56:
    unint64_t v32 = v41;
    v36 = v44;
    if ((unint64_t)v44 < v41) {
      goto LABEL_57;
    }
    goto LABEL_127;
  }
  uint64_t v61 = v44 - v35;
  unint64_t v62 = v61 + 1;
  if ((unint64_t)(v61 + 1) >> 61) {
    abort();
  }
  unint64_t v63 = v41 - (void)v35;
  if ((uint64_t)(v41 - (void)v35) >> 2 > v62) {
    unint64_t v62 = (uint64_t)(v41 - (void)v35) >> 2;
  }
  if (v63 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v32 = v62;
  }
  if (v32)
  {
    uint64_t v64 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)v29 + 16))(v29, 8 * v32, 4);
    v65 = (uint64_t *)(v64 + 8 * v61);
    unint64_t v32 = v64 + 8 * v32;
    if (v64) {
      uint64_t *v65 = (v53 << 32) | 4;
    }
  }
  else
  {
    v65 = (uint64_t *)(8 * v61);
  }
  v36 = v65 + 1;
  if (v44 != v35)
  {
    unint64_t v90 = (char *)v44 - (char *)v35 - 8;
    if (v90 < 0x38 || (unint64_t)((char *)v44 - (char *)v65) <= 0x1F)
    {
      v92 = v44;
    }
    else
    {
      uint64_t v91 = (v90 >> 3) + 1;
      v92 = &v44[-(v91 & 0x3FFFFFFFFFFFFFFCLL)];
      v93 = v65 - 2;
      v94 = v44 - 2;
      uint64_t v95 = v91 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v96 = *(_OWORD *)v94;
        *((_OWORD *)v93 - 1) = *((_OWORD *)v94 - 1);
        *(_OWORD *)v93 = v96;
        v93 -= 4;
        v94 -= 4;
        v95 -= 4;
      }
      while (v95);
      v65 -= v91 & 0x3FFFFFFFFFFFFFFCLL;
      if (v91 == (v91 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_124:
        if (!v35) {
          goto LABEL_126;
        }
        goto LABEL_125;
      }
    }
    do
    {
      uint64_t v97 = *--v92;
      *--v65 = v97;
    }
    while (v92 != v35);
    goto LABEL_124;
  }
  unint64_t v63 = v41 - (void)v44;
  v35 = v44;
LABEL_125:
  (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v29 + 40))(v29, v35, v63);
LABEL_126:
  v35 = v65;
  if ((unint64_t)v36 < v32)
  {
LABEL_57:
    uint64_t *v36 = 0x100010024;
    v54 = v36 + 1;
    if ((unint64_t)(v36 + 1) >= v32) {
      goto LABEL_58;
    }
    goto LABEL_150;
  }
LABEL_127:
  uint64_t v98 = v36 - v35;
  unint64_t v99 = v98 + 1;
  if ((unint64_t)(v98 + 1) >> 61) {
    abort();
  }
  unint64_t v100 = v32 - (void)v35;
  if ((uint64_t)(v32 - (void)v35) >> 2 > v99) {
    unint64_t v99 = (uint64_t)(v32 - (void)v35) >> 2;
  }
  if (v100 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v101 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v101 = v99;
  }
  if (v101)
  {
    uint64_t v102 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 16))(v29, 8 * v101, 4);
    v103 = (void *)(v102 + 8 * v98);
    unint64_t v32 = v102 + 8 * v101;
    if (v102) {
      void *v103 = 0x100010024;
    }
  }
  else
  {
    unint64_t v32 = 0;
    v103 = (void *)(8 * v98);
  }
  v54 = v103 + 1;
  if (v36 != v35)
  {
    unint64_t v104 = (char *)v36 - (char *)v35 - 8;
    if (v104 < 0x38)
    {
      v106 = v36;
    }
    else if ((unint64_t)((char *)v36 - (char *)v103) < 0x20)
    {
      v106 = v36;
    }
    else
    {
      uint64_t v105 = (v104 >> 3) + 1;
      v106 = &v36[-(v105 & 0x3FFFFFFFFFFFFFFCLL)];
      v107 = v103 - 2;
      v108 = v36 - 2;
      uint64_t v109 = v105 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v110 = *(_OWORD *)v108;
        *(v107 - 1) = *((_OWORD *)v108 - 1);
        _OWORD *v107 = v110;
        v107 -= 2;
        v108 -= 4;
        v109 -= 4;
      }
      while (v109);
      v103 -= v105 & 0x3FFFFFFFFFFFFFFCLL;
      if (v105 == (v105 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_147:
        if (!v35) {
          goto LABEL_149;
        }
        goto LABEL_148;
      }
    }
    do
    {
      uint64_t v111 = *--v106;
      *--v103 = v111;
    }
    while (v106 != v35);
    goto LABEL_147;
  }
LABEL_148:
  (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v29 + 40))(v29, v35, v100);
LABEL_149:
  v35 = v103;
  if ((unint64_t)v54 >= v32)
  {
LABEL_58:
    uint64_t v55 = v54 - v35;
    unint64_t v56 = v55 + 1;
    if ((unint64_t)(v55 + 1) >> 61) {
      abort();
    }
    unint64_t v57 = v32 - (void)v35;
    if ((uint64_t)(v32 - (void)v35) >> 2 > v56) {
      unint64_t v56 = (uint64_t)(v32 - (void)v35) >> 2;
    }
    if (v57 >= 0x7FFFFFFFFFFFFFF8) {
      uint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v58 = v56;
    }
    if (v58)
    {
      uint64_t v59 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 16))(v29, 8 * v58, 4);
      v60 = (uint64_t *)(v59 + 8 * v55);
      unint64_t v32 = v59 + 8 * v58;
      if (v59) {
        uint64_t *v60 = 0x10001001FLL;
      }
    }
    else
    {
      unint64_t v32 = 0;
      v60 = (uint64_t *)(8 * v55);
    }
    v66 = v60 + 1;
    if (v54 == v35)
    {
LABEL_88:
      (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v29 + 40))(v29, v35, v57);
LABEL_89:
      v35 = v60;
      if ((unint64_t)v66 >= v32) {
        goto LABEL_90;
      }
      goto LABEL_151;
    }
    unint64_t v67 = (char *)v54 - (char *)v35 - 8;
    if (v67 < 0x38)
    {
      v69 = v54;
    }
    else if ((unint64_t)((char *)v54 - (char *)v60) < 0x20)
    {
      v69 = v54;
    }
    else
    {
      uint64_t v68 = (v67 >> 3) + 1;
      v69 = &v54[-(v68 & 0x3FFFFFFFFFFFFFFCLL)];
      v70 = v60 - 2;
      v71 = (long long *)(v54 - 2);
      uint64_t v72 = v68 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v73 = *v71;
        *((_OWORD *)v70 - 1) = *(v71 - 1);
        *(_OWORD *)v70 = v73;
        v70 -= 4;
        v71 -= 2;
        v72 -= 4;
      }
      while (v72);
      v60 -= v68 & 0x3FFFFFFFFFFFFFFCLL;
      if (v68 == (v68 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_87:
        if (!v35) {
          goto LABEL_89;
        }
        goto LABEL_88;
      }
    }
    do
    {
      uint64_t v74 = *--v69;
      *--v60 = v74;
    }
    while (v69 != v35);
    goto LABEL_87;
  }
LABEL_150:
  void *v54 = 0x10001001FLL;
  v66 = v54 + 1;
  if ((unint64_t)(v54 + 1) >= v32)
  {
LABEL_90:
    uint64_t v75 = v66 - v35;
    unint64_t v76 = v75 + 1;
    if ((unint64_t)(v75 + 1) >> 61) {
      abort();
    }
    unint64_t v77 = v32 - (void)v35;
    if ((uint64_t)(v32 - (void)v35) >> 2 > v76) {
      unint64_t v76 = (uint64_t)(v32 - (void)v35) >> 2;
    }
    if (v77 >= 0x7FFFFFFFFFFFFFF8) {
      uint64_t v78 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v78 = v76;
    }
    if (v78)
    {
      uint64_t v79 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 16))(v29, 8 * v78, 4);
      v80 = (uint64_t *)(v79 + 8 * v75);
      unint64_t v32 = v79 + 8 * v78;
      if (v79) {
        uint64_t *v80 = 0x10001002DLL;
      }
    }
    else
    {
      unint64_t v32 = 0;
      v80 = (uint64_t *)(8 * v75);
    }
    v81 = v80 + 1;
    if (v66 == v35) {
      goto LABEL_111;
    }
    unint64_t v82 = (char *)v66 - (char *)v35 - 8;
    if (v82 < 0x38)
    {
      v84 = v66;
    }
    else if ((unint64_t)((char *)v66 - (char *)v80) < 0x20)
    {
      v84 = v66;
    }
    else
    {
      uint64_t v83 = (v82 >> 3) + 1;
      v84 = &v66[-(v83 & 0x3FFFFFFFFFFFFFFCLL)];
      v85 = v80 - 2;
      v86 = (long long *)(v66 - 2);
      uint64_t v87 = v83 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v88 = *v86;
        *((_OWORD *)v85 - 1) = *(v86 - 1);
        *(_OWORD *)v85 = v88;
        v85 -= 4;
        v86 -= 2;
        v87 -= 4;
      }
      while (v87);
      v80 -= v83 & 0x3FFFFFFFFFFFFFFCLL;
      if (v83 == (v83 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_110:
        if (!v35)
        {
LABEL_112:
          v35 = v80;
          goto LABEL_152;
        }
LABEL_111:
        (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v29 + 40))(v29, v35, v77);
        goto LABEL_112;
      }
    }
    do
    {
      uint64_t v89 = *--v84;
      *--v80 = v89;
    }
    while (v84 != v35);
    goto LABEL_110;
  }
LABEL_151:
  void *v66 = 0x10001002DLL;
  v81 = v66 + 1;
LABEL_152:
  unint64_t v112 = *((unsigned int *)a3 + 44);
  if (v112 >= 6) {
    unsigned __int8 v113 = 6;
  }
  else {
    unsigned __int8 v113 = 0x50403020000uLL >> (8 * v112);
  }
  if ((unint64_t)v81 < v32)
  {
    void *v81 = (((unint64_t)v113 << 32) | 0x1002E) + 46;
    v114 = v81 + 1;
    goto LABEL_180;
  }
  uint64_t v115 = v81 - v35;
  unint64_t v116 = v115 + 1;
  if ((unint64_t)(v115 + 1) >> 61) {
    abort();
  }
  unint64_t v117 = v32 - (void)v35;
  if ((uint64_t)(v32 - (void)v35) >> 2 > v116) {
    unint64_t v116 = (uint64_t)(v32 - (void)v35) >> 2;
  }
  if (v117 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v118 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v118 = v116;
  }
  if (v118)
  {
    uint64_t v119 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 16))(v29, 8 * v118, 4);
    v120 = (void *)(v119 + 8 * v115);
    unint64_t v32 = v119 + 8 * v118;
    if (v119) {
      void *v120 = (((unint64_t)v113 << 32) | 0x1002E) + 46;
    }
  }
  else
  {
    unint64_t v32 = 0;
    v120 = (void *)(8 * v115);
  }
  v114 = v120 + 1;
  if (v81 == v35) {
    goto LABEL_178;
  }
  unint64_t v121 = (char *)v81 - (char *)v35 - 8;
  if (v121 < 0x38)
  {
    v123 = v81;
    do
    {
LABEL_176:
      uint64_t v128 = *--v123;
      *--v120 = v128;
    }
    while (v123 != v35);
    goto LABEL_177;
  }
  if ((unint64_t)((char *)v81 - (char *)v120) < 0x20)
  {
    v123 = v81;
    goto LABEL_176;
  }
  uint64_t v122 = (v121 >> 3) + 1;
  v123 = &v81[-(v122 & 0x3FFFFFFFFFFFFFFCLL)];
  v124 = v120 - 2;
  v125 = (long long *)(v81 - 2);
  uint64_t v126 = v122 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v127 = *v125;
    *(v124 - 1) = *(v125 - 1);
    _OWORD *v124 = v127;
    v124 -= 2;
    v125 -= 2;
    v126 -= 4;
  }
  while (v126);
  v120 -= v122 & 0x3FFFFFFFFFFFFFFCLL;
  if (v122 != (v122 & 0x3FFFFFFFFFFFFFFCLL)) {
    goto LABEL_176;
  }
LABEL_177:
  if (v35) {
LABEL_178:
  }
    (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v29 + 40))(v29, v35, v117);
  v35 = v120;
LABEL_180:
  uint64_t v129 = *((unsigned __int8 *)a3 + 181);
  if ((unint64_t)v114 < v32)
  {
    uint64_t *v114 = (v129 << 32) | 0x1002E;
    v130 = (char *)(v114 + 1);
    if ((unint64_t)(v114 + 1) < v32) {
      goto LABEL_182;
    }
LABEL_207:
    uint64_t v147 = (v130 - (char *)v35) >> 3;
    unint64_t v148 = v147 + 1;
    if ((unint64_t)(v147 + 1) >> 61) {
      abort();
    }
    unint64_t v149 = v32 - (void)v35;
    if ((uint64_t)(v32 - (void)v35) >> 2 > v148) {
      unint64_t v148 = (uint64_t)(v32 - (void)v35) >> 2;
    }
    if (v149 >= 0x7FFFFFFFFFFFFFF8) {
      uint64_t v150 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v150 = v148;
    }
    if (v150)
    {
      uint64_t v151 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 16))(v29, 8 * v150, 4);
      v152 = (void *)(v151 + 8 * v147);
      unint64_t v32 = v151 + 8 * v150;
      if (v151) {
        void *v152 = 65583;
      }
    }
    else
    {
      unint64_t v32 = 0;
      v152 = (void *)(8 * v147);
    }
    v131 = (char *)(v152 + 1);
    if (v130 == (char *)v35)
    {
LABEL_228:
      (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v29 + 40))(v29, v35, v149);
LABEL_229:
      v35 = v152;
      if ((unint64_t)v131 < v32) {
        goto LABEL_183;
      }
      goto LABEL_230;
    }
    unint64_t v153 = v130 - (char *)v35 - 8;
    if (v153 < 0x38)
    {
      v155 = (uint64_t *)v130;
    }
    else if ((unint64_t)(v130 - (char *)v152) < 0x20)
    {
      v155 = (uint64_t *)v130;
    }
    else
    {
      uint64_t v154 = (v153 >> 3) + 1;
      v155 = (uint64_t *)&v130[-8 * (v154 & 0x3FFFFFFFFFFFFFFCLL)];
      v156 = v152 - 2;
      v157 = v130 - 16;
      uint64_t v158 = v154 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v159 = *(_OWORD *)v157;
        *(v156 - 1) = *((_OWORD *)v157 - 1);
        _OWORD *v156 = v159;
        v156 -= 2;
        v157 -= 32;
        v158 -= 4;
      }
      while (v158);
      v152 -= v154 & 0x3FFFFFFFFFFFFFFCLL;
      if (v154 == (v154 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_227:
        if (!v35) {
          goto LABEL_229;
        }
        goto LABEL_228;
      }
    }
    do
    {
      uint64_t v160 = *--v155;
      *--v152 = v160;
    }
    while (v155 != v35);
    goto LABEL_227;
  }
  uint64_t v133 = v114 - v35;
  unint64_t v134 = v133 + 1;
  if ((unint64_t)(v133 + 1) >> 61) {
    abort();
  }
  unint64_t v135 = v32 - (void)v35;
  if ((uint64_t)(v32 - (void)v35) >> 2 > v134) {
    unint64_t v134 = (uint64_t)(v32 - (void)v35) >> 2;
  }
  if (v135 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v136 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v136 = v134;
  }
  if (v136)
  {
    uint64_t v137 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 16))(v29, 8 * v136, 4);
    v138 = (uint64_t *)(v137 + 8 * v133);
    unint64_t v32 = v137 + 8 * v136;
    if (v137) {
      uint64_t *v138 = (v129 << 32) | 0x1002E;
    }
  }
  else
  {
    unint64_t v32 = 0;
    v138 = (uint64_t *)(8 * v133);
  }
  v130 = (char *)(v138 + 1);
  if (v114 != v35)
  {
    unint64_t v139 = (char *)v114 - (char *)v35 - 8;
    if (v139 < 0x38)
    {
      v141 = v114;
    }
    else if ((unint64_t)((char *)v114 - (char *)v138) < 0x20)
    {
      v141 = v114;
    }
    else
    {
      uint64_t v140 = (v139 >> 3) + 1;
      v141 = &v114[-(v140 & 0x3FFFFFFFFFFFFFFCLL)];
      v142 = v138 - 2;
      v143 = v114 - 2;
      uint64_t v144 = v140 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v145 = *(_OWORD *)v143;
        *((_OWORD *)v142 - 1) = *((_OWORD *)v143 - 1);
        *(_OWORD *)v142 = v145;
        v142 -= 4;
        v143 -= 4;
        v144 -= 4;
      }
      while (v144);
      v138 -= v140 & 0x3FFFFFFFFFFFFFFCLL;
      if (v140 == (v140 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_204:
        if (!v35) {
          goto LABEL_206;
        }
        goto LABEL_205;
      }
    }
    do
    {
      uint64_t v146 = *--v141;
      *--v138 = v146;
    }
    while (v141 != v35);
    goto LABEL_204;
  }
LABEL_205:
  (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v29 + 40))(v29, v35, v135);
LABEL_206:
  v35 = v138;
  if ((unint64_t)v130 >= v32) {
    goto LABEL_207;
  }
LABEL_182:
  *(void *)v130 = 65583;
  v131 = v130 + 8;
  if ((unint64_t)(v130 + 8) < v32)
  {
LABEL_183:
    *(void *)v131 = 65584;
    v132 = v131 + 8;
    id v15 = v202;
    goto LABEL_253;
  }
LABEL_230:
  uint64_t v161 = (v131 - (char *)v35) >> 3;
  unint64_t v162 = v161 + 1;
  if ((unint64_t)(v161 + 1) >> 61) {
    abort();
  }
  unint64_t v163 = v32 - (void)v35;
  if ((uint64_t)(v32 - (void)v35) >> 2 > v162) {
    unint64_t v162 = (uint64_t)(v32 - (void)v35) >> 2;
  }
  if (v163 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v164 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v164 = v162;
  }
  if (v164)
  {
    uint64_t v165 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v29 + 16))(v29, 8 * v164, 4);
    v166 = (char *)(v165 + 8 * v161);
    unint64_t v32 = v165 + 8 * v164;
    if (v165) {
      *(void *)v166 = 65584;
    }
  }
  else
  {
    unint64_t v32 = 0;
    v166 = (char *)(8 * v161);
  }
  v132 = v166 + 8;
  if (v131 == (char *)v35)
  {
    id v15 = v202;
LABEL_251:
    (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v29 + 40))(v29, v35, v163);
    goto LABEL_252;
  }
  unint64_t v167 = v131 - (char *)v35 - 8;
  if (v167 < 0x38 || (unint64_t)(v131 - v166) < 0x20)
  {
    v169 = v131;
    id v15 = v202;
    do
    {
LABEL_249:
      uint64_t v174 = *((void *)v169 - 1);
      v169 -= 8;
      *((void *)v166 - 1) = v174;
      v166 -= 8;
    }
    while (v169 != (char *)v35);
    goto LABEL_250;
  }
  uint64_t v168 = (v167 >> 3) + 1;
  v169 = &v131[-8 * (v168 & 0x3FFFFFFFFFFFFFFCLL)];
  v170 = v166 - 16;
  v171 = v131 - 16;
  uint64_t v172 = v168 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    long long v173 = *(_OWORD *)v171;
    *((_OWORD *)v170 - 1) = *((_OWORD *)v171 - 1);
    *(_OWORD *)v170 = v173;
    v170 -= 32;
    v171 -= 32;
    v172 -= 4;
  }
  while (v172);
  v166 -= 8 * (v168 & 0x3FFFFFFFFFFFFFFCLL);
  id v15 = v202;
  if (v168 != (v168 & 0x3FFFFFFFFFFFFFFCLL)) {
    goto LABEL_249;
  }
LABEL_250:
  if (v35) {
    goto LABEL_251;
  }
LABEL_252:
  v35 = (uint64_t *)v166;
LABEL_253:
  v175 = v203;
  if (((v132 - (char *)v35) & 0x7FFFFFFF8) != 0)
  {
    uint64_t v176 = 0;
    char v177 = 0;
    uint64_t v178 = v214;
    uint64_t v179 = ((unint64_t)(v132 - (char *)v35) >> 3);
    unsigned __int8 v180 = *(unsigned char *)(v214 + 33);
    while (1)
    {
      size_t v181 = v180;
      v182 = *(void **)v178;
      if (v180) {
        break;
      }
LABEL_255:
      v182[v181] = v35[v176];
      unsigned __int8 v180 = *(unsigned char *)(v178 + 33) + 1;
      *(unsigned char *)(v178 + 33) = v180;
      ++v176;
      char v177 = 1;
      if (v176 == v179)
      {
        v182 = *(void **)v178;
        size_t v181 = v180;
LABEL_272:
        qsort(v182, v181, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
        goto LABEL_273;
      }
    }
    if (v180 > 0x1Fu)
    {
      do
      {
        uint64_t v186 = 0;
        v187 = (int *)v182;
        while (1)
        {
          int v188 = *v187;
          v187 += 2;
          if (v188 == LODWORD(v35[v176])) {
            break;
          }
          if (v180 == ++v186) {
            goto LABEL_266;
          }
        }
        HIDWORD(v182[v186]) = HIDWORD(v35[v176]);
LABEL_266:
        ++v176;
      }
      while (v176 != v179);
    }
    else
    {
      do
      {
        uint64_t v183 = 0;
        v184 = (int *)v182;
        while (1)
        {
          int v185 = *v184;
          v184 += 2;
          if (v185 == LODWORD(v35[v176])) {
            break;
          }
          if (v181 == ++v183) {
            goto LABEL_255;
          }
        }
        HIDWORD(v182[v183]) = HIDWORD(v35[v176++]);
      }
      while (v176 != v179);
    }
    if (v177) {
      goto LABEL_272;
    }
  }
LABEL_273:
  uint64_t v189 = v214;
  v190 = v215;
  if (v215)
  {
    atomic_fetch_add_explicit(&v215->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v190->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v191 = (std::__shared_weak_count *)v203[2].i64[1];
  v203[2].i64[0] = v189;
  v203[2].i64[1] = (uint64_t)v190;
  if (v191 && !atomic_fetch_add(&v191->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v191->__on_zero_shared)(v191);
    std::__shared_weak_count::__release_weak(v191);
  }
  if (v190 && !atomic_fetch_add(&v190->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v190->__on_zero_shared)(v190);
    std::__shared_weak_count::__release_weak(v190);
  }
  v203[4].i32[2] = *((_DWORD *)a3 + 2);
  v203[5].i32[0] = *((_DWORD *)a3 + 3);
  if (*((unsigned char *)a3 + 112))
  {
    v203[14].i8[13] = 1;
    v203[16].i64[0] = *((void *)a3 + 13);
  }
  md::LabelExternalFeature::addTextForZoom(v203, 0, 3, (const char *)[v205 UTF8String], 0);
  if (!v26) {
    goto LABEL_301;
  }
  v203[5].i32[1] = v26[24];
  v192 = (*(void (**)(unsigned int *))(*(void *)v26 + 88))(v26);
  v193 = [v192 feature];
  uint64_t v194 = [v193 pointFeature];

  if (!v194) {
    goto LABEL_301;
  }
  LOWORD(v207) = 0;
  *(_OWORD *)__p = 0u;
  long long v213 = 0u;
  long long v210 = 0u;
  *(_OWORD *)v211 = 0u;
  *(_OWORD *)v208 = 0u;
  *(_OWORD *)v209 = 0u;
  uint64_t v195 = *(void *)(v194 + 48);
  uint64_t v196 = *(void *)(v194 + 56);
  if (v195 != v196)
  {
    while (*(unsigned char *)(v195 + 1))
    {
      v195 += 104;
      if (v195 == v196) {
        goto LABEL_297;
      }
    }
    md::LabelExternalTextElement::operator=((uint64_t)&v207, (void *)v195);
    if (SHIBYTE(v209[0]) >= 0) {
      v197 = v208;
    }
    else {
      v197 = (void **)v208[0];
    }
    if (v210 >= 0) {
      v198 = (const char *)&v209[1];
    }
    else {
      v198 = (const char *)v209[1];
    }
    md::LabelExternalFeature::addTextForZoom(v203, 0, 0, (const char *)v197, v198);
    id v15 = v202;
    if (SHIBYTE(v213) < 0) {
      operator delete(__p[1]);
    }
  }
LABEL_297:
  if (SHIBYTE(__p[0]) < 0)
  {
    operator delete(v211[0]);
    if ((SHIBYTE(v210) & 0x80000000) == 0) {
      goto LABEL_299;
    }
  }
  else if ((SHIBYTE(v210) & 0x80000000) == 0)
  {
    goto LABEL_299;
  }
  operator delete(v209[1]);
LABEL_299:
  v175 = v203;
  if (SHIBYTE(v209[0]) < 0) {
    operator delete(v208[0]);
  }
LABEL_301:
  if (objc_msgSend(v15, "length", v202)) {
    md::LabelExternalFeature::addTextForZoom(v175, 0, 2, (const char *)[v15 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v206), "UTF8String"));
  }
  v199 = v204;
  if (v35) {
    (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v29 + 40))(v29, v35, v32 - (void)v35);
  }
  v200 = v215;
  if (v215 && !atomic_fetch_add(&v215->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v200->__on_zero_shared)(v200);
    std::__shared_weak_count::__release_weak(v200);
  }
  v16 = v204;
  id v14 = v205;
LABEL_309:

  return v16;
}

@end