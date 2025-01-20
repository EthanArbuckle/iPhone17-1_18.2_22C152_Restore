@interface NSData(BRCQuarantine)
- (uint64_t)br_qtnFlags;
- (void)br_qtnFlags;
@end

@implementation NSData(BRCQuarantine)

- (uint64_t)br_qtnFlags
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  if ((unint64_t)[v1 length] >= 7
    && *(unsigned char *)v2 == 113
    && *(unsigned char *)(v2 + 1) == 47
    && *(unsigned char *)(v2 + 6) == 59)
  {
    return strtol((const char *)(v2 + 2), 0, 16);
  }
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    [(NSData(BRCQuarantine) *)v1 br_qtnFlags];
  }

  return 0;
}

- (void)br_qtnFlags
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = NSString;
  id v5 = a1;
  objc_msgSend(v4, "brc_hexadecimalStringWithBytes:length:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  id v6 = objc_claimAutoreleasedReturnValue();
  [v6 UTF8String];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_23FA42000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Corrupt quarantine: %s%@", v7, 0x16u);
}

@end