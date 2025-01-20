@interface AWDPowerDisplayBacklightMetrics
+ (Class)backlightBucketType;
- (BOOL)hasAlsAutoBrightnessChangeCount;
- (BOOL)hasAlsAutoBrightnessCurveE0A;
- (BOOL)hasAlsAutoBrightnessCurveE0B;
- (BOOL)hasAlsAutoBrightnessCurveE1;
- (BOOL)hasAlsAutoBrightnessCurveE2;
- (BOOL)hasAlsAutoBrightnessCurveEdynth;
- (BOOL)hasAlsAutoBrightnessCurveL0A;
- (BOOL)hasAlsAutoBrightnessCurveL0B;
- (BOOL)hasAlsAutoBrightnessCurveL1;
- (BOOL)hasAlsAutoBrightnessCurveL2;
- (BOOL)hasAlsAutoBrightnessLux;
- (BOOL)hasAlsAutoBrightnessSlider;
- (BOOL)hasAlsBrightnessEnableCnt;
- (BOOL)hasDispOnCount;
- (BOOL)hasDisplayIdlePercentage;
- (BOOL)hasFrameRateResidencyPercentage;
- (BOOL)hasMieCount;
- (BOOL)hasMieDuration;
- (BOOL)hasPluggedDisplayOnDuration;
- (BOOL)hasResidencyPercentage30Hz;
- (BOOL)hasResidencyPercentage60Hz;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalBacklightPower;
- (BOOL)hasTotalDisplayPower;
- (BOOL)hasUnpluggedDisplayOnDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)backlightBuckets;
- (id)backlightBucketAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)alsAutoBrightnessCurveE0A;
- (int)alsAutoBrightnessCurveE0B;
- (int)alsAutoBrightnessCurveE1;
- (int)alsAutoBrightnessCurveE2;
- (int)alsAutoBrightnessCurveEdynth;
- (int)alsAutoBrightnessCurveL0A;
- (int)alsAutoBrightnessCurveL0B;
- (int)alsAutoBrightnessCurveL1;
- (int)alsAutoBrightnessCurveL2;
- (unint64_t)backlightBucketsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)alsAutoBrightnessChangeCount;
- (unsigned)alsAutoBrightnessLux;
- (unsigned)alsAutoBrightnessSlider;
- (unsigned)alsBrightnessEnableCnt;
- (unsigned)dispOnCount;
- (unsigned)displayIdlePercentage;
- (unsigned)frameRateResidencyPercentage;
- (unsigned)mieCount;
- (unsigned)mieDuration;
- (unsigned)pluggedDisplayOnDuration;
- (unsigned)residencyPercentage30Hz;
- (unsigned)residencyPercentage60Hz;
- (unsigned)totalBacklightPower;
- (unsigned)totalDisplayPower;
- (unsigned)unpluggedDisplayOnDuration;
- (void)addBacklightBucket:(id)a3;
- (void)clearBacklightBuckets;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAlsAutoBrightnessChangeCount:(unsigned int)a3;
- (void)setAlsAutoBrightnessCurveE0A:(int)a3;
- (void)setAlsAutoBrightnessCurveE0B:(int)a3;
- (void)setAlsAutoBrightnessCurveE1:(int)a3;
- (void)setAlsAutoBrightnessCurveE2:(int)a3;
- (void)setAlsAutoBrightnessCurveEdynth:(int)a3;
- (void)setAlsAutoBrightnessCurveL0A:(int)a3;
- (void)setAlsAutoBrightnessCurveL0B:(int)a3;
- (void)setAlsAutoBrightnessCurveL1:(int)a3;
- (void)setAlsAutoBrightnessCurveL2:(int)a3;
- (void)setAlsAutoBrightnessLux:(unsigned int)a3;
- (void)setAlsAutoBrightnessSlider:(unsigned int)a3;
- (void)setAlsBrightnessEnableCnt:(unsigned int)a3;
- (void)setBacklightBuckets:(id)a3;
- (void)setDispOnCount:(unsigned int)a3;
- (void)setDisplayIdlePercentage:(unsigned int)a3;
- (void)setFrameRateResidencyPercentage:(unsigned int)a3;
- (void)setHasAlsAutoBrightnessChangeCount:(BOOL)a3;
- (void)setHasAlsAutoBrightnessCurveE0A:(BOOL)a3;
- (void)setHasAlsAutoBrightnessCurveE0B:(BOOL)a3;
- (void)setHasAlsAutoBrightnessCurveE1:(BOOL)a3;
- (void)setHasAlsAutoBrightnessCurveE2:(BOOL)a3;
- (void)setHasAlsAutoBrightnessCurveEdynth:(BOOL)a3;
- (void)setHasAlsAutoBrightnessCurveL0A:(BOOL)a3;
- (void)setHasAlsAutoBrightnessCurveL0B:(BOOL)a3;
- (void)setHasAlsAutoBrightnessCurveL1:(BOOL)a3;
- (void)setHasAlsAutoBrightnessCurveL2:(BOOL)a3;
- (void)setHasAlsAutoBrightnessLux:(BOOL)a3;
- (void)setHasAlsAutoBrightnessSlider:(BOOL)a3;
- (void)setHasAlsBrightnessEnableCnt:(BOOL)a3;
- (void)setHasDispOnCount:(BOOL)a3;
- (void)setHasDisplayIdlePercentage:(BOOL)a3;
- (void)setHasFrameRateResidencyPercentage:(BOOL)a3;
- (void)setHasMieCount:(BOOL)a3;
- (void)setHasMieDuration:(BOOL)a3;
- (void)setHasPluggedDisplayOnDuration:(BOOL)a3;
- (void)setHasResidencyPercentage30Hz:(BOOL)a3;
- (void)setHasResidencyPercentage60Hz:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalBacklightPower:(BOOL)a3;
- (void)setHasTotalDisplayPower:(BOOL)a3;
- (void)setHasUnpluggedDisplayOnDuration:(BOOL)a3;
- (void)setMieCount:(unsigned int)a3;
- (void)setMieDuration:(unsigned int)a3;
- (void)setPluggedDisplayOnDuration:(unsigned int)a3;
- (void)setResidencyPercentage30Hz:(unsigned int)a3;
- (void)setResidencyPercentage60Hz:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalBacklightPower:(unsigned int)a3;
- (void)setTotalDisplayPower:(unsigned int)a3;
- (void)setUnpluggedDisplayOnDuration:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerDisplayBacklightMetrics

- (void)dealloc
{
  [(AWDPowerDisplayBacklightMetrics *)self setBacklightBuckets:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerDisplayBacklightMetrics;
  [(AWDPowerDisplayBacklightMetrics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDispOnCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_dispOnCount = a3;
}

- (void)setHasDispOnCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDispOnCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setUnpluggedDisplayOnDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_unpluggedDisplayOnDuration = a3;
}

- (void)setHasUnpluggedDisplayOnDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasUnpluggedDisplayOnDuration
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setPluggedDisplayOnDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_pluggedDisplayOnDuration = a3;
}

- (void)setHasPluggedDisplayOnDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPluggedDisplayOnDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMieDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_mieDuration = a3;
}

- (void)setHasMieDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasMieDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMieCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_mieCount = a3;
}

- (void)setHasMieCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMieCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDisplayIdlePercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_displayIdlePercentage = a3;
}

- (void)setHasDisplayIdlePercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasDisplayIdlePercentage
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setAlsAutoBrightnessCurveE1:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_alsAutoBrightnessCurveE1 = a3;
}

- (void)setHasAlsAutoBrightnessCurveE1:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveE1
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAlsAutoBrightnessCurveL1:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_alsAutoBrightnessCurveL1 = a3;
}

- (void)setHasAlsAutoBrightnessCurveL1:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveL1
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAlsAutoBrightnessCurveE2:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_alsAutoBrightnessCurveE2 = a3;
}

- (void)setHasAlsAutoBrightnessCurveE2:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveE2
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAlsAutoBrightnessCurveL2:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_alsAutoBrightnessCurveL2 = a3;
}

- (void)setHasAlsAutoBrightnessCurveL2:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveL2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAlsAutoBrightnessCurveE0A:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_alsAutoBrightnessCurveE0A = a3;
}

- (void)setHasAlsAutoBrightnessCurveE0A:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveE0A
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAlsAutoBrightnessCurveL0A:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_alsAutoBrightnessCurveL0A = a3;
}

- (void)setHasAlsAutoBrightnessCurveL0A:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveL0A
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setAlsAutoBrightnessCurveE0B:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_alsAutoBrightnessCurveE0B = a3;
}

- (void)setHasAlsAutoBrightnessCurveE0B:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveE0B
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAlsAutoBrightnessCurveL0B:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_alsAutoBrightnessCurveL0B = a3;
}

- (void)setHasAlsAutoBrightnessCurveL0B:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveL0B
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setAlsAutoBrightnessCurveEdynth:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_alsAutoBrightnessCurveEdynth = a3;
}

- (void)setHasAlsAutoBrightnessCurveEdynth:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasAlsAutoBrightnessCurveEdynth
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAlsAutoBrightnessSlider:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_alsAutoBrightnessSlider = a3;
}

- (void)setHasAlsAutoBrightnessSlider:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasAlsAutoBrightnessSlider
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setAlsAutoBrightnessLux:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_alsAutoBrightnessLux = a3;
}

- (void)setHasAlsAutoBrightnessLux:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasAlsAutoBrightnessLux
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setAlsAutoBrightnessChangeCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_alsAutoBrightnessChangeCount = a3;
}

- (void)setHasAlsAutoBrightnessChangeCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAlsAutoBrightnessChangeCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAlsBrightnessEnableCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_alsBrightnessEnableCnt = a3;
}

- (void)setHasAlsBrightnessEnableCnt:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAlsBrightnessEnableCnt
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)clearBacklightBuckets
{
}

- (void)addBacklightBucket:(id)a3
{
  backlightBuckets = self->_backlightBuckets;
  if (!backlightBuckets)
  {
    backlightBuckets = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_backlightBuckets = backlightBuckets;
  }

  [(NSMutableArray *)backlightBuckets addObject:a3];
}

- (unint64_t)backlightBucketsCount
{
  return [(NSMutableArray *)self->_backlightBuckets count];
}

- (id)backlightBucketAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_backlightBuckets objectAtIndex:a3];
}

+ (Class)backlightBucketType
{
  return (Class)objc_opt_class();
}

- (void)setTotalDisplayPower:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_totalDisplayPower = a3;
}

- (void)setHasTotalDisplayPower:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTotalDisplayPower
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTotalBacklightPower:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_totalBacklightPower = a3;
}

- (void)setHasTotalBacklightPower:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasTotalBacklightPower
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setFrameRateResidencyPercentage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_frameRateResidencyPercentage = a3;
}

- (void)setHasFrameRateResidencyPercentage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasFrameRateResidencyPercentage
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setResidencyPercentage60Hz:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_residencyPercentage60Hz = a3;
}

- (void)setHasResidencyPercentage60Hz:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasResidencyPercentage60Hz
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setResidencyPercentage30Hz:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_residencyPercentage30Hz = a3;
}

- (void)setHasResidencyPercentage30Hz:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EC00CED6B89AAAA41342C8FA2F6D9061)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasResidencyPercentage30Hz
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerDisplayBacklightMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerDisplayBacklightMetrics description](&v3, sel_description), -[AWDPowerDisplayBacklightMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if (*(unsigned char *)&has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dispOnCount] forKey:@"dispOnCount"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_unpluggedDisplayOnDuration] forKey:@"unpluggedDisplayOnDuration"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pluggedDisplayOnDuration] forKey:@"pluggedDisplayOnDuration"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_mieDuration] forKey:@"mieDuration"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_mieCount] forKey:@"mieCount"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_displayIdlePercentage] forKey:@"displayIdlePercentage"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithInt:self->_alsAutoBrightnessCurveE1] forKey:@"alsAutoBrightnessCurveE1"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithInt:self->_alsAutoBrightnessCurveL1] forKey:@"alsAutoBrightnessCurveL1"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithInt:self->_alsAutoBrightnessCurveE2] forKey:@"alsAutoBrightnessCurveE2"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithInt:self->_alsAutoBrightnessCurveL2] forKey:@"alsAutoBrightnessCurveL2"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithInt:self->_alsAutoBrightnessCurveE0A] forKey:@"alsAutoBrightnessCurveE0A"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithInt:self->_alsAutoBrightnessCurveL0A] forKey:@"alsAutoBrightnessCurveL0A"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithInt:self->_alsAutoBrightnessCurveE0B] forKey:@"alsAutoBrightnessCurveE0B"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithInt:self->_alsAutoBrightnessCurveL0B] forKey:@"alsAutoBrightnessCurveL0B"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithInt:self->_alsAutoBrightnessCurveEdynth] forKey:@"alsAutoBrightnessCurveEdynth"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_alsAutoBrightnessSlider] forKey:@"alsAutoBrightnessSlider"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_alsAutoBrightnessLux] forKey:@"alsAutoBrightnessLux"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_alsAutoBrightnessChangeCount] forKey:@"alsAutoBrightnessChangeCount"];
  if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
LABEL_21:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_alsBrightnessEnableCnt] forKey:@"alsBrightnessEnableCnt"];
LABEL_22:
  if ([(NSMutableArray *)self->_backlightBuckets count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_backlightBuckets, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    backlightBuckets = self->_backlightBuckets;
    uint64_t v7 = [(NSMutableArray *)backlightBuckets countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(backlightBuckets);
          }
          [v5 addObject:[(*(id *)(*((void *)&v13 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)backlightBuckets countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"backlightBucket"];
  }
  $EC00CED6B89AAAA41342C8FA2F6D9061 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalDisplayPower] forKey:@"totalDisplayPower"];
    $EC00CED6B89AAAA41342C8FA2F6D9061 v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x400000) == 0)
    {
LABEL_33:
      if ((*(_DWORD *)&v11 & 0x10000) == 0) {
        goto LABEL_34;
      }
      goto LABEL_60;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x400000) == 0)
  {
    goto LABEL_33;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalBacklightPower] forKey:@"totalBacklightPower"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v11 & 0x200000) == 0) {
      goto LABEL_35;
    }
LABEL_61:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_residencyPercentage60Hz] forKey:@"residencyPercentage60Hz"];
    if ((*(_DWORD *)&self->_has & 0x100000) == 0) {
      return v3;
    }
    goto LABEL_36;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_frameRateResidencyPercentage] forKey:@"frameRateResidencyPercentage"];
  $EC00CED6B89AAAA41342C8FA2F6D9061 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x200000) != 0) {
    goto LABEL_61;
  }
LABEL_35:
  if ((*(_DWORD *)&v11 & 0x100000) != 0) {
LABEL_36:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_residencyPercentage30Hz] forKey:@"residencyPercentage30Hz"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerDisplayBacklightMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
LABEL_21:
  }
    PBDataWriterWriteUint32Field();
LABEL_22:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  backlightBuckets = self->_backlightBuckets;
  uint64_t v6 = [(NSMutableArray *)backlightBuckets countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(backlightBuckets);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)backlightBuckets countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  $EC00CED6B89AAAA41342C8FA2F6D9061 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x800000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $EC00CED6B89AAAA41342C8FA2F6D9061 v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x400000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v10 & 0x10000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x400000) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v10 & 0x200000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $EC00CED6B89AAAA41342C8FA2F6D9061 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v10 & 0x100000) == 0) {
      return;
    }
    goto LABEL_34;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x100000) == 0) {
    return;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 31) |= 1u;
    $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 20) = self->_dispOnCount;
  *((_DWORD *)a3 + 31) |= 0x4000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 30) = self->_unpluggedDisplayOnDuration;
  *((_DWORD *)a3 + 31) |= 0x1000000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 25) = self->_pluggedDisplayOnDuration;
  *((_DWORD *)a3 + 31) |= 0x80000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 24) = self->_mieDuration;
  *((_DWORD *)a3 + 31) |= 0x40000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 23) = self->_mieCount;
  *((_DWORD *)a3 + 31) |= 0x20000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 21) = self->_displayIdlePercentage;
  *((_DWORD *)a3 + 31) |= 0x8000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 7) = self->_alsAutoBrightnessCurveE1;
  *((_DWORD *)a3 + 31) |= 0x10u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 12) = self->_alsAutoBrightnessCurveL1;
  *((_DWORD *)a3 + 31) |= 0x200u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 8) = self->_alsAutoBrightnessCurveE2;
  *((_DWORD *)a3 + 31) |= 0x20u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 13) = self->_alsAutoBrightnessCurveL2;
  *((_DWORD *)a3 + 31) |= 0x400u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 5) = self->_alsAutoBrightnessCurveE0A;
  *((_DWORD *)a3 + 31) |= 4u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 10) = self->_alsAutoBrightnessCurveL0A;
  *((_DWORD *)a3 + 31) |= 0x80u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 6) = self->_alsAutoBrightnessCurveE0B;
  *((_DWORD *)a3 + 31) |= 8u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 11) = self->_alsAutoBrightnessCurveL0B;
  *((_DWORD *)a3 + 31) |= 0x100u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 9) = self->_alsAutoBrightnessCurveEdynth;
  *((_DWORD *)a3 + 31) |= 0x40u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 15) = self->_alsAutoBrightnessSlider;
  *((_DWORD *)a3 + 31) |= 0x1000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_20;
    }
LABEL_51:
    *((_DWORD *)a3 + 4) = self->_alsAutoBrightnessChangeCount;
    *((_DWORD *)a3 + 31) |= 2u;
    if ((*(_DWORD *)&self->_has & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_50:
  *((_DWORD *)a3 + 14) = self->_alsAutoBrightnessLux;
  *((_DWORD *)a3 + 31) |= 0x800u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0) {
    goto LABEL_51;
  }
LABEL_20:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_21:
    *((_DWORD *)a3 + 16) = self->_alsBrightnessEnableCnt;
    *((_DWORD *)a3 + 31) |= 0x2000u;
  }
LABEL_22:
  if ([(AWDPowerDisplayBacklightMetrics *)self backlightBucketsCount])
  {
    [a3 clearBacklightBuckets];
    unint64_t v6 = [(AWDPowerDisplayBacklightMetrics *)self backlightBucketsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addBacklightBucket:-[AWDPowerDisplayBacklightMetrics backlightBucketAtIndex:](self, "backlightBucketAtIndex:", i)];
    }
  }
  $EC00CED6B89AAAA41342C8FA2F6D9061 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    *((_DWORD *)a3 + 29) = self->_totalDisplayPower;
    *((_DWORD *)a3 + 31) |= 0x800000u;
    $EC00CED6B89AAAA41342C8FA2F6D9061 v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
    {
LABEL_28:
      if ((*(_DWORD *)&v9 & 0x10000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
    goto LABEL_28;
  }
  *((_DWORD *)a3 + 28) = self->_totalBacklightPower;
  *((_DWORD *)a3 + 31) |= 0x400000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x200000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 22) = self->_frameRateResidencyPercentage;
  *((_DWORD *)a3 + 31) |= 0x10000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v9 & 0x100000) == 0) {
      return;
    }
    goto LABEL_31;
  }
LABEL_56:
  *((_DWORD *)a3 + 27) = self->_residencyPercentage60Hz;
  *((_DWORD *)a3 + 31) |= 0x200000u;
  if ((*(_DWORD *)&self->_has & 0x100000) == 0) {
    return;
  }
LABEL_31:
  *((_DWORD *)a3 + 26) = self->_residencyPercentage30Hz;
  *((_DWORD *)a3 + 31) |= 0x100000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (_DWORD *)v5;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 124) |= 1u;
    $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 80) = self->_dispOnCount;
  *(_DWORD *)(v5 + 124) |= 0x4000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 120) = self->_unpluggedDisplayOnDuration;
  *(_DWORD *)(v5 + 124) |= 0x1000000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 100) = self->_pluggedDisplayOnDuration;
  *(_DWORD *)(v5 + 124) |= 0x80000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 96) = self->_mieDuration;
  *(_DWORD *)(v5 + 124) |= 0x40000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 92) = self->_mieCount;
  *(_DWORD *)(v5 + 124) |= 0x20000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 84) = self->_displayIdlePercentage;
  *(_DWORD *)(v5 + 124) |= 0x8000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 28) = self->_alsAutoBrightnessCurveE1;
  *(_DWORD *)(v5 + 124) |= 0x10u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 48) = self->_alsAutoBrightnessCurveL1;
  *(_DWORD *)(v5 + 124) |= 0x200u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v5 + 32) = self->_alsAutoBrightnessCurveE2;
  *(_DWORD *)(v5 + 124) |= 0x20u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 52) = self->_alsAutoBrightnessCurveL2;
  *(_DWORD *)(v5 + 124) |= 0x400u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v5 + 20) = self->_alsAutoBrightnessCurveE0A;
  *(_DWORD *)(v5 + 124) |= 4u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 40) = self->_alsAutoBrightnessCurveL0A;
  *(_DWORD *)(v5 + 124) |= 0x80u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 24) = self->_alsAutoBrightnessCurveE0B;
  *(_DWORD *)(v5 + 124) |= 8u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 44) = self->_alsAutoBrightnessCurveL0B;
  *(_DWORD *)(v5 + 124) |= 0x100u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 36) = self->_alsAutoBrightnessCurveEdynth;
  *(_DWORD *)(v5 + 124) |= 0x40u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v5 + 60) = self->_alsAutoBrightnessSlider;
  *(_DWORD *)(v5 + 124) |= 0x1000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 56) = self->_alsAutoBrightnessLux;
  *(_DWORD *)(v5 + 124) |= 0x800u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_54:
  *(_DWORD *)(v5 + 16) = self->_alsAutoBrightnessChangeCount;
  *(_DWORD *)(v5 + 124) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_21:
    *(_DWORD *)(v5 + 64) = self->_alsBrightnessEnableCnt;
    *(_DWORD *)(v5 + 124) |= 0x2000u;
  }
LABEL_22:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  backlightBuckets = self->_backlightBuckets;
  uint64_t v9 = [(NSMutableArray *)backlightBuckets countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(backlightBuckets);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [v6 addBacklightBucket:v13];
      }
      uint64_t v10 = [(NSMutableArray *)backlightBuckets countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  $EC00CED6B89AAAA41342C8FA2F6D9061 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    v6[29] = self->_totalDisplayPower;
    v6[31] |= 0x800000u;
    $EC00CED6B89AAAA41342C8FA2F6D9061 v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x400000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v14 & 0x10000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
    goto LABEL_31;
  }
  v6[28] = self->_totalBacklightPower;
  v6[31] |= 0x400000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v14 & 0x200000) == 0) {
      goto LABEL_33;
    }
LABEL_59:
    v6[27] = self->_residencyPercentage60Hz;
    v6[31] |= 0x200000u;
    if ((*(_DWORD *)&self->_has & 0x100000) == 0) {
      return v6;
    }
    goto LABEL_34;
  }
LABEL_58:
  v6[22] = self->_frameRateResidencyPercentage;
  v6[31] |= 0x10000u;
  $EC00CED6B89AAAA41342C8FA2F6D9061 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x200000) != 0) {
    goto LABEL_59;
  }
LABEL_33:
  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
LABEL_34:
    v6[26] = self->_residencyPercentage30Hz;
    v6[31] |= 0x100000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
    int v7 = *((_DWORD *)a3 + 31);
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_129;
      }
    }
    else if (v7)
    {
LABEL_129:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_dispOnCount != *((_DWORD *)a3 + 20)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_unpluggedDisplayOnDuration != *((_DWORD *)a3 + 30)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_pluggedDisplayOnDuration != *((_DWORD *)a3 + 25)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_mieDuration != *((_DWORD *)a3 + 24)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_mieCount != *((_DWORD *)a3 + 23)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_displayIdlePercentage != *((_DWORD *)a3 + 21)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_alsAutoBrightnessCurveE1 != *((_DWORD *)a3 + 7)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_alsAutoBrightnessCurveL1 != *((_DWORD *)a3 + 12)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_129;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_alsAutoBrightnessCurveE2 != *((_DWORD *)a3 + 8)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_alsAutoBrightnessCurveL2 != *((_DWORD *)a3 + 13)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_129;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_alsAutoBrightnessCurveE0A != *((_DWORD *)a3 + 5)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_129;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_alsAutoBrightnessCurveL0A != *((_DWORD *)a3 + 10)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_129;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_alsAutoBrightnessCurveE0B != *((_DWORD *)a3 + 6)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_alsAutoBrightnessCurveL0B != *((_DWORD *)a3 + 11)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_129;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_alsAutoBrightnessCurveEdynth != *((_DWORD *)a3 + 9)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_alsAutoBrightnessSlider != *((_DWORD *)a3 + 15)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_alsAutoBrightnessLux != *((_DWORD *)a3 + 14)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_129;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_alsAutoBrightnessChangeCount != *((_DWORD *)a3 + 4)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_alsBrightnessEnableCnt != *((_DWORD *)a3 + 16)) {
        goto LABEL_129;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_129;
    }
    backlightBuckets = self->_backlightBuckets;
    if ((unint64_t)backlightBuckets | *((void *)a3 + 9))
    {
      int v5 = -[NSMutableArray isEqual:](backlightBuckets, "isEqual:");
      if (!v5) {
        return v5;
      }
      $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
    }
    int v9 = *((_DWORD *)a3 + 31);
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v9 & 0x800000) == 0 || self->_totalDisplayPower != *((_DWORD *)a3 + 29)) {
        goto LABEL_129;
      }
    }
    else if ((v9 & 0x800000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v9 & 0x400000) == 0 || self->_totalBacklightPower != *((_DWORD *)a3 + 28)) {
        goto LABEL_129;
      }
    }
    else if ((v9 & 0x400000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v9 & 0x10000) == 0 || self->_frameRateResidencyPercentage != *((_DWORD *)a3 + 22)) {
        goto LABEL_129;
      }
    }
    else if ((v9 & 0x10000) != 0)
    {
      goto LABEL_129;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v9 & 0x200000) == 0 || self->_residencyPercentage60Hz != *((_DWORD *)a3 + 27)) {
        goto LABEL_129;
      }
    }
    else if ((v9 & 0x200000) != 0)
    {
      goto LABEL_129;
    }
    LOBYTE(v5) = (v9 & 0x100000) == 0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v9 & 0x100000) == 0 || self->_residencyPercentage30Hz != *((_DWORD *)a3 + 26)) {
        goto LABEL_129;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $EC00CED6B89AAAA41342C8FA2F6D9061 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v31 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      uint64_t v30 = 2654435761 * self->_dispOnCount;
      if ((*(_DWORD *)&has & 0x1000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else
  {
    unint64_t v31 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_4:
    uint64_t v29 = 2654435761 * self->_unpluggedDisplayOnDuration;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v29 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_5:
    uint64_t v28 = 2654435761 * self->_pluggedDisplayOnDuration;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_6:
    uint64_t v27 = 2654435761 * self->_mieDuration;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_7:
    uint64_t v26 = 2654435761 * self->_mieCount;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v26 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    uint64_t v25 = 2654435761 * self->_displayIdlePercentage;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v25 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_9:
    uint64_t v24 = 2654435761 * self->_alsAutoBrightnessCurveE1;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v23 = 2654435761 * self->_alsAutoBrightnessCurveL1;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v23 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_11:
    uint64_t v22 = 2654435761 * self->_alsAutoBrightnessCurveE2;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v21 = 2654435761 * self->_alsAutoBrightnessCurveL2;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_13:
    uint64_t v20 = 2654435761 * self->_alsAutoBrightnessCurveE0A;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_14:
    uint64_t v19 = 2654435761 * self->_alsAutoBrightnessCurveL0A;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v19 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_15:
    uint64_t v4 = 2654435761 * self->_alsAutoBrightnessCurveE0B;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_16:
    uint64_t v5 = 2654435761 * self->_alsAutoBrightnessCurveL0B;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_17:
    uint64_t v6 = 2654435761 * self->_alsAutoBrightnessCurveEdynth;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    uint64_t v7 = 2654435761 * self->_alsAutoBrightnessSlider;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v7 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_19:
    uint64_t v8 = 2654435761 * self->_alsAutoBrightnessLux;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_20;
    }
LABEL_40:
    uint64_t v9 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_41;
  }
LABEL_39:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_40;
  }
LABEL_20:
  uint64_t v9 = 2654435761 * self->_alsAutoBrightnessChangeCount;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_21:
    uint64_t v10 = 2654435761 * self->_alsBrightnessEnableCnt;
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v10 = 0;
LABEL_42:
  uint64_t v11 = [(NSMutableArray *)self->_backlightBuckets hash];
  $EC00CED6B89AAAA41342C8FA2F6D9061 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
    uint64_t v13 = 2654435761 * self->_totalDisplayPower;
    if ((*(_DWORD *)&v12 & 0x400000) != 0)
    {
LABEL_44:
      uint64_t v14 = 2654435761 * self->_totalBacklightPower;
      if ((*(_DWORD *)&v12 & 0x10000) != 0) {
        goto LABEL_45;
      }
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(_DWORD *)&v12 & 0x400000) != 0) {
      goto LABEL_44;
    }
  }
  uint64_t v14 = 0;
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
LABEL_45:
    uint64_t v15 = 2654435761 * self->_frameRateResidencyPercentage;
    if ((*(_DWORD *)&v12 & 0x200000) != 0) {
      goto LABEL_46;
    }
LABEL_51:
    uint64_t v16 = 0;
    if ((*(_DWORD *)&v12 & 0x100000) != 0) {
      goto LABEL_47;
    }
LABEL_52:
    uint64_t v17 = 0;
    return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v11;
  }
LABEL_50:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&v12 & 0x200000) == 0) {
    goto LABEL_51;
  }
LABEL_46:
  uint64_t v16 = 2654435761 * self->_residencyPercentage60Hz;
  if ((*(_DWORD *)&v12 & 0x100000) == 0) {
    goto LABEL_52;
  }
LABEL_47:
  uint64_t v17 = 2654435761 * self->_residencyPercentage30Hz;
  return v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = *((_DWORD *)a3 + 31);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)a3 + 31);
    if ((v5 & 0x4000) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((v5 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_dispOnCount = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_unpluggedDisplayOnDuration = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x80000) == 0)
  {
LABEL_5:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_pluggedDisplayOnDuration = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x40000) == 0)
  {
LABEL_6:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_mieDuration = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x20000) == 0)
  {
LABEL_7:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_mieCount = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x8000) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_displayIdlePercentage = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_alsAutoBrightnessCurveE1 = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_alsAutoBrightnessCurveL1 = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_alsAutoBrightnessCurveE2 = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_alsAutoBrightnessCurveL2 = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_alsAutoBrightnessCurveE0A = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_alsAutoBrightnessCurveL0A = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 8) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_alsAutoBrightnessCurveE0B = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x100) == 0)
  {
LABEL_16:
    if ((v5 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_alsAutoBrightnessCurveL0B = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x40) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_alsAutoBrightnessCurveEdynth = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_alsAutoBrightnessSlider = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 0x800) == 0)
  {
LABEL_19:
    if ((v5 & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_alsAutoBrightnessLux = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)a3 + 31);
  if ((v5 & 2) == 0)
  {
LABEL_20:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_54:
  self->_alsAutoBrightnessChangeCount = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 31) & 0x2000) != 0)
  {
LABEL_21:
    self->_alsBrightnessEnableCnt = *((_DWORD *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_22:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 9);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDPowerDisplayBacklightMetrics *)self addBacklightBucket:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  int v11 = *((_DWORD *)a3 + 31);
  if ((v11 & 0x800000) != 0)
  {
    self->_totalDisplayPower = *((_DWORD *)a3 + 29);
    *(_DWORD *)&self->_has |= 0x800000u;
    int v11 = *((_DWORD *)a3 + 31);
    if ((v11 & 0x400000) == 0)
    {
LABEL_31:
      if ((v11 & 0x10000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_58;
    }
  }
  else if ((v11 & 0x400000) == 0)
  {
    goto LABEL_31;
  }
  self->_totalBacklightPower = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v11 = *((_DWORD *)a3 + 31);
  if ((v11 & 0x10000) == 0)
  {
LABEL_32:
    if ((v11 & 0x200000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_frameRateResidencyPercentage = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v11 = *((_DWORD *)a3 + 31);
  if ((v11 & 0x200000) == 0)
  {
LABEL_33:
    if ((v11 & 0x100000) == 0) {
      return;
    }
    goto LABEL_34;
  }
LABEL_59:
  self->_residencyPercentage60Hz = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x200000u;
  if ((*((_DWORD *)a3 + 31) & 0x100000) == 0) {
    return;
  }
LABEL_34:
  self->_residencyPercentage30Hz = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x100000u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)dispOnCount
{
  return self->_dispOnCount;
}

- (unsigned)unpluggedDisplayOnDuration
{
  return self->_unpluggedDisplayOnDuration;
}

- (unsigned)pluggedDisplayOnDuration
{
  return self->_pluggedDisplayOnDuration;
}

- (unsigned)mieDuration
{
  return self->_mieDuration;
}

- (unsigned)mieCount
{
  return self->_mieCount;
}

- (unsigned)displayIdlePercentage
{
  return self->_displayIdlePercentage;
}

- (int)alsAutoBrightnessCurveE1
{
  return self->_alsAutoBrightnessCurveE1;
}

- (int)alsAutoBrightnessCurveL1
{
  return self->_alsAutoBrightnessCurveL1;
}

- (int)alsAutoBrightnessCurveE2
{
  return self->_alsAutoBrightnessCurveE2;
}

- (int)alsAutoBrightnessCurveL2
{
  return self->_alsAutoBrightnessCurveL2;
}

- (int)alsAutoBrightnessCurveE0A
{
  return self->_alsAutoBrightnessCurveE0A;
}

- (int)alsAutoBrightnessCurveL0A
{
  return self->_alsAutoBrightnessCurveL0A;
}

- (int)alsAutoBrightnessCurveE0B
{
  return self->_alsAutoBrightnessCurveE0B;
}

- (int)alsAutoBrightnessCurveL0B
{
  return self->_alsAutoBrightnessCurveL0B;
}

- (int)alsAutoBrightnessCurveEdynth
{
  return self->_alsAutoBrightnessCurveEdynth;
}

- (unsigned)alsAutoBrightnessSlider
{
  return self->_alsAutoBrightnessSlider;
}

- (unsigned)alsAutoBrightnessLux
{
  return self->_alsAutoBrightnessLux;
}

- (unsigned)alsAutoBrightnessChangeCount
{
  return self->_alsAutoBrightnessChangeCount;
}

- (unsigned)alsBrightnessEnableCnt
{
  return self->_alsBrightnessEnableCnt;
}

- (NSMutableArray)backlightBuckets
{
  return self->_backlightBuckets;
}

- (void)setBacklightBuckets:(id)a3
{
}

- (unsigned)totalDisplayPower
{
  return self->_totalDisplayPower;
}

- (unsigned)totalBacklightPower
{
  return self->_totalBacklightPower;
}

- (unsigned)frameRateResidencyPercentage
{
  return self->_frameRateResidencyPercentage;
}

- (unsigned)residencyPercentage60Hz
{
  return self->_residencyPercentage60Hz;
}

- (unsigned)residencyPercentage30Hz
{
  return self->_residencyPercentage30Hz;
}

@end