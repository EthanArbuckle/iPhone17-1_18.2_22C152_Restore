@interface NSObjectDescriptionObjectHandler
@end

@implementation NSObjectDescriptionObjectHandler

id __fc_NSObjectDescriptionObjectHandler_block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if ([a2 conformsToProtocol:&unk_1EF8DAAE8]) {
      v3 = a2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;
  v5 = [v4 description];

  return v5;
}

@end