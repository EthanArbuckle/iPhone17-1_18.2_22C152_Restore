@interface PXStoryConcreteTimelineParser
- (BOOL)isAtEnd;
- (NSIndexSet)allowedTransitionKinds;
- (PXStoryConcreteSubtimelineScanner)scanner;
- (PXStoryConcreteTimelineParser)init;
- (PXStoryConcreteTimelineParser)initWithConfiguration:(id)a3;
- (PXStoryResourcesDataSource)resourcesDataSource;
- (char)fallbackTransitionKind;
- (double)parseTimeLimit;
- (id)parseNextBestTimeline;
- (int64_t)parseCountLimit;
- (int64_t)preferredInitialDisplayAssetResourceIndex;
- (void)_adjustTimeline:(id)a3 andAppendTimeline:(id)a4;
- (void)setParseCountLimit:(int64_t)a3;
- (void)setParseTimeLimit:(double)a3;
- (void)setPreferredInitialDisplayAssetResourceIndex:(int64_t)a3;
@end

@implementation PXStoryConcreteTimelineParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTransitionKinds, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_randomNumberGenerator, 0);
  objc_storeStrong((id *)&self->_candidateAccumulatedTimelineWithNextBestTimeline, 0);
  objc_storeStrong((id *)&self->_nextBestTimeline, 0);
  objc_storeStrong((id *)&self->_accumulatedBestTimeline, 0);
}

- (char)fallbackTransitionKind
{
  return self->_fallbackTransitionKind;
}

- (NSIndexSet)allowedTransitionKinds
{
  return self->_allowedTransitionKinds;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (PXStoryConcreteSubtimelineScanner)scanner
{
  return self->_scanner;
}

- (void)setParseCountLimit:(int64_t)a3
{
  self->_parseCountLimit = a3;
}

- (int64_t)parseCountLimit
{
  return self->_parseCountLimit;
}

- (void)setParseTimeLimit:(double)a3
{
  self->_parseTimeLimit = a3;
}

- (double)parseTimeLimit
{
  return self->_parseTimeLimit;
}

- (void)setPreferredInitialDisplayAssetResourceIndex:(int64_t)a3
{
  self->_preferredInitialDisplayAssetResourceIndex = a3;
}

- (int64_t)preferredInitialDisplayAssetResourceIndex
{
  return self->_preferredInitialDisplayAssetResourceIndex;
}

- (void)_adjustTimeline:(id)a3 andAppendTimeline:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 numberOfSegments] >= 1 && objc_msgSend(v7, "numberOfSegments") >= 1)
  {
    v8 = [MEMORY[0x1E4F8CDA8] standardConfiguration];
    [(PXStoryMutableConcreteTimeline *)self->_candidateAccumulatedTimelineWithNextBestTimeline setTimeline:v6];
    int64_t v9 = [(PXStoryBaseTimeline *)self->_candidateAccumulatedTimelineWithNextBestTimeline lastSegmentIdentifier];
    [(PXStoryMutableConcreteTimeline *)self->_candidateAccumulatedTimelineWithNextBestTimeline appendTimeline:v7];
    int64_t v10 = -[PXStoryConcreteTimeline identifierForSegmentAtIndex:](self->_candidateAccumulatedTimelineWithNextBestTimeline, "identifierForSegmentAtIndex:", [v6 numberOfSegments]);
    uint64_t v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    candidateAccumulatedTimelineWithNextBestTimeline = self->_candidateAccumulatedTimelineWithNextBestTimeline;
    if (candidateAccumulatedTimelineWithNextBestTimeline)
    {
      [(PXStoryConcreteTimeline *)candidateAccumulatedTimelineWithNextBestTimeline infoForSegmentWithIdentifier:v9];
      char v12 = v26;
    }
    else
    {
      char v12 = 0;
    }
    v13 = [(PXStoryConcreteTimelineParser *)self allowedTransitionKinds];
    if ([v13 count] && !objc_msgSend(v13, "containsIndex:", v12)
      || !+[PXStoryTransitionProducer isSupportedTransitionWithKind:v12 fromSegmentIdentifier:v9 toSegmentIdentifier:v10 inTimeline:self->_candidateAccumulatedTimelineWithNextBestTimeline])
    {
      uint64_t v14 = [v6 numberOfSegments] - 1;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __67__PXStoryConcreteTimelineParser__adjustTimeline_andAppendTimeline___block_invoke;
      v18 = &unk_1E5DC1C70;
      v19 = self;
      id v20 = v13;
      id v21 = v8;
      char v22 = v12;
      [v6 modifyInfoForSegmentAtIndex:v14 usingBlock:&v15];
    }
  }
  objc_msgSend(v6, "appendTimeline:", v7, v15, v16, v17, v18, v19);
}

double __67__PXStoryConcreteTimelineParser__adjustTimeline_andAppendTimeline___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (CMTime *)(a2 + 112);
  CMTime v13 = *(CMTime *)(a2 + 112);
  int v5 = [*(id *)(a1 + 32) fallbackTransitionKind];
  if (([*(id *)(a1 + 40) containsIndex:v5] & 1) == 0) {
    LOBYTE(v5) = objc_msgSend(*(id *)(a1 + 40), "px_indexAtPosition:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "nextUnsignedIntegerLessThan:", objc_msgSend(*(id *)(a1 + 40), "count")));
  }
  uint64_t v6 = ((char)v5 - 1);
  if (v6 < 8) {
    uint64_t v7 = v6 + 1;
  }
  else {
    uint64_t v7 = 0;
  }
  [*(id *)(a1 + 48) durationForTransitionKind:v7 songPace:2];
  CMTimeMakeWithSeconds(&lhs, v8, 600);
  *(CMTime *)(a2 + 52) = lhs;
  *(unsigned char *)(a2 + 48) = v5;
  *(unsigned char *)(a2 + 76) = *(unsigned char *)(a1 + 56);
  *(_OWORD *)&v10.value = *(_OWORD *)(a2 + 136);
  v10.epoch = *(void *)(a2 + 152);
  CMTime lhs = v13;
  CMTime rhs = *(CMTime *)(a2 + 52);
  CMTimeAdd(&v11, &lhs, &rhs);
  CMTime lhs = v11;
  CMTime rhs = v10;
  CMTimeMinimum(&v12, &lhs, &rhs);
  double result = *(double *)&v12.value;
  CMTime *v4 = v12;
  return result;
}

- (BOOL)isAtEnd
{
  v2 = [(PXStoryConcreteTimelineParser *)self scanner];
  char v3 = [v2 isAtEnd];

  return v3;
}

- (id)parseNextBestTimeline
{
  char v3 = [(PXStoryConcreteTimelineParser *)self scanner];
  [(PXStoryConcreteTimelineParser *)self parseTimeLimit];
  double v5 = v4;
  if (v4 <= 0.0) {
    [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  else {
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v4];
  }
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  uint64_t v9 = [(PXStoryConcreteTimelineParser *)self parseCountLimit];
  uint64_t v10 = v9;
  if (v9 >= 1) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v12 = [(PXStoryConcreteTimelineParser *)self preferredInitialDisplayAssetResourceIndex];
  CMTime v13 = 0;
  if (v10 > 0 || v5 > 0.0)
  {
    uint64_t v15 = v12;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v35 = v12 - 1;
      if (v12 >= 1)
      {
        if ([v3 isAtBeginning] && (objc_msgSend(v3, "isAtEnd") & 1) == 0)
        {
          long long v50 = 0u;
          long long v51 = 0u;
          *(_OWORD *)buf = 0u;
          if (v3) {
            [v3 scanState];
          }
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke;
          aBlock[3] = &unk_1E5DC1C28;
          id v33 = v3;
          id v46 = v33;
          v47 = self;
          SEL v48 = a2;
          uint64_t v16 = (void (**)(void *, void))_Block_copy(aBlock);
          v16[2](v16, v15);
          char v17 = 1;
          do
          {
            char v18 = v17;
            accumulatedBestTimeline = self->_accumulatedBestTimeline;
            id v20 = [(PXStoryConcreteTimelineParser *)self resourcesDataSource];
            id v21 = [(PXStoryConcreteTimeline *)accumulatedBestTimeline indexesOfResourcesWithKind:1 inResourcesDataSource:v20 forClipsInSegmentWithIdentifier:[(PXStoryBaseTimeline *)self->_accumulatedBestTimeline lastSegmentIdentifier]];
            uint64_t v22 = [v21 lastIndex];

            if (v22 == v35) {
              break;
            }
            v16[2](v16, 1);
            char v17 = 0;
          }
          while ((v18 & 1) != 0);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_3;
          v39[3] = &unk_1E5DCA648;
          id v23 = v33;
          long long v42 = *(_OWORD *)buf;
          long long v43 = v50;
          long long v44 = v51;
          id v40 = v23;
          v41 = self;
          CMTime v13 = (void (**)(void))_Block_copy(v39);
        }
        else
        {
          CMTime v13 = 0;
        }
      }
    }
  }
  uint64_t v24 = 1;
  do
  {
    if ([v3 isAtEnd]) {
      break;
    }
    long long v25 = self->_accumulatedBestTimeline;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_4;
    v38[3] = &unk_1E5DC1C00;
    v38[4] = self;
    if (([v3 scanBestSubtimelineFollowingTimeline:v25 loggingOptions:0 resultHandler:v38] & 1) == 0)
    {
      long long v31 = PLStoryGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_ERROR, "failed to scan next subtimeline", buf, 2u);
      }

      [v3 scanBestSubtimelineFollowingTimeline:self->_accumulatedBestTimeline loggingOptions:1 resultHandler:&__block_literal_global_172341];
      long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:self file:@"PXStoryConcreteTimelineParser.m" lineNumber:112 description:@"couldn't scan next subtimeline"];

      abort();
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  }
  while (v26 < v8 && v24++ < v11);
  if ([v3 isAtEnd])
  {
    nextBestTimeline = self->_accumulatedBestTimeline;
  }
  else
  {
    [(PXStoryMutableConcreteTimeline *)self->_nextBestTimeline setTimeline:self->_accumulatedBestTimeline];
    long long v50 = 0u;
    long long v51 = 0u;
    *(_OWORD *)buf = 0u;
    if (v3) {
      [v3 scanState];
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_2_19;
    v37[3] = &unk_1E5DC1C00;
    v37[4] = self;
    [v3 scanFastestSubtimelineWithRemainingClipsResultHandler:v37];
    v36[0] = *(_OWORD *)buf;
    v36[1] = v50;
    v36[2] = v51;
    [v3 setScanState:v36];
    nextBestTimeline = self->_nextBestTimeline;
  }
  long long v29 = (void *)[(PXStoryMutableConcreteTimeline *)nextBestTimeline copy];
  if (v13) {
    v13[2](v13);
  }

  return v29;
}

void __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke(void *a1, uint64_t a2)
{
  char v3 = (void *)a1[4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_2;
  v5[3] = &unk_1E5DC1C00;
  v5[4] = a1[5];
  if (([v3 scanFastestSubtimelineWithDisplayAssetResourceCount:a2 resultHandler:v5] & 1) == 0)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a1[6] object:a1[5] file:@"PXStoryConcreteTimelineParser.m" lineNumber:86 description:@"failed to scan up to preferred initial position"];
  }
}

uint64_t __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_3(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  [*(id *)(a1 + 32) setScanState:v4];
  [*(id *)(a1 + 40) setPreferredInitialDisplayAssetResourceIndex:0x7FFFFFFFFFFFFFFFLL];
  return [*(id *)(*(void *)(a1 + 40) + 8) removeAllClipsAndSegments];
}

uint64_t __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _adjustTimeline:*(void *)(*(void *)(a1 + 32) + 8) andAppendTimeline:a2];
}

uint64_t __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_2_19(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) appendTimeline:a2];
}

uint64_t __54__PXStoryConcreteTimelineParser_parseNextBestTimeline__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) appendTimeline:a2];
}

- (PXStoryConcreteTimelineParser)initWithConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryConcreteTimelineParser;
  double v5 = [(PXStoryConcreteTimelineParser *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [[PXStoryConcreteSubtimelineScanner alloc] initWithConfiguration:v4];
    scanner = v5->_scanner;
    v5->_scanner = v6;

    uint64_t v8 = [v4 resourcesDataSource];
    resourcesDataSource = v5->_resourcesDataSource;
    v5->_resourcesDataSource = (PXStoryResourcesDataSource *)v8;

    v5->_preferredInitialDisplayAssetResourceIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = [v4 spec];
    uint64_t v11 = [v10 allowedTransitionKinds];
    allowedTransitionKinds = v5->_allowedTransitionKinds;
    v5->_allowedTransitionKinds = (NSIndexSet *)v11;

    CMTime v13 = [v4 spec];
    v5->_fallbackTransitionKind = [v13 fallbackTransitionKind];

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F8CD40]) initWithSeed:0];
    randomNumberGenerator = v5->_randomNumberGenerator;
    v5->_randomNumberGenerator = (PFRandomNumberGenerator *)v14;

    uint64_t v16 = [v4 spec];
    [v16 viewportSize];

    PXSizeIsEmpty();
  }

  return 0;
}

PXStoryMutableConcreteTimeline *__55__PXStoryConcreteTimelineParser_initWithConfiguration___block_invoke(uint64_t a1)
{
  long long v2 = [PXStoryMutableConcreteTimeline alloc];
  char v3 = [*(id *)(a1 + 32) resourcesDataSource];
  id v4 = -[PXStoryConcreteTimeline initWithSize:resourcesDataSource:](v2, "initWithSize:resourcesDataSource:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v4;
}

- (PXStoryConcreteTimelineParser)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimelineParser.m", 40, @"%s is not available as initializer", "-[PXStoryConcreteTimelineParser init]");

  abort();
}

@end