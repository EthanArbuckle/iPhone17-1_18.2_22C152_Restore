@interface VKCDataDetectorCatalystRevealHighlighter
- (BOOL)highlighting;
- (VKCDataDetectorCatalystRevealHighlighterDelegate)delegate;
- (VKCDataDetectorElementView)elementView;
- (void)setDelegate:(id)a3;
- (void)setElementView:(id)a3;
- (void)setHighlighting:(BOOL)a3;
@end

@implementation VKCDataDetectorCatalystRevealHighlighter

- (VKCDataDetectorCatalystRevealHighlighterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCDataDetectorCatalystRevealHighlighterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VKCDataDetectorElementView)elementView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
  return (VKCDataDetectorElementView *)WeakRetained;
}

- (void)setElementView:(id)a3
{
}

- (BOOL)highlighting
{
  return self->_highlighting;
}

- (void)setHighlighting:(BOOL)a3
{
  self->_highlighting = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end