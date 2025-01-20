@interface NCNotificationCellHeight
- (NCNotificationCellHeight)init;
- (NSMutableDictionary)cellHeightForConfigurationDictionary;
- (id)heightForContentConfiguration:(id)a3;
- (void)removeHeightForContentConfiguration:(id)a3;
- (void)setCellHeightForConfigurationDictionary:(id)a3;
- (void)setHeight:(double)a3 forContentConfiguration:(id)a4;
@end

@implementation NCNotificationCellHeight

- (NCNotificationCellHeight)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationCellHeight;
  v2 = [(NCNotificationCellHeight *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(NCNotificationCellHeight *)v2 setCellHeightForConfigurationDictionary:v3];
  }
  return v2;
}

- (id)heightForContentConfiguration:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NCNotificationCellHeight *)self cellHeightForConfigurationDictionary];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setHeight:(double)a3 forContentConfiguration:(id)a4
{
  id v6 = a4;
  id v8 = [(NCNotificationCellHeight *)self cellHeightForConfigurationDictionary];
  v7 = [NSNumber numberWithDouble:a3];
  [v8 setObject:v7 forKey:v6];
}

- (void)removeHeightForContentConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationCellHeight *)self cellHeightForConfigurationDictionary];
  [v5 removeObjectForKey:v4];
}

- (NSMutableDictionary)cellHeightForConfigurationDictionary
{
  return self->_cellHeightForConfigurationDictionary;
}

- (void)setCellHeightForConfigurationDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end