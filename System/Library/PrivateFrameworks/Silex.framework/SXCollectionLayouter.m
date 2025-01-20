@interface SXCollectionLayouter
- (SXCollectionLayouter)initWithContainerComponent:(id)a3 layouterFactory:(id)a4 columnCalculator:(id)a5 unitConverterFactory:(id)a6;
- (SXColumnCalculator)columnCalculator;
- (SXContainerComponentBlueprint)containerComponentBlueprint;
- (SXLayouterDelegate)delegate;
- (SXLayouterFactory)layouterFactory;
- (SXUnitConverterFactory)unitConverterFactory;
- (id)childColumnLayoutForRowLayout:(id)a3 display:(id)a4 collectionContainerBlueprint:(id)a5 childContainerComponentBlueprint:(id)a6 documentColumnLayout:(id)a7 unitConverter:(id)a8;
- (void)layoutBlueprint:(id)a3 columnLayout:(id)a4 description:(id)a5 shouldContinue:(BOOL *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation SXCollectionLayouter

- (SXCollectionLayouter)initWithContainerComponent:(id)a3 layouterFactory:(id)a4 columnCalculator:(id)a5 unitConverterFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXCollectionLayouter;
  v15 = [(SXCollectionLayouter *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_containerComponentBlueprint, a3);
    objc_storeStrong((id *)&v16->_layouterFactory, a4);
    objc_storeStrong((id *)&v16->_columnCalculator, a5);
    objc_storeStrong((id *)&v16->_unitConverterFactory, a6);
  }

  return v16;
}

- (void)layoutBlueprint:(id)a3 columnLayout:(id)a4 description:(id)a5 shouldContinue:(BOOL *)a6
{
  uint64_t v151 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v125 = a4;
  id v129 = a5;
  v9 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    id v11 = [v129 taskIdentifier];
    *(_DWORD *)buf = 134218242;
    id v148 = v8;
    __int16 v149 = 2114;
    v150 = v11;
    _os_log_impl(&dword_222AC5000, v10, OS_LOG_TYPE_DEFAULT, "Starting collection layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);
  }
  id v12 = [(SXCollectionLayouter *)self containerComponentBlueprint];
  id v13 = [v12 component];

  id v14 = [(SXCollectionLayouter *)self containerComponentBlueprint];
  v15 = [v14 componentLayout];

  v114 = v13;
  uint64_t v16 = [v13 contentDisplay];
  v17 = [(SXCollectionLayouter *)self containerComponentBlueprint];
  uint64_t v18 = [v17 columnRange];
  v113 = v15;
  objc_msgSend(v125, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v18, v19, objc_msgSend(v15, "ignoreDocumentMargin"), objc_msgSend(v15, "ignoreDocumentGutter"), objc_msgSend(v15, "ignoreViewportPadding"));
  double v21 = v20;

  [v8 startUpdatesForWidth:v21];
  v22 = [(SXCollectionLayouter *)self unitConverterFactory];
  v23 = [(SXCollectionLayouter *)self containerComponentBlueprint];
  v24 = [v23 parentLayoutBlueprint];
  [v24 blueprintSize];
  double v26 = v25;
  v27 = [v8 layoutOptions];
  uint64_t v28 = [v22 createUnitConverterWithComponentWidth:v27 parentWidth:v21 layoutOptions:v26];

  v29 = [v8 componentIdentifiers];
  v124 = (void *)v16;
  v112 = (void *)v28;
  v30 = +[SXCollectionCalculator layoutWithCollectionDisplay:width:numberOfComponents:unitConverter:](SXCollectionCalculator, "layoutWithCollectionDisplay:width:numberOfComponents:unitConverter:", v16, [v29 count], v28, v21);

  v31 = [v30 rowsLayouts];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    uint64_t v33 = 0;
    unint64_t v34 = 0;
    double v35 = 0.0;
    v122 = v8;
    v115 = v30;
    do
    {
      v36 = [v30 rowsLayouts];
      v37 = [v36 objectAtIndex:v34];

      v128 = v37;
      uint64_t v38 = [v37 componentsPerRow];
      v39 = [v8 componentIdentifiers];
      v40 = objc_msgSend(v39, "subarrayWithRange:", v33, v38);

      if (v34)
      {
        [v30 spaceBetweenRows];
        double v35 = v35 + v41;
      }
      v42 = [(SXCollectionLayouter *)self unitConverterFactory];
      [v128 componentWidth];
      double v44 = v43;
      v45 = [v8 layoutOptions];
      v127 = [v42 createUnitConverterWithComponentWidth:v45 parentWidth:v44 layoutOptions:v21];

      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id obj = v40;
      uint64_t v46 = [obj countByEnumeratingWithState:&v140 objects:v146 count:16];
      if (v46)
      {
        uint64_t v116 = v38;
        unint64_t v117 = v34;
        uint64_t v118 = v33;
        char v47 = 0;
        uint64_t v48 = *(void *)v141;
        double v49 = 0.0;
        v50 = obj;
        uint64_t v51 = v46;
        uint64_t v119 = *(void *)v141;
        do
        {
          uint64_t v52 = 0;
          uint64_t v121 = v51;
          do
          {
            if (*(void *)v141 != v48) {
              objc_enumerationMutation(v50);
            }
            uint64_t v53 = *(void *)(*((void *)&v140 + 1) + 8 * v52);
            unint64_t v54 = [v50 indexOfObject:v53];
            v55 = [v8 componentBlueprintForComponentIdentifier:v53];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v56 = (void *)SXLayoutLog;
              if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
              {
                v57 = v56;
                v58 = [v55 component];
                v59 = [v58 identifier];
                v60 = [v129 taskIdentifier];
                *(_DWORD *)buf = 138543618;
                id v148 = v59;
                __int16 v149 = 2114;
                v150 = v60;
                _os_log_impl(&dword_222AC5000, v57, OS_LOG_TYPE_DEFAULT, "Calculating size and position, component-identifier=%{public}@, task-identifier=%{public}@", buf, 0x16u);
              }
              v61 = [v55 layoutBlueprint];
              v62 = [v55 componentLayout];
              uint64_t v63 = [v62 minimumHeight];
              objc_msgSend(v127, "convertValueToPoints:", v63, v64);
              double v66 = v65;

              v67 = [(SXCollectionLayouter *)self containerComponentBlueprint];
              v68 = [(SXCollectionLayouter *)self childColumnLayoutForRowLayout:v128 display:v124 collectionContainerBlueprint:v67 childContainerComponentBlueprint:v55 documentColumnLayout:v125 unitConverter:v127];

              [v68 setMinimumHeight:v66];
              v69 = [(SXCollectionLayouter *)self layouterFactory];
              v70 = [(SXCollectionLayouter *)self delegate];
              v71 = [v69 layouterForContainerComponentBlueprint:v55 delegate:v70];

              [v71 layoutBlueprint:v61 columnLayout:v68 description:v129 shouldContinue:a6];
              v72 = [v55 componentSizer];
              [v72 contentInsetsWithUnitConverter:v127];
              double v74 = v73;
              double v76 = v75;

              [v128 componentWidth];
              double v78 = v77;
              [v61 blueprintSize];
              if (v76 + v74 + v79 >= v66) {
                double v66 = v76 + v74 + v79;
              }
              [v128 componentWidth];
              double v81 = v80;
              [v128 spaceBetweenComponents];
              double v83 = v82 * (double)v54 + v81 * (double)v54;
              [v128 leftMargin];
              double v85 = v84 + v83;
              id v8 = v122;
              objc_msgSend(v122, "updateSize:forComponentWithIdentifier:", v53, v78, v66);
              objc_msgSend(v122, "updatePosition:forComponentWithIdentifier:", v53, v85, v35);
              BOOL v86 = v49 != 0.0;
              if (v49 == v66) {
                BOOL v86 = 0;
              }
              v47 |= v86;
              if (v66 > v49) {
                double v49 = v66;
              }

              uint64_t v48 = v119;
              v50 = obj;
              uint64_t v51 = v121;
            }

            ++v52;
          }
          while (v51 != v52);
          uint64_t v51 = [v50 countByEnumeratingWithState:&v140 objects:v146 count:16];
        }
        while (v51);

        if ((v47 & 1) == 0)
        {
          v30 = v115;
          uint64_t v38 = v116;
          unint64_t v34 = v117;
          uint64_t v33 = v118;
          goto LABEL_47;
        }
        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id v131 = v50;
        uint64_t v87 = [v131 countByEnumeratingWithState:&v136 objects:v145 count:16];
        if (v87)
        {
          uint64_t v88 = v87;
          uint64_t v89 = *(void *)v137;
          do
          {
            uint64_t v90 = 0;
            uint64_t v130 = v88;
            do
            {
              if (*(void *)v137 != v89) {
                objc_enumerationMutation(v131);
              }
              uint64_t v91 = *(void *)(*((void *)&v136 + 1) + 8 * v90);
              v92 = [v8 componentBlueprintForComponentIdentifier:v91];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v93 = [v92 layoutBlueprint];
                long long v132 = 0u;
                long long v133 = 0u;
                long long v134 = 0u;
                long long v135 = 0u;
                v94 = [v93 componentIdentifiers];
                uint64_t v95 = [v94 countByEnumeratingWithState:&v132 objects:v144 count:16];
                if (v95)
                {
                  uint64_t v96 = v95;
                  uint64_t v97 = *(void *)v133;
                  do
                  {
                    for (uint64_t i = 0; i != v96; ++i)
                    {
                      if (*(void *)v133 != v97) {
                        objc_enumerationMutation(v94);
                      }
                      [v93 invalidatePositionForComponentWithIdentifier:*(void *)(*((void *)&v132 + 1) + 8 * i)];
                    }
                    uint64_t v96 = [v94 countByEnumeratingWithState:&v132 objects:v144 count:16];
                  }
                  while (v96);
                }

                v99 = [(SXCollectionLayouter *)self containerComponentBlueprint];
                v100 = [(SXCollectionLayouter *)self childColumnLayoutForRowLayout:v128 display:v124 collectionContainerBlueprint:v99 childContainerComponentBlueprint:v92 documentColumnLayout:v125 unitConverter:v127];

                [v100 setMinimumHeight:v49];
                v101 = [(SXCollectionLayouter *)self layouterFactory];
                v102 = [(SXCollectionLayouter *)self delegate];
                v103 = [v101 layouterForContainerComponentBlueprint:v92 delegate:v102];

                [v103 layoutBlueprint:v93 columnLayout:v100 description:v129 shouldContinue:a6];
                [v128 componentWidth];
                double v105 = v104;
                [v93 blueprintSize];
                if (v106 < v49) {
                  double v106 = v49;
                }
                id v8 = v122;
                objc_msgSend(v122, "updateSize:forComponentWithIdentifier:", v91, v105, v106);

                uint64_t v88 = v130;
              }

              ++v90;
            }
            while (v90 != v88);
            uint64_t v88 = [v131 countByEnumeratingWithState:&v136 objects:v145 count:16];
          }
          while (v88);
        }
        v30 = v115;
        uint64_t v38 = v116;
        unint64_t v34 = v117;
        uint64_t v33 = v118;
      }
      else
      {
        double v49 = 0.0;
      }
      v50 = obj;

LABEL_47:
      v33 += v38;
      double v35 = v35 + v49;

      ++v34;
      v107 = [v30 rowsLayouts];
      unint64_t v108 = [v107 count];
    }
    while (v34 < v108);
  }
  [v8 endUpdates];
  v109 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v110 = v109;
    v111 = [v129 taskIdentifier];
    *(_DWORD *)buf = 134218242;
    id v148 = v8;
    __int16 v149 = 2114;
    v150 = v111;
    _os_log_impl(&dword_222AC5000, v110, OS_LOG_TYPE_DEFAULT, "Finished collection layout, blueprint=%p, task-identifier=%{public}@", buf, 0x16u);
  }
}

- (id)childColumnLayoutForRowLayout:(id)a3 display:(id)a4 collectionContainerBlueprint:(id)a5 childContainerComponentBlueprint:(id)a6 documentColumnLayout:(id)a7 unitConverter:(id)a8
{
  id v61 = a3;
  id v14 = a4;
  id v15 = a5;
  id v59 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = [v16 documentLayout];
  uint64_t v19 = [v15 componentLayout];
  double v20 = (double)[v18 width];
  double v21 = (double)[v18 width];
  v57 = self;
  v22 = [(SXCollectionLayouter *)self columnCalculator];
  v23 = v16;
  [v16 contentScaleFactor];
  v58 = v18;
  double v25 = objc_msgSend(v22, "columnLayoutWithViewportSize:constrainedToWidth:documentLayout:contentScaleFactor:", v18, v20, v21, v20, v24);

  uint64_t v26 = [v19 columnRange];
  v56 = v19;
  objc_msgSend(v25, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v26, v27, objc_msgSend(v19, "ignoreDocumentMargin"), objc_msgSend(v19, "ignoreDocumentGutter"), objc_msgSend(v19, "ignoreViewportPadding"));
  double v29 = v28;
  v30 = v15;
  v31 = [v15 layoutBlueprint];
  uint64_t v32 = [v31 componentIdentifiers];
  v60 = v14;
  uint64_t v33 = +[SXCollectionCalculator layoutWithCollectionDisplay:width:numberOfComponents:unitConverter:](SXCollectionCalculator, "layoutWithCollectionDisplay:width:numberOfComponents:unitConverter:", v14, [v32 count], v17, v29);

  unint64_t v34 = [v33 rowsLayouts];
  double v35 = [v34 objectEnumerator];

  v36 = 0;
  do
  {
    v37 = v36;
    v36 = [v35 nextObject];

    if (!v36) {
      break;
    }
    uint64_t v38 = [v36 intendedComponentsPerRow];
  }
  while (v38 != [v36 componentsPerRow]);
  [v36 componentWidth];
  double v40 = v39;
  double v41 = [SXDocumentLayout alloc];
  uint64_t v42 = [v23 gutter];
  double v43 = [v30 componentLayout];
  [v43 columnRange];
  v45 = [(SXDocumentLayout *)v41 initWithWidth:(uint64_t)v40 margin:0 gutter:v42 columns:v44];

  uint64_t v46 = [v59 componentSizer];
  [v46 contentInsetsWithUnitConverter:v17];
  double v48 = v47;
  double v50 = v49;

  [v61 componentWidth];
  double v52 = v51 - (v48 + v50);
  uint64_t v53 = [(SXCollectionLayouter *)v57 columnCalculator];
  unint64_t v54 = objc_msgSend(v53, "columnLayoutWithConstrainedViewportSize:viewportSize:documentLayout:", v45, v52, v52, v52, v52);

  return v54;
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

- (SXContainerComponentBlueprint)containerComponentBlueprint
{
  return self->_containerComponentBlueprint;
}

- (SXColumnCalculator)columnCalculator
{
  return self->_columnCalculator;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_columnCalculator, 0);
  objc_storeStrong((id *)&self->_containerComponentBlueprint, 0);
  objc_storeStrong((id *)&self->_layouterFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end