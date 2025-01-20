@interface NSString(CRCodable)
- (id)initWithCRCodableDataRepresentation:()CRCodable;
- (uint64_t)crCodableDataRepresentation;
@end

@implementation NSString(CRCodable)

- (uint64_t)crCodableDataRepresentation
{
  return [a1 dataUsingEncoding:4];
}

- (id)initWithCRCodableDataRepresentation:()CRCodable
{
  if (a3)
  {
    a1 = (id)[a1 initWithData:a3 encoding:4];
    id v3 = a1;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end