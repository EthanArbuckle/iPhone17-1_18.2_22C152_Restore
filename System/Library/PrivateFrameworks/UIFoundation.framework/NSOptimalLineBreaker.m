@interface NSOptimalLineBreaker
@end

@implementation NSOptimalLineBreaker

uint64_t __59___NSOptimalLineBreaker__bestNodeInNodeList_withLineCount___block_invoke(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t result = -[_NSOptimalLineBreaker _node:isBetterThanNode:](a1[4], a3, *(uint64_t **)(*(void *)(a1[5] + 8) + 24));
  if (result)
  {
    uint64_t v6 = a1[6];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 == a3[2]) {
      *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    }
  }
  return result;
}

void __45___NSOptimalLineBreaker__calculateLineBreaks__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, __int16 a4)
{
}

uint64_t __62___NSOptimalLineBreaker__enumerateNonBreakingSpacesWithBlock___block_invoke()
{
  _enumerateNonBreakingSpacesWithBlock__nbspCharacterSet = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 160, 1);

  return MEMORY[0x1F41817F8]();
}

uint64_t __45___NSOptimalLineBreaker__calculateLineBreaks__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    uint64_t result = -1;
  }
  else {
    uint64_t result = *a3 < *a2;
  }
  if (!result)
  {
    unint64_t v4 = a2[1] + *a2;
    unint64_t v5 = a3[1] + *a3;
    if (v4 < v5) {
      return -1;
    }
    else {
      return v5 < v4;
    }
  }
  return result;
}

void __55___NSOptimalLineBreaker__shouldAvoidBreakingAfterWord___block_invoke()
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v1 = [&unk_1EDD68BE8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v24 != v3) {
          objc_enumerationMutation(&unk_1EDD68BE8);
        }
        uint64_t v5 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
        v7 = [&unk_1EDD68BE8 objectForKeyedSubscript:v5];
        v8 = [v7 componentsSeparatedByString:@" "];
        v9 = [v6 setWithArray:v8];

        [v0 setObject:v9 forKeyedSubscript:v5];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              unint64_t v15 = _shouldAvoidBreakingAfterWord__maxShortWordLength;
              unint64_t v16 = [*(id *)(*((void *)&v19 + 1) + 8 * j) length];
              if (v15 <= v16) {
                uint64_t v17 = v16;
              }
              else {
                uint64_t v17 = v15;
              }
              _shouldAvoidBreakingAfterWord__maxShortWordLength = v17;
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v12);
        }
      }
      uint64_t v2 = [&unk_1EDD68BE8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v2);
  }
  v18 = (void *)_shouldAvoidBreakingAfterWord__wordSets;
  _shouldAvoidBreakingAfterWord__wordSets = (uint64_t)v0;
}

uint64_t __63___NSOptimalLineBreaker__enumerateOrdinaryLineBreaksWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v7 + 32) = a3;
  *(void *)(v7 + 40) = a4;
  *a7 = 1;
  return result;
}

uint64_t __63___NSOptimalLineBreaker__enumerateOrdinaryLineBreaksWithBlock___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v7 + 32) = a3;
  *(void *)(v7 + 40) = a4;
  *a7 = 1;
  return result;
}

void __45___NSOptimalLineBreaker__calculateLineBreaks__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void __45___NSOptimalLineBreaker__calculateLineBreaks__block_invoke_3(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a3) {
    __int16 v4 = 138;
  }
  else {
    __int16 v4 = 10;
  }
  [(_NSOptimalLineBreaker *)v3 _addLineBreakWithRange:0 flags:v4];
}

uint64_t __65___NSOptimalLineBreaker__equivalenceClassForNode_asTerminalNode___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) ^= a2
                                                                   + (*(void *)(*(void *)(*(void *)(result + 32)
                                                                                            + 8)
                                                                                + 24) << 6)
                                                                   + (*(void *)(*(void *)(*(void *)(result + 32)
                                                                                            + 8)
                                                                                + 24) >> 2)
                                                                   - 0x61C8864680B583EALL;
  return result;
}

BOOL __50___NSOptimalLineBreaker__calculateOptimalWrapping__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(_WORD *)(a2 + 48) & 0x82) != 2;
}

uint64_t __70___NSOptimalLineBreaker__calculateOptimalWrappingWithLineBreakFilter___block_invoke(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (-[_NSOptimalLineBreaker _bestNode:dominatesNode:](a1[4], *(void *)(*(void *)(a1[6] + 8) + 24), a3))
  {
    if (*(void *)(*(void *)(a1[6] + 8) + 24) == a3) {
      __70___NSOptimalLineBreaker__calculateOptimalWrappingWithLineBreakFilter___block_invoke_cold_1();
    }
    uint64_t v5 = *(void **)(a1[4] + 184);
    return [v5 releaseNode:a3];
  }
  else
  {
    uint64_t v7 = (void *)a1[5];
    return [v7 appendValue:a3];
  }
}

void __70___NSOptimalLineBreaker__calculateOptimalWrappingWithLineBreakFilter___block_invoke_cold_1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]_block_invoke", "NSOptimalLineBreaker.m", 2404, "node != bestNewNode");
}

@end