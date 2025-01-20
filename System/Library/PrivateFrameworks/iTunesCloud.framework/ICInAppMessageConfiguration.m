@interface ICInAppMessageConfiguration
- (ICInAppMessageConfiguration)initWithDictionary:(id)a3;
- (NSURL)reportEventURL;
- (NSURL)resourceDomainURL;
- (NSURL)serialCheckURL;
- (NSURL)syncURL;
- (int64_t)syncPollingInterval;
@end

@implementation ICInAppMessageConfiguration

- (void).cxx_destruct
{
}

- (int64_t)syncPollingInterval
{
  return [(NSDictionary *)self->_dictionary ic_int64ValueForKey:@"inAppMessagesPollingIntervalSeconds"];
}

- (NSURL)resourceDomainURL
{
  v2 = [(NSDictionary *)self->_dictionary ic_stringValueForKey:@"inAppMessagesResourceDomain"];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)syncURL
{
  v2 = [(NSDictionary *)self->_dictionary ic_stringValueForKey:@"inAppMessagesSync"];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)serialCheckURL
{
  v2 = [(NSDictionary *)self->_dictionary ic_stringValueForKey:@"inAppMessagesSerialCheck"];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)reportEventURL
{
  v2 = [(NSDictionary *)self->_dictionary ic_stringValueForKey:@"inAppMessagesReportEvent"];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (ICInAppMessageConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICInAppMessageConfiguration;
  v5 = [(ICInAppMessageConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end