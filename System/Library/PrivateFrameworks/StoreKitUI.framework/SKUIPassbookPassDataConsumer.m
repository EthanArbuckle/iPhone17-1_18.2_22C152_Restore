@interface SKUIPassbookPassDataConsumer
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SKUIPassbookPassDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPassbookPassDataConsumer objectForData:response:error:]();
  }
  uint64_t v7 = SKUIPassKitCoreFramework();
  id v12 = 0;
  v8 = objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Pkpass.isa, v7)), "initWithData:error:", v6, &v12);

  id v9 = v12;
  v10 = v9;
  if (a5 && !v8) {
    *a5 = v9;
  }

  return v8;
}

- (void)objectForData:response:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPassbookPassDataConsumer objectForData:response:error:]";
}

@end