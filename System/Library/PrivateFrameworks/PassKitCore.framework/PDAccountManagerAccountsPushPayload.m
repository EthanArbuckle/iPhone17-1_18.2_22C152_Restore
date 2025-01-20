@interface PDAccountManagerAccountsPushPayload
- (BOOL)ignoreLastUpdatedDate;
- (NSDictionary)endpointData;
- (NSString)accountIdentifier;
- (PDAccountManagerAccountsPushPayload)initWithDictionary:(id)a3;
- (id)description;
- (id)topUpTokenIdentifier;
- (unint64_t)endpoint;
- (unint64_t)featureIdentifier;
@end

@implementation PDAccountManagerAccountsPushPayload

- (PDAccountManagerAccountsPushPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v34.receiver = self;
    v34.super_class = (Class)PDAccountManagerAccountsPushPayload;
    v5 = [(PDAccountManagerAccountsPushPayload *)&v34 init];
    if (!v5)
    {
LABEL_28:
      self = v5;
      v13 = self;
      goto LABEL_29;
    }
    uint64_t v6 = [v4 PKStringForKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"featureIdentifier"];
    v5->_featureIdentifier = PKFeatureIdentifierFromString();

    v9 = [v4 PKStringForKey:@"endpoint"];
    v10 = v9;
    if (v9 == @"account") {
      goto LABEL_6;
    }
    if (v9)
    {
      unsigned __int8 v11 = [(__CFString *)v9 isEqualToString:@"account"];

      if (v11)
      {
LABEL_6:
        uint64_t v12 = 1;
LABEL_27:

        v5->_endpoint = v12;
        v32 = [v4 PKStringForKey:@"endpointData"];
        v5->_endpointData = (NSDictionary *)(id)PKDictionaryFromJSONString();

        goto LABEL_28;
      }
      v14 = v10;
      if (v14 == @"financingPlans"
        || (v15 = v14,
            unsigned __int8 v16 = [(__CFString *)v14 isEqualToString:@"financingPlans"],
            v15,
            (v16 & 1) != 0))
      {
        uint64_t v12 = 2;
        goto LABEL_27;
      }
      v17 = v15;
      if (v17 == @"fundingSources"
        || (v18 = v17,
            unsigned __int8 v19 = [(__CFString *)v17 isEqualToString:@"fundingSources"],
            v18,
            (v19 & 1) != 0))
      {
        uint64_t v12 = 3;
        goto LABEL_27;
      }
      v20 = v18;
      if (v20 == @"transfers"
        || (v21 = v20,
            unsigned __int8 v22 = [(__CFString *)v20 isEqualToString:@"transfers"],
            v21,
            (v22 & 1) != 0))
      {
        uint64_t v12 = 4;
        goto LABEL_27;
      }
      v23 = v21;
      if (v23 == @"cloudStoreZones"
        || (v24 = v23,
            unsigned __int8 v25 = [(__CFString *)v23 isEqualToString:@"cloudStoreZones"],
            v24,
            (v25 & 1) != 0))
      {
        uint64_t v12 = 5;
        goto LABEL_27;
      }
      v26 = v24;
      if (v26 == @"resetBalances"
        || (v27 = v26,
            unsigned __int8 v28 = [(__CFString *)v26 isEqualToString:@"resetBalances"],
            v27,
            (v28 & 1) != 0))
      {
        uint64_t v12 = 6;
        goto LABEL_27;
      }
      v29 = v27;
      if (v29 == @"invalidateTopUpToken"
        || (v30 = v29,
            unsigned int v31 = [(__CFString *)v29 isEqualToString:@"invalidateTopUpToken"],
            v30,
            v31))
      {
        uint64_t v12 = 7;
        goto LABEL_27;
      }
    }
    uint64_t v12 = 0;
    goto LABEL_27;
  }
  v13 = 0;
LABEL_29:

  return v13;
}

- (BOOL)ignoreLastUpdatedDate
{
  return [(NSDictionary *)self->_endpointData PKBoolForKey:@"ignoreLastUpdatedDate"];
}

- (id)topUpTokenIdentifier
{
  return [(NSDictionary *)self->_endpointData PKStringForKey:@"tokenIdentifier"];
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  id v4 = PKFeatureIdentifierToString();
  [v3 appendFormat:@"featureIdentifier: '%@'; ", v4];

  unint64_t endpoint = self->_endpoint;
  if (endpoint > 7) {
    CFStringRef v6 = @"unknown";
  }
  else {
    CFStringRef v6 = off_100746088[endpoint];
  }
  [v3 appendFormat:@"endpoint: '%@'; ", v6];
  if ([(NSDictionary *)self->_endpointData count]) {
    [v3 appendFormat:@"endpointData: '%@'; ", self->_endpointData];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (NSDictionary)endpointData
{
  return self->_endpointData;
}

- (void).cxx_destruct
{
}

@end