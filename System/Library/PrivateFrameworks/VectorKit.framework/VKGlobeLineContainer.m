@interface VKGlobeLineContainer
- (BOOL)hasNonPersistentOverlay:(id)a3;
- (BOOL)hasPersistentOverlay:(id)a3;
- (VKGlobeLineContainer)initWithRouteRenderLayer:(void *)a3;
- (VKGlobeLineContainerDelegate)delegate;
- (VKRouteMatchedAnnotationPresentation)routeLineSplitAnnotation;
- (VKRouteMatchedAnnotationPresentation)skippedRouteLineSplitAnnotation;
- (const)nonPersistentOverlays;
- (const)overlays;
- (const)persistentOverlays;
- (float)halfWidthForLine:(id)a3 styleZ:(float)a4;
- (id).cxx_construct;
- (void)_addOverlay:(id)a3;
- (void)_destroyLinesIfNeeded;
- (void)_recreateLinesIfNeeded;
- (void)_removeOverlay:(id)a3;
- (void)_updateRouteSplit;
- (void)_updateSkippedRouteSplit;
- (void)addLine:(_retain_ptr<VKPolylineOverlay *);
- (void)addNonPersistentOverlay:(id)a3;
- (void)addPersistentOverlay:(id)a3;
- (void)clearLineSelection;
- (void)clearLineSkip;
- (void)dealloc;
- (void)removeLine:(_retain_ptr<VKPolylineOverlay *);
- (void)removeNonPersistentOverlay:(id)a3;
- (void)removePersistentOverlay:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRouteLineSplitAnnotation:(id)a3;
- (void)setSelected:(_retain_ptr<VKPolylineOverlay *) selected:()geo:()geo:()geo:(geo:(BOOL)a4 :_equal_objc>)a3 :_hash_objc :_release_objc_arc :_retain_objc_arc;
- (void)setSkipped:(_retain_ptr<VKPolylineOverlay *) skipped:()geo:()geo:()geo:(geo:(BOOL)a4 :_equal_objc>)a3 :_hash_objc :_release_objc_arc :_retain_objc_arc;
- (void)setSkippedRouteLineSplitAnnotation:(id)a3;
- (void)update;
@end

@implementation VKGlobeLineContainer

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 4) = (char *)self + 40;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = (char *)self + 64;
  *((void *)self + 11) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 88;
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = (char *)self + 112;
  *((void *)self + 18) = 0;
  *((void *)self + 17) = (char *)self + 144;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = off_1EF559738;
  *((void *)self + 21) = 0;
  *((void *)self + 23) = off_1EF559738;
  *((void *)self + 24) = 0;
  return self;
}

- (void).cxx_destruct
{
  self->_skippedPolyline._vptr$_retain_ptr = (void **)off_1EF559738;

  self->_selectedPolyline._vptr$_retain_ptr = (void **)off_1EF559738;
  std::__tree<std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>,std::__map_value_compare<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>,std::less<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>>>::destroy((void *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((void *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((void *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((void *)self->_overlays.__tree_.__pair1_.__value_.__left_);
  std::__tree<VKPolylineGroupOverlay * {__strong}>::destroy((void *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skippedRouteLineSplitAnnotation, 0);
  objc_storeStrong((id *)&self->_routeLineSplitAnnotation, 0);
}

- (VKRouteMatchedAnnotationPresentation)skippedRouteLineSplitAnnotation
{
  return self->_skippedRouteLineSplitAnnotation;
}

- (void)setDelegate:(id)a3
{
}

- (VKGlobeLineContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKGlobeLineContainerDelegate *)WeakRetained;
}

- (float)halfWidthForLine:(id)a3 styleZ:(float)a4
{
  id v7 = a3;
  v8 = v7;
  v26 = v7;
  p_pair1 = &self->_polylinesToRoutes.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        v11 = left;
        unint64_t v12 = (unint64_t)left[5].__value_.__left_;
        if (v12 <= (unint64_t)v7) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)v11->__value_.__left_;
        p_pair1 = v11;
        if (!v11->__value_.__left_) {
          goto LABEL_8;
        }
      }
      if (v12 >= (unint64_t)v7) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)v11[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v11 + 1;
        goto LABEL_8;
      }
    }
    v13 = v11;
    v17 = (std::__shared_weak_count *)v11[8].__value_.__left_;
    if (v17) {
      goto LABEL_11;
    }
LABEL_15:

    v19 = 0;
    uint64_t v20 = 0;
    goto LABEL_16;
  }
  v11 = &self->_polylinesToRoutes.__tree_.__pair1_;
LABEL_8:
  v13 = operator new(0x48uLL);
  *((void *)v13 + 4) = off_1EF559738;
  *((void *)v13 + 5) = 0;
  objc_storeStrong((id *)v13 + 5, a3);
  v14 = v26;
  v26 = 0;

  *((void *)v13 + 7) = 0;
  *((void *)v13 + 8) = 0;
  *(void *)v13 = 0;
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = v11;
  p_pair1->__value_.__left_ = v13;
  v15 = *(void **)self->_polylinesToRoutes.__tree_.__begin_node_;
  v16 = (uint64_t *)v13;
  if (v15)
  {
    self->_polylinesToRoutes.__tree_.__begin_node_ = v15;
    v16 = (uint64_t *)p_pair1->__value_.__left_;
  }
  std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_, v16);
  ++self->_polylinesToRoutes.__tree_.__pair3_.__value_;
  v17 = (std::__shared_weak_count *)*((void *)v13 + 8);
  if (!v17) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v18 = *((void *)v13 + 7);
  atomic_fetch_add_explicit(&v17->__shared_weak_owners_, 1uLL, memory_order_relaxed);

  v19 = std::__shared_weak_count::lock(v17);
  if (v19) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = 0;
  }
LABEL_16:
  routeRenderLayer = self->_routeRenderLayer;
  uint64_t v22 = routeRenderLayer[37];
  uint64_t v23 = routeRenderLayer[38];
  float v24 = 0.0;
  if (v22 == v23)
  {
LABEL_19:
    if (!v19) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  while (*(void *)v22 != v20)
  {
    v22 += 24;
    if (v22 == v23) {
      goto LABEL_19;
    }
  }
  float v24 = altitude::Route::widthForZoom(*(altitude::Route **)(v22 + 16), a4) * 0.5;
  if (v19)
  {
LABEL_22:
    if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
LABEL_24:
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }

  return v24;
}

- (void)update
{
  [(VKGlobeLineContainer *)self _destroyLinesIfNeeded];
  [(VKGlobeLineContainer *)self _recreateLinesIfNeeded];
}

- (void)_destroyLinesIfNeeded
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  __p = 0;
  v98 = 0;
  unint64_t v99 = 0;
  v94 = 0;
  v95 = 0;
  unint64_t v96 = 0;
  begin_node = (VKGlobeLineContainer *)self->_overlays.__tree_.__begin_node_;
  p_pair1 = &self->_overlays.__tree_.__pair1_;
  if (begin_node == (VKGlobeLineContainer *)&self->_overlays.__tree_.__pair1_)
  {
    v3 = 0;
    goto LABEL_56;
  }
  v3 = 0;
  while (2)
  {
    id v4 = begin_node->_retainedOverlays.__tree_.__begin_node_;
    objc_opt_class();
    v81 = begin_node;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_49;
    }
    id v5 = v4;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v78 = v5;
    id obj = [v5 polylines];
    uint64_t v6 = [obj countByEnumeratingWithState:&v90 objects:v100 count:16];
    id v77 = v4;
    if (!v6)
    {
      id v7 = obj;
      goto LABEL_48;
    }
    uint64_t v83 = *(void *)v91;
    id v7 = obj;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v91 != v83) {
          objc_enumerationMutation(v7);
        }
        v9 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        if ((unint64_t)v3 < v99)
        {
          *(void *)v3 = v9;
          v3 += 8;
          goto LABEL_9;
        }
        v10 = (char *)__p;
        int64_t v11 = v3 - (unsigned char *)__p;
        uint64_t v12 = (v3 - (unsigned char *)__p) >> 3;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 61) {
          abort();
        }
        uint64_t v14 = v99 - (void)__p;
        if ((uint64_t)(v99 - (void)__p) >> 2 > v13) {
          unint64_t v13 = v14 >> 2;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15)
        {
          if (v15 >> 61) {
LABEL_118:
          }
            std::__throw_bad_array_new_length[abi:nn180100]();
          v16 = (char *)operator new(8 * v15);
        }
        else
        {
          v16 = 0;
        }
        v17 = &v16[8 * v12];
        uint64_t v18 = &v16[8 * v15];
        *(void *)v17 = v9;
        v19 = v17 + 8;
        int64_t v20 = v3 - v10;
        if (v3 == v10)
        {
          __p = &v16[8 * v12];
          v98 = v17 + 8;
          unint64_t v99 = (unint64_t)v18;
          id v7 = obj;
          goto LABEL_32;
        }
        unint64_t v21 = v20 - 8;
        if ((unint64_t)(v20 - 8) <= 0x137
          || (unint64_t v26 = v21 & 0xFFFFFFFFFFFFFFF8, &v3[-(v21 & 0xFFFFFFFFFFFFFFF8) - 8] > v3 - 8)
          || &v16[v11 - 8 - v26] > &v16[v11 - 8]
          || (unint64_t v27 = v21 >> 3, &v3[-8 * v27 - 8] < v17) && &v16[v11 - v26 - 8] < v3)
        {
          uint64_t v22 = v3;
        }
        else
        {
          unint64_t v28 = v27 + 1;
          uint64_t v22 = &v3[-8 * (v28 & 0x3FFFFFFFFFFFFFFCLL)];
          v29 = &v16[8 * v12 - 16];
          v30 = v3 - 32;
          uint64_t v31 = v28 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v33 = *(_OWORD *)v30;
            long long v32 = *((_OWORD *)v30 + 1);
            *(_OWORD *)v30 = 0uLL;
            *((_OWORD *)v30 + 1) = 0uLL;
            v30 -= 32;
            *((_OWORD *)v29 - 1) = v33;
            *(_OWORD *)v29 = v32;
            v29 -= 32;
            v31 -= 4;
          }
          while (v31);
          v17 -= 8 * (v28 & 0x3FFFFFFFFFFFFFFCLL);
          if (v28 == (v28 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_27;
          }
        }
        do
        {
          uint64_t v23 = *((void *)v22 - 1);
          v22 -= 8;
          *(void *)uint64_t v22 = 0;
          *((void *)v17 - 1) = v23;
          v17 -= 8;
        }
        while (v22 != v10);
LABEL_27:
        v3 = (char *)__p;
        float v24 = v98;
        __p = v17;
        v98 = v19;
        unint64_t v99 = (unint64_t)v18;
        if (v24 == v3)
        {
          id v7 = obj;
          if (!v3) {
            goto LABEL_34;
          }
LABEL_33:
          operator delete(v3);
          goto LABEL_34;
        }
        id v7 = obj;
        do
        {
          v25 = (void *)*((void *)v24 - 1);
          v24 -= 8;
        }
        while (v24 != v3);
LABEL_32:
        if (v3) {
          goto LABEL_33;
        }
LABEL_34:
        v3 = v19;
LABEL_9:
        v98 = v3;
      }
      uint64_t v6 = [v7 countByEnumeratingWithState:&v90 objects:v100 count:16];
    }
    while (v6);
LABEL_48:

    id v4 = v77;
LABEL_49:

    v34 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v81;
    routeLineSplitAnnotation = v81->_routeLineSplitAnnotation;
    if (routeLineSplitAnnotation)
    {
      do
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)routeLineSplitAnnotation;
        routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
      }
      while (routeLineSplitAnnotation);
    }
    else
    {
      do
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v34[2].__value_.__left_;
        BOOL v37 = left->__value_.__left_ == v34;
        v34 = left;
      }
      while (!v37);
    }
    begin_node = (VKGlobeLineContainer *)left;
    if (left != p_pair1) {
      continue;
    }
    break;
  }
LABEL_56:
  v38 = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (v38 != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    while (2)
    {
      v86 = off_1EF559738;
      id v87 = v38->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      v39 = (std::__shared_weak_count *)v38->_overlays.__tree_.__pair1_.__value_.__left_;
      v88 = v38->_overlays.__tree_.__begin_node_;
      v89 = v39;
      if (v39) {
        atomic_fetch_add_explicit(&v39->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      id v40 = v87;
      v41 = (id *)v3;
      if (__p != v3)
      {
        v41 = (id *)__p;
        while (*v41 != v87)
        {
          if (++v41 == (id *)v3)
          {
            v41 = (id *)v3;
            break;
          }
        }
      }
      if (v41 != (id *)v3)
      {
        v42 = v89;
        if (v89) {
          goto LABEL_68;
        }
        goto LABEL_69;
      }
      v45 = v95;
      if ((unint64_t)v95 < v96)
      {
        *v95 = off_1EF559738;
        v45[1] = 0;
        id v46 = v87;
        v47 = v45[1];
        v45[1] = v46;

        v48 = v45 + 3;
        goto LABEL_96;
      }
      v49 = (void **)v94;
      unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * (((char *)v95 - v94) >> 3);
      unint64_t v51 = v50 + 1;
      if (v50 + 1 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      if (0x5555555555555556 * ((uint64_t)(v96 - (void)v94) >> 3) > v51) {
        unint64_t v51 = 0x5555555555555556 * ((uint64_t)(v96 - (void)v94) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v96 - (void)v94) >> 3) >= 0x555555555555555) {
        unint64_t v52 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v52 = v51;
      }
      if (v52)
      {
        if (v52 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_118;
        }
        v53 = (char *)operator new(24 * v52);
      }
      else
      {
        v53 = 0;
      }
      v54 = &v53[24 * v50];
      *(void *)v54 = off_1EF559738;
      *((void *)v54 + 1) = 0;
      id v55 = v40;
      v56 = (void *)*((void *)v54 + 1);
      *((void *)v54 + 1) = v55;

      v57 = &v53[24 * v52];
      v48 = (void **)(v54 + 24);
      if (v45 == v49)
      {
        v94 = &v53[24 * v50];
        v95 = (void **)(v54 + 24);
        unint64_t v96 = (unint64_t)v57;
        if (v45) {
          goto LABEL_95;
        }
      }
      else
      {
        uint64_t v58 = (uint64_t)&v53[24 * v50 - 24];
        do
        {
          *((void *)v54 - 3) = off_1EF559738;
          v54 -= 24;
          *((void *)v54 + 1) = 0;
          v60 = *(v45 - 2);
          v59 = v45 - 2;
          objc_storeStrong((id *)v54 + 1, v60);
          v61 = *v59;
          *v59 = 0;

          v45 = v59 - 1;
          v58 -= 24;
        }
        while (v45 != v49);
        v45 = (void **)v94;
        v62 = v95;
        v94 = v54;
        v95 = v48;
        unint64_t v96 = (unint64_t)v57;
        if (v62 != v45)
        {
          v63 = v62 - 3;
          v64 = v62 - 3;
          v65 = v62 - 3;
          do
          {
            v66 = (void (**)(void **))*v65;
            v65 -= 3;
            (*v66)(v64);
            v63 -= 3;
            BOOL v37 = v64 == v45;
            v64 = v65;
          }
          while (!v37);
        }
        if (v45) {
LABEL_95:
        }
          operator delete(v45);
      }
LABEL_96:
      v95 = v48;
      v42 = v89;
      if (v89) {
LABEL_68:
      }
        std::__shared_weak_count::__release_weak(v42);
LABEL_69:
      v86 = off_1EF559738;

      v43 = v38->_routeLineSplitAnnotation;
      if (v43)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)v43;
          v43 = *(VKRouteMatchedAnnotationPresentation **)v43;
        }
        while (v43);
      }
      else
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)v38->_skippedRouteLineSplitAnnotation;
          BOOL v37 = skippedRouteLineSplitAnnotation->super.isa == (Class)v38;
          v38 = skippedRouteLineSplitAnnotation;
        }
        while (!v37);
      }
      v38 = skippedRouteLineSplitAnnotation;
      if (skippedRouteLineSplitAnnotation == (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_) {
        break;
      }
      continue;
    }
  }
  v68 = v94;
  v67 = (char *)v95;
  if (v94 == (char *)v95)
  {
    if (v94) {
      goto LABEL_110;
    }
  }
  else
  {
    v69 = v94;
    do
    {
      v86 = off_1EF559738;
      id v87 = *((id *)v69 + 1);
      v84 = off_1EF559738;
      id v85 = v87;
      [(VKGlobeLineContainer *)self removeLine:&v84];
      v84 = off_1EF559738;

      v86 = off_1EF559738;
      v69 += 24;
    }
    while (v69 != v67);
    if (v68)
    {
      if (v68 != v67)
      {
        v70 = v67 - 24;
        v71 = v70;
        v72 = v70;
        do
        {
          v73 = *(void (***)(char *))v72;
          v72 -= 24;
          (*v73)(v71);
          v70 -= 24;
          BOOL v37 = v71 == v68;
          v71 = v72;
        }
        while (!v37);
        v68 = v94;
      }
LABEL_110:
      operator delete(v68);
    }
  }
  v74 = (char *)__p;
  if (__p)
  {
    for (j = v98; j != v74; j -= 8)
    {
      v76 = (void *)*((void *)j - 1);
    }
    operator delete(v74);
  }
}

- (void)_recreateLinesIfNeeded
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  begin_node = (VKGlobeLineContainer *)self->_overlays.__tree_.__begin_node_;
  p_pair1 = &self->_overlays.__tree_.__pair1_;
  if (begin_node == (VKGlobeLineContainer *)&self->_overlays.__tree_.__pair1_) {
    return;
  }
  id v4 = &self->_polylinesToRoutes.__tree_.__pair1_;
  while (2)
  {
    id v5 = begin_node->_retainedOverlays.__tree_.__begin_node_;
    objc_opt_class();
    unint64_t v28 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_34;
    }
    id v6 = v5;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v26 = v6;
    id v7 = [v6 polylines];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v8) {
      goto LABEL_33;
    }
    uint64_t v9 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v35 + 1) + 8 * v10);
        long long v33 = off_1EF559738;
        id v34 = v11;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> *)v4->__value_.__left_;
        if (!v4->__value_.__left_) {
          goto LABEL_21;
        }
        unint64_t v13 = v4;
        do
        {
          unint64_t v14 = (unint64_t)left[5].__value_.__left_;
          BOOL v15 = v14 >= (unint64_t)v11;
          if (v14 >= (unint64_t)v11) {
            v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> **)left;
          }
          else {
            v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<geo::_retain_ptr<VKPolylineOverlay *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::weak_ptr<altitude::RouteLineData>>, void *>>> **)&left[1];
          }
          if (v15) {
            unint64_t v13 = left;
          }
          left = *v16;
        }
        while (*v16);
        if (v13 == v4 || v11 < v13[5].__value_.__left_)
        {
LABEL_21:
          uint64_t v31 = off_1EF559738;
          id v32 = v11;
          [(VKGlobeLineContainer *)self addLine:&v31];
          uint64_t v31 = off_1EF559738;
          v17 = &v32;
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v18 = (std::__shared_weak_count *)v13[8].__value_.__left_;
        if (!v18 || (v19 = std::__shared_weak_count::lock(v18)) == 0)
        {
LABEL_31:
          v29 = off_1EF559738;
          id v30 = v34;
          [(VKGlobeLineContainer *)self addLine:&v29];
          v29 = off_1EF559738;
          v17 = &v30;
          goto LABEL_22;
        }
        int64_t v20 = v19;
        unint64_t v21 = v13[7].__value_.__left_;
        if (atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          if (!v21) {
            goto LABEL_31;
          }
        }
        else
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v20);
          if (!v21) {
            goto LABEL_31;
          }
        }
LABEL_23:
        long long v33 = off_1EF559738;

        ++v10;
      }
      while (v10 != v8);
      uint64_t v22 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v8 = v22;
    }
    while (v22);
LABEL_33:

LABEL_34:
    routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
    if (routeLineSplitAnnotation)
    {
      do
      {
        skippedRouteLineSplitAnnotation = routeLineSplitAnnotation;
        routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
      }
      while (routeLineSplitAnnotation);
    }
    else
    {
      do
      {
        skippedRouteLineSplitAnnotation = begin_node->_skippedRouteLineSplitAnnotation;
        BOOL v25 = *(void *)skippedRouteLineSplitAnnotation == (void)begin_node;
        begin_node = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
      }
      while (!v25);
    }
    begin_node = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
    if (skippedRouteLineSplitAnnotation != (VKRouteMatchedAnnotationPresentation *)p_pair1) {
      continue;
    }
    break;
  }
}

- (void)_updateSkippedRouteSplit
{
  [(VKGlobeLineContainer *)self _recreateLinesIfNeeded];
  begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    do
    {
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      if (!left) {
        goto LABEL_10;
      }
      id v5 = std::__shared_weak_count::lock(left);
      if (!v5) {
        goto LABEL_10;
      }
      id v6 = v5;
      id v7 = begin_node->_overlays.__tree_.__begin_node_;
      if (v7
        && geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_, (uint64_t)&self->_skippedPolyline))
      {
        v7[9] = self->_skippedRouteSplit;
      }
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
        routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
        if (!routeLineSplitAnnotation)
        {
          do
          {
LABEL_14:
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)begin_node->_skippedRouteLineSplitAnnotation;
            BOOL v10 = skippedRouteLineSplitAnnotation->super.isa == (Class)begin_node;
            begin_node = skippedRouteLineSplitAnnotation;
          }
          while (!v10);
          goto LABEL_3;
        }
      }
      else
      {
LABEL_10:
        routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
        if (!routeLineSplitAnnotation) {
          goto LABEL_14;
        }
      }
      do
      {
        skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)routeLineSplitAnnotation;
        routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
      }
      while (routeLineSplitAnnotation);
LABEL_3:
      begin_node = skippedRouteLineSplitAnnotation;
    }
    while (skippedRouteLineSplitAnnotation != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_);
  }
}

- (void)_updateRouteSplit
{
  [(VKGlobeLineContainer *)self _recreateLinesIfNeeded];
  begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    do
    {
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      if (!left) {
        goto LABEL_12;
      }
      id v5 = std::__shared_weak_count::lock(left);
      if (!v5) {
        goto LABEL_12;
      }
      id v6 = v5;
      id v7 = begin_node->_overlays.__tree_.__begin_node_;
      if (v7)
      {
        if (geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_, (uint64_t)&self->_selectedPolyline))routeSplit = self->_routeSplit; {
        else
        }
          routeSplit = 0;
        v7[9] = routeSplit;
      }
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
        routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
        if (!routeLineSplitAnnotation)
        {
          do
          {
LABEL_16:
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)begin_node->_skippedRouteLineSplitAnnotation;
            BOOL v11 = skippedRouteLineSplitAnnotation->super.isa == (Class)begin_node;
            begin_node = skippedRouteLineSplitAnnotation;
          }
          while (!v11);
          goto LABEL_3;
        }
      }
      else
      {
LABEL_12:
        routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
        if (!routeLineSplitAnnotation) {
          goto LABEL_16;
        }
      }
      do
      {
        skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)routeLineSplitAnnotation;
        routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
      }
      while (routeLineSplitAnnotation);
LABEL_3:
      begin_node = skippedRouteLineSplitAnnotation;
    }
    while (skippedRouteLineSplitAnnotation != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_);
  }
}

- (VKRouteMatchedAnnotationPresentation)routeLineSplitAnnotation
{
  return self->_routeLineSplitAnnotation;
}

- (void)setSkippedRouteLineSplitAnnotation:(id)a3
{
  id obj = a3;
  objc_storeStrong((id *)&self->_skippedRouteLineSplitAnnotation, a3);
  objc_storeWeak(&self->_skippedRouteSplit->var1, obj);
  [(VKGlobeLineContainer *)self _updateSkippedRouteSplit];
  if (self->_skippedRouteLineSplitAnnotation)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained lineContainerNeedsDisplay:self];
  }
}

- (void)setRouteLineSplitAnnotation:(id)a3
{
  id obj = a3;
  objc_storeStrong((id *)&self->_routeLineSplitAnnotation, a3);
  objc_storeWeak(&self->_routeSplit->var1, obj);
  [(VKGlobeLineContainer *)self _updateRouteSplit];
  if (self->_routeLineSplitAnnotation)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained lineContainerNeedsDisplay:self];
  }
}

- (void)setSkipped:(_retain_ptr<VKPolylineOverlay *) skipped:()geo:()geo:()geo:(geo:(BOOL)a4 :_equal_objc>)a3 :_hash_objc :_release_objc_arc :_retain_objc_arc
{
  int obj = (int)a3._obj;
  id v5 = a3._vptr$_retain_ptr;
  unint64_t v21 = 0;
  if ((geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(a3._vptr$_retain_ptr[1], &v21) & 1) == 0)
  {
    [(VKGlobeLineContainer *)self _recreateLinesIfNeeded];
    id v7 = self->_skippedPolyline._obj;
    self->_skippedPolyline._int obj = 0;

    if (obj)
    {
      uint64_t v8 = v5[1];
      uint64_t v9 = self->_skippedPolyline._obj;
      self->_skippedPolyline._int obj = v8;
    }
    left = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      BOOL v11 = v5[1];
      p_pair1 = (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_;
      do
      {
        unint64_t v13 = left->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
        BOOL v14 = v13 >= v11;
        if (v13 >= v11) {
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)left;
        }
        else {
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&left->_routeLineSplitAnnotation;
        }
        if (v14) {
          p_pair1 = left;
        }
        left = *p_routeLineSplitAnnotation;
      }
      while (*p_routeLineSplitAnnotation);
      if (p_pair1 != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_
        && v11 >= p_pair1->_retainedOverlays.__tree_.__pair1_.__value_.__left_)
      {
        v16 = (std::__shared_weak_count *)p_pair1->_overlays.__tree_.__pair1_.__value_.__left_;
        if (v16)
        {
          v17 = std::__shared_weak_count::lock(v16);
          if (v17)
          {
            uint64_t v18 = v17;
            begin_node = p_pair1->_overlays.__tree_.__begin_node_;
            if (begin_node) {
              begin_node[65] = obj;
            }
            if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
        }
      }
    }
    [(VKGlobeLineContainer *)self _updateSkippedRouteSplit];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained lineContainerNeedsDisplay:self];
  }
}

- (void)setSelected:(_retain_ptr<VKPolylineOverlay *) selected:()geo:()geo:()geo:(geo:(BOOL)a4 :_equal_objc>)a3 :_hash_objc :_release_objc_arc :_retain_objc_arc
{
  int obj = (int)a3._obj;
  id v5 = a3._vptr$_retain_ptr;
  uint64_t v22 = 0;
  if ((geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(a3._vptr$_retain_ptr[1], &v22) & 1) == 0)
  {
    [(VKGlobeLineContainer *)self _recreateLinesIfNeeded];
    if (obj)
    {
      id v7 = v5[1];
      uint64_t v8 = self->_selectedPolyline._obj;
      self->_selectedPolyline._int obj = v7;
    }
    else
    {
      uint64_t v9 = self->_selectedPolyline._obj;
      self->_selectedPolyline._int obj = 0;

      unint64_t v21 = off_1EF559738;
      uint64_t v8 = 0;
    }

    left = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      BOOL v11 = v5[1];
      p_pair1 = (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_;
      do
      {
        unint64_t v13 = left->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
        BOOL v14 = v13 >= v11;
        if (v13 >= v11) {
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)left;
        }
        else {
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&left->_routeLineSplitAnnotation;
        }
        if (v14) {
          p_pair1 = left;
        }
        left = *p_routeLineSplitAnnotation;
      }
      while (*p_routeLineSplitAnnotation);
      if (p_pair1 != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_
        && v11 >= p_pair1->_retainedOverlays.__tree_.__pair1_.__value_.__left_)
      {
        v16 = (std::__shared_weak_count *)p_pair1->_overlays.__tree_.__pair1_.__value_.__left_;
        if (v16)
        {
          v17 = std::__shared_weak_count::lock(v16);
          if (v17)
          {
            uint64_t v18 = v17;
            begin_node = p_pair1->_overlays.__tree_.__begin_node_;
            if (begin_node) {
              begin_node[64] = obj;
            }
            if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
        }
      }
    }
    [(VKGlobeLineContainer *)self _updateRouteSplit];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained lineContainerNeedsDisplay:self];
  }
}

- (void)clearLineSkip
{
  unint64_t v13 = off_1EF559738;
  id v14 = 0;
  int obj = self->_skippedPolyline._obj;
  self->_skippedPolyline._int obj = 0;

  id v4 = v14;
  id v14 = 0;

  unint64_t v13 = off_1EF559738;
  begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    do
    {
      unint64_t v13 = off_1EF559738;
      id v14 = begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      BOOL v15 = begin_node->_overlays.__tree_.__begin_node_;
      v16 = left;
      if (left) {
        atomic_fetch_add_explicit(&left->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      BOOL v11 = off_1EF559738;
      id v12 = v14;
      [(VKGlobeLineContainer *)self setSkipped:&v11 skipped:0];
      BOOL v11 = off_1EF559738;

      if (v16) {
        std::__shared_weak_count::__release_weak(v16);
      }
      unint64_t v13 = off_1EF559738;

      routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)begin_node->_skippedRouteLineSplitAnnotation;
          BOOL v9 = skippedRouteLineSplitAnnotation->super.isa == (Class)begin_node;
          begin_node = skippedRouteLineSplitAnnotation;
        }
        while (!v9);
      }
      begin_node = skippedRouteLineSplitAnnotation;
    }
    while (skippedRouteLineSplitAnnotation != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained lineContainerNeedsDisplay:self];
}

- (void)clearLineSelection
{
  unint64_t v13 = off_1EF559738;
  id v14 = 0;
  int obj = self->_selectedPolyline._obj;
  self->_selectedPolyline._int obj = 0;

  id v4 = v14;
  id v14 = 0;

  unint64_t v13 = off_1EF559738;
  begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    do
    {
      unint64_t v13 = off_1EF559738;
      id v14 = begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      BOOL v15 = begin_node->_overlays.__tree_.__begin_node_;
      v16 = left;
      if (left) {
        atomic_fetch_add_explicit(&left->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      BOOL v11 = off_1EF559738;
      id v12 = v14;
      [(VKGlobeLineContainer *)self setSelected:&v11 selected:0];
      BOOL v11 = off_1EF559738;

      if (v16) {
        std::__shared_weak_count::__release_weak(v16);
      }
      unint64_t v13 = off_1EF559738;

      routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer *)begin_node->_skippedRouteLineSplitAnnotation;
          BOOL v9 = skippedRouteLineSplitAnnotation->super.isa == (Class)begin_node;
          begin_node = skippedRouteLineSplitAnnotation;
        }
        while (!v9);
      }
      begin_node = skippedRouteLineSplitAnnotation;
    }
    while (skippedRouteLineSplitAnnotation != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained lineContainerNeedsDisplay:self];
}

- (void)removeLine:(_retain_ptr<VKPolylineOverlay *)
{
  left = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    id v5 = (void *)*((void *)a3._vptr$_retain_ptr + 1);
    p_pair1 = (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_;
    do
    {
      id v7 = left->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      BOOL v8 = v7 >= v5;
      if (v7 >= v5) {
        p_routeLineSplitAnnotation = (VKGlobeLineContainer **)left;
      }
      else {
        p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&left->_routeLineSplitAnnotation;
      }
      if (v8) {
        p_pair1 = left;
      }
      left = *p_routeLineSplitAnnotation;
    }
    while (*p_routeLineSplitAnnotation);
    if (p_pair1 != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_
      && v5 >= p_pair1->_retainedOverlays.__tree_.__pair1_.__value_.__left_)
    {
      routeRenderLayer = self->_routeRenderLayer;
      BOOL v11 = (std::__shared_weak_count *)p_pair1->_overlays.__tree_.__pair1_.__value_.__left_;
      if (v11)
      {
        id v12 = std::__shared_weak_count::lock(v11);
        if (v12)
        {
          uint64_t begin_node = (uint64_t)p_pair1->_overlays.__tree_.__begin_node_;
          goto LABEL_17;
        }
      }
      else
      {
        id v12 = 0;
      }
      uint64_t begin_node = 0;
LABEL_17:
      md::realistic::RouteRenderLayer::removeRouteData(routeRenderLayer, begin_node);
      if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
      routeLineSplitAnnotation = p_pair1->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        v16 = p_pair1;
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)v16->_skippedRouteLineSplitAnnotation;
          BOOL v17 = *skippedRouteLineSplitAnnotation == v16;
          v16 = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
        }
        while (!v17);
      }
      if (self->_polylinesToRoutes.__tree_.__begin_node_ == p_pair1) {
        self->_polylinesToRoutes.__tree_.__begin_node_ = skippedRouteLineSplitAnnotation;
      }
      uint64_t v18 = (uint64_t *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_;
      --self->_polylinesToRoutes.__tree_.__pair3_.__value_;
      std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v18, (uint64_t *)p_pair1);
      v19 = (std::__shared_weak_count *)p_pair1->_overlays.__tree_.__pair1_.__value_.__left_;
      if (v19) {
        std::__shared_weak_count::__release_weak(v19);
      }
      p_pair1->_retainedOverlays.__tree_.__begin_node_ = off_1EF559738;

      operator delete(p_pair1);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained lineContainerNeedsDisplay:self];
}

- (void)addLine:(_retain_ptr<VKPolylineOverlay *)
{
}

- (const)nonPersistentOverlays
{
  return &self->_nonPersistentOverlays;
}

- (const)persistentOverlays
{
  return &self->_persistentOverlays;
}

- (const)overlays
{
  return &self->_overlays;
}

- (void)removeNonPersistentOverlay:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    left = (uint64_t *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_;
    id v5 = v15;
    if (left)
    {
      p_pair1 = (VKGlobeLineContainer *)&self->_nonPersistentOverlays.__tree_.__pair1_;
      id v7 = (VKGlobeLineContainer *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_;
      do
      {
        unint64_t begin_node = (unint64_t)v7->_retainedOverlays.__tree_.__begin_node_;
        BOOL v9 = begin_node >= (unint64_t)v15;
        if (begin_node >= (unint64_t)v15) {
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)v7;
        }
        else {
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&v7->_routeLineSplitAnnotation;
        }
        if (v9) {
          p_pair1 = v7;
        }
        id v7 = *p_routeLineSplitAnnotation;
      }
      while (*p_routeLineSplitAnnotation);
      if (p_pair1 != (VKGlobeLineContainer *)&self->_nonPersistentOverlays.__tree_.__pair1_
        && p_pair1->_retainedOverlays.__tree_.__begin_node_ <= v15)
      {
        routeLineSplitAnnotation = p_pair1->_routeLineSplitAnnotation;
        if (routeLineSplitAnnotation)
        {
          do
          {
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)routeLineSplitAnnotation;
            routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
          }
          while (routeLineSplitAnnotation);
        }
        else
        {
          unint64_t v13 = p_pair1;
          do
          {
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)v13->_skippedRouteLineSplitAnnotation;
            BOOL v14 = *skippedRouteLineSplitAnnotation == v13;
            unint64_t v13 = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
          }
          while (!v14);
        }
        if (self->_nonPersistentOverlays.__tree_.__begin_node_ == p_pair1) {
          self->_nonPersistentOverlays.__tree_.__begin_node_ = skippedRouteLineSplitAnnotation;
        }
        --self->_nonPersistentOverlays.__tree_.__pair3_.__value_;
        std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, (uint64_t *)p_pair1);
        operator delete(p_pair1);
        id v5 = v15;
      }
    }
    [(VKGlobeLineContainer *)self _removeOverlay:v5];
  }
}

- (void)removePersistentOverlay:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    left = (uint64_t *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_;
    id v5 = v15;
    if (left)
    {
      p_pair1 = (VKGlobeLineContainer *)&self->_persistentOverlays.__tree_.__pair1_;
      id v7 = (VKGlobeLineContainer *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_;
      do
      {
        unint64_t begin_node = (unint64_t)v7->_retainedOverlays.__tree_.__begin_node_;
        BOOL v9 = begin_node >= (unint64_t)v15;
        if (begin_node >= (unint64_t)v15) {
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)v7;
        }
        else {
          p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&v7->_routeLineSplitAnnotation;
        }
        if (v9) {
          p_pair1 = v7;
        }
        id v7 = *p_routeLineSplitAnnotation;
      }
      while (*p_routeLineSplitAnnotation);
      if (p_pair1 != (VKGlobeLineContainer *)&self->_persistentOverlays.__tree_.__pair1_
        && p_pair1->_retainedOverlays.__tree_.__begin_node_ <= v15)
      {
        routeLineSplitAnnotation = p_pair1->_routeLineSplitAnnotation;
        if (routeLineSplitAnnotation)
        {
          do
          {
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)routeLineSplitAnnotation;
            routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
          }
          while (routeLineSplitAnnotation);
        }
        else
        {
          unint64_t v13 = p_pair1;
          do
          {
            skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)v13->_skippedRouteLineSplitAnnotation;
            BOOL v14 = *skippedRouteLineSplitAnnotation == v13;
            unint64_t v13 = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
          }
          while (!v14);
        }
        if (self->_persistentOverlays.__tree_.__begin_node_ == p_pair1) {
          self->_persistentOverlays.__tree_.__begin_node_ = skippedRouteLineSplitAnnotation;
        }
        --self->_persistentOverlays.__tree_.__pair3_.__value_;
        std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, (uint64_t *)p_pair1);
        operator delete(p_pair1);
        id v5 = v15;
      }
    }
    [(VKGlobeLineContainer *)self _removeOverlay:v5];
  }
}

- (BOOL)hasPersistentOverlay:(id)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_persistentOverlays.__tree_.__pair1_;
  id v4 = left;
  if (!left) {
    goto LABEL_12;
  }
  id v6 = p_pair1;
  do
  {
    unint64_t v7 = (unint64_t)v4[4].__value_.__left_;
    BOOL v8 = v7 >= (unint64_t)a3;
    if (v7 >= (unint64_t)a3) {
      BOOL v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **)v4;
    }
    else {
      BOOL v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **)&v4[1];
    }
    if (v8) {
      id v6 = v4;
    }
    id v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || v6[4].__value_.__left_ > a3) {
LABEL_12:
  }
    id v6 = p_pair1;
  return v6 != p_pair1;
}

- (BOOL)hasNonPersistentOverlay:(id)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_nonPersistentOverlays.__tree_.__pair1_;
  id v4 = left;
  if (!left) {
    goto LABEL_12;
  }
  id v6 = p_pair1;
  do
  {
    unint64_t v7 = (unint64_t)v4[4].__value_.__left_;
    BOOL v8 = v7 >= (unint64_t)a3;
    if (v7 >= (unint64_t)a3) {
      BOOL v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **)v4;
    }
    else {
      BOOL v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> **)&v4[1];
    }
    if (v8) {
      id v6 = v4;
    }
    id v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || v6[4].__value_.__left_ > a3) {
LABEL_12:
  }
    id v6 = p_pair1;
  return v6 != p_pair1;
}

- (void)_removeOverlay:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = [v5 polylines];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(id *)(*((void *)&v32 + 1) + 8 * i);
          id v30 = off_1EF559738;
          id v31 = v10;
          [(VKGlobeLineContainer *)self removeLine:&v30];
          id v30 = off_1EF559738;
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v7);
    }
  }
  left = (uint64_t *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = (VKGlobeLineContainer *)&self->_retainedOverlays.__tree_.__pair1_;
    unint64_t v13 = (VKGlobeLineContainer *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
    do
    {
      unint64_t begin_node = (unint64_t)v13->_retainedOverlays.__tree_.__begin_node_;
      BOOL v15 = begin_node >= (unint64_t)v4;
      if (begin_node >= (unint64_t)v4) {
        p_routeLineSplitAnnotation = (VKGlobeLineContainer **)v13;
      }
      else {
        p_routeLineSplitAnnotation = (VKGlobeLineContainer **)&v13->_routeLineSplitAnnotation;
      }
      if (v15) {
        p_pair1 = v13;
      }
      unint64_t v13 = *p_routeLineSplitAnnotation;
    }
    while (*p_routeLineSplitAnnotation);
    if (p_pair1 != (VKGlobeLineContainer *)&self->_retainedOverlays.__tree_.__pair1_
      && p_pair1->_retainedOverlays.__tree_.__begin_node_ <= v4)
    {
      routeLineSplitAnnotation = p_pair1->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        v19 = p_pair1;
        do
        {
          skippedRouteLineSplitAnnotation = (VKGlobeLineContainer **)v19->_skippedRouteLineSplitAnnotation;
          BOOL v20 = *skippedRouteLineSplitAnnotation == v19;
          v19 = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
        }
        while (!v20);
      }
      if (self->_retainedOverlays.__tree_.__begin_node_ == p_pair1) {
        self->_retainedOverlays.__tree_.__begin_node_ = skippedRouteLineSplitAnnotation;
      }
      --self->_retainedOverlays.__tree_.__pair3_.__value_;
      std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, (uint64_t *)p_pair1);

      operator delete(p_pair1);
    }
  }
  unint64_t v21 = (uint64_t *)self->_overlays.__tree_.__pair1_.__value_.__left_;
  if (v21)
  {
    uint64_t v22 = (VKGlobeLineContainer *)&self->_overlays.__tree_.__pair1_;
    uint64_t v23 = (VKGlobeLineContainer *)self->_overlays.__tree_.__pair1_.__value_.__left_;
    do
    {
      unint64_t v24 = (unint64_t)v23->_retainedOverlays.__tree_.__begin_node_;
      BOOL v25 = v24 >= (unint64_t)v4;
      if (v24 >= (unint64_t)v4) {
        id v26 = (VKGlobeLineContainer **)v23;
      }
      else {
        id v26 = (VKGlobeLineContainer **)&v23->_routeLineSplitAnnotation;
      }
      if (v25) {
        uint64_t v22 = v23;
      }
      uint64_t v23 = *v26;
    }
    while (*v26);
    if (v22 != (VKGlobeLineContainer *)&self->_overlays.__tree_.__pair1_
      && v22->_retainedOverlays.__tree_.__begin_node_ <= v4)
    {
      unint64_t v27 = v22->_routeLineSplitAnnotation;
      if (v27)
      {
        do
        {
          unint64_t v28 = (VKGlobeLineContainer **)v27;
          unint64_t v27 = *(VKRouteMatchedAnnotationPresentation **)v27;
        }
        while (v27);
      }
      else
      {
        v29 = v22;
        do
        {
          unint64_t v28 = (VKGlobeLineContainer **)v29->_skippedRouteLineSplitAnnotation;
          BOOL v20 = *v28 == v29;
          v29 = (VKGlobeLineContainer *)v28;
        }
        while (!v20);
      }
      if (self->_overlays.__tree_.__begin_node_ == v22) {
        self->_overlays.__tree_.__begin_node_ = v28;
      }
      --self->_overlays.__tree_.__pair3_.__value_;
      std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v21, (uint64_t *)v22);
      operator delete(v22);
    }
  }
}

- (void)addNonPersistentOverlay:(id)a3
{
  id v11 = a3;
  p_pair1 = &self->_nonPersistentOverlays.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    id v6 = v11;
    while (1)
    {
      while (1)
      {
        uint64_t v7 = left;
        unint64_t v8 = (unint64_t)left[4].__value_.__left_;
        if (v8 <= (unint64_t)v11) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v7->__value_.__left_;
        p_pair1 = v7;
        if (!v7->__value_.__left_) {
          goto LABEL_9;
        }
      }
      if (v8 >= (unint64_t)v11) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v7[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v7 = &self->_nonPersistentOverlays.__tree_.__pair1_;
LABEL_9:
    BOOL v9 = (uint64_t *)operator new(0x28uLL);
    v9[4] = (uint64_t)v11;
    uint64_t *v9 = 0;
    v9[1] = 0;
    v9[2] = (uint64_t)v7;
    p_pair1->__value_.__left_ = v9;
    id v10 = *(void **)self->_nonPersistentOverlays.__tree_.__begin_node_;
    if (v10)
    {
      self->_nonPersistentOverlays.__tree_.__begin_node_ = v10;
      BOOL v9 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_nonPersistentOverlays.__tree_.__pair1_.__value_.__left_, v9);
    ++self->_nonPersistentOverlays.__tree_.__pair3_.__value_;
    id v6 = v11;
  }
  [(VKGlobeLineContainer *)self _addOverlay:v6];
}

- (void)addPersistentOverlay:(id)a3
{
  id v11 = a3;
  p_pair1 = &self->_persistentOverlays.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    id v6 = v11;
    while (1)
    {
      while (1)
      {
        uint64_t v7 = left;
        unint64_t v8 = (unint64_t)left[4].__value_.__left_;
        if (v8 <= (unint64_t)v11) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v7->__value_.__left_;
        p_pair1 = v7;
        if (!v7->__value_.__left_) {
          goto LABEL_9;
        }
      }
      if (v8 >= (unint64_t)v11) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v7[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v7 = &self->_persistentOverlays.__tree_.__pair1_;
LABEL_9:
    BOOL v9 = (uint64_t *)operator new(0x28uLL);
    v9[4] = (uint64_t)v11;
    uint64_t *v9 = 0;
    v9[1] = 0;
    v9[2] = (uint64_t)v7;
    p_pair1->__value_.__left_ = v9;
    id v10 = *(void **)self->_persistentOverlays.__tree_.__begin_node_;
    if (v10)
    {
      self->_persistentOverlays.__tree_.__begin_node_ = v10;
      BOOL v9 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_persistentOverlays.__tree_.__pair1_.__value_.__left_, v9);
    ++self->_persistentOverlays.__tree_.__pair3_.__value_;
    id v6 = v11;
  }
  [(VKGlobeLineContainer *)self _addOverlay:v6];
}

- (void)_addOverlay:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  p_pair1 = &self->_retainedOverlays.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<id<VKRouteOverlay>, void *>>> *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        unint64_t v8 = left;
        unint64_t v9 = (unint64_t)left[4].__value_.__left_;
        if (v9 <= (unint64_t)v4) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<id<VKRouteOverlay>, void *>>> *)v8->__value_.__left_;
        p_pair1 = v8;
        if (!v8->__value_.__left_) {
          goto LABEL_8;
        }
      }
      if (v9 >= (unint64_t)v4) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<id<VKRouteOverlay>, void *>>> *)v8[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v8 + 1;
        goto LABEL_8;
      }
    }
  }
  else
  {
    unint64_t v8 = &self->_retainedOverlays.__tree_.__pair1_;
LABEL_8:
    id v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = (uint64_t)v5;
    uint64_t *v10 = 0;
    v10[1] = 0;
    v10[2] = (uint64_t)v8;
    p_pair1->__value_.__left_ = v10;
    id v11 = *(void **)self->_retainedOverlays.__tree_.__begin_node_;
    if (v11)
    {
      self->_retainedOverlays.__tree_.__begin_node_ = v11;
      id v10 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_retainedOverlays.__tree_.__pair1_.__value_.__left_, v10);
    ++self->_retainedOverlays.__tree_.__pair3_.__value_;
  }
  unint64_t v13 = &self->_overlays.__tree_.__pair1_;
  id v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)self->_overlays.__tree_.__pair1_.__value_.__left_;
  if (v12)
  {
    while (1)
    {
      while (1)
      {
        BOOL v14 = v12;
        unint64_t v15 = (unint64_t)v12[4].__value_.__left_;
        if (v15 <= (unint64_t)v5) {
          break;
        }
        id v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v14->__value_.__left_;
        unint64_t v13 = v14;
        if (!v14->__value_.__left_) {
          goto LABEL_18;
        }
      }
      if (v15 >= (unint64_t)v5) {
        break;
      }
      id v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<__unsafe_unretained id<VKRouteOverlay>, void *>>> *)v14[1].__value_.__left_;
      if (!v12)
      {
        unint64_t v13 = v14 + 1;
        goto LABEL_18;
      }
    }
  }
  else
  {
    BOOL v14 = &self->_overlays.__tree_.__pair1_;
LABEL_18:
    v16 = (uint64_t *)operator new(0x28uLL);
    v16[4] = (uint64_t)v5;
    uint64_t *v16 = 0;
    v16[1] = 0;
    v16[2] = (uint64_t)v14;
    v13->__value_.__left_ = v16;
    BOOL v17 = *(void **)self->_overlays.__tree_.__begin_node_;
    if (v17)
    {
      self->_overlays.__tree_.__begin_node_ = v17;
      v16 = (uint64_t *)v13->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_overlays.__tree_.__pair1_.__value_.__left_, v16);
    ++self->_overlays.__tree_.__pair3_.__value_;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v5;
      v19 = [v18 selectedPolyline];
      long long v34 = off_1EF559738;
      long long v35 = v19;
      int obj = self->_selectedPolyline._obj;
      self->_selectedPolyline._int obj = v19;
      unint64_t v21 = v19;

      uint64_t v22 = v35;
      long long v35 = 0;

      long long v34 = off_1EF559738;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v23 = [v18 polylines];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v31 != v25) {
              objc_enumerationMutation(v23);
            }
            id v27 = *(id *)(*((void *)&v30 + 1) + 8 * i);
            unint64_t v28 = off_1EF559738;
            id v29 = v27;
            [(VKGlobeLineContainer *)self addLine:&v28];
            unint64_t v28 = off_1EF559738;
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v24);
      }
    }
  }
}

- (void)dealloc
{
  unint64_t begin_node = (VKGlobeLineContainer *)self->_polylinesToRoutes.__tree_.__begin_node_;
  p_pair1 = &self->_polylinesToRoutes.__tree_.__pair1_;
  if (begin_node != (VKGlobeLineContainer *)&self->_polylinesToRoutes.__tree_.__pair1_)
  {
    while (1)
    {
      v19 = off_1EF559738;
      id v20 = begin_node->_retainedOverlays.__tree_.__pair1_.__value_.__left_;
      left = (std::__shared_weak_count *)begin_node->_overlays.__tree_.__pair1_.__value_.__left_;
      unint64_t v21 = begin_node->_overlays.__tree_.__begin_node_;
      uint64_t v22 = left;
      if (left)
      {
        atomic_fetch_add_explicit(&left->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        routeRenderLayer = self->_routeRenderLayer;
        BOOL v17 = 0;
        uint64_t v7 = std::__shared_weak_count::lock(v22);
        id v18 = v7;
        if (v7)
        {
          uint64_t v8 = (uint64_t)v21;
          BOOL v17 = v21;
        }
        else
        {
          uint64_t v8 = 0;
        }
      }
      else
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        routeRenderLayer = self->_routeRenderLayer;
        BOOL v17 = 0;
        id v18 = 0;
      }
      md::realistic::RouteRenderLayer::removeRouteData(routeRenderLayer, v8);
      if (v7)
      {
        if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      unint64_t v9 = v22;
      if (v22) {
        goto LABEL_12;
      }
LABEL_13:
      v19 = off_1EF559738;

      routeLineSplitAnnotation = begin_node->_routeLineSplitAnnotation;
      if (routeLineSplitAnnotation)
      {
        do
        {
          skippedRouteLineSplitAnnotation = routeLineSplitAnnotation;
          routeLineSplitAnnotation = *(VKRouteMatchedAnnotationPresentation **)routeLineSplitAnnotation;
        }
        while (routeLineSplitAnnotation);
      }
      else
      {
        do
        {
          skippedRouteLineSplitAnnotation = begin_node->_skippedRouteLineSplitAnnotation;
          BOOL v12 = *(void *)skippedRouteLineSplitAnnotation == (void)begin_node;
          unint64_t begin_node = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
        }
        while (!v12);
      }
      unint64_t begin_node = (VKGlobeLineContainer *)skippedRouteLineSplitAnnotation;
      if (skippedRouteLineSplitAnnotation == (VKRouteMatchedAnnotationPresentation *)p_pair1) {
        goto LABEL_21;
      }
    }
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    unint64_t v9 = v22;
    if (!v22) {
      goto LABEL_13;
    }
LABEL_12:
    std::__shared_weak_count::__release_weak(v9);
    goto LABEL_13;
  }
LABEL_21:
  std::__tree<std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>,std::__map_value_compare<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>,std::less<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__value_type<geo::_retain_ptr<VKPolylineOverlay * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::weak_ptr<altitude::RouteLineData>>>>::destroy((void *)self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_);
  self->_polylinesToRoutes.__tree_.__pair1_.__value_.__left_ = 0;
  self->_polylinesToRoutes.__tree_.__pair3_.__value_ = 0;
  self->_polylinesToRoutes.__tree_.__begin_node_ = p_pair1;
  routeSplit = self->_routeSplit;
  if (routeSplit) {
    (*((void (**)(VKGlobeRouteSplit *))routeSplit->var0 + 1))(routeSplit);
  }
  skippedRouteSplit = self->_skippedRouteSplit;
  if (skippedRouteSplit) {
    (*((void (**)(VKGlobeRouteSplit *))skippedRouteSplit->var0 + 1))(skippedRouteSplit);
  }
  unint64_t v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v15 removeObserver:self forKeyPath:@"RouteArrowMinZoom"];

  v16.receiver = self;
  v16.super_class = (Class)VKGlobeLineContainer;
  [(VKGlobeLineContainer *)&v16 dealloc];
}

- (VKGlobeLineContainer)initWithRouteRenderLayer:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VKGlobeLineContainer;
  id v4 = [(VKGlobeLineContainer *)&v6 init];
  if (v4)
  {
    v4->_routeRenderLayer = a3;
    operator new();
  }
  return 0;
}

@end