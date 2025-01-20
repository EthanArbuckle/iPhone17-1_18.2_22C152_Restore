@interface RPNWUtils
+ (id)getBundleIDForPID:(int)a3;
@end

@implementation RPNWUtils

+ (id)getBundleIDForPID:(int)a3
{
  if (!a3)
  {
    if (dword_100140B20 > 30 || dword_100140B20 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_16;
    }
LABEL_9:
    LogPrintF();
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = 0;
  memset(buffer, 0, sizeof(buffer));
  if (proc_pidinfo(a3, 17, 1uLL, buffer, 56) != 56 || uuid_is_null((const unsigned __int8 *)buffer))
  {
    if (dword_100140B20 > 30 || dword_100140B20 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buffer];
  if (dword_100140B20 <= 30 && (dword_100140B20 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = v3;
    id v16 = v4;
    LogPrintF();
  }
  v7 = +[NSSet setWithObject:](NSSet, "setWithObject:", v4, v15, v16);
  v8 = [(objc_class *)off_100140B90() defaultWorkspace];
  id v17 = 0;
  v9 = [v8 bundleIdentifiersForMachOUUIDs:v7 error:&v17];
  id v10 = v17;

  if (v10)
  {
    if (dword_100140B20 > 30 || dword_100140B20 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_36;
    }
    goto LABEL_32;
  }
  if ([v9 count])
  {
    v11 = [v9 objectForKeyedSubscript:v4];
    id v12 = [v11 count];

    if (v12)
    {
      v13 = [v9 objectForKeyedSubscript:v4];
      v14 = [v13 allObjects];
      v5 = [v14 objectAtIndex:0];

      if (dword_100140B20 <= 30 && (dword_100140B20 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      goto LABEL_37;
    }
  }
  if (dword_100140B20 <= 30 && (dword_100140B20 != -1 || _LogCategory_Initialize())) {
LABEL_32:
  }
    LogPrintF();
LABEL_36:
  v5 = 0;
LABEL_37:

LABEL_17:

  return v5;
}

@end