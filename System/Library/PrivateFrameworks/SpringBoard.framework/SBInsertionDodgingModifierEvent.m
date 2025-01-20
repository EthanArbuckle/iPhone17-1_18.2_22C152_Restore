@interface SBInsertionDodgingModifierEvent
- (CGPoint)center;
- (CGSize)size;
- (NSString)identifier;
- (SBInsertionDodgingModifierEvent)initWithIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5;
- (unint64_t)type;
@end

@implementation SBInsertionDodgingModifierEvent

- (SBInsertionDodgingModifierEvent)initWithIdentifier:(id)a3 center:(CGPoint)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBInsertionDodgingModifierEvent;
  v12 = [(SBInsertionDodgingModifierEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v13->_center.CGFloat x = x;
    v13->_center.CGFloat y = y;
    v13->_size.CGFloat width = width;
    v13->_size.CGFloat height = height;
  }

  return v13;
}

- (unint64_t)type
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end