@interface RCAppContainerHandle
- (NSString)path;
- (id)init:(id *)a3;
- (void)dealloc;
@end

@implementation RCAppContainerHandle

- (id)init:(id *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)RCAppContainerHandle;
  v4 = [(RCAppContainerHandle *)&v23 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_25;
  }
  v4->_sandboxHandle = -1;
  id v6 = RCVoiceMemosBundleID;
  if (!container_query_create())
  {
    sub_10000A910((id)1, 0, a3);

LABEL_25:
    v21 = 0;
    goto LABEL_26;
  }
  container_query_set_class();
  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  id v7 = v6;
  xpc_object_t v8 = xpc_string_create((const char *)[v7 UTF8String]);
  container_query_set_identifiers();

  container_query_get_single_result();
  if (!container_copy_object())
  {
    container_query_get_last_error();
    v15 = (void *)container_error_copy_unlocalized_description();
    if (v15)
    {
      v16 = +[NSString stringWithFormat:@"Query failed with description: %s", v15];
      free(v15);
      if (v16)
      {
        NSErrorUserInfoKey v24 = NSLocalizedFailureReasonErrorKey;
        v25 = v16;
        v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    sub_10000A910((id)2, (uint64_t)v15, a3);

    container_query_free();
    goto LABEL_25;
  }
  container_query_free();

  uint64_t v9 = container_copy_sandbox_token();
  if (!v9)
  {
    sub_10000A910((id)4, 0, a3);
LABEL_14:
    v5->_sandboxHandle = -1;
    goto LABEL_18;
  }
  v10 = (void *)v9;
  uint64_t v11 = sandbox_extension_consume();
  if (v11 == -1)
  {
    NSErrorUserInfoKey v24 = NSUnderlyingErrorKey;
    v17 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    v25 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    sub_10000A910((id)5, (uint64_t)v18, a3);
    free(v10);
    goto LABEL_14;
  }
  uint64_t v12 = v11;
  free(v10);
  v5->_sandboxHandle = v12;
  uint64_t path = container_get_path();
  if (path)
  {
    uint64_t v14 = +[NSString stringWithUTF8String:path];
  }
  else
  {
    sub_10000A910((id)3, 0, a3);
    uint64_t v14 = 0;
  }
  v19 = v5->_path;
  v5->_uint64_t path = (NSString *)v14;

LABEL_18:
  container_free_object();
  v20 = (RCAppContainerHandle *)v5->_path;
  if (v20)
  {
    if (v5->_sandboxHandle == -1) {
      v20 = 0;
    }
    else {
      v20 = v5;
    }
  }
  v21 = v20;
LABEL_26:

  return v21;
}

- (void)dealloc
{
  if (self->_sandboxHandle != -1) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)RCAppContainerHandle;
  [(RCAppContainerHandle *)&v3 dealloc];
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end