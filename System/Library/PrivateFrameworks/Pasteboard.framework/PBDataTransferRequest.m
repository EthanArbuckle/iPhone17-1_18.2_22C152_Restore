@interface PBDataTransferRequest
- (NSProgress)progress;
- (NSString)typeIdentifier;
- (PBItem)item;
- (PBItemCollection)itemCollection;
- (PBItemRepresentation)repr;
- (void)setItem:(id)a3;
- (void)setItemCollection:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRepr:(id)a3;
@end

@implementation PBDataTransferRequest

- (NSString)typeIdentifier
{
  return [(PBItemRepresentation *)self->_repr typeIdentifier];
}

- (PBItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
}

- (PBItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (PBItemRepresentation)repr
{
  return self->_repr;
}

- (void)setRepr:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_repr, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
}

@end