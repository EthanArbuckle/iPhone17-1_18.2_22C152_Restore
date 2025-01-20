@interface MIBUDeviceInfoResponse
- (BOOL)_deserialize:(id)a3;
- (BOOL)productionMode;
- (BOOL)securityMode;
- (BOOL)sikaFuseExists;
- (BOOL)uidMode;
- (MIBUDeviceInfoResponse)init;
- (NSData)apNonce;
- (NSData)sepNonce;
- (NSNumber)boardID;
- (NSNumber)chipID;
- (NSNumber)ecid;
- (NSNumber)securityDomain;
- (NSNumber)sikaFuse;
- (NSString)serialNumber;
- (id)serialize;
- (void)setApNonce:(id)a3;
- (void)setBoardID:(id)a3;
- (void)setChipID:(id)a3;
- (void)setEcid:(id)a3;
- (void)setProductionMode:(BOOL)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setSecurityMode:(BOOL)a3;
- (void)setSepNonce:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSikaFuse:(id)a3;
- (void)setSikaFuseExists:(BOOL)a3;
- (void)setUidMode:(BOOL)a3;
@end

@implementation MIBUDeviceInfoResponse

- (MIBUDeviceInfoResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUDeviceInfoResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUDeviceInfoResponse *)v2 setSerialNumber:0];
    [(MIBUDeviceInfoResponse *)v3 setEcid:0];
    [(MIBUDeviceInfoResponse *)v3 setBoardID:0];
    [(MIBUDeviceInfoResponse *)v3 setChipID:0];
    [(MIBUDeviceInfoResponse *)v3 setApNonce:0];
    [(MIBUDeviceInfoResponse *)v3 setSepNonce:0];
    [(MIBUDeviceInfoResponse *)v3 setSecurityDomain:0];
    [(MIBUDeviceInfoResponse *)v3 setProductionMode:0];
    [(MIBUDeviceInfoResponse *)v3 setSecurityMode:0];
    [(MIBUDeviceInfoResponse *)v3 setUidMode:0];
    [(MIBUDeviceInfoResponse *)v3 setSikaFuse:0];
    [(MIBUDeviceInfoResponse *)v3 setSikaFuseExists:1];
  }
  return v3;
}

- (id)serialize
{
  v3 = objc_opt_new();
  if (![(MIBUNFCResponse *)self rejected])
  {
    uint64_t v4 = [(MIBUDeviceInfoResponse *)self serialNumber];
    v35[0] = v4;
    uint64_t v5 = [(MIBUDeviceInfoResponse *)self ecid];
    v35[1] = v5;
    uint64_t v6 = [(MIBUDeviceInfoResponse *)self boardID];
    v35[2] = v6;
    uint64_t v7 = [(MIBUDeviceInfoResponse *)self chipID];
    v35[3] = v7;
    uint64_t v8 = [(MIBUDeviceInfoResponse *)self securityDomain];
    v35[4] = v8;
    uint64_t v9 = [(MIBUDeviceInfoResponse *)self apNonce];
    if (v9)
    {
      uint64_t v10 = [(MIBUDeviceInfoResponse *)self apNonce];
    }
    else
    {
      uint64_t v10 = objc_opt_new();
    }
    v11 = (void *)v10;
    v35[5] = v10;
    [(MIBUDeviceInfoResponse *)self sepNonce];
    v33 = (void *)v5;
    v34 = (void *)v4;
    v31 = (void *)v7;
    v32 = (void *)v6;
    v29 = (void *)v9;
    uint64_t v26 = v30 = (void *)v8;
    v28 = v11;
    if (v26)
    {
      uint64_t v12 = [(MIBUDeviceInfoResponse *)self sepNonce];
    }
    else
    {
      uint64_t v12 = objc_opt_new();
    }
    v13 = (void *)v12;
    v35[6] = v12;
    v14 = +[NSNumber numberWithBool:[(MIBUDeviceInfoResponse *)self productionMode]];
    v35[7] = v14;
    v15 = +[NSNumber numberWithBool:[(MIBUDeviceInfoResponse *)self securityMode]];
    v35[8] = v15;
    v16 = +[NSNumber numberWithBool:[(MIBUDeviceInfoResponse *)self uidMode]];
    v35[9] = v16;
    v17 = [(MIBUDeviceInfoResponse *)self sikaFuse];
    v35[10] = v17;
    v18 = +[NSNumber numberWithBool:[(MIBUDeviceInfoResponse *)self sikaFuseExists]];
    v35[11] = v18;
    v19 = +[NSArray arrayWithObjects:v35 count:12];
    unsigned __int8 v20 = [v3 serialize:&off_1000613A8 withValue:v19];

    if (v20)
    {
      v21 = [(MIBUNFCResponse *)self error];
      unsigned __int8 v22 = [v3 serializeResponseError:v21];

      if (v22)
      {
        v23 = [v3 serializedData];
        goto LABEL_11;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005C3F8);
      }
      v25 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003E31C(v25, self);
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005C3D8);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_100041B78();
      }
    }
  }
  v23 = 0;
LABEL_11:

  return v23;
}

- (BOOL)_deserialize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[MIBUDeserializer alloc] initWithData:v4];

  uint64_t v6 = [(MIBUDeserializer *)v5 deserialize];
  v44 = v5;
  if (!v6)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C418);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041BAC();
    }
    goto LABEL_38;
  }
  id v49 = 0;
  unsigned __int8 v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v49];
  id v8 = v49;
  uint64_t v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C438);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041DE8();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_45;
  }
  if (v8)
  {
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_22;
  }
  uint64_t v10 = [v6 objectForKey:&off_100060B58];
  if (!v10)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C458);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041BE0();
    }
LABEL_38:
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
LABEL_44:
    uint64_t v9 = 0;
LABEL_45:
    BOOL v31 = 0;
    goto LABEL_23;
  }
  v11 = (void *)v10;
  uint64_t v12 = [v6 objectForKey:&off_100060B70];
  if (!v12)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C478);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041C14();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    v29 = 0;
    goto LABEL_44;
  }
  v13 = (void *)v12;
  uint64_t v14 = [v6 objectForKey:&off_100060B88];
  if (!v14)
  {
    v39 = v13;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C498);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041C48();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
    v28 = 0;
    goto LABEL_56;
  }
  v15 = (void *)v14;
  uint64_t v16 = [v6 objectForKey:&off_100060BA0];
  if (!v16)
  {
    v39 = v13;
    v28 = v15;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C4B8);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041C7C();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    id v27 = 0;
LABEL_56:
    uint64_t v9 = 0;
    BOOL v31 = 0;
    v29 = v39;
    goto LABEL_23;
  }
  v17 = (void *)v16;
  uint64_t v18 = [v6 objectForKey:&off_100060BB8];
  if (!v18)
  {
    v37 = v17;
    v40 = v13;
    v28 = v15;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C4D8);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041CB0();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
    v32 = 0;
    goto LABEL_67;
  }
  v19 = (void *)v18;
  uint64_t v20 = [v6 objectForKey:&off_100060BD0];
  if (!v20)
  {
    v32 = v19;
    v37 = v17;
    v40 = v13;
    v28 = v15;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C4F8);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041CE4();
    }
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    v21 = 0;
LABEL_67:
    uint64_t v9 = 0;
    BOOL v31 = 0;
    id v27 = v37;
    v29 = v40;
    goto LABEL_23;
  }
  v21 = (void *)v20;
  uint64_t v22 = [v6 objectForKey:&off_100060BE8];
  uint64_t v23 = [v6 objectForKey:&off_100060C00];
  v42 = (void *)v22;
  if (!v23)
  {
    v36 = v21;
    v32 = v19;
    v38 = v17;
    v41 = v13;
    v28 = v15;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C518);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041D18();
    }
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    v46 = 0;
    uint64_t v9 = 0;
    BOOL v31 = 0;
    v29 = v41;
    goto LABEL_83;
  }
  v46 = (void *)v23;
  uint64_t v24 = [v6 objectForKey:&off_100060C18];
  if (!v24)
  {
    v36 = v21;
    v38 = v17;
    v35 = v15;
    v32 = v19;
    v29 = v13;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C538);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041D4C();
    }
    v43 = 0;
    v47 = 0;
    v48 = 0;
    v45 = 0;
    uint64_t v9 = 0;
    BOOL v31 = 0;
    v28 = v35;
    goto LABEL_83;
  }
  v47 = (void *)v24;
  uint64_t v25 = [v6 objectForKey:&off_100060C30];
  if (!v25)
  {
    v36 = v21;
    v38 = v17;
    v32 = v19;
    v28 = v15;
    v29 = v13;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C558);
    }
    v30 = v11;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041D80();
    }
    v43 = 0;
    v48 = 0;
    v45 = 0;
    uint64_t v9 = 0;
    BOOL v31 = 0;
LABEL_83:
    v21 = v36;
    id v27 = v38;
    goto LABEL_23;
  }
  v45 = (void *)v25;
  uint64_t v26 = [v6 objectForKey:&off_100060C60];
  v43 = v26;
  if (!v26)
  {
    v48 = 0;
    goto LABEL_21;
  }
  v48 = [v6 objectForKey:&off_100060C48];
  if (v48)
  {
LABEL_21:
    [(MIBUDeviceInfoResponse *)self setSerialNumber:v11];
    [(MIBUDeviceInfoResponse *)self setEcid:v13];
    [(MIBUDeviceInfoResponse *)self setBoardID:v15];
    [(MIBUDeviceInfoResponse *)self setChipID:v17];
    [(MIBUDeviceInfoResponse *)self setSecurityDomain:v19];
    [(MIBUDeviceInfoResponse *)self setApNonce:v21];
    [(MIBUDeviceInfoResponse *)self setSepNonce:v22];
    -[MIBUDeviceInfoResponse setProductionMode:](self, "setProductionMode:", [v46 BOOLValue]);
    -[MIBUDeviceInfoResponse setSecurityMode:](self, "setSecurityMode:", [v47 BOOLValue]);
    -[MIBUDeviceInfoResponse setUidMode:](self, "setUidMode:", [v45 BOOLValue]);
    [(MIBUDeviceInfoResponse *)self setSikaFuse:v48];
    -[MIBUDeviceInfoResponse setSikaFuseExists:](self, "setSikaFuseExists:", [v26 BOOLValue]);
    id v27 = v17;
    v29 = v13;
    v32 = v19;
    v28 = v15;
    v30 = v11;
    uint64_t v9 = 0;
LABEL_22:
    BOOL v31 = 1;
    goto LABEL_23;
  }
  v34 = v19;
  id v27 = v17;
  v28 = v15;
  v29 = v13;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C578);
  }
  v30 = v11;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_100041DB4();
  }
  v48 = 0;
  uint64_t v9 = 0;
  BOOL v31 = 0;
  v32 = v34;
LABEL_23:
  [(MIBUNFCResponse *)self setError:v9];

  return v31;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
}

- (NSNumber)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(id)a3
{
}

- (NSNumber)chipID
{
  return self->_chipID;
}

- (void)setChipID:(id)a3
{
}

- (NSNumber)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
  self->_securityDomain = (NSNumber *)a3;
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (void)setApNonce:(id)a3
{
}

- (NSData)sepNonce
{
  return self->_sepNonce;
}

- (void)setSepNonce:(id)a3
{
}

- (BOOL)productionMode
{
  return self->_productionMode;
}

- (void)setProductionMode:(BOOL)a3
{
  self->_productionMode = a3;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (void)setSecurityMode:(BOOL)a3
{
  self->_securityMode = a3;
}

- (BOOL)uidMode
{
  return self->_uidMode;
}

- (void)setUidMode:(BOOL)a3
{
  self->_uidMode = a3;
}

- (NSNumber)sikaFuse
{
  return self->_sikaFuse;
}

- (void)setSikaFuse:(id)a3
{
}

- (BOOL)sikaFuseExists
{
  return self->_sikaFuseExists;
}

- (void)setSikaFuseExists:(BOOL)a3
{
  self->_sikaFuseExists = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sikaFuse, 0);
  objc_storeStrong((id *)&self->_sepNonce, 0);
  objc_storeStrong((id *)&self->_apNonce, 0);
  objc_storeStrong((id *)&self->_chipID, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_ecid, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end