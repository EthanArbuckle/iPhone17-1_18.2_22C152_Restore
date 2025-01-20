@interface SPRDeviceOSVersion
- (NSString)buildNumber;
- (NSString)productVersion;
- (NSString)shortVersion;
- (SPRDeviceOSVersion)initWithDERRepresentation:(id)a3;
- (id)description;
@end

@implementation SPRDeviceOSVersion

- (SPRDeviceOSVersion)initWithDERRepresentation:(id)a3
{
  id v4 = a3;
  v34[0] = objc_msgSend_bytes(v4, v5, v6, v7, v8, v9);
  v34[1] = objc_msgSend_length(v4, v10, v11, v12, v13, v14);
  v32[1] = 0;
  uint64_t v33 = 0;
  v32[0] = 0;
  if (!sub_221267430((uint64_t)v34, &v33, v32) && v33 == 0x2000000000000010)
  {
    unint64_t v30 = 0;
    v31[0] = 0;
    v31[1] = 0;
    while (!sub_2212674EC(v32, &v30))
    {
      if (v30 == 0xA00000000000057BLL)
      {
        unint64_t v27 = 0;
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        if (sub_22126708C((uint64_t)v31, &v27) || v27 != 4) {
          continue;
        }
        id v20 = [NSString alloc];
        v23 = (NSString *)objc_msgSend_initWithBytes_length_encoding_(v20, v21, v28, v29, 4, v22);
        buildNumber = self->_buildNumber;
        self->_buildNumber = v23;
      }
      else
      {
        if (v30 != 0xA000000000000578) {
          continue;
        }
        unint64_t v27 = 0;
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        if (sub_22126708C((uint64_t)v31, &v27) || v27 != 4) {
          continue;
        }
        id v15 = [NSString alloc];
        v18 = (NSString *)objc_msgSend_initWithBytes_length_encoding_(v15, v16, v28, v29, 4, v17);
        buildNumber = self->_productVersion;
        self->_productVersion = v18;
      }
    }
  }
  if (self->_productVersion) {
    v24 = self;
  }
  else {
    v24 = 0;
  }
  v25 = v24;

  return v25;
}

- (id)description
{
  productVersion = self->_productVersion;
  buildNumber = self->_buildNumber;
  if (buildNumber) {
    objc_msgSend_stringWithFormat_(NSString, a2, @"SPRDeviceOSVersion(productVersion:%@, buildNumber:%@)", v2, v3, v4, productVersion, buildNumber);
  }
  else {
  uint64_t v7 = objc_msgSend_stringWithFormat_(NSString, a2, @"SPRDeviceOSVersion(productVersion:%@)", v2, v3, v4, productVersion);
  }
  return v7;
}

- (NSString)shortVersion
{
  return self->_productVersion;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
}

@end