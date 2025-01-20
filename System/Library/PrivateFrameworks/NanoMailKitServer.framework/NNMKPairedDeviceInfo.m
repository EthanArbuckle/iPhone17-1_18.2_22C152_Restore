@interface NNMKPairedDeviceInfo
+ (id)pairedDeviceInfoWithScreenWidth:(double)a3 screenScale:(double)a4;
- (double)screenScale;
- (double)screenWidth;
- (void)setScreenScale:(double)a3;
- (void)setScreenWidth:(double)a3;
@end

@implementation NNMKPairedDeviceInfo

+ (id)pairedDeviceInfoWithScreenWidth:(double)a3 screenScale:(double)a4
{
  v6 = objc_alloc_init(NNMKPairedDeviceInfo);
  [(NNMKPairedDeviceInfo *)v6 setScreenWidth:a3];
  [(NNMKPairedDeviceInfo *)v6 setScreenScale:a4];
  return v6;
}

- (double)screenWidth
{
  return self->_screenWidth;
}

- (void)setScreenWidth:(double)a3
{
  self->_screenWidth = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

@end