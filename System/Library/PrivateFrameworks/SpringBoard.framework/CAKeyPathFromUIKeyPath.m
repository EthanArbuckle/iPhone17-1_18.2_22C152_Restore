@interface CAKeyPathFromUIKeyPath
@end

@implementation CAKeyPathFromUIKeyPath

void ___CAKeyPathFromUIKeyPath_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (BSEqualStrings())
  {
    v5 = @"layer.position";
LABEL_12:
    [*(id *)(a1 + 32) replaceObjectAtIndex:a3 withObject:v5];
    goto LABEL_13;
  }
  if (BSEqualStrings())
  {
    v5 = @"layer.cornerRadius";
    goto LABEL_12;
  }
  if (BSEqualStrings())
  {
    v5 = @"layer.opacity";
    goto LABEL_12;
  }
  if ((BSEqualStrings() & 1) != 0
    || (BSEqualStrings() & 1) != 0
    || (BSEqualStrings() & 1) != 0
    || BSEqualStrings())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v5 = &stru_1F3084718;
    goto LABEL_12;
  }
LABEL_13:
}

@end