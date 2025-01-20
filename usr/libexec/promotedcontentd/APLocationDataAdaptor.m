@interface APLocationDataAdaptor
+ (id)identifier;
- (APLocationInfo)location;
- (BOOL)_validateParameters:(id *)a3;
- (NSString)adminArea;
- (NSString)locality;
- (NSString)subAdminArea;
- (void)_run:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation APLocationDataAdaptor

+ (id)identifier
{
  return @"com.apple.ap.location";
}

- (void)_run:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[APLocationManager sharedInstance];
  v6 = [v5 locationInfo];
  location = self->_location;
  self->_location = v6;

  v8 = [(APLocationDataAdaptor *)self location];

  if (v8)
  {
    v9 = [(APDataAdaptor *)self parameters];
    v10 = [v9 objectForKeyedSubscript:@"country"];

    if (v10)
    {
      v11 = [(APDataAdaptor *)self parameters];
      v12 = [v11 objectForKeyedSubscript:@"country"];
      v13 = [(APLocationDataAdaptor *)self location];
      v14 = [v13 isoCountryCode];
      unsigned int v15 = [v12 isEqualToString:v14];

      if (!v15) {
        goto LABEL_12;
      }
    }
    v16 = [(APDataAdaptor *)self parameters];
    v17 = [v16 objectForKeyedSubscript:@"postalCode"];

    if (v17)
    {
      v18 = [(APDataAdaptor *)self parameters];
      v19 = [v18 objectForKeyedSubscript:@"postalCode"];
      v20 = [(APLocationDataAdaptor *)self location];
      v21 = [v20 postalCode];
      unsigned int v22 = [v19 isEqualToString:v21];

      if (!v22) {
        goto LABEL_12;
      }
    }
    v23 = [(APDataAdaptor *)self parameters];
    v24 = [v23 objectForKeyedSubscript:@"adminArea"];

    if (v24)
    {
      v25 = [(APDataAdaptor *)self parameters];
      v26 = [v25 objectForKeyedSubscript:@"adminArea"];
      v27 = [(APLocationDataAdaptor *)self adminArea];
      unsigned int v28 = [v26 isEqualToString:v27];

      if (!v28) {
        goto LABEL_12;
      }
    }
    v29 = [(APDataAdaptor *)self parameters];
    v30 = [v29 objectForKeyedSubscript:@"locality"];

    if (!v30) {
      goto LABEL_10;
    }
    v31 = [(APDataAdaptor *)self parameters];
    v32 = [v31 objectForKeyedSubscript:@"locality"];
    v33 = [(APLocationDataAdaptor *)self locality];
    unsigned int v34 = [v32 isEqualToString:v33];

    if (!v34)
    {
LABEL_12:
      uint64_t v40 = 0;
    }
    else
    {
LABEL_10:
      v35 = [(APDataAdaptor *)self parameters];
      v36 = [v35 objectForKeyedSubscript:@"subAdminArea"];

      if (v36)
      {
        v37 = [(APDataAdaptor *)self parameters];
        v38 = [v37 objectForKeyedSubscript:@"subAdminArea"];
        v39 = [(APLocationDataAdaptor *)self subAdminArea];
        uint64_t v40 = (uint64_t)[v38 isEqualToString:v39];
      }
      else
      {
        uint64_t v40 = 1;
      }
    }
    id v45 = +[NSNumber numberWithBool:v40];
    v4[2](v4);
  }
  else
  {
    v41 = [(APDataAdaptor *)self identifier];
    v42 = +[NSString stringWithFormat:@"Adaptor '%@': Location Services disabled on this device", v41];

    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    v47 = v42;
    v43 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    v44 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5208 userInfo:v43];

    ((void (*)(void (**)(void), void *, void, void *))v4[2])(v4, &__kCFBooleanFalse, 0, v44);
  }
}

- (BOOL)_validateParameters:(id *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)APLocationDataAdaptor;
  if (!-[APDataAdaptor _validateParameters:](&v17, "_validateParameters:")) {
    return 0;
  }
  v5 = [(APDataAdaptor *)self parameters];
  v6 = [v5 objectForKeyedSubscript:@"country"];
  if ([(APDataAdaptor *)self _checkClassType:v6 name:@"country" expectedClass:objc_opt_class() error:a3])
  {
    v7 = [(APDataAdaptor *)self parameters];
    v8 = [v7 objectForKeyedSubscript:@"adminArea"];
    if ([(APDataAdaptor *)self _checkClassType:v8 name:@"adminArea" expectedClass:objc_opt_class() error:a3])
    {
      v9 = [(APDataAdaptor *)self parameters];
      v10 = [v9 objectForKeyedSubscript:@"subAdminArea"];
      if ([(APDataAdaptor *)self _checkClassType:v10 name:@"subAdminArea" expectedClass:objc_opt_class() error:a3])
      {
        v16 = [(APDataAdaptor *)self parameters];
        unsigned int v15 = [v16 objectForKeyedSubscript:@"postalCode"];
        if ([(APDataAdaptor *)self _checkClassType:v15 name:@"postalCode" expectedClass:objc_opt_class() error:a3])
        {
          v14 = [(APDataAdaptor *)self parameters];
          v11 = [v14 objectForKeyedSubscript:@"locality"];
          BOOL v12 = [(APDataAdaptor *)self _checkClassType:v11 name:@"locality" expectedClass:objc_opt_class() error:a3];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NSString)adminArea
{
  v3 = [(APLocationDataAdaptor *)self location];
  v4 = [v3 isoCountryCode];
  v5 = [(APLocationDataAdaptor *)self location];
  v6 = [v5 administrativeArea];
  v7 = +[NSString stringWithFormat:@"%@|%@", v4, v6];

  return (NSString *)v7;
}

- (NSString)subAdminArea
{
  v3 = [(APLocationDataAdaptor *)self location];
  v4 = [v3 isoCountryCode];
  v5 = [(APLocationDataAdaptor *)self location];
  v6 = [v5 administrativeArea];
  v7 = [(APLocationDataAdaptor *)self location];
  v8 = [v7 subAdministrativeArea];
  v9 = +[NSString stringWithFormat:@"%@|%@|%@", v4, v6, v8];

  return (NSString *)v9;
}

- (NSString)locality
{
  v3 = [(APLocationDataAdaptor *)self location];
  v4 = [v3 isoCountryCode];
  v5 = [(APLocationDataAdaptor *)self location];
  v6 = [v5 administrativeArea];
  v7 = [(APLocationDataAdaptor *)self location];
  v8 = [v7 locality];
  v9 = +[NSString stringWithFormat:@"%@|%@|%@", v4, v6, v8];

  return (NSString *)v9;
}

- (APLocationInfo)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end