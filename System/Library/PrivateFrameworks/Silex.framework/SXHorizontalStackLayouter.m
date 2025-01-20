@interface SXHorizontalStackLayouter
- (SXLayouterDelegate)delegate;
- (double)calculatePositionForComponentWithBlueprint:(uint64_t)a1 layout:(void *)a2 unitConverter:(void *)a3 margin:(void *)a4 maximumY:(void *)a5 layoutBlueprint:(void *)a6;
- (double)calculateSizeForComponentWithBlueprint:(void *)a3 width:(double)a4 layoutContext:;
- (double)calculateSizeForContainerComponentWithBlueprint:(void *)a3 width:(void *)a4 layoutContext:(uint64_t)a5 layoutDescription:(double)a6 shouldContinue:;
- (id)childColumnLayoutForContainerComponentWidth:(void *)a3 componentWidth:(void *)a4 componentBlueprint:(double)a5 columnLayout:(double)a6 unitConverter:;
- (id)initWithContainerComponent:(void *)a3 layouterFactory:(void *)a4 columnCalculator:(void *)a5 layoutContextFactory:(void *)a6 unitConverterFactory:;
- (void)layoutBlueprint:(id)a3 columnLayout:(id)a4 description:(id)a5 shouldContinue:(BOOL *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation SXHorizontalStackLayouter

- (id)initWithContainerComponent:(void *)a3 layouterFactory:(void *)a4 columnCalculator:(void *)a5 layoutContextFactory:(void *)a6 unitConverterFactory:
{
  id v18 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)SXHorizontalStackLayouter;
    v16 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
      objc_storeStrong(a1 + 5, a5);
      objc_storeStrong(a1 + 6, a6);
    }
  }

  return a1;
}

- (void)layoutBlueprint:(id)a3 columnLayout:(id)a4 description:(id)a5 shouldContinue:(BOOL *)a6
{
  uint64_t v215 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v166 = a4;
  id v167 = a5;
  v9 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = [v167 taskIdentifier];
    *(_DWORD *)buf = 134218242;
    id v212 = v8;
    __int16 v213 = 2114;
    v214 = v11;
    _os_log_impl(&dword_222AC5000, v10, OS_LOG_TYPE_DEFAULT, "Starting horizontal stack layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);
  }
  if (self) {
    containerComponentBlueprint = self->_containerComponentBlueprint;
  }
  else {
    containerComponentBlueprint = 0;
  }
  id v13 = [(SXContainerComponentBlueprint *)containerComponentBlueprint layoutBlueprint];
  id v14 = [v13 componentIdentifiers];
  id v15 = (void *)[v14 copy];

  if (self) {
    v16 = self->_containerComponentBlueprint;
  }
  else {
    v16 = 0;
  }
  v17 = [(SXComponentBlueprint *)v16 componentLayout];
  if (self) {
    id v18 = self->_containerComponentBlueprint;
  }
  else {
    id v18 = 0;
  }
  objc_super v19 = [(SXComponentBlueprint *)v18 componentSizer];
  uint64_t v20 = [v19 shouldIgnoreMarginsForColumnLayout:v166];

  if (self) {
    v21 = self->_containerComponentBlueprint;
  }
  else {
    v21 = 0;
  }
  v22 = [(SXComponentBlueprint *)v21 componentSizer];
  uint64_t v23 = [v22 shouldIgnoreViewportPaddingForColumnLayout:v166];

  if (self) {
    v24 = self->_containerComponentBlueprint;
  }
  else {
    v24 = 0;
  }
  uint64_t v25 = [(SXComponentBlueprint *)v24 columnRange];
  objc_msgSend(v166, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v25, v26, v20, objc_msgSend(v17, "ignoreDocumentGutter"), v23);
  double v28 = v27;
  v164 = v17;
  if (self) {
    unitConverterFactory = self->_unitConverterFactory;
  }
  else {
    unitConverterFactory = 0;
  }
  v30 = unitConverterFactory;
  v31 = [v8 layoutOptions];
  v168 = [(SXUnitConverterFactory *)v30 createUnitConverterWithComponentWidth:v31 parentWidth:0.0 layoutOptions:v28];

  v174 = objc_alloc_init(SXHorizontalStackLayoutCalculator);
  v173 = [MEMORY[0x263EFF980] array];
  v178 = [MEMORY[0x263EFF980] array];
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  id v32 = v15;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v201 objects:v210 count:16];
  v180 = v8;
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v202;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v202 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v201 + 1) + 8 * i);
        v38 = [v8 componentBlueprintForComponentIdentifier:v37];
        v39 = [v38 component];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          [(SXHorizontalStackLayoutCalculator *)v174 addFlexibleItemWithIdentifier:v37];
          [v173 addObject:v37];
        }
        else
        {
          v41 = [v38 componentLayout];
          uint64_t v42 = [v41 minimumWidth];
          objc_msgSend(v168, "convertValueToPoints:", v42, v43);
          double v45 = fmax(v44, 0.0);
          uint64_t v46 = [v41 maximumWidth];
          objc_msgSend(v168, "convertValueToPoints:", v46, v47);
          double v49 = fmax(v48, 0.0);
          if (v49 >= 0.00000011920929) {
            double v50 = v49;
          }
          else {
            double v50 = v28;
          }
          [(SXHorizontalStackLayoutCalculator *)v174 addItemWithMinimumWidth:v37 maximumWidth:v45 identifier:v50];
          [v178 addObject:v37];
        }
        id v8 = v180;
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v201 objects:v210 count:16];
    }
    while (v34);
  }

  v179 = [(SXHorizontalStackLayoutCalculator *)v174 layoutForComponentWidth:v28];
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id v51 = v32;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v197 objects:v209 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v198;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v198 != v54) {
          objc_enumerationMutation(v51);
        }
        uint64_t v56 = *(void *)(*((void *)&v197 + 1) + 8 * j);
        [v179 widthForIdentifier:v56];
        if (v57 < 2.22044605e-16)
        {
          v58 = [v180 componentBlueprintForComponentIdentifier:v56];
          [v58 setHidden:1];
          [v173 removeObject:v56];
          [v178 removeObject:v56];
        }
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v197 objects:v209 count:16];
    }
    while (v53);
  }

  v59 = v180;
  v60 = [v180 componentIdentifiers];

  v61 = (id *)-[SXComponentDependencyResolver initWithComponentIdentifiers:]([SXComponentDependencyResolver alloc], v60);
  [v180 setDependencySolver:v61];
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  obuint64_t j = v60;
  uint64_t v175 = [obj countByEnumeratingWithState:&v193 objects:v208 count:16];
  if (v175)
  {
    uint64_t v171 = *(void *)v194;
    do
    {
      for (uint64_t k = 0; k != v175; ++k)
      {
        if (*(void *)v194 != v171) {
          objc_enumerationMutation(obj);
        }
        v63 = *(void **)(*((void *)&v193 + 1) + 8 * k);
        v64 = [v59 componentBlueprintForComponentIdentifier:v63];
        v65 = [v64 component];
        v66 = [v65 anchor];

        if (v66)
        {
          v67 = [v66 targetComponentIdentifier];

          if (!v67)
          {
            long long v191 = 0u;
            long long v192 = 0u;
            long long v189 = 0u;
            long long v190 = 0u;
            id v72 = v178;
            uint64_t v74 = [v72 countByEnumeratingWithState:&v189 objects:v207 count:16];
            if (v74)
            {
              uint64_t v75 = v74;
              uint64_t v76 = *(void *)v190;
              do
              {
                for (uint64_t m = 0; m != v75; ++m)
                {
                  if (*(void *)v190 != v76) {
                    objc_enumerationMutation(v72);
                  }
                  v78 = SXComponentDependencyCreate(v63, *(void **)(*((void *)&v189 + 1) + 8 * m), (void *)1, (void *)2, 0);
                  -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v78);
                }
                uint64_t v75 = [v72 countByEnumeratingWithState:&v189 objects:v207 count:16];
              }
              while (v75);
            }
            goto LABEL_55;
          }
          v68 = [v66 targetComponentIdentifier];
          int v69 = [obj containsObject:v68];

          if (v69)
          {
            v70 = [v66 targetComponentIdentifier];
            v71 = SXComponentDependencyCreate(v63, v70, (void *)1, (void *)1, 0);
            -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v71);

            if ([v66 targetAnchorPosition] == 3 || objc_msgSend(v66, "targetAnchorPosition") == 2)
            {
              id v72 = [v66 targetComponentIdentifier];
              v73 = SXComponentDependencyCreate(v63, v72, (void *)1, (void *)2, 0);
              -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v73);

LABEL_55:
            }
          }
        }
        v79 = [v64 component];
        objc_opt_class();
        char v80 = objc_opt_isKindOfClass();

        if (v80)
        {
          long long v187 = 0u;
          long long v188 = 0u;
          long long v185 = 0u;
          long long v186 = 0u;
          id v81 = v178;
          uint64_t v82 = [v81 countByEnumeratingWithState:&v185 objects:v206 count:16];
          if (v82)
          {
            uint64_t v83 = v82;
            uint64_t v84 = *(void *)v186;
            do
            {
              for (uint64_t n = 0; n != v83; ++n)
              {
                if (*(void *)v186 != v84) {
                  objc_enumerationMutation(v81);
                }
                v86 = SXComponentDependencyCreate(v63, *(void **)(*((void *)&v185 + 1) + 8 * n), (void *)2, (void *)2, 0);
                -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v86);
              }
              uint64_t v83 = [v81 countByEnumeratingWithState:&v185 objects:v206 count:16];
            }
            while (v83);
          }

          v87 = SXComponentDependencyCreate(v63, v63, (void *)1, (void *)2, 0);
          -[SXComponentDependencyResolver addDependency:]((uint64_t)v61, v87);
        }
        v59 = v180;
      }
      uint64_t v175 = [obj countByEnumeratingWithState:&v193 objects:v208 count:16];
    }
    while (v175);
  }

  [v59 startUpdatesForWidth:v28];
  [v166 minimumHeight];
  double v89 = v88;
  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  -[SXComponentDependencyResolver solvableOrder](v61);
  id v169 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v176 = [v169 countByEnumeratingWithState:&v181 objects:v205 count:16];
  if (v176)
  {
    uint64_t v172 = *(void *)v182;
    do
    {
      uint64_t v90 = 0;
      do
      {
        if (*(void *)v182 != v172) {
          objc_enumerationMutation(v169);
        }
        uint64_t v91 = *(void *)(*((void *)&v181 + 1) + 8 * v90);
        v92 = -[SXFullscreenCaption text](v91);
        v93 = [v59 componentBlueprintForComponentIdentifier:v92];
        v94 = [v93 componentSizer];
        [v93 suggestedSizeAfterInvalidation];
        objc_msgSend(v94, "setSuggestedSize:");

        [v179 widthForIdentifier:v92];
        double v96 = v95;
        v97 = [v93 componentLayout];
        v98 = [v97 margin];

        v99 = self;
        if (self) {
          v99 = self->_unitConverterFactory;
        }
        id v100 = v99;
        v101 = [v59 layoutOptions];
        v102 = [v100 createUnitConverterWithComponentWidth:v101 parentWidth:v96 layoutOptions:v28];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v103 = v93;
          v104 = [v103 layoutBlueprint];
          if ([v104 isComplete]) {
            int v105 = [v103 hasValidLayout];
          }
          else {
            int v105 = 0;
          }

          v59 = v180;
        }
        else
        {
          int v105 = 1;
        }
        if ([v93 hasValidPosition] && (v105 & 1) != 0
          || -[SXFullscreenCaption caption](v91) != 1)
        {
          if (([v93 hasValidSize] & v105 & 1) == 0
            && -[SXFullscreenCaption caption](v91) == 2)
          {
            v111 = (void *)SXLayoutLog;
            if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
            {
              v112 = v111;
              v113 = [v93 component];
              v114 = [v113 identifier];
              v115 = [v167 taskIdentifier];
              *(_DWORD *)buf = 138543618;
              id v212 = v114;
              __int16 v213 = 2114;
              v214 = v115;
              _os_log_impl(&dword_222AC5000, v112, OS_LOG_TYPE_DEFAULT, "Calculating size, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);

              v59 = v180;
            }
            v116 = [v93 componentLayout];
            uint64_t v117 = [v116 minimumHeight];
            objc_msgSend(v102, "convertValueToPoints:", v117, v118);
            double v120 = v119;

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v121 = -[SXHorizontalStackLayouter childColumnLayoutForContainerComponentWidth:componentWidth:componentBlueprint:columnLayout:unitConverter:]((id *)&self->super.isa, v93, v166, v102, v28, v96);
              [v121 setMinimumHeight:v120];
              if (self)
              {
                v122 = self;
                layoutContextFactory = self->_layoutContextFactory;
              }
              else
              {
                v122 = 0;
                layoutContextFactory = 0;
              }
              v124 = [(SXLayoutContextFactory *)layoutContextFactory createLayoutContextForColumnLayout:v121 unitConverter:v102];
              double v125 = -[SXHorizontalStackLayouter calculateSizeForContainerComponentWithBlueprint:width:layoutContext:layoutDescription:shouldContinue:]((id *)&v122->super.isa, v93, v124, v167, (uint64_t)a6, v96);
              if (v126 >= v120) {
                double v127 = v126;
              }
              else {
                double v127 = v120;
              }
              objc_msgSend(v59, "updateSize:forComponentWithIdentifier:", v92, v125, v127);
              uint64_t v128 = [v98 top];
              objc_msgSend(v102, "convertValueToPoints:", v128, v129);
              double v131 = v127 + v130;
              uint64_t v132 = [v98 bottom];
              objc_msgSend(v102, "convertValueToPoints:", v132, v133);
              double v135 = v131 + v134;
              if (v89 < v135) {
                double v89 = v135;
              }
            }
            else
            {
              v136 = [v93 component];
              objc_opt_class();
              char v137 = objc_opt_isKindOfClass();

              if (v137)
              {
                v138 = [v93 component];
                objc_opt_class();
                char v139 = objc_opt_isKindOfClass();

                if (v139)
                {
                  uint64_t v140 = [v98 top];
                  objc_msgSend(v102, "convertValueToPoints:", v140, v141);
                  double v143 = v89 - v142;
                  uint64_t v144 = [v98 bottom];
                  objc_msgSend(v102, "convertValueToPoints:", v144, v145);
                  objc_msgSend(v59, "updateSize:forComponentWithIdentifier:", v92, v96, fmax(v143 - v146, 0.0));
                }
              }
              else
              {
                if (self) {
                  v147 = self->_layoutContextFactory;
                }
                else {
                  v147 = 0;
                }
                v148 = [(SXLayoutContextFactory *)v147 createLayoutContextForColumnLayout:v166 unitConverter:v102];
                double v149 = -[SXHorizontalStackLayouter calculateSizeForComponentWithBlueprint:width:layoutContext:]((uint64_t)self, v93, v148, v96);
                if (v150 >= v120) {
                  double v151 = v150;
                }
                else {
                  double v151 = v120;
                }
                objc_msgSend(v59, "updateSize:forComponentWithIdentifier:", v92, v149, v151);
                uint64_t v152 = [v98 top];
                objc_msgSend(v102, "convertValueToPoints:", v152, v153);
                double v155 = v151 + v154;
                uint64_t v156 = [v98 bottom];
                objc_msgSend(v102, "convertValueToPoints:", v156, v157);
                double v159 = v155 + v158;
                if (v89 < v159) {
                  double v89 = v159;
                }
              }
            }
          }
        }
        else
        {
          v106 = (void *)SXLayoutLog;
          if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
          {
            v107 = v106;
            v108 = [v93 component];
            v109 = [v108 identifier];
            v110 = [v167 taskIdentifier];
            *(_DWORD *)buf = 138543618;
            id v212 = v109;
            __int16 v213 = 2114;
            v214 = v110;
            _os_log_impl(&dword_222AC5000, v107, OS_LOG_TYPE_DEFAULT, "Calculating position, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);

            v59 = v180;
          }
          objc_msgSend(v59, "updatePosition:forComponentWithIdentifier:", v92, -[SXHorizontalStackLayouter calculatePositionForComponentWithBlueprint:layout:unitConverter:margin:maximumY:layoutBlueprint:]((uint64_t)self, v93, v179, v102, v98, v59));
        }

        ++v90;
      }
      while (v176 != v90);
      uint64_t v160 = [v169 countByEnumeratingWithState:&v181 objects:v205 count:16];
      uint64_t v176 = v160;
    }
    while (v160);
  }

  [v59 endUpdates];
  v161 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v162 = v161;
    v163 = [v167 taskIdentifier];
    *(_DWORD *)buf = 134218242;
    id v212 = v59;
    __int16 v213 = 2114;
    v214 = v163;
    _os_log_impl(&dword_222AC5000, v162, OS_LOG_TYPE_DEFAULT, "Finished horizontal stack layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);
  }
}

- (double)calculatePositionForComponentWithBlueprint:(uint64_t)a1 layout:(void *)a2 unitConverter:(void *)a3 margin:(void *)a4 maximumY:(void *)a5 layoutBlueprint:(void *)a6
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    uint64_t v16 = [v14 top];
    objc_msgSend(v13, "convertValueToPoints:", v16, v17);
    id v18 = [v11 component];
    objc_super v19 = [v18 identifier];
    [v12 positionForIdentifier:v19];
    double v21 = v20;

    v22 = [v11 component];
    uint64_t v23 = [v22 anchor];

    if (v23)
    {
      uint64_t v24 = [v23 targetComponentIdentifier];
      if (!v24) {
        goto LABEL_9;
      }
      uint64_t v25 = (void *)v24;
      uint64_t v26 = [v23 targetComponentIdentifier];
      double v27 = [*(id *)(a1 + 16) component];
      double v28 = [v27 identifier];

      if (v26 == v28)
      {
LABEL_9:
        [v23 targetAnchorPosition];
        [v11 frame];
        CGRectGetHeight(v43);
        [v23 originAnchorPosition];
      }
      else
      {
        v29 = [v23 targetComponentIdentifier];
        [v12 widthForIdentifier:v29];
        double v31 = v30;

        if (v31 > 0.0)
        {
          id v32 = [v23 targetComponentIdentifier];
          uint64_t v33 = [v15 componentBlueprintForComponentIdentifier:v32];

          if ([v23 range] == 0x7FFFFFFFFFFFFFFFLL
            || ([v33 component],
                uint64_t v34 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                char isKindOfClass = objc_opt_isKindOfClass(),
                v34,
                (isKindOfClass & 1) == 0))
          {
            [v33 frame];
            CGRectGetMinY(v44);
            [v33 frame];
            CGRectGetHeight(v45);
            [v23 targetAnchorPosition];
          }
          else
          {
            v36 = [v33 componentSizer];
            [v33 frame];
            CGRectGetMinY(v42);
            uint64_t v37 = [v23 range];
            objc_msgSend(v36, "verticalPositionForRange:", v37, v38);
          }
          [v11 frame];
          CGRectGetHeight(v46);
          [v23 originAnchorPosition];
        }
      }
      [v11 frame];
      CGRectGetHeight(v47);
      uint64_t v39 = [v14 bottom];
      objc_msgSend(v13, "convertValueToPoints:", v39, v40);
    }
  }
  else
  {
    double v21 = 0.0;
  }

  return v21;
}

- (id)childColumnLayoutForContainerComponentWidth:(void *)a3 componentWidth:(void *)a4 componentBlueprint:(double)a5 columnLayout:(double)a6 unitConverter:
{
  v6 = a1;
  if (a1)
  {
    id v11 = a4;
    id v12 = a3;
    id v13 = a2;
    id v14 = [SXDocumentLayout alloc];
    uint64_t v15 = [v12 gutter];

    uint64_t v16 = [(SXDocumentLayout *)v14 initWithWidth:(uint64_t)a5 margin:0 gutter:v15 columns:1];
    uint64_t v17 = [v13 componentSizer];

    [v17 contentInsetsWithUnitConverter:v11];
    double v19 = v18;
    double v21 = v20;

    objc_msgSend(v6[4], "columnLayoutWithConstrainedViewportSize:viewportSize:documentLayout:", v16, a6 - (v19 + v21), a6 - (v19 + v21), a6 - (v19 + v21), a6 - (v19 + v21));
    v6 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (double)calculateSizeForContainerComponentWithBlueprint:(void *)a3 width:(void *)a4 layoutContext:(uint64_t)a5 layoutDescription:(double)a6 shouldContinue:
{
  if (!a1) {
    return 0.0;
  }
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = [v13 layoutBlueprint];
  id v15 = a1[3];
  uint64_t v16 = [a1 delegate];
  uint64_t v17 = [v15 layouterForContainerComponentBlueprint:v13 delegate:v16];

  double v18 = [v12 columnLayout];
  [v17 layoutBlueprint:v14 columnLayout:v18 description:v11 shouldContinue:a5];

  double v19 = [v13 componentSizer];

  double v20 = [v12 unitConverter];

  [v19 contentInsetsWithUnitConverter:v20];
  [v14 blueprintSize];

  return a6;
}

- (double)calculateSizeForComponentWithBlueprint:(void *)a3 width:(double)a4 layoutContext:
{
  if (!a1) {
    return 0.0;
  }
  id v6 = a3;
  id v7 = a2;
  id v8 = [v7 componentSizer];
  v9 = [v6 unitConverter];
  [v8 contentInsetsWithUnitConverter:v9];
  double v11 = v10;
  double v13 = v12;

  id v14 = [v7 componentSizer];

  objc_msgSend(v14, "calculateHeightForWidth:layoutContext:", v6, fmax(a4 - (v11 + v13), 0.0));
  return a4;
}

- (SXLayouterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SXLayouterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_layoutContextFactory, 0);
  objc_storeStrong((id *)&self->_columnCalculator, 0);
  objc_storeStrong((id *)&self->_layouterFactory, 0);
  objc_storeStrong((id *)&self->_containerComponentBlueprint, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end