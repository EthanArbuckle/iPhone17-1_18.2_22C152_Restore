@interface AutocompleteItemManagerItemWrapper
- (AutocompleteItemManagerItemWrapper)initWithItem:(id)a3 compoundItem:(id)a4;
- (AutocompleteMutableSection)section;
- (PersonalizedAutocompleteItem)item;
- (PersonalizedCompoundItem)compoundItem;
- (double)clientRankingScore;
- (double)poiRelevanceScore;
- (int64_t)priority;
- (void)setClientRankingScore:(double)a3;
- (void)setCompoundItem:(id)a3;
- (void)setItem:(id)a3;
- (void)setPoiRelevanceScore:(double)a3;
- (void)setPriority:(int64_t)a3;
- (void)setSection:(id)a3;
@end

@implementation AutocompleteItemManagerItemWrapper

- (AutocompleteItemManagerItemWrapper)initWithItem:(id)a3 compoundItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AutocompleteItemManagerItemWrapper;
  v9 = [(AutocompleteItemManagerItemWrapper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    objc_storeStrong((id *)&v10->_compoundItem, a4);
  }

  return v10;
}

- (PersonalizedAutocompleteItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (PersonalizedCompoundItem)compoundItem
{
  return self->_compoundItem;
}

- (void)setCompoundItem:(id)a3
{
}

- (double)clientRankingScore
{
  return self->_clientRankingScore;
}

- (void)setClientRankingScore:(double)a3
{
  self->_clientRankingScore = a3;
}

- (double)poiRelevanceScore
{
  return self->_poiRelevanceScore;
}

- (void)setPoiRelevanceScore:(double)a3
{
  self->_poiRelevanceScore = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (AutocompleteMutableSection)section
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_section);

  return (AutocompleteMutableSection *)WeakRetained;
}

- (void)setSection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_section);
  objc_storeStrong((id *)&self->_compoundItem, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end