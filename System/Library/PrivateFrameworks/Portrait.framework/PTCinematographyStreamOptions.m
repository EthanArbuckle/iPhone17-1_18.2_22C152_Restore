@interface PTCinematographyStreamOptions
- (BOOL)_overrideFrameSnapshotPolicy;
- (CGSize)fixedFocusNormalizedRectSize;
- (NSDictionary)cinematographyParameters;
- (PTCinematographyStreamOptions)init;
- (PTCinematographyStreamOptions)initWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)_snapshotPolicy;
- (unint64_t)version;
- (void)_setOverrideFrameSnapshotPolicy:(BOOL)a3;
- (void)_setSnapshotPolicy:(unint64_t)a3;
- (void)setCinematographyParameters:(id)a3;
- (void)setFixedFocusNormalizedRectSize:(CGSize)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PTCinematographyStreamOptions

- (PTCinematographyStreamOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PTCinematographyStreamOptions;
  result = [(PTCinematographyStreamOptions *)&v3 init];
  if (result)
  {
    result->_snapshotPolicy = 0;
    result->_overrideFrameSnapshotPolicy = 0;
  }
  return result;
}

- (PTCinematographyStreamOptions)initWithOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PTCinematographyStreamOptions;
  v5 = [(PTCinematographyStreamOptions *)&v12 init];
  if (v5)
  {
    v5->_version = [v4 version];
    [v4 fixedFocusNormalizedRectSize];
    v5->_fixedFocusNormalizedRectSize.width = v6;
    v5->_fixedFocusNormalizedRectSize.height = v7;
    v8 = [v4 cinematographyParameters];
    uint64_t v9 = [v8 copy];
    cinematographyParameters = v5->_cinematographyParameters;
    v5->_cinematographyParameters = (NSDictionary *)v9;

    v5->_snapshotPolicy = [v4 _snapshotPolicy];
    v5->_overrideFrameSnapshotPolicy = [v4 _overrideFrameSnapshotPolicy];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PTCinematographyStreamOptions alloc];

  return [(PTCinematographyStreamOptions *)v4 initWithOptions:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [PTCinematographyStreamOptions alloc];

  return [(PTCinematographyStreamOptions *)v4 initWithOptions:self];
}

- (unint64_t)_snapshotPolicy
{
  return self->_snapshotPolicy;
}

- (void)_setSnapshotPolicy:(unint64_t)a3
{
  self->_snapshotPolicy = a3;
}

- (BOOL)_overrideFrameSnapshotPolicy
{
  return self->_overrideFrameSnapshotPolicy;
}

- (void)_setOverrideFrameSnapshotPolicy:(BOOL)a3
{
  self->_overrideFrameSnapshotPolicy = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (CGSize)fixedFocusNormalizedRectSize
{
  objc_copyStruct(v4, &self->_fixedFocusNormalizedRectSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFixedFocusNormalizedRectSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_fixedFocusNormalizedRectSize, &v3, 16, 1, 0);
}

- (NSDictionary)cinematographyParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCinematographyParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end