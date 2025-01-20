@interface RKResponseFeatures
- (NSString)response;
- (RKResponseFeatures)initWithFeatures:(id)a3 count:(int)a4 numOfElapsedDays:(double)a5 sourceAppCount:(double)a6 sourceNotificationCount:(double)a7 inputSourceCannedCount:(double)a8 inputSourceScribbleCount:(double)a9 inputSourceDictationCount:(double)a10 responseLength:(unint64_t)a11 sameRecipientCount:(int)a12;
- (double)normalizedInputMethodCannedCount;
- (double)normalizedInputMethodDictationCount;
- (double)normalizedInputMethodScribbleCount;
- (double)normalizedSourceAppCount;
- (double)normalizedSourceNotificationCount;
- (double)numOfElapsedDays;
- (int)count;
- (int)sameRecipientCount;
- (unint64_t)responseLength;
@end

@implementation RKResponseFeatures

- (RKResponseFeatures)initWithFeatures:(id)a3 count:(int)a4 numOfElapsedDays:(double)a5 sourceAppCount:(double)a6 sourceNotificationCount:(double)a7 inputSourceCannedCount:(double)a8 inputSourceScribbleCount:(double)a9 inputSourceDictationCount:(double)a10 responseLength:(unint64_t)a11 sameRecipientCount:(int)a12
{
  id v23 = a3;
  v27.receiver = self;
  v27.super_class = (Class)RKResponseFeatures;
  v24 = [(RKResponseFeatures *)&v27 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_response, a3);
    v25->_numOfElapsedDays = a5;
    v25->_normalizedSourceAppCount = a6;
    v25->_normalizedSourceNotificationCount = a7;
    v25->_normalizedInputMethodCannedCount = a8;
    v25->_normalizedInputMethodScribbleCount = a9;
    v25->_normalizedInputMethodDictationCount = a10;
    v25->_responseLength = a11;
    v25->_count = a4;
    v25->_sameRecipientCount = a12;
  }

  return v25;
}

- (NSString)response
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int)count
{
  return self->_count;
}

- (double)numOfElapsedDays
{
  return self->_numOfElapsedDays;
}

- (double)normalizedSourceAppCount
{
  return self->_normalizedSourceAppCount;
}

- (double)normalizedSourceNotificationCount
{
  return self->_normalizedSourceNotificationCount;
}

- (double)normalizedInputMethodCannedCount
{
  return self->_normalizedInputMethodCannedCount;
}

- (double)normalizedInputMethodScribbleCount
{
  return self->_normalizedInputMethodScribbleCount;
}

- (double)normalizedInputMethodDictationCount
{
  return self->_normalizedInputMethodDictationCount;
}

- (unint64_t)responseLength
{
  return self->_responseLength;
}

- (int)sameRecipientCount
{
  return self->_sameRecipientCount;
}

- (void).cxx_destruct
{
}

@end