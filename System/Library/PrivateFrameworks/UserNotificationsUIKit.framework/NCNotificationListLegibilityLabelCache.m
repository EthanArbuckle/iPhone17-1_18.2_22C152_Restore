@interface NCNotificationListLegibilityLabelCache
+ (id)sharedInstance;
- (NCNotificationListLegibilityLabelCache)init;
- (NSMutableDictionary)sectionHeaderViewLegibilityLabelDictionary;
- (id)_createLegibilityLabelWithTitle:(id)a3 font:(id)a4;
- (id)_stringDescriptorForFont:(id)a3;
- (id)legibilityLabelForTitle:(id)a3 forSuperview:(id)a4 font:(id)a5;
- (void)clearAll;
- (void)setSectionHeaderViewLegibilityLabelDictionary:(id)a3;
@end

@implementation NCNotificationListLegibilityLabelCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

void __56__NCNotificationListLegibilityLabelCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NCNotificationListLegibilityLabelCache);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
}

- (NCNotificationListLegibilityLabelCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListLegibilityLabelCache;
  v2 = [(NCNotificationListLegibilityLabelCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionHeaderViewLegibilityLabelDictionary = v2->_sectionHeaderViewLegibilityLabelDictionary;
    v2->_sectionHeaderViewLegibilityLabelDictionary = v3;
  }
  return v2;
}

- (id)legibilityLabelForTitle:(id)a3 forSuperview:(id)a4 font:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NCNotificationListLegibilityLabelCache *)self sectionHeaderViewLegibilityLabelDictionary];
  id v12 = [v11 objectForKey:v8];

  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v13 = [(NCNotificationListLegibilityLabelCache *)self sectionHeaderViewLegibilityLabelDictionary];
    [v13 setObject:v12 forKey:v8];
  }
  v14 = [(NCNotificationListLegibilityLabelCache *)self _stringDescriptorForFont:v10];
  v15 = [v12 objectForKey:v14];
  if (v15)
  {
    v16 = v15;
    uint64_t v17 = [v15 superview];
    if (v17)
    {
      v18 = (void *)v17;
      id v19 = [v16 superview];

      if (v19 != v9)
      {
        uint64_t v20 = [(NCNotificationListLegibilityLabelCache *)self _createLegibilityLabelWithTitle:v8 font:v10];

        v16 = (void *)v20;
      }
    }
  }
  else
  {
    v16 = [(NCNotificationListLegibilityLabelCache *)self _createLegibilityLabelWithTitle:v8 font:v10];
    [v12 setObject:v16 forKey:v14];
  }

  return v16;
}

- (void)clearAll
{
  id v2 = [(NCNotificationListLegibilityLabelCache *)self sectionHeaderViewLegibilityLabelDictionary];
  [v2 removeAllObjects];
}

- (id)_createLegibilityLabelWithTitle:(id)a3 font:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FB21E0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedInstanceForStyle:1];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FA7CA0]) initWithSettings:v8 strength:*MEMORY[0x1E4FB3288]];
  [v9 setNumberOfLines:0];
  [v9 setLineBreakMode:0];
  [v9 setFont:v6];

  [v9 setString:v7];
  objc_msgSend(v9, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v9 setUserInteractionEnabled:0];

  return v9;
}

- (id)_stringDescriptorForFont:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v4 familyName];
  id v6 = [v4 fontName];
  [v4 pointSize];
  uint64_t v8 = v7;

  id v9 = [v3 stringWithFormat:@"%@:%@:%f", v5, v6, v8];

  return v9;
}

- (NSMutableDictionary)sectionHeaderViewLegibilityLabelDictionary
{
  return self->_sectionHeaderViewLegibilityLabelDictionary;
}

- (void)setSectionHeaderViewLegibilityLabelDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end