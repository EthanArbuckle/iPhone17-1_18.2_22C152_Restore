@interface _UIFeedbackVisualizerWindow
- (BOOL)isInternalWindow;
- (NSMapTable)engineLayers;
- (_UIFeedbackVisualizerWindow)initWithWindowScene:(id)a3;
- (void)setEngineLayers:(id)a3;
@end

@implementation _UIFeedbackVisualizerWindow

- (_UIFeedbackVisualizerWindow)initWithWindowScene:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackVisualizerWindow;
  v3 = [(UIWindow *)&v7 initWithWindowScene:a3];
  uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  engineLayers = v3->_engineLayers;
  v3->_engineLayers = (NSMapTable *)v4;

  return v3;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (NSMapTable)engineLayers
{
  return self->_engineLayers;
}

- (void)setEngineLayers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end