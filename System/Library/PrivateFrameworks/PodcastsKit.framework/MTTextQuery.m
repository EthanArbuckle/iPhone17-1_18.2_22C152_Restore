@interface MTTextQuery
- (id)titleForPodcastUuid:(id)a3;
- (void)runQueryWithText:(id)a3;
@end

@implementation MTTextQuery

- (void)runQueryWithText:(id)a3
{
  v80[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB48] ascending:0];
  v80[0] = v5;
  v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:0];
  v80[1] = v6;
  v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:1];
  v80[2] = v7;
  uint64_t v66 = *MEMORY[0x263F5EB60];
  v8 = objc_msgSend(MEMORY[0x263F08B30], "sortDescriptorWithKey:ascending:selector:");
  v80[3] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:4];
  [(MTLibraryQuery *)self setEpisodeSortDescriptors:v9];

  v10 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v64 = *MEMORY[0x263F5ED10];
  v11 = objc_msgSend(MEMORY[0x263F08B30], "sortDescriptorWithKey:ascending:selector:");
  v12 = [v10 arrayWithObject:v11];
  v58 = self;
  [(MTLibraryQuery *)self setPodcastSortDescriptors:v12];

  v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v59 = v4;
  v14 = [v4 stringByTrimmingCharactersInSet:v13];
  v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v16 = [v14 componentsSeparatedByCharactersInSet:v15];

  v74 = [MEMORY[0x263EFF980] array];
  v73 = [MEMORY[0x263EFF980] array];
  v72 = [MEMORY[0x263EFF980] array];
  v71 = [MEMORY[0x263EFF980] array];
  v70 = [MEMORY[0x263EFF980] array];
  v69 = [MEMORY[0x263EFF980] array];
  v68 = [MEMORY[0x263EFF980] array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v16;
  uint64_t v17 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v62 = *(void *)v76;
    uint64_t v61 = *MEMORY[0x263F5EC70];
    uint64_t v19 = *MEMORY[0x263F5EAA0];
    uint64_t v20 = *MEMORY[0x263F5EA50];
    uint64_t v21 = *MEMORY[0x263F5EA68];
    uint64_t v22 = *MEMORY[0x263F5EA58];
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v76 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v75 + 1) + 8 * i);
        v25 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K contains[cl] %@", v64, v24];
        [v74 addObject:v25];

        v26 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K contains[cl] %@", v61, v24];
        [v73 addObject:v26];

        v27 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K contains[cl] %@", v66, v24];
        [v72 addObject:v27];

        v28 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K contains[cl] %@", v19, v24];
        [v71 addObject:v28];

        v29 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K contains[cl] %@", v20, v24];
        [v70 addObject:v29];

        v30 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K contains[cl] %@", v21, v24];
        [v69 addObject:v30];

        v31 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K > %@", v22, &unk_26F2D2998];
        [v68 addObject:v31];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
    }
    while (v18);
  }

  v32 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v74];
  v33 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v73];
  v34 = [MEMORY[0x263F5EA08] predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  v35 = (void *)MEMORY[0x263F08730];
  v36 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v32, v33, 0);
  v67 = [v35 orPredicateWithSubpredicates:v36];

  v37 = (void *)MEMORY[0x263F08730];
  v38 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v34, v67, 0);
  v65 = [v37 andPredicateWithSubpredicates:v38];

  v39 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v72];

  v40 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v71];

  v41 = (void *)MEMORY[0x263F08730];
  v42 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v39, v40, 0);
  v43 = [v41 orPredicateWithSubpredicates:v42];

  v44 = (void *)MEMORY[0x263F5E9E0];
  id v45 = v43;
  v63 = [v44 predicateForEpisodesInSearchResults];

  v46 = (void *)MEMORY[0x263F08730];
  v47 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v63, v45, 0);

  v48 = [v46 andPredicateWithSubpredicates:v47];

  v49 = (void *)MEMORY[0x263F08730];
  v50 = [v70 arrayByAddingObjectsFromArray:v68];
  v51 = [v49 andPredicateWithSubpredicates:v50];

  v52 = (void *)MEMORY[0x263F08730];
  v53 = [v69 arrayByAddingObjectsFromArray:v68];
  v54 = [v52 andPredicateWithSubpredicates:v53];

  v55 = (void *)MEMORY[0x263F08730];
  v56 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v51, v54, 0);
  v57 = [v55 orPredicateWithSubpredicates:v56];

  [(MTLibraryQuery *)v58 runQueryWithPodcastPredicate:v65 episodePredicate:v48 channelPredicate:v57];
}

- (id)titleForPodcastUuid:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  if (v3)
  {
    id v4 = [MEMORY[0x263F5E9D0] sharedInstance];
    v5 = [v4 mainOrPrivateContext];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__MTTextQuery_titleForPodcastUuid___block_invoke;
    v10[3] = &unk_265055788;
    id v6 = v5;
    id v11 = v6;
    id v12 = v3;
    v13 = &v14;
    [v6 performBlockAndWait:v10];

    v7 = (void *)v15[5];
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __35__MTTextQuery_titleForPodcastUuid___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end