@interface SXColumnLayouter
- (BOOL)anchorPossibleForComponentWithBlueprint:(id)a3 anchoredToComponentWithBlueprint:(id)a4 layoutBlueprint:(id)a5 columnStack:(id)a6;
- (BOOL)componentBlueprint:(id)a3 shouldIntersectWithComponentBlueprint:(id)a4;
- (BOOL)intersectionPossibleForComponentWithBlueprint:(id)a3 anchoredToComponentWithBlueprint:(id)a4 layoutBlueprint:(id)a5 columnStack:(id)a6;
- (BOOL)stack:(id)a3 stackComponents:(id)a4 containsComponentIncludingAnchoredComponents:(id)a5 forSourceComponent:(id)a6;
- (CGPoint)calculatePositionForComponentNode:(id)a3 columnLayout:(id)a4 layoutBlueprint:(id)a5;
- (CGSize)calculateSizeForComponentNode:(id)a3 columnLayout:(id)a4 layoutBlueprint:(id)a5 dependencyResolver:(id)a6;
- (NSMutableDictionary)intersectionCache;
- (SXColumnLayouter)initWithLayouterFactory:(id)a3 layoutContextFactory:(id)a4 unitConverterFactory:(id)a5;
- (SXLayoutContextFactory)layoutContextFactory;
- (SXLayouterDelegate)delegate;
- (SXLayouterFactory)layouterFactory;
- (SXUnitConverterFactory)unitConverterFactory;
- (double)factorForLayoutAttribute:(int)a3;
- (id)columnStackForLayoutBlueprint:(id)a3 columnLayout:(id)a4;
- (id)findComponentStackBeforeComponent:(id)a3 inColumnStack:(id)a4;
- (id)sortComponentDependencies:(id)a3 forBlueprint:(id)a4;
- (int)layoutAttributeForAnchor:(int64_t)a3;
- (void)analyzeSnapLinesForLayoutBlueprint:(id)a3;
- (void)createDependenciesForLayoutBlueprint:(id)a3 columnStack:(id)a4 inDependencyResolver:(id)a5;
- (void)layoutBlueprint:(id)a3 columnLayout:(id)a4 description:(id)a5 shouldContinue:(BOOL *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation SXColumnLayouter

- (SXColumnLayouter)initWithLayouterFactory:(id)a3 layoutContextFactory:(id)a4 unitConverterFactory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXColumnLayouter;
  v12 = [(SXColumnLayouter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layouterFactory, a3);
    objc_storeStrong((id *)&v13->_layoutContextFactory, a4);
    objc_storeStrong((id *)&v13->_unitConverterFactory, a5);
  }

  return v13;
}

- (void)layoutBlueprint:(id)a3 columnLayout:(id)a4 description:(id)a5 shouldContinue:(BOOL *)a6
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v81 = a5;
  v12 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = [v81 taskIdentifier];
    *(_DWORD *)buf = 134218242;
    id v91 = v10;
    __int16 v92 = 2114;
    v93 = v14;
    _os_log_impl(&dword_222AC5000, v13, OS_LOG_TYPE_DEFAULT, "Starting column layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);
  }
  objc_super v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  intersectionCache = self->_intersectionCache;
  self->_intersectionCache = v15;

  *a6 = 1;
  objc_msgSend(v11, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", 0, objc_msgSend(v11, "numberOfColumns"), 3, 3, 3);
  double v18 = v17;
  objc_msgSend(v10, "startUpdatesForWidth:");
  uint64_t v19 = [(SXColumnLayouter *)self columnStackForLayoutBlueprint:v10 columnLayout:v11];
  v20 = [SXComponentDependencyResolver alloc];
  v21 = [v10 componentIdentifiers];
  v22 = (id *)-[SXComponentDependencyResolver initWithComponentIdentifiers:](v20, v21);

  [v10 setDependencySolver:v22];
  v77 = (void *)v19;
  [(SXColumnLayouter *)self createDependenciesForLayoutBlueprint:v10 columnStack:v19 inDependencyResolver:v22];
  v79 = v22;
  -[SXComponentDependencyResolver solvableOrder](v22);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v84 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
  if (!v84) {
    goto LABEL_38;
  }
  uint64_t v83 = *(void *)v86;
  v80 = a6;
  id v78 = v11;
  while (2)
  {
    for (uint64_t i = 0; i != v84; ++i)
    {
      if (*(void *)v86 != v83) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void *)(*((void *)&v85 + 1) + 8 * i);
      v25 = -[SXFullscreenCaption text](v24);
      v26 = [v10 componentBlueprintForComponentIdentifier:v25];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v26;
        v28 = [v27 layoutBlueprint];
        if ([v28 isComplete]) {
          int v29 = [v27 hasValidLayout];
        }
        else {
          int v29 = 0;
        }
      }
      else
      {
        int v29 = 1;
      }
      v30 = [v26 componentSizer];
      [v26 suggestedSizeAfterInvalidation];
      objc_msgSend(v30, "setSuggestedSize:");

      v31 = [v26 componentSizer];
      v32 = [v26 componentState];
      [v31 setComponentState:v32];

      if (-[SXFullscreenCaption caption](v24) == 1
        && ([v26 hasValidPosition] & v29 & 1) == 0)
      {
        v62 = (void *)SXLayoutLog;
        if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
        {
          v63 = v62;
          v64 = [v26 component];
          v65 = [v64 identifier];
          v66 = [v81 taskIdentifier];
          *(_DWORD *)buf = 138543618;
          id v91 = v65;
          __int16 v92 = 2114;
          v93 = v66;
          _os_log_impl(&dword_222AC5000, v63, OS_LOG_TYPE_DEFAULT, "Calculating position, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);

          a6 = v80;
        }
        [(SXColumnLayouter *)self calculatePositionForComponentNode:v24 columnLayout:v11 layoutBlueprint:v10];
        double v68 = v67;
        double v70 = v69;
        v61 = -[SXFullscreenCaption text](v24);
        objc_msgSend(v10, "updatePosition:forComponentWithIdentifier:", v61, v68, v70);
      }
      else
      {
        if (-[SXFullscreenCaption caption](v24) != 2
          || ([v26 hasValidSize] & v29 & 1) != 0)
        {
          goto LABEL_29;
        }
        v33 = (void *)SXLayoutLog;
        if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v33;
          v35 = [v26 component];
          v36 = [v35 identifier];
          v37 = [v81 taskIdentifier];
          *(_DWORD *)buf = 138543618;
          id v91 = v36;
          __int16 v92 = 2114;
          v93 = v37;
          _os_log_impl(&dword_222AC5000, v34, OS_LOG_TYPE_DEFAULT, "Calculating size, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);

          a6 = v80;
        }
        [(SXColumnLayouter *)self calculateSizeForComponentNode:v24 columnLayout:v11 layoutBlueprint:v10 dependencyResolver:v79];
        double v39 = v38;
        double v41 = v40;
        v42 = [v26 component];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          unitConverterFactory = self->_unitConverterFactory;
          id v45 = v26;
          v46 = [v10 layoutOptions];
          v47 = [(SXUnitConverterFactory *)unitConverterFactory createUnitConverterWithComponentWidth:v46 parentWidth:v39 layoutOptions:v18];

          v48 = [v11 columnLayoutForComponentBlueprint:v45 unitConverter:v47];
          layouterFactory = self->_layouterFactory;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v51 = [(SXLayouterFactory *)layouterFactory layouterForContainerComponentBlueprint:v45 delegate:WeakRetained];

          v52 = [v45 layoutBlueprint];
          [v51 layoutBlueprint:v52 columnLayout:v48 description:v81 shouldContinue:v80];

          v53 = [v45 componentSizer];
          [v53 contentInsetsWithUnitConverter:v47];
          double v55 = v54;
          double v57 = v56;

          v58 = [v45 layoutBlueprint];

          a6 = v80;
          [v58 blueprintSize];
          double v41 = v57 + v55 + v59;

          id v11 = v78;
          [v48 minimumHeight];
          if (v41 < v60) {
            double v41 = v60;
          }
        }
        v61 = -[SXFullscreenCaption text](v24);
        objc_msgSend(v10, "updateSize:forComponentWithIdentifier:", v61, v39, v41);
      }

LABEL_29:
      if ([v26 hasValidLayout])
      {
        if (!*a6) {
          goto LABEL_37;
        }
        v71 = [(SXColumnLayouter *)self delegate];
        char v72 = objc_opt_respondsToSelector();

        if (v72)
        {
          v73 = [(SXColumnLayouter *)self delegate];
          [v73 layouter:self didFinishLayoutForComponentBlueprint:v26 layoutBlueprint:v10 shouldContinueLayout:a6];
        }
        if (!*a6)
        {
LABEL_37:

          goto LABEL_38;
        }
      }
    }
    uint64_t v84 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
    if (v84) {
      continue;
    }
    break;
  }
LABEL_38:

  [(SXColumnLayouter *)self analyzeSnapLinesForLayoutBlueprint:v10];
  [v10 endUpdates];
  v74 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v75 = v74;
    v76 = [v81 taskIdentifier];
    *(_DWORD *)buf = 134218242;
    id v91 = v10;
    __int16 v92 = 2114;
    v93 = v76;
    _os_log_impl(&dword_222AC5000, v75, OS_LOG_TYPE_DEFAULT, "Finished column layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);
  }
}

- (void)createDependenciesForLayoutBlueprint:(id)a3 columnStack:(id)a4 inDependencyResolver:(id)a5
{
  uint64_t v251 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v188 = a4;
  id v8 = a5;
  v164 = [MEMORY[0x263EFF9A0] dictionary];
  long long v239 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  id obj = [v7 componentIdentifiers];
  v197 = v7;
  uint64_t v210 = (uint64_t)v8;
  uint64_t v167 = [obj countByEnumeratingWithState:&v239 objects:v250 count:16];
  if (v167)
  {
    uint64_t v166 = *(void *)v240;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v240 != v166)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }
        uint64_t v169 = v9;
        id v207 = *(id *)(*((void *)&v239 + 1) + 8 * v9);
        objc_msgSend(v7, "componentBlueprintForComponentIdentifier:");
        id v179 = (id)objc_claimAutoreleasedReturnValue();
        v194 = [v179 component];
        id v11 = [v194 classification];
        int v12 = [v11 isCollapsible];

        if (v12)
        {
          v13 = [v194 anchor];
          v14 = [v13 targetComponentIdentifier];
          objc_super v15 = [v7 componentBlueprintForComponentIdentifier:v14];

          if (!v15
            || ![(SXColumnLayouter *)self intersectionPossibleForComponentWithBlueprint:v179 anchoredToComponentWithBlueprint:v15 layoutBlueprint:v7 columnStack:v188])
          {
            v16 = SXComponentDependencyCreate(v207, v207, (void *)1, (void *)2, 0);
            -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v16);
          }
        }
        double v17 = [v188 componentsBeforeComponent:v179];
        long long v235 = 0u;
        long long v236 = 0u;
        long long v237 = 0u;
        long long v238 = 0u;
        id v171 = v17;
        uint64_t v176 = [v17 countByEnumeratingWithState:&v235 objects:v249 count:16];
        if (v176)
        {
          uint64_t v173 = *(void *)v236;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v236 != v173) {
                objc_enumerationMutation(v171);
              }
              uint64_t v182 = v18;
              uint64_t v19 = *(void **)(*((void *)&v235 + 1) + 8 * v18);
              v20 = [v19 component];
              v21 = [v194 anchor];
              v22 = [v20 identifier];
              v198 = v21;
              v23 = [v21 targetComponentIdentifier];
              int v24 = [v22 isEqualToString:v23];

              v185 = v20;
              v25 = [v20 anchor];
              v26 = [v25 targetComponentIdentifier];
              id v27 = [v194 identifier];
              int v28 = [v26 isEqualToString:v27];

              if (v24)
              {
                int v29 = v198;
                if (!-[SXColumnLayouter componentBlueprint:shouldIntersectWithComponentBlueprint:](self, "componentBlueprint:shouldIntersectWithComponentBlueprint:", v179, v19)|| [v198 range] == 0x7FFFFFFFFFFFFFFFLL)
                {
                  goto LABEL_39;
                }
                if ((v28 & 1) == 0)
                {
                  v30 = self;
                  id v31 = v179;
                  id v32 = v19;
                  goto LABEL_25;
                }
              }
              else
              {
                int v29 = v198;
                if (!v28) {
                  goto LABEL_39;
                }
                if (![(SXColumnLayouter *)self componentBlueprint:v19 shouldIntersectWithComponentBlueprint:v179])goto LABEL_39; {
                v33 = [v19 component];
                }
                v34 = [v33 anchor];
                uint64_t v35 = [v34 range];

                if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
                  goto LABEL_39;
                }
              }
              v30 = self;
              id v31 = v19;
              id v32 = v179;
LABEL_25:
              if ([(SXColumnLayouter *)v30 intersectionPossibleForComponentWithBlueprint:v31 anchoredToComponentWithBlueprint:v32 layoutBlueprint:v7 columnStack:v188])
              {
                v36 = [(SXColumnLayouter *)self findComponentStackBeforeComponent:v19 inColumnStack:v188];
                long long v231 = 0u;
                long long v232 = 0u;
                long long v233 = 0u;
                long long v234 = 0u;
                id v191 = v36;
                id v204 = (id)[v36 countByEnumeratingWithState:&v231 objects:v248 count:16];
                if (!v204) {
                  goto LABEL_54;
                }
                uint64_t v201 = *(void *)v232;
                while (1)
                {
                  for (uint64_t i = 0; i != v204; uint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v232 != v201) {
                      objc_enumerationMutation(v191);
                    }
                    double v38 = *(void **)(*((void *)&v231 + 1) + 8 * i);
                    double v39 = [v38 identifier];
                    double v40 = [v7 componentBlueprintForComponentIdentifier:v39];

                    double v41 = +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
                    v42 = [v38 identifier];
                    v43 = SXComponentDependencyCreate(v207, v42, (void *)1, (void *)1, v41);
                    -[SXComponentDependencyResolver addDependency:](v210, v43);

                    v44 = [v38 identifier];
                    id v45 = SXComponentDependencyCreate(v207, v44, (void *)1, (void *)2, v41);
                    -[SXComponentDependencyResolver addDependency:](v210, v45);

                    v46 = [v38 anchor];
                    uint64_t v47 = [v46 targetComponentIdentifier];
                    if (v47)
                    {
                      v48 = (void *)v47;
                      v49 = [v194 anchor];
                      v50 = [v49 targetComponentIdentifier];
                      v51 = [v38 anchor];
                      v52 = [v51 targetComponentIdentifier];

                      id v7 = v197;
                      BOOL v53 = v50 == v52;
                      int v29 = v198;
                      if (v53) {
                        goto LABEL_36;
                      }
                      double v54 = [v38 anchor];
                      double v55 = [v54 targetComponentIdentifier];
                      v46 = [v197 componentBlueprintForComponentIdentifier:v55];

                      if ([(SXColumnLayouter *)self intersectionPossibleForComponentWithBlueprint:v40 anchoredToComponentWithBlueprint:v46 layoutBlueprint:v197 columnStack:v188])
                      {
                        double v56 = +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
                        double v57 = [v46 component];
                        v58 = [v57 identifier];
                        double v59 = SXComponentDependencyCreate(v207, v58, (void *)1, (void *)1, v56);
                        -[SXComponentDependencyResolver addDependency:](v210, v59);

                        double v60 = [v46 component];
                        v61 = [v60 identifier];
                        id v7 = v197;
                        v62 = SXComponentDependencyCreate(v207, v61, (void *)1, (void *)2, v56);
                        -[SXComponentDependencyResolver addDependency:](v210, v62);

                        int v29 = v198;
                      }
                    }

LABEL_36:
                  }
                  id v204 = (id)[v191 countByEnumeratingWithState:&v231 objects:v248 count:16];
                  if (!v204)
                  {
                    id v8 = (id)v210;
                    goto LABEL_54;
                  }
                }
              }
LABEL_39:
              v63 = +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
              v64 = [v185 identifier];
              v65 = SXComponentDependencyCreate(v207, v64, (void *)1, (void *)1, v63);
              -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v65);

              v66 = [v185 identifier];
              id v191 = v63;
              double v67 = SXComponentDependencyCreate(v207, v66, (void *)1, (void *)2, v63);
              -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v67);

              double v68 = [v185 anchor];
              double v69 = v68;
              if (v68)
              {
                uint64_t v70 = [v68 targetComponentIdentifier];
                if (v70)
                {
                  v71 = (void *)v70;
                  char v72 = [v69 targetComponentIdentifier];
                  v73 = [v29 targetComponentIdentifier];
                  if (![v72 isEqualToString:v73])
                  {

LABEL_45:
                    v75 = [v185 anchor];
                    v76 = [v75 targetComponentIdentifier];
                    v77 = [v7 componentBlueprintForComponentIdentifier:v76];

                    NSUInteger v78 = [v179 columnRange];
                    NSUInteger v80 = v79;
                    v255.location = [v77 columnRange];
                    v255.length = v81;
                    v252.location = v78;
                    v252.length = v80;
                    if (NSIntersectionRange(v252, v255).length)
                    {
                      BOOL v82 = [(SXColumnLayouter *)self intersectionPossibleForComponentWithBlueprint:v19 anchoredToComponentWithBlueprint:v77 layoutBlueprint:v7 columnStack:v188];
                      if (([v171 containsObject:v77] & 1) == 0 && v82)
                      {
                        uint64_t v83 = [v194 identifier];
                        uint64_t v84 = [v77 component];
                        long long v85 = [v84 identifier];
                        char v86 = [v83 isEqualToString:v85];

                        if ((v86 & 1) == 0)
                        {
                          long long v87 = +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
                          long long v88 = [v77 component];
                          v89 = [v88 identifier];
                          v90 = SXComponentDependencyCreate(v207, v89, (void *)1, (void *)1, v87);
                          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v90);

                          id v91 = [v77 component];
                          __int16 v92 = [v91 identifier];
                          v93 = SXComponentDependencyCreate(v207, v92, (void *)1, (void *)2, v87);
                          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v93);

                          if ([v77 hasValidSize])
                          {
                            uint64_t v94 = [v77 component];
                            v95 = [v94 identifier];
                            [v7 invalidateSizeForComponentWithIdentifier:v95];
                          }
                          int v29 = v198;
                        }
                      }
                    }

                    goto LABEL_53;
                  }
                  uint64_t v74 = [v29 range];

                  if (v74 == 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_45;
                  }
                }
              }
LABEL_53:

LABEL_54:
              uint64_t v18 = v182 + 1;
            }
            while (v182 + 1 != v176);
            uint64_t v176 = [v171 countByEnumeratingWithState:&v235 objects:v249 count:16];
          }
          while (v176);
        }

        uint64_t v9 = v169 + 1;
      }
      while (v169 + 1 != v167);
      uint64_t v167 = [obj countByEnumeratingWithState:&v239 objects:v250 count:16];
    }
    while (v167);
  }

  long long v229 = 0u;
  long long v230 = 0u;
  long long v227 = 0u;
  long long v228 = 0u;
  v96 = [v7 componentIdentifiers];
  uint64_t v97 = [v96 countByEnumeratingWithState:&v227 objects:v247 count:16];
  if (!v97) {
    goto LABEL_110;
  }
  uint64_t v98 = v97;
  uint64_t v195 = *(void *)v228;
  id v180 = v96;
  do
  {
    for (uint64_t j = 0; j != v98; ++j)
    {
      if (*(void *)v228 != v195) {
        objc_enumerationMutation(v96);
      }
      v100 = *(void **)(*((void *)&v227 + 1) + 8 * j);
      v101 = [v7 componentBlueprintForComponentIdentifier:v100];
      v102 = [v101 component];
      v103 = [v102 anchor];
      if (v103)
      {
        v199 = v100;
        v104 = v103;
        v202 = v102;
        if ([v103 originAnchorPosition]) {
          uint64_t v105 = [v104 originAnchorPosition];
        }
        else {
          uint64_t v105 = [v104 targetAnchorPosition];
        }
        int v106 = [(SXColumnLayouter *)self layoutAttributeForAnchor:v105];
        int v192 = -[SXColumnLayouter layoutAttributeForAnchor:](self, "layoutAttributeForAnchor:", [v104 targetAnchorPosition]);
        v107 = [v104 targetComponentIdentifier];

        if (!v107)
        {
          v102 = v202;
          v103 = v104;
          if (!v106) {
            goto LABEL_108;
          }
          id v205 = v104;
          v109 = SXComponentDependencyCreate(v199, v199, (void *)1, (void *)2, 0);
          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v109);
          goto LABEL_107;
        }
        int v186 = v106;
        id v205 = v104;
        v108 = [v104 targetComponentIdentifier];
        v109 = [v7 componentBlueprintForComponentIdentifier:v108];

        if (v109)
        {
          if ([(SXColumnLayouter *)self componentBlueprint:v101 shouldIntersectWithComponentBlueprint:v109])
          {
            BOOL v110 = [v205 range] != 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            BOOL v110 = 0;
          }
          v183 = v101;
          NSUInteger v112 = [v101 columnRange];
          NSUInteger v114 = v113;
          v256.location = [v109 columnRange];
          v256.length = v115;
          v253.location = v112;
          v253.length = v114;
          if (NSIntersectionRange(v253, v256).length && !v110)
          {
            id v8 = (id)v210;
            v96 = v180;
            v101 = v183;
LABEL_79:
            v102 = v202;
LABEL_107:

            v103 = v205;
            goto LABEL_108;
          }
          v111 = [v205 targetComponentIdentifier];
          if ([v205 range] == 0x7FFFFFFFFFFFFFFFLL
            && ([v205 range], v116 == 0x7FFFFFFFFFFFFFFFLL))
          {
            v117 = +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, v186, v192, 1);
            v101 = v183;
            id v8 = (id)v210;
            if (![(SXColumnLayouter *)self anchorPossibleForComponentWithBlueprint:v183 anchoredToComponentWithBlueprint:v109 layoutBlueprint:v7 columnStack:v188])goto LABEL_105; {
          }
            }
          else
          {
            uint64_t v174 = j;
            uint64_t v118 = [v205 range];
            v117 = +[SXTextComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:v192 toLayoutAttribute:1 ignoreMargin:v118 withRange:v119];
            v101 = v183;
            NSUInteger v120 = [v183 columnRange];
            NSUInteger v122 = v121;
            v257.location = [v109 columnRange];
            v257.length = v123;
            v254.location = v120;
            v254.length = v122;
            id v8 = (id)v210;
            if (NSIntersectionRange(v254, v257).length)
            {
              if (![(SXColumnLayouter *)self intersectionPossibleForComponentWithBlueprint:v183 anchoredToComponentWithBlueprint:v109 layoutBlueprint:v7 columnStack:v188])
              {
                uint64_t j = v174;
                goto LABEL_105;
              }
              v170 = v109;
              id v172 = (id)v98;
              v124 = SXComponentDependencyCreate(v111, v199, (void *)2, (void *)2, v117);
              -[SXComponentDependencyResolver addDependency:](v210, v124);

              v177 = v117;
              v125 = SXComponentDependencyCreate(v199, v111, (void *)1, (void *)2, v117);
              -[SXComponentDependencyResolver addDependency:](v210, v125);

              v126 = SXComponentDependencyCreate(v111, v111, (void *)2, (void *)1, 0);
              -[SXComponentDependencyResolver addDependency:](v210, v126);

              -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:](v210, v199, 1);
              v127 = (id *)objc_claimAutoreleasedReturnValue();
              long long v223 = 0u;
              long long v224 = 0u;
              long long v225 = 0u;
              long long v226 = 0u;
              v168 = v127;
              -[SXComponentNode dependencies](v127);
              id v208 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v128 = [v208 countByEnumeratingWithState:&v223 objects:v246 count:16];
              if (v128)
              {
                uint64_t v129 = v128;
                uint64_t v130 = *(void *)v224;
                do
                {
                  for (uint64_t k = 0; k != v129; ++k)
                  {
                    if (*(void *)v224 != v130) {
                      objc_enumerationMutation(v208);
                    }
                    id v132 = *(id *)(*(void *)(*((void *)&v223 + 1) + 8 * k) + 16);
                    v133 = [v7 componentBlueprintForComponentIdentifier:v132];
                    if (([v132 isEqualToString:v111] & 1) == 0)
                    {
                      v134 = [v133 component];
                      [v134 anchor];
                      v136 = v135 = v111;
                      v137 = [v136 targetComponentIdentifier];
                      char v138 = [v137 isEqualToString:v135];

                      v111 = v135;
                      if ((v138 & 1) == 0)
                      {
                        v139 = SXComponentDependencyCreate(v135, v132, (void *)2, (void *)1, 0);
                        -[SXComponentDependencyResolver addDependency:](v210, v139);

                        v140 = SXComponentDependencyCreate(v135, v132, (void *)2, (void *)2, 0);
                        v111 = v135;
                        -[SXComponentDependencyResolver addDependency:](v210, v140);
                      }
                    }

                    id v7 = v197;
                  }
                  uint64_t v129 = [v208 countByEnumeratingWithState:&v223 objects:v246 count:16];
                }
                while (v129);
              }

              id v8 = (id)v210;
              uint64_t v98 = (uint64_t)v172;
              uint64_t j = v174;
              v109 = v170;
              v117 = v177;
            }
            else
            {
              uint64_t j = v174;
              if (![(SXColumnLayouter *)self anchorPossibleForComponentWithBlueprint:v183 anchoredToComponentWithBlueprint:v109 layoutBlueprint:v7 columnStack:v188])goto LABEL_105; {
            }
              }
          }
          uint64_t v141 = j;
          v142 = SXComponentDependencyCreate(v199, v111, (void *)1, (void *)1, v117);
          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v142);

          if (v186 | v192)
          {
            v143 = SXComponentDependencyCreate(v199, v111, (void *)1, (void *)2, v117);
            -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v143);

            if (v186)
            {
              v144 = SXComponentDependencyCreate(v199, v199, (void *)1, (void *)2, 0);
              -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v144);
            }
          }
          v145 = [v164 objectForKey:v111];
          if (!v145)
          {
            v145 = [MEMORY[0x263EFF980] array];
            [v164 setObject:v145 forKey:v111];
          }
          v146 = [v202 identifier];
          [v145 addObject:v146];

          uint64_t j = v141;
          v101 = v183;
LABEL_105:

          v96 = v180;
        }
        else
        {
          if (!v106) {
            goto LABEL_79;
          }
          v111 = SXComponentDependencyCreate(v199, v199, (void *)2, (void *)1, 0);
          -[SXComponentDependencyResolver addDependency:]((uint64_t)v8, v111);
        }
        v102 = v202;

        goto LABEL_107;
      }
LABEL_108:
    }
    uint64_t v98 = [v96 countByEnumeratingWithState:&v227 objects:v247 count:16];
  }
  while (v98);
LABEL_110:

  long long v221 = 0u;
  long long v222 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  id v181 = v164;
  uint64_t v178 = [v181 countByEnumeratingWithState:&v219 objects:v245 count:16];
  if (v178)
  {
    uint64_t v175 = *(void *)v220;
    do
    {
      uint64_t v147 = 0;
      do
      {
        if (*(void *)v220 != v175) {
          objc_enumerationMutation(v181);
        }
        uint64_t v187 = v147;
        v148 = *(void **)(*((void *)&v219 + 1) + 8 * v147);
        v196 = [v181 objectForKey:v148];
        -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:]((uint64_t)v8, v148, 1);
        v149 = (id *)objc_claimAutoreleasedReturnValue();
        long long v215 = 0u;
        long long v216 = 0u;
        long long v217 = 0u;
        long long v218 = 0u;
        v184 = v149;
        -[SXComponentNode dependencies](v149);
        id v190 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v200 = [v190 countByEnumeratingWithState:&v215 objects:v244 count:16];
        if (v200)
        {
          id v193 = *(id *)v216;
          do
          {
            uint64_t v150 = 0;
            do
            {
              if (*(id *)v216 != v193) {
                objc_enumerationMutation(v190);
              }
              uint64_t v203 = v150;
              uint64_t v151 = *(void *)(*((void *)&v215 + 1) + 8 * v150);
              +[SXComponentLayoutAttributeDescriptor descriptorWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]((uint64_t)SXComponentLayoutAttributeDescriptor, 0, 2, 0);
              id v206 = (id)objc_claimAutoreleasedReturnValue();
              long long v211 = 0u;
              long long v212 = 0u;
              long long v213 = 0u;
              long long v214 = 0u;
              id v152 = v196;
              uint64_t v153 = [v152 countByEnumeratingWithState:&v211 objects:v243 count:16];
              if (v153)
              {
                uint64_t v154 = v153;
                uint64_t v155 = *(void *)v212;
                do
                {
                  uint64_t v156 = 0;
                  id v209 = (id)v154;
                  do
                  {
                    if (*(void *)v212 != v155) {
                      objc_enumerationMutation(v152);
                    }
                    v157 = *(void **)(*((void *)&v211 + 1) + 8 * v156);
                    id v158 = *(id *)(v151 + 16);
                    if (([v152 containsObject:v158] & 1) == 0
                      && ([v158 isEqualToString:v148] & 1) == 0)
                    {
                      SXComponentDependencyCreate(v157, v158, (void *)1, (void *)1, v206);
                      uint64_t v159 = v155;
                      uint64_t v160 = v151;
                      v162 = v161 = v148;
                      -[SXComponentDependencyResolver addDependency:](v210, v162);

                      v163 = SXComponentDependencyCreate(v157, v158, (void *)2, (void *)1, v206);
                      -[SXComponentDependencyResolver addDependency:](v210, v163);

                      v148 = v161;
                      uint64_t v151 = v160;
                      uint64_t v155 = v159;
                      uint64_t v154 = (uint64_t)v209;
                    }

                    ++v156;
                  }
                  while (v154 != v156);
                  uint64_t v154 = [v152 countByEnumeratingWithState:&v211 objects:v243 count:16];
                }
                while (v154);
              }

              uint64_t v150 = v203 + 1;
            }
            while (v203 + 1 != v200);
            uint64_t v200 = [v190 countByEnumeratingWithState:&v215 objects:v244 count:16];
          }
          while (v200);
        }

        uint64_t v147 = v187 + 1;
        id v8 = (id)v210;
      }
      while (v187 + 1 != v178);
      uint64_t v178 = [v181 countByEnumeratingWithState:&v219 objects:v245 count:16];
    }
    while (v178);
  }
}

- (id)findComponentStackBeforeComponent:(id)a3 inColumnStack:(id)a4
{
  v20 = self;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v24 = [MEMORY[0x263EFF980] array];
  v25 = v5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v21 = v6;
  id obj = [v6 componentsBeforeComponent:v5];
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "component", v20);
        int v12 = [v11 anchor];
        v13 = [v12 targetComponentIdentifier];
        v14 = [v25 component];
        objc_super v15 = [v14 anchor];
        v16 = [v15 targetComponentIdentifier];
        char v17 = [v13 isEqualToString:v16];

        if (v17)
        {
          uint64_t v18 = [(SXColumnLayouter *)v20 findComponentStackBeforeComponent:v10 inColumnStack:v21];
          [v24 addObjectsFromArray:v18];
        }
        else
        {
          uint64_t v18 = [v10 component];
          [v24 addObject:v18];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  return v24;
}

- (CGPoint)calculatePositionForComponentNode:(id)a3 columnLayout:(id)a4 layoutBlueprint:(id)a5
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  uint64_t v7 = (id *)a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = -[SXFullscreenCaption text]((uint64_t)v7);
  id v11 = [v9 componentBlueprintForComponentIdentifier:v10];

  int v12 = [v11 componentLayout];
  uint64_t v128 = [v11 componentSizer];
  id v132 = v11;
  uint64_t v129 = v12;
  uint64_t v130 = v8;
  objc_msgSend(v8, "xPositionForColumnIndex:ignoreMargin:ignoreGutter:ignoreViewportPadding:", objc_msgSend(v11, "columnRange"), objc_msgSend(v128, "shouldIgnoreMarginsForColumnLayout:", v8), objc_msgSend(v12, "ignoreDocumentGutter"), objc_msgSend(v128, "shouldIgnoreViewportPaddingForColumnLayout:", v8));
  double v14 = v13;
  uint64_t v133 = [MEMORY[0x263EFF980] array];
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  v131 = v7;
  objc_super v15 = -[SXComponentNode dependencies](v7);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v138 objects:v142 count:16];
  if (!v16)
  {
    char v18 = 0;
    double v20 = 0.0;
    v22 = v132;
    v21 = (void *)v133;
    goto LABEL_39;
  }
  uint64_t v17 = v16;
  char v18 = 0;
  uint64_t v19 = *(void *)v139;
  double v20 = 0.0;
  v22 = v132;
  v21 = (void *)v133;
  uint64_t v134 = *(void *)v139;
  v135 = v15;
  do
  {
    uint64_t v23 = 0;
    uint64_t v137 = v17;
    do
    {
      if (*(void *)v139 != v19) {
        objc_enumerationMutation(v15);
      }
      uint64_t v24 = *(void *)(*((void *)&v138 + 1) + 8 * v23);
      v25 = -[SXTangierTextRenderCollectorItem componentIdentifier](v24);
      if ([v21 containsObject:v25]) {
        goto LABEL_34;
      }
      long long v26 = -[SXTangierTextRenderCollectorItem componentIdentifier](v24);

      if (!v26)
      {
        uint64_t v17 = v137;
        goto LABEL_35;
      }
      v25 = -[SXTangierTextRenderCollectorItem componentIdentifier](v24);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = -[SXTangierTextRenderCollectorItem componentIdentifier](v24);
        long long v28 = -[SXFullscreenCaption caption](v24);
        long long v29 = [v9 componentBlueprintForComponentIdentifier:v28 includeChildren:0];

        NSUInteger v30 = [v22 columnRange];
        NSUInteger v32 = v31;
        v145.location = [v29 columnRange];
        v145.length = v33;
        v144.location = v30;
        v144.length = v32;
        if (NSIntersectionRange(v144, v145).length)
        {
          v34 = -[SXTextComponentLayoutAttributeDescriptor resultingExclusionPath]((uint64_t)v27);
          if (v34)
          {
            uint64_t v35 = -[SXTextComponentLayoutAttributeDescriptor resultingExclusionPath]((uint64_t)v27);
          }
          else
          {
            v62 = [v29 exclusionPaths];
            -[SXFullscreenCaption text]((uint64_t)v131);
            v64 = id v63 = v9;
            uint64_t v35 = [v62 objectForKey:v64];

            id v9 = v63;
            v22 = v132;

            v21 = (void *)v133;
          }

          [v29 frame];
          double MinY = CGRectGetMinY(v153);
          -[SXTextExclusionPath position]((uint64_t)v35);
          double v67 = v66;
          -[SXTextExclusionPath position]((uint64_t)v35);
          if (v67 >= v68) {
            double v69 = v67;
          }
          else {
            double v69 = v68;
          }
          double v70 = MinY + v69;
          if (v70 >= v20) {
            double v20 = v70;
          }
          double v54 = -[SXTextExclusionPath insets]((uint64_t)v35) + v20;
        }
        else
        {
          double v55 = -[SXFullscreenCaption caption](v24);
          uint64_t v35 = [v9 componentBlueprintForComponentIdentifier:v55 includeChildren:0];

          double v56 = [v35 componentSizer];
          uint64_t v57 = -[SXTextComponentLayoutAttributeDescriptor range]((uint64_t)v27);
          objc_msgSend(v56, "verticalPositionForRange:", v57, v58);
          double v60 = v59;
          [v35 frame];
          double v61 = v60 + CGRectGetMinY(v152);
          if (v61 >= v20) {
            double v54 = v61;
          }
          else {
            double v54 = v20;
          }

          v21 = (void *)v133;
        }

        char v18 = 1;
        uint64_t v19 = v134;
        objc_super v15 = v135;
LABEL_32:

        double v20 = v54;
        goto LABEL_33;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = -[SXFullscreenCaption caption](v24);
        long long v27 = [v9 componentBlueprintForComponentIdentifier:v36];

        [v27 frame];
        double v37 = CGRectGetMinY(v147);
        [v27 frame];
        double Height = CGRectGetHeight(v148);
        -[SXColumnLayouter factorForLayoutAttribute:](self, "factorForLayoutAttribute:", -[SXComponentLayoutAttributeDescriptor toLayoutAttribute]((uint64_t)v25));
        double v40 = v37 + Height * v39;
        if (!-[SXComponentLayoutAttributeDescriptor ignoreMargins]((BOOL)v25))
        {
          [v27 frame];
          if (CGRectGetHeight(v149) != 0.0)
          {
            unitConverterFactory = self->_unitConverterFactory;
            [v27 frame];
            double Width = CGRectGetWidth(v150);
            [v9 blueprintSize];
            double v44 = v43;
            id v45 = [v9 layoutOptions];
            v46 = [(SXUnitConverterFactory *)unitConverterFactory createUnitConverterWithComponentWidth:v45 parentWidth:Width layoutOptions:v44];

            uint64_t v47 = [v27 componentLayout];
            v48 = [v47 margin];
            uint64_t v49 = [v48 bottom];
            objc_msgSend(v46, "convertValueToPoints:", v49, v50);
            double v40 = v40 + v51;

            uint64_t v19 = v134;
            objc_super v15 = v135;
          }
        }
        [v22 frame];
        double v52 = CGRectGetHeight(v151);
        -[SXColumnLayouter factorForLayoutAttribute:](self, "factorForLayoutAttribute:", -[SXComponentLayoutAttributeDescriptor fromLayoutAttribute]((uint64_t)v25));
        double v54 = v40 - v52 * v53;
        v21 = (void *)v133;
        if (v54 <= v20) {
          double v54 = v20;
        }
        else {
          char v18 = -[SXComponentLayoutAttributeDescriptor ignoreMargins]((BOOL)v25);
        }
        goto LABEL_32;
      }
LABEL_33:
      v71 = -[SXTangierTextRenderCollectorItem componentIdentifier](v24);
      [v21 addObject:v71];

      uint64_t v17 = v137;
LABEL_34:

LABEL_35:
      ++v23;
    }
    while (v17 != v23);
    uint64_t v17 = [v15 countByEnumeratingWithState:&v138 objects:v142 count:16];
  }
  while (v17);
LABEL_39:

  char v72 = [v22 component];
  uint64_t v73 = [v72 anchor];
  if (v73)
  {
    uint64_t v74 = (void *)v73;
    v75 = [v22 component];
    v76 = [v75 anchor];
    v77 = [v76 targetComponentIdentifier];
    NSUInteger v78 = v130;
    if (v77)
    {

      goto LABEL_46;
    }
    [v130 minimumHeight];
    double v80 = v79;

    if (v80 <= 0.0)
    {
LABEL_46:
      v22 = v132;
    }
    else
    {
      NSUInteger v81 = [v132 component];
      BOOL v82 = [v81 anchor];
      uint64_t v83 = [v82 originAnchorPosition];
      uint64_t v84 = [v132 component];
      long long v85 = [v84 anchor];
      char v86 = v85;
      if (v83) {
        uint64_t v87 = [v85 originAnchorPosition];
      }
      else {
        uint64_t v87 = [v85 targetAnchorPosition];
      }
      uint64_t v117 = v87;

      v22 = v132;
      uint64_t v118 = [v132 component];
      uint64_t v119 = [v118 anchor];
      uint64_t v120 = [v119 targetAnchorPosition];

      [v132 frame];
      double v121 = CGRectGetHeight(v157);
      [(SXColumnLayouter *)self factorForLayoutAttribute:[(SXColumnLayouter *)self layoutAttributeForAnchor:v117]];
      double v123 = v121 * v122;
      [v130 minimumHeight];
      double v125 = v124;
      [(SXColumnLayouter *)self factorForLayoutAttribute:[(SXColumnLayouter *)self layoutAttributeForAnchor:v120]];
      double v127 = v125 * v126 - v123;
      if (v127 >= v20) {
        double v20 = v127;
      }
      v18 |= v117 != 0;
      v21 = (void *)v133;
    }
  }
  else
  {

    NSUInteger v78 = v130;
  }
  [v22 frame];
  if (CGRectGetHeight(v154) == 0.0 && [v22 hasValidSize])
  {
    long long v88 = [v22 component];
    v89 = [v88 classification];
    int v90 = [v89 isCollapsible];

    v21 = (void *)v133;
  }
  else
  {
    int v90 = 1;
  }
  [v22 frame];
  double v91 = CGRectGetHeight(v155);
  if ((v18 & 1) != 0
    || (v91 != 0.0 ? (int v94 = 1) : (int v94 = v90), v91 == 0.0 && v94 && ([v22 hasValidSize] & 1) != 0))
  {
    v93 = v128;
    __int16 v92 = v129;
  }
  else
  {
    [v22 frame];
    double v95 = CGRectGetWidth(v156);
    v93 = v128;
    __int16 v92 = v129;
    if (([v22 hasValidSize] & 1) == 0)
    {
      v96 = [v22 componentSizer];
      uint64_t v97 = [v96 shouldIgnoreMarginsForColumnLayout:v78];

      uint64_t v98 = [v128 shouldIgnoreViewportPaddingForColumnLayout:v78];
      uint64_t v99 = [v22 columnRange];
      uint64_t v101 = v100;
      uint64_t v102 = [v129 ignoreDocumentGutter];
      uint64_t v103 = v99;
      v21 = (void *)v133;
      objc_msgSend(v78, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v103, v101, v97, v102, v98);
      double v95 = v104;
    }
    uint64_t v105 = self->_unitConverterFactory;
    [v9 blueprintSize];
    double v107 = v106;
    v108 = [v9 layoutOptions];
    v109 = [(SXUnitConverterFactory *)v105 createUnitConverterWithComponentWidth:v108 parentWidth:v95 layoutOptions:v107];

    BOOL v110 = [v129 margin];
    uint64_t v111 = [v110 top];
    objc_msgSend(v109, "convertValueToPoints:", v111, v112);
    double v114 = v113;

    double v20 = v20 + v114;
  }

  double v115 = v14;
  double v116 = v20;
  result.y = v116;
  result.x = v115;
  return result;
}

- (CGSize)calculateSizeForComponentNode:(id)a3 columnLayout:(id)a4 layoutBlueprint:(id)a5 dependencyResolver:(id)a6
{
  uint64_t v173 = *MEMORY[0x263EF8340];
  uint64_t v10 = (id *)a3;
  id v11 = a4;
  id v12 = a5;
  id v134 = a6;
  v136 = v10;
  double v13 = -[SXFullscreenCaption text]((uint64_t)v10);
  double v14 = [v12 componentBlueprintForComponentIdentifier:v13];

  uint64_t v15 = [v14 columnRange];
  uint64_t v17 = v16;
  char v18 = [v14 componentLayout];
  uint64_t v19 = [v14 componentSizer];
  uint64_t v20 = [v19 shouldIgnoreMarginsForColumnLayout:v11];
  uint64_t v130 = v19;
  uint64_t v21 = [v19 shouldIgnoreViewportPaddingForColumnLayout:v11];
  objc_msgSend(v11, "xPositionForColumnIndex:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v15, v20, objc_msgSend(v18, "ignoreDocumentGutter"), v21);
  double v23 = v22;
  uint64_t v133 = v18;
  CGRect v154 = v11;
  objc_msgSend(v11, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v15, v17, v20, objc_msgSend(v18, "ignoreDocumentGutter"), v21);
  double v25 = v24;
  v135 = self;
  unitConverterFactordouble y = self->_unitConverterFactory;
  [v12 blueprintSize];
  double v28 = v27;
  CGRect v149 = v12;
  long long v29 = v12;
  NSUInteger v30 = v14;
  uint64_t v31 = [v29 layoutOptions];
  uint64_t v32 = [(SXUnitConverterFactory *)unitConverterFactory createUnitConverterWithComponentWidth:v31 parentWidth:v25 layoutOptions:v28];

  NSUInteger v33 = [v14 componentSizer];
  NSRange v144 = (void *)v32;
  [v33 contentInsetsWithUnitConverter:v32];
  double v35 = v34;
  double v37 = v36;

  double v38 = v35 + v37;
  double v39 = [MEMORY[0x263EFF980] array];
  double v40 = [v30 componentSizer];
  objc_opt_class();
  LOBYTE(v31) = objc_opt_isKindOfClass();

  if (v31)
  {
    double v41 = [v30 componentSizer];
    [v41 removeAllExclusionPaths];
  }
  double v129 = v25 - v38;
  v42 = -[SXComponentNode dependencies](v136);
  double v43 = [(SXColumnLayouter *)self sortComponentDependencies:v42 forBlueprint:v149];

  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v44 = v43;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v168 objects:v172 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v169;
    double v140 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v141 = *MEMORY[0x263F1D1C0];
    double v138 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    double v139 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v131 = *(double *)(MEMORY[0x263F00148] + 8);
    double v132 = *MEMORY[0x263F00148];
    double v142 = v23;
    double v143 = v25;
    id v146 = v44;
    CGRect v147 = v39;
    uint64_t v152 = *(void *)v169;
    uint64_t v137 = v30;
    do
    {
      uint64_t v48 = 0;
      uint64_t v148 = v46;
      do
      {
        if (*(void *)v169 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v49 = *(void *)(*((void *)&v168 + 1) + 8 * v48);
        uint64_t v50 = -[SXTangierTextRenderCollectorItem componentIdentifier](v49);
        char v51 = [v39 containsObject:v50];

        if ((v51 & 1) == 0)
        {
          double v52 = [v30 component];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            double v54 = [v30 component];
            double v55 = -[SXTangierTextRenderCollectorItem componentIdentifier](v49);
            objc_opt_class();
            char v56 = objc_opt_isKindOfClass();

            if (v56)
            {
              CGRect v151 = v54;
              uint64_t v57 = [v54 identifier];
              uint64_t v58 = [v149 componentBlueprintForComponentIdentifier:v57 includeChildren:1];

              double v59 = [v58 componentSizer];
              CGRect v150 = v58;
              double v60 = [v58 componentLayout];
              CGRect v153 = -[SXTangierTextRenderCollectorItem componentIdentifier](v49);
              uint64_t v61 = [v59 shouldIgnoreMarginsForColumnLayout:v154];
              uint64_t v62 = [v59 shouldIgnoreViewportPaddingForColumnLayout:v154];
              id v63 = -[SXFullscreenCaption caption](v49);
              v64 = [v149 componentBlueprintForComponentIdentifier:v63];

              v65 = [v64 componentLayout];
              objc_msgSend(v154, "xPositionForColumnIndex:ignoreMargin:ignoreGutter:ignoreViewportPadding:", objc_msgSend(v64, "columnRange"), v61, objc_msgSend(v60, "ignoreDocumentGutter"), v62);
              CGFloat v67 = v66;
              uint64_t v68 = [v64 columnRange];
              objc_msgSend(v154, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v68, v69, v61, objc_msgSend(v60, "ignoreDocumentGutter"), v62);
              CGFloat v71 = v70;
              CGRect v155 = v65;
              char v72 = [v65 margin];
              uint64_t v73 = [v72 bottom];
              objc_msgSend(v144, "convertValueToPoints:", v73, v74);
              double v76 = v75;

              [v64 frame];
              v182.size.double height = v76 + CGRectGetHeight(v175);
              v176.origin.double y = 0.0;
              v182.origin.double y = 0.0;
              v176.origin.x = v23;
              v176.size.double width = v25;
              v176.size.double height = 1.79769313e308;
              v182.origin.x = v67;
              v182.size.double width = v71;
              CGRect v177 = CGRectIntersection(v176, v182);
              double y = v177.origin.y;
              double width = v177.size.width;
              double height = v177.size.height;
              double v80 = v177.origin.x - v23;
              BOOL v81 = v177.origin.x - v23 == 0.0;
              double v82 = v140;
              if (!v81) {
                double v82 = (double)objc_msgSend(v154, "gutter", v140);
              }
              double v145 = v82;
              v178.origin.x = v80;
              v178.origin.double y = y;
              v178.size.double width = width;
              v178.size.double height = height;
              double MaxX = CGRectGetMaxX(v178);
              v179.origin.double y = 0.0;
              v179.origin.x = v23;
              v179.size.double width = v25;
              v179.size.double height = 1.79769313e308;
              double v84 = MaxX + CGRectGetMinX(v179);
              v180.origin.double y = 0.0;
              v180.origin.x = v23;
              v180.size.double width = v25;
              v180.size.double height = 1.79769313e308;
              double v85 = v138;
              if (v84 != CGRectGetMaxX(v180)) {
                double v85 = (double)[v154 gutter];
              }
              char v86 = v153;
              double v87 = v141;
              NSUInteger v30 = v137;
              id v44 = v146;
              uint64_t v46 = v148;
              if (-[SXTextComponentLayoutAttributeDescriptor range]((uint64_t)v153))
              {
                long long v88 = [v155 margin];
                uint64_t v89 = [v88 top];
                objc_msgSend(v144, "convertValueToPoints:", v89, v90);
                double v87 = v91;
              }
              double v92 = v139;
              if (-[SXComponentLayoutAttributeDescriptor fromLayoutAttribute]((uint64_t)v153) != 2)
              {
                v93 = [v155 margin];
                uint64_t v94 = [v93 bottom];
                objc_msgSend(v144, "convertValueToPoints:", v94, v95);
                double v92 = v96;
              }
              [v64 frame];
              uint64_t v97 = v59;
              if (CGRectGetHeight(v181) != 0.0 && [v59 stringLength])
              {
                unint64_t v98 = -[SXTextComponentLayoutAttributeDescriptor range]((uint64_t)v153);
                uint64_t v99 = [v59 stringLength];
                if (v98 >= v99 - 1) {
                  unint64_t v98 = v99 - 1;
                }
                uint64_t v100 = [SXTextExclusionPath alloc];
                id v103 = -[SXTextExclusionPath initWithTextRange:position:rect:withInsets:](v100, v98, 0, v80, y, v132, v131, width, height, v101, v102, v87, v145, v92, v85);
                double v104 = -[SXFullscreenCaption caption](v49);
                -[SXTextExclusionPath setComponentIdentifier:]((uint64_t)v103, v104);

                -[SXTextExclusionPath setVerticalAlignmentFactor:]((uint64_t)v103, 0.0);
                -[SXTextExclusionPath setLineVerticalAlignment:]((uint64_t)v103, 1);
                unint64_t v105 = [v64 columnRange];
                if (v105 <= [v150 columnRange])
                {
                  [v64 columnRange];
                  unint64_t v108 = v107;
                  [v150 columnRange];
                  char v106 = v108 >= v109;
                }
                else
                {
                  char v106 = 0;
                }
                -[SXTextExclusionPath setFullBleed:]((uint64_t)v103, v106);
                newValue[0] = MEMORY[0x263EF8330];
                newValue[1] = 3221225472;
                newValue[2] = __98__SXColumnLayouter_calculateSizeForComponentNode_columnLayout_layoutBlueprint_dependencyResolver___block_invoke;
                newValue[3] = &unk_264651378;
                id v159 = v134;
                uint64_t v160 = v49;
                v161 = v136;
                id v162 = v149;
                v163 = v135;
                id v110 = v59;
                id v164 = v110;
                id v165 = v137;
                id v166 = v144;
                id v167 = v133;
                -[SXTextExclusionPath setMinYBlock:](v103, (char *)newValue);
                v156[0] = MEMORY[0x263EF8330];
                v156[1] = 3221225472;
                v156[2] = __98__SXColumnLayouter_calculateSizeForComponentNode_columnLayout_layoutBlueprint_dependencyResolver___block_invoke_2;
                v156[3] = &unk_2646513A0;
                id v157 = v153;
                -[SXTextExclusionPath setCompletionBlock:](v103, (char *)v156);
                [v110 addExclusionPath:v103];
                uint64_t v111 = -[SXFullscreenCaption caption](v49);
                [v150 addExclusionPath:v103 forIdentifier:v111];

                uint64_t v112 = -[SXTangierTextRenderCollectorItem componentIdentifier](v49);
                [v147 addObject:v112];

                uint64_t v97 = v59;
                char v86 = v153;

                id v44 = v146;
              }

              double v23 = v142;
              double v25 = v143;
              double v39 = v147;
              double v54 = v151;
            }

            uint64_t v47 = v152;
          }
        }
        ++v48;
      }
      while (v46 != v48);
      uint64_t v46 = [v44 countByEnumeratingWithState:&v168 objects:v172 count:16];
    }
    while (v46);
  }

  double v113 = [(SXLayoutContextFactory *)v135->_layoutContextFactory createLayoutContextForColumnLayout:v154 unitConverter:v144];
  double v114 = [v30 componentSizer];
  [v114 calculateHeightForWidth:v113 layoutContext:v129];
  double v116 = v115;

  uint64_t v117 = [v30 componentSizer];
  [v117 contentInsetsWithUnitConverter:v144];
  double v119 = v118;
  double v121 = v120;

  double v122 = v116 + v119 + v121;
  [v133 minimumHeight];
  if (v123)
  {
    uint64_t v124 = [v133 minimumHeight];
    objc_msgSend(v144, "convertValueToPoints:", v124, v125);
    if (v122 < v126) {
      double v122 = v126;
    }
  }

  double v127 = v25;
  double v128 = v122;
  result.double height = v128;
  result.double width = v127;
  return result;
}

double __98__SXColumnLayouter_calculateSizeForComponentNode_columnLayout_layoutBlueprint_dependencyResolver___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = -[SXFullscreenCaption caption](*(void *)(a1 + 40));
  -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:](v2, v3, 1);
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v5 = -[SXComponentNode dependencies](v4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v53 = v4;
    BOOL v54 = 0;
    uint64_t v8 = *(void *)v57;
    double v9 = 0.0;
    uint64_t v55 = *(void *)v57;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        id v12 = -[SXFullscreenCaption caption](v11);
        double v13 = -[SXFullscreenCaption text](*(void *)(a1 + 48));
        if ([v12 isEqualToString:v13])
        {
          double v14 = v9;
        }
        else
        {
          uint64_t v15 = v7;
          uint64_t v16 = v5;
          uint64_t v17 = -[SXFullscreenCaption caption](v11);
          char v18 = -[SXFullscreenCaption caption](*(void *)(a1 + 40));
          char v19 = [v17 isEqualToString:v18];

          if (v19)
          {
            id v5 = v16;
            uint64_t v8 = v55;
            uint64_t v7 = v15;
            continue;
          }
          id v12 = -[SXTangierTextRenderCollectorItem componentIdentifier](v11);
          uint64_t v20 = *(void **)(a1 + 56);
          uint64_t v21 = -[SXFullscreenCaption caption](v11);
          double v13 = [v20 componentBlueprintForComponentIdentifier:v21];

          if ([v13 hasValidLayout])
          {
            [v13 frame];
            double MinY = CGRectGetMinY(v62);
            [v13 frame];
            double Height = CGRectGetHeight(v63);
            [*(id *)(a1 + 64) factorForLayoutAttribute:-[SXComponentLayoutAttributeDescriptor toLayoutAttribute]((uint64_t)v12)];
            double v25 = MinY + Height * v24;
          }
          else
          {
            long long v26 = *(void **)(a1 + 72);
            double v27 = [v13 component];
            double v28 = [v27 identifier];
            long long v29 = [v26 existingExclusionPathForComponentWithIdentifier:v28];
            -[SXTextExclusionPath position]((uint64_t)v29);
            double v31 = v30;

            [v13 frame];
            double v32 = CGRectGetHeight(v64);
            [*(id *)(a1 + 64) factorForLayoutAttribute:-[SXComponentLayoutAttributeDescriptor toLayoutAttribute]((uint64_t)v12)];
            double v34 = v31 + v32 * v33;
            [*(id *)(a1 + 80) frame];
            double v25 = v34 + CGRectGetMinY(v65);
          }
          if (!-[SXComponentLayoutAttributeDescriptor ignoreMargins]((BOOL)v12))
          {
            double v35 = [v13 componentLayout];
            double v36 = *(void **)(a1 + 88);
            double v37 = [v35 margin];
            uint64_t v38 = [v37 bottom];
            objc_msgSend(v36, "convertValueToPoints:", v38, v39);
            double v41 = v40;

            [v13 frame];
            if (CGRectGetHeight(v66) == 0.0) {
              double v42 = 0.0;
            }
            else {
              double v42 = v41;
            }
            double v25 = v25 + v42;
          }
          uint64_t v7 = v15;
          [v13 frame];
          double v43 = CGRectGetHeight(v67);
          [*(id *)(a1 + 64) factorForLayoutAttribute:-[SXComponentLayoutAttributeDescriptor fromLayoutAttribute]((uint64_t)v12)];
          double v14 = v25 - v43 * v44;
          if (v14 <= v9) {
            double v14 = v9;
          }
          else {
            BOOL v54 = -[SXComponentLayoutAttributeDescriptor ignoreMargins]((BOOL)v12);
          }
          id v5 = v16;
          uint64_t v8 = v55;
        }

        double v9 = v14;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (!v7)
      {

        v4 = v53;
        if (v54) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
    }
  }

  double v9 = 0.0;
LABEL_28:
  uint64_t v45 = *(void **)(a1 + 88);
  uint64_t v46 = [*(id *)(a1 + 96) margin];
  uint64_t v47 = [v46 top];
  objc_msgSend(v45, "convertValueToPoints:", v47, v48);
  double v50 = v49;

  double v9 = v9 + v50;
LABEL_29:
  [*(id *)(a1 + 80) frame];
  double v51 = CGRectGetMinY(v68);

  return v9 - v51;
}

void __98__SXColumnLayouter_calculateSizeForComponentNode_columnLayout_layoutBlueprint_dependencyResolver___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)analyzeSnapLinesForLayoutBlueprint:(id)a3
{
  double v30 = self;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9B0] orderedSet];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [v3 componentIdentifiers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    uint64_t v31 = *(void *)v39;
    do
    {
      uint64_t v8 = 0;
      uint64_t v32 = v6;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = objc_msgSend(v3, "componentBlueprintForComponentIdentifier:", *(void *)(*((void *)&v38 + 1) + 8 * v8), v30);
        if ([v9 hasValidLayout])
        {
          id v10 = v3;
          [v9 absoluteFrame];
          CGFloat v12 = v11;
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          [v9 absoluteFrame];
          char v19 = [NSNumber numberWithDouble:CGRectGetMinY(v45)];
          [v4 addObject:v19];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [v9 layoutBlueprint];
            [(SXColumnLayouter *)v30 analyzeSnapLinesForLayoutBlueprint:v20];
          }
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t v21 = [v9 componentSizer];
          double v22 = [v21 snapLines];

          uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v35;
            do
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v35 != v25) {
                  objc_enumerationMutation(v22);
                }
                [*(id *)(*((void *)&v34 + 1) + 8 * v26) floatValue];
                double v28 = v27;
                v46.origin.x = v12;
                v46.origin.double y = v14;
                v46.size.double width = v16;
                v46.size.double height = v18;
                long long v29 = [NSNumber numberWithDouble:CGRectGetMinY(v46) + v28];
                [v4 addObject:v29];

                ++v26;
              }
              while (v24 != v26);
              uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v24);
          }

          id v3 = v10;
          uint64_t v7 = v31;
          uint64_t v6 = v32;
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v6);
  }

  [v3 setSnapLines:v4];
}

- (id)columnStackForLayoutBlueprint:(id)a3 columnLayout:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v25 = -[SXColumnStack initWithNumberOfColumns:]([SXColumnStack alloc], "initWithNumberOfColumns:", [v6 numberOfColumns]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = v5;
  id obj = [v5 componentIdentifiers];
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        CGFloat v12 = [v7 componentBlueprintForComponentIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        double v13 = [v12 componentSizer];
        CGFloat v14 = [v12 componentLayout];
        uint64_t v15 = [v14 columnRange];
        uint64_t v17 = objc_msgSend(v6, "convertColumnRange:minimumColumnLength:", v15, v16, objc_msgSend(v13, "minimumColumnLength"));
        uint64_t v19 = v18;

        uint64_t v20 = objc_msgSend(v13, "overrideColumnLayoutForColumnRange:inColumnLayout:", v17, v19, v6);
        uint64_t v22 = v21;
        if (v20 + v21 > (unint64_t)[v6 numberOfColumns]) {
          uint64_t v22 = [v6 numberOfColumns] - v20;
        }
        objc_msgSend(v12, "setColumnRange:", v20, v22);
        [(SXColumnStack *)v25 addComponentBlueprint:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  return v25;
}

- (id)sortComponentDependencies:(id)a3 forBlueprint:(id)a4
{
  id v5 = a4;
  id v6 = [a3 allObjects];
  uint64_t v7 = (void *)[v6 mutableCopy];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__SXColumnLayouter_sortComponentDependencies_forBlueprint___block_invoke;
  v10[3] = &unk_2646513C8;
  id v11 = v5;
  id v8 = v5;
  [v7 sortUsingComparator:v10];

  return v7;
}

uint64_t __59__SXColumnLayouter_sortComponentDependencies_forBlueprint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 componentIdentifiers];
  uint64_t v9 = -[SXFullscreenCaption caption]((uint64_t)v7);

  unint64_t v10 = [v8 indexOfObject:v9];
  id v11 = [*(id *)(a1 + 32) componentIdentifiers];
  CGFloat v12 = -[SXFullscreenCaption caption]((uint64_t)v6);

  if (v10 < [v11 indexOfObject:v12]) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 1;
  }

  return v13;
}

- (BOOL)anchorPossibleForComponentWithBlueprint:(id)a3 anchoredToComponentWithBlueprint:(id)a4 layoutBlueprint:(id)a5 columnStack:(id)a6
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v11 componentIdentifiers];
  CGFloat v14 = [v9 component];
  uint64_t v15 = [v14 identifier];
  unint64_t v16 = [v13 indexOfObjectIdenticalTo:v15];

  uint64_t v17 = [v11 componentIdentifiers];
  double v51 = v10;
  uint64_t v18 = [v10 component];
  uint64_t v19 = [v18 identifier];
  unint64_t v20 = [v17 indexOfObjectIdenticalTo:v19];

  if (v16 <= v20)
  {
    [v12 componentsAfterComponent:v9];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v21 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      id v49 = v12;
      id v50 = v9;
      uint64_t v38 = *(void *)v53;
LABEL_14:
      uint64_t v39 = 0;
      while (1)
      {
        if (*(void *)v53 != v38) {
          objc_enumerationMutation(v21);
        }
        long long v40 = *(void **)(*((void *)&v52 + 1) + 8 * v39);
        long long v41 = [v40 component];
        long long v28 = [v41 identifier];

        double v42 = [v11 componentIdentifiers];
        unint64_t v43 = [v42 indexOfObjectIdenticalTo:v28];

        if (v43 < v20)
        {
          NSUInteger v44 = [v40 columnRange];
          NSUInteger v46 = v45;
          v66.location = [v51 columnRange];
          v66.length = v47;
          v64.location = v44;
          v64.length = v46;
          if (NSIntersectionRange(v64, v66).length) {
            goto LABEL_22;
          }
        }

        if (v37 == ++v39)
        {
          uint64_t v37 = [v21 countByEnumeratingWithState:&v52 objects:v60 count:16];
          BOOL v35 = 1;
          if (v37) {
            goto LABEL_14;
          }
          goto LABEL_23;
        }
      }
    }
LABEL_24:
    BOOL v35 = 1;
    goto LABEL_25;
  }
  [v12 componentsBeforeComponent:v9];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (!v22) {
    goto LABEL_24;
  }
  uint64_t v23 = v22;
  id v49 = v12;
  id v50 = v9;
  uint64_t v24 = *(void *)v57;
LABEL_4:
  uint64_t v25 = 0;
  while (1)
  {
    if (*(void *)v57 != v24) {
      objc_enumerationMutation(v21);
    }
    long long v26 = *(void **)(*((void *)&v56 + 1) + 8 * v25);
    long long v27 = [v26 component];
    long long v28 = [v27 identifier];

    long long v29 = [v11 componentIdentifiers];
    unint64_t v30 = [v29 indexOfObjectIdenticalTo:v28];

    if (v30 > v20)
    {
      NSUInteger v31 = [v26 columnRange];
      NSUInteger v33 = v32;
      v65.location = [v51 columnRange];
      v65.length = v34;
      v63.location = v31;
      v63.length = v33;
      if (NSIntersectionRange(v63, v65).length) {
        break;
      }
    }

    if (v23 == ++v25)
    {
      uint64_t v23 = [v21 countByEnumeratingWithState:&v56 objects:v61 count:16];
      BOOL v35 = 1;
      if (v23) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
LABEL_22:

  BOOL v35 = 0;
LABEL_23:
  id v12 = v49;
  id v9 = v50;
LABEL_25:

  return v35;
}

- (BOOL)intersectionPossibleForComponentWithBlueprint:(id)a3 anchoredToComponentWithBlueprint:(id)a4 layoutBlueprint:(id)a5 columnStack:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CGFloat v14 = NSString;
  uint64_t v15 = [v10 component];
  unint64_t v16 = [v15 identifier];
  uint64_t v17 = [v11 component];
  uint64_t v18 = [v17 identifier];
  uint64_t v19 = [v14 stringWithFormat:@"%@-%@", v16, v18];

  unint64_t v20 = [(NSMutableDictionary *)self->_intersectionCache objectForKey:v19];
  id v21 = v20;
  if (v20)
  {
    LOBYTE(v22) = [v20 BOOLValue];
  }
  else
  {
    uint64_t v23 = [v11 component];
    uint64_t v24 = [v23 anchor];

    NSUInteger v25 = [v10 columnRange];
    NSUInteger v27 = v26;
    v52.location = [v11 columnRange];
    v52.length = v28;
    v51.location = v25;
    v51.length = v27;
    id v50 = v12;
    if (NSIntersectionRange(v51, v52).length)
    {
      id v49 = v24;
      long long v29 = [v24 targetComponentIdentifier];
      unint64_t v30 = [v10 component];
      NSUInteger v31 = [v30 identifier];
      char v32 = [v29 isEqualToString:v31];

      if (v32)
      {
        uint64_t v22 = 0;
        uint64_t v24 = v49;
      }
      else
      {
        NSUInteger v33 = [v50 componentIdentifiers];
        NSUInteger v34 = [v10 component];
        BOOL v35 = [v34 identifier];
        unint64_t v48 = [v33 indexOfObjectIdenticalTo:v35];

        uint64_t v36 = [v50 componentIdentifiers];
        uint64_t v37 = [v11 component];
        uint64_t v38 = [v37 identifier];
        unint64_t v39 = [v36 indexOfObjectIdenticalTo:v38];

        if (v48 <= v39)
        {
          long long v40 = [v13 componentsBeforeComponent:v11];
          long long v41 = self;
          id v42 = v13;
          unint64_t v43 = v40;
          id v44 = v10;
        }
        else
        {
          long long v40 = [v13 componentsBeforeComponent:v10];
          long long v41 = self;
          id v42 = v13;
          unint64_t v43 = v40;
          id v44 = v11;
        }
        uint64_t v22 = [(SXColumnLayouter *)v41 stack:v42 stackComponents:v43 containsComponentIncludingAnchoredComponents:v44 forSourceComponent:v10];
        uint64_t v24 = v49;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    intersectionCache = self->_intersectionCache;
    NSUInteger v46 = [NSNumber numberWithBool:v22];
    [(NSMutableDictionary *)intersectionCache setObject:v46 forKey:v19];

    id v12 = v50;
  }

  return v22;
}

- (BOOL)stack:(id)a3 stackComponents:(id)a4 containsComponentIncludingAnchoredComponents:(id)a5 forSourceComponent:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v38 = v9;
  id v13 = [v9 allComponentsBeforeComponent:v11];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v43;
    BOOL v17 = 1;
    uint64_t v36 = v13;
    uint64_t v40 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(id *)(*((void *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(v13, "containsObject:", v19, v36) & 1) == 0)
        {
          unint64_t v20 = [v19 component];
          id v21 = [v20 anchor];

          if (v19 == v11) {
            goto LABEL_20;
          }
          NSUInteger v22 = [v19 columnRange];
          NSUInteger v24 = v23;
          v50.location = [v12 columnRange];
          v50.length = v25;
          v48.location = v22;
          v48.length = v24;
          if (NSIntersectionRange(v48, v50).length)
          {
            NSUInteger v26 = [v19 columnRange];
            NSUInteger v28 = v27;
            v51.location = [v11 columnRange];
            v51.length = v29;
            v49.location = v26;
            v49.length = v28;
            if (NSIntersectionRange(v49, v51).length)
            {
              unint64_t v30 = [v12 component];
              NSUInteger v31 = [v30 anchor];
              char v32 = [v31 targetComponentIdentifier];
              NSUInteger v33 = [v21 targetComponentIdentifier];
              if (![v32 isEqualToString:v33])
              {

LABEL_19:
                BOOL v17 = 0;
                id v13 = v36;
LABEL_20:

                goto LABEL_21;
              }
              uint64_t v39 = [v21 range];

              if (v39 == 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_19;
              }
              NSUInteger v34 = [v38 componentsBeforeComponent:v19];
              BOOL v17 = [(SXColumnLayouter *)self stack:v38 stackComponents:v34 containsComponentIncludingAnchoredComponents:v11 forSourceComponent:v12];

              id v13 = v36;
            }
          }

          uint64_t v16 = v40;
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_21:

  return v17;
}

- (BOOL)componentBlueprint:(id)a3 shouldIntersectWithComponentBlueprint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 columnRange];
  if (v7 <= [v6 columnRange])
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v8 = [v5 columnRange];
    [v5 columnRange];
    unint64_t v10 = v9 + v8;
    uint64_t v11 = [v6 columnRange];
    [v6 columnRange];
    BOOL v13 = v10 >= v12 + v11;
  }
  uint64_t v14 = [v6 componentSizer];
  char v15 = [v14 allowComponentIntersection];

  return v15 & v13;
}

- (double)factorForLayoutAttribute:(int)a3
{
  double result = 0.0;
  if (a3 == 1) {
    double result = 0.5;
  }
  if (a3 == 2) {
    return 1.0;
  }
  return result;
}

- (int)layoutAttributeForAnchor:(int64_t)a3
{
  if (a3 == 3) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (SXLayouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXLayouterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXLayouterFactory)layouterFactory
{
  return self->_layouterFactory;
}

- (NSMutableDictionary)intersectionCache
{
  return self->_intersectionCache;
}

- (SXLayoutContextFactory)layoutContextFactory
{
  return self->_layoutContextFactory;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_layoutContextFactory, 0);
  objc_storeStrong((id *)&self->_intersectionCache, 0);
  objc_storeStrong((id *)&self->_layouterFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end