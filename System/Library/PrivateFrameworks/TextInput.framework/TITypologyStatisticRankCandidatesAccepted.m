@interface TITypologyStatisticRankCandidatesAccepted
- (BOOL)isCandidatePrediction:(id)a3;
- (NSDictionary)histogram;
- (TITypologyStatisticRankCandidatesAccepted)init;
- (id)structuredReport;
- (int64_t)lengthOfSelectedCandidates;
- (int64_t)lengthOfSelectedPredictions;
- (unint64_t)rankOfCandidate:(id)a3;
- (void)addLengthOfSelectedCandidate:(id)a3;
- (void)addLengthOfSelectedPrediction:(id)a3;
- (void)countSelectedAutocorrection:(id)a3;
- (void)countSelectedCandidate:(id)a3 withRank:(unint64_t)a4;
- (void)countSelectedInputString;
- (void)countSelectedInputStringToRejectAutocorrection;
- (void)countSelectedPrediction:(id)a3 withRank:(unint64_t)a4;
- (void)rankAndCountSelectedCandidate:(id)a3;
- (void)visitRecordKeyboardInput:(id)a3;
@end

@implementation TITypologyStatisticRankCandidatesAccepted

- (void).cxx_destruct
{
}

- (int64_t)lengthOfSelectedPredictions
{
  return self->_lengthOfSelectedPredictions;
}

- (int64_t)lengthOfSelectedCandidates
{
  return self->_lengthOfSelectedCandidates;
}

- (NSDictionary)histogram
{
  return &self->_histogram->super;
}

- (void)visitRecordKeyboardInput:(id)a3
{
  id v4 = a3;
  v5 = [v4 input];
  id v7 = [v5 acceptedCandidate];

  v6 = [v4 input];

  LODWORD(v4) = [v6 isSynthesizedByAcceptingCandidate];
  if (v4) {
    [(TITypologyStatisticRankCandidatesAccepted *)self rankAndCountSelectedCandidate:v7];
  }
}

- (void)rankAndCountSelectedCandidate:(id)a3
{
  id v14 = a3;
  id v4 = [(TITypologyStatisticCurrentAutocorrections *)self autocorrections];
  if ([v4 shouldAcceptTopCandidate])
  {
    v5 = [(TITypologyStatisticCurrentAutocorrections *)self autocorrections];
    v6 = [v5 candidates];
    id v7 = [v6 firstObject];
  }
  else
  {
    id v7 = 0;
  }

  if ([v14 isAutocorrection])
  {
    if (v7 && [v14 isEqual:v7]) {
      [(TITypologyStatisticRankCandidatesAccepted *)self countSelectedAutocorrection:v14];
    }
    else {
      [(TITypologyStatisticRankCandidatesAccepted *)self countSelectedCandidate:v14 withRank:[(TITypologyStatisticRankCandidatesAccepted *)self rankOfCandidate:v14]];
    }
  }
  else
  {
    v8 = [v14 candidate];
    v9 = [v14 input];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      if (v7
        && ([v14 candidate],
            v11 = objc_claimAutoreleasedReturnValue(),
            [v7 candidate],
            v12 = objc_claimAutoreleasedReturnValue(),
            char v13 = [v11 isEqualToString:v12],
            v12,
            v11,
            (v13 & 1) == 0))
      {
        [(TITypologyStatisticRankCandidatesAccepted *)self countSelectedInputStringToRejectAutocorrection];
      }
      else
      {
        [(TITypologyStatisticRankCandidatesAccepted *)self countSelectedInputString];
      }
    }
  }
}

- (void)countSelectedCandidate:(id)a3 withRank:(unint64_t)a4
{
  id v6 = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = v6;
    id v7 = [(TITypologyStatisticCurrentAutocorrections *)self autocorrections];
    int v8 = [v7 shouldAcceptTopCandidate];

    id v9 = [NSString alloc];
    if (v8) {
      uint64_t v10 = [v9 initWithFormat:@"%@ == %@%lu", @"Candidates Accepted With Rank", @"CA", a4];
    }
    else {
      uint64_t v10 = [v9 initWithFormat:@"%@ == %lu", @"Candidates Accepted With Rank", a4, v15];
    }
    v11 = (void *)v10;
    v12 = NSNumber;
    char v13 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v10];
    id v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue") + 1);
    [(NSMutableDictionary *)self->_histogram setObject:v14 forKeyedSubscript:v11];

    if ([(TITypologyStatisticRankCandidatesAccepted *)self isCandidatePrediction:v16]) {
      [(TITypologyStatisticRankCandidatesAccepted *)self countSelectedPrediction:v16 withRank:a4];
    }
    [(TITypologyStatisticRankCandidatesAccepted *)self addLengthOfSelectedCandidate:v16];

    id v6 = v16;
  }
}

- (void)countSelectedPrediction:(id)a3 withRank:(unint64_t)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v11 = (id)[[v6 alloc] initWithFormat:@"%@ == %@%lu", @"Candidates Accepted With Rank", @"NP", a4];
  int v8 = NSNumber;
  id v9 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v11];
  uint64_t v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerValue") + 1);
  [(NSMutableDictionary *)self->_histogram setObject:v10 forKeyedSubscript:v11];

  [(TITypologyStatisticRankCandidatesAccepted *)self addLengthOfSelectedPrediction:v7];
}

- (BOOL)isCandidatePrediction:(id)a3
{
  id v3 = a3;
  if (isCandidatePrediction__onceToken != -1) {
    dispatch_once(&isCandidatePrediction__onceToken, &__block_literal_global_5291);
  }
  id v4 = [v3 input];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [v3 input];
    uint64_t v7 = [v6 characterAtIndex:v5 - 1];

    char v8 = [(id)isCandidatePrediction__charactersAllowingNextWordPrediction characterIsMember:v7];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

uint64_t __67__TITypologyStatisticRankCandidatesAccepted_isCandidatePrediction___block_invoke()
{
  isCandidatePrediction__charactersAllowingNextWordPrediction = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" \n\t\"(.,?!:;)"];

  return MEMORY[0x1F41817F8]();
}

- (void)countSelectedInputStringToRejectAutocorrection
{
  id v6 = (id)[[NSString alloc] initWithFormat:@"%@ == %@", @"Candidates Accepted With Rank", @"R"];
  id v3 = NSNumber;
  id v4 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v6];
  uint64_t v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "integerValue") + 1);
  [(NSMutableDictionary *)self->_histogram setObject:v5 forKeyedSubscript:v6];
}

- (void)countSelectedInputString
{
  id v6 = (id)[[NSString alloc] initWithFormat:@"%@ == %@", @"Candidates Accepted With Rank", @"I"];
  id v3 = NSNumber;
  id v4 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v6];
  uint64_t v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "integerValue") + 1);
  [(NSMutableDictionary *)self->_histogram setObject:v5 forKeyedSubscript:v6];
}

- (void)countSelectedAutocorrection:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initWithFormat:@"%@ == %@", @"Candidates Accepted With Rank", @"A"];
  id v6 = NSNumber;
  uint64_t v7 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v9];
  char v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
  [(NSMutableDictionary *)self->_histogram setObject:v8 forKeyedSubscript:v9];

  [(TITypologyStatisticRankCandidatesAccepted *)self addLengthOfSelectedCandidate:v5];
}

- (void)addLengthOfSelectedPrediction:(id)a3
{
  id v4 = [a3 candidate];
  self->_lengthOfSelectedPredictions += [v4 length];
}

- (void)addLengthOfSelectedCandidate:(id)a3
{
  id v4 = [a3 candidate];
  self->_lengthOfSelectedCandidates += [v4 length];
}

- (unint64_t)rankOfCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(TITypologyStatisticCurrentAutocorrections *)self autocorrections];
  id v6 = [v5 candidates];

  uint64_t v7 = [(TITypologyStatisticCurrentAutocorrections *)self autocorrections];
  LODWORD(v5) = [v7 shouldAcceptTopCandidate];

  if (v5)
  {
    uint64_t v8 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);

    id v6 = (void *)v8;
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__TITypologyStatisticRankCandidatesAccepted_rankOfCandidate___block_invoke;
  v12[3] = &unk_1E55590A0;
  id v13 = v4;
  id v14 = &v15;
  id v9 = v4;
  [v6 enumerateObjectsUsingBlock:v12];
  unint64_t v10 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __61__TITypologyStatisticRankCandidatesAccepted_rankOfCandidate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:a2];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)structuredReport
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(TITypologyStatisticRankCandidatesAccepted *)self histogram];
  id v4 = (void *)[v3 mutableCopy];

  v9[0] = @"Length Accepted Candidates";
  id v5 = [NSNumber numberWithInteger:self->_lengthOfSelectedCandidates];
  v9[1] = @"Length Accepted Predictions";
  v10[0] = v5;
  id v6 = [NSNumber numberWithInteger:self->_lengthOfSelectedPredictions];
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 addEntriesFromDictionary:v7];

  return v4;
}

- (TITypologyStatisticRankCandidatesAccepted)init
{
  v6.receiver = self;
  v6.super_class = (Class)TITypologyStatisticRankCandidatesAccepted;
  v2 = [(TITypologyStatisticRankCandidatesAccepted *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    histogram = v2->_histogram;
    v2->_histogram = v3;
  }
  return v2;
}

@end