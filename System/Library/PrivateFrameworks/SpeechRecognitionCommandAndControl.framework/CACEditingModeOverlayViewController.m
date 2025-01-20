@interface CACEditingModeOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (NSArray)elements;
- (int64_t)overlayType;
- (int64_t)zOrder;
- (void)_syncUI;
- (void)loadView;
- (void)setElements:(id)a3;
- (void)setOverlayType:(int64_t)a3;
@end

@implementation CACEditingModeOverlayViewController

- (void)loadView
{
  v3 = objc_alloc_init(CACEditingModeOverlayWordsView);
  [(CACEditingModeOverlayViewController *)self setView:v3];
  wordsView = self->_wordsView;
  self->_wordsView = v3;

  [(CACEditingModeOverlayViewController *)self _syncUI];
}

- (int64_t)zOrder
{
  return 10;
}

- (BOOL)isOverlay
{
  return 1;
}

- (void)setElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
  [(CACEditingModeOverlayViewController *)self _syncUI];
}

- (void)setOverlayType:(int64_t)a3
{
  self->_overlayType = a3;
  [(CACEditingModeOverlayViewController *)self _syncUI];
}

- (void)_syncUI
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_elements;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = objc_opt_new();
        v11 = objc_msgSend(v9, "label", (void)v12);
        [v10 setLabel:v11];

        [v9 interfaceOrientedFrame];
        objc_msgSend(v10, "setFrame:");
        [v3 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [(CACEditingModeOverlayWordsView *)self->_wordsView setOverlayType:self->_overlayType];
  [(CACEditingModeOverlayWordsView *)self->_wordsView setLabels:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)elements
{
  return self->_elements;
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_wordsView, 0);
}

@end