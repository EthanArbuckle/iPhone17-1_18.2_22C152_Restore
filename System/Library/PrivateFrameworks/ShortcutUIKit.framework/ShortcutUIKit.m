id ShortcutUIKitBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t vars8;

  v0 = (void *)ShortcutUIKitBundle___ShortcutUIKitBundle;
  if (!ShortcutUIKitBundle___ShortcutUIKitBundle)
  {
    v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v2 = (void *)ShortcutUIKitBundle___ShortcutUIKitBundle;
    ShortcutUIKitBundle___ShortcutUIKitBundle = v1;

    v0 = (void *)ShortcutUIKitBundle___ShortcutUIKitBundle;
  }

  return v0;
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t LICreateIconFromCachedBitmap()
{
  return MEMORY[0x270F4ADE8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}