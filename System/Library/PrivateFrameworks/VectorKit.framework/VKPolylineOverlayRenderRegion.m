@interface VKPolylineOverlayRenderRegion
- (BOOL)isEquivalentToNewRegion:(id)a3;
- (Box<double,)visibleRect;
- (const)routeLineDatas;
- (const)snappingRegion;
- (id).cxx_construct;
- (id)initForVisibleRect:(const void *)a3 snappingRegion:(const void *)a4 routeLineDatas:(const void *)a5;
@end

@implementation VKPolylineOverlayRenderRegion

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 10) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 8) = (char *)self + 72;
  *(int64x2_t *)((char *)self + 88) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)((char *)self + 104) = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  return self;
}

- (void).cxx_destruct
{
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((void *)self->_snappingRegion._rects.__tree_.__pair1_.__value_.__left_);
  left = self->_routeLineDatas.__tree_.__pair1_.__value_.__left_;
  std::__tree<gdc::LayerDataWithWorld>::destroy(left);
}

- (Box<double,)visibleRect
{
  double v2 = self->_visibleRect._minimum._e[0];
  double v3 = self->_visibleRect._minimum._e[1];
  double v4 = self->_visibleRect._maximum._e[0];
  double v5 = self->_visibleRect._maximum._e[1];
  result._maximum._e[1] = v5;
  result._maximum._e[0] = v4;
  result._minimum._e[1] = v3;
  result._minimum._e[0] = v2;
  return result;
}

- (const)routeLineDatas
{
  return &self->_routeLineDatas;
}

- (BOOL)isEquivalentToNewRegion:(id)a3
{
  double v4 = (double *)a3;
  if (v4[4] < self->_visibleRect._minimum._e[0]
    || v4[6] > self->_visibleRect._maximum._e[0]
    || v4[5] < self->_visibleRect._minimum._e[1]
    || v4[7] > self->_visibleRect._maximum._e[1]
    || self->_snappingRegion._rects.__tree_.__pair3_.__value_ != *((void *)v4 + 10))
  {
    goto LABEL_57;
  }
  begin_node = (VKPolylineOverlayRenderRegion *)self->_snappingRegion._rects.__tree_.__begin_node_;
  p_pair1 = &self->_snappingRegion._rects.__tree_.__pair1_;
  if (begin_node == (VKPolylineOverlayRenderRegion *)&self->_snappingRegion._rects.__tree_.__pair1_)
  {
    BOOL v7 = 1;
    goto LABEL_58;
  }
  BOOL v7 = 1;
  do
  {
    if (!*((void *)v4 + 9)) {
      goto LABEL_57;
    }
    double v8 = begin_node->_visibleRect._minimum._e[0];
    double v9 = begin_node->_visibleRect._minimum._e[1];
    double v10 = begin_node->_visibleRect._maximum._e[0] - v8;
    double v11 = begin_node->_visibleRect._maximum._e[1] - v9;
    double v12 = v11 * v10;
    double v13 = v8 + v10 * 0.5;
    double v14 = v9 + v11 * 0.5;
    v15 = v4 + 9;
    v16 = (double *)*((void *)v4 + 9);
    do
    {
      while (1)
      {
        BOOL v17 = *((void *)v16 + 4) == *(void *)&begin_node->_visibleRect._minimum._e[0]
           && *((void *)v16 + 5) == *(void *)&begin_node->_visibleRect._minimum._e[1];
        if (v17
          && *((void *)v16 + 6) == *(void *)&begin_node->_visibleRect._maximum._e[0]
          && *((void *)v16 + 7) == *(void *)&begin_node->_visibleRect._maximum._e[1])
        {
          goto LABEL_11;
        }
        double v20 = v16[4];
        double v19 = v16[5];
        double v21 = v16[6] - v20;
        double v22 = v16[7] - v19;
        BOOL v23 = v22 * v21 <= v12;
        if (v22 * v21 != v12) {
          break;
        }
        double v24 = v20 + v21 * 0.5;
        BOOL v25 = v24 < v13;
        if (v24 == v13)
        {
          double v26 = v19 + v22 * 0.5;
          BOOL v25 = v26 < v14;
          if (v26 == v14)
          {
            BOOL v23 = v21 <= v10;
            if (v21 == v10) {
              BOOL v23 = v22 <= v11;
            }
            break;
          }
        }
        if (v25) {
          goto LABEL_13;
        }
LABEL_11:
        v15 = v16;
        v16 = *(double **)v16;
        if (!v16) {
          goto LABEL_33;
        }
      }
      if (v23) {
        goto LABEL_11;
      }
LABEL_13:
      v16 = (double *)*((void *)v16 + 1);
    }
    while (v16);
LABEL_33:
    if (v4 + 9 == v15) {
      goto LABEL_57;
    }
    BOOL v27 = *(void *)&begin_node->_visibleRect._minimum._e[0] == *((void *)v15 + 4)
       && *(void *)&begin_node->_visibleRect._minimum._e[1] == *((void *)v15 + 5);
    if (!v27
      || (*(void *)&begin_node->_visibleRect._maximum._e[0] == *((void *)v15 + 6)
        ? (BOOL v28 = *(void *)&begin_node->_visibleRect._maximum._e[1] == *((void *)v15 + 7))
        : (BOOL v28 = 0),
          !v28))
    {
      double v30 = v15[4];
      double v29 = v15[5];
      double v31 = v15[6] - v30;
      double v32 = v15[7] - v29;
      BOOL v33 = v12 <= v32 * v31;
      if (v12 != v32 * v31) {
        goto LABEL_48;
      }
      double v34 = v30 + v31 * 0.5;
      BOOL v35 = v13 < v34;
      if (v13 == v34 && (v36 = v29 + v32 * 0.5, BOOL v35 = v14 < v36, v14 == v36))
      {
        BOOL v33 = v10 <= v31;
        if (v10 == v31) {
          BOOL v33 = v11 <= v32;
        }
LABEL_48:
        if (!v33)
        {
LABEL_57:
          BOOL v7 = 0;
          break;
        }
      }
      else if (v35)
      {
        goto LABEL_57;
      }
    }
    isa = (VKPolylineOverlayRenderRegion *)begin_node->_routeLineDatas.__tree_.__begin_node_;
    if (isa)
    {
      do
      {
        left = isa;
        isa = (VKPolylineOverlayRenderRegion *)isa->super.isa;
      }
      while (isa);
    }
    else
    {
      do
      {
        left = (VKPolylineOverlayRenderRegion *)begin_node->_routeLineDatas.__tree_.__pair1_.__value_.__left_;
        BOOL v17 = left->super.isa == (Class)begin_node;
        begin_node = left;
      }
      while (!v17);
    }
    begin_node = left;
  }
  while (left != (VKPolylineOverlayRenderRegion *)p_pair1);
LABEL_58:

  return v7;
}

- (const)snappingRegion
{
  return &self->_snappingRegion;
}

- (id)initForVisibleRect:(const void *)a3 snappingRegion:(const void *)a4 routeLineDatas:(const void *)a5
{
  v47.receiver = self;
  v47.super_class = (Class)VKPolylineOverlayRenderRegion;
  double v8 = [(VKPolylineOverlayRenderRegion *)&v47 init];
  double v9 = (uint64_t **)v8;
  if (v8)
  {
    *((void *)v8 + 4) = *(void *)a3;
    *((void *)v8 + 5) = *((void *)a3 + 1);
    *((void *)v8 + 6) = *((void *)a3 + 2);
    *((void *)v8 + 7) = *((void *)a3 + 3);
    double v10 = (void **)(v8 + 8);
    if (v8 + 8 != a5)
    {
      double v13 = *(char **)a5;
      double v11 = (char *)a5 + 8;
      double v12 = v13;
      if (!*((void *)v8 + 3)) {
        goto LABEL_48;
      }
      v15 = (uint64_t **)(v8 + 16);
      uint64_t v14 = *((void *)v8 + 2);
      uint64_t v16 = *((void *)v8 + 1);
      *((void *)v8 + 1) = v8 + 16;
      *(void *)(v14 + 16) = 0;
      *((void *)v8 + 2) = 0;
      *((void *)v8 + 3) = 0;
      BOOL v17 = *(void *)(v16 + 8) ? *(uint64_t **)(v16 + 8) : (uint64_t *)v16;
      if (v17)
      {
        v18 = (uint64_t *)v17[2];
        if (v18)
        {
          double v19 = (uint64_t *)*v18;
          if ((uint64_t *)*v18 == v17)
          {
            uint64_t *v18 = 0;
            while (1)
            {
              v46 = (uint64_t *)v18[1];
              if (!v46) {
                break;
              }
              do
              {
                v18 = v46;
                v46 = (uint64_t *)*v46;
              }
              while (v46);
            }
          }
          else
          {
            for (v18[1] = 0; v19; double v19 = (uint64_t *)v18[1])
            {
              do
              {
                v18 = v19;
                double v19 = (uint64_t *)*v19;
              }
              while (v19);
            }
          }
        }
        if (v12 == v11)
        {
          double v29 = v12;
          double v20 = v17;
        }
        else
        {
          do
          {
            double v20 = v18;
            uint64_t v22 = *((void *)v12 + 4);
            uint64_t v21 = *((void *)v12 + 5);
            if (v21) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v21 + 8), 1uLL, memory_order_relaxed);
            }
            BOOL v23 = (std::__shared_weak_count *)v17[5];
            v17[4] = v22;
            v17[5] = v21;
            if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
              std::__shared_weak_count::__release_weak(v23);
            }
            double v24 = *v15;
            BOOL v25 = v9 + 2;
            double v26 = v9 + 2;
            if (*v15)
            {
              do
              {
                while (1)
                {
                  BOOL v25 = (uint64_t **)v24;
                  if (v17[4] >= (unint64_t)v24[4]) {
                    break;
                  }
                  double v24 = (uint64_t *)*v24;
                  double v26 = v25;
                  if (!*v25) {
                    goto LABEL_26;
                  }
                }
                double v24 = (uint64_t *)v24[1];
              }
              while (v24);
              double v26 = v25 + 1;
            }
LABEL_26:
            *BOOL v17 = 0;
            v17[1] = 0;
            v17[2] = (uint64_t)v25;
            *double v26 = v17;
            BOOL v27 = (void *)**v10;
            if (v27)
            {
              *double v10 = v27;
              BOOL v17 = *v26;
            }
            std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v9[2], v17);
            v9[3] = (uint64_t *)((char *)v9[3] + 1);
            if (v20)
            {
              v18 = (uint64_t *)v20[2];
              if (v18)
              {
                double v31 = (uint64_t *)*v18;
                if ((uint64_t *)*v18 == v20)
                {
                  uint64_t *v18 = 0;
                  while (1)
                  {
                    double v32 = (uint64_t *)v18[1];
                    if (!v32) {
                      break;
                    }
                    do
                    {
                      v18 = v32;
                      double v32 = (uint64_t *)*v32;
                    }
                    while (v32);
                  }
                }
                else
                {
                  for (v18[1] = 0; v31; double v31 = (uint64_t *)v18[1])
                  {
                    do
                    {
                      v18 = v31;
                      double v31 = (uint64_t *)*v31;
                    }
                    while (v31);
                  }
                }
              }
            }
            else
            {
              v18 = 0;
            }
            BOOL v28 = (char *)*((void *)v12 + 1);
            if (v28)
            {
              do
              {
                double v29 = v28;
                BOOL v28 = *(char **)v28;
              }
              while (v28);
            }
            else
            {
              do
              {
                double v29 = (char *)*((void *)v12 + 2);
                BOOL v30 = *(void *)v29 == (void)v12;
                double v12 = v29;
              }
              while (!v30);
            }
            if (!v20) {
              break;
            }
            BOOL v17 = v20;
            double v12 = v29;
          }
          while (v29 != v11);
        }
        std::__tree<gdc::LayerDataWithWorld>::destroy(v20);
        if (v18)
        {
          for (i = (uint64_t *)v18[2]; i; i = (uint64_t *)i[2])
            v18 = i;
          std::__tree<gdc::LayerDataWithWorld>::destroy(v18);
        }
      }
      else
      {
LABEL_48:
        double v29 = v12;
      }
      if (v29 != v11)
      {
        double v34 = v9 + 2;
        do
        {
          BOOL v35 = (uint64_t *)operator new(0x30uLL);
          double v36 = v35;
          unint64_t v37 = *((void *)v29 + 4);
          uint64_t v38 = *((void *)v29 + 5);
          v35[4] = v37;
          v35[5] = v38;
          if (v38) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v38 + 8), 1uLL, memory_order_relaxed);
          }
          v39 = *v34;
          v40 = v9 + 2;
          v41 = v9 + 2;
          if (*v34)
          {
            do
            {
              while (1)
              {
                v40 = (uint64_t **)v39;
                if (v37 >= v39[4]) {
                  break;
                }
                v39 = (uint64_t *)*v39;
                v41 = v40;
                if (!*v40) {
                  goto LABEL_66;
                }
              }
              v39 = (uint64_t *)v39[1];
            }
            while (v39);
            v41 = v40 + 1;
          }
LABEL_66:
          *BOOL v35 = 0;
          v35[1] = 0;
          v35[2] = (uint64_t)v40;
          *v41 = v35;
          v42 = (void *)**v10;
          if (v42)
          {
            *double v10 = v42;
            double v36 = *v41;
          }
          std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v9[2], v36);
          v9[3] = (uint64_t *)((char *)v9[3] + 1);
          v43 = (char *)*((void *)v29 + 1);
          if (v43)
          {
            do
            {
              v44 = v43;
              v43 = *(char **)v43;
            }
            while (v43);
          }
          else
          {
            do
            {
              v44 = (char *)*((void *)v29 + 2);
              BOOL v30 = *(void *)v44 == (void)v29;
              double v29 = v44;
            }
            while (!v30);
          }
          double v29 = v44;
        }
        while (v44 != v11);
      }
    }
    if (v9 + 8 != a4) {
      std::__tree<gm::Box<double,2>,md::MultiRectSetCompare,std::allocator<gm::Box<double,2>>>::__assign_multi<std::__tree_const_iterator<gm::Box<double,2>,std::__tree_node<gm::Box<double,2>,void *> *,long>>(v9 + 8, *(double **)a4, (double *)a4 + 1);
    }
    v9[11] = (uint64_t *)*((void *)a4 + 3);
    v9[12] = (uint64_t *)*((void *)a4 + 4);
    v9[13] = (uint64_t *)*((void *)a4 + 5);
    v9[14] = (uint64_t *)*((void *)a4 + 6);
  }
  return v9;
}

@end