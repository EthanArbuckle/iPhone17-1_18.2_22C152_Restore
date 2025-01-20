@interface PNPersonSuggestion
+ (id)suggestionWithPersonLocalIdentifier:(id)a3 meContactIdentifier:(id)a4;
+ (id)suggestionWithPersonLocalIdentifier:(id)a3 personView:(id)a4;
- (BOOL)isMe;
- (NSPersonNameComponents)nameComponents;
- (NSString)autonamingFeedbackStandardNameRepresentation;
- (NSString)contactIdentifier;
- (NSString)nameString;
- (NSString)personLocalIdentifier;
- (id)description;
- (int64_t)attribution;
- (int64_t)suggestionSource;
- (void)setAttribution:(int64_t)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setNameComponents:(id)a3;
- (void)setNameString:(id)a3;
- (void)setPersonLocalIdentifier:(id)a3;
- (void)setSuggestionSource:(int64_t)a3;
@end

@implementation PNPersonSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_nameString, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
}

- (void)setAttribution:(int64_t)a3
{
  self->_attribution = a3;
}

- (int64_t)attribution
{
  return self->_attribution;
}

- (void)setSuggestionSource:(int64_t)a3
{
  self->_suggestionSource = a3;
}

- (int64_t)suggestionSource
{
  return self->_suggestionSource;
}

- (void)setPersonLocalIdentifier:(id)a3
{
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setNameString:(id)a3
{
}

- (NSString)nameString
{
  return self->_nameString;
}

- (void)setNameComponents:(id)a3
{
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (id)description
{
  v18 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)PNPersonSuggestion;
  v17 = [(PNPersonSuggestion *)&v19 description];
  v3 = [(PNPersonSuggestion *)self personLocalIdentifier];
  v4 = [(PNPersonSuggestion *)self nameComponents];
  if (v4) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  v6 = v5;
  v7 = [(PNPersonSuggestion *)self nameString];
  if (v7) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  v9 = v8;
  v10 = [(PNPersonSuggestion *)self contactIdentifier];
  if (v10) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  v12 = v11;
  if ([(PNPersonSuggestion *)self isMe]) {
    v13 = @"Y";
  }
  else {
    v13 = @"N";
  }
  v14 = v13;
  v15 = [v18 stringWithFormat:@"<%@ personLocalIdentifier:%@ nameComponents:%@ nameString:%@ contactIdentifier:%@ isMe:%@ source:%ld attribution:%ld>", v17, v3, v6, v9, v12, v14, -[PNPersonSuggestion suggestionSource](self, "suggestionSource"), -[PNPersonSuggestion attribution](self, "attribution")];

  return v15;
}

- (NSString)autonamingFeedbackStandardNameRepresentation
{
  v3 = [(PNPersonSuggestion *)self nameComponents];
  v4 = [v3 autonamingFeedbackStandardizedRepresentation];
  v5 = (void *)[v4 copy];

  if (!v5)
  {
    v5 = [(PNPersonSuggestion *)self nameString];
  }

  return (NSString *)v5;
}

+ (id)suggestionWithPersonLocalIdentifier:(id)a3 personView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(PNPersonSuggestion);
  [(PNPersonSuggestion *)v7 setPersonLocalIdentifier:v6];

  v8 = [v5 suggestedNameComponents];
  [(PNPersonSuggestion *)v7 setNameComponents:v8];

  v9 = [v5 suggestedNameString];
  [(PNPersonSuggestion *)v7 setNameString:v9];

  v10 = [v5 contactIdentifier];
  [(PNPersonSuggestion *)v7 setContactIdentifier:v10];

  [(PNPersonSuggestion *)v7 setSuggestionSource:1];
  uint64_t v11 = [v5 autonamingSuggestionReason];

  if ((unint64_t)(v11 - 2) >= 4) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v11 - 1;
  }
  [(PNPersonSuggestion *)v7 setAttribution:v12];
  return v7;
}

+ (id)suggestionWithPersonLocalIdentifier:(id)a3 meContactIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(PNPersonSuggestion);
  [(PNPersonSuggestion *)v7 setPersonLocalIdentifier:v6];

  [(PNPersonSuggestion *)v7 setContactIdentifier:v5];
  [(PNPersonSuggestion *)v7 setIsMe:1];
  [(PNPersonSuggestion *)v7 setSuggestionSource:0];
  [(PNPersonSuggestion *)v7 setAttribution:3];
  return v7;
}

@end