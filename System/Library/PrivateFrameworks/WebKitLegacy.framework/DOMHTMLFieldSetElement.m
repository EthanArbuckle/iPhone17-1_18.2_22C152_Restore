@interface DOMHTMLFieldSetElement
- (DOMHTMLFormElement)form;
@end

@implementation DOMHTMLFieldSetElement

- (DOMHTMLFormElement)form
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  uint64_t v3 = *((void *)self->super.super.super.super._internal + 16);
  if (v3) {
    v4 = *(WebCore::Node **)(v3 + 8);
  }
  else {
    v4 = 0;
  }
  v5 = (DOMHTMLFormElement *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

@end