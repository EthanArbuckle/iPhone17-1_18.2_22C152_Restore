@interface LSPropertyList
@end

@implementation LSPropertyList

uint64_t __63__LSPropertyList_PBFAdditions__pbf_staticDescriptorIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

uint64_t __63__LSPropertyList_PBFAdditions__pbf_staticDescriptorIdentifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) objectForKey:v5];
  v8 = [v7 objectForKey:@"sort_relative_index"];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v5));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = [*(id *)(a1 + 32) objectForKey:v6];
  v13 = [v12 objectForKey:@"sort_relative_index"];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v6));
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  uint64_t v17 = [v11 compare:v16];
  return v17;
}

@end