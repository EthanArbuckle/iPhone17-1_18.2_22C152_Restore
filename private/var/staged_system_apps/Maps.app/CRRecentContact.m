@interface CRRecentContact
- (NSString)_maps_diffableDataSourceIdentifier;
- (double)timestamp;
- (id)entryWithTicket:(id)a3;
- (void)updateModel:(id)a3;
@end

@implementation CRRecentContact

- (void)updateModel:(id)a3
{
  id v18 = a3;
  v4 = [(CRRecentContact *)self metadata];
  v5 = [v4 objectForKeyedSubscript:CRRecentContactMetadataFrom];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_21;
  }
  v6 = [v5 objectForKeyedSubscript:CRRecentContactMetadataFromDisplayName];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  v9 = [v5 objectForKeyedSubscript:CRRecentContactMetadataFromAddress];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  v11 = [v5 objectForKeyedSubscript:CRRecentContactMetadataFromAddressKind];

  if ([v11 isEqual:CRAddressKindEmail])
  {
    v12 = (id *)&CNContactEmailAddressesKey;
  }
  else
  {
    if (![v11 isEqual:CRAddressKindPhoneNumber])
    {
      id v13 = 0;
LABEL_17:
      id v15 = v7;
      if (!v15) {
        id v15 = v10;
      }
      v8 = v15;
      goto LABEL_20;
    }
    v12 = (id *)&CNContactPhoneNumbersKey;
  }
  id v13 = *v12;
  if (!v10) {
    goto LABEL_17;
  }
  v14 = +[AddressBookManager sharedManager];
  v8 = [v14 senderNameForAddress:v10 ofType:v13];

  if (!v8) {
    goto LABEL_17;
  }
LABEL_20:

LABEL_21:
  v16 = [(CRRecentContact *)self address];
  [v18 setFirstLine:v16];

  if (v8)
  {
    [v18 setSecondLine:v8];
  }
  else
  {
    v17 = [(CRRecentContact *)self address];
    [v18 setSecondLine:v17];
  }
  [v18 setDebugSubtitle:@"[Recent Contact]"];
}

- (id)entryWithTicket:(id)a3
{
  id v4 = [objc_alloc((Class)GEORPSuggestionEntry) initWithType:7];
  v5 = [(CRRecentContact *)self address];
  [v4 safeAddDisplayLine:v5];

  return v4;
}

- (double)timestamp
{
  v2 = [(CRRecentContact *)self mostRecentDate];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return +[NSString stringWithFormat:@"%lld", [(CRRecentContact *)self contactID]];
}

@end