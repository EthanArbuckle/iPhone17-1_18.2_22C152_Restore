@interface NRPairedDevice
+ (BOOL)supportsSecureCoding;
- (NRDeviceIdentifier)nrDeviceIdentifier;
- (NRDevicePairingTarget)device;
- (NSData)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInternal;
- (void)setMetadata:(id)a3;
@end

@implementation NRPairedDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_nrDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setMetadata:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (NRDeviceIdentifier)nrDeviceIdentifier
{
  return self->_nrDeviceIdentifier;
}

- (NRDevicePairingTarget)device
{
  return self->_device;
}

- (id)initInternal
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (result)
  {
    v12.receiver = result;
    v12.super_class = (Class)NRPairedDevice;
    result = objc_msgSendSuper2(&v12, sel_init);
    if (!result)
    {
      v1 = nrCopyLogObj_1256();
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        v2 = v1;
        BOOL v3 = os_log_type_enabled(v1, OS_LOG_TYPE_ERROR);

        if (!v3)
        {
LABEL_9:
          _os_log_pack_size();
          MEMORY[0x270FA5388]();
          __error();
          uint64_t v10 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v10 = 136446210;
          *(void *)(v10 + 4) = "-[NRPairedDevice initInternal]";
          id v11 = nrCopyLogObj_1256();
          _NRLogAbortWithPack(v11);
        }
      }
      id v4 = nrCopyLogObj_1256();
      _NRLogWithArgs((uint64_t)v4, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v5, v6, v7, v8, v9, (uint64_t)"");

      goto LABEL_9;
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NRPairedDevice *)self device];
  if (v4) {
    objc_storeStrong(v4 + 1, v5);
  }

  uint64_t v7 = [(NRPairedDevice *)self nrDeviceIdentifier];
  if (v4) {
    objc_setProperty_nonatomic_copy(v4, v6, v7, 16);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end