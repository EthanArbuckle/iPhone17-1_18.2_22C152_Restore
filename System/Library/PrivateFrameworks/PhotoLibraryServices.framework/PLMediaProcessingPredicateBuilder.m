@interface PLMediaProcessingPredicateBuilder
- (PLMediaProcessingPredicateBuilder)initWithProcessed:(BOOL)a3 exactVersionMatch:(BOOL)a4;
- (id)_predicateForProcessedAndExact:(id)a3 processedAndNotExact:(id)a4 unprocessedAndExact:(id)a5 unprocessedAndNotExact:(id)a6;
- (id)directPredicateWithKeyPath:(id)a3 version:(signed __int16)a4;
- (id)optimizedPredicateWithKeyPath:(id)a3 version:(signed __int16)a4;
- (id)optimizedSearchPredicateWithSearchKeyPath:(id)a3 searchVersion:(signed __int16)a4 stickerConfidenceKeyPath:(id)a5 stickConfidenceVersion:(unsigned __int16)a6;
@end

@implementation PLMediaProcessingPredicateBuilder

- (id)_predicateForProcessedAndExact:(id)a3 processedAndNotExact:(id)a4 unprocessedAndExact:(id)a5 unprocessedAndNotExact:(id)a6
{
  v10 = (void (**)(void))a3;
  v11 = (void (**)(void))a4;
  v12 = (void (**)(void))a5;
  id v13 = a6;
  v14 = v13;
  if (self->_exactVersionMatch) {
    v15 = v10;
  }
  else {
    v15 = v11;
  }
  if (self->_exactVersionMatch) {
    v16 = v12;
  }
  else {
    v16 = (void (**)(void))v13;
  }
  if (self->_processed) {
    v17 = v15;
  }
  else {
    v17 = v16;
  }
  v18 = v17[2]();

  return v18;
}

- (id)optimizedSearchPredicateWithSearchKeyPath:(id)a3 searchVersion:(signed __int16)a4 stickerConfidenceKeyPath:(id)a5 stickConfidenceVersion:(unsigned __int16)a6
{
  id v10 = a3;
  id v11 = a5;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __141__PLMediaProcessingPredicateBuilder_optimizedSearchPredicateWithSearchKeyPath_searchVersion_stickerConfidenceKeyPath_stickConfidenceVersion___block_invoke;
  v31[3] = &unk_1E586BEC8;
  id v32 = v10;
  signed __int16 v34 = a4;
  id v33 = v11;
  unsigned __int16 v35 = a6;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __141__PLMediaProcessingPredicateBuilder_optimizedSearchPredicateWithSearchKeyPath_searchVersion_stickerConfidenceKeyPath_stickConfidenceVersion___block_invoke_2;
  v26[3] = &unk_1E586BEC8;
  id v27 = v32;
  signed __int16 v29 = a4;
  id v28 = v33;
  unsigned __int16 v30 = a6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __141__PLMediaProcessingPredicateBuilder_optimizedSearchPredicateWithSearchKeyPath_searchVersion_stickerConfidenceKeyPath_stickConfidenceVersion___block_invoke_3;
  v21[3] = &unk_1E586BEC8;
  id v22 = v27;
  signed __int16 v24 = a4;
  id v23 = v28;
  unsigned __int16 v25 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __141__PLMediaProcessingPredicateBuilder_optimizedSearchPredicateWithSearchKeyPath_searchVersion_stickerConfidenceKeyPath_stickConfidenceVersion___block_invoke_4;
  v16[3] = &unk_1E586BEC8;
  signed __int16 v19 = a4;
  id v17 = v22;
  id v18 = v23;
  unsigned __int16 v20 = a6;
  id v12 = v23;
  id v13 = v22;
  v14 = [(PLMediaProcessingPredicateBuilder *)self _predicateForProcessedAndExact:v31 processedAndNotExact:v26 unprocessedAndExact:v21 unprocessedAndNotExact:v16];

  return v14;
}

uint64_t __141__PLMediaProcessingPredicateBuilder_optimizedSearchPredicateWithSearchKeyPath_searchVersion_stickerConfidenceKeyPath_stickConfidenceVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K == %d) && (%K == %d)", *(void *)(a1 + 32), *(__int16 *)(a1 + 48), *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 50));
}

uint64_t __141__PLMediaProcessingPredicateBuilder_optimizedSearchPredicateWithSearchKeyPath_searchVersion_stickerConfidenceKeyPath_stickConfidenceVersion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K >= %d) && (%K >= %d)", *(void *)(a1 + 32), *(__int16 *)(a1 + 48), *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 50));
}

uint64_t __141__PLMediaProcessingPredicateBuilder_optimizedSearchPredicateWithSearchKeyPath_searchVersion_stickerConfidenceKeyPath_stickConfidenceVersion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K != %d) && (%K != %d)", *(void *)(a1 + 32), *(__int16 *)(a1 + 48), *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 50));
}

uint64_t __141__PLMediaProcessingPredicateBuilder_optimizedSearchPredicateWithSearchKeyPath_searchVersion_stickerConfidenceKeyPath_stickConfidenceVersion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K < %d) && (%K < %d)", *(void *)(a1 + 32), *(__int16 *)(a1 + 48), *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 50));
}

- (id)optimizedPredicateWithKeyPath:(id)a3 version:(signed __int16)a4
{
  id v6 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__PLMediaProcessingPredicateBuilder_optimizedPredicateWithKeyPath_version___block_invoke;
  v19[3] = &unk_1E586BEA0;
  id v20 = v6;
  signed __int16 v21 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__PLMediaProcessingPredicateBuilder_optimizedPredicateWithKeyPath_version___block_invoke_2;
  v16[3] = &unk_1E586BEA0;
  id v17 = v20;
  signed __int16 v18 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PLMediaProcessingPredicateBuilder_optimizedPredicateWithKeyPath_version___block_invoke_3;
  v13[3] = &unk_1E586BEA0;
  id v14 = v17;
  signed __int16 v15 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PLMediaProcessingPredicateBuilder_optimizedPredicateWithKeyPath_version___block_invoke_4;
  v10[3] = &unk_1E586BEA0;
  id v11 = v14;
  signed __int16 v12 = a4;
  id v7 = v14;
  v8 = [(PLMediaProcessingPredicateBuilder *)self _predicateForProcessedAndExact:v19 processedAndNotExact:v16 unprocessedAndExact:v13 unprocessedAndNotExact:v10];

  return v8;
}

uint64_t __75__PLMediaProcessingPredicateBuilder_optimizedPredicateWithKeyPath_version___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", *(void *)(a1 + 32), *(__int16 *)(a1 + 40));
}

uint64_t __75__PLMediaProcessingPredicateBuilder_optimizedPredicateWithKeyPath_version___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", *(void *)(a1 + 32), *(__int16 *)(a1 + 40));
}

uint64_t __75__PLMediaProcessingPredicateBuilder_optimizedPredicateWithKeyPath_version___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"((%K >= 0) AND (%K < %d)) OR (%K > %d)", *(void *)(a1 + 32), *(void *)(a1 + 32), *(__int16 *)(a1 + 40), *(void *)(a1 + 32), *(__int16 *)(a1 + 40));
}

uint64_t __75__PLMediaProcessingPredicateBuilder_optimizedPredicateWithKeyPath_version___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K >= 0) AND (%K < %d)", *(void *)(a1 + 32), *(void *)(a1 + 32), *(__int16 *)(a1 + 40));
}

- (id)directPredicateWithKeyPath:(id)a3 version:(signed __int16)a4
{
  id v6 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__PLMediaProcessingPredicateBuilder_directPredicateWithKeyPath_version___block_invoke;
  v19[3] = &unk_1E586BEA0;
  id v20 = v6;
  signed __int16 v21 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__PLMediaProcessingPredicateBuilder_directPredicateWithKeyPath_version___block_invoke_2;
  v16[3] = &unk_1E586BEA0;
  id v17 = v20;
  signed __int16 v18 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PLMediaProcessingPredicateBuilder_directPredicateWithKeyPath_version___block_invoke_3;
  v13[3] = &unk_1E586BEA0;
  id v14 = v17;
  signed __int16 v15 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PLMediaProcessingPredicateBuilder_directPredicateWithKeyPath_version___block_invoke_4;
  v10[3] = &unk_1E586BEA0;
  id v11 = v14;
  signed __int16 v12 = a4;
  id v7 = v14;
  v8 = [(PLMediaProcessingPredicateBuilder *)self _predicateForProcessedAndExact:v19 processedAndNotExact:v16 unprocessedAndExact:v13 unprocessedAndNotExact:v10];

  return v8;
}

uint64_t __72__PLMediaProcessingPredicateBuilder_directPredicateWithKeyPath_version___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", *(void *)(a1 + 32), *(__int16 *)(a1 + 40));
}

uint64_t __72__PLMediaProcessingPredicateBuilder_directPredicateWithKeyPath_version___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", *(void *)(a1 + 32), *(__int16 *)(a1 + 40));
}

uint64_t __72__PLMediaProcessingPredicateBuilder_directPredicateWithKeyPath_version___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", *(void *)(a1 + 32), *(__int16 *)(a1 + 40));
}

uint64_t __72__PLMediaProcessingPredicateBuilder_directPredicateWithKeyPath_version___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K < %d", *(void *)(a1 + 32), *(__int16 *)(a1 + 40));
}

- (PLMediaProcessingPredicateBuilder)initWithProcessed:(BOOL)a3 exactVersionMatch:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PLMediaProcessingPredicateBuilder;
  id v6 = [(PLMediaProcessingPredicateBuilder *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    v6->_processed = a3;
    v6->_exactVersionMatch = a4;
    v8 = v6;
  }

  return v7;
}

@end