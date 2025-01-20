@interface _TUIFeedSectionDebugButton
- (_TUIFeedSectionDebug)debug;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)setDebug:(id)a3;
@end

@implementation _TUIFeedSectionDebugButton

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  p_debug = &self->_debug;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_debug);
  v9 = [WeakRetained contextMenuInteraction:v7 configurationForMenuAtLocation:x, y];

  return v9;
}

- (_TUIFeedSectionDebug)debug
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debug);

  return (_TUIFeedSectionDebug *)WeakRetained;
}

- (void)setDebug:(id)a3
{
}

- (void).cxx_destruct
{
}

@end