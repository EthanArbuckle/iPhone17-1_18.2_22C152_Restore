@interface NRParameters
- (NRParameters)init;
- (NRParameters)initWithParameters:(id)a3;
- (id)copyParameters;
- (id)description;
- (unsigned)serviceClass;
- (void)setServiceClass:(unsigned __int8)a3;
@end

@implementation NRParameters

- (void).cxx_destruct
{
}

- (unsigned)serviceClass
{
  return self->_serviceClass;
}

- (id)copyParameters
{
  if (self) {
    self = (NRParameters *)self->_parameters;
  }
  return nw_parameters_copy(&self->super);
}

- (void)setServiceClass:(unsigned __int8)a3
{
  self->_serviceClass = a3;
  parameters = self->_parameters;
  if ((a3 - 1) > 4) {
    nw_service_class_t v4 = nw_service_class_best_effort;
  }
  else {
    nw_service_class_t v4 = dword_20A0B3750[(a3 - 1)];
  }
  nw_parameters_set_service_class(parameters, v4);
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self) {
    parameters = self->_parameters;
  }
  else {
    parameters = 0;
  }
  v5 = (void *)[v3 initWithFormat:@"NRParameters<%@>", parameters];
  return v5;
}

- (NRParameters)initWithParameters:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  nw_service_class_t v4 = (OS_nw_parameters *)a3;
  v20.receiver = self;
  v20.super_class = (Class)NRParameters;
  v5 = [(NRParameters *)&v20 init];
  if (!v5)
  {
    v9 = nrCopyLogObj_2421();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      v10 = v9;
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v18 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v18 = 136446210;
        *(void *)(v18 + 4) = "-[NRParameters initWithParameters:]";
        id v19 = nrCopyLogObj_2421();
        _NRLogAbortWithPack(v19);
      }
    }
    id v12 = nrCopyLogObj_2421();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: [super init] failed", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_8;
  }
  v6 = v5;
  parameters = v5->_parameters;
  v5->_parameters = v4;

  return v6;
}

- (NRParameters)init
{
  nw_parameters_t v3 = nw_parameters_create();
  nw_service_class_t v4 = [(NRParameters *)self initWithParameters:v3];

  return v4;
}

@end