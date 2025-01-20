@interface AutocompleteQueryStringMatch
- (AutocompleteQueryStringMatch)init;
- (AutocompleteQueryStringMatch)initWithQueryTerms:(id)a3 stringTerms:(id)a4 matchingTerms:(id)a5 totalMatchLength:(unint64_t)a6 fractionOfMatch:(double)a7 prefixLastTokenMatchCover:(id)a8 prefixMatchCover:(id)a9 prefixMatchPosition:(id)a10 prefixMatchesWordBoundary:(BOOL)a11 firstPrefixToken:(id)a12 secondPrefixToken:(id)a13;
- (BOOL)prefixMatchesWordBoundary;
- (NSArray)matchingTerms;
- (NSArray)queryTerms;
- (NSArray)stringTerms;
- (NSNumber)prefixLastTokenMatchCover;
- (NSNumber)prefixMatchCover;
- (NSNumber)prefixMatchPosition;
- (_TtC4Maps22AutocompleteQueryToken)firstPrefixToken;
- (_TtC4Maps22AutocompleteQueryToken)secondPrefixToken;
- (double)fractionOfMatch;
- (unint64_t)totalMatchLength;
@end

@implementation AutocompleteQueryStringMatch

- (AutocompleteQueryStringMatch)init
{
  return 0;
}

- (AutocompleteQueryStringMatch)initWithQueryTerms:(id)a3 stringTerms:(id)a4 matchingTerms:(id)a5 totalMatchLength:(unint64_t)a6 fractionOfMatch:(double)a7 prefixLastTokenMatchCover:(id)a8 prefixMatchCover:(id)a9 prefixMatchPosition:(id)a10 prefixMatchesWordBoundary:(BOOL)a11 firstPrefixToken:(id)a12 secondPrefixToken:(id)a13
{
  id v35 = a3;
  id v34 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  id v33 = a10;
  id v32 = a12;
  id v22 = a13;
  v36.receiver = self;
  v36.super_class = (Class)AutocompleteQueryStringMatch;
  v23 = [(AutocompleteQueryStringMatch *)&v36 init];
  if (v23)
  {
    v24 = (NSArray *)[v35 copy];
    queryTerms = v23->_queryTerms;
    v23->_queryTerms = v24;

    v26 = (NSArray *)[v34 copy];
    stringTerms = v23->_stringTerms;
    v23->_stringTerms = v26;

    v28 = (NSArray *)[v19 copy];
    matchingTerms = v23->_matchingTerms;
    v23->_matchingTerms = v28;

    v23->_totalMatchLength = a6;
    v23->_fractionOfMatch = a7;
    objc_storeStrong((id *)&v23->_prefixLastTokenMatchCover, a8);
    objc_storeStrong((id *)&v23->_prefixMatchCover, a9);
    objc_storeStrong((id *)&v23->_prefixMatchPosition, a10);
    v23->_prefixMatchesWordBoundary = a11;
    objc_storeStrong((id *)&v23->_firstPrefixToken, a12);
    objc_storeStrong((id *)&v23->_secondPrefixToken, a13);
  }

  return v23;
}

- (NSArray)queryTerms
{
  return self->_queryTerms;
}

- (NSArray)stringTerms
{
  return self->_stringTerms;
}

- (NSArray)matchingTerms
{
  return self->_matchingTerms;
}

- (unint64_t)totalMatchLength
{
  return self->_totalMatchLength;
}

- (double)fractionOfMatch
{
  return self->_fractionOfMatch;
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

- (_TtC4Maps22AutocompleteQueryToken)firstPrefixToken
{
  return self->_firstPrefixToken;
}

- (_TtC4Maps22AutocompleteQueryToken)secondPrefixToken
{
  return self->_secondPrefixToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondPrefixToken, 0);
  objc_storeStrong((id *)&self->_firstPrefixToken, 0);
  objc_storeStrong((id *)&self->_prefixMatchPosition, 0);
  objc_storeStrong((id *)&self->_prefixMatchCover, 0);
  objc_storeStrong((id *)&self->_prefixLastTokenMatchCover, 0);
  objc_storeStrong((id *)&self->_matchingTerms, 0);
  objc_storeStrong((id *)&self->_stringTerms, 0);

  objc_storeStrong((id *)&self->_queryTerms, 0);
}

@end