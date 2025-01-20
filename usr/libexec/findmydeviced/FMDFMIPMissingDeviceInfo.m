@interface FMDFMIPMissingDeviceInfo
- (NSString)buildVersion;
- (NSString)imei;
- (NSString)meid;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)serialNumber;
- (NSString)udid;
- (void)setBuildVersion:(id)a3;
- (void)setImei:(id)a3;
- (void)setMeid:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUdid:(id)a3;
@end

@implementation FMDFMIPMissingDeviceInfo

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)imei
{
  return self->_imei;
}

- (void)setImei:(id)a3
{
}

- (NSString)meid
{
  return self->_meid;
}

- (void)setMeid:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_meid, 0);
  objc_storeStrong((id *)&self->_imei, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_udid, 0);
}

@end