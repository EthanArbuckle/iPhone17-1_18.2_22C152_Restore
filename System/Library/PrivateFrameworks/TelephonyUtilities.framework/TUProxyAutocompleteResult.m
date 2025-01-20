@interface TUProxyAutocompleteResult
- (BOOL)mostRecentCallWasMissed;
- (CNAutocompleteResult)autocompleteResult;
- (CNContact)backingContact;
- (NSArray)handles;
- (NSArray)idsCanonicalDestinations;
- (NSString)backingContactIdentifier;
- (NSString)destinationId;
- (NSString)displayName;
- (NSString)isoCountryCode;
- (TUProxyAutocompleteResult)init;
- (TUProxyAutocompleteResult)initWithAutocompleteResult:(id)a3;
- (int64_t)mostRecentCallType;
- (void)setAutocompleteResult:(id)a3;
@end

@implementation TUProxyAutocompleteResult

- (TUProxyAutocompleteResult)initWithAutocompleteResult:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUProxyAutocompleteResult;
  v5 = [(TUProxyAutocompleteResult *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TUProxyAutocompleteResult *)v5 setAutocompleteResult:v4];
  }

  return v6;
}

- (TUProxyAutocompleteResult)init
{
  id v4 = NSString;
  v5 = [NSString stringWithUTF8String:"-[TUProxyAutocompleteResult init]"];
  v6 = [v4 stringWithFormat:@"Don't call %@, call designated initializer instead.", v5];
  NSLog(&cfstr_TuassertionFai.isa, v6);

  if (_TUAssertShouldCrashApplication())
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v8 = [NSString stringWithUTF8String:"-[TUProxyAutocompleteResult init]"];
    [v7 handleFailureInMethod:a2, self, @"TUProxyAutocompleteResult.m", 41, @"Don't call %@, call designated initializer instead.", v8 object file lineNumber description];
  }
  return 0;
}

- (NSString)displayName
{
  v3 = [(TUProxyAutocompleteResult *)self autocompleteResult];
  id v4 = [v3 displayName];

  if (!v4)
  {
    id v4 = [(TUProxyAutocompleteResult *)self destinationId];
  }

  return (NSString *)v4;
}

- (CNContact)backingContact
{
  v3 = +[TUSearchController sharedInstance];
  id v4 = [v3 contactStore];

  v5 = [(TUProxyAutocompleteResult *)self autocompleteResult];
  v6 = [v5 identifier];
  v7 = [v4 contactForIdentifier:v6];

  return (CNContact *)v7;
}

- (NSString)backingContactIdentifier
{
  v2 = [(TUProxyAutocompleteResult *)self autocompleteResult];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)destinationId
{
  v3 = [(TUProxyAutocompleteResult *)self autocompleteResult];
  id v4 = [v3 value];
  v5 = [v4 address];

  if (!v5)
  {
    v6 = [(TUProxyAutocompleteResult *)self backingContact];
    v5 = [v6 anyDestinationID];
  }

  return (NSString *)v5;
}

- (NSString)isoCountryCode
{
  return (NSString *)&stru_1EECEA668;
}

- (NSArray)handles
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(TUProxyAutocompleteResult *)self backingContact];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 phoneNumberStrings];
    v6 = [v4 emailAddressStrings];
    v7 = [v5 arrayByAddingObjectsFromArray:v6];

LABEL_5:
    goto LABEL_6;
  }
  objc_super v8 = [(TUProxyAutocompleteResult *)self destinationId];

  if (v8)
  {
    v5 = [(TUProxyAutocompleteResult *)self destinationId];
    v10[0] = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:

  return (NSArray *)v7;
}

- (int64_t)mostRecentCallType
{
  return 3;
}

- (BOOL)mostRecentCallWasMissed
{
  return 0;
}

- (NSArray)idsCanonicalDestinations
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(TUProxyAutocompleteResult *)self destinationId];
  v5 = [v4 IDSFormattedDestinationID];

  if (v5) {
    [v3 addObject:v5];
  }
  v6 = [(TUProxyAutocompleteResult *)self backingContact];

  if (v6)
  {
    v7 = [(TUProxyAutocompleteResult *)self backingContact];
    objc_super v8 = [v7 allIDSDestinations];
    [v3 addObjectsFromArray:v8];
  }
  v9 = [v3 allObjects];

  return (NSArray *)v9;
}

- (CNAutocompleteResult)autocompleteResult
{
  return self->_autocompleteResult;
}

- (void)setAutocompleteResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end