@interface WLSocketMessage
+ (id)messageWithData:(id)a3 error:(id *)a4;
- (WLSocketMessage)initWithType:(unint64_t)a3;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation WLSocketMessage

- (WLSocketMessage)initWithType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WLSocketMessage;
  v4 = [(WLSocketMessage *)&v7 init];
  v5 = v4;
  if (v4) {
    [(WLSocketMessage *)v4 setType:a3];
  }
  return v5;
}

+ (id)messageWithData:(id)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:a4];
  unint64_t v7 = 0x263EFF000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4) {
      *a4 = 0;
    }
    id v12 = [NSString alloc];
    id v13 = v5;
    v14 = objc_msgSend(v12, "initWithBytesNoCopy:length:encoding:freeWhenDone:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 4, 0);
    v15 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v8 = [v14 stringByTrimmingCharactersInSet:v15];

    if ([v8 length])
    {
      v16 = [[WLSocketCommandMessage alloc] initWithCommandString:v8];
      goto LABEL_51;
    }
    if (a4)
    {
      v17 = [NSString stringWithFormat:@"expected legacy command but got wrong format"];
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F86308];
      uint64_t v50 = *MEMORY[0x263F08320];
      v51 = v17;
      v20 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      *a4 = [v18 errorWithDomain:v19 code:1 userInfo:v20];
    }
    goto LABEL_50;
  }
  v8 = [v6 objectForKey:@"type"];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!a4 || *a4) {
      goto LABEL_50;
    }
    v21 = [NSString stringWithFormat:@"expected number type for the key 'type' but got wrong type instead"];
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F86308];
    uint64_t v64 = *MEMORY[0x263F08320];
    v65[0] = v21;
    v24 = NSDictionary;
    v25 = (void **)v65;
    v26 = &v64;
    goto LABEL_49;
  }
  uint64_t v9 = [v8 unsignedLongLongValue];
  if (v9 == 2)
  {
    v10 = [v6 objectForKey:@"version"];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = -[WLSocketVersionMessage initWithVersion:]([WLSocketVersionMessage alloc], "initWithVersion:", [v10 unsignedLongLongValue]);
        goto LABEL_23;
      }
      if (a4 && !*a4)
      {
        v43 = [NSString stringWithFormat:@"expected string type for the key 'version' but got wrong type instead"];
        v44 = (void *)MEMORY[0x263F087E8];
        uint64_t v45 = *MEMORY[0x263F86308];
        uint64_t v56 = *MEMORY[0x263F08320];
        v57 = v43;
        v46 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        *a4 = [v44 errorWithDomain:v45 code:1 userInfo:v46];

        unint64_t v7 = 0x263EFF000uLL;
      }
    }
    else if (a4 && !*a4)
    {
      v35 = [NSString stringWithFormat:@"expected string type for the key 'version' but got wrong nil instead"];
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F86308];
      uint64_t v58 = *MEMORY[0x263F08320];
      v59 = v35;
      v38 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      *a4 = [v36 errorWithDomain:v37 code:1 userInfo:v38];

      unint64_t v7 = 0x263EFF000;
    }
LABEL_43:
    _WLLog();
    v16 = 0;
LABEL_44:

    if (v16) {
      goto LABEL_51;
    }
    goto LABEL_45;
  }
  if (v9 == 1)
  {
    v10 = [v6 objectForKey:@"command"];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [[WLSocketCommandMessage alloc] initWithCommandString:v10];
LABEL_23:
        v16 = (WLSocketCommandMessage *)v11;
        goto LABEL_44;
      }
      if (a4 && !*a4)
      {
        v39 = [NSString stringWithFormat:@"expected string type for the key 'command' but got wrong type instead"];
        v40 = (void *)MEMORY[0x263F087E8];
        uint64_t v41 = *MEMORY[0x263F86308];
        uint64_t v60 = *MEMORY[0x263F08320];
        v61 = v39;
        v42 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        *a4 = [v40 errorWithDomain:v41 code:1 userInfo:v42];

        unint64_t v7 = 0x263EFF000;
      }
    }
    else if (a4 && !*a4)
    {
      v31 = [NSString stringWithFormat:@"expected string type for the key 'command' but got wrong nil instead"];
      v32 = (void *)MEMORY[0x263F087E8];
      uint64_t v33 = *MEMORY[0x263F86308];
      uint64_t v62 = *MEMORY[0x263F08320];
      v63 = v31;
      v34 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      *a4 = [v32 errorWithDomain:v33 code:1 userInfo:v34];

      unint64_t v7 = 0x263EFF000;
    }
    goto LABEL_43;
  }
  if (a4 && !*a4)
  {
    v27 = [NSString stringWithFormat:@"expected a valid value for the key 'type' but got unsupported value instead"];
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F86308];
    uint64_t v54 = *MEMORY[0x263F08320];
    v55 = v27;
    v30 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    *a4 = [v28 errorWithDomain:v29 code:1 userInfo:v30];
  }
  _WLLog();
LABEL_45:
  if (!a4 || *a4) {
    goto LABEL_50;
  }
  v21 = [NSString stringWithFormat:@"expected a message but got nil instead"];
  v22 = (void *)MEMORY[0x263F087E8];
  unint64_t v47 = v7;
  uint64_t v23 = *MEMORY[0x263F86308];
  uint64_t v52 = *MEMORY[0x263F08320];
  v53 = v21;
  v24 = *(void **)(v47 + 2352);
  v25 = &v53;
  v26 = &v52;
LABEL_49:
  v48 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
  *a4 = [v22 errorWithDomain:v23 code:1 userInfo:v48];

LABEL_50:
  _WLLog();
  v16 = 0;
LABEL_51:

  return v16;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end