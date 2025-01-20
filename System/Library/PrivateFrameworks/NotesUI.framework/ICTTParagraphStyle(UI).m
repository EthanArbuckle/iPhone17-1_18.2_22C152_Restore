@interface ICTTParagraphStyle(UI)
- (uint64_t)alignmentAdjustedForLists;
- (uint64_t)layoutWritingDirection;
@end

@implementation ICTTParagraphStyle(UI)

- (uint64_t)layoutWritingDirection
{
  if ([a1 writingDirection] == -1)
  {
    v3 = (void *)MEMORY[0x1E4FB0850];
    return [v3 defaultWritingDirectionForLanguage:0];
  }
  else
  {
    return [a1 writingDirection];
  }
}

- (uint64_t)alignmentAdjustedForLists
{
  if ([a1 isList])
  {
    if ([a1 layoutWritingDirection] == 1) {
      uint64_t v2 = MEMORY[0x1E4F83268];
    }
    else {
      uint64_t v2 = MEMORY[0x1E4F83260];
    }
    return *(void *)v2;
  }
  else
  {
    return [a1 alignment];
  }
}

@end