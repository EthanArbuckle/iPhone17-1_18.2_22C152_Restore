@interface TUIRenderModelSubviews
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (CGSize)size;
- (NSArray)containedSubmodels;
- (NSArray)debugContainedSubmodels;
- (NSArray)submodels;
- (NSDictionary)identifierToContainedSubmodelMap;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (TUIRenderModelSubviews)initWithSubmodels:(id)a3;
- (id)_finalRenderModelForDeletedRenderModel:(id)a3;
- (id)_initialRenderModelForInsertedRenderModel:(id)a3;
- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6;
- (id)computeDeletedFrom:(id)a3;
- (id)computeInsertedFrom:(id)a3;
- (id)configureSubviewsWithFactory:(id)a3 outsets:(UIEdgeInsets)a4 host:(id)a5 overrides:(id)a6 usedOverrides:(BOOL *)a7 UUID:(id)a8 uid:(id)a9;
- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3;
- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3;
- (id)copySubmodel:(id)a3 forFinalAppearanceWithFlags:(unint64_t)a4;
- (id)copySubmodel:(id)a3 forInitialAppearanceWithFlags:(unint64_t)a4;
- (id)copyWithContainedSubmodels:(id)a3;
- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4;
- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6;
- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TUIRenderModelSubviews

- (TUIRenderModelSubviews)initWithSubmodels:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIRenderModelSubviews;
  v5 = [(TUIRenderModelSubviews *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 sortedArrayUsingComparator:&stru_2523B0];
    submodels = v5->_submodels;
    v5->_submodels = (NSArray *)v6;

    v8 = objc_opt_new();
    v9 = v5->_submodels;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2CC30;
    v14[3] = &unk_2523D8;
    id v15 = v8;
    id v10 = v8;
    [(NSArray *)v9 enumerateObjectsUsingBlock:v14];
    v11 = (NSDictionary *)[v10 copy];
    identifierToContainedSubmodelMap = v5->_identifierToContainedSubmodelMap;
    v5->_identifierToContainedSubmodelMap = v11;
  }
  return v5;
}

- (id)copyWithContainedSubmodels:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithSubmodels:v3];

  return v4;
}

- (NSArray)containedSubmodels
{
  return self->_submodels;
}

- (NSArray)debugContainedSubmodels
{
  return self->_submodels;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->_submodels;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        long long v13 = *(_OWORD *)&a4->c;
        v14[0] = *(_OWORD *)&a4->a;
        v14[1] = v13;
        v14[2] = *(_OWORD *)&a4->tx;
        [v12 appendResourcesToCollector:v6 transform:v14];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v13 = self->_submodels;
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      long long v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v17);
        long long v19 = *(_OWORD *)&a4->c;
        v20[0] = *(_OWORD *)&a4->a;
        v20[1] = v19;
        v20[2] = *(_OWORD *)&a4->tx;
        [v18 appendReferencesToCollector:v10 transform:v20 query:v11 liveTransformResolver:v12];
        long long v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }
}

- (unint64_t)kind
{
  return 6;
}

- (id)configureSubviewsWithFactory:(id)a3 outsets:(UIEdgeInsets)a4 host:(id)a5 overrides:(id)a6 usedOverrides:(BOOL *)a7 UUID:(id)a8 uid:(id)a9
{
  CGFloat top = a4.top;
  CGFloat left = a4.left;
  id v93 = a3;
  id v14 = a5;
  id v101 = a6;
  id v115 = a8;
  id v114 = a9;
  id v95 = (id)objc_opt_new();
  id v15 = [v14 tui_hostedSubviewsMap];
  id v16 = [v15 mutableCopy];

  v94 = objc_opt_new();
  long long v17 = v14;
  v91 = [v14 tui_hostingView];
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  obj = self->_submodels;
  id v99 = [(NSArray *)obj countByEnumeratingWithState:&v141 objects:v147 count:16];
  if (!v99)
  {
    char v109 = 0;
LABEL_40:

    goto LABEL_41;
  }
  unsigned int v92 = 0;
  uint64_t v18 = 0;
  char v109 = 0;
  uint64_t v98 = *(void *)v142;
  id v89 = v16;
  id v90 = v14;
  do
  {
    for (i = 0; i != v99; i = (char *)i + 1)
    {
      if (*(void *)v142 != v98) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v141 + 1) + 8 * i);
      long long v21 = [v20 identifier:top left:left];
      v111 = v20;
      long long v22 = [v20 submodel];
      long long v23 = [v22 reuseIdentifier];

      id v24 = [v16 objectForKeyedSubscript:v21];
      +[NSIndexPath tui_indexPathForRow:v18 inSection:0];
      v108 = id v107 = v24;
      if (v24)
      {
        v25 = [v24 reuseIdentifier];
        unsigned __int8 v26 = [v25 isEqualToString:v23];

        id v24 = v107;
        v27 = (void *)v108;
        v106 = v107;
        if (v26) {
          goto LABEL_9;
        }
      }
      uint64_t v28 = [v93 viewFactoryDequeueReusableSubviewWithReuseIdentifier:v23 indexPath:v108 host:v17];

      v27 = (void *)v108;
      v106 = (void *)v28;
      if (v28)
      {
LABEL_9:
        id v29 = +[TUILayoutAttributes newLayoutAttributesWithIndexPath:v27];
        [v111 outsets];
        double v104 = v30;
        double v32 = v31;
        id v112 = v33;
        double v35 = v34;
        [v111 size];
        double v37 = v36;
        [v111 size];
        double v39 = v38;
        [v111 size];
        double v41 = v40;
        [v111 size];
        double v43 = v42;
        [v111 center];
        double v45 = v44;
        double v47 = v46;
        long long v139 = 0u;
        long long v140 = 0u;
        long long v138 = 0u;
        if (v111) {
          [v111 transform];
        }
        double v48 = v37 + v32 + v35;
        double v49 = v104 + *(double *)&v112 + v39;
        id v50 = [v111 zIndex];
        [v29 setBounds:0.0, 0.0, v48, v49];
        [v29 setCenter:v45 + v48 * 0.5 - (v32 + v41 * 0.5), v47 + v49 * 0.5 - (v104 + v43 * 0.5)];
        v137[0] = v138;
        v137[1] = v139;
        v137[2] = v140;
        [v29 setTransform:v137];
        id v100 = v50;
        [v29 setZIndex:v50];
        [v111 submodel];
        v51 = v110 = v29;
        [v110 setRenderModel:v51];

        [v111 alpha];
        [v110 setAlpha:];
        v52 = [v111 refId];
        [v110 setRefId:v52];

        v53 = [v111 refInstance];
        [v110 setRefInstance:v53];

        [v110 setOutsets:v104, v32, *(double *)&v112, v35];
        v103 = v23;
        v105 = v21;
        if (v101)
        {
          v97 = i;
          uint64_t v102 = v18;
          v54 = [v110 refId];
          v55 = [v110 refInstance];
          long long v133 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          id v113 = v101;
          id v56 = [v113 countByEnumeratingWithState:&v133 objects:v146 count:16];
          if (!v56) {
            goto LABEL_23;
          }
          id v57 = v56;
          uint64_t v58 = *(void *)v134;
          while (1)
          {
            for (j = 0; j != v57; j = (char *)j + 1)
            {
              if (*(void *)v134 != v58) {
                objc_enumerationMutation(v113);
              }
              v60 = *(void **)(*((void *)&v133 + 1) + 8 * (void)j);
              v61 = [v60 query];
              if ([(TUIRenderReferenceIdentifier *)v61 matchesUUID:v115 uid:v114])
              {
                v62 = [v60 query];
                v63 = [v111 identifier];
                unsigned int v64 = [v62 matchesRefId:v54 refInstance:v55 identifier:v63];

                if (!v64) {
                  continue;
                }
                v61 = [[TUIRenderReferenceIdentifier alloc] initWithUUID:0 uid:0 refId:v54 refInstance:v55];
                [v60 updateLayoutAttributes:v110 forIdentifier:v61];
                char v109 = 1;
              }
            }
            id v57 = [v113 countByEnumeratingWithState:&v133 objects:v146 count:16];
            if (!v57)
            {
LABEL_23:

              id v16 = v89;
              long long v17 = v90;
              uint64_t v18 = v102;
              i = v97;
              long long v21 = v105;
              break;
            }
          }
        }
        v130[0] = _NSConcreteStackBlock;
        v130[1] = 3221225472;
        v130[2] = sub_2D968;
        v130[3] = &unk_251828;
        id v65 = v106;
        id v131 = v65;
        id v66 = v110;
        id v132 = v66;
        v67 = objc_retainBlock(v130);
        [v95 addObject:v65];
        [v94 setObject:v65 forKey:v21];
        if (v65 == v107)
        {
          [v16 removeObjectForKey:v21];
          v68 = [v107 layoutAttributes];
          v69 = i;
          id v70 = [v68 zIndex];
          LODWORD(v70) = v70 != [v66 zIndex];

          unsigned int v71 = v70 | v92;
          i = v69;
          unsigned int v92 = v71;
          ((void (*)(void *))v67[2])(v67);
        }
        else
        {
          v124[0] = _NSConcreteStackBlock;
          v124[1] = 3221225472;
          v124[2] = sub_2D974;
          v124[3] = &unk_252400;
          id v125 = v91;
          id v126 = v65;
          id v129 = v100;
          id v127 = v17;
          v128 = v67;
          +[UIView performWithoutAnimation:v124];
        }
        long long v23 = v103;
        long long v21 = v105;
        id v24 = v107;
        v27 = (void *)v108;
      }
      ++v18;
    }
    id v99 = [(NSArray *)obj countByEnumeratingWithState:&v141 objects:v147 count:16];
  }
  while (v99);

  if (v92)
  {
    [v17 tui_hostingView];
    obj = (NSArray *)objc_claimAutoreleasedReturnValue();
    v72 = [(NSArray *)obj subviews];
    v73 = [v72 sortedArrayUsingComparator:&stru_252440];

    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v74 = v73;
    id v75 = [v74 countByEnumeratingWithState:&v120 objects:v145 count:16];
    if (v75)
    {
      id v76 = v75;
      uint64_t v77 = *(void *)v121;
      do
      {
        for (k = 0; k != v76; k = (char *)k + 1)
        {
          if (*(void *)v121 != v77) {
            objc_enumerationMutation(v74);
          }
          [(NSArray *)obj bringSubviewToFront:*(void *)(*((void *)&v120 + 1) + 8 * (void)k)];
        }
        id v76 = [v74 countByEnumeratingWithState:&v120 objects:v145 count:16];
      }
      while (v76);
    }

    goto LABEL_40;
  }
LABEL_41:
  [v17 setTui_hostedSubviewsMap:v94, top, left];
  CATransform3DMakeTranslation(&v119, v87, v85, 0.0);
  v79 = [v17 tui_hostingView];
  v80 = [v79 layer];
  CATransform3D v118 = v119;
  [v80 setSublayerTransform:&v118];

  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472;
  v116[2] = sub_2DCB8;
  v116[3] = &unk_251990;
  id v117 = v16;
  id v81 = v16;
  +[UIView performWithoutAnimation:v116];
  v82 = [v81 allValues];
  [v93 viewFactoryReuseSubviews:v82 host:v17];

  *a7 = v109 & 1;

  return v95;
}

- (id)_initialRenderModelForInsertedRenderModel:(id)a3
{
  id v3 = [a3 copyWithAlpha:0.0];

  return v3;
}

- (id)_finalRenderModelForDeletedRenderModel:(id)a3
{
  id v3 = [a3 copyWithAlpha:0.0];

  return v3;
}

- (id)computeDeletedFrom:(id)a3
{
  id v4 = a3;
  v5 = [v4 submodels];
  submodels = self->_submodels;
  id v7 = v5;
  id v8 = submodels;
  id v29 = v4;
  id v9 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](v8, "count")];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v8;
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v16 = [v15 identifier];
        [v9 setObject:v15 forKeyedSubscript:v16];
      }
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v7;
  id v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v18)
  {
    id v19 = v18;
    v20 = 0;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v17);
        }
        long long v23 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
        id v24 = [v23 identifier];
        v25 = [v9 objectForKeyedSubscript:v24];

        if (!v25)
        {
          if (!v20) {
            v20 = objc_opt_new();
          }
          unsigned __int8 v26 = [v29 _finalRenderModelForDeletedRenderModel:v23];
          [v20 addObject:v26];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  id v27 = [v20 copy];

  return v27;
}

- (id)computeInsertedFrom:(id)a3
{
  id v28 = a3;
  id v4 = [v28 submodels];
  submodels = self->_submodels;
  id v6 = v4;
  id v7 = submodels;
  id v29 = self;
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](v7, "count")];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v15 = [v14 identifier];
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      id v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v11);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v7;
  id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v17)
  {
    id v18 = v17;
    id v19 = 0;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v16);
        }
        long long v22 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
        long long v23 = [v22 identifier];
        id v24 = [v8 objectForKeyedSubscript:v23];

        if (!v24)
        {
          if (!v19) {
            id v19 = objc_opt_new();
          }
          v25 = [(TUIRenderModelSubviews *)v29 _initialRenderModelForInsertedRenderModel:v22];
          [v19 addObject:v25];
        }
      }
      id v18 = [(NSArray *)v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v18);
  }
  else
  {
    id v19 = 0;
  }

  id v26 = [v19 copy];

  return v26;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  id v4 = self;
  if ((a3 & 1) == 0)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](v4->_submodels, "count")];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4->_submodels;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [v14 copyForInitialAppearanceWithFlags:a3];
          [v5 addObject:v11];

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    uint64_t v12 = [[TUIRenderModelSubviews alloc] initWithSubmodels:v5];
    [(TUIRenderModelSubviews *)v12 setIdentifier:v4->_identifier];
    -[TUIRenderModelSubviews setSize:](v12, "setSize:", v4->_size.width, v4->_size.height);

    return v12;
  }
  return v4;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  id v4 = self;
  if ((a3 & 1) == 0)
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](v4->_submodels, "count")];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4->_submodels;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) copyForFinalAppearanceWithFlags:a3 v14];
          [v5 addObject:v11];

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    uint64_t v12 = [[TUIRenderModelSubviews alloc] initWithSubmodels:v5];
    TUIRenderModelCopyProperties(v12, v4);

    return v12;
  }
  return v4;
}

- (id)copySubmodel:(id)a3 forInitialAppearanceWithFlags:(unint64_t)a4
{
  return 0;
}

- (id)copySubmodel:(id)a3 forFinalAppearanceWithFlags:(unint64_t)a4
{
  return 0;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[TUIRenderUpdateArrayContainer alloc] initWithCurrent:v12 from:v11 to:self tracker:v10 flags:a6];

  return v13;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  return [a3 newToContainerPlusDeletedWithInterests:a4 changes:0];
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  return [a4 newCurrentContainerPlusInserted:a3];
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v7 = v4;
    }
    else
    {
      uint64_t v6 = objc_opt_class();
      TUIDynamicCast(v6, v4);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v9 = v7;
    unsigned __int8 v8 = TUIRenderModelArrayContainingIsEqualToRenderModelArrayContaining(self, v7);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(TUIRenderModelSubviews *)self identifier];
  id v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSDictionary)identifierToContainedSubmodelMap
{
  return self->_identifierToContainedSubmodelMap;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (NSArray)submodels
{
  return self->_submodels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodels, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifierToContainedSubmodelMap, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end