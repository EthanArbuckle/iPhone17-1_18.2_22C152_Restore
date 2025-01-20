@interface MKSIM
- (MKSIM)initWithData:(id)a3;
- (NSString)carrier;
- (NSString)carrierID;
- (NSString)gid1;
- (NSString)mccmnc;
- (NSString)number;
- (void)setCarrier:(id)a3;
- (void)setCarrierID:(id)a3;
- (void)setGid1:(id)a3;
- (void)setMccmnc:(id)a3;
- (void)setNumber:(id)a3;
@end

@implementation MKSIM

- (MKSIM)initWithData:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MKSIM;
  v5 = [(MKSIM *)&v26 init];
  if (!v5) {
    goto LABEL_18;
  }
  if (!v4)
  {
    v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MKSIM initWithData:]();
    }
    goto LABEL_28;
  }
  id v25 = 0;
  v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v25];
  id v7 = v25;
  if (v7)
  {
    v8 = +[MKLog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MKSIM initWithData:].cold.5();
    }
LABEL_21:

LABEL_29:
    v22 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = +[MKLog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MKSIM initWithData:].cold.4();
    }
    goto LABEL_21;
  }
  v9 = v6;
  if (![v9 count])
  {
    v10 = +[MKLog log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MKSIM initWithData:]();
    }
    goto LABEL_27;
  }
  v10 = [v9 objectAtIndexedSubscript:0];
  v11 = [v10 mk_stringForKey:@"number"];
  [v5 setNumber:v11];

  v12 = [v10 mk_stringForKey:@"carrier"];
  [v5 setCarrier:v12];

  v13 = [v10 mk_stringForKey:@"carrier_id"];
  [v5 setCarrierID:v13];

  v14 = [v10 mk_stringForKey:@"mccmnc"];
  [v5 setMccmnc:v14];

  v15 = [v10 mk_stringForKey:@"gid1"];
  [v5 setGid1:v15];

  v16 = +[MKLog log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v5[1];
    uint64_t v18 = v5[2];
    uint64_t v19 = v5[3];
    uint64_t v20 = v5[4];
    uint64_t v21 = v5[5];
    *(_DWORD *)buf = 138478851;
    uint64_t v28 = v17;
    __int16 v29 = 2112;
    uint64_t v30 = v18;
    __int16 v31 = 2112;
    uint64_t v32 = v19;
    __int16 v33 = 2112;
    uint64_t v34 = v20;
    __int16 v35 = 2112;
    uint64_t v36 = v21;
    _os_log_impl(&dword_22BFAC000, v16, OS_LOG_TYPE_INFO, "parsed a sim. number=%{private}@, carrier=%@, carrier_id=%@, mccmnc=%@, gid1=%@", buf, 0x34u);
  }

  if (![(id)v5[1] length]
    || ![(id)v5[2] length]
    || ![(id)v5[3] length]
    || ![(id)v5[4] length]
    || ![(id)v5[5] length])
  {
    v23 = +[MKLog log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      [(MKSIM *)v5 + 1 initWithData:v23];
    }

LABEL_27:
LABEL_28:

    goto LABEL_29;
  }

LABEL_18:
  v22 = v5;
LABEL_30:

  return v22;
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
}

- (NSString)carrier
{
  return self->_carrier;
}

- (void)setCarrier:(id)a3
{
}

- (NSString)carrierID
{
  return self->_carrierID;
}

- (void)setCarrierID:(id)a3
{
}

- (NSString)mccmnc
{
  return self->_mccmnc;
}

- (void)setMccmnc:(id)a3
{
}

- (NSString)gid1
{
  return self->_gid1;
}

- (void)setGid1:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mccmnc, 0);
  objc_storeStrong((id *)&self->_carrierID, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

- (void)initWithData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ could not initialize sim from nil.", v2, v3, v4, v5, v6);
}

- (void)initWithData:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ could not receive an array of SIMs.", v2, v3, v4, v5, v6);
}

- (void)initWithData:(os_log_t)log .cold.3(uint64_t *a1, void *a2, os_log_t log)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  uint64_t v6 = a2[4];
  uint64_t v7 = a2[5];
  int v8 = 138478851;
  uint64_t v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = v6;
  __int16 v16 = 2112;
  uint64_t v17 = v7;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "invalid sim. number=%{private}@, carrier=%@, carrier_id=%@, mccmnc=%@, gid1=%@", (uint8_t *)&v8, 0x34u);
}

- (void)initWithData:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ could not initialize because an invalid json format was received.", v2, v3, v4, v5, v6);
}

- (void)initWithData:.cold.5()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_22BFAC000, v1, OS_LOG_TYPE_ERROR, "%@ could not initialize because an underlying error occurred unexpectedly. error=%@", v2, 0x16u);
}

@end