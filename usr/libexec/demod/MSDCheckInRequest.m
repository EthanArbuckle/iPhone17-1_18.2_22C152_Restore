@interface MSDCheckInRequest
- (BOOL)hasFactoryContent;
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSString)countryCode;
- (NSString)language;
- (NSString)osVersion;
- (NSString)serialNumber;
- (id)getPostData;
- (id)getUrl;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setCountryCode:(id)a3;
- (void)setHasFactoryContent:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation MSDCheckInRequest

- (BOOL)isValid
{
  v8.receiver = self;
  v8.super_class = (Class)MSDCheckInRequest;
  if (![(MSDDemoUnitServerRequest *)&v8 isValid]) {
    return 0;
  }
  v3 = [(MSDCheckInRequest *)self serialNumber];
  if (v3)
  {
    v4 = [(MSDCheckInRequest *)self osVersion];
    if (v4)
    {
      v5 = [(MSDCheckInRequest *)self language];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)getPostData
{
  v14[0] = @"serial_number";
  v3 = [(MSDCheckInRequest *)self serialNumber];
  v15[0] = v3;
  v14[1] = @"os_version";
  v4 = [(MSDCheckInRequest *)self osVersion];
  v15[1] = v4;
  v14[2] = @"language";
  v5 = [(MSDCheckInRequest *)self language];
  v15[2] = v5;
  v14[3] = @"country";
  BOOL v6 = [(MSDCheckInRequest *)self countryCode];
  v15[3] = v6;
  v14[4] = @"has_factory_content";
  v7 = +[NSNumber numberWithBool:[(MSDCheckInRequest *)self hasFactoryContent]];
  v15[4] = v7;
  objc_super v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request dictionary to check_in: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  v10 = [v8 convertToNSData];

  return v10;
}

- (id)getUrl
{
  v2 = [(MSDCommandServerRequest *)self deviceUDID];
  v3 = +[NSString stringWithFormat:@"/api/device/1/%@/check_in", v2];

  return v3;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MSDCheckInRequest;
  objc_super v8 = [(MSDServerRequest *)&v20 parseResponseForError:v6 andPayload:v7];
  v9 = [v8 error];

  if (v9)
  {
    v13 = 0;
    v10 = 0;
    id v11 = v6;
  }
  else
  {
    id v19 = v6;
    v10 = [(MSDCommandServerRequest *)self getDataDictFromPayload:v7 error:&v19];
    id v11 = v19;

    if (v10)
    {
      int v12 = [v10 objectForKey:@"eligible"];
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [v8 setEligible:[v12 BOOLValue]];
        v13 = [v10 objectForKey:@"show_ui"];

        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v8 setShowUI:[v13 BOOLValue]];
            goto LABEL_8;
          }
        }
        v15 = sub_100068600();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000D23D0(self);
        }
        int v12 = v13;
      }
      else
      {
        v15 = sub_100068600();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1000D23D0(self);
        }
      }

      v13 = v12;
    }
    else
    {
      v13 = 0;
    }
  }
  v16 = [v8 error];

  if (!v16)
  {
    id v18 = v11;
    sub_1000C3140(&v18, 3727744512, @"Unexpected server response.");
    id v17 = v18;

    [v8 setError:v17];
    id v11 = v17;
  }
LABEL_8:

  return v8;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (BOOL)hasFactoryContent
{
  return self->_hasFactoryContent;
}

- (void)setHasFactoryContent:(BOOL)a3
{
  self->_hasFactoryContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end