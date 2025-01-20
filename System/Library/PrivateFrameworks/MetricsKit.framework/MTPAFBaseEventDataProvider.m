@interface MTPAFBaseEventDataProvider
- (id)isOffline:(id)a3;
- (id)knownFields;
- (id)osLanguages:(id)a3;
@end

@implementation MTPAFBaseEventDataProvider

- (id)knownFields
{
  v7.receiver = self;
  v7.super_class = (Class)MTPAFBaseEventDataProvider;
  v2 = [(MTBaseEventDataProvider *)&v7 knownFields];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"app", @"appVersion", @"baseVersion", @"clientEventId", @"clientId", @"connection", @"dsId", @"eventTime", @"eventVersion", @"hardwareFamily", @"hardwareModel", @"isOffline", @"os", @"osBuildNumber", @"osLanguages", @"osVersion", @"resourceRevNum",
      @"storeFrontHeader",
      @"timezoneOffset",
      @"userAgent",
      @"xpPostFrequency",
      @"xpSendMethod",
      @"xpVersionMetricsKit",
      0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)isOffline:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(MTEventDataProvider *)self delegate];
    v8 = [v7 isOffline:v4];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)osLanguages:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 osLanguages:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  v9 = [v4 objectForKeyedSubscript:@"osLanguages"];
  objc_super v7 = v9;
  if (v9)
  {
    id v8 = v9;
    objc_super v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 osLanguages];

LABEL_7:

  return v10;
}

@end