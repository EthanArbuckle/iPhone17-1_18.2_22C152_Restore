@interface CTClientDelegate
- (id)fCarrierBundleChangeCb;
- (id)fDefaultBundleChangeCb;
- (id)fOperatorBundleChangeCb;
- (id)fPrefDataSimChangedCb;
- (id)fTandemCapabilityChangeCb;
- (void)carrierBundleChange:(id)a3;
- (void)defaultBundleChange;
- (void)dualSimCapabilityDidChange;
- (void)operatorBundleChange:(id)a3;
- (void)preferredDataSimChanged:(id)a3;
- (void)setFCarrierBundleChangeCb:(id)a3;
- (void)setFDefaultBundleChangeCb:(id)a3;
- (void)setFOperatorBundleChangeCb:(id)a3;
- (void)setFPrefDataSimChangedCb:(id)a3;
- (void)setFTandemCapabilityChangeCb:(id)a3;
@end

@implementation CTClientDelegate

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,carrierBundleChange()\"}", (uint8_t *)v6, 0x12u);
  }
  (*((void (**)(void))self->_fCarrierBundleChangeCb + 2))();
}

- (void)operatorBundleChange:(id)a3
{
  id v4 = a3;
  v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,operatorBundleChange()\"}", (uint8_t *)v6, 0x12u);
  }
  (*((void (**)(void))self->_fOperatorBundleChangeCb + 2))();
}

- (void)defaultBundleChange
{
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,defaultBundleChange()\"}", (uint8_t *)v4, 0x12u);
  }
  (*((void (**)(void))self->_fDefaultBundleChangeCb + 2))();
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4 = a3;
  __int16 v5 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,preferredDataSimChanged()\"}", (uint8_t *)v6, 0x12u);
  }
  (*((void (**)(void))self->_fPrefDataSimChangedCb + 2))();
}

- (void)dualSimCapabilityDidChange
{
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ctsa,delegate,dualSimCapabilityDidChange()\"}", (uint8_t *)v4, 0x12u);
  }
  (*((void (**)(void))self->_fTandemCapabilityChangeCb + 2))();
}

- (id)fCarrierBundleChangeCb
{
  return self->_fCarrierBundleChangeCb;
}

- (void)setFCarrierBundleChangeCb:(id)a3
{
}

- (id)fOperatorBundleChangeCb
{
  return self->_fOperatorBundleChangeCb;
}

- (void)setFOperatorBundleChangeCb:(id)a3
{
}

- (id)fDefaultBundleChangeCb
{
  return self->_fDefaultBundleChangeCb;
}

- (void)setFDefaultBundleChangeCb:(id)a3
{
}

- (id)fPrefDataSimChangedCb
{
  return self->_fPrefDataSimChangedCb;
}

- (void)setFPrefDataSimChangedCb:(id)a3
{
}

- (id)fTandemCapabilityChangeCb
{
  return self->_fTandemCapabilityChangeCb;
}

- (void)setFTandemCapabilityChangeCb:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fTandemCapabilityChangeCb, 0);
  objc_storeStrong(&self->_fPrefDataSimChangedCb, 0);
  objc_storeStrong(&self->_fDefaultBundleChangeCb, 0);
  objc_storeStrong(&self->_fOperatorBundleChangeCb, 0);

  objc_storeStrong(&self->_fCarrierBundleChangeCb, 0);
}

@end