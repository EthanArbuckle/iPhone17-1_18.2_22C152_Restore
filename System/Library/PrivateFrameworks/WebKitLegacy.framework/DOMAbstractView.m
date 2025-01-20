@interface DOMAbstractView
- (DOMDocument)document;
- (void)_disconnectFrame;
- (void)dealloc;
@end

@implementation DOMAbstractView

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)DOMAbstractView;
  [(DOMObject *)&v2 dealloc];
}

- (DOMDocument)document
{
  internal = self->super._internal;
  if (internal) {
    return (DOMDocument *)kit(*((WebCore::Node **)internal + 37));
  }
  else {
    return 0;
  }
}

- (void)_disconnectFrame
{
  self->super._internal = 0;
}

@end