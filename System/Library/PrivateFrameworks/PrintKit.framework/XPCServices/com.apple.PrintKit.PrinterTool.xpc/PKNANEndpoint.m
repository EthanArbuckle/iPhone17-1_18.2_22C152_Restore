@interface PKNANEndpoint
- (NSDictionary)textInfo;
- (NSString)identifier;
- (NSString)name;
- (PKNANEndpoint)initWithDiscoveryResult:(id)a3;
- (WiFiAwareDiscoveryResult)discoveryResult;
- (id)debugDescription;
@end

@implementation PKNANEndpoint

- (PKNANEndpoint)initWithDiscoveryResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKNANEndpoint;
  v6 = [(PKNANEndpoint *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_discoveryResult, a3);
  }

  return v7;
}

- (id)debugDescription
{
  v3 = objc_opt_new();
  v4 = +[NSString stringWithFormat:@"Endpoint: <%@:%p>", objc_opt_class(), self];
  [v3 addObject:v4];

  id v5 = [(PKNANEndpoint *)self name];
  v6 = +[NSString stringWithFormat:@"Instance Name: %@", v5];
  [v3 addObject:v6];

  v7 = [(PKNANEndpoint *)self textInfo];
  v8 = [v7 debugDescription];
  objc_super v9 = +[NSString stringWithFormat:@"TXT Record: %@", v8];
  [v3 addObject:v9];

  v10 = [(PKNANEndpoint *)self discoveryResult];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"RSSI: %d", [v10 rssi]);
  [v3 addObject:v11];

  v12 = [(PKNANEndpoint *)self discoveryResult];
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Publisher ID: %d", [v12 publishID]);
  [v3 addObject:v13];

  v14 = [(PKNANEndpoint *)self discoveryResult];
  v15 = [v14 publisherAddress];
  v16 = +[NSString stringWithFormat:@"Publisher address: %@", v15];
  [v3 addObject:v16];

  v17 = [(PKNANEndpoint *)self discoveryResult];
  if ([v17 datapathSupported]) {
    CFStringRef v18 = @"YES";
  }
  else {
    CFStringRef v18 = @"NO";
  }
  v19 = +[NSString stringWithFormat:@"Datapath Supported: %@", v18];
  [v3 addObject:v19];

  v20 = [(PKNANEndpoint *)self discoveryResult];
  if ([v20 datapathSecurityRequired]) {
    CFStringRef v21 = @"YES";
  }
  else {
    CFStringRef v21 = @"NO";
  }
  v22 = +[NSString stringWithFormat:@"Datapath Security Required: %@", v21];
  [v3 addObject:v22];

  v23 = [(PKNANEndpoint *)self discoveryResult];
  if ([v23 furtherServiceDiscoveryRequired]) {
    CFStringRef v24 = @"YES";
  }
  else {
    CFStringRef v24 = @"NO";
  }
  v25 = +[NSString stringWithFormat:@"Further Discovery Required: %@", v24];
  [v3 addObject:v25];

  v26 = [v3 componentsJoinedByString:@"\n"];

  return v26;
}

- (NSString)identifier
{
  memset(v16, 0, sizeof(v16));
  v3 = [(PKNANEndpoint *)self discoveryResult];
  v4 = [v3 publisherAddress];
  id v5 = [v4 data];

  if (v5
    && (id v6 = v5,
        v7 = (char *)[v6 bytes],
        uint64_t v8 = (uint64_t)[v6 length],
        v8 >= 1))
  {
    objc_super v9 = v7 + 1;
    v10 = (uint64_t *)v16;
    do
    {
      unint64_t v11 = *(v9 - 1);
      *(unsigned char *)v10 = a01234567789abc[v11 >> 4];
      *((unsigned char *)v10 + 1) = a01234567789abc[v11 & 0xF];
      *((unsigned char *)v10 + 2) = 58;
      v10 = (uint64_t *)((char *)v10 + 3);
      if (v10 >= &v17) {
        break;
      }
    }
    while (v9++ < &v7[v8]);
  }
  else
  {
    v10 = (uint64_t *)v16;
  }
  v13 = [(PKNANEndpoint *)self discoveryResult];
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"peer[%.*s]-pubid[%d]", v10 - v16, v16, [v13 publishID]);

  return (NSString *)v14;
}

- (NSString)name
{
  v2 = [(PKNANEndpoint *)self discoveryResult];
  v3 = [v2 serviceSpecificInfo];
  v4 = [v3 instanceName];

  return (NSString *)v4;
}

- (NSDictionary)textInfo
{
  v3 = objc_opt_new();
  v4 = [(PKNANEndpoint *)self discoveryResult];
  id v5 = [v4 serviceSpecificInfo];
  id v6 = [v5 txtRecordData];

  if (v6)
  {
    v7 = [(PKNANEndpoint *)self discoveryResult];
    uint64_t v8 = [v7 serviceSpecificInfo];
    objc_super v9 = [v8 txtRecordData];
    v10 = +[NSNetService dictionaryFromTXTRecordData:v9];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002FE24;
    v12[3] = &unk_1000A2550;
    id v13 = v3;
    [v10 enumerateKeysAndObjectsUsingBlock:v12];
  }

  return (NSDictionary *)v3;
}

- (WiFiAwareDiscoveryResult)discoveryResult
{
  return (WiFiAwareDiscoveryResult *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end