@interface NanoPhoneVoicemailMeta(Wrapper)
- (id)dictionaryRepresentation;
- (void)writeVoicemailBody;
@end

@implementation NanoPhoneVoicemailMeta(Wrapper)

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithLongLong:self->_voicemailNumber];
  [v3 setObject:v4 forKey:@"voicemailNumber"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v18 = [NSNumber numberWithLongLong:self->_identifier];
    [v3 setObject:v18 forKey:@"identifier"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v19 = [NSNumber numberWithLongLong:self->_remoteUID];
  [v3 setObject:v19 forKey:@"remoteUID"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v6 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v6 forKey:@"date"];
  }
LABEL_5:
  sender = self->_sender;
  if (sender) {
    [v3 setObject:sender forKey:@"sender"];
  }
  callbackNumber = self->_callbackNumber;
  if (callbackNumber) {
    [v3 setObject:callbackNumber forKey:@"callbackNumber"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_duration];
    [v3 setObject:v9 forKey:@"duration"];
  }
  dataPath = self->_dataPath;
  if (dataPath) {
    [v3 setObject:dataPath forKey:@"dataPath"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v11 = [NSNumber numberWithInt:self->_flags];
    [v3 setObject:v11 forKey:@"flags"];
  }
  if (self->_voicemailBody) {
    [v3 setObject:@"YES" forKey:@"voicemailBody"];
  }
  v12 = [(NanoPhoneVoicemailTranscript *)self->_voicemailTranscript transcriptionString];

  if (v12)
  {
    v13 = NSNumber;
    v14 = [(NanoPhoneVoicemailTranscript *)self->_voicemailTranscript transcriptionString];
    v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    [v3 setObject:v15 forKey:@"voicemailTranscriptString.length"];
  }
  receiverDestinationID = self->_receiverDestinationID;
  if (receiverDestinationID) {
    [v3 setObject:receiverDestinationID forKey:@"receiverDestinationID"];
  }
  return v3;
}

+ (void)xpcObjectAsArray:()Wrapper .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_234652000, v0, v1, "%s - Error preparing NSKeyedUnarchiver: %@", v2, v3, v4, v5, 2u);
}

- (void)writeVoicemailBody
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_234652000, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

@end