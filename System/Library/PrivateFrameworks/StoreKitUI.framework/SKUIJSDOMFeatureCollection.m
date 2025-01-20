@interface SKUIJSDOMFeatureCollection
- (SKUIJSDOMFeatureCollectionAppBridge)appBridge;
- (void)setAppBridge:(id)a3;
- (void)setEditing:(BOOL)a3 :(id)a4;
@end

@implementation SKUIJSDOMFeatureCollection

- (void)setEditing:(BOOL)a3 :(id)a4
{
  BOOL v4 = a3;
  p_appBridge = &self->_appBridge;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_appBridge);
  [WeakRetained setEditing:v4 options:v6];
}

- (SKUIJSDOMFeatureCollectionAppBridge)appBridge
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);

  return (SKUIJSDOMFeatureCollectionAppBridge *)WeakRetained;
}

- (void)setAppBridge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end