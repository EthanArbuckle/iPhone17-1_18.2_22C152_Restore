@interface PXCNRecipientSearchResult
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)validationType;
- (void)setValidationType:(int64_t)a3;
@end

@implementation PXCNRecipientSearchResult

- (void)setValidationType:(int64_t)a3
{
  self->_validationType = a3;
}

- (int64_t)validationType
{
  return self->_validationType;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PXCNRecipientSearchResult;
  v4 = [(PXCNComposeRecipient *)&v7 description];
  v5 = [v3 stringWithFormat:@"<%@ validationType: %ld>", v4, self->_validationType];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(PXCNComposeRecipient *)self recipient];
  v5 = (void *)[v4 copy];

  v6 = [(PXCNComposeRecipient *)[PXCNRecipientSearchResult alloc] initWithRecipient:v5];
  v6->_validationType = self->_validationType;

  return v6;
}

@end