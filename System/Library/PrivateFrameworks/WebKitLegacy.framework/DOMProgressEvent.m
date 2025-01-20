@interface DOMProgressEvent
- (BOOL)lengthComputable;
- (unint64_t)loaded;
- (unint64_t)total;
@end

@implementation DOMProgressEvent

- (BOOL)lengthComputable
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = *((unsigned char *)self->super.super._internal + 72);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (unint64_t)loaded
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  unint64_t v3 = *((void *)self->super.super._internal + 10);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (unint64_t)total
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  unint64_t v3 = *((void *)self->super.super._internal + 11);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

@end