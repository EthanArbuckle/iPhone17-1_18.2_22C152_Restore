@interface SVXDeviceSetupFlowScene
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)displayKeyFrames;
- (SVXDeviceSetupFlowScene)initWithCoder:(id)a3;
- (SVXDeviceSetupFlowScene)initWithSceneID:(int64_t)a3 displayKeyFrames:(id)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)sceneID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXDeviceSetupFlowScene

- (void).cxx_destruct
{
}

- (NSArray)displayKeyFrames
{
  return self->_displayKeyFrames;
}

- (int64_t)sceneID
{
  return self->_sceneID;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t sceneID = self->_sceneID;
  id v7 = a3;
  v6 = [v4 numberWithInteger:sceneID];
  [v7 encodeObject:v6 forKey:@"SVXDeviceSetupFlowScene::sceneID"];

  [v7 encodeObject:self->_displayKeyFrames forKey:@"SVXDeviceSetupFlowScene::displayKeyFrames"];
}

- (SVXDeviceSetupFlowScene)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupFlowScene::sceneID"];
  uint64_t v6 = [v5 integerValue];

  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SVXDeviceSetupFlowScene::displayKeyFrames"];

  v11 = [(SVXDeviceSetupFlowScene *)self initWithSceneID:v6 displayKeyFrames:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXDeviceSetupFlowScene *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t sceneID = self->_sceneID;
      if (sceneID == [(SVXDeviceSetupFlowScene *)v5 sceneID])
      {
        id v7 = [(SVXDeviceSetupFlowScene *)v5 displayKeyFrames];
        displayKeyFrames = self->_displayKeyFrames;
        BOOL v9 = displayKeyFrames == v7 || [(NSArray *)displayKeyFrames isEqual:v7];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_sceneID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSArray *)self->_displayKeyFrames hash] ^ v4;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)SVXDeviceSetupFlowScene;
  unint64_t v5 = [(SVXDeviceSetupFlowScene *)&v11 description];
  unint64_t sceneID = self->_sceneID;
  if (sceneID > 9) {
    id v7 = @"(unknown)";
  }
  else {
    id v7 = off_2645542A8[sceneID];
  }
  uint64_t v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t sceneID = %@, displayKeyFrames = %@}", v5, v8, self->_displayKeyFrames];

  return v9;
}

- (id)description
{
  return [(SVXDeviceSetupFlowScene *)self _descriptionWithIndent:0];
}

- (SVXDeviceSetupFlowScene)initWithSceneID:(int64_t)a3 displayKeyFrames:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXDeviceSetupFlowScene;
  id v7 = [(SVXDeviceSetupFlowScene *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_unint64_t sceneID = a3;
    uint64_t v9 = [v6 copy];
    displayKeyFrames = v8->_displayKeyFrames;
    v8->_displayKeyFrames = (NSArray *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXDeviceSetupFlowSceneMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_SVXDeviceSetupFlowSceneMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_SVXDeviceSetupFlowSceneMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(SVXDeviceSetupFlowScene *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXDeviceSetupFlowSceneMutation *))a3;
  id v4 = objc_alloc_init(_SVXDeviceSetupFlowSceneMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  unint64_t v5 = [(_SVXDeviceSetupFlowSceneMutation *)v4 generate];

  return v5;
}

@end