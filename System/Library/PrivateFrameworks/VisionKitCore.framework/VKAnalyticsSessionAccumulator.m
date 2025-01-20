@interface VKAnalyticsSessionAccumulator
- (BOOL)didActivateHighlightAll;
- (BOOL)didActivateRegex;
- (BOOL)didSelectText;
- (BOOL)isPerformingAutomatedTest;
- (NSDate)sessionOpenDate;
- (NSDictionary)coreAnalyticsDictionary;
- (NSMutableArray)ddEvents;
- (NSMutableArray)interactionEvents;
- (NSMutableArray)mrcEvents;
- (NSMutableArray)quickActionEvents;
- (NSMutableArray)subjectEvents;
- (NSMutableArray)textEvents;
- (NSMutableArray)vsEvents;
- (NSString)bundleIdentifier;
- (VKAnalyticsSessionAccumulator)initWithAnalysis:(id)a3 customIdentifier:(id)a4;
- (VKCImageAnalysis)analysis;
- (double)sessionDuration;
- (id)description;
- (unint64_t)averageTextSelectionLength;
- (unint64_t)numberOfDDElements;
- (unint64_t)numberOfDDEvents;
- (unint64_t)numberOfEvents;
- (unint64_t)numberOfMRCElements;
- (unint64_t)numberOfMRCEvents;
- (unint64_t)numberOfQuickActionEvents;
- (unint64_t)numberOfSelectionChanges;
- (unint64_t)numberOfSubjectEvents;
- (unint64_t)numberOfTextEvents;
- (unint64_t)numberOfVSElements;
- (unint64_t)numberOfVSEvents;
- (unint64_t)textLength;
- (void)addEvent:(id)a3;
- (void)calculateAverageSelectedLengthFromTextEvents;
- (void)calculateDidActivateRegex;
- (void)calculateDidHighlightAll;
- (void)close;
- (void)setAnalysis:(id)a3;
- (void)setAverageTextSelectionLength:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDdEvents:(id)a3;
- (void)setDidActivateHighlightAll:(BOOL)a3;
- (void)setDidActivateRegex:(BOOL)a3;
- (void)setDidSelectText:(BOOL)a3;
- (void)setInteractionEvents:(id)a3;
- (void)setIsPerformingAutomatedTest:(BOOL)a3;
- (void)setMrcEvents:(id)a3;
- (void)setNumberOfDDElements:(unint64_t)a3;
- (void)setNumberOfDDEvents:(unint64_t)a3;
- (void)setNumberOfEvents:(unint64_t)a3;
- (void)setNumberOfMRCElements:(unint64_t)a3;
- (void)setNumberOfMRCEvents:(unint64_t)a3;
- (void)setNumberOfQuickActionEvents:(unint64_t)a3;
- (void)setNumberOfSelectionChanges:(unint64_t)a3;
- (void)setNumberOfSubjectEvents:(unint64_t)a3;
- (void)setNumberOfTextEvents:(unint64_t)a3;
- (void)setNumberOfVSElements:(unint64_t)a3;
- (void)setNumberOfVSEvents:(unint64_t)a3;
- (void)setQuickActionEvents:(id)a3;
- (void)setSessionDuration:(double)a3;
- (void)setSessionOpenDate:(id)a3;
- (void)setSubjectEvents:(id)a3;
- (void)setTextEvents:(id)a3;
- (void)setTextLength:(unint64_t)a3;
- (void)setVsEvents:(id)a3;
@end

@implementation VKAnalyticsSessionAccumulator

- (VKAnalyticsSessionAccumulator)initWithAnalysis:(id)a3 customIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VKAnalyticsSessionAccumulator;
  v9 = [(VKAnalyticsSessionAccumulator *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_analysis, a3);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    sessionOpenDate = v10->_sessionOpenDate;
    v10->_sessionOpenDate = (NSDate *)v11;

    if (v8)
    {
      v13 = (NSString *)v8;
      bundleIdentifier = v10->_bundleIdentifier;
      v10->_bundleIdentifier = v13;
    }
    else
    {
      bundleIdentifier = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v15 = [bundleIdentifier bundleIdentifier];
      v16 = v10->_bundleIdentifier;
      v10->_bundleIdentifier = (NSString *)v15;
    }
    v10->_isPerformingAutomatedTest = +[VKCInternalSettings isPerformingAutomatedTest];
  }

  return v10;
}

- (void)addEvent:(id)a3
{
  id v7 = a3;
  switch([v7 type])
  {
    case 2:
      v4 = [(VKAnalyticsSessionAccumulator *)self textEvents];
      uint64_t v5 = [v7 textEvent];
      goto LABEL_9;
    case 3:
      v4 = [(VKAnalyticsSessionAccumulator *)self ddEvents];
      uint64_t v5 = [v7 ddEvent];
      goto LABEL_9;
    case 4:
      v4 = [(VKAnalyticsSessionAccumulator *)self mrcEvents];
      uint64_t v5 = [v7 mrcEvent];
      goto LABEL_9;
    case 5:
      v4 = [(VKAnalyticsSessionAccumulator *)self quickActionEvents];
      uint64_t v5 = [v7 quickActionEvent];
      goto LABEL_9;
    case 6:
      v4 = [(VKAnalyticsSessionAccumulator *)self vsEvents];
      uint64_t v5 = [v7 visualSearchEvent];
      goto LABEL_9;
    case 7:
      v4 = [(VKAnalyticsSessionAccumulator *)self subjectEvents];
      uint64_t v5 = [v7 subjectEvent];
      goto LABEL_9;
    case 8:
      v4 = [(VKAnalyticsSessionAccumulator *)self interactionEvents];
      uint64_t v5 = [v7 interactionEvent];
LABEL_9:
      v6 = (void *)v5;
      [v4 addObject:v5];

      break;
    default:
      break;
  }
}

- (NSMutableArray)interactionEvents
{
  interactionEvents = self->_interactionEvents;
  if (!interactionEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_interactionEvents;
    self->_interactionEvents = v4;

    interactionEvents = self->_interactionEvents;
  }
  return interactionEvents;
}

- (NSMutableArray)textEvents
{
  textEvents = self->_textEvents;
  if (!textEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_textEvents;
    self->_textEvents = v4;

    textEvents = self->_textEvents;
  }
  return textEvents;
}

- (NSMutableArray)quickActionEvents
{
  quickActionEvents = self->_quickActionEvents;
  if (!quickActionEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_quickActionEvents;
    self->_quickActionEvents = v4;

    quickActionEvents = self->_quickActionEvents;
  }
  return quickActionEvents;
}

- (NSMutableArray)mrcEvents
{
  mrcEvents = self->_mrcEvents;
  if (!mrcEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_mrcEvents;
    self->_mrcEvents = v4;

    mrcEvents = self->_mrcEvents;
  }
  return mrcEvents;
}

- (NSMutableArray)ddEvents
{
  ddEvents = self->_ddEvents;
  if (!ddEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_ddEvents;
    self->_ddEvents = v4;

    ddEvents = self->_ddEvents;
  }
  return ddEvents;
}

- (NSMutableArray)vsEvents
{
  vsEvents = self->_vsEvents;
  if (!vsEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_vsEvents;
    self->_vsEvents = v4;

    vsEvents = self->_vsEvents;
  }
  return vsEvents;
}

- (NSMutableArray)subjectEvents
{
  subjectEvents = self->_subjectEvents;
  if (!subjectEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = self->_subjectEvents;
    self->_subjectEvents = v4;

    subjectEvents = self->_subjectEvents;
  }
  return subjectEvents;
}

- (void)close
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  v4 = [(VKAnalyticsSessionAccumulator *)self sessionOpenDate];
  [v3 timeIntervalSinceDate:v4];
  -[VKAnalyticsSessionAccumulator setSessionDuration:](self, "setSessionDuration:");

  uint64_t v5 = [(VKAnalyticsSessionAccumulator *)self analysis];
  id v11 = [v5 imageAnalysisResult];

  [(VKAnalyticsSessionAccumulator *)self setNumberOfDDEvents:[(NSMutableArray *)self->_ddEvents count]];
  [(VKAnalyticsSessionAccumulator *)self setNumberOfVSEvents:[(NSMutableArray *)self->_vsEvents count]];
  [(VKAnalyticsSessionAccumulator *)self setNumberOfTextEvents:[(NSMutableArray *)self->_textEvents count]];
  [(VKAnalyticsSessionAccumulator *)self setNumberOfMRCEvents:[(NSMutableArray *)self->_mrcEvents count]];
  [(VKAnalyticsSessionAccumulator *)self setNumberOfQuickActionEvents:[(NSMutableArray *)self->_quickActionEvents count]];
  [(VKAnalyticsSessionAccumulator *)self setNumberOfSubjectEvents:[(NSMutableArray *)self->_subjectEvents count]];
  v6 = [v11 mrcDataDetectorElements];
  -[VKAnalyticsSessionAccumulator setNumberOfMRCElements:](self, "setNumberOfMRCElements:", [v6 count]);

  id v7 = [v11 visualSearchResult];
  id v8 = [v7 resultItems];
  -[VKAnalyticsSessionAccumulator setNumberOfVSElements:](self, "setNumberOfVSElements:", [v8 count]);

  v9 = [v11 dataDetectors];
  -[VKAnalyticsSessionAccumulator setNumberOfDDElements:](self, "setNumberOfDDElements:", [v9 count]);

  v10 = [v11 text];
  -[VKAnalyticsSessionAccumulator setTextLength:](self, "setTextLength:", [v10 length]);

  [(VKAnalyticsSessionAccumulator *)self calculateAverageSelectedLengthFromTextEvents];
  [(VKAnalyticsSessionAccumulator *)self calculateDidHighlightAll];
  [(VKAnalyticsSessionAccumulator *)self calculateDidActivateRegex];
}

- (void)calculateAverageSelectedLengthFromTextEvents
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(VKAnalyticsSessionAccumulator *)self textEvents];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__VKAnalyticsSessionAccumulator_calculateAverageSelectedLengthFromTextEvents__block_invoke;
  v6[3] = &unk_1E6BF23D8;
  v6[4] = &v11;
  v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  [(VKAnalyticsSessionAccumulator *)self setNumberOfSelectionChanges:v8[3]];
  uint64_t v4 = v8[3];
  if (v4 < 1) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = (unint64_t)(double)(v12[3] / v4);
  }
  [(VKAnalyticsSessionAccumulator *)self setAverageTextSelectionLength:v5];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

void __77__VKAnalyticsSessionAccumulator_calculateAverageSelectedLengthFromTextEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 eventType])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 selectionLength];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (void)calculateDidHighlightAll
{
  id v3 = [(VKAnalyticsSessionAccumulator *)self interactionEvents];
  -[VKAnalyticsSessionAccumulator setDidActivateHighlightAll:](self, "setDidActivateHighlightAll:", objc_msgSend(v3, "vk_containsObjectPassingTest:", &__block_literal_global_13));
}

BOOL __57__VKAnalyticsSessionAccumulator_calculateDidHighlightAll__block_invoke(uint64_t a1, void *a2)
{
  return [a2 eventType] == 0;
}

- (void)calculateDidActivateRegex
{
  id v3 = [(VKAnalyticsSessionAccumulator *)self interactionEvents];
  -[VKAnalyticsSessionAccumulator setDidActivateRegex:](self, "setDidActivateRegex:", objc_msgSend(v3, "vk_containsObjectPassingTest:", &__block_literal_global_85));
}

BOOL __58__VKAnalyticsSessionAccumulator_calculateDidActivateRegex__block_invoke(uint64_t a1, void *a2)
{
  return [a2 eventType] == 3;
}

- (NSDictionary)coreAnalyticsDictionary
{
  v24[17] = *MEMORY[0x1E4F143B8];
  v23[0] = @"numberOfTextEvents";
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfTextEvents](self, "numberOfTextEvents"));
  v24[0] = v22;
  v23[1] = @"numberOfMRCEvents";
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfMRCEvents](self, "numberOfMRCEvents"));
  v24[1] = v21;
  v23[2] = @"numberOfDDEvents";
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfDDEvents](self, "numberOfDDEvents"));
  v24[2] = v20;
  v23[3] = @"numberOfVSEvents";
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfVSEvents](self, "numberOfVSEvents"));
  v24[3] = v19;
  v23[4] = @"numberOfQuickActionEvents";
  objc_super v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfQuickActionEvents](self, "numberOfQuickActionEvents"));
  v24[4] = v18;
  v23[5] = @"numberOfSubjectEvents";
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfSubjectEvents](self, "numberOfSubjectEvents"));
  v24[5] = v17;
  v23[6] = @"numberOfMRCElements";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfMRCElements](self, "numberOfMRCElements"));
  v24[6] = v16;
  v23[7] = @"numberOfDDElements";
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfDDElements](self, "numberOfDDElements"));
  v24[7] = v15;
  v23[8] = @"numberOfVSElements";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfVSElements](self, "numberOfVSElements"));
  v24[8] = v3;
  v23[9] = @"textLength";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator textLength](self, "textLength"));
  v24[9] = v4;
  v23[10] = @"averageTextSelectionLength";
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator averageTextSelectionLength](self, "averageTextSelectionLength"));
  v24[10] = v5;
  v23[11] = @"numberOfSelectionChanges";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfSelectionChanges](self, "numberOfSelectionChanges"));
  v24[11] = v6;
  v23[12] = @"didActivateHighlightAll";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsSessionAccumulator didActivateHighlightAll](self, "didActivateHighlightAll"));
  v24[12] = v7;
  v23[13] = @"didActivateRegexHighlight";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsSessionAccumulator didActivateRegex](self, "didActivateRegex"));
  v24[13] = v8;
  v23[14] = @"sessionDuration";
  uint64_t v9 = NSNumber;
  [(VKAnalyticsSessionAccumulator *)self sessionDuration];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  v24[14] = v10;
  v23[15] = @"automatedTest";
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsSessionAccumulator isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v24[15] = v11;
  v23[16] = @"bundleIdentifier";
  v12 = [(VKAnalyticsSessionAccumulator *)self bundleIdentifier];
  v24[16] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:17];

  return (NSDictionary *)v13;
}

- (id)description
{
  v24 = NSString;
  v25.receiver = self;
  v25.super_class = (Class)VKAnalyticsSessionAccumulator;
  v23 = [(VKAnalyticsSessionAccumulator *)&v25 description];
  [(VKAnalyticsSessionAccumulator *)self sessionDuration];
  uint64_t v4 = v3;
  unint64_t v22 = [(VKAnalyticsSessionAccumulator *)self numberOfTextEvents];
  unint64_t v21 = [(VKAnalyticsSessionAccumulator *)self numberOfMRCEvents];
  unint64_t v20 = [(VKAnalyticsSessionAccumulator *)self numberOfDDEvents];
  unint64_t v19 = [(VKAnalyticsSessionAccumulator *)self numberOfVSEvents];
  unint64_t v18 = [(VKAnalyticsSessionAccumulator *)self numberOfQuickActionEvents];
  unint64_t v17 = [(VKAnalyticsSessionAccumulator *)self numberOfSubjectEvents];
  unint64_t v5 = [(VKAnalyticsSessionAccumulator *)self numberOfMRCElements];
  unint64_t v6 = [(VKAnalyticsSessionAccumulator *)self numberOfDDElements];
  unint64_t v7 = [(VKAnalyticsSessionAccumulator *)self numberOfVSElements];
  unint64_t v8 = [(VKAnalyticsSessionAccumulator *)self textLength];
  unint64_t v9 = [(VKAnalyticsSessionAccumulator *)self averageTextSelectionLength];
  unint64_t v10 = [(VKAnalyticsSessionAccumulator *)self numberOfSelectionChanges];
  uint64_t v11 = VKMUIStringForBool([(VKAnalyticsSessionAccumulator *)self didActivateHighlightAll]);
  v12 = VKMUIStringForBool([(VKAnalyticsSessionAccumulator *)self didActivateRegex]);
  uint64_t v13 = VKMUIStringForBool([(VKAnalyticsSessionAccumulator *)self isPerformingAutomatedTest]);
  uint64_t v14 = [(VKAnalyticsSessionAccumulator *)self bundleIdentifier];
  objc_msgSend(v24, "stringWithFormat:", @"%@ \n sessionDuration: %f seconds\n numberOfTextEvents: %lu \n numberOfMRCEvents: %lu \n numberOfDDEvents: %lu \n numberOfVSEvents: %lu \n numberOfQuickActionEvents: %lu \n numberOfSubjectEvents: %lu \n numberOfMRCElements: %lu \n numberOfDDElements: %lu \n numberOfVSElements: %lu \n textLength: %lu \n averageTextSelectionLength: %lu \n numberOfSelectionChanges: %lu \n didActivateHighlightAll: %@ \n didActivateRegexHighlight: %@ \n automatedTest: %@ \n bundleIdentifier: %@ \n ", v23, v4, v22, v21, v20, v19, v18, v17, v5, v6, v7, v8, v9, v10, v11, v12,
    v13,
  uint64_t v15 = v14);

  return v15;
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (void)setAnalysis:(id)a3
{
}

- (void)setInteractionEvents:(id)a3
{
}

- (void)setTextEvents:(id)a3
{
}

- (void)setQuickActionEvents:(id)a3
{
}

- (void)setMrcEvents:(id)a3
{
}

- (void)setDdEvents:(id)a3
{
}

- (void)setVsEvents:(id)a3
{
}

- (void)setSubjectEvents:(id)a3
{
}

- (NSDate)sessionOpenDate
{
  return self->_sessionOpenDate;
}

- (void)setSessionOpenDate:(id)a3
{
}

- (BOOL)didSelectText
{
  return self->_didSelectText;
}

- (void)setDidSelectText:(BOOL)a3
{
  self->_didSelectText = a3;
}

- (unint64_t)numberOfEvents
{
  return self->_numberOfEvents;
}

- (void)setNumberOfEvents:(unint64_t)a3
{
  self->_numberOfEvents = a3;
}

- (unint64_t)numberOfTextEvents
{
  return self->_numberOfTextEvents;
}

- (void)setNumberOfTextEvents:(unint64_t)a3
{
  self->_numberOfTextEvents = a3;
}

- (unint64_t)numberOfMRCEvents
{
  return self->_numberOfMRCEvents;
}

- (void)setNumberOfMRCEvents:(unint64_t)a3
{
  self->_numberOfMRCEvents = a3;
}

- (unint64_t)numberOfDDEvents
{
  return self->_numberOfDDEvents;
}

- (void)setNumberOfDDEvents:(unint64_t)a3
{
  self->_numberOfDDEvents = a3;
}

- (unint64_t)numberOfVSEvents
{
  return self->_numberOfVSEvents;
}

- (void)setNumberOfVSEvents:(unint64_t)a3
{
  self->_numberOfVSEvents = a3;
}

- (unint64_t)numberOfQuickActionEvents
{
  return self->_numberOfQuickActionEvents;
}

- (void)setNumberOfQuickActionEvents:(unint64_t)a3
{
  self->_numberOfQuickActionEvents = a3;
}

- (unint64_t)numberOfSubjectEvents
{
  return self->_numberOfSubjectEvents;
}

- (void)setNumberOfSubjectEvents:(unint64_t)a3
{
  self->_numberOfSubjectEvents = a3;
}

- (unint64_t)numberOfMRCElements
{
  return self->_numberOfMRCElements;
}

- (void)setNumberOfMRCElements:(unint64_t)a3
{
  self->_numberOfMRCElements = a3;
}

- (unint64_t)numberOfDDElements
{
  return self->_numberOfDDElements;
}

- (void)setNumberOfDDElements:(unint64_t)a3
{
  self->_numberOfDDElements = a3;
}

- (unint64_t)numberOfVSElements
{
  return self->_numberOfVSElements;
}

- (void)setNumberOfVSElements:(unint64_t)a3
{
  self->_numberOfVSElements = a3;
}

- (unint64_t)textLength
{
  return self->_textLength;
}

- (void)setTextLength:(unint64_t)a3
{
  self->_textLength = a3;
}

- (unint64_t)averageTextSelectionLength
{
  return self->_averageTextSelectionLength;
}

- (void)setAverageTextSelectionLength:(unint64_t)a3
{
  self->_averageTextSelectionLength = a3;
}

- (unint64_t)numberOfSelectionChanges
{
  return self->_numberOfSelectionChanges;
}

- (void)setNumberOfSelectionChanges:(unint64_t)a3
{
  self->_numberOfSelectionChanges = a3;
}

- (BOOL)didActivateHighlightAll
{
  return self->_didActivateHighlightAll;
}

- (void)setDidActivateHighlightAll:(BOOL)a3
{
  self->_didActivateHighlightAll = a3;
}

- (BOOL)didActivateRegex
{
  return self->_didActivateRegex;
}

- (void)setDidActivateRegex:(BOOL)a3
{
  self->_didActivateRegex = a3;
}

- (double)sessionDuration
{
  return self->_sessionDuration;
}

- (void)setSessionDuration:(double)a3
{
  self->_sessionDuration = a3;
}

- (BOOL)isPerformingAutomatedTest
{
  return self->_isPerformingAutomatedTest;
}

- (void)setIsPerformingAutomatedTest:(BOOL)a3
{
  self->_isPerformingAutomatedTest = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionOpenDate, 0);
  objc_storeStrong((id *)&self->_subjectEvents, 0);
  objc_storeStrong((id *)&self->_vsEvents, 0);
  objc_storeStrong((id *)&self->_ddEvents, 0);
  objc_storeStrong((id *)&self->_mrcEvents, 0);
  objc_storeStrong((id *)&self->_quickActionEvents, 0);
  objc_storeStrong((id *)&self->_textEvents, 0);
  objc_storeStrong((id *)&self->_interactionEvents, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
}

@end