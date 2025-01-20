@interface SBFloatyFolderControllerConfiguration
- (SBFloatyFolderControllerConfiguration)initWithConfiguration:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (unint64_t)backgroundEffect;
- (void)setBackgroundEffect:(unint64_t)a3;
@end

@implementation SBFloatyFolderControllerConfiguration

- (SBFloatyFolderControllerConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFloatyFolderControllerConfiguration;
  v5 = [(SBFolderControllerConfiguration *)&v9 initWithConfiguration:v4];
  if (v5)
  {
    v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      v5->_backgroundEffect = [v4 backgroundEffect];
    }
  }

  return v5;
}

- (unint64_t)backgroundEffect
{
  return self->_backgroundEffect;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFloatyFolderControllerConfiguration;
  id v4 = [(SBFolderControllerConfiguration *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFloatyFolderControllerConfiguration backgroundEffect](self, "backgroundEffect"), @"backgroundEffect");
  return v4;
}

- (void)setBackgroundEffect:(unint64_t)a3
{
  self->_backgroundEffect = a3;
}

@end