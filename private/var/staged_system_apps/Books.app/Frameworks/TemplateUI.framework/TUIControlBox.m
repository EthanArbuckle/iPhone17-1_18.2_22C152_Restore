@interface TUIControlBox
- (BOOL)enableBackgroundForHighlightPreview;
- (BOOL)enableShadowForHighlightPreview;
- (Class)layoutClass;
- (NSArray)linkEntities;
- (void)setEnableBackgroundForHighlightPreview:(BOOL)a3;
- (void)setEnableShadowForHighlightPreview:(BOOL)a3;
- (void)setLinkEntities:(id)a3;
@end

@implementation TUIControlBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (void)setLinkEntities:(id)a3
{
}

- (BOOL)enableBackgroundForHighlightPreview
{
  return self->_enableBackgroundForHighlightPreview;
}

- (void)setEnableBackgroundForHighlightPreview:(BOOL)a3
{
  self->_enableBackgroundForHighlightPreview = a3;
}

- (BOOL)enableShadowForHighlightPreview
{
  return self->_enableShadowForHighlightPreview;
}

- (void)setEnableShadowForHighlightPreview:(BOOL)a3
{
  self->_enableShadowForHighlightPreview = a3;
}

- (void).cxx_destruct
{
}

@end