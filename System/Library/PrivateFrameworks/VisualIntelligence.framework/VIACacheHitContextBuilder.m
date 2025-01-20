@interface VIACacheHitContextBuilder
- (id)build;
- (id)setApplicationIdentifer:(id)a3;
- (id)setCachedResultQueryID:(unint64_t)a3;
- (id)setEngagementSuggestionType:(id)a3;
- (id)setQueryID:(unint64_t)a3;
@end

@implementation VIACacheHitContextBuilder

- (id)setQueryID:(unint64_t)a3
{
  *((void *)self + 1) = a3;
  return self;
}

- (id)setCachedResultQueryID:(unint64_t)a3
{
  *((void *)self + 2) = a3;
  return self;
}

- (id)setApplicationIdentifer:(id)a3
{
  v4 = (NSString *)[a3 copy];
  applicationIdentifier = self->_applicationIdentifier;
  self->_applicationIdentifier = v4;

  return self;
}

- (id)setEngagementSuggestionType:(id)a3
{
  return self;
}

- (id)build
{
  v2 = [[VIACacheHitContext alloc] initWithQueryID:self->_queryID cachedResultQueryID:self->_cachedResultsQueryID applicationIdentifier:self->_applicationIdentifier engagementSuggestionType:self->_engagementSuggestionType];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end