@interface ATSGraphicsCapture
- (ATSGraphicsCapture)initWithLogger:(id)a3 config:(ktrace_config *)a4;
- (unint64_t)deviceKind;
- (void)addExtendedGPUInformationToFile:(ktrace_file *)a3;
- (void)disableGFXTracingIfNeeded;
- (void)enableGFXTracingIfNeeded;
@end

@implementation ATSGraphicsCapture

- (ATSGraphicsCapture)initWithLogger:(id)a3 config:(ktrace_config *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATSGraphicsCapture;
  v7 = [(ATSGraphicsCapture *)&v17 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_logger, a3);
    id v9 = v6;
    io_registry_entry_t RootEntry = IORegistryGetRootEntry(kIOMainPortDefault);
    if (RootEntry)
    {
      io_object_t v11 = RootEntry;
      BOOL v12 = sub_3DA0(RootEntry, 0, v9);

      if (v12)
      {
        IOObjectRelease(v11);
        uint64_t v13 = 2;
LABEL_9:
        v8->_deviceKind = v13;
        v8->_isGraphicsCaptured = ktrace_config_kdebug_get_debugid_enabled();
        goto LABEL_10;
      }
      CFDictionaryRef v14 = IOServiceMatching("AGXAccelerator");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v14);
      if (MatchingService)
      {
        IOObjectRelease(MatchingService);
        uint64_t v13 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      [v9 failWithReason:@"Could not get root service to query for graphics"];
    }
    uint64_t v13 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (void)addExtendedGPUInformationToFile:(ktrace_file *)a3
{
  if (self->_deviceKind != 1) {
    return;
  }
  CFDictionaryRef v4 = IOServiceMatching("AGXAccelerator");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (!MatchingService) {
    return;
  }
  io_object_t v6 = MatchingService;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"CoreConfig", kCFAllocatorDefault, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (CFProperty)
    {
      v8 = objc_opt_new();
      id v9 = [CFProperty copy];
      [v8 setObject:v9 forKeyedSubscript:@"AGXDriverInfo"];

      if (!ktrace_file_earliest_timestamp())
      {
        v10 = +[NSNumber numberWithUnsignedLongLong:0];
        [v8 setObject:v10 forKeyedSubscript:@"MachAbsoluteTime"];

        if (!ktrace_file_earliest_continuous_time())
        {
          io_object_t v11 = +[NSNumber numberWithUnsignedLongLong:0];
          [v8 setObject:v11 forKeyedSubscript:@"ContinuousTimeOffset"];
        }
      }
      if (!ktrace_file_earliest_walltime())
      {
        BOOL v12 = +[NSNumber numberWithDouble:(double)0 / 1000000.0 + (double)0];
        [v8 setObject:v12 forKeyedSubscript:@"SecondsSinceEpoch"];

        uint64_t v13 = +[NSTimeZone systemTimeZone];
        CFDictionaryRef v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 secondsFromGMT]);
        [v8 setObject:v14 forKeyedSubscript:@"SecondsFromGMT"];
      }
      IOObjectRelease(v6);
      if (ktrace_file_append_start())
      {
        id v15 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:200 options:0 error:0];
        [v15 bytes];
        [v15 length];
        if (ktrace_file_append_data())
        {
          v16 = __error();
          objc_super v17 = +[NSString stringWithFormat:@"Failed to add data to extended GPU Information chunk with error: %s", strerror(*v16)];
          [(KTProviderLogger *)self->_logger warnWithMessage:v17];
          ktrace_file_append_finish();
        }
        else
        {
          ktrace_file_append_finish();
        }
      }
      else
      {
        v19 = __error();
        id v15 = +[NSString stringWithFormat:@"Failed to create chunk for the extended GPU Information chunk with error: %s", strerror(*v19)];
        [(KTProviderLogger *)self->_logger warnWithMessage:v15];
      }

      return;
    }
  }
  else
  {
  }
  logger = self->_logger;

  [(KTProviderLogger *)logger warnWithMessage:@"Failed to retrieve AGX Core Config property from the AGXAccelerator service"];
}

- (void)enableGFXTracingIfNeeded
{
  if (self->_deviceKind == 2 && self->_isGraphicsCaptured) {
    sub_3BC0(1, self->_logger);
  }
}

- (void)disableGFXTracingIfNeeded
{
  if (self->_deviceKind == 2 && self->_isGraphicsCaptured) {
    sub_3BC0(0, self->_logger);
  }
}

- (unint64_t)deviceKind
{
  return self->_deviceKind;
}

- (void).cxx_destruct
{
}

@end