@interface PRHelloResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)addlInfoSize;
- (NSNumber)apFirmwareVersion;
- (NSNumber)boardID;
- (NSNumber)calDataVersion;
- (NSNumber)dspFirmwareVersion;
- (NSNumber)modemInitVersion;
- (NSNumber)moduleID;
- (NSString)extraBytes;
- (NSString)roseFirmwareVersion;
- (NSString)target;
- (PRHelloResponse)initWithCoder:(id)a3;
- (PRHelloResponse)initWithHelloResponse:(const void *)a3;
- (PRHelloResponse)initWithRoseFirmwareVersion:(id)a3 hsiVersionMajor:(unsigned __int8)a4 hsiVersionMinor:(unsigned __int8)a5 hardwareVersion:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hardwareVersion;
- (unsigned)hsiVersionMajor;
- (unsigned)hsiVersionMinor;
- (void)encodeWithCoder:(id)a3;
- (void)setAddlInfoSize:(id)a3;
- (void)setApFirmwareVersion:(id)a3;
- (void)setBoardID:(id)a3;
- (void)setCalDataVersion:(id)a3;
- (void)setDspFirmwareVersion:(id)a3;
- (void)setExtraBytes:(id)a3;
- (void)setModemInitVersion:(id)a3;
- (void)setModuleID:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation PRHelloResponse

- (PRHelloResponse)initWithRoseFirmwareVersion:(id)a3 hsiVersionMajor:(unsigned __int8)a4 hsiVersionMinor:(unsigned __int8)a5 hardwareVersion:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PRHelloResponse;
  v12 = [(PRHelloResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_roseFirmwareVersion, a3);
    v13->_hsiVersionMajor = a4;
    v13->_hsiVersionMinor = a5;
    v13->_hardwareVersion = a6;
  }

  return v13;
}

- (PRHelloResponse)initWithHelloResponse:(const void *)a3
{
  v35.receiver = self;
  v35.super_class = (Class)PRHelloResponse;
  v4 = [(PRHelloResponse *)&v35 init];
  if (v4)
  {
    v5 = NSString;
    if (*((char *)a3 + 23) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *((void *)a3 + 1));
    }
    else {
      std::string __p = *(std::string *)a3;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    uint64_t v7 = objc_msgSend(v5, "stringWithUTF8String:", p_p, __p.__r_.__value_.__r.__words[0]);
    roseFirmwareVersion = v4->_roseFirmwareVersion;
    v4->_roseFirmwareVersion = (NSString *)v7;

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    v4->_hsiVersionMajor = *((unsigned char *)a3 + 24);
    v4->_hsiVersionMinor = *((unsigned char *)a3 + 25);
    if (*((unsigned __int16 *)a3 + 13) >= 7u) {
      uint64_t v9 = 7;
    }
    else {
      uint64_t v9 = *((unsigned __int16 *)a3 + 13);
    }
    v4->_hardwareVersion = v9;
    if (*((unsigned char *)a3 + 96))
    {
      LODWORD(__p.__r_.__value_.__l.__data_) = *((_DWORD *)a3 + 8);
      WORD2(__p.__r_.__value_.__r.__words[0]) = *((_WORD *)a3 + 18);
      if (*((char *)a3 + 63) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&__p.__r_.__value_.__r.__words[1], *((const std::string::value_type **)a3 + 5), *((void *)a3 + 6));
      }
      else
      {
        *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)((char *)a3 + 40);
        uint64_t v32 = *((void *)a3 + 7);
      }
      uint64_t v33 = *((void *)a3 + 8);
      if (*((char *)a3 + 95) < 0) {
        std::string::__init_copy_ctor_external(&v34, *((const std::string::value_type **)a3 + 9), *((void *)a3 + 10));
      }
      else {
        std::string v34 = *(std::string *)((unsigned char *)a3 + 3);
      }
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", __p.__r_.__value_.__s.__data_[0], __p.__r_.__value_.__r.__words[0]);
      addlInfoSize = v4->_addlInfoSize;
      v4->_addlInfoSize = (NSNumber *)v10;

      uint64_t v12 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)&__p.__r_.__value_.__s.__data_[2]];
      apFirmwareVersion = v4->_apFirmwareVersion;
      v4->_apFirmwareVersion = (NSNumber *)v12;

      uint64_t v14 = [NSNumber numberWithUnsignedShort:WORD2(__p.__r_.__value_.__r.__words[0])];
      dspFirmwareVersion = v4->_dspFirmwareVersion;
      v4->_dspFirmwareVersion = (NSNumber *)v14;

      if (v32 >= 0) {
        std::string::size_type p_size = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
      }
      else {
        std::string::size_type p_size = __p.__r_.__value_.__l.__size_;
      }
      uint64_t v17 = [NSString stringWithUTF8String:p_size];
      target = v4->_target;
      v4->_target = (NSString *)v17;

      uint64_t v19 = [NSNumber numberWithUnsignedShort:(unsigned __int16)v33];
      calDataVersion = v4->_calDataVersion;
      v4->_calDataVersion = (NSNumber *)v19;

      uint64_t v21 = [NSNumber numberWithUnsignedChar:BYTE2(v33)];
      moduleID = v4->_moduleID;
      v4->_moduleID = (NSNumber *)v21;

      uint64_t v23 = [NSNumber numberWithUnsignedInt:HIDWORD(v33)];
      modemInitVersion = v4->_modemInitVersion;
      v4->_modemInitVersion = (NSNumber *)v23;

      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v25 = &v34;
      }
      else {
        v25 = (std::string *)v34.__r_.__value_.__r.__words[0];
      }
      uint64_t v26 = [NSString stringWithUTF8String:v25];
      extraBytes = v4->_extraBytes;
      v4->_extraBytes = (NSString *)v26;

      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v34.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v32) < 0) {
        operator delete((void *)__p.__r_.__value_.__l.__size_);
      }
    }
    if ((*((void *)a3 + 13) & 0xFF00000000) != 0)
    {
      uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      boardID = v4->_boardID;
      v4->_boardID = (NSNumber *)v28;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRHelloResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roseFirmwareVersion"];
  v6 = -[PRHelloResponse initWithRoseFirmwareVersion:hsiVersionMajor:hsiVersionMinor:hardwareVersion:](self, "initWithRoseFirmwareVersion:hsiVersionMajor:hsiVersionMinor:hardwareVersion:", v5, [v4 decodeIntForKey:@"hsiVersionMajor"], objc_msgSend(v4, "decodeIntForKey:", @"hsiVersionMinor"), objc_msgSend(v4, "decodeIntegerForKey:", @"roseHardwareVersion"));

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addlInfoSize"];
  [(PRHelloResponse *)v6 setAddlInfoSize:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apFirmwareVersion"];
  [(PRHelloResponse *)v6 setApFirmwareVersion:v8];

  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dspFirmwareVersion"];
  [(PRHelloResponse *)v6 setDspFirmwareVersion:v9];

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"target"];
  [(PRHelloResponse *)v6 setTarget:v10];

  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calDataVersion"];
  [(PRHelloResponse *)v6 setCalDataVersion:v11];

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"moduleID"];
  [(PRHelloResponse *)v6 setModuleID:v12];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modemInitVersion"];
  [(PRHelloResponse *)v6 setModemInitVersion:v13];

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boardID"];
  [(PRHelloResponse *)v6 setBoardID:v14];

  objc_super v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extraBytes"];
  [(PRHelloResponse *)v6 setExtraBytes:v15];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_roseFirmwareVersion forKey:@"roseFirmwareVersion"];
  [v4 encodeInt:self->_hsiVersionMajor forKey:@"hsiVersionMajor"];
  [v4 encodeInt:self->_hsiVersionMinor forKey:@"hsiVersionMinor"];
  [v4 encodeInteger:self->_hardwareVersion forKey:@"roseHardwareVersion"];
  [v4 encodeObject:self->_addlInfoSize forKey:@"addlInfoSize"];
  [v4 encodeObject:self->_apFirmwareVersion forKey:@"apFirmwareVersion"];
  [v4 encodeObject:self->_dspFirmwareVersion forKey:@"dspFirmwareVersion"];
  [v4 encodeObject:self->_target forKey:@"target"];
  [v4 encodeObject:self->_calDataVersion forKey:@"calDataVersion"];
  [v4 encodeObject:self->_moduleID forKey:@"moduleID"];
  [v4 encodeObject:self->_modemInitVersion forKey:@"modemInitVersion"];
  [v4 encodeObject:self->_boardID forKey:@"boardID"];
  [v4 encodeObject:self->_extraBytes forKey:@"extraBytes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[PRHelloResponse alloc] initWithRoseFirmwareVersion:self->_roseFirmwareVersion hsiVersionMajor:self->_hsiVersionMajor hsiVersionMinor:self->_hsiVersionMinor hardwareVersion:self->_hardwareVersion];
  [(PRHelloResponse *)v4 setAddlInfoSize:self->_addlInfoSize];
  [(PRHelloResponse *)v4 setApFirmwareVersion:self->_apFirmwareVersion];
  [(PRHelloResponse *)v4 setDspFirmwareVersion:self->_dspFirmwareVersion];
  [(PRHelloResponse *)v4 setTarget:self->_target];
  [(PRHelloResponse *)v4 setCalDataVersion:self->_calDataVersion];
  [(PRHelloResponse *)v4 setModuleID:self->_moduleID];
  [(PRHelloResponse *)v4 setModemInitVersion:self->_modemInitVersion];
  [(PRHelloResponse *)v4 setBoardID:self->_boardID];
  [(PRHelloResponse *)v4 setExtraBytes:self->_extraBytes];
  return v4;
}

- (id)description
{
  NSUInteger v3 = [(NSString *)self->_extraBytes length];
  uint64_t hsiVersionMajor = self->_hsiVersionMajor;
  uint64_t hsiVersionMinor = self->_hsiVersionMinor;
  roseFirmwareVersion = self->_roseFirmwareVersion;
  unint64_t hardwareVersion = self->_hardwareVersion;
  addlInfoSize = self->_addlInfoSize;
  apFirmwareVersion = self->_apFirmwareVersion;
  dspFirmwareVersion = self->_dspFirmwareVersion;
  target = self->_target;
  calDataVersion = self->_calDataVersion;
  moduleID = self->_moduleID;
  if (v3) {
    [NSString stringWithFormat:@"Rose FW Version: %@, HSI Major: %d, HSI Minor: %d, Rose HW Version: %lu, Additional Info Size: %@, AP FW Version: %@, DSP FW Version: %@, Target: %@, Cal Data Version: %@, Module ID: %@, Modem Init Version: %@, Board ID: %@, Extra Bytes: %@", roseFirmwareVersion, hsiVersionMajor, hsiVersionMinor, hardwareVersion, addlInfoSize, apFirmwareVersion, dspFirmwareVersion, target, calDataVersion, moduleID, self->_modemInitVersion, self->_boardID, self->_extraBytes];
  }
  else {
  uint64_t v14 = [NSString stringWithFormat:@"Rose FW Version: %@, HSI Major: %d, HSI Minor: %d, Rose HW Version: %lu, Additional Info Size: %@, AP FW Version: %@, DSP FW Version: %@, Target: %@, Cal Data Version: %@, Module ID: %@, Modem Init Version: %@, Board ID: %@", roseFirmwareVersion, hsiVersionMajor, hsiVersionMinor, hardwareVersion, addlInfoSize, apFirmwareVersion, dspFirmwareVersion, target, calDataVersion, moduleID, self->_boardID, self->_modemInitVersion, v16];
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 roseFirmwareVersion];
    uint64_t v7 = [(PRHelloResponse *)self roseFirmwareVersion];
    if (![v6 isEqual:v7]
      || (int v8 = [v5 hsiVersionMajor], v8 != -[PRHelloResponse hsiVersionMajor](self, "hsiVersionMajor"))
      || (int v9 = [v5 hsiVersionMinor], v9 != -[PRHelloResponse hsiVersionMinor](self, "hsiVersionMinor"))
      || (uint64_t v10 = [v5 hardwareVersion], v10 != -[PRHelloResponse hardwareVersion](self, "hardwareVersion")))
    {
      char v16 = 0;
LABEL_19:

      goto LABEL_20;
    }
    id v11 = [v5 addlInfoSize];
    uint64_t v12 = [(PRHelloResponse *)self addlInfoSize];
    if (![v11 isEqual:v12])
    {
      char v16 = 0;
LABEL_44:

      goto LABEL_19;
    }
    v13 = [v5 apFirmwareVersion];
    uint64_t v14 = [(PRHelloResponse *)self apFirmwareVersion];
    if (![v13 isEqual:v14])
    {
      char v16 = 0;
LABEL_43:

      goto LABEL_44;
    }
    v36 = [v5 dspFirmwareVersion];
    objc_super v15 = [(PRHelloResponse *)self dspFirmwareVersion];
    if (![v36 isEqual:v15])
    {
      char v16 = 0;
LABEL_42:

      goto LABEL_43;
    }
    objc_super v35 = [v5 target];
    std::string v34 = [(PRHelloResponse *)self target];
    if (!objc_msgSend(v35, "isEqual:"))
    {
      char v16 = 0;
LABEL_41:

      goto LABEL_42;
    }
    uint64_t v33 = [v5 calDataVersion];
    uint64_t v32 = [(PRHelloResponse *)self calDataVersion];
    if (!objc_msgSend(v33, "isEqual:"))
    {
      char v16 = 0;
LABEL_40:

      goto LABEL_41;
    }
    v31 = [v5 moduleID];
    v30 = [(PRHelloResponse *)self moduleID];
    if (!objc_msgSend(v31, "isEqual:"))
    {
      char v16 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v29 = [v5 modemInitVersion];
    uint64_t v28 = [(PRHelloResponse *)self modemInitVersion];
    if (!objc_msgSend(v29, "isEqual:"))
    {
      char v16 = 0;
LABEL_38:

      goto LABEL_39;
    }
    v27 = [v5 boardID];
    if (v27
      || ([(PRHelloResponse *)self boardID], (v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v26 = [v5 boardID];
      v25 = [(PRHelloResponse *)self boardID];
      if (![v26 isEqual:v25])
      {
        char v16 = 0;
        goto LABEL_34;
      }
      int v23 = 1;
    }
    else
    {
      v20 = 0;
      int v23 = 0;
    }
    v22 = [v5 extraBytes];
    if (v22 || ([(PRHelloResponse *)self extraBytes], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = objc_msgSend(v5, "extraBytes", v18, v20);
      uint64_t v21 = [(PRHelloResponse *)self extraBytes];
      char v16 = [v24 isEqual:v21];

      if (v22)
      {

        if (!v23)
        {
LABEL_35:
          if (!v27) {

          }
          goto LABEL_38;
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v19 = 0;
      char v16 = 1;
    }

    if ((v23 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  char v16 = 0;
LABEL_20:

  return v16;
}

- (NSString)roseFirmwareVersion
{
  return self->_roseFirmwareVersion;
}

- (unsigned)hsiVersionMajor
{
  return self->_hsiVersionMajor;
}

- (unsigned)hsiVersionMinor
{
  return self->_hsiVersionMinor;
}

- (unint64_t)hardwareVersion
{
  return self->_hardwareVersion;
}

- (NSNumber)addlInfoSize
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAddlInfoSize:(id)a3
{
}

- (NSNumber)apFirmwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApFirmwareVersion:(id)a3
{
}

- (NSNumber)dspFirmwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDspFirmwareVersion:(id)a3
{
}

- (NSString)target
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTarget:(id)a3
{
}

- (NSNumber)calDataVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCalDataVersion:(id)a3
{
}

- (NSNumber)moduleID
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setModuleID:(id)a3
{
}

- (NSNumber)modemInitVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setModemInitVersion:(id)a3
{
}

- (NSNumber)boardID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBoardID:(id)a3
{
}

- (NSString)extraBytes
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExtraBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraBytes, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_modemInitVersion, 0);
  objc_storeStrong((id *)&self->_moduleID, 0);
  objc_storeStrong((id *)&self->_calDataVersion, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_dspFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_apFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_addlInfoSize, 0);
  objc_storeStrong((id *)&self->_roseFirmwareVersion, 0);
}

@end