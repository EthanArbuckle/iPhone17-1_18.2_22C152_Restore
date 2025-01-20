@interface SKUIViewElementText
- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4;
- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 style:(id)a5;
- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5;
- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5 style:(id)a6;
@end

@implementation SKUIViewElementText

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v16 = [(SKUIViewElementText *)self attributedStringWithDefaultFont:v6 foregroundColor:v7 textAlignment:0];

  return v16;
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:textAlignment:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = [(SKUIViewElementText *)self attributedStringWithDefaultFont:v8 foregroundColor:v9 textAlignment:a5 style:0];

  return v18;
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 style:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v11) {
        -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:style:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  v19 = [(IKTextParser *)self attributedStringWithFont:v8 foregroundColor:v9 textAlignment:0 style:v10];

  return v19;
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5 style:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v13) {
        -[SKUIViewElementText attributedStringWithDefaultFont:foregroundColor:textAlignment:style:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  v21 = [(IKTextParser *)self attributedStringWithFont:v10 foregroundColor:v11 textAlignment:a5 style:v12];

  return v21;
}

- (void)attributedStringWithDefaultFont:(uint64_t)a3 foregroundColor:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)attributedStringWithDefaultFont:(uint64_t)a3 foregroundColor:(uint64_t)a4 textAlignment:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)attributedStringWithDefaultFont:(uint64_t)a3 foregroundColor:(uint64_t)a4 style:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)attributedStringWithDefaultFont:(uint64_t)a3 foregroundColor:(uint64_t)a4 textAlignment:(uint64_t)a5 style:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end