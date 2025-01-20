@interface PKPrinterBonjourEndpoint
+ (id)txtFromGetPrinterAttributes:(const GET_PRINTER_ATTRIBUTES_Response *)a3 url:(id)a4;
+ (void)_finishResolveEndpointArray:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
+ (void)resolveEndpoint:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
+ (void)resolveWithBonjourEndpoint:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
+ (void)resolveWithURL:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)resolveWithinPrinterToolWithTimeout:(double)a3 completionHandler:(id)a4;
@end

@implementation PKPrinterBonjourEndpoint

- (void)resolveWithinPrinterToolWithTimeout:(double)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, PKPrinterBonjourEndpoint *))a4;
  v7 = [(PKPrinterBonjourEndpoint *)self resolvedURL];
  if (v7
    && ([(PKPrinterBonjourEndpoint *)self resolvedTXT],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v6[2](v6, self);
  }
  else
  {
    v9 = objc_opt_class();
    v10 = [(PKPrinterBonjourEndpoint *)self nwEndpoint];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000608E4;
    v11[3] = &unk_1000A3DA8;
    v11[4] = self;
    v12 = v6;
    [v9 resolveEndpoint:v10 timeout:v11 completionHandler:a3];
  }
}

+ (id)txtFromGetPrinterAttributes:(const GET_PRINTER_ATTRIBUTES_Response *)a3 url:(id)a4
{
  id v42 = a4;
  v5 = objc_opt_new();
  [v5 setObject:@"1" forKeyedSubscript:@"txtvers"];
  [v5 setObject:@"1" forKeyedSubscript:@"qtotal"];
  v6 = [v42 path];
  [v5 setObject:v6 forKeyedSubscript:@"rp"];

  v7 = Printd_Parameters::_get_PrinterMakeAndModel(&a3->var0);
  [v5 setObject:v7 forKeyedSubscript:@"ty"];

  v8 = Printd_Parameters::_get_PrinterMoreInfo(&a3->var0);
  v9 = [v8 absoluteString];
  [v5 setObject:v9 forKeyedSubscript:@"adminurl"];

  v10 = Printd_Parameters::_get_PrinterKind(&a3->var0);
  v11 = [v10 componentsJoinedByString:@","];
  [v5 setObject:v11 forKeyedSubscript:@"kind"];

  v12 = Printd_Parameters::_get_PrinterLocation(&a3->var0);
  [v5 setObject:v12 forKeyedSubscript:@"note"];

  v13 = [v5 objectForKeyedSubscript:@"ty"];

  if (v13)
  {
    v14 = [v5 objectForKeyedSubscript:@"ty"];
    v15 = +[NSString stringWithFormat:@"(%@)", v14];
    [v5 setObject:v15 forKeyedSubscript:@"product"];
  }
  if (!Printd_Parameters::_has_PrintColorModeSupported(&a3->var0))
  {
    if (!Printd_Parameters::_has_OutputModeSupported(&a3->var0)) {
      goto LABEL_9;
    }
    v18 = Printd_Parameters::_get_OutputModeSupported(&a3->var0);
    unsigned int v19 = [v18 containsObject:@"color"];

    if (!v19) {
      goto LABEL_9;
    }
LABEL_8:
    CFStringRef v20 = @"T";
    goto LABEL_10;
  }
  v16 = Printd_Parameters::_get_PrintColorModeSupported(&a3->var0);
  unsigned __int8 v17 = [v16 containsObject:@"color"];

  if (v17) {
    goto LABEL_8;
  }
LABEL_9:
  CFStringRef v20 = @"F";
LABEL_10:
  [v5 setObject:v20 forKeyedSubscript:@"color"];
  v21 = Printd_Parameters::_get_SidesSupported(&a3->var0);
  unsigned int v22 = [v21 containsObject:@"two-sided-long-edge"];

  if (v22) {
    CFStringRef v23 = @"T";
  }
  else {
    CFStringRef v23 = @"F";
  }
  [v5 setObject:v23 forKeyedSubscript:@"duplex"];
  v24 = Printd_Parameters::_get_DocumentFormatSupported(&a3->var0);
  v25 = [v24 componentsJoinedByString:@","];
  [v5 setObject:v25 forKeyedSubscript:@"pdl"];

  v26 = Printd_Parameters::_get_URFSupported(&a3->var0);
  v27 = [v26 componentsJoinedByString:@","];
  [v5 setObject:v27 forKeyedSubscript:@"urf"];

  v28 = Printd_Parameters::_get_PrinterUUID(&a3->var0);
  v29 = [v28 absoluteString];

  if (v29)
  {
    if ([v29 hasPrefix:@"urn:uuid:"])
    {
      uint64_t v30 = [v29 substringFromIndex:objc_msgSend(@"urn:uuid:", "length")];

      v29 = (void *)v30;
    }
    [v5 setObject:v29 forKeyedSubscript:@"uuid"];
  }
  v31 = Printd_Parameters::_get_PrinterDNS_SD_Name(&a3->var0);
  if (!v31)
  {
    v31 = Printd_Parameters::_get_PrinterMakeAndModel(&a3->var0);
  }
  [v5 setObject:v31 forKeyedSubscript:@"display-name"];
  v32 = Printd_Parameters::_get_URIAuthenticationSupported(&a3->var0);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100061050;
  v47[3] = &unk_1000A3DD0;
  id v33 = v5;
  id v48 = v33;
  [v32 enumerateObjectsUsingBlock:v47];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v34 = [&off_1000B9028 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v44;
    while (2)
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(&off_1000B9028);
        }
        uint64_t v37 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v38 = [v33 objectForKey:v37];
        BOOL v39 = v38 == 0;

        if (v39)
        {
          v40 = _PKLogCategory(PKLogCategoryDiscovery[0]);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v50 = v42;
            __int16 v51 = 2114;
            uint64_t v52 = v37;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "txt record for '%{public}@' does not contain '%{public}@', not AirPrint compliant", buf, 0x16u);
          }

          id v33 = 0;
          goto LABEL_31;
        }
      }
      id v34 = [&off_1000B9028 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }
LABEL_31:

  return v33;
}

+ (void)resolveWithURL:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = v7;
  if (v6)
  {
    v9 = +[IPPSession globalSession];
    v10 = [v9 ippURL:v6];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100061244;
    v11[3] = &unk_1000A3E48;
    id v12 = v6;
    id v13 = v8;
    +[device_http_t deviceHTTPForSessionURL:v10 completionHandler:v11];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

+ (void)_finishResolveEndpointArray:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v28 = (void (**)(id, void *, void *))a5;
  unint64_t v8 = 0;
  v9 = 0;
  v10 = 0;
  *(void *)&long long v11 = 138543362;
  long long v25 = v11;
  while (nw_array_get_count() > v8)
  {
    if (v10 && v9) {
      goto LABEL_37;
    }
    id v12 = nw_array_get_object_at_index();
    id v13 = v12;
    if (!v9)
    {
      nw_txt_record_t v14 = nw_endpoint_copy_txt_record(v12);
      if (v14)
      {
        v9 = +[PKTXTRecord txtRecordDictionaryForTxtRecord:v14];
      }
      else
      {
        v9 = 0;
      }
    }
    if (!v10)
    {
      nw_endpoint_type_t type = nw_endpoint_get_type(v13);
      if (type == nw_endpoint_type_host)
      {
        unsigned __int8 v17 = v13;
        id v29 = v9;
        uint64_t v18 = +[PKPrinterBonjourEndpoint serviceFromEndpoint:v17];
        if (v18) {
          unsigned int v19 = (__CFString *)v18;
        }
        else {
          unsigned int v19 = @"_ipp._tcp.";
        }
        CFStringRef v20 = @"ipps";
        if (([(__CFString *)v19 hasPrefix:@"_ipps.", v25] & 1) != 0
          || (CFStringRef v20 = @"ipp", ([(__CFString *)v19 hasPrefix:@"_ipp."] & 1) != 0)
          || (CFStringRef v20 = @"http", ([(__CFString *)v19 hasPrefix:@"_http."] & 1) != 0)
          || (CFStringRef v20 = @"https",
              ([(__CFString *)v19 hasPrefix:@"_https."] & 1) != 0))
        {
          hostname = nw_endpoint_get_hostname(v17);
          if (hostname)
          {
            unsigned int v22 = +[NSString stringWithUTF8String:hostname];
            if (v22)
            {
              uint64_t port = nw_endpoint_get_port(v17);
              if (port)
              {
                v27 = +[NSNumber numberWithUnsignedShort:port];
              }
              else
              {
                v27 = 0;
              }
              v24 = [v29 objectForKeyedSubscript:@"rp"];
              v10 = PKURLWithComponents(v20, v22, v27, v24);

              if (port) {
              goto LABEL_32;
              }
            }
          }
          else
          {
            unsigned int v22 = 0;
          }
        }
        else
        {
          unsigned int v22 = _PKLogCategory(PKLogCategoryNetwork[0]);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v31 = v19;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unknown scheme %{public}@", buf, 0xCu);
          }
        }
        v10 = 0;
LABEL_32:

        goto LABEL_11;
      }
      if (type == nw_endpoint_type_url)
      {
        url = nw_endpoint_get_url(v13);
        v10 = PKURLWithUTF8String((uint64_t)url);
      }
      else
      {
        v10 = 0;
      }
    }
LABEL_11:

    ++v8;
  }
  if (v10)
  {
    if (v9)
    {
LABEL_37:
      v28[2](v28, v10, v9);
      goto LABEL_40;
    }
    [a1 resolveWithURL:v10 timeout:v28 completionHandler:a4];
  }
  else
  {
    v28[2](v28, 0, v9);
  }
LABEL_40:
}

+ (void)resolveWithBonjourEndpoint:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  CFStringRef v23 = sub_100061678;
  v24 = sub_100061688;
  id v25 = (id)nw_resolver_create_with_endpoint();
  if (v21[5])
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_create("com.apple.printing.BrowseInfo", v9);

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100061E40;
    block[3] = &unk_1000A3E70;
    unsigned int v19 = &v20;
    id v12 = v8;
    id v18 = v12;
    dispatch_after(v11, v10, block);
    v15 = v10;
    id v16 = v12;
    id v13 = v10;
    nw_resolver_set_update_handler();
  }
  else
  {
    nw_txt_record_t v14 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Couldn't create resolver for %{private}@", buf, 0xCu);
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
  _Block_object_dispose(&v20, 8);
}

+ (void)resolveEndpoint:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 copyCEndpoint];
  nw_endpoint_type_t type = nw_endpoint_get_type(v10);
  if (type == nw_endpoint_type_bonjour_service)
  {
    [a1 resolveWithBonjourEndpoint:v10 timeout:v9 completionHandler:a4];
    goto LABEL_17;
  }
  if (type != nw_endpoint_type_url)
  {
    v15 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't resolve from this endpoint: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_9;
  }
  url = nw_endpoint_get_url(v10);
  id v13 = url;
  if (!url)
  {
    v15 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't resolve from this url endpoint: %{public}@", (uint8_t *)&v17, 0xCu);
    }
LABEL_9:

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    goto LABEL_17;
  }
  nw_txt_record_t v14 = PKURLWithUTF8String((uint64_t)url);
  if (v14)
  {
    [a1 resolveWithURL:v14 timeout:v9 completionHandler:a4];
  }
  else
  {
    id v16 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446210;
      id v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Can't resolve from this url string: %{public}s", (uint8_t *)&v17, 0xCu);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }

LABEL_17:
}

@end