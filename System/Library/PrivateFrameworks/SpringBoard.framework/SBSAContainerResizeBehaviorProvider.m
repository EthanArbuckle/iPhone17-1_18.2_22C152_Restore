@interface SBSAContainerResizeBehaviorProvider
- (BOOL)_didContainerViewForActiveGestureCollapseWithFrame:(CGRect)a3 initialContainerViewFrame:(CGRect)a4 isPrimaryContainer:(BOOL)a5 activeInterfaceOrientation:(int64_t)a6;
- (CGRect)_frameForAdjunctContainerViewDescription:(id)a3 resizedWithGestureDescription:(id)a4 initialContainerViewFrame:(CGRect)a5 context:(id)a6;
- (CGRect)_frameForContainerViewDescription:(id)a3 resizedWithGestureDescription:(id)a4 initialContainerViewFrame:(CGRect)a5 context:(id)a6;
- (id)_contentResizeBehaviorSettings;
- (id)_preferencesUpdatedWithCollapseOfElement:(void *)a3 activeFrame:(void *)a4 initialFrame:(void *)a5 minimumFrame:(double)a6 preferences:(double)a7 context:(double)a8;
- (id)preferencesFromContext:(id)a3;
@end

@implementation SBSAContainerResizeBehaviorProvider

- (id)preferencesFromContext:(id)a3
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3) {
    goto LABEL_9;
  }
  v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    Class v9 = NSClassFromString(&cfstr_Sbsacontext.isa);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v8 handleFailureInMethod:a2, self, @"SBSAContainerResizeBehaviorProvider.m", 89, @"Unexpected class – expected '%@', got '%@'", v9, v11 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  v12 = [v7 preferences];
  uint64_t v13 = objc_opt_class();
  id v14 = v12;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;

  v17 = [v7 gestureDescriptions];
  v18 = objc_msgSend(v17, "bs_firstObjectPassingTest:", &__block_literal_global_238);

  if (v18) {
    objc_storeStrong((id *)&self->_activeGestureDescription, v18);
  }
  activeGestureDescription = self->_activeGestureDescription;
  if (activeGestureDescription)
  {
    uint64_t v20 = [(SBSAGestureDescription *)activeGestureDescription gestureRecognizerState];
    v21 = self;
    if (self->_resizeGestureResult)
    {
      uint64_t v22 = [v7 copyByAddingFlags:2 debugRequestingProvider:self];

      v21 = self;
      id v7 = (id)v22;
    }
    v23 = [(SBSAGestureDescription *)v21->_activeGestureDescription associatedInterfaceElementIdentifier];
    [v7 preferences];
    v25 = v24 = v7;
    v26 = [v25 containerViewDescriptions];

    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_2;
    v161[3] = &unk_1E6AFBBB8;
    id v27 = v23;
    id v162 = v27;
    v132 = v26;
    uint64_t v28 = objc_msgSend(v26, "bs_firstObjectPassingTest:", v161);
    v142 = (void *)v28;
    if (v28)
    {
      v29 = (void *)v28;
      id v131 = v27;
      unint64_t v160 = 0;
      v140 = [v24 elementContexts];
      v30 = SBSAElementContextAssociatedWithContainerViewDescription(v29, v140, &v160);
      id v7 = v24;
      v139 = v30;
      if (v30) {
        uint64_t v31 = [v30 interfaceOrientation];
      }
      else {
        uint64_t v31 = 1;
      }
      BOOL v145 = (v160 == 0x7FFFFFFFFFFFFFFFLL || !v160) && (unint64_t)(v31 - 5) < 0xFFFFFFFFFFFFFFFELL;
      switch(v20)
      {
        case 1:
          if (v140) {
            v32 = v140;
          }
          else {
            v32 = (void *)MEMORY[0x1E4F1CBF0];
          }
          objc_storeStrong((id *)&self->_elementContexts, v32);
          p_initialFrameOfContainerViewForActiveGesture = &self->_initialFrameOfContainerViewForActiveGesture;
          if (v139)
          {
            CGFloat v34 = SBSAFrameForElementInCollection(v160, v140, v7);
            p_initialFrameOfContainerViewForActiveGesture->origin.double x = v34;
            self->_initialFrameOfContainerViewForActiveGesture.origin.double y = v35;
            self->_initialFrameOfContainerViewForActiveGesture.size.double width = v36;
            self->_initialFrameOfContainerViewForActiveGesture.size.double height = v37;
            self->_minimumFrameOfContainerViewForActiveGesture.origin.double x = _SBSAMinimumFrameForElementAtIndex(v160, v7, v34, v35, v36, v37);
            self->_minimumFrameOfContainerViewForActiveGesture.origin.double y = v38;
            self->_minimumFrameOfContainerViewForActiveGesture.size.double width = v39;
            self->_minimumFrameOfContainerViewForActiveGesture.size.double height = v40;
          }
          else
          {
            [v7 inertContainerFrame];
            p_initialFrameOfContainerViewForActiveGesture->origin.double x = v50;
            self->_initialFrameOfContainerViewForActiveGesture.origin.double y = v51;
            self->_initialFrameOfContainerViewForActiveGesture.size.double width = v52;
            self->_initialFrameOfContainerViewForActiveGesture.size.double height = v53;
            CGSize size = self->_initialFrameOfContainerViewForActiveGesture.size;
            self->_minimumFrameOfContainerViewForActiveGesture.origin = p_initialFrameOfContainerViewForActiveGesture->origin;
            self->_minimumFrameOfContainerViewForActiveGesture.CGSize size = size;
          }
          goto LABEL_38;
        case 2:
LABEL_38:
          v55 = self->_activeGestureDescription;
          double x = self->_initialFrameOfContainerViewForActiveGesture.origin.x;
          double y = self->_initialFrameOfContainerViewForActiveGesture.origin.y;
          double width = self->_initialFrameOfContainerViewForActiveGesture.size.width;
          double height = self->_initialFrameOfContainerViewForActiveGesture.size.height;
          v133 = v7;
          if (v145)
          {
            -[SBSAContainerResizeBehaviorProvider _frameForContainerViewDescription:resizedWithGestureDescription:initialContainerViewFrame:context:](self, "_frameForContainerViewDescription:resizedWithGestureDescription:initialContainerViewFrame:context:", v142, v55, v7, x, y, width, height);
            CGFloat v61 = v60;
            CGFloat v63 = v62;
            CGFloat v65 = v64;
            CGFloat v67 = v66;
          }
          else
          {
            -[SBSAContainerResizeBehaviorProvider _frameForAdjunctContainerViewDescription:resizedWithGestureDescription:initialContainerViewFrame:context:](self, "_frameForAdjunctContainerViewDescription:resizedWithGestureDescription:initialContainerViewFrame:context:", v142, v55, v7, x, y, width, height);
            CGFloat v61 = v68;
            CGFloat v63 = v69;
            CGFloat v65 = v70;
            CGFloat v67 = v71;
            v159[0] = MEMORY[0x1E4F143A8];
            v159[1] = 3221225472;
            v159[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_3;
            v159[3] = &unk_1E6AF53A0;
            v159[5] = a2;
            v159[4] = self;
            uint64_t v72 = [v16 copyWithBlock:v159];

            id v16 = (id)v72;
          }
          p_minimumFrameOfContainerViewForActiveGesture = &self->_minimumFrameOfContainerViewForActiveGesture;
          double MaxX = CGRectGetMaxX(self->_minimumFrameOfContainerViewForActiveGesture);
          v168.origin.double x = v61;
          v168.origin.double y = v63;
          v168.size.double width = v65;
          v168.size.double height = v67;
          double v75 = CGRectGetMaxX(v168);
          if (MaxX < v75) {
            double MaxX = v75;
          }
          v169.origin.double x = v61;
          v169.origin.double y = v63;
          v169.size.double width = v65;
          v169.size.double height = v67;
          double v76 = MaxX - CGRectGetMinX(v169);
          v170.origin.double x = p_minimumFrameOfContainerViewForActiveGesture->origin.x;
          v170.origin.double y = self->_minimumFrameOfContainerViewForActiveGesture.origin.y;
          v170.size.double width = self->_minimumFrameOfContainerViewForActiveGesture.size.width;
          v170.size.double height = self->_minimumFrameOfContainerViewForActiveGesture.size.height;
          double v77 = CGRectGetHeight(v170);
          v171.origin.double x = v61;
          v171.origin.double y = v63;
          v171.size.double width = v76;
          v171.size.double height = v67;
          double v78 = CGRectGetHeight(v171);
          if (v77 >= v78) {
            double v79 = v77;
          }
          else {
            double v79 = v78;
          }
          v174.origin.double x = p_minimumFrameOfContainerViewForActiveGesture->origin.x;
          v174.origin.double y = self->_minimumFrameOfContainerViewForActiveGesture.origin.y;
          v174.size.double width = self->_minimumFrameOfContainerViewForActiveGesture.size.width;
          v174.size.double height = self->_minimumFrameOfContainerViewForActiveGesture.size.height;
          CGFloat v80 = v61;
          CGFloat v81 = v63;
          double v82 = v76;
          CGRect v172 = CGRectUnion(*(CGRect *)(&v79 - 3), v174);
          double v83 = v172.origin.x;
          double v84 = v172.origin.y;
          double v85 = v172.size.width;
          double v86 = v172.size.height;
          [(SBSAContainerPanGestureDescription *)self->_activeGestureDescription translation];
          double v89 = -v87;
          if (v87 >= 0.0) {
            double v89 = v87;
          }
          if (v89 > 10.0) {
            goto LABEL_52;
          }
          if (v88 < 0.0) {
            double v88 = -v88;
          }
          if (v88 > 10.0)
          {
LABEL_52:
            BOOL v90 = -[SBSAContainerResizeBehaviorProvider _didContainerViewForActiveGestureCollapseWithFrame:initialContainerViewFrame:isPrimaryContainer:activeInterfaceOrientation:](self, "_didContainerViewForActiveGestureCollapseWithFrame:initialContainerViewFrame:isPrimaryContainer:activeInterfaceOrientation:", v145, v31, v83, v84, v85, v86, self->_initialFrameOfContainerViewForActiveGesture.origin.x, self->_initialFrameOfContainerViewForActiveGesture.origin.y, self->_initialFrameOfContainerViewForActiveGesture.size.width, self->_initialFrameOfContainerViewForActiveGesture.size.height);
            int64_t v91 = -1;
            if (!v90) {
              int64_t v91 = 1;
            }
            if (v91 != self->_resizeGestureResult)
            {
              self->_int64_t resizeGestureResult = v91;
              uint64_t v92 = [v16 copyWithCancellationOfGestureOfClass:objc_opt_class() context:v7];

              id v16 = (id)v92;
            }
          }
          v129 = v18;
          id v130 = v3;
          id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v155 = 0u;
          long long v156 = 0u;
          long long v157 = 0u;
          long long v158 = 0u;
          id obj = v26;
          uint64_t v94 = [obj countByEnumeratingWithState:&v155 objects:v165 count:16];
          if (v94)
          {
            uint64_t v95 = v94;
            uint64_t v96 = *(void *)v156;
            double v136 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
            double v137 = *MEMORY[0x1E4F1DB28];
            double v134 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
            double v135 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
            v97 = v140;
            double v138 = v86;
            do
            {
              for (uint64_t i = 0; i != v95; ++i)
              {
                if (*(void *)v156 != v96) {
                  objc_enumerationMutation(obj);
                }
                v99 = *(void **)(*((void *)&v155 + 1) + 8 * i);
                int v100 = BSEqualObjects();
                double v101 = v83;
                double v102 = v84;
                double v103 = v85;
                double v104 = v86;
                if ((v100 & 1) == 0)
                {
                  unint64_t v154 = 0x7FFFFFFFFFFFFFFFLL;
                  v105 = SBSAElementContextAssociatedWithContainerViewDescription(v99, v97, &v154);
                  double v102 = v136;
                  double v101 = v137;
                  double v104 = v134;
                  double v103 = v135;
                  if (v105)
                  {
                    if (v145) {
                      double v106 = SBSAAdjunctFrameForElementInCollection(v154, v97, v133, v83, v84, v85, v86);
                    }
                    else {
                      double v106 = SBSAFrameForElementInCollection(v154, v97, v133);
                    }
                    double v101 = v106;
                    double v102 = v107;
                    double v103 = v108;
                    double v104 = v109;
                  }
                }
                v173.origin.double x = v101;
                v173.origin.double y = v102;
                v173.size.double width = v103;
                v173.size.double height = v104;
                if (CGRectIsEmpty(v173))
                {
                  [v93 addObject:v99];
                }
                else
                {
                  v152[0] = MEMORY[0x1E4F143A8];
                  v152[1] = 3221225472;
                  v152[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_4;
                  v152[3] = &unk_1E6B06930;
                  v152[4] = self;
                  v152[5] = a2;
                  *(double *)&v152[6] = v101;
                  *(double *)&v152[7] = v102;
                  *(double *)&v152[8] = v103;
                  *(double *)&v152[9] = v104;
                  char v153 = v100;
                  v110 = (void *)[v99 copyWithBlock:v152];
                  [v93 addObject:v110];

                  v150[0] = MEMORY[0x1E4F143A8];
                  v150[1] = 3221225472;
                  v150[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_5;
                  v150[3] = &unk_1E6B02F30;
                  v150[5] = v99;
                  v150[6] = a2;
                  v150[4] = self;
                  char v151 = v100;
                  uint64_t v111 = [v16 copyWithBlock:v150];

                  id v16 = (id)v111;
                  if (v139) {
                    int v112 = v100;
                  }
                  else {
                    int v112 = 0;
                  }
                  if ((v112 & v145) == 1 && self->_resizeGestureResult == -1)
                  {
                    uint64_t v113 = -[SBSAContainerResizeBehaviorProvider _preferencesUpdatedWithCollapseOfElement:activeFrame:initialFrame:minimumFrame:preferences:context:](self, "_preferencesUpdatedWithCollapseOfElement:activeFrame:initialFrame:minimumFrame:preferences:context:", v101, v102, v103, v104, self->_initialFrameOfContainerViewForActiveGesture.origin.x, self->_initialFrameOfContainerViewForActiveGesture.origin.y, self->_initialFrameOfContainerViewForActiveGesture.size.width, self->_initialFrameOfContainerViewForActiveGesture.size.height, *(void *)&self->_minimumFrameOfContainerViewForActiveGesture.origin.x, *(void *)&self->_minimumFrameOfContainerViewForActiveGesture.origin.y, *(void *)&self->_minimumFrameOfContainerViewForActiveGesture.size.width, *(void *)&self->_minimumFrameOfContainerViewForActiveGesture.size.height);

                    id v16 = (id)v113;
                  }
                  v97 = v140;
                  double v86 = v138;
                }
              }
              uint64_t v95 = [obj countByEnumeratingWithState:&v155 objects:v165 count:16];
            }
            while (v95);
          }

          v147[0] = MEMORY[0x1E4F143A8];
          v147[1] = 3221225472;
          v147[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_6;
          v147[3] = &unk_1E6AF9DA0;
          id v148 = v93;
          SEL v149 = a2;
          v147[4] = self;
          elementContexts = (NSArray *)v93;
          uint64_t v114 = [v16 copyWithBlock:v147];

          id v16 = (id)v114;
          v18 = v129;
          id v3 = v130;
          id v7 = v133;
          goto LABEL_80;
        case 3:
          v41 = [SBSAContainerResizeAction alloc];
          int64_t resizeGestureResult = self->_resizeGestureResult;
          v43 = [(SBSAGestureDescription *)self->_activeGestureDescription associatedInterfaceElementIdentifier];
          v163 = @"containerResizeBehaviorProvider.resize";
          v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v163 count:1];
          v45 = [(SBSAContainerResizeAction *)v41 initWithResult:resizeGestureResult associatedInterfaceElementIdentifier:v43 reasons:v44];
          v164 = v45;
          v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v164 count:1];
          uint64_t v47 = [v16 copyByAddingActions:v46];

          id v7 = v24;
          id v16 = (id)v47;
          goto LABEL_36;
        case 4:
        case 5:
LABEL_36:
          self->_int64_t resizeGestureResult = 0;
          v48 = self->_activeGestureDescription;
          self->_activeGestureDescription = 0;

          elementContexts = self->_elementContexts;
          self->_elementContexts = 0;
LABEL_80:

          break;
        default:
          break;
      }
      v115 = self->_elementContexts;
      id v27 = v131;
      if (v115 && !SBSAAreElementLayoutsEqualToLayouts(v115, v140))
      {
        v116 = SBLogSystemAperturePreferencesStackGestures();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG)) {
          -[SBSAContainerResizeBehaviorProvider preferencesFromContext:](v7, v116);
        }

        uint64_t v117 = [v16 copyWithCancellationOfGestureOfClass:objc_opt_class() context:v7];
        v118 = self->_elementContexts;
        self->_elementContexts = 0;

        id v16 = (id)v117;
        id v27 = v131;
      }
    }
    else
    {
      id v7 = v24;
    }
  }
  v119 = (void *)[v7 copyByUpdatingPreferences:v16];

  v146.receiver = self;
  v146.super_class = (Class)SBSAContainerResizeBehaviorProvider;
  v120 = [(SBSABasePreferencesProvider *)&v146 preferencesFromContext:v119];
  uint64_t v121 = objc_opt_class();
  id v122 = v120;
  if (v121)
  {
    if (objc_opt_isKindOfClass()) {
      v123 = v122;
    }
    else {
      v123 = 0;
    }
  }
  else
  {
    v123 = 0;
  }
  id v124 = v123;

  v125 = [v124 actions];
  int v126 = objc_msgSend(v125, "bs_containsObjectPassingTest:", &__block_literal_global_47_1);

  if (v126)
  {
    self->_int64_t resizeGestureResult = 0;
    v127 = self->_activeGestureDescription;
    self->_activeGestureDescription = 0;
  }
  return v124;
}

uint64_t __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 interfaceElementIdentifier];
  uint64_t v3 = BSEqualObjects();

  return v3;
}

void __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    uint64_t v3 = self;
    id v4 = v14;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = a1 + 32;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v10 + 8);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    [v7 handleFailureInMethod:v9, v8, @"SBSAContainerResizeBehaviorProvider.m", 134, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setBlobEnabled:1];
}

void __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v17 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v17;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v3 = v17;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    Class v11 = NSClassFromString(&cfstr_Sbsacontainerv.isa);
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerResizeBehaviorProvider.m", 169, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v17;
LABEL_9:
    id v7 = 0;
  }

  BSRectWithSize();
  objc_msgSend(v7, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  if (*(unsigned char *)(a1 + 80))
  {
    double Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
    double v15 = Width / CGRectGetWidth(*(CGRect *)(*(void *)(a1 + 32) + 48));
    double Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
    objc_msgSend(v7, "setContentScale:", v15, Height / CGRectGetHeight(*(CGRect *)(*(void *)(a1 + 32) + 48)));
    BSRectWithSize();
    objc_msgSend(v7, "setContentBounds:");
    BSRectWithSize();
    UIRectGetCenter();
    objc_msgSend(v7, "setContentCenter:");
  }
}

void __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v31 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v31;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v3 = v31;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerResizeBehaviorProvider.m", 182, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

    id v3 = v31;
LABEL_9:
    id v7 = 0;
  }

  id v14 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v15 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  id v16 = [(SBSAInterfaceElementPropertyIdentity *)v14 initWithAssociatedInterfaceElementIdentifier:v15 andProperty:@"bounds"];

  id v17 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"bounds"];
  [v7 setAnimatedTransitionDescription:v17 forProperty:v16 withMilestones:0];

  v18 = [SBSAInterfaceElementPropertyIdentity alloc];
  v19 = [*(id *)(a1 + 40) interfaceElementIdentifier];
  uint64_t v20 = [(SBSAInterfaceElementPropertyIdentity *)v18 initWithAssociatedInterfaceElementIdentifier:v19 andProperty:@"center"];

  v21 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"center"];
  [v7 setAnimatedTransitionDescription:v21 forProperty:v20 withMilestones:0];

  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v22 = [SBSAInterfaceElementPropertyIdentity alloc];
    v23 = [*(id *)(a1 + 40) interfaceElementIdentifier];
    v24 = [(SBSAInterfaceElementPropertyIdentity *)v22 initWithAssociatedInterfaceElementIdentifier:v23 andProperty:@"contentScale"];
    [v7 associateAnimatedTransitionDescriptionOfProperty:v16 withProperty:v24 withMilestones:0];

    v25 = [SBSAInterfaceElementPropertyIdentity alloc];
    v26 = [*(id *)(a1 + 40) interfaceElementIdentifier];
    id v27 = [(SBSAInterfaceElementPropertyIdentity *)v25 initWithAssociatedInterfaceElementIdentifier:v26 andProperty:@"contentBounds"];
    [v7 associateAnimatedTransitionDescriptionOfProperty:v16 withProperty:v27 withMilestones:0];

    uint64_t v28 = [SBSAInterfaceElementPropertyIdentity alloc];
    v29 = [*(id *)(a1 + 40) interfaceElementIdentifier];
    v30 = [(SBSAInterfaceElementPropertyIdentity *)v28 initWithAssociatedInterfaceElementIdentifier:v29 andProperty:@"contentCenter"];
    [v7 associateAnimatedTransitionDescriptionOfProperty:v20 withProperty:v30 withMilestones:0];
  }
}

void __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_6(void *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    Class v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAContainerResizeBehaviorProvider.m", 201, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setContainerViewDescriptions:a1[5]];
}

uint64_t __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_44(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_contentResizeBehaviorSettings
{
  id v2 = [(id)objc_opt_class() settings];
  id v3 = [v2 contentInteractionBeginBehaviorSettings];

  return v3;
}

- (CGRect)_frameForContainerViewDescription:(id)a3 resizedWithGestureDescription:(id)a4 initialContainerViewFrame:(CGRect)a5 context:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(id)objc_opt_class() settings];
  [v12 initialLocation];
  [v12 translation];

  [v11 systemContainerBounds];
  CGFloat v34 = CGRectGetWidth(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGRectGetHeight(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGRectGetWidth(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGRectGetMidX(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  CGRectGetMidY(v39);
  [v11 inertContainerFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v40.origin.CGFloat x = v15;
  v40.origin.CGFloat y = v17;
  v40.size.CGFloat width = v19;
  v40.size.CGFloat height = v21;
  CGRectGetWidth(v40);
  [v13 resizeGestureXRubberbanding];
  if (BSFloatGreaterThanOrEqualToFloat()) {
    [v13 resizeGestureMinEdgePadding];
  }
  else {
    [v13 resizeGestureSensorXSafetyMargin];
  }
  BSUIConstrainValueToIntervalWithRubberBand();
  [v13 resizeGestureYRubberbandingStretch];
  if (BSFloatGreaterThanOrEqualToFloat()) {
    [v13 resizeGestureYRubberbandingStretch];
  }
  else {
    [v13 resizeGestureYRubberbandingCompress];
  }
  objc_msgSend(v13, "resizeGestureYRangeBeginTracking", *(void *)&v34);
  [v13 resizeGestureYRangeEndTracking];
  BSUIConstrainValueToIntervalWithRubberBand();
  if (BSFloatLessThanOrEqualToFloat()) {
    objc_msgSend(v13, "resizeGestureUpOffsetFactor", 0.0);
  }
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (CGRect)_frameForAdjunctContainerViewDescription:(id)a3 resizedWithGestureDescription:(id)a4 initialContainerViewFrame:(CGRect)a5 context:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a4;
  id v11 = [(id)objc_opt_class() settings];
  [v10 translation];
  double v13 = v12;

  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGRectGetHeight(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRectGetWidth(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRectGetMidX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRectGetMidY(v31);
  if (BSFloatGreaterThanOrEqualToFloat()) {
    [v11 recombineGestureXScaleFactorStretch];
  }
  else {
    [v11 recombineGestureXScaleFactorCompress];
  }
  if (BSFloatGreaterThanOrEqualToFloat()) {
    [v11 recombineGestureXRubberbandingStretch];
  }
  else {
    [v11 recombineGestureXRubberbandingCompress];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  BYTE8(v26) = 1;
  BYTE8(v27) = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  if (v13 <= 0.0) {
    objc_msgSend(v11, "recombineGestureTranslateFactorCompress", v26, v27);
  }
  else {
    objc_msgSend(v11, "recombineGestureTranslateFactorStretch", v26, v27);
  }
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (BOOL)_didContainerViewForActiveGestureCollapseWithFrame:(CGRect)a3 initialContainerViewFrame:(CGRect)a4 isPrimaryContainer:(BOOL)a5 activeInterfaceOrientation:(int64_t)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = a3.size.height;
  CGFloat v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  if (a5)
  {
    CGFloat v32 = a4.size.width;
    CGFloat rect = a3.size.height;
    double v13 = CGRectGetWidth(a3);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double v14 = v13 - CGRectGetWidth(v35);
    v36.origin.CGFloat x = v12;
    v36.origin.CGFloat y = v11;
    v36.size.CGFloat width = v10;
    v36.size.CGFloat height = rect;
    double v15 = CGRectGetHeight(v36);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = v32;
    v37.size.CGFloat height = height;
    double v16 = v15 - CGRectGetHeight(v37);
    double v17 = -v14;
    if (v14 >= 0.0) {
      double v17 = v14;
    }
    BOOL v18 = v16 < 0.0;
    if (v16 < 0.0) {
      double v16 = -v16;
    }
    if (v17 <= v16) {
      return v18;
    }
    else {
      return v14 < 0.0;
    }
  }
  else
  {
    uint64_t v21 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    CGFloat v22 = v12;
    CGFloat v23 = v11;
    CGFloat v24 = v10;
    CGFloat v25 = v9;
    if (v21 == 1)
    {
      if (a6 == 4)
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v22);
        v38.origin.CGFloat x = x;
        v38.origin.CGFloat y = y;
        v38.size.CGFloat width = width;
        v38.size.CGFloat height = height;
        double MaxX = CGRectGetMinX(v38);
      }
      else
      {
        double MinX = CGRectGetMaxX(*(CGRect *)&v22);
        v40.origin.CGFloat x = x;
        v40.origin.CGFloat y = y;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v40);
      }
      return MinX > MaxX;
    }
    else
    {
      CGFloat v28 = CGRectGetMinX(*(CGRect *)&v22);
      CGFloat v29 = x;
      double v30 = v28;
      v39.origin.CGFloat x = v29;
      v39.origin.CGFloat y = y;
      v39.size.CGFloat width = width;
      v39.size.CGFloat height = height;
      double v31 = CGRectGetMinX(v39);
      if (a6 == 4) {
        return v30 > v31;
      }
      else {
        return v30 < v31;
      }
    }
  }
}

- (id)_preferencesUpdatedWithCollapseOfElement:(void *)a3 activeFrame:(void *)a4 initialFrame:(void *)a5 minimumFrame:(double)a6 preferences:(double)a7 context:(double)a8
{
  *(double *)&v42[16] = a8;
  *(double *)&v42[24] = a9;
  *(double *)v42 = a6;
  *(double *)&v42[8] = a7;
  id v28 = a3;
  id v29 = a4;
  id v30 = a5;
  if ((unint64_t)([v28 interfaceOrientation] - 3) <= 1)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, a1, @"SBSAContainerResizeBehaviorProvider.m", 347, @"Invalid parameter not satisfying: %@", @"!UIInterfaceOrientationIsLandscape([associatedElementContext interfaceOrientation])" object file lineNumber description];

    if (!v28) {
      goto LABEL_7;
    }
  }
  else if (!v28)
  {
    goto LABEL_7;
  }
  if (v29)
  {
    v53.origin.CGFloat x = a10;
    v53.origin.CGFloat y = a11;
    v53.size.CGFloat width = a12;
    v53.size.CGFloat height = a13;
    CGRectGetMinX(v53);
    v54.origin.CGFloat x = a10;
    v54.origin.CGFloat y = a11;
    v54.size.CGFloat width = a12;
    v54.size.CGFloat height = a13;
    CGRectGetMidY(v54);
    v55.origin.CGFloat x = a14;
    v55.origin.CGFloat y = a15;
    v55.size.CGFloat width = a16;
    v55.size.CGFloat height = a17;
    CGRectGetMinX(v55);
    v56.origin.CGFloat x = a14;
    v56.origin.CGFloat y = a15;
    v56.size.CGFloat width = a16;
    v56.size.CGFloat height = a17;
    CGRectGetMidY(v56);
    CGRectGetMinX(*(CGRect *)v42);
    CGRectGetMidY(*(CGRect *)v42);
    UIDistanceBetweenPoints();
    double v32 = v31;
    UIDistanceBetweenPoints();
    double v34 = v33;
    CGRect v35 = [v29 elementDescriptions];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __138__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences_context___block_invoke;
    v50[3] = &unk_1E6AF9440;
    id v36 = v28;
    id v51 = v36;
    CGRect v37 = objc_msgSend(v35, "bs_firstObjectPassingTest:", v50);
    CGRect v38 = v37;
    if (v37)
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __138__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences_context___block_invoke_2;
      v43[3] = &unk_1E6B069A0;
      uint64_t v48 = a2;
      v43[4] = a1;
      id v44 = v37;
      id v45 = v36;
      id v46 = v30;
      double v49 = 1.0 - v32 / v34;
      id v47 = v35;
      uint64_t v39 = [v29 copyWithBlock:v43];

      id v29 = (id)v39;
    }
  }
LABEL_7:

  return v29;
}

uint64_t __138__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 associatedSystemApertureElementIdentity];
  uint64_t v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

void __138__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsapreference_0.isa);
    CGFloat v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerResizeBehaviorProvider.m", 360, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __138__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences_context___block_invoke_3;
  v21[3] = &unk_1E6AF95C8;
  uint64_t v25 = *(void *)(a1 + 72);
  double v14 = *(void **)(a1 + 40);
  v21[4] = *(void *)(a1 + 32);
  id v22 = v7;
  id v23 = *(id *)(a1 + 48);
  id v24 = *(id *)(a1 + 56);
  uint64_t v26 = *(void *)(a1 + 80);
  id v15 = v7;
  double v16 = (void *)[v14 copyWithBlock:v21];
  double v17 = *(void **)(a1 + 64);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __138__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences_context___block_invoke_4;
  v19[3] = &unk_1E6B06978;
  id v20 = *(id *)(a1 + 48);
  BOOL v18 = objc_msgSend(v17, "sbsa_arrayByAddingOrReplacingObject:passingTest:", v16, v19);
  [v15 setElementDescriptions:v18];
}

void __138__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_9;
  }
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 32);
    Class v11 = NSClassFromString(&cfstr_Sbsaelementdes.isa);
    CGFloat v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    [v8 handleFailureInMethod:v9, v10, @"SBSAContainerResizeBehaviorProvider.m", 362, @"Unexpected class – expected '%@', got '%@'", v11, v13 object file lineNumber description];

LABEL_9:
    id v7 = 0;
  }

  [v7 setSensorObscuringShadowProgress:1.0];
  double v14 = *(void **)(a1 + 40);
  id v15 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"sensorObscuringShadowProgress"];
  double v16 = [SBSAInterfaceElementPropertyIdentity alloc];
  double v17 = [v7 interfaceElementIdentifier];
  BOOL v18 = [(SBSAInterfaceElementPropertyIdentity *)v16 initWithAssociatedInterfaceElementIdentifier:v17 andProperty:@"sensorObscuringShadowProgress"];
  [v14 setAnimatedTransitionDescription:v15 forProperty:v18 withMilestones:0];

  uint64_t v19 = [*(id *)(a1 + 48) layoutMode];
  uint64_t v20 = [*(id *)(a1 + 56) layoutDirection];
  if (v19 == 3)
  {
    if (*(double *)(a1 + 72) * 4.0 <= 1.0) {
      double v32 = *(double *)(a1 + 72) * 4.0;
    }
    else {
      double v32 = 1.0;
    }
    [v7 setCustomContentAlpha:1.0 - v32];
    double v33 = *(void **)(a1 + 40);
    double v34 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"customContentAlpha"];
    CGRect v35 = [SBSAInterfaceElementPropertyIdentity alloc];
    id v36 = [v7 interfaceElementIdentifier];
    CGRect v37 = [(SBSAInterfaceElementPropertyIdentity *)v35 initWithAssociatedInterfaceElementIdentifier:v36 andProperty:@"customContentAlpha"];
    [v33 setAnimatedTransitionDescription:v34 forProperty:v37 withMilestones:0];

    [v7 setCustomContentBlurProgress:v32];
    CGRect v38 = *(void **)(a1 + 32);
    uint64_t v39 = *(void **)(a1 + 40);
    CGRect v40 = @"customContentBlurProgress";
    goto LABEL_28;
  }
  uint64_t v21 = v20;
  if (v19 == 2)
  {
    [v7 setLeadingViewAlpha:1.0 - *(double *)(a1 + 72)];
    v41 = *(void **)(a1 + 40);
    v42 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"leadingViewAlpha"];
    v43 = [SBSAInterfaceElementPropertyIdentity alloc];
    id v44 = [v7 interfaceElementIdentifier];
    id v45 = [(SBSAInterfaceElementPropertyIdentity *)v43 initWithAssociatedInterfaceElementIdentifier:v44 andProperty:@"leadingViewAlpha"];
    [v41 setAnimatedTransitionDescription:v42 forProperty:v45 withMilestones:0];

    [v7 setLeadingViewBlurProgress:*(double *)(a1 + 72)];
    id v46 = *(void **)(a1 + 40);
    id v47 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"leadingViewBlurProgress"];
    uint64_t v48 = [SBSAInterfaceElementPropertyIdentity alloc];
    double v49 = [v7 interfaceElementIdentifier];
    CGFloat v50 = [(SBSAInterfaceElementPropertyIdentity *)v48 initWithAssociatedInterfaceElementIdentifier:v49 andProperty:@"leadingViewBlurProgress"];
    [v46 setAnimatedTransitionDescription:v47 forProperty:v50 withMilestones:0];

    if (v7) {
      [v7 leadingViewTransform];
    }
    else {
      memset(v78, 0, sizeof(v78));
    }
    double v53 = *(double *)(a1 + 72);
    [*(id *)(a1 + 48) preferredLeadingBounds];
    double Width = CGRectGetWidth(v83);
    SBSASquishedTransform(v78, 1, v21 == 1, &v79, v53, Width);
    [v7 setLeadingViewTransform:&v79];
    CGRect v55 = *(void **)(a1 + 40);
    CGRect v56 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"leadingViewTransform"];
    v57 = [SBSAInterfaceElementPropertyIdentity alloc];
    v58 = [v7 interfaceElementIdentifier];
    v59 = [(SBSAInterfaceElementPropertyIdentity *)v57 initWithAssociatedInterfaceElementIdentifier:v58 andProperty:@"leadingViewTransform"];
    [v55 setAnimatedTransitionDescription:v56 forProperty:v59 withMilestones:0];

    [v7 setTrailingViewAlpha:1.0 - *(double *)(a1 + 72)];
    double v60 = *(void **)(a1 + 40);
    CGFloat v61 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"trailingViewAlpha"];
    double v62 = [SBSAInterfaceElementPropertyIdentity alloc];
    CGFloat v63 = [v7 interfaceElementIdentifier];
    double v64 = [(SBSAInterfaceElementPropertyIdentity *)v62 initWithAssociatedInterfaceElementIdentifier:v63 andProperty:@"trailingViewAlpha"];
    [v60 setAnimatedTransitionDescription:v61 forProperty:v64 withMilestones:0];

    [v7 setTrailingViewBlurProgress:*(double *)(a1 + 72)];
    CGFloat v65 = *(void **)(a1 + 40);
    double v66 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"trailingViewBlurProgress"];
    CGFloat v67 = [SBSAInterfaceElementPropertyIdentity alloc];
    double v68 = [v7 interfaceElementIdentifier];
    double v69 = [(SBSAInterfaceElementPropertyIdentity *)v67 initWithAssociatedInterfaceElementIdentifier:v68 andProperty:@"trailingViewBlurProgress"];
    [v65 setAnimatedTransitionDescription:v66 forProperty:v69 withMilestones:0];

    if (v7) {
      [v7 trailingViewTransform];
    }
    else {
      memset(v76, 0, sizeof(v76));
    }
    double v70 = *(double *)(a1 + 72);
    [*(id *)(a1 + 48) preferredTrailingBounds];
    double v71 = CGRectGetWidth(v84);
    SBSASquishedTransform(v76, 0, v21 == 1, &v77, v70, v71);
    [v7 setTrailingViewTransform:&v77];
    CGRect v38 = *(void **)(a1 + 32);
    uint64_t v39 = *(void **)(a1 + 40);
    CGRect v40 = @"trailingViewTransform";
    goto LABEL_28;
  }
  if (v19 == 1)
  {
    [v7 setMinimalViewAlpha:1.0 - *(double *)(a1 + 72)];
    id v22 = *(void **)(a1 + 40);
    id v23 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"minimalViewAlpha"];
    id v24 = [SBSAInterfaceElementPropertyIdentity alloc];
    uint64_t v25 = [v7 interfaceElementIdentifier];
    uint64_t v26 = [(SBSAInterfaceElementPropertyIdentity *)v24 initWithAssociatedInterfaceElementIdentifier:v25 andProperty:@"minimalViewAlpha"];
    [v22 setAnimatedTransitionDescription:v23 forProperty:v26 withMilestones:0];

    [v7 setMinimalViewBlurProgress:*(double *)(a1 + 72)];
    long long v27 = *(void **)(a1 + 40);
    id v28 = (void *)[*(id *)(a1 + 32) newAnimatedTransitionDescriptionForProperty:@"minimalViewBlurProgress"];
    id v29 = [SBSAInterfaceElementPropertyIdentity alloc];
    id v30 = [v7 interfaceElementIdentifier];
    double v31 = [(SBSAInterfaceElementPropertyIdentity *)v29 initWithAssociatedInterfaceElementIdentifier:v30 andProperty:@"minimalViewBlurProgress"];
    [v27 setAnimatedTransitionDescription:v28 forProperty:v31 withMilestones:0];

    if (v7) {
      [v7 minimalViewTransform];
    }
    else {
      memset(v80, 0, sizeof(v80));
    }
    double v51 = *(double *)(a1 + 72);
    [*(id *)(a1 + 48) preferredMinimalBounds];
    double v52 = CGRectGetWidth(v82);
    SBSASquishedTransform(v80, 1, v21 == 1, &v81, v51, v52);
    [v7 setMinimalViewTransform:&v81];
    CGRect v38 = *(void **)(a1 + 32);
    uint64_t v39 = *(void **)(a1 + 40);
    CGRect v40 = @"minimalViewTransform";
LABEL_28:
    uint64_t v72 = (void *)[v38 newAnimatedTransitionDescriptionForProperty:v40];
    v73 = [SBSAInterfaceElementPropertyIdentity alloc];
    v74 = [v7 interfaceElementIdentifier];
    double v75 = [(SBSAInterfaceElementPropertyIdentity *)v73 initWithAssociatedInterfaceElementIdentifier:v74 andProperty:v40];
    [v39 setAnimatedTransitionDescription:v72 forProperty:v75 withMilestones:0];
  }
}

uint64_t __138__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences_context___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 associatedSystemApertureElementIdentity];
  uint64_t v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeGestureDescription, 0);
  objc_storeStrong((id *)&self->_elementContexts, 0);
}

- (void)preferencesFromContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134349056;
  uint64_t v4 = [a1 queryIteration];
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[%{public}lu] Canceling resize gesture due to active element change", (uint8_t *)&v3, 0xCu);
}

@end