@interface NTKAnalogUtilities
+ (CGSize)dialSizeForDevice:(id)a3;
+ (CGSize)largeDialSizeForDevice:(id)a3;
+ (CGSize)sceneSizeForDevice:(id)a3;
+ (double)dialDiameterForDevice:(id)a3;
+ (double)dialDiameterForDevice:(id)a3 withRounding:(unint64_t)a4;
+ (double)largeDialDiameterForDevice:(id)a3;
+ (double)whistlerMediumDialDiameterForDevice:(id)a3;
@end

@implementation NTKAnalogUtilities

+ (CGSize)sceneSizeForDevice:(id)a3
{
  MEMORY[0x1F40D5FB8](a3, a2);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)dialSizeForDevice:(id)a3
{
  +[NTKAnalogUtilities dialDiameterForDevice:a3];
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)dialDiameterForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dialDiameterForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&dialDiameterForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&dialDiameterForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&dialDiameterForDevice____cachedDevice, v3);
    dialDiameterForDevice____previousCLKDeviceVersion = [v3 version];

    +[NTKAnalogUtilities dialDiameterForDevice:v3 withRounding:2];
    dialDiameterForDevice___dialDiameter = v10;
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = dialDiameterForDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&dialDiameterForDevice____lock);
  double v11 = *(double *)&dialDiameterForDevice___dialDiameter;

  return v11;
}

+ (double)dialDiameterForDevice:(id)a3 withRounding:(unint64_t)a4
{
  MEMORY[0x1F40D5E10](a3, a4);
  return result;
}

+ (CGSize)largeDialSizeForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&largeDialSizeForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&largeDialSizeForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&largeDialSizeForDevice____cachedDevice);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&largeDialSizeForDevice____cachedDevice, v4);
    largeDialSizeForDevice____previousCLKDeviceVersion = [v4 version];

    [a1 largeDialDiameterForDevice:v4];
    largeDialSizeForDevice___largeDialSize_0 = v11;
    largeDialSizeForDevice___largeDialSize_1 = v11;
    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = largeDialSizeForDevice____previousCLKDeviceVersion;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&largeDialSizeForDevice____lock);
  uint64_t v12 = largeDialSizeForDevice___largeDialSize_0;
  uint64_t v13 = largeDialSizeForDevice___largeDialSize_1;

  double v14 = *(double *)&v12;
  double v15 = *(double *)&v13;
  result.height = v15;
  result.width = v14;
  return result;
}

uint64_t __45__NTKAnalogUtilities_largeDialSizeForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) largeDialDiameterForDevice:a2];
  largeDialSizeForDevice___largeDialSize_0 = v3;
  largeDialSizeForDevice___largeDialSize_1 = v3;
  return result;
}

+ (double)largeDialDiameterForDevice:(id)a3
{
  MEMORY[0x1F40D5EE0](a3, a2);
  return result;
}

+ (double)whistlerMediumDialDiameterForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&whistlerMediumDialDiameterForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&whistlerMediumDialDiameterForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&whistlerMediumDialDiameterForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&whistlerMediumDialDiameterForDevice____cachedDevice, v3);
    whistlerMediumDialDiameterForDevice____previousCLKDeviceVersion = [v3 version];

    __58__NTKAnalogUtilities_whistlerMediumDialDiameterForDevice___block_invoke(v10, (uint64_t)v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = whistlerMediumDialDiameterForDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&whistlerMediumDialDiameterForDevice____lock);
  double v11 = *(double *)&whistlerMediumDialDiameterForDevice____mediumDiameter;

  return v11;
}

void __58__NTKAnalogUtilities_whistlerMediumDialDiameterForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v3 setRoundingBehavior:2];
  [v3 scaledValue:3 withOverride:107.0 forSizeClass:120.0];
  whistlerMediumDialDiameterForDevice____mediumDiameter = v2;
}

@end