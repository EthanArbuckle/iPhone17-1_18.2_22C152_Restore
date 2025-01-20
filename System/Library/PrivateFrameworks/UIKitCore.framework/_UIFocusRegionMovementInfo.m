@interface _UIFocusRegionMovementInfo
+ (id)_movementWithHeading:(unint64_t)a3 linearHeading:(unint64_t)a4 originatingHeading:(unint64_t)a5 isInitial:(BOOL)a6 inputType:(unint64_t)a7;
- (unint64_t)originatingHeading;
- (void)setOriginatingHeading:(unint64_t)a3;
@end

@implementation _UIFocusRegionMovementInfo

+ (id)_movementWithHeading:(unint64_t)a3 linearHeading:(unint64_t)a4 originatingHeading:(unint64_t)a5 isInitial:(BOOL)a6 inputType:(unint64_t)a7
{
  v8 = (void *)[objc_alloc((Class)a1) initWithHeading:a3 linearHeading:a4 isInitial:a6 shouldLoadScrollableContainer:1 looping:0 groupFilter:0 inputType:a7];
  [v8 setOriginatingHeading:a5];
  return v8;
}

- (unint64_t)originatingHeading
{
  return self->_originatingHeading;
}

- (void)setOriginatingHeading:(unint64_t)a3
{
  self->_originatingHeading = a3;
}

@end