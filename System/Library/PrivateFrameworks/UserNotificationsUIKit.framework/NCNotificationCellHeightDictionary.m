@interface NCNotificationCellHeightDictionary
- (NCNotificationCellHeightDictionary)init;
- (NSMutableDictionary)cellHeightDictionary;
- (id)heightForRequest:(id)a3 withContentConfiguration:(id)a4;
- (void)removeAllHeightsForRequest:(id)a3;
- (void)removeHeightForContentConfiguration:(id)a3 forRequest:(id)a4;
- (void)setCellHeightDictionary:(id)a3;
- (void)setHeight:(double)a3 forRequest:(id)a4 withContentConfiguration:(id)a5;
@end

@implementation NCNotificationCellHeightDictionary

- (NCNotificationCellHeightDictionary)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationCellHeightDictionary;
  v2 = [(NCNotificationCellHeightDictionary *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(NCNotificationCellHeightDictionary *)v2 setCellHeightDictionary:v3];
  }
  return v2;
}

- (id)heightForRequest:(id)a3 withContentConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(NCNotificationCellHeightDictionary *)self cellHeightDictionary];
  v9 = [v8 objectForKey:v7];

  v10 = [v9 heightForContentConfiguration:v6];

  return v10;
}

- (void)setHeight:(double)a3 forRequest:(id)a4 withContentConfiguration:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  v9 = [(NCNotificationCellHeightDictionary *)self cellHeightDictionary];
  v10 = [v9 objectForKey:v12];

  if (!v10) {
    v10 = objc_opt_new();
  }
  [v10 setHeight:v8 forContentConfiguration:a3];
  v11 = [(NCNotificationCellHeightDictionary *)self cellHeightDictionary];
  [v11 setObject:v10 forKey:v12];
}

- (void)removeHeightForContentConfiguration:(id)a3 forRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(NCNotificationCellHeightDictionary *)self cellHeightDictionary];
  id v8 = [v9 objectForKey:v6];

  [v8 removeHeightForContentConfiguration:v7];
}

- (void)removeAllHeightsForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationCellHeightDictionary *)self cellHeightDictionary];
  [v5 removeObjectForKey:v4];
}

- (NSMutableDictionary)cellHeightDictionary
{
  return self->_cellHeightDictionary;
}

- (void)setCellHeightDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end