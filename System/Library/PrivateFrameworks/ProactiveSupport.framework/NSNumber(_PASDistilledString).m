@interface NSNumber(_PASDistilledString)
- (id)_pas_revivedString;
@end

@implementation NSNumber(_PASDistilledString)

- (id)_pas_revivedString
{
  uint64_t v2 = [a1 compare:&unk_1EF683978];
  id v3 = [NSString alloc];
  if (v2 == -1) {
    v4 = objc_msgSend(v3, "initWithFormat:", @"%lld", objc_msgSend(a1, "longLongValue"));
  }
  else {
    v4 = objc_msgSend(v3, "initWithFormat:", @"%llu", objc_msgSend(a1, "unsignedLongLongValue"));
  }

  return v4;
}

@end