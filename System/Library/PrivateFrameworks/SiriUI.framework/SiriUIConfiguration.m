@interface SiriUIConfiguration
- (BOOL)allowResizingBetweenModes;
- (BOOL)isSystemHostedPresentation;
- (BOOL)showsSensitiveUI;
- (SiriUIConfiguration)initWithFlamesViewFidelity:(int64_t)a3 isSystemHostedPresentation:(BOOL)a4;
- (SiriUIConfiguration)initWithFlamesViewFidelity:(int64_t)a3 isSystemHostedPresentation:(BOOL)a4 allowResizingBetweenModes:(BOOL)a5 siriViewMode:(int64_t)a6 showsSensitiveUI:(BOOL)a7;
- (id)_NSStringFromSiriViewMode:(int64_t)a3;
- (id)description;
- (int64_t)flamesViewFidelity;
- (int64_t)siriViewMode;
@end

@implementation SiriUIConfiguration

- (SiriUIConfiguration)initWithFlamesViewFidelity:(int64_t)a3 isSystemHostedPresentation:(BOOL)a4
{
  return [(SiriUIConfiguration *)self initWithFlamesViewFidelity:a3 isSystemHostedPresentation:a4 allowResizingBetweenModes:0 siriViewMode:0 showsSensitiveUI:0];
}

- (SiriUIConfiguration)initWithFlamesViewFidelity:(int64_t)a3 isSystemHostedPresentation:(BOOL)a4 allowResizingBetweenModes:(BOOL)a5 siriViewMode:(int64_t)a6 showsSensitiveUI:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SiriUIConfiguration;
  result = [(SiriUIConfiguration *)&v13 init];
  if (result)
  {
    result->_isSystemHostedPresentation = a4;
    result->_flamesViewFidelity = a3;
    result->_siriViewMode = a6;
    result->_allowResizingBetweenModes = a5;
    result->_showsSensitiveUI = a7;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  [(SiriUIConfiguration *)self flamesViewFidelity];
  v4 = NSStringFromBOOL();
  [(SiriUIConfiguration *)self isSystemHostedPresentation];
  v5 = NSStringFromBOOL();
  v6 = [(SiriUIConfiguration *)self _NSStringFromSiriViewMode:[(SiriUIConfiguration *)self siriViewMode]];
  [(SiriUIConfiguration *)self showsSensitiveUI];
  v7 = NSStringFromBOOL();
  v8 = [v3 stringWithFormat:@"<SiriUIConfiguration flamesViewFidelity: %@, isSystemHostedPresentation: %@, siriViewMode: %@, showsSensitiveUI: %@>", v4, v5, v6, v7];

  return v8;
}

- (id)_NSStringFromSiriViewMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) > 4) {
    return @"AFUISiriViewModeNone";
  }
  else {
    return *(&off_26469F928 + a3 - 4);
  }
}

- (int64_t)flamesViewFidelity
{
  return self->_flamesViewFidelity;
}

- (BOOL)isSystemHostedPresentation
{
  return self->_isSystemHostedPresentation;
}

- (BOOL)allowResizingBetweenModes
{
  return self->_allowResizingBetweenModes;
}

- (int64_t)siriViewMode
{
  return self->_siriViewMode;
}

- (BOOL)showsSensitiveUI
{
  return self->_showsSensitiveUI;
}

@end