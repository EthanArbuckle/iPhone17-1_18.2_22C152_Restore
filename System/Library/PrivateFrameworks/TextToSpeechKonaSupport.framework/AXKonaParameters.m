@interface AXKonaParameters
- (id)copy;
- (int64_t)breathiness;
- (int64_t)headSize;
- (int64_t)pitchBase;
- (int64_t)pitchFluctuation;
- (int64_t)roughness;
- (int64_t)speed;
- (int64_t)vocalTract;
- (int64_t)volume;
- (void)setBreathiness:(int64_t)a3;
- (void)setHeadSize:(int64_t)a3;
- (void)setPitchBase:(int64_t)a3;
- (void)setPitchFluctuation:(int64_t)a3;
- (void)setRoughness:(int64_t)a3;
- (void)setSpeed:(int64_t)a3;
- (void)setVocalTract:(int64_t)a3;
- (void)setVolume:(int64_t)a3;
@end

@implementation AXKonaParameters

- (id)copy
{
  v3 = objc_alloc_init(AXKonaParameters);
  [(AXKonaParameters *)v3 setVocalTract:[(AXKonaParameters *)self vocalTract]];
  [(AXKonaParameters *)v3 setHeadSize:[(AXKonaParameters *)self headSize]];
  [(AXKonaParameters *)v3 setPitchBase:[(AXKonaParameters *)self pitchBase]];
  [(AXKonaParameters *)v3 setPitchFluctuation:[(AXKonaParameters *)self pitchFluctuation]];
  [(AXKonaParameters *)v3 setRoughness:[(AXKonaParameters *)self roughness]];
  [(AXKonaParameters *)v3 setBreathiness:[(AXKonaParameters *)self breathiness]];
  [(AXKonaParameters *)v3 setSpeed:[(AXKonaParameters *)self speed]];
  [(AXKonaParameters *)v3 setVolume:[(AXKonaParameters *)self volume]];
  return v3;
}

- (int64_t)vocalTract
{
  return self->_vocalTract;
}

- (void)setVocalTract:(int64_t)a3
{
  self->_vocalTract = a3;
}

- (int64_t)headSize
{
  return self->_headSize;
}

- (void)setHeadSize:(int64_t)a3
{
  self->_headSize = a3;
}

- (int64_t)pitchBase
{
  return self->_pitchBase;
}

- (void)setPitchBase:(int64_t)a3
{
  self->_pitchBase = a3;
}

- (int64_t)pitchFluctuation
{
  return self->_pitchFluctuation;
}

- (void)setPitchFluctuation:(int64_t)a3
{
  self->_pitchFluctuation = a3;
}

- (int64_t)roughness
{
  return self->_roughness;
}

- (void)setRoughness:(int64_t)a3
{
  self->_roughness = a3;
}

- (int64_t)breathiness
{
  return self->_breathiness;
}

- (void)setBreathiness:(int64_t)a3
{
  self->_breathiness = a3;
}

- (int64_t)speed
{
  return self->_speed;
}

- (void)setSpeed:(int64_t)a3
{
  self->_speed = a3;
}

- (int64_t)volume
{
  return self->_volume;
}

- (void)setVolume:(int64_t)a3
{
  self->_volume = a3;
}

@end