@interface VRXVisualResponseShown
- (VRXVisualResponseShown)initWithCardData:(id)a3 responseViewId:(id)a4;
- (_TtC9SnippetUI21RFVisualResponseShown)visualResponseShown;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
@end

@implementation VRXVisualResponseShown

- (VRXVisualResponseShown)initWithCardData:(id)a3 responseViewId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VRXVisualResponseShown;
  v8 = [(VRXVisualResponseShown *)&v12 init];
  if (v8)
  {
    v9 = [[_TtC9SnippetUI21RFVisualResponseShown alloc] initWithCardData:v6 responseViewId:v7];
    visualResponseShown = v8->_visualResponseShown;
    v8->_visualResponseShown = v9;
  }
  return v8;
}

- (void)emitWithTurnIdentifier:(id)a3
{
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
}

- (_TtC9SnippetUI21RFVisualResponseShown)visualResponseShown
{
  return (_TtC9SnippetUI21RFVisualResponseShown *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end