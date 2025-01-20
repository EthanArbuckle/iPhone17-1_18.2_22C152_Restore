@interface WFWeatherDataServiceParserMetadataV1
- (BOOL)temporarilyUnavailable;
- (NSDate)expireDate;
- (NSDate)readDate;
- (NSString)language;
- (NSString)providerName;
- (NSURL)providerLogoURL;
- (WFLocation)location;
- (int64_t)dataOrigination;
- (unint64_t)version;
- (void)setDataOrigination:(int64_t)a3;
- (void)setExpireDate:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLocation:(id)a3;
- (void)setProviderLogoURL:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setReadDate:(id)a3;
- (void)setTemporarilyUnavailable:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation WFWeatherDataServiceParserMetadataV1

- (NSDate)readDate
{
  return self->_readDate;
}

- (void)setReadDate:(id)a3
{
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (void)setExpireDate:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (NSURL)providerLogoURL
{
  return self->_providerLogoURL;
}

- (void)setProviderLogoURL:(id)a3
{
}

- (int64_t)dataOrigination
{
  return self->_dataOrigination;
}

- (void)setDataOrigination:(int64_t)a3
{
  self->_dataOrigination = a3;
}

- (BOOL)temporarilyUnavailable
{
  return self->_temporarilyUnavailable;
}

- (void)setTemporarilyUnavailable:(BOOL)a3
{
  self->_temporarilyUnavailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerLogoURL, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_readDate, 0);
}

@end