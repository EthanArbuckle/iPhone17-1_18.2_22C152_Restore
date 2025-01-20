@interface PKRemoteAlertPresentationTarget
+ (BOOL)supportsSecureCoding;
+ (id)createForSceneID:(id)a3 inProcess:(id)a4;
- (NSString)sceneID;
- (PKRemoteAlertPresentationTarget)init;
- (PKRemoteAlertPresentationTarget)initWithCoder:(id)a3;
- (RBSProcessHandle)process;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKRemoteAlertPresentationTarget

+ (id)createForSceneID:(id)a3 inProcess:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [PKRemoteAlertPresentationTarget alloc];
  id v9 = v7;
  id v10 = v6;
  v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v18.receiver = v8;
    v18.super_class = (Class)PKRemoteAlertPresentationTarget;
    v13 = objc_msgSendSuper2(&v18, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 1, a4);
      uint64_t v15 = [v9 copy];
      id v16 = v14[2];
      v14[2] = (id)v15;
    }
    v8 = v14;
    v12 = v8;
  }

  return v12;
}

- (PKRemoteAlertPresentationTarget)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteAlertPresentationTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKRemoteAlertPresentationTarget;
  v5 = [(PKRemoteAlertPresentationTarget *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"process"];
  process = v5->_process;
  v5->_process = (RBSProcessHandle *)v6;

  if (!v5->_process) {
    goto LABEL_5;
  }
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneID"];
  sceneID = v5->_sceneID;
  v5->_sceneID = (NSString *)v8;

  if (v5->_sceneID)
  {
LABEL_4:
    id v10 = v5;
  }
  else
  {
LABEL_5:
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKRemoteAlertPresentationTarget" code:0 userInfo:0];
    [v4 failWithError:v11];

    id v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  process = self->_process;
  id v5 = a3;
  [v5 encodeObject:process forKey:@"process"];
  [v5 encodeObject:self->_sceneID forKey:@"sceneID"];
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end