@interface MBPeerEmptyMessage
- (MBPeerEmptyMessage)init;
- (MBPeerEmptyMessage)initWithDictionary:(id)a3 error:(id *)a4;
- (id)dictionaryRepresentation;
@end

@implementation MBPeerEmptyMessage

- (MBPeerEmptyMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)MBPeerEmptyMessage;
  return [(MBPeerEmptyMessage *)&v3 init];
}

- (MBPeerEmptyMessage)initWithDictionary:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MBPeerEmptyMessage;
  return [(MBPeerEmptyMessage *)&v5 init];
}

- (id)dictionaryRepresentation
{
  return &__NSDictionary0__struct;
}

@end