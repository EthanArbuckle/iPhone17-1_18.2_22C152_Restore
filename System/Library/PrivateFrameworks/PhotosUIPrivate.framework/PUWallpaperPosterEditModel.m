@interface PUWallpaperPosterEditModel
- (BOOL)idleTimerDisabled;
- (NSMutableSet)idleTimerDisablingReasons;
- (PUPosterEditor)editor;
- (PUWallpaperPosterEditModel)initWithEditor:(id)a3;
- (PXInvalidatable)idleTimerAssertion;
- (void)dealloc;
- (void)performChanges:(id)a3;
- (void)setEditor:(id)a3;
- (void)setIdleTimerAssertion:(id)a3;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setIdleTimerDisablingReasons:(id)a3;
@end

@implementation PUWallpaperPosterEditModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_idleTimerDisablingReasons, 0);
}

- (void)setIdleTimerAssertion:(id)a3
{
}

- (PXInvalidatable)idleTimerAssertion
{
  return self->_idleTimerAssertion;
}

- (void)setEditor:(id)a3
{
}

- (PUPosterEditor)editor
{
  return self->_editor;
}

- (void)setIdleTimerDisablingReasons:(id)a3
{
}

- (NSMutableSet)idleTimerDisablingReasons
{
  return self->_idleTimerDisablingReasons;
}

- (BOOL)idleTimerDisabled
{
  return self->_idleTimerDisabled;
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  if (self->_idleTimerDisabled != a3)
  {
    self->_idleTimerDisabled = a3;
    if (a3)
    {
      v4 = [(PUWallpaperPosterEditModel *)self editor];
      v5 = objc_msgSend(v4, "pu_disableIdleTimer");
      [(PUWallpaperPosterEditModel *)self setIdleTimerAssertion:v5];
    }
    else
    {
      v6 = [(PUWallpaperPosterEditModel *)self idleTimerAssertion];
      objc_msgSend(v6, "px_invalidate");

      [(PUWallpaperPosterEditModel *)self setIdleTimerAssertion:0];
    }
    [(PUWallpaperPosterEditModel *)self signalChange:1];
  }
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(PUWallpaperPosterEditModel *)self idleTimerDisablingReasons];
  id v8 = v7;
  if (v4) {
    [v7 addObject:v6];
  }
  else {
    [v7 removeObject:v6];
  }

  -[PUWallpaperPosterEditModel setIdleTimerDisabled:](self, "setIdleTimerDisabled:", [v8 count] != 0);
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperPosterEditModel;
  [(PUWallpaperPosterEditModel *)&v3 performChanges:a3];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PUWallpaperPosterEditModel;
  [(PUWallpaperPosterEditModel *)&v2 dealloc];
}

- (PUWallpaperPosterEditModel)initWithEditor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUWallpaperPosterEditModel;
  id v6 = [(PUWallpaperPosterEditModel *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    idleTimerDisablingReasons = v6->_idleTimerDisablingReasons;
    v6->_idleTimerDisablingReasons = v7;

    objc_storeStrong((id *)&v6->_editor, a3);
  }

  return v6;
}

@end