@interface VDDisambiguationAddressBookContext
- (BOOL)resultFound;
- (NSString)matchedName;
- (NSString)previousName;
- (VSRecognitionResult)result;
- (int)previousNameProperty;
- (void)setMatchedName:(id)a3;
- (void)setPreviousName:(id)a3;
- (void)setPreviousNameProperty:(int)a3;
- (void)setResult:(id)a3;
- (void)setResultFound:(BOOL)a3;
@end

@implementation VDDisambiguationAddressBookContext

- (int)previousNameProperty
{
  return self->_previousNameProperty;
}

- (void)setPreviousNameProperty:(int)a3
{
  self->_previousNameProperty = a3;
}

- (NSString)previousName
{
  return self->_previousName;
}

- (void)setPreviousName:(id)a3
{
}

- (NSString)matchedName
{
  return self->_matchedName;
}

- (void)setMatchedName:(id)a3
{
}

- (VSRecognitionResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
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
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_matchedName, 0);

  objc_storeStrong((id *)&self->_previousName, 0);
}

@end