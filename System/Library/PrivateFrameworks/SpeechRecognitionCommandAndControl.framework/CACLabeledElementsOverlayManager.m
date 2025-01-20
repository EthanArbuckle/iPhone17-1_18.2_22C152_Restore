@interface CACLabeledElementsOverlayManager
+ (void)assignNumbersToLabeledElements:(id)a3 numberingStrategy:(int)a4 startingNumber:(int64_t)a5;
- (BOOL)isOverlay;
- (CACLabeledElementsOverlayManagerDelegate)delegate;
- (NSArray)labeledElementsCopy;
- (id)_findLabeledElementsThatIntersectsLabelRect:(CGRect)a3 fromLabeledElement:(id)a4 justLabelRect:(BOOL)a5 additionalElements:(id)a6;
- (id)_optimizeLabeledElements:(id)a3 startingNumberedLabelsAtIndex:(unint64_t)a4 forceNoArrow:(BOOL)a5;
- (void)addLabeledElements:(id)a3 forceNoArrow:(BOOL)a4 startingNumberedLabelsAtIndex:(unint64_t)a5;
- (void)clearLabeledElements;
- (void)hide;
- (void)hideAnimated:(BOOL)a3 completion:(id)a4;
- (void)hideWithoutAnimation;
- (void)setDelegate:(id)a3;
- (void)showLabeledElementsOverlayWithLabeledElements:(id)a3;
- (void)showLabeledElementsOverlayWithLabeledElements:(id)a3 forceNoArrow:(BOOL)a4;
- (void)showLabeledElementsOverlayWithLabeledElements:(id)a3 forceNoArrow:(BOOL)a4 startingNumberedLabelsAtIndex:(unint64_t)a5;
- (void)startDelayedDimmingOfNumbers;
- (void)stopDelayedDimmingOfNumbers;
@end

@implementation CACLabeledElementsOverlayManager

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(CACSimpleContentViewManager *)self setContentViewManagerDelegate:obj];
  }
}

- (void)showLabeledElementsOverlayWithLabeledElements:(id)a3
{
}

- (void)showLabeledElementsOverlayWithLabeledElements:(id)a3 forceNoArrow:(BOOL)a4
{
}

- (void)showLabeledElementsOverlayWithLabeledElements:(id)a3 forceNoArrow:(BOOL)a4 startingNumberedLabelsAtIndex:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(CACLabeledElementsOverlayManager *)self clearLabeledElements];
  [(CACLabeledElementsOverlayManager *)self addLabeledElements:v8 forceNoArrow:v6 startingNumberedLabelsAtIndex:a5];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __125__CACLabeledElementsOverlayManager_showLabeledElementsOverlayWithLabeledElements_forceNoArrow_startingNumberedLabelsAtIndex___block_invoke_2;
  v9[3] = &unk_264D12BE8;
  v9[4] = self;
  [(CACSimpleContentViewManager *)self showViewControllerWithCreationHandler:&__block_literal_global_41 updateHandler:v9];
}

CACLabeledElementsOverlayViewController *__125__CACLabeledElementsOverlayManager_showLabeledElementsOverlayWithLabeledElements_forceNoArrow_startingNumberedLabelsAtIndex___block_invoke()
{
  v0 = objc_alloc_init(CACLabeledElementsOverlayViewController);
  return v0;
}

uint64_t __125__CACLabeledElementsOverlayManager_showLabeledElementsOverlayWithLabeledElements_forceNoArrow_startingNumberedLabelsAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setLabeledElements:*(void *)(*(void *)(a1 + 32) + 40)];
}

- (NSArray)labeledElementsCopy
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableArray *)v2->_labeledElements copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)clearLabeledElements
{
  id obj = self;
  objc_sync_enter(obj);
  labeledElements = obj->_labeledElements;
  if (labeledElements)
  {
    [(NSMutableArray *)labeledElements removeAllObjects];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
    v4 = obj->_labeledElements;
    obj->_labeledElements = (NSMutableArray *)v3;
  }
  objc_sync_exit(obj);
}

- (void)addLabeledElements:(id)a3 forceNoArrow:(BOOL)a4 startingNumberedLabelsAtIndex:(unint64_t)a5
{
  id v8 = a3;
  BOOL v6 = -[CACLabeledElementsOverlayManager _optimizeLabeledElements:startingNumberedLabelsAtIndex:forceNoArrow:](self, "_optimizeLabeledElements:startingNumberedLabelsAtIndex:forceNoArrow:");
  v7 = self;
  objc_sync_enter(v7);
  [(NSMutableArray *)v7->_labeledElements addObjectsFromArray:v6];
  objc_sync_exit(v7);
}

- (id)_optimizeLabeledElements:(id)a3 startingNumberedLabelsAtIndex:(unint64_t)a4 forceNoArrow:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v263 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [(CACLabeledElementsOverlayManager *)self delegate];
  v206 = self;
  v9 = [v8 screenForLabeledElementsOverlayManager:self];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat rect2 = v14;
  CGFloat v16 = v15;

  v17 = objc_opt_new();
  long long v250 = 0u;
  long long v251 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v250 objects:v262 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v251;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v251 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v250 + 1) + 8 * i);
        [v23 interfaceOrientedRectangle];
        v280.origin.CGFloat x = v11;
        v280.origin.CGFloat y = v13;
        v280.size.CGFloat width = rect2;
        v280.size.CGFloat height = v16;
        if (CGRectIntersectsRect(v265, v280)) {
          [v17 addObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v250 objects:v262 count:16];
    }
    while (v20);
  }
  CGFloat rect = v16;
  v213 = v18;

  v24 = objc_opt_new();
  [v17 sortUsingComparator:&__block_literal_global_270];
  uint64_t v25 = [v17 count];
  if (v25 >= 1)
  {
    uint64_t v26 = v25;
    uint64_t v27 = 0;
    do
    {
      v28 = objc_opt_new();
      [v24 addObject:v28];
      v29 = [v17 objectAtIndex:v27];
      [v28 addObject:v29];
      [v29 interfaceOrientedRectangle];
      double v31 = v30;
      [v29 interfaceOrientedRectangle];
      if (++v27 < v26)
      {
        uint64_t v33 = (uint64_t)(v31 + v32 * 0.5);
        while (1)
        {
          v34 = v29;
          v29 = [v17 objectAtIndex:v27];

          float v35 = (float)(v33 / (unint64_t)[v28 count]);
          [v29 interfaceOrientedRectangle];
          float v37 = v36;
          [v29 interfaceOrientedRectangle];
          float v39 = v38 + v37;
          if (v35 < v37 || v35 > v39) {
            break;
          }
          [v28 addObject:v29];
          uint64_t v33 = (uint64_t)(float)((float)((float)(v37 + v39) * 0.5) + (float)v33);
          if (v26 == ++v27)
          {

            goto LABEL_21;
          }
        }
      }
    }
    while (v27 < v26);
  }
LABEL_21:
  BOOL v211 = v5;
  v203 = v17;
  double v201 = v13;
  if ([v24 count])
  {
    unint64_t v41 = 0;
    v215 = v24;
    do
    {
      v42 = [v24 objectAtIndex:v41];
      [v42 sortUsingComparator:&__block_literal_global_272];
      uint64_t v43 = [v42 count];
      if (v43 >= 2)
      {
        uint64_t v44 = v43;
        v45 = [v42 objectAtIndex:0];
        [v45 interfaceOrientedRectangle];
        double v47 = v46;
        [v45 interfaceOrientedRectangle];
        double v49 = v48;
        [v45 interfaceOrientedRectangle];
        float v51 = v49 + v50 * 0.5;
        uint64_t v52 = 1;
        while (1)
        {
          v53 = [v42 objectAtIndex:v52];
          float v54 = v51 / (float)v52;
          [v53 interfaceOrientedRectangle];
          float v56 = v55;
          [v53 interfaceOrientedRectangle];
          float v58 = v57 + v56;
          if (v54 < v56 || v54 > v58) {
            break;
          }
          [v53 interfaceOrientedRectangle];
          float v60 = v47;
          if (v61 > (float)(v60 + 200.0)) {
            break;
          }
          float v51 = v51 + (float)((float)(v56 + v58) * 0.5);
          [v53 interfaceOrientedRectangle];
          double v47 = v62;
          ++v52;

          if (v44 == v52) {
            goto LABEL_34;
          }
        }
        uint64_t v63 = v44 - v52;
        id v64 = objc_alloc(MEMORY[0x263EFF980]);
        v65 = objc_msgSend(v42, "subarrayWithRange:", v52, v63);
        v66 = (void *)[v64 initWithArray:v65];

        [v215 insertObject:v66 atIndex:v41 + 1];
        objc_msgSend(v42, "removeObjectsInRange:", v52, v63);

LABEL_34:
        v24 = v215;
      }
      ++v41;
    }
    while (v41 < [v24 count]);
  }
  v67 = objc_opt_new();
  [v67 setNumberStyle:1];
  v68 = [(CACLabeledElementsOverlayManager *)v206 delegate];
  uint64_t v69 = [v68 localeForLabeledElementsOverlayManager:v206];

  if (v69) {
    [v67 setLocale:v69];
  }
  v199 = (void *)v69;
  v200 = v67;
  v70 = objc_opt_new();
  long long v246 = 0u;
  long long v247 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  id v71 = v24;
  uint64_t v72 = [v71 countByEnumeratingWithState:&v246 objects:v261 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v247;
    do
    {
      for (uint64_t j = 0; j != v73; ++j)
      {
        if (*(void *)v247 != v74) {
          objc_enumerationMutation(v71);
        }
        v76 = *(void **)(*((void *)&v246 + 1) + 8 * j);
        long long v242 = 0u;
        long long v243 = 0u;
        long long v244 = 0u;
        long long v245 = 0u;
        id v77 = v76;
        uint64_t v78 = [v77 countByEnumeratingWithState:&v242 objects:v260 count:16];
        if (v78)
        {
          uint64_t v79 = v78;
          uint64_t v80 = *(void *)v243;
          do
          {
            for (uint64_t k = 0; k != v79; ++k)
            {
              if (*(void *)v243 != v80) {
                objc_enumerationMutation(v77);
              }
              [v70 addObject:*(void *)(*((void *)&v242 + 1) + 8 * k)];
            }
            uint64_t v79 = [v77 countByEnumeratingWithState:&v242 objects:v260 count:16];
          }
          while (v79);
        }
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v246 objects:v261 count:16];
    }
    while (v73);
  }

  v82 = objc_opt_class();
  v83 = [(CACLabeledElementsOverlayManager *)v206 delegate];
  objc_msgSend(v82, "assignNumbersToLabeledElements:numberingStrategy:startingNumber:", v70, objc_msgSend(v83, "shouldAssignNumbersRandomlyInLabeledElementsOverlayManager:", v206), a4);

  v84 = [v70 firstObject];
  v197 = v84;
  v198 = v71;
  if (objc_opt_respondsToSelector())
  {
    v85 = [v84 element];
    v86 = [v85 application];
    v87 = [v86 bundleId];
    int v216 = [v87 isEqualToString:@"com.apple.mobilesafari"] ^ 1;
  }
  else
  {
    LOBYTE(v216) = 0;
  }
  double v202 = v11;
  long long v240 = 0u;
  long long v241 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  id obja = v70;
  uint64_t v88 = [obja countByEnumeratingWithState:&v238 objects:v259 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v239;
    do
    {
      for (uint64_t m = 0; m != v89; ++m)
      {
        if (*(void *)v239 != v90) {
          objc_enumerationMutation(obja);
        }
        v92 = *(void **)(*((void *)&v238 + 1) + 8 * m);
        [v92 interfaceOrientedRectangle];
        double v94 = v93;
        double v96 = v95;
        double v98 = v97;
        [v92 setArrowOrientation:!v211];
        if (v216)
        {
          uint64_t v99 = 0;
        }
        else
        {
          +[CACLabeledBadgeView badgeFontSize];
          if (v98 >= v100 * 0.75) {
            uint64_t v99 = 0;
          }
          else {
            uint64_t v99 = 2;
          }
        }
        [v92 setBadgePresentation:v99];
        v101 = [v92 numberedLabel];
        +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:](CACLabeledBadgeView, "sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:", [v101 length], objc_msgSend(v92, "arrowOrientation"), objc_msgSend(v92, "badgePresentation"), objc_msgSend(v92, "badgeIndicatorMask"));
        double v103 = v102;
        double v105 = v104;

        [v92 labelRectangle];
        objc_msgSend(v92, "setLabelRectangle:", v94, v96 + v98 - v105 + -2.0, v103, v105);
      }
      uint64_t v89 = [obja countByEnumeratingWithState:&v238 objects:v259 count:16];
    }
    while (v89);
  }

  v106 = [(CACLabeledElementsOverlayManager *)v206 delegate];
  [v106 didAssignNumbersInLabeledElementsOverlayManager:v206];

  long long v236 = 0u;
  long long v237 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  id v107 = v213;
  uint64_t v108 = [v107 countByEnumeratingWithState:&v234 objects:v258 count:16];
  if (v108)
  {
    uint64_t v109 = v108;
    uint64_t v110 = *(void *)v235;
    double v111 = 1.0;
    double v112 = 2.0;
    do
    {
      for (uint64_t n = 0; n != v109; ++n)
      {
        if (*(void *)v235 != v110) {
          objc_enumerationMutation(v107);
        }
        v114 = *(void **)(*((void *)&v234 + 1) + 8 * n);
        [v114 interfaceOrientedRectangle];
        if (v211)
        {
          [v114 labelRectangle];
          objc_msgSend(v114, "setLabelRectangle:", v120 - (v119 + v111), v121 + v112);
          continue;
        }
        CGFloat v122 = v115;
        if (v118 < 200.0)
        {
          CGFloat v214 = v118;
          CGFloat v217 = v117;
          CGFloat v123 = v116;
          [v114 labelRectangle];
          double v125 = v124;
          double v127 = v126;
          double v129 = v128;
          double v131 = v130 - (v126 + -4.0);
          v132 = -[CACLabeledElementsOverlayManager _findLabeledElementsThatIntersectsLabelRect:fromLabeledElement:justLabelRect:additionalElements:](v206, "_findLabeledElementsThatIntersectsLabelRect:fromLabeledElement:justLabelRect:additionalElements:", v114, 0, v107, v131, v124);
          if (![v132 count]) {
            goto LABEL_91;
          }
          double v204 = v129;
          double v205 = v125;
          double v207 = v127;
          long long v232 = 0u;
          long long v233 = 0u;
          long long v230 = 0u;
          long long v231 = 0u;
          id v133 = v132;
          uint64_t v134 = [v133 countByEnumeratingWithState:&v230 objects:v257 count:16];
          if (v134)
          {
            uint64_t v135 = v134;
            uint64_t v136 = *(void *)v231;
            double v131 = 0.0;
            do
            {
              for (iuint64_t i = 0; ii != v135; ++ii)
              {
                if (*(void *)v231 != v136) {
                  objc_enumerationMutation(v133);
                }
                [*(id *)(*((void *)&v230 + 1) + 8 * ii) interfaceOrientedRectangle];
                CGFloat x = v266.origin.x;
                CGFloat y = v266.origin.y;
                CGFloat width = v266.size.width;
                CGFloat height = v266.size.height;
                if (CGRectGetMaxX(v266) > v131)
                {
                  v267.origin.CGFloat x = x;
                  v267.origin.CGFloat y = y;
                  v267.size.CGFloat width = width;
                  v267.size.CGFloat height = height;
                  double MaxX = CGRectGetMaxX(v267);
                  v268.origin.CGFloat x = v122;
                  v268.origin.CGFloat y = v123;
                  v268.size.CGFloat height = v214;
                  v268.size.CGFloat width = v217;
                  if (MaxX < CGRectGetMaxX(v268))
                  {
                    v269.origin.CGFloat x = x;
                    v269.origin.CGFloat y = y;
                    v269.size.CGFloat width = width;
                    v269.size.CGFloat height = height;
                    double v131 = CGRectGetMaxX(v269);
                  }
                }
              }
              uint64_t v135 = [v133 countByEnumeratingWithState:&v230 objects:v257 count:16];
            }
            while (v135);
          }
          else
          {
            double v131 = 0.0;
          }

          v270.origin.CGFloat x = v122;
          v270.origin.CGFloat y = v123;
          v270.size.CGFloat width = v217;
          v270.size.CGFloat height = v214;
          double v111 = 1.0;
          double v112 = 2.0;
          double v127 = v207;
          if (v131 <= CGRectGetMinX(v270))
          {
            v271.origin.CGFloat x = v122;
            v271.origin.CGFloat y = v123;
            v271.size.CGFloat width = v217;
            v271.size.CGFloat height = v214;
            if (CGRectGetMinX(v271) - v131 < v207)
            {
              double v129 = v204;
              double v125 = v205;
LABEL_91:
              objc_msgSend(v114, "setLabelRectangle:", v131, v125, v127, v129);
            }
          }

          continue;
        }
      }
      uint64_t v109 = [v107 countByEnumeratingWithState:&v234 objects:v258 count:16];
    }
    while (v109);
  }

  long long v228 = 0u;
  long long v229 = 0u;
  long long v226 = 0u;
  long long v227 = 0u;
  id v143 = v107;
  uint64_t v144 = [v143 countByEnumeratingWithState:&v226 objects:v256 count:16];
  if (v144)
  {
    uint64_t v145 = v144;
    uint64_t v146 = *(void *)v227;
    do
    {
      for (juint64_t j = 0; jj != v145; ++jj)
      {
        if (*(void *)v227 != v146) {
          objc_enumerationMutation(v143);
        }
        v148 = *(void **)(*((void *)&v226 + 1) + 8 * jj);
        if (v211 || ([*(id *)(*((void *)&v226 + 1) + 8 * jj) interfaceOrientedRectangle], v149 < 30.0))
        {
          [v148 labelRectangle];
          double v151 = v150;
          double v153 = v152;
          double v155 = v154;
          double v157 = v156;
          [v148 interfaceOrientedRectangle];
          double v159 = v158;
          [v148 labelRectangle];
          float v161 = (v159 - v160) * 0.5;
          double v162 = v153 - truncf(v161);
          if (v211) {
            double v151 = v151 + 8.0;
          }
        }
        else
        {
          [v148 labelRectangle];
          double v151 = v163;
          double v165 = v164;
          double v155 = v166;
          double v157 = v167;
          [v148 interfaceOrientedRectangle];
          double v162 = v165 - (v168 + -15.0);
        }
        objc_msgSend(v148, "setLabelRectangle:", v151, v162, v155, v157);
      }
      uint64_t v145 = [v143 countByEnumeratingWithState:&v226 objects:v256 count:16];
    }
    while (v145);
  }

  long long v224 = 0u;
  long long v225 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  id v169 = v143;
  uint64_t v170 = [v169 countByEnumeratingWithState:&v222 objects:v255 count:16];
  if (v170)
  {
    uint64_t v171 = v170;
    uint64_t v172 = *(void *)v223;
    do
    {
      for (kuint64_t k = 0; kk != v171; ++kk)
      {
        if (*(void *)v223 != v172) {
          objc_enumerationMutation(v169);
        }
        v174 = *(void **)(*((void *)&v222 + 1) + 8 * kk);
        [v174 labelRectangle];
        if (v175 < v202 && v175 < v176) {
          [v174 setLabelRectangle:1.0];
        }
        [v174 labelRectangle];
        if (v178 < v201 && v178 < v179) {
          objc_msgSend(v174, "setLabelRectangle:");
        }
        [v174 labelRectangle];
        double v181 = v272.origin.x;
        double v182 = v272.size.width;
        double v183 = v272.size.height;
        double MaxY = CGRectGetMaxY(v272);
        v273.origin.CGFloat x = v202;
        v273.origin.CGFloat y = v201;
        v273.size.CGFloat width = rect2;
        v273.size.CGFloat height = rect;
        if (MaxY > CGRectGetMaxY(v273))
        {
          v274.origin.CGFloat x = v202;
          v274.origin.CGFloat y = v201;
          v274.size.CGFloat width = rect2;
          v274.size.CGFloat height = rect;
          objc_msgSend(v174, "setLabelRectangle:", v181, CGRectGetMaxY(v274) - v183 + -1.0, v182, v183);
        }
        [v174 labelRectangle];
        double v185 = v275.origin.y;
        double v186 = v275.size.width;
        double v187 = v275.size.height;
        double v188 = CGRectGetMaxX(v275);
        v276.origin.CGFloat x = v202;
        v276.origin.CGFloat y = v201;
        v276.size.CGFloat width = rect2;
        v276.size.CGFloat height = rect;
        if (v188 > CGRectGetMaxX(v276))
        {
          v277.origin.CGFloat x = v202;
          v277.origin.CGFloat y = v201;
          v277.size.CGFloat width = rect2;
          v277.size.CGFloat height = rect;
          objc_msgSend(v174, "setLabelRectangle:", CGRectGetMaxX(v277) - v186 + -1.0, v185, v186, v187);
        }
      }
      uint64_t v171 = [v169 countByEnumeratingWithState:&v222 objects:v255 count:16];
    }
    while (v171);
  }

  long long v220 = 0u;
  long long v221 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  id v189 = v169;
  uint64_t v190 = [v189 countByEnumeratingWithState:&v218 objects:v254 count:16];
  if (v190)
  {
    uint64_t v191 = v190;
    uint64_t v192 = *(void *)v219;
    do
    {
      for (muint64_t m = 0; mm != v191; ++mm)
      {
        if (*(void *)v219 != v192) {
          objc_enumerationMutation(v189);
        }
        v194 = *(void **)(*((void *)&v218 + 1) + 8 * mm);
        if ([v194 arrowOrientation])
        {
          if ([v194 badgePresentation])
          {
            [v194 labelRectangle];
            double v195 = CGRectGetMaxX(v278);
            [v194 interfaceOrientedRectangle];
            if (v195 > CGRectGetMaxX(v279)) {
              [v194 setArrowOrientation:0];
            }
          }
        }
      }
      uint64_t v191 = [v189 countByEnumeratingWithState:&v218 objects:v254 count:16];
    }
    while (v191);
  }

  return obja;
}

uint64_t __104__CACLabeledElementsOverlayManager__optimizeLabeledElements_startingNumberedLabelsAtIndex_forceNoArrow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  [v5 interfaceOrientedRectangle];
  double v7 = v6;
  [v5 interfaceOrientedRectangle];
  double v9 = v8;

  float v10 = v7 + v9 * 0.5;
  [v4 interfaceOrientedRectangle];
  double v12 = v11;
  [v4 interfaceOrientedRectangle];
  double v14 = v13;

  float v15 = v12 + v14 * 0.5;
  uint64_t v16 = -1;
  if (v10 >= v15) {
    uint64_t v16 = 1;
  }
  if (v10 == v15) {
    return 0;
  }
  else {
    return v16;
  }
}

uint64_t __104__CACLabeledElementsOverlayManager__optimizeLabeledElements_startingNumberedLabelsAtIndex_forceNoArrow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 interfaceOrientedRectangle];
  double v7 = v6;
  [v5 interfaceOrientedRectangle];
  if (v7 == v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v4 interfaceOrientedRectangle];
    double v11 = v10;
    [v5 interfaceOrientedRectangle];
    if (v11 >= v12) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = -1;
    }
  }

  return v9;
}

- (id)_findLabeledElementsThatIntersectsLabelRect:(CGRect)a3 fromLabeledElement:(id)a4 justLabelRect:(BOOL)a5 additionalElements:(id)a6
{
  BOOL v7 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a6;
  float v15 = [MEMORY[0x263EFF980] array];
  uint64_t v16 = [MEMORY[0x263EFF980] array];
  [v16 addObjectsFromArray:self->_labeledElements];
  [v16 addObjectsFromArray:v14];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(id *)(*((void *)&v29 + 1) + 8 * i);
        if (v22 != v13)
        {
          v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (v7) {
            [v23 labelRectangle];
          }
          else {
            objc_msgSend(v23, "interfaceOrientedRectangle", (void)v29);
          }
          v37.origin.CGFloat x = v24;
          v37.origin.CGFloat y = v25;
          v37.size.CGFloat width = v26;
          v37.size.CGFloat height = v27;
          v36.origin.CGFloat x = x;
          v36.origin.CGFloat y = y;
          v36.size.CGFloat width = width;
          v36.size.CGFloat height = height;
          if (CGRectIntersectsRect(v36, v37)) {
            [v15 addObject:v22];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v19);
  }

  return v15;
}

+ (void)assignNumbersToLabeledElements:(id)a3 numberingStrategy:(int)a4 startingNumber:(int64_t)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [v7 count];
  v40 = (char *)malloc_type_calloc(v8 + a5, 8uLL, 0x100004000313F17uLL);
  v42 = malloc_type_calloc(v8 + a5, 8uLL, 0x100004000313F17uLL);
  int v41 = a4;
  if (a4 == 1)
  {
    uint64_t v9 = v40;
    if (v8 >= 1)
    {
      for (uint64_t i = 0; i != v8; ++i)
        *(void *)&v40[8 * i] = i + 1;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint32_t v12 = arc4random_uniform(v8);
        if (j != v12)
        {
          uint64_t v13 = *(void *)&v40[8 * j];
          *(void *)&v40[8 * j] = *(void *)&v40[8 * v12];
          *(void *)&v40[8 * v12] = v13;
        }
      }
    }
  }
  else
  {
    int64_t v38 = a5;
    id v39 = v7;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
    uint64_t v9 = v40;
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v48;
      do
      {
        uint64_t v19 = 0;
        uint64_t v20 = &v40[8 * v17];
        do
        {
          if (*(void *)v48 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v21 = [*(id *)(*((void *)&v47 + 1) + 8 * v19) label];
          uint64_t v22 = [v21 integerValue];

          uint64_t v23 = v22 - 1;
          BOOL v24 = v22 >= 1 && v22 <= v8;
          if (v24 && !*(void *)&v20[8 * v19] && !v42[v23] && v41 == 0)
          {
            *(void *)&v20[8 * v19] = v22;
            v42[v23] = v17 + v19 + 1;
          }
          ++v19;
        }
        while (v16 != v19);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
        v17 += v19;
      }
      while (v16);
    }

    id v7 = v39;
    if (v8 >= 1)
    {
      uint64_t v26 = 0;
      do
      {
        int64_t v27 = v38;
        if (*(void *)&v40[8 * v26])
        {
          ++v26;
        }
        else
        {
          while (v42[v27++ - 1])
            ;
          *(void *)&v40[8 * v26++] = v27 - 1;
          v42[v27 - 2] = v26;
        }
      }
      while (v26 != v8);
    }
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v29 = v7;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = 0;
    uint64_t v33 = *(void *)v44;
    do
    {
      uint64_t v34 = 0;
      float v35 = &v9[8 * v32];
      do
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v29);
        }
        CGRect v36 = *(void **)(*((void *)&v43 + 1) + 8 * v34);
        CGRect v37 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", *(void *)&v35[8 * v34]);
        [v36 setNumberedLabel:v37];

        ++v34;
      }
      while (v31 != v34);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v43 objects:v51 count:16];
      v32 += v34;
      uint64_t v9 = v40;
    }
    while (v31);
  }

  free(v9);
  free(v42);
}

- (void)startDelayedDimmingOfNumbers
{
  [(CACSimpleContentViewManager *)self setPendingDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID] + 1];
  [(CACSimpleContentViewManager *)self setActiveDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID]];
  uint64_t v3 = [(CACSimpleContentViewManager *)self viewController];
  id v4 = [v3 view];
  [v4 setAlpha:1.0];

  id v11 = [(CACLabeledElementsOverlayManager *)self delegate];
  if ([v11 isOverlayFadingEnabledForLabeledElementsOverlayManager:self])
  {
    id v5 = [(CACLabeledElementsOverlayManager *)self delegate];
    if ([v5 isAlwaysShowingLabeledElementsOverlayManager:self])
    {
      double v6 = [(CACLabeledElementsOverlayManager *)self delegate];
      char v7 = [v6 isHandlingDisambiguationForLabeledElementsOverlayManager:self];

      if ((v7 & 1) == 0)
      {
        uint64_t v8 = [(CACLabeledElementsOverlayManager *)self delegate];
        [v8 overlayFadeDelayForLabeledElementsOverlayManager:self];
        dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __64__CACLabeledElementsOverlayManager_startDelayedDimmingOfNumbers__block_invoke;
        block[3] = &unk_264D115D0;
        block[4] = self;
        dispatch_after(v10, MEMORY[0x263EF83A0], block);
      }
      return;
    }
  }
}

uint64_t __64__CACLabeledElementsOverlayManager_startDelayedDimmingOfNumbers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeDimmingTransactionID];
  uint64_t result = [*(id *)(a1 + 32) pendingDimmingTransactionID];
  if (v2 == result)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __64__CACLabeledElementsOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2;
    v4[3] = &unk_264D115D0;
    v4[4] = *(void *)(a1 + 32);
    return [MEMORY[0x263F82E00] animateWithDuration:v4 animations:0 completion:1.0];
  }
  return result;
}

void __64__CACLabeledElementsOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 overlayFadeOpacityForLabeledElementsOverlayManager:*(void *)(a1 + 32)];
  double v3 = v2;
  id v4 = [*(id *)(a1 + 32) viewController];
  id v5 = [v4 view];
  [v5 setAlpha:v3];
}

- (void)stopDelayedDimmingOfNumbers
{
  [(CACSimpleContentViewManager *)self setPendingDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID] + 1];
  id v4 = [(CACSimpleContentViewManager *)self viewController];
  double v3 = [v4 view];
  [v3 setAlpha:1.0];
}

- (BOOL)isOverlay
{
  return 1;
}

- (void)hide
{
  v2.receiver = self;
  v2.super_class = (Class)CACLabeledElementsOverlayManager;
  [(CACSimpleContentViewManager *)&v2 hide];
}

- (void)hideWithoutAnimation
{
  v2.receiver = self;
  v2.super_class = (Class)CACLabeledElementsOverlayManager;
  [(CACSimpleContentViewManager *)&v2 hideWithoutAnimation];
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CACLabeledElementsOverlayManager_hideAnimated_completion___block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  id v6 = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  v7.receiver = self;
  v7.super_class = (Class)CACLabeledElementsOverlayManager;
  [(CACSimpleContentViewManager *)&v7 hideAnimated:v4 completion:v6];
}

uint64_t __60__CACLabeledElementsOverlayManager_hideAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearLabeledElements];
}

- (CACLabeledElementsOverlayManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACLabeledElementsOverlayManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

@end