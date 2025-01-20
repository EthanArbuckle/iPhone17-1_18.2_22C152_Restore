@interface _UITabBarItemAppearanceStorage
- (UIColor)badgeColor;
- (UIOffset)titleOffset;
- (id)badgeTextAttributesForState:(unint64_t)a3;
- (void)enumerateBadgeTextAttributesWithBlock:(id)a3;
- (void)setBadgeColor:(id)a3;
- (void)setBadgeTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)setTitleOffset:(UIOffset)a3;
@end

@implementation _UITabBarItemAppearanceStorage

- (void)setBadgeTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v16 = v6;
  if (v6) {
    goto LABEL_14;
  }
  badgeTextAttributesForState = self->_badgeTextAttributesForState;
  v8 = [NSNumber numberWithUnsignedInteger:a4];
  v9 = [(NSMutableDictionary *)badgeTextAttributesForState objectForKeyedSubscript:v8];

  id v6 = 0;
  if (v9)
  {
LABEL_14:
    if (self->_badgeTextAttributesForState)
    {
      if (v6)
      {
LABEL_5:
        v10 = (void *)[v6 mutableCopy];
        v11 = self->_badgeTextAttributesForState;
        v12 = [NSNumber numberWithUnsignedInteger:a4];
        [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

LABEL_8:
        id v6 = v16;
        goto LABEL_9;
      }
    }
    else
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v14 = self->_badgeTextAttributesForState;
      self->_badgeTextAttributesForState = v13;

      id v6 = v16;
      if (v16) {
        goto LABEL_5;
      }
    }
    v15 = self->_badgeTextAttributesForState;
    v10 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v15 removeObjectForKey:v10];
    goto LABEL_8;
  }
LABEL_9:
}

- (id)badgeTextAttributesForState:(unint64_t)a3
{
  badgeTextAttributesForState = self->_badgeTextAttributesForState;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSMutableDictionary *)badgeTextAttributesForState objectForKeyedSubscript:v4];
  id v6 = (void *)[v5 copy];

  return v6;
}

- (void)enumerateBadgeTextAttributesWithBlock:(id)a3
{
  id v4 = a3;
  badgeTextAttributesForState = self->_badgeTextAttributesForState;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72___UITabBarItemAppearanceStorage_enumerateBadgeTextAttributesWithBlock___block_invoke;
  v7[3] = &unk_1E52DDE68;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)badgeTextAttributesForState enumerateKeysAndObjectsUsingBlock:v7];
}

- (UIOffset)titleOffset
{
  double horizontal = self->_titleOffset.horizontal;
  double vertical = self->_titleOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setTitleOffset:(UIOffset)a3
{
  self->_titleOffset = a3;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (void)setBadgeColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_badgeTextAttributesForState, 0);
}

@end