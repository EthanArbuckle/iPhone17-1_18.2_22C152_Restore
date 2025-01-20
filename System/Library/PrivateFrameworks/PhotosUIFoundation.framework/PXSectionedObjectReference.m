@interface PXSectionedObjectReference
- (BOOL)isEqual:(id)a3;
- (NSObject)itemObject;
- (NSObject)leafObject;
- (NSObject)sectionObject;
- (NSObject)subitemObject;
- (PXSectionedObjectReference)init;
- (PXSectionedObjectReference)initWithSectionObject:(id)a3 itemObject:(id)a4 subitemObject:(id)a5 indexPath:(PXSimpleIndexPath *)a6;
- (PXSimpleIndexPath)indexPath;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXSectionedObjectReference

- (PXSectionedObjectReference)initWithSectionObject:(id)a3 itemObject:(id)a4 subitemObject:(id)a5 indexPath:(PXSimpleIndexPath *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PXSectionedObjectReference;
  v14 = [(PXSectionedObjectReference *)&v27 init];
  if (v14)
  {
    if (!v11 && !v12 && !v13)
    {
      v26 = [MEMORY[0x263F08690] currentHandler];
      [v26 handleFailureInMethod:a2, v14, @"PXSectionedObjectReference.m", 19, @"Invalid parameter not satisfying: %@", @"!(sectionObject == nil && itemObject == nil && subitemObject == nil)" object file lineNumber description];
    }
    uint64_t v15 = [v11 copyWithZone:0];
    v16 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v15;

    uint64_t v17 = [v12 copyWithZone:0];
    v18 = (void *)*((void *)v14 + 2);
    *((void *)v14 + 2) = v17;

    uint64_t v19 = [v13 copyWithZone:0];
    v20 = (void *)*((void *)v14 + 3);
    *((void *)v14 + 3) = v19;

    long long v21 = *(_OWORD *)&a6->dataSourceIdentifier;
    *(_OWORD *)(v14 + 56) = *(_OWORD *)&a6->item;
    *(_OWORD *)(v14 + 40) = v21;
    v22 = (void *)*((void *)v14 + 3);
    if (v22 || (v22 = (void *)*((void *)v14 + 2)) != 0 || (v22 = (void *)*((void *)v14 + 1)) != 0)
    {
      id v23 = v22;
    }
    else
    {
      id v23 = [MEMORY[0x263EFF9D0] null];
    }
    v24 = (void *)*((void *)v14 + 4);
    *((void *)v14 + 4) = v23;
  }
  return (PXSectionedObjectReference *)v14;
}

- (NSObject)leafObject
{
  return self->_leafObject;
}

- (PXSimpleIndexPath)indexPath
{
  long long v3 = *(_OWORD *)&self[1].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[1].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafObject, 0);
  objc_storeStrong((id *)&self->_subitemObject, 0);
  objc_storeStrong((id *)&self->_itemObject, 0);

  objc_storeStrong((id *)&self->_sectionObject, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (char *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->_indexPath.dataSourceIdentifier, *(int64x2_t *)(v4 + 40)), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->_indexPath.item, *(int64x2_t *)(v4 + 56)))), 0xFuLL))) & 1) != 0&& ((sectionObject = self->_sectionObject, sectionObject == *((NSObject **)v4 + 1))|| -[NSObject isEqual:](sectionObject, "isEqual:"))&& ((itemObject = self->_itemObject, itemObject == *((NSObject **)v4 + 2))|| -[NSObject isEqual:](itemObject, "isEqual:")))
  {
    subitemObject = self->_subitemObject;
    if (subitemObject == *((NSObject **)v4 + 3)) {
      char v5 = 1;
    }
    else {
      char v5 = -[NSObject isEqual:](subitemObject, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSObject)subitemObject
{
  return self->_subitemObject;
}

- (NSObject)itemObject
{
  return self->_itemObject;
}

- (NSObject)sectionObject
{
  return self->_sectionObject;
}

- (id)description
{
  long long v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PXSectionedObjectReference;
  v4 = [(PXSectionedObjectReference *)&v10 description];
  long long v5 = *(_OWORD *)&self->_indexPath.item;
  v9[0] = *(_OWORD *)&self->_indexPath.dataSourceIdentifier;
  v9[1] = v5;
  v6 = PXSimpleIndexPathDescription(v9);
  v7 = [v3 stringWithFormat:@"<%@ indexPath:%@ section:%@ item:%@ subitem:%@>", v4, v6, self->_sectionObject, self->_itemObject, self->_subitemObject];

  return v7;
}

- (unint64_t)hash
{
  return [self->_leafObject hash];
}

- (PXSectionedObjectReference)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  long long v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"PXSectionedObjectReference.m", 14, @"%@ not supported", v5 object file lineNumber description];

  abort();
}

@end