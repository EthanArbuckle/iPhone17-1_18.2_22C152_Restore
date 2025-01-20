@interface RequestTemplateURL
- (RequestTemplateURL)urlWithString:(id)a3;
- (id)_substituteNonAuthenticatedURLPlaceholders:(id)a3;
- (id)_substituteStandardURLPlaceholders:(id)a3 account:(id)a4 udid:(id)a5;
- (id)nonAuthenticatedHostNameInURL;
- (id)nonAuthenticatedSchemeInURL;
- (id)nonAuthenticatedServiceInURL;
- (id)serviceIdentifierInURL;
- (id)unauthenticatedURLFromTemplate:(id)a3;
- (id)urlFromTemplate:(id)a3 account:(id)a4 udid:(id)a5;
@end

@implementation RequestTemplateURL

- (id)urlFromTemplate:(id)a3 account:(id)a4 udid:(id)a5
{
  v6 = [(RequestTemplateURL *)self _substituteStandardURLPlaceholders:a3 account:a4 udid:a5];
  v7 = [(RequestTemplateURL *)self urlWithString:v6];

  return v7;
}

- (id)unauthenticatedURLFromTemplate:(id)a3
{
  v4 = [(RequestTemplateURL *)self _substituteNonAuthenticatedURLPlaceholders:a3];
  v5 = [(RequestTemplateURL *)self urlWithString:v4];

  return v5;
}

- (RequestTemplateURL)urlWithString:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSURL) initWithString:v3];
  if (!v4)
  {
    v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Could not create an NSURL from the url string %@", (uint8_t *)&v7, 0xCu);
    }
  }

  return (RequestTemplateURL *)v4;
}

- (id)_substituteNonAuthenticatedURLPlaceholders:(id)a3
{
  id v4 = a3;
  v5 = [(RequestTemplateURL *)self nonAuthenticatedSchemeInURL];
  v6 = [v4 stringByReplacingOccurrencesOfString:@"${scheme}" withString:v5];

  int v7 = [(RequestTemplateURL *)self nonAuthenticatedHostNameInURL];
  id v8 = [v6 stringByReplacingOccurrencesOfString:@"${hostname}" withString:v7];

  v9 = [(RequestTemplateURL *)self nonAuthenticatedServiceInURL];
  v10 = [v8 stringByReplacingOccurrencesOfString:@"${service}" withString:v9];

  return v10;
}

- (id)_substituteStandardURLPlaceholders:(id)a3 account:(id)a4 udid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[FMDPreferencesMgr hostportOverride];
  if ([v11 length])
  {
    uint64_t v12 = [v8 stringByReplacingOccurrencesOfString:@"${hostname}" withString:v11];
  }
  else
  {
    v13 = [v9 serverHost];

    if (!v13) {
      goto LABEL_6;
    }
    uint64_t v14 = [v9 serverHost];
    uint64_t v12 = [v8 stringByReplacingOccurrencesOfString:@"${hostname}" withString:v14];

    id v8 = (id)v14;
  }

  id v8 = (id)v12;
LABEL_6:
  v15 = +[FMDPreferencesMgr protocolSchemeOverride];
  if ([v15 length])
  {
    uint64_t v16 = [v8 stringByReplacingOccurrencesOfString:@"${scheme}" withString:v15];
  }
  else
  {
    v17 = [v9 serverProtocolScheme];

    if (!v17) {
      goto LABEL_11;
    }
    uint64_t v18 = [v9 serverProtocolScheme];
    uint64_t v16 = [v8 stringByReplacingOccurrencesOfString:@"${scheme}" withString:v18];

    id v8 = (id)v18;
  }

  id v8 = (id)v16;
LABEL_11:
  v19 = [(RequestTemplateURL *)self serviceIdentifierInURL];

  if (v19)
  {
    v20 = [(RequestTemplateURL *)self serviceIdentifierInURL];
    uint64_t v21 = [v8 stringByReplacingOccurrencesOfString:@"${service}" withString:v20];

    id v8 = (id)v21;
  }
  v22 = [v9 authId];

  if (v22)
  {
    v23 = [v9 authId];
    uint64_t v24 = [v8 stringByReplacingOccurrencesOfString:@"${dsid}" withString:v23];

    id v8 = (id)v24;
  }
  if (v10)
  {
    uint64_t v25 = [v8 stringByReplacingOccurrencesOfString:@"${udid}" withString:v10];

    id v8 = (id)v25;
  }

  return v8;
}

- (id)serviceIdentifierInURL
{
  return @"findme";
}

- (id)nonAuthenticatedServiceInURL
{
  return @"turmeric";
}

- (id)nonAuthenticatedHostNameInURL
{
  return @"cadmium.icloud.com";
}

- (id)nonAuthenticatedSchemeInURL
{
  return @"https";
}

@end