@interface _UIMenuPreparationContext
+ (id)contextWithPreparer:(id)a3 firstResponderTarget:(id)a4;
- (BOOL)shouldTrackSelectionForVisibleIndex:(unint64_t)a3 elementSize:(int64_t)a4;
- (BOOL)supportsCustomViewMenuElements;
- (BOOL)supportsHeaderView;
- (BOOL)tracksSelection;
- (BOOL)useSenderAsResponderSender;
- (UIDeferredMenuElementDelegate)deferredElementDelegate;
- (UIResponder)firstResponderTarget;
- (id)copyWithZone:(_NSZone *)a3;
- (id)elementSizeSolver;
- (id)preparer;
- (id)sender;
- (id)shouldTrackVisibleSelection;
- (void)setDeferredElementDelegate:(id)a3;
- (void)setElementSizeSolver:(id)a3;
- (void)setSender:(id)a3;
- (void)setShouldTrackVisibleSelection:(id)a3;
- (void)setSupportsCustomViewMenuElements:(BOOL)a3;
- (void)setSupportsHeaderView:(BOOL)a3;
- (void)setTracksSelection:(BOOL)a3;
- (void)setUseSenderAsResponderSender:(BOOL)a3;
@end

@implementation _UIMenuPreparationContext

+ (id)contextWithPreparer:(id)a3 firstResponderTarget:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(_UIMenuPreparationContext);
  objc_storeWeak(&v7->_preparer, v6);

  objc_storeWeak((id *)&v7->_firstResponderTarget, v5);
  v7->_tracksSelection = 1;
  id elementSizeSolver = v7->_elementSizeSolver;
  v7->_id elementSizeSolver = &__block_literal_global_686;

  id shouldTrackVisibleSelection = v7->_shouldTrackVisibleSelection;
  v7->_id shouldTrackVisibleSelection = &__block_literal_global_3_13;

  return v7;
}

- (BOOL)shouldTrackSelectionForVisibleIndex:(unint64_t)a3 elementSize:(int64_t)a4
{
  if (!self->_tracksSelection) {
    return 0;
  }
  id shouldTrackVisibleSelection = (uint64_t (**)(id, unint64_t, int64_t))self->_shouldTrackVisibleSelection;
  if (shouldTrackVisibleSelection) {
    return shouldTrackVisibleSelection[2](shouldTrackVisibleSelection, a3, a4);
  }
  else {
    return 1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[_UIMenuPreparationContext allocWithZone:a3] init];
  id v5 = [(_UIMenuPreparationContext *)self preparer];
  objc_storeWeak(&v4->_preparer, v5);

  id v6 = [(_UIMenuPreparationContext *)self preparer];
  objc_storeWeak((id *)&v4->_firstResponderTarget, v6);

  v7 = [(_UIMenuPreparationContext *)self deferredElementDelegate];
  [(_UIMenuPreparationContext *)v4 setDeferredElementDelegate:v7];

  v8 = [(_UIMenuPreparationContext *)self sender];
  [(_UIMenuPreparationContext *)v4 setSender:v8];

  [(_UIMenuPreparationContext *)v4 setSupportsCustomViewMenuElements:[(_UIMenuPreparationContext *)self supportsCustomViewMenuElements]];
  [(_UIMenuPreparationContext *)v4 setUseSenderAsResponderSender:[(_UIMenuPreparationContext *)self useSenderAsResponderSender]];
  [(_UIMenuPreparationContext *)v4 setSupportsHeaderView:[(_UIMenuPreparationContext *)self supportsHeaderView]];
  [(_UIMenuPreparationContext *)v4 setTracksSelection:[(_UIMenuPreparationContext *)self tracksSelection]];
  v9 = [(_UIMenuPreparationContext *)self elementSizeSolver];
  [(_UIMenuPreparationContext *)v4 setElementSizeSolver:v9];

  v10 = [(_UIMenuPreparationContext *)self shouldTrackVisibleSelection];
  [(_UIMenuPreparationContext *)v4 setShouldTrackVisibleSelection:v10];

  return v4;
}

- (id)preparer
{
  id WeakRetained = objc_loadWeakRetained(&self->_preparer);
  return WeakRetained;
}

- (UIResponder)firstResponderTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstResponderTarget);
  return (UIResponder *)WeakRetained;
}

- (UIDeferredMenuElementDelegate)deferredElementDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deferredElementDelegate);
  return (UIDeferredMenuElementDelegate *)WeakRetained;
}

- (void)setDeferredElementDelegate:(id)a3
{
}

- (id)sender
{
  id WeakRetained = objc_loadWeakRetained(&self->_sender);
  return WeakRetained;
}

- (void)setSender:(id)a3
{
}

- (BOOL)supportsCustomViewMenuElements
{
  return self->_supportsCustomViewMenuElements;
}

- (void)setSupportsCustomViewMenuElements:(BOOL)a3
{
  self->_supportsCustomViewMenuElements = a3;
}

- (BOOL)useSenderAsResponderSender
{
  return self->_useSenderAsResponderSender;
}

- (void)setUseSenderAsResponderSender:(BOOL)a3
{
  self->_useSenderAsResponderSender = a3;
}

- (BOOL)supportsHeaderView
{
  return self->_supportsHeaderView;
}

- (void)setSupportsHeaderView:(BOOL)a3
{
  self->_supportsHeaderView = a3;
}

- (BOOL)tracksSelection
{
  return self->_tracksSelection;
}

- (void)setTracksSelection:(BOOL)a3
{
  self->_tracksSelection = a3;
}

- (id)shouldTrackVisibleSelection
{
  return self->_shouldTrackVisibleSelection;
}

- (void)setShouldTrackVisibleSelection:(id)a3
{
}

- (id)elementSizeSolver
{
  return self->_elementSizeSolver;
}

- (void)setElementSizeSolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_elementSizeSolver, 0);
  objc_storeStrong(&self->_shouldTrackVisibleSelection, 0);
  objc_destroyWeak(&self->_sender);
  objc_destroyWeak((id *)&self->_deferredElementDelegate);
  objc_destroyWeak((id *)&self->_firstResponderTarget);
  objc_destroyWeak(&self->_preparer);
}

@end