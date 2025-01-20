@interface SUSettingsStatefulUIManagerFSMParam
- (BOOL)forceReload;
- (BOOL)refreshHasAnyChanges;
- (NSError)error;
- (SUSettingsFullScanResults)fullScanResults;
- (SUSettingsScanResults)refreshScanResults;
- (SUSettingsStatefulUIManagerFSMParam)initWithRetriesCount:(unsigned __int8)a3;
- (unint64_t)refreshPreviousState;
- (unsigned)retries;
- (void)setError:(id)a3;
- (void)setForceReload:(BOOL)a3;
- (void)setFullScanResults:(id)a3;
- (void)setRefreshHasAnyChanges:(BOOL)a3;
- (void)setRefreshPreviousState:(unint64_t)a3;
- (void)setRefreshScanResults:(id)a3;
- (void)setRetries:(unsigned __int8)a3;
@end

@implementation SUSettingsStatefulUIManagerFSMParam

- (SUSettingsStatefulUIManagerFSMParam)initWithRetriesCount:(unsigned __int8)a3
{
  SEL v8 = a2;
  unsigned __int8 v7 = a3;
  v9 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSettingsStatefulUIManagerFSMParam;
  v5 = [(SUSettingsStatefulUIManagerFSMParam *)&v6 init];
  v9 = v5;
  objc_storeStrong((id *)&v9, v5);
  if (v5) {
    [(SUSettingsStatefulUIManagerFSMParam *)v9 setRetries:v7];
  }
  v4 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v4;
}

- (SUSettingsScanResults)refreshScanResults
{
  return self->_refreshScanResults;
}

- (void)setRefreshScanResults:(id)a3
{
}

- (SUSettingsFullScanResults)fullScanResults
{
  return self->_fullScanResults;
}

- (void)setFullScanResults:(id)a3
{
}

- (unint64_t)refreshPreviousState
{
  return self->_refreshPreviousState;
}

- (void)setRefreshPreviousState:(unint64_t)a3
{
  self->_refreshPreviousState = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unsigned)retries
{
  return self->_retries;
}

- (void)setRetries:(unsigned __int8)a3
{
  self->_retries = a3;
}

- (BOOL)refreshHasAnyChanges
{
  return self->_refreshHasAnyChanges;
}

- (void)setRefreshHasAnyChanges:(BOOL)a3
{
  self->_refreshHasAnyChanges = a3;
}

- (BOOL)forceReload
{
  return self->_forceReload;
}

- (void)setForceReload:(BOOL)a3
{
  self->_forceReload = a3;
}

- (void).cxx_destruct
{
}

@end