@interface PK_ipp_request_t
- (PK_ipp_request_t)init;
- (PK_ipp_request_t)initWithOp:(unsigned __int16)a3;
- (id)_descriptionLeader;
- (id)opString;
- (void)_setupNewRequest;
@end

@implementation PK_ipp_request_t

- (PK_ipp_request_t)init
{
  v3.receiver = self;
  v3.super_class = (Class)PK_ipp_request_t;
  return [(PK_ipp_t *)&v3 init];
}

- (PK_ipp_request_t)initWithOp:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PK_ipp_request_t;
  v4 = [(PK_ipp_t *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(PK_ipp_t *)v4 setOp_or_status:v3];
    [(PK_ipp_request_t *)v5 _setupNewRequest];
  }
  return v5;
}

- (void)_setupNewRequest
{
  self->super._request_id = atomic_fetch_add(-[PK_ipp_request_t _setupNewRequest]::sRequest_id, 1u);
  [(PK_ipp_t *)self _addString:1 valueTag:71 name:@"attributes-charset" lang:0 value:@"utf-8"];
  uint64_t v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [v3 objectForKey:*MEMORY[0x263EFF508]];

  [(PK_ipp_t *)self _addString:1 valueTag:72 name:@"attributes-natural-language" lang:0 value:v4];
}

- (id)opString
{
  int v3 = [(PK_ipp_t *)self op_or_status] - 2;
  id v4 = @"IPP_OP_PRINT_JOB";
  switch(v3)
  {
    case 0:
      break;
    case 1:
    case 5:
      goto LABEL_6;
    case 2:
      id v4 = @"IPP_OP_VALIDATE_JOB";
      break;
    case 3:
      id v4 = @"IPP_OP_CREATE_JOB";
      break;
    case 4:
      id v4 = @"IPP_OP_SEND_DOCUMENT";
      break;
    case 6:
      id v4 = @"IPP_OP_CANCEL_JOB";
      break;
    case 7:
      id v4 = @"IPP_OP_GET_JOB_ATTRIBUTES";
      break;
    case 8:
      id v4 = @"IPP_OP_GET_JOBS";
      break;
    case 9:
      id v4 = @"IPP_OP_GET_PRINTER_ATTRIBUTES";
      break;
    default:
      if (@"IPP_OP_PRINT_JOB" == 60)
      {
        id v4 = @"IPP_OP_IDENTIFY_PRINTER";
      }
      else if (@"IPP_OP_PRINT_JOB" == 79)
      {
        id v4 = @"IPP_OP_GET_PRINTERS";
      }
      else
      {
LABEL_6:
        objc_msgSend(NSString, "stringWithFormat:", @"ipp-op-unknown (%d)", -[PK_ipp_t op_or_status](self, "op_or_status"));
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }

  return v4;
}

- (id)_descriptionLeader
{
  int v3 = NSString;
  uint64_t request_id = self->super._request_id;
  unsigned int v5 = [(PK_ipp_t *)self op_or_status];
  v6 = [(PK_ipp_request_t *)self opString];
  objc_super v7 = [v3 stringWithFormat:@"<ID#%d(%d - %@)>", request_id, v5, v6];

  return v7;
}

@end