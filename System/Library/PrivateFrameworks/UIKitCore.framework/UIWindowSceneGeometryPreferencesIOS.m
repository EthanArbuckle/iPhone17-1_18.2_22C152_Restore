@interface UIWindowSceneGeometryPreferencesIOS
- (BOOL)isEqual:(id)a3;
- (UIInterfaceOrientationMask)interfaceOrientations;
- (UIWindowSceneGeometryPreferencesIOS)init;
- (UIWindowSceneGeometryPreferencesIOS)initWithInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientations;
- (int64_t)_type;
- (unint64_t)hash;
- (void)setInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientations;
@end

@implementation UIWindowSceneGeometryPreferencesIOS

- (UIWindowSceneGeometryPreferencesIOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIWindowSceneGeometryPreferencesIOS;
  result = [(UIWindowSceneGeometryPreferences *)&v3 _init];
  if (result) {
    result->_interfaceOrientations = 0;
  }
  return result;
}

- (UIWindowSceneGeometryPreferencesIOS)initWithInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientations
{
  result = [(UIWindowSceneGeometryPreferencesIOS *)self init];
  if (result) {
    result->_interfaceOrientations = interfaceOrientations;
  }
  return result;
}

- (int64_t)_type
{
  return 2;
}

- (unint64_t)hash
{
  return self->_interfaceOrientations;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIWindowSceneGeometryPreferencesIOS;
  if ([(UIWindowSceneGeometryPreferences *)&v7 isEqual:v4]) {
    BOOL v5 = [v4 interfaceOrientations] == self->_interfaceOrientations;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (UIInterfaceOrientationMask)interfaceOrientations
{
  return self->_interfaceOrientations;
}

- (void)setInterfaceOrientations:(UIInterfaceOrientationMask)interfaceOrientations
{
  self->_interfaceOrientations = interfaceOrientations;
}

@end