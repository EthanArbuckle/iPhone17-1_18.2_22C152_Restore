@interface NSTextSelectionLineFragmentInfo
@end

@implementation NSTextSelectionLineFragmentInfo

uint64_t __55____NSTextSelectionLineFragmentInfo__fetchCaretOffsets__block_invoke(uint64_t result, uint64_t a2, int a3, unsigned char *a4, double a5)
{
  uint64_t v6 = *(void *)(*(void *)(result + 56) + 8);
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(result + 32);
  if (v7 > *(void *)(v8 + 24)) {
    goto LABEL_2;
  }
  uint64_t v12 = result;
  uint64_t v13 = v7 - 1;
  if (v7 < 1)
  {
    BOOL v19 = 1;
  }
  else
  {
    uint64_t v14 = *(void *)(v8 + 48);
    uint64_t v15 = v14 + 32 * v13;
    double v16 = *(double *)v15;
    double v17 = vabdd_f64(*(double *)v15, a5);
    int v18 = *(unsigned __int8 *)(v15 + 24);
    if (v17 >= 0.001)
    {
      if (!v18)
      {
        uint64_t v21 = v14 + 32 * v13;
        if ((unint64_t)v7 >= 2 && *(void *)(v21 + 16) == 0)
        {
          v23 = *(void **)(v21 + 8);
          uint64_t v24 = 32 * v7;
          while (vabdd_f64(v16, *(double *)(v14 - 64 + v24)) < 0.001)
          {
            --v13;
            v24 -= 32;
            if (v13 <= 0) {
              goto LABEL_27;
            }
          }
          BOOL v19 = 1;
          while (1)
          {
            uint64_t v25 = *(void *)(*(void *)(v12 + 32) + 48) + v24;
            if (*(unsigned char *)(v25 - 40))
            {
              result = [v23 isEqual:*(void *)(v25 - 56)];
              if (result) {
                break;
              }
            }
            --v13;
            v24 -= 32;
            if (v13 <= 0) {
              goto LABEL_28;
            }
          }
          --*(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24);
        }
      }
LABEL_27:
      BOOL v19 = 1;
    }
    else
    {
      BOOL v19 = v18 != a3;
      BOOL v20 = v18 != a3 && a3 == 0;
      if (!v20) {
        *(void *)(v6 + 24) = v13;
      }
    }
LABEL_28:
    uint64_t v26 = *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24);
    if (v26 >= 1)
    {
      uint64_t v27 = v26 - 1;
      BOOL v20 = v27 == 0;
      uint64_t v28 = *(void *)(*(void *)(v12 + 32) + 48) + 32 * v27;
      BOOL v29 = !v20 && *(void *)(v28 + 16) == 0;
      if (v29 && a3 != 0)
      {
        result = [*(id *)(v28 + 8) isEqual:a2];
        if (result)
        {
          uint64_t v31 = *(void *)(*(void *)(v12 + 56) + 8);
          uint64_t v32 = *(void *)(v31 + 24) - 1;
LABEL_38:
          *(void *)(v31 + 24) = v32;
          goto LABEL_45;
        }
        uint64_t v33 = *(void *)(*(void *)(v12 + 32) + 48);
        uint64_t v31 = *(void *)(*(void *)(v12 + 56) + 8);
        uint64_t v34 = *(void *)(v31 + 24);
        uint64_t v32 = v34 - 1;
        BOOL v35 = v34 >= 2 && *(unsigned char *)(v33 + 32 * (v34 - 1) + 24) == 0;
        if (v35 && vabdd_f64(*(double *)(v33 + 32 * v34 - 64), *(double *)(v33 + 32 * v32)) < 0.001) {
          goto LABEL_38;
        }
      }
    }
  }
LABEL_45:
  if (!a2 || *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24) >= *(void *)(*(void *)(v12 + 32) + 24))
  {
LABEL_2:
    *a4 = 1;
    return result;
  }
  uint64_t v36 = [*(id *)(v12 + 40) member:a2];
  uint64_t v37 = v36;
  if (!v36)
  {
    [*(id *)(v12 + 40) addObject:a2];
    uint64_t v37 = a2;
  }
  int v38 = (v36 == 0) ^ a3;
  if (v19)
  {
    uint64_t v39 = 0;
  }
  else
  {
    int v40 = *(unsigned __int8 *)(v12 + 88);
    BOOL v41 = v40 == v38;
    BOOL v42 = v40 != v38;
    uint64_t v43 = *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24);
    uint64_t v44 = *(void *)(*(void *)(v12 + 32) + 48) + 32 * v43;
    uint64_t v45 = *(void *)(v44 + 8);
    if (v41) {
      uint64_t v46 = v37;
    }
    else {
      uint64_t v46 = *(void *)(v44 + 8);
    }
    LOBYTE(v38) = v38 ^ v42;
    if (v41) {
      uint64_t v39 = v45;
    }
    else {
      uint64_t v39 = v37;
    }
    if ((a3 & 1) == 0)
    {
      uint64_t v47 = *(void *)(*(void *)(v12 + 64) + 8);
      if (*(void *)(v47 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
        *(void *)(v47 + 24) = v43;
      }
    }
    uint64_t v37 = v46;
  }
  *(double *)(*(void *)(*(void *)(v12 + 32) + 48)
            + 32 * *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24)) = a5;
  *(void *)(*(void *)(*(void *)(v12 + 32) + 48)
            + 32 * *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24)
            + 8) = v37;
  *(void *)(*(void *)(*(void *)(v12 + 32) + 48)
            + 32 * *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24)
            + 16) = v39;
  *(unsigned char *)(*(void *)(*(void *)(v12 + 32) + 48)
           + 32 * *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24)
           + 24) = a3;
  *(unsigned char *)(*(void *)(*(void *)(v12 + 32) + 48)
           + 32 * *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24)
           + 25) = v38;
  if (!a3)
  {
    v48 = *(void **)(*(void *)(*(void *)(v12 + 72) + 8) + 40);
    if (!v48)
    {
      *(void *)(*(void *)(*(void *)(v12 + 72) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v48 = *(void **)(*(void *)(*(void *)(v12 + 72) + 8) + 40);
    }
    result = [v48 addObject:v37];
    if (!v39) {
      goto LABEL_70;
    }
    goto LABEL_67;
  }
  result = objc_msgSend(*(id *)(v12 + 48), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24)), v37);
  if (v39)
  {
LABEL_67:
    v49 = *(void **)(*(void *)(*(void *)(v12 + 80) + 8) + 40);
    if (!v49)
    {
      *(void *)(*(void *)(*(void *)(v12 + 80) + 8) + 40) = (id)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v49 = *(void **)(*(void *)(*(void *)(v12 + 80) + 8) + 40);
    }
    result = objc_msgSend(v49, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24)), v39);
  }
LABEL_70:
  ++*(void *)(*(void *)(*(void *)(v12 + 56) + 8) + 24);
  return result;
}

uint64_t __69____NSTextSelectionLineFragmentInfo__sortedLocationIndexForLocation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", a2, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_30_0);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_cold_1();
  }
  for (unint64_t i = v4;
        i < [*(id *)(a1 + 32) count]
     && !objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i), "compare:", a2);
  if (i >= [*(id *)(a1 + 32) count]) {
    __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_cold_2();
  }
  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 objectAtIndexedSubscript:i];
}

uint64_t __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __86____NSTextSelectionLineFragmentInfo_rangesBetweenStartingOffset_endOffset_continuous___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  if (!objc_msgSend(a2, "isEqual:") || a4)
  {
    uint64_t v8 = [a2 compare:a3];
    if (v8 == 1) {
      v9 = a3;
    }
    else {
      v9 = a2;
    }
    if (v8 == 1) {
      a3 = a2;
    }
    v10 = [[NSTextRange alloc] initWithLocation:v9 endLocation:a3];
    [*(id *)(a1 + 32) addObject:v10];
  }
}

uint64_t __84____NSTextSelectionLineFragmentInfo_caretIndexForEdgeLocationInTextRanges_leftEdge___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
    uint64_t v3 = *(void *)(v2 + 24);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL || *(unsigned char *)(result + 40) == v3 > a2) {
      *(void *)(v2 + 24) = a2;
    }
  }
  return result;
}

void __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_cold_1()
{
  __assert_rtn("-[__NSTextSelectionLineFragmentInfo _resolveTrailingEdges]_block_invoke", "NSTextSelectionNavigation.m", 349, "index != NSNotFound");
}

void __58____NSTextSelectionLineFragmentInfo__resolveTrailingEdges__block_invoke_cold_2()
{
}

@end