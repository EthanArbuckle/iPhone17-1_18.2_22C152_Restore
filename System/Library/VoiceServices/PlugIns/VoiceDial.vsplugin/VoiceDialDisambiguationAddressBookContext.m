@interface VoiceDialDisambiguationAddressBookContext
- (BOOL)resultFound;
- (NSString)matchedName;
- (NSString)previousName;
- (id)result;
- (int)previousNameProperty;
- (void)setMatchedName:(id)a3;
- (void)setPreviousName:(id)a3;
- (void)setPreviousNameProperty:(int)a3;
- (void)setResult:(id *)a3;
- (void)setResultFound:(BOOL)a3;
@end

@implementation VoiceDialDisambiguationAddressBookContext

- (NSString)previousName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreviousName:(id)a3
{
}

- (int)previousNameProperty
{
  return self->_previousNameProperty;
}

- (void)setPreviousNameProperty:(int)a3
{
  self->_previousNameProperty = a3;
}

- (NSString)matchedName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMatchedName:(id)a3
{
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id *)a3
{
  self->_result = a3;
}

- (BOOL)resultFound
{
  return self->_resultFound;
}

- (void)setResultFound:(BOOL)a3
{
  self->_resultFound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedName, 0);

  objc_storeStrong((id *)&self->_previousName, 0);
}

@end