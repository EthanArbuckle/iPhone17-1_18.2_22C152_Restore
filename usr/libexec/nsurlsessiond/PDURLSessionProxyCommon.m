@interface PDURLSessionProxyCommon
+ (Class)messageSubclassForMessageType:(unsigned __int16)a3 isReply:(BOOL)a4;
+ (id)allowedClassesForUnarchiving;
+ (void)getComponentsForFullIdentifier:(id)a3 bundleIdentifier:(id *)a4 sessionIdentifier:(id *)a5;
@end

@implementation PDURLSessionProxyCommon

+ (Class)messageSubclassForMessageType:(unsigned __int16)a3 isReply:(BOOL)a4
{
  if ((int)a3 <= 2000)
  {
    switch(a3)
    {
      case 0x3E9u:
      case 0x3EBu:
      case 0x3EEu:
      case 0x3F2u:
      case 0x3F4u:
        goto LABEL_5;
      case 0x3EAu:
      case 0x3ECu:
      case 0x3EDu:
      case 0x3EFu:
      case 0x3F0u:
      case 0x3F1u:
      case 0x3F3u:
        goto LABEL_7;
      default:
        switch(a3)
        {
          case 2u:
            goto LABEL_5;
          default:
            goto LABEL_7;
        }
    }
  }
  if (a3 == 3001)
  {
LABEL_5:
    id v4 = (id)objc_opt_class();
  }
  else
  {
LABEL_7:
    objc_opt_class();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v4;
}

+ (void)getComponentsForFullIdentifier:(id)a3 bundleIdentifier:(id *)a4 sessionIdentifier:(id *)a5
{
  id v7 = a3;
  v8 = [v7 componentsSeparatedByString:@"|"];
  v9 = v8;
  if (a4 && a5 && [v8 count] == (id)2)
  {
    *a4 = [v9 objectAtIndex:0];
    *a5 = [v9 objectAtIndex:1];
  }
  else
  {
    v10 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not break full NSURLSession identifier %@ into bundle ID and session ID components", (uint8_t *)&v11, 0xCu);
    }
  }
}

+ (id)allowedClassesForUnarchiving
{
  if (qword_1000CB0A0 != -1) {
    dispatch_once(&qword_1000CB0A0, &stru_1000B5848);
  }
  v2 = (void *)qword_1000CB098;

  return v2;
}

@end