@interface BKTouchPadInfo
- (BKHIDEventDispatcher)eventDispatcher;
- (BKHIDEventSenderInfo)senderInfo;
- (BKSHIDEventSenderDescriptor)overrideSenderDescriptor;
- (BKTouchPadInfo)initWithService:(id)a3;
- (CGSize)digitizerSurfaceDimensions;
- (NSSet)currentDestinations;
- (float)maxForce;
- (id)description;
- (unsigned)pathIndexInRangeMask;
- (unsigned)pathIndexTouchingMask;
- (void)resetForCancel;
- (void)setCurrentDestinations:(id)a3;
- (void)setDigitizerSurfaceDimensions:(CGSize)a3;
- (void)setEventDispatcher:(id)a3;
- (void)setMaxForce:(float)a3;
- (void)setOverrideSenderDescriptor:(id)a3;
- (void)setPathIndexInRangeMask:(unsigned int)a3;
- (void)setPathIndexTouchingMask:(unsigned int)a3;
- (void)setSenderInfo:(id)a3;
@end

@implementation BKTouchPadInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDestinations, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_overrideSenderDescriptor, 0);

  objc_storeStrong((id *)&self->_senderInfo, 0);
}

- (void)setDigitizerSurfaceDimensions:(CGSize)a3
{
  self->_digitizerSurfaceDimensions = a3;
}

- (CGSize)digitizerSurfaceDimensions
{
  double width = self->_digitizerSurfaceDimensions.width;
  double height = self->_digitizerSurfaceDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxForce:(float)a3
{
  self->_maxForce = a3;
}

- (float)maxForce
{
  return self->_maxForce;
}

- (void)setPathIndexTouchingMask:(unsigned int)a3
{
  self->_pathIndexTouchingMask = a3;
}

- (unsigned)pathIndexTouchingMask
{
  return self->_pathIndexTouchingMask;
}

- (void)setPathIndexInRangeMask:(unsigned int)a3
{
  self->_pathIndexInRangeMask = a3;
}

- (unsigned)pathIndexInRangeMask
{
  return self->_pathIndexInRangeMask;
}

- (void)setCurrentDestinations:(id)a3
{
}

- (NSSet)currentDestinations
{
  return self->_currentDestinations;
}

- (void)setEventDispatcher:(id)a3
{
}

- (BKHIDEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setOverrideSenderDescriptor:(id)a3
{
}

- (BKSHIDEventSenderDescriptor)overrideSenderDescriptor
{
  return self->_overrideSenderDescriptor;
}

- (void)setSenderInfo:(id)a3
{
}

- (BKHIDEventSenderInfo)senderInfo
{
  return self->_senderInfo;
}

- (void)resetForCancel
{
  currentDestinations = self->_currentDestinations;
  self->_currentDestinations = 0;

  eventDispatcher = self->_eventDispatcher;
  self->_eventDispatcher = 0;

  *(void *)&self->_pathIndexInRangeMask = 0;
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendInteger:self->_pathIndexInRangeMask withName:@"pathIndexInRangeMask"];
  id v5 = [v3 appendInteger:self->_pathIndexTouchingMask withName:@"pathIndexTouchingMask"];
  v6 = +[NSString stringWithFormat:@"%g", self->_maxForce];
  [v3 appendString:v6 withName:@"maxForce"];

  id v7 = [v3 appendObject:self->_currentDestinations withName:@"currentDestinations"];
  id v8 = [v3 appendObject:self->_senderInfo withName:@"senderInfo"];
  id v9 = [v3 appendObject:self->_overrideSenderDescriptor withName:@"overrideSenderDescriptor" skipIfNil:1];
  id v10 = [v3 appendObject:self->_eventDispatcher withName:@"dispatcher"];
  v11 = [v3 build];

  return v11;
}

- (BKTouchPadInfo)initWithService:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BKTouchPadInfo;
  v6 = [(BKTouchPadInfo *)&v24 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_senderInfo, a3);
    id v8 = [v5 propertyOfClass:objc_opt_class() forKey:@"SurfaceDimensions"];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 objectForKeyedSubscript:@"Width"];
      uint64_t v11 = objc_opt_class();
      id v12 = v10;
      if (v11)
      {
        if (objc_opt_isKindOfClass()) {
          v13 = v12;
        }
        else {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
      }
      id v14 = v13;

      v15 = [v9 objectForKeyedSubscript:@"Height"];
      uint64_t v16 = objc_opt_class();
      id v17 = v15;
      if (v16)
      {
        if (objc_opt_isKindOfClass()) {
          v18 = v17;
        }
        else {
          v18 = 0;
        }
      }
      else
      {
        v18 = 0;
      }
      id v19 = v18;

      v7->_digitizerSurfaceDimensions.double width = (double)(uint64_t)[v14 integerValue] * 0.0000152587891;
      id v20 = [v19 integerValue];

      v7->_digitizerSurfaceDimensions.double height = (double)(uint64_t)v20 * 0.0000152587891;
    }
    v21 = [v5 propertyOfClass:objc_opt_class() forKey:@"AccurateMaxDigitizerPressureValue"];
    [v21 floatValue];
    v7->_maxForce = v22;
  }
  return v7;
}

@end