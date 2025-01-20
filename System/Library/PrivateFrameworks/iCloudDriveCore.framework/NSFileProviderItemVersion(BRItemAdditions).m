@interface NSFileProviderItemVersion(BRItemAdditions)
- (id)br_prettyDescription;
@end

@implementation NSFileProviderItemVersion(BRItemAdditions)

- (id)br_prettyDescription
{
  v2 = [a1 contentVersion];
  if ([v2 length])
  {
    v3 = [BRFieldContentSignature alloc];
    v4 = [a1 contentVersion];
    v5 = [(BRFieldContentSignature *)v3 initWithData:v4];
  }
  else
  {
    v5 = 0;
  }

  v6 = [a1 metadataVersion];
  if ([v6 length])
  {
    v7 = [BRFieldStructureSignature alloc];
    v8 = [a1 metadataVersion];
    v9 = [(BRFieldStructureSignature *)v7 initWithData:v8];
  }
  else
  {
    v9 = 0;
  }

  v10 = [NSString stringWithFormat:@"[%@,%@]", v9, v5];

  return v10;
}

@end