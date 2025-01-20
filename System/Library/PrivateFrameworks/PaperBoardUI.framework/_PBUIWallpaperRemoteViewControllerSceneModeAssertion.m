@interface _PBUIWallpaperRemoteViewControllerSceneModeAssertion
- (_PBUIWallpaperRemoteViewControllerSceneModeAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 sceneMode:(int64_t)a5 invalidationBlock:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)sceneMode;
@end

@implementation _PBUIWallpaperRemoteViewControllerSceneModeAssertion

- (_PBUIWallpaperRemoteViewControllerSceneModeAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 sceneMode:(int64_t)a5 invalidationBlock:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)_PBUIWallpaperRemoteViewControllerSceneModeAssertion;
  result = [(BSSimpleAssertion *)&v8 initWithIdentifier:a3 forReason:a4 invalidationBlock:a6];
  if (result) {
    result->_sceneMode = a5;
  }
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_PBUIWallpaperRemoteViewControllerSceneModeAssertion;
  v4 = [(BSSimpleAssertion *)&v9 descriptionBuilderWithMultilinePrefix:a3];
  v5 = v4;
  unint64_t sceneMode = self->_sceneMode;
  if (sceneMode > 3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (uint64_t)*(&off_1E62B3848 + sceneMode);
  }
  [v4 appendString:v7 withName:@"sceneMode"];
  return v5;
}

- (int64_t)sceneMode
{
  return self->_sceneMode;
}

@end