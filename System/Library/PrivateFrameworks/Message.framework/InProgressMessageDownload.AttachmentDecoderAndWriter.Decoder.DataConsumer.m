@interface InProgressMessageDownload.AttachmentDecoderAndWriter.Decoder.DataConsumer
- (_TtCCCC7Message25InProgressMessageDownload26AttachmentDecoderAndWriter7DecoderP33_E488F2EBCE7947B89745EE1E7B527BA212DataConsumer)init;
- (int64_t)appendData:(id)a3;
- (void)done;
@end

@implementation InProgressMessageDownload.AttachmentDecoderAndWriter.Decoder.DataConsumer

- (int64_t)appendData:(id)a3
{
  id v3 = a3;
  v4 = self;
  if (a3)
  {
    uint64_t v8 = sub_1A8A74A68();
    unint64_t v9 = v5;

    uint64_t v10 = v8;
    unint64_t v11 = v9;
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  int64_t v7 = sub_1A815AFD0(v10, v11);
  sub_1A811B760(v10, v11);

  return v7;
}

- (void)done
{
  v2 = self;
  sub_1A815B220();
}

- (_TtCCCC7Message25InProgressMessageDownload26AttachmentDecoderAndWriter7DecoderP33_E488F2EBCE7947B89745EE1E7B527BA212DataConsumer)init
{
  return (_TtCCCC7Message25InProgressMessageDownload26AttachmentDecoderAndWriter7DecoderP33_E488F2EBCE7947B89745EE1E7B527BA212DataConsumer *)sub_1A815B31C();
}

- (void).cxx_destruct
{
}

@end