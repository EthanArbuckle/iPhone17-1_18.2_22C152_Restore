@interface NTKWidgetComplicationInfo
- (NSString)localizedAppName;
- (NSString)localizedDisplayName;
- (NTKWidgetComplicationInfo)initWithAppName:(id)a3 displayName:(id)a4;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLocalizedAppName:(id)a3;
- (void)setLocalizedDisplayName:(id)a3;
@end

@implementation NTKWidgetComplicationInfo

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKWidgetComplicationInfo;
  return [(NTKWidgetComplicationInfo *)&v3 init];
}

- (NTKWidgetComplicationInfo)initWithAppName:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKWidgetComplicationInfo;
  v8 = [(NTKWidgetComplicationInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    localizedAppName = v8->_localizedAppName;
    v8->_localizedAppName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    localizedDisplayName = v8->_localizedDisplayName;
    v8->_localizedDisplayName = (NSString *)v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[NTKWidgetComplicationInfo alloc] _init];
  objc_storeStrong(v4 + 2, self->_localizedAppName);
  objc_storeStrong(v4 + 1, self->_localizedDisplayName);
  return v4;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end