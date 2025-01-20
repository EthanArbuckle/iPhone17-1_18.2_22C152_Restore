void start()
{
  xpc_main((xpc_connection_handler_t)sub_100003900);
}

void sub_100003900(void *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003994;
  handler[3] = &unk_100004128;
  id v3 = a1;
  v1 = (_xpc_connection_s *)v3;
  xpc_connection_set_event_handler(v1, handler);
  xpc_connection_activate(v1);
}

void sub_100003994(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v5 = v3;
  if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_error)
  {
    v6 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = +[NSMutableDictionary dictionary];
      v8 = [v6 objectForKeyedSubscript:@"PayloadDecodingOptions"];
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 addEntriesFromDictionary:v8];
        }
      }
      [v7 setObject:kCFBooleanTrue forKeyedSubscript:MRCDescriptorPayloadDecodingOptionShouldForceInProcessDecoding];
      v9 = [v6 objectForKeyedSubscript:@"DescriptorAttributes"];
      if (v9
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (uint64_t v10 = MRCDescriptorCreateWithAttributes()) != 0)
      {
        v11 = (const void *)v10;
        v12 = (void *)MRCDescriptorDecodePayloadAndSupplementalPayloadWithOptions();
        CFRelease(v11);
      }
      else
      {
        v12 = 0;
      }

      if (v12) {
        v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      }
      else {
        v14 = 0;
      }
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      xpc_object_t v13 = reply;
      if (v14) {
        xpc_dictionary_set_value(reply, "DecodedStringValue", v14);
      }
    }
    else
    {
      NSLog(@"Invalid input!");
      xpc_object_t v13 = xpc_dictionary_create_reply(v5);
      v14 = 0;
      v12 = 0;
    }
    xpc_connection_send_message(v4, v13);
  }
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MRCDescriptorCreateWithAttributes()
{
  return _MRCDescriptorCreateWithAttributes();
}

uint64_t MRCDescriptorDecodePayloadAndSupplementalPayloadWithOptions()
{
  return _MRCDescriptorDecodePayloadAndSupplementalPayloadWithOptions();
}

void NSLog(NSString *format, ...)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return __CFXPCCreateCFObjectFromXPCMessage();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}