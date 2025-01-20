@interface SUUITextActivityItemProvider
+ (id)placeholderItem;
- (id)item;
@end

@implementation SUUITextActivityItemProvider

+ (id)placeholderItem
{
  return &stru_2704F8130;
}

- (id)item
{
  v3 = [(UIActivityItemProvider *)self activityType];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F1CFB0]];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
    v7 = [v6 title];

    v8 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
    v9 = [v8 artistName];

    if ([v7 length] && objc_msgSend(v9, "length"))
    {
      v10 = [(SUUIDeferredActivityItemProvider *)self clientContext];
      v11 = v10;
      if (v10) {
        [v10 localizedStringForKey:@"SHARE_SHEET_ITEM_TITLE_FORMAT"];
      }
      else {
      v12 = +[SUUIClientContext localizedStringForKey:@"SHARE_SHEET_ITEM_TITLE_FORMAT" inBundles:0];
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

@end