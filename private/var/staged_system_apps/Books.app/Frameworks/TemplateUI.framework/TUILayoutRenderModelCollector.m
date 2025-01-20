@interface TUILayoutRenderModelCollector
- (TUILayout)root;
- (TUILayoutRenderModelCollector)init;
- (id).cxx_construct;
- (id)finalizeImpressions;
- (id)finalizeLinkEntities;
- (id)hostingCollectorFinalizeMap;
- (void)collectWithRoot:(id)a3 options:(unint64_t)a4 entryUUID:(id)a5;
- (void)hostingCollectorAddProperties:(id)a3 forIdentifier:(id)a4;
@end

@implementation TUILayoutRenderModelCollector

- (TUILayoutRenderModelCollector)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUILayoutRenderModelCollector;
  id v2 = [(TUILayoutRenderModelCollector *)&v5 init];
  v3 = (TUILayoutRenderModelCollector *)v2;
  if (v2) {
    sub_7B1F4((uint64_t *)v2 + 2, 0x20uLL);
  }
  return v3;
}

- (void)collectWithRoot:(id)a3 options:(unint64_t)a4 entryUUID:(id)a5
{
  char v6 = a4;
  id v99 = a3;
  id v100 = a5;
  p_root = &self->_root;
  objc_storeStrong((id *)&self->_root, a3);
  p_stack = &self->_stack;
  sub_7BC5C((uint64_t)&self->_stack, (uint64_t)self->_stack.__begin_, (uint64_t *)self->_stack.__end_);
  if (self->_root)
  {
    v114 = *p_root;
    v10 = +[NSArray arrayWithObjects:&v114 count:1];
    id v11 = [v10 objectEnumerator];
    v12 = v11;
    value = self->_stack.__end_cap_.__value_;
    char options = (char)self->_options;
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v115[7] = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v115[23] = v15;
    *(_OWORD *)&v115[39] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    enCGFloat d = self->_stack.__end_;
    p_end_cap = &self->_stack.__end_cap_;
    if (end >= value)
    {
      unint64_t v18 = 0x8E38E38E38E38E39 * ((end - p_stack->__begin_) >> 3);
      unint64_t v19 = v18 + 1;
      if (v18 + 1 > 0x38E38E38E38E38ELL) {
        sub_4484();
      }
      unint64_t v20 = 0x8E38E38E38E38E39 * ((value - p_stack->__begin_) >> 3);
      if (2 * v20 > v19) {
        unint64_t v19 = 2 * v20;
      }
      unint64_t v21 = v20 >= 0x1C71C71C71C71C7 ? 0x38E38E38E38E38ELL : v19;
      *(void *)&v113.CGFloat tx = &self->_stack.__end_cap_;
      v22 = v21 ? (char *)sub_7BF34((uint64_t)&self->_stack.__end_cap_, v21) : 0;
      *(void *)&CGFloat v23 = &v22[72 * v18];
      *(void *)&v113.CGFloat a = v22;
      v113.CGFloat b = v23;
      *(void *)&v113.CGFloat d = &v22[72 * v21];
      **(void **)&CGFloat v23 = 0;
      *(void *)(*(void *)&v23 + 8) = v12;
      *(unsigned char *)(*(void *)&v23 + 16) = options;
      *(_OWORD *)(*(void *)&v23 + 17) = *(_OWORD *)v115;
      *(_OWORD *)(*(void *)&v23 + 33) = *(_OWORD *)&v115[16];
      *(_OWORD *)(*(void *)&v23 + 49) = *(_OWORD *)&v115[32];
      *(void *)(*(void *)&v23 + 64) = *(void *)&v115[47];
      *(void *)&v113.CGFloat c = *(void *)&v23 + 72;
      sub_7BEBC((uint64_t *)&self->_stack, &v113);
      v17 = self->_stack.__end_;
      sub_7C13C((uint64_t)&v113);
    }
    else
    {
      *(void *)enCGFloat d = 0;
      *((void *)end + 1) = v11;
      *((unsigned char *)end + 16) = options;
      *(_OWORD *)((char *)end + 17) = *(_OWORD *)v115;
      *(_OWORD *)((char *)end + 33) = *(_OWORD *)&v115[16];
      *(_OWORD *)((char *)end + 49) = *(_OWORD *)&v115[32];
      *((void *)end + 8) = *(void *)&v115[47];
      v17 = (StackEntry *)((char *)end + 72);
    }
    self->_stack.__end_ = v17;
    p_enCGFloat d = &self->_stack.__end_;

    *((unsigned char *)*p_end - 56) = *((unsigned char *)*p_end - 56) & 0xFE | v6 & 1;
    *((unsigned char *)*p_end - 56) = *((unsigned char *)*p_end - 56) & 0xFD | v6 & 2;
    *((unsigned char *)*p_end - 56) = *((unsigned char *)*p_end - 56) & 0xFB | v6 & 4;
    for (i = self->_stack.__end_; self->_stack.__begin_ != i; i = self->_stack.__end_)
    {
      v26 = [*((id *)i - 8) nextObject:p_end_cap, v99];
      v27 = v26;
      v28 = self->_stack.__end_;
      if (v26)
      {
        LOBYTE(v29) = *((unsigned char *)v28 - 56);
        if (([v26 hidden] & 1) == 0)
        {
          if (v29) {
            unsigned int v29 = v29 & 0xFE | [v27 collectHostingPropertiesWithCollector:self];
          }
          CGFloat a = CGAffineTransformIdentity.a;
          CGFloat b = CGAffineTransformIdentity.b;
          CGFloat c = CGAffineTransformIdentity.c;
          CGFloat d = CGAffineTransformIdentity.d;
          CGFloat tx = CGAffineTransformIdentity.tx;
          CGFloat ty = CGAffineTransformIdentity.ty;
          long long v36 = *(_OWORD *)&CGAffineTransformIdentity.c;
          *(_OWORD *)v115 = *(_OWORD *)&CGAffineTransformIdentity.a;
          *(_OWORD *)&v115[16] = v36;
          *(_OWORD *)&v115[32] = *(_OWORD *)&CGAffineTransformIdentity.tx;
          if ((v29 & 6) != 0)
          {
            v37 = self->_stack.__end_;
            CGAffineTransform v113 = *(CGAffineTransform *)((unsigned char *)v37 - 1);
            [*((id *)v37 - 9) computedNaturalSize];
            double v39 = v38;
            double v41 = v40;
            [v27 computedOrigin];
            double v43 = v42;
            double v45 = v44;
            [v27 computedTransformedSize];
            CGAffineTransformMakeTranslation(&t1, v43 + v46 * 0.5 - v39 * 0.5, v45 + v47 * 0.5 - v41 * 0.5);
            CGAffineTransform t2 = v113;
            CGAffineTransformConcat(&v112, &t1, &t2);
            CGFloat v48 = v112.a;
            CGFloat v49 = v112.b;
            CGFloat v50 = v112.c;
            CGFloat v51 = v112.d;
            CGFloat v52 = v112.tx;
            CGFloat v53 = v112.ty;
            [v27 computedTransform];
            v108.CGFloat a = v48;
            v108.CGFloat b = v49;
            v108.CGFloat c = v50;
            v108.CGFloat d = v51;
            v108.CGFloat tx = v52;
            v108.CGFloat ty = v53;
            CGAffineTransformConcat(&v112, &v109, &v108);
            CGFloat v54 = v112.a;
            CGFloat v55 = v112.b;
            CGFloat v56 = v112.c;
            CGFloat v57 = v112.d;
            CGFloat v58 = v112.tx;
            CGFloat v59 = v112.ty;
            [v27 renderTransform];
            v106.CGFloat a = v54;
            v106.CGFloat b = v55;
            v106.CGFloat c = v56;
            v106.CGFloat d = v57;
            v106.CGFloat tx = v58;
            v106.CGFloat ty = v59;
            CGAffineTransformConcat(&v112, &v107, &v106);
            CGFloat a = v112.a;
            CGFloat b = v112.b;
            CGFloat c = v112.c;
            CGFloat d = v112.d;
            CGFloat tx = v112.tx;
            CGFloat ty = v112.ty;
            double y = CGPointZero.y;
            CGAffineTransform v105 = v112;
            CGAffineTransformMakeTranslation(&v104, -(v112.tx + v112.c * y + v112.a * CGPointZero.x), -(v112.ty + v112.d * y + v112.b * CGPointZero.x));
            CGAffineTransformConcat((CGAffineTransform *)v115, &v105, &v104);
            if ((v29 & 2) == 0) {
              goto LABEL_36;
            }
          }
          else if ((v29 & 2) == 0)
          {
LABEL_36:
            if ((v29 & 4) != 0)
            {
              id v70 = *((id *)self->_stack.__end_ - 9);
              v71 = v70;
              if (v70 && ([v70 collectLinkEntitiesForChild:v27] & 1) == 0)
              {
                LOBYTE(v29) = v29 & 0xFB;
              }
              else
              {

                v71 = [v27 collectLinkEntities];
                if (v71)
                {
                  v72 = [v27 box];
                  v73 = [v72 identifier];
                  v74 = [v73 tui_identifierByPrependingUUID:v100];

                  v75 = [TUILinkEntityAttributes alloc];
                  [v27 computedNaturalSize];
                  v102[0] = *(_OWORD *)v115;
                  v102[1] = *(_OWORD *)&v115[16];
                  v102[2] = *(_OWORD *)&v115[32];
                  v76 = -[TUILinkEntityAttributes initWithIdentifier:linkEntities:size:center:transform:](v75, "initWithIdentifier:linkEntities:size:center:transform:", v74, v71, v102);
                  linkEntities = self->_linkEntities;
                  if (!linkEntities)
                  {
                    v78 = (NSMutableArray *)objc_opt_new();
                    v79 = self->_linkEntities;
                    self->_linkEntities = v78;

                    linkEntities = self->_linkEntities;
                  }
                  [(NSMutableArray *)linkEntities addObject:v76];
                }
                if ([v27 collectLinkEntitiesForChildren]) {
                  char v80 = 4;
                }
                else {
                  char v80 = 0;
                }
                LOBYTE(v29) = v80 | v29 & 0xFB;
              }
            }
            v81 = [v27 children];
            v82 = v81;
            if ((v29 & 7) != 0 && [v81 count])
            {
              v83 = [v82 objectEnumerator];
              id v84 = v27;
              id v85 = v83;
              v86 = v85;
              v87 = self->_stack.__end_;
              v88 = self->_stack.__end_cap_.__value_;
              if (v87 >= v88)
              {
                unint64_t v90 = 0x8E38E38E38E38E39 * ((v87 - p_stack->__begin_) >> 3);
                unint64_t v91 = v90 + 1;
                if (v90 + 1 > 0x38E38E38E38E38ELL) {
                  sub_4484();
                }
                unint64_t v92 = 0x8E38E38E38E38E39 * ((v88 - p_stack->__begin_) >> 3);
                if (2 * v92 > v91) {
                  unint64_t v91 = 2 * v92;
                }
                if (v92 >= 0x1C71C71C71C71C7) {
                  unint64_t v93 = 0x38E38E38E38E38ELL;
                }
                else {
                  unint64_t v93 = v91;
                }
                *(void *)&v113.CGFloat tx = p_end_cap;
                v94 = (char *)sub_7BF34((uint64_t)p_end_cap, v93);
                *(void *)&CGFloat v95 = &v94[72 * v90];
                *(void *)&v113.CGFloat a = v94;
                v113.CGFloat b = v95;
                *(void *)&v113.CGFloat d = &v94[72 * v96];
                **(void **)&CGFloat v95 = v84;
                *(void *)(*(void *)&v95 + 8) = v86;
                *(unsigned char *)(*(void *)&v95 + 16) = v29;
                *(CGFloat *)(*(void *)&v95 + 24) = a;
                *(CGFloat *)(*(void *)&v95 + 32) = b;
                *(CGFloat *)(*(void *)&v95 + 40) = c;
                *(CGFloat *)(*(void *)&v95 + 48) = d;
                *(CGFloat *)(*(void *)&v95 + 56) = tx;
                *(CGFloat *)(*(void *)&v95 + 64) = ty;
                *(void *)&v113.CGFloat c = *(void *)&v95 + 72;
                sub_7BEBC((uint64_t *)&self->_stack, &v113);
                v89 = self->_stack.__end_;
                sub_7C13C((uint64_t)&v113);
              }
              else
              {
                *(void *)v87 = v84;
                *((void *)v87 + 1) = v85;
                *((unsigned char *)v87 + 16) = v29;
                *((CGFloat *)v87 + 3) = a;
                *((CGFloat *)v87 + 4) = b;
                *((CGFloat *)v87 + 5) = c;
                *((CGFloat *)v87 + 6) = d;
                v89 = (StackEntry *)((char *)v87 + 72);
                *((CGFloat *)v87 + 7) = tx;
                *((CGFloat *)v87 + 8) = ty;
              }
              self->_stack.__end_ = v89;
            }
            goto LABEL_62;
          }
          id v61 = *((id *)self->_stack.__end_ - 9);
          v62 = v61;
          if (v61 && ([v61 collectImpressionsForChild:v27] & 1) == 0)
          {
            LOBYTE(v29) = v29 & 0xFD;
          }
          else
          {

            v63 = [v27 box];
            v62 = [v63 impressionData];

            if (v62)
            {
              v64 = [TUIImpressionAttributes alloc];
              [v27 computedNaturalSize];
              v103[0] = *(_OWORD *)v115;
              v103[1] = *(_OWORD *)&v115[16];
              v103[2] = *(_OWORD *)&v115[32];
              v65 = -[TUIImpressionAttributes initWithData:size:center:transform:](v64, "initWithData:size:center:transform:", v62, v103);
              impressions = self->_impressions;
              if (!impressions)
              {
                v67 = (NSMutableArray *)objc_opt_new();
                v68 = self->_impressions;
                self->_impressions = v67;

                impressions = self->_impressions;
              }
              [(NSMutableArray *)impressions addObject:v65];
            }
            if ([v27 collectImpressionsForChildren]) {
              char v69 = 2;
            }
            else {
              char v69 = 0;
            }
            LOBYTE(v29) = v69 | v29 & 0xFD;
          }

          goto LABEL_36;
        }
      }
      else
      {
        sub_7C1D0((uint64_t)&self->_stack, (uint64_t)v28 - 72);
      }
LABEL_62:
    }
  }
  v97 = *p_root;
  *p_root = 0;
}

- (void)hostingCollectorAddProperties:(id)a3 forIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!self->_hostingIdentifiersOrder)
  {
    v7 = (NSMutableArray *)objc_opt_new();
    hostingIdentifiersOrder = self->_hostingIdentifiersOrder;
    self->_hostingIdentifiersOrder = v7;
  }
  if (!self->_hostingPropertiesMap)
  {
    v9 = (NSMutableDictionary *)objc_opt_new();
    hostingPropertiesMap = self->_hostingPropertiesMap;
    self->_hostingPropertiesMap = v9;
  }
  [(NSMutableArray *)self->_hostingIdentifiersOrder addObject:v6];
  [(NSMutableDictionary *)self->_hostingPropertiesMap setObject:v11 forKeyedSubscript:v6];
}

- (id)hostingCollectorFinalizeMap
{
  if (self->_hostingPropertiesMap) {
    id v2 = [[TUIHostingMap alloc] initWithMap:self->_hostingPropertiesMap order:self->_hostingIdentifiersOrder];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)finalizeImpressions
{
  id v2 = [(NSMutableArray *)self->_impressions copy];

  return v2;
}

- (id)finalizeLinkEntities
{
  id v2 = [(NSMutableArray *)self->_linkEntities copy];

  return v2;
}

- (TUILayout)root
{
  return self->_root;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_impressions, 0);
  objc_storeStrong((id *)&self->_hostingPropertiesMap, 0);
  objc_storeStrong((id *)&self->_hostingIdentifiersOrder, 0);
  p_stack = &self->_stack;
  sub_7C2BC((void ***)&p_stack);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) &= 0xF8u;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end