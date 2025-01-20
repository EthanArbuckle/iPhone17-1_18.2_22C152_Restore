@interface NSObject(REMHumanReadableIdentifier)
- (__CFString)rem_humanReadableIdentifier;
@end

@implementation NSObject(REMHumanReadableIdentifier)

- (__CFString)rem_humanReadableIdentifier
{
  int v3 = ([a1 hash] % 0xF0uLL) | 0x1F300;
  v1 = (__CFString *)[[NSString alloc] initWithBytes:&v3 length:4 encoding:2617245952];
  if (!v1) {
    v1 = @"❓";
  }

  return v1;
}

@end