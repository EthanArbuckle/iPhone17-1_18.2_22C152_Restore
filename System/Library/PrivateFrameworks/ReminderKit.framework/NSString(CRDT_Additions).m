@interface NSString(CRDT_Additions)
- (uint64_t)deltaSince:()CRDT_Additions in:;
- (uint64_t)encodeWithCRCoder:()CRDT_Additions;
- (uint64_t)initWithCRCoder:()CRDT_Additions;
- (void)mergeWith:()CRDT_Additions;
@end

@implementation NSString(CRDT_Additions)

- (void)mergeWith:()CRDT_Additions
{
  if ((objc_msgSend(a1, "isEqual:") & 1) == 0)
  {
    v1 = +[REMLog crdt];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      -[NSString(CRDT_Additions) mergeWith:](v1);
    }
  }
}

- (uint64_t)initWithCRCoder:()CRDT_Additions
{
  v4 = [a3 decodeStringForKey:@"self"];
  uint64_t v5 = [a1 initWithString:v4];

  return v5;
}

- (uint64_t)encodeWithCRCoder:()CRDT_Additions
{
  return [a3 encodeString:a1 forKey:@"self"];
}

- (uint64_t)deltaSince:()CRDT_Additions in:
{
  return 0;
}

- (void)mergeWith:()CRDT_Additions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (![self isEqual:other]) -- Cannot merge NSString with different value.", v1, 2u);
}

@end