@interface SiriUISashItem
+ (id)defaultSashItem;
- (BOOL)canPunchout;
- (BOOL)isDefault;
- (SiriUISashItem)initWithExtension:(id)a3;
- (void)_setDefault:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SiriUISashItem

+ (id)defaultSashItem
{
  v2 = [SiriUISashItem alloc];
  v3 = +[SiriUIUtilities defaultBrowserBundleIdentifier];
  v4 = [(SiriSharedUISashItem *)v2 initWithApplicationBundleIdentifier:v3];

  [(SiriUISashItem *)v4 _setDefault:1];
  return v4;
}

- (SiriUISashItem)initWithExtension:(id)a3
{
  id v4 = a3;
  v5 = [(SiriSharedUISashItem *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "siriui_displayName");
    v7 = (void *)[v6 copy];
    [(SiriUISashItem *)v5 setTitle:v7];

    v8 = objc_msgSend(v4, "siriui_iconImage");
    [(SiriUISashItem *)v5 setImage:v8];
  }
  return v5;
}

- (void)setImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUISashItem;
  [(SiriSharedUISashItem *)&v4 setImage:a3];
  [(SiriUISashItem *)self _setDefault:0];
}

- (void)setTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUISashItem;
  [(SiriSharedUISashItem *)&v4 setTitle:a3];
  [(SiriUISashItem *)self _setDefault:0];
}

- (BOOL)canPunchout
{
  if ([(SiriUISashItem *)self isDefault]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SiriUISashItem;
  return [(SiriSharedUISashItem *)&v4 canPunchout];
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)_setDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

@end