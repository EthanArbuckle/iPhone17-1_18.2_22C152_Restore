@interface HAPFirmwareUpdateStatus
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPFirmwareUpdateStateWrapper)state;
- (HAPFirmwareUpdateStatus)init;
- (HAPFirmwareUpdateStatus)initWithState:(id)a3 updateDuration:(id)a4 stagedFirmwareVersion:(id)a5;
- (HAPTLVUnsignedNumberValue)updateDuration;
- (NSString)description;
- (NSString)stagedFirmwareVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setStagedFirmwareVersion:(id)a3;
- (void)setState:(id)a3;
- (void)setUpdateDuration:(id)a3;
@end

@implementation HAPFirmwareUpdateStatus

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPFirmwareUpdateStatus);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPFirmwareUpdateStatus *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

- (HAPFirmwareUpdateStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPFirmwareUpdateStatus;
  return [(HAPFirmwareUpdateStatus *)&v3 init];
}

- (HAPFirmwareUpdateStatus)initWithState:(id)a3 updateDuration:(id)a4 stagedFirmwareVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPFirmwareUpdateStatus;
  v12 = [(HAPFirmwareUpdateStatus *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_state, a3);
    objc_storeStrong((id *)&v13->_updateDuration, a4);
    objc_storeStrong((id *)&v13->_stagedFirmwareVersion, a5);
  }

  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  uint64_t v8 = (uint64_t)[v6 length];
  if (v8 < 1)
  {
    id v10 = 0;
    id v11 = 0;
    v12 = 0;
    goto LABEL_24;
  }
  v26 = self;
  v27 = a4;
  id v9 = 0;
  id v10 = 0;
  id v11 = 0;
  v12 = 0;
  unint64_t v13 = (unint64_t)v7 + v8;
  do
  {
    char v34 = 0;
    v32[1] = 0;
    uint64_t v33 = 0;
    v32[0] = 0;
    uint64_t Next = TLV8GetNext();
    if (Next)
    {
      v21 = v27;
      if (v27)
      {
        sub_100044EEC(Next);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
LABEL_25:
      BOOL v23 = 0;
      goto LABEL_26;
    }
    if (!v33)
    {
      uint64_t v24 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

      id v9 = (void *)v24;
      if (!v24) {
        goto LABEL_23;
      }
LABEL_16:
      v21 = v27;
      if (v27)
      {
        id v22 = v9;
        id v9 = v22;
LABEL_21:
        BOOL v23 = 0;
        id *v21 = v22;
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    if (v34 != 3)
    {
      if (v34 == 2)
      {
        objc_super v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
        id v30 = v9;
        uint64_t v20 = +[HAPTLVUnsignedNumberValue parsedFromData:v15 error:&v30];
        id v17 = v30;

        v18 = v11;
        id v11 = (void *)v20;
      }
      else
      {
        if (v34 != 1) {
          goto LABEL_14;
        }
        objc_super v15 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
        id v31 = v9;
        uint64_t v16 = +[HAPFirmwareUpdateStateWrapper parsedFromData:v15 error:&v31];
        id v17 = v31;

        v18 = v12;
        v12 = (void *)v16;
      }
      goto LABEL_12;
    }
    id v29 = v9;
    objc_super v15 = sub_100025088(3, (unint64_t)v7, v13, v32, &v29);
    id v17 = v29;

    if (!v17)
    {
      id v28 = 0;
      uint64_t v19 = +[NSString parsedFromData:v15 error:&v28];
      id v17 = v28;
      v18 = v10;
      id v10 = (void *)v19;
LABEL_12:
    }
    id v9 = v17;
LABEL_14:
    id v7 = (id)v32[0];
  }
  while (v32[0] < v13);
  if (v9) {
    goto LABEL_16;
  }
LABEL_23:
  self = v26;
LABEL_24:
  -[HAPFirmwareUpdateStatus setState:](self, "setState:", v12, v26);
  [(HAPFirmwareUpdateStatus *)self setUpdateDuration:v11];
  [(HAPFirmwareUpdateStatus *)self setStagedFirmwareVersion:v10];
  id v9 = 0;
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (id)serializeWithError:(id *)a3
{
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPFirmwareUpdateStatus *)self state];

  if (v5)
  {
    id v6 = [(HAPFirmwareUpdateStatus *)self state];
    id v25 = 0;
    id v7 = [v6 serializeWithError:&v25];
    id v8 = v25;

    if (v8) {
      goto LABEL_11;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v9 = TLV8BufferAppend();
    if (v9) {
      goto LABEL_24;
    }
  }
  id v10 = [(HAPFirmwareUpdateStatus *)self updateDuration];

  if (v10)
  {
    id v11 = [(HAPFirmwareUpdateStatus *)self updateDuration];
    id v24 = 0;
    id v7 = [v11 serializeWithError:&v24];
    id v8 = v24;

    if (!v8)
    {
      id v7 = v7;
      [v7 bytes];
      [v7 length];
      uint64_t v9 = TLV8BufferAppend();
      if (v9) {
        goto LABEL_24;
      }

      goto LABEL_9;
    }
LABEL_11:
    uint64_t v14 = 0;
    goto LABEL_25;
  }
LABEL_9:
  v12 = [(HAPFirmwareUpdateStatus *)self stagedFirmwareVersion];

  if (!v12) {
    goto LABEL_32;
  }
  unint64_t v13 = [(HAPFirmwareUpdateStatus *)self stagedFirmwareVersion];
  id v23 = 0;
  id v7 = [v13 serializeWithError:&v23];
  id v8 = v23;

  if (v8) {
    goto LABEL_11;
  }
  id v7 = v7;
  objc_super v15 = (char *)[v7 bytes];
  uint64_t v16 = (char *)[v7 length] + (void)v15;
  do
  {
    if (v16 - v15 >= 255) {
      uint64_t v17 = 255;
    }
    else {
      uint64_t v17 = v16 - v15;
    }
    uint64_t v9 = TLV8BufferAppend();
    if (v9) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v17;
    }
    v15 += v18;
    if (v9) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v15 >= v16;
    }
  }
  while (!v19);
LABEL_24:
  uint64_t v14 = v9;
LABEL_25:

  if (!v8)
  {
    if (v14)
    {
      if (a3)
      {
        sub_100044EEC(v14);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_31;
      }
      id v8 = 0;
      goto LABEL_34;
    }
LABEL_32:
    v21 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v26);
    id v8 = 0;
    goto LABEL_35;
  }
  if (a3)
  {
    id v20 = v8;
    id v8 = v20;
LABEL_31:
    v21 = 0;
    *a3 = v20;
    goto LABEL_35;
  }
LABEL_34:
  v21 = 0;
LABEL_35:
  TLV8BufferFree();

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPFirmwareUpdateStatus allocWithZone:a3];
  id v5 = [(HAPFirmwareUpdateStatus *)self state];
  id v6 = [(HAPFirmwareUpdateStatus *)self updateDuration];
  id v7 = [(HAPFirmwareUpdateStatus *)self stagedFirmwareVersion];
  id v8 = [(HAPFirmwareUpdateStatus *)v4 initWithState:v5 updateDuration:v6 stagedFirmwareVersion:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HAPFirmwareUpdateStatus *)a3;
  if (self == v6)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [(HAPFirmwareUpdateStatus *)self state];
      uint64_t v9 = [(HAPFirmwareUpdateStatus *)v7 state];
      if (v8 != v9)
      {
        objc_super v3 = [(HAPFirmwareUpdateStatus *)self state];
        v4 = [(HAPFirmwareUpdateStatus *)v7 state];
        if (![v3 isEqual:v4])
        {
          unsigned __int8 v10 = 0;
          goto LABEL_19;
        }
      }
      id v11 = [(HAPFirmwareUpdateStatus *)self updateDuration];
      v12 = [(HAPFirmwareUpdateStatus *)v7 updateDuration];
      if (v11 == v12)
      {
        id v25 = v11;
      }
      else
      {
        unint64_t v13 = [(HAPFirmwareUpdateStatus *)self updateDuration];
        long long v26 = [(HAPFirmwareUpdateStatus *)v7 updateDuration];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          unsigned __int8 v10 = 0;
          goto LABEL_17;
        }
        id v24 = v13;
        id v25 = v11;
      }
      uint64_t v14 = [(HAPFirmwareUpdateStatus *)self stagedFirmwareVersion];
      uint64_t v15 = [(HAPFirmwareUpdateStatus *)v7 stagedFirmwareVersion];
      if (v14 == (void *)v15)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        uint64_t v16 = (void *)v15;
        [(HAPFirmwareUpdateStatus *)self stagedFirmwareVersion];
        uint64_t v17 = v23 = v3;
        [(HAPFirmwareUpdateStatus *)v7 stagedFirmwareVersion];
        id v22 = v4;
        uint64_t v18 = v9;
        v20 = BOOL v19 = v8;
        unsigned __int8 v10 = [v17 isEqual:v20];

        id v8 = v19;
        uint64_t v9 = v18;
        v4 = v22;

        objc_super v3 = v23;
      }
      unint64_t v13 = v24;
      id v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_21:

  return v10;
}

- (NSString)description
{
  objc_super v3 = [(HAPFirmwareUpdateStatus *)self state];
  v4 = [(HAPFirmwareUpdateStatus *)self updateDuration];
  id v5 = [(HAPFirmwareUpdateStatus *)self stagedFirmwareVersion];
  id v6 = +[NSString stringWithFormat:@"<HAPFirmwareUpdateStatus state=%@, updateDuration=%@, stagedFirmwareVersion=%@>", v3, v4, v5];

  return (NSString *)v6;
}

- (HAPFirmwareUpdateStateWrapper)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (HAPTLVUnsignedNumberValue)updateDuration
{
  return self->_updateDuration;
}

- (void)setUpdateDuration:(id)a3
{
}

- (NSString)stagedFirmwareVersion
{
  return self->_stagedFirmwareVersion;
}

- (void)setStagedFirmwareVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_updateDuration, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end