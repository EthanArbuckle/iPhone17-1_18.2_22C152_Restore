@interface BRCRequestData
- (BRCProgress)progress;
- (BRCRequestData)initWithProgress:(id)a3 requestType:(signed __int16)a4 finishBlock:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)finishBlock;
- (signed)requestType;
- (void)description;
@end

@implementation BRCRequestData

- (BRCRequestData)initWithProgress:(id)a3 requestType:(signed __int16)a4 finishBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BRCRequestData;
  v11 = [(BRCRequestData *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_progress, a3);
    uint64_t v13 = MEMORY[0x2455D9A50](v10);
    id finishBlock = v12->_finishBlock;
    v12->_id finishBlock = (id)v13;

    v12->_requestType = a4;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BRCRequestData alloc];
  progress = self->_progress;
  uint64_t requestType = self->_requestType;
  id finishBlock = self->_finishBlock;
  return [(BRCRequestData *)v4 initWithProgress:progress requestType:requestType finishBlock:finishBlock];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t requestType = self->_requestType;
  if (requestType >= 3)
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      [(BRCRequestData *)(uint64_t)v7 description];
    }

    v6 = @"invalid";
  }
  else
  {
    v6 = off_2650864A0[requestType];
  }
  id v9 = [v3 stringWithFormat:@"<%@: %p type:%@ %@ progress:%@>", v4, self, v6, &stru_26F3822F0, self->_progress];
  return v9;
}

- (BRCProgress)progress
{
  return self->_progress;
}

- (id)finishBlock
{
  return self->_finishBlock;
}

- (signed)requestType
{
  return self->_requestType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishBlock, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)description
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Recieved an invalid request type%@", (uint8_t *)&v2, 0xCu);
}

@end