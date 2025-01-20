@interface NSString(QueryParser)
- (uint64_t)composedLength;
@end

@implementation NSString(QueryParser)

- (uint64_t)composedLength
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__NSString_QueryParser__composedLength__block_invoke;
  v5[3] = &unk_1E634CA78;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end