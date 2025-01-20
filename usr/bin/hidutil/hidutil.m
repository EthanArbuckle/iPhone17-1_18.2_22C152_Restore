uint64_t sub_100002328(int a1, char **a2)
{
  char *i;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __IOHIDEventSystemClient *v8;
  IOHIDManagerRef v9;
  IOHIDManagerRef v10;
  CFArrayRef v11;
  CFArrayRef v12;
  id v13;
  CFArrayRef v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  CFSetRef v22;
  id v23;
  CFSetRef v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  unsigned char v36[128];

  for (i = 0; ; i = optarg)
  {
    while (1)
    {
      v5 = getopt_long(a1, a2, "hnm:", (const option *)&off_1000082B8, 0);
      if (v5 != 110) {
        break;
      }
      byte_10000C290 = 1;
    }
    if (v5 == -1) {
      break;
    }
    if (v5 != 109)
    {
      if (v5 == 104)
      {
        puts("\nList HID Event System services and devices\n\nUsage:\n\n  hidutil list [--ndjson] [ --matching <matching> ]\n\nFlags:\n\n  -n  --ndjson................print service/device information in ndjson format\n  -m  --matching..............Set matching services/devices\n                              Input can be either json style dictionary or common\n                              device string e.g. keyboard, mouse, digitizer.\n                                  Supported properties:\n                                      ProductID        - numeric value (decimal or hex)\n                                      VendorID         - numeric value (decimal or hex)\n                                      LocationID       - numeric value (decimal or hex)\n                                      PrimaryUsagePage - numeric value (decimal or hex)\n                                      PrimaryUsage     - numeric value (decimal or hex)\n"
          "                                      Transport        - string value\n"
          "                                      Product          - string value\n"
          "                                  For matching against generic properties, you will need to include\n"
          "                                  the \"IOPropertyMatch\" key (see example below).\n"
          "                                  Example strings:\n"
          "                                      'keyboard'\n"
          "                                      'digi'\n"
          "                                      '{\"ProductID\":0x8600,\"VendorID\":0x5ac}'\n"
          "                                      '[{\"ProductID\":0x8600},{\"PrimaryUsagePage\":1,\"PrimaryUsage\":6}]'\n"
          "                                      '{\"IOPropertyMatch\":{\"ReportInterval\":1000}}'\n"
          "\n"
          "Examples:\n"
          "\n"
          "  hidutil list\n"
          "  hidutil list --matching '{\"ProductID\":0x54c}'\n"
          "  hidutil list --matching '{\"ProductID\":0x54c,\"VendorID\":746}'");
        return 0;
      }
      return 1;
    }
  }
  v7 = IOHIDEventSystemClientCreateWithType();
  if (v7)
  {
    v8 = (__IOHIDEventSystemClient *)v7;
    v9 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
    if (v9)
    {
      v10 = v9;
      if (i)
      {
        if ((sub_1000043FC((uint64_t)v8, (uint64_t)i) & 1) == 0) {
          goto LABEL_29;
        }
      }
      else
      {
        IOHIDEventSystemClientSetMatching();
      }
      v11 = IOHIDEventSystemClientCopyServices(v8);
      if (v11)
      {
        v12 = v11;
        v13 = objc_alloc_init((Class)NSMutableArray);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v14 = v12;
        v15 = [(__CFArray *)v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v15)
        {
          v16 = v15;
          v17 = 0;
          v18 = *(void *)v33;
          do
          {
            v19 = 0;
            v20 = v17;
            do
            {
              if (*(void *)v33 != v18) {
                objc_enumerationMutation(v14);
              }
              v17 = sub_100003BD4(*(__IOHIDServiceClient **)(*((void *)&v32 + 1) + 8 * (void)v19));

              if (v17) {
                [v13 addObject:v17];
              }
              v19 = (char *)v19 + 1;
              v20 = v17;
            }
            while (v16 != v19);
            v16 = [(__CFArray *)v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v16);
        }
        v21 = sub_1000026B4(v13, 0);

        if (v21) {
          goto LABEL_30;
        }
      }
      if (i)
      {
        if ((sub_100004498(v10, (uint64_t)i) & 1) == 0)
        {
LABEL_29:
          printf("bad matching string: %s\n", i);
LABEL_30:
          v6 = 1;
LABEL_46:
          CFRelease(v8);
          CFRelease(v10);
          return v6;
        }
      }
      else
      {
        IOHIDManagerSetDeviceMatching(v10, 0);
      }
      v22 = IOHIDManagerCopyDevices(v10);
      if (v22)
      {
        v23 = objc_alloc_init((Class)NSMutableArray);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v24 = v22;
        v25 = [(__CFSet *)v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v25)
        {
          v26 = v25;
          v27 = 0;
          v28 = *(void *)v33;
          do
          {
            v29 = 0;
            v30 = v27;
            do
            {
              if (*(void *)v33 != v28) {
                objc_enumerationMutation(v24);
              }
              v27 = sub_100003D40(*(__IOHIDDevice **)(*((void *)&v32 + 1) + 8 * (void)v29));

              if (v27) {
                [v23 addObject:v27];
              }
              v29 = (char *)v29 + 1;
              v30 = v27;
            }
            while (v26 != v29);
            v26 = [(__CFSet *)v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v26);
        }
        v6 = sub_1000026B4(v23, 1);
      }
      else
      {
        v6 = 0;
      }

      goto LABEL_46;
    }
    CFRelease(v8);
  }
  return 1;
}

uint64_t sub_1000026B4(void *a1, int a2)
{
  id v3 = a1;
  v4 = v3;
  if ((byte_10000C290 & 1) == 0)
  {
    for (uint64_t i = 0; i != 44; i += 4)
      *(&off_10000C128 + i + 2) = (__CFString *)[(__CFString *)*(&off_10000C128 + i + 3) length];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obja = v4;
    id v20 = [obja countByEnumeratingWithState:&v52 objects:v62 count:16];
    v42 = v4;
    if (v20)
    {
      id v21 = v20;
      id v22 = 0;
      uint64_t v23 = *(void *)v53;
      do
      {
        v24 = 0;
        v25 = v22;
        do
        {
          if (*(void *)v53 != v23) {
            objc_enumerationMutation(obja);
          }
          id v22 = *(id *)(*((void *)&v52 + 1) + 8 * (void)v24);

          for (uint64_t j = 0; j != 44; j += 4)
          {
            v27 = [v22 objectForKeyedSubscript:(&off_10000C128)[j]];
            v28 = sub_100004628(v27, (uint64_t)*(&off_10000C128 + j + 1));
            v29 = (__CFString *)[v28 length];

            if (v29 > *(&off_10000C128 + j + 2)) {
              *(&off_10000C128 + j + 2) = v29;
            }
          }
          v24 = (char *)v24 + 1;
          v25 = v22;
        }
        while (v24 != v21);
        id v21 = [obja countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v21);

      v4 = v42;
    }

    if (a2) {
      v30 = "Devices:";
    }
    else {
      v30 = "Services:";
    }
    puts(v30);
    for (uint64_t k = 0; k != 44; k += 4)
      printf("%-*s", *((_DWORD *)&off_10000C128 + 2 * k + 4) + 1, (const char *)[(__CFString *)*(&off_10000C128 + k + 3) cStringUsingEncoding:4]);
    putchar(10);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v43 = obja;
    id objb = [v43 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (objb)
    {
      id v32 = 0;
      uint64_t v44 = *(void *)v49;
      do
      {
        v33 = 0;
        v34 = v32;
        do
        {
          if (*(void *)v49 != v44) {
            objc_enumerationMutation(v43);
          }
          id v32 = *(id *)(*((void *)&v48 + 1) + 8 * (void)v33);

          for (uint64_t m = 0; m != 44; m += 4)
          {
            if (-[__CFString isEqualToString:]((&off_10000C128)[m], "isEqualToString:", @"Built-In")&& ([v32 objectForKeyedSubscript:(&off_10000C128)[m]], v36 = objc_claimAutoreleasedReturnValue(), v36, !v36))
            {
              v38 = @"0";
            }
            else
            {
              v37 = [v32 objectForKeyedSubscript:(&off_10000C128)[m]];
              sub_100004628(v37, (uint64_t)*(&off_10000C128 + m + 1));
              v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            int v39 = *((_DWORD *)&off_10000C128 + 2 * m + 4) + 1;
            v40 = v38;
            printf("%-*s", v39, (const char *)[(__CFString *)v40 UTF8String]);
          }
          putchar(10);
          v33 = (char *)v33 + 1;
          v34 = v32;
        }
        while (v33 != objb);
        id objb = [v43 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (objb);

      v4 = v42;
    }

    putchar(10);
    goto LABEL_50;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (!v5)
  {
LABEL_50:
    uint64_t v18 = 0;
    goto LABEL_51;
  }
  id v6 = v5;
  id v7 = 0;
  obuint64_t j = 0;
  uint64_t v8 = *(void *)v58;
  if (a2) {
    CFStringRef v9 = @"device";
  }
  else {
    CFStringRef v9 = @"service";
  }
  do
  {
    v10 = v4;
    v11 = 0;
    v12 = v7;
    do
    {
      if (*(void *)v58 != v8) {
        objc_enumerationMutation(v10);
      }
      id v7 = *(id *)(*((void *)&v57 + 1) + 8 * (void)v11);

      v13 = +[NSMutableDictionary dictionaryWithDictionary:v7];
      [v13 setObject:v9 forKeyedSubscript:@"type"];
      id v56 = 0;
      v14 = +[NSJSONSerialization dataWithJSONObject:v13 options:8 error:&v56];
      id v15 = v56;
      v16 = v15;
      if (v15)
      {
        NSLog(@"NSJSONSerialization %@", v15);
        obuint64_t j = 1;
      }
      else
      {
        id v17 = [objc_alloc((Class)NSString) initWithData:v14 encoding:4];
        puts((const char *)[v17 UTF8String]);
      }
      v11 = (char *)v11 + 1;
      v12 = v7;
    }
    while (v6 != v11);
    v4 = v10;
    id v6 = [v10 countByEnumeratingWithState:&v57 objects:v63 count:16];
  }
  while (v6);

  uint64_t v18 = obj;
LABEL_51:

  return v18;
}

uint64_t start(int a1, char **a2)
{
  if (a1 <= 1) {
    goto LABEL_2;
  }
  id v5 = a2[optind];
  if (!strcmp(v5, "help") || !strcmp(v5, "-h") || !strcmp(v5, "--help"))
  {
    puts("\nUsage:\n\n  hidutil [command]\n\nAvailable commands:\n  help       - print this help message\n  dump       - dump HID Event System state\n  property   - read/write HID Event System property\n  list       - list HID Event System services and devices\n\nUse \"hidutil [command] --help\" for more information about a command.");
    return 0;
  }
  else if (!strcmp(v5, "dump"))
  {
    return sub_1000036CC(a1, a2);
  }
  else if (!strcmp(v5, "list"))
  {
    return sub_100002328(a1, a2);
  }
  else
  {
    if (strcmp(v5, "property"))
    {
      printf("Unknown command: %s\n", v5);
LABEL_2:
      puts("\nUsage:\n\n  hidutil [command]\n\nAvailable commands:\n  help       - print this help message\n  dump       - dump HID Event System state\n  property   - read/write HID Event System property\n  list       - list HID Event System services and devices\n\nUse \"hidutil [command] --help\" for more information about a command.");
      return 1;
    }
    return sub_100003340(a1, a2);
  }
}

void sub_100002D50(void *a1)
{
  id v1 = a1;
  if ([v1 UTF8String]) {
    printf("%s", (const char *)[v1 UTF8String]);
  }
}

uint64_t sub_100002DB0(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100002E24;
  v3[3] = &unk_100008338;
  v3[4] = a1;
  [a2 enumerateKeysAndObjectsUsingBlock:v3];
  return 0;
}

void sub_100002E24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  key = a2;
  id v6 = +[NSString stringWithFormat:@"%@:%@\n", key, v5];
  sub_100002D50(v6);

  IOHIDEventSystemClientSetProperty(*(IOHIDEventSystemClientRef *)(a1 + 32), key, v5);
}

uint64_t sub_100002EBC(__IOHIDEventSystemClient *a1, void *a2)
{
  id v3 = a2;
  CFArrayRef v4 = IOHIDEventSystemClientCopyServices(a1);
  if (v4)
  {
    printf("%-8s  %-20s  %s\n", "RegistryID", "Key", "Value");
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    CFArrayRef v5 = v4;
    id v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(__IOHIDServiceClient **)(*((void *)&v17 + 1) + 8 * i);
          v11 = IOHIDServiceClientGetRegistryID(v10);
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100003080;
          v14[3] = &unk_100008360;
          id v15 = v11;
          v16 = v10;
          id v12 = v11;
          [v3 enumerateKeysAndObjectsUsingBlock:v14];
        }
        id v7 = [(__CFArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  return 0;
}

void sub_100003080(uint64_t a1, void *a2, void *a3)
{
  CFArrayRef v5 = *(void **)(a1 + 32);
  id v6 = a3;
  key = a2;
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%-8lx   %-20@   %@\n", [v5 unsignedLongValue], key, v6);
  sub_100002D50(v7);

  IOHIDServiceClientSetProperty(*(IOHIDServiceClientRef *)(a1 + 40), key, v6);
}

uint64_t sub_100003134(__IOHIDEventSystemClient *a1, const __CFString *a2)
{
  v2 = (void *)IOHIDEventSystemClientCopyProperty(a1, a2);
  id v3 = +[NSString stringWithFormat:@"%@\n", v2];
  sub_100002D50(v3);

  return 0;
}

uint64_t sub_100003190(__IOHIDEventSystemClient *a1, void *a2)
{
  id v3 = a2;
  CFArrayRef v4 = IOHIDEventSystemClientCopyServices(a1);
  if (v4)
  {
    printf("%-8s  %-20s  %s\n", "RegistryID", "Key", "Value");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    CFArrayRef v15 = v4;
    CFArrayRef v5 = v4;
    id v6 = [(__CFArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(__IOHIDServiceClient **)(*((void *)&v16 + 1) + 8 * i);
          v11 = (void *)IOHIDServiceClientCopyProperty(v10, v3);
          id v12 = IOHIDServiceClientGetRegistryID(v10);
          v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%-8lx   %-20@   %@\n", [v12 unsignedLongValue], v3, v11);
          sub_100002D50(v13);
        }
        id v7 = [(__CFArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    CFArrayRef v4 = v15;
  }

  return 0;
}

uint64_t sub_100003340(int a1, char *const *a2)
{
  uint64_t v4 = IOHIDEventSystemClientCreateWithType();
  if (v4)
  {
    CFArrayRef v5 = (__IOHIDEventSystemClient *)v4;
    uint64_t v17 = 0;
    uint64_t v6 = 0;
    char v7 = 0;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          int v8 = getopt_long(a1, a2, "hm:g:s:", (const option *)&off_100008380, 0);
          if (v8 != 109) {
            break;
          }
          char v7 = sub_1000043FC((uint64_t)v5, (uint64_t)optarg);
          if ((v7 & 1) == 0) {
            printf("bad matching string: %s\n", optarg);
          }
        }
        if (v8 <= 103) {
          break;
        }
        if (v8 != 115)
        {
          if (v8 == 104)
          {
            puts("\nRead/Write HID Event System property\n\nUsage:\n\n  hidutil property [ --matching <matching> ][ --get <key> ][ --set <key> ]\n\nFlags:\n\n  -g  --get...................Get property with key (where key is string value)\n  -s  --set...................Set property (key/value pair JSON style dictionary)\n  -m  --matching..............Set matching services/devices\n                              Input can be either json style dictionary or common\n                              device string e.g. keyboard, mouse, digitizer.\n                                  Supported properties:\n                                      ProductID        - numeric value (decimal or hex)\n                                      VendorID         - numeric value (decimal or hex)\n                                      LocationID       - numeric value (decimal or hex)\n                                      PrimaryUsagePage - numeric value (decimal or hex)\n"
              "                                      PrimaryUsage     - numeric value (decimal or hex)\n"
              "                                      Transport        - string value\n"
              "                                      Product          - string value\n"
              "                                  For matching against generic properties, you will need to include\n"
              "                                  the \"IOPropertyMatch\" key (see example below).\n"
              "                                  Example strings:\n"
              "                                      'keyboard'\n"
              "                                      'digi'\n"
              "                                      '{\"ProductID\":0x8600,\"VendorID\":0x5ac}'\n"
              "                                      '[{\"ProductID\":0x8600},{\"PrimaryUsagePage\":1,\"PrimaryUsage\":6}"
              "]'\n"
              "                                      '{\"IOPropertyMatch\":{\"ReportInterval\":1000}}'\n"
              "\n"
              "Examples:\n"
              "\n"
              "  hidutil property --matching '{\"ProductID\":0x54c}' --get \"HIDPointerAcceleration\"\n"
              "  hidutil property --matching '{\"ProductID\":0x54c,\"VendorID\":746}' --set '{\"HIDPointerAcceleration\":"
              "0}'\n"
              "  hidutil property --get \"HIDPointerAcceleration\"");
            uint64_t v13 = 0;
          }
          else
          {
LABEL_23:
            uint64_t v13 = 1;
          }
          v14 = (void *)v17;
          goto LABEL_27;
        }
        sub_100003EC8(optarg);
        v11 = long long v16 = (__CFString *)v6;
        uint64_t v12 = sub_10000407C(v11);

        uint64_t v6 = (uint64_t)v16;
        if (v12)
        {
          objc_opt_class();
          uint64_t v17 = v12;
          if (objc_opt_isKindOfClass()) {
            continue;
          }
        }
        printf("\nERROR!!!! Unable to create property object for '%s'\n", optarg);
        uint64_t v17 = v12;
      }
      if (v8 == -1) {
        break;
      }
      if (v8 != 103) {
        goto LABEL_23;
      }
      uint64_t v9 = +[NSString stringWithUTF8String:optarg];
      v10 = (void *)v6;
      uint64_t v6 = v9;
    }
    v14 = (void *)v17;
    if (v6 | v17)
    {
      if (!v6 || !v17)
      {
        if (v17)
        {
          [(id)v17 enumerateKeysAndObjectsUsingBlock:&stru_100008440];
          if (v7)
          {
            sub_100002EBC(v5, (void *)v17);
          }
          else
          {
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_100002E24;
            v18[3] = &unk_100008338;
            v18[4] = v5;
            [(id)v17 enumerateKeysAndObjectsUsingBlock:v18];
          }
          uint64_t v13 = 0;
        }
        else
        {
          if (v7) {
            sub_100003190(v5, (void *)v6);
          }
          else {
            sub_100003134(v5, (const __CFString *)v6);
          }
          uint64_t v13 = 0;
          v14 = 0;
        }
        goto LABEL_27;
      }
    }
    else
    {
      v14 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v13 = 1;
LABEL_27:
    CFRelease(v5);

    return v13;
  }
  return 1;
}

id sub_1000035E0(void *a1, const char *a2)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:&stru_100008440];
}

void sub_1000035EC(id a1, NSString *a2, id a3, BOOL *a4)
{
  uint64_t v6 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(NSString *)v6 isEqualToString:@"UserKeyMapping"]
        || [(NSString *)v6 isEqualToString:@"HIDKeyboardModifierMappingPairs"])
      {
        if ((_IOHIDIsRestrictedRemappingProperty() & 1) == 0) {
          goto LABEL_10;
        }
      }
      else if (![(NSString *)v6 isEqualToString:@"CtrlKeyboardUsageMap"] {
             || !_IOHIDIsRestrictedRemappingProperty())
      }
      {
        goto LABEL_10;
      }
      if (IOHIDCheckAccess(kIOHIDRequestTypeListenEvent)) {
        puts("Attempt to remap alphanumerics / special characters. If setting fails, ensure Terminal has input monitoring permissions. ");
      }
    }
  }
LABEL_10:
}

uint64_t sub_1000036CC(int a1, char **a2)
{
  uint64_t v4 = sub_100003988;
LABEL_2:
  id v5 = v4;
  while (1)
  {
    while (1)
    {
      int v6 = getopt_long(a1, a2, "o:f:h", (const option *)&off_100008460, 0);
      if (v6 <= 110) {
        break;
      }
      if (v6 == 111)
      {
        if (dword_10000C288 >= 3) {
          close(dword_10000C288);
        }
        dword_10000C288 = open(optarg, 513, 420);
        if (dword_10000C288 == -1)
        {
          puts("Error opening output file");
          return 1;
        }
      }
    }
    if (v6 == -1) {
      break;
    }
    if (v6 == 102)
    {
      char v7 = optarg;
      int v8 = strcmp(optarg, "xml");
      uint64_t v4 = sub_100003988;
      if (v8)
      {
        if (!strcmp(v7, "text")) {
          uint64_t v4 = sub_100003A44;
        }
        else {
          uint64_t v4 = v5;
        }
      }
      goto LABEL_2;
    }
    if (v6 == 104)
    {
      puts("\nDump HID Event System state\n\nUsage:\n\n  hidutil dump [object] [flags]\n\nExamples:\n\n  hidutil dump system -f xml\n  hidutil dump system -o /tmp/state_dump.txt -f text\n\nObject:\n\n  system.....................HID Event System\n  clients....................HID Event System Clients\n  services...................HID Event System services\n\nFlags:\n"
        "\n"
        "  -f  --format ..............Format type (xml, text)\n"
        "  -o  --output...............Output file (or stdout if not specified)");
      return 0;
    }
  }
  uint64_t v9 = optind + 1;
  v10 = sub_100003AF0;
  if (v9 != a1
    && (v11 = a2[v9], int v12 = strcmp(v11, "system"), v10 = sub_100003AF0, v12)
    && (int v13 = strcmp(v11, "clients"), v10 = sub_100003BBC, v13)
    && (int v14 = strcmp(v11, "services"), v10 = sub_100003BC8, v14))
  {
    printf("unrecognized object: %s\n", v11);
  }
  else
  {
    long long v16 = (uint64_t (*)(void))v10;
    qword_10000C298 = IOHIDEventSystemClientCreateWithType();
    if (qword_10000C298)
    {
      IOHIDEventSystemClientSetMatching();
      qword_10000C2A0 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (qword_10000C2A0)
      {
        uint64_t v17 = v16();
        if (v5) {
          ((void (*)(uint64_t))v5)(v17);
        }
        uint64_t v15 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      puts("Unable to create client");
    }
  }
  uint64_t v15 = 1;
LABEL_29:
  if (qword_10000C298) {
    CFRelease((CFTypeRef)qword_10000C298);
  }
  if (qword_10000C2A0) {
    CFRelease((CFTypeRef)qword_10000C2A0);
  }
  if (dword_10000C288 >= 3) {
    close(dword_10000C288);
  }
  return v15;
}

void sub_100003988()
{
  CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, (CFPropertyListRef)qword_10000C2A0, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (Data)
  {
    CFDataRef v1 = Data;
    int v2 = dword_10000C288;
    BytePtr = CFDataGetBytePtr(Data);
    size_t Length = CFDataGetLength(v1);
    ssize_t v5 = write(v2, BytePtr, Length);
    if (v5 != CFDataGetLength(v1)) {
      puts("Error writing to output.");
    }
    CFRelease(v1);
  }
}

void sub_100003A44()
{
  CFStringRef v0 = CFCopyDescription((CFTypeRef)qword_10000C2A0);
  if (v0)
  {
    CFStringRef v1 = v0;
    int v2 = dword_10000C288;
    CStringPtr = CFStringGetCStringPtr(v0, 0x8000100u);
    size_t Length = CFStringGetLength(v1);
    ssize_t v5 = write(v2, CStringPtr, Length);
    if (v5 != CFStringGetLength(v1)) {
      puts("Error writing to output.");
    }
    CFRelease(v1);
  }
}

void sub_100003AF0()
{
  sub_100003B34(@"ClientRecords");
  sub_100003B34(@"ServiceRecords");

  sub_100003B34(@"SessionFilterDebug");
}

void sub_100003B34(CFStringRef key)
{
  CFTypeRef v2 = IOHIDEventSystemClientCopyProperty((IOHIDEventSystemClientRef)qword_10000C298, key);
  id v3 = (__CFDictionary *)qword_10000C2A0;
  if (v2)
  {
    CFDictionaryAddValue((CFMutableDictionaryRef)qword_10000C2A0, key, v2);
    CFRelease(v2);
  }
  else
  {
    CFDictionaryAddValue(v3, key, @"Unavailable");
  }
}

void sub_100003BBC()
{
}

void sub_100003BC8()
{
}

id sub_100003BD4(__IOHIDServiceClient *a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  if (v2)
  {
    [v2 setValue:IOHIDServiceClientGetRegistryID(a1) forKey:@"IORegistryEntryID"];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [&off_100008CC8 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(&off_100008CC8);
          }
          CFStringRef v7 = *(const __CFString **)(*((void *)&v11 + 1) + 8 * i);
          int v8 = (void *)IOHIDServiceClientCopyProperty(a1, v7);
          [v2 setValue:v8 forKey:v7];
        }
        id v4 = [&off_100008CC8 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
    id v9 = v2;
  }

  return v2;
}

id sub_100003D40(__IOHIDDevice *a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t entryID = 0xAAAAAAAAAAAAAAAALL;
  if (v2)
  {
    io_service_t Service = IOHIDDeviceGetService(a1);
    IORegistryEntryGetRegistryEntryID(Service, &entryID);
    id v4 = +[NSNumber numberWithUnsignedLongLong:entryID];
    [v2 setValue:v4 forKey:@"IORegistryEntryID"];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [&off_100008CC8 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(&off_100008CC8);
          }
          [v2 setValue:IOHIDDeviceGetProperty(a1, *(CFStringRef *)(*((void *)&v11 + 1) + 8 * i)) forKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        }
        id v6 = [&off_100008CC8 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v6);
    }
    id v9 = v2;
  }

  return v2;
}

id sub_100003ECC(uint64_t a1)
{
  CFStringRef v1 = +[NSMutableString stringWithUTF8String:a1];
  uint64_t v17 = 0;
  id v2 = +[NSRegularExpression regularExpressionWithPattern:@"0[xX][0-9a-f]+" options:1 error:&v17];
  uint64_t v3 = [v2 firstMatchInString:v1 options:0 range:[v1 length]];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      id v5 = [v4 range];
      uint64_t v7 = [v1 substringWithRange:v5, v6];
      int v8 = +[NSScanner scannerWithString:v7];

      uint64_t v16 = 0;
      [v8 scanHexLongLong:&v16];
      id v9 = +[NSString stringWithFormat:@"%llu", v16];
      id v10 = [v4 range];
      [v1 replaceCharactersInRange:v10 withString:v11];
      id v12 = [v4 range];
      long long v13 = (char *)[v9 length] + (void)v12;

      uint64_t v14 = [v2 firstMatchInString:v1 options:0 range:NSMakeRange(v13, [v1 length] - v13)];

      id v4 = (void *)v14;
    }
    while (v14);
  }

  return v1;
}

id sub_10000407C(void *a1)
{
  CFStringRef v1 = [a1 dataUsingEncoding:4];
  id v5 = 0;
  id v2 = +[NSJSONSerialization JSONObjectWithData:v1 options:1 error:&v5];
  id v3 = v5;

  if (v3) {
    NSLog(@"NSJSONSerialization %@", v3);
  }

  return v2;
}

id sub_10000411C(uint64_t a1)
{
  CFStringRef v1 = sub_100003ECC(a1);
  id v2 = v1;
  if (!v1 || ![v1 length])
  {
    id v4 = 0;
    goto LABEL_9;
  }
  id v3 = [v2 substringToIndex:1];
  if ([v3 isEqual:@"["])
  {

LABEL_7:
    uint64_t v7 = [v2 dataUsingEncoding:4];
    id v10 = 0;
    id v4 = +[NSJSONSerialization JSONObjectWithData:v7 options:1 error:&v10];
    id v8 = v10;

    goto LABEL_9;
  }
  id v5 = [v2 substringToIndex:1];
  unsigned int v6 = [v5 isEqual:@"{"];

  if (v6) {
    goto LABEL_7;
  }
  id v4 = sub_100004244(v2);
LABEL_9:

  return v4;
}

id sub_100004244(void *a1)
{
  id v1 = a1;
  id v2 = +[NSString stringWithUTF8String:"keyboard"];
  unsigned int v3 = [v2 containsString:v1];

  if (v3)
  {
    v17[0] = @"PrimaryUsagePage";
    v17[1] = @"PrimaryUsage";
    v18[0] = &off_100008C68;
    v18[1] = &off_100008C80;
    id v4 = (_UNKNOWN ***)v18;
    id v5 = (const __CFString **)v17;
LABEL_5:
    uint64_t v8 = 2;
LABEL_6:
    id v9 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v5 count:v8];
    goto LABEL_7;
  }
  unsigned int v6 = +[NSString stringWithUTF8String:"mouse"];
  unsigned int v7 = [v6 containsString:v1];

  if (v7)
  {
    v15[0] = @"PrimaryUsagePage";
    v15[1] = @"PrimaryUsage";
    v16[0] = &off_100008C68;
    v16[1] = &off_100008C98;
    id v4 = (_UNKNOWN ***)v16;
    id v5 = (const __CFString **)v15;
    goto LABEL_5;
  }
  uint64_t v11 = +[NSString stringWithUTF8String:"digitizer"];
  unsigned int v12 = [v11 containsString:v1];

  if (v12)
  {
    CFStringRef v13 = @"PrimaryUsagePage";
    uint64_t v14 = &off_100008CB0;
    id v4 = &v14;
    id v5 = &v13;
    uint64_t v8 = 1;
    goto LABEL_6;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

uint64_t sub_1000043FC(uint64_t a1, uint64_t a2)
{
  id v2 = sub_10000411C(a2);
  if (!v2) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      IOHIDEventSystemClientSetMatchingMultiple();
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v3 = 0;
    goto LABEL_8;
  }
  IOHIDEventSystemClientSetMatching();
LABEL_6:
  uint64_t v3 = 1;
LABEL_8:

  return v3;
}

uint64_t sub_100004498(__IOHIDManager *a1, uint64_t a2)
{
  uint64_t v3 = sub_100003ECC(a2);
  id v4 = [v3 substringToIndex:1];
  if ([v4 isEqual:@"["])
  {
  }
  else
  {
    id v5 = [v3 substringToIndex:1];
    unsigned __int8 v6 = [v5 isEqual:@"{"];

    if ((v6 & 1) == 0)
    {
      sub_100004244(v3);
      CFDictionaryRef v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  unsigned int v7 = [v3 dataUsingEncoding:4];
  id v12 = 0;
  CFDictionaryRef v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:1 error:&v12];
  id v9 = v12;

  if (v9)
  {
    NSLog(@"Serialization error: %@", v9);

LABEL_14:
    uint64_t v10 = 0;
    goto LABEL_15;
  }
LABEL_7:
  uint64_t v10 = 0;
  if (a1 && v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      IOHIDManagerSetDeviceMatching(a1, v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      IOHIDManagerSetDeviceMatchingMultiple(a1, v8);
    }
    uint64_t v10 = 1;
  }
LABEL_15:

  return v10;
}

id sub_100004628(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if (a2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    id v5 = &off_100008C50;
  }
  else {
    id v5 = v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2 == 16)
    {
      id v9 = [v5 longLongValue];
      CFStringRef v6 = @"0x%llx";
    }
    else
    {
      id v9 = [v5 unsignedLongValue];
      CFStringRef v6 = @"%lu";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v9);
  }
  else
  {
    +[NSString stringWithFormat:@"%@", v5];
  unsigned int v7 = };

  return v7;
}

BOOL sub_100004700(void *a1, _DWORD *a2)
{
  id v3 = a1;
  unint64_t v4 = 0;
  long long v11 = unk_100008500;
  long long v12 = unk_100008510;
  long long v13 = unk_100008520;
  long long v9 = unk_1000084E0;
  long long v10 = unk_1000084F0;
  id v5 = (id *)&v9 + 1;
  BOOL v6 = 1;
  while (!objc_msgSend(*v5, "containsString:", v3, v9, v10, v11, v12, v13))
  {
    BOOL v6 = v4 < 4;
    v5 += 2;
    if (++v4 == 5)
    {
      BOOL v6 = 0;
      goto LABEL_6;
    }
  }
  *a2 = *((_DWORD *)v5 - 2);
LABEL_6:
  for (uint64_t i = 72; i != -8; i -= 16)

  return v6;
}

void sub_1000047FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 72; i != -8; i -= 16)

  _Unwind_Resume(a1);
}

id sub_10000482C(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v1;
    [v2 appendString:@"("];
    if ([v3 count])
    {
      unint64_t v4 = 0;
      do
      {
        id v5 = [v3 objectAtIndexedSubscript:v4];
        BOOL v6 = sub_10000482C();
        [v2 appendString:v6];

        if (v4 < (char *)[v3 count] - 1) {
          [v2 appendString:@", "];
        }
        ++v4;
      }
      while (v4 < [v3 count]);
    }
    [v2 appendString:@""]);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v2 appendString:@"{"];
      id v18 = v1;
      id v7 = v1;
      CFDictionaryRef v8 = [v7 allKeys];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            [v2 appendFormat:@"%@:", v13];
            uint64_t v14 = [v7 objectForKeyedSubscript:v13];
            uint64_t v15 = sub_10000482C();
            [v2 appendString:v15];

            uint64_t v16 = [v8 lastObject];

            if (v13 != v16) {
              [v2 appendString:@", "];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);
      }
      [v2 appendString:@"}"];

      id v1 = v18;
    }
    else
    {
      [v2 appendFormat:@"%@", v1];
    }
  }

  return v2;
}

BOOL sub_100004B00()
{
  return geteuid() == 0;
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

IOHIDAccessType IOHIDCheckAccess(IOHIDRequestType requestType)
{
  return _IOHIDCheckAccess(requestType);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return _IOHIDDeviceGetProperty(device, key);
}

io_service_t IOHIDDeviceGetService(IOHIDDeviceRef device)
{
  return _IOHIDDeviceGetService(device);
}

CFTypeRef IOHIDEventSystemClientCopyProperty(IOHIDEventSystemClientRef client, CFStringRef key)
{
  return _IOHIDEventSystemClientCopyProperty(client, key);
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return _IOHIDEventSystemClientCopyServices(client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return _IOHIDEventSystemClientCreateWithType();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return _IOHIDEventSystemClientSetMatching();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return _IOHIDEventSystemClientSetMatchingMultiple();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return _IOHIDEventSystemClientSetProperty(client, key, property);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return _IOHIDManagerCopyDevices(manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return _IOHIDManagerCreate(allocator, options);
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return _IOHIDServiceClientCopyProperty(service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return _IOHIDServiceClientGetRegistryID(service);
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return _IOHIDServiceClientSetProperty(service, key, property);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

void NSLog(NSString *format, ...)
{
}

uint64_t _IOHIDIsRestrictedRemappingProperty()
{
  return __IOHIDIsRestrictedRemappingProperty();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int close(int a1)
{
  return _close(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}