@interface UIImageJPEGRepresentation
@end

@implementation UIImageJPEGRepresentation

void ___UIImageJPEGRepresentation_block_invoke(uint64_t a1, void *a2)
{
  v3 = NSNumber;
  double v4 = fmax(fmin(*(double *)(a1 + 32), 1.0), 0.0);
  id v7 = a2;
  v5 = [v3 numberWithDouble:v4];
  [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2F430]];

  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CC28];
  }
  [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2F470]];
}

@end