@interface RDSpeechDonation
+ (id)convertRawAudiotoPCM:(const signed __int16 *)a3 count:(unsigned int)a4;
- (NSArray)audioBuffers;
- (NSDate)recordingStartDate;
- (NSLocale)locale;
- (NSMutableArray)audioPCMBuffers;
- (NSString)donorBundleID;
- (NSString)donorReferenceID;
- (NSString)taskHint;
- (NSString)transcription;
- (RDSpeechDonation)initWithBundleID:(id)a3 donorReferenceID:(id)a4 locale:(id)a5 taskHint:(id)a6;
- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)_speechDonation;
- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4;
- (void)donateAudioFor:(id)a3 logAudioFile:(BOOL)a4;
- (void)setAudioBuffers:(id)a3;
- (void)setAudioPCMBuffers:(id)a3;
- (void)setDonorBundleID:(id)a3;
- (void)setDonorReferenceID:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRecordingStartDate:(id)a3;
- (void)setTaskHint:(id)a3;
- (void)setTranscription:(id)a3;
- (void)set_speechDonation:(id)a3;
@end

@implementation RDSpeechDonation

- (RDSpeechDonation)initWithBundleID:(id)a3 donorReferenceID:(id)a4 locale:(id)a5 taskHint:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RDSpeechDonation;
  v14 = [(RDSpeechDonation *)&v19 init];
  v15 = v14;
  if (v14)
  {
    [(RDSpeechDonation *)v14 setDonorBundleID:v10];
    [(RDSpeechDonation *)v15 setDonorReferenceID:v11];
    [(RDSpeechDonation *)v15 setLocale:v12];
    v16 = +[NSDate date];
    [(RDSpeechDonation *)v15 setRecordingStartDate:v16];

    [(RDSpeechDonation *)v15 setTaskHint:v13];
    id v17 = objc_alloc_init((Class)NSMutableArray);
    [(RDSpeechDonation *)v15 setAudioPCMBuffers:v17];
  }
  return v15;
}

- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  id v7 = [(RDSpeechDonation *)self audioPCMBuffers];
  v6 = +[RDSpeechDonation convertRawAudiotoPCM:a3 count:a4];
  [v7 addObject:v6];
}

- (void)donateAudioFor:(id)a3 logAudioFile:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation alloc];
  v8 = [(RDSpeechDonation *)self donorBundleID];
  v9 = [(RDSpeechDonation *)self donorReferenceID];
  id v10 = [(RDSpeechDonation *)self recordingStartDate];
  id v11 = [(RDSpeechDonation *)self locale];
  id v12 = [(RDSpeechDonation *)self taskHint];
  id v13 = [(RDSwiftSpeechDonation *)v7 initWithDonorBundleID:v8 donorReferenceID:v9 recordingDate:v10 locale:v11 taskHint:v12 transcription:v6];

  [(RDSpeechDonation *)self set_speechDonation:v13];
  id v14 = [(RDSpeechDonation *)self _speechDonation];
  [v14 donateWithAudioBuffers:self->_audioPCMBuffers logAudioFile:v4];
}

+ (id)convertRawAudiotoPCM:(const signed __int16 *)a3 count:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  long long v10 = xmmword_1000CB050;
  long long v11 = unk_1000CB060;
  uint64_t v12 = 16;
  id v6 = [objc_alloc((Class)AVAudioFormat) initWithStreamDescription:&v10];
  id v7 = objc_alloc((Class)AVAudioPCMBuffer);
  id v8 = objc_msgSend(v7, "initWithPCMFormat:frameCapacity:", v6, v4, v10, v11, v12);
  memcpy(*(void **)[v8 int16ChannelData], a3, 2 * v4);
  [v8 setFrameLength:v4];

  return v8;
}

- (_TtC50com_apple_SpeechRecognitionCore_speechrecognitiond21RDSwiftSpeechDonation)_speechDonation
{
  return self->__speechDonation;
}

- (void)set_speechDonation:(id)a3
{
}

- (NSString)donorBundleID
{
  return self->_donorBundleID;
}

- (void)setDonorBundleID:(id)a3
{
}

- (NSString)donorReferenceID
{
  return self->_donorReferenceID;
}

- (void)setDonorReferenceID:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSArray)audioBuffers
{
  return self->_audioBuffers;
}

- (void)setAudioBuffers:(id)a3
{
}

- (NSDate)recordingStartDate
{
  return self->_recordingStartDate;
}

- (void)setRecordingStartDate:(id)a3
{
}

- (NSString)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(id)a3
{
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
}

- (NSMutableArray)audioPCMBuffers
{
  return self->_audioPCMBuffers;
}

- (void)setAudioPCMBuffers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPCMBuffers, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_taskHint, 0);
  objc_storeStrong((id *)&self->_recordingStartDate, 0);
  objc_storeStrong((id *)&self->_audioBuffers, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_donorReferenceID, 0);
  objc_storeStrong((id *)&self->_donorBundleID, 0);
  objc_storeStrong((id *)&self->__speechDonation, 0);
}

@end