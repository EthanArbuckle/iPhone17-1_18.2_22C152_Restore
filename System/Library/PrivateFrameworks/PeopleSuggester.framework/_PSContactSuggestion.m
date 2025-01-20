@interface _PSContactSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (NSArray)groupRecipients;
- (NSDictionary)handleAndAppFrequencies;
- (NSDictionary)handleAndAppRegularityScores;
- (NSSet)daysInteracted;
- (NSString)contactIdentifier;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)groupIdentifier;
- (NSString)groupName;
- (NSString)messagesGroupIdentifier;
- (NSString)suggestedHandle;
- (NSURL)imageURL;
- (_PSContactSuggestion)initWithCoder:(id)a3;
- (_PSContactSuggestion)initWithContact:(id)a3 andScore:(double)a4;
- (double)peopleWidgetScore;
- (double)regularityScore;
- (id)description;
- (unint64_t)hash;
- (unint64_t)totalFrequency;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setDaysInteracted:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupRecipients:(id)a3;
- (void)setHandleAndAppFrequencies:(id)a3;
- (void)setHandleAndAppRegularityScores:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setMessagesGroupIdentifier:(id)a3;
- (void)setPeopleWidgetScore:(double)a3;
- (void)setRegularityScore:(double)a3;
- (void)setSuggestedHandle:(id)a3;
- (void)setTotalFrequency:(unint64_t)a3;
@end

@implementation _PSContactSuggestion

- (_PSContactSuggestion)initWithContact:(id)a3 andScore:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PSContactSuggestion;
  v8 = [(_PSContactSuggestion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contact, a3);
    v9->_peopleWidgetScore = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSContactSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_PSContactSuggestion;
  v5 = [(_PSContactSuggestion *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"givenName"];
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyName"];
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedHandle"];
    suggestedHandle = v5->_suggestedHandle;
    v5->_suggestedHandle = (NSString *)v12;

    [v4 decodeDoubleForKey:@"regularityScore"];
    v5->_regularityScore = v14;
    v5->_totalFrequency = [v4 decodeIntegerForKey:@"totalFrequency"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"daysInteracted"];
    daysInteracted = v5->_daysInteracted;
    v5->_daysInteracted = (NSSet *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"handleAndAppFrequencies"];
    handleAndAppFrequencies = v5->_handleAndAppFrequencies;
    v5->_handleAndAppFrequencies = (NSDictionary *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"handleAndAppRegularityScores"];
    handleAndAppRegularityScores = v5->_handleAndAppRegularityScores;
    v5->_handleAndAppRegularityScores = (NSDictionary *)v30;

    v32 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contactIdentifier = self->_contactIdentifier;
  id v5 = a3;
  [v5 encodeObject:contactIdentifier forKey:@"contactIdentifier"];
  [v5 encodeObject:self->_givenName forKey:@"givenName"];
  [v5 encodeObject:self->_familyName forKey:@"familyName"];
  [v5 encodeObject:self->_suggestedHandle forKey:@"suggestedHandle"];
  [v5 encodeDouble:@"regularityScore" forKey:self->_regularityScore];
  [v5 encodeInteger:self->_totalFrequency forKey:@"totalFrequency"];
  [v5 encodeObject:self->_handleAndAppFrequencies forKey:@"handleAndAppFrequencies"];
  [v5 encodeObject:self->_handleAndAppRegularityScores forKey:@"handleAndAppRegularityScores"];
}

- (unint64_t)hash
{
  return [(NSString *)self->_contactIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_PSContactSuggestion *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(_PSContactSuggestion *)self contactIdentifier];
    if (v7
      && (uint64_t v8 = (void *)v7,
          [(_PSContactSuggestion *)v6 contactIdentifier],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      uint64_t v10 = [(_PSContactSuggestion *)self contactIdentifier];
      objc_super v11 = [(_PSContactSuggestion *)v6 contactIdentifier];
      char v12 = [v10 isEqualToString:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(_PSContactSuggestion *)self contactIdentifier];
  uint64_t v6 = [(_PSContactSuggestion *)self suggestedHandle];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %p> contactIdentifier: %@, suggestedHandle: %@", v4, self, v5, v6];

  return v7;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)suggestedHandle
{
  return self->_suggestedHandle;
}

- (void)setSuggestedHandle:(id)a3
{
}

- (double)regularityScore
{
  return self->_regularityScore;
}

- (void)setRegularityScore:(double)a3
{
  self->_regularityScore = a3;
}

- (unint64_t)totalFrequency
{
  return self->_totalFrequency;
}

- (void)setTotalFrequency:(unint64_t)a3
{
  self->_totalFrequency = a3;
}

- (NSSet)daysInteracted
{
  return self->_daysInteracted;
}

- (void)setDaysInteracted:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSString)messagesGroupIdentifier
{
  return self->_messagesGroupIdentifier;
}

- (void)setMessagesGroupIdentifier:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSArray)groupRecipients
{
  return self->_groupRecipients;
}

- (void)setGroupRecipients:(id)a3
{
}

- (NSDictionary)handleAndAppFrequencies
{
  return self->_handleAndAppFrequencies;
}

- (void)setHandleAndAppFrequencies:(id)a3
{
}

- (NSDictionary)handleAndAppRegularityScores
{
  return self->_handleAndAppRegularityScores;
}

- (void)setHandleAndAppRegularityScores:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (double)peopleWidgetScore
{
  return self->_peopleWidgetScore;
}

- (void)setPeopleWidgetScore:(double)a3
{
  self->_peopleWidgetScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_handleAndAppRegularityScores, 0);
  objc_storeStrong((id *)&self->_handleAndAppFrequencies, 0);
  objc_storeStrong((id *)&self->_groupRecipients, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_messagesGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_daysInteracted, 0);
  objc_storeStrong((id *)&self->_suggestedHandle, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end