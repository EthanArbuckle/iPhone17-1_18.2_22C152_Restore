@interface DOMWheelEvent
- (BOOL)isHorizontal;
- (BOOL)webkitDirectionInvertedFromDevice;
- (double)deltaX;
- (double)deltaY;
- (double)deltaZ;
- (int)wheelDelta;
- (int)wheelDeltaX;
- (int)wheelDeltaY;
- (unsigned)deltaMode;
@end

@implementation DOMWheelEvent

- (double)deltaX
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  double v3 = *((double *)self->super.super.super.super._internal + 28);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (double)deltaY
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  double v3 = *((double *)self->super.super.super.super._internal + 29);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (double)deltaZ
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  double v3 = *((double *)self->super.super.super.super._internal + 30);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (unsigned)deltaMode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 62);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (int)wheelDeltaX
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 54);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)wheelDeltaY
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 55);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)wheelDelta
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  int v5 = *((_DWORD *)internal + 55);
  if (!v5) {
    int v5 = *((_DWORD *)internal + 54);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (BOOL)webkitDirectionInvertedFromDevice
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if (*((unsigned char *)internal + 384)) {
    BOOL v5 = *((unsigned char *)internal + 305) != 0;
  }
  else {
    BOOL v5 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (BOOL)isHorizontal
{
  return [(DOMWheelEvent *)self wheelDeltaX] != 0;
}

@end