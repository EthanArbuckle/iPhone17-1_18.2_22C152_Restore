@interface _MLNetworkHeaderEncoding
+ (BOOL)isHeaderAcknowledgeFailData:(unint64_t)a3;
+ (BOOL)isHeaderAcknowledgeSucessData:(unint64_t)a3;
+ (BOOL)isHeaderCustom:(unint64_t)a3;
+ (BOOL)isHeaderError:(unint64_t)a3;
+ (BOOL)isHeaderIncomingData:(unint64_t)a3;
+ (BOOL)isHeaderLoad:(unint64_t)a3;
+ (BOOL)isHeaderPredictFeature:(unint64_t)a3;
+ (BOOL)isHeaderText:(unint64_t)a3;
+ (BOOL)isHeaderUnLoad:(unint64_t)a3;
+ (id)acknowledgeFailData;
+ (id)acknowledgeSucessData;
+ (id)constructDataPacket:(id)a3 HeaderEncoding:(unint64_t)a4;
+ (id)custom:(id)a3;
+ (id)loadModel:(id)a3;
+ (id)predictFeature:(id)a3;
+ (id)textDebug:(id)a3;
+ (id)unLoadModel:(id)a3;
+ (unint64_t)getHeaderDataSize:(id)a3;
+ (unint64_t)getHeaderEncoding:(id)a3;
+ (unint64_t)getHeaderSize;
+ (void)getHeaderDataStart:(id)a3;
+ (void)getHeaderEnd:(id)a3;
@end

@implementation _MLNetworkHeaderEncoding

+ (id)constructDataPacket:(id)a3 HeaderEncoding:(unint64_t)a4
{
  unint64_t v10 = a4;
  id v4 = a3;
  uint64_t v9 = [v4 length];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&v10 length:8];
  [v5 appendBytes:&v9 length:8];
  id v6 = v4;
  uint64_t v7 = [v6 bytes];

  [v5 appendBytes:v7 length:v9];
  return v5;
}

+ (id)textDebug:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:a3 HeaderEncoding:kMLTextNetworkHeaderEncoding];
}

+ (id)loadModel:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:a3 HeaderEncoding:kMLLoadNetworkHeaderEncoding];
}

+ (id)unLoadModel:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:a3 HeaderEncoding:kMLUnLoadNetworkHeaderEncoding];
}

+ (id)predictFeature:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:a3 HeaderEncoding:kMLPredictNetworkHeaderEncoding];
}

+ (id)custom:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:a3 HeaderEncoding:kMLCustomNetworkHeaderEncoding];
}

+ (id)acknowledgeSucessData
{
  id v2 = objc_alloc(MEMORY[0x263EFF8F8]);
  v3 = [@"SUCCESS" dataUsingEncoding:4];
  id v4 = (void *)[v2 initWithData:v3];

  v5 = +[_MLNetworkHeaderEncoding constructDataPacket:v4 HeaderEncoding:kMLAckSuccessNetworkHeaderEncoding];

  return v5;
}

+ (id)acknowledgeFailData
{
  id v2 = objc_alloc(MEMORY[0x263EFF8F8]);
  v3 = [@"FAIL" dataUsingEncoding:4];
  id v4 = (void *)[v2 initWithData:v3];

  v5 = +[_MLNetworkHeaderEncoding constructDataPacket:v4 HeaderEncoding:kMLAckFailNetworkHeaderEncoding];

  return v5;
}

+ (unint64_t)getHeaderEncoding:(id)a3
{
  id v3 = a3;
  if (![v3 bytes]
    || ((id v4 = (unint64_t *)[v3 bytes],
         unint64_t v5 = *v4,
         *v4 >= kMLTextNetworkHeaderEncoding)
      ? (BOOL v6 = v5 > kMLIncomingDataNetworkHeaderEncoding)
      : (BOOL v6 = 1),
        v6))
  {
    unint64_t v5 = kMLErrorNetworkHeaderEncoding;
  }

  return v5;
}

+ (unint64_t)getHeaderSize
{
  return 16;
}

+ (unint64_t)getHeaderDataSize:(id)a3
{
  id v3 = a3;
  if ([v3 bytes]) {
    unint64_t v4 = *(void *)([v3 bytes] + 8);
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (void)getHeaderDataStart:(id)a3
{
  id v3 = a3;
  if ([v3 bytes]) {
    unint64_t v4 = (void *)([v3 bytes] + 16);
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (void)getHeaderEnd:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[_MLNetworkHeaderEncoding getHeaderDataSize:v3];
  id v5 = v3;
  if ([v5 bytes]) {
    BOOL v6 = (void *)([v5 bytes] + v4 + 16);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isHeaderText:(unint64_t)a3
{
  return kMLTextNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderLoad:(unint64_t)a3
{
  return kMLLoadNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderUnLoad:(unint64_t)a3
{
  return kMLUnLoadNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderPredictFeature:(unint64_t)a3
{
  return kMLPredictNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderCustom:(unint64_t)a3
{
  return kMLCustomNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderAcknowledgeSucessData:(unint64_t)a3
{
  return kMLAckSuccessNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderAcknowledgeFailData:(unint64_t)a3
{
  return kMLAckFailNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderIncomingData:(unint64_t)a3
{
  return kMLIncomingDataNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderError:(unint64_t)a3
{
  return kMLErrorNetworkHeaderEncoding == a3;
}

@end