@interface SNLPSSUUserShortcut
- (NSString)identifier;
- (NSString)phrase;
- (SNLPSSUUserShortcut)initWithIdentifier:(id)a3 phrase:(id)a4;
@end

@implementation SNLPSSUUserShortcut

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)phrase
{
  return self->_phrase;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SNLPSSUUserShortcut)initWithIdentifier:(id)a3 phrase:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SNLPSSUUserShortcut;
  v8 = [(SNLPSSUUserShortcut *)&v13 init];
  identifier = v8->_identifier;
  v8->_identifier = v6;
  v10 = v6;

  phrase = v8->_phrase;
  v8->_phrase = v7;

  return v8;
}

@end