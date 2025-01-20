@interface AppleSTDP2700Bootstrap
- (AppleSTDP2700Bootstrap)bootstrapWithOptions:(id)a3;
- (AppleSTDP2700Bootstrap)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AppleSTDP2700Bootstrap

- (AppleSTDP2700Bootstrap)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  if (a4
    && (v8.receiver = self,
        v8.super_class = (Class)AppleSTDP2700Bootstrap,
        (self = [(AppleSTDP2700Bootstrap *)&v8 init]) != 0))
  {
    self->_delegate = (FudPluginDelegate *)a4;
  }
  else
  {
    v7 = self;
    return 0;
  }
  return self;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FudPluginDelegate *)a3;
}

- (AppleSTDP2700Bootstrap)bootstrapWithOptions:(id)a3
{
  memset(&v24, 0, sizeof(v24));
  -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 5, @"%s\n", "-[AppleSTDP2700Bootstrap bootstrapWithOptions:]");
  if (stat("/usr/standalone/firmware/STDP2700/runtime", &v24))
  {
    -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3, @"%s: firmware not found: %s\n", "-[AppleSTDP2700Bootstrap bootstrapWithOptions:]", "/usr/standalone/firmware/STDP2700/runtime");
  }
  else
  {
    id v6 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"IOMatchLaunchServiceID"), "unsignedLongLongValue");
    CFDictionaryRef v7 = IORegistryEntryIDMatching((uint64_t)v6);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v7);
    if (MatchingService)
    {
      io_service_t v9 = MatchingService;
      while (1)
      {
        v10 = (const void *)IODPDeviceCreateWithService();
        IOObjectRelease(v9);
        if (!v10) {
          break;
        }
        uint64_t v11 = DPFUSessionCreate((uint64_t)kCFAllocatorDefault, v10, 2u);
        if (v11)
        {
          v12 = (const void *)v11;
          DPFUSessionSetLogLevel(v11, 7);
          uint64_t updated = DPFUSessionEnterUpdateMode((uint64_t)v12);
          if (updated)
          {
            -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3, @"%s: DPFUSessionEnterUpdateMode() failed: ret=0x%08x\n", "-[AppleSTDP2700Bootstrap bootstrapWithOptions:]", updated);
          }
          else
          {
            uint64_t v19 = DPFUSessionInstallFilePayload((uint64_t)v12, "/usr/standalone/firmware/STDP2700/runtime", 0, v14, v15, v16, v17, v18);
            if (v19)
            {
              -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3, @"%s: DPFUSessionInstallFilePayload() failed: ret=0x%08x\n", "-[AppleSTDP2700Bootstrap bootstrapWithOptions:]", v19);
            }
            else
            {
              uint64_t v20 = DPFUSessionLeaveUpdateMode((uint64_t)v12);
              if (!v20)
              {
                CFRelease(v10);
                CFRelease(v12);
                uint64_t v5 = 1;
                return (AppleSTDP2700Bootstrap *)[(FudPluginDelegate *)self->_delegate didBootstrap:v5 info:0 error:0];
              }
              -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3, @"%s: DPFUSessionLeaveUpdateMode() failed: ret=0x%08x\n", "-[AppleSTDP2700Bootstrap bootstrapWithOptions:]", v20);
            }
          }
          CFRelease(v10);
        }
        else
        {
          -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3, @"%s: DPFUSessionCreate() failed\n", "-[AppleSTDP2700Bootstrap bootstrapWithOptions:]");
          v12 = v10;
        }
        CFRelease(v12);
        -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3, @"%s: retrying after 1 second...\n", "-[AppleSTDP2700Bootstrap bootstrapWithOptions:]");
        sleep(1u);
        CFDictionaryRef v21 = IORegistryEntryIDMatching((uint64_t)v6);
        io_service_t v9 = IOServiceGetMatchingService(kIOMasterPortDefault, v21);
        if (!v9) {
          goto LABEL_17;
        }
      }
      -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3, @"%s: DP device not found\n", "-[AppleSTDP2700Bootstrap bootstrapWithOptions:]", v23);
    }
    else
    {
LABEL_17:
      -[FudPluginDelegate log:format:](self->_delegate, "log:format:", 3, @"%s: No matching io_service_t\n", "-[AppleSTDP2700Bootstrap bootstrapWithOptions:]", v23);
    }
  }
  uint64_t v5 = 0;
  return (AppleSTDP2700Bootstrap *)[(FudPluginDelegate *)self->_delegate didBootstrap:v5 info:0 error:0];
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
}

- (void)downloadFirmwareWithOptions:(id)a3
{
}

- (void)prepareFirmwareWithOptions:(id)a3
{
}

- (void)applyFirmwareWithOptions:(id)a3
{
}

- (void)finishWithOptions:(id)a3
{
}

@end