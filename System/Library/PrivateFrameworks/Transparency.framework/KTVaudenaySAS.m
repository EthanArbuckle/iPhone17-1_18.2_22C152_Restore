@interface KTVaudenaySAS
+ (id)randomValueOfLength:(unint64_t)a3;
- (BOOL)initiator;
- (BOOL)setInitiatorUndisclosedRandom:(id)a3;
- (BOOL)setPeerRandom:(id)a3;
- (KTVaudenaySAS)init;
- (KTVaudenaySASConfiguration)config;
- (NSData)acceptorInfo;
- (NSData)acceptorRandom;
- (NSData)initiatorInfo;
- (NSData)initiatorRandom;
- (NSData)sentUndisclosedRandom;
- (id)initAcceptorWithPublic:(id)a3 configuration:(id)a4;
- (id)initInitiatorWithPublic:(id)a3 configuration:(id)a4;
- selfRandom;
- (id)shortAuthenticationString;
- (id)undisclosedInitiatorRandom;
- (id)undisclosedInitiatorValue:(id)a3;
- (void)setAcceptorInfo:(id)a3;
- (void)setAcceptorRandom:(id)a3;
- (void)setConfig:(id)a3;
- (void)setInitiator:(BOOL)a3;
- (void)setInitiatorInfo:(id)a3;
- (void)setInitiatorRandom:(id)a3;
- (void)setPeerPublic:(id)a3;
- (void)setSentUndisclosedRandom:(id)a3;
@end

@implementation KTVaudenaySAS

- (KTVaudenaySAS)init
{
}

+ (id)randomValueOfLength:(unint64_t)a3
{
  id v4 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:a3];
  if (SecRandomCopyBytes(0, a3, (void *)[v4 mutableBytes])) {
    abort();
  }

  return v4;
}

- (id)initInitiatorWithPublic:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)KTVaudenaySAS;
  v8 = [(KTVaudenaySAS *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(KTVaudenaySAS *)v8 setInitiator:1];
    [(KTVaudenaySAS *)v9 setInitiatorInfo:v6];
    [(KTVaudenaySAS *)v9 setConfig:v7];
    v10 = +[KTVaudenaySAS randomValueOfLength:16];
    [(KTVaudenaySAS *)v9 setInitiatorRandom:v10];

    v11 = v9;
  }

  return v9;
}

- (id)initAcceptorWithPublic:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)KTVaudenaySAS;
  v8 = [(KTVaudenaySAS *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(KTVaudenaySAS *)v8 setInitiator:0];
    [(KTVaudenaySAS *)v9 setAcceptorInfo:v6];
    [(KTVaudenaySAS *)v9 setConfig:v7];
    v10 = +[KTVaudenaySAS randomValueOfLength:16];
    [(KTVaudenaySAS *)v9 setAcceptorRandom:v10];

    v11 = v9;
  }

  return v9;
}

- (void)setPeerPublic:(id)a3
{
  id v4 = a3;
  if ([(KTVaudenaySAS *)self initiator]) {
    [(KTVaudenaySAS *)self setAcceptorInfo:v4];
  }
  else {
    [(KTVaudenaySAS *)self setInitiatorInfo:v4];
  }
}

- (id)undisclosedInitiatorValue:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF990];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(KTVaudenaySAS *)self config];
  v8 = objc_msgSend(v6, "initWithLength:", *objc_msgSend(v7, "di"));

  v9 = [(KTVaudenaySAS *)self config];
  [v9 di];
  [v5 length];
  id v10 = v5;
  [v10 bytes];

  id v11 = v8;
  [v11 mutableBytes];
  ccdigest();

  return v11;
}

- (id)undisclosedInitiatorRandom
{
  v3 = [(KTVaudenaySAS *)self initiatorRandom];
  id v4 = [(KTVaudenaySAS *)self undisclosedInitiatorValue:v3];

  return v4;
}

- (BOOL)setInitiatorUndisclosedRandom:(id)a3
{
  id v4 = a3;
  if ([(KTVaudenaySAS *)self initiator]) {
    goto LABEL_5;
  }
  uint64_t v5 = [(KTVaudenaySAS *)self sentUndisclosedRandom];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)v5;
  id v7 = [(KTVaudenaySAS *)self sentUndisclosedRandom];
  int v8 = [v7 isEqual:v4];

  if (!v8)
  {
LABEL_5:
    BOOL v10 = 0;
  }
  else
  {
LABEL_4:
    v9 = [MEMORY[0x263EFF8F8] dataWithData:v4];
    [(KTVaudenaySAS *)self setSentUndisclosedRandom:v9];

    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)setPeerRandom:(id)a3
{
  id v4 = a3;
  if ([v4 length] != 16) {
    goto LABEL_8;
  }
  if (![(KTVaudenaySAS *)self initiator])
  {
    id v7 = [(KTVaudenaySAS *)self sentUndisclosedRandom];

    if (v7)
    {
      uint64_t v5 = [(KTVaudenaySAS *)self undisclosedInitiatorValue:v4];
      int v8 = [(KTVaudenaySAS *)self sentUndisclosedRandom];
      int v6 = [v5 isEqual:v8];

      if (v6)
      {
        v9 = [MEMORY[0x263EFF8F8] dataWithData:v4];
        [(KTVaudenaySAS *)self setInitiatorRandom:v9];
      }
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v6) = 0;
    goto LABEL_9;
  }
  uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithData:v4];
  [(KTVaudenaySAS *)self setAcceptorRandom:v5];
  LOBYTE(v6) = 1;
LABEL_7:

LABEL_9:
  return v6;
}

- selfRandom
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v3 = [(KTVaudenaySAS *)self initiator];
  id v4 = [(KTVaudenaySAS *)self acceptorRandom];
  uint64_t v5 = v4;
  if (v3)
  {

    if (v5)
    {
      uint64_t v5 = [(KTVaudenaySAS *)self initiatorRandom];
    }
  }

  return v5;
}

- (id)shortAuthenticationString
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(KTVaudenaySAS *)self initiatorInfo];
  if (!v3) {
    goto LABEL_11;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [(KTVaudenaySAS *)self initiatorRandom];
  if (!v5) {
    goto LABEL_10;
  }
  int v6 = (void *)v5;
  uint64_t v7 = [(KTVaudenaySAS *)self acceptorInfo];
  if (!v7)
  {

LABEL_10:
    goto LABEL_11;
  }
  int v8 = (void *)v7;
  v9 = [(KTVaudenaySAS *)self acceptorRandom];

  if (!v9)
  {
LABEL_11:
    v49 = 0;
    goto LABEL_12;
  }
  BOOL v10 = [(KTVaudenaySAS *)self config];
  [v10 di];
  id v11 = [(KTVaudenaySAS *)self config];
  [v11 di];
  id v57 = [(KTVaudenaySAS *)self config];
  [v57 di];
  v56 = &v54;
  MEMORY[0x270FA5388]();
  bzero((char *)&v54 - v12, v13);
  v14 = [MEMORY[0x263EFF990] data];
  v15 = [(KTVaudenaySAS *)self config];
  v16 = [v15 digestPrefix];

  if (v16)
  {
    v17 = [(KTVaudenaySAS *)self config];
    v18 = [v17 digestPrefix];
    [v14 appendData:v18];
  }
  v19 = [(KTVaudenaySAS *)self initiatorRandom];
  [v14 appendData:v19];

  v20 = [(KTVaudenaySAS *)self acceptorRandom];
  [v14 appendData:v20];

  v21 = [(KTVaudenaySAS *)self config];
  [v21 di];
  [v14 length];
  id v22 = v14;
  [v22 mutableBytes];
  cchmac_init();

  [v22 length];
  id v23 = v22;
  [v23 mutableBytes];
  cc_clear();
  v24 = [(KTVaudenaySAS *)self initiatorInfo];
  unsigned int v59 = bswap32([v24 length]);

  v25 = [(KTVaudenaySAS *)self acceptorInfo];
  unsigned int v58 = bswap32([v25 length]);

  v26 = [(KTVaudenaySAS *)self config];
  [v26 di];
  cchmac_update();

  v27 = [(KTVaudenaySAS *)self config];
  [v27 di];
  v28 = [(KTVaudenaySAS *)self initiatorInfo];
  [v28 length];
  id v29 = [(KTVaudenaySAS *)self initiatorInfo];
  [v29 bytes];
  cchmac_update();

  v30 = [(KTVaudenaySAS *)self config];
  [v30 di];
  cchmac_update();

  v31 = [(KTVaudenaySAS *)self config];
  [v31 di];
  v32 = [(KTVaudenaySAS *)self acceptorInfo];
  [v32 length];
  id v33 = [(KTVaudenaySAS *)self acceptorInfo];
  [v33 bytes];
  cchmac_update();

  id v34 = objc_alloc(MEMORY[0x263EFF990]);
  v35 = [(KTVaudenaySAS *)self config];
  v36 = objc_msgSend(v34, "initWithLength:", *objc_msgSend(v35, "di"));

  v37 = [(KTVaudenaySAS *)self config];
  [v37 di];
  if (v36)
  {
    id v38 = v36;
    [v38 mutableBytes];
    cchmac_final();

    v39 = [(KTVaudenaySAS *)self config];
    [v39 di];
    v40 = [(KTVaudenaySAS *)self config];
    [v40 di];
    id v55 = v23;
    v41 = v11;
    v42 = v10;
    v43 = [(KTVaudenaySAS *)self config];
    [v43 di];
    cc_clear();

    unint64_t v44 = bswap64(*(void *)[v38 bytes]);
    v45 = [(KTVaudenaySAS *)self config];
    unint64_t v46 = v44 % [v45 shortCodeMod10];

    v47 = NSString;
    v37 = [(KTVaudenaySAS *)self config];
    uint64_t v48 = [v37 shortCodeLength];
    unint64_t v53 = v46;
    BOOL v10 = v42;
    id v11 = v41;
    id v23 = v55;
    v49 = objc_msgSend(v47, "stringWithFormat:", @"%0.*llu", v48, v53);
  }
  else
  {
    v51 = [(KTVaudenaySAS *)self config];
    [v51 di];
    v52 = [(KTVaudenaySAS *)self config];
    [v52 di];
    cc_clear();

    v49 = 0;
  }

LABEL_12:

  return v49;
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (KTVaudenaySASConfiguration)config
{
  return (KTVaudenaySASConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
}

- (NSData)initiatorInfo
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInitiatorInfo:(id)a3
{
}

- (NSData)initiatorRandom
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInitiatorRandom:(id)a3
{
}

- (NSData)acceptorInfo
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAcceptorInfo:(id)a3
{
}

- (NSData)acceptorRandom
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAcceptorRandom:(id)a3
{
}

- (NSData)sentUndisclosedRandom
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSentUndisclosedRandom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentUndisclosedRandom, 0);
  objc_storeStrong((id *)&self->_acceptorRandom, 0);
  objc_storeStrong((id *)&self->_acceptorInfo, 0);
  objc_storeStrong((id *)&self->_initiatorRandom, 0);
  objc_storeStrong((id *)&self->_initiatorInfo, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end