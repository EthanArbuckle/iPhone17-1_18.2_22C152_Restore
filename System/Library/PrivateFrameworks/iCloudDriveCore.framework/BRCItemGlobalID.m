@interface BRCItemGlobalID
+ (id)itemGlobalIDFromLocalItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemGlobalID:(id)a3;
- (BRCItemGlobalID)initWithZoneRowID:(id)a3 itemID:(id)a4;
- (BRCItemID)itemID;
- (BRCZoneRowID)zoneRowID;
- (id)description;
- (unint64_t)hash;
@end

@implementation BRCItemGlobalID

+ (id)itemGlobalIDFromLocalItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc((Class)a1);
    v6 = [v4 clientZone];
    v7 = [v6 dbRowID];
    v8 = [v4 itemID];
    v9 = (void *)[v5 initWithZoneRowID:v7 itemID:v8];
  }
  else
  {
    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] trying to initialize a globalID from a nil object%@", (uint8_t *)&v13, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (BRCItemGlobalID)initWithZoneRowID:(id)a3 itemID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCItemGlobalID;
  v9 = [(BRCItemGlobalID *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneRowID, a3);
    objc_storeStrong((id *)&v10->_itemID, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BRCItemID *)self->_itemID hash];
  return [(BRCZoneRowID *)self->_zoneRowID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BRCItemGlobalID *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRCItemGlobalID *)self isEqualToItemGlobalID:v4];
  }

  return v5;
}

- (BOOL)isEqualToItemGlobalID:(id)a3
{
  id v4 = a3;
  itemID = self->_itemID;
  v6 = [v4 itemID];
  if ([(BRCItemID *)itemID isEqual:v6])
  {
    zoneRowID = self->_zoneRowID;
    id v8 = [v4 zoneRowID];
    char v9 = [(BRCZoneRowID *)zoneRowID isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  unint64_t v3 = [(BRCItemID *)self->_itemID debugItemIDString];
  id v4 = [v3 stringByAppendingFormat:@"[%@]", self->_zoneRowID];

  return v4;
}

- (BRCZoneRowID)zoneRowID
{
  return self->_zoneRowID;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
}

@end