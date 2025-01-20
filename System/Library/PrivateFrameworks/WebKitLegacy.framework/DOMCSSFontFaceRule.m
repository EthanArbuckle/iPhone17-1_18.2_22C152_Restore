@interface DOMCSSFontFaceRule
- (DOMCSSStyleDeclaration)style;
@end

@implementation DOMCSSFontFaceRule

- (DOMCSSStyleDeclaration)style
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::CSSFontFaceRule::style(self->super.super._internal);
  v4 = (DOMCSSStyleDeclaration *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

@end