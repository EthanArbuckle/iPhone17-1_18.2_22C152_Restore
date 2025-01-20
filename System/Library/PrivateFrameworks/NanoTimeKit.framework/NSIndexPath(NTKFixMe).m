@interface NSIndexPath(NTKFixMe)
+ (id)indexPathWithElement:()NTKFixMe inUpNextSection:;
- (uint64_t)element;
- (unint64_t)upNextSection;
@end

@implementation NSIndexPath(NTKFixMe)

- (uint64_t)element
{
  return [a1 indexAtPosition:1];
}

- (unint64_t)upNextSection
{
  unint64_t v1 = [a1 indexAtPosition:0];
  if (v1 >= NTKUpNextSectionMax) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"The section %lu is not a valid Up Next Section", v1);
  }
  return v1;
}

+ (id)indexPathWithElement:()NTKFixMe inUpNextSection:
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = a4;
  v6[1] = a3;
  v4 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v6 length:2];
  return v4;
}

@end