@interface UNCSummaryServiceGroupSummary
- (NSAttributedString)threadSummary;
- (NSString)spotlightIdentifier;
- (UNCSummaryServiceGroupSummary)initWithSpotlightIdentifier:(id)a3 threadSummary:(id)a4;
- (void)setSpotlightIdentifier:(id)a3;
- (void)setThreadSummary:(id)a3;
@end

@implementation UNCSummaryServiceGroupSummary

- (UNCSummaryServiceGroupSummary)initWithSpotlightIdentifier:(id)a3 threadSummary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UNCSummaryServiceGroupSummary;
  v8 = [(UNCSummaryServiceGroupSummary *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    spotlightIdentifier = v8->_spotlightIdentifier;
    v8->_spotlightIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    threadSummary = v8->_threadSummary;
    v8->_threadSummary = (NSAttributedString *)v11;
  }
  return v8;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (void)setSpotlightIdentifier:(id)a3
{
}

- (NSAttributedString)threadSummary
{
  return self->_threadSummary;
}

- (void)setThreadSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadSummary, 0);

  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
}

@end