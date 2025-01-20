@interface SiriTTSService_TTSAXResource
- (NSString)language;
- (NSString)name;
- (NSString)path;
- (void)setLanguage:(id)a3;
- (void)setName:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation SiriTTSService_TTSAXResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

@end