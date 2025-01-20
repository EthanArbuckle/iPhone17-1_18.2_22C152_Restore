@interface SCMLPeopleDetectorConfiguration
- (NSLocale)locale;
- (NSString)modelManagerServicesUseCaseID;
- (SCMLPeopleDetectorConfiguration)initWithModelManagerServicesUseCaseID:(id)a3;
- (int)onBehalfOfProcessID;
- (void)setLocale:(id)a3;
- (void)setModelManagerServicesUseCaseID:(id)a3;
- (void)setOnBehalfOfProcessID:(int)a3;
@end

@implementation SCMLPeopleDetectorConfiguration

- (SCMLPeopleDetectorConfiguration)initWithModelManagerServicesUseCaseID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCMLPeopleDetectorConfiguration;
  v5 = [(SCMLPeopleDetectorConfiguration *)&v8 init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
    [(SCMLPeopleDetectorConfiguration *)v5 setLocale:v6];

    [(SCMLPeopleDetectorConfiguration *)v5 setOnBehalfOfProcessID:0xFFFFFFFFLL];
    [(SCMLPeopleDetectorConfiguration *)v5 setModelManagerServicesUseCaseID:v4];
  }

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (int)onBehalfOfProcessID
{
  return self->_onBehalfOfProcessID;
}

- (void)setOnBehalfOfProcessID:(int)a3
{
  self->_onBehalfOfProcessID = a3;
}

- (NSString)modelManagerServicesUseCaseID
{
  return self->_modelManagerServicesUseCaseID;
}

- (void)setModelManagerServicesUseCaseID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelManagerServicesUseCaseID, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end