@interface SBHIconStateUnarchivingSlugIconSource
- (id)leafIconForIdentifier:(id)a3;
@end

@implementation SBHIconStateUnarchivingSlugIconSource

- (id)leafIconForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_leafAppIcons objectForKey:v4];
  if (!v5)
  {
    v5 = [(SBLeafIcon *)[SBHApplicationIcon alloc] initWithLeafIdentifier:v4 applicationBundleID:v4];
    leafAppIcons = self->_leafAppIcons;
    if (!leafAppIcons)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v8 = self->_leafAppIcons;
      self->_leafAppIcons = v7;

      leafAppIcons = self->_leafAppIcons;
    }
    [(NSMutableDictionary *)leafAppIcons setObject:v5 forKey:v4];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end