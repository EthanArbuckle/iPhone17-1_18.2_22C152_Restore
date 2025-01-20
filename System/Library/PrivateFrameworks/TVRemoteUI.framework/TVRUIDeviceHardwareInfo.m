@interface TVRUIDeviceHardwareInfo
- (CGPoint)volumeButtonsCenterPoint;
- (CGRect)userIntentButtonRect;
- (CGRect)volumeDownButtonRect;
- (CGRect)volumeUpButtonRect;
- (double)initWithUserIntentButton:(double)a3 volumeUpButton:(double)a4 volumeDownButton:(double)a5 volumeTotalHeight:(double)a6;
- (double)totalHeight;
- (double)volumeTotalHeight;
- (id)description;
- (unsigned)userIntentButtonEdge;
- (unsigned)volumeButtonsEdge;
- (void)setUserIntentButtonRect:(CGRect)a3;
- (void)setVolumeDownButtonRect:(CGRect)a3;
- (void)setVolumeTotalHeight:(double)a3;
- (void)setVolumeUpButtonRect:(CGRect)a3;
@end

@implementation TVRUIDeviceHardwareInfo

- (double)initWithUserIntentButton:(double)a3 volumeUpButton:(double)a4 volumeDownButton:(double)a5 volumeTotalHeight:(double)a6
{
  v30.receiver = a1;
  v30.super_class = (Class)TVRUIDeviceHardwareInfo;
  result = (double *)objc_msgSendSuper2(&v30, sel_init);
  if (result)
  {
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6] = a6;
    result[7] = a7;
    result[8] = a8;
    result[9] = a9;
    *((void *)result + 10) = a17;
    *((void *)result + 11) = a18;
    *((void *)result + 12) = a19;
    *((void *)result + 13) = a20;
    *((void *)result + 1) = a21;
    result[2] = a2;
  }
  return result;
}

- (CGPoint)volumeButtonsCenterPoint
{
  double MaxX = CGRectGetMaxX(self->_volumeDownButtonRect);
  double v4 = (MaxX - CGRectGetMinX(self->_volumeUpButtonRect)) * 0.5;
  double v5 = v4 + CGRectGetMinX(self->_volumeUpButtonRect);
  double MaxY = CGRectGetMaxY(self->_volumeDownButtonRect);
  double v7 = (MaxY - CGRectGetMinY(self->_volumeUpButtonRect)) * 0.5;
  double v8 = v7 + CGRectGetMinY(self->_volumeUpButtonRect);
  double v9 = v5;
  result.y = v8;
  result.x = v9;
  return result;
}

- (double)totalHeight
{
  return self->_volumeTotalHeight;
}

- (unsigned)volumeButtonsEdge
{
  if (CGRectGetWidth(self->_volumeUpButtonRect) <= 0.0) {
    return CGRectGetMinX(self->_volumeUpButtonRect) > 0.0;
  }
  else {
    return 2;
  }
}

- (unsigned)userIntentButtonEdge
{
  if (CGRectGetMinX(self->_userIntentButtonRect) <= 0.0) {
    return 0;
  }
  if (CGRectGetMinY(self->_userIntentButtonRect) <= 0.0) {
    return 1;
  }
  return 2;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  double v4 = BSNSStringFromCGRect();
  [v3 appendString:v4 withName:@"userIntentButtonRect"];

  double v5 = BSNSStringFromCGRect();
  [v3 appendString:v5 withName:@"volumeUpButtonRect"];

  v6 = BSNSStringFromCGRect();
  [v3 appendString:v6 withName:@"volumeDownButtonRect"];

  id v7 = (id)[v3 appendFloat:@"totalVolumeHeight" withName:self->_volumeTotalHeight];
  [(TVRUIDeviceHardwareInfo *)self volumeButtonsCenterPoint];
  id v8 = (id)objc_msgSend(v3, "appendPoint:withName:", @"volumeButtonsCenterPoint");
  double v9 = [v3 build];

  return v9;
}

- (CGRect)userIntentButtonRect
{
  double x = self->_userIntentButtonRect.origin.x;
  double y = self->_userIntentButtonRect.origin.y;
  double width = self->_userIntentButtonRect.size.width;
  double height = self->_userIntentButtonRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUserIntentButtonRect:(CGRect)a3
{
  self->_userIntentButtonRect = a3;
}

- (CGRect)volumeUpButtonRect
{
  double x = self->_volumeUpButtonRect.origin.x;
  double y = self->_volumeUpButtonRect.origin.y;
  double width = self->_volumeUpButtonRect.size.width;
  double height = self->_volumeUpButtonRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVolumeUpButtonRect:(CGRect)a3
{
  self->_volumeUpButtonRect = a3;
}

- (CGRect)volumeDownButtonRect
{
  double x = self->_volumeDownButtonRect.origin.x;
  double y = self->_volumeDownButtonRect.origin.y;
  double width = self->_volumeDownButtonRect.size.width;
  double height = self->_volumeDownButtonRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVolumeDownButtonRect:(CGRect)a3
{
  self->_volumeDownButtonRect = a3;
}

- (double)volumeTotalHeight
{
  return self->_volumeTotalHeight;
}

- (void)setVolumeTotalHeight:(double)a3
{
  self->_volumeTotalHeight = a3;
}

@end