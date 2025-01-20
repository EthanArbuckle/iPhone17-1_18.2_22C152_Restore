@interface SiriSharedUIUserUtteranceEditingDataManager
- (AFUserUtterance)userUtterance;
- (BOOL)isEditedTextSameAsUtterance:(id)a3;
- (SiriSharedUIUserUtteranceEditingDataManager)initWithUserUtterance:(id)a3 backingAceObjectRefId:(id)a4;
- (id)attributedStringAtIndex:(int64_t)a3;
- (id)selectionResultsForAlternateTextAtIndex:(int64_t)a3;
- (id)selectionResultsForEditedText:(id)a3;
- (int64_t)numberOfAlternativeUtterances;
- (void)_createAlternativeDisplayStringsAndMap;
- (void)_updateSelectionResults:(id)a3 interactionId:(id)a4;
@end

@implementation SiriSharedUIUserUtteranceEditingDataManager

- (SiriSharedUIUserUtteranceEditingDataManager)initWithUserUtterance:(id)a3 backingAceObjectRefId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUIUserUtteranceEditingDataManager;
  v9 = [(SiriSharedUIUserUtteranceEditingDataManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userUtterance, a3);
    objc_storeStrong((id *)&v10->_refId, a4);
    [(SiriSharedUIUserUtteranceEditingDataManager *)v10 _createAlternativeDisplayStringsAndMap];
  }

  return v10;
}

- (void)_createAlternativeDisplayStringsAndMap
{
  v76[1] = *MEMORY[0x263EF8340];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  userSelectionResultsMap = self->_userSelectionResultsMap;
  self->_userSelectionResultsMap = v3;

  uint64_t v75 = *MEMORY[0x263F81500];
  uint64_t v5 = v75;
  v6 = [MEMORY[0x263F825C8] labelColor];
  v76[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v76 forKeys:&v75 count:1];

  uint64_t v73 = v5;
  id v8 = self;
  v9 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v74 = v9;
  v50 = [NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];

  v10 = [(AFUserUtterance *)self->_userUtterance allRecognitionStringsAndScores];
  v11 = [v10 keysSortedByValueUsingComparator:&__block_literal_global_0];
  v53 = [MEMORY[0x263EFF980] array];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v62;
    uint64_t v54 = *MEMORY[0x263F283C8];
    uint64_t v47 = *MEMORY[0x263F283C0];
    uint64_t v46 = *MEMORY[0x263F283D0];
    uint64_t v44 = *MEMORY[0x263F65AE8];
    uint64_t v45 = *MEMORY[0x263F65AF0];
    *(void *)&long long v13 = 136315650;
    long long v43 = v13;
    uint64_t v48 = *(void *)v62;
    v49 = v10;
    do
    {
      uint64_t v16 = 0;
      uint64_t v51 = v14;
      do
      {
        if (*(void *)v62 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v61 + 1) + 8 * v16);
        v18 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v66 = "-[SiriSharedUIUserUtteranceEditingDataManager _createAlternativeDisplayStringsAndMap]";
          __int16 v67 = 2112;
          v68 = v17;
          _os_log_impl(&dword_20C9D5000, v18, OS_LOG_TYPE_DEFAULT, "%s #compact: filtering alternative:%@", buf, 0x16u);
        }
        char v19 = objc_msgSend(MEMORY[0x263F75508], "string:isSameAsUserUtterance:", v17, v8->_userUtterance, v43);
        v20 = [v10 objectForKey:v17];
        uint64_t v21 = [v20 objectForKey:v54];
        v22 = (void *)v21;
        if ((v19 & 1) == 0 && v21)
        {
          v56 = [v20 objectForKey:v47];
          v55 = [v20 objectForKey:v46];
          v23 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v17 attributes:v50];
          v24 = v8;
          v25 = -[AFUserUtterance rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:](v8->_userUtterance, "rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:", [v22 integerValue], 0);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v57 objects:v71 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v58;
            do
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v58 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = [*(id *)(*((void *)&v57 + 1) + 8 * i) rangeValue];
                objc_msgSend(v23, "setAttributes:range:", v7, v30, v31);
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v57 objects:v71 count:16];
            }
            while (v27);
          }
          [(NSArray *)v53 addObject:v23];
          v32 = (void *)*MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
          {
            v33 = NSNumber;
            v34 = v32;
            v35 = objc_msgSend(v33, "numberWithUnsignedInteger:", -[NSArray count](v53, "count") - 1);
            *(_DWORD *)buf = v43;
            v66 = "-[SiriSharedUIUserUtteranceEditingDataManager _createAlternativeDisplayStringsAndMap]";
            __int16 v67 = 2112;
            v68 = v23;
            __int16 v69 = 2112;
            v70 = v35;
            _os_log_impl(&dword_20C9D5000, v34, OS_LOG_TYPE_DEFAULT, "%s #compact: added utteranceToDisplay: %@ atIndex:%@", buf, 0x20u);
          }
          id v36 = objc_alloc_init(MEMORY[0x263F286D0]);
          [v36 setOriginalRank:v22];
          [v36 setOriginalScore:v56];
          uint64_t v37 = [v55 integerValue];
          uint64_t v38 = v45;
          if (v37 == 2)
          {
            v24->_clientAlternativePresented = 1;
            uint64_t v38 = v44;
          }
          [v36 setUtteranceSource:v38];
          v39 = [(AFUserUtterance *)v24->_userUtterance bestTextInterpretation];
          [v36 setPreviousUtterance:v39];

          v40 = v24->_userSelectionResultsMap;
          v41 = [v23 string];
          [(NSMutableDictionary *)v40 setValue:v36 forKey:v41];

          id v8 = v24;
          uint64_t v15 = v48;
          v10 = v49;
          uint64_t v14 = v51;
        }

        ++v16;
      }
      while (v16 != v14);
      uint64_t v14 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v14);
  }

  alternativeDisplayStrings = v8->_alternativeDisplayStrings;
  v8->_alternativeDisplayStrings = v53;
}

uint64_t __85__SiriSharedUIUserUtteranceEditingDataManager__createAlternativeDisplayStringsAndMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x263F283C8];
  id v5 = a3;
  v6 = [a2 objectForKey:v4];
  uint64_t v7 = [v6 integerValue];

  id v8 = [v5 objectForKey:v4];

  uint64_t v9 = [v8 integerValue];
  if (v7 < v9) {
    return -1;
  }
  else {
    return v7 > v9;
  }
}

- (id)selectionResultsForAlternateTextAtIndex:(int64_t)a3
{
  if ([(NSArray *)self->_alternativeDisplayStrings count] <= a3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_alternativeDisplayStrings objectAtIndex:a3];
    v6 = [v5 string];

    uint64_t v7 = [(NSMutableDictionary *)self->_userSelectionResultsMap objectForKey:v6];
    [(SiriSharedUIUserUtteranceEditingDataManager *)self _updateSelectionResults:v7 interactionId:self->_refId];
    id v8 = [NSNumber numberWithBool:self->_clientAlternativePresented];
    [v7 setOnDeviceUtterancesPresent:v8];
  }
  return v7;
}

- (id)selectionResultsForEditedText:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F286D0]);
  [(SiriSharedUIUserUtteranceEditingDataManager *)self _updateSelectionResults:v4 interactionId:self->_refId];
  [v4 setUtteranceSource:*MEMORY[0x263F65AF8]];
  return v4;
}

- (void)_updateSelectionResults:(id)a3 interactionId:(id)a4
{
}

- (id)attributedStringAtIndex:(int64_t)a3
{
  if ([(NSArray *)self->_alternativeDisplayStrings count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_alternativeDisplayStrings objectAtIndex:a3];
  }
  return v5;
}

- (int64_t)numberOfAlternativeUtterances
{
  return [(NSArray *)self->_alternativeDisplayStrings count];
}

- (BOOL)isEditedTextSameAsUtterance:(id)a3
{
  return [MEMORY[0x263F75508] string:a3 isSameAsUserUtterance:self->_userUtterance];
}

- (AFUserUtterance)userUtterance
{
  return self->_userUtterance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_userSelectionResultsMap, 0);
  objc_storeStrong((id *)&self->_alternativeDisplayStrings, 0);
  objc_storeStrong((id *)&self->_refId, 0);
}

@end