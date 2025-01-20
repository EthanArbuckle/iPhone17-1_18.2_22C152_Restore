@interface MPModelStoreBrowseContentItem
- (MPModelObject)innermostModelObject;
- (id)storeContentItemObject;
- (id)storeContentItemObjectPropertiesFor:(id)a3;
@end

@implementation MPModelStoreBrowseContentItem

- (id)storeContentItemObject
{
  v2 = self;
  id v3 = sub_2A0280();

  return v3;
}

- (id)storeContentItemObjectPropertiesFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_2A0320(v4);

  return v6;
}

- (MPModelObject)innermostModelObject
{
  v2 = self;
  id v3 = [(MPModelStoreBrowseContentItem *)v2 innerObject];
  if (v3)
  {
    id v4 = v3;
    v5 = (MPModelStoreBrowseContentItem *)[v3 innermostModelObject];

    v2 = v5;
  }

  return v2;
}

@end