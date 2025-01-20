@interface AutocompleteMatchInfo
+ (AutocompleteMatchInfo)matchInfoWithType:(unint64_t)a3;
- (AutocompleteMatchInfo)initWithType:(unint64_t)a3;
- (AutocompleteQueryToken)firstPrefixToken;
- (AutocompleteQueryToken)secondPrefixToken;
- (BOOL)hasClientRankingDebug;
- (BOOL)hasSortPriorityDebug;
- (BOOL)prefixMatchesWordBoundary;
- (BOOL)shownToUser;
- (NSNumber)prefixLastTokenMatchCover;
- (NSNumber)prefixMatchCover;
- (NSNumber)prefixMatchPosition;
- (double)clientRankingDebug;
- (double)fractionOfMatch;
- (double)peopleSuggesterRank;
- (id)copyWithZone:(_NSZone *)a3;
- (int)ageInSeconds;
- (int64_t)sortPriorityDebug;
- (unint64_t)matchType;
- (void)addObserver:(id)a3;
- (void)notifyObserversOfChange;
- (void)removeObserver:(id)a3;
- (void)setAgeInSeconds:(int)a3;
- (void)setClientRankingDebug:(double)a3;
- (void)setFirstPrefixToken:(id)a3;
- (void)setFractionOfMatch:(double)a3;
- (void)setPeopleSuggesterRank:(double)a3;
- (void)setPrefixLastTokenMatchCover:(id)a3;
- (void)setPrefixMatchCover:(id)a3;
- (void)setPrefixMatchPosition:(id)a3;
- (void)setPrefixMatchesWordBoundary:(BOOL)a3;
- (void)setSecondPrefixToken:(id)a3;
- (void)setShownToUser:(BOOL)a3;
- (void)setSortPriorityDebug:(int64_t)a3;
@end

@implementation AutocompleteMatchInfo

+ (AutocompleteMatchInfo)matchInfoWithType:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithType:a3];

  return (AutocompleteMatchInfo *)v3;
}

- (AutocompleteMatchInfo)initWithType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AutocompleteMatchInfo;
  v4 = [(AutocompleteMatchInfo *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_ageInSeconds = -1;
    v4->_peopleSuggesterRank = 0.0;
    v4->_fractionOfMatch = 0.0;
    v4->_matchType = a3;
    v6 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:5];
    observers = v5->_observers;
    v5->_observers = v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[AutocompleteMatchInfo alloc] initWithType:[(AutocompleteMatchInfo *)self matchType]];
  [(AutocompleteMatchInfo *)self peopleSuggesterRank];
  -[AutocompleteMatchInfo setPeopleSuggesterRank:](v4, "setPeopleSuggesterRank:");
  [(AutocompleteMatchInfo *)v4 setAgeInSeconds:[(AutocompleteMatchInfo *)self ageInSeconds]];
  [(AutocompleteMatchInfo *)self fractionOfMatch];
  -[AutocompleteMatchInfo setFractionOfMatch:](v4, "setFractionOfMatch:");
  [(AutocompleteMatchInfo *)v4 setShownToUser:[(AutocompleteMatchInfo *)self shownToUser]];
  if ([(AutocompleteMatchInfo *)self hasClientRankingDebug])
  {
    [(AutocompleteMatchInfo *)self clientRankingDebug];
    -[AutocompleteMatchInfo setClientRankingDebug:](v4, "setClientRankingDebug:");
  }
  if ([(AutocompleteMatchInfo *)self hasSortPriorityDebug]) {
    [(AutocompleteMatchInfo *)v4 setSortPriorityDebug:[(AutocompleteMatchInfo *)self sortPriorityDebug]];
  }
  v5 = [(AutocompleteMatchInfo *)self prefixLastTokenMatchCover];
  [(AutocompleteMatchInfo *)v4 setPrefixLastTokenMatchCover:v5];

  v6 = [(AutocompleteMatchInfo *)self prefixMatchCover];
  [(AutocompleteMatchInfo *)v4 setPrefixMatchCover:v6];

  v7 = [(AutocompleteMatchInfo *)self prefixMatchPosition];
  [(AutocompleteMatchInfo *)v4 setPrefixMatchPosition:v7];

  [(AutocompleteMatchInfo *)v4 setPrefixMatchesWordBoundary:[(AutocompleteMatchInfo *)self prefixMatchesWordBoundary]];
  v8 = [(AutocompleteMatchInfo *)self firstPrefixToken];
  [(AutocompleteMatchInfo *)v4 setFirstPrefixToken:v8];

  objc_super v9 = [(AutocompleteMatchInfo *)self secondPrefixToken];
  [(AutocompleteMatchInfo *)v4 setSecondPrefixToken:v9];

  return v4;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)setPeopleSuggesterRank:(double)a3
{
  if (self->_peopleSuggesterRank != a3)
  {
    self->_peopleSuggesterRank = a3;
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setAgeInSeconds:(int)a3
{
  if (self->_ageInSeconds != a3)
  {
    self->_ageInSeconds = a3;
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setShownToUser:(BOOL)a3
{
  if (self->_shownToUser != a3)
  {
    self->_shownToUser = a3;
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setFractionOfMatch:(double)a3
{
  if (self->_fractionOfMatch != a3)
  {
    self->_fractionOfMatch = a3;
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setClientRankingDebug:(double)a3
{
  if (!self->_hasClientRankingDebug || self->_clientRankingDebug != a3)
  {
    self->_hasClientRankingDebug = 1;
    self->_clientRankingDebug = a3;
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setSortPriorityDebug:(int64_t)a3
{
  if (!self->_hasSortPriorityDebug || self->_sortPriorityDebug != a3)
  {
    self->_hasSortPriorityDebug = 1;
    self->_sortPriorityDebug = a3;
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setPrefixLastTokenMatchCover:(id)a3
{
  id v5 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_prefixLastTokenMatchCover, "isEqualToNumber:"))
  {
    objc_storeStrong((id *)&self->_prefixLastTokenMatchCover, a3);
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setPrefixMatchCover:(id)a3
{
  id v5 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_prefixMatchCover, "isEqualToNumber:"))
  {
    objc_storeStrong((id *)&self->_prefixMatchCover, a3);
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setPrefixMatchPosition:(id)a3
{
  id v5 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_prefixMatchPosition, "isEqualToNumber:"))
  {
    objc_storeStrong((id *)&self->_prefixMatchPosition, a3);
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setPrefixMatchesWordBoundary:(BOOL)a3
{
  if (self->_prefixMatchesWordBoundary != a3)
  {
    self->_prefixMatchesWordBoundary = a3;
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
  }
}

- (void)setFirstPrefixToken:(id)a3
{
  id v5 = (AutocompleteQueryToken *)a3;
  if (self->_firstPrefixToken != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_firstPrefixToken, a3);
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
    id v5 = v6;
  }
}

- (void)setSecondPrefixToken:(id)a3
{
  id v5 = (AutocompleteQueryToken *)a3;
  if (self->_secondPrefixToken != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_secondPrefixToken, a3);
    [(AutocompleteMatchInfo *)self notifyObserversOfChange];
    id v5 = v6;
  }
}

- (void)notifyObserversOfChange
{
  id v3 = [(NSHashTable *)self->_observers copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) autocompleteMatchInfoDidUpdate:self];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (double)peopleSuggesterRank
{
  return self->_peopleSuggesterRank;
}

- (int)ageInSeconds
{
  return self->_ageInSeconds;
}

- (double)fractionOfMatch
{
  return self->_fractionOfMatch;
}

- (BOOL)shownToUser
{
  return self->_shownToUser;
}

- (NSNumber)prefixLastTokenMatchCover
{
  return self->_prefixLastTokenMatchCover;
}

- (NSNumber)prefixMatchCover
{
  return self->_prefixMatchCover;
}

- (NSNumber)prefixMatchPosition
{
  return self->_prefixMatchPosition;
}

- (BOOL)prefixMatchesWordBoundary
{
  return self->_prefixMatchesWordBoundary;
}

- (AutocompleteQueryToken)firstPrefixToken
{
  return self->_firstPrefixToken;
}

- (AutocompleteQueryToken)secondPrefixToken
{
  return self->_secondPrefixToken;
}

- (BOOL)hasClientRankingDebug
{
  return self->_hasClientRankingDebug;
}

- (double)clientRankingDebug
{
  return self->_clientRankingDebug;
}

- (BOOL)hasSortPriorityDebug
{
  return self->_hasSortPriorityDebug;
}

- (int64_t)sortPriorityDebug
{
  return self->_sortPriorityDebug;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondPrefixToken, 0);
  objc_storeStrong((id *)&self->_firstPrefixToken, 0);
  objc_storeStrong((id *)&self->_prefixMatchPosition, 0);
  objc_storeStrong((id *)&self->_prefixMatchCover, 0);
  objc_storeStrong((id *)&self->_prefixLastTokenMatchCover, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end