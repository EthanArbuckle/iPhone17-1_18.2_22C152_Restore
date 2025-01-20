@interface SHUDPairedUnlockJindoViewController
- (BOOL)needsUpdate;
- (NSString)watchName;
- (SHUDPairedUnlockJindoViewController)initWithWatchName:(id)a3 withLockButton:(BOOL)a4 withUpdate:(BOOL)a5;
- (id)leadingImage;
- (id)subtitle;
- (id)trailingButton;
- (int64_t)imageContentMode;
- (int64_t)subtitleAlignment;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setWatchName:(id)a3;
@end

@implementation SHUDPairedUnlockJindoViewController

- (SHUDPairedUnlockJindoViewController)initWithWatchName:(id)a3 withLockButton:(BOOL)a4 withUpdate:(BOOL)a5
{
  BOOL v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHUDPairedUnlockJindoViewController;
  id v7 = a3;
  v8 = [(SHUDJindoViewController *)&v12 initWithNeedsButton:v6];
  v9 = (NSString *)objc_msgSend(v7, "copy", v12.receiver, v12.super_class);

  watchName = v8->_watchName;
  v8->_watchName = v9;

  v8->_needsUpdate = a5;
  return v8;
}

- (id)leadingImage
{
  return +[SHUDPairedUnlockUtilities leadingImage];
}

- (int64_t)imageContentMode
{
  return 0;
}

- (id)subtitle
{
  unsigned int v2 = [(SHUDPairedUnlockJindoViewController *)self needsUpdate];
  v3 = +[NSBundle mainBundle];
  v4 = v3;
  if (v2) {
    CFStringRef v5 = @"UNLOCKING_JINDO";
  }
  else {
    CFStringRef v5 = @"UNLOCKED_JINDO";
  }
  BOOL v6 = [v3 localizedStringForKey:v5 value:0 table:@"Localization-D73"];

  return v6;
}

- (int64_t)subtitleAlignment
{
  return 4;
}

- (id)trailingButton
{
  return +[SHUDPairedUnlockUtilities trailingButton];
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (NSString)watchName
{
  return self->_watchName;
}

- (void)setWatchName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end