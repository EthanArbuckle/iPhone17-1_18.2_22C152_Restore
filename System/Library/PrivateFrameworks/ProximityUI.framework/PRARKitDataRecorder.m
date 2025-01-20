@interface PRARKitDataRecorder
- (ARSession)session;
- (NSString)filename;
- (NSURL)fileURL;
- (PRARKitDataRecorder)initWithARSession:(id)a3;
- (id)stopAndSave;
- (void)setFileURL:(id)a3;
- (void)setFilename:(id)a3;
- (void)setSession:(id)a3;
- (void)start;
@end

@implementation PRARKitDataRecorder

- (PRARKitDataRecorder)initWithARSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRARKitDataRecorder;
  v5 = [(PRDataRecorder *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PRARKitDataRecorder *)v5 setSession:v4];
  }

  return v6;
}

- (void)start
{
  [(PRARKitDataRecorder *)self stopAndDiscard];
  v3 = +[PRDataRecorder generateFilename];
  [(PRARKitDataRecorder *)self setFilename:v3];

  id v4 = +[PRDataRecorder generateTemporaryDirectoryURL];
  [(PRARKitDataRecorder *)self setFileURL:v4];
}

- (id)stopAndSave
{
  v3 = NSString;
  id v4 = [(PRARKitDataRecorder *)self filename];
  v5 = [v3 stringWithFormat:@"%@.json", v4];

  v6 = [(PRARKitDataRecorder *)self fileURL];
  v7 = [v6 URLByAppendingPathComponent:v5];

  [(PRDataRecorder *)self writeSensorDataToURL:v7];
  objc_super v8 = [(PRARKitDataRecorder *)self fileURL];
  v9 = [(PRARKitDataRecorder *)self filename];
  v10 = [v8 URLByAppendingPathComponent:v9];

  return v10;
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end