@interface TCCDIconGenerator
+ (id)_iconForService:(id)a3;
+ (id)_writeIcon:(id)a3 withDescriptor:(id)a4 toTempURL:(id)a5;
+ (id)createIconForTCCService:(id)a3 withTempDirectory:(id)a4;
@end

@implementation TCCDIconGenerator

+ (id)createIconForTCCService:(id)a3 withTempDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:@"%@.png", v5];
  v17[0] = v6;
  v17[1] = v7;
  v8 = +[NSArray arrayWithObjects:v17 count:2];
  v9 = +[NSURL fileURLWithPathComponents:v8];

  v10 = +[NSFileManager defaultManager];
  v11 = [v9 path];
  unsigned int v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    id v13 = v9;
  }
  else
  {
    v14 = +[TCCDIconGenerator _iconForService:v5];
    if (v14)
    {
      v15 = +[ISImageDescriptor imageDescriptorNamed:kISImageDescriptorHomeScreen];
      id v13 = +[TCCDIconGenerator _writeIcon:v14 withDescriptor:v15 toTempURL:v9];
    }
    else
    {
      id v13 = 0;
    }
  }
  return v13;
}

+ (id)_iconForService:(id)a3
{
  id v3 = a3;
  v4 = [v3 substringFromIndex:objc_msgSend(@"kTCCService", "length")];
  id v5 = [&off_10009DEF0 objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = objc_alloc((Class)ISIcon);
    v7 = [@"com.apple." stringByAppendingString:v5];
    id v8 = [v6 initWithBundleIdentifier:v7];
  }
  else
  {
    v9 = tcc_access_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      unsigned int v12 = "+[TCCDIconGenerator _iconForService:]";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: No icon found for TCC service=%@", (uint8_t *)&v11, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)_writeIcon:(id)a3 withDescriptor:(id)a4 toTempURL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 imageForDescriptor:v8];
  if ([v10 placeholder])
  {
    uint64_t v11 = [v7 prepareImageForDescriptor:v8];

    v10 = (void *)v11;
  }
  unsigned int v12 = tcc_access_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    v17 = "+[TCCDIconGenerator _writeIcon:withDescriptor:toTempURL:]";
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s: Attempting to write icon to %@", (uint8_t *)&v16, 0x16u);
  }

  if ([v10 writeToURL:v9])
  {
    id v13 = v9;
  }
  else
  {
    id v14 = tcc_access_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100036D10((uint64_t)v9, v14);
    }

    id v13 = 0;
  }

  return v13;
}

@end