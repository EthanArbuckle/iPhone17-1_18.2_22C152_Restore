@interface UNCSummaryServiceIndividualSummary
- (BOOL)isHighlight;
- (NSAttributedString)individualSummary;
- (NSDate)contentCreationDate;
- (NSString)spotlightIdentifier;
- (UNCSummaryServiceIndividualSummary)initWithSpotlightIdentifier:(id)a3 individualSummary:(id)a4 isHighlight:(BOOL)a5 contentCreationDate:(id)a6;
- (void)setContentCreationDate:(id)a3;
- (void)setIndividualSummary:(id)a3;
- (void)setIsHighlight:(BOOL)a3;
- (void)setSpotlightIdentifier:(id)a3;
@end

@implementation UNCSummaryServiceIndividualSummary

- (UNCSummaryServiceIndividualSummary)initWithSpotlightIdentifier:(id)a3 individualSummary:(id)a4 isHighlight:(BOOL)a5 contentCreationDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UNCSummaryServiceIndividualSummary;
  v13 = [(UNCSummaryServiceIndividualSummary *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    spotlightIdentifier = v13->_spotlightIdentifier;
    v13->_spotlightIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    individualSummary = v13->_individualSummary;
    v13->_individualSummary = (NSAttributedString *)v16;

    v13->_isHighlight = a5;
    uint64_t v18 = [v12 copy];
    contentCreationDate = v13->_contentCreationDate;
    v13->_contentCreationDate = (NSDate *)v18;
  }
  return v13;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (void)setSpotlightIdentifier:(id)a3
{
}

- (NSAttributedString)individualSummary
{
  return self->_individualSummary;
}

- (void)setIndividualSummary:(id)a3
{
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (void)setIsHighlight:(BOOL)a3
{
  self->_isHighlight = a3;
}

- (NSDate)contentCreationDate
{
  return self->_contentCreationDate;
}

- (void)setContentCreationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentCreationDate, 0);
  objc_storeStrong((id *)&self->_individualSummary, 0);

  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
}

@end