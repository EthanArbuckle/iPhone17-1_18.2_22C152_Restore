@interface HAPOperatingStateResponse
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPOperatingStateAbnormalReasonsWrapper)abnormalReasons;
- (HAPOperatingStateResponse)init;
- (HAPOperatingStateResponse)initWithState:(id)a3 abnormalReasons:(id)a4;
- (HAPOperatingStateWrapper)state;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (void)setAbnormalReasons:(id)a3;
- (void)setState:(id)a3;
@end

@implementation HAPOperatingStateResponse

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(HAPOperatingStateResponse);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPOperatingStateResponse *)v6 parseFromData:v5 error:&v10];
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

- (HAPOperatingStateResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPOperatingStateResponse;
  return [(HAPOperatingStateResponse *)&v3 init];
}

- (HAPOperatingStateResponse)initWithState:(id)a3 abnormalReasons:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPOperatingStateResponse;
  v9 = [(HAPOperatingStateResponse *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_state, a3);
    objc_storeStrong((id *)&v10->_abnormalReasons, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (char *)[v6 bytes];
  uint64_t v8 = (uint64_t)[v6 length];
  if (v8 < 1)
  {
    v9 = 0;
    id v10 = 0;
LABEL_14:
    [(HAPOperatingStateResponse *)self setState:v10];
    [(HAPOperatingStateResponse *)self setAbnormalReasons:v9];
    v11 = 0;
    BOOL v18 = 1;
    goto LABEL_22;
  }
  v23 = a4;
  v9 = 0;
  id v10 = 0;
  v11 = 0;
  objc_super v12 = &v7[v8];
  while (1)
  {
    char v29 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    unint64_t v26 = 0;
    uint64_t Next = TLV8GetNext();
    if (Next) {
      break;
    }
    if (!v28)
    {
      uint64_t v21 = +[NSError errorWithDomain:HMFErrorDomain code:3 userInfo:0];

      v11 = (void *)v21;
      if (!v21) {
        goto LABEL_14;
      }
LABEL_18:
      v19 = v23;
      if (v23)
      {
        id v20 = v11;
        v11 = v20;
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    if (v29 == 2)
    {
      v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
      v24 = v11;
      v15 = &v24;
      +[HAPOperatingStateAbnormalReasonsWrapper parsedFromData:v14 error:&v24];
      v9 = v16 = v9;
      goto LABEL_9;
    }
    if (v29 == 1)
    {
      v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:");
      v25 = v11;
      v15 = &v25;
      +[HAPOperatingStateWrapper parsedFromData:v14 error:&v25];
      id v10 = v16 = v10;
LABEL_9:
      id v17 = *v15;

      v11 = v17;
    }
    if (v26 >= (unint64_t)v12)
    {
      if (!v11) {
        goto LABEL_14;
      }
      goto LABEL_18;
    }
  }
  v19 = v23;
  if (v23)
  {
    sub_100044EEC(Next);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    BOOL v18 = 0;
    id *v19 = v20;
    goto LABEL_22;
  }
LABEL_21:
  BOOL v18 = 0;
LABEL_22:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
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
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  TLV8BufferInit();
  id v5 = [(HAPOperatingStateResponse *)self state];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [(HAPOperatingStateResponse *)self state];
  id v17 = 0;
  id v7 = [v6 serializeWithError:&v17];
  id v8 = v17;

  if (v8)
  {
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  id v7 = v7;
  [v7 bytes];
  [v7 length];
  uint64_t v9 = TLV8BufferAppend();
  if (!v9)
  {

LABEL_5:
    id v10 = [(HAPOperatingStateResponse *)self abnormalReasons];

    if (!v10) {
      goto LABEL_17;
    }
    v11 = [(HAPOperatingStateResponse *)self abnormalReasons];
    id v16 = 0;
    id v7 = [v11 serializeWithError:&v16];
    id v8 = v16;

    if (v8) {
      goto LABEL_7;
    }
    id v7 = v7;
    [v7 bytes];
    [v7 length];
    uint64_t v9 = TLV8BufferAppend();
  }
  uint64_t v12 = v9;
LABEL_10:

  if (!v8)
  {
    if (v12)
    {
      if (a3)
      {
        sub_100044EEC(v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = 0;
        goto LABEL_16;
      }
      id v8 = 0;
      goto LABEL_19;
    }
LABEL_17:
    v14 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v18);
    id v8 = 0;
    goto LABEL_20;
  }
  if (a3)
  {
    id v13 = v8;
    id v8 = v13;
LABEL_16:
    v14 = 0;
    *a3 = v13;
    goto LABEL_20;
  }
LABEL_19:
  v14 = 0;
LABEL_20:
  TLV8BufferFree();

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPOperatingStateResponse allocWithZone:a3];
  id v5 = [(HAPOperatingStateResponse *)self state];
  id v6 = [(HAPOperatingStateResponse *)self abnormalReasons];
  id v7 = [(HAPOperatingStateResponse *)v4 initWithState:v5 abnormalReasons:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HAPOperatingStateResponse *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [(HAPOperatingStateResponse *)self state];
      id v8 = [(HAPOperatingStateResponse *)v6 state];
      if (v7 != v8)
      {
        uint64_t v9 = [(HAPOperatingStateResponse *)self state];
        objc_super v3 = [(HAPOperatingStateResponse *)v6 state];
        if (![v9 isEqual:v3])
        {
          unsigned __int8 v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        id v16 = v9;
      }
      v11 = [(HAPOperatingStateResponse *)self abnormalReasons];
      uint64_t v12 = [(HAPOperatingStateResponse *)v6 abnormalReasons];
      if (v11 == v12)
      {
        unsigned __int8 v10 = 1;
      }
      else
      {
        id v13 = [(HAPOperatingStateResponse *)self abnormalReasons];
        v14 = [(HAPOperatingStateResponse *)v6 abnormalReasons];
        unsigned __int8 v10 = [v13 isEqual:v14];
      }
      uint64_t v9 = v16;
      if (v7 == v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)description
{
  objc_super v3 = [(HAPOperatingStateResponse *)self state];
  v4 = [(HAPOperatingStateResponse *)self abnormalReasons];
  id v5 = +[NSString stringWithFormat:@"<HAPOperatingStateResponse state=%@, abnormalReasons=%@>", v3, v4];

  return (NSString *)v5;
}

- (HAPOperatingStateWrapper)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (HAPOperatingStateAbnormalReasonsWrapper)abnormalReasons
{
  return self->_abnormalReasons;
}

- (void)setAbnormalReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abnormalReasons, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end