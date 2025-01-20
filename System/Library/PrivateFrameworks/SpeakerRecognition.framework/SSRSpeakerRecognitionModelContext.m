@interface SSRSpeakerRecognitionModelContext
- (NSDictionary)voiceProfilesModelFilePaths;
- (NSDictionary)voiceProfilesModelFilePathsExclave;
- (NSURL)configFilePath;
- (SSRSpeakerRecognitionModelContext)initWithConfigFilePath:(id)a3 withModelFilePaths:(id)a4;
- (SSRSpeakerRecognitionModelContext)initWithConfigFilePath:(id)a3 withModelFilePaths:(id)a4 withModelFilePathsExclave:(id)a5;
@end

@implementation SSRSpeakerRecognitionModelContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfilesModelFilePathsExclave, 0);
  objc_storeStrong((id *)&self->_voiceProfilesModelFilePaths, 0);

  objc_storeStrong((id *)&self->_configFilePath, 0);
}

- (NSDictionary)voiceProfilesModelFilePathsExclave
{
  return self->_voiceProfilesModelFilePathsExclave;
}

- (NSDictionary)voiceProfilesModelFilePaths
{
  return self->_voiceProfilesModelFilePaths;
}

- (NSURL)configFilePath
{
  return self->_configFilePath;
}

- (SSRSpeakerRecognitionModelContext)initWithConfigFilePath:(id)a3 withModelFilePaths:(id)a4
{
  return [(SSRSpeakerRecognitionModelContext *)self initWithConfigFilePath:a3 withModelFilePaths:a4 withModelFilePathsExclave:0];
}

- (SSRSpeakerRecognitionModelContext)initWithConfigFilePath:(id)a3 withModelFilePaths:(id)a4 withModelFilePathsExclave:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SSRSpeakerRecognitionModelContext;
  v12 = [(SSRSpeakerRecognitionModelContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configFilePath, a3);
    objc_storeStrong((id *)&v13->_voiceProfilesModelFilePaths, a4);
    objc_storeStrong((id *)&v13->_voiceProfilesModelFilePathsExclave, a5);
  }

  return v13;
}

@end