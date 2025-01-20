@interface _SVXDeviceSetupFlowSceneMutation
- (_SVXDeviceSetupFlowSceneMutation)init;
- (_SVXDeviceSetupFlowSceneMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setDisplayKeyFrames:(id)a3;
- (void)setSceneID:(int64_t)a3;
@end

@implementation _SVXDeviceSetupFlowSceneMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayKeyFrames, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXDeviceSetupFlowScene alloc] initWithSceneID:self->_sceneID displayKeyFrames:self->_displayKeyFrames];
    goto LABEL_5;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXDeviceSetupFlowScene *)[(SVXDeviceSetupFlowScene *)baseModel copy];
LABEL_5:
    v5 = v4;
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    int64_t sceneID = self->_sceneID;
    if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    v7 = [(SVXDeviceSetupFlowScene *)self->_baseModel displayKeyFrames];
    goto LABEL_11;
  }
  int64_t sceneID = [(SVXDeviceSetupFlowScene *)baseModel sceneID];
  if ((*(unsigned char *)&self->_mutationFlags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  v7 = self->_displayKeyFrames;
LABEL_11:
  v8 = v7;
  v5 = [[SVXDeviceSetupFlowScene alloc] initWithSceneID:sceneID displayKeyFrames:v7];

LABEL_12:

  return v5;
}

- (void)setDisplayKeyFrames:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setSceneID:(int64_t)a3
{
  self->_int64_t sceneID = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXDeviceSetupFlowSceneMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupFlowSceneMutation;
  v6 = [(_SVXDeviceSetupFlowSceneMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXDeviceSetupFlowSceneMutation)init
{
  return [(_SVXDeviceSetupFlowSceneMutation *)self initWithBaseModel:0];
}

@end