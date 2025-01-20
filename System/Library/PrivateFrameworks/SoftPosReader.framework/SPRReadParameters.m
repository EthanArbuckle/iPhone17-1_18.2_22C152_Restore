@interface SPRReadParameters
+ (BOOL)supportsSecureCoding;
- ($2F068FC02377E22BA03580A8162C781E)amount;
- (NSArray)preferredSchemes;
- (NSArray)urls;
- (NSArray)vasPasses;
- (NSArray)vasProtocol;
- (NSArray)vasRequests;
- (NSData)currencyCode;
- (NSData)interfaceDeviceSerial;
- (NSData)merchantCategoryCode;
- (NSData)schemePreference;
- (NSString)kernelToken;
- (NSString)transactionId;
- (SPRReadParameters)initWithCoder:(id)a3;
- (SPRReadParameters)initWithMode:(int64_t)a3 vasPasses:(id)a4 urls:(id)a5 amount:(id *)a6 currencyCode:(id)a7 transactionType:(unsigned __int8)a8 merchantCategoryCode:(id)a9 interfaceDeviceSerial:(id)a10 kernelToken:(id)a11 timeoutReadPay:(int64_t)a12 timeoutReadVas:(int64_t)a13;
- (SPRReadParameters)initWithMode:(int64_t)a3 vasPasses:(id)a4 urls:(id)a5 amount:(id *)a6 currencyCode:(id)a7 transactionType:(unsigned __int8)a8 merchantCategoryCode:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12;
- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12;
- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12 transactionId:(id)a13;
- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12 transactionId:(id)a13 preferredSchemes:(id)a14;
- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12 transactionId:(id)a13 schemePreference:(id)a14;
- (id)description;
- (int64_t)mode;
- (int64_t)timeoutReadPay;
- (int64_t)timeoutReadVas;
- (unsigned)transactionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPRReadParameters

- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12 transactionId:(id)a13 preferredSchemes:(id)a14
{
  v18 = (NSArray *)a4;
  v19 = (NSData *)a6;
  v20 = (NSData *)a8;
  v21 = (NSData *)a9;
  v22 = (NSString *)a10;
  v23 = (NSString *)a13;
  v24 = (NSArray *)a14;
  vasRequests = self->_vasRequests;
  self->_mode = a3;
  self->_vasRequests = v18;
  v41 = v18;

  long long v26 = *(_OWORD *)a5;
  *(_DWORD *)&self->_amount._mantissa[6] = *(_DWORD *)&a5->var5[6];
  *(_OWORD *)&self->_amount = v26;
  currencyCode = self->_currencyCode;
  self->_currencyCode = v19;
  v28 = v19;

  self->_transactionType = a7;
  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v20;
  v30 = v20;

  interfaceDeviceSerial = self->_interfaceDeviceSerial;
  self->_interfaceDeviceSerial = v21;
  v32 = v21;

  kernelToken = self->_kernelToken;
  self->_kernelToken = v22;
  v34 = v22;

  self->_timeoutReadPay = a11;
  self->_timeoutReadVas = a12;
  transactionId = self->_transactionId;
  self->_transactionId = v23;
  v36 = v23;

  preferredSchemes = self->_preferredSchemes;
  self->_preferredSchemes = v24;

  return self;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12 transactionId:(id)a13
{
  $2F068FC02377E22BA03580A8162C781E v14 = *a5;
  return (SPRReadParameters *)objc_msgSend_initWithMode_vasRequests_amount_currencyCode_transactionType_merchantCategoryCode_interfaceDeviceSerial_kernelToken_timeoutReadPay_timeoutReadVas_transactionId_preferredSchemes_(self, a2, a3, (uint64_t)a4, (uint64_t)&v14, (uint64_t)a6, a7, a8, a9, a10, a11, a12, a13, 0);
}

- (id)description
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  if (objc_msgSend_count(self->_vasRequests, a2, v2, v3, v4, v5))
  {
    objc_msgSend_componentsJoinedByString_(self->_vasRequests, v7, @" ", v8, v9, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = @"empty";
  }
  id v12 = [NSString alloc];
  v21 = objc_msgSend_initWithData_encoding_(v12, v13, (uint64_t)self->_interfaceDeviceSerial, 1, v14, v15);
  if (!v21)
  {
    v21 = objc_msgSend_asHexString(self->_interfaceDeviceSerial, v16, v17, v18, v19, v20);
  }
  if (objc_msgSend_count(self->_preferredSchemes, v16, v17, v18, v19, v20))
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v26 = self->_preferredSchemes;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v76, (uint64_t)v80, 16, v28);
    if (v29)
    {
      uint64_t v35 = v29;
      uint64_t v36 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v77 != v36) {
            objc_enumerationMutation(v26);
          }
          v38 = objc_msgSend_asHexString(*(void **)(*((void *)&v76 + 1) + 8 * i), v30, v31, v32, v33, v34);
          objc_msgSend_appendString_(0, v39, (uint64_t)v38, v40, v41, v42);

          objc_msgSend_appendString_(0, v43, @", ", v44, v45, v46);
        }
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v30, (uint64_t)&v76, (uint64_t)v80, 16, v34);
      }
      while (v35);
    }

    v47 = 0;
  }
  else
  {
    v47 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v22, @"empty", v23, v24, v25);
  }
  v48 = NSString;
  v49 = SPRReaderModeCopyDescription(self->_mode);
  long long amount = (__int128)self->_amount;
  int v75 = *(_DWORD *)&self->_amount._mantissa[6];
  v54 = objc_msgSend_decimalNumberWithDecimal_(MEMORY[0x263F087B0], v50, (uint64_t)&amount, v51, v52, v53);
  v60 = objc_msgSend_asHexString(self->_currencyCode, v55, v56, v57, v58, v59);
  v61 = SPRTransactionTypeCopyDescription(self->_transactionType);
  v67 = objc_msgSend_asHexString(self->_merchantCategoryCode, v62, v63, v64, v65, v66);
  v72 = objc_msgSend_stringWithFormat_(v48, v68, @"{mode=%@, vasRequests=%@, amount=%@, currencyCode=%@, transactionType=%@, merchantCategoryCode=%@, interfaceDeviceSerial=%@, timeoutReadPay=%ld, timeoutReadVas=%ld, transactionId=%@, preferredSchemes=%@}", v69, v70, v71, v49, v11, v54, v60, v61, v67, v21, self->_timeoutReadPay, self->_timeoutReadVas, self->_transactionId, v47);

  return v72;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRReadParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_mode = objc_msgSend_decodeIntegerForKey_(v4, v5, @"mode", v6, v7, v8);
  uint64_t v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v16 = objc_msgSend_setWithObjects_(v9, v12, v10, v13, v14, v15, v11, 0);
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, @"vasRequests", v18, v19);
  uint64_t v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  vasRequests = self->_vasRequests;
  self->_vasRequests = v20;

  if (v4)
  {
    objc_msgSend_decodeDecimalForKey_(v4, v22, @"amount", v23, v24, v25);
  }
  else
  {
    long long v88 = 0uLL;
    int v89 = 0;
  }
  *(_OWORD *)&self->_long long amount = v88;
  *(_DWORD *)&self->_amount._mantissa[6] = v89;
  uint64_t v26 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"currencyCode", v28, v29);
  v30 = (NSData *)objc_claimAutoreleasedReturnValue();
  currencyCode = self->_currencyCode;
  self->_currencyCode = v30;

  self->_transactionType = objc_msgSend_decodeIntegerForKey_(v4, v32, @"transactionType", v33, v34, v35);
  uint64_t v36 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"merchantCategoryCode", v38, v39);
  uint64_t v40 = (NSData *)objc_claimAutoreleasedReturnValue();
  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v40;

  uint64_t v42 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"interfaceDeviceSerial", v44, v45);
  uint64_t v46 = (NSData *)objc_claimAutoreleasedReturnValue();
  interfaceDeviceSerial = self->_interfaceDeviceSerial;
  self->_interfaceDeviceSerial = v46;

  uint64_t v48 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v49, v48, @"kernelToken", v50, v51);
  uint64_t v52 = (NSString *)objc_claimAutoreleasedReturnValue();
  kernelToken = self->_kernelToken;
  self->_kernelToken = v52;

  self->_timeoutReadPay = objc_msgSend_decodeIntegerForKey_(v4, v54, @"timeoutReadPay", v55, v56, v57);
  self->_timeoutReadVas = objc_msgSend_decodeIntegerForKey_(v4, v58, @"timeoutReadVas", v59, v60, v61);
  uint64_t v62 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v62, @"transactionId", v64, v65);
  uint64_t v66 = (NSString *)objc_claimAutoreleasedReturnValue();
  transactionId = self->_transactionId;
  self->_transactionId = v66;

  uint64_t v68 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, @"schemePreference", v70, v71);
  v72 = (NSData *)objc_claimAutoreleasedReturnValue();
  schemePreference = self->_schemePreference;
  self->_schemePreference = v72;

  v74 = (void *)MEMORY[0x263EFFA08];
  uint64_t v75 = objc_opt_class();
  uint64_t v76 = objc_opt_class();
  uint64_t v81 = objc_msgSend_setWithObjects_(v74, v77, v75, v78, v79, v80, v76, 0);
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v82, (uint64_t)v81, @"preferredSchemes", v83, v84);
  v85 = (NSArray *)objc_claimAutoreleasedReturnValue();
  preferredSchemes = self->_preferredSchemes;
  self->_preferredSchemes = v85;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mode = self->_mode;
  id v5 = a3;
  objc_msgSend_encodeInteger_forKey_(v5, v6, mode, @"mode", v7, v8);
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)self->_vasRequests, @"vasRequests", v10, v11);
  $FCF7D23349B6810E0BB445A99467135A amount = self->_amount;
  objc_msgSend_encodeDecimal_forKey_(v5, v12, (uint64_t)&amount, @"amount", v13, v14);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)self->_currencyCode, @"currencyCode", v16, v17);
  objc_msgSend_encodeInteger_forKey_(v5, v18, self->_transactionType, @"transactionType", v19, v20);
  objc_msgSend_encodeObject_forKey_(v5, v21, (uint64_t)self->_merchantCategoryCode, @"merchantCategoryCode", v22, v23);
  objc_msgSend_encodeObject_forKey_(v5, v24, (uint64_t)self->_interfaceDeviceSerial, @"interfaceDeviceSerial", v25, v26);
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)self->_kernelToken, @"kernelToken", v28, v29);
  objc_msgSend_encodeInteger_forKey_(v5, v30, self->_timeoutReadPay, @"timeoutReadPay", v31, v32);
  objc_msgSend_encodeInteger_forKey_(v5, v33, self->_timeoutReadVas, @"timeoutReadVas", v34, v35);
  objc_msgSend_encodeObject_forKey_(v5, v36, (uint64_t)self->_transactionId, @"transactionId", v37, v38);
  objc_msgSend_encodeObject_forKey_(v5, v39, (uint64_t)self->_schemePreference, @"schemePreference", v40, v41);
  objc_msgSend_encodeObject_forKey_(v5, v42, (uint64_t)self->_preferredSchemes, @"preferredSchemes", v43, v44);
}

- (NSArray)vasProtocol
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = objc_msgSend_count(self->_vasRequests, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_arrayWithCapacity_(v7, v9, v8, v10, v11, v12);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = self->_vasRequests;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v36, 16, v16);
  if (v17)
  {
    uint64_t v23 = v17;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v14);
        }
        uint64_t v26 = objc_msgSend_vasTerminalProtocol(*(void **)(*((void *)&v32 + 1) + 8 * i), v18, v19, v20, v21, v22, (void)v32);
        objc_msgSend_addObject_(v13, v27, (uint64_t)v26, v28, v29, v30);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v32, (uint64_t)v36, 16, v22);
    }
    while (v23);
  }

  return (NSArray *)v13;
}

- (NSArray)vasPasses
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = objc_msgSend_count(self->_vasRequests, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_arrayWithCapacity_(v7, v9, v8, v10, v11, v12);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = self->_vasRequests;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v36, 16, v16);
  if (v17)
  {
    uint64_t v23 = v17;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v14);
        }
        uint64_t v26 = objc_msgSend_merchantId(*(void **)(*((void *)&v32 + 1) + 8 * i), v18, v19, v20, v21, v22, (void)v32);
        objc_msgSend_addObject_(v13, v27, (uint64_t)v26, v28, v29, v30);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v32, (uint64_t)v36, 16, v22);
    }
    while (v23);
  }

  return (NSArray *)v13;
}

- (NSArray)urls
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = objc_msgSend_count(self->_vasRequests, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_arrayWithCapacity_(v7, v9, v8, v10, v11, v12);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = self->_vasRequests;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v36, 16, v16);
  if (v17)
  {
    uint64_t v23 = v17;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v14);
        }
        uint64_t v26 = objc_msgSend_vasUrl(*(void **)(*((void *)&v32 + 1) + 8 * i), v18, v19, v20, v21, v22, (void)v32);
        objc_msgSend_addObject_(v13, v27, (uint64_t)v26, v28, v29, v30);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v32, (uint64_t)v36, 16, v22);
    }
    while (v23);
  }

  return (NSArray *)v13;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasPasses:(id)a4 urls:(id)a5 amount:(id *)a6 currencyCode:(id)a7 transactionType:(unsigned __int8)a8 merchantCategoryCode:(id)a9 interfaceDeviceSerial:(id)a10 kernelToken:(id)a11 timeoutReadPay:(int64_t)a12 timeoutReadVas:(int64_t)a13
{
  unsigned int v39 = a8;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a7;
  uint64_t v21 = sub_22124DC6C(a4, a5);
  v27 = objc_msgSend_UUID(MEMORY[0x263F08C38], v22, v23, v24, v25, v26);
  long long v33 = objc_msgSend_description(v27, v28, v29, v30, v31, v32);
  $2F068FC02377E22BA03580A8162C781E v40 = *a6;
  Vas_transactionId_schemePreference = (SPRReadParameters *)objc_msgSend_initWithMode_vasRequests_amount_currencyCode_transactionType_merchantCategoryCode_interfaceDeviceSerial_kernelToken_timeoutReadPay_timeoutReadVas_transactionId_schemePreference_(self, v34, a3, (uint64_t)v21, (uint64_t)&v40, (uint64_t)v20, v39, v19, v18, v17, a12, a13, v33, 0);

  return Vas_transactionId_schemePreference;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasPasses:(id)a4 urls:(id)a5 amount:(id *)a6 currencyCode:(id)a7 transactionType:(unsigned __int8)a8 merchantCategoryCode:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12
{
  unsigned int v38 = a8;
  id v16 = a10;
  id v17 = a9;
  id v18 = a7;
  id v19 = sub_22124DC6C(a4, a5);
  id v20 = objc_opt_new();
  uint64_t v26 = objc_msgSend_UUID(MEMORY[0x263F08C38], v21, v22, v23, v24, v25);
  uint64_t v32 = objc_msgSend_description(v26, v27, v28, v29, v30, v31);
  $2F068FC02377E22BA03580A8162C781E v39 = *a6;
  Vas_transactionId_schemePreference = (SPRReadParameters *)objc_msgSend_initWithMode_vasRequests_amount_currencyCode_transactionType_merchantCategoryCode_interfaceDeviceSerial_kernelToken_timeoutReadPay_timeoutReadVas_transactionId_schemePreference_(self, v33, a3, (uint64_t)v19, (uint64_t)&v39, (uint64_t)v18, v38, v17, v20, v16, a11, a12, v32, 0);

  return Vas_transactionId_schemePreference;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12
{
  unsigned int v39 = a7;
  id v16 = (void *)MEMORY[0x263F08C38];
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a6;
  id v21 = a4;
  v27 = objc_msgSend_UUID(v16, v22, v23, v24, v25, v26);
  long long v33 = objc_msgSend_description(v27, v28, v29, v30, v31, v32);
  $2F068FC02377E22BA03580A8162C781E v40 = *a5;
  Vas_transactionId_schemePreference = (SPRReadParameters *)objc_msgSend_initWithMode_vasRequests_amount_currencyCode_transactionType_merchantCategoryCode_interfaceDeviceSerial_kernelToken_timeoutReadPay_timeoutReadVas_transactionId_schemePreference_(self, v34, a3, (uint64_t)v21, (uint64_t)&v40, (uint64_t)v20, v39, v19, v18, v17, a11, a12, v33, 0);

  return Vas_transactionId_schemePreference;
}

- (SPRReadParameters)initWithMode:(int64_t)a3 vasRequests:(id)a4 amount:(id *)a5 currencyCode:(id)a6 transactionType:(unsigned __int8)a7 merchantCategoryCode:(id)a8 interfaceDeviceSerial:(id)a9 kernelToken:(id)a10 timeoutReadPay:(int64_t)a11 timeoutReadVas:(int64_t)a12 transactionId:(id)a13 schemePreference:(id)a14
{
  id v19 = (NSArray *)a4;
  id v20 = (NSData *)a6;
  id v21 = (NSData *)a8;
  uint64_t v22 = (NSData *)a9;
  uint64_t v23 = (NSString *)a10;
  uint64_t v24 = (NSString *)a13;
  vasRequests = self->_vasRequests;
  self->_int64_t mode = a3;
  self->_vasRequests = v19;
  uint64_t v46 = v19;
  id v26 = a14;

  long long v27 = *(_OWORD *)a5;
  *(_DWORD *)&self->_amount._mantissa[6] = *(_DWORD *)&a5->var5[6];
  *(_OWORD *)&self->_$FCF7D23349B6810E0BB445A99467135A amount = v27;
  currencyCode = self->_currencyCode;
  self->_currencyCode = v20;
  uint64_t v29 = v20;

  self->_transactionType = a7;
  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v21;
  uint64_t v31 = v21;

  interfaceDeviceSerial = self->_interfaceDeviceSerial;
  self->_interfaceDeviceSerial = v22;
  long long v33 = v22;

  kernelToken = self->_kernelToken;
  self->_kernelToken = v23;
  long long v35 = v23;

  self->_timeoutReadPay = a11;
  self->_timeoutReadVas = a12;
  transactionId = self->_transactionId;
  self->_transactionId = v24;
  uint64_t v37 = v24;

  objc_msgSend_arrayWithObjects_(MEMORY[0x263EFF8C0], v38, (uint64_t)v26, v39, v40, v41, 0);
  uint64_t v42 = (NSArray *)objc_claimAutoreleasedReturnValue();

  preferredSchemes = self->_preferredSchemes;
  self->_preferredSchemes = v42;

  return self;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSArray)vasRequests
{
  return self->_vasRequests;
}

- ($2F068FC02377E22BA03580A8162C781E)amount
{
  *($FCF7D23349B6810E0BB445A99467135A *)retstr = *($FCF7D23349B6810E0BB445A99467135A *)((char *)self + 104);
  return self;
}

- (NSData)currencyCode
{
  return self->_currencyCode;
}

- (unsigned)transactionType
{
  return self->_transactionType;
}

- (NSData)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (NSData)interfaceDeviceSerial
{
  return self->_interfaceDeviceSerial;
}

- (NSString)kernelToken
{
  return self->_kernelToken;
}

- (int64_t)timeoutReadPay
{
  return self->_timeoutReadPay;
}

- (int64_t)timeoutReadVas
{
  return self->_timeoutReadVas;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (NSData)schemePreference
{
  return self->_schemePreference;
}

- (NSArray)preferredSchemes
{
  return self->_preferredSchemes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSchemes, 0);
  objc_storeStrong((id *)&self->_schemePreference, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_kernelToken, 0);
  objc_storeStrong((id *)&self->_interfaceDeviceSerial, 0);
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_vasRequests, 0);
}

@end