@interface NSValidateCoreTextAttributes
@end

@implementation NSValidateCoreTextAttributes

CFSetRef ____NSValidateCoreTextAttributes_block_invoke()
{
  values[4] = *(void **)MEMORY[0x1E4F143B8];
  values[0] = @"NSExpansion";
  values[1] = @"NSObliqueness";
  values[2] = @"NSSuperScript";
  values[3] = @"CTVerticalForms";
  v0 = (const CFSetCallBacks *)MEMORY[0x1E4F1D050];
  __NSValidateCoreTextAttributes_disallowedKeysForMeasurement = (uint64_t)CFSetCreate(0, (const void **)values, 4, MEMORY[0x1E4F1D050]);
  v2[0] = NSMarkedClauseSegmentAttributeName;
  v2[1] = @"NSTextAlternatives";
  v2[2] = @"NSTextAlternativesDisplayStyle";
  v2[3] = @"NSSpellingState";
  v2[4] = NSTemporaryTextCorrectionAttributeName;
  v2[5] = @"NSTextEffect";
  CFSetRef result = CFSetCreate(0, (const void **)v2, 6, v0);
  __NSValidateCoreTextAttributes_disallowedKeysForDrawing = (uint64_t)result;
  return result;
}

@end