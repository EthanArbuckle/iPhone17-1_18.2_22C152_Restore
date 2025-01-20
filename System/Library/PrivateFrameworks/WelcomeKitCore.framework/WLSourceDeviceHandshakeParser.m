@interface WLSourceDeviceHandshakeParser
- (BOOL)parseData:(id)a3 modifyingSourceDevice:(id)a4 completion:(id)a5;
- (id)_parseConnectionFailureReasons:(_xmlNode *)a3;
- (void)_parseDeviceInfoNode:(_xmlNode *)a3 modifyingSourceDevice:(id)a4;
@end

@implementation WLSourceDeviceHandshakeParser

- (BOOL)parseData:(id)a3 modifyingSourceDevice:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  id v10 = v7;
  Memory = xmlReadMemory((const char *)[v10 bytes], objc_msgSend(v10, "length"), 0, 0, 0);
  if (!Memory) {
    goto LABEL_15;
  }
  v12 = (xmlDoc *)Memory;
  xmlNodePtr RootElement = xmlDocGetRootElement(Memory);
  if (!RootElement)
  {
    xmlFreeDoc(v12);
LABEL_15:
    BOOL v19 = 0;
    goto LABEL_18;
  }
  children = RootElement->children;
  if (children)
  {
    char v15 = 0;
    do
    {
      if (children->name)
      {
        v16 = (void *)[[NSString alloc] initWithUTF8String:children->name];
        if ([v16 isEqualToString:@"api"])
        {
          Content = xmlNodeGetContent(children);
          if (Content)
          {
            v18 = (void *)[[NSString alloc] initWithUTF8String:Content];
            [v8 setApi:v18];
          }
        }
        else if ([v16 isEqualToString:@"device_info"])
        {
          [(WLSourceDeviceHandshakeParser *)self _parseDeviceInfoNode:children modifyingSourceDevice:v8];
          char v15 = 1;
        }
      }
      children = children->next;
    }
    while (children);
  }
  else
  {
    char v15 = 0;
  }
  xmlFreeDoc(v12);
  v9[2](v9, v15 & 1);
  BOOL v19 = 1;
LABEL_18:

  return v19;
}

- (void)_parseDeviceInfoNode:(_xmlNode *)a3 modifyingSourceDevice:(id)a4
{
  id v41 = a4;
  for (i = a3->children; i; i = i->next)
  {
    name = (const char *)i->name;
    if (name)
    {
      if (!strcmp((const char *)i->name, "port"))
      {
        Content = xmlNodeGetContent(i);
        if (Content) {
          [v41 setHttpPort:(unsigned __int16)atoi((const char *)Content)];
        }
        continue;
      }
      if (!strcmp(name, "auth_port"))
      {
        id v10 = xmlNodeGetContent(i);
        if (v10) {
          [v41 setSocketPort:(unsigned __int16)atoi((const char *)v10)];
        }
        continue;
      }
      if (!strcmp(name, "name"))
      {
        v11 = xmlNodeGetContent(i);
        if (v11)
        {
          id v8 = [NSString stringWithUTF8String:v11];
          [v41 setName:v8];
LABEL_47:
        }
      }
      else if (!strcmp(name, "device_id"))
      {
        v12 = xmlNodeGetContent(i);
        if (v12)
        {
          id v8 = [NSString stringWithUTF8String:v12];
          [v41 setPersistentIdentifier:v8];
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "os_api_version"))
      {
        v13 = xmlNodeGetContent(i);
        if (v13)
        {
          id v8 = [NSString stringWithUTF8String:v13];
          [v41 setOsAPIVersion:v8];
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "hardware_brand"))
      {
        v14 = xmlNodeGetContent(i);
        if (v14)
        {
          id v8 = [NSString stringWithUTF8String:v14];
          [v41 setHardwareBrand:v8];
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "hardware_model"))
      {
        char v15 = xmlNodeGetContent(i);
        if (v15)
        {
          id v8 = [NSString stringWithUTF8String:v15];
          [v41 setHardwareModel:v8];
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "hardware_design"))
      {
        v16 = xmlNodeGetContent(i);
        if (v16)
        {
          id v8 = [NSString stringWithUTF8String:v16];
          [v41 setHardwareDesign:v8];
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "hardware_maker"))
      {
        v17 = xmlNodeGetContent(i);
        if (v17)
        {
          id v8 = [NSString stringWithUTF8String:v17];
          [v41 setHardwareMaker:v8];
          goto LABEL_47;
        }
      }
      else
      {
        if (strcmp(name, "hardware_product"))
        {
          if (!strcmp(name, "supports_file_length"))
          {
            [v41 setSupportsFileLength:1];
            continue;
          }
          if (!strcmp(name, "can_add"))
          {
            BOOL v19 = xmlNodeGetContent(i);
            if (!v19) {
              continue;
            }
            id v8 = (void *)[[NSString alloc] initWithUTF8String:v19];
            if ([v8 isEqualToString:@"display"])
            {
              [v41 setCanAddDisplay:1];
            }
            else if ([v8 isEqualToString:@"accessibility"])
            {
              [v41 setCanAddAccessibility:1];
            }
            else if ([v8 isEqualToString:@"files"])
            {
              [v41 setCanAddFiles:1];
            }
          }
          else if (!strcmp(name, "client_version"))
          {
            v20 = xmlNodeGetContent(i);
            if (!v20) {
              continue;
            }
            id v8 = [NSString stringWithUTF8String:v20];
            [v41 setClientVersion:v8];
          }
          else
          {
            if (!strcmp(name, "is_selecting_data_type_in_handshake"))
            {
              v21 = xmlNodeGetContent(i);
              if (v21)
              {
                v22 = [NSNumber numberWithChar:(char)*v21];
                unsigned int v39 = [v22 BOOLValue];

                [v41 setIsSelectingDataTypeInHandshake:v39];
              }
              continue;
            }
            if (!strcmp(name, "upgrade"))
            {
              v23 = xmlNodeGetContent(i);
              if (v23)
              {
                v40 = (void *)[[NSString alloc] initWithUTF8String:v23];
                v24 = [v40 lowercaseString];
                int v38 = [v24 isEqualToString:@"api/2.0"];

                if (v38) {
                  [v41 setUseMigrationKit:1];
                }
              }
              continue;
            }
            if (!strcmp(name, "api_level"))
            {
              v25 = xmlNodeGetContent(i);
              if (!v25) {
                continue;
              }
              id v8 = [NSString stringWithUTF8String:v25];
              [v41 setApiLevel:v8];
            }
            else if (!strcmp(name, "brand"))
            {
              v26 = xmlNodeGetContent(i);
              if (!v26) {
                continue;
              }
              id v8 = [NSString stringWithUTF8String:v26];
              [v41 setBrand:v8];
            }
            else if (!strcmp(name, "locale"))
            {
              v27 = xmlNodeGetContent(i);
              if (!v27) {
                continue;
              }
              id v8 = [NSString stringWithUTF8String:v27];
              [v41 setLocale:v8];
            }
            else if (!strcmp(name, "model"))
            {
              v28 = xmlNodeGetContent(i);
              if (!v28) {
                continue;
              }
              id v8 = [NSString stringWithUTF8String:v28];
              [v41 setModel:v8];
            }
            else if (!strcmp(name, "os_version"))
            {
              v29 = xmlNodeGetContent(i);
              if (!v29) {
                continue;
              }
              id v8 = [NSString stringWithUTF8String:v29];
              [v41 setOsVersion:v8];
            }
            else if (!strcmp(name, "version"))
            {
              v30 = xmlNodeGetContent(i);
              if (!v30) {
                continue;
              }
              id v8 = [NSString stringWithUTF8String:v30];
              [v41 setVersion:v8];
            }
            else
            {
              if (strcmp(name, "version_code")) {
                continue;
              }
              id v7 = xmlNodeGetContent(i);
              if (!v7) {
                continue;
              }
              id v8 = [NSString stringWithUTF8String:v7];
              [v41 setVersionCode:v8];
            }
          }
          goto LABEL_47;
        }
        v18 = xmlNodeGetContent(i);
        if (v18)
        {
          id v8 = [NSString stringWithUTF8String:v18];
          [v41 setHardwareProduct:v8];
          goto LABEL_47;
        }
      }
    }
  }
  v31 = [v41 persistentIdentifier];
  uint64_t v32 = [v31 length];

  if (!v32)
  {
    if ([MEMORY[0x263F862A0] isInternal])
    {
      v33 = NSString;
      v34 = [v41 ipAddress];
      v35 = [v41 name];
      v36 = [v33 stringWithFormat:@"%@.%@", v34, v35];
      [v41 setPersistentIdentifier:v36];
    }
    else
    {
      v34 = [MEMORY[0x263F08C38] UUID];
      v35 = [v34 UUIDString];
      [v41 setPersistentIdentifier:v35];
    }

    v37 = [v41 persistentIdentifier];
    _WLLog();
  }
}

- (id)_parseConnectionFailureReasons:(_xmlNode *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (i = a3->children; i; i = i->next)
  {
    name = (const char *)i->name;
    if (name)
    {
      if (!strcmp(name, "reason"))
      {
        Content = xmlNodeGetContent(i);
        if (Content)
        {
          id v8 = [NSString stringWithUTF8String:Content];
          [v4 addObject:v8];
        }
      }
    }
  }
  if ([v4 count]) {
    v9 = v4;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  return v10;
}

@end