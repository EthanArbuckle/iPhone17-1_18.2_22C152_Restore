@interface SKUIJSONDataConsumer
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SKUIJSONDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSONDataConsumer objectForData:response:error:]();
  }
  v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:a5];

  return v7;
}

- (void)objectForData:response:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSONDataConsumer objectForData:response:error:]";
}

@end