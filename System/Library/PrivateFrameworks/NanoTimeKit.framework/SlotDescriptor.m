@interface SlotDescriptor
@end

@implementation SlotDescriptor

void __58___SlotDescriptor_supportsFamiliesOfComplications_inFace___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) device];
  LODWORD(a2) = [v6 supportsComplicationFamily:a2 forDevice:v7];

  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

@end