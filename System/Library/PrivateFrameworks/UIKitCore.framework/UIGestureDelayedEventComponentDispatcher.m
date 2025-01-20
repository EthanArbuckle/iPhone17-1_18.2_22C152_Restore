@interface UIGestureDelayedEventComponentDispatcher
- (BOOL)pressesBeganWasDelayedForPress:(uint64_t)a1;
- (BOOL)touchesBeganWasDelayedForTouch:(uint64_t)a1;
- (UIGestureDelayedEventComponentDispatcher)init;
- (uint64_t)enqueueDelayedPressToSend:(uint64_t)result;
- (uint64_t)enqueueDelayedTouchToSend:(uint64_t)result;
- (uint64_t)removeDelayedPress:(uint64_t)result;
- (void)cancelDelayedPresses:(void *)a3 presses:(void *)a4 fromEvent:;
- (void)cancelDelayedTouches:(void *)a3 touches:(void *)a4 fromEvent:;
- (void)delayedPressForPress:(void *)a3 event:;
- (void)delayedTouchForTouch:(void *)a3 event:;
- (void)removeDelayedTouch:(id *)a1;
- (void)removeDelayedTouchesToSend:(id)a3;
- (void)removePress:(uint64_t)a1;
- (void)removeTouch:(void *)a1;
- (void)sendDelayedPresses;
- (void)sendDelayedTouches;
@end

@implementation UIGestureDelayedEventComponentDispatcher

- (void)sendDelayedTouches
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v1 = a1;
  if (![a1[2] count]) {
    return;
  }
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v2 = v1[2];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v157 objects:v178 count:16];
  v129 = v1;
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    obuint64_t j = 0;
    uint64_t v6 = *(void *)v158;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v158 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v157 + 1) + 8 * v7);
        if (v8) {
          v9 = *(void **)(v8 + 24);
        }
        else {
          v9 = 0;
        }
        id v10 = v9;
        uint64_t v11 = [v10 phase];
        if (v8) {
          v12 = *(void **)(v8 + 32);
        }
        else {
          v12 = 0;
        }
        id v13 = v12;
        uint64_t v14 = [v13 phase];

        if (v11 == 4 && !v14)
        {
          if (!v5) {
            v5 = objc_opt_new();
          }
          [v5 addObject:v8];
          goto LABEL_36;
        }
        if (v11 == v14) {
          goto LABEL_36;
        }
        if (v11 == 2)
        {
          [v10 locationInView:0];
          double v16 = v15;
          double v18 = v17;
          v19 = v8 ? *(void **)(v8 + 32) : 0;
          id v20 = v19;
          [v20 locationInView:0];
          double v22 = v21;
          double v24 = v23;

          if (v16 == v22 && v18 == v24) {
            goto LABEL_36;
          }
        }
        if (v8)
        {
          uint64_t v8 = [(id)v8 copy];
          *(unsigned char *)(v8 + 16) = 1;
        }
        -[UIGestureDelayedTouch saveCurrentTouchState](v8);
        if (v8) {
          v25 = *(void **)(v8 + 40);
        }
        else {
          v25 = 0;
        }
        id v26 = v25;
        if ([v26 phase] == 2)
        {
          uint64_t v27 = 1;
        }
        else
        {
          if (v14 > 2 || [v26 phase] < 5) {
            goto LABEL_33;
          }
          uint64_t v27 = 3;
        }
        [v26 setPhase:v27];
LABEL_33:
        v28 = obj;
        if (!obj) {
          v28 = objc_opt_new();
        }
        obuint64_t j = v28;
        [v28 addObject:v8];

LABEL_36:
        ++v7;
      }
      while (v4 != v7);
      uint64_t v29 = [v2 countByEnumeratingWithState:&v157 objects:v178 count:16];
      uint64_t v4 = v29;
      if (!v29)
      {

        v1 = v129;
        if (obj)
        {
          [v129[2] addObjectsFromArray:obj];
        }
        if (v5)
        {
          [v129 removeDelayedTouchesToSend:v5];
          goto LABEL_48;
        }
        goto LABEL_49;
      }
    }
  }
  v5 = v2;
LABEL_48:

LABEL_49:
  [v1[2] sortUsingComparator:&__block_literal_global_27];
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id obja = v1[2];
  uint64_t v30 = [obja countByEnumeratingWithState:&v153 objects:v177 count:16];
  if (!v30)
  {
    v32 = 0;
    v33 = 0;
    goto LABEL_74;
  }
  uint64_t v31 = v30;
  v32 = 0;
  v33 = 0;
  uint64_t v34 = *(void *)v154;
  do
  {
    uint64_t v35 = 0;
    do
    {
      if (*(void *)v154 != v34) {
        objc_enumerationMutation(obja);
      }
      uint64_t v36 = *(void *)(*((void *)&v153 + 1) + 8 * v35);
      if (v36) {
        v37 = *(void **)(v36 + 24);
      }
      else {
        v37 = 0;
      }
      id v38 = v37;
      [v38 setIsDelayed:0];
      if (v36)
      {
        if (*(unsigned char *)(v36 + 16))
        {
          if (v32) {
            goto LABEL_62;
          }
          goto LABEL_64;
        }
        -[UIGestureDelayedTouch saveCurrentTouchState](v36);
        v39 = *(void **)(v36 + 32);
      }
      else
      {
        -[UIGestureDelayedTouch saveCurrentTouchState](0);
        v39 = 0;
      }
      id v40 = v39;
      [v38 _loadStateFromTouch:v40];

      if (v32)
      {
LABEL_62:
        if (![v32 count]) {
          goto LABEL_67;
        }
        v41 = [v32 lastObject];
        uint64_t v42 = [v41 phaseForDelivery];
        uint64_t v43 = [(id)v36 phaseForDelivery];

        if (v42 == v43) {
          goto LABEL_67;
        }
      }
LABEL_64:
      if (!v33) {
        v33 = objc_opt_new();
      }
      uint64_t v44 = objc_opt_new();

      [v33 addObject:v44];
      v32 = (void *)v44;
LABEL_67:
      [v32 addObject:v36];

      ++v35;
    }
    while (v31 != v35);
    uint64_t v45 = [obja countByEnumeratingWithState:&v153 objects:v177 count:16];
    uint64_t v31 = v45;
  }
  while (v45);
LABEL_74:
  v125 = v32;

  [v129[2] removeAllObjects];
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v126 = v33;
  uint64_t v128 = [v126 countByEnumeratingWithState:&v149 objects:v176 count:16];
  if (v128)
  {
    uint64_t v127 = *(void *)v150;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v150 != v127) {
          objc_enumerationMutation(v126);
        }
        v47 = *(void **)(*((void *)&v149 + 1) + 8 * v46);
        if (*(unsigned char *)__UILogGetCategoryCachedImpl("Gesture", &_MergedGlobals_943))
        {
          long long v147 = 0u;
          long long v148 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          id v85 = v47;
          uint64_t v86 = [v85 countByEnumeratingWithState:&v145 objects:v175 count:16];
          if (v86)
          {
            uint64_t v87 = v86;
            uint64_t v88 = *(void *)v146;
            do
            {
              uint64_t v89 = 0;
              do
              {
                if (*(void *)v146 != v88) {
                  objc_enumerationMutation(v85);
                }
                id v90 = *(id *)(*((void *)&v145 + 1) + 8 * v89);
                unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &qword_1EB25EFF0);
                if (*(unsigned char *)CategoryCachedImpl)
                {
                  v92 = *(NSObject **)(CategoryCachedImpl + 8);
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v131 = v46;
                    objc = v92;
                    if (v90) {
                      v93 = (void *)*((void *)v90 + 3);
                    }
                    else {
                      v93 = 0;
                    }
                    id v124 = v93;
                    v94 = (objc_class *)objc_opt_class();
                    v95 = NSStringFromClass(v94);
                    if (v90)
                    {
                      id v96 = *((id *)v90 + 3);
                      v97 = (void *)*((void *)v90 + 4);
                      id v90 = v96;
                    }
                    else
                    {
                      id v96 = 0;
                      v97 = 0;
                    }
                    id v98 = v97;
                    v99 = [v98 _phaseDescription];
                    *(_DWORD *)buf = 138412802;
                    v182 = v95;
                    __int16 v183 = 2048;
                    id v184 = v96;
                    __int16 v185 = 2112;
                    v186 = v99;
                    _os_log_impl(&dword_1853B0000, objc, OS_LOG_TYPE_ERROR, "Dispatching delayed touch <%@: %p; phase = %@>",
                      buf,
                      0x20u);

                    uint64_t v46 = v131;
                  }
                }
                ++v89;
              }
              while (v87 != v89);
              uint64_t v100 = [v85 countByEnumeratingWithState:&v145 objects:v175 count:16];
              uint64_t v87 = v100;
            }
            while (v100);
          }
        }
        if ([v47 count])
        {
          uint64_t v130 = v46;
          v48 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          id objb = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          long long v169 = 0u;
          long long v170 = 0u;
          long long v171 = 0u;
          long long v172 = 0u;
          id v49 = v47;
          uint64_t v50 = [v49 countByEnumeratingWithState:&v169 objects:buf count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v170;
            do
            {
              uint64_t v53 = 0;
              do
              {
                if (*(void *)v170 != v52) {
                  objc_enumerationMutation(v49);
                }
                uint64_t v54 = *(void *)(*((void *)&v169 + 1) + 8 * v53);
                if (v54)
                {
                  id v55 = *(id *)(v54 + 24);
                  if (*(unsigned char *)(v54 + 16))
                  {
                    id v56 = *(id *)(v54 + 40);
                    [v55 _loadStateFromTouch:v56];

                    id v57 = *(id *)(v54 + 32);
                    v58 = [v57 _responder];
                    [v55 _setResponder:v58];

                    id v59 = *(id *)(v54 + 32);
                    v60 = [v59 window];
                    [v55 setWindow:v60];

                    id v61 = *(id *)(v54 + 24);
                    uint64_t v62 = [v61 phase];
                    id v63 = *(id *)(v54 + 32);
                    [v63 setPhase:v62];
                  }
                }
                else
                {
                  id v55 = 0;
                }
                v64 = [v55 _responder];
                v65 = [v64 _eventReceivingWindow];

                if (v65)
                {
                  id v66 = [v48 objectForKey:v64];
                  if (!v66)
                  {
                    id v66 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                    [v48 setObject:v66 forKey:v64];
                    if (v54) {
                      v67 = *(void **)(v54 + 48);
                    }
                    else {
                      v67 = 0;
                    }
                    id v68 = v67;
                    [objb setObject:v68 forKey:v64];
                  }
                  [v66 addObject:v55];
                }
                ++v53;
              }
              while (v51 != v53);
              uint64_t v69 = [v49 countByEnumeratingWithState:&v169 objects:buf count:16];
              uint64_t v51 = v69;
            }
            while (v69);
          }

          long long v167 = 0u;
          long long v168 = 0u;
          long long v165 = 0u;
          long long v166 = 0u;
          id v70 = v48;
          uint64_t v71 = [v70 countByEnumeratingWithState:&v165 objects:v180 count:16];
          if (v71)
          {
            uint64_t v72 = v71;
            uint64_t v73 = *(void *)v166;
            do
            {
              for (uint64_t i = 0; i != v72; ++i)
              {
                if (*(void *)v166 != v73) {
                  objc_enumerationMutation(v70);
                }
                v75 = *(void **)(*((void *)&v165 + 1) + 8 * i);
                v76 = [v70 objectForKey:v75];
                v77 = [objb objectForKey:v75];
                long long v161 = 0u;
                long long v162 = 0u;
                long long v163 = 0u;
                long long v164 = 0u;
                id v78 = v76;
                uint64_t v79 = [v78 countByEnumeratingWithState:&v161 objects:v179 count:16];
                if (v79)
                {
                  uint64_t v80 = v79;
                  uint64_t v81 = *(void *)v162;
                  do
                  {
                    for (uint64_t j = 0; j != v80; ++j)
                    {
                      if (*(void *)v162 != v81) {
                        objc_enumerationMutation(v78);
                      }
                      [v77 _addTouch:*(void *)(*((void *)&v161 + 1) + 8 * j) forDelayedDelivery:1];
                    }
                    uint64_t v80 = [v78 countByEnumeratingWithState:&v161 objects:v179 count:16];
                  }
                  while (v80);
                }

                v83 = [v78 anyObject];
                uint64_t v84 = [v83 phase];

                switch(v84)
                {
                  case 0:
                    [v75 touchesBegan:v78 withEvent:v77];
                    break;
                  case 1:
                    [v75 touchesMoved:v78 withEvent:v77];
                    break;
                  case 3:
                    [v75 touchesEnded:v78 withEvent:v77];
                    break;
                  case 4:
                    [v75 touchesCancelled:v78 withEvent:v77];
                    break;
                  default:
                    break;
                }
              }
              uint64_t v72 = [v70 countByEnumeratingWithState:&v165 objects:v180 count:16];
            }
            while (v72);
          }

          uint64_t v46 = v130;
        }
        ++v46;
      }
      while (v46 != v128);
      uint64_t v101 = [v126 countByEnumeratingWithState:&v149 objects:v176 count:16];
      uint64_t v128 = v101;
    }
    while (v101);
  }

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id objd = v126;
  uint64_t v102 = [objd countByEnumeratingWithState:&v141 objects:v174 count:16];
  if (v102)
  {
    uint64_t v103 = v102;
    uint64_t v104 = *(void *)v142;
    do
    {
      for (uint64_t k = 0; k != v103; ++k)
      {
        if (*(void *)v142 != v104) {
          objc_enumerationMutation(objd);
        }
        v106 = *(void **)(*((void *)&v141 + 1) + 8 * k);
        long long v137 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        id v107 = v106;
        uint64_t v108 = [v107 countByEnumeratingWithState:&v137 objects:v173 count:16];
        if (v108)
        {
          uint64_t v109 = v108;
          uint64_t v110 = *(void *)v138;
          do
          {
            uint64_t v111 = 0;
            do
            {
              if (*(void *)v138 != v110) {
                objc_enumerationMutation(v107);
              }
              uint64_t v112 = *(void *)(*((void *)&v137 + 1) + 8 * v111);
              if (v112)
              {
                int v113 = *(unsigned __int8 *)(v112 + 16);
                id v114 = *(id *)(v112 + 24);
                v115 = v114;
                if (v113)
                {
                  uint64_t v116 = [v114 phase];

                  if (v116 == 3) {
                    goto LABEL_161;
                  }
                  goto LABEL_164;
                }
                v117 = *(void **)(v112 + 40);
              }
              else
              {
                v115 = 0;
                v117 = 0;
              }
              id v118 = v117;
              [v115 _loadStateFromTouch:v118];

              if ([(id)v112 phaseForDelivery] == 3)
              {
                v119 = v112 ? *(void **)(v112 + 24) : 0;
                id v120 = v119;
                BOOL CanBeConsideredForSentTouchesEnded = _UIDelayedTouchCanBeConsideredForSentTouchesEnded(v120);

                if (CanBeConsideredForSentTouchesEnded)
                {
                  if (v112)
                  {
LABEL_161:
                    v122 = *(id *)(v112 + 24);
                    if (v122) {
                      v122[118] |= 8u;
                    }
                  }
                  else
                  {
                    v122 = 0;
                  }
                }
              }
LABEL_164:
              ++v111;
            }
            while (v109 != v111);
            uint64_t v123 = [v107 countByEnumeratingWithState:&v137 objects:v173 count:16];
            uint64_t v109 = v123;
          }
          while (v123);
        }
      }
      uint64_t v103 = [objd countByEnumeratingWithState:&v141 objects:v174 count:16];
    }
    while (v103);
  }
}

- (void)sendDelayedPresses
{
  uint64_t v198 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    if ([a1[4] count])
    {
      long long v170 = 0u;
      long long v171 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      id v2 = v1[4];
      uint64_t v3 = [v2 countByEnumeratingWithState:&v168 objects:v189 count:16];
      long long v140 = v1;
      if (v3)
      {
        uint64_t v4 = v3;
        obuint64_t j = 0;
        v5 = 0;
        uint64_t v6 = *(void *)v169;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v169 != v6) {
              objc_enumerationMutation(v2);
            }
            uint64_t v8 = *(void *)(*((void *)&v168 + 1) + 8 * v7);
            if (v8) {
              v9 = *(void **)(v8 + 24);
            }
            else {
              v9 = 0;
            }
            id v10 = v9;
            if ([v10 phase] == 4
              && (!v8 ? (uint64_t v11 = 0) : (uint64_t v11 = *(void **)(v8 + 32)),
                  id v12 = v11,
                  uint64_t v13 = [v12 phase],
                  v12,
                  !v13))
            {
              uint64_t v29 = obj;
              if (!obj)
              {
                uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
              }
              obuint64_t j = v29;
              [v29 addObject:v8];
            }
            else
            {
              uint64_t v14 = [v10 phase];
              if (v8) {
                double v15 = *(void **)(v8 + 32);
              }
              else {
                double v15 = 0;
              }
              id v16 = v15;
              uint64_t v17 = [v16 phase];

              if (v14 != v17)
              {
                if ([v10 phase] != 2
                  || (([v10 force], v19 = v18, !v8) ? (id v20 = 0) : (id v20 = *(void **)(v8 + 32)),
                      id v21 = v20,
                      [v21 force],
                      double v23 = v22,
                      v21,
                      v19 != v23))
                {
                  if (v8)
                  {
                    uint64_t v8 = [(id)v8 copy];
                    *(unsigned char *)(v8 + 16) = 1;
                  }
                  -[UIGestureDelayedPress saveCurrentPressState](v8);
                  if (v8) {
                    double v24 = *(void **)(v8 + 40);
                  }
                  else {
                    double v24 = 0;
                  }
                  id v25 = v24;
                  uint64_t v26 = [v25 phase];

                  if (v26 == 2)
                  {
                    if (v8) {
                      uint64_t v27 = *(void **)(v8 + 40);
                    }
                    else {
                      uint64_t v27 = 0;
                    }
                    id v28 = v27;
                    [v28 setPhase:1];
                  }
                  if (!v5)
                  {
                    v5 = [MEMORY[0x1E4F1CA48] array];
                  }
                  [v5 addObject:v8];
                }
              }
            }

            ++v7;
          }
          while (v4 != v7);
          uint64_t v30 = [v2 countByEnumeratingWithState:&v168 objects:v189 count:16];
          uint64_t v4 = v30;
        }
        while (v30);

        v1 = v140;
        if (v5)
        {
          [v140[4] addObjectsFromArray:v5];
        }
        if (!obj) {
          goto LABEL_49;
        }
        [v140[4] removeObjectsInArray:obj];
        id v2 = obj;
      }

LABEL_49:
      [v1[4] sortUsingComparator:&__block_literal_global_8_0];
      long long v166 = 0u;
      long long v167 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      id obja = v1[4];
      uint64_t v31 = [obja countByEnumeratingWithState:&v164 objects:v188 count:16];
      if (!v31)
      {
        v33 = 0;
        uint64_t v34 = 0;
        goto LABEL_74;
      }
      uint64_t v32 = v31;
      v33 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = *(void *)v165;
      while (1)
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v165 != v35) {
            objc_enumerationMutation(obja);
          }
          uint64_t v37 = *(void *)(*((void *)&v164 + 1) + 8 * v36);
          if (v37) {
            id v38 = *(void **)(v37 + 24);
          }
          else {
            id v38 = 0;
          }
          id v39 = v38;
          [v39 setIsDelayed:0];
          if (v37)
          {
            if (*(unsigned char *)(v37 + 16))
            {
              if (v33) {
                goto LABEL_62;
              }
              goto LABEL_64;
            }
            -[UIGestureDelayedPress saveCurrentPressState](v37);
            id v40 = *(void **)(v37 + 32);
          }
          else
          {
            -[UIGestureDelayedPress saveCurrentPressState](0);
            id v40 = 0;
          }
          id v41 = v40;
          [v39 _loadStateFromPress:v41];

          if (v33)
          {
LABEL_62:
            if (![v33 count]) {
              goto LABEL_67;
            }
            uint64_t v42 = [v33 lastObject];
            uint64_t v43 = [v42 phaseForDelivery];
            uint64_t v44 = [(id)v37 phaseForDelivery];

            if (v43 == v44) {
              goto LABEL_67;
            }
          }
LABEL_64:
          if (!v34) {
            uint64_t v34 = objc_opt_new();
          }
          uint64_t v45 = objc_opt_new();

          [v34 addObject:v45];
          v33 = (void *)v45;
LABEL_67:
          [v33 addObject:v37];

          ++v36;
        }
        while (v32 != v36);
        uint64_t v46 = [obja countByEnumeratingWithState:&v164 objects:v188 count:16];
        uint64_t v32 = v46;
        if (!v46)
        {
LABEL_74:
          v129 = v33;

          [v140[4] removeAllObjects];
          long long v162 = 0u;
          long long v163 = 0u;
          long long v160 = 0u;
          long long v161 = 0u;
          id v130 = v34;
          uint64_t v133 = [v130 countByEnumeratingWithState:&v160 objects:v187 count:16];
          if (!v133) {
            goto LABEL_143;
          }
          CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          uint64_t v132 = *(void *)v161;
          *(void *)&long long v47 = 138412802;
          long long v128 = v47;
LABEL_76:
          uint64_t v48 = 0;
          while (1)
          {
            if (*(void *)v161 != v132) {
              objc_enumerationMutation(v130);
            }
            id v49 = *(void **)(*((void *)&v160 + 1) + 8 * v48);
            if (*(unsigned char *)__UILogGetCategoryCachedImpl("Gesture", &qword_1EB25EFF8))
            {
              long long v158 = 0u;
              long long v159 = 0u;
              long long v156 = 0u;
              long long v157 = 0u;
              id v94 = v49;
              uint64_t v95 = [v94 countByEnumeratingWithState:&v156 objects:v186 count:16];
              if (v95)
              {
                uint64_t v96 = v95;
                uint64_t v97 = *(void *)v157;
                do
                {
                  uint64_t v98 = 0;
                  do
                  {
                    if (*(void *)v157 != v97) {
                      objc_enumerationMutation(v94);
                    }
                    uint64_t v99 = *(void *)(*((void *)&v156 + 1) + 8 * v98);
                    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &qword_1EB25F000);
                    if (*(unsigned char *)CategoryCachedImpl)
                    {
                      uint64_t v101 = *(NSObject **)(CategoryCachedImpl + 8);
                      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                      {
                        long long v142 = v101;
                        if (v99) {
                          uint64_t v102 = *(void **)(v99 + 24);
                        }
                        else {
                          uint64_t v102 = 0;
                        }
                        id v139 = v102;
                        uint64_t v103 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v103);
                        id objc = (id)objc_claimAutoreleasedReturnValue();
                        if (v99)
                        {
                          id v104 = *(id *)(v99 + 24);
                          v105 = *(void **)(v99 + 32);
                          long long v137 = v104;
                        }
                        else
                        {
                          id v104 = 0;
                          long long v137 = 0;
                          v105 = 0;
                        }
                        id v106 = v105;
                        id v107 = [v106 _phaseDescription];
                        *(_DWORD *)buf = v128;
                        id v193 = objc;
                        __int16 v194 = 2048;
                        id v195 = v104;
                        __int16 v196 = 2112;
                        v197 = v107;
                        _os_log_impl(&dword_1853B0000, v142, OS_LOG_TYPE_ERROR, "Dispatching delayed press <%@: %p; phase = %@>",
                          buf,
                          0x20u);
                      }
                    }
                    ++v98;
                  }
                  while (v96 != v98);
                  uint64_t v108 = [v94 countByEnumeratingWithState:&v156 objects:v186 count:16];
                  uint64_t v96 = v108;
                }
                while (v108);
              }
            }
            if (objc_msgSend(v49, "count", v128)) {
              break;
            }
LABEL_122:
            if (++v48 == v133)
            {
              uint64_t v109 = [v130 countByEnumeratingWithState:&v160 objects:v187 count:16];
              uint64_t v133 = v109;
              if (v109) {
                goto LABEL_76;
              }
LABEL_143:

              long long v154 = 0u;
              long long v155 = 0u;
              long long v152 = 0u;
              long long v153 = 0u;
              id objd = v130;
              uint64_t v110 = [objd countByEnumeratingWithState:&v152 objects:v185 count:16];
              if (!v110) {
                goto LABEL_166;
              }
              uint64_t v111 = v110;
              uint64_t v112 = *(void *)v153;
LABEL_145:
              uint64_t v113 = 0;
              while (1)
              {
                if (*(void *)v153 != v112) {
                  objc_enumerationMutation(objd);
                }
                id v114 = *(void **)(*((void *)&v152 + 1) + 8 * v113);
                long long v148 = 0u;
                long long v149 = 0u;
                long long v150 = 0u;
                long long v151 = 0u;
                id v115 = v114;
                uint64_t v116 = [v115 countByEnumeratingWithState:&v148 objects:v184 count:16];
                if (v116) {
                  break;
                }
LABEL_164:

                if (++v113 == v111)
                {
                  uint64_t v111 = [objd countByEnumeratingWithState:&v152 objects:v185 count:16];
                  if (!v111)
                  {
LABEL_166:

                    return;
                  }
                  goto LABEL_145;
                }
              }
              uint64_t v117 = v116;
              uint64_t v118 = *(void *)v149;
              while (2)
              {
                uint64_t v119 = 0;
LABEL_151:
                if (*(void *)v149 != v118) {
                  objc_enumerationMutation(v115);
                }
                uint64_t v120 = *(void *)(*((void *)&v148 + 1) + 8 * v119);
                if (v120)
                {
                  int v121 = *(unsigned __int8 *)(v120 + 16);
                  id v122 = *(id *)(v120 + 24);
                  id v123 = v122;
                  if (v121)
                  {
                    uint64_t v124 = [v122 phase];

                    if (v124 == 3)
                    {
                      id v123 = *(id *)(v120 + 24);
                      [v123 setSentPressesEnded:1];
                      goto LABEL_159;
                    }
                    goto LABEL_160;
                  }
                  v125 = *(void **)(v120 + 40);
                }
                else
                {
                  id v123 = 0;
                  v125 = 0;
                }
                id v126 = v125;
                [v123 _loadStateFromPress:v126];

LABEL_159:
LABEL_160:
                if (v117 == ++v119)
                {
                  uint64_t v127 = [v115 countByEnumeratingWithState:&v148 objects:v184 count:16];
                  uint64_t v117 = v127;
                  if (!v127) {
                    goto LABEL_164;
                  }
                  continue;
                }
                goto LABEL_151;
              }
            }
          }
          uint64_t v134 = v48;
          CFDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0, 0, MEMORY[0x1E4F1D540]);
          long long v180 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          long long v183 = 0u;
          id v51 = v49;
          uint64_t v52 = [v51 countByEnumeratingWithState:&v180 objects:buf count:16];
          if (!v52) {
            goto LABEL_100;
          }
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v181;
          while (2)
          {
            uint64_t v55 = 0;
LABEL_84:
            if (*(void *)v181 != v54) {
              objc_enumerationMutation(v51);
            }
            uint64_t v56 = *(void *)(*((void *)&v180 + 1) + 8 * v55);
            if (v56)
            {
              id v57 = *(id *)(v56 + 24);
              if (*(unsigned char *)(v56 + 16))
              {
                id v58 = *(id *)(v56 + 40);
                [v57 _loadStateFromPress:v58];

                id v59 = *(id *)(v56 + 32);
                v60 = [v59 responder];
                [v57 setResponder:v60];

                id v61 = *(id *)(v56 + 32);
                uint64_t v62 = [v61 window];
                [v57 setWindow:v62];

                id v63 = *(id *)(v56 + 24);
                uint64_t v64 = [v63 phase];
                id v65 = *(id *)(v56 + 32);
                [v65 setPhase:v64];
              }
            }
            else
            {
              id v57 = 0;
            }
            id v66 = [v57 responder];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0) {
              goto LABEL_93;
            }
            id v68 = [v57 responder];
            uint64_t v69 = [v68 window];
            if (v69)
            {

              goto LABEL_93;
            }
            id v70 = [v57 responder];
            objc_opt_class();
            char v71 = objc_opt_isKindOfClass();

            if (v71)
            {
LABEL_93:
              uint64_t v72 = [v57 responder];
              uint64_t v73 = CFDictionaryGetValue(Mutable, v72);

              if (!v73)
              {
                uint64_t v73 = [MEMORY[0x1E4F1CA80] set];
                v74 = [v57 responder];
                CFDictionarySetValue(Mutable, v74, v73);
              }
              [v73 addObject:v57];
            }
            if (v53 == ++v55)
            {
              uint64_t v75 = [v51 countByEnumeratingWithState:&v180 objects:buf count:16];
              uint64_t v53 = v75;
              if (!v75)
              {
LABEL_100:

                long long v178 = 0u;
                long long v179 = 0u;
                long long v176 = 0u;
                long long v177 = 0u;
                CFDictionaryRef v141 = Mutable;
                uint64_t v138 = [(__CFDictionary *)v141 countByEnumeratingWithState:&v176 objects:v191 count:16];
                if (v138)
                {
                  uint64_t v136 = *(void *)v177;
                  do
                  {
                    for (uint64_t i = 0; i != v138; ++i)
                    {
                      if (*(void *)v177 != v136) {
                        objc_enumerationMutation(v141);
                      }
                      id objb = *(id *)(*((void *)&v176 + 1) + 8 * i);
                      v77 = CFDictionaryGetValue(v141, objb);
                      id v78 = (void *)UIApp;
                      uint64_t v79 = [v77 anyObject];
                      uint64_t v80 = [v79 window];
                      id v81 = (id)[v78 _pressesEventForWindow:v80];

                      long long v174 = 0u;
                      long long v175 = 0u;
                      long long v172 = 0u;
                      long long v173 = 0u;
                      id v82 = v77;
                      uint64_t v83 = [v82 countByEnumeratingWithState:&v172 objects:v190 count:16];
                      if (v83)
                      {
                        uint64_t v84 = v83;
                        uint64_t v85 = *(void *)v173;
                        do
                        {
                          for (uint64_t j = 0; j != v84; ++j)
                          {
                            if (*(void *)v173 != v85) {
                              objc_enumerationMutation(v82);
                            }
                            uint64_t v87 = *(void **)(*((void *)&v172 + 1) + 8 * j);
                            uint64_t v88 = (void *)UIApp;
                            uint64_t v89 = [v87 window];
                            id v90 = (id)[v88 _pressesEventForWindow:v89];

                            if (v90 != v81)
                            {
                              v135 = [MEMORY[0x1E4F28B00] currentHandler];
                              v91 = [NSString stringWithUTF8String:"void sendEventForDelayedPresses(NSArray<UIGestureDelayedPress *> *const __strong)"];
                              [v135 handleFailureInFunction:v91 file:@"UIGestureDelayedEventComponentDispatcher.m" lineNumber:512 description:@"events are from different window scenes"];
                            }
                            [v90 _addPress:v87 forDelayedDelivery:1];
                          }
                          uint64_t v84 = [v82 countByEnumeratingWithState:&v172 objects:v190 count:16];
                        }
                        while (v84);
                      }

                      v92 = [v82 anyObject];
                      uint64_t v93 = [v92 phase];

                      switch(v93)
                      {
                        case 0:
                          [objb pressesBegan:v82 withEvent:v81];
                          break;
                        case 1:
                          [objb pressesChanged:v82 withEvent:v81];
                          break;
                        case 3:
                          [objb pressesEnded:v82 withEvent:v81];
                          break;
                        case 4:
                          [objb pressesCancelled:v82 withEvent:v81];
                          break;
                        default:
                          break;
                      }
                    }
                    uint64_t v138 = [(__CFDictionary *)v141 countByEnumeratingWithState:&v176 objects:v191 count:16];
                  }
                  while (v138);
                }

                CFRelease(v141);
                uint64_t v48 = v134;
                goto LABEL_122;
              }
              continue;
            }
            goto LABEL_84;
          }
        }
      }
    }
  }
}

- (void)removeDelayedTouch:(id *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (!a2)
  {
    v5 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= 1) {
    *(void *)(a2 + 8) = --v4;
  }
  if (!v4)
  {
    v5 = *(void **)(a2 + 24);
LABEL_7:
    id v6 = v5;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &removeDelayedTouch____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v8 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11.receiver = a1;
        v11.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
        v9 = v8;
        id v10 = objc_msgSendSuper2(&v11, sel_description);
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%@: Clearing delay on touch %@", buf, 0x16u);
      }
    }
    objc_msgSend(v6, "setIsDelayed:", 0, v11.receiver, v11.super_class);
    [v6 _setIsFirstTouchForView:0];
    [a1[1] removeObject:a2];
  }
}

- (uint64_t)enqueueDelayedTouchToSend:(uint64_t)result
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = (id *)result;
  if (!a2)
  {
    v5 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= 1) {
    *(void *)(a2 + 8) = --v4;
  }
  if (!v4)
  {
    v5 = *(void **)(a2 + 24);
LABEL_7:
    id v6 = v5;
    if ([v6 isDelayed])
    {
      if (a2) {
        uint64_t v7 = *(void **)(a2 + 24);
      }
      else {
        uint64_t v7 = 0;
      }
      id v8 = v7;
      v9 = _UIGestureDelayedTouchForUITouch(v8, v3[2]);

      if (!v9)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", enqueueDelayedTouchToSend____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          objc_super v11 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v23.receiver = v3;
            v23.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
            id v12 = v11;
            uint64_t v13 = objc_msgSendSuper2(&v23, sel_description);
            if (a2) {
              __int16 v14 = *(void **)(a2 + 24);
            }
            else {
              __int16 v14 = 0;
            }
            id v15 = v14;
            uint64_t v16 = (objc_class *)objc_opt_class();
            uint64_t v17 = NSStringFromClass(v16);
            if (a2)
            {
              id v18 = *(id *)(a2 + 24);
              double v19 = *(void **)(a2 + 32);
              id v20 = v18;
            }
            else
            {
              id v18 = 0;
              id v20 = 0;
              double v19 = 0;
            }
            id v21 = v19;
            double v22 = objc_msgSend(v21, "_phaseDescription", v23.receiver, v23.super_class);
            *(_DWORD *)buf = 138413058;
            id v25 = v13;
            __int16 v26 = 2112;
            uint64_t v27 = v17;
            __int16 v28 = 2048;
            id v29 = v18;
            __int16 v30 = 2112;
            uint64_t v31 = v22;
            _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@: Sending delayed touch <%@: %p; phase = %@>",
              buf,
              0x2Au);
          }
        }
        [v3[2] addObject:a2];
      }
    }
    else
    {
    }
    return [v3[1] removeObject:a2];
  }
  return result;
}

- (void)removeTouch:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = _UIGestureDelayedTouchForUITouch(a2, a1[2]);
    if (v4)
    {
      do
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", removeTouch____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          id v8 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            log = v8;
            v9 = (objc_class *)objc_opt_class();
            objc_super v11 = NSStringFromClass(v9);
            id v10 = [a2 _phaseDescription];
            *(_DWORD *)buf = 138412802;
            id v15 = v11;
            __int16 v16 = 2048;
            uint64_t v17 = a2;
            __int16 v18 = 2112;
            double v19 = v10;
            _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "Cancelling send of touch <%@: %p; phase = %@>",
              buf,
              0x20u);
          }
        }
        uint64_t v13 = v4;
        id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
        [a1 removeDelayedTouchesToSend:v6];

        uint64_t v7 = _UIGestureDelayedTouchForUITouch(a2, a1[2]);

        uint64_t v4 = (void *)v7;
      }
      while (v7);
    }
  }
}

- (BOOL)touchesBeganWasDelayedForTouch:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 8));
  uint64_t v4 = (id *)objc_claimAutoreleasedReturnValue();
  if ((v4
     || (_UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 16)),
         (uint64_t v4 = (id *)objc_claimAutoreleasedReturnValue()) != 0))
    && [a2 isDelayed])
  {
    id v5 = v4[4];
    BOOL v6 = [v5 phase] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)cancelDelayedTouches:(void *)a3 touches:(void *)a4 fromEvent:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v5 = [a2 count];
    if (v5 < 1)
    {
      uint64_t v27 = 0;
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v6 = v5;
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = a2;
    uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v46;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * v10);
          if (v11) {
            id v12 = *(void **)(v11 + 24);
          }
          else {
            id v12 = 0;
          }
          id v13 = v12;
          uint64_t v14 = [v13 phase];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke;
          aBlock[3] = &unk_1E52D9CD0;
          id v43 = v13;
          uint64_t v44 = v14;
          id v15 = v13;
          __int16 v16 = _Block_copy(aBlock);
          [v7 addObject:v16];

          if (v11) {
            uint64_t v17 = *(void **)(v11 + 32);
          }
          else {
            uint64_t v17 = 0;
          }
          id v18 = v17;
          [v15 _loadStateFromTouch:v18];

          [v27 addObject:v15];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        uint64_t v8 = v19;
      }
      while (v19);
    }

    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    id v39 = __Block_byref_object_copy__12;
    id v40 = __Block_byref_object_dispose__12;
    id v41 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v33 = __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke_12;
    uint64_t v34 = &unk_1E52DCF80;
    uint64_t v35 = &v36;
    __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke_12((uint64_t)v32, a3);
    v33((uint64_t)v32, v27);
    if ([(id)v37[5] count]) {
      [a4 _cancelComponents:v37[5]];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v20);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v28 + 1) + 8 * v23++) + 16))();
        }
        while (v21 != v23);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v49 count:16];
      }
      while (v21);
    }

    _Block_object_dispose(&v36, 8);
  }
}

void __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "_responder", (void)v14);

        if (v9)
        {
          uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          if (!v10)
          {
            uint64_t v11 = objc_opt_new();
            uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
            id v13 = *(void **)(v12 + 40);
            *(void *)(v12 + 40) = v11;

            uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          }
          [v10 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)cancelDelayedPresses:(void *)a3 presses:(void *)a4 fromEvent:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v5 = [a2 count];
    if (v5 < 1)
    {
      uint64_t v27 = 0;
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v6 = v5;
      uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
      uint64_t v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = a2;
    uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v46;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * v10);
          if (v11) {
            uint64_t v12 = *(void **)(v11 + 24);
          }
          else {
            uint64_t v12 = 0;
          }
          id v13 = v12;
          uint64_t v14 = [v13 phase];
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke;
          aBlock[3] = &unk_1E52D9CD0;
          id v43 = v13;
          uint64_t v44 = v14;
          id v15 = v13;
          long long v16 = _Block_copy(aBlock);
          [v7 addObject:v16];

          if (v11) {
            long long v17 = *(void **)(v11 + 32);
          }
          else {
            long long v17 = 0;
          }
          id v18 = v17;
          [v15 _loadStateFromPress:v18];

          [v27 addObject:v15];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        uint64_t v8 = v19;
      }
      while (v19);
    }

    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    id v39 = __Block_byref_object_copy__12;
    id v40 = __Block_byref_object_dispose__12;
    id v41 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v33 = __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke_2;
    uint64_t v34 = &unk_1E52DCF80;
    uint64_t v35 = &v36;
    __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke_2((uint64_t)v32, a3);
    v33((uint64_t)v32, v27);
    if ([(id)v37[5] count]) {
      [a4 _cancelComponents:v37[5]];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v20);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v28 + 1) + 8 * v23++) + 16))();
        }
        while (v21 != v23);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v49 count:16];
      }
      while (v21);
    }

    _Block_object_dispose(&v36, 8);
  }
}

void __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "responder", (void)v14);

        if (v9)
        {
          uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          if (!v10)
          {
            uint64_t v11 = objc_opt_new();
            uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
            id v13 = *(void **)(v12 + 40);
            *(void *)(v12 + 40) = v11;

            uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          }
          [v10 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (UIGestureDelayedEventComponentDispatcher)init
{
  v12.receiver = self;
  v12.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
  id v2 = [(UIGestureDelayedEventComponentDispatcher *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    delayedTouches = v2->_delayedTouches;
    v2->_delayedTouches = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    delayedTouchesToSend = v2->_delayedTouchesToSend;
    v2->_delayedTouchesToSend = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    delayedPresses = v2->_delayedPresses;
    v2->_delayedPresses = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    delayedPressesToSend = v2->_delayedPressesToSend;
    v2->_delayedPressesToSend = (NSMutableArray *)v9;
  }
  return v2;
}

uint64_t __62__UIGestureDelayedEventComponentDispatcher_sendDelayedTouches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 timestampForDelivery];
  double v5 = v4;
  [a3 timestampForDelivery];
  if (v6 > v5) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (void)delayedTouchForTouch:(void *)a3 event:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v6 = _UIGestureDelayedTouchForUITouch(a2, a1[1]);
    if (!v6)
    {
      uint64_t v7 = (void *)[a3 _cloneEvent];
      uint64_t v8 = -[UIGestureDelayedTouch initWithEvent:touch:]((id *)[UIGestureDelayedTouch alloc], v7, a2);
      double v6 = v8;
      if (v8) {
        id v9 = v8[4];
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;
      [v10 _loadStateFromTouch:a2];

      [a1[1] addObject:v6];
    }
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", delayedTouchForTouch_event____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v13 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v19.receiver = a1;
        v19.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
        long long v14 = v13;
        long long v15 = objc_msgSendSuper2(&v19, sel_description);
        long long v16 = (objc_class *)objc_opt_class();
        long long v17 = NSStringFromClass(v16);
        id v18 = objc_msgSend(a2, "_phaseDescription", v19.receiver, v19.super_class);
        *(_DWORD *)buf = 138413058;
        uint64_t v21 = v15;
        __int16 v22 = 2112;
        uint64_t v23 = v17;
        __int16 v24 = 2048;
        id v25 = a2;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "%@: Delaying touch <%@: %p; phase = %@>", buf, 0x2Au);
      }
    }
    if (v6) {
      ++v6[1];
    }
    [a2 setIsDelayed:1];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (uint64_t)enqueueDelayedPressToSend:(uint64_t)result
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = (id *)result;
  if (!a2)
  {
    double v5 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= 1) {
    *(void *)(a2 + 8) = --v4;
  }
  if (!v4)
  {
    double v5 = *(void **)(a2 + 24);
LABEL_7:
    id v6 = v5;
    if ([v6 isDelayed])
    {
      if (a2) {
        uint64_t v7 = *(void **)(a2 + 24);
      }
      else {
        uint64_t v7 = 0;
      }
      id v8 = v7;
      id v9 = _UIGestureDelayedTouchForUITouch(v8, v3[4]);

      if (!v9)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", enqueueDelayedPressToSend____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v11 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v23.receiver = v3;
            v23.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
            objc_super v12 = v11;
            id v13 = objc_msgSendSuper2(&v23, sel_description);
            if (a2) {
              long long v14 = *(void **)(a2 + 24);
            }
            else {
              long long v14 = 0;
            }
            id v15 = v14;
            long long v16 = (objc_class *)objc_opt_class();
            long long v17 = NSStringFromClass(v16);
            if (a2)
            {
              id v18 = *(id *)(a2 + 24);
              objc_super v19 = *(void **)(a2 + 32);
              id v20 = v18;
            }
            else
            {
              id v18 = 0;
              id v20 = 0;
              objc_super v19 = 0;
            }
            id v21 = v19;
            __int16 v22 = objc_msgSend(v21, "_phaseDescription", v23.receiver, v23.super_class);
            *(_DWORD *)buf = 138413058;
            id v25 = v13;
            __int16 v26 = 2112;
            uint64_t v27 = v17;
            __int16 v28 = 2048;
            id v29 = v18;
            __int16 v30 = 2112;
            long long v31 = v22;
            _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@: Sending delayed press <%@: %p; phase = %@>",
              buf,
              0x2Au);
          }
        }
        [v3[4] addObject:a2];
      }
    }
    else
    {
    }
    return [v3[3] removeObject:a2];
  }
  return result;
}

- (void)delayedPressForPress:(void *)a3 event:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v6 = _UIGestureDelayedTouchForUITouch(a2, a1[3]);
    if (!v6)
    {
      uint64_t v7 = (void *)[a3 _cloneEvent];
      id v8 = -[UIGestureDelayedPress initWithEvent:press:]((id *)[UIGestureDelayedPress alloc], v7, a2);
      id v6 = v8;
      if (v8) {
        id v9 = v8[4];
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;
      [v10 _loadStateFromPress:a2];

      [a1[3] addObject:v6];
    }
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &delayedPressForPress_event____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      id v13 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v19.receiver = a1;
        v19.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
        long long v14 = v13;
        id v15 = objc_msgSendSuper2(&v19, sel_description);
        long long v16 = (objc_class *)objc_opt_class();
        long long v17 = NSStringFromClass(v16);
        id v18 = objc_msgSend(a2, "_phaseDescription", v19.receiver, v19.super_class);
        *(_DWORD *)buf = 138413058;
        id v21 = v15;
        __int16 v22 = 2112;
        objc_super v23 = v17;
        __int16 v24 = 2048;
        id v25 = a2;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "%@: Delaying press <%@: %p; phase = %@>", buf, 0x2Au);
      }
    }
    if (v6) {
      ++v6[1];
    }
    [a2 setIsDelayed:1];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (uint64_t)removeDelayedPress:(uint64_t)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = (id *)result;
    if (!a2) {
      goto LABEL_6;
    }
    uint64_t v4 = *(void *)(a2 + 8);
    if (v4 >= 1) {
      *(void *)(a2 + 8) = --v4;
    }
    if (!v4)
    {
LABEL_6:
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &removeDelayedPress____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        id v8 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v13.receiver = v3;
          v13.super_class = (Class)UIGestureDelayedEventComponentDispatcher;
          id v9 = v8;
          id v10 = objc_msgSendSuper2(&v13, sel_description);
          if (a2) {
            uint64_t v11 = *(void **)(a2 + 24);
          }
          else {
            uint64_t v11 = 0;
          }
          id v12 = v11;
          *(_DWORD *)buf = 138412546;
          id v15 = v10;
          __int16 v16 = 2112;
          id v17 = v12;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%@: Clearing delay on press %@", buf, 0x16u);
        }
      }
      if (a2) {
        id v6 = *(void **)(a2 + 24);
      }
      else {
        id v6 = 0;
      }
      id v7 = v6;
      [v7 setIsDelayed:0];

      return [v3[3] removeObject:a2];
    }
  }
  return result;
}

- (void)removeDelayedTouchesToSend:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        if (v9) {
          id v10 = *(void **)(v9 + 24);
        }
        else {
          id v10 = 0;
        }
        id v11 = v10;
        objc_msgSend(v11, "setIsDelayed:", 0, (void)v13);
        [v11 _setIsFirstTouchForView:0];
        [(NSMutableArray *)self->_delayedTouchesToSend removeObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v12 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v12;
    }
    while (v12);
  }
}

- (BOOL)pressesBeganWasDelayedForPress:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 24));
  id v4 = (id *)objc_claimAutoreleasedReturnValue();
  if ((v4
     || (_UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 32)),
         (id v4 = (id *)objc_claimAutoreleasedReturnValue()) != 0))
    && [a2 isDelayed])
  {
    id v5 = v4[4];
    BOOL v6 = [v5 phase] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __62__UIGestureDelayedEventComponentDispatcher_sendDelayedPresses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 timestampForDelivery];
  double v5 = v4;
  [a3 timestampForDelivery];
  if (v6 > v5) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (void)removePress:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v4 = _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 32));
    if (v4)
    {
      do
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &removePress____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v7 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            log = v7;
            uint64_t v8 = (objc_class *)objc_opt_class();
            id v10 = NSStringFromClass(v8);
            uint64_t v9 = [a2 _phaseDescription];
            *(_DWORD *)buf = 138412802;
            long long v13 = v10;
            __int16 v14 = 2048;
            long long v15 = a2;
            __int16 v16 = 2112;
            id v17 = v9;
            _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "Cancelling send of press <%@: %p; phase = %@>",
              buf,
              0x20u);
          }
        }
        [*(id *)(a1 + 32) removeObject:v4];
        uint64_t v6 = _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 32));

        double v4 = (void *)v6;
      }
      while (v6);
    }
  }
}

uint64_t __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedTouches_touches_fromEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPhase:*(void *)(a1 + 40)];
}

uint64_t __83__UIGestureDelayedEventComponentDispatcher_cancelDelayedPresses_presses_fromEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPhase:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedPressesToSend, 0);
  objc_storeStrong((id *)&self->_delayedPresses, 0);
  objc_storeStrong((id *)&self->_delayedTouchesToSend, 0);
  objc_storeStrong((id *)&self->_delayedTouches, 0);
}

@end