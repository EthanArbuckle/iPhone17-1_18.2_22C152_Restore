@interface NTKMonogramComplicationController
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)hasTapAction;
- (void)_activate;
- (void)_deactivate;
- (void)_handleMonogramTextReload;
- (void)_reloadMonogramText;
- (void)_updateDisplay;
@end

@implementation NTKMonogramComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 14;
}

- (void)_activate
{
  [(NTKMonogramComplicationController *)self _reloadMonogramText];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleMonogramTextReload name:@"NTKCustomMonogramChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handleMonogramTextReload name:@"NTKFaceDefaultsChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handleMonogramTextReload name:*MEMORY[0x1E4F1C370] object:0];
  [v3 addObserver:self selector:sel__handleMonogramTextReload name:*MEMORY[0x1E4F19660] object:0];
}

- (void)_deactivate
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"NTKCustomMonogramChangedNotification" object:0];
  [v3 removeObserver:self name:@"NTKFaceDefaultsChangedNotification" object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19660] object:0];
}

- (BOOL)hasTapAction
{
  return 0;
}

- (void)_updateDisplay
{
  id v3 = [(NTKComplicationController *)self legacyDisplay];
  [v3 setMonogramText:self->_monogramText];
}

- (void)_reloadMonogramText
{
  uint64_t v3 = +[NTKMonogram monogram];
  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = &stru_1F1635E90;
  }
  obj = v4;
  if (!-[NSString isEqualToString:](self->_monogramText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_monogramText, obj);
    [(NTKMonogramComplicationController *)self _updateDisplay];
  }
}

- (void)_handleMonogramTextReload
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__NTKMonogramComplicationController__handleMonogramTextReload__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__NTKMonogramComplicationController__handleMonogramTextReload__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadMonogramText];
}

- (void).cxx_destruct
{
}

@end