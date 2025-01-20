@interface ICMentionCheckResults
- (BOOL)isAllMention;
- (BOOL)isExplicitMention;
- (BOOL)isPartialMention;
- (ICMentionCheckResults)init;
- (NSSet)matchingParticipants;
- (NSString)mentionString;
- (_NSRange)rangeOfMention;
- (id)debugDescription;
- (void)setIsAllMention:(BOOL)a3;
- (void)setIsExplicitMention:(BOOL)a3;
- (void)setIsPartialMention:(BOOL)a3;
- (void)setMatchingParticipants:(id)a3;
- (void)setMentionString:(id)a3;
- (void)setRangeOfMention:(_NSRange)a3;
@end

@implementation ICMentionCheckResults

- (ICMentionCheckResults)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICMentionCheckResults;
  result = [(ICMentionCheckResults *)&v3 init];
  if (result) {
    result->_rangeOfMention = (_NSRange)xmmword_1C3DD2F80;
  }
  return result;
}

- (id)debugDescription
{
  objc_super v3 = [(ICMentionCheckResults *)self matchingParticipants];
  v4 = [v3 allObjects];
  v5 = objc_msgSend(v4, "ic_map:", &__block_literal_global_22);

  v6 = NSString;
  v14.location = [(ICMentionCheckResults *)self rangeOfMention];
  v7 = NSStringFromRange(v14);
  BOOL v8 = [(ICMentionCheckResults *)self isPartialMention];
  BOOL v9 = [(ICMentionCheckResults *)self isExplicitMention];
  if ([(ICMentionCheckResults *)self isAllMention])
  {
    v10 = [v6 stringWithFormat:@"Mention found at %@, partial: %d, explicit: %d, names: [%@]", v7, v8, v9, @"all"];
  }
  else
  {
    v11 = [v5 componentsJoinedByString:@","];
    v10 = [v6 stringWithFormat:@"Mention found at %@, partial: %d, explicit: %d, names: [%@]", v7, v8, v9, v11];
  }
  return v10;
}

__CFString *__41__ICMentionCheckResults_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ic_shortParticipantName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_super v3 = v2;
  if (!v2) {
    v2 = @"???";
  }
  v4 = v2;

  return v4;
}

- (_NSRange)rangeOfMention
{
  NSUInteger length = self->_rangeOfMention.length;
  NSUInteger location = self->_rangeOfMention.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeOfMention:(_NSRange)a3
{
  self->_rangeOfMention = a3;
}

- (BOOL)isPartialMention
{
  return self->_isPartialMention;
}

- (void)setIsPartialMention:(BOOL)a3
{
  self->_isPartialMention = a3;
}

- (BOOL)isExplicitMention
{
  return self->_isExplicitMention;
}

- (void)setIsExplicitMention:(BOOL)a3
{
  self->_isExplicitMention = a3;
}

- (BOOL)isAllMention
{
  return self->_isAllMention;
}

- (void)setIsAllMention:(BOOL)a3
{
  self->_isAllMention = a3;
}

- (NSSet)matchingParticipants
{
  return self->_matchingParticipants;
}

- (void)setMatchingParticipants:(id)a3
{
}

- (NSString)mentionString
{
  return self->_mentionString;
}

- (void)setMentionString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionString, 0);
  objc_storeStrong((id *)&self->_matchingParticipants, 0);
}

@end