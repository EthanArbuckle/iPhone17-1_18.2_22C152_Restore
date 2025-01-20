@interface PGResolvablePublicEventBusinessItem
- (PGConsolidatedAddress)consolidatedAddress;
- (PGGraphPublicEventNode)publicEventNode;
- (PGResolvablePublicEventBusinessItem)initWithPublicEventNode:(id)a3 consolidatedAddress:(id)a4 businessItemMuid:(unint64_t)a5;
- (unint64_t)businessItemMuid;
@end

@implementation PGResolvablePublicEventBusinessItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consolidatedAddress, 0);
  objc_storeStrong((id *)&self->_publicEventNode, 0);
}

- (unint64_t)businessItemMuid
{
  return self->_businessItemMuid;
}

- (PGConsolidatedAddress)consolidatedAddress
{
  return self->_consolidatedAddress;
}

- (PGGraphPublicEventNode)publicEventNode
{
  return self->_publicEventNode;
}

- (PGResolvablePublicEventBusinessItem)initWithPublicEventNode:(id)a3 consolidatedAddress:(id)a4 businessItemMuid:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGResolvablePublicEventBusinessItem;
  v11 = [(PGResolvablePublicEventBusinessItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_publicEventNode, a3);
    objc_storeStrong((id *)&v12->_consolidatedAddress, a4);
    v12->_businessItemMuid = a5;
  }

  return v12;
}

@end