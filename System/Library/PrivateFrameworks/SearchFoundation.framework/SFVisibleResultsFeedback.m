@interface SFVisibleResultsFeedback
+ (BOOL)supportsSecureCoding;
- (NSArray)results;
- (NSArray)uniqueIdentifiersOfVisibleCardSections;
- (NSArray)uniqueIdsOfVisibleButtons;
- (SFSearchResult)goTakeoverResult;
- (SFVisibleResultsFeedback)initWithCoder:(id)a3;
- (SFVisibleResultsFeedback)initWithResults:(id)a3 triggerEvent:(unint64_t)a4;
- (SFVisibleResultsFeedback)initWithResults:(id)a3 triggerEvent:(unint64_t)a4 visibleButtons:(id)a5 visibleCardSections:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)triggerEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setGoTakeoverResult:(id)a3;
- (void)setResults:(id)a3;
- (void)setTriggerEvent:(unint64_t)a3;
- (void)setUniqueIdentifiersOfVisibleCardSections:(id)a3;
- (void)setUniqueIdsOfVisibleButtons:(id)a3;
@end

@implementation SFVisibleResultsFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifiersOfVisibleCardSections, 0);
  objc_storeStrong((id *)&self->_uniqueIdsOfVisibleButtons, 0);
  objc_storeStrong((id *)&self->_goTakeoverResult, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)setUniqueIdentifiersOfVisibleCardSections:(id)a3
{
}

- (NSArray)uniqueIdentifiersOfVisibleCardSections
{
  return self->_uniqueIdentifiersOfVisibleCardSections;
}

- (void)setUniqueIdsOfVisibleButtons:(id)a3
{
}

- (NSArray)uniqueIdsOfVisibleButtons
{
  return self->_uniqueIdsOfVisibleButtons;
}

- (void)setGoTakeoverResult:(id)a3
{
}

- (SFSearchResult)goTakeoverResult
{
  return self->_goTakeoverResult;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setResults:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)SFVisibleResultsFeedback;
  v4 = [(SFFeedback *)&v12 description];
  v5 = [(SFVisibleResultsFeedback *)self results];
  v6 = [v5 valueForKey:@"title"];
  v7 = [v6 valueForKey:@"text"];
  v8 = [(SFVisibleResultsFeedback *)self uniqueIdsOfVisibleButtons];
  v9 = [(SFVisibleResultsFeedback *)self uniqueIdentifiersOfVisibleCardSections];
  v10 = [v3 stringWithFormat:@"%@ - result: %@ - buttons: %@ - card sections: %@", v4, v7, v8, v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFVisibleResultsFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_results, @"results", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_triggerEvent forKey:@"trigger_event"];
  [v4 encodeObject:self->_uniqueIdsOfVisibleButtons forKey:@"unique_ids_of_visible_buttons"];
  [v4 encodeObject:self->_uniqueIdentifiersOfVisibleCardSections forKey:@"unique_identifiers_of_visible_card_sections"];
}

- (SFVisibleResultsFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFVisibleResultsFeedback;
  objc_super v5 = [(SFFeedback *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"results"];
    results = v5->_results;
    v5->_results = (NSArray *)v9;

    v5->_triggerEvent = [v4 decodeIntegerForKey:@"trigger_event"];
    uint64_t v11 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"unique_ids_of_visible_buttons"];
    uniqueIdsOfVisibleButtons = v5->_uniqueIdsOfVisibleButtons;
    v5->_uniqueIdsOfVisibleButtons = (NSArray *)v11;

    uint64_t v13 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"unique_identifiers_of_visible_card_sections"];
    uniqueIdentifiersOfVisibleCardSections = v5->_uniqueIdentifiersOfVisibleCardSections;
    v5->_uniqueIdentifiersOfVisibleCardSections = (NSArray *)v13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SFVisibleResultsFeedback;
  id v4 = [(SFFeedback *)&v18 copyWithZone:a3];
  objc_super v5 = [(SFVisibleResultsFeedback *)self results];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = (void *)v4[3];
  v4[3] = v6;

  v4[4] = [(SFVisibleResultsFeedback *)self triggerEvent];
  v8 = [(SFVisibleResultsFeedback *)self goTakeoverResult];
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[5];
  v4[5] = v9;

  uint64_t v11 = [(SFVisibleResultsFeedback *)self uniqueIdentifiersOfVisibleCardSections];
  uint64_t v12 = [v11 copy];
  uint64_t v13 = (void *)v4[7];
  v4[7] = v12;

  v14 = [(SFVisibleResultsFeedback *)self uniqueIdsOfVisibleButtons];
  uint64_t v15 = [v14 copy];
  objc_super v16 = (void *)v4[6];
  v4[6] = v15;

  return v4;
}

- (SFVisibleResultsFeedback)initWithResults:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFVisibleResultsFeedback;
  uint64_t v7 = [(SFFeedback *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    results = v7->_results;
    v7->_results = (NSArray *)v8;

    v7->_triggerEvent = a4;
  }

  return v7;
}

- (SFVisibleResultsFeedback)initWithResults:(id)a3 triggerEvent:(unint64_t)a4 visibleButtons:(id)a5 visibleCardSections:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(SFVisibleResultsFeedback *)self initWithResults:a3 triggerEvent:a4];
  if (v12)
  {
    if ([v10 count])
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v33 = v10;
      id v14 = v10;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if ([v19 uniqueId])
            {
              v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "uniqueId"));
              [v13 addObject:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v16);
      }

      v21 = (void *)[v13 copy];
      [(SFVisibleResultsFeedback *)v12 setUniqueIdsOfVisibleButtons:v21];

      id v10 = v33;
    }
    if ([v11 count])
    {
      v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v23 = v11;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v35 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            v29 = [v28 cardSectionId];

            if (v29)
            {
              v30 = [v28 cardSectionId];
              [v22 addObject:v30];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v25);
      }

      v31 = (void *)[v22 copy];
      [(SFVisibleResultsFeedback *)v12 setUniqueIdentifiersOfVisibleCardSections:v31];
    }
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end