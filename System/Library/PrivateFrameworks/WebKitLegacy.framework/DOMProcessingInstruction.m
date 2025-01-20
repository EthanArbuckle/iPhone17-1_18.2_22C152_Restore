@interface DOMProcessingInstruction
- (DOMStyleSheet)sheet;
- (NSString)target;
@end

@implementation DOMProcessingInstruction

- (NSString)target
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((void *)self->super.super.super._internal + 14)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (DOMStyleSheet)sheet
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMStyleSheet *)kit(*((DOMObjectInternal **)self->super.super.super._internal + 19));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

@end