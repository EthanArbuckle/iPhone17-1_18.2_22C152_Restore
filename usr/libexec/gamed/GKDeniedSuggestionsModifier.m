@interface GKDeniedSuggestionsModifier
- (GKDeniedSuggestionsModifier)initWithDeniedContactIDs:(id)a3;
- (NSSet)deniedContactIDs;
- (id)modifySuggestions:(id)a3;
- (id)nonDeniedRecipientsFromInitialRecipients:(id)a3;
- (void)setDeniedContactIDs:(id)a3;
@end

@implementation GKDeniedSuggestionsModifier

- (GKDeniedSuggestionsModifier)initWithDeniedContactIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKDeniedSuggestionsModifier;
  v6 = [(GKDeniedSuggestionsModifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deniedContactIDs, a3);
  }

  return v7;
}

- (id)modifySuggestions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(GKDeniedSuggestionsModifier *)self nonDeniedRecipientsFromInitialRecipients:v4];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)nonDeniedRecipientsFromInitialRecipients:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009C5F0;
  v5[3] = &unk_1002D8470;
  v5[4] = self;
  v3 = [a3 _gkFilterWithBlock:v5];

  return v3;
}

- (NSSet)deniedContactIDs
{
  return self->_deniedContactIDs;
}

- (void)setDeniedContactIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end