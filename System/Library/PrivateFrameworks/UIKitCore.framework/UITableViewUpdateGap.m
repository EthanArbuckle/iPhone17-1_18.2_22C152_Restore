@interface UITableViewUpdateGap
- (id)description;
- (id)updateItems;
- (uint64_t)initWithUpdateItem:(void *)a1;
- (void)addUpdateItem:(uint64_t)a1;
@end

@implementation UITableViewUpdateGap

- (void)addUpdateItem:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    goto LABEL_8;
  }
  if (*(void *)(a2 + 32) == 100) {
    *(unsigned char *)(a1 + 24) |= 1u;
  }
  int v4 = *(_DWORD *)(a2 + 20);
  if (!v4)
  {
LABEL_8:
    v5 = *(void **)(a1 + 16);
    if (!v5)
    {
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a2, 0);
      v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v9;
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    v5 = *(void **)(a1 + 8);
    if (!v5)
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a2, 0);
      v7 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v6;
LABEL_17:

      return;
    }
LABEL_9:
    [v5 addObject:a2];
    return;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v10 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = a2;
      _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Only delete or insert update items can be added to a UITableViewUpdateGap: %@", buf, 0xCu);
    }
  }
  else
  {
    v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &addUpdateItem____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = a2;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Only delete or insert update items can be added to a UITableViewUpdateGap: %@", buf, 0xCu);
    }
  }
}

- (id)updateItems
{
  if (a1)
  {
    if (a2)
    {
      id v2 = [a1 arrayByAddingObjectsFromArray:a2];
    }
    else
    {
      id v2 = a1;
    }
  }
  else if (a2)
  {
    id v2 = a2;
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (uint64_t)initWithUpdateItem:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)UITableViewUpdateGap;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  uint64_t v4 = (uint64_t)v3;
  if (v3)
  {
    objc_storeStrong(v3 + 4, a2);
    objc_storeStrong((id *)(v4 + 40), a2);
    -[UITableViewUpdateGap addUpdateItem:](v4, (uint64_t)a2);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateItem, 0);
  objc_storeStrong((id *)&self->_firstUpdateItem, 0);
  objc_storeStrong((id *)&self->_insertItems, 0);
  objc_storeStrong((id *)&self->_deleteItems, 0);
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)UITableViewUpdateGap;
  uint64_t v4 = [(UITableViewUpdateGap *)&v11 description];
  firstUpdateItem = self->_firstUpdateItem;
  lastUpdateItem = self->_lastUpdateItem;
  if ([(NSMutableArray *)self->_deleteItems count]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(NSMutableArray *)self->_insertItems count]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  uint64_t v9 = [v3 stringWithFormat:@"%@ first item: %@, last item: %@, deleteBased: %@, hasInserts: %@", v4, firstUpdateItem, lastUpdateItem, v7, v8];

  return v9;
}

@end