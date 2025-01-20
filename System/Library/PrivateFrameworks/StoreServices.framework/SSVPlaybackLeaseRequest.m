@interface SSVPlaybackLeaseRequest
+ (id)_requestWithType:(int64_t)a3;
- (BOOL)startsLeaseSession;
- (NSData)_certificateData;
- (NSDictionary)HTTPHeaderFields;
- (NSDictionary)parameterValues;
- (NSString)_URLBagKey;
- (NSString)_actionParameterValue;
- (NSURL)_URL;
- (id)_copyBodyDictionaryWithFairPlaySession:(void *)a3;
- (id)_copyWithLeaseType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForHTTPHeaderField:(id)a3;
- (id)valueForParameter:(id)a3;
- (int64_t)_actionType;
- (int64_t)_leaseType;
- (unint64_t)KDChannelIdentifier;
- (unint64_t)_KDMovieIdentifier;
- (void)_applyValuesToCopy:(id)a3;
- (void)_setActionType:(int64_t)a3;
- (void)_setCertificateData:(id)a3;
- (void)_setKDMovieIdentifier:(unint64_t)a3;
- (void)_setURL:(id)a3;
- (void)setHTTPHeaderFields:(id)a3;
- (void)setKDChannelIdentifier:(unint64_t)a3;
- (void)setParameterValues:(id)a3;
- (void)setStartsLeaseSession:(BOOL)a3;
- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4;
- (void)setValue:(id)a3 forParameter:(id)a4;
@end

@implementation SSVPlaybackLeaseRequest

- (void)setHTTPHeaderFields:(id)a3
{
  if (self->_httpHeaderFields != a3)
  {
    v4 = (NSMutableDictionary *)[a3 mutableCopy];
    httpHeaderFields = self->_httpHeaderFields;
    self->_httpHeaderFields = v4;
  }
}

- (void)setParameterValues:(id)a3
{
  if (self->_parameters != a3)
  {
    v4 = (NSMutableDictionary *)[a3 mutableCopy];
    parameters = self->_parameters;
    self->_parameters = v4;
  }
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v12;
  id v8 = v6;
  httpHeaderFields = self->_httpHeaderFields;
  if (v12)
  {
    if (!httpHeaderFields)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = self->_httpHeaderFields;
      self->_httpHeaderFields = v10;

      id v7 = v12;
      httpHeaderFields = self->_httpHeaderFields;
    }
    [(NSMutableDictionary *)httpHeaderFields setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)httpHeaderFields removeObjectForKey:v8];
  }
}

- (void)setValue:(id)a3 forParameter:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v12;
  id v8 = v6;
  parameters = self->_parameters;
  if (v12)
  {
    if (!parameters)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = self->_parameters;
      self->_parameters = v10;

      id v7 = v12;
      parameters = self->_parameters;
    }
    [(NSMutableDictionary *)parameters setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)parameters removeObjectForKey:v8];
  }
}

- (id)valueForHTTPHeaderField:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_httpHeaderFields objectForKey:a3];
}

- (id)valueForParameter:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parameters objectForKey:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[7] = self->_leaseType;
  [(SSVPlaybackLeaseRequest *)self _applyValuesToCopy:v4];
  return v4;
}

+ (id)_requestWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    v4 = off_1E5BA6B28;
    goto LABEL_5;
  }
  if (!a3)
  {
    v4 = off_1E5BA6B50;
LABEL_5:
    v5 = objc_alloc_init(*v4);
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  v5[7] = a3;
  return v5;
}

- (id)_copyWithLeaseType:(int64_t)a3
{
  v4 = [(id)objc_opt_class() _requestWithType:a3];
  [(SSVPlaybackLeaseRequest *)self _applyValuesToCopy:v4];
  return v4;
}

- (NSString)_actionParameterValue
{
  return 0;
}

- (id)_copyBodyDictionaryWithFairPlaySession:(void *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = [(SSVPlaybackLeaseRequest *)self _actionParameterValue];
  if (v5) {
    [v4 setObject:v5 forKey:@"action"];
  }
  id v6 = +[SSDevice currentDevice];
  id v7 = [v6 uniqueDeviceIdentifier];

  if (v7) {
    [v4 setObject:v7 forKey:@"guid"];
  }
  if (self->_parameters) {
    objc_msgSend(v4, "addEntriesFromDictionary:");
  }

  return v4;
}

- (NSString)_URLBagKey
{
  return 0;
}

- (void)_applyValuesToCopy:(id)a3
{
  unint64_t kdChannelIdentifier = self->_kdChannelIdentifier;
  id v5 = a3;
  [v5 setKDChannelIdentifier:kdChannelIdentifier];
  [v5 _setKDMovieIdentifier:self->_kdMovieIdentifier];
  [v5 setParameterValues:self->_parameters];
  [v5 setStartsLeaseSession:self->_startsLeaseSession];
  [v5 setHTTPHeaderFields:self->_httpHeaderFields];
  [v5 _setActionType:self->_actionType];
  [v5 _setCertificateData:self->_certificateData];
  [v5 _setURL:self->_url];
}

- (unint64_t)KDChannelIdentifier
{
  return self->_kdChannelIdentifier;
}

- (void)setKDChannelIdentifier:(unint64_t)a3
{
  self->_unint64_t kdChannelIdentifier = a3;
}

- (NSDictionary)parameterValues
{
  return &self->_parameters->super;
}

- (NSDictionary)HTTPHeaderFields
{
  return &self->_httpHeaderFields->super;
}

- (BOOL)startsLeaseSession
{
  return self->_startsLeaseSession;
}

- (void)setStartsLeaseSession:(BOOL)a3
{
  self->_startsLeaseSession = a3;
}

- (int64_t)_actionType
{
  return self->_actionType;
}

- (void)_setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSData)_certificateData
{
  return self->_certificateData;
}

- (void)_setCertificateData:(id)a3
{
}

- (int64_t)_leaseType
{
  return self->_leaseType;
}

- (unint64_t)_KDMovieIdentifier
{
  return self->_kdMovieIdentifier;
}

- (void)_setKDMovieIdentifier:(unint64_t)a3
{
  self->_kdMovieIdentifier = a3;
}

- (NSURL)_URL
{
  return self->_url;
}

- (void)_setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_httpHeaderFields, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
}

@end