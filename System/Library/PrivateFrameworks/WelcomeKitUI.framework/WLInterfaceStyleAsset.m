@interface WLInterfaceStyleAsset
- (WLAsset)dark;
- (WLAsset)light;
- (WLInterfaceStyleAsset)initWithLight:(id)a3 dark:(id)a4;
- (void)setDark:(id)a3;
- (void)setLight:(id)a3;
@end

@implementation WLInterfaceStyleAsset

- (WLInterfaceStyleAsset)initWithLight:(id)a3 dark:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WLInterfaceStyleAsset;
  v8 = [(WLInterfaceStyleAsset *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(WLInterfaceStyleAsset *)v8 setLight:v6];
    [(WLInterfaceStyleAsset *)v9 setDark:v7];
  }

  return v9;
}

- (WLAsset)light
{
  return self->_light;
}

- (void)setLight:(id)a3
{
}

- (WLAsset)dark
{
  return self->_dark;
}

- (void)setDark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dark, 0);
  objc_storeStrong((id *)&self->_light, 0);
}

@end