@interface COSAAGenericTermsUIRequest
+ (id)clientInfoHeaderForDevice:(id)a3;
+ (id)deviceModelHeaderName;
+ (id)pairedClientInfoHeaderName;
- (BOOL)showWarranty;
- (COSAAGenericTermsUIRequest)initWithGizmoDevice:(id)a3 showWarranty:(BOOL)a4;
- (NRDevice)device;
- (NSURLRequest)urlRequest;
- (void)setDevice:(id)a3;
- (void)setShowWarranty:(BOOL)a3;
@end

@implementation COSAAGenericTermsUIRequest

+ (id)clientInfoHeaderForDevice:(id)a3
{
  uint64_t v3 = NRDevicePropertyProductType;
  id v4 = a3;
  v5 = [v4 valueForProperty:v3];
  v6 = +[NSString stringWithFormat:@"%@", v5];

  v7 = [v4 valueForProperty:NRDevicePropertySystemName];
  v8 = [v4 valueForProperty:NRDevicePropertySystemVersion];
  v9 = [v4 valueForProperty:NRDevicePropertySystemBuildVersion];

  v10 = +[NSString stringWithFormat:@"%@;%@;%@", v7, v8, v9];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 infoDictionary];
  v13 = [v12 objectForKey:kCFBundleVersionKey];

  v14 = +[NSBundle mainBundle];
  v15 = [v14 infoDictionary];
  v16 = [v15 objectForKey:kCFBundleVersionKey];

  v17 = [v11 bundleIdentifier];
  v18 = [v14 bundleIdentifier];
  v19 = +[NSString stringWithFormat:@"%@/%@ (%@/%@)", v17, v13, v18, v16];

  v20 = +[NSString stringWithFormat:@"<%@> <%@> <%@>", v6, v10, v19];

  return v20;
}

+ (id)pairedClientInfoHeaderName
{
  return @"X-MMe-Paired-Client-Info";
}

+ (id)deviceModelHeaderName
{
  return @"X-MMe-Device-Model";
}

- (COSAAGenericTermsUIRequest)initWithGizmoDevice:(id)a3 showWarranty:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v4)
  {
    v8 = [&off_10025BD70 arrayByAddingObject:&off_10025C500];
  }
  else
  {
    v8 = &off_10025BD70;
  }
  v14[0] = @"terms";
  v14[1] = @"format";
  v15[0] = v8;
  v15[1] = kAAProtocolGenericTermsUIBuddyMLKey;
  v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v13.receiver = self;
  v13.super_class = (Class)COSAAGenericTermsUIRequest;
  v10 = [(COSAAGenericTermsUIRequest *)&v13 initWithParameters:v9];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    v11->_showWarranty = v4;
  }

  return v11;
}

- (NSURLRequest)urlRequest
{
  v13.receiver = self;
  v13.super_class = (Class)COSAAGenericTermsUIRequest;
  uint64_t v3 = [(COSAAGenericTermsUIRequest *)&v13 urlRequest];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = [v3 mutableCopy];
    }
    v5 = v4;
    v6 = [(id)objc_opt_class() clientInfoHeaderForDevice:self->_device];
    id v7 = [(id)objc_opt_class() pairedClientInfoHeaderName];
    [v5 addValue:v6 forHTTPHeaderField:v7];

    v8 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyModelNumber];
    v9 = [(id)objc_opt_class() deviceModelHeaderName];
    [v5 addValue:v8 forHTTPHeaderField:v9];

    if (self->_showWarranty) {
      [v5 setValue:@"true" forHTTPHeaderField:@"X-MMe-Show-Warranty"];
    }
    v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL showWarranty = self->_showWarranty;
      *(_DWORD *)buf = 67110146;
      int v15 = 84;
      __int16 v16 = 2080;
      v17 = "-[COSAAGenericTermsUIRequest urlRequest]";
      __int16 v18 = 2112;
      v19 = v6;
      __int16 v20 = 2112;
      v21 = v8;
      __int16 v22 = 1024;
      BOOL v23 = showWarranty;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%d %s: Gizmo Info Header: %@; Model Number: %@; Show Warranty: %d",
        buf,
        0x2Cu);
    }
  }
  else
  {
    v5 = 0;
  }

  return (NSURLRequest *)v5;
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)showWarranty
{
  return self->_showWarranty;
}

- (void)setShowWarranty:(BOOL)a3
{
  self->_BOOL showWarranty = a3;
}

- (void).cxx_destruct
{
}

@end