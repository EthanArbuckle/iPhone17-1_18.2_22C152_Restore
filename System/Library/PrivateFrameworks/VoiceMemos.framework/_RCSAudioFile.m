@interface _RCSAudioFile
- (AVAudioFormat)fileFormat;
- (AVAudioFormat)processingFormat;
- (NSDictionary)settings;
- (NSURL)url;
- (RCSSavedRecordingAccessToken)fileToken;
- (void)setFileToken:(id)a3;
@end

@implementation _RCSAudioFile

- (NSURL)url
{
  return [(RCSSavedRecordingAccessToken *)self->_fileToken compositionAVURL];
}

- (AVAudioFormat)fileFormat
{
  v2 = [(RCSSavedRecordingAccessToken *)self->_fileToken userInfo];
  v3 = [v2 objectForKeyedSubscript:@"fileFormat"];

  return (AVAudioFormat *)v3;
}

- (AVAudioFormat)processingFormat
{
  v2 = [(RCSSavedRecordingAccessToken *)self->_fileToken userInfo];
  v3 = [v2 objectForKeyedSubscript:@"processingFormat"];

  return (AVAudioFormat *)v3;
}

- (NSDictionary)settings
{
  v2 = [(RCSSavedRecordingAccessToken *)self->_fileToken userInfo];
  v3 = [v2 objectForKeyedSubscript:@"settings"];

  return (NSDictionary *)v3;
}

- (RCSSavedRecordingAccessToken)fileToken
{
  return self->_fileToken;
}

- (void)setFileToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end