@interface TILiveConversionSegments
- (BOOL)canMove:(BOOL)a3;
- (BOOL)didAccept;
- (NSArray)segmentRanges;
- (NSMutableArray)rawSegments;
- (NSString)autoCommitString;
- (NSString)inputString;
- (NSString)rawInputString;
- (TIKeyboardCandidate)currentCandidate;
- (TILiveConversionSegments)initWithSegments:(id)a3 at:(unint64_t)a4;
- (TIMecabraSegment)currentSegment;
- (unint64_t)index;
- (unsigned)inputIndex;
- (void)buildMarkedText;
- (void)clear;
- (void)commit;
- (void)didUpdateCandidate:(id)a3 with:(id)a4;
- (void)move:(BOOL)a3;
- (void)setAutoCommitString:(id)a3;
- (void)setCurrentCandidate:(id)a3;
- (void)setCurrentSegment:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setInputIndex:(unsigned int)a3;
- (void)setInputString:(id)a3;
- (void)setPhraseBoundary:(unint64_t)a3;
- (void)setRawInputString:(id)a3;
- (void)setRawSegments:(id)a3;
- (void)setSegmentRanges:(id)a3;
@end

@implementation TILiveConversionSegments

- (TILiveConversionSegments)initWithSegments:(id)a3 at:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TILiveConversionSegments;
  v7 = [(TILiveConversionSegments *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 mutableCopy];
    rawSegments = v7->_rawSegments;
    v7->_rawSegments = (NSMutableArray *)v8;

    v7->_index = a4;
    [(TILiveConversionSegments *)v7 buildMarkedText];
  }

  return v7;
}

- (void)clear
{
  v3 = [MEMORY[0x263EFF980] array];
  rawSegments = self->_rawSegments;
  self->_rawSegments = v3;

  self->_index = 0x7FFFFFFFFFFFFFFFLL;
  [(TILiveConversionSegments *)self buildMarkedText];
}

- (void)commit
{
  uint64_t v3 = [(TILiveConversionSegments *)self currentCandidate];
  if (v3)
  {
    v4 = (void *)v3;
    unint64_t v5 = [(TILiveConversionSegments *)self index];
    unint64_t v6 = [(NSMutableArray *)self->_rawSegments count];

    if (v5 < v6)
    {
      id v14 = objc_alloc_init(MEMORY[0x263F7EB10]);
      v7 = [(TILiveConversionSegments *)self currentCandidate];
      uint64_t v8 = [v7 label];
      [v14 setSurface:v8];

      v9 = [(TILiveConversionSegments *)self currentCandidate];
      v10 = [v9 input];
      [v14 setReading:v10];

      [(NSMutableArray *)self->_rawSegments replaceObjectAtIndex:[(TILiveConversionSegments *)self index] withObject:v14];
      objc_super v11 = [(TILiveConversionSegments *)self currentSegment];

      if (v11)
      {
        rawSegments = self->_rawSegments;
        v13 = [(TILiveConversionSegments *)self currentSegment];
        [(NSMutableArray *)rawSegments insertObject:v13 atIndex:[(TILiveConversionSegments *)self index] + 1];
      }
      [(TILiveConversionSegments *)self setCurrentCandidate:0];
      [(TILiveConversionSegments *)self setCurrentSegment:0];
      [(TILiveConversionSegments *)self buildMarkedText];
    }
  }
}

- (BOOL)canMove:(BOOL)a3
{
  if (!a3) {
    return [(TILiveConversionSegments *)self index] != 0;
  }
  v4 = [(TILiveConversionSegments *)self currentSegment];

  unint64_t v5 = [(TILiveConversionSegments *)self index];
  unint64_t v6 = [(TILiveConversionSegments *)self rawSegments];
  unint64_t v7 = [v6 count];
  if (v4) {
    BOOL v8 = v5 >= v7;
  }
  else {
    BOOL v8 = v5 >= v7 - 1;
  }
  BOOL v9 = !v8;

  return v9;
}

- (void)move:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(TILiveConversionSegments *)self index];
  unint64_t v6 = v5 - 1;
  if (v3) {
    unint64_t v6 = v5 + 1;
  }
  self->_index = v6;
  [(TILiveConversionSegments *)self buildMarkedText];
}

- (void)didUpdateCandidate:(id)a3 with:(id)a4
{
  id v6 = a4;
  [(TILiveConversionSegments *)self setCurrentCandidate:a3];
  [(TILiveConversionSegments *)self setCurrentSegment:v6];

  [(TILiveConversionSegments *)self buildMarkedText];
}

- (BOOL)didAccept
{
  BOOL v3 = [(TILiveConversionSegments *)self rawSegments];
  objc_msgSend(v3, "removeObjectsInRange:", 0, -[TILiveConversionSegments index](self, "index") + 1);

  v4 = [(TILiveConversionSegments *)self currentSegment];

  if (v4)
  {
    unint64_t v5 = [(TILiveConversionSegments *)self rawSegments];
    id v6 = [(TILiveConversionSegments *)self currentSegment];
    [v5 insertObject:v6 atIndex:0];
  }
  [(TILiveConversionSegments *)self setCurrentCandidate:0];
  [(TILiveConversionSegments *)self setCurrentSegment:0];
  unint64_t v7 = [(TILiveConversionSegments *)self rawSegments];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [(TILiveConversionSegments *)self setIndex:0];
    [(TILiveConversionSegments *)self buildMarkedText];
  }
  return v8 != 0;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  unint64_t v5 = [(TILiveConversionSegments *)self rawSegments];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__TILiveConversionSegments_setPhraseBoundary___block_invoke;
  v6[3] = &unk_2650FA8C0;
  v6[5] = v7;
  v6[6] = a3;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];

  [(TILiveConversionSegments *)self buildMarkedText];
  _Block_object_dispose(v7, 8);
}

void __46__TILiveConversionSegments_setPhraseBoundary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = [a2 surface];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v7 length];

  if (*(void *)(a1 + 48) <= *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) setIndex:a3];
    *a4 = 1;
  }
}

- (void)buildMarkedText
{
  id v51 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v50 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = [MEMORY[0x263EFF980] array];
  unint64_t v5 = [(TILiveConversionSegments *)self rawSegments];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    unsigned int v52 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = 0x263F08000uLL;
    while (1)
    {
      v10 = [(TILiveConversionSegments *)self rawSegments];
      objc_super v11 = [v10 objectAtIndexedSubscript:v7];

      if (v7 == [(TILiveConversionSegments *)self index]
        && ([(TILiveConversionSegments *)self currentCandidate],
            v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        v13 = [(TILiveConversionSegments *)self currentCandidate];
        [v13 input];
        id v14 = v4;
        v15 = v3;
        v17 = unint64_t v16 = v9;
        [v51 appendString:v17];

        v18 = [(TILiveConversionSegments *)self currentCandidate];
        v19 = [v18 label];
        [v15 appendString:v19];

        v20 = [(TILiveConversionSegments *)self currentCandidate];
        v21 = [v20 label];
        v52 += [v21 length];

        v22 = [(TILiveConversionSegments *)self currentCandidate];
        v23 = [v22 label];
        uint64_t v24 = [v23 length];

        unint64_t v9 = v16;
        v25 = objc_msgSend(*(id *)(v16 + 3392), "valueWithRange:", v8, v24);
        [v14 addObject:v25];

        v26 = [(TILiveConversionSegments *)self currentCandidate];
        v27 = [v26 label];
        v8 += [v27 length];

        v28 = [(TILiveConversionSegments *)self currentSegment];

        if (!v28)
        {
          id v3 = v15;
          v4 = v14;
          goto LABEL_13;
        }
        v29 = [(TILiveConversionSegments *)self currentSegment];
        v30 = [v29 reading];
        [v51 appendString:v30];

        v31 = [(TILiveConversionSegments *)self currentSegment];
        v32 = [v31 surface];
        [v15 appendString:v32];

        v33 = [(TILiveConversionSegments *)self currentSegment];
        v34 = [v33 surface];
        uint64_t v35 = [v34 length];

        uint64_t v36 = v35;
        unint64_t v9 = v16;
        v37 = objc_msgSend(*(id *)(v16 + 3392), "valueWithRange:", v8, v36);
        [v14 addObject:v37];

        v38 = [(TILiveConversionSegments *)self currentSegment];
        v39 = [v38 surface];
        v8 += [v39 length];

        id v3 = v15;
        v4 = v14;
      }
      else
      {
        v40 = [v11 reading];
        [v51 appendString:v40];

        v41 = [v11 surface];
        [v3 appendString:v41];

        if ([(TILiveConversionSegments *)self index] >= v7)
        {
          v42 = [v11 surface];
          v52 += [v42 length];
        }
        if ([(TILiveConversionSegments *)self index] > v7)
        {
          v43 = [v11 surface];
          [v50 appendString:v43];
        }
        v44 = [v11 surface];
        uint64_t v45 = [v44 length];

        v46 = objc_msgSend(*(id *)(v9 + 3392), "valueWithRange:", v8, v45);
        [v4 addObject:v46];

        v38 = [v11 surface];
        v8 += [v38 length];
      }

LABEL_13:
      ++v7;
      v47 = [(TILiveConversionSegments *)self rawSegments];
      unint64_t v48 = [v47 count];

      if (v48 <= v7) {
        goto LABEL_17;
      }
    }
  }
  unsigned int v52 = 0;
LABEL_17:
  [(TILiveConversionSegments *)self setRawInputString:v51];
  [(TILiveConversionSegments *)self setInputString:v3];
  [(TILiveConversionSegments *)self setInputIndex:v52];
  [(TILiveConversionSegments *)self setAutoCommitString:v50];
  v49 = (void *)[v4 copy];
  [(TILiveConversionSegments *)self setSegmentRanges:v49];
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unsigned)inputIndex
{
  return self->_inputIndex;
}

- (void)setInputIndex:(unsigned int)a3
{
  self->_inputIndex = a3;
}

- (NSString)rawInputString
{
  return self->_rawInputString;
}

- (void)setRawInputString:(id)a3
{
}

- (NSString)inputString
{
  return self->_inputString;
}

- (void)setInputString:(id)a3
{
}

- (NSString)autoCommitString
{
  return self->_autoCommitString;
}

- (void)setAutoCommitString:(id)a3
{
}

- (NSArray)segmentRanges
{
  return self->_segmentRanges;
}

- (void)setSegmentRanges:(id)a3
{
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setCurrentCandidate:(id)a3
{
}

- (TIMecabraSegment)currentSegment
{
  return self->_currentSegment;
}

- (void)setCurrentSegment:(id)a3
{
}

- (NSMutableArray)rawSegments
{
  return self->_rawSegments;
}

- (void)setRawSegments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSegments, 0);
  objc_storeStrong((id *)&self->_currentSegment, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_segmentRanges, 0);
  objc_storeStrong((id *)&self->_autoCommitString, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_rawInputString, 0);
}

@end