@interface TUIRenderUpdateCollection
- (BOOL)hasChangesToApply;
- (BOOL)hasInvalidationsToApply;
- (TUIFeedViewState)viewState;
- (TUIRenderModelCollection)from;
- (TUIRenderModelCollection)fromWithInserts;
- (TUIRenderModelCollection)to;
- (TUIRenderModelCollection)toWithDeletes;
- (TUIRenderUpdateChanges)changes;
- (TUIRenderUpdateCollection)initWithFrom:(id)a3 to:(id)a4 viewState:(id)a5 updates:(id)a6 changes:(id)a7 layoutQueue:(id)a8 flags:(unint64_t)a9;
- (_TUIRenderUpdateCollectionSectionChanges)sectionChangesFrom2FromPlusInserts;
- (_TUIRenderUpdateCollectionSectionChanges)sectionChangesFrom2To;
- (_TUIRenderUpdateCollectionSectionChanges)sectionChangesFromPlusInserts2To;
- (id).cxx_construct;
- (id)_computeFromPlusInsertsWithFrom:(id)a3 to:(id)a4;
- (id)_computeUpdatedWithFrom:(id)a3 to:(id)a4;
- (unint64_t)applyPhase;
- (unint64_t)flags;
- (void)_applyUpdates:(const void *)a3 toFeedView:(id)a4;
- (void)_computeSectionUpdates:(void *)a3 from:(id)a4 to:(id)a5;
- (void)_computeWithUpdates:(id)a3 layoutQueue:(id)a4;
- (void)applyToFeedView:(id)a3 completion:(id)a4;
- (void)setFromWithInserts:(id)a3;
- (void)setToWithDeletes:(id)a3;
@end

@implementation TUIRenderUpdateCollection

- (TUIRenderUpdateCollection)initWithFrom:(id)a3 to:(id)a4 viewState:(id)a5 updates:(id)a6 changes:(id)a7 layoutQueue:(id)a8 flags:(unint64_t)a9
{
  id v26 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v27.receiver = self;
  v27.super_class = (Class)TUIRenderUpdateCollection;
  v21 = [(TUIRenderUpdateCollection *)&v27 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_from, a3);
    objc_storeStrong((id *)&v22->_to, a4);
    v23 = (TUIFeedViewState *)[v17 copy];
    viewState = v22->_viewState;
    v22->_viewState = v23;

    objc_storeStrong((id *)&v22->_changes, a7);
    v22->_flags = a9;
    if (v22->_from != v22->_to) {
      [(TUIRenderUpdateCollection *)v22 _computeWithUpdates:v18 layoutQueue:v20];
    }
  }

  return v22;
}

- (id)_computeFromPlusInsertsWithFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v20 = a4;
  id v6 = [objc_alloc((Class)NSMutableSet) initWithArray:v20];
  v7 = +[NSSet setWithArray:v5];
  [v6 minusSet:v7];

  id v8 = [v5 mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v20;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if ([v6 containsObject:v13])
        {
          v14 = (char *)[v9 indexOfObject:v13];
          if (v14)
          {
            v15 = [v9 objectAtIndexedSubscript:v14 - 1];
            id v16 = (char *)[v8 indexOfObject:v15];

            id v17 = v16 + 1;
          }
          else
          {
            id v17 = 0;
          }
          [v8 insertObject:v13 atIndex:v17];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v18 = [v8 copy];

  return v18;
}

- (id)_computeUpdatedWithFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSMutableSet) initWithArray:v6];
  id v8 = +[NSSet setWithArray:v5];
  [v7 intersectSet:v8];

  id v9 = [v7 copy];

  return v9;
}

- (void)_computeSectionUpdates:(void *)a3 from:(id)a4 to:(id)a5
{
  id v7 = a4;
  id v48 = a5;
  v51 = v7;
  id v47 = [objc_alloc((Class)NSMutableSet) initWithArray:v7];
  id v50 = [objc_alloc((Class)NSMutableSet) initWithArray:v48];
  id v8 = +[NSSet setWithArray:v48];
  [v47 minusSet:v8];

  id v9 = +[NSSet setWithArray:v7];
  [v50 minusSet:v9];

  id v46 = [objc_alloc((Class)NSMutableSet) initWithArray:v48];
  [v46 minusSet:v50];
  id v10 = [v7 mutableCopy];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v47;
  id v11 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v57;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        id v15 = [v51 indexOfObject:v14];
        [v10 removeObject:v14];
        id v17 = (void *)*((void *)a3 + 1);
        unint64_t v16 = *((void *)a3 + 2);
        if ((unint64_t)v17 >= v16)
        {
          id v19 = *(void **)a3;
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v17 - *(void *)a3) >> 3);
          unint64_t v21 = v20 + 1;
          if (v20 + 1 > 0xAAAAAAAAAAAAAAALL) {
            sub_4484();
          }
          unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (void)v19) >> 3);
          if (2 * v22 > v21) {
            unint64_t v21 = 2 * v22;
          }
          if (v22 >= 0x555555555555555) {
            unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v23 = v21;
          }
          if (v23)
          {
            long long v24 = (char *)sub_12768((uint64_t)a3 + 16, v23);
            id v19 = *(void **)a3;
            id v17 = (void *)*((void *)a3 + 1);
          }
          else
          {
            long long v24 = 0;
          }
          v25 = &v24[24 * v20];
          *(void *)v25 = 1;
          *((void *)v25 + 1) = v15;
          *((void *)v25 + 2) = 0x7FFFFFFFFFFFFFFFLL;
          id v26 = v25;
          if (v17 != v19)
          {
            do
            {
              long long v27 = *(_OWORD *)(v17 - 3);
              *((void *)v26 - 1) = *(v17 - 1);
              *(_OWORD *)(v26 - 24) = v27;
              v26 -= 24;
              v17 -= 3;
            }
            while (v17 != v19);
            id v19 = *(void **)a3;
          }
          id v18 = v25 + 24;
          *(void *)a3 = v26;
          *((void *)a3 + 1) = v25 + 24;
          *((void *)a3 + 2) = &v24[24 * v23];
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          *id v17 = 1;
          v17[1] = v15;
          id v18 = v17 + 3;
          v17[2] = 0x7FFFFFFFFFFFFFFFLL;
        }
        *((void *)a3 + 1) = v18;
      }
      id v11 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v11);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v28 = v48;
  id v29 = [v28 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v29)
  {
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v53;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v52 + 1) + 8 * (void)j);
        if ([v50 containsObject:v33])
        {
          v35 = (void *)*((void *)a3 + 1);
          unint64_t v34 = *((void *)a3 + 2);
          if ((unint64_t)v35 >= v34)
          {
            v37 = *(void **)a3;
            unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v35 - *(void *)a3) >> 3);
            unint64_t v39 = v38 + 1;
            if (v38 + 1 > 0xAAAAAAAAAAAAAAALL) {
              sub_4484();
            }
            unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v34 - (void)v37) >> 3);
            if (2 * v40 > v39) {
              unint64_t v39 = 2 * v40;
            }
            if (v40 >= 0x555555555555555) {
              unint64_t v41 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v41 = v39;
            }
            if (v41)
            {
              v42 = (char *)sub_12768((uint64_t)a3 + 16, v41);
              v37 = *(void **)a3;
              v35 = (void *)*((void *)a3 + 1);
            }
            else
            {
              v42 = 0;
            }
            v43 = &v42[24 * v38];
            *(_OWORD *)v43 = xmmword_243380;
            *((void *)v43 + 2) = v30;
            v44 = v43;
            if (v35 != v37)
            {
              do
              {
                long long v45 = *(_OWORD *)(v35 - 3);
                *((void *)v44 - 1) = *(v35 - 1);
                *(_OWORD *)(v44 - 24) = v45;
                v44 -= 24;
                v35 -= 3;
              }
              while (v35 != v37);
              v37 = *(void **)a3;
            }
            v36 = v43 + 24;
            *(void *)a3 = v44;
            *((void *)a3 + 1) = v43 + 24;
            *((void *)a3 + 2) = &v42[24 * v41];
            if (v37) {
              operator delete(v37);
            }
          }
          else
          {
            *(_OWORD *)v35 = xmmword_243380;
            v35[2] = v30;
            v36 = (char *)(v35 + 3);
          }
          *((void *)a3 + 1) = v36;
          [v10 insertObject:v33 atIndex:v30];
        }
        ++v30;
      }
      id v29 = [v28 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v29);
  }
}

- (void)_computeWithUpdates:(id)a3 layoutQueue:(id)a4
{
  id v109 = a3;
  id v105 = a4;
  id v6 = [(TUIRenderModelCollection *)self->_from sections];
  uint64_t v7 = [v6 valueForKey:@"UUID"];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = &__NSArray0__struct;
  }
  id v117 = v9;

  id v10 = [(TUIRenderModelCollection *)self->_to sections];
  uint64_t v11 = [v10 valueForKey:@"UUID"];
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (void *)v11;
  }
  else {
    uint64_t v13 = &__NSArray0__struct;
  }
  id v14 = v13;

  v115 = v14;
  v106 = [(TUIRenderUpdateCollection *)self _computeFromPlusInsertsWithFrom:v117 to:v14];
  [(TUIRenderUpdateCollection *)self _computeSectionUpdates:&self->_sectionUpdatesFrom2To from:v117 to:v14];
  [(TUIRenderUpdateCollection *)self _computeSectionUpdates:&self->_sectionUpdatesFrom2FromPlusInserts from:v117 to:v106];
  [(TUIRenderUpdateCollection *)self _computeSectionUpdates:&self->_sectionUpdatesFromPlusInserts2To from:v106 to:v14];
  self->_hasChangesToApply = self->_sectionUpdatesFrom2To.__end_ != self->_sectionUpdatesFrom2To.__begin_;
  self->_hasInvalidationsToApply = 0;
  v118 = objc_opt_new();
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id obj = v106;
  id v15 = [obj countByEnumeratingWithState:&v123 objects:v128 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v124;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v124 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v123 + 1) + 8 * i);
        id v19 = [v117 indexOfObject:v18];
        if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v20 = [v115 indexOfObject:v18];
          unint64_t v21 = [(TUIRenderModelCollection *)self->_to sections];
          unint64_t v22 = [v21 objectAtIndexedSubscript:v20];
          id v23 = [v22 copyForInitialAppearanceWithFlags:0];
        }
        else
        {
          unint64_t v21 = [(TUIRenderModelCollection *)self->_from sections];
          id v23 = [v21 objectAtIndexedSubscript:v19];
        }

        id v24 = [v118 count];
        [v23 offset];
        double v26 = v25;
        double v28 = v27;
        id v29 = [v23 UUID];
        id v30 = [v23 copyWithSection:v24 offset:v29 uuid:v26 offset:v28];

        [v118 addObject:v30];
      }
      id v15 = [obj countByEnumeratingWithState:&v123 objects:v128 count:16];
    }
    while (v15);
  }

  uint64_t v31 = [(TUIRenderModelCollection *)self->_to sections];
  id v107 = [v31 mutableCopy];

  [(TUIRenderUpdateCollection *)self _computeUpdatedWithFrom:obj to:v115];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  v104 = long long v120 = 0u;
  id v108 = [v104 copy];
  id v32 = [v108 countByEnumeratingWithState:&v119 objects:v127 count:16];
  if (v32)
  {
    v111 = 0;
    v112 = 0;
    v110 = 0;
    uint64_t v113 = *(void *)v120;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v120 != v113) {
          objc_enumerationMutation(v108);
        }
        uint64_t v34 = *(void *)(*((void *)&v119 + 1) + 8 * (void)j);
        id v35 = [v117 indexOfObject:v34];
        id v36 = [v115 indexOfObject:v34];
        id v37 = [obj indexOfObject:v34];
        if (v35 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v38 = 0;
        }
        else
        {
          unint64_t v39 = [(TUIRenderModelCollection *)self->_from sections];
          id v38 = [v39 objectAtIndexedSubscript:v35];
        }
        if (v37 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v40 = 0;
        }
        else
        {
          unint64_t v40 = [v118 objectAtIndexedSubscript:v37];
        }
        unint64_t v41 = [(TUIRenderModelCollection *)self->_to sections];
        id v42 = [v41 objectAtIndexedSubscript:v36];

        if (v38 != v42)
        {
          if (v38 && v42)
          {
            v43 = [[TUIRenderUpdateSection alloc] initWithFrom:v38 to:v42];
            v44 = v110;
            if (!v110) {
              v44 = objc_opt_new();
            }
            v110 = v44;
            [v44 addObject:v43];
            if (self->_hasChangesToApply) {
              unsigned __int8 v45 = 1;
            }
            else {
              unsigned __int8 v45 = [(TUIRenderUpdateSection *)v43 hasChangesToApply];
            }
            self->_hasChangesToApply = v45;
            if (self->_hasInvalidationsToApply) {
              unsigned __int8 v46 = 1;
            }
            else {
              unsigned __int8 v46 = [(TUIRenderUpdateSection *)v43 hasInvalidationsToApply];
            }
            self->_hasInvalidationsToApply = v46;
          }
          id v47 = [v42 UUID];
          id v48 = [v109 objectForKeyedSubscript:v47];
          id v49 = [v48 newCurrentContainerPlusInserted];
          id v50 = v49;
          if (v49) {
            v51 = v49;
          }
          else {
            v51 = v40;
          }
          id v52 = v51;

          unint64_t v40 = v52;
          if (v52 != v38 && v52) {
            [v118 replaceObjectAtIndex:[v52 section] withObject:v52];
          }
          if (v52 && v38 && v52 != v38)
          {
            if (!v112) {
              v112 = objc_opt_new();
            }
            long long v53 = [[TUIRenderUpdateSection alloc] initWithFrom:v38 to:v52];
            [v112 addObject:v53];
          }
          if (v42 && v52 != v42 && v52)
          {
            if (!v111) {
              v111 = objc_opt_new();
            }
            long long v54 = [[TUIRenderUpdateSection alloc] initWithFrom:v52 to:v42];
            [v111 addObject:v54];
          }
        }
      }
      id v32 = [v108 countByEnumeratingWithState:&v119 objects:v127 count:16];
    }
    while (v32);
  }
  else
  {
    v111 = 0;
    v112 = 0;
    v110 = 0;
  }

  long long v55 = [[_TUIRenderUpdateCollectionSectionChanges alloc] initWithSectionUpdates:v110 model:self->_to];
  sectionChangesFrom2To = self->_sectionChangesFrom2To;
  self->_sectionChangesFrom2To = v55;

  if ([v112 count]
    || self->_sectionUpdatesFrom2FromPlusInserts.__end_ != self->_sectionUpdatesFrom2FromPlusInserts.__begin_)
  {
    long long v57 = [TUIRenderModelCollection alloc];
    long long v58 = [(TUIRenderModelCollection *)self->_from content];
    [(TUIRenderModelCollection *)self->_from size];
    double v60 = v59;
    double v62 = v61;
    [(TUIRenderModelCollection *)self->_from insets];
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    double v70 = v69;
    v114 = [(TUIRenderModelCollection *)self->_from visibleBoundsObservers];
    v71 = [(TUIRenderModelCollection *)self->_from info];
    v72 = [(TUIRenderModelCollection *)self->_from anchorSet];
    unint64_t v73 = [(TUIRenderModelCollection *)self->_to layoutDirection];
    v74 = [(TUIRenderModelCollection *)self->_to matchingSectionUUID];
    v75 = [(TUIRenderModelCollection *)self->_to matchingSectionUID];
    v76 = -[TUIRenderModelCollection initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:](v57, "initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:", v58, v118, v114, v71, v72, v73, v60, v62, v64, v66, v68, v70, v74, v75);

    v77 = [[_TUIRenderUpdateCollectionSectionChanges alloc] initWithSectionUpdates:v112 model:v76];
    sectionChangesFrom2FromPlusInserts = self->_sectionChangesFrom2FromPlusInserts;
    self->_sectionChangesFrom2FromPlusInserts = v77;
  }
  v79 = [TUIRenderModelCollection alloc];
  v80 = [(TUIRenderModelCollection *)self->_to content];
  [(TUIRenderModelCollection *)self->_to size];
  double v82 = v81;
  double v84 = v83;
  [(TUIRenderModelCollection *)self->_to insets];
  double v86 = v85;
  double v88 = v87;
  double v90 = v89;
  double v92 = v91;
  v93 = [(TUIRenderModelCollection *)self->_to visibleBoundsObservers];
  v94 = [(TUIRenderModelCollection *)self->_to info];
  v95 = [(TUIRenderModelCollection *)self->_to anchorSet];
  unint64_t v96 = [(TUIRenderModelCollection *)self->_to layoutDirection];
  v97 = [(TUIRenderModelCollection *)self->_to matchingSectionUUID];
  v98 = [(TUIRenderModelCollection *)self->_to matchingSectionUID];
  v99 = -[TUIRenderModelCollection initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:](v79, "initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:", v80, v107, v93, v94, v95, v96, v82, v84, v86, v88, v90, v92, v97, v98);

  v100 = [[_TUIRenderUpdateCollectionSectionChanges alloc] initWithSectionUpdates:v111 model:v99];
  sectionChangesFromPlusInserts2To = self->_sectionChangesFromPlusInserts2To;
  self->_sectionChangesFromPlusInserts2To = v100;

  v102 = [[_TUIRenderUpdateCollectionSectionChanges alloc] initWithSectionUpdates:v110 model:self->_to];
  v103 = self->_sectionChangesFrom2To;
  self->_sectionChangesFrom2To = v102;
}

- (void)_applyUpdates:(const void *)a3 toFeedView:(id)a4
{
  id v8 = a4;
  for (i = *(uint64_t **)a3; i != *((uint64_t **)a3 + 1); i += 3)
  {
    uint64_t v6 = *i;
    if (*i == 2)
    {
      [v8 moveSection:i[1] toSection:i[2]];
    }
    else
    {
      if (v6 == 1)
      {
        uint64_t v7 = +[NSIndexSet indexSetWithIndex:i[1]];
        [v8 deleteSections:v7];
        goto LABEL_8;
      }
      if (!v6)
      {
        uint64_t v7 = +[NSIndexSet indexSetWithIndex:i[2]];
        [v8 insertSections:v7];
LABEL_8:
      }
    }
  }
}

- (void)applyToFeedView:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_70340;
  v8[3] = &unk_2533B0;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [v7 applyUpdateCollection:self updates:v8];
}

- (TUIRenderModelCollection)from
{
  return self->_from;
}

- (TUIRenderModelCollection)to
{
  return self->_to;
}

- (TUIFeedViewState)viewState
{
  return self->_viewState;
}

- (BOOL)hasChangesToApply
{
  return self->_hasChangesToApply;
}

- (BOOL)hasInvalidationsToApply
{
  return self->_hasInvalidationsToApply;
}

- (unint64_t)applyPhase
{
  return self->_applyPhase;
}

- (TUIRenderUpdateChanges)changes
{
  return self->_changes;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (TUIRenderModelCollection)fromWithInserts
{
  return self->_fromWithInserts;
}

- (void)setFromWithInserts:(id)a3
{
}

- (TUIRenderModelCollection)toWithDeletes
{
  return self->_toWithDeletes;
}

- (void)setToWithDeletes:(id)a3
{
}

- (_TUIRenderUpdateCollectionSectionChanges)sectionChangesFrom2To
{
  return self->_sectionChangesFrom2To;
}

- (_TUIRenderUpdateCollectionSectionChanges)sectionChangesFrom2FromPlusInserts
{
  return self->_sectionChangesFrom2FromPlusInserts;
}

- (_TUIRenderUpdateCollectionSectionChanges)sectionChangesFromPlusInserts2To
{
  return self->_sectionChangesFromPlusInserts2To;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionChangesFromPlusInserts2To, 0);
  objc_storeStrong((id *)&self->_sectionChangesFrom2FromPlusInserts, 0);
  objc_storeStrong((id *)&self->_sectionChangesFrom2To, 0);
  objc_storeStrong((id *)&self->_toWithDeletes, 0);
  objc_storeStrong((id *)&self->_fromWithInserts, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  begin = self->_sectionUpdatesFromPlusInserts2To.__begin_;
  if (begin)
  {
    self->_sectionUpdatesFromPlusInserts2To.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_sectionUpdatesFrom2FromPlusInserts.__begin_;
  if (v4)
  {
    self->_sectionUpdatesFrom2FromPlusInserts.__end_ = v4;
    operator delete(v4);
  }
  id v5 = self->_sectionUpdatesFrom2To.__begin_;
  if (v5)
  {
    self->_sectionUpdatesFrom2To.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end