@interface BRDSIDString(BRCPathAdditions)
+ (id)brc_dbAccountDSIDForPath:()BRCPathAdditions;
@end

@implementation BRDSIDString(BRCPathAdditions)

+ (id)brc_dbAccountDSIDForPath:()BRCPathAdditions
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = NSString;
  v6 = objc_msgSend(a1, "brc_accountIDPathForAccountPath:", v4);
  id v15 = 0;
  v7 = [v5 stringWithContentsOfFile:v6 encoding:4 error:&v15];
  id v8 = v15;

  if (v8)
  {
    v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_error_impl(&dword_23FA42000, v10, (os_log_type_t)0x90u, "[ERROR] Got error reading the account DSID from '%@': %@%@", buf, 0x20u);
    }

    v7 = 0;
  }
  v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v12 = [v7 stringByTrimmingCharactersInSet:v11];

  if ([v12 length]) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

@end