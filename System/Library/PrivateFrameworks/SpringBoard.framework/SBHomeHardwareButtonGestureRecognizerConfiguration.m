@interface SBHomeHardwareButtonGestureRecognizerConfiguration
- (BOOL)shouldConfigureDependencies;
- (NSArray)allGestureRecognizers;
- (SBSystemGestureManager)systemGestureManager;
- (UIHBClickGestureRecognizer)acceleratedSinglePressUpGestureRecognizer;
- (UIHBClickGestureRecognizer)doublePressDownGestureRecognizer;
- (UIHBClickGestureRecognizer)doublePressUpGestureRecognizer;
- (UIHBClickGestureRecognizer)doubleTapUpGestureRecognizer;
- (UIHBClickGestureRecognizer)initialButtonDownGestureRecognizer;
- (UIHBClickGestureRecognizer)initialButtonUpGestureRecognizer;
- (UIHBClickGestureRecognizer)singlePressUpGestureRecognizer;
- (UIHBClickGestureRecognizer)triplePressUpGestureRecognizer;
- (UIHBLongClickGestureRecognizer)longPressGestureRecognizer;
- (void)setAcceleratedSinglePressUpGestureRecognizer:(id)a3;
- (void)setDoublePressDownGestureRecognizer:(id)a3;
- (void)setDoublePressUpGestureRecognizer:(id)a3;
- (void)setDoubleTapUpGestureRecognizer:(id)a3;
- (void)setInitialButtonDownGestureRecognizer:(id)a3;
- (void)setInitialButtonUpGestureRecognizer:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setSinglePressUpGestureRecognizer:(id)a3;
- (void)setSystemGestureManager:(id)a3;
- (void)setTriplePressUpGestureRecognizer:(id)a3;
@end

@implementation SBHomeHardwareButtonGestureRecognizerConfiguration

- (BOOL)shouldConfigureDependencies
{
  return 1;
}

- (NSArray)allGestureRecognizers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&self->_initialButtonDownGestureRecognizer;
  singlePressUpGestureRecognizer = self->_singlePressUpGestureRecognizer;
  long long v6 = *(_OWORD *)&self->_acceleratedSinglePressUpGestureRecognizer;
  doublePressDownGestureRecognizer = self->_doublePressDownGestureRecognizer;
  long long v8 = *(_OWORD *)&self->_doublePressUpGestureRecognizer;
  doubleTapUpGestureRecognizer = self->_doubleTapUpGestureRecognizer;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:9];
  return (NSArray *)v2;
}

- (SBSystemGestureManager)systemGestureManager
{
  return self->_systemGestureManager;
}

- (void)setSystemGestureManager:(id)a3
{
}

- (UIHBClickGestureRecognizer)initialButtonDownGestureRecognizer
{
  return self->_initialButtonDownGestureRecognizer;
}

- (void)setInitialButtonDownGestureRecognizer:(id)a3
{
}

- (UIHBClickGestureRecognizer)initialButtonUpGestureRecognizer
{
  return self->_initialButtonUpGestureRecognizer;
}

- (void)setInitialButtonUpGestureRecognizer:(id)a3
{
}

- (UIHBClickGestureRecognizer)singlePressUpGestureRecognizer
{
  return self->_singlePressUpGestureRecognizer;
}

- (void)setSinglePressUpGestureRecognizer:(id)a3
{
}

- (UIHBClickGestureRecognizer)acceleratedSinglePressUpGestureRecognizer
{
  return self->_acceleratedSinglePressUpGestureRecognizer;
}

- (void)setAcceleratedSinglePressUpGestureRecognizer:(id)a3
{
}

- (UIHBLongClickGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (UIHBClickGestureRecognizer)doublePressDownGestureRecognizer
{
  return self->_doublePressDownGestureRecognizer;
}

- (void)setDoublePressDownGestureRecognizer:(id)a3
{
}

- (UIHBClickGestureRecognizer)doublePressUpGestureRecognizer
{
  return self->_doublePressUpGestureRecognizer;
}

- (void)setDoublePressUpGestureRecognizer:(id)a3
{
}

- (UIHBClickGestureRecognizer)triplePressUpGestureRecognizer
{
  return self->_triplePressUpGestureRecognizer;
}

- (void)setTriplePressUpGestureRecognizer:(id)a3
{
}

- (UIHBClickGestureRecognizer)doubleTapUpGestureRecognizer
{
  return self->_doubleTapUpGestureRecognizer;
}

- (void)setDoubleTapUpGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_triplePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doublePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doublePressDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_acceleratedSinglePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singlePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_initialButtonUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_initialButtonDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
}

@end