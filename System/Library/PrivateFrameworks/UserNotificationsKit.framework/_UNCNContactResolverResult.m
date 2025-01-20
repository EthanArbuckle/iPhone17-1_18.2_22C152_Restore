@interface _UNCNContactResolverResult
+ (id)resultWithCNContactIdentifier:(id)a3 cnContactFullname:(id)a4 suggestedContact:(BOOL)a5 matchType:(unint64_t)a6 matchTypeSuggested:(BOOL)a7 identifierOfMatchLabel:(id)a8;
- (BOOL)isMatchTypeSuggested;
- (BOOL)isStrongerMatchThanOtherMatch:(id)a3;
- (BOOL)isStrongestMatch;
- (BOOL)isSuggestedContact;
- (NSString)cnContactFullname;
- (NSString)cnContactIdentifier;
- (NSString)debugDescription;
- (NSString)identifierOfMatchLabel;
- (id)_initWithCNContactIdentifier:(id)a3 cnContactFullname:(id)a4 suggestedContact:(BOOL)a5 matchType:(unint64_t)a6 matchTypeSuggested:(BOOL)a7 identifierOfMatchLabel:(id)a8;
- (id)_stringForMatchType:(unint64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)matchType;
@end

@implementation _UNCNContactResolverResult

+ (id)resultWithCNContactIdentifier:(id)a3 cnContactFullname:(id)a4 suggestedContact:(BOOL)a5 matchType:(unint64_t)a6 matchTypeSuggested:(BOOL)a7 identifierOfMatchLabel:(id)a8
{
  BOOL v8 = a7;
  BOOL v10 = a5;
  id v13 = a8;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[_UNCNContactResolverResult alloc] _initWithCNContactIdentifier:v15 cnContactFullname:v14 suggestedContact:v10 matchType:a6 matchTypeSuggested:v8 identifierOfMatchLabel:v13];

  return v16;
}

- (id)_initWithCNContactIdentifier:(id)a3 cnContactFullname:(id)a4 suggestedContact:(BOOL)a5 matchType:(unint64_t)a6 matchTypeSuggested:(BOOL)a7 identifierOfMatchLabel:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)_UNCNContactResolverResult;
  v18 = [(_UNCNContactResolverResult *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cnContactIdentifier, a3);
    v19->_suggestedContact = a5;
    v19->_matchType = a6;
    v19->_matchTypeSuggested = a7;
    objc_storeStrong((id *)&v19->_identifierOfMatchLabel, a8);
    objc_storeStrong((id *)&v19->_cnContactFullname, a4);
  }

  return v19;
}

- (BOOL)isStrongerMatchThanOtherMatch:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(_UNCNContactResolverResult *)self isSuggestedContact]
      || ([v4 isSuggestedContact] & 1) != 0)
    {
      if (![(_UNCNContactResolverResult *)self isSuggestedContact])
      {
        char v5 = [v4 isSuggestedContact];
LABEL_10:
        BOOL v6 = v5;
        goto LABEL_11;
      }
    }
    else if (![(_UNCNContactResolverResult *)self isMatchTypeSuggested])
    {
      char v5 = [v4 isMatchTypeSuggested];
      goto LABEL_10;
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
  }
LABEL_11:

  return v6;
}

- (BOOL)isStrongestMatch
{
  if ([(_UNCNContactResolverResult *)self isSuggestedContact]) {
    return 0;
  }
  else {
    return ![(_UNCNContactResolverResult *)self isMatchTypeSuggested];
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(_UNCNContactResolverResult *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UNCNContactResolverResult *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  BOOL v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68___UNCNContactResolverResult_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

- (id)succinctDescription
{
  v2 = [(_UNCNContactResolverResult *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(_UNCNContactResolverResult *)self cnContactIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"cnContactIdentifier"];

  BOOL v6 = [(_UNCNContactResolverResult *)self cnContactFullname];
  id v7 = objc_msgSend(v6, "un_logDigest");
  id v8 = (id)[v3 appendObject:v7 withName:@"cnContactFullname"];

  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNCNContactResolverResult isSuggestedContact](self, "isSuggestedContact"), @"isSuggestedContact");
  BOOL v10 = [(_UNCNContactResolverResult *)self _stringForMatchType:[(_UNCNContactResolverResult *)self matchType]];
  [v3 appendString:v10 withName:@"matchType"];

  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UNCNContactResolverResult isMatchTypeSuggested](self, "isMatchTypeSuggested"), @"matchTypeSuggested");
  v12 = [(_UNCNContactResolverResult *)self identifierOfMatchLabel];
  id v13 = (id)[v3 appendBool:v12 != 0 withName:@"identifierOfMatchLabelExists"];

  return v3;
}

- (id)_stringForMatchType:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_264559F40[a3];
  }
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (BOOL)isSuggestedContact
{
  return self->_suggestedContact;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (BOOL)isMatchTypeSuggested
{
  return self->_matchTypeSuggested;
}

- (NSString)identifierOfMatchLabel
{
  return self->_identifierOfMatchLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierOfMatchLabel, 0);
  objc_storeStrong((id *)&self->_cnContactFullname, 0);

  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
}

@end