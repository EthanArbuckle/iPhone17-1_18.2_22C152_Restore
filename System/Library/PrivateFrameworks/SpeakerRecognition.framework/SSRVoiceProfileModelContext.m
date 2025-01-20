@interface SSRVoiceProfileModelContext
- (NSDictionary)compareModelFilePaths;
- (NSURL)configFilePath;
- (NSURL)secureProfileModelFilePath;
- (NSURL)voiceProfileModelFilePath;
- (SSRVoiceProfileModelContext)initWithConfigFilePath:(id)a3 withModelPath:(id)a4 withCompareModelFilePaths:(id)a5;
- (SSRVoiceProfileModelContext)initWithConfigFilePath:(id)a3 withModelPath:(id)a4 withModelPathExclave:(id)a5 withCompareModelFilePaths:(id)a6;
@end

@implementation SSRVoiceProfileModelContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compareModelFilePaths, 0);
  objc_storeStrong((id *)&self->_secureProfileModelFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfileModelFilePath, 0);

  objc_storeStrong((id *)&self->_configFilePath, 0);
}

- (NSDictionary)compareModelFilePaths
{
  return self->_compareModelFilePaths;
}

- (NSURL)secureProfileModelFilePath
{
  return self->_secureProfileModelFilePath;
}

- (NSURL)voiceProfileModelFilePath
{
  return self->_voiceProfileModelFilePath;
}

- (NSURL)configFilePath
{
  return self->_configFilePath;
}

- (SSRVoiceProfileModelContext)initWithConfigFilePath:(id)a3 withModelPath:(id)a4 withModelPathExclave:(id)a5 withCompareModelFilePaths:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SSRVoiceProfileModelContext;
  v15 = [(SSRVoiceProfileModelContext *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configFilePath, a3);
    objc_storeStrong((id *)&v16->_compareModelFilePaths, a6);
    objc_storeStrong((id *)&v16->_voiceProfileModelFilePath, a4);
    objc_storeStrong((id *)&v16->_secureProfileModelFilePath, a5);
  }

  return v16;
}

- (SSRVoiceProfileModelContext)initWithConfigFilePath:(id)a3 withModelPath:(id)a4 withCompareModelFilePaths:(id)a5
{
  return [(SSRVoiceProfileModelContext *)self initWithConfigFilePath:a3 withModelPath:a4 withModelPathExclave:0 withCompareModelFilePaths:a5];
}

@end