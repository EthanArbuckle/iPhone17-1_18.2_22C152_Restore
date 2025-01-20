@interface HUDTheme
+ (id)darkModeTheme;
+ (id)lightModeTheme;
- (CGColor)backgroundColor;
- (CGColor)currentHangCriticalTextColor;
- (CGColor)currentHangSevereTextColor;
- (CGColor)currentHangTextColor;
- (CGColor)currentHangTextColorForStatus:(int64_t)a3;
- (CGColor)currentProcessExitTextColor;
- (CGColor)previousHangCriticalTextColor;
- (CGColor)previousHangSevereTextColor;
- (CGColor)previousHangTextColor;
- (CGColor)previousHangTextColorForStatus:(int64_t)a3;
- (CGColor)processExitReasonNamespaceTextColor;
- (HUDTheme)initWithPreviousHangTextColor:(CGColor *)a3 currentHangTextColor:(CGColor *)a4 currentHangSevereTextColor:(CGColor *)a5 previousHangSevereTextColor:(CGColor *)a6 currentHangCriticalTextColor:(CGColor *)a7 previousHangCriticalTextColor:(CGColor *)a8 backgroundColor:(CGColor *)a9 currentProcessExitTextColor:(CGColor *)a10 processExitReasonNamespaceTextColor:(CGColor *)a11;
- (void)dealloc;
@end

@implementation HUDTheme

- (HUDTheme)initWithPreviousHangTextColor:(CGColor *)a3 currentHangTextColor:(CGColor *)a4 currentHangSevereTextColor:(CGColor *)a5 previousHangSevereTextColor:(CGColor *)a6 currentHangCriticalTextColor:(CGColor *)a7 previousHangCriticalTextColor:(CGColor *)a8 backgroundColor:(CGColor *)a9 currentProcessExitTextColor:(CGColor *)a10 processExitReasonNamespaceTextColor:(CGColor *)a11
{
  v19.receiver = self;
  v19.super_class = (Class)HUDTheme;
  v17 = [(HUDTheme *)&v19 init];
  if (v17)
  {
    v17->_previousHangTextColor = CGColorRetain(a3);
    v17->_currentHangTextColor = CGColorRetain(a4);
    v17->_currentHangSevereTextColor = CGColorRetain(a5);
    v17->_previousHangSevereTextColor = CGColorRetain(a6);
    v17->_currentHangCriticalTextColor = CGColorRetain(a7);
    v17->_previousHangCriticalTextColor = CGColorRetain(a8);
    v17->_backgroundColor = CGColorRetain(a9);
    v17->_currentProcessExitTextColor = CGColorRetain(a10);
    v17->_processExitReasonNamespaceTextColor = CGColorRetain(a11);
  }
  return v17;
}

- (void)dealloc
{
  CFRelease(self->_previousHangTextColor);
  CFRelease(self->_currentHangTextColor);
  CFRelease(self->_currentHangSevereTextColor);
  CFRelease(self->_previousHangSevereTextColor);
  CFRelease(self->_currentHangCriticalTextColor);
  CFRelease(self->_previousHangCriticalTextColor);
  CFRelease(self->_backgroundColor);
  CFRelease(self->_currentProcessExitTextColor);
  CFRelease(self->_processExitReasonNamespaceTextColor);
  v3.receiver = self;
  v3.super_class = (Class)HUDTheme;
  [(HUDTheme *)&v3 dealloc];
}

+ (id)lightModeTheme
{
  if (qword_100063C70 != -1) {
    dispatch_once(&qword_100063C70, &stru_100051410);
  }
  v2 = (void *)qword_100063C78;

  return v2;
}

+ (id)darkModeTheme
{
  if (qword_100063C80 != -1) {
    dispatch_once(&qword_100063C80, &stru_100051430);
  }
  v2 = (void *)qword_100063C88;

  return v2;
}

- (CGColor)currentHangTextColorForStatus:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    return *(Class *)((char *)&self->super.isa + qword_10003B0A0[a3]);
  }
  return v3;
}

- (CGColor)previousHangTextColorForStatus:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    return *(Class *)((char *)&self->super.isa + qword_10003B0C0[a3]);
  }
  return v3;
}

- (CGColor)previousHangTextColor
{
  return self->_previousHangTextColor;
}

- (CGColor)currentHangTextColor
{
  return self->_currentHangTextColor;
}

- (CGColor)currentHangSevereTextColor
{
  return self->_currentHangSevereTextColor;
}

- (CGColor)previousHangSevereTextColor
{
  return self->_previousHangSevereTextColor;
}

- (CGColor)currentHangCriticalTextColor
{
  return self->_currentHangCriticalTextColor;
}

- (CGColor)previousHangCriticalTextColor
{
  return self->_previousHangCriticalTextColor;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (CGColor)currentProcessExitTextColor
{
  return self->_currentProcessExitTextColor;
}

- (CGColor)processExitReasonNamespaceTextColor
{
  return self->_processExitReasonNamespaceTextColor;
}

@end