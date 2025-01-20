@interface NSMutableDictionary(VK)
- (uint64_t)vk_addKey:()VK forNonNilObject:;
- (void)vk_addEntriesFromNonNilDictionary:()VK;
- (void)vk_removeObjectForNonNilKey:()VK;
- (void)vk_setNonNilObject:()VK forKey:;
- (void)vk_setNonNilObject:()VK forNonNilKey:;
@end

@implementation NSMutableDictionary(VK)

- (void)vk_removeObjectForNonNilKey:()VK
{
  if (a3) {
    return objc_msgSend(a1, "removeObjectForKey:");
  }
  return a1;
}

- (void)vk_addEntriesFromNonNilDictionary:()VK
{
  if (a3) {
    return objc_msgSend(a1, "addEntriesFromDictionary:");
  }
  return a1;
}

- (void)vk_setNonNilObject:()VK forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKeyedSubscript:");
  }
  return a1;
}

- (void)vk_setNonNilObject:()VK forNonNilKey:
{
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a1, "setObject:forKeyedSubscript:");
    }
  }
  return a1;
}

- (uint64_t)vk_addKey:()VK forNonNilObject:
{
  return objc_msgSend(a1, "vk_setNonNilObject:forKey:", a4, a3);
}

@end