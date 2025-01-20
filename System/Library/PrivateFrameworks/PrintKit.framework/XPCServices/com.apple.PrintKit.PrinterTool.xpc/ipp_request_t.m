@interface ipp_request_t
- (id)_descriptionLeader;
- (id)opString;
- (ipp_request_t)init;
- (ipp_request_t)initWithOp:(unsigned __int16)a3;
- (void)_setupNewRequest;
@end

@implementation ipp_request_t

- (ipp_request_t)init
{
  v3.receiver = self;
  v3.super_class = (Class)ipp_request_t;
  return [(ipp_t *)&v3 init];
}

- (ipp_request_t)initWithOp:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ipp_request_t;
  v4 = [(ipp_t *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(ipp_t *)v4 setOp_or_status:v3];
    [(ipp_request_t *)v5 _setupNewRequest];
  }
  return v5;
}

- (void)_setupNewRequest
{
  self->super._request_id = atomic_fetch_add(&dword_1000C88C0, 1u);
  [(ipp_t *)self _addString:1 valueTag:71 name:@"attributes-charset" lang:0 value:@"utf-8"];
  uint64_t v3 = +[NSLocale currentLocale];
  id v4 = [v3 objectForKey:NSLocaleLanguageCode];

  [(ipp_t *)self _addString:1 valueTag:72 name:@"attributes-natural-language" lang:0 value:v4];
}

- (id)opString
{
  unsigned int v3 = [(ipp_t *)self op_or_status] - 2;
  id v4 = @"IPP_OP_PRINT_JOB";
  switch(v3)
  {
    case 0u:
      break;
    case 1u:
    case 5u:
      goto LABEL_6;
    case 2u:
      id v4 = @"IPP_OP_VALIDATE_JOB";
      break;
    case 3u:
      id v4 = @"IPP_OP_CREATE_JOB";
      break;
    case 4u:
      id v4 = @"IPP_OP_SEND_DOCUMENT";
      break;
    case 6u:
      id v4 = @"IPP_OP_CANCEL_JOB";
      break;
    case 7u:
      id v4 = @"IPP_OP_GET_JOB_ATTRIBUTES";
      break;
    case 8u:
      id v4 = @"IPP_OP_GET_JOBS";
      break;
    case 9u:
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
        id v4 = +[NSString stringWithFormat:@"ipp-op-unknown (%d)", [(ipp_t *)self op_or_status]];
      }
      break;
  }

  return v4;
}

- (id)_descriptionLeader
{
  uint64_t request_id = self->super._request_id;
  unsigned int v4 = [(ipp_t *)self op_or_status];
  v5 = [(ipp_request_t *)self opString];
  v6 = +[NSString stringWithFormat:@"<ID#%d(%d - %@)>", request_id, v4, v5];

  return v6;
}

@end