@interface OZFxPlugParameterHandlerUIUpdate
+ (id)updateWithParamID:(int)a3 notificationFlags:(unsigned int)a4;
- (int)paramID;
- (unsigned)notificationFlags;
@end

@implementation OZFxPlugParameterHandlerUIUpdate

+ (id)updateWithParamID:(int)a3 notificationFlags:(unsigned int)a4
{
  v6 = objc_alloc_init(OZFxPlugParameterHandlerUIUpdate);
  v6->_paramID = a3;
  v6->_notificationFlags = a4;
  v7 = v6;
  return v6;
}

- (int)paramID
{
  return self->_paramID;
}

- (unsigned)notificationFlags
{
  return self->_notificationFlags;
}

@end