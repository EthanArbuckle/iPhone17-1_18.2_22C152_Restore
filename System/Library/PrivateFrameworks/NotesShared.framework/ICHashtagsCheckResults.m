@interface ICHashtagsCheckResults
- (ICHashtagsCheckResults)init;
- (NSSet)matchingHashtagSuggestions;
- (_NSRange)rangeOfHashtag;
- (id)debugDescription;
- (void)setMatchingHashtagSuggestions:(id)a3;
- (void)setRangeOfHashtag:(_NSRange)a3;
@end

@implementation ICHashtagsCheckResults

- (ICHashtagsCheckResults)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICHashtagsCheckResults;
  result = [(ICHashtagsCheckResults *)&v3 init];
  if (result) {
    result->_rangeOfHashtag = (_NSRange)xmmword_1C3DD2F80;
  }
  return result;
}

- (id)debugDescription
{
  objc_super v3 = [(ICHashtagsCheckResults *)self matchingHashtagSuggestions];
  v4 = [v3 allObjects];
  v5 = objc_msgSend(v4, "ic_map:", &__block_literal_global_3);

  v6 = NSString;
  v12.location = [(ICHashtagsCheckResults *)self rangeOfHashtag];
  v7 = NSStringFromRange(v12);
  v8 = [v5 componentsJoinedByString:@","];
  v9 = [v6 stringWithFormat:@"Hashtag found at %@, names: [%@]", v7, v8];

  return v9;
}

uint64_t __42__ICHashtagsCheckResults_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 displayText];
}

- (_NSRange)rangeOfHashtag
{
  NSUInteger length = self->_rangeOfHashtag.length;
  NSUInteger location = self->_rangeOfHashtag.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeOfHashtag:(_NSRange)a3
{
  self->_rangeOfHashtag = a3;
}

- (NSSet)matchingHashtagSuggestions
{
  return self->_matchingHashtagSuggestions;
}

- (void)setMatchingHashtagSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end