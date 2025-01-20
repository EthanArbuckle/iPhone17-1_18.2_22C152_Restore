@interface RTSourceEventKit(RTEventManager)
- (id)initWithEvent:()RTEventManager;
@end

@implementation RTSourceEventKit(RTEventManager)

- (id)initWithEvent:()RTEventManager
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 calendar];
    uint64_t v7 = [v6 sharingStatus];

    if (v7 == 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2 * (v7 == 2);
    }
    v9 = [v5 customObjectForKey:@"SuggestionsSchemaOrg"];
    objc_opt_class();
    uint64_t v25 = v8;
    v26 = v9;
    v24 = a1;
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      v11 = [v10 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v13 = [v10 firstObject];
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
    v15 = [v5 eventIdentifier];
    v16 = [v5 startDate];
    v17 = [v5 endDate];
    v18 = [v5 title];
    v19 = [v5 location];
    uint64_t v20 = [v5 isAllDay];
    v21 = [v5 suggestionInfo];
    v22 = [v21 opaqueKey];
    a1 = (id)[v24 initWithEventIdentifier:v15 startDate:v16 endDate:v17 title:v18 location:v19 allDay:v20 sharingStatus:v25 suggestionInfo_opaqueKey:v22 suggestionsSchemaOrg:v13];

    id v14 = a1;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end