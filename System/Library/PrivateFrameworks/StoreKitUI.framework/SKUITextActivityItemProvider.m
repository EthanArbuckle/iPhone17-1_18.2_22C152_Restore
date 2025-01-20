@interface SKUITextActivityItemProvider
+ (id)placeholderItem;
- (id)item;
- (void)item;
@end

@implementation SKUITextActivityItemProvider

+ (id)placeholderItem
{
  return &stru_1F1C879E8;
}

- (id)item
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUITextActivityItemProvider item]();
  }
  v3 = [(UIActivityItemProvider *)self activityType];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F435A0]];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
    v7 = [v6 title];

    v8 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
    v9 = [v8 artistName];

    if ([v7 length] && objc_msgSend(v9, "length"))
    {
      v10 = [(SKUIDeferredActivityItemProvider *)self clientContext];
      v11 = v10;
      if (v10) {
        [v10 localizedStringForKey:@"SHARE_SHEET_ITEM_TITLE_FORMAT"];
      }
      else {
      v12 = +[SKUIClientContext localizedStringForKey:@"SHARE_SHEET_ITEM_TITLE_FORMAT" inBundles:0];
      }

      v5 = [NSString stringWithValidatedFormat:v12, @"%@%@", 0, v7, v9 validFormatSpecifiers error];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)item
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITextActivityItemProvider item]";
}

@end