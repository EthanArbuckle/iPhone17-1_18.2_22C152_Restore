@interface RCSharedAudioFileInfo
- (NSDate)creationDate;
- (NSString)fileName;
- (NSURL)url;
- (RCSharedAudioFileInfo)initWithURL:(id)a3 fileName:(id)a4 creationDate:(id)a5;
- (void)setCreationDate:(id)a3;
- (void)setFileName:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation RCSharedAudioFileInfo

- (RCSharedAudioFileInfo)initWithURL:(id)a3 fileName:(id)a4 creationDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RCSharedAudioFileInfo;
  v12 = [(RCSharedAudioFileInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_fileName, a4);
    objc_storeStrong((id *)&v13->_creationDate, a5);
  }

  return v13;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_fileName, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end