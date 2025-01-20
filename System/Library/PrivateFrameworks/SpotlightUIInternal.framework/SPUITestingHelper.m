@interface SPUITestingHelper
+ (id)indexPathsOfRowsForSectionTitle:(id)a3 needsCard:(BOOL)a4 forTestingViewController:(id)a5;
- (BOOL)canPerformTest:(id)a3;
- (BOOL)finishedKeyboardLaunch;
- (BOOL)finishedTableUpdate;
- (SPUIPPTTypingHelper)typingHelper;
- (SPUISearchViewController)searchViewController;
- (SPUITestingHelper)initWithSearchViewController:(id)a3;
- (UIApplication)activeApp;
- (void)finishLaunchTestIfNeeded;
- (void)performCardScrollTest:(id)a3 queryKind:(unint64_t)a4 completion:(id)a5;
- (void)performPushPopCardsOnTest:(id)a3 options:(id)a4 needsCard:(BOOL)a5 sectionHeader:(id)a6 atDesk:(BOOL)a7 queryKind:(unint64_t)a8 completion:(id)a9;
- (void)performScrollOnResultsView:(id)a3 testName:(id)a4 completion:(id)a5;
- (void)performScrollOnSearchViewWithTestName:(id)a3 completion:(id)a4;
- (void)performTest:(id)a3 options:(id)a4 completion:(id)a5;
- (void)resultViewController:(id)a3 finishedGettingAllResults:(id)a4;
- (void)runPushTest:(id)a3 sectionHeader:(id)a4 searchString:(id)a5 completion:(id)a6;
- (void)scrollEntityForTest:(id)a3 forQuery:(id)a4 completion:(id)a5;
- (void)scrollForSectionHeader:(id)a3 forSearchString:(id)a4 testName:(id)a5 queryKind:(unint64_t)a6 completion:(id)a7;
- (void)scrollMainResultsForTest:(id)a3 forQuery:(id)a4 queryKind:(unint64_t)a5 completion:(id)a6;
- (void)searchForSectionHeader:(id)a3 testName:(id)a4 forSearchString:(id)a5 queryKind:(unint64_t)a6 startPushHandler:(id)a7 finishHandler:(id)a8;
- (void)searchForString:(id)a3 testName:(id)a4 event:(unint64_t)a5 queryKind:(unint64_t)a6 completion:(id)a7;
- (void)searchManyStringsForTestName:(id)a3 options:(id)a4 event:(unint64_t)a5 queryKind:(unint64_t)a6 completion:(id)a7;
- (void)searchString:(id)a3 andOpenResultsUnderSection:(id)a4 testName:(id)a5 needsCard:(BOOL)a6 queryKind:(unint64_t)a7 completion:(id)a8;
- (void)searchStrings:(id)a3 andOpenResultsUnderSection:(id)a4 testName:(id)a5 needsCard:(BOOL)a6 queryKind:(unint64_t)a7 completion:(id)a8;
- (void)searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:(id)a3;
- (void)setDefaultsForSearchVCWithqueryType:(unint64_t)a3;
- (void)setFinishedKeyboardLaunch:(BOOL)a3;
- (void)setFinishedTableUpdate:(BOOL)a3;
- (void)setSearchViewController:(id)a3;
- (void)setTypingHelper:(id)a3;
- (void)tapIndexsPathsAndPopViewControllersAfter2Seconds:(id)a3 completion:(id)a4;
- (void)testMapsCardsPushAndScrollForTestName:(id)a3 string:(id)a4 queryKind:(unint64_t)a5 completion:(id)a6;
@end

@implementation SPUITestingHelper

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setFinishedTableUpdate:1];
  v2 = *(void **)(a1 + 32);
  return [v2 finishLaunchTestIfNeeded];
}

- (void)setFinishedTableUpdate:(BOOL)a3
{
  self->_finishedTableUpdate = a3;
}

- (SPUITestingHelper)initWithSearchViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SPUITestingHelper;
  id v3 = a3;
  v4 = [(SPUITestingHelper *)&v6 init];
  -[SPUITestingHelper setSearchViewController:](v4, "setSearchViewController:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)setSearchViewController:(id)a3
{
}

- (BOOL)canPerformTest:(id)a3
{
  v9[18] = *MEMORY[0x263EF8340];
  v9[0] = @"ScrollResultsFPS";
  v9[1] = @"ScrollCardsFPS";
  v9[2] = @"QuerySearchButtonToResultsLatency";
  v9[3] = @"QuerySearchButtonToResultsLatencyNoParsec";
  v9[4] = @"QueryToSuggestionsMixedQueries";
  v9[5] = @"QueryToSuggestionsMixedQueriesNoParsec";
  v9[6] = @"QueryToTopHitsLatency";
  v9[7] = @"QueryToLocalSuggestionLatency";
  id v3 = (void *)MEMORY[0x263EFFA08];
  v9[8] = @"QueryToParsecSuggestionLatency";
  v9[9] = @"ParsecdLaunchTime";
  v9[10] = @"SpotlightExtendedLaunch";
  v9[11] = @"MemoryTestMapsCards";
  v9[12] = @"MemoryTestContactsCards";
  v9[13] = @"MemoryTestMapsCardsAtDesk";
  v9[14] = @"MapsCardsPushAndScrollTests";
  v9[15] = @"CardPushTest";
  v9[16] = @"MapsPushTest";
  v9[17] = @"EntityScrollTest";
  v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  objc_super v6 = [v4 arrayWithObjects:v9 count:18];
  v7 = [v3 setWithArray:v6];

  LOBYTE(v3) = [v7 containsObject:v5];
  return (char)v3;
}

- (void)performTest:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isEqualToString:@"SpotlightExtendedLaunch"])
  {
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v12 = *MEMORY[0x263F83808];
    v13 = [MEMORY[0x263F08A48] mainQueue];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke;
    v42[3] = &unk_264E90C48;
    v42[4] = self;
    id v14 = (id)[v11 addObserverForName:v12 object:0 queue:v13 usingBlock:v42];

    v15 = [(SPUITestingHelper *)self searchViewController];
    v16 = [v15 proactiveResultsTestingObject];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke_2;
    v41[3] = &unk_264E90660;
    v41[4] = self;
    [v16 setViewDidUpdateHandler:v41];
  }
  if ([v8 isEqualToString:@"ScrollResultsFPS"])
  {
    v17 = [v9 objectForKeyedSubscript:@"SearchText"];
    [(SPUITestingHelper *)self scrollMainResultsForTest:v8 forQuery:v17 queryKind:+[SPUISearchHeader asYouTypeSearchQueryKind] completion:v10];
    goto LABEL_5;
  }
  if ([v8 isEqualToString:@"ScrollCardsFPS"])
  {
    [(SPUITestingHelper *)self performCardScrollTest:v8 queryKind:+[SPUISearchHeader asYouTypeSearchQueryKind] completion:v10];
    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"QuerySearchButtonToResultsLatency"])
  {
    unint64_t v18 = +[SPUISearchHeader committedSearchQueryKind];
    v19 = self;
    id v20 = v8;
    id v21 = v9;
    uint64_t v22 = 22;
LABEL_17:
    [(SPUITestingHelper *)v19 searchManyStringsForTestName:v20 options:v21 event:v22 queryKind:v18 completion:v10];
    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"QuerySearchButtonToResultsLatencyNoParsec"])
  {
    SPSetInternetDomainsEnabled();
    unint64_t v23 = +[SPUISearchHeader committedSearchQueryKind];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke_3;
    v39[3] = &unk_264E90768;
    id v40 = v10;
    [(SPUITestingHelper *)self searchManyStringsForTestName:v8 options:v9 event:22 queryKind:v23 completion:v39];
    v24 = v40;
LABEL_20:

    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"QueryToSuggestionsMixedQueries"]) {
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"QueryToSuggestionsMixedQueriesNoParsec"])
  {
    SPSetInternetDomainsEnabled();
    unint64_t v25 = +[SPUISearchHeader asYouTypeSearchQueryKind];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke_4;
    v37[3] = &unk_264E90768;
    id v38 = v10;
    [(SPUITestingHelper *)self searchManyStringsForTestName:v8 options:v9 event:1 queryKind:v25 completion:v37];
    v24 = v38;
    goto LABEL_20;
  }
  if ([v8 isEqualToString:@"QueryToTopHitsLatency"])
  {
LABEL_16:
    unint64_t v18 = +[SPUISearchHeader asYouTypeSearchQueryKind];
    v19 = self;
    id v20 = v8;
    id v21 = v9;
    uint64_t v22 = 1;
    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"QueryToLocalSuggestionLatency"])
  {
    SPSetInternetDomainsEnabled();
    unint64_t v26 = +[SPUISearchHeader asYouTypeSearchQueryKind];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __52__SPUITestingHelper_performTest_options_completion___block_invoke_5;
    v35[3] = &unk_264E90768;
    id v36 = v10;
    [(SPUITestingHelper *)self searchManyStringsForTestName:v8 options:v9 event:1 queryKind:v26 completion:v35];
    v24 = v36;
    goto LABEL_20;
  }
  if ([v8 isEqualToString:@"QueryToParsecSuggestionLatency"])
  {
LABEL_25:
    unint64_t v18 = +[SPUISearchHeader asYouTypeSearchQueryKind];
    v19 = self;
    id v20 = v8;
    id v21 = v9;
    uint64_t v22 = 8;
    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"ParsecdLaunchTime"])
  {
    PS_PSKillProcessNamed();
    goto LABEL_25;
  }
  if ([v8 isEqualToString:@"MemoryTestMapsCards"])
  {
    unint64_t v27 = +[SPUISearchHeader asYouTypeSearchQueryKind];
    id v34 = v10;
    v28 = @"MAPS";
    v29 = self;
    id v30 = v8;
    id v31 = v9;
    uint64_t v32 = 1;
LABEL_30:
    [(SPUITestingHelper *)v29 performPushPopCardsOnTest:v30 options:v31 needsCard:v32 sectionHeader:v28 atDesk:0 queryKind:v27 completion:v34];
    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"MemoryTestContactsCards"])
  {
    unint64_t v27 = +[SPUISearchHeader asYouTypeSearchQueryKind];
    id v34 = v10;
    v28 = @"CONTACTS";
    v29 = self;
    id v30 = v8;
    id v31 = v9;
    uint64_t v32 = 0;
    goto LABEL_30;
  }
  if ([v8 isEqualToString:@"MemoryTestMapsCardsAtDesk"])
  {
    [(SPUITestingHelper *)self performPushPopCardsOnTest:v8 options:v9 needsCard:1 sectionHeader:@"MAPS" atDesk:1 queryKind:+[SPUISearchHeader asYouTypeSearchQueryKind] completion:v10];
    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"MapsCardsPushAndScrollTests"])
  {
    v17 = [v9 objectForKey:@"queryString"];
    [(SPUITestingHelper *)self testMapsCardsPushAndScrollForTestName:v8 string:v17 queryKind:+[SPUISearchHeader asYouTypeSearchQueryKind] completion:v10];
  }
  else
  {
    if ([v8 isEqualToString:@"CardPushTest"])
    {
      v17 = [v9 objectForKey:@"queryString"];
      v33 = @"SPORTS";
    }
    else
    {
      if (![v8 isEqualToString:@"MapsPushTest"])
      {
        if (![v8 isEqualToString:@"EntityScrollTest"]) {
          goto LABEL_21;
        }
        v17 = [v9 objectForKey:@"queryString"];
        [(SPUITestingHelper *)self scrollEntityForTest:v8 forQuery:v17 completion:v10];
        goto LABEL_5;
      }
      v17 = [v9 objectForKey:@"queryString"];
      v33 = @"MAPS";
    }
    [(SPUITestingHelper *)self runPushTest:v8 sectionHeader:v33 searchString:v17 completion:v10];
  }
LABEL_5:

LABEL_21:
}

- (void)finishLaunchTestIfNeeded
{
  if ([(SPUITestingHelper *)self finishedKeyboardLaunch]
    && [(SPUITestingHelper *)self finishedTableUpdate])
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F83808] object:0];

    v4 = [(SPUITestingHelper *)self searchViewController];
    id v5 = [v4 proactiveResultsTestingObject];
    [v5 setViewDidUpdateHandler:0];

    objc_super v6 = (void *)*MEMORY[0x263F83300];
    [v6 _performBlockAfterCATransactionCommits:&__block_literal_global_4];
  }
}

- (BOOL)finishedKeyboardLaunch
{
  return self->_finishedKeyboardLaunch;
}

- (BOOL)finishedTableUpdate
{
  return self->_finishedTableUpdate;
}

- (SPUISearchViewController)searchViewController
{
  return (SPUISearchViewController *)objc_getProperty(self, a2, 16, 1);
}

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFinishedKeyboardLaunch:1];
  v2 = *(void **)(a1 + 32);
  return [v2 finishLaunchTestIfNeeded];
}

- (void)setFinishedKeyboardLaunch:(BOOL)a3
{
  self->_finishedKeyboardLaunch = a3;
}

void __45__SPUITestingHelper_finishLaunchTestIfNeeded__block_invoke()
{
  v0 = (void *)*MEMORY[0x263F83300];
  id v1 = [(id)*MEMORY[0x263F83300] _launchTestName];
  [v0 finishedTest:v1];
}

- (UIApplication)activeApp
{
  return (UIApplication *)[MEMORY[0x263F82438] sharedApplication];
}

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke_3(uint64_t a1)
{
  SPSetInternetDomainsEnabled();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke_4(uint64_t a1)
{
  SPSetInternetDomainsEnabled();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __52__SPUITestingHelper_performTest_options_completion___block_invoke_5(uint64_t a1)
{
  SPSetInternetDomainsEnabled();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)runPushTest:(id)a3 sectionHeader:(id)a4 searchString:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  unint64_t v14 = +[SPUISearchHeader asYouTypeSearchQueryKind];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __71__SPUITestingHelper_runPushTest_sectionHeader_searchString_completion___block_invoke;
  v20[3] = &unk_264E90910;
  v20[4] = self;
  id v21 = v10;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__SPUITestingHelper_runPushTest_sectionHeader_searchString_completion___block_invoke_2;
  v17[3] = &unk_264E90C70;
  v17[4] = self;
  id v18 = v21;
  id v19 = v11;
  id v15 = v11;
  id v16 = v21;
  [(SPUITestingHelper *)self searchForSectionHeader:v13 testName:v16 forSearchString:v12 queryKind:v14 startPushHandler:v20 finishHandler:v17];
}

void __71__SPUITestingHelper_runPushTest_sectionHeader_searchString_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeApp];
  [v2 startedTest:*(void *)(a1 + 40)];
}

uint64_t __71__SPUITestingHelper_runPushTest_sectionHeader_searchString_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeApp];
  [v2 finishedTest:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)testMapsCardsPushAndScrollForTestName:(id)a3 string:(id)a4 queryKind:(unint64_t)a5 completion:(id)a6
{
}

- (void)performPushPopCardsOnTest:(id)a3 options:(id)a4 needsCard:(BOOL)a5 sectionHeader:(id)a6 atDesk:(BOOL)a7 queryKind:(unint64_t)a8 completion:(id)a9
{
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a9;
  id v17 = a6;
  id v18 = [a4 objectForKey:@"queryStrings"];
  id v19 = [v18 componentsSeparatedByString:@","];
  id v20 = (void *)[v19 mutableCopy];

  id v21 = [(SPUITestingHelper *)self activeApp];
  [v21 startedTest:v15];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __107__SPUITestingHelper_performPushPopCardsOnTest_options_needsCard_sectionHeader_atDesk_queryKind_completion___block_invoke;
  v24[3] = &unk_264E90C98;
  BOOL v27 = a7;
  v24[4] = self;
  id v25 = v15;
  id v26 = v16;
  id v22 = v16;
  id v23 = v15;
  [(SPUITestingHelper *)self searchStrings:v20 andOpenResultsUnderSection:v17 testName:v23 needsCard:v12 queryKind:a8 completion:v24];
}

uint64_t __107__SPUITestingHelper_performPushPopCardsOnTest_options_needsCard_sectionHeader_atDesk_queryKind_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v12 = 0u;
    pid_t v2 = getpid();
    proc_pid_rusage(v2, 4, buffer);
    if (*((void *)&v15 + 1) >= 0x2FAF081uLL)
    {
      id v3 = [*(id *)(a1 + 32) activeApp];
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = [NSString stringWithFormat:@"Spotlight memory is above inactive jetsam limit current footprint : %llu, inactive limit: %f", *((void *)&v15 + 1), 0x4187D78400000000, buffer[0], buffer[1], v12, v13, v14, (void)v15];
      [v3 failedTest:v4 withFailure:v5];
    }
    if ((unint64_t)v26 >= 0x11E1A301)
    {
      objc_super v6 = [*(id *)(a1 + 32) activeApp];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Spotlight memory went above active jetsam limit : %llu max allowed: %f", (void)v26, 0x41B1E1A300000000);
      [v6 failedTest:v7 withFailure:v8];
    }
  }
  id v9 = [*(id *)(a1 + 32) activeApp];
  [v9 finishedTest:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performCardScrollTest:(id)a3 queryKind:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SPUITestingHelper *)self activeApp];
  [v10 startedTest:v8];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__SPUITestingHelper_performCardScrollTest_queryKind_completion___block_invoke;
  v13[3] = &unk_264E90C70;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(SPUITestingHelper *)self scrollForSectionHeader:@"Sports" forSearchString:@"sf giants roster" testName:v12 queryKind:a4 completion:v13];
}

uint64_t __64__SPUITestingHelper_performCardScrollTest_queryKind_completion___block_invoke(uint64_t a1)
{
  pid_t v2 = [*(id *)(a1 + 32) activeApp];
  [v2 finishedTest:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)searchStrings:(id)a3 andOpenResultsUnderSection:(id)a4 testName:(id)a5 needsCard:(BOOL)a6 queryKind:(unint64_t)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if ([v14 count])
  {
    id v18 = [v14 lastObject];
    [v14 removeLastObject];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __102__SPUITestingHelper_searchStrings_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke_2;
    v21[3] = &unk_264E90CC0;
    v21[4] = self;
    id v22 = v14;
    id v23 = v15;
    BOOL v27 = v10;
    id v25 = v17;
    unint64_t v26 = a7;
    id v24 = v16;
    id v19 = v17;
    [(SPUITestingHelper *)self searchString:v18 andOpenResultsUnderSection:v23 testName:v24 needsCard:v10 queryKind:a7 completion:v21];
  }
  else
  {
    dispatch_time_t v20 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __102__SPUITestingHelper_searchStrings_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke;
    block[3] = &unk_264E90768;
    id v29 = v17;
    id v18 = v17;
    dispatch_after(v20, MEMORY[0x263EF83A0], block);
    id v19 = v29;
  }
}

uint64_t __102__SPUITestingHelper_searchStrings_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __102__SPUITestingHelper_searchStrings_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) searchStrings:*(void *)(a1 + 40) andOpenResultsUnderSection:*(void *)(a1 + 48) testName:*(void *)(a1 + 56) needsCard:*(unsigned __int8 *)(a1 + 80) queryKind:*(void *)(a1 + 72) completion:*(void *)(a1 + 64)];
}

- (void)searchString:(id)a3 andOpenResultsUnderSection:(id)a4 testName:(id)a5 needsCard:(BOOL)a6 queryKind:(unint64_t)a7 completion:(id)a8
{
  id v13 = a4;
  id v14 = a8;
  id v15 = a3;
  id v16 = [(SPUITestingHelper *)self searchViewController];
  [v16 performTestSearchWithQuery:v15 event:22 queryKind:a7];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __101__SPUITestingHelper_searchString_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke;
  v19[3] = &unk_264E90C98;
  BOOL v23 = a6;
  id v20 = v13;
  long long v21 = self;
  id v22 = v14;
  id v17 = v14;
  id v18 = v13;
  [(SPUITestingHelper *)self searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:v19];
}

void __101__SPUITestingHelper_searchString_andOpenResultsUnderSection_testName_needsCard_queryKind_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) searchViewController];
  id v5 = [v4 searchResultsTestingObject];
  objc_super v6 = +[SPUITestingHelper indexPathsOfRowsForSectionTitle:v3 needsCard:v2 forTestingViewController:v5];
  id v7 = (id)[v6 mutableCopy];

  [*(id *)(a1 + 40) tapIndexsPathsAndPopViewControllersAfter2Seconds:v7 completion:*(void *)(a1 + 48)];
}

- (void)tapIndexsPathsAndPopViewControllersAfter2Seconds:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    id v8 = [v6 lastObject];
    [v6 removeLastObject];
    id v9 = [(SPUITestingHelper *)self searchViewController];
    BOOL v10 = [v9 searchResultsTestingObject];
    [v10 tapAtIndexPath:v8];

    dispatch_time_t v11 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__SPUITestingHelper_tapIndexsPathsAndPopViewControllersAfter2Seconds_completion___block_invoke;
    block[3] = &unk_264E90C70;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_after(v11, MEMORY[0x263EF83A0], block);
  }
  else
  {
    v7[2](v7);
  }
}

uint64_t __81__SPUITestingHelper_tapIndexsPathsAndPopViewControllersAfter2Seconds_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x23ECFD4B0]();
  uint64_t v3 = [*(id *)(a1 + 32) searchViewController];
  uint64_t v4 = [v3 navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:0];

  id v6 = [*(id *)(a1 + 32) searchViewController];
  id v7 = [v6 navigationController];
  id v8 = [v7 view];
  [v8 layoutIfNeeded];

  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:*MEMORY[0x263F83340] object:0];

  BOOL v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  return [v10 tapIndexsPathsAndPopViewControllersAfter2Seconds:v11 completion:v12];
}

- (void)resultViewController:(id)a3 finishedGettingAllResults:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke;
  v8[3] = &unk_264E90D10;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [v5 setDidFinishGettingAllResultsHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDidFinishGettingAllResultsHandler:0];

  if (a2)
  {
    id v6 = objc_loadWeakRetained(v4);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke_2;
    v8[3] = &unk_264E90CE8;
    objc_copyWeak(&v10, v4);
    id v9 = *(id *)(a1 + 32);
    [v6 setViewDidUpdateHandler:v8];

    objc_destroyWeak(&v10);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v7();
  }
}

void __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setViewDidUpdateHandler:0];

  uint64_t v3 = (void *)*MEMORY[0x263F83300];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke_3;
  v4[3] = &unk_264E90768;
  id v5 = *(id *)(a1 + 32);
  [v3 installCACommitCompletionBlock:v4];
}

uint64_t __68__SPUITestingHelper_resultViewController_finishedGettingAllResults___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(SPUITestingHelper *)self searchViewController];
  id v5 = [v6 searchResultsTestingObject];
  [(SPUITestingHelper *)self resultViewController:v5 finishedGettingAllResults:v4];
}

- (void)searchForSectionHeader:(id)a3 testName:(id)a4 forSearchString:(id)a5 queryKind:(unint64_t)a6 startPushHandler:(id)a7 finishHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = a5;
  id v19 = [(SPUITestingHelper *)self searchViewController];
  [v19 performTestSearchWithQuery:v18 event:22 queryKind:a6];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke;
  v24[3] = &unk_264E90DB0;
  id v25 = v14;
  unint64_t v26 = self;
  id v28 = v16;
  id v29 = v17;
  id v27 = v15;
  id v20 = v15;
  id v21 = v17;
  id v22 = v16;
  id v23 = v14;
  [(SPUITestingHelper *)self searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:v24];
}

void __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) searchViewController];
  id v4 = [v3 searchResultsTestingObject];
  id v5 = +[SPUITestingHelper indexPathsOfRowsForSectionTitle:v2 needsCard:1 forTestingViewController:v4];
  id v6 = [v5 firstObject];

  id v7 = *(void **)(a1 + 40);
  if (v6)
  {
    id v8 = [v7 searchViewController];
    id v9 = [v8 searchResultsTestingObject];
    [v9 tapAtIndexPath:v6];

    id v10 = [*(id *)(a1 + 40) searchViewController];
    uint64_t v11 = [v10 searchResultsTestingObject];
    uint64_t v12 = [v11 navigationController];
    id v13 = [v12 topViewController];

    id v14 = [v13 testingTableViewController];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_2;
    aBlock[3] = &unk_264E90D60;
    id v15 = *(id *)(a1 + 56);
    aBlock[4] = *(void *)(a1 + 40);
    id v25 = v15;
    id v26 = *(id *)(a1 + 64);
    id v16 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_6;
    v19[3] = &unk_264E90D88;
    void v19[4] = &v20;
    [v14 iterateIndexPaths:v19];
    if (v21[3])
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_7;
      v17[3] = &unk_264E90768;
      id v18 = v16;
      [v14 setViewDidUpdateHandler:v17];
    }
    else
    {
      v16[2](v16);
    }
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v13 = [v7 activeApp];
    [v13 failedTest:*(void *)(a1 + 48) withFailure:@"Couldnt find suitable section in results"];
  }
}

void __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [*(id *)(a1 + 32) activeApp];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_3;
  v4[3] = &unk_264E90D38;
  void v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v3 installCACommitCompletionBlock:v4];
}

void __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeApp];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_4;
  v3[3] = &unk_264E90768;
  id v4 = *(id *)(a1 + 40);
  [v2 installCACommitCompletionBlock:v3];
}

void __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_5;
  block[3] = &unk_264E90768;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

uint64_t __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_6(uint64_t result)
{
  return result;
}

uint64_t __110__SPUITestingHelper_searchForSectionHeader_testName_forSearchString_queryKind_startPushHandler_finishHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scrollForSectionHeader:(id)a3 forSearchString:(id)a4 testName:(id)a5 queryKind:(unint64_t)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke;
  v16[3] = &unk_264E90C70;
  v16[4] = self;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(SPUITestingHelper *)self searchForSectionHeader:a3 testName:v15 forSearchString:a4 queryKind:a6 startPushHandler:0 finishHandler:v16];
}

void __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) searchViewController];
  uint64_t v3 = [v2 searchResultsTestingObject];
  id v4 = [v3 navigationController];
  id v5 = [v4 topViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 testingTableViewController];
    dispatch_time_t v7 = dispatch_time(0, 100000000);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_2;
    v10[3] = &unk_264E90E00;
    id v8 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v8;
    id v12 = v6;
    id v13 = *(id *)(a1 + 48);
    id v9 = v6;
    dispatch_after(v7, MEMORY[0x263EF83A0], v10);
  }
}

void __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) activeApp];
  [v2 startedTest:*(void *)(a1 + 40)];

  objc_initWeak(&location, *(id *)(a1 + 48));
  uint64_t v3 = [*(id *)(a1 + 32) activeApp];
  [v3 startedSubTest:@"FirstScroll" forTest:*(void *)(a1 + 40)];

  id v4 = objc_loadWeakRetained(&location);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_3;
  v11[3] = &unk_264E90910;
  id v5 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_4;
  v7[3] = &unk_264E90DD8;
  id v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 56);
  [v4 performScrollTestWithHandlerForFirstScrollCompletion:v11 completion:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeApp];
  [v2 finishedSubTest:@"FirstScroll" forTest:*(void *)(a1 + 40)];
}

uint64_t __90__SPUITestingHelper_scrollForSectionHeader_forSearchString_testName_queryKind_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeApp];
  [v2 finishedTest:*(void *)(a1 + 40)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained navigationController];
  id v5 = (id)[v4 popToRootViewControllerAnimated:0];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    dispatch_time_t v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

+ (id)indexPathsOfRowsForSectionTitle:(id)a3 needsCard:(BOOL)a4 forTestingViewController:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = (id)objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__SPUITestingHelper_indexPathsOfRowsForSectionTitle_needsCard_forTestingViewController___block_invoke;
  v12[3] = &unk_264E90E28;
  id v9 = v7;
  BOOL v15 = a4;
  id v13 = v9;
  id v14 = &v16;
  [v8 iterateIndexPaths:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __88__SPUITestingHelper_indexPathsOfRowsForSectionTitle_needsCard_forTestingViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v16 = a4;
  id v8 = a5;
  id v9 = [a2 title];
  id v10 = [v9 uppercaseString];
  id v11 = [*(id *)(a1 + 32) uppercaseString];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v13 = [v16 nextCard];
      if (v13)
      {
      }
      else
      {
        id v14 = [v16 command];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_7;
        }
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
  }
LABEL_7:
}

- (void)scrollEntityForTest:(id)a3 forQuery:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SPUITestingHelper *)self searchViewController];
  [v11 performTestSearchWithQuery:v9 event:1 queryKind:2];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke;
  v15[3] = &unk_264E90E50;
  id v19 = v20;
  v15[4] = self;
  id v12 = v8;
  id v16 = v12;
  id v13 = v10;
  id v18 = v13;
  id v14 = v9;
  id v17 = v14;
  [(SPUITestingHelper *)self searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:v15];

  _Block_object_dispose(v20, 8);
}

void __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy_;
    id v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    id v2 = [*(id *)(a1 + 32) searchViewController];
    uint64_t v3 = [v2 searchResultsTestingObject];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_2;
    v14[3] = &unk_264E90D88;
    v14[4] = &v15;
    [v3 iterateIndexPaths:v14];

    if (v16[5])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      id v4 = [*(id *)(a1 + 32) searchViewController];
      id v5 = [v4 searchResultsTestingObject];
      [v5 tapAtIndexPath:v16[5]];

      dispatch_time_t v6 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_3;
      block[3] = &unk_264E90C70;
      id v7 = *(void **)(a1 + 40);
      void block[4] = *(void *)(a1 + 32);
      id v12 = v7;
      id v13 = *(id *)(a1 + 56);
      dispatch_after(v6, MEMORY[0x263EF83A0], block);
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) activeApp];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [NSString stringWithFormat:@"No entity results for %@", *(void *)(a1 + 48)];
      [v8 failedTest:v9 withFailure:v10];
    }
    _Block_object_dispose(&v15, 8);
  }
}

void __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v10 = a5;
  id v8 = [a4 command];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a5);
  }
}

void __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_3(id *a1)
{
  id v2 = [a1[4] searchViewController];
  uint64_t v3 = [v2 navigationController];
  id v4 = [v3 topViewController];

  id v5 = a1[4];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_4;
  v7[3] = &unk_264E90E00;
  v7[4] = v5;
  id v8 = v4;
  id v9 = a1[5];
  id v10 = a1[6];
  id v6 = v4;
  [v5 resultViewController:v6 finishedGettingAllResults:v7];
}

uint64_t __61__SPUITestingHelper_scrollEntityForTest_forQuery_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) performScrollOnResultsView:*(void *)(a1 + 40) testName:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)scrollMainResultsForTest:(id)a3 forQuery:(id)a4 queryKind:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = [(SPUITestingHelper *)self searchViewController];
  [v13 performTestSearchWithQuery:v12 event:22 queryKind:a5];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__SPUITestingHelper_scrollMainResultsForTest_forQuery_queryKind_completion___block_invoke;
  v16[3] = &unk_264E90C70;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  [(SPUITestingHelper *)self searchViewFinishedGettingAllResultsAndFinishedDrawsWithCompletion:v16];
}

uint64_t __76__SPUITestingHelper_scrollMainResultsForTest_forQuery_queryKind_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performScrollOnSearchViewWithTestName:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)performScrollOnResultsView:(id)a3 testName:(id)a4 completion:(id)a5
{
}

- (void)performScrollOnSearchViewWithTestName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SPUITestingHelper *)self searchViewController];
  id v8 = [v9 searchResultsTestingObject];
  [(SPUITestingHelper *)self performScrollOnResultsView:v8 testName:v7 completion:v6];
}

- (void)searchManyStringsForTestName:(id)a3 options:(id)a4 event:(unint64_t)a5 queryKind:(unint64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v17 = [a4 objectForKey:@"queryStrings"];
  id v14 = [v17 componentsSeparatedByString:@","];
  id v15 = [(SPUITestingHelper *)self activeApp];
  [v15 startedTest:v13];

  id v16 = (void *)[v14 mutableCopy];
  [(SPUITestingHelper *)self searchForString:v16 testName:v13 event:a5 queryKind:a6 completion:v12];
}

- (void)searchForString:(id)a3 testName:(id)a4 event:(unint64_t)a5 queryKind:(unint64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(void))a7;
  id v15 = [(SPUITestingHelper *)self searchViewController];
  id v16 = [v15 searchResultsTestingObject];
  [v16 setDidFinishGettingAllResultsHandler:0];

  id v17 = [(SPUITestingHelper *)self searchViewController];
  id v18 = [v17 searchResultsTestingObject];
  [v18 setViewWillUpdateHandler:0];

  id v19 = [(SPUITestingHelper *)self searchViewController];
  id v20 = [v19 searchResultsTestingObject];
  [v20 setViewDidUpdateHandler:0];

  if ([v12 count])
  {
    char v21 = NSString;
    uint64_t v22 = [v12 lastObject];
    [v21 stringWithFormat:@"Query To Draw Latency:%@", v22];
    v41 = v13;
    v42 = v14;
    v24 = unint64_t v23 = a6;

    id v25 = NSString;
    id v26 = [v12 lastObject];
    [v25 stringWithFormat:@"Query To First Result:%@", v26];
    v28 = unint64_t v27 = a5;

    id v29 = NSString;
    uint64_t v30 = [v12 lastObject];
    id v31 = [v29 stringWithFormat:@"Query Latency:%@", v30];

    uint64_t v32 = [SPUIPPTTypingHelper alloc];
    v33 = [v12 lastObject];
    id v34 = [(SPUITestingHelper *)self searchViewController];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke;
    v43[3] = &unk_264E90EF0;
    v43[4] = self;
    id v44 = v31;
    id v45 = v41;
    id v46 = v28;
    unint64_t v50 = v27;
    unint64_t v51 = v23;
    id v47 = v12;
    id v48 = v24;
    id v49 = v42;
    id v35 = v24;
    id v36 = v28;
    id v37 = v31;
    unint64_t v38 = v23;
    id v13 = v41;
    id v14 = (void (**)(void))v42;
    v39 = [(SPUIPPTTypingHelper *)v32 initWithString:v33 viewController:v34 queryKind:v38 completion:v43];
    [(SPUITestingHelper *)self setTypingHelper:v39];
  }
  else
  {
    id v40 = [(SPUITestingHelper *)self activeApp];
    [v40 finishedTest:v13];

    if (v14) {
      v14[2](v14);
    }
  }
}

void __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeApp];
  [v2 startedSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48)];

  uint64_t v3 = [*(id *)(a1 + 32) activeApp];
  [v3 startedSubTest:*(void *)(a1 + 56) forTest:*(void *)(a1 + 48)];

  id v4 = [*(id *)(a1 + 32) searchViewController];
  id v5 = [*(id *)(a1 + 64) lastObject];
  [v4 performTestSearchWithQuery:v5 event:*(void *)(a1 + 88) queryKind:*(void *)(a1 + 96)];

  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  char v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  char v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_2;
  aBlock[3] = &unk_264E90E78;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v44 = v49;
  aBlock[4] = v6;
  id v41 = v7;
  id v42 = *(id *)(a1 + 48);
  id v43 = *(id *)(a1 + 72);
  id v8 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_3;
  v30[3] = &unk_264E90EA0;
  uint64_t v9 = *(void *)(a1 + 32);
  id v36 = v47;
  v30[4] = v9;
  id v31 = *(id *)(a1 + 56);
  id v32 = *(id *)(a1 + 48);
  id v33 = *(id *)(a1 + 72);
  id v37 = v49;
  unint64_t v38 = v45;
  id v34 = *(id *)(a1 + 64);
  long long v39 = *(_OWORD *)(a1 + 88);
  id v35 = *(id *)(a1 + 80);
  id v10 = _Block_copy(v30);
  id v11 = [*(id *)(a1 + 32) searchViewController];
  id v12 = [v11 searchResultsTestingObject];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_4;
  v26[3] = &unk_264E90EC8;
  uint64_t v13 = *(void *)(a1 + 32);
  id v29 = v49;
  v26[4] = v13;
  id v14 = v8;
  id v27 = v14;
  id v15 = v10;
  id v28 = v15;
  [v12 setDidFinishGettingAllResultsHandler:v26];

  id v16 = [*(id *)(a1 + 32) searchViewController];
  id v17 = [v16 searchResultsTestingObject];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_5;
  v24[3] = &unk_264E90768;
  id v18 = v14;
  id v25 = v18;
  [v17 setViewWillUpdateHandler:v24];

  id v19 = [*(id *)(a1 + 32) searchViewController];
  id v20 = [v19 searchResultsTestingObject];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_6;
  v22[3] = &unk_264E90D38;
  v22[4] = *(void *)(a1 + 32);
  id v21 = v15;
  id v23 = v21;
  [v20 setViewDidUpdateHandler:v22];

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
}

void __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v2 = [*(id *)(a1 + 32) activeApp];
    [v2 finishedSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48)];
  }
  id v3 = [*(id *)(a1 + 32) activeApp];
  [v3 startedSubTest:*(void *)(a1 + 56) forTest:*(void *)(a1 + 48)];
}

void __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 80) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    id v3 = [*(id *)(a1 + 32) activeApp];
    [v3 finishedSubTest:*(void *)(a1 + 40) forTest:*(void *)(a1 + 48)];
  }
  id v4 = [*(id *)(a1 + 32) activeApp];
  [v4 finishedSubTest:*(void *)(a1 + 56) forTest:*(void *)(a1 + 48)];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 96) + 8);
    if (!*(unsigned char *)(v5 + 24))
    {
      *(unsigned char *)(v5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      [*(id *)(a1 + 64) removeLastObject];
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 104);
      uint64_t v9 = *(void *)(a1 + 112);
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(a1 + 72);
      [v6 searchForString:v10 testName:v7 event:v8 queryKind:v9 completion:v11];
    }
  }
}

uint64_t __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_4(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    id v3 = [*(id *)(result + 32) searchViewController];
    id v4 = [v3 searchResultsTestingObject];
    [v4 setViewWillUpdateHandler:0];

    uint64_t v5 = [*(id *)(v2 + 32) searchViewController];
    uint64_t v6 = [v5 searchResultsTestingObject];
    [v6 setViewDidUpdateHandler:0];

    (*(void (**)(void))(*(void *)(v2 + 40) + 16))();
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(v2 + 48) + 16);
    return v7();
  }
  return result;
}

uint64_t __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeApp];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_7;
  v3[3] = &unk_264E90768;
  id v4 = *(id *)(a1 + 40);
  [v2 installCACommitCompletionBlock:v3];
}

uint64_t __73__SPUITestingHelper_searchForString_testName_event_queryKind_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setDefaultsForSearchVCWithqueryType:(unint64_t)a3
{
  uint64_t v5 = [(SPUITestingHelper *)self searchViewController];
  [v5 performTestSearchWithQuery:&stru_26F104E28 event:1 queryKind:a3];

  id v6 = [(SPUITestingHelper *)self searchViewController];
  [v6 setInternetOverrideToDisable:0];
}

- (SPUIPPTTypingHelper)typingHelper
{
  return (SPUIPPTTypingHelper *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTypingHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingHelper, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
}

@end