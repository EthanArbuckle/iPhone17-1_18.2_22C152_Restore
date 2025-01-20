@interface VKRecognizedText
- (BOOL)shouldAssociateWithItem:(id)a3;
- (NSString)transcript;
- (VKRecognizedText)initWithFrameInfo:(id)a3 textBlockObservation:(id)a4;
- (VNRecognizedTextObservation)observation;
- (id)description;
- (void)associateWithItem:(id)a3;
@end

@implementation VKRecognizedText

- (VKRecognizedText)initWithFrameInfo:(id)a3 textBlockObservation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 getCROutputRegion];
  v15.receiver = self;
  v15.super_class = (Class)VKRecognizedText;
  v9 = -[VKRecognizedItem initWithFrameInfo:rectangleObservation:layoutDirection:](&v15, sel_initWithFrameInfo_rectangleObservation_layoutDirection_, v7, v6, [v8 layoutDirection]);

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    transcripts = v9->_transcripts;
    v9->_transcripts = (NSMutableDictionary *)v10;

    v12 = v9->_transcripts;
    v13 = [v6 getTranscript];
    [(NSMutableDictionary *)v12 setObject:&unk_1F357DC20 forKeyedSubscript:v13];
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VKRecognizedText;
  v4 = [(VKRecognizedText *)&v8 description];
  v5 = [(VKRecognizedText *)self transcript];
  id v6 = [v3 stringWithFormat:@"%@ transcript:%@", v4, v5];

  return v6;
}

- (BOOL)shouldAssociateWithItem:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKRecognizedText;
  if ([(VKRecognizedItem *)&v14 shouldAssociateWithItem:v4])
  {
    uint64_t v5 = objc_opt_class();
    id v6 = VKDynamicCast(v5, (uint64_t)v4);
    id v7 = [v6 transcript];
    int64_t v8 = vcvtpd_s64_f64((double)(unint64_t)[v7 length] * 0.1);
    v9 = [(VKRecognizedText *)self transcript];
    uint64_t v10 = [v7 editDistanceFromString:v9 threshold:v8];

    BOOL v12 = v10 != 0x7FFFFFFF && v10 < v8;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)associateWithItem:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VKRecognizedText;
  id v4 = a3;
  [(VKRecognizedItem *)&v12 associateWithItem:v4];
  uint64_t v5 = objc_opt_class();
  id v6 = VKCheckedDynamicCast(v5, (uint64_t)v4);

  id v7 = objc_msgSend(v6, "transcript", v12.receiver, v12.super_class);
  int64_t v8 = [(NSMutableDictionary *)self->_transcripts objectForKeyedSubscript:v7];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 integerValue];
    v11 = [NSNumber numberWithInteger:v10 + 1];
    [(NSMutableDictionary *)self->_transcripts setObject:v11 forKeyedSubscript:v7];
  }
  else
  {
    [(NSMutableDictionary *)self->_transcripts setObject:&unk_1F357DC20 forKeyedSubscript:v7];
  }
}

- (VNRecognizedTextObservation)observation
{
  uint64_t v3 = objc_opt_class();
  v7.receiver = self;
  v7.super_class = (Class)VKRecognizedText;
  id v4 = [(VKRecognizedItem *)&v7 observation];
  uint64_t v5 = VKDynamicCast(v3, (uint64_t)v4);

  return (VNRecognizedTextObservation *)v5;
}

- (NSString)transcript
{
  v2 = [(NSMutableDictionary *)self->_transcripts keysSortedByValueUsingComparator:&__block_literal_global_32];
  uint64_t v3 = [v2 lastObject];

  return (NSString *)v3;
}

uint64_t __30__VKRecognizedText_transcript__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void).cxx_destruct
{
}

@end