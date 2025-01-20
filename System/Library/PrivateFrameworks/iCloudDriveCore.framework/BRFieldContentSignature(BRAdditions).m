@interface BRFieldContentSignature(BRAdditions)
- (NSString)description;
@end

@implementation BRFieldContentSignature(BRAdditions)

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<ct %@|%@ sz:%llu sig:%@>", self->_versionIdentifier, self->_oldVersionIdentifier, -[BRFieldContentSignature size](self, "size"), self->_contentSignature];
}

@end