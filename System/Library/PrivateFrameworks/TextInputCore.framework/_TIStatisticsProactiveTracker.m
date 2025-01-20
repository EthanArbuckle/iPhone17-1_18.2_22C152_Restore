@interface _TIStatisticsProactiveTracker
+ (id)sharedInstance;
- (PETDistributionEventTracker)timeInPredictionBarCategoryEventTracker;
- (PETDistributionEventTracker)timeInPredictionBarEventTracker;
- (PETScalarEventTracker)engagementCategoryEventDescriptionTracker;
- (PETScalarEventTracker)engagementEventDescriptionTracker;
- (PETScalarEventTracker)failureCategoryEventDescriptionTracker;
- (PETScalarEventTracker)failureCategoryEventTracker;
- (PETScalarEventTracker)failureEventDescriptionTracker;
- (PETScalarEventTracker)failureEventTracker;
- (PETScalarEventTracker)personalizationEngagementTracker;
- (PETScalarEventTracker)personalizationOfferTracker;
- (PETScalarEventTracker)personalizationWordAcceptanceTracker;
- (PETScalarEventTracker)selectedCategoryEventTracker;
- (PETScalarEventTracker)selectedEventTracker;
- (PETScalarEventTracker)suggestedCategoryEventTracker;
- (PETScalarEventTracker)suggestedEventTracker;
- (PETScalarEventTracker)triggeredCategoryEventTracker;
- (PETScalarEventTracker)triggeredEventTracker;
- (TIAutocorrectionList)lastAutocorrectionList;
- (TIKeyboardCandidate)responseKitEntryOffered;
- (_TIStatisticsProactiveTracker)init;
- (void)setEngagementCategoryEventDescriptionTracker:(id)a3;
- (void)setEngagementEventDescriptionTracker:(id)a3;
- (void)setFailureCategoryEventDescriptionTracker:(id)a3;
- (void)setFailureCategoryEventTracker:(id)a3;
- (void)setFailureEventDescriptionTracker:(id)a3;
- (void)setFailureEventTracker:(id)a3;
- (void)setLastAutocorrectionList:(id)a3;
- (void)setPersonalizationEngagementTracker:(id)a3;
- (void)setPersonalizationOfferTracker:(id)a3;
- (void)setPersonalizationWordAcceptanceTracker:(id)a3;
- (void)setResponseKitEntryOffered:(id)a3;
- (void)setSelectedCategoryEventTracker:(id)a3;
- (void)setSelectedEventTracker:(id)a3;
- (void)setSuggestedCategoryEventTracker:(id)a3;
- (void)setSuggestedEventTracker:(id)a3;
- (void)setTimeInPredictionBarCategoryEventTracker:(id)a3;
- (void)setTimeInPredictionBarEventTracker:(id)a3;
- (void)setTriggeredCategoryEventTracker:(id)a3;
- (void)setTriggeredEventTracker:(id)a3;
- (void)trackEngagementFailureWithDescription:(unsigned __int8)a3 description:(id)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7;
- (void)trackFailureWithDescription:(unsigned __int8)a3 description:(id)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7;
- (void)trackFailureWithSource:(unsigned __int8)a3 reason:(unsigned __int8)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7;
- (void)trackPredictionTimeWithSource:(unsigned __int8)a3 time:(double)a4 selected:(BOOL)a5 categories:(id)a6 locale:(id)a7 fieldType:(id)a8;
- (void)trackSelectedWithSource:(unsigned __int8)a3 position:(unint64_t)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7;
- (void)trackSuggestedWithSource:(unsigned __int8)a3 count:(unint64_t)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7;
- (void)trackTriggeredWithSource:(unsigned __int8)a3 categories:(id)a4 locale:(id)a5 fieldType:(id)a6;
@end

@implementation _TIStatisticsProactiveTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseKitEntryOffered, 0);
  objc_storeStrong((id *)&self->_lastAutocorrectionList, 0);
  objc_storeStrong((id *)&self->_personalizationEngagementTracker, 0);
  objc_storeStrong((id *)&self->_personalizationOfferTracker, 0);
  objc_storeStrong((id *)&self->_personalizationWordAcceptanceTracker, 0);
  objc_storeStrong((id *)&self->_engagementCategoryEventDescriptionTracker, 0);
  objc_storeStrong((id *)&self->_engagementEventDescriptionTracker, 0);
  objc_storeStrong((id *)&self->_timeInPredictionBarCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_timeInPredictionBarEventTracker, 0);
  objc_storeStrong((id *)&self->_selectedCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_selectedEventTracker, 0);
  objc_storeStrong((id *)&self->_failureCategoryEventDescriptionTracker, 0);
  objc_storeStrong((id *)&self->_failureCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_failureEventTracker, 0);
  objc_storeStrong((id *)&self->_suggestedCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_suggestedEventTracker, 0);
  objc_storeStrong((id *)&self->_triggeredCategoryEventTracker, 0);
  objc_storeStrong((id *)&self->_triggeredEventTracker, 0);

  objc_storeStrong((id *)&self->_failureEventDescriptionTracker, 0);
}

- (void)setResponseKitEntryOffered:(id)a3
{
}

- (TIKeyboardCandidate)responseKitEntryOffered
{
  return self->_responseKitEntryOffered;
}

- (void)setLastAutocorrectionList:(id)a3
{
}

- (TIAutocorrectionList)lastAutocorrectionList
{
  return self->_lastAutocorrectionList;
}

- (void)setPersonalizationEngagementTracker:(id)a3
{
}

- (PETScalarEventTracker)personalizationEngagementTracker
{
  return self->_personalizationEngagementTracker;
}

- (void)setPersonalizationOfferTracker:(id)a3
{
}

- (PETScalarEventTracker)personalizationOfferTracker
{
  return self->_personalizationOfferTracker;
}

- (void)setPersonalizationWordAcceptanceTracker:(id)a3
{
}

- (PETScalarEventTracker)personalizationWordAcceptanceTracker
{
  return self->_personalizationWordAcceptanceTracker;
}

- (void)setEngagementCategoryEventDescriptionTracker:(id)a3
{
}

- (PETScalarEventTracker)engagementCategoryEventDescriptionTracker
{
  return self->_engagementCategoryEventDescriptionTracker;
}

- (void)setEngagementEventDescriptionTracker:(id)a3
{
}

- (PETScalarEventTracker)engagementEventDescriptionTracker
{
  return self->_engagementEventDescriptionTracker;
}

- (void)setTimeInPredictionBarCategoryEventTracker:(id)a3
{
}

- (PETDistributionEventTracker)timeInPredictionBarCategoryEventTracker
{
  return self->_timeInPredictionBarCategoryEventTracker;
}

- (void)setTimeInPredictionBarEventTracker:(id)a3
{
}

- (PETDistributionEventTracker)timeInPredictionBarEventTracker
{
  return self->_timeInPredictionBarEventTracker;
}

- (void)setSelectedCategoryEventTracker:(id)a3
{
}

- (PETScalarEventTracker)selectedCategoryEventTracker
{
  return self->_selectedCategoryEventTracker;
}

- (void)setSelectedEventTracker:(id)a3
{
}

- (PETScalarEventTracker)selectedEventTracker
{
  return self->_selectedEventTracker;
}

- (void)setFailureCategoryEventDescriptionTracker:(id)a3
{
}

- (PETScalarEventTracker)failureCategoryEventDescriptionTracker
{
  return self->_failureCategoryEventDescriptionTracker;
}

- (void)setFailureCategoryEventTracker:(id)a3
{
}

- (PETScalarEventTracker)failureCategoryEventTracker
{
  return self->_failureCategoryEventTracker;
}

- (void)setFailureEventTracker:(id)a3
{
}

- (PETScalarEventTracker)failureEventTracker
{
  return self->_failureEventTracker;
}

- (void)setSuggestedCategoryEventTracker:(id)a3
{
}

- (PETScalarEventTracker)suggestedCategoryEventTracker
{
  return self->_suggestedCategoryEventTracker;
}

- (void)setSuggestedEventTracker:(id)a3
{
}

- (PETScalarEventTracker)suggestedEventTracker
{
  return self->_suggestedEventTracker;
}

- (void)setTriggeredCategoryEventTracker:(id)a3
{
}

- (PETScalarEventTracker)triggeredCategoryEventTracker
{
  return self->_triggeredCategoryEventTracker;
}

- (void)setTriggeredEventTracker:(id)a3
{
}

- (PETScalarEventTracker)triggeredEventTracker
{
  return self->_triggeredEventTracker;
}

- (void)setFailureEventDescriptionTracker:(id)a3
{
}

- (PETScalarEventTracker)failureEventDescriptionTracker
{
  return self->_failureEventDescriptionTracker;
}

- (void)trackEngagementFailureWithDescription:(unsigned __int8)a3 description:(id)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v10 = a3;
  v39[4] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = self;
  engagementEventDescriptionTracker = self->_engagementEventDescriptionTracker;
  uint64_t v18 = v10;
  v19 = [NSNumber numberWithUnsignedChar:v10];
  v39[0] = v19;
  v39[1] = v12;
  v32 = v12;
  v20 = v14;
  v39[2] = v14;
  v39[3] = v15;
  v21 = v15;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  [(PETScalarEventTracker *)engagementEventDescriptionTracker trackEventWithPropertyValues:v22];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v13;
  uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * v26);
        engagementCategoryEventDescriptionTracker = v16->_engagementCategoryEventDescriptionTracker;
        v29 = [NSNumber numberWithUnsignedChar:v18];
        v37[0] = v29;
        v37[1] = v32;
        v37[2] = v27;
        v37[3] = v20;
        v37[4] = v21;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
        [(PETScalarEventTracker *)engagementCategoryEventDescriptionTracker trackEventWithPropertyValues:v30];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v24);
  }
}

- (void)trackPredictionTimeWithSource:(unsigned __int8)a3 time:(double)a4 selected:(BOOL)a5 categories:(id)a6 locale:(id)a7 fieldType:(id)a8
{
  BOOL v10 = a5;
  uint64_t v12 = a3;
  v42[4] = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = [NSNumber numberWithBool:v10];
  uint64_t v18 = [v17 stringValue];

  v19 = self;
  timeInPredictionBarEventTracker = self->_timeInPredictionBarEventTracker;
  uint64_t v21 = v12;
  v22 = [NSNumber numberWithUnsignedChar:v12];
  v42[0] = v22;
  v42[1] = v18;
  uint64_t v23 = (void *)v18;
  long long v35 = v15;
  v42[2] = v15;
  v42[3] = v16;
  uint64_t v24 = v16;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  [(PETDistributionEventTracker *)timeInPredictionBarEventTracker trackEventWithPropertyValues:v25 value:a4];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v14;
  uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v37;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * v29);
        timeInPredictionBarCategoryEventTracker = v19->_timeInPredictionBarCategoryEventTracker;
        v32 = [NSNumber numberWithUnsignedChar:v21];
        v40[0] = v32;
        v40[1] = v23;
        v40[2] = v30;
        v40[3] = v35;
        v40[4] = v24;
        long long v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];
        [(PETDistributionEventTracker *)timeInPredictionBarCategoryEventTracker trackEventWithPropertyValues:v33 value:a4];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v27);
  }
}

- (void)trackSelectedWithSource:(unsigned __int8)a3 position:(unint64_t)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v10 = a3;
  v42[4] = *MEMORY[0x1E4F143B8];
  id obja = a5;
  id v12 = a6;
  id v13 = a7;
  long long v34 = self;
  selectedEventTracker = self->_selectedEventTracker;
  unsigned int v33 = v10;
  id v15 = [NSNumber numberWithUnsignedChar:v10];
  v42[0] = v15;
  unint64_t v16 = a4;
  v17 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v18 = [v17 stringValue];
  v42[1] = v18;
  v42[2] = v12;
  long long v35 = v12;
  v19 = v13;
  v42[3] = v13;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  [(PETScalarEventTracker *)selectedEventTracker trackEventWithPropertyValues:v20];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = obja;
  uint64_t v21 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * v24);
        selectedCategoryEventTracker = v34->_selectedCategoryEventTracker;
        uint64_t v27 = [NSNumber numberWithUnsignedChar:v33];
        v40[0] = v27;
        uint64_t v28 = [NSNumber numberWithUnsignedInteger:v16];
        uint64_t v29 = [v28 stringValue];
        v40[1] = v29;
        v40[2] = v25;
        v40[3] = v35;
        v40[4] = v19;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];
        [(PETScalarEventTracker *)selectedCategoryEventTracker trackEventWithPropertyValues:v30];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)trackFailureWithSource:(unsigned __int8)a3 reason:(unsigned __int8)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  v40[4] = *MEMORY[0x1E4F143B8];
  id obja = a5;
  id v12 = a6;
  id v13 = a7;
  unsigned int v33 = self;
  failureEventTracker = self->_failureEventTracker;
  unsigned int v32 = v10;
  id v15 = [NSNumber numberWithUnsignedChar:v10];
  v40[0] = v15;
  uint64_t v16 = v9;
  v17 = [NSNumber numberWithUnsignedChar:v9];
  v40[1] = v17;
  v40[2] = v12;
  uint64_t v18 = v12;
  v19 = v13;
  v40[3] = v13;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  [(PETScalarEventTracker *)failureEventTracker trackEventWithPropertyValues:v20];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = obja;
  uint64_t v21 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * v24);
        failureCategoryEventTracker = v33->_failureCategoryEventTracker;
        uint64_t v27 = [NSNumber numberWithUnsignedChar:v32];
        v38[0] = v27;
        uint64_t v28 = [NSNumber numberWithUnsignedChar:v16];
        v38[1] = v28;
        v38[2] = v25;
        v38[3] = v18;
        v38[4] = v19;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:5];
        [(PETScalarEventTracker *)failureCategoryEventTracker trackEventWithPropertyValues:v29];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v22);
  }
}

- (void)trackSuggestedWithSource:(unsigned __int8)a3 count:(unint64_t)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v10 = a3;
  v42[4] = *MEMORY[0x1E4F143B8];
  id obja = a5;
  id v12 = a6;
  id v13 = a7;
  long long v34 = self;
  suggestedEventTracker = self->_suggestedEventTracker;
  unsigned int v33 = v10;
  id v15 = [NSNumber numberWithUnsignedChar:v10];
  v42[0] = v15;
  unint64_t v16 = a4;
  v17 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v18 = [v17 stringValue];
  v42[1] = v18;
  v42[2] = v12;
  long long v35 = v12;
  v19 = v13;
  v42[3] = v13;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  [(PETScalarEventTracker *)suggestedEventTracker trackEventWithPropertyValues:v20];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = obja;
  uint64_t v21 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * v24);
        suggestedCategoryEventTracker = v34->_suggestedCategoryEventTracker;
        uint64_t v27 = [NSNumber numberWithUnsignedChar:v33];
        v40[0] = v27;
        uint64_t v28 = [NSNumber numberWithUnsignedInteger:v16];
        uint64_t v29 = [v28 stringValue];
        v40[1] = v29;
        v40[2] = v25;
        v40[3] = v35;
        v40[4] = v19;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];
        [(PETScalarEventTracker *)suggestedCategoryEventTracker trackEventWithPropertyValues:v30];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)trackFailureWithDescription:(unsigned __int8)a3 description:(id)a4 categories:(id)a5 locale:(id)a6 fieldType:(id)a7
{
  uint64_t v10 = a3;
  v39[4] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = self;
  failureEventDescriptionTracker = self->_failureEventDescriptionTracker;
  uint64_t v18 = v10;
  v19 = [NSNumber numberWithUnsignedChar:v10];
  v39[0] = v19;
  v39[1] = v12;
  unsigned int v32 = v12;
  v20 = v14;
  v39[2] = v14;
  v39[3] = v15;
  uint64_t v21 = v15;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  [(PETScalarEventTracker *)failureEventDescriptionTracker trackEventWithPropertyValues:v22];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v13;
  uint64_t v23 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * v26);
        failureCategoryEventDescriptionTracker = v16->_failureCategoryEventDescriptionTracker;
        uint64_t v29 = [NSNumber numberWithUnsignedChar:v18];
        v37[0] = v29;
        v37[1] = v32;
        v37[2] = v27;
        v37[3] = v20;
        v37[4] = v21;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
        [(PETScalarEventTracker *)failureCategoryEventDescriptionTracker trackEventWithPropertyValues:v30];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v24);
  }
}

- (void)trackTriggeredWithSource:(unsigned __int8)a3 categories:(id)a4 locale:(id)a5 fieldType:(id)a6
{
  uint64_t v8 = a3;
  v31[3] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  triggeredEventTracker = self->_triggeredEventTracker;
  id v14 = [NSNumber numberWithUnsignedChar:v8];
  v31[0] = v14;
  v31[1] = v11;
  v31[2] = v12;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  [(PETScalarEventTracker *)triggeredEventTracker trackEventWithPropertyValues:v15];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v10;
  uint64_t v16 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * v19);
        triggeredCategoryEventTracker = self->_triggeredCategoryEventTracker;
        uint64_t v22 = [NSNumber numberWithUnsignedChar:v8];
        v29[0] = v22;
        v29[1] = v20;
        v29[2] = v11;
        v29[3] = v12;
        uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
        [(PETScalarEventTracker *)triggeredCategoryEventTracker trackEventWithPropertyValues:v23];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v17);
  }
}

- (_TIStatisticsProactiveTracker)init
{
  v106[3] = *MEMORY[0x1E4F143B8];
  v88.receiver = self;
  v88.super_class = (Class)_TIStatisticsProactiveTracker;
  v2 = [(_TIStatisticsProactiveTracker *)&v88 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93720];
    v105[0] = &unk_1F3FA7A78;
    v105[1] = &unk_1F3FA7A90;
    v106[0] = @"LanguageModeling";
    v106[1] = @"ResponseKit";
    v105[2] = &unk_1F3FA7AA8;
    v106[2] = @"TaggedTextField";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:3];
    v5 = [v3 propertyWithName:@"source" enumMapping:v4];

    v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"locale"];
    v7 = TIStatisticsCategoryToLegacyCategoryDictionary();
    v82 = [v7 allKeys];

    uint64_t v8 = TIStatisticsDescriptionToLegacyDescriptionDictionary();
    v81 = [v8 allKeys];

    uint64_t v9 = TIStatisticsEngagementDescriptionToLegacyDescriptionDictionary();
    v80 = [v9 allKeys];

    v83 = [MEMORY[0x1E4F93720] propertyWithName:@"category" possibleValues:v82];
    v84 = [MEMORY[0x1E4F93720] propertyWithName:@"count" possibleValues:&unk_1F3FA7718];
    id v10 = (void *)MEMORY[0x1E4F93720];
    v103[0] = &unk_1F3FA7A90;
    v103[1] = &unk_1F3FA7AA8;
    v104[0] = @"NoResult";
    v104[1] = @"Error";
    v103[2] = &unk_1F3FA7AC0;
    v104[2] = @"Timeout";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:3];
    v85 = [v10 propertyWithName:@"reason" enumMapping:v11];

    id v12 = [MEMORY[0x1E4F93720] propertyWithName:@"description" possibleValues:v81];
    v87 = [MEMORY[0x1E4F93720] propertyWithName:@"description" possibleValues:v80];
    v86 = [MEMORY[0x1E4F93720] propertyWithName:@"position" possibleValues:&unk_1F3FA7730];
    v79 = [MEMORY[0x1E4F93720] propertyWithName:@"position" possibleValues:&unk_1F3FA7748];
    id v13 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"fieldType"];
    id v14 = objc_alloc(MEMORY[0x1E4F93738]);
    v102[0] = v5;
    v102[1] = v12;
    v102[2] = v6;
    v102[3] = v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:4];
    uint64_t v16 = [v14 initWithFeatureId:@"quicktype" event:@"zeroSuggDesc" registerProperties:v15];
    failureEventDescriptionTracker = v2->_failureEventDescriptionTracker;
    v2->_failureEventDescriptionTracker = (PETScalarEventTracker *)v16;

    id v18 = objc_alloc(MEMORY[0x1E4F93738]);
    v101[0] = v5;
    v101[1] = v12;
    v101[2] = v83;
    v101[3] = v6;
    v101[4] = v13;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:5];
    uint64_t v20 = [v18 initWithFeatureId:@"quicktype" event:@"zeroSuggDesc_category" registerProperties:v19];
    failureCategoryEventDescriptionTracker = v2->_failureCategoryEventDescriptionTracker;
    v2->_failureCategoryEventDescriptionTracker = (PETScalarEventTracker *)v20;

    id v22 = objc_alloc(MEMORY[0x1E4F93738]);
    v100[0] = v5;
    v100[1] = v87;
    v100[2] = v6;
    v100[3] = v13;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:4];
    uint64_t v24 = [v22 initWithFeatureId:@"quicktype" event:@"zeroEngageDesc" registerProperties:v23];
    engagementEventDescriptionTracker = v2->_engagementEventDescriptionTracker;
    v2->_engagementEventDescriptionTracker = (PETScalarEventTracker *)v24;

    id v26 = objc_alloc(MEMORY[0x1E4F93738]);
    v99[0] = v5;
    v99[1] = v87;
    v99[2] = v83;
    v99[3] = v6;
    v99[4] = v13;
    long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:5];
    uint64_t v28 = objc_msgSend(v26, "initWithFeatureId:event:registerProperties:");
    engagementCategoryEventDescriptionTracker = v2->_engagementCategoryEventDescriptionTracker;
    v2->_engagementCategoryEventDescriptionTracker = (PETScalarEventTracker *)v28;

    id v30 = objc_alloc(MEMORY[0x1E4F93738]);
    v98[0] = v5;
    v98[1] = v6;
    v98[2] = v13;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:3];
    uint64_t v32 = [v30 initWithFeatureId:@"quicktype" event:@"triggered" registerProperties:v31];
    triggeredEventTracker = v2->_triggeredEventTracker;
    v2->_triggeredEventTracker = (PETScalarEventTracker *)v32;

    id v34 = objc_alloc(MEMORY[0x1E4F93738]);
    v97[0] = v5;
    v97[1] = v83;
    v97[2] = v6;
    v97[3] = v13;
    long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:4];
    uint64_t v36 = [v34 initWithFeatureId:@"quicktype" event:@"triggered_category" registerProperties:v35];
    triggeredCategoryEventTracker = v2->_triggeredCategoryEventTracker;
    v2->_triggeredCategoryEventTracker = (PETScalarEventTracker *)v36;

    id v38 = objc_alloc(MEMORY[0x1E4F93738]);
    v96[0] = v5;
    v96[1] = v84;
    v96[2] = v6;
    v96[3] = v13;
    long long v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:4];
    uint64_t v40 = [v38 initWithFeatureId:@"quicktype" event:@"suggested" registerProperties:v39];
    suggestedEventTracker = v2->_suggestedEventTracker;
    v2->_suggestedEventTracker = (PETScalarEventTracker *)v40;

    id v42 = objc_alloc(MEMORY[0x1E4F93738]);
    v95[0] = v5;
    v95[1] = v84;
    v95[2] = v83;
    v95[3] = v6;
    v95[4] = v13;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:5];
    uint64_t v44 = [v42 initWithFeatureId:@"quicktype" event:@"suggested_category" registerProperties:v43];
    suggestedCategoryEventTracker = v2->_suggestedCategoryEventTracker;
    v2->_suggestedCategoryEventTracker = (PETScalarEventTracker *)v44;

    id v46 = objc_alloc(MEMORY[0x1E4F93738]);
    v94[0] = v5;
    v94[1] = v85;
    v94[2] = v6;
    v94[3] = v13;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:4];
    uint64_t v48 = [v46 initWithFeatureId:@"quicktype" event:@"failure" registerProperties:v47];
    failureEventTracker = v2->_failureEventTracker;
    v2->_failureEventTracker = (PETScalarEventTracker *)v48;

    id v50 = objc_alloc(MEMORY[0x1E4F93738]);
    v93[0] = v5;
    v93[1] = v85;
    v93[2] = v83;
    v93[3] = v6;
    v93[4] = v13;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:5];
    uint64_t v52 = [v50 initWithFeatureId:@"quicktype" event:@"failure_category" registerProperties:v51];
    failureCategoryEventTracker = v2->_failureCategoryEventTracker;
    v2->_failureCategoryEventTracker = (PETScalarEventTracker *)v52;

    id v54 = objc_alloc(MEMORY[0x1E4F93738]);
    v92[0] = v5;
    v92[1] = v86;
    v92[2] = v6;
    v92[3] = v13;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:4];
    uint64_t v56 = [v54 initWithFeatureId:@"quicktype" event:@"selected" registerProperties:v55];
    selectedEventTracker = v2->_selectedEventTracker;
    v2->_selectedEventTracker = (PETScalarEventTracker *)v56;

    id v58 = objc_alloc(MEMORY[0x1E4F93738]);
    v91[0] = v5;
    v91[1] = v86;
    v91[2] = v83;
    v91[3] = v6;
    v91[4] = v13;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:5];
    uint64_t v60 = [v58 initWithFeatureId:@"quicktype" event:@"selected_category" registerProperties:v59];
    selectedCategoryEventTracker = v2->_selectedCategoryEventTracker;
    v2->_selectedCategoryEventTracker = (PETScalarEventTracker *)v60;

    id v62 = objc_alloc(MEMORY[0x1E4F93718]);
    v90[0] = v5;
    v90[1] = v79;
    v90[2] = v6;
    v90[3] = v13;
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:4];
    uint64_t v64 = [v62 initWithFeatureId:@"quicktype" event:@"timing" registerProperties:v63];
    timeInPredictionBarEventTracker = v2->_timeInPredictionBarEventTracker;
    v2->_timeInPredictionBarEventTracker = (PETDistributionEventTracker *)v64;

    id v66 = objc_alloc(MEMORY[0x1E4F93718]);
    v89[0] = v5;
    v89[1] = v79;
    v89[2] = v83;
    v89[3] = v6;
    v89[4] = v13;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:5];
    uint64_t v68 = [v66 initWithFeatureId:@"quicktype" event:@"timing_category" registerProperties:v67];
    timeInPredictionBarCategoryEventTracker = v2->_timeInPredictionBarCategoryEventTracker;
    v2->_timeInPredictionBarCategoryEventTracker = (PETDistributionEventTracker *)v68;

    id v70 = objc_alloc(MEMORY[0x1E4F93738]);
    uint64_t v71 = MEMORY[0x1E4F1CBF0];
    uint64_t v72 = [v70 initWithFeatureId:@"quicktype" event:@"pers_word_accept" registerProperties:MEMORY[0x1E4F1CBF0]];
    personalizationWordAcceptanceTracker = v2->_personalizationWordAcceptanceTracker;
    v2->_personalizationWordAcceptanceTracker = (PETScalarEventTracker *)v72;

    uint64_t v74 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"quicktype" event:@"pers_offer" registerProperties:v71];
    personalizationOfferTracker = v2->_personalizationOfferTracker;
    v2->_personalizationOfferTracker = (PETScalarEventTracker *)v74;

    uint64_t v76 = [objc_alloc(MEMORY[0x1E4F93738]) initWithFeatureId:@"quicktype" event:@"pers_engage" registerProperties:v71];
    personalizationEngagementTracker = v2->_personalizationEngagementTracker;
    v2->_personalizationEngagementTracker = (PETScalarEventTracker *)v76;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3101 != -1) {
    dispatch_once(&sharedInstance_onceToken_3101, &__block_literal_global_350);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

@end