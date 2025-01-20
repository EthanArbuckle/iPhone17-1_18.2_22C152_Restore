@interface CRBiDiTransform
+ (id)rearrangeNumericRunsInLogicalString:(id)a3 layoutDirection:(unint64_t)a4;
+ (unint64_t)layoutDirectionForVisualString:(id)a3 visualDirectionality:(unint64_t)a4 logicalBaseDirection:(int)a5;
- (CRBiDiTransform)init;
- (id)transformVisualToLogical:(id)a3 visualDirectionality:(unint64_t)a4 logicalBaseDirectionality:(unint64_t)a5 baseDirectionalityPredictionMode:(unint64_t)a6 outTokenizedLogicalOrderIndexes:(id *)a7 outReorderingPermutation:(id *)a8 outMirroredVisualString:(id *)a9 outLogicalBaseDirection:(char *)a10;
- (void)dealloc;
@end

@implementation CRBiDiTransform

+ (id)rearrangeNumericRunsInLogicalString:(id)a3 layoutDirection:(unint64_t)a4
{
  sub_1DD8A7480();
  sub_1DD737AF8();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1DD8A7470();
  swift_bridgeObjectRelease();
  return v4;
}

- (CRBiDiTransform)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRBiDiTransform;
  v2 = [(CRBiDiTransform *)&v6 init];
  if (v2)
  {
    uint64_t v3 = ubidi_open();
    v2->_icuBiDiTransform = (UBiDi *)v3;
    if (!v3)
    {
      v4 = 0;
      goto LABEL_6;
    }
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  v4 = v2;
LABEL_6:

  return v4;
}

- (void)dealloc
{
  if (self->_icuBiDiTransform)
  {
    ubidi_close();
    self->_icuBiDiTransform = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CRBiDiTransform;
  [(CRBiDiTransform *)&v3 dealloc];
}

- (id)transformVisualToLogical:(id)a3 visualDirectionality:(unint64_t)a4 logicalBaseDirectionality:(unint64_t)a5 baseDirectionalityPredictionMode:(unint64_t)a6 outTokenizedLogicalOrderIndexes:(id *)a7 outReorderingPermutation:(id *)a8 outMirroredVisualString:(id *)a9 outLogicalBaseDirection:(char *)a10
{
  v84 = a7;
  v14 = a9;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  v16 = v15;
  unint64_t v82 = a4;
  v83 = a8;
  if (a4 == 2)
  {
    id v17 = [v15 _crStringByReversingComposedCharacterSequences];
    id v18 = v16;
  }
  else
  {
    id v17 = v15;
    id v18 = [v17 _crStringByReversingComposedCharacterSequences];
  }
  v19 = v18;
  uint64_t v20 = [v17 length];
  v88 = v79;
  MEMORY[0x1F4188790](v20);
  v22 = (char *)v79 - v21;
  [v17 getCharacters:(char *)v79 - v21];
  *(_WORD *)&v22[2 * [v17 length]] = 0;
  uint64_t v86 = [v17 length];
  int v94 = 0;
  os_unfair_lock_t p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v23 = 1;
  ubidi_setInverse();
  uint64_t v24 = v86;
  switch(v86)
  {
    case 0:
      ubidi_setReorderingMode();
      ubidi_setPara();
      if (v94 >= 1)
      {
        v25 = CROSLogForCategory(0);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_WORD *)buf = 0;
        v26 = "BiDi Visual->Logical transform failed in ubidi_setPara (base directionality prediction)";
        goto LABEL_23;
      }
      v80 = a9;
      v81 = v16;
      LODWORD(v89) = ubidi_getParaLevel();
      if ([v19 length])
      {
        unint64_t v41 = 0;
        int v42 = 0;
        int v43 = 0;
        do
        {
          unsigned int v44 = [v19 characterAtIndex:v41];
          if ((unsigned __int16)(v44 - 1611) >= 8u)
          {
            if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x9002B000900030, (uint16x4_t)vadd_s16(vdup_n_s16(v44), (int16x4_t)0x19004B0F790F8B0))) & 1) != 0|| (v44 & 0xFF00) == 0x600)
            {
              ++v43;
            }
            else
            {
              int v45 = (unsigned __int16)((v44 & 0xFFDF) - 65) < 0x1Au || v44 - 248 < 0x158;
              if ((unsigned __int16)(v44 - 192) < 0x17u) {
                int v45 = 1;
              }
              if (v44 - 216 < 0x1F) {
                int v45 = 1;
              }
              v42 += v45;
            }
          }
          ++v41;
        }
        while ([v19 length] > v41);
      }
      else
      {
        int v43 = 0;
        int v42 = 0;
      }
      v14 = v80;
      if (a6 < 2 && (v89 & 1) != 0 && (float)((float)v42 / (float)v43) < 0.5) {
        char v23 = 1;
      }
      else {
        char v23 = -1;
      }
      v16 = v81;
      if (a10) {
        goto LABEL_16;
      }
      goto LABEL_17;
    case 1:
      char v23 = 0;
      if (!a10) {
        goto LABEL_17;
      }
      goto LABEL_16;
    case 2:
      goto LABEL_15;
    case 3:
      char v23 = -2;
      if (!a10) {
        goto LABEL_17;
      }
      goto LABEL_16;
    case 4:
      char v23 = -1;
LABEL_15:
      if (a10) {
LABEL_16:
      }
        *a10 = v23;
LABEL_17:
      ubidi_setReorderingMode();
      ubidi_setPara();
      if (v94 >= 1)
      {
        v25 = CROSLogForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v26 = "BiDi Visual->Logical transform failed in ubidi_setPara";
          goto LABEL_23;
        }
        goto LABEL_25;
      }
      uint64_t v29 = [v19 length];
      MEMORY[0x1F4188790](v29);
      v31 = (char *)v79 - v30;
      ubidi_getVisualMap();
      if (v94 >= 1)
      {
        v25 = CROSLogForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v26 = "BiDi Visual->Logical transform failed in ubidi_getVisualMap";
LABEL_23:
          v27 = v25;
          uint32_t v28 = 2;
LABEL_24:
          _os_log_impl(&dword_1DD733000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
        }
LABEL_25:

        os_unfair_lock_unlock(p_lock);
        v32 = 0;
        goto LABEL_26;
      }
      v81 = v16;
      id v85 = [MEMORY[0x1E4F1CA48] array];
      id v89 = [MEMORY[0x1E4F1CA48] array];
      v34 = [MEMORY[0x1E4F1CA70] orderedSet];
      if ([v19 length])
      {
        unint64_t v35 = 0;
        do
        {
          uint64_t v36 = [v19 length] + ~*(_DWORD *)&v31[4 * v35];
          v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "length") + ~*(_DWORD *)&v31[4 * v35]);
          [v89 addObject:v37];

          if ([v19 characterAtIndex:v36] == 32)
          {
            v38 = (void *)[v34 copy];
            [v85 addObject:v38];

            [v34 removeAllObjects];
          }
          else
          {
            v39 = [NSNumber numberWithInteger:v36];
            [v34 addObject:v39];
          }
          ++v35;
        }
        while ([v19 length] > v35);
      }
      if ([v34 count] || !objc_msgSend(v19, "length"))
      {
        v40 = (void *)[v34 mutableCopy];
        [v85 addObject:v40];
      }
      unint64_t v46 = 0x1E4F28000uLL;
      v47 = [MEMORY[0x1E4F28E78] string];
      v48 = [MEMORY[0x1E4F28B88] _crBiDiMirroredCharacterSet];
      uint64_t v49 = [v19 length];
      v16 = v81;
      if (v49)
      {
        uint64_t v50 = 0;
        while (!objc_msgSend(v48, "characterIsMember:", objc_msgSend(v19, "characterAtIndex:", v50)))
        {
          if (++v50 >= (unint64_t)[v19 length]) {
            goto LABEL_58;
          }
        }
        uint64_t v68 = [v17 length];
        v79[1] = v79;
        MEMORY[0x1F4188790](v68);
        v70 = (char *)v79 - v69;
        uint64_t v71 = [v19 length];
        MEMORY[0x1F4188790](v71);
        v73 = (char *)v79 - v72;
        ubidi_writeReordered();
        if (v94 >= 1)
        {
          v74 = CROSLogForCategory(0);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v75 = "BiDi Visual->Logical transform failed in ubidi_writeReordered";
LABEL_93:
            _os_log_impl(&dword_1DD733000, v74, OS_LOG_TYPE_ERROR, v75, buf, 2u);
            goto LABEL_94;
          }
          goto LABEL_94;
        }
        ubidi_getLogicalMap();
        if (v94 > 0)
        {
          v74 = CROSLogForCategory(0);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v75 = "BiDi Visual->Logical transform failed in ubidi_getLogicalMap";
            goto LABEL_93;
          }
LABEL_94:

          os_unfair_lock_unlock(p_lock);
          v32 = 0;
          goto LABEL_95;
        }
        uint64_t v86 = (uint64_t)v48;
        v80 = v14;
        if ([v19 length])
        {
          unint64_t v76 = 0;
          uint64_t v77 = -1;
          do
          {
            *(_WORD *)buf = *(_WORD *)&v70[2 * *(int *)&v73[4 * [v19 length] + 4 * v77]];
            v78 = [NSString stringWithCharacters:buf length:1];
            [v47 appendString:v78];

            ++v76;
            --v77;
          }
          while (v76 < [v19 length]);
        }
        unint64_t v46 = 0x1E4F28000;
      }
      else
      {
LABEL_58:
        uint64_t v86 = (uint64_t)v48;
        v80 = v14;
        [v47 appendString:v19];
      }
      os_unfair_lock_unlock(p_lock);
      v51 = [*(id *)(v46 + 3704) string];
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v52 = v89;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v90 objects:v95 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v54; ++i)
          {
            if (*(void *)v91 != v55) {
              objc_enumerationMutation(v52);
            }
            v57 = objc_msgSend(v47, "substringWithRange:", objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * i), "unsignedIntegerValue"), 1);
            [v51 appendString:v57];
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v90 objects:v95 count:16];
        }
        while (v54);
      }

      if (v82 == 2)
      {
        id v58 = v47;
      }
      else
      {
        if ([v52 count])
        {
          unint64_t v59 = 0;
          do
          {
            v60 = NSNumber;
            uint64_t v61 = [v52 count];
            v62 = [v52 objectAtIndexedSubscript:v59];
            v63 = objc_msgSend(v60, "numberWithUnsignedInteger:", v61 + ~objc_msgSend(v62, "unsignedIntegerValue"));
            [v52 setObject:v63 atIndexedSubscript:v59];

            ++v59;
          }
          while (v59 < [v52 count]);
        }
        id v58 = [v47 _crStringByReversingComposedCharacterSequences];
      }
      v64 = v58;
      v65 = v84;
      v66 = v83;
      if (v83) {
        id *v66 = v52;
      }
      if (v65) {
        id *v65 = (id)[v85 copy];
      }
      v67 = v80;
      if (v80) {
        id *v67 = (id)[v64 copy];
      }
      v32 = (void *)[v51 copy];

      v16 = v81;
      v48 = (void *)v86;
LABEL_95:

LABEL_26:
      return v32;
    default:
      v25 = CROSLogForCategory(0);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v97 = v24;
      v26 = "BiDi Visual->Logical unsupported base direction: %ld";
      v27 = v25;
      uint32_t v28 = 12;
      goto LABEL_24;
  }
}

+ (unint64_t)layoutDirectionForVisualString:(id)a3 visualDirectionality:(unint64_t)a4 logicalBaseDirection:(int)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  switch(a5)
  {
    case 0:
      unint64_t v9 = 1;
      goto LABEL_14;
    case 255:
      if (a4 == 1)
      {
        v12 = [v7 _crStringByReversingExtendedGraphemeClusters];
        if ([v12 _isNaturallyRTL]) {
          unint64_t v9 = 2;
        }
        else {
          unint64_t v9 = 1;
        }

        goto LABEL_14;
      }
      if (a4 == 2)
      {
        if ([v7 _isNaturallyRTL]) {
          unint64_t v9 = 2;
        }
        else {
          unint64_t v9 = 1;
        }
        goto LABEL_14;
      }
      break;
    case 1:
      unint64_t v9 = 2;
      goto LABEL_14;
  }
  v10 = CROSLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = a5;
    _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_FAULT, "Unsupported base direction %lu for layout direction determination.", (uint8_t *)&v13, 0xCu);
  }

  unint64_t v9 = 0;
LABEL_14:

  return v9;
}

@end