@interface SKUIPopoverObserver
- (SKUIPopoverObserver)initWithPopoverController:(id)a3;
- (void)dealloc;
- (void)dismissPopoverAnimated:(BOOL)a3;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)setTarget:(id)a3 selector:(SEL)a4;
@end

@implementation SKUIPopoverObserver

- (SKUIPopoverObserver)initWithPopoverController:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPopoverObserver initWithPopoverController:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIPopoverObserver;
  v6 = [(SKUIPopoverObserver *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_popoverController, a3);
    [(UIPopoverController *)v7->_popoverController setDelegate:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(UIPopoverController *)self->_popoverController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIPopoverObserver;
  [(SKUIPopoverObserver *)&v3 dealloc];
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
}

- (void)setTarget:(id)a3 selector:(SEL)a4
{
  objc_initWeak(&location, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_selector = v6;
  id v7 = objc_loadWeakRetained(&location);
  objc_storeWeak(&self->_target, v7);

  objc_destroyWeak(&location);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  id v13 = a3;
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    SEL selector = self->_selector;
    p_SEL selector = &self->_selector;
    SEL v7 = selector;
    if (selector)
    {
      SEL v10 = v7;

      if (!v10) {
        goto LABEL_9;
      }
      id v11 = objc_loadWeakRetained(p_target);
      v6 = v11;
      if (*p_selector) {
        SEL v12 = *p_selector;
      }
      else {
        SEL v12 = 0;
      }
      [v11 performSelector:v12 withObject:0];
    }
  }
LABEL_9:
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);

  objc_storeStrong((id *)&self->_popoverController, 0);
}

- (void)initWithPopoverController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPopoverObserver initWithPopoverController:]";
}

@end