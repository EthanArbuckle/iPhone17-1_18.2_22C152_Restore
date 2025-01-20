@interface SUCoreDevice(SUCoreDeviceExtended)
- (uint64_t)rootVolumeSealValid;
- (uint64_t)rootVolumeUUID;
- (void)rootVolumeSealValid;
- (void)rootVolumeUUID;
@end

@implementation SUCoreDevice(SUCoreDeviceExtended)

- (uint64_t)rootVolumeUUID
{
  v0 = [MEMORY[0x263F77DE8] sharedLogger];
  v1 = [v0 oslog];

  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    [(SUCoreDevice(SUCoreDeviceExtended) *)v1 rootVolumeUUID];
  }

  return 0;
}

- (uint64_t)rootVolumeSealValid
{
  int v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = xmmword_20C9906B8;
  uint64_t v26 = 0;
  int v24 = 1;
  if (getattrlist("/", &v25, &v27, 0x24uLL, 0))
  {
    v0 = [MEMORY[0x263F77DE8] sharedLogger];
    v1 = [v0 oslog];

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.5();
    }
LABEL_16:
    uint64_t v21 = 0;
    goto LABEL_17;
  }
  if ((BYTE7(v28) & 2) == 0)
  {
    uint64_t v2 = [MEMORY[0x263F77DE8] sharedLogger];
    v1 = [v2 oslog];

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      [(SUCoreDevice(SUCoreDeviceExtended) *)v1 rootVolumeSealValid];
    }
    goto LABEL_16;
  }
  if ((BYTE7(v27) & 2) == 0)
  {
    v10 = [MEMORY[0x263F77DE8] sharedLogger];
    v1 = [v10 oslog];

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      [(SUCoreDevice(SUCoreDeviceExtended) *)v1 rootVolumeSealValid];
    }
    goto LABEL_16;
  }
  if (fsctl("/", 0x20006832uLL, 0, 0))
  {
    v18 = [MEMORY[0x263F77DE8] sharedLogger];
    v1 = [v18 oslog];

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.4();
    }
    goto LABEL_16;
  }
  int v19 = fsctl("/", 0x80044A58uLL, &v24, 0);
  v20 = [MEMORY[0x263F77DE8] sharedLogger];
  v1 = [v20 oslog];

  if (v19)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid]();
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_20C8EA000, v1, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RootVolumeSealValid: Root volume is sealed", v23, 2u);
  }
  uint64_t v21 = 1;
LABEL_17:

  return v21;
}

- (void)rootVolumeUUID
{
}

- (void)rootVolumeSealValid
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_20C8EA000, v1, v2, "[SUCoreDevice] RootVolumeSealValid: getattrlist failed for the root volume (%d: %s)", v3, v4, v5, v6, v7);
}

@end