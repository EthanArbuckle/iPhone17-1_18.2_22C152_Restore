@interface NSAttributedString(PVAdditions)
- (uint64_t)pv_isRightToLeft;
@end

@implementation NSAttributedString(PVAdditions)

- (uint64_t)pv_isRightToLeft
{
  v1 = CTLineCreateWithAttributedString(a1);
  CFArrayRef GlyphRuns = CTLineGetGlyphRuns(v1);
  CFIndex Count = CFArrayGetCount(GlyphRuns);
  if (Count < 1)
  {
LABEL_5:
    uint64_t v7 = 0;
  }
  else
  {
    CFIndex v4 = Count;
    CFIndex v5 = 0;
    while (1)
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v5);
      if (!(unint64_t)CTRunGetStringRange(ValueAtIndex).location) {
        break;
      }
      if (v4 == ++v5) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = CTRunGetStatus(ValueAtIndex) & 1;
  }
  CFRelease(v1);
  return v7;
}

@end