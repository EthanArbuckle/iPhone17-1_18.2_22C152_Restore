@interface BRFieldStructureSignature(BRAdditions)
- (NSString)description;
@end

@implementation BRFieldStructureSignature(BRAdditions)

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<st %@|%@>", self->_versionIdentifier, self->_oldVersionIdentifier];
}

@end