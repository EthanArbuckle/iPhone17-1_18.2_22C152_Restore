@interface VMUCallTreePseudoNode
- (BOOL)isPseudo;
- (id)largestTopOfStackPath;
- (id)pseudoNodeTopOfStackChild;
- (id)sortedChildrenWithPseudoNode;
@end

@implementation VMUCallTreePseudoNode

- (BOOL)isPseudo
{
  return 1;
}

- (id)pseudoNodeTopOfStackChild
{
  return 0;
}

- (id)sortedChildrenWithPseudoNode
{
  return (id)[MEMORY[0x1E4F1C978] array];
}

- (id)largestTopOfStackPath
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:self];
}

@end